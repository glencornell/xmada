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
--! <Unit> Designer.Tree_Editor
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xm.Resource_Management;
with Xm_Container;
with Xm_Scrolled_Window;
with Xm_String_Defs;

package body Designer.Tree_Editor is

   use Xm;
   use Xm.Resource_Management;
   use Xm_Container;
   use Xm_Scrolled_Window;
   use Xm_String_Defs;
   use Xt;
   use Xt.Ancillary_Types;

   Container : Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize (Parent   : in Xt.Widget;
                         Arg_List : in Xt.Ancillary_Types.Xt_Arg_List)
   is
      Args     : Xt_Arg_List (0 .. Arg_List'Length);
      Scrolled : Widget;

   begin
      Args (0 .. Arg_List'Length - 1) := Arg_List;
      Xt_Set_Arg (Args (Arg_List'Length), Xm_N_Scrolling_Policy, Xm_Automatic);
      Scrolled :=
        Xm_Create_Managed_Scrolled_Window
         (Parent, "scrolled", Args (0 .. Arg_List'Length));

      Xt_Set_Arg (Args (0), Xm_N_Layout_Type, Xm_Outline);
      Container :=
        Xm_Create_Managed_Container (Scrolled, "tree", Args (0 .. 0));
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id) is
   begin
      null;
   end Select_Item;

end Designer.Tree_Editor;
