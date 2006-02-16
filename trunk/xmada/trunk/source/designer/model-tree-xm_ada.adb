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
--! <Unit> Model.Tree
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;

with Model.Allocations;
with Model.Names;

package body Model.Tree.Xm_Ada is

   type Annotation_Kinds is
    (Annotation_Empty,
     Annotation_Widget_Class,
     Annotation_Resource_Specification,
     Annotation_Enumeration_Value_Specification,
     Annotation_Enumerated_Resource_Type);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
   record
      case Kind is
         when Annotation_Empty =>
            null;

         when Annotation_Widget_Class =>
            Create_Function_Name : Name_Id;

         when Annotation_Resource_Specification =>
            Resource_Name_String       : Name_Id;
            Resource_Class_Name_String : Name_Id;

         when Annotation_Enumeration_Value_Specification =>
            Literal_Identifier       : Name_Id;
            --  Представление значения перечислимого типа в коде программы.

            Use_Qualified_Expression : Boolean;
            --  Использование характеризующего данного значение выражения.

         when Annotation_Enumerated_Resource_Type =>
            Type_Identifier : Name_Id;
            --  Уникальный идентификатор типа ресурса.

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

   RNS_Counter  : Integer := 0;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Convenience_Create_Function_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Convenience_Create_Function_Name (Node : in Node_Id)
     return Name_Id
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class);

      Relocate_Annotation_Table;

      return Annotation_Table.Table (Node).Create_Function_Name;
   end Convenience_Create_Function_Name;

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
   --!    <Unit> Literal_Identifier
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Literal_Identifier (Node : in Node_Id) return Name_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Enumeration_Value_Specification);

      Relocate_Annotation_Table;

      return Annotation_Table.Table (Node).Literal_Identifier;
   end Literal_Identifier;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Annotation_Table
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table is
      First : constant Node_Id := Annotation_Table.Last + 1;

   begin
      if Node_Table.Last > First then
         Annotation_Table.Set_Last (Node_Table.Last);

         for J in First .. Annotation_Table.Last loop
            case Node_Kind (J) is
               when Node_Widget_Class =>
                  Annotation_Table.Table (J) :=
                   (Kind                 => Annotation_Widget_Class,
                    Create_Function_Name => Null_Name);

                when Node_Resource_Specification =>
                  Annotation_Table.Table (J) :=
                   (Kind                       =>
                     Annotation_Resource_Specification,
                    Resource_Name_String       => Null_Name,
                    Resource_Class_Name_String => Null_Name);

               when Node_Enumeration_Value_Specification =>
                  Annotation_Table.Table (J) :=
                   (Kind                      =>
                     Annotation_Enumeration_Value_Specification,
                    Literal_Identifier        => Null_Name,
                    Use_Qualified_Expression  => False);

               when Node_Enumerated_Resource_Type =>
                  Annotation_Table.Table (J) :=
                   (Kind            => Annotation_Enumerated_Resource_Type,
                    Type_Identifier => Null_Name);

               when others =>
                  Annotation_Table.Table (J) := (Kind => Annotation_Empty);
            end case;
         end loop;
      end if;

   end Relocate_Annotation_Table;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Name_String
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Resource_Name_String (Node : in Node_Id)
     return Name_Id
   is
   begin
      RNS_Counter := RNS_Counter + 1;

      case RNS_Counter is
         when 1 =>
            return Model.Names.Enter ("Xm_String_Defs.Xm_N_Height");

         when 2 =>
            return Model.Names.Enter ("Xm_String_Defs.Xm_N_Width");

         when 3 =>
            return Model.Names.Enter ("Xm_String_Defs.Xm_N_Initial_Focus");

         when others =>
            raise Program_Error;
      end case;
   end Resource_Name_String;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Convenience_Create_Function_Name
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Convenience_Create_Function_Name (Node : in Node_Id;
                                                   Name : in Name_Id)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class);

      Relocate_Annotation_Table;

      Annotation_Table.Table (Node).Create_Function_Name := Name;
   end Set_Convenience_Create_Function_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Literal_Identifier
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Literal_Identifier (Node  : in Node_Id;
                                     Value : in Name_Id)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Enumeration_Value_Specification);

      Relocate_Annotation_Table;

      Annotation_Table.Table (Node).Literal_Identifier := Value;
   end Set_Literal_Identifier;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Name_String
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Name_String (Node : in Node_Id;
                                       Name : in Name_Id)
   is
   begin
      null;
   end Set_Resource_Name_String;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Type_Identifier
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Type_Identifier (Node  : in Node_Id;
                                  Value : in Name_Id)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Enumerated_Resource_Type);

      Relocate_Annotation_Table;

      Annotation_Table.Table (Node).Type_Identifier := Value;
   end Set_Type_Identifier;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Use_Qualified_Expression
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Use_Qualified_Expression (Node : in Node_Id;
                                           Value : in Boolean)
   is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Enumeration_Value_Specification);

      Relocate_Annotation_Table;

      Annotation_Table.Table (Node).Use_Qualified_Expression := Value;
   end Set_Use_Qualified_Expression;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Type_Identifier
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Type_Identifier (Node : in Node_Id) return Name_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Enumerated_Resource_Type);

      Relocate_Annotation_Table;

      return Annotation_Table.Table (Node).Type_Identifier;
   end Type_Identifier;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Use_Qualified_Expression
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Use_Qualified_Expression (Node : in Node_Id) return Boolean is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Enumeration_Value_Specification);

      Relocate_Annotation_Table;

      return Annotation_Table.Table (Node).Use_Qualified_Expression;
   end Use_Qualified_Expression;

end Model.Tree.Xm_Ada;
