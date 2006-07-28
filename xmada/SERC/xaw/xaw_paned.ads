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

with Xt, X_Lib, Xt_Constraint;

use Xt, X_Lib, Xt_Constraint;

package Xaw_Paned is
    Paned_Ask_Child : constant := 0;
    Paned_Grip_Size : constant := 0;

    Xt_N_Allow_Resize : constant String := "allowResize" & Ascii.Nul;
    Xt_N_Between_Cursor : constant String := "betweenCursor" & Ascii.Nul;
    Xt_N_Vertical_Between_Cursor : constant String :=
       "verticalBetweenCursor" & Ascii.Nul;
    Xt_N_Horizontal_Between_Cursor : constant String :=
       "horizontalBetweenCursor" & Ascii.Nul;
    Xt_N_Grip_Cursor : constant String := "gripCursor" & Ascii.Nul;
    Xt_N_Grip_Indent : constant String := "gripIndent" & Ascii.Nul;
    Xt_N_Horizontal_Grip_Cursor : constant String :=
       "horizontalGripCursor" & Ascii.Nul;
    Xt_N_Internal_Border_Color : constant String :=
       "internalBorderColor" & Ascii.Nul;
    Xt_N_Internal_Border_Width : constant String :=
       "internalBorderWidth" & Ascii.Nul;
    Xt_N_Left_Cursor : constant String := "leftCursor" & Ascii.Nul;
    Xt_N_Lower_Cursor : constant String := "lowerCursor" & Ascii.Nul;
    Xt_N_Refigure_Mode : constant String := "refigureMode" & Ascii.Nul;
    Xt_N_Position : constant String := "position" & Ascii.Nul;
    Xt_N_Min : constant String := "min" & Ascii.Nul;
    Xt_N_Max : constant String := "max" & Ascii.Nul;
    Xt_N_Preferred_Pane_Size : constant String :=
       "preferredPaneSize" & Ascii.Nul;
    Xt_N_Resize_To_Preferred : constant String :=
       "resizeToPreferred" & Ascii.Nul;
    Xt_N_Right_Cursor : constant String := "rightCursor" & Ascii.Nul;
    Xt_N_Show_Grip : constant String := "showGrip" & Ascii.Nul;
    Xt_N_Skip_Adjust : constant String := "skipAdjust" & Ascii.Nul;
    Xt_N_Upper_Cursor : constant String := "upperCursor" & Ascii.Nul;
    Xt_N_Vertical_Grip_Cursor : constant String :=
       "verticalGripCursor" & Ascii.Nul;

    Xt_C_Grip_Indent : constant String := "GripIndent" & Ascii.Nul;
    Xt_C_Min : constant String := "Min" & Ascii.Nul;
    Xt_C_Max : constant String := "Max" & Ascii.Nul;
    Xt_C_Preferred_Pane_Size : constant String :=
       "PreferredPaneSize" & Ascii.Nul;
    Xt_C_Show_Grip : constant String := "ShowGrip" & Ascii.Nul;

    subtype Paned_Widget is Constraint_Widget;
    subtype Paned_Class is Constraint_Class;

    function Paned_Widget_Class return Paned_Class;

    procedure Xaw_Paned_Allow_Resize
		 (W : in out Widget; Allow_Resize : in Boolean);

    procedure Xaw_Paned_Set_Min_Max (W : in Widget; Min, Max : in X_Integer);

    procedure Xaw_Paned_Get_Min_Max (W : in Widget; Min, Max : out X_Integer);

    procedure Xaw_Paned_Set_Refigure_Mode
		 (W : in out Widget; Mode : in Boolean);

    function Xaw_Paned_Get_Num_Sub (W : in Widget) return X_Integer;
end Xaw_Paned;
