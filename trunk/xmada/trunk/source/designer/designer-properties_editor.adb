------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006
--!
--! XmAda is free software; you can redistribute it and/or modify it under
--! the terms of the GNU General Public License as published by the Free
--! Software Foundation; either version 2, or (at your option) any later
--! version.
--!
--! XmAda is distributed in the hope that it will be useful, but WITHOUT ANY
--! WARRANTY; without even the implied warranty of MERCHANTABILITY or
--! FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
--! for more details.
--!
--! You should have received a copy of the GNU General Public License
--! along with XmAda; see the file COPYING. If not, write to the Free
--! Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
--! USA.
--!
--! As a special exception, if other files instantiate generics from this
--! unit, or you link this unit with other files to produce an executable,
--! this unit does not by itself cause the resulting executable to be
--! covered by the GNU General Public License. This exception does not
--! however invalidate any other reasons why the executable file might be
--! covered by the GNU Public License.
--!
--! <Unit> Designer.Properties_Editor
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Unchecked_Deallocation;
with GNAT.Table;

with Xt.Ancillary_Types;
with Xt.Instance_Management;
with Xm.Resource_Management;
with Xm.Strings;
with Xm_Notebook;
with Xm_Push_Button_Gadget;
with Xm_Row_Column;
with Xm_String_Defs;

with Designer.Properties_Editor.Component_Class;
with Designer.Properties_Editor.Widget_Instance;
with Model.Allocations;
with Model.Queries;
with Model.Tree;
with Model.Tree.Lists;

package body Designer.Properties_Editor is

   use Model;
   use Model.Queries;
   use Model.Tree;
   use Model.Tree.Lists;
   use Xm;
   use Xm.Resource_Management;
   use Xm.Strings;
   use Xm_Notebook;
   use Xm_Push_Button_Gadget;
   use Xm_Row_Column;
   use Xm_String_Defs;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Instance_Management;

   procedure Free is
     new Ada.Unchecked_Deallocation (Node_Properties_Editor'Class,
                                     Node_Properties_Editor_Access);

   --  Для каждого узла создаётся (по запросу) свой собственный редактор
   --  свойств. Уже созданные редакторы свойств сохраняются в таблице
   --  Annotation_Table.

   type Annotation_Kinds is
    (Annotation_Empty,
     Annotation_Component_Class,
     Annotation_Widget_Instance,
     Annotation_Enumerated_Resource_Type,
     Annotation_Enumeration_Value_Specification);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
   record
      case Kind is
         when Annotation_Component_Class
           | Annotation_Widget_Instance
         =>
            Properties_Editor : Node_Properties_Editor_Access;
            --  Соответствующий редактор свойств элемента модели.

         when Annotation_Enumerated_Resource_Type =>
            Menu              : Widget;
            --  Выпадающее меню, используемое в меню опций значения ресурса.

         when Annotation_Enumeration_Value_Specification =>
            Button            : Widget;
            --  Кнопка выпадающего меню, используемого в меню опций значения
            --  ресурса.

         when Annotation_Empty =>
            null;
      end case;
   end record;

   package Annotation_Table is
     new GNAT.Table
          (Table_Component_Type => Annotation_Record,
           Table_Index_Type     => Node_Id,
           Table_Low_Bound      => Node_Id'First + 1,
           Table_Initial        => Model.Allocations.Node_Table_Initial,
           Table_Increment      => Model.Allocations.Node_Table_Increment);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Annotation_Table
   --!    <Purpose> Производит расширение таблицы для обеспечения возможности
   --! её использования для указанного узла. Все добавленные элементы
   --! инициализируются значениями по умолчанию.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table (Node : in Node_Id);

   Selected_Item : Node_Id := Null_Node;
   --  Элемент модели, выбранный пользователем в настоящий момент и для
   --  отображены страницы редактора свойств.

   Notebook : Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Delete_Item (Node : in Model.Node_Id) is
   begin
      null;
   end Delete_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize (Parent   : in Xt.Widget;
                         Arg_List : in Xt.Ancillary_Types.Xt_Arg_List)
   is
   begin
      Notebook := Xm_Create_Managed_Notebook (Parent, "notebook", Arg_List);
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id) is
   begin
      Relocate_Annotation_Table (Node);

      case Node_Kind (Node) is
         when Node_Project =>
            --  Построение меню для элементов перечислимых типов.

            declare
               Current_Set   : Node_Id;
               Current_Type  : Node_Id;
               Current_Value : Node_Id;
               Argl          : Xt_Arg_List (0 .. 0);
               Str           : Xm_String;

            begin
               Current_Set := First (Imported_Widget_Sets (Node));

               while Current_Set /= Null_Node loop
                  --  Построение меню для каждого элемента типа ресурсов.

                  Current_Type := First (Resource_Types (Current_Set));

                  while Current_Type /= Null_Node loop
                     if Node_Kind (Current_Type)
                          = Node_Enumerated_Resource_Type
                     then
                        Relocate_Annotation_Table (Current_Type);

                        Annotation_Table.Table (Current_Type).Menu :=
                          Xm_Create_Pulldown_Menu
                           (Notebook, "resourcetype__menu");

                        --  Задание списков возможных значений для каждого меню
                        --  элемента типа ресурсов.

                        Current_Value :=
                          First (Value_Specifications (Current_Type));

                        while Current_Value /= Null_Node loop
                           Relocate_Annotation_Table (Current_Value);

                           Str :=
                             Xm_String_Generate (Name_Image (Current_Value));
                           Xt_Set_Arg (Argl (0), Xm_N_Label_String, Str);
                           Annotation_Table.Table (Current_Value).Button :=
                             Xm_Create_Managed_Push_Button_Gadget
                              (Annotation_Table.Table (Current_Type).Menu,
                               "value",
                               Argl (0 .. 0));
                           Xm_String_Free (Str);

                           Current_Value := Next (Current_Value);
                        end loop;
                     end if;

                     Current_Type := Next (Current_Type);
                  end loop;

                  Current_Set := Next (Current_Set);
               end loop;
            end;

         when Node_Application =>
            null;

         when Node_Component_Class =>
            null;

         when Node_Widget_Instance =>
            null;

         when others =>
            raise Program_Error;
      end case;
   end Insert_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Reinitialize is
   begin
      for J in Annotation_Table.First .. Annotation_Table.Last loop
         case Annotation_Table.Table (J).Kind is
            when Annotation_Component_Class
              | Annotation_Widget_Instance
            =>
               if Annotation_Table.Table (J).Properties_Editor /= null then
                  Free (Annotation_Table.Table (J).Properties_Editor);
               end if;

            when Annotation_Enumerated_Resource_Type         =>
               if Annotation_Table.Table (J).Menu /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Menu);
               end if;

            when Annotation_Enumeration_Value_Specification  =>
               if Annotation_Table.Table (J).Button /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Button);
               end if;

            when Annotation_Empty                            =>
               null;
         end case;
      end loop;

      Selected_Item := Null_Node;

      Annotation_Table.Free;
      Annotation_Table.Init;
   end Reinitialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Annotation_Table
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table (Node : in Node_Id) is
      First : constant Node_Id := Annotation_Table.Last + 1;

   begin
      if Annotation_Table.Last >= Node then
         --  Таблица уже имеет достаточный размер и не нуждается в расширении.

         return;
      end if;

      Annotation_Table.Set_Last (Node);

      for J in First .. Node loop
         case Node_Kind (J) is
            when Node_Component_Class
              | Node_Widget_Instance =>
               Annotation_Table.Table (J) :=
                (Kind              => Annotation_Component_Class,
                 Properties_Editor => null);

            when Node_Enumerated_Resource_Type =>
               Annotation_Table.Table (J) :=
                (Kind => Annotation_Enumerated_Resource_Type,
                 Menu => Null_Widget);

            when Node_Enumeration_Value_Specification =>
               Annotation_Table.Table (J) :=
                (Kind   => Annotation_Enumeration_Value_Specification,
                 Button => Null_Widget);

            when others =>
               Annotation_Table.Table (J) := (Kind => Annotation_Empty);
         end case;
      end loop;
   end Relocate_Annotation_Table;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id) is
   begin

      if Node = Null_Node
        or else Node_Kind (Node) /= Node_Widget_Instance
      then
         return;
      end if;

      Relocate_Annotation_Table (Node);

     if Selected_Item /= Null_Node then
        Hide (Annotation_Table.Table (Selected_Item).Properties_Editor);
     end if;

     Selected_Item := Node;

     if Selected_Item /= Null_Node then
        if Annotation_Table.Table (Selected_Item).Properties_Editor = null then
           --  Создание страниц редактора свойств.

           case Node_Kind (Selected_Item) is
              when Node_Component_Class =>
                 Annotation_Table.Table (Selected_Item).Properties_Editor :=
                   Component_Class.Create (Notebook, Node);

              when Node_Widget_Instance =>
                 Annotation_Table.Table (Selected_Item).Properties_Editor :=
                   Widget_Instance.Create (Notebook, Node);

              when others =>
                 raise Program_Error;
           end case;
        end if;

        Show (Annotation_Table.Table (Selected_Item).Properties_Editor);
     end if;
   end Select_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Properties
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Properties (Node : in Model.Node_Id) is
   begin
      null;
   end Set_Properties;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Model.Node_Id) is
   begin
      null;
   end Update_Item;

end Designer.Properties_Editor;
