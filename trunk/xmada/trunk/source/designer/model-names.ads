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
--! <Unit> Model.Names
--! <Purpose>
--!   Пакет содержит подпрограммы для работы с таблицей имён.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;

with Model.Allocations;

package Model.Names is

   function Find (Name : in Wide_String) return Name_Id;

   function Enter (Name : in Wide_String) return Name_Id;

   function Image (Name : in Name_Id) return Wide_String;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose> Производит начальную инициализацию внутренних структур.
   --! При повторном вызове осуществляет освобождение используемых ресурсов
   --! и повторную начальную инициализацию внутренних структур.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialize;

private

   package Name_Character_Table is
     new GNAT.Table
          (Table_Component_Type => Wide_Character,
           Table_Index_Type     => Natural,
           Table_Low_Bound      => Natural'First + 1,
           Table_Initial        => Allocations.Name_Character_Table_Initial,
           Table_Increment      => Allocations.Name_Character_Table_Increment);

   type Name_Record is record
      First : Positive;
      Last  : Natural;
   end record;

   package Name_Table is
     new GNAT.Table
          (Table_Component_Type => Name_Record,
           Table_Index_Type     => Name_Id,
           Table_Low_Bound      => Name_Id'First + 1,
           Table_Initial        => Allocations.Name_Table_Initial,
           Table_Increment      => Allocations.Name_Table_Increment);

end Model.Names;
