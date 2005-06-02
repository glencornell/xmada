with Xt_Shell;


package Xt_Override_Shell is

   subtype Override_Shell_Widget is Xt_Shell.Shell_Widget;
   subtype Override_Shell_Class is Xt_Shell.Shell_Class;

   Override_Shell_Widget_Class : constant Override_Shell_Class;


private

   pragma Import (C, Override_Shell_Widget_Class, "overrideShellWidgetClass");

end Xt_Override_Shell;
