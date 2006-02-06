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
with Xt.Ancillary_Types;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;
with Xm.Resource_Management;
with Xm_Push_Button_Gadget;
with Xm_Scrolled_Window;
with Xm_String_Defs;
with Xm_Row_Column;

package body Designer.Properties_Editor.Widget_Instance is

   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;
   use Xm;
   use Xm.Resource_Management;
   use Xm_Push_Button_Gadget;
   use Xm_Scrolled_Window;
   use Xm_String_Defs;
   use Xm_Row_Column;
   use Model;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create (Parent : in Widget;
                    Node   : in Model.Node_Id)
     return Node_Properties_Editor_Access
   is
      Result  : constant Widget_Instance_Properties_Editor_Access
        := new Widget_Instance_Properties_Editor (Node);
      Element : Widget;
      Args    : Xt_Arg_List (0 .. 5);

   begin
     Result.Notebook := Parent;

     --  Создаем вкладку "Свойства".

      Xt_Set_Arg (Args (0), Xm_N_Scrolling_Policy, Xm_Automatic);
      Element               :=
        Xm_Create_Managed_Scrolled_Window (Parent, "scrolled", Args (0 .. 0));
      Result.Properties     :=
        Xm_Create_Managed_Row_Column (Element, "row_column");
      Result.Properties_Tab :=
        Xm_Create_Managed_Push_Button_Gadget (Parent, "properties");

     --  Создаем вкладку "ограничения".

      Element                :=
        Xm_Create_Managed_Scrolled_Window (Parent, "scrolled", Args (0 .. 0));
      Result.Constraints     :=
        Xm_Create_Managed_Row_Column (Element, "row_column");
      Result.Constraints_Tab :=
        Xm_Create_Managed_Push_Button_Gadget (Parent, "constraints");

      --  Создаем вкладку "функции обратного вызова".

      Element              :=
        Xm_Create_Managed_Scrolled_Window (Parent, "scrolled", Args (0 .. 0));
      Result.Callbacks     :=
        Xm_Create_Managed_Row_Column (Element, "row_column");
      Result.Callbacks_Tab :=
        Xm_Create_Managed_Push_Button_Gadget (Parent, "callbacks");

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

      Xt_Destroy_Widget (Xt_Parent (Xt_Parent (Object.Properties)));
      Xt_Destroy_Widget (Object.Properties_Tab);

      --  Удаление вкладки "Ограничения".

      Xt_Destroy_Widget (Xt_Parent (Xt_Parent (Object.Constraints)));
      Xt_Destroy_Widget (Object.Constraints_Tab);

      --  Удаление вкладки "Функции обратного вызова".

      Xt_Destroy_Widget (Xt_Parent (Xt_Parent (Object.Callbacks)));
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
   end Hide;

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

      Xt_Set_Arg (Args (0), Xm_N_Page_Number, Page'Address);
      Xt_Get_Values (Object.Properties_Tab, Args (0 .. 0));

      Xt_Set_Arg (Args (0), Xm_N_Current_Page_Number, Page);
      Xt_Set_Values (Object.Notebook, Args (0 .. 0));
   end Show;

end Designer.Properties_Editor.Widget_Instance;
