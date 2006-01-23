------------------------------------------------------------------------------
--
--  X Library Ada Binding
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
--! <Unit> Xlib.Events
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;

package Xlib.Events is

   type Event_Type is new Interfaces.C.int;

   type Coordinate is new Interfaces.C.int;

   Key_Press         : constant Event_Type := 2;
   Key_Release       : constant Event_Type := 3;
   Button_Press      : constant Event_Type := 4;
   Button_Release    : constant Event_Type := 5;
   Motion_Notify     : constant Event_Type := 6;
   Enter_Notify      : constant Event_Type := 7;
   Leave_Notify      : constant Event_Type := 8;
   Focus_In          : constant Event_Type := 9;
   Focus_Out         : constant Event_Type := 10;
   Keymap_Notify     : constant Event_Type := 11;
   Expose            : constant Event_Type := 12;
   Graphics_Expose   : constant Event_Type := 13;
   No_Expose         : constant Event_Type := 14;
   Visibility_Notify : constant Event_Type := 15;
   Create_Notify     : constant Event_Type := 16;
   Destroy_Notify    : constant Event_Type := 17;
   Unmap_Notify      : constant Event_Type := 18;
   Map_Notify        : constant Event_Type := 19;
   Map_Request       : constant Event_Type := 20;
   Reparent_Notify   : constant Event_Type := 21;
   Configure_Notify  : constant Event_Type := 22;
   Configure_Request : constant Event_Type := 23;
   Gravity_Notify    : constant Event_Type := 24;
   Resize_Request    : constant Event_Type := 25;
   Circulate_Notify  : constant Event_Type := 26;
   Circulate_Request : constant Event_Type := 27;
   Property_Notify   : constant Event_Type := 28;
   Selection_Clear   : constant Event_Type := 29;
   Selection_Request : constant Event_Type := 30;
   Selection_Notify  : constant Event_Type := 31;
   Colormap_Notify   : constant Event_Type := 32;
   Client_Message    : constant Event_Type := 33;
   Mapping_Notify    : constant Event_Type := 34;
   Last_Event        : constant Event_Type := 35;

   type Event_Record (Kind : Event_Type := 0) is record
      Serial     : Interfaces.C.unsigned_long;
      Send_Event : Boolean; -- ???
      Display    : Xlib.Display;
      Window     : Xlib.Window;

      case Kind is
         when Key_Press | Key_Release =>
            Key_Root        : Xlib.Window;
            Key_Subwindow   : Xlib.Window;
            Key_Time        : Xlib.Time;
            X           : Coordinate;
            Y           : Coordinate;
            X_Root      : Coordinate;
            Y_Root      : Coordinate;
--            State       : Key_And_Button_Mask;
--            Keycode     : Keycode;
--            Same_Screen : Boolean;

         when Button_Press | Button_Release =>
            Button_Root        : Xlib.Window;
            Button_Subwindow   : Xlib.Window;
            Button_Event_Time  : Xlib.Time;
            Button_X           : Xlib.Events.Coordinate;
            Button_Y           : Xlib.Events.Coordinate;
            Button_X_Root      : Xlib.Events.Coordinate;
            Button_Y_Root      : Xlib.Events.Coordinate;
--            State       : Key_And_Button_Mask;
--            Button      : Button_Name_Type;
--            Same_Screen : Boolean;

         when others =>
            null;
      end case;
   end record;
   pragma Convention (C, Event_Record);

   subtype X_Any_Event is Event_Record;
   subtype X_Key_Pressed_Event_Record is Event_Record;
   subtype X_Key_Released_Event_Record is Event_Record;
   subtype X_Button_Pressed_Event_Record is Event_Record;
   subtype X_Button_Released_Event_Record is Event_Record;

   type Event is access all Event_Record;

   procedure X_Sync (The_Display : in Display;
                     Discard     : in Boolean := False);

private

end Xlib.Events;
