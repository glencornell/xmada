with Xt;
with Xt.Ancillary_Types;

with Xm_Spin_Box;


package Xm_Simple_Spin_Box is

   subtype Xm_Simple_Spin_Box_Widget is Xm_Spin_Box.Xm_Spin_Box_Widget;
   subtype Xm_Simple_Spin_Box_Class is Xm_Spin_Box.Xm_Spin_Box_Class;

   Xm_Simple_Spin_Box_Widget_Class : constant Xm_Simple_Spin_Box_Class;

   --

   function Xm_Create_Simple_Spin_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Simple_Spin_Box_Widget;


   function Xm_Create_Managed_Simple_Spin_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Simple_Spin_Box_Widget;


private

   pragma Import (C, Xm_Simple_Spin_Box_Widget_Class,
                  "xmSimpleSpinBoxWidgetClass");

end Xm_Simple_Spin_Box;
