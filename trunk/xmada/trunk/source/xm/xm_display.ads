with Xt_Application_Shell;


package Xm_Display is

   subtype Xm_Display_Widget is Xt_Application_Shell.Application_Shell_Widget;
   subtype Xm_Display_Object_Class is
     Xt_Application_Shell.Application_Shell_Class;

   Xm_Display_Class : constant Xm_Display_Object_Class;


private

   pragma Import (C, Xm_Display_Class, "xmDisplayClass");

end Xm_Display;
