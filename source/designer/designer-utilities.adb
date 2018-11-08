------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006  TechnoServ A/S
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
--! along with XmAda; see the file COPYING. If not, write to the Free
--! Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
--! USA.
--!
--! As a special exception, if other files instantiate generics from this
--! unit, or you link this unit with other files to produce an executable,
--! this unit does not by itself cause the resulting executable to be
--! covered by the GNU General Public License. This exception does not
--! however invalidate any other reasons why the executable file might be
--! covered by the GNU Public License.
--!
--! XmAda maintained by TechnoServ A/S (email: vgodunko@rostel.ru)
--!
--! <Unit> Designer.Utilities
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Strings;

package body Designer.Utilities is

   use Interfaces.C;
   use Interfaces.C.Strings;

--     package Thin is

--        function MB_CUR_MAX return Interfaces.C.size_t;

--        --  function wcstombs (Destination : in Interfaces.C.char_array;
--        --                     Source      : in Interfaces.C.wchar_array;
--        --                     Length      : in Interfaces.C.size_t)
--        --    return Interfaces.C.size_t;

--        --  function mbstowcs (Destination : in Interfaces.C.Strings.wchars_ptr;
--        --                     Source      : in Interfaces.C.Strings.chars_ptr;
--        --                     Length      : in Interfaces.C.size_t)
--        --    return Interfaces.C.size_t;

--        --  function mbstowcs (Destination : in Interfaces.C.wchar_array;
--        --                     Source      : in Interfaces.C.Strings.chars_ptr;
--        --                     Length      : in Interfaces.C.size_t)
--        --    return Interfaces.C.size_t;

--     private

--        pragma Import (C, MB_CUR_MAX, "__XmAdaDesigner_MB_CUR_MAX");
--  --      pragma Import (C, mbstowcs, "mbstowcs");
--  --      pragma Import (C, wcstombs, "wcstombs");

--     end Thin;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> From_Locale_String
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function From_Locale_String (Item : in Interfaces.C.Strings.chars_ptr)
     return String
   is
   begin
      return Interfaces.C.Strings.Value(Item);
   end From_Locale_String;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> To_Locale_String
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function To_Locale_String (Item : in String) return String is
   begin
      return Item;
   end To_Locale_String;

--   ---------------------------------------------------------------------------
--   --! <Subprogram>
--   --!    <Unit> To_Locale_String
--   --!    <ImplementationNotes>
--   ---------------------------------------------------------------------------
--   function To_Locale_String (Item : in String)
--     return Interfaces.C.char_array
--   is
--      C_Item : constant wchar_array := To_C (Item);
--      Result : char_array (0 .. C_Item'Length * Thin.MB_CUR_MAX);
--      pragma Warnings (Off, Result);
--      --  C_Name неявно заполняется в wcstombs.
--
--      Length : constant size_t
--        := Thin.wcstombs (Result, C_Item, Result'Length);
--
--   begin
--      if Length = size_t'Last then
--         --  XXX Этот факт необходимо проверить. В соответствии со
--         --  спецификацией wcstombs должно быть (size_t)(-1).
--
--         raise Program_Error;
--      end if;
--
--      return Result (Result'First .. Length);
--   end To_Locale_String;

end Designer.Utilities;
