------------------------------------------------------------------------------
--
--  Mofit Ada Binding
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
--! <Unit> Interfaces.C.Wide_Strings
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Strings;

package Interfaces.C.Wide_Strings is

   pragma Preelaborate;

   type wchar_array_access is access all wchar_array;

   type wchars_ptr is private;

   type wchars_ptr_array is array (size_t range <>) of wchars_ptr;

   Null_Ptr : constant wchars_ptr;

   function To_Wchars_Ptr
     (Item      : in wchar_array_access;
      Nul_Check : in Boolean := False)
      return      wchars_ptr;

   function New_Wchar_Array (Chars : in wchar_array) return wchars_ptr;

   function New_Wide_String (Str : in Wide_String) return wchars_ptr;

   procedure Free (Item : in out wchars_ptr);

   Dereference_Error : exception
     renames Interfaces.C.Strings.Dereference_Error;

   function Value (Item : in wchars_ptr) return wchar_array;

   function Value
     (Item   : in wchars_ptr;
      Length : in size_t)
      return   wchar_array;

   function Value (Item : in wchars_ptr) return Wide_String;

   function Value
     (Item   : in wchars_ptr;
      Length : in size_t)
      return   Wide_String;

   function Wcslen (Item : in wchars_ptr) return size_t;

   procedure Update
     (Item   : in wchars_ptr;
      Offset : in size_t;
      Chars  : in wchar_array;
      Check  : in Boolean := True);

   procedure Update
     (Item   : in wchars_ptr;
      Offset : in size_t;
      Chars  : in Wide_String;
      Check  : in Boolean := True);

   Update_Error : exception renames Interfaces.C.Strings.Update_Error;

private
   type wchars_ptr is access all wchar_t;

   Null_Ptr : constant wchars_ptr := null;
end Interfaces.C.Wide_Strings;
