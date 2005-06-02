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

with Xt;

use Xt;

package Xt_Core is
    -- 1) Resources documentation:

    -- Name                Class              RepType         Default Value
    -- ----                -----              -------         -------------
    -- background          Background         Pixel           XtDefaultBackground
    -- border              BorderColor        Pixel           XtDefaultForeground
    -- borderWidth         BorderWidth        Dimension       1
    -- destroyCallback     Callback           Pointer         NULL
    -- height              Height             Dimension       0
    -- mappedWhenManaged   MappedWhenManaged  Boolean         True
    -- sensitive           Sensitive          Boolean         True
    -- width               Width              Dimension       0
    -- x                   Position           Position        0
    -- y                   Position           Position        0

    -- 2) Define constants for new resources:

    -- NONE

    -- 3) Define application interface to types and constants for intrisics use:

    subtype Core_Widget is Widget;
    subtype Core_Class is Widget_Class;

    function Core_Widget_Class return Core_Class;

    -- 4) Define public entries to Core_Widget operations:

    -- NONE
end Xt_Core;
