------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006
--!
--! XmAda is free software; you can redistribute it and/or modify it under
--! the terms of the GNU General Public License as published by the Free
--! Software Foundation; either version 2, or (at your option) any later
--! version.
--!
--! XmAda is distributed in the hope that it will be useful, but WITHOUT ANY
--! WARRANTY; without even the implied warranty of MERCHANTABILITY or
--! FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
--! for more details.
--!
--! You should have received a copy of the GNU General Public License
--! along with XmAda; see the file COPYING. If not, write to the Free
--! Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
--! USA.
--!
--! As a special exception, if other files instantiate generics from this
--! unit, or you link this unit with other files to produce an executable,
--! this unit does not by itself cause the resulting executable to be
--! covered by the GNU General Public License. This exception does not
--! however invalidate any other reasons why the executable file might be
--! covered by the GNU Public License.
--!
--! <Unit> XML_Tools.Names
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
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
