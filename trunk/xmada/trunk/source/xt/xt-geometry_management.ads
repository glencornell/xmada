
package Xt.Geometry_Management is


   procedure Xt_Move_Widget (The_Widget : in Widget;
                             X          : in Position;
                             Y          : in Position);


   procedure Xt_Configure_Widget (The_Widget   : in Widget;
                                  X            : in Position;
                                  Y            : in Position;
                                  Width        : in Dimension;
                                  Height       : in Dimension;
                                  Border_Width : in Dimension);


   procedure Xt_Resize_Window (The_Widget : in Widget);


end Xt.Geometry_Management;
