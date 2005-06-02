with Xlib;              use Xlib;
with Xlib.Cursors;      use Xlib.Cursors;
with Xlib.Events;       use Xlib.Events;
with Xt;                use Xt;
with Xm.Implementation; use Xm.Implementation;


package body Xm.Menu_Management is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Add_To_Post_From_List
   --!    <ImplementationNotes> Параметр Post_From_Widget проверяется на нуль
   --! значение в Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Add_To_Post_From_List (Menu             : in Widget;
                                       Post_From_Widget : in Widget)
   is
      procedure XmAddToPostFromList (Menu             : in Widget;
                                     Post_From_Widget : in Widget);
      pragma Import (C, XmAddToPostFromList, "XmAddToPostFromList");
   begin
      Check (Menu);
      XmAddToPostFromList (Menu, Post_From_Widget);
   end Xm_Add_To_Post_From_List;


   function Xm_Get_Menu_Cursor (The_Display : in Display) return Cursor is
      function XmGetMenuCursor (The_Display : in Display) return Cursor;
      pragma Import (C, XmGetMenuCursor, "XmGetMenuCursor");
   begin
      Check (The_Display);
      return XmGetMenuCursor (The_Display);
   end Xm_Get_Menu_Cursor;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Get_Posted_From_Widget
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Get_Posted_From_Widget (Menu : in Widget) return Widget is
      function XmGetPostedFromWidget (Menu : in Widget) return Widget;
      pragma Import (C, XmGetPostedFromWidget, "XmGetPostedFromWidget");
   begin
      Check (Menu);
      return XmGetPostedFromWidget (Menu);
   end Xm_Get_Posted_From_Widget;


   function Xm_Get_Tear_Off_Control (Menu : in Widget) return Widget is
      function XmGetTearOffControl (Menu : in Widget) return Widget;
      pragma Import (C, XmGetTearOffControl, "XmGetTearOffControl");
   begin
      Check (Menu);
      return XmGetTearOffControl (Menu);
   end Xm_Get_Tear_Off_Control;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Menu_Position
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Menu_Position (Menu  : in Widget;
                               Event : in X_Button_Pressed_Event_Record)
   is
      procedure XmMenuPosition (Menu  : in Widget;
                                Event : in X_Button_Pressed_Event_Record);
      pragma Import (C, XmMenuPosition, "XmMenuPosition");
   begin
      Check (Menu);
      XmMenuPosition (Menu, Event);
   end Xm_Menu_Position;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Remove_From_Post_From_List
   --!    <ImplementationNotes> Параметр Post_From_Widget проверяется на нуль
   --! значение в Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Remove_From_Post_From_List (Menu             : in Widget;
                                            Post_From_Widget : in Widget)
   is
      procedure XmRemoveFromPostFromList (Menu             : in Widget;
                                          Post_From_Widget : in Widget);
      pragma Import (C, XmRemoveFromPostFromList, "XmAddToPostFromList");
   begin
      Check (Menu);
      XmRemoveFromPostFromList (Menu, Post_From_Widget);
   end Xm_Remove_From_Post_From_List;


   procedure Xm_Set_Menu_Cursor (The_Display : in Display;
                                 The_Cursor  : in Cursor)
   is
      procedure XmSetMenuCursor (The_Display : in Display;
                                 The_Cursor  : in Cursor);
      pragma Import (C, XmSetMenuCursor, "XmSetMenuCursor");
   begin
      Check (The_Display);
      XmSetMenuCursor (The_Display, The_Cursor);
   end Xm_Set_Menu_Cursor;


end Xm.Menu_Management;
