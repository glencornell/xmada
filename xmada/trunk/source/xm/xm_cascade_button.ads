with Xt;
with Xt.Ancillary_Types;

with Xm_Label;


package Xm_Cascade_Button is

   subtype Xm_Cascade_Button_Widget is Xm_Label.Xm_Label_Widget;
   subtype Xm_Cascade_Button_Class is Xm_Label.Xm_Label_Class;

   Xm_Cascade_Button_Widget_Class : constant Xm_Cascade_Button_Class;

   --

   function Xm_Create_Cascade_Button
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Cascade_Button_Widget;


   function Xm_Create_Managed_Cascade_Button
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Cascade_Button_Widget;

   --

   procedure Xm_Cascade_Button_Highlight (The_Widget : in Xt.Widget;
                                          Highlight  : in Boolean);


private

   pragma Import (C, Xm_Cascade_Button_Widget_Class,
                  "xmCascadeButtonWidgetClass");

end Xm_Cascade_Button;
