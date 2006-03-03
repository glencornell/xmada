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
--! <Unit> Model.Utilities
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model.Tree.Constructors;
with Model.Tree.Lists;

package body Model.Utilities is

   use Model.Tree;
   use Model.Tree.Constructors;
   use Model.Tree.Lists;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Corresponding_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Corresponding_Resource_Value (Node : in Node_Id)
     return Node_Id
   is
      Result : Node_Id;

   begin
      pragma Assert (Node_Kind (Node) = Node_Resource_Specification);

      case Node_Kind (Resource_Type (Node)) is
         when Node_Predefined_Resource_Type =>
            case Type_Kind (Resource_Type (Node)) is
               when Type_Unspecified =>
                  raise Program_Error;

               when Type_Position
                 | Type_Dimension
                 | Type_C_Int
                 | Type_C_Short
               =>
                  Result := Create_Integer_Resource_Value;

               when Type_Pixel =>
                  Result := Create_Pixel_Resource_Value;

               when Type_Pixmap =>
                  Result := Create_Pixmap_Resource_Value;

               when Type_Colormap =>
                  Result := Create_Colormap_Resource_Value;

               when Type_Screen =>
                  Result := Create_Screen_Resource_Value;

               when Type_Translation_Data =>
                  Result := Create_Translation_Data_Resource_Value;
            end case;

         when Node_Enumerated_Resource_Type =>
            Result := Create_Enumeration_Resource_Value;

         when Node_Widget_Reference_Resource_Type =>
            Result := Create_Widget_Reference_Resource_Value;

         when Node_Xm_Render_Table_Resource_Type =>
            Result := Create_Xm_Render_Table_Resource_Value;

         when Node_Xm_String_Resource_Type =>
            Result := Create_Xm_String_Resource_Value;

         when others =>
            raise Program_Error;
      end case;

      Set_Resource_Specification (Result, Node);

      --  TODO Заодно необходимо задать начальное значение, если таковое
      --  присутствует в спецификации ресурса.

      return Result;
   end Create_Corresponding_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget_Instance
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Widget_Instance (Widget_Class : in Node_Id)
     return Node_Id
   is
      Result : Node_Id;

   begin
      pragma Assert (Node_Kind (Widget_Class) = Node_Widget_Class);

      Result := Create_Widget_Instance;
      Set_Class (Result, Widget_Class);
      Set_Is_Managed (Result, True);

      if Automatically_Created_Parent (Widget_Class) /= Null_Node then
         Set_Automatically_Created_Parent
          (Result,
           Create_Widget_Instance
            (Class (Automatically_Created_Parent (Widget_Class))));
         --  XXX Задать остальные атрибуты: имя и др.
      end if;

      if Automatically_Created_Children (Widget_Class) /= Null_List then
         declare
            List : constant List_Id := New_List;
            Aux  : Node_Id
              := First (Automatically_Created_Children (Widget_Class));

         begin
            while Aux /= Null_Node loop
               Append (List, Create_Widget_Instance (Class (Aux)));

               --  XXX Задать остальные атрибуты: имя и др.

               Aux := Next (Aux);
            end loop;

           Set_Automatically_Created_Children (Result, List);
         end;
      end if;

      return Result;
   end Create_Widget_Instance;

end Model.Utilities;
