with Xt;
with Xt.Ancillary_Types;

with Xm_Gadget;


package Xm_Separator_Gadget is

   subtype Xm_Separator_Gadget is Xm_Gadget.Xm_Gadget;
   subtype Xm_Separator_Object_Class is Xm_Gadget.Xm_Gadget_Object_Class;

   Xm_Separator_Gadget_Class : constant Xm_Separator_Object_Class;

   function Xm_Create_Separator_Gadget
    (Parent : in Xt.Widget;
     Name   : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Separator_Gadget;

   function Xm_Create_Managed_Separator_Gadget
    (Parent : in Xt.Widget;
     Name   : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Separator_Gadget;


private

   pragma Import (C, Xm_Separator_Gadget_Class, "xmSeparatorGadgetClass");

end Xm_Separator_Gadget;
