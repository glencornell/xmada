------------------------------------------------------------------------------
--
--  X Library Ada Binding
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
--! <Unit> Xlib.Extensions.Input_Device
--! <ImplementationNotes>
--! <PortabilityIssues>
--!  This module is GNAT specific. It use unchecked conversion between
--!  general access type and address and address arithmetic.
--!
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
with System.Storage_Elements;

with Xlib.Implementation;

package body Xlib.Extensions.Input_Device is

   use Interfaces.C;
   use System;
   use System.Storage_Elements;
   use Xlib.Implementation;

   procedure Check (Item : in X_Device) is
   begin
      if Item = null then
         raise Invalid_Device_Error;
      end if;
   end Check;


   function To_X_Any_Class_Info_Pointer_List
    (Pointer : in X_Any_Class_Info_Pointer;
     Length  : in int)
       return X_Any_Class_Info_Pointer_List
   is
      pragma Suppress (Index_Check);

      Return_Value : X_Any_Class_Info_Pointer_List (0 .. Natural (Length - 1));
      Aux          : X_Any_Class_Info_Pointer := Pointer;

      function To_Address is
        new Ada.Unchecked_Conversion (X_Any_Class_Info_Pointer, Address);

      function To_Pointer is
        new Ada.Unchecked_Conversion (Address, X_Any_Class_Info_Pointer);

   begin
      if Pointer = null then
         raise Dereference_Error;
      end if;

      for J in Return_Value'Range loop
         Return_Value (J) := Aux;
         Aux              := To_Pointer (To_Address (Aux) +
                                         Storage_Offset (Aux.Length));
      end loop;

      return Return_Value;
   end To_X_Any_Class_Info_Pointer_List;


   procedure X_Close_Device (The_Display : in Display;
                             Device      : in X_Device)
   is
      procedure XCloseDevice (The_Display : in Display;
                              Device      : in X_Device);
      pragma Import (C, XCloseDevice, "XCloseDevice");
   begin
      Check (The_Display);
      Check (Device);

      XCloseDevice (The_Display, Device);
   end X_Close_Device;


   function X_List_Input_Devices (The_Display : in     Display;
                                  Num_Devices : access Interfaces.C.int)
     return X_Device_Info_Pointer
   is
      function XListInputDevices (The_Display : in     Display;
                                  Num_Devices : access Interfaces.C.int)
        return X_Device_Info_Pointer;
      pragma Import (C, XListInputDevices, "XListInputDevices");
   begin
      Check (The_Display);

      return XListInputDevices (The_Display, Num_Devices);
   end X_List_Input_Devices;


   function X_Open_Device (The_Display : in Display;
                           Device_Id   : in X_Id)
     return X_Device
   is
      function XOpenDevice (The_Display : in Display;
                            Device_Id   : in X_Id)
        return X_Device;
      pragma Import (C, XOpenDevice, "XOpenDevice");
   begin
      Check (The_Display);

      return XOpenDevice (The_Display, Device_Id);
   end X_Open_Device;


end Xlib.Extensions.Input_Device;
