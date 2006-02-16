------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rostel.ru)
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
--! XmAda maintained by TechnoServ A/S (email: vgodunko@rostel.ru)
--!
--! <Unit> Xt.Composite_Management
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Implementation;

package body Xt.Composite_Management is

   use Xt.Implementation;

   function Xt_Is_Managed (W : in Widget) return Boolean is
      function XtIsManaged (W : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsManaged, "XtIsManaged");
   begin
      Check (W);
      return To_Boolean (XtIsManaged (W));
   end Xt_Is_Managed;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Manage_Children
   --!    <ImplementationNotes> Элементы списка проверяются на нуль-значение
   --! в Xt.
   ---------------------------------------------------------------------------
   procedure Xt_Manage_Children (Children : in Widget_List) is
      procedure XtManageChildren (Children     : in Widget_List;
                                  Num_Children : in Cardinal);
      pragma Import (C, XtManageChildren, "XtManageChildren");
   begin
      XtManageChildren (Children, Children'Length);
   end Xt_Manage_Children;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Unmanage_Children
   --!    <ImplementationNotes> Элементы списка проверяются на нуль-значение
   --! в Xt.
   ---------------------------------------------------------------------------
   procedure Xt_Unmanage_Children (Children : in Widget_List) is
      procedure XtUnmanageChildren (Children     : in Widget_List;
                                    Num_Children : in Cardinal);
      pragma Import (C, XtUnmanageChildren, "XtUnmanageChildren");
   begin
      XtUnmanageChildren (Children, Children'Length);
   end Xt_Unmanage_Children;


end Xt.Composite_Management;
