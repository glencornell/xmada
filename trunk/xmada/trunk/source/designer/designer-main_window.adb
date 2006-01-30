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
with Ada.Unchecked_Conversion;

with Xt.Ancillary_Types;
with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;
with Xm.Resource_Management;
with Xm.Traversal_Management;
with Xm_Arrow_Button_Gadget;
with Xm_Cascade_Button_Gadget;
with Xm_Form;
with Xm_Label_Gadget;
with Xm_Main_Window;
with Xm_Notebook;
with Xm_Paned_Window;
with Xm_Push_Button_Gadget;
with Xm_Row_Column;
with Xm_String_Defs;

with Designer.Properties_Editor;
with Designer.Tree_Editor;
with Designer.Visual_Editor;

package body Designer.Main_Window is

   use Xm;
   use Xm.Resource_Management;
   use Xm.Traversal_Management;
   use Xm_Arrow_Button_Gadget;
   use Xm_Cascade_Button_Gadget;
   use Xm_Form;
   use Xm_Label_Gadget;
   use Xm_Main_Window;
   use Xm_Notebook;
   use Xm_Paned_Window;
   use Xm_Push_Button_Gadget;
   use Xm_Row_Column;
   use Xm_String_Defs;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;

   function To_Closure is
     new Ada.Unchecked_Conversion (Widget, Xt_Pointer);

   function To_Implementation is
     new Ada.Unchecked_Conversion (Xt_Pointer, Widget);

   package Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Message_Hide_Button
      --!    <Purpose> Подпрограмма обратного вызова
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Hide_Button (The_Widget : in Widget;
                                Closure    : in Xt_Pointer;
                                Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Hide_Button);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Show_Button
      --!    <Purpose> Подпрограмма обратного вызова
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Show_Button (The_Widget : in Widget;
                                Closure    : in Xt_Pointer;
                                Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Show_Button);

   end Callbacks;

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Hide_Button
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Hide_Button (The_Widget : in Widget;
                                Closure    : in Xt_Pointer;
                                Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Show : constant Widget := To_Implementation (Closure);
         Aux  : Boolean;

      begin
         Xt_Unmanage_Child (Xt_Parent (The_Widget));
         Xt_Manage_Child (Show);

         Aux := Xm_Process_Traversal (Show, Xm_Traverse_Current);
         --  Для удобства использования с клавиатуры после отображения
         --  виджета передаём ему фокус клавиатурного ввода.

      exception
         when E : others =>
            null;
      end On_Hide_Button;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Hide_Button
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Show_Button (The_Widget : in Widget;
                                Closure    : in Xt_Pointer;
                                Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Show : constant Widget := To_Implementation (Closure);
         Aux  : Boolean;

      begin
         Xt_Unmanage_Child (The_Widget);
         Xt_Manage_Child (Show);

         Aux := Xm_Process_Traversal (Show, Xm_Traverse_Current);
         --  Для удобства использования с клавиатуры после отображения
         --  виджета передаём ему фокус клавиатурного ввода.

      exception
         when E : others =>
            null;
      end On_Show_Button;

   end Callbacks;

   Status_Bar : Xt.Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize (App_Shell : in Xt.Widget) is
      Properties_Form : Widget;
      Tree_Form       : Widget;
      Main_Window     : Widget;
      Args            : Xt_Arg_List (0 .. 5);
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
      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (File_Pulldown, "open");
      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (File_Pulldown, "save");
      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (File_Pulldown, "save_as");
      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (File_Pulldown, "close");
      Element       :=
        Xm_Create_Managed_Push_Button_Gadget (File_Pulldown, "quit");

      Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id,File_Pulldown);

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
                       Callbacks.On_Show_Button'Access,
                       To_Closure (Properties_Form));

      --  Создание кнопки скрытия панели редактирования свойств.

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment,   Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Right_Attachment, Xm_Attach_Form);
      Button :=
        Xm_Create_Managed_Arrow_Button_Gadget
         (Properties_Form, "properties_hide", Args (0 .. 1));
      Xt_Add_Callback (Button,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Hide_Button'Access,
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
                       Callbacks.On_Show_Button'Access,
                       To_Closure (Message_Form));

      --  Создание кнопки скрытия панели сообщений.

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment,   Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Right_Attachment, Xm_Attach_Form);
      Button :=
        Xm_Create_Managed_Arrow_Button_Gadget
         (Message_Form, "message_hide", Args (0 .. 1));
      Xt_Add_Callback (Button,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Hide_Button'Access,
                       To_Closure (Show_Messages));

      --
      --  Создание панели редактирования дерева.
      --

      Tree_Form       := Xm_Create_Managed_Form (Paned, "tree_form");

      --  Создание кнопки отображения панели дерева.
      --  Для унификации механизма скрытия/отображения панели кнопка создаётся
      --  как самостоятельная панель.

      Show_Tree := Xm_Create_Arrow_Button_Gadget (Paned, "tree_show");
      Xt_Add_Callback (Show_Tree,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Show_Button'Access,
                       To_Closure (Tree_Form));

      --  Создание кнопки скрытия панели дерева.

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment,  Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Left_Attachment, Xm_Attach_Form);
      Button :=
        Xm_Create_Managed_Arrow_Button_Gadget
         (Tree_Form, "tree_hide", Args (0 .. 1));
      Xt_Add_Callback (Button,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Hide_Button'Access,
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
   --!    <Unit> Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id) is
   begin
      Designer.Tree_Editor.Select_Item (Node);
      Designer.Visual_Editor.Select_Item (Node);
      Designer.Properties_Editor.Select_Item (Node);
   end Select_Item;

end Designer.Main_Window;
