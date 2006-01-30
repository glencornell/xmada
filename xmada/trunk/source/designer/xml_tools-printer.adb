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
--! <Unit> XML_Tools.Printer
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Wide_Text_IO;

with XML_Tools.Attributes;
with XML_Tools.Elements;
with XML_Tools.Names;
with XML_Tools.Strings;

package body XML_Tools.Printer is

   use Ada.Wide_Text_IO;
   use XML_Tools.Attributes;
   use XML_Tools.Elements;
   use XML_Tools.Names;
   use XML_Tools.Strings;

   procedure Print (Element : in Element_Id);

   Indent : Count;


   -----------
   -- Print --
   -----------

   procedure Print is
   begin
      Put ("<?xml version = '1.0' encoding = 'UTF8' ?>");

      Indent := 1;

      Print (1);
   end Print;

   -----------
   -- Print --
   -----------

   procedure Print (Element : in Element_Id) is
   begin
      Set_Col (Indent);

      case Kind (Element) is
         when A_Tag =>
            Put ('<' & Image (Name (Element)));

            declare
               Aux : Attribute_Id := Attribute (Element);

            begin
               while Aux /= Null_Attribute_Id loop
                  declare
                     Str : constant Wide_String
                       := ' '
                            & Image (Name (Aux))
                            & " = '"
                            & Image (Value (Aux)) & ''';

                  begin
                     if Col + Str'Length > 79 then
                        Set_Col (Indent + 3);
                     end if;

                     Put (Str);
                     Aux := Next (Aux);
                  end;
               end loop;
            end;

            if Child (Element) = Null_Element_Id then
               Put ("/>");

            else
               Put ('>');

               Indent := Indent + 1;

               declare
                  Aux : Element_Id := Child (Element);

               begin
                  while Aux /= Null_Element_Id loop
                     Print (Aux);

                     Aux := Next (Aux);
                  end loop;
               end;

               Indent := Indent - 1;

               Set_Col (Indent);
               Put ("</" & Image (Name (Element)) & '>');
            end if;


         when A_String =>
            Put_Line (Image (Value (Element)));
      end case;
   end Print;

end XML_Tools.Printer;
