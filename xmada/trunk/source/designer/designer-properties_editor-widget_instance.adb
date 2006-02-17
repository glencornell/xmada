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
with Xm.Class_Management;
with Xm.Menu_Management;
with Xm.Resource_Management;
with Xm.Strings;
with Xm_Form;
with Xm_Label_Gadget;
with Xm_Notebook;
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
with Model.Names;
with Model.Queries;
with Model.Strings;
with Model.Tree.Designer;
with Model.Tree.Lists;
with Model.Tree.Xm_Ada;

package body Designer.Properties_Editor.Widget_Instance is

   use Designer.Model_Utilities;
   use Interfaces.C;
   use Interfaces.C.Wide_Strings;
   use Model;
   use Model.Names;
   use Model.Queries;
   use Model.Strings;
   use Model.Tree;
   use Model.Tree.Designer;
   use Model.Tree.Lists;
   use Model.Tree.Xm_Ada;
   use Xlib.Events;
   use Xm;
   use Xm.Class_Management;
   use Xm.Menu_Management;
   use Xm.Resource_Management;
   use Xm.Strings;
   use Xm_Form;
   use Xm_Label_Gadget;
   use Xm_Notebook;
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
     Annotation_Colormap_Resource_Value,
     Annotation_Enumeration_Resource_Value,
     Annotation_Enumeration_Resource_Type,
     Annotation_Enumeration_Value_Specification,
     Annotation_Integer_Resource_Value,
     Annotation_Pixel_Resource_Value,
     Annotation_Pixmap_Resource_Value,
     Annotation_Screen_Resource_Value,
     Annotation_Translation_Data_Resource_Value,
     Annotation_Widget_Instance,
     Annotation_Widget_Reference_Resource_Value,
     Annotation_Xm_String_Resource_Value);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
   record
      case Kind is
         when Annotation_Colormap_Resource_Value
           | Annotation_Enumeration_Resource_Value
           | Annotation_Integer_Resource_Value
           | Annotation_Pixel_Resource_Value
           | Annotation_Pixmap_Resource_Value
           | Annotation_Screen_Resource_Value
           | Annotation_Translation_Data_Resource_Value
           | Annotation_Widget_Reference_Resource_Value
           | Annotation_Xm_String_Resource_Value
         =>
            Use_In_Program  : Widget;  --  Кнопка "использовать в программе".
            Hard_Code       : Widget;  --  Кнопка "вшивать в код".
            Fallback        : Widget;  --  Кнопка "ресурс отката".
            Name            : Widget;  --  Название ресурса
            Value           : Widget;  --  Значение ресурса

         when Annotation_Enumeration_Resource_Type       =>
            RT_Menu : Widget;
            --  Выпадающее меню, используемое в меню опций значения ресурса.

         when Annotation_Enumeration_Value_Specification =>
            VS_Button : Widget;
            --  Кнопка выпадающего меню, используемого в меню опций значения
            --  ресурса.

         when Annotation_Widget_Instance                 =>
            WI_Child_Menu    : Widget;
            --  Выпадающее меню, используемое в меню опций значения ресурса.

            WI_Button        : Widget;
            --  Кнопка выпадающего меню, используемого в меню опций значения
            --  ресурса.

            Create_In_Record : Widget;  --  Создавать элемент записи.
            In_Record_Name   : Widget;  --  Имя элемента записи.
         when Annotation_Empty                           =>
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

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Menu
   --!    <Purpose> функция возвращает виджет всплывающего меню.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Get_Menu (Node : in Node_Id) return Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Button
   --!    <Purpose> функция возвращает виджет злемента всплывающего меню.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Get_Button (Node : in Node_Id) return Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Callback_Type
   --!    <Purpose> Возвращает признак, из какой вкладки была вызвана callback
   --! функция. 0 - ресурсы, 1- ограничения.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Get_Callback_Type (The_Widget : in Widget) return Integer;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Button
   --!    <Purpose> Устанавливает значение для элемента меню.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Button (Node : in Node_Id; Value : in Widget);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Button
   --!    <Purpose> Устанавливает значение для меню.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Menu (Node : in Node_Id; Value : in Widget);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Annotation_Table
   --!    <Purpose> Производит расширение таблицы для обеспечения возможности
   --! её использования для указанного узла. Все добавленные элементы
   --! инициализируются значениями по умолчанию.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table (Node : in Node_Id);

   package Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Create_In_Record_Changed
      --!    <Purpose> Подпрограмма обратного вызова при изменении состояния
      --! флага "create_in_record".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Create_In_Record_Changed (The_Widget : in Widget;
                                             Closure    : in Xt_Pointer;
                                             Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Create_In_Record_Changed);

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
      --!    <Unit> On_In_Record_Name_Activate
      --!    <Purpose> Подпрограмма обратного вызова при активации поля
      --! ввода имени переменной.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_In_Record_Name_Activate (The_Widget : in Widget;
                                            Closure    : in Xt_Pointer;
                                            Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_In_Record_Name_Activate);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Is_Managed_Changed
      --!    <Purpose> Подпрограмма обратного вызова при изменении признака
      --! "Manage after create".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Is_Managed_Changed (The_Widget : in Widget;
                                       Closure    : in Xt_Pointer;
                                       Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Is_Managed_Changed);

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

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Xm_String_Activate
      --!    <Purpose> Подпрограмма обратного вызова при изменении значения
      --! поля ввода текстового значения.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Xm_String_Activate (The_Widget : in Widget;
                                       Closure    : in Xt_Pointer;
                                       Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Xm_String_Activate);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Widget_Name_Changed
      --!    <Purpose> Подпрограмма обратного вызова при
      --! изменении имени виджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Widget_Name_Changed (The_Widget : in Widget;
                                        Closure    : in Xt_Pointer;
                                        Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Widget_Name_Changed);
   end Callbacks;

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Create_In_Record_Changed
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Create_In_Record_Changed (The_Widget : in Widget;
                                             Closure    : in Xt_Pointer;
                                             Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Data : constant Xm_Toggle_Button_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);
         Node : Node_Id;
         Args : Xt_Arg_List (0 .. 0);

      begin
         --  Получаем узел, для которого вызван callback.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         --  При нажатии кнопки утанавливаем признак использования
         --  в программе переменной и формируем ее имя.

         if Data.Set = Xm_C_Set then
            Set_Create_In_Record (Node, True);

            if In_Record_Name (Node) = Null_String then
               declare
                  Name : constant Wide_String := Name_Image (Node);

               begin
                  Xm_Text_Field_Set_String_Wcs
                   (Annotation_Table.Table (Node).In_Record_Name, Name);

                  Set_In_Record_Name (Node, Store (Name));
               end;
            end if;

         --  При отпускаии кнопки запрещаем использование имени переменной
         --  и убираем имя.

         elsif Data.Set = Xm_C_Unset then
            Set_Create_In_Record (Node, False);

            Xm_Text_Field_Set_String_Wcs
             (Annotation_Table.Table (Node).In_Record_Name, "");
            Set_In_Record_Name (Node, Null_String);

         else
            raise Program_Error;
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Create_In_Record_Changed", E);
      end On_Create_In_Record_Changed;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Fallback_Cahnged
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Fallback_Changed (The_Widget : in Widget;
                                     Closure    : in Xt_Pointer;
                                     Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Data     : constant Xm_Toggle_Button_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);
         Args     : Xt_Arg_List (0 .. 0);
         Node     : Node_Id;
         Res_List : List_Id;
         Res_Node : Node_Id;

      begin
           --  Извлекаем узел ресурса.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         --  Получаем узел значения ресурса.

         case Get_Callback_Type (The_Widget) is
            when 0 =>
               Res_List := Resources (Parent_Node (Node));

            when 1 =>
               Res_List := Constraint_Resources (Parent_Node (Node));

            when others =>
               raise Program_Error;
         end case;

         Res_Node := Find_Resource_Value (Res_List,
                                          Resource_Specification (Node));


         if Data.Set = Xm_C_Set then
            Set_Is_Fallback (Res_Node, True);

         elsif Data.Set = Xm_C_Unset then
            Set_Is_Fallback (Res_Node, False);
         end if;

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
         Node     : Node_Id;
         Res_List : List_Id;
         Res_Node : Node_Id;

      begin
         --  Извлекаем узел ресурса.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         --  Получаем узел значения ресурса.

         case Get_Callback_Type (The_Widget) is
            when 0 =>
               Res_List := Resources (Parent_Node (Node));

            when 1 =>
               Res_List := Constraint_Resources (Parent_Node (Node));

            when others =>
               raise Program_Error;
         end case;

         Res_Node := Find_Resource_Value (Res_List,
                                          Resource_Specification (Node));

         Check_Sensitive  (Node);
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
      --!    <Unit> On_In_Record_Name_Activate
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_In_Record_Name_Activate (The_Widget : in Widget;
                                            Closure    : in Xt_Pointer;
                                            Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Args     : Xt_Arg_List (0 .. 0);
         Node     : Node_Id;
         Name     : constant Wide_String
           := Xm_Text_Field_Get_String_Wcs (The_Widget);

      begin
         --  Извлекаем узел ресурса.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         --  Если имя пустое, то убираем признак
         --  "создавать в записи".

         if Name = "" then
            Xm_Toggle_Button_Gadget_Set_State
             (Annotation_Table.Table (Node).Create_In_Record, False, True);

         --  Иначе задаем новое имя и если раньше кнопка
         --  "создавать в записи" небыла нажата, то нажимаем ее.

         else
            Set_In_Record_Name (Node, Store (Name));

            if not Create_In_Record (Node) then
               Xm_Toggle_Button_Gadget_Set_State
                (Annotation_Table.Table (Node).Create_In_Record, True, True);
            end if;
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_In_Record_Name_Activate", E);
      end On_In_Record_Name_Activate;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Is_Managed_Changed
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Is_Managed_Changed (The_Widget : in Widget;
                                Closure    : in Xt_Pointer;
                                Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Args : Xt_Arg_List (0 .. 0);
         Node : Node_Id;
         Data : constant Xm_Toggle_Button_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);

      begin
         --  Получаем значение текущего узла.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         if Data.Set = Xm_C_Unset then
            Set_Is_Managed (Node, False);

         elsif Data.Set = Xm_C_Set then
            Set_Is_Managed (Node, True);

         else
            raise Program_Error;
         end if;

         Main_Window.Update_Item (Node);
      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Is_Managed_Changed", E);
      end On_Is_Managed_Changed;

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
         Menu : Node_Id;
         Node : Node_Id;
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

         Set_Resource_Value (Node, Menu);
         Set_Is_Changed (Node, True);

         Visual_Editor.Set_Properties (Parent_Node (Node));
         Update_Item (Parent_Node (Node));

         if Resource_Value (Node) /= Menu then
            return;
         end if;

         --  Если значение не изменилось, то обновляем список ресурсов

         declare
            Res_List : List_Id;
            Res_Node : Node_Id;

         begin

            --  Получаем узел значения ресурса.

            case Get_Callback_Type (Xm_Get_Posted_From_Widget (The_Widget)) is
               when 0 =>
                  Res_List := Resources (Parent_Node (Node));

               when 1 =>
                  Res_List := Constraint_Resources (Parent_Node (Node));

               when others =>
                  raise Program_Error;
            end case;

            if Xm_Toggle_Button_Gadget_Get_State
                (Annotation_Table.Table (Node).Use_In_Program)
            then
               --  Если кнопка Use_In_Program  была нажата,
               --  то обновляем значение ресурса.

               if Menu /= Null_Node then
                  Res_Node := Find_Resource_Value
                               (Res_List,
                                Resource_Specification (Node));
                  Set_Resource_Value (Res_Node, Menu);

               else
                  Xm_Toggle_Button_Gadget_Set_State
                   (Annotation_Table.Table (Node).Use_In_Program,
                    False,
                    True);
               end if;

            elsif Menu /= Null_Node then
               --  Если кнопка Use_In_Program  не была нажата,
               --  то нажимаем ее (значение зобавится в callback-е).

               Xm_Toggle_Button_Gadget_Set_State
                (Annotation_Table.Table (Node).Use_In_Program,
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

         Node   : Node_Id;
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

            Set_Resource_Value (Node, Integer (Pos));
            Set_Is_Changed (Node, True);

            Visual_Editor.Set_Properties (Parent_Node (Node));
            Update_Item (Parent_Node (Node));


            if Resource_Value (Node) /= Integer (Pos) then
               return;
            end if;

            --  Если значение не изменилось, то обновляем список ресурсов.

            declare
               Res_List : List_Id;
               Res_Node : Node_Id;

            begin

               --  Получаем узел значения ресурса.

               case Get_Callback_Type (Xt_Parent (The_Widget)) is
                  when 0 =>
                     Res_List := Resources (Parent_Node (Node));

                  when 1 =>
                     Res_List := Constraint_Resources (Parent_Node (Node));

                  when others =>
                     raise Program_Error;
               end case;

               if Xm_Toggle_Button_Gadget_Get_State
                 (Annotation_Table.Table (Node).Use_In_Program)
               then
                  --  Если кнопка Use_In_Program  была нажата,
                  --  то обновляем значение ресурса.

                  Res_Node := Find_Resource_Value
                               (Res_List,
                                Resource_Specification (Node));
                  Set_Resource_Value (Res_Node, Integer (Pos));

               else
                  --  Если кнопка Use_In_Program  не была нажата,
                  --  то нажимаем ее (значение зобавится в callback-е).

                  Xm_Toggle_Button_Gadget_Set_State
                   (Annotation_Table.Table (Node).Use_In_Program,
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

         Data          : constant Xm_Toggle_Button_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);
         Node          : Node_Id;
         Args          : Xt_Arg_List (0 .. 0);
         Res_List      : List_Id;
         Res_Node      : Node_Id;
         Callback_Type : constant Integer := Get_Callback_Type (The_Widget);

      begin
         --  Получаем узел ресурса, который поменял значение.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         --  Получаем список ресурсов виджета.

         case Callback_Type is
            when 0 =>
               Res_List := Resources (Parent_Node (Node));

            when 1 =>
               Res_List := Constraint_Resources (Parent_Node (Node));

            when others =>
               raise Program_Error;
         end case;

         --  Если у виджета еще нет списка ресурсов,
         --  то его необходимо создать.

         if Res_List = Null_List then
            Res_List := New_List;

            case Callback_Type is
               when 0 =>
                  Set_Resources (Parent_Node (Node), Res_List);

               when 1 =>
                  Set_Constraint_Resources (Parent_Node (Node), Res_List);

               when others =>
                  raise Program_Error;
            end case;
         end if;

         Res_Node := Find_Resource_Value (Res_List,
                                          Resource_Specification (Node));

         Check_Sensitive (Node);
         --  Проверяем чувствительность кнопок.

         if Data.Set = Xm_C_Unset and Res_Node /= Null_Node then
            --  Если кнопка отжата, то удаляем ресурс из списка
            --  (если он там есть).

            Remove (Res_Node);

         elsif Data.Set = Xm_C_Set and Res_Node = Null_Node then
            --  Если кнопка нажата, то ресурс необходимо добавить
            --  (если его там нет).

            Res_Node := Create_Resource_Value_Copy (Node);
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

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Widget_Name_Changed
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Widget_Name_Changed (The_Widget : in Widget;
                                        Closure    : in Xt_Pointer;
                                        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Name : Name_Id;
         Node : Node_Id;
         Args : Xt_Arg_List (0 .. 0);

      begin
         --  Получаем значение текущего узла.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         Name := Enter (Xm_Text_Field_Get_String_Wcs (The_Widget));
         Set_Name (Node, Name);
         Main_Window.Update_Item (Node);

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Widget_Name_Changed", E);
      end On_Widget_Name_Changed;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Xm_String_Activate
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Xm_String_Activate (The_Widget : in Widget;
                                       Closure    : in Xt_Pointer;
                                       Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Args : Xt_Arg_List (0 .. 0);
         Node : Node_Id;
         Name : String_Id;

      begin
         --  Получаем значение узла, для которого вызвался callback.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         Name := Store (Xm_Text_Field_Get_String_Wcs (The_Widget));

         Set_Resource_Value (Node, Name);
         Set_Is_Changed (Node, True);

         Visual_Editor.Set_Properties (Parent_Node (Node));
         Update_Item (Parent_Node (Node));

         if Resource_Value (Node) /= Name then
            return;
         end if;

         --  Если значение не изменилось, то обновляем список ресурсов.

         declare
            Res_List : List_Id;
            Res_Node : Node_Id;

         begin

            --  Получаем узел значения ресурса.

            case Get_Callback_Type (The_Widget) is
               when 0 =>
                  Res_List := Resources (Parent_Node (Node));

               when others =>
                  raise Program_Error;
            end case;

            if Xm_Toggle_Button_Gadget_Get_State
                (Annotation_Table.Table (Node).Use_In_Program)
            then
               --  Если кнопка Use_In_Program  была нажата,
               --  то обновляем значение ресурса.

               Res_Node := Find_Resource_Value (Res_List,
                                                Resource_Specification (Node));
               Set_Resource_Value (Res_Node, Name);

            else
               --  Если кнопка Use_In_Program  не была нажата,
               --  то нажимаем ее (значение зобавится в callback-е).

               Xm_Toggle_Button_Gadget_Set_State
                  (Annotation_Table.Table (Node).Use_In_Program,
                  True,
                  True);
            end if;
         end;
      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Use_In_Program_Changed", E);
      end On_Xm_String_Activate;
   end Callbacks;

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
   function Create (Parent   : in Widget;
                    Arg_List : in Xt_Arg_List;
                    Node     : in Model.Node_Id)
     return Node_Properties_Editor_Access
   is
      pragma Assert (Node_Kind (Node) = Node_Widget_Instance);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Add_Ada_Names
      --!    <Purpose> Заполнение вкладки Ada.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Add_Ada_Names (Parent : in Widget);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Add_Resource
      --!    <Purpose> Добавляет на редактор свойств опимвние ресурса.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Add_Resource (Parent : in Widget; Node : in Node_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Add_Resource_List
      --!    <Purpose> Функция добавляет на форму значения из списка ресурсов.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Add_Resource_List (Parent : in Widget; List : in List_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Add_Ada_Name
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Add_Ada_Names (Parent : in Widget) is
         Form : Widget;
         Args : Xt_Arg_List (0 .. 5);

      begin
         Form := Xm_Create_Managed_Form (Parent, "form");

         --  Создание кнопки "Создавать член записи".

         Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (1), Xm_N_Top_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (2), Xm_N_Bottom_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (3), Xm_N_User_Data, Xt_Arg_Val (Node));
         Annotation_Table.Table (Node).Create_In_Record :=
           Xm_Create_Managed_Toggle_Button_Gadget (Form,
                                                   "create_in_record",
                                                   Args (0 .. 3));
         Xt_Add_Callback (Annotation_Table.Table (Node).Create_In_Record,
                          Xm_N_Value_Changed_Callback,
                          Callbacks.On_Create_In_Record_Changed'Access);

         --  Поле ввода имени элемента.

         Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Widget);
         Xt_Set_Arg (Args (1),
                     Xm_N_Left_Widget,
                     Annotation_Table.Table (Node).Create_In_Record);
         Xt_Set_Arg (Args (2), Xm_N_Right_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (3), Xm_N_Top_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (4), Xm_N_Bottom_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Args (5), Xm_N_User_Data, Xt_Arg_Val (Node));
         Annotation_Table.Table (Node).In_Record_Name :=
           Xm_Create_Managed_Text_Field (Form,
                                         "in_record_name",
                                         Args (0 .. 5));
         Xt_Add_Callback (Annotation_Table.Table (Node).In_Record_Name,
                          Xm_N_Activate_Callback,
                          Callbacks.On_In_Record_Name_Activate'Access);
         Xt_Add_Callback (Annotation_Table.Table (Node).In_Record_Name,
                          Xm_N_Losing_Focus_Callback,
                          Callbacks.On_In_Record_Name_Activate'Access);

         Xm_Toggle_Button_Gadget_Set_State
          (Annotation_Table.Table (Node).Create_In_Record,
           Create_In_Record (Node),
           True);

         if In_Record_Name (Node) /= Null_String then
            Xm_Text_Field_Set_String_Wcs
             (Annotation_Table.Table (Node).In_Record_Name,
              Image (In_Record_Name (Node)));
         end if;
      end Add_Ada_Names;

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
         Args     : Xt_Arg_List (0 .. 6);

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
                  (Internal_Resource_Name_Image
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
         Xm_String_Free (Name);

         --  Создание поля "значение ресурса".

         case Node_Kind (Res_Type) is
            when Node_Enumerated_Resource_Type =>
               Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Widget);
               Xt_Set_Arg (Args (1),
                           Xm_N_Left_Widget,
                           Annotation_Table.Table (Node).Name);
               Xt_Set_Arg (Args (2), Xm_N_Sub_Menu_Id, Get_Menu (Res_Type));
               Xt_Set_Arg (Args (3), Xm_N_User_Data, Xt_Arg_Val (Node));
               Annotation_Table.Table (Node).Value :=
                 Xm_Create_Managed_Option_Menu (Form,
                                                "resource_value",
                                                Args (0 .. 3));

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
               end case;

            when Node_Widget_Reference_Resource_Type =>
               declare
                  Menu : Widget := Null_Widget;

               begin
                  --  Если ресурс должен содержать список детей,
                  --  то получем его.

                  if Widget_Reference_Constraints
                      (Resource_Specification (Node))
                    = Child
                  then
                     Menu := Get_Menu (Parent_Node (Node));

                  --  Если ресурс должен содержать список братьев,
                  --  то получем его.

                  elsif Widget_Reference_Constraints
                       (Resource_Specification (Node))
                      = Parents_Child

                  then
                     Menu := Get_Menu (Parent_Node (Parent_Node (Node)));
                  end if;

                  --  Если есть хоть какое-то меню, то создаем его.

                  if Menu /= Null_Widget then
                     Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, Menu);
                     Xt_Set_Arg
                      (Args (1), Xm_N_Left_Attachment, Xm_Attach_Widget);
                     Xt_Set_Arg (Args (2),
                                 Xm_N_Left_Widget,
                                 Annotation_Table.Table (Node).Name);
                     Xt_Set_Arg
                      (Args (3), Xm_N_Right_Attachment, Xm_Attach_Form);
                     Xt_Set_Arg
                      (Args (4), Xm_N_Top_Attachment, Xm_Attach_Form);
                     Xt_Set_Arg
                      (Args (5), Xm_N_Bottom_Attachment, Xm_Attach_Form);
                     Xt_Set_Arg
                      (Args (6), Xm_N_User_Data, Xt_Arg_Val (Node));
                     Annotation_Table.Table (Node).Value :=
                       Xm_Create_Managed_Option_Menu
                        (Form, "widget_reference", Args (0 .. 6));
                  end if;
               end;
            when Node_Xm_String_Resource_Type =>
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
                  Xm_Create_Managed_Text_Field (Form,
                                                "resource_xm_string",
                                                Args (0 .. 5));
               Xt_Add_Callback (Annotation_Table.Table (Node).Value,
                                Xm_N_Activate_Callback,
                                Callbacks.On_Xm_String_Activate'Access);
               Xt_Add_Callback (Annotation_Table.Table (Node).Value,
                                Xm_N_Losing_Focus_Callback,
                                Callbacks.On_Xm_String_Activate'Access);
            when others =>
               null;
         end case;
      end Add_Resource;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Add_Resource_List
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Add_Resource_List (Parent : in Widget; List : in List_Id) is
         Aux : Node_Id;

      begin
         --  Заполнение ограничений.

         if List = Null_List then
            return;
         end if;

         Aux := First (List);

         while Aux /= Null_Node loop
            Add_Resource (Parent, Aux);
            --  Создание свойств ресурса.

            Aux := Next (Aux);
         end loop;

         --  Выравнивание полей ввода значений по вертикали. Выравнивание
         --  осуществляется с помощью вычисления значения ресурса
         --  XmNleftOffset виджета ввода данных на основании значения ширины
         --  виджета максимально широкого имени ресурса и ширины виджета
         --  текущего имени ресурса.

         declare
            Max_Width : Dimension := 0;
            Value     : Dimension;
            Args      : Xt_Arg_List (0 .. 0);
            SArgs     : Xt_Arg_List (0 .. 0);

         begin
            Xt_Set_Arg (Args (0), Xm_N_Width, Value'Address);

            Aux := First (List);

            while Aux /= Null_Node loop
               Xt_Get_Values
                (Annotation_Table.Table (Aux).Name, Args (0 .. 0));

               if Value > Max_Width then
                  Max_Width := Value;
               end if;

               Aux := Next (Aux);
            end loop;

            Aux := First (List);

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
      end Add_Resource_List;

      Result        : constant Widget_Instance_Properties_Editor_Access
        := new Widget_Instance_Properties_Editor (Node);
      Ada           : Widget;
      Args          : Xt_Arg_List (0 .. 7);
      Name          : Widget;
      Element       : Widget;
      Notebook      : Widget;
      Is_Managed    : Widget;
      Properties    : Widget;
      Constraints   : Widget;
      Callbacks_Tab : Widget;

   begin
      Result.Form := Xm_Create_Managed_Form (Parent, "subform", Arg_List);

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Right_Attachment, Xm_Attach_Position);
      Xt_Set_Arg (Args (2), Xm_N_Right_Position, Xt_Arg_Val (50));
      Xt_Set_Arg (Args (3), Xm_N_User_Data, Xt_Arg_Val (Node));
      Name := Xm_Create_Managed_Text_Field
               (Result.Form, "resource_name", Args (0 .. 3));
      Xm_Text_Field_Set_String_Wcs (Name, Name_Image (Node));
      Xt_Add_Callback (Name,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Widget_Name_Changed'Access);
      Xt_Add_Callback (Name,
                       Xm_N_Losing_Focus_Callback,
                       Callbacks.On_Widget_Name_Changed'Access);

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Top_Widget, Name);
      Xt_Set_Arg (Args (2), Xm_N_Right_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (3), Xm_N_Right_Widget, Name);
      Xt_Set_Arg (Args (4), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (5), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
      Xt_Set_Arg (Args (6), Xm_N_Bottom_Widget, Name);
      Element  := Xm_Create_Managed_Label_Gadget
                   (Result.Form, "name", Args (0 .. 6));

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Top_Widget, Name);
      Xt_Set_Arg (Args (2), Xm_N_Right_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (4), Xm_N_Left_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (3), Xm_N_Left_Widget, Name);
      Xt_Set_Arg (Args (5), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
      Xt_Set_Arg (Args (6), Xm_N_Bottom_Widget, Name);
      Xt_Set_Arg (Args (7), Xm_N_User_Data, Xt_Arg_Val (Node));
      Is_Managed :=
        Xm_Create_Managed_Toggle_Button_Gadget
         (Result.Form, "manage_after_create", Args (0 .. 7));
      Xt_Add_Callback (Is_Managed,
                       Xm_N_Value_Changed_Callback,
                       Callbacks.On_Is_Managed_Changed'Access);
      Xm_Toggle_Button_Gadget_Set_State (Is_Managed,
                                         Model.Tree.Is_Managed (Node),
                                         False);

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Top_Widget, Name);
      Xt_Set_Arg (Args (2), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (3), Xm_N_Right_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (4), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Notebook := Xm_Create_Managed_Notebook
                   (Result.Form, "notebook", Args (0 .. 4));

      --  Создаем вкладку "Свойства".

      Xt_Set_Arg (Args (0), Xm_N_Scrolling_Policy, Xm_Automatic);
      Element := Xm_Create_Managed_Scrolled_Window
                  (Notebook, "scrolled", Args (0 .. 0));

      --  Так как и Resources и Constraints используют одни и те же
      --  callback-функции, то необходимо различать когда вызов
      --  был инициирован из редактора ресурсов, или из редактора ограничений
      --  для этого в воджете RowColumn устанавливается значение User_Data
      --  0 - для ресурсов, 1 - для ограничений.
      --  Далее callback-функции читают поле User_Data их родителя
      --  (XmRowColumn) и в зависимости от возвращенного значения
      --  обращаются либо с списку ресурсов, либо к списку ограничений.

      Xt_Set_Arg (Args (0), Xm_N_User_Data, Xt_Arg_Val (0));
      Properties :=
        Xm_Create_Row_Column (Element, "row_column", Args (0 .. 0));

      Element    :=
        Xm_Create_Managed_Push_Button_Gadget (Notebook, "resources");

      --  Создаем вкладку "ограничения".

      Xt_Set_Arg (Args (0), Xm_N_Scrolling_Policy, Xm_Automatic);
      Element    :=
        Xm_Create_Managed_Scrolled_Window
         (Notebook, "scrolled", Args (0 .. 0));

      --  Так как и Resources и Constraints используют одни и те же
      --  callback-функции, то необходимо различать когда вызов
      --  был инициирован из редактора ресурсов, или из редактора ограничений
      --  для этого в воджете RowColumn устанавливается значение User_Data
      --  0 - для ресурсов, 1 - для ограничений.
      --  Далее callback-функции читают поле User_Data их родителя
      --  (XmRowColumn) и в зависимости от возвращенного значения
      --  обращаются либо с списку ресурсов, либо к списку ограничений.

      Xt_Set_Arg (Args (0), Xm_N_User_Data, Xt_Arg_Val (1));
      Constraints :=
        Xm_Create_Row_Column (Element, "row_column", Args (0 .. 0));
      Element     :=
        Xm_Create_Managed_Push_Button_Gadget (Notebook, "constraints");

      --  Создаем вкладку "функции обратного вызова".

      Xt_Set_Arg (Args (0), Xm_N_Scrolling_Policy, Xm_Automatic);
      Element       :=
        Xm_Create_Managed_Scrolled_Window
         (Notebook, "scrolled", Args (0 .. 0));
      Callbacks_Tab :=
        Xm_Create_Row_Column (Element, "row_column");

      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (Notebook, "callbacks");

      --  Создаем вкладку "Привязки Ада".

      Xt_Set_Arg (Args (0), Xm_N_Scrolling_Policy, Xm_Automatic);
      Element       :=
        Xm_Create_Managed_Scrolled_Window
          (Notebook, "scrolled", Args (0 .. 0));
      Ada           :=
        Xm_Create_Row_Column (Element, "row_column");

      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (Notebook, "ada");

      --  Заполнение редактора свойств значениями ресурсов.

      Add_Resource_List (Properties, All_Resources (Node));
      Add_Resource_List (Constraints, All_Constraint_Resources (Node));
      Add_Ada_Names (Ada);

      Update_Item (Node);
      --  Задаем значение ресурсов.

      Xt_Manage_Child (Properties);
      Xt_Manage_Child (Constraints);
      Xt_Manage_Child (Callbacks_Tab);
      Xt_Manage_Child (Ada);

      return Node_Properties_Editor_Access (Result);
   end Create;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Finalize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Finalize (Object : in out Widget_Instance_Properties_Editor) is
   begin
      Xt_Destroy_Widget (Object.Form);
   end Finalize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Button
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Button (Node : in Node_Id) return Widget is
      pragma Assert
       (Node_Kind (Node) = Node_Widget_Instance
        or Node_Kind (Node) = Node_Enumeration_Value_Specification);

   begin
      case Node_Kind (Node) is
         when Node_Widget_Instance                 =>
            return Annotation_Table.Table (Node).WI_Button;

         when Node_Enumeration_Value_Specification =>
            return Annotation_Table.Table (Node).VS_Button;

         when others                               =>
            raise Program_Error;

      end case;
   end Get_Button;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Callback_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Callback_Type (The_Widget : in Widget) return Integer is
      pragma Assert (Xm_Is_Row_Column (Xt_Parent (Xt_Parent (The_Widget))));
      --  Первый предок - форма, второй - RowColumn.

      Value : Xt_Arg_Val;
      Args  : Xt_Arg_List (0 .. 0);

   begin
      --  В ресурсе User_Data содержится код вкладки.
      --  0 - вкладка ресурсов, 1 - вкладка ограничений.

      Xt_Set_Arg (Args (0), Xm_N_User_Data, Value'Address);
      Xt_Get_Values (Xt_Parent (Xt_Parent (The_Widget)), Args (0 .. 0));

      return Integer (Value);
   end Get_Callback_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Menu
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Menu (Node : in Node_Id) return Widget is
      pragma Assert
       (Node_Kind (Node) = Node_Widget_Instance
        or Node_Kind (Node) = Node_Enumerated_Resource_Type);

   begin
      case Node_Kind (Node) is
         when Node_Widget_Instance                 =>
            return Annotation_Table.Table (Node).WI_Child_Menu;

         when Node_Enumerated_Resource_Type        =>
            return Annotation_Table.Table (Node).RT_Menu;

         when others                               =>
            raise Program_Error;

      end case;
   end Get_Menu;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Hide
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Hide (Object : access Widget_Instance_Properties_Editor) is
   begin
      Xt_Unmanage_Child (Object.Form);
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
               Menu          : Widget;

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

                        Menu := Xm_Create_Pulldown_Menu
                                 (Properties_Parent, "resourcetype_menu");
                        Set_Menu (Current_Type, Menu);

                        Xt_Add_Callback (Menu,
                                         Xm_N_Entry_Callback,
                                         Callbacks.On_Menu_Entry'Access);

                        --  Задание списков возможных значений для каждого меню
                        --  элемента типа ресурсов.

                        Current_Value :=
                          First (Value_Specifications (Current_Type));

                        while Current_Value /= Null_Node loop
                           Relocate_Annotation_Table (Current_Value);

                           Str :=
                             Xm_String_Generate
                              (Internal_Name_Image (Current_Value));
                           Xt_Set_Arg (Argl (0), Xm_N_Label_String, Str);
                           Xt_Set_Arg (Argl (1),
                                       Xm_N_User_Data,
                                       Xt_Arg_Val (Current_Value));
                           Set_Button
                            (Current_Value,
                             Xm_Create_Managed_Push_Button_Gadget
                              (Get_Menu (Current_Type),
                               "value",
                               Argl (0 .. 1)));
                           Xm_String_Free (Str);

                           Current_Value := Next (Current_Value);
                        end loop;
                     end if;

                     Current_Type := Next (Current_Type);
                  end loop;

                  Current_Set := Next (Current_Set);
               end loop;
            end;

         when Node_Widget_Instance =>
            declare
               Args        : Xt_Arg_List (0 .. 1);
               Name        : Xm_String;
               Button      : Widget;
               Menu        : Widget;

            begin
               --  Создаем меню.

               Menu := Xm_Create_Pulldown_Menu
                        (Properties_Parent, "widget_child");
               Set_Menu (Node, Menu);

               Xt_Add_Callback (Menu,
                                Xm_N_Entry_Callback,
                                Callbacks.On_Menu_Entry'Access);

               --  Добавляем в меню ссылку на "пустой" виджет.

               Xt_Set_Arg (Args (0), Xm_N_User_Data, Xt_Arg_Val (Null_Node));
               Button := Xm_Create_Managed_Push_Button_Gadget
                          (Menu, "no_widget", Args (0 .. 0));

               --  Если виджет является дочерним, то добавляем его в
               --  меню родителя.

               if Node_Kind (Parent_Node (Node)) = Node_Widget_Instance then
                  Menu := Get_Menu (Parent_Node (Node));
                  Name := Xm_String_Generate (Name_Image (Node));
                  Xt_Set_Arg (Args (0), Xm_N_Label_String, Name);
                  Xt_Set_Arg
                   (Args (1), Xm_N_User_Data, Xt_Arg_Val (Node));
                  Button := Xm_Create_Managed_Push_Button_Gadget
                             (Menu, "widget_instance", Args (0 .. 1));

                  pragma Assert (Get_Button (Node) = Null_Widget);

                  Set_Button (Node, Button);
                  Xm_String_Free (Name);
               end if;
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
            when Annotation_Enumeration_Resource_Type       =>
               if Get_Menu (J) /= Null_Widget then
                  Xt_Destroy_Widget (Get_Menu (J));
               end if;

            when Annotation_Enumeration_Value_Specification =>
               if Get_Button (J) /= Null_Widget then
                  Xt_Destroy_Widget (Get_Button (J));
               end if;

            when Annotation_Widget_Instance                 =>
               if Get_Button (J) /= Null_Widget then
                  Xt_Destroy_Widget (Get_Button (J));
               end if;

               if Get_Menu (J) /= Null_Widget then
                  Xt_Destroy_Widget (Get_Menu (J));
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
                (Kind    => Annotation_Enumeration_Resource_Type,
                 RT_Menu => Null_Widget);

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
                (Kind      => Annotation_Enumeration_Value_Specification,
                 VS_Button => Null_Widget);

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

            when Node_Widget_Instance                 =>
               Annotation_Table.Table (J) :=
                (Kind             => Annotation_Widget_Instance,
                 WI_Child_Menu    => Null_Widget,
                 WI_Button        => Null_Widget,
                 Create_In_Record => Null_Widget,
                 In_Record_Name   => Null_Widget);

            when Node_Xm_String_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind           => Annotation_Xm_String_Resource_Value,
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
   --!    <Unit> Set_Button
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Button (Node : in Node_Id; Value : in Widget) is
      pragma Assert
       (Node_Kind (Node) = Node_Widget_Instance
        or Node_Kind (Node) = Node_Enumeration_Value_Specification);

   begin
      case Node_Kind (Node) is
         when Node_Widget_Instance                 =>
            Annotation_Table.Table (Node).WI_Button := Value;

         when Node_Enumeration_Value_Specification =>
            Annotation_Table.Table (Node).VS_Button := Value;

         when others                               =>
            raise Program_Error;

      end case;
   end Set_Button;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Menu
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Menu (Node : in Node_Id; Value : in Widget) is
      pragma Assert
       (Node_Kind (Node) = Node_Widget_Instance
        or Node_Kind (Node) = Node_Enumerated_Resource_Type);

   begin
      case Node_Kind (Node) is
         when Node_Widget_Instance                 =>
            Annotation_Table.Table (Node).WI_Child_Menu := Value;

         when Node_Enumerated_Resource_Type =>
            Annotation_Table.Table (Node).RT_Menu := Value;

         when others                               =>
            raise Program_Error;

      end case;
   end Set_Menu;

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
   begin
      Xt_Manage_Child (Object.Form);
   end Show;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Node_Id)
   is
      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> In_Resources
      --!    <Purpose> Определяет, находится ли ресурс Node в списке
      --! ресурсов воджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      function In_Resources (Curr_Res : in List_Id;
                             Node     : in Node_Id)
        return Node_Id;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Update_Resource
      --!    <Purpose> Обновляет значения ресурсов на форме.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Update_Resource (All_Res  : in List_Id;
                                 Curr_Res : in List_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> function_name
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function In_Resources (Curr_Res : in List_Id;
                             Node     : in Node_Id)
        return Node_Id
      is
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

      procedure Update_Resource (All_Res  : in List_Id;
                                 Curr_Res : in List_Id)
      is
         Current   : Node_Id;
         Res_Type  : Node_Id;
         Local_Res : Node_Id;
         Args      : Xt_Arg_List (0 .. 0);

      begin
         --  Если нет текущих ресурсов, то выходим.

         if  All_Res = Null_List then
            return;
         end if;

         Current := First (All_Res);

         --  Находим имеющиеся ресурсы и устанавливаем влажок
         --  Use_In_Program.

         while Current /= Null_Node loop
            Local_Res := In_Resources (Curr_Res, Current);

            if Local_Res /= Null_Node then
               Xt_Set_Arg (Args (0), Xm_N_Set, Xm_Set);
               Xt_Set_Values
                (Annotation_Table.Table (Current).Use_In_Program,
                 Args (0 .. 0));

               Xm_Toggle_Button_Gadget_Set_State
                (Annotation_Table.Table (Current).Hard_Code,
                 Is_Hardcoded (Local_Res),
                 False);

               Xm_Toggle_Button_Gadget_Set_State
                (Annotation_Table.Table (Current).Fallback,
                 Is_Fallback (Local_Res),
                 False);

               Check_Sensitive (Current);
            end if;

            Res_Type := Resource_Type (Resource_Specification (Current));

            --  Отображаем все остальные ресурсы.

            if Is_Changed (Current) then
               case Node_Kind (Res_Type) is
                  when Node_Enumerated_Resource_Type =>
                     Xt_Set_Arg (Args (0),
                                 Xm_N_Menu_History,
                                 Get_Button (Resource_Value (Current)));
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
                     end case;

                  when Node_Widget_Reference_Resource_Type =>
                     declare
                        Value : constant Node_Id
                          := Resource_Value (Current);

                     begin
                        if Value /= Null_Node then
                           Xt_Set_Arg (Args (0),
                                       Xm_N_Menu_History,
                                       Get_Button (Value));
                           Xt_Set_Values
                            (Annotation_Table.Table (Current).Value,
                             Args (0 .. 0));
                        end if;
                     end;

                  when Node_Xm_String_Resource_Type      =>
                     Xm_Text_Field_Set_String_Wcs
                      (Annotation_Table.Table (Current).Value,
                       Image (Resource_Value (Current)));

                  when others =>
                     raise Program_Error;
               end case;
            end if;

            Current := Next (Current);
         end loop;
      end Update_Resource;

   begin
      case Node_Kind (Node) is
         when Node_Widget_Instance =>
            Visual_Editor.Get_Properties (Node);

            Update_Resource (All_Resources (Node), Resources (Node));
            Update_Resource (All_Constraint_Resources (Node),
                             Constraint_Resources (Node));

         when others =>
            null;
      end case;
   end Update_Item;

end Designer.Properties_Editor.Widget_Instance;
