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
--! <Unit> Xt.Boolean_Operations
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package body Xt.Boolean_Operations is

   use Interfaces.C;

   Default_Xt_True  : constant Xt_Boolean := 1;


   function "=" (Left : in Boolean; Right : in Boolean) return Xt_Boolean is
   begin
      if Left = Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "=";


   function "=" (Left : in Boolean; Right : in Xt_Boolean) return Boolean is
   begin
      return Left = (unsigned_char (Right) /= unsigned_char (Xt_False));
   end "=";


   function "=" (Left : in Boolean; Right : in Xt_Boolean) return Xt_Boolean is
   begin
      if Left = (unsigned_char (Right) /= unsigned_char (Xt_False)) then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "=";


   function "=" (Left : in Xt_Boolean; Right : in Boolean) return Boolean is
   begin
      return (unsigned_char (Left) /= unsigned_char (Xt_False)) = Right;
   end "=";


   function "=" (Left : in Xt_Boolean; Right : in Boolean) return Xt_Boolean is
   begin
      if (unsigned_char (Left) /= unsigned_char (Xt_False)) = Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "=";


   function "=" (Left : in Xt_Boolean; Right : in Xt_Boolean) return Boolean is
   begin
      return (unsigned_char (Left) /= unsigned_char (Xt_False)) =
             (unsigned_char (Right) /= unsigned_char (Xt_False));
   end "=";


   function "and" (Left : in Boolean; Right : in Boolean) return Xt_Boolean is
   begin
      if Left and Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "and";


   function "and" (Left : in Boolean; Right : in Xt_Boolean) return Boolean is
   begin
      return Left and unsigned_char (Right) /= unsigned_char (Xt_False);
   end "and";


   function "and" (Left : in Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if Left and unsigned_char (Right) /= unsigned_char (Xt_False) then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "and";


   function "and" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean is
   begin
      return unsigned_char (Left) /= unsigned_char (Xt_False) and Right;
   end "and";


   function "and" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean is
   begin
      if unsigned_char (Left) /= unsigned_char (Xt_False) and Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "and";


   function "and" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean is
   begin
      return unsigned_char (Left) /= unsigned_char (Xt_False) and
             unsigned_char (Right) /= unsigned_char (Xt_False);
   end "and";


   function "not" (Right : in Boolean) return Xt_Boolean is
   begin
      if Right then
         return Xt_False;
      else
         return Default_Xt_True;
      end if;
   end "not";


   function "not" (Right : in Xt_Boolean) return Boolean is
   begin
      return unsigned_char (Right) = unsigned_char (Xt_False);
   end "not";


   function "or" (Left : in Boolean; Right : in Boolean) return Xt_Boolean is
   begin
      if Left or Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "or";


   function "or" (Left : in Boolean; Right : in Xt_Boolean) return Boolean is
   begin
      return Left or unsigned_char (Right) /= unsigned_char (Xt_False);
   end "or";


   function "or" (Left : in Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if Left or unsigned_char (Right) /= unsigned_char (Xt_False) then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "or";


   function "or" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean is
   begin
      return unsigned_char (Left) /= unsigned_char (Xt_False) or Right;
   end "or";


   function "or" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean is
   begin
      if unsigned_char (Left) /= unsigned_char (Xt_False) or Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "or";


   function "or" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean is
   begin
      return unsigned_char (Left) /= unsigned_char (Xt_False) or
             unsigned_char (Right) /= unsigned_char (Xt_False);
   end "or";


   function "xor" (Left : in Boolean; Right : in Boolean) return Xt_Boolean is
   begin
      if Left xor Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "xor";


   function "xor" (Left : in Boolean; Right : in Xt_Boolean) return Boolean is
   begin
      return Left xor unsigned_char (Right) /= unsigned_char (Xt_False);
   end "xor";


   function "xor" (Left : in Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if Left xor unsigned_char (Right) /= unsigned_char (Xt_False) then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "xor";


   function "xor" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean is
   begin
      return unsigned_char (Left) /= unsigned_char (Xt_False) xor Right;
   end "xor";


   function "xor" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean is
   begin
      if unsigned_char (Left) /= unsigned_char (Xt_False) xor Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "xor";


   function "xor" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean is
   begin
      return unsigned_char (Left) /= unsigned_char (Xt_False) xor
             unsigned_char (Right) /= unsigned_char (Xt_False);
   end "xor";


end Xt.Boolean_Operations;
