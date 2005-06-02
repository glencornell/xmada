with Xt;
with Xt.Ancillary_Types;

with Xm_Manager;


package Xm_Drawn_Button is

   subtype Xm_Drawn_Button_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Drawn_Button_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Drawn_Button_Widget_Class : constant Xm_Drawn_Button_Class;

   --

   function Xm_Create_Drawn_Button
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Drawn_Button_Widget;


   function Xm_Create_Managed_Drawn_Button
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Drawn_Button_Widget;


private

   pragma Import (C, Xm_Drawn_Button_Widget_Class, "xmDrawnButtonWidgetClass");

end Xm_Drawn_Button;
