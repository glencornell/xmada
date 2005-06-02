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

with Xt, Xt_Core, Xt_Composite, Xt_Constraint;

use Xt, Xt_Core, Xt_Composite, Xt_Constraint;

package Xaw_Form is
    -- 1) Resources documentation:

    -- Name                Class              RepType       Default Value
    -- ----                -----              -------       -------------
    -- background          Background         Pixel         XtDefaultBackground
    -- border              BorderColor        Pixel         XtDefaultForeground
    -- borderWidth         BorderWidth        Dimension     1
    -- defaultDistance     Thickness          int           4
    -- destroyCallback     Callback           Pointer       NULL
    -- height              Height             Dimension     computed at realize
    -- mappedWhenManaged   MappedWhenManaged  Boolean        True
    -- sensitive           Sensitive          Boolean        True
    -- width               Width              Dimension      computed at realize
    -- x                   Position           Position       0
    -- y                   Position           Position       0

    -- xt_n_background            : constant string := "background" & ASCII.NUL;
    -- xt_n_border                : constant string := "borderColor" & ASCII.NUL;
    -- xt_n_border_width          : constant string := "borderWidth" & ASCII.NUL;
    -- xt_n_destroy_callback      : constant string := "destroyCallback" & ASCII.NUL;
    -- xt_n_height                : constant string := "height" & ASCII.NUL;
    -- xt_n_mapped_when_managed   : constant string := "mappedWhenManaged" & ASCII.NUL;
    -- xt_n_sensitive             : constant string := "sensitive" & ASCII.NUL;
    -- xt_n_width                 : constant string := "width" & ASCII.NUL;
    -- xt_n_x                     : constant string := "x" & ASCII.NUL;
    -- xt_n_y                     : constant string := "y" & ASCII.NUL;

    -- 1a) Constraint parameters

    -- Name                Class              RepType       Default Value
    -- ----                -----              -------       -------------
    -- bottom              Edge               XtEdgeType    XtRubber
    -- fromHoriz           Widget             Widget        (left edge of form)
    -- fromVert            Widget             Widget        (top of form)
    -- horizDistance       Thickness          int           defaultDistance
    -- left                Edge               XtEdgeType    XtRubber
    -- resizable           Boolean            Boolean       False
    -- right               Edge               XtEdgeType    XtRubber
    -- top                 Edge               XtEdgeType    XtRubber
    -- vertDistance        Thickness          int           defaultDistance

    -- 2) Define constants for new resources:

    Xt_N_Default_Distance : constant String := "defaultDistance" & Ascii.Nul;
    Xt_N_Bottom : constant String := "bottom" & Ascii.Nul;
    Xt_N_Left : constant String := "left" & Ascii.Nul;
    Xt_N_Right : constant String := "right" & Ascii.Nul;
    Xt_N_From_Horiz : constant String := "fromHoriz" & Ascii.Nul;
    Xt_N_From_Vert : constant String := "fromVert" & Ascii.Nul;
    Xt_N_Horiz_Distance : constant String := "horizDistance" & Ascii.Nul;
    Xt_N_Vert_Distance : constant String := "vertDistance" & Ascii.Nul;
    Xt_N_Resizable : constant String := "resizable" & Ascii.Nul;

    Xt_C_Edge : constant String := "Edge" & Ascii.Nul;
    Xt_C_Widget : constant String := "Widget" & Ascii.Nul;

    type Xaw_Edge_Type is (Xaw_Chain_Top, Xaw_Chain_Bottom,
			   Xaw_Chain_Left, Xaw_Chain_Right, Xaw_Rubber);
    for Xaw_Edge_Type'Size use 32;
    for Xaw_Edge_Type use (Xaw_Chain_Top => 0,
			   Xaw_Chain_Bottom => 1,
			   Xaw_Chain_Left => 2,
			   Xaw_Chain_Right => 3,
			   Xaw_Rubber => 4);

    subtype Xt_Edge_Type is Xaw_Edge_Type;

    Xt_Chain_Top : constant String := "XawChainTop" & Ascii.Nul;
    Xt_Chain_Bottom : constant String := "XawChainBottom" & Ascii.Nul;
    Xt_Chain_Left : constant String := "XawChainLeft" & Ascii.Nul;
    Xt_Chain_Right : constant String := "XawChainRight" & Ascii.Nul;
    Xt_Rubber : constant String := "XawRubber" & Ascii.Nul;

    -- 3) Define application interface to types and constants for intrinsics use:

    subtype Form_Widget is Constraint_Widget;
    subtype Form_Class is Constraint_Class;

    function Form_Widget_Class return Form_Class;

    -- 4) Define public entries to Form_Widget operations:

    procedure Xaw_Form_Do_Layout (W : in Widget; Do_It : in Boolean);
end Xaw_Form;
