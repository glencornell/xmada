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

with Xt_Composite, Xt;

use Xt_Composite, Xt;

package Xt_Shell is
    -- 1) Resources documentation:

    -- Name                Class              RepType         Default Value
    -- ----                -----              -------         -------------

    -- 2) Define constants for new resources.

    -- 3) Define application interface to types and constants for intrisics use:

    subtype Shell_Widget is Composite_Widget;
    subtype Shell_Class is Composite_Class;

    subtype Override_Shell_Widget is Shell_Widget;
    subtype Override_Shell_Class is Shell_Class;

    subtype Wm_Shell_Widget is Override_Shell_Widget;
    subtype Wm_Shell_Class is Override_Shell_Class;

    subtype Vendor_Shell_Widget is Wm_Shell_Widget;
    subtype Vendor_Shell_Class is Wm_Shell_Class;

    subtype Transient_Shell_Widget is Vendor_Shell_Widget;
    subtype Transient_Shell_Class is Vendor_Shell_Class;

    subtype Top_Level_Shell_Widget is Transient_Shell_Widget;
    subtype Top_Level_Shell_Class is Transient_Shell_Class;

    subtype Application_Shell_Widget is Top_Level_Shell_Widget;
    subtype Application_Shell_Class is Top_Level_Shell_Class;

    function Shell_Widget_Class return Shell_Class;
    function Override_Shell_Widget_Class return Override_Shell_Class;
    function Wm_Shell_Widget_Class return Wm_Shell_Class;
    function Vendor_Shell_Widget_Class return Vendor_Shell_Class;
    function Transient_Shell_Widget_Class return Transient_Shell_Class;
    function Top_Level_Shell_Widget_Class return Top_Level_Shell_Class;
    function Application_Shell_Widget_Class return Application_Shell_Class;

    -- 4) Define public entries to Shell_Widget operations:

    -- NONE
end Xt_Shell;
