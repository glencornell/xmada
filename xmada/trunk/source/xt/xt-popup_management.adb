with Interfaces.C;       use Interfaces.C;

with Xt.Ancillary_Types; use Xt.Ancillary_Types;
with Xt.Implementation;  use Xt.Implementation;


package body Xt.Popup_Management is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Create_Popup_Shell
   --!    <ImplementationNotes> Параметры Parent и The_Widget_Class
   --! проверяются внутри Xt.
   ---------------------------------------------------------------------------
   function Xt_Create_Popup_Shell
    (Name             : in String;
     The_Widget_Class : in Widget_Class;
     Parent           : in Widget;
     Args             : in Xt_Arg_List := Null_Xt_Arg_List)
       return Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XtCreatePopupShell (Name             : in char_array;
                                   The_Widget_Class : in Widget_Class;
                                   Parent           : in Widget;
                                   Args             : in Xt_Arg_List;
                                   Num_Args         : in Cardinal)
        return Widget;
     pragma Import (C, XtCreatePopupShell, "XtCreatePopupShell");
   begin
      return XtCreatePopupShell (C_Name,
                                 The_Widget_Class,
                                 Parent,
                                 Args,
                                 Args'Length);
   end Xt_Create_Popup_Shell;


   procedure Xt_Popdown (Popup_Shell : in Widget) is
      procedure XtPopdown (Popup_Shell : in Widget);
      pragma Import (C, XtPopdown, "XtPopdown");
   begin
      Check (Popup_Shell);
      XtPopdown (Popup_Shell);
   end Xt_Popdown;


   procedure Xt_Popup (Popup_Shell : in Widget;
                       Grab_Kind   : in Xt_Grab_Kind)
   is
      procedure XtPopup (Popup_Shell : in Widget;
                         Grab_Kind   : in Xt_Grab_Kind);
      pragma Import (C, XtPopup, "XtPopup");
   begin
      Check (Popup_Shell);
      XtPopup (Popup_Shell, Grab_Kind);
   end Xt_Popup;


end Xt.Popup_Management;
