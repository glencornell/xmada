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
--! <Unit> Designer.Model_Utilities
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model.Names;
with Model.Tree.Constructors;
with Model.Tree.Lists;

with Designer.Main_Window;
package body Designer.Model_Utilities is

   use Model;
   use Model.Names;
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

               when Type_Position
                 | Type_Dimension
                 | Type_C_Int
                 | Type_C_Short
               =>
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

         when Node_Xm_String_Resource_Type =>
            Result := Create_Xm_String_Resource_Value;
            Set_Resource_Value (Result, String_Id'(Resource_Value (Node)));

         when others =>
            raise Program_Error;
      end case;

      Set_Resource_Specification (Result, Resource_Specification (Node));

      return Result;
   end Create_Resource_Value_Copy;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete_Node
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Delete_Node (Node : in Model.Node_Id) is
      pragma Assert (Node /= Null_Node);

      List    : List_Id;
      Current : Node_Id;
      Parent  : Node_Id;

   begin
      --  Удаляем потомков.

      case Node_Kind (Node) is
         when Node_Application     =>
            List := Component_Classes (Node);

            if List /= Null_List then
               Current := First (List);

               while Current /= Null_Node loop
                  Delete_Node (Current);

                  Current := Next (Current);
               end loop;

               Free (List);
            end if;

            Set_Component_Classes (Node, Null_List);

         when Node_Widget_Instance =>
            List := Children (Node);

            if List /= Null_List then
               Current := First (List);

               while Current /= Null_Node loop
                  Delete_Node (Current);

                  Current := Next (Current);
               end loop;
            end if;

         when Node_Component_Class =>
            Current := Root (Node);

            if Current /= Null_Node then
               Delete_Node (Current);
            end if;
         when others =>
            null;
      end case;

      Main_Window.Delete_Item (Node);
      --  Рассылаем уведомления о удалении свмого узла.

      --  Говорим родителю, что его потомок убился.

      Parent := Parent_Node (Node);

      if Parent /= Null_Node then
         case Node_Kind (Parent) is
            when Node_Widget_Instance | Node_Project  =>
               Remove (Node);

            when  Node_Component_Class =>
               Set_Root (Parent, Null_Node);

            when others =>
               null;
         end case;
      end if;
   end Delete_Node;

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

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> New_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function New_Name (Prefix : in Wide_String) return Name_Id is
   begin
      for J in Positive'Range loop
         declare
            Suffix : constant Wide_String := Positive'Wide_Image (J);
            Name   : constant Wide_String
              := Prefix & Suffix (Suffix'First + 1 .. Suffix'Last);

         begin
            if Find (Name) = Null_Name then
               return Enter (Name);
            end if;
         end;
      end loop;

      raise Program_Error;
   end New_Name;

end Designer.Model_Utilities;
