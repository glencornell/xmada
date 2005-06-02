
package Xlib.Atoms is

   type Atom is new Interfaces.C.unsigned_long;
   type Atom_List is array (Natural range <>) of Atom;


   function X_Intern_Atom (The_Display    : in Display;
                           Atom_Name      : in String;
                           Only_If_Exists : in Boolean := True)
     return Atom;


   function X_Get_Atom_Name (The_Display : in Display;
                             The_Atom    : in Atom)
     return String;


end Xlib.Atoms;
