with Xt;


package Xm.Input_Management is


   procedure Xm_Im_Close_XIM (The_Widget : in Xt.Widget);


   procedure Xm_Im_Register (The_Widget : in Xt.Widget);


   procedure Xm_Im_Set_Focus_Values
    (The_Widget : in Xt.Widget;
     Arg_List   : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List);


   procedure Xm_Im_Set_Values
    (The_Widget : in Xt.Widget;
     Arg_List   : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List);


   procedure Xm_Im_Unregister (The_Widget : in Xt.Widget);


   procedure Xm_Im_Unset_Focus (The_Widget : in Xt.Widget);


end Xm.Input_Management;
