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
--! <Unit> Designer.Main_Window
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Characters.Wide_Latin_1;
with Ada.Strings.Wide_Unbounded;
with Ada.Unchecked_Conversion;
with Interfaces.C;

with Xt.Ancillary_Types;
with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;
with Xt.Utilities;
with Xm.Class_Management;
with Xm.Resource_Management;
with Xm.Strings;
with Xm.Traversal_Management;
with Xm.Utilities;
with Xm_Arrow_Button_Gadget;
with Xm_Cascade_Button_Gadget;
with Xm_File_Selection_Box;
with Xm_Form;
with Xm_Label_Gadget;
with Xm_Main_Window;
with Xm_Notebook;
with Xm_Paned_Window;
with Xm_Push_Button_Gadget;
with Xm_Row_Column;
with Xm_String_Defs;
with Xm_Text;

with Designer.Operations;
with Designer.Properties_Editor;
with Designer.Tree_Editor;
with Designer.Visual_Editor;

package body Designer.Main_Window is

   use Ada.Strings.Wide_Unbounded;
   use Interfaces.C;
   use Xm;
   use Xm.Class_Management;
   use Xm.Resource_Management;
   use Xm.Strings;
   use Xm.Traversal_Management;
   use Xm.Utilities;
   use Xm_Arrow_Button_Gadget;
   use Xm_Cascade_Button_Gadget;
   use Xm_File_Selection_Box;
   use Xm_Form;
   use Xm_Label_Gadget;
   use Xm_Main_Window;
   use Xm_Notebook;
   use Xm_Paned_Window;
   use Xm_Push_Button_Gadget;
   use Xm_Row_Column;
   use Xm_String_Defs;
   use Xm_Text;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;
   use Xt.Utilities;

   function To_Closure is new Ada.Unchecked_Conversion (Widget, Xt_Pointer);

   function To_Widget is new Ada.Unchecked_Conversion (Xt_Pointer, Widget);

   package Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Open_File
      --!    <Purpose> Подпрограмма обратного вызова вызывается при нажатии
      --! клавиши OK/Cancel в диалоге открытия файла.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Open_File (The_Widget : in Widget;
                              Closure    : in Xt_Pointer;
                              Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Open_File);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_New
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! создания файла.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_New (The_Widget : in Widget;
                        Closure    : in Xt_Pointer;
                        Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_New);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Open
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! открытия файла.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Open (The_Widget : in Widget;
                         Closure    : in Xt_Pointer;
                         Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Open);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Save
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! сохранения файла.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Save (The_Widget : in Widget;
                         Closure    : in Xt_Pointer;
                         Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Save);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Save_As
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! сохранения под другим именем.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Save_As (The_Widget : in Widget;
                            Closure    : in Xt_Pointer;
                            Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Save_As);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Save_File
      --!    <Purpose> Подпрограмма обратного вызова вызывается при нажатии
      --! клавиши OK/Cancel в диалоге сохранения файла.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Save_File (The_Widget : in Widget;
                              Closure    : in Xt_Pointer;
                              Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Save_File);


      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Close
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! закрытия файла.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Close (The_Widget : in Widget;
                          Closure    : in Xt_Pointer;
                          Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Close);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Exit
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! выхода из программы.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Exit (The_Widget : in Widget;
                         Closure    : in Xt_Pointer;
                         Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Exit);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Message_Hide_Show_Button
      --!    <Purpose> Подпрограмма обратного вызова
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Hide_Show_Button (The_Widget : in Widget;
                                     Closure    : in Xt_Pointer;
                                     Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Hide_Show_Button);

   end Callbacks;

   Status_Bar     : Widget;
   Open_Dialog    : Widget;
   Save_Dialog    : Widget;
   Message_Text   : Widget;
   Message_Buffer : Ada.Strings.Wide_Unbounded.Unbounded_Wide_String;

   ---------------
   -- Callbacks --
   ---------------

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Close
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Close (The_Widget : in Widget;
                          Closure    : in Xt_Pointer;
                          Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Operations.Save_Project;
         Operations.New_Project;
      exception
         when E : others =>
            null;
      end On_Close;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Exit
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Exit (The_Widget : in Widget;
                         Closure    : in Xt_Pointer;
                         Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Operations.Save_Project;
         Xt_App_Set_Exit_Flag (Xt_Widget_To_Application_Context (The_Widget));
      exception
         when E : others =>
            null;
      end On_Exit;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Hide_Show_Button
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Hide_Show_Button (The_Widget : in Widget;
                                     Closure    : in Xt_Pointer;
                                     Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Show   : constant Widget := To_Widget (Closure);
         Parent : constant Widget := Xt_Parent (The_Widget);
         Aux    : Boolean;
         pragma Warnings (Off, Aux);

      begin
         if not Xm_Is_Paned_Window (Parent) then
            Xt_Unmanage_Child (Parent);
         else
            Xt_Unmanage_Child (The_Widget);
         end if;

         Xt_Manage_Child (Show);

         Aux := Xm_Process_Traversal (Show, Xm_Traverse_Current);
         --  Для удобства использования с клавиатуры после отображения
         --  виджета передаём ему фокус клавиатурного ввода.

      exception
         when E : others =>
            null;
      end On_Hide_Show_Button;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_New
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_New (The_Widget : in Widget;
                        Closure    : in Xt_Pointer;
                        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Operations.New_Project;
      exception
         when E : others =>
            null;
      end On_New;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Open
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Open (The_Widget : in Widget;
                         Closure    : in Xt_Pointer;
                         Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Xt_Manage_Child (Open_Dialog);
      exception
         when E : others =>
            null;
      end On_Open;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Open_File
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Open_File (The_Widget : in Widget;
                              Closure    : in Xt_Pointer;
                              Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Data      : constant Xm_File_Selection_Box_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);
         File_Name : constant Wide_String
           := Xm_String_Unparse (Data.Value);

      begin
         if Data.Reason = Xm_CR_Ok then
            Operations.Open_Project (File_Name);

         elsif Data.Reason = Xm_CR_Cancel then
            null;
         end if;

         Xt_Unmanage_Child (The_Widget);

      exception
         when E : others =>
            null;
      end On_Open_File;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Save
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Save (The_Widget : in Widget;
                         Closure    : in Xt_Pointer;
                         Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Operations.Save_Project;

      exception
         when E : others =>
            null;
      end On_Save;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Save_As
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Save_As (The_Widget : in Widget;
                            Closure    : in Xt_Pointer;
                            Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Xt_Manage_Child (Save_Dialog);
      exception
         when E : others =>
            null;
      end On_Save_As;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Open_File
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Save_File (The_Widget : in Widget;
                              Closure    : in Xt_Pointer;
                              Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Data      : constant Xm_File_Selection_Box_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);
         File_Name : constant Wide_String
           := Xm_String_Unparse (Data.Value);

      begin
         if Data.Reason = Xm_CR_Ok then
            Operations.Save_Project (File_Name);

         elsif Data.Reason = Xm_CR_Cancel then
            null;
         end if;

         Xt_Unmanage_Child (The_Widget);

      exception
         when E : others =>
            null;
      end On_Save_File;

   end Callbacks;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Delete_Item (Node : in Model.Node_Id) is
   begin
      Designer.Tree_Editor.Delete_Item (Node);
      Designer.Visual_Editor.Delete_Item (Node);
      Designer.Properties_Editor.Delete_Item (Node);
   end Delete_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize (App_Shell : in Xt.Widget) is
      use Callbacks;

      Properties_Form : Widget;
      Tree_Form       : Widget;
      Main_Window     : Widget;
      Args            : Xt_Arg_List (0 .. 6);
      Palette         : Widget;
      Paned           : Widget;
      Menu            : Widget;
      Paned1          : Widget;
      Message_Form    : Widget;
      Button          : Widget;
      Show_Properties : Widget;
      Show_Tree       : Widget;
      Show_Messages   : Widget;
      File_Pulldown   : Widget;
      Element         : Widget;

   begin
      --  Создание диалога открытия файлов.

      Open_Dialog  := Xm_Create_File_Selection_Dialog (App_Shell,
                                                       "open_file_dialog");
      Xt_Add_Callback (Open_Dialog, Xm_N_Ok_Callback, On_Open_File'Access);
      Xt_Add_Callback (Open_Dialog, Xm_N_Cancel_Callback, On_Open_File'Access);

      --  Создание диалога сохранения файлов.

      Save_Dialog  := Xm_Create_File_Selection_Dialog (App_Shell,
                                                      "save_file_dialog");
      Xt_Add_Callback (Save_Dialog, Xm_N_Ok_Callback, On_Save_File'Access);
      Xt_Add_Callback (Save_Dialog, Xm_N_Cancel_Callback, On_Save_File'Access);

      --  Создание основного окна приложения.

      Main_Window := Xm_Create_Managed_Main_Window (App_Shell, "main_window");
      Paned       :=
        Xm_Create_Managed_Paned_Window (Main_Window, "horizontal_paned");
      Status_Bar  :=
        Xm_Create_Managed_Label_Gadget (Main_Window, "status_bar");
      Palette     := Xm_Create_Managed_Notebook (Main_Window, "widget_set");

      --
      --  Создание главного меню.
      --

      Menu          := Xm_Create_Managed_Menu_Bar (Main_Window, "main_menu");
      File_Pulldown := Xm_Create_Pulldown_Menu (Menu, "file_pulldown");

      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (File_Pulldown, "new");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_New'Access);
      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (File_Pulldown, "open");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Open'Access);
      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (File_Pulldown, "save");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Save'Access);
      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (File_Pulldown, "save_as");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Save_As'Access);
      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (File_Pulldown, "close");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Close'Access);
      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (File_Pulldown, "quit");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Exit'Access);

      Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, File_Pulldown);

      Button :=
        Xm_Create_Managed_Cascade_Button_Gadget
         (Menu, "file", Args (0 .. 0));

      --
      --  Создание панели редактирования свойств.
      --

      Properties_Form := Xm_Create_Managed_Form (Paned, "properties_form");

      --  Создание кнопки отображения панели редактирования свойств.
      --  Для унификации механизма скрытия/отображения панели кнопка создаётся
      --  как самостоятельная панель.

      Show_Properties :=
        Xm_Create_Arrow_Button_Gadget (Paned, "properties_show");
      Xt_Add_Callback (Show_Properties,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Hide_Show_Button'Access,
                       To_Closure (Properties_Form));

      --  Создание кнопки скрытия панели редактирования свойств.

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment,   Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Right_Attachment, Xm_Attach_Form);
      Button :=
        Xm_Create_Managed_Arrow_Button_Gadget
         (Properties_Form, "properties_hide", Args (0 .. 1));
      Xt_Add_Callback (Button,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Hide_Show_Button'Access,
                       To_Closure (Show_Properties));

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Top_Widget, Button);
      Xt_Set_Arg (Args (2), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (3), Xm_N_Right_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (4), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Designer.Properties_Editor.Initialize (Properties_Form, Args (0 .. 4));

      --
      --  Создание панели визуального редактора и панели сообщений.
      --

      Paned1 := Xm_Create_Managed_Paned_Window (Paned, "vertical_paned");

      Designer.Visual_Editor.Initialize (Paned1);

      --  Создание панели сообщений.

      Message_Form := Xm_Create_Managed_Form (Paned1, "message_form");

      --  Создание кнопки отображения панели сообщений.
      --  Для унификации механизма скрытия/отображения панели кнопка создаётся
      --  как самостоятельная панель.

      Show_Messages := Xm_Create_Arrow_Button_Gadget (Paned1, "message_show");
      Xt_Add_Callback (Show_Messages,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Hide_Show_Button'Access,
                       To_Closure (Message_Form));

      --  Создание кнопки скрытия панели сообщений.

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment,   Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Right_Attachment, Xm_Attach_Form);
      Button :=
        Xm_Create_Managed_Arrow_Button_Gadget
         (Message_Form, "message_hide", Args (0 .. 1));
      Xt_Add_Callback (Button,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Hide_Show_Button'Access,
                       To_Closure (Show_Messages));

      --  Создание текстового поля отображения сообщений.

      Xt_Set_Arg (Args (0), Xm_N_Editable, Xt_False);
      Xt_Set_Arg (Args (1), Xm_N_Edit_Mode, Xm_Multi_Line_Edit);
      Xt_Set_Arg (Args (2), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (3), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (4), Xm_N_Right_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (5), Xm_N_Right_Widget, Button);
      Xt_Set_Arg (Args (6), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Message_Text :=
        Xm_Create_Managed_Scrolled_Text
         (Message_Form, "message_text", Args (0 .. 6));
      Xm_Text_Insert_Wcs
       (Message_Text,
        Xm_Text_Get_Last_Position (Message_Text),
        Ada.Strings.Wide_Unbounded.To_Wide_String (Message_Buffer));
      Xm_Text_Set_Insertion_Position
       (Message_Text, Xm_Text_Get_Last_Position (Message_Text));

      --
      --  Создание панели редактирования дерева.
      --

      Tree_Form := Xm_Create_Managed_Form (Paned, "tree_form");

      --  Создание кнопки отображения панели дерева.
      --  Для унификации механизма скрытия/отображения панели кнопка создаётся
      --  как самостоятельная панель.

      Show_Tree := Xm_Create_Arrow_Button_Gadget (Paned, "tree_show");
      Xt_Add_Callback (Show_Tree,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Hide_Show_Button'Access,
                       To_Closure (Tree_Form));

      --  Создание кнопки скрытия панели дерева.

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment,  Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Left_Attachment, Xm_Attach_Form);
      Button :=
        Xm_Create_Managed_Arrow_Button_Gadget
         (Tree_Form, "tree_hide", Args (0 .. 1));
      Xt_Add_Callback (Button,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Hide_Show_Button'Access,
                       To_Closure (Show_Tree));

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Top_Widget, Button);
      Xt_Set_Arg (Args (2), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (3), Xm_N_Right_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (4), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Designer.Tree_Editor.Initialize (Tree_Form, Args (0 .. 4));

      --
      --  Задаем атрибуты главного окна.
      --

      Xt_Set_Arg (Args (0), Xm_N_Command_Window, Palette);
      Xt_Set_Arg (Args (1), Xm_N_Message_Window, Status_Bar);
      Xt_Set_Values (Main_Window, Args (0 .. 1));

      Xt_Realize_Widget (App_Shell);
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id) is
   begin
      Designer.Tree_Editor.Insert_Item (Node);
      Designer.Visual_Editor.Insert_Item (Node);
      Designer.Properties_Editor.Insert_Item (Node);
   end Insert_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Put_Line
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Put_Line (Item : in Wide_String) is
   begin
      if Message_Text /= Null_Widget then
         Xm_Text_Insert_Wcs
          (Message_Text,
           Xm_Text_Get_Last_Position (Message_Text),
           Item & Ada.Characters.Wide_Latin_1.LF);
         Xm_Text_Set_Insertion_Position
          (Message_Text, Xm_Text_Get_Last_Position (Message_Text));
         Xm_Update_Display (Message_Text);

      else
         Ada.Strings.Wide_Unbounded.Append
          (Message_Buffer, Item & Ada.Characters.Wide_Latin_1.LF);
      end if;
   end Put_Line;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Reinitialize is
   begin
      Designer.Tree_Editor.Reinitialize;
      Designer.Visual_Editor.Reinitialize;
      Designer.Properties_Editor.Reinitialize;
   end Reinitialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id) is
   begin
      Designer.Tree_Editor.Select_Item (Node);
      Designer.Visual_Editor.Select_Item (Node);
      Designer.Properties_Editor.Select_Item (Node);
   end Select_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Model.Node_Id) is
   begin
      Designer.Tree_Editor.Update_Item (Node);
      Designer.Visual_Editor.Update_Item (Node);
      Designer.Properties_Editor.Update_Item (Node);
   end Update_Item;

end Designer.Main_Window;
