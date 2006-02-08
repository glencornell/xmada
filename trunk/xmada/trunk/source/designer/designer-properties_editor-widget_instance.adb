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
--! <Unit> Designer.Properties_Editor.Widget_Instance
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;
with Xt.Ancillary_Types;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;
with Xm.Resource_Management;
with Xm.Strings;
with Xm_Form;
with Xm_Label_Gadget;
with Xm_Push_Button_Gadget;
with Xm_Scrolled_Window;
with Xm_Simple_Spin_Box;
with Xm_String_Defs;
with Xm_Toggle_Button_Gadget;
with Xm_Row_Column;

with Designer.Visual_Editor;
with Model.Allocations;
with Model.Queries;
with Model.Tree.Designer;
with Model.Tree.Lists;

package body Designer.Properties_Editor.Widget_Instance is

   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;
   use Xm;
   use Xm.Resource_Management;
   use Xm.Strings;
   use Xm_Form;
   use Xm_Label_Gadget;
   use Xm_Push_Button_Gadget;
   use Xm_Scrolled_Window;
   use Xm_Simple_Spin_Box;
   use Xm_String_Defs;
   use Xm_Toggle_Button_Gadget;
   use Xm_Row_Column;
   use Model;
   use Model.Queries;
   use Model.Tree;
   use Model.Tree.Designer;
   use Model.Tree.Lists;

   type Annotation_Kinds is
    (Annotation_Empty,
     Annotation_Boolean_Resource_Value,
     Annotation_Colormap_Resource_Value,
     Annotation_Enumeration_Resource_Value,
     Annotation_Enumeration_Resource_Type,
     Annotation_Enumeration_Value_Specification,
     Annotation_Integer_Resource_Value,
     Annotation_Pixel_Resource_Value,
     Annotation_Pixmap_Resource_Value,
     Annotation_Screen_Resource_Value,
     Annotation_Translation_Data_Resource_Value,
     Annotation_Widget_Reference_Resource_Value);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
   record
      case Kind is
         when Annotation_Boolean_Resource_Value
           | Annotation_Colormap_Resource_Value
           | Annotation_Enumeration_Resource_Value
           | Annotation_Integer_Resource_Value
           | Annotation_Pixel_Resource_Value
           | Annotation_Pixmap_Resource_Value
           | Annotation_Screen_Resource_Value
           | Annotation_Translation_Data_Resource_Value
           | Annotation_Widget_Reference_Resource_Value
          =>
            Use_In_Program : Widget;
            Hard_Code      : Widget;
            Fallback       : Widget;
            Name           : Widget;
            Value          : Widget;

         when Annotation_Enumeration_Resource_Type          =>
            Menu : Widget;
            --  Выпадающее меню, используемое в меню опций значения ресурса.

         when Annotation_Enumeration_Value_Specification   =>
            Button : Widget;
            --  Кнопка выпадающего меню, используемого в меню опций значения
            --  ресурса.

         when Annotation_Empty                             =>
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

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create (Parent : in Widget;
                    Node   : in Model.Node_Id)
     return Node_Properties_Editor_Access
   is
      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Add_Resource
      --!    <Purpose> Добавляет на редактор свойств опимвние ресурса.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Add_Resource (Parent : in Widget; Node : in Node_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Add_Resource
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Add_Resource (Parent : in Widget; Node : in Node_Id) is
         Form     : Widget;
         Name     : Xm_String;
         Res_Type : Node_Id;
         Args     : Xt_Arg_List (0 .. 5);

      begin
         Res_Type := Resource_Type (Resource_Specification (Node));

         Relocate_Annotation_Table (Node);

         Form := Xm_Create_Managed_Form (Parent, "form");

         --  Создание кнопки "Использовать в программе".

         Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (1), Xm_N_Top_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (2), Xm_N_Bottom_Attachment, Xm_Attach_Form);
         Annotation_Table.Table (Node).Use_In_Program :=
           Xm_Create_Managed_Toggle_Button_Gadget (Form,
                                                   "use_in_program",
                                                   Args (0 .. 2));

         --  Создание кнопки "вшивать в код".

         Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Widget);
         Xt_Set_Arg (Args (1),
                     Xm_N_Left_Widget,
                     Annotation_Table.Table (Node).Use_In_Program);
         Xt_Set_Arg (Args (2), Xm_N_Top_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (3), Xm_N_Bottom_Attachment, Xm_Attach_Form);
         Annotation_Table.Table (Node).Hard_Code      :=
           Xm_Create_Managed_Toggle_Button_Gadget (Form,
                                                   "hard_code",
                                                   Args (0 .. 3));

         --  Создание кнопки "ресурс отката".

         Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Widget);
         Xt_Set_Arg (Args (1),
                     Xm_N_Left_Widget,
                     Annotation_Table.Table (Node).Hard_Code);
         Xt_Set_Arg (Args (2), Xm_N_Top_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (3), Xm_N_Bottom_Attachment, Xm_Attach_Form);
         Annotation_Table.Table (Node).Fallback       :=
           Xm_Create_Managed_Toggle_Button_Gadget (Form,
                                                   "fallback",
                                                   Args (0 .. 3));

         --  Создание поля "название ресурса".

         Name := Xm_String_Generate
                  (Resource_Name_Image
                    (Resource_Specification (Node)));
         Xt_Set_Arg (Args (0), Xm_N_Label_String, Name);
         Xt_Set_Arg (Args (1), Xm_N_Left_Attachment, Xm_Attach_Widget);
         Xt_Set_Arg (Args (2),
                     Xm_N_Left_Widget,
                     Annotation_Table.Table (Node).Fallback);
         Xt_Set_Arg (Args (3), Xm_N_Top_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (4), Xm_N_Bottom_Attachment, Xm_Attach_Form);
         Annotation_Table.Table (Node).Name           :=
           Xm_Create_Managed_Label_Gadget (Form,
                                           "resource_name",
                                           Args (0 .. 4));

         --  Создание поля "значение ресурса".

         case Node_Kind (Res_Type) is
            when Node_Enumerated_Resource_Type =>
               Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Widget);
               Xt_Set_Arg (Args (1),
                           Xm_N_Left_Widget,
                           Annotation_Table.Table (Node).Name);
               Xt_Set_Arg (Args (2),
                           Xm_N_Sub_Menu_Id,
                           Annotation_Table.Table (Res_Type).Menu);
               Xt_Set_Arg (Args (3),
                           Xm_N_User_Data,
                           Xt_Arg_Val (Node));
               Annotation_Table.Table (Node).Value :=
                  Xm_Create_Managed_Option_Menu (Form,
                                                 "resource_value",
                                                 Args (0 .. 3));
--               Xt_Add_Callback (Annotation_Table.Table (Node).Value,

            when Node_Predefined_Resource_Type  =>
               case Type_Kind (Res_Type) is
                  when Type_C_Short  --  Числовые типы.
                    | Type_C_Int
                    | Type_Position
                    | Type_Dimension
                  =>
                     Xt_Set_Arg (Args (0),
                                 Xm_N_Left_Attachment,
                                 Xm_Attach_Widget);
                     Xt_Set_Arg (Args (1),
                                 Xm_N_Left_Widget,
                                 Annotation_Table.Table (Node).Name);
                     Xt_Set_Arg (Args (2),
                                 Xm_N_Right_Attachment,
                                 Xm_Attach_Form);
                     Xt_Set_Arg (Args (3),
                                 Xm_N_Top_Attachment,
                                 Xm_Attach_Form);
                     Xt_Set_Arg (Args (4),
                                 Xm_N_Bottom_Attachment,
                                 Xm_Attach_Form);
                     Xt_Set_Arg (Args (5),
                                 Xm_N_User_Data,
                                 Xt_Arg_Val (Node));
                     Annotation_Table.Table (Node).Value :=
                       Xm_Create_Managed_Simple_Spin_Box (Form,
                                                          "resource_numeric",
                                                          Args (0 .. 5));
--                     Xt_Add_Callback
--                      (Annotation_Table.Table (Node).Value,
--                       Xm_N_Value_Changed,
--                       On_Numeric_Resource_Value_Changed'Access);

                  when Type_Pixel =>
                     null; --  TODO реализовать.

                  when Type_Pixmap =>
                     null; --  TODO реализовать.

                  when Type_Screen =>
                     null; --  TODO реализовать.

                  when Type_Colormap =>
                     null; --  TODO реализовать.

                  when Type_Translation_Data =>
                     null; --  TODO реализовать.

                  when Type_Unspecified =>
                     null; --  TODO реализовать.

                  when Type_Boolean =>
                     null; --  TODO реализовать.
               end case;

            when Node_Widget_Reference_Resource_Type =>
               null; --  TODO реализовать.

            when others =>
               null;
         end case;


        Xm_String_Free (Name);
      end Add_Resource;

      Result    : constant Widget_Instance_Properties_Editor_Access
        := new Widget_Instance_Properties_Editor (Node);
      Args      : Xt_Arg_List (0 .. 5);
      All_Res   : List_Id;
      Current   : Node_Id;

   begin
      Result.Notebook := Parent;
      All_Res := All_Resources (Node);
      --  Получение всех доступных ресурсов для виджета.

      --  Создаем вкладку "Свойства".

      Xt_Set_Arg (Args (0), Xm_N_Scrolling_Policy, Xm_Automatic);
      Result.Properties_Container :=
        Xm_Create_Managed_Scrolled_Window (Parent, "scrolled", Args (0 .. 0));

      Result.Properties           :=
        Xm_Create_Row_Column (Result.Properties_Container,
                              "row_column");
      Result.Properties_Tab       :=
        Xm_Create_Managed_Push_Button_Gadget (Parent, "resources");

      --  Создаем вкладку "ограничения".

      Result.Constraints_Container :=
        Xm_Create_Managed_Scrolled_Window (Parent, "scrolled", Args (0 .. 0));
      Result.Constraints           :=
        Xm_Create_Managed_Row_Column (Result.Constraints_Container,
                                      "row_column");
      Result.Constraints_Tab       :=
        Xm_Create_Managed_Push_Button_Gadget (Parent, "constraints");

      --  Создаем вкладку "функции обратного вызова".

      Result.Callbacks_Container   :=
        Xm_Create_Managed_Scrolled_Window (Parent, "scrolled", Args (0 .. 0));
      Result.Callbacks             :=
        Xm_Create_Managed_Row_Column (Result.Callbacks_Container,
                                      "row_column");

      Result.Callbacks_Tab         :=
        Xm_Create_Managed_Push_Button_Gadget (Parent, "callbacks");

      --  Заполнение редактора свойств значениями ресурсов.

      Current := First (All_Res);

      while Current /= Null_Node loop
         Add_Resource (Result.Properties, Current);
         --  Создание свойств ресурса.

         Current := Next (Current);
      end loop;

      Update_Item (Node);
      --  Задаем значение ресурсов.

      Xt_Manage_Child (Result.Properties);
      return Node_Properties_Editor_Access (Result);
   end Create;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Finalize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Finalize (Object : in out Widget_Instance_Properties_Editor) is
   begin

      --  Удаление вкладки "Свойства".

      Xt_Destroy_Widget (Object.Properties_Container);
      Xt_Destroy_Widget (Object.Properties_Tab);

      --  Удаление вкладки "Ограничения".

      Xt_Destroy_Widget (Object.Constraints_Container);
      Xt_Destroy_Widget (Object.Constraints_Tab);

      --  Удаление вкладки "Функции обратного вызова".

      Xt_Destroy_Widget (Object.Callbacks_Container);
      Xt_Destroy_Widget (Object.Callbacks_Tab);
   end Finalize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Hide
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Hide (Object : access Widget_Instance_Properties_Editor) is
   begin
      Xt_Unmanage_Child (Object.Properties_Tab);
      Xt_Unmanage_Child (Object.Constraints_Tab);
      Xt_Unmanage_Child (Object.Callbacks_Tab);

      Xt_Unmanage_Child (Object.Properties_Container);
      Xt_Unmanage_Child (Object.Constraints_Container);
      Xt_Unmanage_Child (Object.Callbacks_Container);
   end Hide;

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
                           (Notebook, "resourcetype_menu");

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

         when others =>
            null;
      end case;
   end Insert_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Reinitialize is
   begin
      --  Удаление виджетов элементов меню.

      for J in Annotation_Table.First .. Annotation_Table.Last loop
         case Annotation_Table.Table (J).Kind is
            when Annotation_Enumeration_Resource_Type         =>
               if Annotation_Table.Table (J).Menu /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Menu);
               end if;

            when Annotation_Enumeration_Value_Specification  =>
               if Annotation_Table.Table (J).Button /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Button);
               end if;

            when others =>
               null;
         end case;
      end loop;

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
            when Node_Boolean_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind           => Annotation_Boolean_Resource_Value,
                 Use_In_Program => Null_Widget,
                 Hard_Code      => Null_Widget,
                 Fallback       => Null_Widget,
                 Name           => Null_Widget,
                 Value          => Null_Widget);

            when Node_Colormap_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind           => Annotation_Colormap_Resource_Value,
                 Use_In_Program => Null_Widget,
                 Hard_Code      => Null_Widget,
                 Fallback       => Null_Widget,
                 Name           => Null_Widget,
                 Value          => Null_Widget);

            when Node_Enumerated_Resource_Type =>
               Annotation_Table.Table (J) :=
                (Kind => Annotation_Enumeration_Resource_Type,
                 Menu => Null_Widget);

            when Node_Enumeration_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind           => Annotation_Enumeration_Resource_Value,
                 Use_In_Program => Null_Widget,
                 Hard_Code      => Null_Widget,
                 Fallback       => Null_Widget,
                 Name           => Null_Widget,
                 Value          => Null_Widget);

            when Node_Enumeration_Value_Specification =>
               Annotation_Table.Table (J) :=
                (Kind   => Annotation_Enumeration_Value_Specification,
                 Button => Null_Widget);

            when Node_Integer_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind           => Annotation_Integer_Resource_Value,
                 Use_In_Program => Null_Widget,
                 Hard_Code      => Null_Widget,
                 Fallback       => Null_Widget,
                 Name           => Null_Widget,
                 Value          => Null_Widget);

            when Node_Pixel_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind           => Annotation_Pixel_Resource_Value,
                 Use_In_Program => Null_Widget,
                 Hard_Code      => Null_Widget,
                 Fallback       => Null_Widget,
                 Name           => Null_Widget,
                 Value          => Null_Widget);

            when Node_Pixmap_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind           => Annotation_Pixmap_Resource_Value,
                 Use_In_Program => Null_Widget,
                 Hard_Code      => Null_Widget,
                 Fallback       => Null_Widget,
                 Name           => Null_Widget,
                 Value          => Null_Widget);

            when Node_Screen_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind           => Annotation_Screen_Resource_Value,
                 Use_In_Program => Null_Widget,
                 Hard_Code      => Null_Widget,
                 Fallback       => Null_Widget,
                 Name           => Null_Widget,
                 Value          => Null_Widget);

            when Node_Translation_Data_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind           => Annotation_Translation_Data_Resource_Value,
                 Use_In_Program => Null_Widget,
                 Hard_Code      => Null_Widget,
                 Fallback       => Null_Widget,
                 Name           => Null_Widget,
                 Value          => Null_Widget);

            when Node_Widget_Reference_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind           => Annotation_Widget_Reference_Resource_Value,
                 Use_In_Program => Null_Widget,
                 Hard_Code      => Null_Widget,
                 Fallback       => Null_Widget,
                 Name           => Null_Widget,
                 Value          => Null_Widget);

            when others =>
               Annotation_Table.Table (J) := (Kind => Annotation_Empty);
         end case;
      end loop;
   end Relocate_Annotation_Table;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Properties
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Properties (Node : in Node_Id)
   is
   begin
      null;
   end Set_Properties;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Show
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Show (Object : access Widget_Instance_Properties_Editor) is
      Args : Xt_Arg_List (0 .. 0);
      Page : Xt_Arg_Val;

   begin
      Xt_Manage_Child (Object.Properties_Tab);
      Xt_Manage_Child (Object.Constraints_Tab);
      Xt_Manage_Child (Object.Callbacks_Tab);

      Xt_Manage_Child (Object.Properties_Container);
      Xt_Manage_Child (Object.Constraints_Container);
      Xt_Manage_Child (Object.Callbacks_Container);

      Xt_Set_Arg (Args (0), Xm_N_Page_Number, Page'Address);
      Xt_Get_Values (Object.Properties_Tab, Args (0 .. 0));

      Xt_Set_Arg (Args (0), Xm_N_Current_Page_Number, Page);
      Xt_Set_Values (Object.Notebook, Args (0 .. 0));
   end Show;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Node_Id)
   is
      All_Res  : List_Id;
      Curr_Res : List_Id;
      Res_Type : Node_Id;
      Current  : Node_Id;
      Args     : Xt_Arg_List (0 .. 0);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> In_Resources
      --!    <Purpose> Определяет, находится ли ресурс Node в списке
      --! ресурсов воджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      function In_Resources (Node : in Node_Id) return Boolean;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> function_name
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function In_Resources (Node : in Node_Id) return Boolean is
         Current : Node_Id;

      begin
         if Curr_Res = Null_List then
            return False;
         end if;

         Current := First (Curr_Res);

         while Current /= Null_Node loop
            if Resource_Specification (Current)
              = Resource_Specification (Node)
            then
               return True;
            end if;

            Current := Next (Current);
         end loop;

         return False;
      end In_Resources;

   begin
      case Node_Kind (Node) is
         when Node_Widget_Instance =>
            Visual_Editor.Get_Properties (Node);

            All_Res  := All_Resources (Node);
            Curr_Res := Resources (Node);
            Current  := First (All_Res);

            --  Если нет текущих ресурсов, то выходим.

            if  All_Res = Null_List then
               return;
            end if;

            --  Находим имеющиеся ресурсы и устанавливаем влажок
            --  Use_In_Program.

            while Current /= Null_Node loop
               if In_Resources (Current) then
                  Xt_Set_Arg (Args (0), Xm_N_Set, Xm_Set);
                  Xt_Set_Values
                   (Annotation_Table.Table (Current).Use_In_Program,
                    Args (0 .. 0));
               end if;

               Res_Type := Resource_Type (Resource_Specification (Current));

               --  Отображаем все остальные ресурсы.

               case Node_Kind (Res_Type) is
                  when Node_Enumerated_Resource_Type =>
--  XXX временно.   Xt_Set_Arg (Args (0),
--  XXX временно.               Xm_N_Menu_History,
--  XXX временно.               Annotation_Table.Table
--  XXX временно.               (Resource_Value (Current)).Button);
                     Xt_Set_Values
                      (Annotation_Table.Table (Current).Value,
                       Args (0 .. 0));

                  when Node_Predefined_Resource_Type =>
                     case Type_Kind (Res_Type) is
                        when Type_C_Short  --  Числовые типы.
                          | Type_C_Int
                          | Type_Position
                          | Type_Dimension
                        =>
                           Xt_Set_Arg (Args (0),
                                       Xm_N_Position,
                                       Xt_Arg_Val
                                        (Integer'
                                          (Resource_Value (Current))));
                           Xt_Set_Values
                            (Annotation_Table.Table (Current).Value,
                             Args (0 .. 0));
                        when Type_Pixel =>
                           null; --  TODO реализовать.

                        when Type_Pixmap =>
                           null; --  TODO реализовать.

                        when Type_Screen =>
                           null; --  TODO реализовать.

                        when Type_Colormap =>
                           null; --  TODO реализовать.

                        when Type_Translation_Data =>
                           null; --  TODO реализовать.

                        when Type_Unspecified =>
                           null; --  TODO реализовать.

                        when Type_Boolean =>
                           null; --  TODO реализовать.
                     end case;

                  when Node_Widget_Reference_Resource_Type =>
                     null; --  TODO реализовать.

                  when others =>
                     raise Program_Error;
               end case;

               Current := Next (Current);
            end loop;

         when others =>
            null;
      end case;
   end Update_Item;

end Designer.Properties_Editor.Widget_Instance;
