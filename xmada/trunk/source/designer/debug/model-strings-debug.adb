------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006
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
--! <Unit> Model.Strings.Debug
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Integer_Wide_Text_IO;

package body Model.Strings.Debug is

   use Ada.Integer_Wide_Text_IO;
   use Ada.Wide_Text_IO;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Statistics
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Statistics (File         : in Ada.Wide_Text_IO.File_Type;
                               Title_Offset : in Ada.Wide_Text_IO.Count;
                               Data_Offset  : in Ada.Wide_Text_IO.Count)
   is
   begin
      Set_Col (File, Title_Offset);
      Put (File, "Strings characters table");
      Set_Col (File, Data_Offset);
      Put (File, Integer (String_Character_Table.Last));
      New_Line (File);

      Set_Col (File, Title_Offset);
      Put (File, "Strings table");
      Set_Col (File, Data_Offset);
      Put (File, Integer (String_Table.Last));
      New_Line (File);
   end Print_Statistics;

end Model.Strings.Debug;
