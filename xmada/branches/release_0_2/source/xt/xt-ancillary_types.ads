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
--! <Unit> Xt.Ancillary_Types
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Strings;

package Xt.Ancillary_Types is

   type Xt_Enum is new Interfaces.C.unsigned_char;


   type Xt_Arg_Val is new Interfaces.C.long;

   type Xt_Arg is record
      Name  : Xt_String;
      Value : Xt_Arg_Val;
   end record;
   for Xt_Arg'Size use 64;
   pragma Convention (C, Xt_Arg);

   type Xt_Arg_List is array (Natural range <>) of Xt_Arg;
   Null_Xt_Arg_List : constant Xt_Arg_List;

--   type Xt_Arg_List_Pointer is access Xt_Arg_List;


   type Xt_Resource is record
      Resource_Name   : Xt_Resource_Name_String;
      Resource_Class  : Xt_Resource_Class_String;
      Resource_Type   : Xt_Resource_Type_String;
      Resource_Size   : Cardinal;
      Resource_Offset : Cardinal;
      Default_Type    : Xt_String;
      Default_Address : System.Address;
   end record;
   pragma Convention (C, Xt_Resource);

   type Xt_Resource_List is array (Natural range <>) of aliased Xt_Resource;
   Null_Xt_Resource_List : constant Xt_Resource_List;
   type Xt_Resource_List_Access is access Xt_Resource_List;
   type Xt_Resource_Pointer is access all Xt_Resource;
   Null_Xt_Resource_Pointer : constant Xt_Resource_Pointer;

   function To_Xt_Resource_List (Pointer : in Xt_Resource_Pointer;
                                 Length  : in Cardinal)
     return Xt_Resource_List;


   type Xt_Widget_List is array (Natural range <>) of aliased Widget;
   Null_Xt_Widget_List : constant Xt_Widget_List;
   type Xt_Widget_Pointer is access all Widget;


   function To_Xt_Widget_List (Pointer : in Xt_Widget_Pointer;
                               Length  : in Cardinal)
     return Xt_Widget_List;


--   --  Расширения
--   type Dynamic_Xt_Arg_List is private;
--
--   type Dynamic_Xt_Resource_List is private;


private

   Null_Xt_Arg_List : constant Xt_Arg_List (1 .. 0)
     := (others => (Interfaces.C.Strings.Null_Ptr, 0));

   Dummy_Xt_Resource : constant Xt_Resource
     := (Null_Xt_String, Null_Xt_String, Null_Xt_String, 0, 0, Null_Xt_String,
         System.Null_Address);

   Null_Xt_Resource_List : constant Xt_Resource_List (1 .. 0)
     := (others => Dummy_Xt_Resource);

   Null_Xt_Resource_Pointer : constant Xt_Resource_Pointer := null;


   Null_Xt_Widget_List : constant Xt_Widget_List (1 .. 0)
     := (others => Null_Widget);


end Xt.Ancillary_Types;
