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
--! <Purpose>
--!   Пакет содержит разнообразные вспомогательные подпрограммы, используемые
--! дизайнером.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Strings;

package Designer.Utilities is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> To_Locale_String
   --!    <Purpose> Производит преобразование строки в представление,
   --! используемое в текущей локали библиотеки C.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function To_Locale_String (Item : in Wide_String) return String;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> From_Locale_String
   --!    <Purpose> Производит преобразование строки из представления,
   --! используемого текущей локалью библиотеки C в широкую строку Ada.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function From_Locale_String (Item : in Interfaces.C.Strings.chars_ptr)
     return Wide_String;

--   ---------------------------------------------------------------------------
--   --! <Subprogram>
--   --!    <Unit> To_Locale_String
--   --!    <Purpose> Производит преобразование строки в представление,
--   --! используемое в текущей локали библиотеки C.
--   --!    <Exceptions>
--   ---------------------------------------------------------------------------
--   function To_Locale_String (Item : in Wide_String)
--     return Interfaces.C.Strings.chars_ptr;

--   ---------------------------------------------------------------------------
--   --! <Subprogram>
--   --!    <Unit> To_Locale_String
--   --!    <Purpose> Производит преобразование строки в представление,
--   --! используемое в текущей локали библиотеки C.
--   --!    <Exceptions>
--   ---------------------------------------------------------------------------
--   function To_Locale_String (Item : in Wide_String)
--     return Interfaces.C.char_array;

end Designer.Utilities;
