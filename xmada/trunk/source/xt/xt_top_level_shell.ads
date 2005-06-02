with Xt_Vendor_Shell;


package Xt_Top_Level_Shell is

   subtype Top_Level_Shell_Widget is Xt_Vendor_Shell.Vendor_Shell_Widget;
   subtype Top_Level_Shell_Class is Xt_Vendor_Shell.Vendor_Shell_Class;

   Top_Level_Shell_Widget_Class : constant Top_Level_Shell_Class;


private

   pragma Import (C, Top_Level_Shell_Widget_Class, "topLevelShellWidgetClass");

end Xt_Top_Level_Shell;
