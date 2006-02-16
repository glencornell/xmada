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
--! <Unit> XML_Tools.Allocation
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package XML_Tools.Allocation is

   --  Таблица имён в пакете Names.

   Names_Initial               : constant := 200;
   Names_Increment             : constant := 100;

   --  Таблица символов имён в пакете Names.

   Name_Characters_Initial     : constant := 100;
   Name_Characters_Increment   : constant := 100;

   --  Таблица элементов в пакете Elements.

   Elements_Initial            : constant := 100;
   Elements_Increment          : constant := 100;

   --  Таблица строк в пакете Strings.

   Strings_Initial             : constant := 100;
   Strings_Increment           : constant := 100;

   --  Таблица символов строк в пакете Strings.

   String_Characters_Initial   : constant := 100;
   String_Characters_Increment : constant := 100;

   --  Таблица атрибутов в пакете Attributes.

   Attributes_Initial          : constant := 100;
   Attributes_Increment        : constant := 100;

   --  Таблица стека вложенности элементов в пакете Parser.

   Element_Stack_Initial       : constant := 100;
   Element_Stack_Increment     : constant := 100;

end XML_Tools.Allocation;
