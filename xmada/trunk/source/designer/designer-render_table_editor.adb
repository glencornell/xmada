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
with Xt.Ancillary_Types;
with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Resource_Management;
with Xt.Utilities;

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

with Model.Queries;
with Model.Tree.Lists;

package body Designer.Render_Table_Editor is

   use Model;
   use Model.Tree;
   use Model.Tree.Lists;
   use Model.Queries;
   use Xm;
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
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Resource_Management;
   use Xt.Utilities;

   Notebook : Widget;
   Dialog   : Widget;

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

         Str  : Xm_String;
         Tmp  : constant Wide_String := "Untitled_New";
         Page : Widget;
         Argl : Xt_Arg_List (0 .. 0);

      begin
         Page := Xm_Create_Managed_Row_Column (Notebook, "rendition_page");

         Str := Xm_String_Generate (Tmp);

         Xt_Set_Arg (Argl (0), Xm_N_Label_String, Str);
         Xt_Set_Values (Page, Argl (0 .. 0));
         Xm_String_Free (Str);

         Xt_Unmanage_Child (Notebook);
         Xt_Manage_Child (Notebook);
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

      begin
         null;
      end On_Delete;

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
         --  Set_Resources
      end On_OK;

   end Callbacks;

   -------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   -------------------------------------------------------------------------
   procedure Initialize (Parent : in Widget) is
      Menu_Bar        : Widget;
      Renditions_Menu : Widget;
      Form            : Widget;
      Subform         : Widget;
      Button          : Widget;
      Page            : Widget;
      Drawing_Area    : Widget;
      Text_Label      : Widget;
      Text_Field      : Widget;
      Argl            : Xt_Arg_List (0 .. 4);

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

      Button :=
        Xm_Create_Managed_Push_Button_Gadget (Renditions_Menu, "new");
      Xt_Add_Callback
       (Button, Xm_N_Activate_Callback, Callbacks.On_Add'Access);

      Button :=
        Xm_Create_Managed_Push_Button_Gadget (Renditions_Menu, "delete");
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

      Page := Xm_Create_Managed_Row_Column (Notebook, "rendition_page");
      Button := Xm_Create_Managed_Push_Button_Gadget (Notebook, "page1");

      Xt_Set_Arg (Argl (0), Xm_N_Current_Page_Number, Xt_Arg_Val (0));
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

      Xt_Manage_Child (Drawing_Area);

--      Xt_Unmanage_Child (Notebook);
--      Xt_Manage_Child (Notebook);
--
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Open
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Open (Resource : in Model.Node_Id) is
   begin
      pragma Assert
              (Node_Kind (Resource) = Node_Xm_Render_Table_Resource_Value);

      if Resource_Value (Resource) /= Null_List then
         declare
            Current_Rendition : Node_Id;
            Page              : Widget;
            Str               : Xm_String;
            Argl              : Xt_Arg_List (0 .. 4);

         begin
            Current_Rendition := First (Resource_Value (Resource));

            while Current_Rendition /= Null_Node loop
               Page :=
                 Xm_Create_Managed_Row_Column (Notebook, "rendition_page");

               Str := Xm_String_Generate (Name_Image (Current_Rendition));
               Xt_Set_Arg (Argl (0), Xm_N_Label_String, Str);
               Xt_Set_Values (Page, Argl (0 .. 0));
               Xm_String_Free (Str);

               Current_Rendition := Next (Current_Rendition);
            end loop;
         end;
      end if;

      Xt_Manage_Child (Dialog);
   end Open;

end Designer.Render_Table_Editor;
