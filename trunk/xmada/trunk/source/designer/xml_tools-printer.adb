
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
