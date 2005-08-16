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
--! <Unit> Xlib.Implementation
--! <ImplementationNotes>
--! <PortabilityIssues>
--!   This module is GNAT specific. It use unchecked conversion between
--! general access type and address and address arithmetic.
--!
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
with System.Storage_Elements;

package body Xlib.Implementation is

   use System;
   use System.Storage_Elements;

   procedure Check (The_Display : in Display) is
   begin
      if The_Display = Null_Display then
         raise Invalid_Display_Error;
      end if;
   end Check;


   procedure Check (The_GC : in Graphic_Context) is
   begin
      if The_GC = Null_Graphic_Context then
         raise Invalid_Graphic_Context_Error;
      end if;
   end Check;


   procedure Check (The_Screen : in Screen) is
   begin
      if The_Screen = Null_Screen then
         raise Invalid_Screen_Error;
      end if;
   end Check;


   function Generic_Terminated_To_Element_List (Pointer : in Element_Pointer)
     return Element_List
   is
      Element_Size : constant Storage_Offset
        := (Element_List'Component_Size + Storage_Unit - 1) / Storage_Unit;
      Aux          : Element_Pointer := Pointer;
      Length       : Natural := 0;

      function To_Address is
        new Ada.Unchecked_Conversion (Element_Pointer, Address);

      function To_Pointer is
        new Ada.Unchecked_Conversion (Address, Element_Pointer);
   begin
      if Pointer = null then
         raise Dereference_Error;
      end if;

      while Aux.all /= Terminator loop
         Length := Length + 1;
         Aux    := To_Pointer (To_Address (Aux) + Element_Size);
      end loop;

      declare
         Return_Value : Element_List (0 .. Length - 1);
      begin
         Aux := Pointer;
         for J in Return_Value'Range loop
            Return_Value (J) := Aux.all;
            Aux              := To_Pointer (To_Address (Aux) + Element_Size);
         end loop;

         return Return_Value;
      end;
   end Generic_Terminated_To_Element_List;


   function Generic_To_Element_List (Pointer : in Element_Pointer;
                                     Length  : in Natural)
     return Element_List
   is
--      pragma Suppress (Index_Check);
--      pragma Suppress (Access_Check);

      Element_Size : constant Storage_Offset
        := (Element_List'Component_Size + Storage_Unit - 1) / Storage_Unit;
      Aux          : Element_Pointer := Pointer;
      Return_Value : Element_List (0 .. Length - 1);

      function To_Address is
        new Ada.Unchecked_Conversion (Element_Pointer, Address);

      function To_Pointer is
        new Ada.Unchecked_Conversion (Address, Element_Pointer);
   begin
      if Pointer = null then
         raise Dereference_Error;
      end if;

      for J in Return_Value'Range loop
         Return_Value (J) := Aux.all;
         Aux              := To_Pointer (To_Address (Aux) + Element_Size);
      end loop;

      return Return_Value;
   end Generic_To_Element_List;


end Xlib.Implementation;
