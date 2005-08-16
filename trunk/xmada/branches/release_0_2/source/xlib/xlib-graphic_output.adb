------------------------------------------------------------------------------
--
--  X Library Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rost.ru)
--!
--! XmAda is free software; you can redistribute it and/or modify it under
--! the terms of the GNU General Public License as published by the Free
--! Software Foundation; either version 2, or (at your option) any later
--! version.
--!
--! XmAda is distributed in the hope that it will be useful, but WITHOUT ANY
--! WARRANTY; without even the implied warranty of MERCHANTABILITY or
--! FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
--! for more details.
--!
--! You should have received a copy of the GNU General Public License
--! along with GCC; see the file COPYING. If not, write to the Free
--! Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
--! 02110-1301, USA.
--!
--! As a special exception, if other files instantiate generics from this
--! unit, or you link this unit with other files to produce an executable,
--! this unit does not by itself cause the resulting executable to be
--! covered by the GNU General Public License. This exception does not
--! however invalidate any other reasons why the executable file might be
--! covered by the GNU Public License.
--!
--! <Unit> Xlib.Graphic_Output
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;

with Xlib.Implementation;

package body Xlib.Graphic_Output is

   use Interfaces.C;
   use Xlib.Implementation;

   GC_Value_Mask_Mask : constant unsigned_long
     := 2#00000000_01111111_11111111_11111111#;

   function To_unsigned_long is
     new Ada.Unchecked_Conversion (GC_Value_Mask_Type, unsigned_long);

   function To_GC_Value_Mask_Type is
     new Ada.Unchecked_Conversion (unsigned_long, GC_Value_Mask_Type);


   function "=" (Left  : GC_Value_Mask_Type;
                 Right : GC_Value_Mask_Type)
     return Boolean
   is
      L : constant unsigned_long
        := To_unsigned_long (Left) and GC_Value_Mask_Mask;
      R : constant unsigned_long
        := To_unsigned_long (Right) and GC_Value_Mask_Mask;
   begin
      return L = R;
   end "=";


   function "and" (Left  : GC_Value_Mask_Type;
                   Right : GC_Value_Mask_Type)
     return GC_Value_Mask_Type
   is
      L : constant unsigned_long := To_Unsigned_Long (Left);
      R : constant unsigned_long := To_Unsigned_Long (Right);
   begin
      return To_GC_Value_Mask_Type (L and R and GC_Value_Mask_Mask);
   end "and";


   function "not" (Right : GC_Value_Mask_Type) return GC_Value_Mask_Type is
      R : constant unsigned_long := To_Unsigned_Long (Right);
   begin
      return To_GC_Value_Mask_Type ((not R) and GC_Value_Mask_Mask);
   end "not";


   function "or" (Left  : GC_Value_Mask_Type;
                  Right : GC_Value_Mask_Type)
     return GC_Value_Mask_Type
   is
      L : constant unsigned_long := To_Unsigned_Long (Left);
      R : constant unsigned_long := To_Unsigned_Long (Right);
   begin
      return To_GC_Value_Mask_Type ((L or R) and GC_Value_Mask_Mask);
   end "or";


   function "xor" (Left  : GC_Value_Mask_Type;
                   Right : GC_Value_Mask_Type)
     return GC_Value_Mask_Type
   is
      L : constant unsigned_long := To_Unsigned_Long (Left);
      R : constant unsigned_long := To_Unsigned_Long (Right);
   begin
      return To_GC_Value_Mask_Type ((L xor R) and GC_Value_Mask_Mask);
   end "xor";


   procedure X_Clear_Area (The_Display : in Display;
                           The_Window  : in Window;
                           X           : in X_Position;
                           Y           : in X_Position;
                           Width       : in X_Dimension;
                           Height      : in X_Dimension;
                           Exposures   : in Boolean)
   is
      procedure XClearArea (The_Display : in Display;
                            The_Window  : in Window;
                            X           : in int;
                            Y           : in int;
                            Width       : in unsigned;
                            Height      : in unsigned;
                            Exposures   : in X_Boolean);
      pragma Import (C, XClearArea, "XClearArea");
   begin
      Check (The_Display);
      XClearArea (The_Display,
                  The_Window,
                  int (X),
                  int (Y),
                  unsigned (Width),
                  unsigned (Height),
                  To_X_Boolean (Exposures));
   end X_Clear_Area;


   procedure X_Clear_Window (The_Display : in Display;
                             The_Window  : in Window)
   is
      procedure XClearWindow (The_Display : in Display;
                              The_Window  : in Window);
      pragma Import (C, XClearWindow, "XClearWindow");
   begin
      Check (The_Display);
      XClearWindow (The_Display, The_Window);
   end X_Clear_Window;


   procedure X_Copy_Area (The_Display   : in Display;
                          Source        : in Drawable;
                          Destination   : in Drawable;
                          GC            : in Graphic_Context;
                          Source_X      : in X_Position;
                          Source_Y      : in X_Position;
                          Source_Width  : in X_Dimension;
                          Source_Height : in X_Dimension;
                          Destination_X : in X_Position;
                          Destination_Y : in X_Position)
   is
      procedure XCopyArea (The_Display   : in Display;
                           Source        : in Drawable;
                           Destination   : in Drawable;
                           GC            : in Graphic_Context;
                           Source_X      : in int;
                           Source_Y      : in int;
                           Source_Width  : in unsigned;
                           Source_Height : in unsigned;
                           Destination_X : in int;
                           Destination_Y : in int);
      pragma Import (C, XCopyArea, "XCopyArea");
   begin
      Check (The_Display);
      Check (GC);
      XCopyArea (The_Display,
                 Source,
                 Destination,
                 GC,
                 int (Source_X),
                 int (Source_Y),
                 unsigned (Source_Width),
                 unsigned (Source_Height),
                 int (Destination_X),
                 int (Destination_Y));
   end X_Copy_Area;


   procedure X_Copy_GC (The_Display : in Display;
                        Source      : in Graphic_Context;
                        Value_Mask  : in GC_Value_Mask_Type;
                        Destination : in Graphic_Context)
   is
      procedure XCopyGC (The_Display : in Display;
                         Source      : in Graphic_Context;
                         Value_Mask  : in GC_Value_Mask_Type;
                         Destination : in Graphic_Context);
      pragma Import (C, XCopyGC, "XCopyGC");
   begin
      Check (The_Display);
      Check (Source);
      Check (Destination);
      XCopyGC (The_Display, Source, Value_Mask, Destination);
   end X_Copy_GC;


   function X_Create_GC (The_Display  : in Display;
                         The_Drawable : in Drawable;
                         Value_Mask   : in GC_Value_Mask_Type;
                         Values       : in X_GC_Values)
     return Graphic_Context
   is
      function XCreateGC (The_Display  : in Display;
                          The_Drawable : in Drawable;
                          Value_Mask   : in GC_Value_Mask_Type;
                          Values       : in X_GC_Values)
        return Graphic_Context;
      pragma Import (C, XCreateGC, "XCreateGC");
   begin
      Check (The_Display);
      return XCreateGC (The_Display, The_Drawable, Value_Mask, Values);
   end X_Create_GC;


   procedure X_Draw_Arc (The_Display  : in Display;
                         The_Drawable : in Drawable;
                         GC           : in Graphic_Context;
                         X            : in X_Position;
                         Y            : in X_Position;
                         Width        : in X_Dimension;
                         Height       : in X_Dimension;
                         Angle_1      : in X_Angle;
                         Angle_2      : in X_Angle)
   is
      procedure XDrawArc (The_Display  : in Display;
                          The_Drawable : in Drawable;
                          GC           : in Graphic_Context;
                          X            : in int;
                          Y            : in int;
                          Width        : in unsigned;
                          Height       : in unsigned;
                          Angle_1      : in int;
                          Angle_2      : in int);
      pragma Import (C, XDrawArc, "XDrawArc");
   begin
      Check (The_Display);
      Check (GC);
      XDrawArc (The_Display,
                The_Drawable,
                GC,
                int (X),
                int (Y),
                unsigned (Width),
                unsigned (Height),
                int (Angle_1),
                int (Angle_2));
   end X_Draw_Arc;


   procedure X_Draw_Arcs (The_Display  : in Display;
                          The_Drawable : in Drawable;
                          GC           : in Graphic_Context;
                          Arcs         : in X_Arc_List)
   is
      procedure XDrawArcs (The_Display  : in Display;
                           The_Drawable : in Drawable;
                           GC           : in Graphic_Context;
                           Arcs         : in X_Arc_List;
                           Num_Arcs     : in int);
      pragma Import (C, XDrawArcs, "XDrawArcs");
   begin
      Check (The_Display);
      Check (GC);
      XDrawArcs (The_Display, The_Drawable, GC, Arcs, Arcs'Length);
   end X_Draw_Arcs;


   procedure X_Draw_Line (The_Display  : in Display;
                          The_Drawable : in Drawable;
                          GC           : in Graphic_Context;
                          X1           : in X_Position;
                          Y1           : in X_Position;
                          X2           : in X_Position;
                          Y2           : in X_Position)
   is
      procedure XDrawLine (The_Display  : in Display;
                           The_Drawable : in Drawable;
                           GC           : in Graphic_Context;
                           X1           : in int;
                           Y1           : in int;
                           X2           : in int;
                           Y2           : in int);
      pragma Import (C, XDrawLine, "XDrawLine");
   begin
      Check (The_Display);
      Check (GC);
      XDrawLine (The_Display,
                 The_Drawable,
                 GC,
                 int (X1),
                 int (Y1),
                 int (X2),
                 int (Y2));
   end X_Draw_Line;


   procedure X_Draw_Lines (The_Display  : in Display;
                           The_Drawable : in Drawable;
                           GC           : in Graphic_Context;
                           Points       : in X_Point_List;
                           Mode         : in Coordinate_Mode_Type)
   is
      procedure XDrawLines (The_Display  : in Display;
                            The_Drawable : in Drawable;
                            GC           : in Graphic_Context;
                            Points       : in X_Point_List;
                            Num_Points   : in int;
                            Mode         : in Coordinate_Mode_Type);
      pragma Import (C, XDrawLines, "XDrawLines");
   begin
      Check (The_Display);
      Check (GC);
      XDrawLines (The_Display, The_Drawable, GC, Points, Points'Length, Mode);
   end X_Draw_Lines;


   procedure X_Draw_Point (The_Display  : in Display;
                           The_Drawable : in Drawable;
                           GC           : in Graphic_Context;
                           X            : in X_Position;
                           Y            : in X_Position)
   is
      procedure XDrawPoint (The_Display  : in Display;
                            The_Drawable : in Drawable;
                            GC           : in Graphic_Context;
                            X            : in int;
                            Y            : in int);
      pragma Import (C, XDrawPoint, "XDrawPoint");
   begin
      Check (The_Display);
      Check (GC);
      XDrawPoint (The_Display, The_Drawable, GC, int (X), int (Y));
   end X_Draw_Point;


   procedure X_Draw_Points (The_Display  : in Display;
                            The_Drawable : in Drawable;
                            GC           : in Graphic_Context;
                            Points       : in X_Point_List;
                            Mode         : in Coordinate_Mode_Type)
   is
      procedure XDrawPoints (The_Display  : in Display;
                             The_Drawable : in Drawable;
                             GC           : in Graphic_Context;
                             Points       : in X_Point_List;
                             Num_Points   : in int;
                             Mode         : in Coordinate_Mode_Type);
      pragma Import (C, XDrawPoints, "XDrawPoints");
   begin
      Check (The_Display);
      Check (GC);
      XDrawPoints (The_Display, The_Drawable, GC, Points, Points'Length, Mode);
   end X_Draw_Points;


   procedure X_Draw_Rectangle (The_Display  : in Display;
                               The_Drawable : in Drawable;
                               GC           : in Graphic_Context;
                               X            : in X_Position;
                               Y            : in X_Position;
                               Width        : in X_Dimension;
                               Height       : in X_Dimension)
   is
      procedure XDrawRectangle (The_Display  : in Display;
                                The_Drawable : in Drawable;
                                GC           : in Graphic_Context;
                                X            : in int;
                                Y            : in int;
                                Width        : in unsigned;
                                Height       : in unsigned);
      pragma Import (C, XDrawRectangle, "XDrawRectangle");
   begin
      Check (The_Display);
      Check (GC);
      XDrawRectangle (The_Display,
                      The_Drawable,
                      GC,
                      int (X),
                      int (Y),
                      unsigned (Width),
                      unsigned (Height));
   end X_Draw_Rectangle;


   procedure X_Draw_Rectangles (The_Display  : in Display;
                                The_Drawable : in Drawable;
                                GC           : in Graphic_Context;
                                Rectangles   : in X_Rectangle_List)
   is
      procedure XDrawRectangles (The_Display    : in Display;
                                 The_Drawable   : in Drawable;
                                 GC             : in Graphic_Context;
                                 Rectangles     : in X_Rectangle_List;
                                 Num_Rectangles : in int);
      pragma Import (C, XDrawRectangles, "XDrawRectangles");
   begin
      Check (The_Display);
      Check (GC);
      XDrawRectangles (The_Display,
                       The_Drawable,
                       GC,
                       Rectangles,
                       Rectangles'Length);
   end X_Draw_Rectangles;


   procedure X_Draw_Segments (The_Display  : in Display;
                              The_Drawable : in Drawable;
                              GC           : in Graphic_Context;
                              Segments     : in X_Segment_List)
   is
      procedure XDrawSegments (The_Display  : in Display;
                               The_Drawable : in Drawable;
                               GC           : in Graphic_Context;
                               Segments     : in X_Segment_List;
                               Num_Segments : in int);
      pragma Import (C, XDrawSegments, "XDrawSegments");
   begin
      Check (The_Display);
      Check (GC);
      XDrawSegments (The_Display, The_Drawable, GC, Segments, Segments'Length);
   end X_Draw_Segments;


   procedure X_Fill_Arc (The_Display  : in Display;
                         The_Drawable : in Drawable;
                         GC           : in Graphic_Context;
                         X            : in X_Position;
                         Y            : in X_Position;
                         Width        : in X_Dimension;
                         Height       : in X_Dimension;
                         Angle_1      : in X_Angle;
                         Angle_2      : in X_Angle)
   is
      procedure XFillArc (The_Display  : in Display;
                          The_Drawable : in Drawable;
                          GC           : in Graphic_Context;
                          X            : in int;
                          Y            : in int;
                          Width        : in unsigned;
                          Height       : in unsigned;
                          Angle_1      : in int;
                          Angle_2      : in int);
      pragma Import (C, XFillArc, "XFillArc");
   begin
      Check (The_Display);
      Check (GC);
      XFillArc (The_Display,
                The_Drawable,
                GC,
                int (X),
                int (Y),
                unsigned (Width),
                unsigned (Height),
                int (Angle_1),
                int (Angle_2));
   end X_Fill_Arc;


   procedure X_Fill_Arcs (The_Display  : in Display;
                          The_Drawable : in Drawable;
                          GC           : in Graphic_Context;
                          Arcs         : in X_Arc_List)
   is
      procedure XFillArcs (The_Display  : in Display;
                           The_Drawable : in Drawable;
                           GC           : in Graphic_Context;
                           Arcs         : in X_Arc_List;
                           Num_Arcs     : in int);
      pragma Import (C, XFillArcs, "XFillArcs");
   begin
      Check (The_Display);
      Check (GC);
      XFillArcs (The_Display, The_Drawable, GC, Arcs, Arcs'Length);
   end X_Fill_Arcs;


   procedure X_Fill_Polygon (The_Display  : in Display;
                             The_Drawable : in Drawable;
                             GC           : in Graphic_Context;
                             Points       : in X_Point_List;
                             Shape        : in Shape_Type;
                             Mode         : in Coordinate_Mode_Type)
   is
      procedure XFillPolygon (The_Display  : in Display;
                              The_Drawable : in Drawable;
                              GC           : in Graphic_Context;
                              Points       : in X_Point_List;
                              Num_Points   : in int;
                              Shape        : in Shape_Type;
                              Mode         : in Coordinate_Mode_Type);
      pragma Import (C, XFillPolygon, "XFillPolygon");
   begin
      Check (The_Display);
      Check (GC);
      XFillPolygon (The_Display,
                    The_Drawable,
                    GC,
                    Points,
                    Points'Length,
                    Shape,
                    Mode);
   end X_Fill_Polygon;


   procedure X_Fill_Rectangle (The_Display  : in Display;
                               The_Drawable : in Drawable;
                               GC           : in Graphic_Context;
                               X            : in X_Position;
                               Y            : in X_Position;
                               Width        : in X_Dimension;
                               Height       : in X_Dimension)
   is
      procedure XFillRectangle (The_Display  : in Display;
                                The_Drawable : in Drawable;
                                GC           : in Graphic_Context;
                                X            : in int;
                                Y            : in int;
                                Width        : in unsigned;
                                Height       : in unsigned);
      pragma Import (C, XFillRectangle, "XFillRectangle");
   begin
      Check (The_Display);
      Check (GC);
      XFillRectangle (The_Display,
                      The_Drawable,
                      GC,
                      int (X),
                      int (Y),
                      unsigned (Width),
                      unsigned (Height));
   end X_Fill_Rectangle;


   procedure X_Fill_Rectangles (The_Display  : in Display;
                                The_Drawable : in Drawable;
                                GC           : in Graphic_Context;
                                Rectangles   : in X_Rectangle_List)
   is
      procedure XFillRectangles (The_Display    : in Display;
                                 The_Drawable   : in Drawable;
                                 GC             : in Graphic_Context;
                                 Rectangles     : in X_Rectangle_List;
                                 Num_Rectangles : in int);
      pragma Import (C, XFillRectangles, "XFillRectangles");
   begin
      Check (The_Display);
      Check (GC);
      XFillRectangles (The_Display,
                       The_Drawable,
                       GC,
                       Rectangles,
                       Rectangles'Length);
   end X_Fill_Rectangles;


   procedure X_Free_GC (The_Display : in Display;
                        GC          : in Graphic_Context)
   is
      procedure XFreeGC (The_Display : in Display;
                         GC          : in Graphic_Context);
      pragma Import (C, XFreeGC, "XFreeGC");
   begin
      Check (The_Display);
      Check (GC);
      XFreeGC (The_Display, GC);
   end X_Free_GC;


end Xlib.Graphic_Output;
