------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

with GNAT.Table;

with XML_Tools.Allocation;

package body XML_Tools.Strings is

   type String_Record is record
      First : Positive;
      Last  : Natural;
   end record;

   package Strings is
     new GNAT.Table (Table_Component_Type => String_Record,
                     Table_Index_Type     => String_Id,
                     Table_Low_Bound      => String_Id'First + 1,
                     Table_Initial        => Allocation.Strings_Initial,
                     Table_Increment      => Allocation.Strings_Increment);

   package String_Characters is
     new GNAT.Table
          (Table_Component_Type => Wide_Character,
           Table_Index_Type     => Natural,
           Table_Low_Bound      => Natural'First + 1,
           Table_Initial        => Allocation.String_Characters_Initial,
           Table_Increment      => Allocation.String_Characters_Increment);

   -----------
   -- Image --
   -----------

   function Image (Item : in String_Id) return Wide_String is
   begin
      pragma Assert (Item in Strings.First .. Strings.Last);

      return
        Wide_String
         (String_Characters.Table
           (Strings.Table (Item).First .. Strings.Table (Item).Last));
   end Image;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      Strings.Init;
      String_Characters.Init;
   end Initialize;

   -----------
   -- Store --
   -----------

   function Store (Item : in Wide_String) return String_Id is
   begin
      for J in Strings.First .. Strings.Last loop
         declare
            N : String_Record renames Strings.Table (J);

         begin
            if Wide_String (String_Characters.Table (N.First .. N.Last))
                 = Item
            then
               return J;
            end if;
         end;
      end loop;

      declare
         First : constant Positive := String_Characters.Last + 1;

      begin
         String_Characters.Set_Last (First + Item'Length - 1);
         String_Characters.Table (First .. String_Characters.Last) :=
           String_Characters.Table_Type (Item);

         Strings.Append ((First, String_Characters.Last));

         return Strings.Last;
      end;
   end Store;

end XML_Tools.Strings;
