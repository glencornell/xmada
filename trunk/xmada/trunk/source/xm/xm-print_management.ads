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
--! <Unit> Xm.Print_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xlib.Extensions.Print;

package Xm.Print_Management is


   procedure Xm_Redisplay_Widget (The_Widget : in Xt.Widget);


   function Xm_Print_Setup
    (Video_Widget     : in Xt.Widget;
     Print_Screen     : in Xlib.Screen;
     Print_Shell_Name : in String;
     Arg_List         : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xt.Widget;


   function Xm_Print_To_File
    (The_Display : in Xlib.Display;
     File_Name   : in String;
     Finish_Proc : in Xlib.Extensions.Print.Xp_Finish_Proc := null;
     Client_Data : in Xt.Xt_Pointer
       := Xt.Null_Xt_Pointer)
       return Boolean;


end Xm.Print_Management;
