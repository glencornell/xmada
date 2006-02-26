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

   procedure Print (File    : in Ada.Wide_Text_IO.File_Type;
                    Element : in Element_Id);

   procedure Print_Xml (File : in Ada.Wide_Text_IO.File_Type);

   Indent : Count;


   -----------
   -- Print --
   -----------

   procedure Print is
   begin
      Print_Xml (Standard_Output);
   end Print;

   -----------
   -- Print --
   -----------

   procedure Print (File    : in Ada.Wide_Text_IO.File_Type;
                    Element : in Element_Id)
   is
   begin
      case Kind (Element) is
         when A_Tag =>
            Set_Col (File, Indent);

            Put (File, '<' & Image (Name (Element)));

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
                        Set_Col (File, Indent + 3);
                     end if;

                     Put (File, Str);
                     Aux := Next (Aux);
                  end;
               end loop;
            end;

            if Child (Element) = Null_Element_Id then
               Put_Line (File, "/>");

            else
               Put_Line (File, ">");

               Indent := Indent + 1;

               declare
                  Aux : Element_Id := Child (Element);

               begin
                  while Aux /= Null_Element_Id loop
                     Print (File, Aux);

                     Aux := Next (Aux);
                  end loop;
               end;

               Indent := Indent - 1;

               Set_Col (File, Indent);
               Put (File, "</" & Image (Name (Element)) & '>');
            end if;

         when A_String =>
            declare
               Str   : constant Wide_String := Image (Value (Element));
               Start : Natural := Str'First;

            begin
               loop
                  exit when Start > Str'Last;
                  exit when Str (Start) /= ' ';

                  Start := Start + 1;
               end loop;

               if Str (Start .. Str'Last)'Length > 0 then
                  Put_Line (File, Str (Start .. Str'Last));
               end if;
            end;
      end case;
   end Print;

   -----------
   -- Print --
   -----------

   procedure Print (Filename : in String) is
      File : Ada.Wide_Text_IO.File_Type;

   begin
      Create (File => File,
              Mode => Out_File,
              Name => Filename);
      Print_Xml (File);
      Close (File);
    end Print;

   ---------------
   -- Print_Xml --
   ---------------

   procedure Print_Xml (File : in Ada.Wide_Text_IO.File_Type) is
   begin
      Put (File, "<?xml version = '1.0' encoding = 'UTF8' ?>");

      Indent := 1;

      Print (File, 1);
   end Print_Xml;

end XML_Tools.Printer;
