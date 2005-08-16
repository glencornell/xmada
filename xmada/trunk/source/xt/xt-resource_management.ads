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
--! <Unit> Xt.Resource_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with System;

with Xt.Ancillary_Types;

package Xt.Resource_Management is


   --  Moved from Xt.Ancillary_Types.
   type Xt_Address_Mode is (Xt_Address,
                            Xt_Base_Offset,
                            Xt_Immediate,
                            Xt_Resource_String,
                            Xt_Resource_Quark,
                            Xt_Widget_Base_Offset,
                            Xt_Procedure_Arg);
   pragma Convention (C, Xt_Address_Mode);

   --  Moved from Xt.Ancillary_Types.
   type Xt_Convert_Arg is record
      Address_Mode : Xt_Address_Mode;
      Address_Id   : Xt_Pointer;
      Size         : Cardinal;
   end record;
   pragma Convention (C, Xt_Convert_Arg);

   type Xt_Convert_Arg_List is array (Natural range <>) of Xt_Convert_Arg;
   Null_Xt_Convert_Arg_List : constant Xt_Convert_Arg_List (1 .. 0)
     := (others => (Xt_Address, Null_Xt_Pointer, 0));



   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xt_Boolean);

   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xt.Ancillary_Types.Xt_Arg_Val);

   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     System.Address);

   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xt_String);

   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Widget);


   generic
      type T is private;
   procedure Generic_Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                                 Name  : in     Xt_Resource_Name_String;
                                 Value : in     T);


   function Xt_Screen_Database (The_Screen : in Xlib.Screen)
     return Xlib.Resource_Manager.Xrm_Database;


   procedure Xt_Get_Resource_List
    (The_Widget_Class : in     Widget_Class;
     Resources_Return :    out Xt.Ancillary_Types.Xt_Resource_List_Access);

   procedure Xt_Get_Constraint_Resource_List
    (The_Widget_Class : in     Widget_Class;
     Resources_Return :    out Xt.Ancillary_Types.Xt_Resource_List_Access);


   procedure Xt_Set_Values (W    : in Widget;
                            Args : in Xt.Ancillary_Types.Xt_Arg_List);


   procedure Xt_Get_Values (W    : in Widget;
                            Args : in Xt.Ancillary_Types.Xt_Arg_List);


   procedure Xt_App_Set_Type_Converter
    (App_Context    : in Xt_App_Context;
     From_Type      : in Xt_Resource_Type_String;
     To_Type        : in Xt_Resource_Type_String;
     Converter      : in Xt_Type_Converter;
     Converter_Args : in Xt_Convert_Arg_List := Null_Xt_Convert_Arg_List;
     Cache_Type     : in Xt_Cache_Type;
     Destructor     : in Xt_Destructor       := Null_Xt_Destructor);


   procedure Xt_Set_Type_Converter
    (From_Type      : in Xt_Resource_Type_String;
     To_Type        : in Xt_Resource_Type_String;
     Converter      : in Xt_Type_Converter;
     Converter_Args : in Xt_Convert_Arg_List := Null_Xt_Convert_Arg_List;
     Cache_Type     : in Xt_Cache_Type;
     Destructor     : in Xt_Destructor       := Null_Xt_Destructor);


   procedure Xt_Display_String_Conversion_Warning
    (The_Display : in Xlib.Display;
     From_Value  : in String;
     To_Type     : in Xt_Resource_Type_String);


   --  additional functional form
   function Xt_Get_Resource_List (The_Widget_Class : in Widget_Class)
     return Xt.Ancillary_Types.Xt_Resource_List;

   --  additional functional form
   function Xt_Get_Constraint_Resource_List
    (The_Widget_Class : in Widget_Class)
       return Xt.Ancillary_Types.Xt_Resource_List;


private

   pragma Inline (Xt_Set_Arg);
   pragma Inline (Generic_Xt_Set_Arg);

end Xt.Resource_Management;
