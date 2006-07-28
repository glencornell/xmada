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

with Xt, Xaw_Simple, X_Lib;

use Xt, Xaw_Simple, X_Lib;

package Xaw_Grip is
    -- 1) Resources documentation

    -- Name              Class             RepType        Default Value
    -- ----              -----             -------        -------------
    -- foreground        Foreground        Pixel          XtDefaultForeground
    -- border            BorderColor       Pixel          XtDefaultForeground
    -- borderWidth       BorderWidth       Dimension      0
    -- callback          Callback          Pointer        GripAction
    -- cursor            Cursor            Cursor         None
    -- destroyCallback   Callback          Pointer        NULL
    -- height            Height            Dimension      8
    -- mappedWhenManaged MappedWhenManaged Boolean        True
    -- sensitive         Sensitive         Boolean        True
    -- width             Width             Dimension      8
    -- x                 Position          Position       0
    -- y                 Position          Position       0

    -- 2) Define constants for new resources

    Xt_N_Grip_Translations : constant String := "gripTranslations" & Ascii.Nul;

    -- 3) Define application interface to types and constants for intrinsics use

    type Grip_Call_Data_Rec is
	record
	    Event : X_Lib.Events.Event;
	    Params : X_Lib.String_List;
	    Num_Params : Xt.Cardinal;
	end record;
    type Grip_Call_Data is access Grip_Call_Data_Rec;
    subtype Xaw_Grip_Call_Data_Rec is Grip_Call_Data_Rec;
    subtype Xaw_Grip_Call_Data is Grip_Call_Data;

    subtype Grip_Widget is Simple_Widget;
    subtype Grip_Class is Simple_Class;

    function Grip_Widget_Class return Grip_Class;

    -- 4) Define public entries to Grip_Widget operations

    -- NONE
end Xaw_Grip;
