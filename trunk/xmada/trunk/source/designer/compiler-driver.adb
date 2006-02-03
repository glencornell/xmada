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
--! <Unit> Compiler.Driver
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Characters.Handling;
with Ada.Command_Line;

with Generator.Application_Resources;
with Model.Tools;
with Model.Tree.Lists;
with Model.Initialization;

procedure Compiler.Driver is

   use Ada.Command_Line;
   use Model;
   use Model.Tree;
   use Model.Tree.Lists;

   Project     : Node_Id;
   Application : Node_Id;

begin
   Model.Initialization.Initialize;

   if Argument_Count = 1 then
      Project :=
        Model.Tools.XML_To_Project
         (Ada.Characters.Handling.To_Wide_String (Argument (1)));

      Application := First (Applications (Project));

      while Application /= Null_Node loop
         Generator.Application_Resources.Generate (Application);
         Application := Next (Application);
      end loop;
   end if;
end Compiler.Driver;
