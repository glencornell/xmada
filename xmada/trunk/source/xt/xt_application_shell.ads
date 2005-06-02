with Xt_Top_Level_Shell;


package Xt_Application_Shell is

   subtype Application_Shell_Widget
     is Xt_Top_Level_Shell.Top_Level_Shell_Widget;
   subtype Application_Shell_Class is Xt_Top_Level_Shell.Top_Level_Shell_Class;

   Application_Shell_Widget_Class : constant Application_Shell_Class;


private

   pragma Import (C, Application_Shell_Widget_Class,
                  "applicationShellWidgetClass");

end Xt_Application_Shell;
