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
--! <Unit> Model.Debug
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Source$
--  $Revision$ $Date$ $Author$
------------------------------------------------------------------------------
with Model.Queries;
with Model.Tree.Lists;

package body Model.Debug is

   use Ada.Wide_Text_IO;
   use Model.Queries;
   use Model.Tree;
   use Model.Tree.Lists;

   procedure Print_Project (File   : in Ada.Wide_Text_IO.File_Type;
                            Node   : in Node_Id;
                            Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Application (File   : in Ada.Wide_Text_IO.File_Type;
                                Node   : in Node_Id;
                                Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Boolean_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Colormap_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Component_Class (File   : in Ada.Wide_Text_IO.File_Type;
                                    Node   : in Node_Id;
                                    Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Predefined_Resource_Type
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Enumerated_Resource_Type
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Enumeration_Value_Specification
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Enumeration_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Integer_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Pixel_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Pixmap_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Screen_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Translation_Data_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Resource_Specification
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Widget_Class (File   : in Ada.Wide_Text_IO.File_Type;
                                 Node   : in Node_Id;
                                 Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Widget_Instance (File   : in Ada.Wide_Text_IO.File_Type;
                                    Node   : in Node_Id;
                                    Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Widget_Reference_Resource_Type
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Widget_Reference_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count);

   procedure Print_Widget_Set (File   : in Ada.Wide_Text_IO.File_Type;
                               Node   : in Node_Id;
                               Offset : in Ada.Wide_Text_IO.Count);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print (File   : in Ada.Wide_Text_IO.File_Type;
                    List   : in List_Id;
                    Offset : in Ada.Wide_Text_IO.Count)
   is
      Aux : Node_Id := First (List);

   begin
      while Aux /= Null_Node loop
         Print (File, Aux, Offset);
         Aux := Next (Aux);
      end loop;
   end Print;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print (File   : in Ada.Wide_Text_IO.File_Type;
                    Node   : in Node_Id;
                    Offset : in Ada.Wide_Text_IO.Count := 1)
   is
      Node_Image   : constant Wide_String
        := Node_Id'Wide_Image (Node);
      Parent_Image : constant Wide_String
        := Node_Id'Wide_Image (Parent_Node (Node));
      Kind_Image   : constant Wide_String
        := Node_Kinds'Wide_Image (Node_Kind (Node));

   begin
      Set_Col (File, Offset);
      Put (File,
           Node_Image (Node_Image'First + 1 .. Node_Image'Last)
             & '/'
             & Parent_Image (Parent_Image'First + 1 .. Parent_Image'Last)
             & ' '
             & Kind_Image (Kind_Image'First + 5 .. Kind_Image'Last));

      case Node_Kind (Node) is
         when Node_Application =>
            Print_Application (File, Node, Offset + Indent);

         when Node_Boolean_Resource_Value =>
            Print_Boolean_Resource_Value (File, Node, Offset + Indent);

         when Node_Colormap_Resource_Value =>
            Print_Colormap_Resource_Value (File, Node, Offset + Indent);

         when Node_Component_Class =>
            Print_Component_Class (File, Node, Offset + Indent);

         when Node_Enumerated_Resource_Type =>
            Print_Enumerated_Resource_Type (File, Node, Offset + Indent);

         when Node_Enumeration_Resource_Value =>
            Print_Enumeration_Resource_Value (File, Node, Offset + Indent);

         when Node_Enumeration_Value_Specification =>
            Print_Enumeration_Value_Specification
             (File, Node, Offset + Indent);

         when Node_Integer_Resource_Value =>
            Print_Integer_Resource_Value (File, Node, Offset + Indent);

         when Node_Pixel_Resource_Value =>
            Print_Pixel_Resource_Value (File, Node, Offset + Indent);

         when Node_Pixmap_Resource_Value =>
            Print_Pixmap_Resource_Value (File, Node, Offset + Indent);

         when Node_Predefined_Resource_Type =>
            Print_Predefined_Resource_Type (File, Node, Offset + Indent);

         when Node_Project =>
            Print_Project (File, Node, Offset + Indent);

         when Node_Resource_Specification =>
            Print_Resource_Specification (File, Node, Offset + Indent);

         when Node_Screen_Resource_Value =>
            Print_Screen_Resource_Value (File, Node, Offset + Indent);

         when Node_Translation_Data_Resource_Value =>
            Print_Translation_Data_Resource_Value
             (File, Node, Offset + Indent);

         when Node_Widget_Class =>
            Print_Widget_Class (File, Node, Offset + Indent);

         when Node_Widget_Instance =>
            Print_Widget_Instance (File, Node, Offset + Indent);

         when Node_Widget_Reference_Resource_Type =>
            Print_Widget_Reference_Resource_Type (File, Node, Offset + Indent);

         when Node_Widget_Reference_Resource_Value =>
            Print_Widget_Reference_Resource_Value
             (File, Node, Offset + Indent);

         when Node_Widget_Set =>
            Print_Widget_Set (File, Node, Offset + Indent);

         when others =>
            raise Program_Error;
      end case;

      if Designer_Hook /= null then
         Designer_Hook (File, Node, Offset + Indent);
      end if;
   end Print;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Application
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Application (File   : in Ada.Wide_Text_IO.File_Type;
                                Node   : in Node_Id;
                                Offset : in Ada.Wide_Text_IO.Count)
   is
   begin
      Put (File, ' ' & Application_Class_Name_Image (Node));

      if Component_Classes (Node) /= Null_List then
         Set_Col (File, Offset);
         Put (File, "Component classes:");
         Print (File, Component_Classes (Node), Offset + Indent);
      end if;
   end Print_Application;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Boolean_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Boolean_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      if Is_Resource_Class_Value (Node) then
         Put (File,
              ' ' & Resource_Class_Name_Image (Resource_Specification (Node)));

      else
         Put (File, ' ' & Resource_Name_Image (Resource_Specification (Node)));
      end if;

      Put (File,
           " : " & Name_Image (Resource_Type (Resource_Specification (Node))));

      --  TODO Вывод значения.
   end Print_Boolean_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Colormap_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Colormap_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      if Is_Resource_Class_Value (Node) then
         Put (File,
              ' ' & Resource_Class_Name_Image (Resource_Specification (Node)));

      else
         Put (File, ' ' & Resource_Name_Image (Resource_Specification (Node)));
      end if;

      Put (File,
           " : " & Name_Image (Resource_Type (Resource_Specification (Node))));

      --  TODO Вывод значения.
   end Print_Colormap_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Component_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Component_Class (File   : in Ada.Wide_Text_IO.File_Type;
                                    Node   : in Node_Id;
                                    Offset : in Ada.Wide_Text_IO.Count)
   is
   begin
      Put (File, ' ' & Name_Image (Node));

      if Root (Node) /= Null_Node then
         Print (File, Root (Node), Offset);
      end if;
   end Print_Component_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Enumerated_Resource_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Enumerated_Resource_Type
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
   begin
      if Name (Node) /= Null_Name then
         Put (File, ' ' & Name_Image (Node));
      end if;

      Put (File, " (" & Internal_Name_Image (Node) & ')');
      Print (File, Value_Specifications (Node), Offset);
   end Print_Enumerated_Resource_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Enumeration_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Enumeration_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      if Is_Resource_Class_Value (Node) then
         Put (File,
              ' ' & Resource_Class_Name_Image (Resource_Specification (Node)));

      else
         Put (File, ' ' & Resource_Name_Image (Resource_Specification (Node)));
      end if;

      Put (File,
           " : " & Name_Image (Resource_Type (Resource_Specification (Node))));

      if Resource_Value (Node) = Null_Node then
         Put (File, " := (UNDEFINED)");

      else
         Put (File, " := " & Name_Image (Resource_Value (Node)));
      end if;
   end Print_Enumeration_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Enumeration_Value_Specification
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Enumeration_Value_Specification
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      Put (File,
           ' ' & Name_Image (Node) & " (" & Internal_Name_Image (Node) & ')');
   end Print_Enumeration_Value_Specification;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Integer_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Integer_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      if Is_Resource_Class_Value (Node) then
         Put (File,
              ' ' & Resource_Class_Name_Image (Resource_Specification (Node)));

      else
         Put (File, ' ' & Resource_Name_Image (Resource_Specification (Node)));
      end if;

      Put (File,
           " : " & Name_Image (Resource_Type (Resource_Specification (Node))));

      Put (File, " :=" & Integer'Wide_Image (Resource_Value (Node)));
   end Print_Integer_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Pixel_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Pixel_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      if Is_Resource_Class_Value (Node) then
         Put (File,
              ' ' & Resource_Class_Name_Image (Resource_Specification (Node)));

      else
         Put (File, ' ' & Resource_Name_Image (Resource_Specification (Node)));
      end if;

      Put (File,
           " : " & Name_Image (Resource_Type (Resource_Specification (Node))));

      --  TODO Вывод значения.
   end Print_Pixel_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Pixmap_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Pixmap_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      if Is_Resource_Class_Value (Node) then
         Put (File,
              ' ' & Resource_Class_Name_Image (Resource_Specification (Node)));

      else
         Put (File, ' ' & Resource_Name_Image (Resource_Specification (Node)));
      end if;

      Put (File,
           " : " & Name_Image (Resource_Type (Resource_Specification (Node))));

      --  TODO Вывод значения.
   end Print_Pixmap_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Predefined_Resource_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Predefined_Resource_Type
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      if Name (Node) /= Null_Name then
         Put (File, " '" & Name_Image (Node) & ''');
      end if;

      Put (File, " (" & Internal_Name_Image (Node) & ')');
   end Print_Predefined_Resource_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Project
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
   begin
      Put (File, ' ' & Name_Image (Node));

      Set_Col (File, Offset);
      Put (File, "Imported widget sets:");
      Print (File, Imported_Widget_Sets (Node), Offset + Indent);

      if Applications (Node) /= Null_List then
         Set_Col (File, Offset);
         Put (File, "Applications");
         Print (File, Applications (Node), Offset + Indent);
      end if;
   end Print_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Resource_Specification
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Resource_Specification
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      if not Can_Be_Set_At_Creation_Time (Node)
        and then not Can_Be_Set_By_Set_Values (Node)
        and then not Can_Be_Retrieved_By_Get_Values (Node)
      then
         Put (File, " [N/A]");

      else
         Put (File, " [");

         if Can_Be_Set_At_Creation_Time (Node) then
            Put (File, 'C');

         else
            Put (File, ' ');
         end if;

         if Can_Be_Set_By_Set_Values (Node) then
            Put (File, 'S');

         else
            Put (File, ' ');
         end if;

         if Can_Be_Retrieved_By_Get_Values (Node) then
            Put (File, 'G');

         else
            Put (File, ' ');
         end if;
      end if;

      Put (File,
           ' '
             & Resource_Name_Image (Node)
             & "/"
             & Resource_Class_Name_Image (Node)
             & " : "
             & Name_Image (Resource_Type (Node)));
   end Print_Resource_Specification;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Screen_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Screen_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      if Is_Resource_Class_Value (Node) then
         Put (File,
              ' ' & Resource_Class_Name_Image (Resource_Specification (Node)));

      else
         Put (File, ' ' & Resource_Name_Image (Resource_Specification (Node)));
      end if;

      Put (File,
           " : " & Name_Image (Resource_Type (Resource_Specification (Node))));

      --  TODO Вывод значения.
   end Print_Screen_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Translation_Data_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Translation_Data_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      if Is_Resource_Class_Value (Node) then
         Put (File,
              ' ' & Resource_Class_Name_Image (Resource_Specification (Node)));

      else
         Put (File, ' ' & Resource_Name_Image (Resource_Specification (Node)));
      end if;

      Put (File,
           " : " & Name_Image (Resource_Type (Resource_Specification (Node))));

      --  TODO Вывод значения.
   end Print_Translation_Data_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Widget_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Widget_Class (File   : in Ada.Wide_Text_IO.File_Type;
                                 Node   : in Node_Id;
                                 Offset : in Ada.Wide_Text_IO.Count)
   is
   begin
      if Is_Meta_Class (Node) then
         Put (File, " [META]");
      end if;

      Put (File, ' ' & Name_Image (Node));

      if Super_Class (Node) /= Null_Node then
         Put (File, " => " & Name_Image (Super_Class (Node)));
      end if;

      if Resources (Node) /= Null_List then
         Set_Col (File, Offset);
         Put (File, "Resources:");
         Print (File, Resources (Node), Offset + Indent);
      end if;

      if Constraint_Resources (Node) /= Null_List then
         Set_Col (File, Offset);
         Put (File, "Constraint Resources:");
         Print (File, Constraint_Resources (Node), Offset + Indent);
      end if;
   end Print_Widget_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Widget_Instance
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Widget_Instance (File   : in Ada.Wide_Text_IO.File_Type;
                                    Node   : in Node_Id;
                                    Offset : in Ada.Wide_Text_IO.Count)
   is
   begin
      Put (File, ' ' & Name_Image (Node) & " : " & Name_Image (Class (Node)));

      if Resources (Node) /= Null_List then
         Set_Col (File, Offset);
         Put (File, "Resources:");
         Print (File, Resources (Node), Offset + Indent);
      end if;

      if Constraint_Resources (Node) /= Null_List then
         Set_Col (File, Offset);
         Put (File, "Constraint resources:");
         Print (File, Constraint_Resources (Node), Offset + Indent);
      end if;

      if Children (Node) /= Null_List then
         Set_Col (File, Offset);
         Put (File, "Children:");
         Print (File, Children (Node), Offset + Indent);
      end if;
   end Print_Widget_Instance;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Widget_Reference_Resource_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Widget_Reference_Resource_Type
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      if Name (Node) /= Null_Name then
         Put (File, " '" & Name_Image (Node) & ''');
      end if;

      Put (File, " (" & Internal_Name_Image (Node) & ')');
   end Print_Widget_Reference_Resource_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Widget_Reference_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Widget_Reference_Resource_Value
    (File   : in Ada.Wide_Text_IO.File_Type;
     Node   : in Node_Id;
     Offset : in Ada.Wide_Text_IO.Count)
   is
      pragma Unreferenced (Offset);

   begin
      if Is_Resource_Class_Value (Node) then
         Put (File,
              ' ' & Resource_Class_Name_Image (Resource_Specification (Node)));

      else
         Put (File, ' ' & Resource_Name_Image (Resource_Specification (Node)));
      end if;

      Put (File,
           " : " & Name_Image (Resource_Type (Resource_Specification (Node))));

      --  TODO Вывод значения.
   end Print_Widget_Reference_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print_Widget_Set
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print_Widget_Set (File   : in Ada.Wide_Text_IO.File_Type;
                               Node   : in Node_Id;
                               Offset : in Ada.Wide_Text_IO.Count)
   is
   begin
      Set_Col (File, Offset);
      Put (File, "Resource types:");
      Print (File, Resource_Types (Node), Offset + Indent);

      Set_Col (File, Offset);
      Put (File, "Widget classes:");
      Print (File, Widget_Classes (Node), Offset + Indent);
   end Print_Widget_Set;

end Model.Debug;
