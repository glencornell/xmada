with Xt;
with Xt.Ancillary_Types;

with Xm_Label_Gadget;


package Xm_Push_Button_Gadget is

   subtype Xm_Push_Button_Gadget is Xm_Label_Gadget.Xm_Label_Gadget;
   subtype Xm_Push_Button_Gadget_Object_Class
     is Xm_Label_Gadget.Xm_Label_Gadget_Object_Class;

   Xm_Push_Button_Gadget_Class : constant Xm_Push_Button_Gadget_Object_Class;


   function Xm_Create_Push_Button_Gadget
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Push_Button_Gadget;


   function Xm_Create_Managed_Push_Button_Gadget
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Push_Button_Gadget;


private

   pragma Import (C, Xm_Push_Button_Gadget_Class, "xmPushButtonGadgetClass");

end Xm_Push_Button_Gadget;
