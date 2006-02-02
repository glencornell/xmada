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
--! <Unit> Xt.Popup_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Ancillary_Types;

package Xt.Popup_Management is

   type Xt_Grab_Kind is (Xt_Grab_None,
                         Xt_Grab_Nonexclusive,
                         Xt_Grab_Exclusive);
   pragma Convention (C, Xt_Grab_Kind);
   for Xt_Grab_Kind'Size use Interfaces.C.int'Size;


   function Xt_Create_Popup_Shell
    (Name             : in String;
     The_Widget_Class : in Widget_Class;
     Parent           : in Widget;
     Args             : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Widget;


   procedure Xt_Popup (Popup_Shell : in Widget;
                       Grab_Kind   : in Xt_Grab_Kind);

   procedure Xt_Popdown (Popup_Shell : in Widget);


end Xt.Popup_Management;