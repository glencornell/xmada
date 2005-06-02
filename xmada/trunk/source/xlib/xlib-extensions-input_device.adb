--  !!! This module is GNAT specific. It use unchecked conversion between !!!
--  !!! general access type and address and address arithmetic. !!!
with Ada.Unchecked_Conversion;
with Interfaces.C;            use Interfaces.C;
with System;                  use System;
with System.Storage_Elements; use System.Storage_Elements;

with Xlib.Implementation;     use Xlib.Implementation;


package body Xlib.Extensions.Input_Device is


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
