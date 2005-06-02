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

with Xt, Xt_Core;

use Xt, Xt_Core;

package Xaw_Simple is
    -- 1) Resources documentation:

    -- Name                Class              RepType       Default Value
    -- ----                -----              -------       -------------
    -- background          Background         Pixel         XtDefaultBackground
    -- border              BorderColor        Pixel         XtDefaultForeground
    -- borderWidth         BorderWidth        Dimension     1
    -- cursor              Cursor             Cursor        None
    -- destroyCallback     Callback           Pointer       NULL
    -- height              Height             Dimension     0
    -- insensitiveBorder   Insensitive        Pixmap        Gray
    -- mappedWhenManaged   MappedWhenManaged  Boolean       True
    -- sensitive           Sensitive          Boolean       True
    -- width               Width              Dimension     0
    -- x                   Position           Position      0
    -- y                   Position           Position      0

    -- 2) Define constants for new resources.

    Xt_N_Cursor : constant String := "cursor" & Ascii.Nul;
    Xt_N_Cursor_Name : constant String := "cursorName" & Ascii.Nul;
    Xt_N_Insensitive_Border : constant String :=
       "insensitiveBorder" & Ascii.Nul;
    Xt_C_Insensitive : constant String := "Insensitive" & Ascii.Nul;

    -- xt_n_background           : constant STRING := "background" & ASCII.NUL;
    -- xt_n_border               : constant STRING := "borderColor" & ASCII.NUL;
    -- xt_n_border_width         : constant STRING := "borderWidth" & ASCII.NUL;
    -- xt_n_destroy_callback     : constant STRING := "destroyCallback" & ASCII.NUL;
    -- xt_n_height               : constant STRING := "height" & ASCII.NUL;
    -- xt_n_mapped_when_managed  : constant STRING := "mappedWhenManaged" & ASCII.NUL;
    -- xt_n_sensitive            : constant STRING := "sensitive" & ASCII.NUL;
    -- xt_n_width                : constant STRING := "width" & ASCII.NUL;
    -- xt_n_x                    : constant STRING := "x" & ASCII.NUL;
    -- xt_n_y                    : constant STRING := "y" & ASCII.NUL;

    -- 3) Define application interface to types and constants for intrisics use:

    subtype Simple_Widget is Core_Widget;
    subtype Simple_Class is Core_Class;

    function Simple_Widget_Class return Simple_Class;

    -- 4) Define public entries to Simple_Widget operations:

    -- NONE
end Xaw_Simple;
