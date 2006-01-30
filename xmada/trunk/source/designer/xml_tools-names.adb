------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

with GNAT.Table;

with XML_Tools.Allocation;

package body XML_Tools.Names is

   type Name_Record is record
      First : Positive;
      Last  : Natural;
   end record;

   package Names is
     new GNAT.Table (Table_Component_Type => Name_Record,
                     Table_Index_Type     => Name_Id,
                     Table_Low_Bound      => Name_Id'First + 1,
                     Table_Initial        => Allocation.Names_Initial,
                     Table_Increment      => Allocation.Names_Increment);

   package Name_Characters is
     new GNAT.Table
          (Table_Component_Type => Wide_Character,
           Table_Index_Type     => Natural,
           Table_Low_Bound      => Natural'First + 1,
           Table_Initial        => Allocation.Name_Characters_Initial,
           Table_Increment      => Allocation.Name_Characters_Increment);

   -----------
   -- Image --
   -----------

   function Image (Name : in Name_Id) return Wide_String is
   begin
      pragma Assert (Name in Names.First .. Names.Last);

      return
        Wide_String
         (Name_Characters.Table
           (Names.Table (Name).First .. Names.Table (Name).Last));
   end Image;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      Names.Init;
      Name_Characters.Init;
   end Initialize;

   -----------
   -- Store --
   -----------

   function Store (Item : in Wide_String) return Name_Id is
   begin
      for J in Names.First .. Names.Last loop
         declare
            N : Name_Record renames Names.Table (J);

         begin
            if Wide_String (Name_Characters.Table (N.First .. N.Last))
                 = Item
            then
               return J;
            end if;
         end;
      end loop;

      declare
         First : constant Positive := Name_Characters.Last + 1;

      begin
         Name_Characters.Set_Last (First + Item'Length - 1);
         Name_Characters.Table (First .. Name_Characters.Last) :=
           Name_Characters.Table_Type (Item);

         Names.Append ((First, Name_Characters.Last));

         return Names.Last;
      end;
   end Store;

end XML_Tools.Names;
