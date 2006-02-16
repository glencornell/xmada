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
--! <Unit> Model.Names
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package body Model.Names is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Enter
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Enter (Name : in Wide_String) return Name_Id is
      Aux   : constant Name_Id := Find (Name);
      First : Positive;

   begin
      if Aux /= Null_Name then
         return Aux;
      end if;

      First := Name_Character_Table.Last + 1;

      for J in Name'Range loop
         Name_Character_Table.Append (Name (J));
      end loop;

      Name_Table.Append ((First => First,
                          Last  => Name_Character_Table.Last));

      return Name_Table.Last;
   end Enter;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Find
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Find (Name : in Wide_String) return Name_Id is
   begin
      for J in Name_Table.First .. Name_Table.Last loop
         if Wide_String
             (Name_Character_Table.Table
               (Name_Table.Table (J).First .. Name_Table.Table (J).Last))
              = Name
         then
            return J;
         end if;
      end loop;

      return Null_Name;
   end Find;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Image
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Image (Name : in Name_Id) return Wide_String is
   begin
      pragma Assert (Name in Name_Table.First .. Name_Table.Last);

      return
        Wide_String
         (Name_Character_Table.Table
           (Name_Table.Table (Name).First .. Name_Table.Table (Name).Last));
   end Image;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize is
   begin
      Name_Character_Table.Init;
      Name_Table.Init;
   end Initialize;

end Model.Names;
