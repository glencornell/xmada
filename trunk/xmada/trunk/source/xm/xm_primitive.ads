with Xt_Core;


package Xm_Primitive is

   subtype Xm_Primitive_Widget is Xt_Core.Core_Widget;
   subtype Xm_Primitive_Class is Xt_Core.Core_Class;

   Xm_Primitive_Widget_Class : constant Xm_Primitive_Class;


private

   pragma Import (C, Xm_Primitive_Widget_Class, "xmPrimitiveWidgetClass");

end Xm_Primitive;
