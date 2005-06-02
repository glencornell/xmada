with Xt;
with Xt.Ancillary_Types;

with Xm_Manager;


package Xm_Paned_Window is

   subtype Xm_Paned_Window_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Paned_Window_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Paned_Window_Widget_Class : constant Xm_Paned_Window_Class;

   --

   function Xm_Create_Paned_Window
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Paned_Window_Widget;


   function Xm_Create_Managed_Paned_Window
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Paned_Window_Widget;


private

   pragma Import (C, Xm_Paned_Window_Widget_Class, "xmPanedWindowWidgetClass");

end Xm_Paned_Window;
