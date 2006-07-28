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

with X_Configuration_Dependent, Xt;

package Xaw_Reports is
    -- XawPannerReport - this structure is used by the reportCallback of the
    -- Panner, Porthole, Viewport, and Scrollbar widgets to report its position.
    -- All fields must be filled in, although the changed field may be used as
    -- a hint as to which fields have been altered since the last report.

    type Xaw_Panner_Report_Record is
	record
	    Changed : X_Configuration_Dependent.Unsigned_Int;
	    Slider_X : Xt.Position;
	    Slider_Y : Xt.Position;
	    Slider_Width : Xt.Dimension;
	    Slider_Height : Xt.Dimension;
	    Canvas_Width : Xt.Dimension;
	    Canvas_Height : Xt.Dimension;
	end record;
    for Xaw_Panner_Report_Record use
	record
	    Changed at 0 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Slider_X at 1 * X_Configuration_Dependent.Word_Size range 0 .. 15;
	    Slider_Y at 1 * X_Configuration_Dependent.Word_Size range 16 .. 31;
	    Slider_Width at 2 * X_Configuration_Dependent.Word_Size
	       range 0 .. 15;
	    Slider_Height at 2 * X_Configuration_Dependent.Word_Size
	       range 16 .. 31;
	    Canvas_Width at 3 * X_Configuration_Dependent.Word_Size
	       range 0 .. 15;
	    Canvas_Height at 3 * X_Configuration_Dependent.Word_Size
	       range 16 .. 31;
	end record;
    type Xaw_Panner_Report is access Xaw_Panner_Report_Record;

    Xaw_Pr_Slider_X : constant := 1;
    Xaw_Pr_Slider_Y : constant := 2;
    Xaw_Pr_Slider_Width : constant := 4;
    Xaw_Pr_Slider_Height : constant := 8;
    Xaw_Pr_Canvas_Width : constant := 16;
    Xaw_Pr_Canvas_Height : constant := 32;
    Xaw_Pr_All : constant := 63;

    Xt_N_Report_Callback : constant String := "reportCallback" & Ascii.Nul;
    Xt_C_Report_Callback : constant String := "reportCallback" & Ascii.Nul;
end Xaw_Reports;

--package body Xaw_Reports is end Xaw_Reports;
