------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
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
--! <Unit> Xt.Composite_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Xt.Composite_Management is


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Проверку параметра Child на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   procedure Xt_Manage_Child (Child : in Widget);


   procedure Xt_Manage_Children (Children : in Widget_List);


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Проверку параметра Child на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   procedure Xt_Unmanage_Child (Child : in Widget);


   procedure Xt_Unmanage_Children (Children : in Widget_List);


   function Xt_Is_Managed (W : in Widget) return Boolean;


private

   pragma Import (C, Xt_Manage_Child, "XtManageChild");
   pragma Import (C, Xt_Unmanage_Child, "XtUnmanageChild");

end Xt.Composite_Management;
