with Xt_Application_Shell;


package Xm_Print_Shell is

   subtype Xm_Print_Shell_Widget is
     Xt_Application_Shell.Application_Shell_Widget;
   subtype Xm_Print_Shell_Class is
     Xt_Application_Shell.Application_Shell_Class;

   Xm_Print_Shell_Widget_Class : constant Xm_Print_Shell_Class;


private

   pragma Import (C, Xm_Print_Shell_Widget_Class, "xmPrintShellWidgetClass");

end Xm_Print_Shell;
