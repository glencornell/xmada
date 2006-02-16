------------------------------------------------------------------------------
--
--  Mofit Ada Binding
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
--! <Unit> Xm.Menu_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xlib.Cursors;
with Xlib.Events;

package Xm.Menu_Management is


   procedure Xm_Add_To_Post_From_List (Menu             : in Xt.Widget;
                                       Post_From_Widget : in Xt.Widget);


   procedure Xm_Remove_From_Post_From_List (Menu             : in Xt.Widget;
                                            Post_From_Widget : in Xt.Widget);


   function Xm_Get_Posted_From_Widget (Menu : in Xt.Widget) return Xt.Widget;


   procedure Xm_Menu_Position
    (Menu  : in Xt.Widget;
     Event : in Xlib.Events.X_Button_Pressed_Event_Record);


   function Xm_Get_Tear_Off_Control (Menu : in Xt.Widget) return Xt.Widget;


   ---------------------------------------------------------------------------
   --  Obsolete and deprecated stuff
   ---------------------------------------------------------------------------

   function Xm_Get_Menu_Cursor (The_Display : in Xlib.Display)
     return Xlib.Cursors.Cursor;


   procedure Xm_Set_Menu_Cursor (The_Display : in Xlib.Display;
                                 The_Cursor  : in Xlib.Cursors.Cursor);


end Xm.Menu_Management;
