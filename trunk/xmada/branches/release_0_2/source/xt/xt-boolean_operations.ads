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
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Xt.Boolean_Operations is


   function "=" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean;

   function "=" (Left : in Boolean;    Right : in Xt_Boolean)
     return Xt_Boolean;

   function "=" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean;

   function "=" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean;

   function "=" (Left : in Boolean;    Right : in Xt_Boolean)
     return Boolean;

   function "=" (Left : in Boolean;    Right : in Boolean)
     return Xt_Boolean;


   function "and" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean;

   function "and" (Left : in Boolean;    Right : in Xt_Boolean)
     return Xt_Boolean;

   function "and" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean;

   function "and" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean;

   function "and" (Left : in Boolean;    Right : in Xt_Boolean)
     return Boolean;

   function "and" (Left : in Boolean;    Right : in Boolean)
     return Xt_Boolean;


   function "or" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean;

   function "or" (Left : in Boolean;    Right : in Xt_Boolean)
     return Xt_Boolean;

   function "or" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean;

   function "or" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean;

   function "or" (Left : in Boolean;    Right : in Xt_Boolean)
     return Boolean;

   function "or" (Left : in Boolean;    Right : in Boolean)
     return Xt_Boolean;


   function "xor" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean;

   function "xor" (Left : in Boolean;    Right : in Xt_Boolean)
     return Xt_Boolean;

   function "xor" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean;

   function "xor" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean;

   function "xor" (Left : in Boolean;    Right : in Xt_Boolean)
     return Boolean;

   function "xor" (Left : in Boolean;    Right : in Boolean)
     return Xt_Boolean;


   function "not" (Right : in Boolean) return Xt_Boolean;

   function "not" (Right : in Xt_Boolean) return Boolean;


private

   pragma Inline ("=");
   pragma Inline ("and");
   pragma Inline ("not");
   pragma Inline ("or");
   pragma Inline ("xor");

end Xt.Boolean_Operations;
