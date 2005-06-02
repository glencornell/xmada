with Xt;
with Xt.Ancillary_Types;

with Xm_Label_Gadget;


package Xm_Toggle_Button_Gadget is

   subtype Xm_Toggle_Button_Gadget is Xm_Label_Gadget.Xm_Label_Gadget;
   subtype Xm_Toggle_Button_Gadget_Object_Class
     is Xm_Label_Gadget.Xm_Label_Gadget_Object_Class;

   Xm_Toggle_Button_Gadget_Class : constant
     Xm_Toggle_Button_Gadget_Object_Class;


   function Xm_Create_Toggle_Button_Gadget
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Toggle_Button_Gadget;


   function Xm_Create_Managed_Toggle_Button_Gadget
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Toggle_Button_Gadget;


   --

   function Xm_Toggle_Button_Gadget_Get_State
    (The_Widget : in Xm_Toggle_Button_Gadget)
       return Boolean;


   procedure Xm_Toggle_Button_Gadget_Set_State
    (The_Widget : in Xm_Toggle_Button_Gadget;
     State      : in Boolean;
     Notify     : in Boolean);


private

   pragma Import (C, Xm_Toggle_Button_Gadget_Class,
                  "xmToggleButtonGadgetClass");

end Xm_Toggle_Button_Gadget;
