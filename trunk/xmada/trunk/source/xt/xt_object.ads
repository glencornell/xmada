with Xt;


package Xt_Object is

   subtype Object_Widget is Xt.Widget;
   subtype Object_Class is Xt.Widget_Class;

   Object_Widget_Class : constant Object_Class;


private

   pragma Import (C, Object_Widget_Class, "objectClass");

end Xt_Object;
