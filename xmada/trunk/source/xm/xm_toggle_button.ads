with Xt;
with Xt.Ancillary_Types;

with Xm;
with Xm_Label;


package Xm_Toggle_Button is

   subtype Xm_Toggle_Button_Widget is Xm_Label.Xm_Label_Widget;
   subtype Xm_Toggle_Button_Class is Xm_Label.Xm_Label_Class;

   Xm_Toggle_Button_Widget_Class : constant Xm_Toggle_Button_Class;

   --

   function Xm_Create_Toggle_Button
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Toggle_Button_Widget;


   function Xm_Create_Managed_Toggle_Button
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Toggle_Button_Widget;


   --

   function Xm_Toggle_Button_Get_State
    (The_Widget : in Xm_Toggle_Button_Widget)
       return Boolean;


   procedure Xm_Toggle_Button_Set_State
    (The_Widget : in Xm_Toggle_Button_Widget;
     State      : in Boolean;
     Notify     : in Boolean);


   procedure Xm_Toggle_Button_Set_Value
    (The_Widget : in Xm_Toggle_Button_Widget;
     Value      : in Xm.Xm_Toggle_Button_State;
     Notify     : in Boolean);


private

   pragma Import (C, Xm_Toggle_Button_Widget_Class,
                  "xmToggleButtonWidgetClass");

end Xm_Toggle_Button;
