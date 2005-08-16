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
--! <Unit> Xt
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package body Xt is

   use Interfaces.C;

   function "=" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if (unsigned_char (Left) /= unsigned_char (Xt_False)) =
         (unsigned_char (Right) /= unsigned_char (Xt_False))
      then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "=";


   function "and" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if unsigned_char (Left) /= unsigned_char (Xt_False) and
         unsigned_char (Right) /= unsigned_char (Xt_False)
      then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "and";


   function "not" (Right : in Xt_Boolean) return Xt_Boolean is
   begin
      if unsigned_char (Right) = unsigned_char (Xt_False) then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "not";


   function "or" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if unsigned_char (Left) /= unsigned_char (Xt_False) or
         unsigned_char (Right) /= unsigned_char (Xt_False)
      then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "or";


   function "xor" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if unsigned_char (Left) /= unsigned_char (Xt_False) xor
         unsigned_char (Right) /= unsigned_char (Xt_False)
      then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "xor";


   function To_Boolean (Item : in Xt_Boolean) return Boolean is
   begin
      return unsigned_char (Item) /= unsigned_char (Xt_False);
   end To_Boolean;


   function To_Xt_Boolean (Item : in Boolean) return Xt_Boolean is
   begin
      if Item then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end To_Xt_Boolean;


end Xt;
