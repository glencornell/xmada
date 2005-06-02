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

with Xt_Core, Xt;

use Xt_Core, Xt;

package Xt_Composite is
    -- 1) Resources documentation:

    -- Name                Class              RepType         Default Value
    -- ----                -----              -------         -------------

    -- 2) Define constants for new resources.

    -- 3) Define application interface to types and constants for intrisics use:

    subtype Composite_Widget is Core_Widget;
    subtype Composite_Class is Core_Class;

    function Composite_Widget_Class return Composite_Class;

    -- 4) Define public entries to Composite_Widget operations:
end Xt_Composite;
