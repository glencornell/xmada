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
--! <Unit> Xm_Main_Window
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Ancillary_Types;

with Xm_Scrolled_Window;

package Xm_Main_Window is

   subtype Xm_Main_Window_Widget
     is Xm_Scrolled_Window.Xm_Scrolled_Window_Widget;
   subtype Xm_Main_Window_Class is Xm_Scrolled_Window.Xm_Scrolled_Window_Class;

   Xm_Main_Window_Widget_Class : constant Xm_Main_Window_Class;

   --

   function Xm_Create_Main_Window
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Main_Window_Widget;


   function Xm_Create_Managed_Main_Window
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Main_Window_Widget;


   ---------------------------------------------------------------------------
   --  Obsolete and deprecated stuff
   ---------------------------------------------------------------------------

   function Xm_Main_Window_Sep_1 (The_Widget : in Xm_Main_Window_Widget)
     return Xt.Widget;


   function Xm_Main_Window_Sep_2 (The_Widget : in Xm_Main_Window_Widget)
     return Xt.Widget;


   function Xm_Main_Window_Sep_3 (The_Widget : in Xm_Main_Window_Widget)
     return Xt.Widget;


   procedure Xm_Main_Window_Set_Areas
    (The_Widget           : in Xm_Main_Window_Widget;
     Menu_Bar             : in Xt.Widget;
     Command_Window       : in Xt.Widget;
     Horizontal_Scrollbar : in Xt.Widget;
     Vertical_Scrollbar   : in Xt.Widget;
     Work_Region          : in Xt.Widget);


private

   pragma Import (C, Xm_Main_Window_Widget_Class, "xmMainWindowWidgetClass");

end Xm_Main_Window;
