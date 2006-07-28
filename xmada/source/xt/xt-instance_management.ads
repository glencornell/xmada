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
--! <Unit> Xt.Instance_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Ancillary_Types;

package Xt.Instance_Management is


   function Xt_Create_Widget
    (Name             : in String;
     The_Widget_Class : in Widget_Class;
     Parent           : in Widget;
     Args             : in Ancillary_Types.Xt_Arg_List
       := Ancillary_Types.Null_Xt_Arg_List)
       return Widget;


   function Xt_Create_Managed_Widget
    (Name             : in String;
     The_Widget_Class : in Widget_Class;
     Parent           : in Widget;
     Args             : in Ancillary_Types.Xt_Arg_List
       := Ancillary_Types.Null_Xt_Arg_List)
       return Widget;


   procedure Xt_Destroy_Widget (W : in Widget);


   procedure Xt_Realize_Widget (W : in Widget);

   procedure Xt_Unrealize_Widget (W : in Widget);

   function Xt_Is_Realized (W : in Widget) return Boolean;


   procedure Xt_Map_Widget (W : in Widget);

   procedure Xt_Unmap_Widget (W : in Widget);

   procedure Xt_Set_Mapped_When_Managed (W                : in Widget;
                                         Map_When_Managed : in Boolean);


   function Xt_Parent (W : in Widget) return Widget;


end Xt.Instance_Management;
