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

package Xaw_Logo is
    Xt_N_Shape_Window : constant String := "shapeWindow" & Ascii.Nul;
    Xt_C_Shape_Window : constant String := "ShapeWindow" & Ascii.Nul;

    subtype Logo_Widget is Simple_Widget;
    subtype Logo_Class is Simple_Class;

    function Logo_Widget_Class return Logo_Class;
end Xaw_Logo;
