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

with Xt, Xt_Core, Xaw_Simple;

use Xt, Xt_Core, Xaw_Simple;

package Xaw_Label is
    -- 1) Resources documentation:

    -- Name                Class              RepType       Default Value
    -- ----                -----              -------       -------------
    -- foreground          Foreground         Pixel         XtDefaultForeground
    -- font                Font               FontStruct    XtDefaultFont
    -- label               Label              String        NULL
    -- justify             Justify            Justify       XtJustifyCenter
    -- internalWidth       Width              Dimension     4
    -- internalHeight      Height             Dimension     2
    -- bitmap              Pixmap             Pixmap        None
    -- resize              Resize             Boolean       True

    -- 2) Define constants for new resources:

    -- xt_n_foreground     : constant STRING := "foreground" & ASCII.NUL;
    -- xt_n_font           : constant STRING := "font" & ASCII.NUL;
    -- xt_n_label          : constant STRING := "label" & ASCII.NUL;
    -- xt_n_justify        : constant STRING := "justify" & ASCII.NUL;
    -- xt_n_internalWidth  : constant STRING := "internalWidth" & ASCII.NUL;
    -- xt_n_internalHeight : constant STRING := "internalHeight" & ASCII.NUL;
    -- xt_n_bitmap         : constant STRING := "bitmap" & ASCII.NUL;
    -- xt_n_resize         : constant STRING := "resize" & ASCII.NUL;

    Xt_N_Left_Bitmap : constant String := "leftBitmap" & Ascii.Nul;
    Xt_C_Left_Bitmap : constant String := "LeftBitmap" & Ascii.Nul;
    Xt_N_Encoding : constant String := "encoding" & Ascii.Nul;
    Xt_C_Encoding : constant String := "Encoding" & Ascii.Nul;

    -- to be used when setting the Xt_N_encoding resource
    type Xaw_Text_Encodings is
       (Xaw_Text_Encoding_8_Bit, Xaw_Text_Encoding_Char2B);
    for Xaw_Text_Encodings'Size use 32;
    for Xaw_Text_Encodings use (Xaw_Text_Encoding_8_Bit => 0,
				Xaw_Text_Encoding_Char2B => 1);

    -- 3) Define application interface to types and constants for intrisics use:

    subtype Label_Widget is Simple_Widget;
    subtype Label_Class is Simple_Class;

    function Label_Widget_Class return Label_Class;

    -- 4) Define public entries to Label_Widget operations:

    -- NONE
end Xaw_Label;
