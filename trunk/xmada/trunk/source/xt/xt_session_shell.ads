with Xt_Application_Shell;


package Xt_Session_Shell is

   subtype Session_Shell_Widget
     is Xt_Application_Shell.Application_Shell_Widget;
   subtype Session_Shell_Class is Xt_Application_Shell.Application_Shell_Class;

   Session_Shell_Widget_Class : constant Session_Shell_Class;


private

   pragma Import (C, Session_Shell_Widget_Class, "sessionShellWidgetClass");

end Xt_Session_Shell;
