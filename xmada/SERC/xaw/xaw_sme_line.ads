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

package Xaw_Sme_Line is
    Xt_C_Line_Width : constant String := "LineWidth" & Ascii.Nul;
    Xt_C_Stipple : constant String := "Stipple" & Ascii.Nul;

    Xt_N_Line_Width : constant String := "lineWidth" & Ascii.Nul;
    Xt_N_Stipple : constant String := "stipple" & Ascii.Nul;

    subtype Sme_Line_Widget is Sme_Widget;
    subtype Sme_Line_Class is Sme_Class;

    function Sme_Line_Object_Class return Sme_Line_Class;
end Xaw_Sme_Line;
