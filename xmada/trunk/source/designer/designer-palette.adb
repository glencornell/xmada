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
--! <Unit> Designer.Palette
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;

with Xt.Ancillary_Types;
with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;
with Xt.Utilities;
with Xm.Resource_Management;
with Xm.Strings;
with Xm_Push_Button_Gadget;
with Xm_Row_Column;
with Xm_String_Defs;

with Model.Allocations;
with Model.Names;
with Model.Queries;
with Model.Tree.Lists;
with Model.Utilities;

with Designer.Main_Window;

package body Designer.Palette is

   use Model;
   use Model.Names;
   use Model.Tree;
   use Model.Tree.Lists;
   use Model.Queries;
   use Xm;
   use Xm.Resource_Management;
   use Xm_String_Defs;
   use Xm.Strings;
   use Xm_Row_Column;
   use Xm_Push_Button_Gadget;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;
   use Xt.Utilities;

   Palette_Notebook : Xt.Widget;
   Project          : Node_Id;
   Selected_Item    : Node_Id;

   type Annotation_Kinds is
    (Annotation_Empty,
     Annotation_Project,
     Annotation_Widget_Class);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
   record
      case Kind is
         when Annotation_Project      =>
            Primitives_Page : Widget;
            Primitives_Tab  : Widget;
            Managers_Page   : Widget;
            Managers_Tab    : Widget;
            Gadgets_Page    : Widget;
            Gadgets_Tab     : Widget;
            Shells_Page     : Widget;
            Shells_Tab      : Widget;

         when Annotation_Widget_Class =>
            Button : Widget;

         when Annotation_Empty        =>
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

   -------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget_Instance
   --!    <Purpose>
   --!    <Exceptions>
   -------------------------------------------------------------------------
   procedure Create_Widget_Instance (Class  : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> On_Button_Activate
   --!    <Purpose> Подпрограмма вызывается при активизации кнопки палитры.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure On_Button_Activate (The_Widget : in Widget;
                                 Closure    : in Xt_Pointer;
                                 Call_Data  : in Xt_Pointer);
   pragma Convention (C, On_Button_Activate);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Annotation_Table
   --!    <Purpose> Производит расширение таблицы для обеспечения возможности
   --! её использования для указанного узла. Все добавленные элементы
   --! инициализируются значениями по умолчанию.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table (Node : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> New_Name
   --!    <Purpose> Создаёт уникальное имя имеющее указанный префикс и
   --! сгенерированный численный суффикс.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function New_Name (Prefix : in Wide_String) return Name_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget_Instance
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Widget_Instance (Class  : in Model.Node_Id) is
      Node          : Node_Id;
      Children_List : List_Id;

   begin
      Node := Model.Utilities.Create_Widget_Instance (Class);

      if Node_Kind (Selected_Item) = Node_Component_Class then
         Set_Root (Selected_Item, Node);
      else
         Children_List := Children (Selected_Item);

         if Children_List = Null_List then
            Children_List := New_List;
            Set_Children (Selected_Item, Children_List);
         end if;

        Append (Children_List, Node);
      end if;

      Set_Name (Node, New_Name (Name_Image (Class)));
      Designer.Main_Window.Insert_Item (Node);
   end Create_Widget_Instance;

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
   procedure Initialize (Parent : in Xt.Widget) is
   begin
      Palette_Notebook := Parent;
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id) is
   begin
      case Node_Kind (Node) is
         when Node_Project =>
            declare
               Current_Widget_Set   : Node_Id;
               Current_Widget_Class : Node_Id;
               Args                 : Xt_Arg_List (0 .. 1);
               Str                  : Xm_String;
               Page_Number          : Integer;

            begin
               --  Добавляем вкладки в палитру виджетов.

               Project := Node;
               Relocate_Annotation_Table (Node);
               Current_Widget_Set := First (Imported_Widget_Sets (Node));

               Annotation_Table.Table (Node).Primitives_Page :=
                 Xm_Create_Managed_Row_Column
                  (Palette_Notebook, "palette_page");

               Annotation_Table.Table (Node).Primitives_Tab :=
                 Xm_Create_Managed_Push_Button_Gadget
                  (Palette_Notebook, "primitives");

               Xt_Set_Arg (Args (0), Xm_N_Page_Number, Page_Number'Address);
               Xt_Get_Values
                (Annotation_Table.Table (Node).Primitives_Tab,
                 Args (0 .. 0));

               Annotation_Table.Table (Node).Managers_Page :=
                 Xm_Create_Managed_Row_Column
                  (Palette_Notebook, "palette_page");

               Annotation_Table.Table (Node).Managers_Tab :=
                 Xm_Create_Managed_Push_Button_Gadget
                  (Palette_Notebook, "managers");

               Annotation_Table.Table (Node).Gadgets_Page :=
                 Xm_Create_Managed_Row_Column
                  (Palette_Notebook, "palette_page");

               Annotation_Table.Table (Node).Gadgets_Tab :=
                 Xm_Create_Managed_Push_Button_Gadget
                  (Palette_Notebook, "gadgets");

               Annotation_Table.Table (Node).Shells_Page :=
                 Xm_Create_Managed_Row_Column
                  (Palette_Notebook, "palette_page");

               Annotation_Table.Table (Node).Shells_Tab :=
                 Xm_Create_Managed_Push_Button_Gadget
                  (Palette_Notebook, "shells");

               while Current_Widget_Set /= Null_Node loop
                  --  Построение кнопки для каждого класса виджета.

                  Current_Widget_Class :=
                    First (Widget_Classes (Current_Widget_Set));

                  while Current_Widget_Class /= Null_Node loop
                     if not Is_Meta_Class (Current_Widget_Class) then
                        Relocate_Annotation_Table (Current_Widget_Class);

                        Str :=
                          Xm_String_Generate
                           (Name_Image (Current_Widget_Class));

                        Xt_Set_Arg (Args (0), Xm_N_Label_String, Str);
                        Xt_Set_Arg
                         (Args (1),
                          Xm_N_User_Data,
                          Xt_Arg_Val (Current_Widget_Class));

                        if Is_Primitive (Current_Widget_Class) then
                           Annotation_Table.Table
                            (Current_Widget_Class).Button :=
                              Xm_Create_Managed_Push_Button_Gadget
                               (Annotation_Table.Table (Node).Primitives_Page,
                                "callbacks",
                                Args (0 .. 1));

                        elsif Is_Gadget (Current_Widget_Class) then
                           Annotation_Table.Table
                            (Current_Widget_Class).Button :=
                              Xm_Create_Managed_Push_Button_Gadget
                               (Annotation_Table.Table (Node).Gadgets_Page,
                                "callbacks",
                                Args (0 .. 1));

                        elsif Is_Manager (Current_Widget_Class) then
                           Annotation_Table.Table
                            (Current_Widget_Class).Button :=
                              Xm_Create_Managed_Push_Button_Gadget
                               (Annotation_Table.Table (Node).Managers_Page,
                                "callbacks",
                                Args (0 .. 1));

                        elsif Is_Shell (Current_Widget_Class) then
                           Annotation_Table.Table
                            (Current_Widget_Class).Button :=
                              Xm_Create_Managed_Push_Button_Gadget
                               (Annotation_Table.Table (Node).Shells_Page,
                                "callbacks",
                                Args (0 .. 1));
                        end if;

                        Xm_String_Free (Str);

                        Xt_Set_Sensitive
                         (Annotation_Table.Table (Current_Widget_Class).Button,
                          False);
                        Xt_Add_Callback
                         (Annotation_Table.Table (Current_Widget_Class).Button,
                          Xm_N_Activate_Callback,
                          On_Button_Activate'Access);
                     end if;

                     Current_Widget_Class := Next (Current_Widget_Class);
                  end loop;

                  Current_Widget_Set := Next (Current_Widget_Set);
               end loop;

               Xt_Set_Arg
                (Args (0), Xm_N_Current_Page_Number, Xt_Arg_Val (Page_Number));
               Xt_Set_Values (Palette_Notebook, Args (0 .. 0));
            end;

            Xt_Unmanage_Child (Palette_Notebook);
            Xt_Manage_Child (Palette_Notebook);

         when Node_Application =>
            null;

         when Node_Component_Class =>
            null;

         when Node_Widget_Instance =>
            Select_Item (Selected_Item);

         when others =>
            raise Program_Error;
      end case;
   end Insert_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> New_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function New_Name (Prefix : in Wide_String) return Name_Id is
   begin
      for J in Positive'Range loop
         declare
            Suffix : constant Wide_String := Positive'Wide_Image (J);
            Name   : constant Wide_String
              := Prefix & Suffix (Suffix'First + 1 .. Suffix'Last);

         begin
            if Find (Name) = Null_Name then
               return Enter (Name);
            end if;
         end;
      end loop;

      raise Program_Error;
   end New_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> On_Button_Activate
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure On_Button_Activate (The_Widget : in Widget;
                                 Closure    : in Xt_Pointer;
                                 Call_Data  : in Xt_Pointer)
   is
      pragma Unreferenced (Closure);
      pragma Unreferenced (Call_Data);

      Node : Xt_Arg_Val;
      Args : Xt_Arg_List (0 .. 0);
   begin
      if Selected_Item /= Null_Node then
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));
         Create_Widget_Instance (Node_Id (Node));
      end if;

   exception
      when E : others =>
         Designer.Main_Window.Put_Exception_In_Callback
          ("On_Button_Activate", E);
   end On_Button_Activate;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Reinitialize is
   begin
      for J in Annotation_Table.First .. Annotation_Table.Last loop
         case Annotation_Table.Table (J).Kind is
            when Annotation_Project                                         =>
               if Annotation_Table.Table (J).Primitives_Page /= Null_Widget then
                  Xt_Destroy_Widget
                    (Annotation_Table.Table (J).Primitives_Page);
               end if;

               if Annotation_Table.Table (J).Primitives_Tab /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Primitives_Tab);
               end if;

               if Annotation_Table.Table (J).Managers_Page /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Managers_Page);
               end if;

               if Annotation_Table.Table (J).Managers_Tab /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Managers_Tab);
               end if;

               if Annotation_Table.Table (J).Gadgets_Page /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Gadgets_Page);
               end if;

               if Annotation_Table.Table (J).Gadgets_Tab /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Gadgets_Tab);
               end if;

               if Annotation_Table.Table (J).Shells_Page /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Shells_Page);
               end if;

               if Annotation_Table.Table (J).Shells_Tab /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Shells_Tab);
               end if;

            when Annotation_Widget_Class                                    =>
               if Annotation_Table.Table (J).Button /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Button);
               end if;

            when Annotation_Empty                                           =>
               null;
         end case;
      end loop;

      Annotation_Table.Init;

      Project := Null_Node;
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
            when Node_Project =>
                Annotation_Table.Table (J) :=
                 (Kind => Annotation_Project,
                  Primitives_Page => Null_Widget,
                  Primitives_Tab  => Null_Widget,
                  Managers_Page   => Null_Widget,
                  Managers_Tab    => Null_Widget,
                  Gadgets_Page    => Null_Widget,
                  Gadgets_Tab     => Null_Widget,
                  Shells_Page     => Null_Widget,
                  Shells_Tab      => Null_Widget);

            when Node_Widget_Class =>
                Annotation_Table.Table (J) :=
                 (Kind => Annotation_Widget_Class,
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

      -------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Get_Sensitive_Indication
      --!    <Purpose>
      --!    <Exceptions>
      -------------------------------------------------------------------------
      function Get_Sensitive_Indication (Class : in Node_Id;
                                         Node  : in Node_Id)
        return Boolean;

      -------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Get_Sensitive_Indication
      --!    <ImplementationNotes>
      -------------------------------------------------------------------------
      function Get_Sensitive_Indication (Class : in Node_Id;
                                         Node  : in Node_Id)
        return Boolean
      is
         pragma Unreferenced (Class);

      begin
         if Node = Null_Node then
            return False;
         end if;

         case Node_Kind (Node) is
            when Node_Project | Node_Application =>
               return False;

            when Node_Component_Class =>
               return Root (Node) = Null_Node;

            when Node_Widget_Instance =>
               if Is_Shell (Node)
                    and then Children (Node) /= Null_List
                    and then Length (Children (Node)) = 1
               then
                  return False;

               elsif Is_Primitive (Node) then
                  return False;

               else

                  return True;
               end if;

            when others =>
               return True;

          end case;
      end Get_Sensitive_Indication;

      Current_Widget_Set     : Node_Id;
      Current_Widget_Class   : Node_Id;

   begin
      Selected_Item := Node;

      --  При запуске программы в процессе реинициализации вызов подпрограммы
      --  осуществляется по вызова подпрограммы вставки элемента. Поэтому
      --  узел проекта ещё не установлен.

      if Project /= Null_Node then
         Current_Widget_Set := First (Imported_Widget_Sets (Project));

         while Current_Widget_Set /= Null_Node loop
            Current_Widget_Class :=
              First (Widget_Classes (Current_Widget_Set));

            while Current_Widget_Class /= Null_Node loop
               if not Is_Meta_Class (Current_Widget_Class) then
                  Xt_Set_Sensitive
                   (Annotation_Table.Table (Current_Widget_Class).Button,
                    Get_Sensitive_Indication (Current_Widget_Class, Node));
               end if;

               Current_Widget_Class := Next (Current_Widget_Class);
            end loop;

            Current_Widget_Set := Next (Current_Widget_Set);
         end loop;
      end if;
   end Select_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Model.Node_Id) is
   begin
      null;
   end Update_Item;

end Designer.Palette;
