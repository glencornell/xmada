with Xt;
with Xt.Ancillary_Types;
with Xt_Override_Shell;


package Xm_Menu_Shell is

   subtype Xm_Menu_Shell_Widget is Xt_Override_Shell.Override_Shell_Widget;
   subtype Xm_Menu_Shell_Class is Xt_Override_Shell.Override_Shell_Class;

   Xm_Menu_Shell_Widget_Class : constant Xm_Menu_Shell_Class;

   --

   function Xm_Create_Menu_Shell
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Menu_Shell_Widget;


private

   pragma Import (C, Xm_Menu_Shell_Widget_Class, "xmMenuShellWidgetClass");

end Xm_Menu_Shell;
