------------------------------------------------------------------------------
--
--  Mofit Ada Binding
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
--! <Unit> Xm_Container
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xlib;
with Xt.Ancillary_Types;

with Xm_Manager;

package Xm_Container is

   subtype Xm_Container_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Container_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Container_Widget_Class : constant Xm_Container_Class;

   --

   function Xm_Create_Container
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Container_Widget;


   function Xm_Create_Managed_Container
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Container_Widget;

   --

   procedure Xm_Container_Relayout (The_Widget : in Xm_Container_Widget);


   procedure Xm_Container_Reorder
    (The_Widget : in Xm_Container_Widget;
     Widgets    : in Xt.Ancillary_Types.Xt_Widget_List);


   function Xm_Container_Copy (The_Widget : in Xm_Container_Widget;
                               Timestamp  : in Xlib.Time)
     return Boolean;


   function Xm_Container_Copy_Link (The_Widget : in Xm_Container_Widget;
                                    Timestamp  : in Xlib.Time)
     return Boolean;


   function Xm_Container_Cut (The_Widget : in Xm_Container_Widget;
                              Timestamp  : in Xlib.Time)
     return Boolean;


   function Xm_Container_Paste (The_Widget : in Xm_Container_Widget)
     return Boolean;


   function Xm_Container_Paste_Link (The_Widget : in Xm_Container_Widget)
     return Boolean;


private

   pragma Import (C, Xm_Container_Widget_Class, "xmContainerWidgetClass");

end Xm_Container;