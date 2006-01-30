------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

with XML_Tools.Attributes;
with XML_Tools.Elements;
with XML_Tools.Names;
with XML_Tools.Strings;

package body XML_Tools.Implementation is

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      XML_Tools.Attributes.Initialize;
      XML_Tools.Elements.Initialize;
      XML_Tools.Names.Initialize;
      XML_Tools.Strings.Initialize;
   end Initialize;

end XML_Tools.Implementation;
