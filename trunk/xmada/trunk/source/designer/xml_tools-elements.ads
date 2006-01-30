------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package XML_Tools.Elements is

   function Kind (Element : in Element_Id) return Element_Kinds;

   function Name (Element : in Element_Id) return Name_Id;

   function Attribute (Element : in Element_Id) return Attribute_Id;

   function Child (Element : in Element_Id) return Element_Id;

   function Next (Element : in Element_Id) return Element_Id;

   function Value (Element : in Element_Id) return String_Id;

   procedure Set_Attribute (Element : in Element_Id;
                            Value   : in Attribute_Id);

   function Create_Tag (Parent : in Element_Id;
                        Name   : in Name_Id)
     return Element_Id;

   procedure Create_String (Parent : in Element_Id;
                            Value  : in String_Id);

   procedure Initialize;

end XML_Tools.Elements;
