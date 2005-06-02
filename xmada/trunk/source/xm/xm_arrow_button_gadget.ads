with Xt;
with Xt.Ancillary_Types;

with Xm_Gadget;


package Xm_Arrow_Button_Gadget is

   subtype Xm_Arrow_Button_Gadget is Xm_Gadget.Xm_Gadget;
   subtype Xm_Arrow_Button_Gadget_Object_Class is
     Xm_Gadget.Xm_Gadget_Object_Class;

   Xm_Arrow_Button_Gadget_Class : constant Xm_Arrow_Button_Gadget_Object_Class;

   --

   function Xm_Create_Arrow_Button_Gadget
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Arrow_Button_Gadget;


   function Xm_Create_Managed_Arrow_Button_Gadget
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Arrow_Button_Gadget;


private

   pragma Import (C, Xm_Arrow_Button_Gadget_Class, "xmArrowButtonGadgetClass");

end Xm_Arrow_Button_Gadget;
