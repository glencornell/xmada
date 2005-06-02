with Xt;
with Xt.Ancillary_Types;

with Xm_Primitive;


package Xm_Label is

   subtype Xm_Label_Widget is Xm_Primitive.Xm_Primitive_Widget;
   subtype Xm_Label_Class is Xm_Primitive.Xm_Primitive_Class;

   Xm_Label_Widget_Class : constant Xm_Label_Class;

   --

   function Xm_Create_Label
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Label_Widget;


   function Xm_Create_Managed_Label
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Label_Widget;


private

   pragma Import (C, Xm_Label_Widget_Class, "xmLabelWidgetClass");

end Xm_Label;
