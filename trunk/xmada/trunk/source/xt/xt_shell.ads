with Xt_Composite;


package Xt_Shell is

   subtype Shell_Widget is Xt_Composite.Composite_Widget;
   subtype Shell_Class is Xt_Composite.Composite_Class;

   Shell_Widget_Class : constant Shell_Class;


private

   pragma Import (C, Shell_Widget_Class, "shellWidgetClass");

end Xt_Shell;
