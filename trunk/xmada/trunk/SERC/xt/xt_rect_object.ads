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

with Xt_Object, Xt;

use Xt_Object, Xt;

package Xt_Rect_Object is
    -- 1) Resources documentation:

    -- Name                Class              RepType         Default Value
    -- ----                -----              -------         -------------
    -- borderWidth         BorderWidth        Dimension       1
    -- height              Height             Dimension       0
    -- sensitive           Sensitive          Boolean         True
    -- width               Width              Dimension       0
    -- x                   Position           Position        0
    -- y                   Position           Position        0

    -- 2) Define constants for new resources:

    -- NONE

    -- 3) Define application interface to types and constants for intrisics use:

    subtype Rect_Object_Widget is Obj_Widget;
    subtype Rect_Object_Class is Obj_Class;

    function Rect_Obj_Class return Rect_Object_Class;

    -- 4) Define public entries to Rect_Object_Widget operations:

    -- NONE
end Xt_Rect_Object;
