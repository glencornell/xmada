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
with Xt.Ancillary_Types;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;
with Xm_Form;
with Xm_Label_Gadget;
with Xm_Main_Window;
with Xm_Notebook;
with Xm_Paned_Window;
with Xm_Row_Column;
with Xm_String_Defs;

with Designer.Properties_Editor;
with Designer.Tree_Editor;
with Designer.Visual_Editor;

package body Designer.Main_Window is

   use Xm_Form;
   use Xm_Label_Gadget;
   use Xm_Main_Window;
   use Xm_Notebook;
   use Xm_Paned_Window;
   use Xm_Row_Column;
   use Xm_String_Defs;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;

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

   begin
      Main_Window := Xm_Create_Managed_Main_Window (App_Shell, "main_window");
      Paned       := Xm_Create_Managed_Paned_Window (Main_Window, "horizontal_paned");
      Status_Bar  := Xm_Create_Managed_Label_Gadget (Main_Window, "status_bar");
      Palette     := Xm_Create_Managed_Notebook (Main_Window, "widget_set");
      Menu        := Xm_Create_Managed_Menu_Bar (Main_Window, "main_menu");

      Properties_Form := Xm_Create_Managed_Form (Paned, "properties_form");
      Paned1          := Xm_Create_Managed_Paned_Window (Paned, "vertical_paned");
      Tree_Form       := Xm_Create_Managed_Form (Paned, "tree_form");

      Designer.Visual_Editor.Initialize (Paned1);
      Message_Form := Xm_Create_Managed_Form (Paned1, "message_form");

      Xt_Set_Arg (Args (0), Xm_N_Command_Window, Palette);
      Xt_Set_Arg (Args (1), Xm_N_Message_Window, Status_Bar);
      Xt_Set_Values (Main_Window, Args (0 .. 1));
      Xt_Realize_Widget (App_Shell);

      Designer.Properties_Editor.Initialize;
      Designer.Tree_Editor.Initialize;
   end Initialize;

end Designer.Main_Window;
