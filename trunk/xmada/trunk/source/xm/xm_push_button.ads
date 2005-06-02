with Xt;
with Xt.Ancillary_Types;

with Xm_Label;


package Xm_Push_Button is

   subtype Xm_Push_Button_Widget is Xm_Label.Xm_Label_Widget;
   subtype Xm_Push_Button_Class is Xm_Label.Xm_Label_Class;

   Xm_Push_Button_Widget_Class : constant Xm_Push_Button_Class;

   --

   function Xm_Create_Push_Button
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Push_Button_Widget;


   function Xm_Create_Managed_Push_Button
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Push_Button_Widget;


private

   pragma Import (C, Xm_Push_Button_Widget_Class, "xmPushButtonWidgetClass");

end Xm_Push_Button;
