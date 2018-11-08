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
with Ada.Text_IO;

with Generator.Application_Resources;
with Generator.Prototype.Component_Class;
with Model.Tools;
with Model.Tree.Lists;
with Model.Initialization.Xm_Ada;

procedure Compiler.Driver is

   use Ada.Command_Line;
   use Model;
   use Model.Tree;
   use Model.Tree.Lists;

   procedure Usage;

   procedure Usage is
   begin
      Ada.Text_IO.Put_Line ("compiler <mode> <file>");
      Ada.Text_IO.Put_Line
       ("   --application-resources   Generate application resources files");
      Ada.Text_IO.Put_Line
       ("   --code                    Generate Ada source code");
   end Usage;

   Project         : Node_Id;
   Application     : Node_Id;
   Component_Class : Node_Id;

begin
   Model.Initialization.Initialize;
   Model.Initialization.Xm_Ada.Initialize;

   if Argument_Count = 2 then
      if Argument (1) = "--application-resources" then
         Project :=
           Model.Tools.XML_To_Project (Argument (2));

         Application := First (Applications (Project));

         while Application /= Null_Node loop
            Generator.Application_Resources.Generate (Application);
            Application := Next (Application);
         end loop;

      elsif Argument (1) = "--code" then
         Project :=
           Model.Tools.XML_To_Project (Argument (2));

         Application := First (Applications (Project));

         while Application /= Null_Node loop
            Component_Class := First (Component_Classes (Application));

            while Component_Class /= Null_Node loop
               Generator.Prototype.Component_Class.Generate (Component_Class);

               Component_Class := Next (Component_Class);
            end loop;

            Application := Next (Application);
         end loop;

      else
         Usage;
      end if;

   else
      Usage;
   end if;
end Compiler.Driver;
