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
with Model.Tree.Lists;

package body Model.Tree is

   use Model.Tree.Lists;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Application_Class_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Application_Class_Name (Node : in Node_Id) return Name_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Application);

      return Node_Table.Table (Node).Application_Class_Name;
   end Application_Class_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Applications
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Applications (Node : in Node_Id) return List_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Project);

      return Node_Table.Table (Node).Applications;
   end Applications;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Children
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Children (Node : in Node_Id) return List_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Instance);

      return Node_Table.Table (Node).Children;
   end Children;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Class (Node : in Node_Id) return Node_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Instance);

      return Node_Table.Table (Node).Class;
   end Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Component_Classes
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Component_Classes (Node : in Node_Id) return List_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Application);

      return Node_Table.Table (Node).Component_Classes;
   end Component_Classes;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Constraint_Resources
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Constraint_Resources (Node : in Node_Id) return List_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class
                       or else Node_Kind (Node) = Node_Widget_Instance);

      case Node_Kind (Node) is
         when Node_Widget_Class =>
            return Node_Table.Table (Node).WC_Constraint_Resources;

         when Node_Widget_Instance =>
            return Node_Table.Table (Node).WI_Constraint_Resources;

         when others =>
            raise Program_Error;
      end case;
   end Constraint_Resources;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> File_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function File_Name (Node : in Node_Id) return Name_Id is
      begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Project);

      return Node_Table.Table (Node).File_Name;
   end File_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Imported_Widget_Sets
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Imported_Widget_Sets (Node : in Node_Id) return List_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Project);

      return Node_Table.Table (Node).Imported_Widget_Sets;
   end Imported_Widget_Sets;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize is
   begin
      Node_Table.Init;
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Internal_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Internal_Name (Node : in Node_Id) return Name_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumerated_Resource_Type
          or else Node_Kind (Node) = Node_Enumeration_Value_Specification
          or else Node_Kind (Node) = Node_Predefined_Resource_Type
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Type);

      case Node_Kind (Node) is
         when Node_Enumerated_Resource_Type =>
            return Node_Table.Table (Node).ERT_Internal_Name;

         when Node_Enumeration_Value_Specification =>
            return Node_Table.Table (Node).EVS_Internal_Name;

         when Node_Predefined_Resource_Type =>
            return Node_Table.Table (Node).PRT_Internal_Name;

         when Node_Widget_Reference_Resource_Type =>
            return Node_Table.Table (Node).WRRT_Internal_Name;

         when others =>
            raise Program_Error;
      end case;
   end Internal_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Internal_Resource_Class_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Internal_Resource_Class_Name (Node : in Node_Id) return Name_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Resource_Specification);

      return Node_Table.Table (Node).Internal_Resource_Class_Name;
   end Internal_Resource_Class_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Internal_Resource_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Internal_Resource_Name (Node : in Node_Id) return Name_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Resource_Specification);

      return Node_Table.Table (Node).Internal_Resource_Name;
   end Internal_Resource_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Hardcoded
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Is_Hardcoded (Node : in Node_Id) return Boolean is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumeration_Resource_Value
          or else Node_Kind (Node) = Node_Integer_Resource_Value
          or else Node_Kind (Node) = Node_Translation_Data_Resource_Value
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Value);

      case Node_Kind (Node) is
         when Node_Enumeration_Resource_Value =>
            return Node_Table.Table (Node).ERV_Is_Hardcoded;

         when Node_Integer_Resource_Value =>
            return Node_Table.Table (Node).IRV_Is_Hardcoded;

         when Node_Translation_Data_Resource_Value =>
            return Node_Table.Table (Node).TRV_Is_Hardcoded;

         when Node_Widget_Reference_Resource_Value =>
            return Node_Table.Table (Node).WRRV_Is_Hardcoded;

         when others =>
            raise Program_Error;
      end case;
   end Is_Hardcoded;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Managed
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Is_Managed (Node : in Node_Id) return Boolean is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Instance);

      return Node_Table.Table (Node).Is_Managed;
   end Is_Managed;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Meta_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Is_Meta_Class (Node : in Node_Id) return Boolean is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class);

      return Node_Table.Table (Node).Is_Meta_Class;
   end Is_Meta_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Resource_Class_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Is_Resource_Class_Value (Node : in Node_Id) return Boolean is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Boolean_Resource_Value
          or else Node_Kind (Node) = Node_Colormap_Resource_Value
          or else Node_Kind (Node) = Node_Enumeration_Resource_Value
          or else Node_Kind (Node) = Node_Integer_Resource_Value
          or else Node_Kind (Node) = Node_Pixel_Resource_Value
          or else Node_Kind (Node) = Node_Pixmap_Resource_Value
          or else Node_Kind (Node) = Node_Screen_Resource_Value
          or else Node_Kind (Node) = Node_Translation_Data_Resource_Value
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Value);

      case Node_Kind (Node) is
         when Node_Boolean_Resource_Value =>
            return Node_Table.Table (Node).BRV_Is_Resource_Class_Value;

         when Node_Colormap_Resource_Value =>
            return Node_Table.Table (Node).CRV_Is_Resource_Class_Value;

         when Node_Enumeration_Resource_Value =>
            return Node_Table.Table (Node).ERV_Is_Resource_Class_Value;

         when Node_Integer_Resource_Value =>
            return Node_Table.Table (Node).IRV_Is_Resource_Class_Value;

         when Node_Pixel_Resource_Value =>
            return Node_Table.Table (Node).PRV_Is_Resource_Class_Value;

         when Node_Pixmap_Resource_Value =>
            return Node_Table.Table (Node).PMRV_Is_Resource_Class_Value;

         when Node_Screen_Resource_Value =>
            return Node_Table.Table (Node).SRV_Is_Resource_Class_Value;

         when Node_Translation_Data_Resource_Value =>
            return Node_Table.Table (Node).TRV_Is_Resource_Class_Value;

         when Node_Widget_Reference_Resource_Value =>
            return Node_Table.Table (Node).WRRV_Is_Resource_Class_Value;

         when others =>
            raise Program_Error;
      end case;
   end Is_Resource_Class_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Name (Node : in Node_Id) return Name_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumeration_Value_Specification
          or else Node_Kind (Node) = Node_Component_Class
          or else Node_Kind (Node) = Node_Enumerated_Resource_Type
          or else Node_Kind (Node) = Node_Project
          or else Node_Kind (Node) = Node_Widget_Class
          or else Node_Kind (Node) = Node_Widget_Instance
          or else Node_Kind (Node) = Node_Predefined_Resource_Type
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Type);

      case Node_Kind (Node) is
         when Node_Component_Class =>
            return Node_Table.Table (Node).CC_Name;

         when Node_Enumeration_Value_Specification =>
            return Node_Table.Table (Node).EVS_Name;

         when Node_Predefined_Resource_Type =>
            return Node_Table.Table (Node).PRT_Name;

         when Node_Enumerated_Resource_Type =>
            return Node_Table.Table (Node).ERT_Name;

         when Node_Project =>
            return Node_Table.Table (Node).P_Name;

         when Node_Widget_Class =>
            return Node_Table.Table (Node).WC_Name;

         when Node_Widget_Instance =>
            return Node_Table.Table (Node).WI_Name;

         when Node_Widget_Reference_Resource_Type =>
            return Node_Table.Table (Node).WRRT_Name;

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
   --!    <Unit> Resource_Class_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Resource_Class_Name (Node : in Node_Id) return Name_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Resource_Specification);

      return Node_Table.Table (Node).Resource_Class_Name;
   end Resource_Class_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Resource_Name (Node : in Node_Id) return Name_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Resource_Specification);

      return Node_Table.Table (Node).Resource_Name;
   end Resource_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Specification
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Resource_Specification (Node : in Node_Id) return Node_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Boolean_Resource_Value
          or else Node_Kind (Node) = Node_Colormap_Resource_Value
          or else Node_Kind (Node) = Node_Enumeration_Resource_Value
          or else Node_Kind (Node) = Node_Pixel_Resource_Value
          or else Node_Kind (Node) = Node_Pixmap_Resource_Value
          or else Node_Kind (Node) = Node_Screen_Resource_Value
          or else Node_Kind (Node) = Node_Translation_Data_Resource_Value
          or else Node_Kind (Node) = Node_Integer_Resource_Value
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Value);

      case Node_Kind (Node) is
         when Node_Boolean_Resource_Value =>
            return Node_Table.Table (Node).BRV_Resource_Specification;

         when Node_Colormap_Resource_Value =>
            return Node_Table.Table (Node).CRV_Resource_Specification;

         when Node_Enumeration_Resource_Value =>
            return Node_Table.Table (Node).ERV_Resource_Specification;

         when Node_Integer_Resource_Value =>
            return Node_Table.Table (Node).IRV_Resource_Specification;

         when Node_Pixel_Resource_Value =>
            return Node_Table.Table (Node).PRV_Resource_Specification;

         when Node_Pixmap_Resource_Value =>
            return Node_Table.Table (Node).PMRV_Resource_Specification;

         when Node_Screen_Resource_Value =>
            return Node_Table.Table (Node).SRV_Resource_Specification;

         when Node_Translation_Data_Resource_Value =>
            return Node_Table.Table (Node).TRV_Resource_Specification;

         when Node_Widget_Reference_Resource_Value =>
            return Node_Table.Table (Node).WRRV_Resource_Specification;

         when others =>
            raise Program_Error;
      end case;
   end Resource_Specification;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Resource_Type (Node : in Node_Id) return Node_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Resource_Specification);

      return Node_Table.Table (Node).Resource_Type;
   end Resource_Type;

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
   --!    <Unit> Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Resource_Value (Node : in Node_Id) return Integer is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Integer_Resource_Value);

      return Node_Table.Table (Node).IRV_Resource_Value;
   end Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Resource_Value (Node : in Node_Id) return Node_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumeration_Resource_Value
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Value);

      case Node_Kind (Node) is
         when Node_Enumeration_Resource_Value =>
            return Node_Table.Table (Node).ERV_Resource_Value;

         when Node_Widget_Reference_Resource_Value =>
            return Node_Table.Table (Node).WRRV_Resource_Value;

         when others =>
            raise Program_Error;
      end case;
   end Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resources
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Resources (Node : in Node_Id) return List_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class
                       or else Node_Kind (Node) = Node_Widget_Instance);

      case Node_Kind (Node) is
         when Node_Widget_Class =>
            return Node_Table.Table (Node).WC_Resources;

         when Node_Widget_Instance =>
            return Node_Table.Table (Node).WI_Resources;

         when others =>
            raise Program_Error;
      end case;
   end Resources;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Root
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Root (Node : in Node_Id) return Node_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Component_Class);

      return Node_Table.Table (Node).Root;
   end Root;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Application_Class_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Application_Class_Name (Node  : in Node_Id;
                                         Value : in Name_Id)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Application);

      Node_Table.Table (Node).Application_Class_Name := Value;
   end Set_Application_Class_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Applications
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Applications (Node : in Node_Id; Value : in List_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Project);

      Node_Table.Table (Node).Applications := Value;
      Set_Parent_Node (Value, Node);
   end Set_Applications;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Children
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Children (Node : in Node_Id; Value : in List_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Instance);

      Node_Table.Table (Node).Children := Value;
      Set_Parent_Node (Value, Node);
   end Set_Children;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Class (Node : in Node_Id; Value : in Node_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Instance);

      Node_Table.Table (Node).Class := Value;
   end Set_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Component_Classes
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Component_Classes (Node : in Node_Id; Value : in List_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Application);

      Node_Table.Table (Node).Component_Classes := Value;
      Set_Parent_Node (Value, Node);
   end Set_Component_Classes;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Constraint_Resources
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Constraint_Resources (Node  : in Node_Id;
                                       Value : in List_Id)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class
                       or Node_Kind (Node) = Node_Widget_Instance);

      case Node_Kind (Node) is
         when Node_Widget_Class =>
            Node_Table.Table (Node).WC_Constraint_Resources := Value;

         when Node_Widget_Instance =>
            Node_Table.Table (Node).WI_Constraint_Resources := Value;

         when others =>
            raise Program_Error;
      end case;

      Set_Parent_Node (Value, Node);
   end Set_Constraint_Resources;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_File_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_File_Name (Node : in Node_Id; Value : in Name_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Project);

      Node_Table.Table (Node).File_Name := Value;
   end Set_File_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Imported_Widget_Sets
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Imported_Widget_Sets (Node  : in Node_Id;
                                       Value : in List_Id)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Project);

      Node_Table.Table (Node).Imported_Widget_Sets := Value;
      Set_Parent_Node (Value, Node);
   end Set_Imported_Widget_Sets;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Internal_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Internal_Name (Node : in Node_Id; Value : in Name_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumeration_Value_Specification
          or else Node_Kind (Node) = Node_Predefined_Resource_Type
          or else Node_Kind (Node) = Node_Enumerated_Resource_Type
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Type);

      case Node_Kind (Node) is
         when Node_Enumeration_Value_Specification =>
            Node_Table.Table (Node).EVS_Internal_Name := Value;

         when Node_Predefined_Resource_Type =>
            Node_Table.Table (Node).PRT_Internal_Name := Value;

         when Node_Enumerated_Resource_Type =>
            Node_Table.Table (Node).ERT_Internal_Name := Value;

         when Node_Widget_Reference_Resource_Type =>
            Node_Table.Table (Node).WRRT_Internal_Name := Value;

         when others =>
            raise Program_Error;
      end case;
   end Set_Internal_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Internal_Resource_Class_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Internal_Resource_Class_Name (Node  : in Node_Id;
                                         Value : in Name_Id)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Resource_Specification);

      Node_Table.Table (Node).Internal_Resource_Class_Name := Value;
   end Set_Internal_Resource_Class_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Internal_Resource_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Internal_Resource_Name (Node  : in Node_Id;
                                         Value : in Name_Id)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Resource_Specification);

      Node_Table.Table (Node).Internal_Resource_Name := Value;
   end Set_Internal_Resource_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Is_Hardcoded
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Is_Hardcoded (Node : in Node_Id; Value : in Boolean) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumeration_Resource_Value
          or else Node_Kind (Node) = Node_Integer_Resource_Value
          or else Node_Kind (Node) = Node_Translation_Data_Resource_Value
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Value);

      case Node_Kind (Node) is
         when Node_Enumeration_Resource_Value =>
            Node_Table.Table (Node).ERV_Is_Hardcoded := Value;

         when Node_Integer_Resource_Value =>
            Node_Table.Table (Node).IRV_Is_Hardcoded := Value;

         when Node_Translation_Data_Resource_Value =>
            Node_Table.Table (Node).TRV_Is_Hardcoded := Value;

         when Node_Widget_Reference_Resource_Value =>
            Node_Table.Table (Node).WRRV_Is_Hardcoded := Value;

         when others =>
            raise Program_Error;
      end case;
   end Set_Is_Hardcoded;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Is_Managed
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Is_Managed (Node : in Node_Id; Value : in Boolean) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Instance);

      Node_Table.Table (Node).Is_Managed := Value;
   end Set_Is_Managed;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Is_Meta_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Is_Meta_Class (Node : in Node_Id; Value : in Boolean) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class);

      Node_Table.Table (Node).Is_Meta_Class := Value;
   end Set_Is_Meta_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Is_Resource_Class_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Is_Resource_Class_Value (Node  : in Node_Id;
                                          Value : in Boolean)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumeration_Resource_Value
          or else Node_Kind (Node) = Node_Integer_Resource_Value
          or else Node_Kind (Node) = Node_Translation_Data_Resource_Value
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Value);

      case Node_Kind (Node) is
         when Node_Enumeration_Resource_Value =>
            Node_Table.Table (Node).ERV_Is_Resource_Class_Value := Value;

         when Node_Integer_Resource_Value =>
            Node_Table.Table (Node).IRV_Is_Resource_Class_Value := Value;

         when Node_Translation_Data_Resource_Value =>
            Node_Table.Table (Node).TRV_Is_Resource_Class_Value := Value;

         when Node_Widget_Reference_Resource_Value =>
            Node_Table.Table (Node).WRRV_Is_Resource_Class_Value := Value;

         when others =>
            raise Program_Error;
      end case;
   end Set_Is_Resource_Class_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Name (Node : in Node_Id; Value : in Name_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumeration_Value_Specification
          or else Node_Kind (Node) = Node_Predefined_Resource_Type
          or else Node_Kind (Node) = Node_Enumerated_Resource_Type
          or else Node_Kind (Node) = Node_Project
          or else Node_Kind (Node) = Node_Component_Class
          or else Node_Kind (Node) = Node_Widget_Class
          or else Node_Kind (Node) = Node_Widget_Instance
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Type);

      case Node_Kind (Node) is
         when Node_Enumeration_Value_Specification =>
            Node_Table.Table (Node).EVS_Name := Value;

         when Node_Predefined_Resource_Type =>
            Node_Table.Table (Node).PRT_Name := Value;

         when Node_Enumerated_Resource_Type =>
            Node_Table.Table (Node).ERT_Name := Value;

         when Node_Project =>
            Node_Table.Table (Node).P_Name := Value;

         when Node_Component_Class =>
            Node_Table.Table (Node).CC_Name := Value;

         when Node_Widget_Class =>
            Node_Table.Table (Node).WC_Name := Value;

         when Node_Widget_Instance =>
            Node_Table.Table (Node).WI_Name := Value;

         when Node_Widget_Reference_Resource_Type =>
            Node_Table.Table (Node).WRRT_Name := Value;

         when others =>
            raise Program_Error;
      end case;
   end Set_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Class_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Class_Name (Node : in Node_Id; Value : in Name_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Resource_Specification);

      Node_Table.Table (Node).Resource_Class_Name := Value;
   end Set_Resource_Class_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Name (Node : in Node_Id; Value : in Name_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Resource_Specification);

      Node_Table.Table (Node).Resource_Name := Value;
   end Set_Resource_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Specification
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Specification (Node  : in Node_Id;
                                         Value : in Node_Id)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Boolean_Resource_Value
          or else Node_Kind (Node) = Node_Colormap_Resource_Value
          or else Node_Kind (Node) = Node_Enumeration_Resource_Value
          or else Node_Kind (Node) = Node_Integer_Resource_Value
          or else Node_Kind (Node) = Node_Pixel_Resource_Value
          or else Node_Kind (Node) = Node_Pixmap_Resource_Value
          or else Node_Kind (Node) = Node_Screen_Resource_Value
          or else Node_Kind (Node) = Node_Translation_Data_Resource_Value
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Value);

      case Node_Kind (Node) is
         when Node_Boolean_Resource_Value =>
            Node_Table.Table (Node).BRV_Resource_Specification := Value;

         when Node_Colormap_Resource_Value =>
            Node_Table.Table (Node).CRV_Resource_Specification := Value;

         when Node_Enumeration_Resource_Value =>
            Node_Table.Table (Node).ERV_Resource_Specification := Value;

         when Node_Integer_Resource_Value =>
            Node_Table.Table (Node).IRV_Resource_Specification := Value;

         when Node_Pixel_Resource_Value =>
            Node_Table.Table (Node).PRV_Resource_Specification := Value;

         when Node_Pixmap_Resource_Value =>
            Node_Table.Table (Node).PMRV_Resource_Specification := Value;

         when Node_Screen_Resource_Value =>
            Node_Table.Table (Node).SRV_Resource_Specification := Value;

         when Node_Translation_Data_Resource_Value =>
            Node_Table.Table (Node).TRV_Resource_Specification := Value;

         when Node_Widget_Reference_Resource_Value =>
            Node_Table.Table (Node).WRRV_Resource_Specification := Value;

         when others =>
            raise Program_Error;
      end case;
   end Set_Resource_Specification;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Type (Node : in Node_Id; Value : in Node_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Resource_Specification);

      Node_Table.Table (Node).Resource_Type := Value;
   end Set_Resource_Type;

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
   --!    <Unit> Set_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Value (Node : in Node_Id; Value : in Integer) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Integer_Resource_Value);

      Node_Table.Table (Node).IRV_Resource_Value := Value;
   end Set_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Value (Node : in Node_Id; Value : in Node_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumeration_Resource_Value
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Value);

      case Node_Kind (Node) is
         when Node_Enumeration_Resource_Value =>
            Node_Table.Table (Node).ERV_Resource_Value := Value;

         when Node_Widget_Reference_Resource_Value =>
            Node_Table.Table (Node).WRRV_Resource_Value := Value;

         when others =>
            raise Program_Error;
      end case;
   end Set_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resources
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Resources (Node : in Node_Id; Value : in List_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class
                       or Node_Kind (Node) = Node_Widget_Instance);

      case Node_Kind (Node) is
         when Node_Widget_Class =>
            Node_Table.Table (Node).WC_Resources := Value;

         when Node_Widget_Instance =>
            Node_Table.Table (Node).WI_Resources := Value;

         when others =>
            raise Program_Error;
      end case;

      Set_Parent_Node (Value, Node);
   end Set_Resources;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Root
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Root (Node : in Node_Id; Value : in Node_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Component_Class);

      Node_Table.Table (Node).Root := Value;
      Node_Table.Table (Value).Parent := Node;
   end Set_Root;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Super_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Super_Class (Node : in Node_Id; Value : in Node_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class);

      Node_Table.Table (Node).Super_Class := Value;
   end Set_Super_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Type_Kind
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Type_Kind (Node  : in Node_Id;
                            Value : in Predefined_Resource_Type_Kind)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Predefined_Resource_Type);

      Node_Table.Table (Node).Type_Kind := Value;
   end Set_Type_Kind;

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
   --!    <Unit> Set_Widget_Classes
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Widget_Classes (Node : in Node_Id; Value : in List_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Set);

      Node_Table.Table (Node).Widget_Classes := Value;
      Set_Parent_Node (Value, Node);
   end Set_Widget_Classes;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Super_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Super_Class (Node : in Node_Id) return Node_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class);

      return Node_Table.Table (Node).Super_Class;
   end Super_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Type_Kind
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Type_Kind (Node : in Node_Id)
     return Predefined_Resource_Type_Kind
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Predefined_Resource_Type);

      return Node_Table.Table (Node).Type_Kind;
   end Type_Kind;

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

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Widget_Classes
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Widget_Classes (Node : in Node_Id) return List_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Set);

      return Node_Table.Table (Node).Widget_Classes;
   end Widget_Classes;

end Model.Tree;
