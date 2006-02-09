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
--! <Unit> Designer.Palette
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;
with Xt.Ancillary_Types;
with Xt.Composite_Management;
with Xm.Resource_Management;
with Xm.Strings;
with Xm_Push_Button_Gadget;
with Xm_Row_Column;
with Xm_String_Defs;

with Model.Allocations;
with Model.Queries;
with Model.Tree.Lists;

package body Designer.Palette is

   use Model;
   use Model.Tree;
   use Model.Tree.Lists;
   use Model.Queries;
   use Xm;
   use Xm.Resource_Management;
   use Xm_String_Defs;
   use Xm.Strings;
   use Xm_Row_Column;
   use Xm_Push_Button_Gadget;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;

   Palette_Notebook : Xt.Widget;

   type Annotation_Kinds is
    (Annotation_Empty,
     Annotation_Project,
     Annotation_Widget_Class);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
   record
      case Kind is
         when Annotation_Project      =>
            Row_Column : Widget;

         when Annotation_Widget_Class =>
            Button : Widget;

         when Annotation_Empty        =>
            null;

      end case;
   end record;

   package Annotation_Table is
     new GNAT.Table
         (Table_Component_Type => Annotation_Record,
          Table_Index_Type     => Node_Id,
          Table_Low_Bound      => Node_Id'First + 1,
          Table_Initial        => Model.Allocations.Node_Table_Initial,
          Table_Increment      => Model.Allocations.Node_Table_Increment);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Annotation_Table
   --!    <Purpose> Производит расширение таблицы для обеспечения возможности
   --! её использования для указанного узла. Все добавленные элементы
   --! инициализируются значениями по умолчанию.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table (Node : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Delete_Item (Node : in Model.Node_Id) is
   begin
      null;
   end Delete_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize (Parent : in Xt.Widget) is
   begin
      Palette_Notebook := Parent;
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id) is
   begin
      case Node_Kind (Node) is
         when Node_Project =>
            declare
               Current_Widget_Set   : Node_Id;
               Current_Widget_Class : Node_Id;
               Args                 : Xt_Arg_List (0 .. 0);
               Str                  : Xm_String;

            begin
               Relocate_Annotation_Table (Node);

               Annotation_Table.Table (Node).Row_Column :=
                 Xm_Create_Managed_Row_Column
                  (Palette_Notebook, "palette_page");

               Current_Widget_Set := First (Imported_Widget_Sets (Node));

               while Current_Widget_Set /= Null_Node loop
                  --  Построение кнопки для каждого класса виджета.

                  Current_Widget_Class :=
                    First (Widget_Classes (Current_Widget_Set));

                  while Current_Widget_Class /= Null_Node loop

                     if not Is_Meta_Class (Current_Widget_Class) then
                        Relocate_Annotation_Table (Current_Widget_Class);

                        Str :=
                          Xm_String_Generate
                           (Name_Image (Current_Widget_Class));

                        Xt_Set_Arg (Args (0), Xm_N_Label_String, Str);
                        Annotation_Table.Table (Current_Widget_Class).Button :=
                          Xm_Create_Managed_Push_Button_Gadget
                           (Annotation_Table.Table (Node).Row_Column,
                            "callbacks",
                            Args (0 .. 0));

                        Xm_String_Free (Str);
                     end if;

                     Current_Widget_Class := Next (Current_Widget_Class);
                  end loop;

                  Current_Widget_Set := Next (Current_Widget_Set);
               end loop;
            end;

            Xt_Unmanage_Child (Palette_Notebook);
            Xt_Manage_Child (Palette_Notebook);

         when Node_Application =>
            null;

         when Node_Component_Class =>
            null;

         when Node_Widget_Instance =>
            null;

         when others =>
            raise Program_Error;
      end case;
   end Insert_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Reinitialize is
   begin
      null;
   end Reinitialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Annotation_Table
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table (Node : in Node_Id) is
      First : constant Node_Id := Annotation_Table.Last + 1;

   begin
      if Annotation_Table.Last >= Node then
      --  Таблица уже имеет достаточный размер и не нуждается в расширении.

         return;
      end if;

      Annotation_Table.Set_Last (Node);

      for J in First .. Node loop
         case Node_Kind (J) is
            when Node_Project =>
                Annotation_Table.Table (J) :=
                 (Kind => Annotation_Project,
                  Row_Column => Null_Widget);

            when Node_Widget_Class =>
                Annotation_Table.Table (J) :=
                 (Kind => Annotation_Widget_Class,
                  Button => Null_Widget);

            when others =>
               Annotation_Table.Table (J) := (Kind => Annotation_Empty);
         end case;
      end loop;
   end Relocate_Annotation_Table;
   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id) is
   begin
      null;
   end Select_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Model.Node_Id) is
   begin
      null;
   end Update_Item;

end Designer.Palette;
