with Xt_Composite;


package Xt_Constraint is

   subtype Constraint_Widget is Xt_Composite.Composite_Widget;
   subtype Constraint_Class is Xt_Composite.Composite_Class;

   Constraint_Widget_Class : constant Constraint_Class;

private

   pragma Import (C, Constraint_Widget_Class, "constraintWidgetClass");

end Xt_Constraint;
