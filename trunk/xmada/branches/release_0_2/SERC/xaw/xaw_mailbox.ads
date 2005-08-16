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

package Xaw_Mailbox is
    Xt_N_Check_Command : constant String := "checkCommand" & Ascii.Nul;
    Xt_N_Once_Only : constant String := "onceOnly" & Ascii.Nul;
    Xt_N_Volume : constant String := "volume" & Ascii.Nul;
    Xt_N_Full_Pixmap : constant String := "fullPixmap" & Ascii.Nul;
    Xt_N_Full_Pixmap_Mask : constant String := "fullPixmapMask" & Ascii.Nul;
    Xt_N_Empty_Pixmap : constant String := "emptyPixmap" & Ascii.Nul;
    Xt_N_Empty_Pixmap_Mask : constant String := "emptyPixmapMask" & Ascii.Nul;
    Xt_N_Flip : constant String := "flip" & Ascii.Nul;
    Xt_N_Shape_Window : constant String := "shapeWindow" & Ascii.Nul;
    Xt_C_Check_Command : constant String := "CheckCommand" & Ascii.Nul;
    Xt_C_Volume : constant String := "Volume" & Ascii.Nul;
    Xt_C_Pixmap_Mask : constant String := "PixmapMask" & Ascii.Nul;
    Xt_C_Flip : constant String := "Flip" & Ascii.Nul;
    Xt_C_Shape_Window : constant String := "ShapeWindow" & Ascii.Nul;

    subtype Mailbox_Widget is Simple_Widget;
    subtype Mailbox_Class is Simple_Class;

    function Mailbox_Widget_Class return Mailbox_Class;
end Xaw_Mailbox;
