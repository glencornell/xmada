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

with Xt, Xt_Constraint;

use Xt, Xt_Constraint;

package Xaw_Tree is
    Xt_N_Auto_Reconfigure : constant String := "autoReconfigure" & Ascii.Nul;
    Xt_N_Line_Width : constant String := "lineWidth" & Ascii.Nul;
    Xt_N_Tree_Gc : constant String := "treeGC" & Ascii.Nul;
    Xt_N_Tree_Parent : constant String := "treeParent" & Ascii.Nul;
    Xt_N_Gravity : constant String := "gravity" & Ascii.Nul;
    Xt_C_Auto_Reconfigure : constant String := "AutoReconfigure" & Ascii.Nul;
    Xt_C_Line_Width : constant String := "LineWidth" & Ascii.Nul;
    Xt_C_Tree_Gc : constant String := "TreeGC" & Ascii.Nul;
    Xt_C_Tree_Parent : constant String := "TreeParent" & Ascii.Nul;
    Xt_C_Gravity : constant String := "Gravity" & Ascii.Nul;
    Xt_R_Gc : constant String := "GC" & Ascii.Nul;

    subtype Tree_Widget is Constraint_Widget;
    subtype Tree_Class is Constraint_Class;

    function Tree_Widget_Class return Tree_Class;

    procedure Xaw_Tree_Force_Layout (W : in Widget);
end Xaw_Tree;
