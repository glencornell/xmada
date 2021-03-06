------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006  TechnoServ A/S
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
--! XmAda maintained by TechnoServ A/S (email: vgodunko@rostel.ru)
--!
--! <Unit> XML_Tools.Strings
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
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
          (Table_Component_Type => Character,
           Table_Index_Type     => Natural,
           Table_Low_Bound      => Natural'First + 1,
           Table_Initial        => Allocation.String_Characters_Initial,
           Table_Increment      => Allocation.String_Characters_Increment);

   -----------
   -- Image --
   -----------

   function Image (Item : in String_Id) return String is
   begin
      pragma Assert (Item in Strings.First .. Strings.Last);

      return
        String
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

   function Store (Item : in String) return String_Id is
   begin
      for J in Strings.First .. Strings.Last loop
         declare
            N : String_Record renames Strings.Table (J);

         begin
            if String (String_Characters.Table (N.First .. N.Last))
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
