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
--! <Unit> Designer.Model_Utilities
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model.Tree.Constructors;
with Model.Tree.Lists;

package body Designer.Model_Utilities is

   use Model;
   use Model.Tree;
   use Model.Tree.Constructors;
   use Model.Tree.Lists;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Resource_Value_Copy
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Resource_Value_Copy (Node : in Model.Node_Id)
     return Model.Node_Id
   is
      Result : Node_Id;

   begin
      case Node_Kind (Resource_Type (Resource_Specification (Node))) is
         when Node_Predefined_Resource_Type =>
            case Type_Kind (Resource_Type (Resource_Specification (Node))) is
               when Type_Unspecified =>
                  raise Program_Error;

               when Type_Position | Type_Dimension | Type_C_Int =>
                  Result := Create_Integer_Resource_Value;
                  Set_Resource_Value (Result, Integer'(Resource_Value (Node)));

               when others =>
                  raise Program_Error;
            end case;

         when Node_Enumerated_Resource_Type =>
            Result := Create_Enumeration_Resource_Value;
            Set_Resource_Value (Result, Node_Id'(Resource_Value (Node)));

         when Node_Widget_Reference_Resource_Type =>
            Result := Create_Widget_Reference_Resource_Value;
            Set_Resource_Value (Result, Node_Id'(Resource_Value (Node)));

         when others =>
            raise Program_Error;
      end case;

      Set_Resource_Specification (Result, Resource_Specification (Node));

      return Result;
   end Create_Resource_Value_Copy;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Find_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Find_Resource_Value
    (Resources                  : in Model.List_Id;
     The_Resource_Specification : in Model.Node_Id)
       return Model.Node_Id
   is
      Aux : Node_Id := First (Resources);

   begin
      while Aux /= Null_Node loop
         if Resource_Specification (Aux) = The_Resource_Specification then
            exit;
         end if;

         Aux := Next (Aux);
      end loop;

      return Aux;
   end Find_Resource_Value;

end Designer.Model_Utilities;
