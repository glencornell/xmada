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
--! <Unit> Model.Strings
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package body Model.Strings is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Image
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Image (Item : in String_Id) return Wide_String is
   begin
      pragma Assert (Item in String_Table.First .. String_Table.Last);

      return
        Wide_String
         (String_Character_Table.Table
           (String_Table.Table (Item).First
              .. String_Table.Table (Item).Last));
   end Image;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize is
   begin
      String_Table.Init;
      String_Character_Table.Init;
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Store
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Store (Item : in Wide_String) return String_Id is
   begin
      for J in String_Table.First .. String_Table.Last loop
         declare
            N : String_Record renames String_Table.Table (J);

         begin
            if Wide_String (String_Character_Table.Table (N.First .. N.Last))
                 = Item
            then
               return J;
            end if;
         end;
      end loop;

      declare
         First : constant Positive := String_Character_Table.Last + 1;

      begin
         String_Character_Table.Set_Last (First + Item'Length - 1);
         String_Character_Table.Table (First .. String_Character_Table.Last) :=
           String_Character_Table.Table_Type (Item);

         String_Table.Append ((First, String_Character_Table.Last));

         return String_Table.Last;
      end;
   end Store;

end Model.Strings;
