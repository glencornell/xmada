--  This is internal package! Don't use it in applications!

with Xlib;
with Xlib.Implementation;


package Xt.Implementation is


   subtype Xt_Position is Interfaces.C.int;


   procedure Check (The_Display : in Xlib.Display)
     renames Xlib.Implementation.Check;


   procedure Check (The_Screen : in Xlib.Screen)
     renames Xlib.Implementation.Check;


   procedure Check (The_GC : in Xlib.Graphic_Context)
     renames Xlib.Implementation.Check;


   procedure Check (The_Widget : in Widget);


   procedure Check (The_Widget_Class : in Widget_Class);


   procedure Check (App_Context : in Xt_App_Context);


   generic function Generic_To_Element_List
     renames Xlib.Implementation.Generic_To_Element_List;


end Xt.Implementation;
