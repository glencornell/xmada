with Xt;
with Xt.Ancillary_Types;

with Xm_Scrolled_Window;


package Xm_Main_Window is

   subtype Xm_Main_Window_Widget
     is Xm_Scrolled_Window.Xm_Scrolled_Window_Widget;
   subtype Xm_Main_Window_Class is Xm_Scrolled_Window.Xm_Scrolled_Window_Class;

   Xm_Main_Window_Widget_Class : constant Xm_Main_Window_Class;

   --

   function Xm_Create_Main_Window
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Main_Window_Widget;


   function Xm_Create_Managed_Main_Window
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Main_Window_Widget;


   ---------------------------------------------------------------------------
   --  Obsolete and deprecated stuff
   ---------------------------------------------------------------------------

   function Xm_Main_Window_Sep_1 (The_Widget : in Xm_Main_Window_Widget)
     return Xt.Widget;


   function Xm_Main_Window_Sep_2 (The_Widget : in Xm_Main_Window_Widget)
     return Xt.Widget;


   function Xm_Main_Window_Sep_3 (The_Widget : in Xm_Main_Window_Widget)
     return Xt.Widget;


   procedure Xm_Main_Window_Set_Areas
    (The_Widget           : in Xm_Main_Window_Widget;
     Menu_Bar             : in Xt.Widget;
     Command_Window       : in Xt.Widget;
     Horizontal_Scrollbar : in Xt.Widget;
     Vertical_Scrollbar   : in Xt.Widget;
     Work_Region          : in Xt.Widget);


private

   pragma Import (C, Xm_Main_Window_Widget_Class, "xmMainWindowWidgetClass");

end Xm_Main_Window;
