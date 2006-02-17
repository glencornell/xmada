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

      package Package_Names is
        new GNAT.Table
         (Table_Component_Type => Name_Id,
          Table_Index_Type     => Natural,
          Table_Low_Bound      => Natural'First + 1,
          Table_Initial        => Allocations.Package_Names_Initial,
          Table_Increment      => Allocations.Package_Names_Increment);
      --  Таблица имен использульзуемых пакетов.

      package Postponed_Resources is
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

      procedure Generate_Resource (File     : in File_Type;
                                   Resource : in Node_Id;
                                   Index    : in Integer);

      procedure Generate_Widget_Creation (File : File_Type; Widget : Node_Id);

      function Integer_Image (Value : in Integer) return Wide_String;

      function Resource_Value_String (Node : in Node_Id) return Wide_String;

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
         Package_Names.Append (Model.Names.Enter ("with Xm"));
         Package_Names.Append (Model.Names.Enter ("with Xm_Form"));
         Package_Names.Append (Model.Names.Enter ("with Xm_Label"));
         Package_Names.Append (Model.Names.Enter ("with Xm_Message_Box"));
         Package_Names.Append (Model.Names.Enter ("with Xm_Push_Button"));
         Package_Names.Append (Model.Names.Enter
           ("with Xm.Resource_Management"));
         Package_Names.Append (Model.Names.Enter ("with Xm_String_Defs"));
         Package_Names.Append (Model.Names.Enter ("with Xm_Text"));
         Package_Names.Append (Model.Names.Enter ("with Xt"));
         Package_Names.Append (Model.Names.Enter ("with Xt.Ancillary_Types"));
         Package_Names.Append (Model.Names.Enter
           ("with Xt.Composite_Management"));
         Package_Names.Append (Model.Names.Enter
           ("with Xt.Resource_Management"));

         for J in Package_Names.First .. Package_Names.Last loop
            Put_Line (File, Model.Names.Image (Package_Names.Table (J)) & ";");
         end loop;

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

         if Widgets.Last >= Widgets.First then
            for J in Widgets.First ..  Widgets.Last loop
               Put_Line (File, "      "
                 & Model.Queries.Name_Image (Widgets.Table (J))
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

         --  Генерируем создание виджетов.

         for J in Widgets.First .. Widgets.Last loop
            Generate_Widget_Creation (File, Widgets.Table (J));
         end loop;

         --  Генерируем создание отложенных ресурсов
         --  и берем виджет на управление.

         for J in reverse Widgets.First .. Widgets.Last loop
            declare
               N : constant Node_Id := Widgets.Table (J);

            begin
               for K in Postponed_Resources.First .. Postponed_Resources.Last
               loop
                  declare
                     R : constant Node_Id := Postponed_Resources.Table (K);

                  begin
                     if Parent_Node (R) = N then
                        Put_Line (File, "         declare");
                        Put_Line (File,
                                  "            Args : "
                                  & "Xt.Ancillary_Types.Xt_Arg_List (1 .. 1"
                                  & ");");
                        New_Line (File);

                        Put_Line (File,
                                  "         begin");

                        Generate_Resource (File, R, J);
                        Put_Line (File,
                                  "            "
                                  & "Xt.Resource_Management.Xt_Set_Values "
                                  & "(Result."
                                  & Model.Queries.Name_Image (N)
                                  & ", Args);");
                        New_Line (File);
                        Put_Line (File,
                                  "         end;");
                        New_Line (File);
                     end if;
                  end;
               end loop;

               Put_Line (File,
                         "         "
                         & "Xt.Composite_Management.Xt_Manage_Child ("
                         & "Result."
                         & Model.Queries.Name_Image (N)
                         & ");");
               New_Line (File);
            end;
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
      --!    <Unit> Generate_Resource
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Generate_Resource (File     : in File_Type;
                                   Resource : in Node_Id;
                                   Index    : in Integer)
      is
      begin
         Put_Line (File,
                   "            "
                   & Model.Names.Image
                      (Argument_Package_Name
                        (Resource_Type (Resource_Specification (Resource))))
                   & ".Xt_Set_Arg");
         Put_Line (File,
                   "             (Args ("
                   & Integer_Image (Index)
                   & "),");

         Put_Line (File,
                   "              "
                   & Model.Names.Image
                      (Resource_Name_String
                        (Resource_Specification (Resource)))
                   & ",");
         Put_Line (File, "              "
                   & Resource_Value_String
                      (Resource)
                   &");");
         New_Line (File);
      end Generate_Resource;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Generate_Widget_Creation
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Generate_Widget_Creation (File : File_Type; Widget : Node_Id)
      is
         function Separate_Resources (Widget : in Node_Id) return Natural;

         function Generate_Resources (Resources : in List_Id;
                                      Counter   : in Natural)
           return Natural;

         ---------------------------------------------------------------------
         --! <Subprogram>
         --!    <Unit> Generate_Resources
         --!    <ImplementationNotes>
         ---------------------------------------------------------------------
         function Generate_Resources (Resources : in List_Id;
                                      Counter   : in Natural)
           return Natural
         is
            Res : Natural := Counter;

         begin
            if Resources /= Null_List then
               declare
                  Resource : Node_Id := First (Resources);

               begin
                  while Resource /= Null_Node loop
                     if not Is_Postponed (Resource) then
                        Res := Res + 1;
                        Generate_Resource (File, Resource, Res);
                     end if;

                     Resource := Next (Resource);
                  end loop;
               end;
            end if;

            return Res;
         end Generate_Resources;

         ---------------------------------------------------------------------
         --! <Subprogram>
         --!    <Unit> Separate_Resources
         --!    <ImplementationNotes>
         ---------------------------------------------------------------------
         function Separate_Resources (Widget : in Node_Id) return Natural is
            function Is_Postponed_Resource (Resource : in Node_Id)
               return Boolean;

            function Process_Resources (Resources : in List_Id)
              return Natural;

            ------------------------------------------------------------------
            --! <Subprogram>
            --!    <Unit> Is_Postponed_Resource
            --!    <ImplementationNotes>
            ------------------------------------------------------------------
            function Is_Postponed_Resource (Resource : in Node_Id)
              return Boolean
            is
               Specification : constant Node_Id
                 := Resource_Specification (Resource);

            begin
               if Can_Be_Set_At_Creation_Time (Specification)
                 and not Is_Postponed (Resource)
               then
                  --  Ресурс, устанавливаемый во время создания виджета.

                  return False;

               elsif Can_Be_Set_By_Set_Values (Specification) then
                  --  Отложенный ресурс.

                  Set_Is_Postponed (Resource, True);

                  Postponed_Resources.Append (Resource);
                  --  Добавляем ресурс в глобальный массив
                  --  отложенных ресурсов.

                  return True;

               else
                  raise Program_Error;
                  --  Ресурс не может быть задан в момент
                  --  создания виджета, но и не может быть
                  --  задан позже.

               end if;
            end Is_Postponed_Resource;

            ------------------------------------------------------------------
            --! <Subprogram>
            --!    <Unit> Process_Resources
            --!    <ImplementationNotes>
            ------------------------------------------------------------------
            function Process_Resources (Resources : in List_Id)
              return Natural
            is
               Res : Natural := 0;

            begin
               if Resources /= Null_List then
                  declare
                     Resource : Node_Id := First (Resources);

                  begin
                     while Resource /= Null_Node loop
                        if not Is_Postponed_Resource (Resource) then
                           Res := Res + 1;
                        end if;

                        Resource := Next (Resource);
                     end loop;
                  end;
               end if;

               return Res;
            end Process_Resources;

            Res : Natural := 0;

         begin
            Res := Process_Resources (Resources (Widget))
              + Process_Resources (Constraint_Resources (Widget));

            return Res;
         end Separate_Resources;

         Resource          : Node_Id := Null_Node;

         Hardcoded_Counter : constant Natural := Separate_Resources (Widget);
         --  Количество ресурсов, устанавливаемых при создании виджета.

      begin
         if Hardcoded_Counter > 0 then
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
               Counter := Generate_Resources
                           (Resources (Widget), 0);
               Counter := Generate_Resources
                           (Constraint_Resources (Widget), Counter);

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
                 & Model.Queries.Name_Image (Parent_Node (Widget)));
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

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Resource_Value_String
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Resource_Value_String (Node : in Node_Id) return Wide_String is
      begin
         case Node_Kind (Node) is
            when Node_Integer_Resource_Value =>
               return "Xt.Ancillary_Types.Xt_Arg_Val ("
                 & Integer_Image (Resource_Value (Node))
                 & ")";

            when Node_Widget_Reference_Resource_Value =>
               return "Result."
                 & Model.Queries.Name_Image (Resource_Value (Node));

            when Node_Enumeration_Resource_Value =>
               return "Xm.Xm_Attach_Widget";
--             return Model.Names.Image
--                     (Literal_Identifier (Resource_Value (Node)));

            when others =>
               Ada.Wide_Text_IO.Put_Line
                (Standard_Error, "ERROR: Unhandled resource type : "
                 & Node_Kinds'Wide_Image (Node_Kind (Node)));
               raise Program_Error;
         end case;
      end Resource_Value_String;

      File : File_Type;

   begin
      Postponed_Resources.Init;

      Create (File => File,
              Mode => Out_File,
              Name => "test.ada");
      Find_Widget_Instances_Order (Root (Node));
      Generate_Package (File, Model.Queries.Name_Image (Node));
      Close (File);

      Postponed_Resources.Free;
   end Generate;

end Generator.Prototype.Component_Class;
