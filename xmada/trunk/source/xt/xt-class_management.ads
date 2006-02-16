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
--! <Unit> Xt.Class_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Xt.Class_Management is


   function Xt_Class (The_Widget : in Widget) return Widget_Class;

   function Xt_Superclass (The_Widget : in Widget) return Widget_Class;


   function Xt_Is_Subclass (The_Widget       : in Widget;
                            The_Widget_Class : in Widget_Class)
     return Boolean;


   function Xt_Is_Object (The_Widget : in Widget) return Boolean;

   function Xt_Is_Rect_Obj (The_Widget : in Widget) return Boolean;

   function Xt_Is_Widget (The_Widget : in Widget) return Boolean;

   function Xt_Is_Composite (The_Widget : in Widget) return Boolean;

   function Xt_Is_Constraint (The_Widget : in Widget) return Boolean;

   function Xt_Is_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_Override_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_WM_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_Vendor_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_Transient_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_Top_Level_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_Application_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_Session_Shell (The_Widget : in Widget) return Boolean;


   procedure Xt_Check_Subclass (The_Widget       : in Widget;
                                The_Widget_Class : in Widget_Class;
                                Message          : in String);


end Xt.Class_Management;
