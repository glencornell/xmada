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
with GNAT.Table;

with Model.Allocations;
with Model.Names;

package body Model.Tree.Xm_Ada is

   type Annotation_Kinds is
    (Annotation_Empty,
     Annotation_Widget_Class);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
   record
      case Kind is
         when Annotation_Empty =>
            null;

         when Annotation_Widget_Class =>
            Create_Function_Name : Name_Id;

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
                                                   Name : in Name_Id) is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Widget_Class);

      Relocate_Annotation_Table;

      Annotation_Table.Table (Node).Create_Function_Name := Name;
   end Set_Convenience_Create_Function_Name;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Name_String
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Name_String (Node : in Node_Id;
                                       Name : in Name_Id) is
   begin
      null;
   end Set_Resource_Name_String;

end Model.Tree.Xm_Ada;
