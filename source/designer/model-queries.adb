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
with Model.Xt_Motif;

package body Model.Queries is

   use Model.Names;
   use Model.Tree;
   use Model.Xt_Motif;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Application_Class_Name_Image
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Application_Class_Name_Image (Node : in Node_Id)
     return Wide_String
   is
   begin
      return Image (Application_Class_Name (Node));
   end Application_Class_Name_Image;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Enclosing_Component_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Enclosing_Component_Class (Node : in Node_Id) return Node_Id is
      Aux : Node_Id := Node;

   begin
      while Aux /= Null_Node loop
         if Node_Kind (Aux) = Node_Component_Class then
            return Aux;
         end if;

         Aux := Parent_Node (Aux);
      end loop;

      return Null_Node;
   end Enclosing_Component_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Enclosing_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Enclosing_Project (Node : in Node_Id) return Node_Id is
      Aux : Node_Id := Node;

   begin
      while Aux /= Null_Node loop
         if Node_Kind (Aux) = Node_Project then
            return Aux;
         end if;

         Aux := Parent_Node (Aux);
      end loop;

      return Null_Node;
   end Enclosing_Project;

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
   --!    <Unit> Internal_Resource_Name_Image
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Internal_Resource_Name_Image (Node : in Node_Id)
     return Wide_String
   is
   begin
      return Image (Internal_Resource_Name (Node));
   end Internal_Resource_Name_Image;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Gadget
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Is_Gadget (Node : in Node_Id) return Boolean is
      Aux : Node_Id := Node;

   begin
      if Aux /= Null_Node
        and then Node_Kind (Aux) = Node_Widget_Instance
      then
         Aux := Class (Aux);
      end if;

      while Aux /= Null_Node loop
         if Aux = Xt_Motif_Gadget_Widget_Class then
            return True;
         end if;

         Aux := Super_Class (Aux);
      end loop;

      return False;
   end Is_Gadget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Manager
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Is_Manager (Node : in Node_Id) return Boolean is
      Aux : Node_Id := Node;

   begin
      if Aux /= Null_Node
        and then Node_Kind (Aux) = Node_Widget_Instance
      then
         Aux := Class (Aux);
      end if;

      while Aux /= Null_Node loop
         if Aux = Xt_Motif_Manager_Widget_Class then
            return True;
         end if;

         Aux := Super_Class (Aux);
      end loop;

      return False;
   end Is_Manager;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Primitive
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Is_Primitive (Node : in Node_Id) return Boolean is
      Aux : Node_Id := Node;

   begin
      if Aux /= Null_Node
        and then Node_Kind (Aux) = Node_Widget_Instance
      then
         Aux := Class (Aux);
      end if;

      while Aux /= Null_Node loop
         if Aux = Xt_Motif_Primitive_Widget_Class then
            return True;
         end if;

         Aux := Super_Class (Aux);
      end loop;

      return False;
   end Is_Primitive;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Shell
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Is_Shell (Node : in Node_Id) return Boolean is
      Aux : Node_Id := Node;

   begin
      if Aux /= Null_Node
        and then Node_Kind (Aux) = Node_Widget_Instance
      then
         Aux := Class (Aux);
      end if;

      while Aux /= Null_Node loop
         if Aux = Xt_Motif_Shell_Widget_Class then
            return True;
         end if;

         Aux := Super_Class (Aux);
      end loop;

      return False;
   end Is_Shell;

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
