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

with Xt, Xaw_Form, X_Lib;

use Xt, Xaw_Form, X_Lib;

package Xaw_Dialog is
    -- 1) Resources documentation:

    -- Name                Class              RepType         Default Value
    -- ----                -----              -------         -------------
    -- background          Background         Pixel           XtDefaultBackground
    -- border              BorderColor        Pixel           XtDefaultForeground
    -- borderWidth         BorderWidth        Dimension       1
    -- destroyCallback     Callback           Pointer         NULL
    -- height              Height             Dimension       computed at create
    -- label               Label              String          NULL
    -- mappedWhenManaged   MappedWhenManaged  Boolean       True
    -- maximumLength       Max                int             256
    -- sensitive           Sensitive          Boolean         True
    -- value               Value              String          NULL
    -- width               Width              Dimension       computed at create
    -- x                   Position           Position        0
    -- y                   Position           Position        0

    -- 2) Define constants for new resources.

    -- in Xt_Stringdefs:

    -- xt_n_background           : constant STRING := "background" & ASCII.NUL;
    -- xt_n_border               : constant STRING := "borderColor" & ASCII.NUL;
    -- xt_n_border_width         : constant STRING := "borderWidth" & ASCII.NUL;
    -- xt_n_destroy_callback     : constant STRING := "destroyCallback" & ASCII.NUL;
    -- xt_n_height               : constant STRING := "height" & ASCII.NUL;
    -- xt_n_label                : constant STRING := "label" & ASCII.NUL;
    -- xt_n_mapped_when_managed  : constant STRING := "mappedWhenManaged" & ASCII.NUL;
    -- xt_n_width                : constant STRING := "width" & ASCII.NUL;
    -- xt_n_x                    : constant STRING := "x" & ASCII.NUL;
    -- xt_n_y                    : constant STRING := "y" & ASCII.NUL;
    -- xt_n_sensitive            : constant STRING := "sensitive" & ASCII.NUL;

    -- locally defined:

    Xt_C_Icon : constant String := "Icon" & Ascii.Nul;
    Xt_N_Icon : constant String := "icon" & Ascii.Nul;

    -- 3) Define application interface to types and constants for intrisics use:

    subtype Dialog_Widget is Form_Widget;
    subtype Dialog_Class is Form_Class;

    function Dialog_Widget_Class return Dialog_Class;

    -- 4) Define public entries and types to Dialog_Widget operations:

    -- XawDialogAddButton
    procedure Xaw_Dialog_Add_Button (Dialog : in Widget;
				     Name : in String;
				     Callback : in Xt_Callback_Proc;
				     Client_Data : in Xt_Pointer);

    -- XawDialogGetValueString
    function Xaw_Dialog_Get_Value_String (W : in Widget) return String;
end Xaw_Dialog;
