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

with Xt, Xaw_Sme;

use Xt, Xaw_Sme;

package Xaw_Sme_Bsb is
    Xt_N_Left_Bitmap : constant String := "leftBitmap" & Ascii.Nul;
    Xt_N_Left_Margin : constant String := "leftMargin" & Ascii.Nul;
    Xt_N_Right_Bitmap : constant String := "rightBitmap" & Ascii.Nul;
    Xt_N_Right_Margin : constant String := "rightMargin" & Ascii.Nul;
    Xt_N_Vert_Space : constant String := "vertSpace" & Ascii.Nul;

    Xt_C_Left_Bitmap : constant String := "LeftBitmap" & Ascii.Nul;
    Xt_C_Horizontal_Margins : constant String :=
       "HorizontalMargins" & Ascii.Nul;
    Xt_C_Right_Bitmap : constant String := "RightBitmap" & Ascii.Nul;
    Xt_C_Vert_Space : constant String := "VertSpace" & Ascii.Nul;

    subtype Sme_Bsb_Widget is Sme_Widget;
    subtype Sme_Bsb_Class is Sme_Class;

    function Sme_Bsb_Object_Class return Sme_Bsb_Class;
end Xaw_Sme_Bsb;
