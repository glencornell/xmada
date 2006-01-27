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
--  $Source$
--  $Revision$ $Date$ $Author$
------------------------------------------------------------------------------
with Model.Tree.Lists;

package body Model.Tree is

   use Model.Tree.Lists;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Internal_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Internal_Name (Node : in Node_Id) return Name_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumerated_Resource_Type_Value_Specification
          or else Node_Kind (Node) = Node_Enumerated_Resource_Type);

      case Node_Kind (Node) is
         when Node_Enumerated_Resource_Type_Value_Specification =>
            return Node_Table.Table (Node).ERTVS_Internal_Name;

         when Node_Enumerated_Resource_Type =>
            return Node_Table.Table (Node).ERT_Internal_Name;

         when others =>
            raise Program_Error;
      end case;
   end Internal_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Name (Node : in Node_Id) return Name_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumerated_Resource_Type_Value_Specification
          or else Node_Kind (Node) = Node_Enumerated_Resource_Type);

      case Node_Kind (Node) is
         when Node_Enumerated_Resource_Type_Value_Specification =>
            return Node_Table.Table (Node).ERTVS_Name;

         when Node_Enumerated_Resource_Type =>
            return Node_Table.Table (Node).ERT_Name;

         when others =>
            raise Program_Error;
      end case;
   end Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Node_Kind
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Node_Kind (Node : in Node_Id) return Node_Kinds is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);

      return Node_Table.Table (Node).Kind;
   end Node_Kind;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Parent_Node
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Parent_Node (Node : in Node_Id) return Node_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);

      if Node_Table.Table (Node).List /= Null_List then
         return Parent_Node (Node_Table.Table (Node).List);

      else
         return Node_Table.Table (Node).Parent;
      end if;
   end Parent_Node;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Types
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Resource_Types (Node : in Node_Id) return List_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Set);

      return Node_Table.Table (Node).Resource_Types;
   end Resource_Types;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Internal_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Internal_Name (Node : in Node_Id; Value : in Name_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumerated_Resource_Type_Value_Specification
          or else Node_Kind (Node) = Node_Enumerated_Resource_Type);

      case Node_Kind (Node) is
         when Node_Enumerated_Resource_Type_Value_Specification =>
            Node_Table.Table (Node).ERTVS_Internal_Name := Value;

         when Node_Enumerated_Resource_Type =>
            Node_Table.Table (Node).ERT_Internal_Name := Value;

         when others =>
            raise Program_Error;
      end case;
   end Set_Internal_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Name (Node : in Node_Id; Value : in Name_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumerated_Resource_Type_Value_Specification
          or else Node_Kind (Node) = Node_Enumerated_Resource_Type);

      case Node_Kind (Node) is
         when Node_Enumerated_Resource_Type_Value_Specification =>
            Node_Table.Table (Node).ERTVS_Name := Value;

         when Node_Enumerated_Resource_Type =>
            Node_Table.Table (Node).ERT_Name := Value;

         when others =>
            raise Program_Error;
      end case;
   end Set_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Types
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Types (Node : in Node_Id; Value : in List_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Set);

      Node_Table.Table (Node).Resource_Types := Value;
      Set_Parent_Node (Value, Node);
   end Set_Resource_Types;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Value_Specifications
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Value_Specifications (Node  : in Node_Id;
                                       Value : in List_Id)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Enumerated_Resource_Type);

      Node_Table.Table (Node).Value_Specifications := Value;
      Set_Parent_Node (Value, Node);
   end Set_Value_Specifications;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Value_Specifications
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Value_Specifications (Node : in Node_Id) return List_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Enumerated_Resource_Type);

      return Node_Table.Table (Node).Value_Specifications;
   end Value_Specifications;

end Model.Tree;
