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
--! <Unit> Model.Tree
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model.Names;

package body Model.Tree.Xm_Ada is

   CCFN_Counter : Integer := 0;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Convenience_Create_Function_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Convenience_Create_Function_Name (Widget_Class : in Node_Id)
     return Name_Id
   is
       pragma Assert (Node_Kind (Widget_Class) = Node_Widget_Class);
   begin
      CCFN_Counter := CCFN_Counter + 1;

      if CCFN_Counter = 1 then
         return Model.Names.Enter ("Xm_Message_Box.Xm_Create_Message_Box");

      elsif CCFN_Counter = 2 then
         return Model.Names.Enter ("Xm_Form.Xm_Create_Form");

      elsif CCFN_Counter = 3 then
         return Model.Names.Enter ("Xm_Text.Xm_Create_Text");
      end if;

      raise Program_Error;
   end Convenience_Create_Function_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Name_String
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Resource_Name_String (Widget_Class : in Node_Id)
     return Name_Id
   is
       pragma Assert (Node_Kind (Widget_Class) = Node_Resource_Specification);
   begin
      raise Program_Error;

      return Null_Name;
   end Resource_Name_String;

end Model.Tree.Xm_Ada;
