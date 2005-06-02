with Xt;
with Xt.Ancillary_Types;

with Xm_Gadget;


package Xm_Label_Gadget is

   subtype Xm_Label_Gadget is Xm_Gadget.Xm_Gadget;
   subtype Xm_Label_Gadget_Object_Class is Xm_Gadget.Xm_Gadget_Object_Class;

   Xm_Label_Gadget_Class : constant Xm_Label_Gadget_Object_Class;

   function Xm_Create_Label_Gadget
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Label_Gadget;

   function Xm_Create_Managed_Label_Gadget
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Label_Gadget;


private

   pragma Import (C, Xm_Label_Gadget_Class, "xmLabelGadgetClass");

end Xm_Label_Gadget;
