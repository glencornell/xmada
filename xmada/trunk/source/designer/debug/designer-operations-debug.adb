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
--! <Unit> Designer.Operations.Debug
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Wide_Text_IO;

with Model.Debug;
with Model.Debug.Designer;
pragma Warnings (Off, Model.Debug.Designer);
--  Используется только для включения дополнительных подпрограмм вывода
--  отладочной информации, специфической для дизайнера.

with Model.Names.Debug;
with Model.Tree.Debug;

package body Designer.Operations.Debug is

   use Ada.Wide_Text_IO;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Dump_Tree
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Dump_Tree is
      File : File_Type;

   begin
      Create (File, Out_File, "project_tree_dump.txt");

      Model.Debug.Print (File, Project);

      Close (File);

   exception
      when others =>
         if Is_Open (File) then
            Close (File);
         end if;

         raise;
   end Dump_Tree;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Tables_Statistics
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Tables_Statistics is
      File : File_Type;

   begin
      Create (File, Out_File, "tables_statistics.txt");

      Put_Line (File, "Internal tables statistics");
      Put_Line (File, "--------------------------");
      New_Line (File);
      Model.Names.Debug.Print_Statistics (File, 3, 30);
      Model.Tree.Debug.Print_Statistics (File, 3, 30);

      Close (File);

   exception
      when others =>
         if Is_Open (File) then
            Close (File);
         end if;

         raise;
   end Tables_Statistics;

end Designer.Operations.Debug;
