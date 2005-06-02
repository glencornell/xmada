with Xt;
with Xt.Ancillary_Types;

with Xm_Primitive;


package Xm_Scroll_Bar is

   subtype Xm_Scroll_Bar_Widget is Xm_Primitive.Xm_Primitive_Widget;
   subtype Xm_Scroll_Bar_Class is Xm_Primitive.Xm_Primitive_Class;

   Xm_Scroll_Bar_Widget_Class : constant Xm_Scroll_Bar_Class;

   --

   function Xm_Create_Scroll_Bar
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Scroll_Bar_Widget;


   function Xm_Create_Managed_Scroll_Bar
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Scroll_Bar_Widget;


private

   pragma Import (C, Xm_Scroll_Bar_Widget_Class, "xmScrollBarWidgetClass");

end Xm_Scroll_Bar;
