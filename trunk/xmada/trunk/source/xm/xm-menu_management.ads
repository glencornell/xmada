with Xlib;
with Xlib.Cursors;
with Xlib.Events;
with Xt;


package Xm.Menu_Management is


   procedure Xm_Add_To_Post_From_List (Menu             : in Xt.Widget;
                                       Post_From_Widget : in Xt.Widget);


   procedure Xm_Remove_From_Post_From_List (Menu             : in Xt.Widget;
                                            Post_From_Widget : in Xt.Widget);


   function Xm_Get_Posted_From_Widget (Menu : in Xt.Widget) return Xt.Widget;


   procedure Xm_Menu_Position
    (Menu  : in Xt.Widget;
     Event : in Xlib.Events.X_Button_Pressed_Event_Record);


   function Xm_Get_Tear_Off_Control (Menu : in Xt.Widget) return Xt.Widget;


   ---------------------------------------------------------------------------
   --  Obsolete and deprecated stuff
   ---------------------------------------------------------------------------

   function Xm_Get_Menu_Cursor (The_Display : in Xlib.Display)
     return Xlib.Cursors.Cursor;


   procedure Xm_Set_Menu_Cursor (The_Display : in Xlib.Display;
                                 The_Cursor  : in Xlib.Cursors.Cursor);


end Xm.Menu_Management;
