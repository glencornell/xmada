------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2006  Vadim Godunko (vgodunko@rost.ru)
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
--! <Unit> Xt.Implementation
--! <Purpose>
--!   This is internal package! Don't use it in applications!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xlib.Implementation;

package Xt.Implementation is


   subtype Xt_Position is Interfaces.C.int;


   procedure Check (The_Display : in Xlib.Display)
     renames Xlib.Implementation.Check;


   procedure Check (The_Screen : in Xlib.Screen)
     renames Xlib.Implementation.Check;


   procedure Check (The_GC : in Xlib.Graphic_Context)
     renames Xlib.Implementation.Check;

   procedure Check (The_String : in Xt_String)
     renames Xlib.Implementation.Check;


   procedure Check (The_Widget : in Widget);


   procedure Check (The_Widget_Class : in Widget_Class);


   procedure Check (App_Context : in Xt_App_Context);


   generic function Generic_To_Element_List
     renames Xlib.Implementation.Generic_To_Element_List;


end Xt.Implementation;
