with Xt.Implementation; use Xt.Implementation;


package body Xt.Geometry_Management is


   procedure Xt_Configure_Widget (The_Widget   : in Widget;
                                  X            : in Position;
                                  Y            : in Position;
                                  Width        : in Dimension;
                                  Height       : in Dimension;
                                  Border_Width : in Dimension)
   is
      procedure XtConfigureWidget (The_Widget   : in Widget;
                                   X            : in Position;
                                   Y            : in Position;
                                   Width        : in Dimension;
                                   Height       : in Dimension;
                                   Border_Width : in Dimension);
      pragma Import (C, XtConfigureWidget, "XtConfigureWidget");
   begin
      Check (The_Widget);
      XtConfigureWidget (The_Widget, X, Y, Width, Height, Border_Width);
   end Xt_Configure_Widget;


   procedure Xt_Move_Widget (The_Widget : in Widget;
                             X          : in Position;
                             Y          : in Position) is
      procedure XtMoveWidget (The_Widget : in Widget;
                              X          : in Xt_Position;
                              Y          : in Xt_Position);
      pragma Import (C, XtMoveWidget, "XtMoveWidget");
   begin
      Check (The_Widget);
      XtMoveWidget (The_Widget, Xt_Position (X), Xt_Position (Y));
   end Xt_Move_Widget;


   procedure Xt_Resize_Window (The_Widget : in Widget) is
      procedure XtResizeWindow (The_Widget : in Widget);
      pragma Import (C, XtResizeWindow, "XtResizeWindow");
   begin
      Check (The_Widget);
      XtResizeWindow (The_Widget);
   end Xt_Resize_Window;


end Xt.Geometry_Management;
