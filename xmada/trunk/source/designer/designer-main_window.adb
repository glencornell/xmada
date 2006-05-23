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
--! <Unit> Designer.Main_Window
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Characters.Handling;
with Ada.Characters.Wide_Latin_1;
with Ada.Strings.Wide_Unbounded;
with Ada.Unchecked_Conversion;

with Xt.Ancillary_Types;
with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;
with Xt.Utilities;
with Xm.Class_Management;
with Xm.Internal;
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
with Xm_Message_Box;
with Xm_Notebook;
with Xm_Paned_Window;
with Xm_Push_Button_Gadget;
with Xm_Row_Column;
with Xm_Separator_Gadget;
with Xm_String_Defs;
with Xm_Text;

with Designer.Model_Utilities;
with Designer.Operations.Debug;
with Designer.Palette;
with Designer.Properties_Editor;
with Designer.Render_Table_Editor;
with Designer.Tree_Editor;
with Designer.Visual_Editor;
with Model.Names;
with Model.Tree;

package body Designer.Main_Window is

   use Designer.Model_Utilities;
   use Model;
   use Model.Names;
   use Model.Tree;
   use Xm;
   use Xm.Class_Management;
   use Xm.Internal;
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
   use Xm_Message_Box;
   use Xm_Notebook;
   use Xm_Paned_Window;
   use Xm_Push_Button_Gadget;
   use Xm_Row_Column;
   use Xm_Separator_Gadget;
   use Xm_String_Defs;
   use Xm_Text;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;
   use Xt.Utilities;

   Selected_Item : Node_Id;
   Project_Node  : Node_Id;

   About_Dialog            : Widget;
   App_Shell_MW            : Widget;
   New_Component_Item      : Widget;
   No_Open_Dialog          : Widget;
   Delete_Application_Item : Widget;
   Delete_Component_Item   : Widget;
   File_Name_MW            : Xm_String;
   On_Exit_Flag            : boolean := False;

   Xm_C_New_Application    : constant := 1;
   Xm_C_New_Component      : constant := 2;
   Xm_C_Delete_Application : constant := 3;
   Xm_C_Delete_Component   : constant := 4;

   function To_Closure is new Ada.Unchecked_Conversion (Widget, Xt_Pointer);

   function To_Widget is new Ada.Unchecked_Conversion (Xt_Pointer, Widget);

   package Callbacks is
      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_About
      --!    <Purpose> Подпрограмма обратного вызова выборе элемента меню
      --! "О программе".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_About (The_Widget : in Widget;
                          Closure    : in Xt_Pointer;
                          Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_About);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_Exit_XmMessageBox_Ok
      --!    <Purpose> Подпрограмма обратного вызова вызывается при нажатии
      --! клавиши OK в диалоге подтверждения сохранения проекта.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Warning_On_Exit_XmMessageBox_Ok (The_Widget : in Widget;
                                                 Closure    : in Xt_Pointer;
                                                 Call_Data  : in Xt_Pointer);
      pragma Convention (C, Warning_On_Exit_XmMessageBox_Ok);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_Exit_XmMessageBox_Cancel
      --!    <Purpose> Подпрограмма обратного вызова вызывается при нажатии
      --! клавиши Cancel в диалоге подтверждения сохранения проекта.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Warning_On_Exit_XmMessageBox_Cancel
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer);
      pragma Convention (C, Warning_On_Exit_XmMessageBox_Cancel);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_Exit_XmMessageBox_Help
      --!    <Purpose> Подпрограмма обратного вызова вызывается при нажатии
      --! клавиши Help в диалоге подтверждения сохранения проекта.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Warning_On_Exit_XmMessageBox_Help
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer);
      pragma Convention (C, Warning_On_Exit_XmMessageBox_Help);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_New_Project_XmMessageBox_Ok
      --!    <Purpose> Подпрограмма обратного вызова вызывается при нажатии
      --! клавиши OK в диалоге подтверждения сохранения проекта.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Warning_On_New_Project_XmMessageBox_Ok
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer);
      pragma Convention (C, Warning_On_New_Project_XmMessageBox_Ok);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_New_Project_XmMessageBox_Cancel
      --!    <Purpose> Подпрограмма обратного вызова вызывается при нажатии
      --! клавиши Cancel в диалоге подтверждения сохранения проекта.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Warning_On_New_Project_XmMessageBox_Cancel
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer);
      pragma Convention (C, Warning_On_New_Project_XmMessageBox_Cancel);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_Open_Project_XmMessageBox_Ok
      --!    <Purpose> Подпрограмма обратного вызова вызывается при нажатии
      --! клавиши OK в диалоге подтверждения сохранения проекта.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Warning_On_Open_Project_XmMessageBox_Ok
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer);
      pragma Convention (C, Warning_On_Open_Project_XmMessageBox_Ok);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_Open_Project_XmMessageBox_Cancel
      --!    <Purpose> Подпрограмма обратного вызова вызывается при нажатии
      --! клавиши Cancel в диалоге подтверждения сохранения проекта.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Warning_On_Open_Project_XmMessageBox_Cancel
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer);
      pragma Convention (C, Warning_On_Open_Project_XmMessageBox_Cancel);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Open_File_Dialog_Ok_Or_Cancel
      --!    <Purpose> Подпрограмма обратного вызова вызывается при нажатии
      --! клавиши OK/Cancel в диалоге открытия файла.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Open_File_Dialog_Ok_Or_Cancel (The_Widget : in Widget;
                                                  Closure    : in Xt_Pointer;
                                                  Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Open_File_Dialog_Ok_Or_Cancel);

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
      --!    <Unit> On_Project_Activate
      --!    <Purpose> Подпрограмма обратного вызова при активации пункта меню
      --! project.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Project_Activate (The_Widget : in Widget;
                                     Closure    : in Xt_Pointer;
                                     Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Project_Activate);

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
      --!    <Unit> On_Save_File_As_Dialog_Ok_Or_Cancel
      --!    <Purpose> Подпрограмма обратного вызова вызывается при нажатии
      --! клавиши OK/Cancel в диалоге сохранения файла.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Save_File_As_Dialog_Ok_Or_Cancel
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Save_File_As_Dialog_Ok_Or_Cancel);

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
      --!    <Unit> On_Generate_Application_Resource_Files
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! генерации файлов ресурсов приложений.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Generate_Application_Resource_Files
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Generate_Application_Resource_Files);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Generate_Component_Classes_Code
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! генерации файлов ресурсов приложений.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Generate_Component_Classes_Code
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Generate_Component_Classes_Code);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Dump_Tree
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! создания дампа дерева модели.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Dump_Tree (The_Widget : in Widget;
                              Closure    : in Xt_Pointer;
                              Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Dump_Tree);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Tables_Statistics
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! вывода статистики использования таблиц.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Tables_Statistics (The_Widget : in Widget;
                                      Closure    : in Xt_Pointer;
                                      Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Tables_Statistics);

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

   Warning_On_Exit_XmMessageBox         : Widget;
   Warning_On_New_Project_XmMessageBox  : Widget;
   Warning_On_Open_Project_XmMessageBox : Widget;
   Status_Bar                           : Widget;
   Open_Dialog                          : Widget;
   Save_As_Dialog                       : Widget;
   Message_Text                         : Widget;
   Message_Buffer                       :
     Ada.Strings.Wide_Unbounded.Unbounded_Wide_String;
   --  Временный буфер для хранения текста диагностических сообщений,
   --  выводимых до фактического создания виджета отображения диагностических
   --  сообщений.

   ---------------
   -- Callbacks --
   ---------------

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_About
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_About (The_Widget : in Widget;
                          Closure    : in Xt_Pointer;
                          Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Xt_Manage_Child (About_Dialog);
      exception
         when E : others =>
            Put_Exception_In_Callback ("On_About", E);
      end On_About;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Dump_Tree
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Dump_Tree (The_Widget : in Widget;
                              Closure    : in Xt_Pointer;
                              Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Параметры требуются для соответствия профилю подпрограмм обратного
         --  вызова Xt, но в них нет фактической необходимости.

      begin
         Designer.Operations.Debug.Dump_Tree;

      exception
         when E : others =>
            Put_Exception_In_Callback ("On_Dump_Tree", E);
      end On_Dump_Tree;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_Exit_XmMessageBox_Ok
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Warning_On_Exit_XmMessageBox_Ok (The_Widget : in Widget;
                                                 Closure    : in Xt_Pointer;
                                                 Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         if Image (File_Name (Project_Node)) = Default_Project_Name
                                                 & Project_Extention
         then
            Child_Save_As_Dialog;
            On_Exit_Flag := True;

         else
            Operations.Save_Project;
            Xt_App_Set_Exit_Flag (Xt_Widget_To_Application_Context
                                   (The_Widget));
         end if;

      exception
         when E : others =>
            Put_Exception_In_Callback ("Warning_On_Exit_XmMessageBox_Ok", E);
      end Warning_On_Exit_XmMessageBox_Ok;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_Exit_XmMessageBox_Cancel
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Warning_On_Exit_XmMessageBox_Cancel
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Xt_App_Set_Exit_Flag (Xt_Widget_To_Application_Context (The_Widget));

      exception
         when E : others =>
            Put_Exception_In_Callback ("Cancel_On_Exitx", E);
      end Warning_On_Exit_XmMessageBox_Cancel;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_Exit_XmMessageBox_Help
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Warning_On_Exit_XmMessageBox_Help
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Xt_Unmanage_Child (Warning_On_Exit_XmMessageBox);

      exception
         when E : others =>
            Put_Exception_In_Callback ("Cancel_On_Help", E);
      end Warning_On_Exit_XmMessageBox_Help;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_New_Project_XmMessageBox_Ok
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Warning_On_New_Project_XmMessageBox_Ok
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Xt_Unmanage_Child (Warning_On_New_Project_XmMessageBox);

         if Image (File_Name (Project_Node)) = Default_Project_Name
                                                 & Project_Extention
         then
            Designer.Main_Window.Child_Save_As_Dialog;

         else
            Operations.Save_Project;
         end if;

         Operations.New_Project;

      exception
         when E : others =>
            Put_Exception_In_Callback
             ("Warning_On_New_Project_XmMessageBox_Ok", E);
      end Warning_On_New_Project_XmMessageBox_Ok;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_Open_Project_XmMessageBox_Cancel
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Warning_On_New_Project_XmMessageBox_Cancel
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Xt_Unmanage_Child (Warning_On_New_Project_XmMessageBox);
         Operations.New_Project;

      exception
         when E : others =>
            Put_Exception_In_Callback
             ("On_Open_Project_XmMessageBox_Cancel", E);
      end Warning_On_New_Project_XmMessageBox_Cancel;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_Open_Project_XmMessageBox_Ok
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Warning_On_Open_Project_XmMessageBox_Ok
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Xt_Unmanage_Child (Warning_On_Exit_XmMessageBox);
         Xt_Manage_Child (Open_Dialog);

         if File_Name_MW = Xm_String_Generate (Default_Project_Name
                                                 & Project_Extention)
         then
            Child_Save_As_Dialog;

         else
            Operations.Save_Project;
         end if;

      exception
         when E : others =>
            Put_Exception_In_Callback
             ("Warning_On_Open_Project_XmMessageBox_Ok", E);
      end Warning_On_Open_Project_XmMessageBox_Ok;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Warning_On_Open_Project_XmMessageBox_Cancel
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Warning_On_Open_Project_XmMessageBox_Cancel
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Xt_Unmanage_Child (Warning_On_Exit_XmMessageBox);
         Xt_Manage_Child (Open_Dialog);

      exception
         when E : others =>
            Put_Exception_In_Callback
             ("On_Open_Project_XmMessageBox_Cancel", E);
      end Warning_On_Open_Project_XmMessageBox_Cancel;

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
         Warning_On_Exit_XmMessageBox_Dialog;

      exception
         when E : others =>
            Put_Exception_In_Callback ("On_Exit", E);
      end On_Exit;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit>
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Generate_Application_Resource_Files
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Designer.Operations.Generate_Application_Resource_Files;

      exception
         when E : others =>
            Put_Exception_In_Callback
             ("On_Generate_Application_Resource_Files", E);
      end On_Generate_Application_Resource_Files;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit>
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Generate_Component_Classes_Code
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         Designer.Operations.Generate_Component_Classes_Code;

      exception
         when E : others =>
            Put_Exception_In_Callback
             ("On_Generate_Component_Classes_Code", E);
      end On_Generate_Component_Classes_Code;

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
            Put_Exception_In_Callback ("On_Hide_Show_Button", E);
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
         Warning_On_New_Project_XmMessageBox_Dialog;

      exception
         when E : others =>
            Put_Exception_In_Callback ("On_New", E);
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
         Warning_On_Open_Project_XmMessageBox_Dialog;

      exception
         when E : others =>
            Put_Exception_In_Callback ("On_Open", E);
      end On_Open;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Open_File_Dialog_Ok_Or_Cancel
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Open_File_Dialog_Ok_Or_Cancel (The_Widget : in Widget;
                                                  Closure    : in Xt_Pointer;
                                                  Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         use type Xm.Xm_Callback_Reason;

         Data      : constant Xm_File_Selection_Box_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);
         File_Name : constant Wide_String
           := Xm_String_Unparse (Data.Value);
         Aux : constant Natural := File_Name'Last;

      begin
         if Data.Reason = Xm_CR_Ok then
            if File_Name'Length > 4 then
               if File_Name (Aux - 3 .. Aux) = Main_Window.Project_Extention
               then
                  Operations.Open_Project (File_Name);

               else
                  No_Open_Dialog
                    := Xm_Create_Template_Dialog (App_Shell_MW, "no_open_dialog");
                  Xt_Manage_Child (No_Open_Dialog);
               end if;

            else
               No_Open_Dialog
                 := Xm_Create_Template_Dialog (App_Shell_MW, "no_open_dialog");
               Xt_Manage_Child (No_Open_Dialog);
            end if;

         elsif Data.Reason = Xm_CR_Cancel then
            null;

         else
            raise Program_Error;
         end if;

         Xt_Unmanage_Child (The_Widget);

      exception
         when E : others =>
            Put_Exception_In_Callback ("On_Open_File_Dialog_Ok_Or_Cancel", E);
      end On_Open_File_Dialog_Ok_Or_Cancel;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Project_Activate
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Project_Activate (The_Widget : in Widget;
                                     Closure    : in Xt_Pointer;
                                     Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Element : Integer := 0;
         Args    : Xt_Arg_List (0 .. 0);
         Data    : constant Xm_Row_Column_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);
         Current : constant Node_Id := Selected_Item;

      begin
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Element'Address);
         Xt_Get_Values (Data.Widget, Args (0 .. 0));

         if Element = Xm_C_New_Application then
            Operations.New_Application (Project_Node);

         else
            if Selected_Item = Null_Node then
               return;
            end if;

            if Element = Xm_C_New_Component then
               if Node_Kind (Selected_Item) = Node_Application then
                  Operations.New_Component (Selected_Item);
               end if;

            elsif Element = Xm_C_Delete_Application then
               if Node_Kind (Selected_Item) = Node_Application then
                  Main_Window.Select_Item (Null_Node);
                  Delete_Node (Current);
               end if;

            elsif Element = Xm_C_Delete_Component then
               if Node_Kind (Selected_Item) = Node_Component_Class then
                  Main_Window.Select_Item (Null_Node);
                  Delete_Node (Current);
               end if;
            end if;
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Project_Activate", E);
      end On_Project_Activate;

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
         if Image (File_Name (Project_Node)) = Default_Project_Name
                                                 & Project_Extention
         then
            Child_Save_As_Dialog;

         else
            Operations.Save_Project;
         end if;

      exception
         when E : others =>
            Put_Exception_In_Callback ("On_Save", E);
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
         Xt_Manage_Child (Save_As_Dialog);

      exception
         when E : others =>
            Put_Exception_In_Callback ("On_Save_As", E);
      end On_Save_As;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Save_File_As_Dialog_Ok_Or_Cancel
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Save_File_As_Dialog_Ok_Or_Cancel
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         use type Xm.Xm_Callback_Reason;

         Data      : constant Xm_File_Selection_Box_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);
         File_Name : constant Wide_String
           := Xm_String_Unparse (Data.Value);

      begin
         if Data.Reason = Xm_CR_Ok then
            Operations.Save_Project (File_Name);

         elsif Data.Reason = Xm_CR_Cancel then
            null;

         else
            raise Program_Error;
         end if;

         Xt_Unmanage_Child (The_Widget);

         if On_Exit_Flag then
            Xt_App_Set_Exit_Flag (Xt_Widget_To_Application_Context
                                   (The_Widget));
         end if;

      exception
         when E : others =>
            Put_Exception_In_Callback
             ("On_Save_File_As_Dialog_Ok_Or_Cancel", E);
      end On_Save_File_As_Dialog_Ok_Or_Cancel;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Tables_Statistics
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Tables_Statistics (The_Widget : in Widget;
                                      Closure    : in Xt_Pointer;
                                      Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Параметры требуются для соответствия профилю подпрограмм обратного
         --  вызова Xt, но в них нет фактической необходимости.

      begin
         Designer.Operations.Debug.Tables_Statistics;

      exception
         when E : others =>
            Put_Exception_In_Callback ("On_Tables_Statistics", E);
      end On_Tables_Statistics;

   end Callbacks;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Child_Save_As_Dialog
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Child_Save_As_Dialog is
   begin
      Xt_Manage_Child (Save_As_Dialog);
   end Child_Save_As_Dialog;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Delete_Item (Node : in Model.Node_Id) is
   begin
      Designer.Palette.Delete_Item (Node);
      Designer.Tree_Editor.Delete_Item (Node);
      Designer.Properties_Editor.Delete_Item (Node);
      Designer.Visual_Editor.Delete_Item (Node);
   end Delete_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_App_Shell
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_App_Shell return Xt.Widget
   is
   begin
      return App_Shell_MW;
   end Get_App_Shell;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize (App_Shell : in Xt.Widget) is
      use Callbacks;

      Properties_Form   : Widget;
      Tree_Form         : Widget;
      Main_Window       : Widget;
      Args              : Xt_Arg_List (0 .. 6);
      Palette           : Widget;
      Paned             : Widget;
      Menu              : Widget;
      Paned1            : Widget;
      Message_Form      : Widget;
      Button            : Widget;
      Show_Properties   : Widget;
      Show_Tree         : Widget;
      Show_Messages     : Widget;
      Submenu           : Widget;
      Element           : Widget;

   begin
      App_Shell_MW := App_Shell;

      --  Создание диалога "О программе".

      About_Dialog := Xm_Create_Template_Dialog (App_Shell, "about_dialog");

      --  Создание диалога редактирования элементов Render_Table.

      Designer.Render_Table_Editor.Initialize (App_Shell);

      --  Создание диалога открытия файлов.

      Open_Dialog :=
        Xm_Create_File_Selection_Dialog (App_Shell, "open_file_dialog");
      Xt_Add_Callback
       (Open_Dialog,
        Xm_N_Ok_Callback,
        On_Open_File_Dialog_Ok_Or_Cancel'Access);
      Xt_Add_Callback
       (Open_Dialog,
        Xm_N_Cancel_Callback,
        On_Open_File_Dialog_Ok_Or_Cancel'Access);

      --  Создание диалога сохранения файлов.

      Save_As_Dialog :=
        Xm_Create_File_Selection_Dialog (App_Shell, "save_file_as_dialog");
      Xt_Add_Callback
       (Save_As_Dialog,
        Xm_N_Ok_Callback,
        On_Save_File_As_Dialog_Ok_Or_Cancel'Access);
      Xt_Add_Callback
       (Save_As_Dialog,
        Xm_N_Cancel_Callback,
        On_Save_File_As_Dialog_Ok_Or_Cancel'Access);

      --  Создание основного окна приложения.

      Main_Window := Xm_Create_Managed_Main_Window (App_Shell, "main_window");
      Paned       :=
        Xm_Create_Managed_Paned_Window (Main_Window, "horizontal_paned");
      Status_Bar  :=
        Xm_Create_Managed_Label_Gadget (Main_Window, "status_bar");
      Palette     := Xm_Create_Managed_Notebook (Main_Window, "widget_sets");

      Button      := Xt_Name_To_Widget (Palette, "PageScroller");
      Xt_Unmanage_Child (Button);

      Designer.Palette.Initialize (Palette);

      --
      --  Создание главного меню.
      --

      Menu    := Xm_Create_Managed_Menu_Bar (Main_Window, "main_menu");
      Submenu := Xm_Create_Pulldown_Menu (Menu, "file_pulldown");

      Element :=
        Xm_Create_Managed_Push_Button_Gadget (Submenu, "new");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_New'Access);

      Element :=
        Xm_Create_Managed_Push_Button_Gadget (Submenu, "open");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Open'Access);

      Element :=
        Xm_Create_Managed_Push_Button_Gadget (Submenu, "save");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Save'Access);

      Element :=
        Xm_Create_Managed_Push_Button_Gadget (Submenu, "save_as");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Save_As'Access);

      Element :=
        Xm_Create_Managed_Separator_Gadget (Submenu, "separator");

      Element :=
        Xm_Create_Managed_Push_Button_Gadget (Submenu, "quit");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Exit'Access);

      Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, Submenu);
      Button :=
        Xm_Create_Managed_Cascade_Button_Gadget (Menu, "file", Args (0 .. 0));

      --  Меню генерации кода.

      Submenu := Xm_Create_Pulldown_Menu (Menu, "generate_menu");

      Element :=
        Xm_Create_Managed_Push_Button_Gadget
         (Submenu, "application_resource_files");
      Xt_Add_Callback
       (Element,
        Xm_N_Activate_Callback,
        Callbacks.On_Generate_Application_Resource_Files'Access);

      Element :=
        Xm_Create_Managed_Push_Button_Gadget
         (Submenu, "component_classes_code");
      Xt_Add_Callback
       (Element,
        Xm_N_Activate_Callback,
        Callbacks.On_Generate_Component_Classes_Code'Access);

      Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, Submenu);
      Button :=
        Xm_Create_Managed_Cascade_Button_Gadget
         (Menu, "generate", Args (0 .. 0));

      --  Меню отладки.

      Submenu := Xm_Create_Pulldown_Menu (Menu, "debug_menu");

      Element := Xm_Create_Managed_Push_Button_Gadget (Submenu, "dump_tree");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Dump_Tree'Access);

      Element :=
        Xm_Create_Managed_Push_Button_Gadget (Submenu, "tables_statistics");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Tables_Statistics'Access);

      Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, Submenu);
      Button :=
        Xm_Create_Managed_Cascade_Button_Gadget (Menu, "debug", Args (0 .. 0));

      --  Меню "Проект".

      Submenu := Xm_Create_Pulldown_Menu (Menu, "project_menu");
      Xt_Add_Callback (Submenu,
                       Xm_N_Entry_Callback,
                       Callbacks.On_Project_Activate'Access);

      Xt_Set_Arg
       (Args (0), Xm_N_User_Data, Xt_Arg_Val (Xm_C_New_Application));
      Element :=
        Xm_Create_Managed_Push_Button_Gadget
         (Submenu, "new_application", Args (0 .. 0));

      Xt_Set_Arg
       (Args (0), Xm_N_User_Data, Xt_Arg_Val (Xm_C_New_Component));
      New_Component_Item :=
        Xm_Create_Managed_Push_Button_Gadget
         (Submenu, "new_component", Args (0 .. 0));

      Xt_Set_Arg
       (Args (0), Xm_N_User_Data, Xt_Arg_Val (Xm_C_Delete_Application));
      Delete_Application_Item :=
        Xm_Create_Managed_Push_Button_Gadget
         (Submenu, "delete_application", Args (0 .. 0));

      Xt_Set_Arg
       (Args (0), Xm_N_User_Data, Xt_Arg_Val (Xm_C_Delete_Component));
      Delete_Component_Item :=
        Xm_Create_Managed_Push_Button_Gadget
         (Submenu, "delete_component", Args (0 .. 0));

      Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, Submenu);
      Button :=
        Xm_Create_Managed_Cascade_Button_Gadget
         (Menu, "project", Args (0 .. 0));

      --  Меню "О программе".

      Submenu := Xm_Create_Pulldown_Menu (Menu, "help_menu");

      Element := Xm_Create_Managed_Push_Button_Gadget (Submenu, "about");
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_About'Access);

      Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, Submenu);
      Button :=
        Xm_Create_Managed_Cascade_Button_Gadget (Menu, "help", Args (0 .. 0));

      Xt_Set_Arg (Args (0), Xm_N_Menu_Help_Widget, Button);
      Xt_Set_Values (Menu, Args (0 .. 0));

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

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Top_Widget, Button);
      Xt_Set_Arg (Args (2), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
      Xt_Set_Arg (Args (3), Xm_N_Bottom_Widget, Button);
      Xt_Set_Arg (Args (4), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (5), Xm_N_Right_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (6), Xm_N_Right_Widget, Button);
      Element := Xm_Create_Managed_Label_Gadget
                  (Properties_Form, "properties_label", Args (0 .. 6));

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

      --  Создание текстового виджета для вывода диагностических сообщений
      --  и загрузка в него всех накопленных диагностических сообщений.

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
      Xm_Text_Set_String_Wcs
       (Message_Text,
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

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Top_Widget, Button);
      Xt_Set_Arg (Args (2), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
      Xt_Set_Arg (Args (3), Xm_N_Bottom_Widget, Button);
      Xt_Set_Arg (Args (4), Xm_N_Right_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (5), Xm_N_Left_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (6), Xm_N_Left_Widget, Button);
      Element := Xm_Create_Managed_Label_Gadget
                  (Tree_Form, "tree_label", Args (0 .. 6));

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
      Designer.Palette.Insert_Item (Node);
      Designer.Tree_Editor.Insert_Item (Node);
      Designer.Visual_Editor.Insert_Item (Node);
      Designer.Properties_Editor.Insert_Item (Node);
      Designer.Render_Table_Editor.Insert_Item (Node);

      if Node_Kind (Node) = Node_Project then
         Project_Node := Node;
      end if;
   end Insert_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> XmAdaDesigner_title
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure XmAdaDesigner_title (File_Name : in Wide_String) is
      msg : Xm_String;

   begin
      File_Name_MW := Xm_String_Generate (File_Name);
      msg := Xm_String_Generate (Wide_String'(File_Name)
                                   & " - XmAda designer");
      msg := Xm_String_Create_Localized(Xm_String_Unparse(msg));
      Xme_Set_WM_Shell_Title (msg, App_Shell_MW);
   end XmAdaDesigner_title;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Warning_On_Exit_XmMessageBox_Dialog
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Warning_On_Exit_XmMessageBox_Dialog is
   begin
      -- Добавляем диалог подтверждения сохранения проекта.

      Warning_On_Exit_XmMessageBox
        := Xm_Create_Message_Dialog (App_Shell_MW,
                                     "warning_on_exit_xmmessageBox");
      Xt_Add_Callback
       (Warning_On_Exit_XmMessageBox,
        Xm_N_Ok_Callback,
        Callbacks.Warning_On_Exit_XmMessageBox_Ok'Access);
      Xt_Add_Callback
       (Warning_On_Exit_XmMessageBox,
        Xm_N_Cancel_Callback,
        Callbacks.Warning_On_Exit_XmMessageBox_Cancel'Access);
      Xt_Add_Callback
       (Warning_On_Exit_XmMessageBox,
        Xm_N_Help_Callback,
        Callbacks.Warning_On_Exit_XmMessageBox_Help'Access);
      Xt_Manage_Child (Warning_On_Exit_XmMessageBox);
   end Warning_On_Exit_XmMessageBox_Dialog;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Warning_On_Open_Project_XmMessageBox_Dialog
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Warning_On_Open_Project_XmMessageBox_Dialog is
      Args : Xt_Arg_List (0 .. 0);
      msg  : Xm_String;

   begin
      -- Добавляем диалог подтверждения сохранения проекта.

      msg := Xm_String_Create ("Save project?  "
                                 & Xm_String_Unparse(File_Name_MW));
      Xt_Set_Arg (Args (0), Xm_N_Message_String, msg);
      Warning_On_Open_Project_XmMessageBox
        := Xm_Create_Message_Dialog (App_Shell_MW,
                                     "Warning_On_Open_Project_XmMessageBox",
                                     Args);
      Xt_Add_Callback
       (Warning_On_Open_Project_XmMessageBox,
        Xm_N_Ok_Callback,
        Callbacks.Warning_On_Open_Project_XmMessageBox_Ok'Access);
      Xt_Add_Callback
       (Warning_On_Open_Project_XmMessageBox,
        Xm_N_Cancel_Callback,
        Callbacks.Warning_On_Open_Project_XmMessageBox_Cancel'Access);
      Xt_Manage_Child (Warning_On_Open_Project_XmMessageBox);
   end Warning_On_Open_Project_XmMessageBox_Dialog;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Warning_On_New_Project_XmMessageBox_Dialog
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Warning_On_New_Project_XmMessageBox_Dialog is
      Args : Xt_Arg_List (0 .. 0);
      msg  : Xm_String;

   begin
      -- Добавляем диалог подтверждения сохранения проекта.

      msg := Xm_String_Create ("Save project?  "
                                 & Xm_String_Unparse(File_Name_MW));
      Xt_Set_Arg (Args (0), Xm_N_Message_String, msg);
      Warning_On_New_Project_XmMessageBox
        := Xm_Create_Message_Dialog (App_Shell_MW,
                                     "Warning_On_New_Project_XmMessageBox",
                                     Args);
      Xt_Add_Callback
       (Warning_On_New_Project_XmMessageBox,
        Xm_N_Ok_Callback,
        Callbacks.Warning_On_New_Project_XmMessageBox_Ok'Access);
      Xt_Add_Callback
       (Warning_On_New_Project_XmMessageBox,
        Xm_N_Cancel_Callback,
        Callbacks.Warning_On_New_Project_XmMessageBox_Cancel'Access);
      Xt_Manage_Child (Warning_On_New_Project_XmMessageBox);
   end Warning_On_New_Project_XmMessageBox_Dialog;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Put_Exception_In_Callback
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Put_Exception_In_Callback
    (Name       : in Wide_String;
     Occurrence : in Ada.Exceptions.Exception_Occurrence)
   is
   begin
      Put_Line ("Unhandled exception in " & Name & ':');
      Put_Line
       (Ada.Characters.Handling.To_Wide_String
         (Ada.Exceptions.Exception_Information (Occurrence)));

      if Symbolic_Traceback_Hook /= null then
         Put_Line (Symbolic_Traceback_Hook (Occurrence));
      end if;
   end Put_Exception_In_Callback;

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
      Designer.Palette.Reinitialize;
      Designer.Tree_Editor.Reinitialize;
      Designer.Visual_Editor.Reinitialize;
      Designer.Properties_Editor.Reinitialize;
      Designer.Render_Table_Editor.Reinitialize;
   end Reinitialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id) is
   begin
      Designer.Palette.Select_Item (Node);
      Designer.Tree_Editor.Select_Item (Node);
      Designer.Visual_Editor.Select_Item (Node);
      Designer.Properties_Editor.Select_Item (Node);

      Selected_Item := Node;

      if Node = Null_Node then
         Xt_Set_Sensitive (New_Component_Item,      False);
         Xt_Set_Sensitive (Delete_Application_Item, False);
         Xt_Set_Sensitive (Delete_Component_Item,   False);

         return;
      end if;

      case Node_Kind (Node) is
         when Node_Project =>
            Xt_Set_Sensitive (New_Component_Item,      False);
            Xt_Set_Sensitive (Delete_Application_Item, False);
            Xt_Set_Sensitive (Delete_Component_Item,   False);

         when Node_Application =>
            Xt_Set_Sensitive (New_Component_Item,      True);
            Xt_Set_Sensitive (Delete_Application_Item, True);
            Xt_Set_Sensitive (Delete_Component_Item,   False);

         when Node_Component_Class =>
            Xt_Set_Sensitive (New_Component_Item,      False);
            Xt_Set_Sensitive (Delete_Application_Item, False);
            Xt_Set_Sensitive (Delete_Component_Item,   True);

         when others =>
            Xt_Set_Sensitive (New_Component_Item,      False);
            Xt_Set_Sensitive (Delete_Application_Item, False);
            Xt_Set_Sensitive (Delete_Component_Item,   False);
      end case;
   end Select_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Model.Node_Id) is
   begin
      Designer.Palette.Update_Item (Node);
      Designer.Tree_Editor.Update_Item (Node);
      Designer.Visual_Editor.Update_Item (Node);
      Designer.Properties_Editor.Update_Item (Node);
   end Update_Item;

end Designer.Main_Window;
