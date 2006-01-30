------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package XML_Tools is

   type Element_Id is new Natural;
   Null_Element_Id : constant Element_Id := 0;

   type Element_Kinds is (A_Tag, A_String);

   type Attribute_Id is new Natural;
   Null_Attribute_Id : constant Attribute_Id := Attribute_Id'First;

   type String_Id is new Natural;

   type Name_Id is new Natural;

end XML_Tools;
