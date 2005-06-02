with Xt_Constraint;


package Xm_Manager is

   subtype Xm_Manager_Widget is Xt_Constraint.Constraint_Widget;
   subtype Xm_Manager_Class is Xt_Constraint.Constraint_Class;

   Xm_Manager_Widget_Class : constant Xm_Manager_Class;


private

   pragma Import (C, Xm_Manager_Widget_Class, "xmManagerWidgetClass");

end Xm_Manager;
