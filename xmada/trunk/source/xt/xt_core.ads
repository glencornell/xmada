with Xt;


package Xt_Core is

   subtype Core_Widget is Xt.Widget;
   subtype Core_Class is Xt.Widget_Class;

   Core_Widget_Class : constant Core_Class;

private

   pragma Import (C, Core_Widget_Class, "coreWidgetClass");

end Xt_Core;
