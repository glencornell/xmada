with Xt;
with Xt.Ancillary_Types;

with Xm_Label_Gadget;


package Xm_Cascade_Button_Gadget is

   subtype Xm_Cascade_Button_Gadget is Xm_Label_Gadget.Xm_Label_Gadget;
   subtype Xm_Cascade_Button_Gadget_Object_Class
     is Xm_Label_Gadget.Xm_Label_Gadget_Object_Class;

   Xm_Cascade_Button_Gadget_Class : constant
     Xm_Cascade_Button_Gadget_Object_Class;


   function Xm_Create_Cascade_Button_Gadget
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Cascade_Button_Gadget;


   function Xm_Create_Managed_Cascade_Button_Gadget
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Cascade_Button_Gadget;

   --

   procedure Xm_Cascade_Button_Gadget_Highlight (The_Widget : in Xt.Widget;
                                                 Highlight  : in Boolean);


private

   pragma Import (C, Xm_Cascade_Button_Gadget_Class,
                  "xmCascadeButtonGadgetClass");

end Xm_Cascade_Button_Gadget;
