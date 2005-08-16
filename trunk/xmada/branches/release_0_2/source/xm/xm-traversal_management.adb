------------------------------------------------------------------------------
--
--  Motif Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rost.ru)
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
--! along with GCC; see the file COPYING. If not, write to the Free
--! Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
--! 02110-1301, USA.
--!
--! As a special exception, if other files instantiate generics from this
--! unit, or you link this unit with other files to produce an executable,
--! this unit does not by itself cause the resulting executable to be
--! covered by the GNU General Public License. This exception does not
--! however invalidate any other reasons why the executable file might be
--! covered by the GNU Public License.
--!
--! <Unit> Xm.Traversal_Management
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xm.Implementation;

package body Xm.Traversal_Management is

   use Xm.Implementation;
   use Xt;

   procedure Xm_Add_Tab_Group (Tab_Group : in Widget) is
      procedure XmAddTabGroup (Tab_Group : in Widget);
      pragma Import (C, XmAddTabGroup, "XmAddTabGroup");
   begin
      Check (Tab_Group);
      XmAddTabGroup (Tab_Group);
   end Xm_Add_Tab_Group;


   function Xm_Get_Focus_Widget (The_Widget : in Widget) return Widget is
      function XmGetFocusWidget (The_Widget : in Widget) return Widget;
      pragma Import (C, XmGetFocusWidget, "XmGetFocusWidget");
   begin
      Check (The_Widget);
      return XmGetFocusWidget (The_Widget);
   end Xm_Get_Focus_Widget;


   function Xm_Get_Tab_Group (The_Widget : in Widget) return Widget is
      function XmGetTabGroup (The_Widget : in Widget) return Widget;
      pragma Import (C, XmGetTabGroup, "XmGetTabGroup");
   begin
      Check (The_Widget);
      return XmGetTabGroup (The_Widget);
   end Xm_Get_Tab_Group;


   function Xm_Is_Traversable (The_Widget : in Widget) return Boolean is
      function XmIsTraversable (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XmIsTraversable, "XmIsTraversable");
   begin
      Check (The_Widget);
      return To_Boolean (XmIsTraversable (The_Widget));
   end Xm_Is_Traversable;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Process_Traversal
   --!    <ImplementationNotes> Параметр The_Widget проверяется на нуль
   --! значение в Xm.
   ---------------------------------------------------------------------------
   function Xm_Process_Traversal (The_Widget : in Widget;
                                  Direction  : in Xm_Traversal_Direction)
     return Boolean
   is
      function XmProcessTraversal (The_Widget : in Widget;
                                   Direction  : in Xm_Traversal_Direction)
        return Xt_Boolean;
      pragma Import (C, XmProcessTraversal, "XmProcessTraversal");
   begin
      return To_Boolean (XmProcessTraversal (The_Widget, Direction));
   end Xm_Process_Traversal;


   procedure Xm_Remove_Tab_Group (Tab_Group : in Widget) is
      procedure XmRemoveTabGroup (Tab_Group : in Widget);
      pragma Import (C, XmRemoveTabGroup, "XmRemoveTabGroup");
   begin
      Check (Tab_Group);
      XmRemoveTabGroup (Tab_Group);
   end Xm_Remove_Tab_Group;


end Xm.Traversal_Management;
