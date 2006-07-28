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
--! <Unit> Model.Debug.Designer
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model.Tree.Designer;

package body Model.Debug.Designer is

   use Ada.Wide_Text_IO;
   use Model.Tree;
   use Model.Tree.Designer;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print
   --!    <Purpose> Выводит дополнительную информацию об узле дерева,
   --! специфическую для дизайнера.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Print (File   : in Ada.Wide_Text_IO.File_Type;
                    Node   : in Model.Node_Id;
                    Offset : in Ada.Wide_Text_IO.Count);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Print
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Print (File   : in Ada.Wide_Text_IO.File_Type;
                    Node   : in Model.Node_Id;
                    Offset : in Ada.Wide_Text_IO.Count)
   is
   begin
      case Node_Kind (Node) is
         when Node_Application
           | Node_Colormap_Resource_Value
           | Node_Component_Class
           | Node_Enumerated_Resource_Type
           | Node_Enumeration_Resource_Value
           | Node_Enumeration_Value_Specification
           | Node_Integer_Resource_Value
           | Node_Pixel_Resource_Value
           | Node_Pixmap_Resource_Value
           | Node_Predefined_Resource_Type
           | Node_Project
           | Node_Resource_Specification
           | Node_Screen_Resource_Value
           | Node_Translation_Data_Resource_Value
           | Node_Widget_Reference_Resource_Type
           | Node_Widget_Reference_Resource_Value
           | Node_Widget_Set
           | Node_Xm_String_Resource_Type
           | Node_Xm_String_Resource_Value
         =>
            null;

         when Node_Widget_Class =>
            if Convenience_Create_Function (Node) /= null then
               Set_Col (File, Offset);
               Put (File, "Has convenience create function");
            end if;

         when Node_Widget_Instance =>
            if All_Resources (Node) /= Null_List then
               Set_Col (File, Offset);
               Put (File, "All resources:");
               Print (File, All_Resources (Node), Offset + Indent);
            end if;

            if All_Constraint_Resources (Node) /= Null_List then
               Set_Col (File, Offset);
               Put (File, "All constraint resources:");
               Print (File, All_Constraint_Resources (Node), Offset + Indent);
            end if;

         when others =>
            raise Program_Error;
      end case;
   end Print;

begin
   Designer_Hook := Print'Access;
end Model.Debug.Designer;
