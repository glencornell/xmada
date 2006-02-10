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
with Interfaces.C.Wide_Strings;
with GNAT.Table;

with Xlib.Events;
with Xt.Ancillary_Types;
with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;
with Xt.Utilities;
with Xm.Menu_Management;
with Xm.Resource_Management;
with Xm.Strings;
with Xm_Form;
with Xm_Label_Gadget;
with Xm_Push_Button_Gadget;
with Xm_Scrolled_Window;
with Xm_Simple_Spin_Box;
with Xm_Spin_Box;
with Xm_String_Defs;
with Xm_Text_Field;
with Xm_Toggle_Button_Gadget;
with Xm_Row_Column;

with Designer.Main_Window;
with Designer.Model_Utilities;
with Designer.Visual_Editor;
with Model.Allocations;
with Model.Queries;
with Model.Tree.Designer;
with Model.Tree.Lists;

package body Designer.Properties_Editor.Widget_Instance is

   use Designer.Model_Utilities;
   use Interfaces.C;
   use Interfaces.C.Wide_Strings;
   use Model;
   use Model.Queries;
   use Model.Tree;
   use Model.Tree.Designer;
   use Model.Tree.Lists;
   use Xlib.Events;
   use Xm;
   use Xm.Menu_Management;
   use Xm.Resource_Management;
   use Xm.Strings;
   use Xm_Form;
   use Xm_Label_Gadget;
   use Xm_Push_Button_Gadget;
   use Xm_Scrolled_Window;
   use Xm_Simple_Spin_Box;
   use Xm_Spin_Box;
   use Xm_String_Defs;
   use Xm_Text_Field;
   use Xm_Toggle_Button_Gadget;
   use Xm_Row_Column;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;
   use Xt.Utilities;

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

         when Annotation_Enumeration_Value_Specification    =>
            Button : Widget;
            --  Кнопка выпадающего меню, используемого в меню опций значения
            --  ресурса.

         when Annotation_Empty                              =>
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

   Xm_C_Unset : constant := 0;
   Xm_C_Set   : constant := 1;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Check_Sensitive
   --!    <Purpose> проверка состояния чувствительности кнопок.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Check_Sensitive (Node : in Node_Id);

   package Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Fallback_Changed
      --!    <Purpose> Подпрограмма обратного вызова при нажатии кнопки
      --! "ресурс отката".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Fallback_Changed (The_Widget : in Widget;
                                     Closure    : in Xt_Pointer;
                                     Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Fallback_Changed);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Hardcode_Changed
      --!    <Purpose> Подпрограмма обратного при нажатии кнопки
      --! "вшивать в код".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Hardcode_Changed (The_Widget : in Widget;
                                     Closure    : in Xt_Pointer;
                                     Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Hardcode_Changed);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Menu_Entry
      --!    <Purpose> Подпрограмма обратного вызова
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Menu_Entry (The_Widget : in Widget;
                               Closure    : in Xt_Pointer;
                               Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Menu_Entry);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Numeric_Resource_Activate
      --!    <Purpose> Подпрограмма обратного вызова при потере фокуса или
      --! нажатии клавиши Enter на SpinBox-е.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Numeric_Resource_Activate
                 (The_Widget : in Widget;
                  Closure    : in Xt_Pointer;
                  Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Numeric_Resource_Activate);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Numeric_Resource_Value_Changed
      --!    <Purpose> Подпрограмма обратного вызова при изменении
      --! значения поля.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Numeric_Resource_Value_Changed
                 (The_Widget : in Widget;
                  Closure    : in Xt_Pointer;
                  Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Numeric_Resource_Value_Changed);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Numeric_Resource_Modify_Verify
      --!    <Purpose> Подпрограмма обратного вызова при изменении значения
      --! spinBox-а.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Numeric_Resource_Modify_Verify
                 (The_Widget : in Widget;
                  Closure    : in Xt_Pointer;
                  Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Numeric_Resource_Modify_Verify);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Use_In_Program_Changed
      --!    <Purpose> Подпрограмма обратного вызова при изменении состояния
      --! кнопки "Использовать в программе".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Use_In_Program_Changed
                 (The_Widget : in Widget;
                  Closure    : in Xt_Pointer;
                  Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Use_In_Program_Changed);
   end Callbacks;

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Fallback_Cahnged
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Fallback_Changed (The_Widget : in Widget;
                                     Closure    : in Xt_Pointer;
                                     Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         null; --  XXX  Fallbacks пока не реализованы.
      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Fallback_Changed", E);
      end On_Fallback_Changed;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Hardcode_Changed
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Hardcode_Changed (The_Widget : in Widget;
                                     Closure    : in Xt_Pointer;
                                     Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Data     : constant Xm_Toggle_Button_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);
         Args     : Xt_Arg_List (0 .. 0);
         Node     : Xt_Arg_Val;
         Res_List : List_Id;
         Res_Node : Node_Id;

      begin
         --  Извлекаем узел ресурса.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         --  Получаем узел значения ресурса.

         Res_List := Resources (Parent_Node (Node_Id (Node)));
         Res_Node := Find_Resource_Value
                      (Res_List,
                       Resource_Specification (Node_Id (Node)));

         Check_Sensitive (Node_Id (Node));
         --  Проверяем чувствительность кнопок.

         if Data.Set = Xm_C_Set then
            Set_Is_Hardcoded (Res_Node, True);

         elsif Data.Set = Xm_C_Unset then
            Set_Is_Hardcoded (Res_Node, False);
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Hradcode_Changed", E);
      end On_Hardcode_Changed;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Menu_Entry
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Menu_Entry (The_Widget : in Widget;
                               Closure    : in Xt_Pointer;
                               Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Args : Xt_Arg_List (0 .. 0);
         Menu : Xt_Arg_Val;
         Node : Xt_Arg_Val;
         Data : constant Xm_Row_Column_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);

      begin
         --  Получаем выбранный элемент меню.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Menu'Address);
         Xt_Get_Values (Data.Widget, Args (0 .. 0));

         --  Получаем ресурс, содрержащий меню.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (Xm_Get_Posted_From_Widget (The_Widget),
                        Args (0 .. 0));

         --  Задаем значения ресурса и обновляем Visual_Editor.

         Set_Resource_Value (Node_Id (Node), Node_Id (Menu));
         Set_Is_Changed (Node_Id (Node), True);

         Visual_Editor.Set_Properties (Parent_Node (Node_Id (Node)));
         Update_Item (Parent_Node (Node_Id (Node)));

         if Resource_Value (Node_Id (Node)) /= Node_Id (Menu) then
            return;
         end if;

         --  Если значение не изменилось, то обновляем список ресурсов

         declare
            Res_List : constant List_Id
              := Resources (Parent_Node (Node_Id (Node)));
            Res_Node : Node_Id;

         begin
            if Xm_Toggle_Button_Gadget_Get_State
                (Annotation_Table.Table (Node_Id (Node)).Use_In_Program)
            then
               --  Если кнопка Use_In_Program  была нажата,
               --  то обновляем значение ресурса.

               Res_Node := Find_Resource_Value
                            (Res_List,
                             Resource_Specification (Node_Id (Node)));
               Set_Resource_Value (Res_Node, Node_Id (Menu));

            else
               --  Если кнопка Use_In_Program  не была нажата,
               --  то нажимаем ее (значение зобавится в callback-е).

               Xm_Toggle_Button_Gadget_Set_State
                (Annotation_Table.Table (Node_Id (Node)).Use_In_Program,
                 True,
                 True);
            end if;
         end;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Menu_Entry", E);
      end On_Menu_Entry;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Numeric_Resource_Modify_Verify
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Numeric_Resource_Activate
                 (The_Widget : in Widget;
                  Closure    : in Xt_Pointer;
                  Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Node   : Xt_Arg_Val;
         Args   : Xt_Arg_List (0 .. 5);
         Pos    : Xm_Spin_Box_Position := 0;
         Status : Xm_Spin_Box_Validation_Status;

      begin
         Xm_Spin_Box_Validate_Position (The_Widget, Pos, Status);

         if Status = Xm_Valid_Value then
            Xt_Set_Arg (Args (0), Xm_N_Position, Xt_Arg_Val (Pos));
            Xt_Set_Values (Xt_Parent (The_Widget), Args (0 .. 0));

            Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
            Xt_Get_Values (Xt_Parent (The_Widget), Args (0 .. 0));

            Set_Resource_Value (Node_Id (Node), Integer (Pos));
            Set_Is_Changed (Node_Id (Node), True);

            Visual_Editor.Set_Properties (Parent_Node (Node_Id (Node)));
            Update_Item (Parent_Node (Node_Id (Node)));


            if Resource_Value (Node_Id (Node)) /= Integer (Pos) then
               return;
            end if;

            --  Если значение не изменилось, то обновляем список ресурсов

            declare
               Res_List : constant List_Id
                 := Resources (Parent_Node (Node_Id (Node)));
               Res_Node : Node_Id;

            begin
               if Xm_Toggle_Button_Gadget_Get_State
                 (Annotation_Table.Table (Node_Id (Node)).Use_In_Program)
               then
                  --  Если кнопка Use_In_Program  была нажата,
                  --  то обновляем значение ресурса.

                  Res_Node := Find_Resource_Value
                               (Res_List,
                                Resource_Specification (Node_Id (Node)));
                  Set_Resource_Value (Res_Node, Integer (Pos));

               else
                  --  Если кнопка Use_In_Program  не была нажата,
                  --  то нажимаем ее (значение зобавится в callback-е).

                  Xm_Toggle_Button_Gadget_Set_State
                   (Annotation_Table.Table (Node_Id (Node)).Use_In_Program,
                    True,
                    True);
               end if;
            end;
         end if;
      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Numeric_Resource_Activate", E);
      end On_Numeric_Resource_Activate;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Numeric_Resource_Modify_Verify
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Numeric_Resource_Modify_Verify
                 (The_Widget : in Widget;
                  Closure    : in Xt_Pointer;
                  Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (The_Widget);
         --  Данные переменные не используются.

         Data : constant Xm_Text_Verify_Callback_Struct_Wcs_Access
           := To_Callback_Struct_Access (Call_Data);

      begin
         if Data.Event = null or Data.Text.Length = 0 then
            return;
         end if;

         --  Проверяем, что введенное значение является числом (может быть
         --  отрицательным).

         declare
            Image : constant Wide_String := Value (Data.Text.Pointer);

         begin
            for J in Image'Range loop
               if Image (J) not in '0' .. '9' then
                  if not (Image (J) = '-'
                          and J = Image'First
                          and Data.Start_Pos = 0)
                  then
                     Data.Do_It := Xt_False;
                     --  Если значение не является числом, то запрещаем
                     --  его добавление.

                  end if;
               end if;
            end loop;
         end;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Numeric_Resource_Modify_Verify", E);
      end On_Numeric_Resource_Modify_Verify;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Numeric_Resource_Value_Changed
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Numeric_Resource_Value_Changed
                 (The_Widget : in Widget;
                  Closure    : in Xt_Pointer;
                  Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Pos    : Xm_Spin_Box_Position := 0;
         Status : Xm_Spin_Box_Validation_Status;
         Data   : constant Xm_Text_Verify_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);

      begin
         if Data.Event = null then
            return;
         end if;

         Xm_Spin_Box_Validate_Position (The_Widget, Pos, Status);

         --  Проверка выхода значения за верхний и нижний пределы.
         --  Если произошел выход, то устанавливаем максимальное или
         --  минимальное значение.

         if Status = Xm_Minimum_Value or Status = Xm_Maximum_Value then
            declare
               Image : constant Wide_String
                 := Xm_Spin_Box_Position'Wide_Image (Pos);

            begin
               --  Если число не отрицательное, то первый пробел
               --  необходимо игнорировать.

               if Pos < 0 then
                  Xm_Text_Field_Set_String_Wcs (The_Widget, Image);

               else
                  Xm_Text_Field_Set_String_Wcs (The_Widget,
                                                Image (2 .. Image'Last));
               end if;
            end;

            Xm_Text_Field_Set_Insertion_Position (The_Widget, Data.End_Pos);
            --  Устанавливаем курсор в последнюю позицию
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Numeric_Resource_Value_Changed", E);
      end On_Numeric_Resource_Value_Changed;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Use_In_Program_Changed
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Use_In_Program_Changed
                 (The_Widget : in Widget;
                  Closure    : in Xt_Pointer;
                  Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Data     : constant Xm_Toggle_Button_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);
         Node     : Xt_Arg_Val;
         Args     : Xt_Arg_List (0 .. 0);
         Res_List : List_Id;
         Res_Node : Node_Id;

      begin
         --  Получаем узел ресурса, который поменял значение.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         Res_List := Resources (Parent_Node (Node_Id (Node)));
         --  Получаем список ресурсов виджета.

         --  Если у виджета еще нет списка ресурсов,
         --  то его необходимо создать.

         if Res_List = Null_List then
            Res_List := New_List;
            Set_Resources (Parent_Node (Node_Id (Node)), Res_List);
         end if;

         Res_Node := Find_Resource_Value
                      (Res_List,
                       Resource_Specification (Node_Id (Node)));

         Check_Sensitive (Node_Id (Node));
         --  Проверяем чувствительность кнопок.

         if Data.Set = Xm_C_Unset and Res_Node /= Null_Node then
            --  Если кнопка отжата, то удаляем ресурс из списка
            --  (если он там есть).

            Remove (Res_Node);

         elsif Data.Set = Xm_C_Set and Res_Node = Null_Node then
            --  Если кнопка нажата, то ресурс необходимо добавить
            --  (если его там нет).

            Res_Node := Create_Resource_Value_Copy (Node_Id (Node));
            Append (Res_List, Res_Node);

         else
            raise Program_Error;
            --  Других состояний быть не должно.
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Use_In_Program_Changed", E);
      end On_Use_In_Program_Changed;

   end Callbacks;

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
   --!    <Unit> Check_Sensitive
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Check_Sensitive (Node : in Node_Id) is
   begin
      if Xm_Toggle_Button_Gadget_Get_State
          (Annotation_Table.Table (Node).Use_In_Program)
      then
         --  Если Use_In_Program нажата, то устанавливаем чувствительность
         --  у Hard_Code.

         Xt_Set_Sensitive
          (Annotation_Table.Table (Node).Hard_Code,
           True);

         if Xm_Toggle_Button_Gadget_Get_State
             (Annotation_Table.Table (Node).Hard_Code)
         then
            --  Если Hard_Code нажата, то убираем чувствительность с
            --  Fallback.

            Xm_Toggle_Button_Gadget_Set_State
             (Annotation_Table.Table (Node).Fallback, False, True);
            Xt_Set_Sensitive
             (Annotation_Table.Table (Node).Fallback,
              False);

         else
            --  Если Hard_Code отпущена, то устанавливаем чувствительность
            --  на Fallback.

            Xt_Set_Sensitive
             (Annotation_Table.Table (Node).Fallback,
              True);
         end if;

      else
         --  Если Use_In_Program отпущена, то убираем чувствительность с
         --  остальных кнопок.

         --  Отжимаем остальные кнопки.

         Xm_Toggle_Button_Gadget_Set_State
          (Annotation_Table.Table (Node).Hard_Code, False, True);
         Xm_Toggle_Button_Gadget_Set_State
          (Annotation_Table.Table (Node).Fallback, False, True);

         --  И убираем с них чувствительность.

         Xt_Set_Sensitive
          (Annotation_Table.Table (Node).Hard_Code,
           False);
         Xt_Set_Sensitive
          (Annotation_Table.Table (Node).Fallback,
           False);
      end if;
   end Check_Sensitive;

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
         Text     : Widget;
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
         Xt_Set_Arg (Args (3), Xm_N_User_Data, Xt_Arg_Val (Node));
         Annotation_Table.Table (Node).Use_In_Program :=
           Xm_Create_Managed_Toggle_Button_Gadget (Form,
                                                   "use_in_program",
                                                   Args (0 .. 3));
         Xt_Add_Callback (Annotation_Table.Table (Node).Use_In_Program,
                          Xm_N_Value_Changed_Callback,
                          Callbacks.On_Use_In_Program_Changed'Access);

         --  Создание кнопки "вшивать в код".

         Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Widget);
         Xt_Set_Arg (Args (1),
                     Xm_N_Left_Widget,
                     Annotation_Table.Table (Node).Use_In_Program);
         Xt_Set_Arg (Args (2), Xm_N_Top_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (3), Xm_N_Bottom_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (4), Xm_N_User_Data, Xt_Arg_Val (Node));
         Annotation_Table.Table (Node).Hard_Code      :=
           Xm_Create_Managed_Toggle_Button_Gadget (Form,
                                                   "hard_code",
                                                   Args (0 .. 4));
         Xt_Add_Callback (Annotation_Table.Table (Node).Hard_Code,
                          Xm_N_Value_Changed_Callback,
                          Callbacks.On_Hardcode_Changed'Access);

         --  Создание кнопки "ресурс отката".

         Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Widget);
         Xt_Set_Arg (Args (1),
                     Xm_N_Left_Widget,
                     Annotation_Table.Table (Node).Hard_Code);
         Xt_Set_Arg (Args (2), Xm_N_Top_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (3), Xm_N_Bottom_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (4), Xm_N_User_Data, Xt_Arg_Val (Node));
         Annotation_Table.Table (Node).Fallback       :=
           Xm_Create_Managed_Toggle_Button_Gadget (Form,
                                                   "fallback",
                                                   Args (0 .. 4));
         Xt_Add_Callback (Annotation_Table.Table (Node).Fallback,
                          Xm_N_Value_Changed_Callback,
                          Callbacks.On_Fallback_Changed'Access);

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
               Xt_Add_Callback (Annotation_Table.Table (Res_Type).Menu,
                                Xm_N_Entry_Callback,
                                Callbacks.On_Menu_Entry'Access);

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

                     Xt_Set_Arg (Args (0), Xm_N_Text_Field, Text'Address);
                     Xt_Get_Values (Annotation_Table.Table (Node).Value,
                                    Args (0 .. 0));
                     Xt_Add_Callback
                      (Text,
                       Xm_N_Modify_Verify_Callback_Wcs,
                       Callbacks.On_Numeric_Resource_Modify_Verify'Access);
                     Xt_Add_Callback
                      (Text,
                       Xm_N_Value_Changed_Callback,
                       Callbacks.On_Numeric_Resource_Value_Changed'Access);
                     Xt_Add_Callback
                      (Text,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Numeric_Resource_Activate'Access);
                     Xt_Add_Callback
                      (Text,
                       Xm_N_Losing_Focus_Callback,
                       Callbacks.On_Numeric_Resource_Activate'Access);

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

      Result : constant Widget_Instance_Properties_Editor_Access
        := new Widget_Instance_Properties_Editor (Node);
      Args   : Xt_Arg_List (0 .. 5);
      Aux    : Node_Id;

   begin
      Result.Notebook := Parent;

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

      Aux := First (All_Resources (Node));

      while Aux /= Null_Node loop
         Add_Resource (Result.Properties, Aux);
         --  Создание свойств ресурса.

         Aux := Next (Aux);
      end loop;

      --  Выравнивание полей ввода значений по вертикали. Выравнивание
      --  осуществляется с помощью вычисления значения ресурса XmNleftOffset
      --  виджета ввода данных на основании значения ширины виджета максимально
      --  широкого имени ресурса и ширины виджета текущего имени ресурса.

      declare
         Max_Width : Dimension := 0;
         Value     : Dimension;
         SArgs     : Xt_Arg_List (0 .. 0);

      begin
         Xt_Set_Arg (Args (0), Xm_N_Width, Value'Address);

         Aux := First (All_Resources (Node));

         while Aux /= Null_Node loop
            Xt_Get_Values (Annotation_Table.Table (Aux).Name, Args (0 .. 0));

            if Value > Max_Width then
               Max_Width := Value;
            end if;

            Aux := Next (Aux);
         end loop;

         Aux := First (All_Resources (Node));

         while Aux /= Null_Node loop
            if Annotation_Table.Table (Aux).Value /= Null_Widget then
               Xt_Get_Values
                (Annotation_Table.Table (Aux).Name, Args (0 .. 0));

               Xt_Set_Arg
                (SArgs (0),
                 Xm_N_Left_Offset,
                 Xt_Arg_Val (Max_Width - Value));
               Xt_Set_Values
                (Annotation_Table.Table (Aux).Value, SArgs (0 .. 0));
            end if;

            Aux := Next (Aux);
         end loop;
      end;

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

      Xt_Unmanage_Child (Object.Properties);
      Xt_Unmanage_Child (Object.Constraints);
      Xt_Unmanage_Child (Object.Callbacks);
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
               Argl          : Xt_Arg_List (0 .. 1);
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
                           Xt_Set_Arg (Argl (1),
                                       Xm_N_User_Data,
                                       Xt_Arg_Val (Current_Value));
                           Annotation_Table.Table (Current_Value).Button :=
                             Xm_Create_Managed_Push_Button_Gadget
                              (Annotation_Table.Table (Current_Type).Menu,
                               "value",
                               Argl (0 .. 1));
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

      Xt_Manage_Child (Object.Properties);
      Xt_Manage_Child (Object.Constraints);
      Xt_Manage_Child (Object.Callbacks);

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
      All_Res   : List_Id;
      Curr_Res  : List_Id;
      Res_Type  : Node_Id;
      Current   : Node_Id;
      Args      : Xt_Arg_List (0 .. 0);
      Local_Res : Node_Id;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> In_Resources
      --!    <Purpose> Определяет, находится ли ресурс Node в списке
      --! ресурсов воджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      function In_Resources (Node : in Node_Id) return Node_Id;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> function_name
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function In_Resources (Node : in Node_Id) return Node_Id is
         Current : Node_Id;

      begin
         if Curr_Res = Null_List then
            return Null_Node;
         end if;

         Current := First (Curr_Res);

         while Current /= Null_Node loop
            if Resource_Specification (Current)
              = Resource_Specification (Node)
            then
               return Current;
            end if;

            Current := Next (Current);
         end loop;

         return Null_Node;
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
               Local_Res := In_Resources (Current);

               if Local_Res /= Null_Node then
                  Xt_Set_Arg (Args (0), Xm_N_Set, Xm_Set);
                  Xt_Set_Values
                   (Annotation_Table.Table (Current).Use_In_Program,
                    Args (0 .. 0));

                  Xm_Toggle_Button_Gadget_Set_State
                   (Annotation_Table.Table (Current).Hard_Code,
                    Is_Hardcoded (Local_Res),
                    False);

--  XXX                Xm_Toggle_Button_Gadget_Set_State
--  XXX                 (Annotation_Table.Table (Current).Fallback,
--  XXX                  Is_Fallback (Local_Res),
--  XXX                  False);

                  Check_Sensitive (Current);
               end if;

               Res_Type := Resource_Type (Resource_Specification (Current));

               --  Отображаем все остальные ресурсы.

               if Is_Changed (Current) then
                  case Node_Kind (Res_Type) is
                     when Node_Enumerated_Resource_Type =>
                        Xt_Set_Arg (Args (0),
                                    Xm_N_Menu_History,
                                    Annotation_Table.Table
                                     (Resource_Value (Current)).Button);
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
               end if;

               Current := Next (Current);
            end loop;

         when others =>
            null;
      end case;
   end Update_Item;

end Designer.Properties_Editor.Widget_Instance;
