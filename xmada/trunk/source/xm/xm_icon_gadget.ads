with Xt;
with Xt.Ancillary_Types;

with Xm_Gadget;


package Xm_Icon_Gadget is

   subtype Xm_Icon_Gadget is Xm_Gadget.Xm_Gadget;
   subtype Xm_Icon_Gadget_Object_Class is Xm_Gadget.Xm_Gadget_Object_Class;

   Xm_Icon_Gadget_Class : constant Xm_Icon_Gadget_Object_Class;


   function Xm_Create_Icon_Gadget (Parent   : in Xt.Widget;
                                   Name     : in String;
                                   Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
                                     := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Icon_Gadget;


   function Xm_Create_Managed_Icon_Gadget
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Icon_Gadget;


private

   pragma Import (C, Xm_Icon_Gadget_Class, "xmIconGadgetClass");

end Xm_Icon_Gadget;
