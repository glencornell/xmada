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
with Model.Names;
with Model.Queries;
with Model.Tree;
with Model.Tree.Xm_Ada;
with Model.Widget_Instances_Ordering;

package body Generator.Prototype.Component_Class is

   use Ada.Wide_Text_IO;
   use Model.Tree;
   use Model.Tree.Xm_Ada;
   use Model.Widget_Instances_Ordering;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Generate
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Generate (Node : in Model.Node_Id) is

      package Widgets renames Widget_Instances_Order_Table;

      procedure Generate_Package (File : File_Type;
                                  Package_Name : Wide_String);

      procedure Generate_Package (File : File_Type;
                                  Package_Name : Wide_String)
      is
      begin
   --    generation of spec

         Put_Line (File => File,
                   Item => "with Xt;");
         Put_Line (File => File,
                   Item => "with Xm_Form;");
         Put_Line (File => File,
                   Item => "with Xm_Message_Box;");
         Put_Line (File => File,
                   Item => "with Xm_Text;");
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
            Put_Line (File => File,
                      Item => "         Result."
                        & Model.Queries.Name_Image (Widgets.Table (J)));
            Put
             (File => File,
              Item => "           := "
                & Model.Names.Image (Convenience_Create_Function_Name
                   (Class (Widgets.Table (J)))));
            if J = Widgets.First then
               Put (File, " (Parent");

            else
               Put (File,
                    " (Result."
                    & Model.Queries.Name_Image
                       (Parent_Node (Widgets.Table (J))));
            end if;
            Put_Line (File, ", """
                & Model.Queries.Name_Image (Widgets.Table (J))
                & """);");
         end loop;

         New_Line (File);
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

      File : File_Type;

   begin

      Create (File => File,
              Mode => Out_File,
              Name => "test.ada");
      Find_Widget_Instances_Order (Root (Node));
      Generate_Package (File, Model.Queries.Name_Image (Node));
      Close (File);
   end Generate;

end Generator.Prototype.Component_Class;
