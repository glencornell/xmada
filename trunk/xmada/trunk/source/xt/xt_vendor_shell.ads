with Xt_Wm_Shell;


package Xt_Vendor_Shell is

   subtype Vendor_Shell_Widget is Xt_Wm_Shell.Wm_Shell_Widget;
   subtype Vendor_Shell_Class is Xt_Wm_Shell.Wm_Shell_Class;

   Vendor_Shell_Widget_Class : constant Vendor_Shell_Class;


private

   pragma Import (C, Vendor_Shell_Widget_Class, "vendorShellWidgetClass");

end Xt_Vendor_Shell;
