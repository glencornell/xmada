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

package Xt_Installation is
    Errordb : constant String := "/usr/lib/X11/XtErrorDB" & Ascii.Nul;

    X_Appl_Load_Dir : constant String :=
       "/usr/lib/X11/app-defaults/" & Ascii.Nul;
    X_Appl_Res_Dir : constant String := "XAPPLRESDIR" & Ascii.Nul;
    X_Defaults_Str : constant String := ".Xdefaults" & Ascii.Nul;
    X_Defaults_Dash : constant String := ".Xdefaults-" & Ascii.Nul;
    X_Environment : constant String := "XENVIRONMENT" & Ascii.Nul;
end Xt_Installation;

--package body Xt_Installation is end Xt_Installation;
