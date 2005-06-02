with Xt;
with Xt.Ancillary_Types;
with Xt_Vendor_Shell;


package Xm_Dialog_Shell is

   subtype Xm_Dialog_Shell_Widget is Xt_Vendor_Shell.Vendor_Shell_Widget;
   subtype Xm_Dialog_Shell_Class is Xt_Vendor_Shell.Vendor_Shell_Class;

   Xm_Dialog_Shell_Widget_Class : constant Xm_Dialog_Shell_Class;

   --

   function Xm_Create_Dialog_Shell
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Dialog_Shell_Widget;


private

   pragma Import (C, Xm_Dialog_Shell_Widget_Class, "xmDialogShellWidgetClass");

end Xm_Dialog_Shell;
