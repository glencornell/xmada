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
--! <Unit> Model.Queries
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model.Names;
with Model.Tree;

package body Model.Queries is

   use Model.Names;
   use Model.Tree;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Application_Class_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Application_Class_Image (Node : in Node_Id) return Wide_String is
   begin
      return Image (Application_Class_Name (Node));
   end Application_Class_Image;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Internal_Name_Image
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Internal_Name_Image (Node : in Node_Id) return Wide_String is
   begin
      return Image (Internal_Name (Node));
   end Internal_Name_Image;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Name_Image
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Name_Image (Node : in Node_Id) return Wide_String is
   begin
      return Image (Name (Node));
   end Name_Image;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Class_Name_Image
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Resource_Class_Name_Image (Node : in Node_Id) return Wide_String is
   begin
      return Image (Resource_Class_Name (Node));
   end Resource_Class_Name_Image;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Name_Image
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Resource_Name_Image (Node : in Node_Id) return Wide_String is
   begin
      return Image (Resource_Name (Node));
   end Resource_Name_Image;

end Model.Queries;