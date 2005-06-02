with Interfaces.C;       use Interfaces.C;

with Xt;                 use Xt;
with Xt.Ancillary_Types; use Xt.Ancillary_Types;

with Xm.Implementation;  use Xm.Implementation;


package body Xm.Input_Management is


   procedure Xm_Im_Close_XIM (The_Widget : in Widget) is
      procedure XmImCloseXIM (The_Widget : in Widget);
      pragma Import (C, XmImCloseXIM, "XmImCloseXIM");
   begin
      Check (The_Widget);

      XmImCloseXIM (The_Widget);
   end Xm_Im_Close_XIM;


   procedure Xm_Im_Register (The_Widget : in Widget) is
      procedure XmImRegister (The_Widget : in Widget;
                              Reserved   : in int);
      pragma Import (C, XmImRegister, "XmImRegister");
   begin
      Check (The_Widget);

      --  XmImRegister(3) recommend always use value 0 for argument Reserved.
      XmImRegister (The_Widget, 0);
   end Xm_Im_Register;


   procedure Xm_Im_Set_Focus_Values
    (The_Widget : in Widget;
     Arg_List   : in Xt_Arg_List := Null_Xt_Arg_List)
   is
      procedure XmImSetFocusValues (The_Widget : in Widget;
                                    Arg_List   : in Xt_Arg_List;
                                    Arg_Count  : in Cardinal);
      pragma Import (C, XmImSetFocusValues, "XmImSetFocusValues");
   begin
      Check (The_Widget);

      XmImSetFocusValues (The_Widget, Arg_List, Arg_List'Length);
   end Xm_Im_Set_Focus_Values;


   procedure Xm_Im_Set_Values
    (The_Widget : in Widget;
     Arg_List   : in Xt_Arg_List := Null_Xt_Arg_List)
   is
      procedure XmImSetValues (The_Widget : in Widget;
                               Arg_List   : in Xt_Arg_List;
                               Arg_Count  : in Cardinal);
      pragma Import (C, XmImSetValues, "XmImSetValues");
   begin
      Check (The_Widget);

      XmImSetValues (The_Widget, Arg_List, Arg_List'Length);
   end Xm_Im_Set_Values;


   procedure Xm_Im_Unregister (The_Widget : in Widget) is
      procedure XmImUnregister (The_Widget : in Widget);
      pragma Import (C, XmImUnregister, "XmImUnregister");
   begin
      Check (The_Widget);

      XmImUnregister (The_Widget);
   end Xm_Im_Unregister;


   procedure Xm_Im_Unset_Focus (The_Widget : in Widget) is
      procedure XmImUnsetFocus (The_Widget : in Widget);
      pragma Import (C, XmImUnsetFocus, "XmImUnsetFocus");
   begin
      Check (The_Widget);

      XmImUnsetFocus (The_Widget);
   end Xm_Im_Unset_Focus;


end Xm.Input_Management;
