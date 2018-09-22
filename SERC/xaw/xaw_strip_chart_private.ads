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

with System, X_Lib, Xt, Xaw_Strip_Chart, Xaw_Simple_Private,
     Xt_Core_Private, X_Configuration_Dependent;

use System;

package Xaw_Strip_Chart_Private is
    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    No_Gcs : constant := 0;
    Foreground : constant := 1;
    Highlight : constant := 2;
    All_Gcs : constant := Foreground + Highlight;

    type X_Long_Float_Array is array (Natural range <>) of X_Lib.X_Long_Float;
    type Long_Float_Array_Ptr is access X_Long_Float_Array;

    -- New fields for the stripChart widget instance record

    type Strip_Chart_Part is
	record
	    Fg_Pixel : X_Lib.Pixel;
	    Hi_Pixel : X_Lib.Pixel;
	    Fg_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Hi_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    --  start of graph stuff
	    Update : X_Lib.X_Integer;
	    Scale : X_Lib.X_Integer;
	    Min_Scale : X_Lib.X_Integer;
	    Interval : X_Lib.X_Integer;
	    Points : X_Lib.X_Pointer;
	    Max_Value : X_Lib.X_Long_Float;
	    Value_Data : Long_Float_Array_Ptr;
	    Interval_Id : Xt.Xt_Interval_Id;
	    Get_Value : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Jump_Val : X_Lib.X_Integer;
	end record;

    for Strip_Chart_Part use
	record
	    Fg_Pixel at 0 * Word_Size range 0 .. 31;
	    Hi_Pixel at 1 * Word_Size range 0 .. 31;
	    Fg_Gc at 2 * Word_Size range 0 .. 31;
	    Hi_Gc at 3 * Word_Size range 0 .. 31;
	    --  start of graph stuff
	    Update at 4 * Word_Size range 0 .. 31;
	    Scale at 5 * Word_Size range 0 .. 31;
	    Min_Scale at 6 * Word_Size range 0 .. 31;
	    Interval at 7 * Word_Size range 0 .. 31;
	    Points at 8 * Word_Size range 0 .. 31;
	    Max_Value at 10 * Word_Size range 0 .. 63;
	    Value_Data at 12 * Word_Size range 0 .. 31;
	    Interval_Id at 13 * Word_Size range 0 .. 31;
	    Get_Value at 14 * Word_Size range 0 .. 31;
	    Jump_Val at 15 * Word_Size range 0 .. 31;
	end record;
    Strip_Chart_Part_Size : constant := 16 * 32;

    Strip_Chart_Rec_Size : constant :=
       Xaw_Simple_Private.Simple_Rec_Size + Strip_Chart_Part_Size;

    -- Full instance record declaration 
    type Strip_Chart_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Simple : Xaw_Simple_Private.Simple_Part;
	    Strip_Chart : Strip_Chart_Part;
	end record;

    for Strip_Chart_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Simple at 0 range Xt_Core_Private.Core_Part_Size ..
				 Xaw_Simple_Private.Simple_Rec_Size - 1;
	    Strip_Chart at 0 range Xaw_Simple_Private.Simple_Rec_Size ..
				      Strip_Chart_Rec_Size - 1;
	end record;

    -- New fields for the StripChart widget class record 
    type Strip_Chart_Class_Part is
	record
	    Dummy : X_Lib.X_Integer;
	end record;

    for Strip_Chart_Class_Part use
	record
	    Dummy at 0 * Word_Size range 0 .. 31;
	end record;

    Strip_Chart_Class_Part_Size : constant := 32;
    Strip_Chart_Class_Rec_Size : constant :=
       Xaw_Simple_Private.Simple_Class_Rec_Size + Strip_Chart_Class_Part_Size;

    -- Full class record declaration. 
    type Strip_Chart_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Simple_Class : Xaw_Simple_Private.Simple_Class_Part;
	    Strip_Chart_Class : Strip_Chart_Class_Part;
	end record;

    for Strip_Chart_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Simple_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xaw_Simple_Private.Simple_Class_Rec_Size - 1;
	    Strip_Chart_Class at 0
	       range Xaw_Simple_Private.Simple_Class_Rec_Size ..
			Strip_Chart_Class_Rec_Size - 1;
	end record;

    type Strip_Chart_Class_Rec_Ptr is access Strip_Chart_Class_Rec;
    type Strip_Chart_Rec_Ptr is access Strip_Chart_Rec;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Strip_Chart_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Strip_Chart_Class (X : in Xt.Widget_Class)
				  return Strip_Chart_Class_Rec_Ptr;

    function To_Widget (X : in Strip_Chart_Rec_Ptr) return Xt.Widget;

    function To_Strip_Chart (X : in Xt.Widget) return Strip_Chart_Rec_Ptr;
end Xaw_Strip_Chart_Private;
