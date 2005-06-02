with Xt;
with Xt.Ancillary_Types;

with Xm_Manager;


package Xm_Spin_Box is

   subtype Xm_Spin_Box_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Spin_Box_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Spin_Box_Widget_Class : constant Xm_Spin_Box_Class;

   --

   function Xm_Create_Spin_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Spin_Box_Widget;


   function Xm_Create_Managed_Spin_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Spin_Box_Widget;


private

   pragma Import (C, Xm_Spin_Box_Widget_Class, "xmSpinBoxWidgetClass");

end Xm_Spin_Box;
