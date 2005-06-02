with Interfaces.C;       use Interfaces.C;

with Xt;                 use Xt;
with Xt.Ancillary_Types; use Xt.Ancillary_Types;


package body Xm_Menu_Shell is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Menu_Shell
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Menu_Shell
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Menu_Shell_Widget
   is
      function XmCreateMenuShell (Parent    : in Widget;
                                  Name      : in char_array;
                                  Arg_List  : in Xt_Arg_List;
                                  Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateMenuShell, "XmCreateMenuShell");
   begin
      return
        XmCreateMenuShell (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Menu_Shell;


end Xm_Menu_Shell;
