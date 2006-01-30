------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package XML_Tools.Strings is

   function Store (Item : in Wide_String) return String_Id;

   function Image (Item : in String_Id) return Wide_String;

   procedure Initialize;

end XML_Tools.Strings;
