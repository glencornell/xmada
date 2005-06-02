with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

with Xlib.Implementation;  use Xlib.Implementation;


package body Xlib.Atoms is


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
