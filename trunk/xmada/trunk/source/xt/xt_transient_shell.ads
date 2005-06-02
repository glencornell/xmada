with Xt_Vendor_Shell;

package Xt_Transient_Shell is

   subtype Transient_Shell_Widget is Xt_Vendor_Shell.Vendor_Shell_Widget;
   subtype Transient_Shell_Class is Xt_Vendor_Shell.Vendor_Shell_Class;

   Transient_Shell_Widget_Class : constant Transient_Shell_Class;


private

   pragma Import (C, Transient_Shell_Widget_Class,
                  "transientShellWidgetClass");

end Xt_Transient_Shell;
