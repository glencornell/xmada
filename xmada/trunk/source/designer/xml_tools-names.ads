------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package XML_Tools.Names is

   function Store (Item : in Wide_String) return Name_Id;

   function Image (Name : in Name_Id) return Wide_String;

   procedure Initialize;

end XML_Tools.Names;
