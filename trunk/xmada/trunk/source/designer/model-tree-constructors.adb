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
--! <Unit> Model.Tree.Constructors
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package body Model.Tree.Constructors is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Enumerated_Resource_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Enumerated_Resource_Type return Node_Id is
   begin
      Node_Table.Append
       ((Kind                 => Node_Enumerated_Resource_Type,
         Parent               => Null_Node,
         List                 => Null_List,
         Previous             => Null_Node,
         Next                 => Null_Node,
         ERT_Name             => Null_Name,
         ERT_Internal_Name    => Null_Name,
         Value_Specifications => Null_List));

      return Node_Table.Last;
   end Create_Enumerated_Resource_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Enumerated_Resource_Type_Value_Specification
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Enumerated_Resource_Type_Value_Specification
     return Node_Id
   is
   begin
      Node_Table.Append
       ((Kind                =>
           Node_Enumerated_Resource_Type_Value_Specification,
         Parent              => Null_Node,
         List                => Null_List,
         Previous            => Null_Node,
         Next                => Null_Node,
         ERTVS_Name          => Null_Name,
         ERTVS_Internal_Name => Null_Name));

      return Node_Table.Last;
   end Create_Enumerated_Resource_Type_Value_Specification;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget_Set
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Widget_Set return Node_Id is
   begin
      Node_Table.Append ((Kind           => Node_Widget_Set,
                          Parent         => Null_Node,
                          List           => Null_List,
                          Previous       => Null_Node,
                          Next           => Null_Node,
                          Resource_Types => Null_List,
                          Widget_Classes => Null_List));

      return Node_Table.Last;
   end Create_Widget_Set;

end Model.Tree.Constructors;
