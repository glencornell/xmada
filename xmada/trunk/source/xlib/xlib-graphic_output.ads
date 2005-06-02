
package Xlib.Graphic_Output is


   type Coordinate_Mode_Type is (Origin, Pervious);

   type Shape_Type is (Complex, Convex, Nonconvex);


   type GC_Value_Mask_Type is record
      GC_Function              : Boolean;
      GC_Plane_Mask            : Boolean;
      GC_Foreground            : Boolean;
      GC_Background            : Boolean;
      GC_Line_Width            : Boolean;
      GC_Line_Style            : Boolean;
      GC_Cap_Style             : Boolean;
      GC_Join_Style            : Boolean;
      GC_Fill_Style            : Boolean;
      GC_Fill_Rule             : Boolean;
      GC_Tile                  : Boolean;
      GC_Stipple               : Boolean;
      GC_Tile_Stipple_X_Origin : Boolean;
      GC_Tile_Stipple_Y_Origin : Boolean;
      GC_Font                  : Boolean;
      GC_Subwindow_Mode        : Boolean;
      GC_Graphics_Exposures    : Boolean;
      GC_Clip_X_Origin         : Boolean;
      GC_Clip_Y_Origin         : Boolean;
      GC_Clip_Mask             : Boolean;
      GC_Dash_Offset           : Boolean;
      GC_Dash_List             : Boolean;
      GC_Arc_Mode              : Boolean;
   end record;

   type GX_Function_Type is private;

   GX_Clear         : constant GX_Function_Type;
   GX_And           : constant GX_Function_Type;
   GX_And_Reverse   : constant GX_Function_Type;
   GX_Copy          : constant GX_Function_Type;
   GX_And_Inverted  : constant GX_Function_Type;
   GX_Noop          : constant GX_Function_Type;
   GX_Xor           : constant GX_Function_Type;
   GX_Or            : constant GX_Function_Type;
   GX_Nor           : constant GX_Function_Type;
   GX_Equiv         : constant GX_Function_Type;
   GX_Invert        : constant GX_Function_Type;
   GX_Or_Reverse    : constant GX_Function_Type;
   GX_Copy_Inverted : constant GX_Function_Type;
   GX_Or_Inverted   : constant GX_Function_Type;
   GX_Nand          : constant GX_Function_Type;
   GX_Set           : constant GX_Function_Type;


   type X_GC_Values is record
      Logical_Operation  : GX_Function_Type;
--      Plane              : Plane_Mask; -- unsigned long
--      Foreground         :             -- unsigned long
--      Background         :             -- unsigned long
--      Line_Width         :             -- int
--      Line_Style         :             -- int
--      Cap_Style          :             -- int
--      Join_Style         :             -- int
--      Fill_Style         :             -- int
--      Fill_Rule          :             -- int
--      Arc_Mode           :             -- int
--      Tile               : Pixmap;
--      Stipple            : Pixmap;
--      TS_X_Origin        : Interfaces.C.int;
--      TS_Y_Origin        : Interfaces.C.int;
--      Font               : Font;
--      Subwindow_Mode     :             -- int
--      Graphics_Exposures : Boolean;
--      Clip_X_Origin      : Interfaces.C.int;
--      Clip_Y_Origin      : Interfaces.C.int;
--      Clip_Mask          : Pixmap;
--      Dash_Offset        : Interfaces.C.int;
--      Dashes             : Interfaces.C.char;
   end record;
   pragma Convention (C, X_GC_Values);


   function X_Create_GC (The_Display  : in Display;
                         The_Drawable : in Drawable;
                         Value_Mask   : in GC_Value_Mask_Type;
                         Values       : in X_GC_Values)
     return Graphic_Context;


   procedure X_Copy_GC (The_Display : in Display;
                        Source      : in Graphic_Context;
                        Value_Mask  : in GC_Value_Mask_Type;
                        Destination : in Graphic_Context);


   procedure X_Free_GC (The_Display : in Display;
                        GC          : in Graphic_Context);


   procedure X_Clear_Area (The_Display : in Display;
                           The_Window  : in Window;
                           X           : in X_Position;
                           Y           : in X_Position;
                           Width       : in X_Dimension;
                           Height      : in X_Dimension;
                           Exposures   : in Boolean);


   procedure X_Clear_Window (The_Display : in Display;
                             The_Window  : in Window);


   procedure X_Copy_Area (The_Display   : in Display;
                          Source        : in Drawable;
                          Destination   : in Drawable;
                          GC            : in Graphic_Context;
                          Source_X      : in X_Position;
                          Source_Y      : in X_Position;
                          Source_Width  : in X_Dimension;
                          Source_Height : in X_Dimension;
                          Destination_X : in X_Position;
                          Destination_Y : in X_Position);


   procedure X_Draw_Point (The_Display  : in Display;
                           The_Drawable : in Drawable;
                           GC           : in Graphic_Context;
                           X            : in X_Position;
                           Y            : in X_Position);


   procedure X_Draw_Points (The_Display  : in Display;
                            The_Drawable : in Drawable;
                            GC           : in Graphic_Context;
                            Points       : in X_Point_List;
                            Mode         : in Coordinate_Mode_Type);


   procedure X_Draw_Line (The_Display  : in Display;
                          The_Drawable : in Drawable;
                          GC           : in Graphic_Context;
                          X1           : in X_Position;
                          Y1           : in X_Position;
                          X2           : in X_Position;
                          Y2           : in X_Position);


   procedure X_Draw_Lines (The_Display  : in Display;
                           The_Drawable : in Drawable;
                           GC           : in Graphic_Context;
                           Points       : in X_Point_List;
                           Mode         : in Coordinate_Mode_Type);


   procedure X_Draw_Segments (The_Display  : in Display;
                              The_Drawable : in Drawable;
                              GC           : in Graphic_Context;
                              Segments     : in X_Segment_List);


   procedure X_Draw_Rectangle (The_Display  : in Display;
                               The_Drawable : in Drawable;
                               GC           : in Graphic_Context;
                               X            : in X_Position;
                               Y            : in X_Position;
                               Width        : in X_Dimension;
                               Height       : in X_Dimension);


   procedure X_Draw_Rectangles (The_Display  : in Display;
                                The_Drawable : in Drawable;
                                GC           : in Graphic_Context;
                                Rectangles   : in X_Rectangle_List);


   procedure X_Draw_Arc (The_Display  : in Display;
                         The_Drawable : in Drawable;
                         GC           : in Graphic_Context;
                         X            : in X_Position;
                         Y            : in X_Position;
                         Width        : in X_Dimension;
                         Height       : in X_Dimension;
                         Angle_1      : in X_Angle;
                         Angle_2      : in X_Angle);


   procedure X_Draw_Arcs (The_Display  : in Display;
                          The_Drawable : in Drawable;
                          GC           : in Graphic_Context;
                          Arcs         : in X_Arc_List);


   procedure X_Fill_Rectangle (The_Display  : in Display;
                               The_Drawable : in Drawable;
                               GC           : in Graphic_Context;
                               X            : in X_Position;
                               Y            : in X_Position;
                               Width        : in X_Dimension;
                               Height       : in X_Dimension);


   procedure X_Fill_Rectangles (The_Display  : in Display;
                                The_Drawable : in Drawable;
                                GC           : in Graphic_Context;
                                Rectangles   : in X_Rectangle_List);


   procedure X_Fill_Polygon (The_Display  : in Display;
                             The_Drawable : in Drawable;
                             GC           : in Graphic_Context;
                             Points       : in X_Point_List;
                             Shape        : in Shape_Type;
                             Mode         : in Coordinate_Mode_Type);


   procedure X_Fill_Arc (The_Display  : in Display;
                         The_Drawable : in Drawable;
                         GC           : in Graphic_Context;
                         X            : in X_Position;
                         Y            : in X_Position;
                         Width        : in X_Dimension;
                         Height       : in X_Dimension;
                         Angle_1      : in X_Angle;
                         Angle_2      : in X_Angle);


   procedure X_Fill_Arcs (The_Display  : in Display;
                          The_Drawable : in Drawable;
                          GC           : in Graphic_Context;
                          Arcs         : in X_Arc_List);


private

   type GX_Function_Type is new Interfaces.C.int;

   GX_Clear         : constant GX_Function_Type := 16#00#;
   GX_And           : constant GX_Function_Type := 16#01#;
   GX_And_Reverse   : constant GX_Function_Type := 16#02#;
   GX_Copy          : constant GX_Function_Type := 16#03#;
   GX_And_Inverted  : constant GX_Function_Type := 16#04#;
   GX_Noop          : constant GX_Function_Type := 16#05#;
   GX_Xor           : constant GX_Function_Type := 16#06#;
   GX_Or            : constant GX_Function_Type := 16#07#;
   GX_Nor           : constant GX_Function_Type := 16#08#;
   GX_Equiv         : constant GX_Function_Type := 16#09#;
   GX_Invert        : constant GX_Function_Type := 16#0A#;
   GX_Or_Reverse    : constant GX_Function_Type := 16#0B#;
   GX_Copy_Inverted : constant GX_Function_Type := 16#0C#;
   GX_Or_Inverted   : constant GX_Function_Type := 16#0D#;
   GX_Nand          : constant GX_Function_Type := 16#0E#;
   GX_Set           : constant GX_Function_Type := 16#0F#;

   pragma Convention (C, Coordinate_Mode_Type);
   for Coordinate_Mode_Type'Size use Interfaces.C.int'Size;

   pragma Convention (C, Shape_Type);
   for Shape_Type'Size use Interfaces.C.int'Size;

   pragma Convention (C_Pass_By_Copy, GC_Value_Mask_Type);
   for GC_Value_Mask_Type use record
      GC_Function              at 0 range  0 ..  0;
      GC_Plane_Mask            at 0 range  1 ..  1;
      GC_Foreground            at 0 range  2 ..  2;
      GC_Background            at 0 range  3 ..  3;
      GC_Line_Width            at 0 range  4 ..  4;
      GC_Line_Style            at 0 range  5 ..  5;
      GC_Cap_Style             at 0 range  6 ..  6;
      GC_Join_Style            at 0 range  7 ..  7;
      GC_Fill_Style            at 0 range  8 ..  8;
      GC_Fill_Rule             at 0 range  9 ..  9;
      GC_Tile                  at 0 range 10 .. 10;
      GC_Stipple               at 0 range 11 .. 11;
      GC_Tile_Stipple_X_Origin at 0 range 12 .. 12;
      GC_Tile_Stipple_Y_Origin at 0 range 13 .. 13;
      GC_Font                  at 0 range 14 .. 14;
      GC_Subwindow_Mode        at 0 range 15 .. 15;
      GC_Graphics_Exposures    at 0 range 16 .. 16;
      GC_Clip_X_Origin         at 0 range 17 .. 17;
      GC_Clip_Y_Origin         at 0 range 18 .. 18;
      GC_Clip_Mask             at 0 range 19 .. 19;
      GC_Dash_Offset           at 0 range 20 .. 20;
      GC_Dash_List             at 0 range 21 .. 21;
      GC_Arc_Mode              at 0 range 22 .. 22;
   end record;
   for GC_Value_Mask_Type'Size use Interfaces.C.unsigned_long'Size;

   function "=" (Left  : GC_Value_Mask_Type;
                 Right : GC_Value_Mask_Type)
     return Boolean;

   function "<" (Left  : GC_Value_Mask_Type;
                 Right : GC_Value_Mask_Type)
     return Boolean is abstract;

   function ">" (Left  : GC_Value_Mask_Type;
                 Right : GC_Value_Mask_Type)
     return Boolean is abstract;

   function "<=" (Left  : GC_Value_Mask_Type;
                  Right : GC_Value_Mask_Type)
     return Boolean is abstract;

   function ">=" (Left  : GC_Value_Mask_Type;
                  Right : GC_Value_Mask_Type)
     return Boolean is abstract;

   function "not" (Right : GC_Value_Mask_Type) return GC_Value_Mask_Type;

   function "and" (Left  : GC_Value_Mask_Type;
                   Right : GC_Value_Mask_Type)
     return GC_Value_Mask_Type;

   function "or" (Left  : GC_Value_Mask_Type;
                  Right : GC_Value_Mask_Type)
     return GC_Value_Mask_Type;

   function "xor" (Left  : GC_Value_Mask_Type;
                   Right : GC_Value_Mask_Type)
     return GC_Value_Mask_Type;


end Xlib.Graphic_Output;
