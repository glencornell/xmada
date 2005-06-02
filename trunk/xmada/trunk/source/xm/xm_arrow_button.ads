with Xt;
with Xt.Ancillary_Types;

with Xm_Primitive;


package Xm_Arrow_Button is

   subtype Xm_Arrow_Button_Widget is Xm_Primitive.Xm_Primitive_Widget;
   subtype Xm_Arrow_Button_Class is Xm_Primitive.Xm_Primitive_Class;

   Xm_Arrow_Button_Widget_Class : constant Xm_Arrow_Button_Class;

   --

   function Xm_Create_Arrow_Button
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Arrow_Button_Widget;


   function Xm_Create_Managed_Arrow_Button
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Arrow_Button_Widget;


private

   pragma Import (C, Xm_Arrow_Button_Widget_Class, "xmArrowButtonWidgetClass");

end Xm_Arrow_Button;
