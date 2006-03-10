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
--! <Unit> Designer.Palette
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Wide_Strings;

with Xt.Ancillary_Types;
with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Resource_Management;
with Xt.Utilities;

with Xm.Menu_Management;
with Xm.Resource_Management;
with Xm.Strings;
with Xm_Cascade_Button_Gadget;
with Xm_Drawing_Area;
with Xm_Form;
with Xm_Label_Gadget;
with Xm_Message_Box;
with Xm_Notebook;
with Xm_Push_Button_Gadget;
with Xm_Row_Column;
with Xm_String_Defs;
with Xm_Text_Field;
with Xm_Toggle_Button_Gadget;

with Designer.Main_Window;
with Designer.Model_Utilities;
with Model.Allocations;
with Model.Queries;
with Model.Tree.Lists;
with Model.Xt_Motif;

package body Designer.Render_Table_Editor is

   use Designer.Model_Utilities;
   use Interfaces.C;
   use Interfaces.C.Wide_Strings;
   use Model;
   use Model.Queries;
   use Model.Tree;
   use Model.Tree.Lists;
   use Model.Xt_Motif;
   use Xm;
   use Xm.Menu_Management;
   use Xm.Resource_Management;
   use Xm.Strings;
   use Xm_Cascade_Button_Gadget;
   use Xm_Drawing_Area;
   use Xm_Form;
   use Xm_Label_Gadget;
   use Xm_Message_Box;
   use Xm_Notebook;
   use Xm_String_Defs;
   use Xm_Row_Column;
   use Xm_Push_Button_Gadget;
   use Xm_Text_Field;
   use Xm_Toggle_Button_Gadget;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Resource_Management;
   use Xt.Utilities;

   Notebook     : Widget;
   Dialog       : Widget;
   Project_Node : Node_Id;
   Xm_C_Unset   : constant := 0;
   Xm_C_Set     : constant := 1;

   package Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Cancel
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! меню "Add new rendition".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Add (The_Widget : in Widget;
                        Closure    : in Xt_Pointer;
                        Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Add);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Cancel
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! "Закрыть".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Cancel (The_Widget : in Widget;
                           Closure    : in Xt_Pointer;
                           Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Cancel);

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
      --!    <Unit> On_Delete
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! меню "Delete rendition".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Delete (The_Widget : in Widget;
                           Closure    : in Xt_Pointer;
                           Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Delete);
      
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
      --!    <Unit> On_OK
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! "OK".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_OK (The_Widget : in Widget;
                       Closure    : in Xt_Pointer;
                       Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_OK);

   end Callbacks;

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Add
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Add (The_Widget : in Widget;
                        Closure    : in Xt_Pointer;
                        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         pragma Unreferenced (The_Widget);

      begin
         Insert_Item (Project_Node);
      end On_Add;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Cancel
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Cancel (The_Widget : in Widget;
                           Closure    : in Xt_Pointer;
                           Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);

      begin
         Xt_Unmanage_Child (Dialog);
      end On_Cancel;
      
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
         --   Set_Create_In_Record (Node, True);
            null;

         --  При отпускании кнопки запрещаем использование имени переменной
         --  и убираем имя.

         elsif Data.Set = Xm_C_Unset then
            null;

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
      --!    <Unit> On_Delete
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Delete (The_Widget : in Widget;
                           Closure    : in Xt_Pointer;
                           Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         pragma Unreferenced (The_Widget);

         Page        : Widget;
         Argl        : Xt_Arg_List (0 .. 0);
         Page_Number : Positive;

      begin      
         Xt_Set_Arg (Argl (0), Xm_N_Current_Page_Number, Page_Number'Address);
         Xt_Get_Values (Notebook, Argl (0 .. 0));  

         Xt_Set_Arg 
          (Argl (0), 
           Xm_N_Page_Number, 
           Xt_Arg_Val (Page_Number));
         Xt_Set_Values (Notebook, Argl (0 .. 0));

         Xt_Unmanage_Child (Page);  --  ???
      end On_Delete;

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

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Menu_Entry", E);
      end On_Menu_Entry;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_OK
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_OK (The_Widget : in Widget;
                       Closure    : in Xt_Pointer;
                       Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         pragma Unreferenced (The_Widget);

      begin
         null;
      end On_OK;

   end Callbacks;

   -------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   -------------------------------------------------------------------------
   procedure Initialize (Parent : in Widget) is
      Menu_Bar         : Widget;
      Renditions_Menu  : Widget;
      Form             : Widget;
      Subform          : Widget;
      Button           : Widget;
      Drawing_Area     : Widget;
      Text_Label       : Widget;
      Text_Field       : Widget;
      Argl             : Xt_Arg_List (0 .. 5);

   begin
      Dialog :=
        Xm_Create_Template_Dialog (Parent, "renderTableDialog");
      Xt_Add_Callback (Dialog, Xm_N_Ok_Callback, Callbacks.On_OK'Access);
      Xt_Add_Callback
       (Dialog, Xm_N_Cancel_Callback, Callbacks.On_Cancel'Access);

      --  Формирование структуры главного меню.

      Menu_Bar := Xm_Create_Managed_Menu_Bar (Dialog, "main_menu");

      --  Выпадающее меню "Renditions".

      Renditions_Menu
        := Xm_Create_Pulldown_Menu (Menu_Bar, "renditions_menu");

      Button := Xm_Create_Managed_Push_Button_Gadget
       (Renditions_Menu, "New");

      Xt_Add_Callback
       (Button, Xm_N_Activate_Callback, Callbacks.On_Add'Access);

      Button :=
        Xm_Create_Managed_Push_Button_Gadget (Renditions_Menu, "Delete");
      Xt_Add_Callback
       (Button, Xm_N_Activate_Callback, Callbacks.On_Delete'Access);

      Xt_Set_Arg (Argl (0), Xm_N_Sub_Menu_Id, Renditions_Menu);
      Button :=
        Xm_Create_Managed_Cascade_Button_Gadget
         (Menu_Bar, "edit", Argl (0 .. 0));

      --  Создание блокнота задания свойств Xm_Rendition.

      Form := Xm_Create_Managed_Form (Dialog, "top");

      Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Argl (1), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Argl (2), Xm_N_Right_Attachment, Xm_Attach_Form);
      Notebook :=
        Xm_Create_Managed_Notebook (Form, "notebook", Argl (0 .. 2));

      Button := Xt_Name_To_Widget (Notebook, "PageScroller");
      Xt_Unmanage_Child (Button);

      Xt_Set_Arg (Argl (0), Xm_N_Current_Page_Number, Xt_Arg_Val (1));
      Xt_Set_Values (Notebook, Argl (0 .. 0));

      --  Создание блокнота задания свойств Xm_Rendition.

      Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Notebook);
      Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Form);
      Subform := Xm_Create_Managed_Form (Form, "subform", Argl (0 .. 3));
      

      Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Argl (1), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
      Text_Label :=
        Xm_Create_Managed_Label_Gadget (Subform, "text", Argl (0 .. 2));

      Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Argl (1), Xm_N_Left_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Argl (2), Xm_N_Left_Widget, Text_Label);
      Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Argl (4), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Text_Field :=
        Xm_Create_Managed_Text_Field (Subform, "text_field", Argl (0 .. 4));

      Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Subform);
      Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Form);
      Drawing_Area :=
        Xm_Create_Managed_Drawing_Area (Form, "drawing_area", Argl (0 .. 3));

   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Resource : in Model.Node_Id) 
   is
      Argl             : Xt_Arg_List (0 .. 5);
      Current_Resource : Node_Id;
      Current_Value    : Node_Id;
      Label            : Widget;
      Menu             : Widget;
      Str              : Xm_String;
      Default_Page     : constant Wide_String := "Untitled";
      Toggle_Button    : Widget;
      Pulldown_Menu    : Widget; 
      Page             : Widget;
      Form             : Widget;

   begin
      pragma Assert (Node_Kind (Resource) = Node_Project);

      --  Задание ресурсов для узла Node_Xm_Rendition.

      Project_Node := Resource;
      Page := Xm_Create_Managed_Row_Column (Notebook, "rendition_page");
      Label := Xm_Create_Managed_Push_Button_Gadget (Notebook, "page1");
      Str := Xm_String_Generate (Default_Page);

      Xt_Set_Arg (Argl (0), Xm_N_Label_String, Str);
      Xt_Set_Values (Label, Argl (0 .. 0));
      Xm_String_Free (Str);
      
      Current_Resource := First (Resources (Xt_Motif_Rendition_Class));

      while Current_Resource /= Null_Node loop
         Form := Xm_Create_Managed_Form (Page, "notebook_form");

         Xt_Set_Arg (Argl (0), Xm_N_Left_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Argl (1), Xm_N_Bottom_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Argl (2), Xm_N_Top_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Argl (3), Xm_N_User_Data, Xt_Arg_Val (Resource));
         Toggle_Button := 
           Xm_Create_Managed_Toggle_Button_Gadget 
            (Form, "toggle_button", Argl (0 .. 3));

         Xt_Add_Callback (Toggle_Button,
                          Xm_N_Value_Changed_Callback,
                          Callbacks.On_Create_In_Record_Changed'Access);

         Str := 
           Xm_String_Generate
            (Internal_Resource_Name_Image (Current_Resource));

         Xt_Set_Arg (Argl (0), Xm_N_Label_String, Str);
         Xt_Set_Values (Toggle_Button, Argl (0 .. 0));
         Xm_String_Free (Str);

         --  Создаем меню.
         Xt_Set_Arg (Argl (0), Xm_N_Left_Attachment, Xm_Attach_Widget);
         Xt_Set_Arg (Argl (1), Xm_N_Left_Widget, Toggle_Button); 
         Xt_Set_Arg (Argl (2), Xm_N_Bottom_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Argl (3), Xm_N_Top_Attachment, Xm_Attach_Form);
         Xt_Set_Arg (Argl (4), Xm_N_Right_Attachment, Xm_Attach_Form);

         Menu :=
           Xm_Create_Option_Menu
            (Form, "resource_menu", Argl (0 .. 4));

         case Node_Kind (Resource_Type (Current_Resource)) is
            when Node_Enumerated_Resource_Type =>
               Pulldown_Menu :=
                 Xm_Create_Pulldown_Menu 
                  (Form, "resource_values");

               Xt_Set_Arg (Argl (0), Xm_N_Sub_Menu_Id, Pulldown_Menu); 
               Xt_Set_Values (Menu, Argl (0 .. 0));

               Xt_Add_Callback (Pulldown_Menu,
                                Xm_N_Entry_Callback,
                                Callbacks.On_Menu_Entry'Access);

               Current_Value :=
                 First (Value_Specifications (Resource_Type (Current_Resource)));

               while Current_Value /= Null_Node loop
                  Str :=
                    Xm_String_Generate
                     (Internal_Name_Image (Current_Value));
                  Xt_Set_Arg (Argl (0), Xm_N_Label_String, Str);
                  Xt_Set_Arg (Argl (1),
                              Xm_N_User_Data,
                              Xt_Arg_Val (Resource));

                  Label := Xm_Create_Managed_Push_Button_Gadget
                    (Pulldown_Menu, "resource_value", Argl (0 .. 1));

                  Xm_String_Free (Str);
                  Current_Value := Next (Current_Value);
               end loop;

               Xt_Manage_Child (Menu);

            when Node_Predefined_Resource_Type =>
               null;

            when others =>
               null;
         end case;

         Current_Resource := Next (Current_Resource);
      end loop;

   end Insert_Item;
   
   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Open
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Open (Resource : in Model.Node_Id) 
   is
      Argl : Xt_Arg_List (0 .. 4);
  
   begin
      pragma
        Assert (Node_Kind (Resource) = Node_Xm_Render_Table_Resource_Value);
      
      Xt_Set_Arg (Argl (0), Xm_N_Page_Number, Xt_Arg_Val (1));
      Xt_Set_Arg (Argl (1), Xm_N_First_Page_Number, Xt_Arg_Val (1));
      Xt_Set_Arg (Argl (2), Xm_N_Last_Page_Number, Xt_Arg_Val (1));
      Xt_Set_Values (Notebook, Argl (0 .. 2));

      Xt_Manage_Child (Dialog);
   end Open;

end Designer.Render_Table_Editor;
