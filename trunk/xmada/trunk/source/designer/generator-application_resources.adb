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
--! <Unit> Generator.Application_Resources
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Wide_Text_IO;
with Ada.Characters.Handling;

with Model;
with Model.Names;
with Model.Queries;
with Model.Tree;
with Model.Tree.Lists;
with Model.Strings;

package body Generator.Application_Resources is

   use Ada.Wide_Text_IO;
   use Ada.Characters.Handling;

   use Model;
   use Model.Names;
   use Model.Queries;
   use Model.Tree;
   use Model.Tree.Lists;
   use Model.Strings;
   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Generate
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Generate (Node : in Node_Id) is

       ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Create_Full_Name_Widget
      --!    <Purpose>
      --!    <Exceptions>
      ------------------------------------------------------------------------
      function Create_Full_Name_Widget (Node : in Node_Id)
        return Wide_String;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Generate_Resources
      --!    <Purpose>
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Generate_Resources (Res_List    : in List_Id;
                                    Tmp_Path    : in Wide_String;
                                    Output_File : in File_Type);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Generate_Widget_Resources
      --!    <Purpose>
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Generate_Widget_Resources (Widget_Example : in Node_Id;
                                           Output_File    : in File_Type;
                                           Current_Path   : in Wide_String);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Convert_To_Resource_Filename
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Convert_To_Resource_Filename (Node : in Node_Id)
         return Wide_String;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Convert_To_Resource_Filename
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Convert_To_Resource_Filename (Node : in Node_Id)
         return Wide_String
      is
         Str : constant Wide_String
           := Image (Application_Class_Name (Node));
      begin
         return Str & ".ad";
      end Convert_To_Resource_Filename;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Create_Full_Name_Widget
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Create_Full_Name_Widget (Node : in Node_Id)
        return Wide_String
      is
    
         ----------------------------------------------------------------------
         --! <Subprogram>
         --!    <Unit> Create_Full_Name_Widget_Function
         --!    <Purpose>
         --!    <Exceptions>
         ----------------------------------------------------------------------
         function Create_Full_Name_Widget_Function (Node : in Node_Id)
           return Wide_String;

         ----------------------------------------------------------------------
         --! <Subprogram>
         --!    <Unit> Create_Full_Name_Widget_Function
         --!    <ImplementationNotes>
         ----------------------------------------------------------------------
         function Create_Full_Name_Widget_Function (Node : in Node_Id)
           return Wide_String
         is
            Aux : constant Node_Id := Node;

         begin
            if Node_Kind (Aux) = Node_Component_Class then
               return "";
            end if;
  
            return 
               Create_Full_Name_Widget_Function
                (Parent_Node (Aux)) & "." & Name_Image (Aux);
         end Create_Full_Name_Widget_Function;    
      
         Tmp : constant Wide_String := Create_Full_Name_Widget_Function (Node);

      begin
         return Tmp (Tmp'First + 1 .. Tmp'Last);
      end Create_Full_Name_Widget;
      
      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Generate_Resources
      --!    <Purpose>
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Generate_Resources (Res_List    : in List_Id;
                                    Tmp_Path    : in Wide_String;
                                    Output_File : in File_Type)
      is
         Current_Resource  : Node_Id;

      begin
         if Res_List = Null_List then
            return;
         end if;

         Current_Resource := First (Res_List);

         while Current_Resource /= Null_Node loop
            case Node_Kind (Current_Resource) is
               when Node_Enumeration_Resource_Value =>
                  declare
                     Tmp : constant Node_Id
                       := Resource_Value (Current_Resource);

                  begin
                     if Tmp /= Null_Node then 
                        Put_Line
                         (Output_File,
                          Tmp_Path
                          & "."
                          & Internal_Resource_Name_Image
                           (Resource_Specification
                            (Current_Resource))
                          & " : "
                          & Name_Image
                           (Tmp));
                     end if;
                  end;

               when Node_Widget_Reference_Resource_Value  =>
                  declare
                     Tmp : constant Node_Id
                       := Resource_Value (Current_Resource);
    
                  begin
                     if Tmp /= Null_Node then 
                       Put_Line
                         (Output_File,
                          Tmp_Path
                          & "."
                          & Internal_Resource_Name_Image
                           (Resource_Specification
                            (Current_Resource))
                          & " : "
                          & Create_Full_Name_Widget (Tmp));
                     end if;
                  end;

               when Node_Xm_String_Resource_Value  =>
                  declare
                     Tmp : constant String_Id
                       :=  (Resource_Value (Current_Resource));
    
                  begin
                     if Tmp /= Null_String then 
                       Put_Line
                         (Output_File,
                          Tmp_Path
                          & "."
                          & Internal_Resource_Name_Image
                           (Resource_Specification
                            (Current_Resource))
                          & " : "
                          & Image (Tmp));
                     end if;
                  end;

               when Node_Integer_Resource_Value =>

                  declare
                     Tmp_Value : constant Wide_String := Integer'Wide_Image
                      (Resource_Value (Current_Resource));
                     Index     : Positive := Tmp_Value'First;

                  begin
                     if Tmp_Value (1) = ' ' then
                        Index := Index + 1;
                     end if;

                     Put_Line (Output_File,
                      Tmp_Path
                      & "."
                      & Internal_Resource_Name_Image
                       (Resource_Specification
                        (Current_Resource))
                      & " : "
                      & Tmp_Value
                       (Index .. Tmp_Value'Last));
                  end;

               when Node_Screen_Resource_Value =>
                  null;
   
               when Node_Translation_Data_Resource_Value =>
                  null;

               when Node_Colormap_Resource_Value =>
                  null;

               when Node_Pixmap_Resource_Value =>
                  null;

               when Node_Pixel_Resource_Value =>
                  null;
    
               when others =>
                  raise Program_Error;

            end case;

            Current_Resource := Next (Current_Resource);
         end loop;
      end Generate_Resources;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Generate_Widget_Resources
      --!    <Purpose>
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Generate_Widget_Resources (Widget_Example : in Node_Id;
                                           Output_File    : in File_Type;
                                           Current_Path   : in Wide_String)
      is
         Children_List    : constant List_Id := Children (Widget_Example);
         Current_Children : Node_Id;

      begin
         declare
            Tmp_Path : constant Wide_String :=
               Current_Path & Image (Name (Widget_Example));
         begin

            if Resources (Widget_Example) /= Null_List then
               --  Генерация ресурсов виджета.

               Generate_Resources (Resources (Widget_Example),
                                   Tmp_Path,
                                   Output_File);

               --  Генерация ресурсов ограничений виджета.

               Generate_Resources (Constraint_Resources (Widget_Example),
                                   Tmp_Path,
                                   Output_File);
            end if;

            if Children_List /= Null_List then
               Current_Children := First (Children_List);

               while Current_Children /= Null_Node loop
                  Generate_Widget_Resources (Current_Children,
                                             Output_File,
                                             Tmp_Path & ".");
                  Current_Children := Next (Current_Children);
               end loop;
            end if;
         end;
      end Generate_Widget_Resources;

      Output_File       : File_Type;
      Filename          : constant Standard.String
        := To_String (Convert_To_Resource_Filename (Node));
      Current_Component : Node_Id;
      Widget_Example    : Node_Id;

   begin
      pragma Assert (Node_Kind (Node) = Node_Application);

      Create (Output_File, Out_File, Filename, "wcem=8");

      Current_Component := First (Component_Classes (Node));

      while Current_Component /= Null_Node loop
         Widget_Example := Root (Current_Component);
         Generate_Widget_Resources (Widget_Example, Output_File, "*");
         Current_Component := Next (Current_Component);
      end loop;

      Close (Output_File);

   exception
      when others =>
         Close (Output_File);
         raise;
   end Generate;

end Generator.Application_Resources;
