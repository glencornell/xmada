------------------------------------------------------------------------------
--
--  X Library Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rost.ru)
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
--! along with GCC; see the file COPYING. If not, write to the Free
--! Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
--! 02110-1301, USA.
--!
--! As a special exception, if other files instantiate generics from this
--! unit, or you link this unit with other files to produce an executable,
--! this unit does not by itself cause the resulting executable to be
--! covered by the GNU General Public License. This exception does not
--! however invalidate any other reasons why the executable file might be
--! covered by the GNU Public License.
--!
--! <Unit> Xlib.Atoms
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xlib.Implementation;  use Xlib.Implementation;

package body Xlib.Atoms is

   use Interfaces.C;
   use Interfaces.C.Strings;
   use Xlib.Implementation;

   function X_Get_Atom_Name (The_Display : in Display;
                             The_Atom    : in Atom)
     return String
   is
      C_Return : chars_ptr;

      function XGetAtomName (The_Display : in Display;
                             The_Atom    : in Atom)
        return chars_ptr;
      pragma Import (C, XGetAtomName, "XGetAtomName");

      procedure XFree (Item : in chars_ptr);
      pragma Import (C, XFree, "XFree");
   begin
      Check (The_Display);
      C_Return := XGetAtomName (The_Display, The_Atom);

      if C_Return = Null_Ptr then
         return "";
      end if;

      declare
         Return_String : constant String := Value (C_Return);
      begin
         XFree (C_Return);
         return Return_String;
      end;
   end X_Get_Atom_Name;


   function X_Intern_Atom (The_Display    : in Display;
                           Atom_Name      : in String;
                           Only_If_Exists : in Boolean := True)
     return Atom
   is
      C_Atom_Name : constant char_array := To_C (Atom_Name);

      function XInternAtom (The_Display    : in Display;
                            Atom_Name      : in char_array;
                            Only_If_Exists : in Bool)
        return Atom;
      pragma Import (C, XInternAtom, "XInternAtom");
   begin
      Check (The_Display);
      return
        XInternAtom
         (The_Display, C_Atom_Name, Bool (To_X_Boolean (Only_If_Exists)));
   end X_Intern_Atom;


end Xlib.Atoms;
