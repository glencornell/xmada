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

with Xt, X_Lib, Xaw_Simple;

use Xt, X_Lib, Xaw_Simple;

package Xaw_Scrollbar is
    -- 1) Resources documentation:

    --  Name                Class              RepType         Default Value
    --  ----                -----              -------         -------------
    --  background          Background         Pixel           White
    --  border              BorderColor        Pixel           Black
    --  borderWidth         BorderWidth        Dimension       1
    --  destroyCallback     Callback           Function        NULL
    --  foreground          Color              Pixel           Black
    --  height              Height             Dimension       length or thickness
    --  jumpProc            Callback           Function        NULL
    --  length              Length             Dimension       1
    --  mappedWhenManaged   MappedWhenManaged  Boolean         True
    --  orientation         Orientation        XtOrientation   XtorientVertical
    --  reverseVideo        ReverseVideo       Boolean         False
    --  scrollDCursor       Cursor             Cursor          XC_sb_down_arrow
    --  scrollHCursor       Cursor             Cursor          XC_sb_h_double_arrow
    --  scrollLCursor       Cursor             Cursor          XC_sb_left_arrow
    --  scrollProc          Callback           Function        NULL
    --  scrollRCursor       Cursor             Cursor          XC_sb_right_arrow
    --  scrollUCursor       Cursor             Cursor          XC_sb_up_arrow
    --  scrollVCursor       Cursor             Cursor          XC_sb_v_double_arrow
    --  sensitive           Sensitive          Boolean         True
    --  shown               Shown              float           0.0
    --  thickness           Thickness          Dimension       14
    --  thumb               Thumb              Pixmap          Grey
    --  top                 Top                float           0.0
    --  width               Width              Dimension       thickness or length
    --  x                   Position           Position        0
    --  y                   Position           Position        0

    -- 2) Define constants for new resources.

    -- defined in Xt_Stringdefs:

    -- xt_n_jump_proc            : constant STRING := "jumpProc" & ASCII.NUL;
    -- xt_n_length               : constant STRING := "length" & ASCII.NUL;
    -- xt_n_orientation          : constant STRING := "orientation" & ASCII.NUL;
    -- xt_n_scroll_proc          : constant STRING := "scrollProc" & ASCII.NUL;
    -- xt_n_scroll_d_cursor      : constant STRING := "scrollDCursor" & ASCII.NUL;
    -- xt_n_scroll_h_cursor      : constant STRING := "scrollHCursor" & ASCII.NUL;
    -- xt_n_scroll_l_cursor      : constant STRING := "scrollLCursor" & ASCII.NUL;
    -- xt_n_scroll_r_cursor      : constant STRING := "scrollRCursor" & ASCII.NUL;
    -- xt_n_scroll_u_cursor      : constant STRING := "scrollUCursor" & ASCII.NUL;
    -- xt_n_scroll_v_cursor      : constant STRING := "scrollVCursor" & ASCII.NUL;
    -- xt_n_shown                : constant STRING := "shown" & ASCII.NUL;
    -- xt_n_thickness            : constant STRING := "thickness" & ASCII.NUL;
    -- xt_n_thumb                : constant STRING := "thumb" & ASCII.NUL;
    -- xt_n_top                  : constant STRING := "top" & ASCII.NUL;

    Xt_C_Minimum_Thumb : constant String := "MinimumThumb" & Ascii.Nul;
    Xt_C_Shown : constant String := "Shown" & Ascii.Nul;
    Xt_C_Top_Of_Thumb : constant String := "TopOfThumb" & Ascii.Nul;

    Xt_N_Minimum_Thumb : constant String := "minimumThumb" & Ascii.Nul;
    Xt_N_Top_Of_Thumb : constant String := "topOfThumb" & Ascii.Nul;

    -- 3) Define application interface to types and constants for intrisics use:

    subtype Scrollbar_Widget is Simple_Widget;
    subtype Scrollbar_Class is Simple_Class;

    function Scrollbar_Widget_Class return Scrollbar_Class;

    -- 4) Define public entries to Scrollbar_Widget operations:

    procedure Xaw_Scrollbar_Set_Thumb
		 (W : in Scrollbar_Widget; Top, Shown : in X_Float);
end Xaw_Scrollbar;
