with Xt;
with Xt.Ancillary_Types;

with Xm_Manager;


package Xm_Scrolled_Window is

   subtype Xm_Scrolled_Window_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Scrolled_Window_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Scrolled_Window_Widget_Class : constant Xm_Scrolled_Window_Class;

   --

   function Xm_Create_Scrolled_Window
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Scrolled_Window_Widget;


   function Xm_Create_Managed_Scrolled_Window
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Scrolled_Window_Widget;


private

   pragma Import (C, Xm_Scrolled_Window_Widget_Class,
                  "xmScrolledWindowWidgetClass");

end Xm_Scrolled_Window;
