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
--! <Unit> Generator.Prototype.Component_Class
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Wide_Text_IO;

with GNAT.Table;

with Model.Allocations;
with Model.Names;
with Model.Queries;
with Model.Tree;
with Model.Tree.Lists;
with Model.Tree.Xm_Ada;
with Model.Widget_Instances_Ordering;

package body Generator.Prototype.Component_Class is

   use Ada.Wide_Text_IO;
   use Model;
   use Model.Tree;
   use Model.Tree.Lists;
   use Model.Tree.Xm_Ada;
   use Model.Widget_Instances_Ordering;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Generate
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Generate (Node : in Model.Node_Id) is

      package Postponed_Resource_Table is
        new GNAT.Table
         (Table_Component_Type => Node_Id,
          Table_Index_Type     => Natural,
          Table_Low_Bound      => Natural'First + 1,
          Table_Initial        => Allocations.Resource_Table_Initial,
          Table_Increment      => Allocations.Resource_Table_Increment);
      --  Таблица отложенных ресурсов.

      package Widgets renames Widget_Instances_Order_Table;
      --  Таблица виджетов, отсортированных по времени создания.

      procedure Generate_Package (File : File_Type;
                                  Package_Name : Wide_String);

      procedure Generate_Widget_Creation (File : File_Type; Widget : Node_Id);

      function Integer_Image (Value : in Integer) return Wide_String;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Generate_Package
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Generate_Package (File : File_Type;
                                  Package_Name : Wide_String)
      is
      begin
         --    generation of spec

         Put_Line (File => File,
                   Item => "with Xm_Form;");
         Put_Line (File => File,
                   Item => "with Xm_Message_Box;");
         Put_Line (File => File,
                   Item => "with Xm_String_Defs;");
         Put_Line (File => File,
                   Item => "with Xm_Text;");
         New_Line (File);
         Put_Line (File => File,
                   Item => "with Xt;");
         Put_Line (File => File,
                   Item => "with Xt.Ancillary_Types;");
         Put_Line (File => File,
                   Item => "with Xt.Resource_Management;");
         New_Line (File);
         Put_Line (File => File,
                   Item => "package " & Package_Name & "s is");
         New_Line (File);
         Put_Line (File => File,
                   Item => "   type " & Package_Name & " is limited private;");
         New_Line (File);
         Put_Line (File => File,
                   Item => "   type " & Package_Name & "_Access is access all "
                           & Package_Name & ";");
         New_Line (File);
         Put_Line (File => File,
                   Item => "   package Constructors is");
         New_Line (File);
         Put_Line (File => File,
                   Item => "      function Create (Parent : in Xt.Widget)");
         Put_Line (File => File,
                   Item => "        return " & Package_Name & "_Access;");
         New_Line (File);
         Put_Line (File => File,
                   Item => "   end Constructors;");
         New_Line (File);
         Put_Line (File => File,
                   Item => "private");
         New_Line (File);
         Put_Line (File => File,
                   Item => "   type " & Package_Name & " is limited record");

         if Widget_Instances_Order_Table.Last >=
            Widget_Instances_Order_Table.First
         then
            for J in Widget_Instances_Order_Table.First ..
                     Widget_Instances_Order_Table.Last loop
               Put_Line (File, "      "
                 & Model.Queries.Name_Image
                    (Widget_Instances_Order_Table.Table (J))
                 & " : Xt.Widget;");
            end loop;

         else
            Put_Line (File => File,
                      Item => "      null;");
         end if;

         Put_Line (File => File,
                   Item => "   end record;");
         Put_Line (File => File,
                   Item => "end " & Package_Name & "s;");

         New_Line (File);
   --    generation of body

         Put_Line (File => File,
                   Item => "package body " & Package_Name & "s is");
         New_Line (File);
         Put_Line (File => File,
                   Item => "   package CallBacks is");
         Put_Line (File => File,
                   Item => "   end CallBacks;");
         New_Line (File);
         Put_Line (File => File,
                   Item => "   package body CallBacks is");
         Put_Line (File => File,
                   Item => "   end CallBacks;");
         New_Line (File);
         Put_Line (File => File,
                   Item => "   package body Constructors is");
         New_Line (File);
         Put_Line (File => File,
                   Item => "      function Create (Parent : in Xt.Widget)");
         Put_Line (File => File,
                   Item => "        return " & Package_Name & "_Access");
         Put_Line (File => File,
                   Item => "      is");
         Put_Line (File => File,
                   Item => "         Result : "
                           & Package_Name & "_Access := new " &
                           Package_Name & ";");
         New_Line (File);
         Put_Line (File => File,
                   Item => "      begin");

         for J in Widgets.First ..  Widgets.Last loop
            Generate_Widget_Creation (File, Widgets.Table (J));
         end loop;

         Put_Line (File => File,
                   Item => "         return Result;");
         Put_Line (File => File,
                   Item => "      end Create;");
         New_Line (File);
         Put_Line (File => File,
                   Item => "   end Constructors;");
         New_Line (File);
         Put_Line (File => File,
                   Item => "end " & Package_Name & "s;");

      end Generate_Package;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Generate_Widget_Creation
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Generate_Widget_Creation (File : File_Type; Widget : Node_Id)
      is
         function Separate_Resources (Widget : in Node_Id) return Natural;

         ---------------------------------------------------------------------
         --! <Subprogram>
         --!    <Unit> Separate_Resources
         --!    <ImplementationNotes>
         ---------------------------------------------------------------------
         function Separate_Resources (Widget : in Node_Id) return Natural is
            Res : Natural := 0;

         begin
            if Resources (Widget) /= Null_List then
               declare
                  Resource      : Node_Id := First (Resources (Widget));
                  Specification : Node_Id;

               begin
                  while Resource /= Null_Node loop
                     Specification := Resource_Specification (Resource);

                     if Can_Be_Set_At_Creation_Time (Specification)
                        and then Node_Kind (Resource_Type (Specification))
                          /= Node_Widget_Reference_Resource_Type
                     then
                        --  Ресурс, устанавливаемый во время создания виджета.

                        Res := Res + 1;

                     else
                        --  Отложенный ресурс.

                        Set_Is_Postponed (Resource, True);

                        Postponed_Resource_Table.Append (Resource);
                        --  Добавляем ресурс в глобальный массив
                        --  отложенных ресурсов.
                     end if;

                     Resource := Next (Resource);
                  end loop;
               end;
            end if;

            return Res;
         end Separate_Resources;

         Resource          : Node_Id := Null_Node;

         Hardcoded_Counter : constant Natural := Separate_Resources (Widget);
         --  Количество ресурсов, устанавливаемых при создании виджета.

      begin
         if Hardcoded_Counter > 0 then
            Resource := First (Resources (Widget));

            Put_Line (File, "         declare");
            Put_Line (File,
                      "            Args : "
                      & "Xt.Ancillary_Types.Xt_Arg_List (1 .. "
                      & Integer_Image (Hardcoded_Counter)
                      & ");");
            New_Line (File);
         end if;

         Put_Line (File,
                   "         begin");

         if Hardcoded_Counter > 0 then
            declare
               Counter : Integer := 0;
               --  Счетчик обработанных ресурсов.

            begin
               while Resource /= Null_Node loop
                  Counter := Counter + 1;

                  Put_Line (File,
                            "            "
                            & "Xt.Resource_Management.Xt_Set_Arg");
                  Put_Line (File,
                            "             (Args ("
                            & Integer_Image (Counter)
                            & "),");

                  Put_Line (File,
                            "              "
                            & Model.Names.Image
                               (Resource_Name_String
                                 (Resource_Specification (Resource)))
                            & ",");
                  Put_Line (File, "              "
                            & "Xt.Ancillary_Types.Xt_Arg_Val ("
                            & Integer_Image (Resource_Value (Resource))
                            &"));");
                  New_Line (File);

                  Resource := Next (Resource);
               end loop;

               pragma Assert (Hardcoded_Counter = Counter);
            end;
         end if;

         Put_Line (File => File,
                   Item => "            Result."
                     & Model.Queries.Name_Image (Widget));
         Put_Line
          (File => File,
           Item => "              := "
             & Model.Names.Image (Convenience_Create_Function_Name
                (Class (Widget))));

         if Node_Kind (Parent_Node (Widget)) = Node_Component_Class then
            Put (File, "                  (Parent");

         else
            Put (File,
                 "                  (Result."
                 & Model.Queries.Name_Image
                    (Parent_Node (Widget)));
         end if;

         Put (File, ", """
             & Model.Queries.Name_Image (Widget));

         if Hardcoded_Counter > 0 then
            Put_Line (File, """, Args);");

         else
            Put_Line (File, """);");
         end if;

         Put_Line (File,
                   "         end;");
         New_Line (File);

      end Generate_Widget_Creation;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Integer_Image
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Integer_Image (Value : in Integer) return Wide_String is
         Str : constant Wide_String := Integer'Wide_Image (Value);

      begin
         return  Str (Str'First + 1 .. Str'Last);
      end Integer_Image;

      File : File_Type;

   begin
      Postponed_Resource_Table.Init;

      Create (File => File,
              Mode => Out_File,
              Name => "test.ada");
      Find_Widget_Instances_Order (Root (Node));
      Generate_Package (File, Model.Queries.Name_Image (Node));
      Close (File);

      Postponed_Resource_Table.Free;
   end Generate;

end Generator.Prototype.Component_Class;
