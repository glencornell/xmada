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
with Ada.Characters.Handling;
with Ada.Strings.Wide_Unbounded;
with Ada.Wide_Text_IO;

with GNAT.Table;

with Model.Allocations;
with Model.Names;
with Model.Queries;
with Model.Strings;
with Model.Tree;
with Model.Tree.Lists;
with Model.Tree.Xm_Ada;
with Model.Widget_Instances_Ordering;

package body Generator.Prototype.Component_Class is

   use Ada.Characters.Handling;
   use Ada.Strings.Wide_Unbounded;
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

      procedure Append_Package_Name (Value : in Name_Id);

      procedure Generate_Package (File : File_Type;
                                  Package_Name : Wide_String;
                                  Type_Name : Wide_String);

      procedure Generate_Resource (File     : in File_Type;
                                   Resource : in Node_Id;
                                   Index    : in Integer);

      procedure Generate_Widget_Creation (File : File_Type; Widget : Node_Id);

      function Integer_Image (Value : in Integer) return Wide_String;

      function Resource_Value_String (Node : in Node_Id) return Wide_String;

      procedure Sort_Package_Names;

      function Variable_Widget_Name_Image (Node : in Node_Id)
        return Wide_String;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Append_Package_Name
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Append_Package_Name (Value : in Name_Id) is
         Is_Found : Boolean := False;

      begin
         for J in Package_Names.First .. Package_Names.Last loop
            if Package_Names.Table (J) = Value then
               Is_Found := True;
               exit;
            end if;
         end loop;

         if not Is_Found then
            Package_Names.Append (Value);
         end if;
      end Append_Package_Name;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Generate_Package
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Generate_Package (File : File_Type;
                                  Package_Name : Wide_String;
                                  Type_Name : Wide_String)
      is
      begin
         --  Генерируем контекст.

         begin
            Append_Package_Name (Model.Names.Enter ("Xm"));
            Append_Package_Name (Model.Names.Enter ("Xm_String_Defs"));
            Append_Package_Name (Model.Names.Enter ("Xt"));
            Append_Package_Name (Model.Names.Enter ("Xt.Ancillary_Types"));
            Append_Package_Name (Model.Names.Enter ("Xt.Composite_Management"));
            Append_Package_Name (Model.Names.Enter ("Xt.Resource_Management"));
            Append_Package_Name (Model.Names.Enter ("Xm.Resource_Management"));

            --  Проходим по таблице виджетов и
            --  формируем список подключаемых модулей для
            --  используемых классов виджетов.

            for J in Widgets.First .. Widgets.Last loop
               declare
                  Id : constant Name_Id
                    := Convenience_Create_Function_Package_Name
                        (Class (Widgets.Table (J)));

               begin
                  Append_Package_Name (Id);
               end;
            end loop;

            Sort_Package_Names;

            for J in Package_Names.First .. Package_Names.Last loop
               Put_Line (File,
                 "with " & Model.Names.Image (Package_Names.Table (J)) & ";");
            end loop;

            New_Line (File);
         end;

         --  Генерируем раздел спецификации пакета.

         begin
            Put_Line (File, "package " & Package_Name & "s is");
            New_Line (File);
            Put_Line (File, "   type " & Type_Name
                            & " is limited private;");
            New_Line (File);
            Put_Line (File, "   type " & Type_Name
                            & "_Access is access all " & Type_Name & ";");
            New_Line (File);
            Put_Line (File, "   package Constructors is");
            New_Line (File);
            Put_Line (File, "      function Create (Parent : in Xt.Widget)");
            Put_Line (File, "        return " & Type_Name & "_Access;");
            New_Line (File);
            Put_Line (File, "   end Constructors;");
            New_Line (File);
            Put_Line (File, "private");
            New_Line (File);
            Put_Line (File, "   type " & Type_Name & " is limited record");

            if Widgets.Last >= Widgets.First then
               for J in Widgets.First ..  Widgets.Last loop
                  Put_Line (File, "      "
                    & Variable_Widget_Name_Image (Widgets.Table (J))
                    & " : Xt.Widget;");
               end loop;

            else
               Put_Line (File, "      null;");
            end if;

            Put_Line (File, "   end record;");
            Put_Line (File, "end " & Package_Name & "s;");
            New_Line (File);
         end;

         --  Генерируем тело пакета.

         begin
            Put_Line (File, "package body " & Package_Name & "s is");
            New_Line (File);
            Put_Line (File, "   package CallBacks is");
            Put_Line (File, "   end CallBacks;");
            New_Line (File);
            Put_Line (File, "   package body CallBacks is");
            Put_Line (File, "   end CallBacks;");
            New_Line (File);
            Put_Line (File, "   package body Constructors is");
            New_Line (File);
            Put_Line (File, "      function Create (Parent : in Xt.Widget)");
            Put_Line (File, "        return " & Type_Name & "_Access");
            Put_Line (File, "      is");
            Put_Line (File, "         Result : " & Type_Name & "_Access");
            Put_Line (File, "           := new " & Type_Name & ";");
            New_Line (File);
            Put_Line (File, "      begin");

            --  Генерируем создание виджетов.

            for J in Widgets.First .. Widgets.Last loop
               Generate_Widget_Creation (File, Widgets.Table (J));
            end loop;

            --  Генерируем создание отложенных ресурсов
            --  и берем виджет на управление.

            for J in reverse Widgets.First .. Widgets.Last loop
               declare
                  N     : constant Node_Id := Widgets.Table (J);
                  First : constant Natural := Postponed_Resources.First;
                  Last  : constant Natural := Postponed_Resources.Last;

               begin
                  for K in First .. Last loop
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

                           Put_Line (File, "         begin");

                           Generate_Resource (File, R, J);
                           Put_Line (File,
                                     "            "
                                     & "Xt.Resource_Management.Xt_Set_Values "
                                     & "(Result."
                                     & Variable_Widget_Name_Image (N)
                                     & ", Args);");
                           New_Line (File);
                           Put_Line (File, "         end;");
                           New_Line (File);
                        end if;
                     end;
                  end loop;

                  Put_Line (File,
                            "         "
                            & "Xt.Composite_Management.Xt_Manage_Child ("
                            & "Result."
                            & Variable_Widget_Name_Image (N)
                            & ");");
                  New_Line (File);
               end;
            end loop;

            Put_Line (File, "         return Result;");
            Put_Line (File, "      end Create;");
            New_Line (File);
            Put_Line (File, "   end Constructors;");
            New_Line (File);
            Put_Line (File, "end " & Package_Name & "s;");
         end;
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

         --  Generate:
         --    Result.<widget>
         --      := Xm_XXX.Xm_Create_XXX
         --          (<parent>, <widget>[, Args]);

         Put_Line (File,
                   "            Result."
                   & Variable_Widget_Name_Image (Widget));
         Put_Line
          (File,
           "              := "
             & Model.Names.Image
                (Convenience_Create_Function_Name (Class (Widget))));

         if Node_Kind (Parent_Node (Widget)) = Node_Component_Class then
            Put (File, "                  (Parent");

         else
            Put (File,
                 "                  (Result."
                 & Variable_Widget_Name_Image (Parent_Node (Widget)));
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
                 & Variable_Widget_Name_Image (Resource_Value (Node));

            when Node_Enumeration_Resource_Value =>
               return Model.Names.Image
                       (Literal_Identifier (Resource_Value (Node)));

            when others =>
               Ada.Wide_Text_IO.Put_Line
                (Standard_Error, "ERROR: Unhandled resource type : "
                 & Node_Kinds'Wide_Image (Node_Kind (Node)));
               raise Program_Error;
         end case;
      end Resource_Value_String;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Sort_Package_Names
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Sort_Package_Names is
      begin
         for J1 in Package_Names.First .. Package_Names.Last loop
            for J2 in J1 + 1 .. Package_Names.Last loop
               declare
                  Str1 : constant Wide_String
                    := Model.Names.Image (Package_Names.Table (J1));
                  Str2 : constant Wide_String
                    := Model.Names.Image (Package_Names.Table (J2));

               begin
                  if Str1 > Str2 then
                     declare
                        Temp : constant Name_Id := Package_Names.Table (J2);

                     begin
                        Package_Names.Set_Item (J2, Package_Names.Table (J1));
                        Package_Names.Set_Item (J1, Temp);
                     end;
                  end if;
               end;
            end loop;
         end loop;
      end Sort_Package_Names;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Variable_Widget_Name_Image
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Variable_Widget_Name_Image (Node : in Node_Id)
        return Wide_String
      is
         pragma Assert (Node_Kind (Node) = Node_Widget_Instance);

      begin
         if Xm_Ada.In_Record_Name (Node) = Null_String then
            return Model.Queries.Name_Image (Node);
         end if;

         return Model.Strings.Image (Xm_Ada.In_Record_Name (Node));
      end Variable_Widget_Name_Image;

      File : File_Type;

   begin
      Package_Names.Init;
      Postponed_Resources.Init;

      Create (File => File,
              Mode => Out_File,
              Name => "test.ada");
      Find_Widget_Instances_Order (Root (Node));

      declare
         Package_Name : String_Id := Xm_Ada.Package_Name (Node);
         Type_Name    : String_Id := Xm_Ada.Type_Name (Node);

      begin
         if Package_Name = Null_String then
            Package_Name
              := Model.Strings.Store (Model.Queries.Name_Image (Node));
         end if;

         if Type_Name = Null_String then
            Type_Name := Package_Name;
         end if;

         Generate_Package (File,
                           Model.Strings.Image (Package_Name),
                           Model.Strings.Image (Type_Name));
      end;

      Close (File);

      Postponed_Resources.Free;
      Package_Names.Free;
   end Generate;

end Generator.Prototype.Component_Class;
