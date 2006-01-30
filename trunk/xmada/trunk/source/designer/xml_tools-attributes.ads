------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package XML_Tools.Attributes is

   function Name (Attribute : in Attribute_Id) return Name_Id;

   function Value (Attribute : in Attribute_Id) return String_Id;

   function Next (Attribute : in Attribute_Id) return Attribute_Id;

   procedure Create_Attribute (Tag   : in Element_Id;
                               Name  : in Name_Id;
                               Value : in String_Id);

   procedure Initialize;

end XML_Tools.Attributes;
