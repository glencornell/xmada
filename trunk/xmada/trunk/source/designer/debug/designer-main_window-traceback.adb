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
--! <Unit> Designer.Main_Window.Traceback
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Characters.Handling;
with GNAT.Traceback.Symbolic;

package body Designer.Main_Window.Traceback is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Symbolic_Traceback
   --!    <Purpose> Выделяет из исключения информацию о стеке вызова,
   --! преобразует её в символьный вид и возвращает в виде строки.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Symbolic_Traceback (X : in Ada.Exceptions.Exception_Occurrence)
     return Wide_String;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Symbolic_Traceback
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Symbolic_Traceback (X : in Ada.Exceptions.Exception_Occurrence)
     return Wide_String
   is
   begin
      return
        Ada.Characters.Handling.To_Wide_String
         (GNAT.Traceback.Symbolic.Symbolic_Traceback (X));
   end Symbolic_Traceback;

begin
   Symbolic_Traceback_Hook := Symbolic_Traceback'Access;
end Designer.Main_Window.Traceback;
