with Xt_Shell;


package Xt_Wm_Shell is

   subtype Wm_Shell_Widget is Xt_Shell.Shell_Widget;
   subtype Wm_Shell_Class is Xt_Shell.Shell_Class;

   Wm_Shell_Widget_Class : constant Wm_Shell_Class;


private

   pragma Import (C, Wm_Shell_Widget_Class, "wmShellWidgetClass");

end Xt_Wm_Shell;
