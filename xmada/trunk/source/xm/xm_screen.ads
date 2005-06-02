with Xt_Core;


package Xm_Screen is

   subtype Xm_Screen_Widget is Xt_Core.Core_Widget;
   subtype Xm_Screen_Object_Class is Xt_Core.Core_Class;

   Xm_Screen_Class : constant Xm_Screen_Object_Class;


private

   pragma Import (C, Xm_Screen_Class, "xmScreenClass");

end Xm_Screen;
