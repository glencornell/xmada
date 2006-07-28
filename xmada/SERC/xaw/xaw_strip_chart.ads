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

with Xt, Xaw_Simple;

use Xt, Xaw_Simple;

package Xaw_Strip_Chart is
    Default_Jump : constant := -1;

    Xt_C_Jump_Scroll : constant String := "JumpScroll" & Ascii.Nul;
    Xt_C_Scale : constant String := "Scale" & Ascii.Nul;

    Xt_N_Get_Value : constant String := "getValue" & Ascii.Nul;
    Xt_N_Jump_Scroll : constant String := "jumpScroll" & Ascii.Nul;
    Xt_N_Min_Scale : constant String := "minScale" & Ascii.Nul;
    Xt_N_Scale : constant String := "scale" & Ascii.Nul;
    Xt_N_Vmunix : constant String := "vmunix" & Ascii.Nul;

    subtype Strip_Chart_Widget is Simple_Widget;
    subtype Strip_Chart_Class is Simple_Class;

    function Strip_Chart_Widget_Class return Strip_Chart_Class;
end Xaw_Strip_Chart;
