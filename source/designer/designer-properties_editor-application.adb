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
--! <Unit> Designer.Properties_Editor.Application
--! <Purpose>
--!   Пакет содержит реализацию редактора свойств для приложения.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

with Designer.Main_Window;

with Model.Names;
with Model.Queries;
with Model.Strings;
with Model.Tree;

with Xm;
with Xm.Resource_Management;
with Xm_Form;
with Xm_Label_Gadget;
with Xm_String_Defs;
with Xm_Text_Field;

with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;

package body Designer.Properties_Editor.Application is

   use Model;
   use Model.Names;
   use Model.Queries;
   use Model.Strings;
   use Model.Tree;
   use Model.Tree;

   use Xm;
   use Xm.Resource_Management;
   use Xm_Form;
   use Xm_Label_Gadget;
   use Xm_String_Defs;
   use Xm_Text_Field;

   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;

   package Callbacks is
      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Application_Class_Name_Changed
      --!    <Purpose>
      --!  Подпрограмма обратного вызова изменении имени Application.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Application_Class_Name_Changed
       (The_Widget : in Widget;
        Closure    : in Xt_Pointer;
        Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Application_Class_Name_Changed);

   end Callbacks;

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Application_Class_Name_Changed
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Application_Class_Name_Changed (The_Widget : in Widget;
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

         pragma Assert (Node /= Null_Node);
         Name := Enter (Xm_Text_Field_Get_String (The_Widget));
         Set_Application_Class_Name (Node, Name);
         Main_Window.Update_Item (Node);

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Application_Class_Name_Changed", E);
      end On_Application_Class_Name_Changed;

   end Callbacks;

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
      Args      : Xt_Arg_List (0 .. 6);
      Result    : constant Application_Properties_Editor_Access
        := new Application_Properties_Editor (Node);
      Element   : Widget;
      Form      : Widget;
      Label     : Widget;

   begin
      Result.Form := Xm_Create_Managed_Form (Parent, "subform", Arg_List);

      Form := Xm_Create_Managed_Form (Result.Form, "form");

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (2), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Label  := Xm_Create_Managed_Label_Gadget (Form, "name", Args (0 .. 2));

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Left_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (2), Xm_N_Left_Widget, Label);
      Xt_Set_Arg (Args (3), Xm_N_User_Data, Xt_Arg_Val (Node));
      Element := Xm_Create_Managed_Text_Field
                  (Form, "application_name", Args (0 .. 3));

      Xm_Text_Field_Set_String (Element,
                                    Application_Class_Name_Image (Node));

      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Application_Class_Name_Changed'Access);
      Xt_Add_Callback (Element,
                       Xm_N_Losing_Focus_Callback,
                       Callbacks.On_Application_Class_Name_Changed'Access);

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Top_Widget, Element);
      Form := Xm_Create_Managed_Form (Result.Form, "form", Args (0 .. 1));

      return Node_Properties_Editor_Access (Result);

   end Create;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Finalize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Finalize (Object : in out Application_Properties_Editor) is
      pragma Assert (Object.Form /= Null_Widget);

   begin
     Xt_Destroy_Widget (Object.Form);
   end Finalize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Hide
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Hide (Object : access Application_Properties_Editor) is
      pragma Assert (Object.Form /= Null_Widget);

   begin
      Xt_Unmanage_Child (Object.Form);
   end Hide;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Show
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Show (Object : access Application_Properties_Editor) is
      pragma Assert (Object.Form /= Null_Widget);

   begin
      Xt_Manage_Child (Object.Form);
   end Show;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Node_Id) is
      pragma Unreferenced (Node);
      --  нигде не используется;

   begin
      null;
   end Update_Item;

end Designer.Properties_Editor.Application;
