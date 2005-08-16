-- AdaXlibXt: Ada bindings to the X Window System, developed by SERC
-- Copyright (C) 1991, 1992, 1993  Free Software Foundation
--
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Library General Public
-- License as published by the Free Software Foundation; either
-- version 2 of the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Library General Public License for more details.
--
-- You should have received a copy of the GNU Library General Public
-- License along with this library; if not, write to the Free
-- Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

with Xt, Xt_Core, Xaw_Simple, Xaw_Label;

use Xt, Xt_Core, Xaw_Simple, Xaw_Label;

package Xaw_Command is
    -- 1) Resources documentation:

    -- Name               Class              RepType       Default Value
    -- ----               -----              -------       -------------
    -- accelerators       Accelerators       AcceleratorTable NULL
    -- ancestorSensitive  AncestorSensitive  Boolean        True
    -- background         Background         Pixel          XtDefaultBackground
    -- backgroundPixmap   Pixmap             Pixmap         XtUnspecifiedPixmap
    -- bitmap             Pixmap             Pixmap         None
    -- borderColor        BorderColor        Pixel          XtDefaultForeground
    -- borderPixmap       Pixmap             Pixmap         XtUnspecifiedPixmap
    -- borderWidth        BorderWidth        Dimension      1
    -- callback           Callback           Pointer        NULL
    -- colormap           Colormap           Colormap       parent's colormap
    -- cornerRoundPercent CornerRoundPercent Dimension      25
    -- cursor             Cursor             Cursor         None
    -- cursorName         Cursor             String         NULL
    -- depth              Depth              int            parent's depth
    -- destroyCallback    Callback           Pointer        NULL
    -- encoding           Encoding           UnsignedChar   XawTextEncoding8bit
    -- font               Font               XFontStructx*  XtDefaultFont
    -- foreground         Foreground         Pixel          XtDefaultForeground
    -- height             Height             Dimension      text height
    -- highlightThickness Thickness          Dimension      2
    -- insensitiveBorder  Insensitive        Pixmap         Gray
    -- internalHeight     Height             Dimension      2
    -- internalWidth      Width              Dimension      4
    -- justify            Justify            XtJustify      XtJustifyCenter
    -- label              Label              String         NULL
    -- leftBitmap         LeftBitmap         Pixmap         None
    -- mappedWhenManaged  MappedWhenManaged  Boolean        True
    -- pointerColor       Foreground         Pixel          XtDefaultForeground
    -- pointerColorBackground Background     Pixel          XtDefaultBackground
    -- resize             Resize             Boolean        True
    -- screen             Screen             Screen         parent's Screen
    -- sensitive          Sensitive          Boolean        True
    -- shapeStyle         ShapeStyle         ShapeStyle     Rectangle
    -- translations       Translations       TranslationTable see doc or source
    -- width              Width              Dimension      text width
    -- x                  Position           Position       0
    -- y                  Position           Position       0

    -- 2) Define constants for new resources:

    -- xt_n_background          : constant STRING := "background" & ASCII.NUL;
    -- xt_n_bitmap              : constant STRING := "bitmap" & ASCII.NUL;
    -- xt_n_border              : constant STRING := "borderColor" & ASCII.NUL;
    -- xt_n_border_width        : constant STRING := "borderWidth" & ASCII.NUL;
    -- xt_n_callback            : constant STRING := "callback" & ASCII.NUL;
    -- xt_n_cursor              : constant STRING := "cursor" & ASCII.NUL;
    -- xt_n_destroy_callback    : constant STRING := "destroyCallback" & ASCII.NUL;
    -- xt_n_font                : constant STRING := "font" & ASCII.NUL;
    -- xt_n_foreground          : constant STRING := "foreground" & ASCII.NUL;
    -- xt_n_height              : constant STRING := "height" & ASCII.NUL;
    -- xt_n_insensitive_border  : constant STRING := "insensitiveBorder" & ASCII.NUL;
    -- xt_n_internal_height     : constant STRING := "internalHeight" & ASCII.NUL;
    -- xt_n_internal_width      : constant STRING := "internalWidth" & ASCII.NUL;
    -- xt_n_justify             : constant STRING := "justify" & ASCII.NUL;
    -- xt_n_label               : constant STRING := "label" & ASCII.NUL;
    -- xt_n_mapped_when_managed : constant STRING := "mappedWhenManaged" & ASCII.NUL;
    -- xt_n_resize              : constant STRING := "resize" & ASCII.NUL;
    -- xt_n_sensitive           : constant STRING := "sensitive" & ASCII.NUL;
    -- xt_n_width               : constant STRING := "width" & ASCII.NUL;
    -- xt_n_x                   : constant STRING := "x" & ASCII.NUL;
    -- xt_n_y                   : constant STRING := "y" & ASCII.NUL;

    Xt_N_Highlight_Thickness : constant String :=
       "highlightThickness" & Ascii.Nul;

    Xt_N_Shape_Style : constant String := "shapeStyle" & Ascii.Nul;
    Xt_C_Shape_Style : constant String := "ShapeStyle" & Ascii.Nul;
    Xt_R_Shape_Style : constant String := "ShapeStyle" & Ascii.Nul;
    Xt_N_Corner_Round_Percent : constant String :=
       "cornerRoundPercent" & Ascii.Nul;
    Xt_C_Corner_Round_Percent : constant String :=
       "CornerRoundPercent" & Ascii.Nul;

    Xaw_Shape_Rectangle : constant String := "XmuShapeRectangle" & Ascii.Nul;
    Xaw_Shape_Oval : constant String := "XmuShapeOval" & Ascii.Nul;
    Xaw_Shape_Ellipse : constant String := "XmuShapeEllipse" & Ascii.Nul;
    Xaw_Shape_Rounded_Rectangle : constant String :=
       "XmuShapeRoundedRectangle" & Ascii.Nul;

    -- 3) Define application interface to types and constants for intrinsics use:

    subtype Command_Widget is Label_Widget;
    subtype Command_Class is Label_Class;

    function Command_Widget_Class return Command_Class;

    -- 4) Define public entries to Command_Widget operations:

    -- NONE
end Xaw_Command;
