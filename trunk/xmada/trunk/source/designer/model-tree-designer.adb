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
--! <Unit> Model.Tree.Designer
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;

with Model.Allocations;
with Model.Tree.Lists;

package body Model.Tree.Designer is

   use Model.Tree.Lists;

   type Annotation_Kinds is
    (Annotation_Empty,
     Annotation_Boolean_Resource_Value,
     Annotation_Colormap_Resource_Value,
     Annotation_Enumerated_Resource_Type,
     Annotation_Enumeration_Resource_Value,
     Annotation_Enumeration_Value_Specification,
     Annotation_Integer_Resource_Value,
     Annotation_Pixel_Resource_Value,
     Annotation_Pixmap_Resource_Value,
     Annotation_Screen_Resource_Value,
     Annotation_Translation_Data_Resource_Value,
     Annotation_Widget_Reference_Resource_Value,
     Annotation_Widget_Class,
     Annotation_Widget_Instance,
     Annotation_Xm_String_Resource_Value);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
   record
      case Kind is
         when Annotation_Empty =>
            null;

         when Annotation_Boolean_Resource_Value
           | Annotation_Colormap_Resource_Value
           | Annotation_Enumeration_Resource_Value
           | Annotation_Integer_Resource_Value
           | Annotation_Pixel_Resource_Value
           | Annotation_Pixmap_Resource_Value
           | Annotation_Screen_Resource_Value
           | Annotation_Translation_Data_Resource_Value
           | Annotation_Widget_Reference_Resource_Value
           | Annotation_Xm_String_Resource_Value
         =>
            Is_Changed : Boolean;

         when Annotation_Enumerated_Resource_Type =>
            Representation_Type : Representation_Types;

         when Annotation_Enumeration_Value_Specification =>
            Representation_Value : Interfaces.C.unsigned_char;

         when Annotation_Widget_Class =>
            Convenience_Create_Function : Convenience_Create;
            --  Указатель на подпрограмму создания экземпляра виджета.

            Is_Set_Initial_Size         : Boolean;
            --  При отсутствии дочерних виджетов создаваемый виджет имеет
            --  размер 1x1 и необходимо принудительно задать его размер.

         when Annotation_Widget_Instance =>
            All_Resources            : List_Id;
            --  Список всех ресурсов экземпляра виджета.

            All_Constraint_Resources : List_Id;
            --  Список всех ресурсов ограничений экземпляра виджета.
      end case;
   end record;

   package Annotation_Table is
     new GNAT.Table (Table_Component_Type => Annotation_Record,
                     Table_Index_Type     => Node_Id,
                     Table_Low_Bound      => Node_Id'First + 1,
                     Table_Initial        => Allocations.Node_Table_Initial,
                     Table_Increment      => Allocations.Node_Table_Increment);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Annotation_Table
   --!    <Purpose> Производит перераспределение таблицы аннотирования для
   --! соответствия размерам таблицы узлов и заполняет добавляемые узлы
   --! значениями по умолчанию.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> All_Constraint_Resources
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function All_Constraint_Resources (Node : in Node_Id) return List_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Instance);

      Relocate_Annotation_Table;

      return Annotation_Table.Table (Node).All_Constraint_Resources;
   end All_Constraint_Resources;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> All_Resources
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function All_Resources (Node : in Node_Id) return List_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Instance);

      Relocate_Annotation_Table;

      return Annotation_Table.Table (Node).All_Resources;
   end All_Resources;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Convenience_Create_Function
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Convenience_Create_Function (Node : in Node_Id)
     return Convenience_Create
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class);

      Relocate_Annotation_Table;

      return Annotation_Table.Table (Node).Convenience_Create_Function;
   end Convenience_Create_Function;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize is
   begin
      Annotation_Table.Init;
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Changed
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Is_Changed (Node : in Node_Id) return Boolean is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Colormap_Resource_Value
          or else Node_Kind (Node) = Node_Enumeration_Resource_Value
          or else Node_Kind (Node) = Node_Integer_Resource_Value
          or else Node_Kind (Node) = Node_Pixel_Resource_Value
          or else Node_Kind (Node) = Node_Pixmap_Resource_Value
          or else Node_Kind (Node) = Node_Screen_Resource_Value
          or else Node_Kind (Node) = Node_Translation_Data_Resource_Value
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Value
          or else Node_Kind (Node) = Node_Xm_String_Resource_Value);

      Relocate_Annotation_Table;

      return Annotation_Table.Table (Node).Is_Changed;
   end Is_Changed;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Set_Initial_Size
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Is_Set_Initial_Size (Node : in Node_Id) return Boolean is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class);

      Relocate_Annotation_Table;

      return Annotation_Table.Table (Node).Is_Set_Initial_Size;
   end Is_Set_Initial_Size;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Annotation_Table
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table is
      First : constant Node_Id := Annotation_Table.Last + 1;

   begin
      if Node_Table.Last >= First then
         Annotation_Table.Set_Last (Node_Table.Last);

         for J in First .. Annotation_Table.Last loop
            case Node_Kind (J) is
               when Node_Widget_Class =>
                  Annotation_Table.Table (J) :=
                   (Kind                        => Annotation_Widget_Class,
                    Convenience_Create_Function => null,
                    Is_Set_Initial_Size         => False);

               when Node_Widget_Instance =>
                  Annotation_Table.Table (J) :=
                   (Kind                     => Annotation_Widget_Instance,
                    All_Resources            => Null_List,
                    All_Constraint_Resources => Null_List);

               when Node_Colormap_Resource_Value =>
                  Annotation_Table.Table (J) :=
                   (Kind       => Annotation_Colormap_Resource_Value,
                    Is_Changed => False);

               when Node_Enumerated_Resource_Type =>
                  Annotation_Table.Table (J) :=
                   (Kind                => Annotation_Enumerated_Resource_Type,
                    Representation_Type => Representation_Type_Unspecified);

               when Node_Enumeration_Resource_Value =>
                  Annotation_Table.Table (J) :=
                   (Kind             =>
                      Annotation_Enumeration_Resource_Value,
                    Is_Changed       => False);

               when Node_Enumeration_Value_Specification =>
                  Annotation_Table.Table (J) :=
                   (Kind                 =>
                      Annotation_Enumeration_Value_Specification,
                    Representation_Value => 0);

               when Node_Integer_Resource_Value =>
                  Annotation_Table.Table (J) :=
                   (Kind       => Annotation_Integer_Resource_Value,
                    Is_Changed => False);

               when Node_Pixel_Resource_Value =>
                  Annotation_Table.Table (J) :=
                   (Kind       => Annotation_Pixel_Resource_Value,
                    Is_Changed => False);

               when Node_Pixmap_Resource_Value =>
                  Annotation_Table.Table (J) :=
                   (Kind       => Annotation_Pixmap_Resource_Value,
                    Is_Changed => False);

               when Node_Screen_Resource_Value =>
                  Annotation_Table.Table (J) :=
                   (Kind       => Annotation_Screen_Resource_Value,
                    Is_Changed => False);

               when Node_Translation_Data_Resource_Value =>
                  Annotation_Table.Table (J) :=
                   (Kind       => Annotation_Translation_Data_Resource_Value,
                    Is_Changed => False);

               when Node_Widget_Reference_Resource_Value =>
                  Annotation_Table.Table (J) :=
                   (Kind       => Annotation_Widget_Reference_Resource_Value,
                    Is_Changed => False);

               when Node_Xm_String_Resource_Value =>
                  Annotation_Table.Table (J) :=
                   (Kind       => Annotation_Xm_String_Resource_Value,
                    Is_Changed => False);

               when others =>
                  Annotation_Table.Table (J) := (Kind => Annotation_Empty);
            end case;
         end loop;
      end if;
   end Relocate_Annotation_Table;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Representation_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Representation_Type (Node : in Node_Id)
     return Representation_Types
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Enumerated_Resource_Type);

      Relocate_Annotation_Table;

      return Annotation_Table.Table (Node).Representation_Type;
   end Representation_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Representation_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Representation_Value (Node : in Node_Id)
     return Interfaces.C.unsigned_char
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Enumeration_Value_Specification);

      Relocate_Annotation_Table;

      return Annotation_Table.Table (Node).Representation_Value;
   end Representation_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_All_Constraint_Resources
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_All_Constraint_Resources (Node  : in Node_Id;
                                           Value : in List_Id)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Instance);

      Relocate_Annotation_Table;

      Annotation_Table.Table (Node).All_Constraint_Resources := Value;
      Set_Parent_Node (Value, Node);
   end Set_All_Constraint_Resources;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_All_Resources
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_All_Resources (Node : in Node_Id; Value : in List_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Instance);

      Relocate_Annotation_Table;

      Annotation_Table.Table (Node).All_Resources := Value;
      Set_Parent_Node (Value, Node);
   end Set_All_Resources;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Convenience_Create_Function
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Convenience_Create_Function (Node  : in Node_Id;
                                              Value : in Convenience_Create)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class);

      Relocate_Annotation_Table;

      Annotation_Table.Table (Node).Convenience_Create_Function := Value;
   end Set_Convenience_Create_Function;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Is_Changed
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Is_Changed (Node : in Node_Id; Value : in Boolean) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Colormap_Resource_Value
          or else Node_Kind (Node) = Node_Enumeration_Resource_Value
          or else Node_Kind (Node) = Node_Integer_Resource_Value
          or else Node_Kind (Node) = Node_Pixel_Resource_Value
          or else Node_Kind (Node) = Node_Pixmap_Resource_Value
          or else Node_Kind (Node) = Node_Screen_Resource_Value
          or else Node_Kind (Node) = Node_Translation_Data_Resource_Value
          or else Node_Kind (Node) = Node_Widget_Reference_Resource_Value
          or else Node_Kind (Node) = Node_Xm_String_Resource_Value);

      Relocate_Annotation_Table;

      Annotation_Table.Table (Node).Is_Changed := Value;
   end Set_Is_Changed;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Is_Set_Initial_Size
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Is_Set_Initial_Size (Node : in Node_Id; Value : in Boolean) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class);

      Relocate_Annotation_Table;

      Annotation_Table.Table (Node).Is_Set_Initial_Size := Value;
   end Set_Is_Set_Initial_Size;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Representation_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Representation_Type (Node  : in Node_Id;
                                      Value : in Representation_Types)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert
       (Node_Kind (Node) = Node_Enumerated_Resource_Type);

      Relocate_Annotation_Table;

      Annotation_Table.Table (Node).Representation_Type := Value;
   end Set_Representation_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Representation_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Representation_Value (Node  : in Node_Id;
                                       Value : in Interfaces.C.unsigned_char)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Enumeration_Value_Specification);

      Relocate_Annotation_Table;

      Annotation_Table.Table (Node).Representation_Value := Value;
   end Set_Representation_Value;

end Model.Tree.Designer;
