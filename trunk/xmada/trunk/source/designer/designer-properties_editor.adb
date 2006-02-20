------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006  TechnoServ A/S
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
--! XmAda maintained by TechnoServ A/S (email: vgodunko@rostel.ru)
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
with Xt.Resource_Management;
with Xm_String_Defs;

with Designer.Properties_Editor.Component_Class;
with Designer.Properties_Editor.Widget_Instance;
with Model.Allocations;
with Model.Tree;


package body Designer.Properties_Editor is

   use Model;
   use Model.Tree;
   use Xm_String_Defs;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Resource_Management;

   procedure Free is
     new Ada.Unchecked_Deallocation (Node_Properties_Editor'Class,
                                     Node_Properties_Editor_Access);

   --  Для каждого узла создаётся (по запросу) свой собственный редактор
   --  свойств. Уже созданные редакторы свойств сохраняются в таблице
   --  Annotation_Table.

   type Annotation_Kinds is
    (Annotation_Empty,
     Annotation_Component_Class,
     Annotation_Widget_Instance);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
   record
      case Kind is
         when Annotation_Component_Class
           | Annotation_Widget_Instance
         =>
            Properties_Editor : Node_Properties_Editor_Access;
            --  Соответствующий редактор свойств элемента модели.

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
   --!    <Unit> Do_Alignment
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Do_Alignment (List : in Alignment_Widget_List) is
      Max_Width : Dimension := 0;
      Value     : Dimension;
      Args      : Xt_Arg_List (0 .. 0);
      SArgs     : Xt_Arg_List (0 .. 0);

   begin
      --  Выравнивание полей ввода значений по вертикали. Выравнивание
      --  осуществляется с помощью вычисления значения ресурса
      --  XmNleftOffset виджета ввода данных на основании значения ширины
      --  виджета максимально широкого имени ресурса и ширины виджета
      --  текущего имени ресурса.

      Xt_Set_Arg (Args (0), Xm_N_Width, Value'Address);

      for J in List'Range loop
         Xt_Get_Values
            (List (J).L_Widget, Args (0 .. 0));

         if Value > Max_Width then
            Max_Width := Value;
         end if;
      end loop;

      for J in List'Range loop
         if List (J).R_Widget /= Null_Widget then
            Xt_Get_Values
               (List (J).L_Widget, Args (0 .. 0));

            Xt_Set_Arg
               (SArgs (0),
               Xm_N_Left_Offset,
               Xt_Arg_Val (Max_Width - Value));
            Xt_Set_Values
               (List (J).R_Widget, SArgs (0 .. 0));
         end if;
      end loop;
   end Do_Alignment;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize (Parent   : in Xt.Widget;
                         Arg_List : in Xt.Ancillary_Types.Xt_Arg_List)
   is
   begin
      Properties_Args   := Arg_List;
      Properties_Parent := Parent;
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id) is
   begin
      Relocate_Annotation_Table (Node);
      Widget_Instance.Insert_Item (Node);

      case Node_Kind (Node) is
         when Node_Project =>
            null;

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
      Widget_Instance.Reinitialize;

      for J in Annotation_Table.First .. Annotation_Table.Last loop
         case Annotation_Table.Table (J).Kind is
            when Annotation_Component_Class
              | Annotation_Widget_Instance
            =>
               if Annotation_Table.Table (J).Properties_Editor /= null then
                  Free (Annotation_Table.Table (J).Properties_Editor);
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
            when Node_Component_Class =>
               Annotation_Table.Table (J) :=
                (Kind              => Annotation_Component_Class,
                 Properties_Editor => null);

            when Node_Widget_Instance =>
               Annotation_Table.Table (J) :=
                (Kind              => Annotation_Widget_Instance,
                 Properties_Editor => null);

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
      Kind : Node_Kinds;

   begin
      if Selected_Item /= Null_Node then
        Hide (Annotation_Table.Table (Selected_Item).Properties_Editor);
        Selected_Item := Null_Node;
      end if;

      if Node = Null_Node then
         return;
      end if;

      Kind := Node_Kind (Node);

      if Kind /= Node_Widget_Instance and Kind /= Node_Component_Class then
         return;
      end if;

      Relocate_Annotation_Table (Node);

     if Node /= Null_Node then
        if Annotation_Table.Table (Node).Properties_Editor = null then
           --  Создание страниц редактора свойств.

           case Node_Kind (Node) is
              when Node_Component_Class =>
                 Annotation_Table.Table (Node).Properties_Editor :=
                   Component_Class.Create
                    (Properties_Parent, Properties_Args, Node);

              when Node_Widget_Instance =>
                 Annotation_Table.Table (Node).Properties_Editor :=
                   Widget_Instance.Create
                    (Properties_Parent, Properties_Args, Node);

              when others =>
                 null;
           end case;
        end if;

        Show (Annotation_Table.Table (Node).Properties_Editor);
        Selected_Item := Node;
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
