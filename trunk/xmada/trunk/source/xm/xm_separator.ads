with Xt;
with Xt.Ancillary_Types;

with Xm_Primitive;


package Xm_Separator is

   subtype Xm_Separator_Widget is Xm_Primitive.Xm_Primitive_Widget;
   subtype Xm_Separator_Class is Xm_Primitive.Xm_Primitive_Class;

   Xm_Separator_Widget_Class : constant Xm_Separator_Class;

   --

   function Xm_Create_Separator
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Separator_Widget;


   function Xm_Create_Managed_Separator
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Separator_Widget;


private

   pragma Import (C, Xm_Separator_Widget_Class, "xmSeparatorWidgetClass");

end Xm_Separator;
