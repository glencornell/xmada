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

with Xt, X_Lib, Xaw_Form;

use Xt, X_Lib, Xaw_Form;

package Xaw_Viewport is
    -- 1) Resources documentation:

    -- Name                Class              RepType       Default Value
    -- ----                -----              -------       -------------
    -- allowHoriz          Boolean            Boolean       False
    -- allowVert           Boolean            Boolean       False
    -- background          Background         Pixel         XtDefaultBackground
    -- border              BorderColor        Pixel         XtDefaultForeground
    -- borderWidth         BorderWidth        Dimension     1
    -- destroyCallback     Callback           Pointer       NULL
    -- foreceBars          Boolean            Boolean       False
    -- height              Height             Dimension     0
    -- mappedWhenManaged   MappedWhenManaged  Boolean       True
    -- sensitive           Sensitive          Boolean       True
    -- useBottom           Boolean            Boolean       False
    -- useRight            Boolean            Boolean       False
    -- width               Width              Dimension     0
    -- x                   Position           Position      0
    -- y                   Position           Position      0

    -- 2) Define constants for new resources:

    -- xt_n_allow_horiz          : constant STRING := "allowHoriz" & ASCII.NUL;
    -- xt_n_allow_vert           : constant STRING := "allowVert" & ASCII.NUL;
    -- xt_n_background           : constant STRING := "background" & ASCII.NUL;
    -- xt_n_border               : constant STRING := "borderColor" & ASCII.NUL;
    -- xt_n_border_width         : constant STRING := "borderWidth" & ASCII.NUL;
    -- xt_n_destroy_callback     : constant STRING := "destroyCallback" & ASCII.NUL;
    -- xt_n_force_bars           : constant STRING := "forceBars" & ASCII.NUL;
    -- xt_n_height               : constant STRING := "height" & ASCII.NUL;
    -- xt_n_mapped_when_managed  : constant STRING := "mappedWhenManaged" & ASCII.NUL;
    -- xt_n_sensitive            : constant STRING := "sensitive" & ASCII.NUL;
    -- xt_n_use_bottom           : constant STRING := "useBottom" & ASCII.NUL;
    -- xt_n_use_right            : constant STRING := "useRight" & ASCII.NUL;
    -- xt_n_width                : constant STRING := "width" & ASCII.NUL;
    -- xt_n_x                    : constant STRING := "x" & ASCII.NUL;
    -- xt_n_y                    : constant STRING := "y" & ASCII.NUL;

    -- 3) Define application interface to types and constants for intrinsics use:

    subtype Viewport_Widget is Form_Widget;
    subtype Viewport_Class is Form_Class;

    function Viewport_Widget_Class return Viewport_Class;

    -- 4) Define public entries to Viewport_Widget operations:
    procedure Xaw_Viewport_Set_Location (W : in Widget;
					 Xoff : in X_Lib.X_Long_Float;
					 Yoff : in X_Lib.X_Long_Float);

    procedure Xaw_Viewport_Set_Coordinates
		 (W : in Widget; X : in Position; Y : in Position);
end Xaw_Viewport;
