with Xt_Core;


package Xt_Composite is

   subtype Composite_Widget is Xt_Core.Core_Widget;
   subtype Composite_Class is Xt_Core.Core_Class;

   Composite_Widget_Class : constant Composite_Class;

private

   pragma Import (C, Composite_Widget_Class, "compositeWidgetClass");

end Xt_Composite;
