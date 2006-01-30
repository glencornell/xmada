------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

with GNAT.Table;

with XML_Tools.Allocation;
with XML_Tools.Elements;

package body XML_Tools.Attributes is

   use XML_Tools.Elements;

   type Attribute_Record is record
      Name  : Name_Id;
      Value : String_Id;
      Next  : Attribute_Id;
   end record;

   package Attributes is
     new GNAT.Table (Table_Component_Type => Attribute_Record,
                     Table_Index_Type     => Attribute_Id,
                     Table_Low_Bound      => Attribute_Id'First,
                     Table_Initial        => Allocation.Attributes_Initial,
                     Table_Increment      => Allocation.Attributes_Increment);

   ----------------------
   -- Create_Attribute --
   ----------------------

   procedure Create_Attribute (Tag   : in Element_Id;
                               Name  : in Name_Id;
                               Value : in String_Id)
   is
      Aux : Attribute_Id := Attribute (Tag);

   begin
      Attributes.Append ((Name  => Name,
                          Value => Value,
                          Next  => Null_Attribute_Id));

      if Aux = Null_Attribute_Id then
         Set_Attribute (Tag, Attributes.Last);

      else
         while Attributes.Table (Aux).Next /= Null_Attribute_Id loop
            Aux := Attributes.Table (Aux).Next;
         end loop;

         Attributes.Table (Aux).Next := Attributes.Last;
      end if;
   end Create_Attribute;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      Attributes.Init;
   end Initialize;

   ----------
   -- Name --
   ----------

   function Name (Attribute : in Attribute_Id) return Name_Id is
   begin
      pragma Assert (Attribute in Attributes.First .. Attributes.Last);

      return Attributes.Table (Attribute).Name;
   end Name;

   ----------
   -- Next --
   ----------

   function Next (Attribute : in Attribute_Id) return Attribute_Id is
   begin
      pragma Assert (Attribute in Attributes.First .. Attributes.Last);

      return Attributes.Table (Attribute).Next;
   end Next;

   -----------
   -- Value --
   -----------

   function Value (Attribute : in Attribute_Id) return String_Id is
   begin
      pragma Assert (Attribute in Attributes.First .. Attributes.Last);

      return Attributes.Table (Attribute).Value;
   end Value;

end XML_Tools.Attributes;
