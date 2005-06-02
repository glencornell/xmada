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

with X_Lib, X_Configuration_Dependent, X_Masks, X_Lib_Interface,
     X_System_Utilities, System, Unchecked_Deallocation, Unchecked_Conversion;

use X_Lib, X_Configuration_Dependent, X_Masks,
    X_Lib_Interface, X_System_Utilities, System;

package X_Event_Utilities is
    use Events;

    type X_Key_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    Root : X_Configuration_Dependent.Long;
	    Subwindow : X_Configuration_Dependent.Long;
	    Event_Time : X_Configuration_Dependent.Long;
	    X : X_Configuration_Dependent.Int;
	    Y : X_Configuration_Dependent.Int;
	    X_Root : X_Configuration_Dependent.Int;
	    Y_Root : X_Configuration_Dependent.Int;
	    State : X_Configuration_Dependent.Unsigned_Int;
	    Key_Code : X_Configuration_Dependent.Unsigned_Int;
	    Same_Screen : X_Configuration_Dependent.Bool;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Key_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Root at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Subwindow at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Event_Time at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X at 8 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y at 9 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X_Root at 10 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y_Root at 11 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    State at 12 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Key_Code at 13 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Same_Screen at 14 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	end record;

    type X_Button_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    Root : X_Configuration_Dependent.Long;
	    Subwindow : X_Configuration_Dependent.Long;
	    Event_Time : X_Configuration_Dependent.Long;
	    X : X_Configuration_Dependent.Int;
	    Y : X_Configuration_Dependent.Int;
	    X_Root : X_Configuration_Dependent.Int;
	    Y_Root : X_Configuration_Dependent.Int;
	    State : X_Configuration_Dependent.Unsigned_Int;
	    Button : X_Configuration_Dependent.Unsigned_Int;
	    Same_Screen : X_Configuration_Dependent.Bool;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Button_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Root at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Subwindow at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Event_Time at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X at 8 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y at 9 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X_Root at 10 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y_Root at 11 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    State at 12 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Button at 13 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Same_Screen at 14 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	end record;

    type X_Motion_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    Root : X_Configuration_Dependent.Long;
	    Subwindow : X_Configuration_Dependent.Long;
	    Event_Time : X_Configuration_Dependent.Long;
	    X : X_Configuration_Dependent.Int;
	    Y : X_Configuration_Dependent.Int;
	    X_Root : X_Configuration_Dependent.Int;
	    Y_Root : X_Configuration_Dependent.Int;
	    State : X_Configuration_Dependent.Unsigned_Int;
	    Is_Hint : X_Configuration_Dependent.Char;
	    Same_Screen : X_Configuration_Dependent.Bool;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Motion_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Root at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Subwindow at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Event_Time at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X at 8 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y at 9 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X_Root at 10 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y_Root at 11 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    State at 12 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Is_Hint at 13 * X_Configuration_Dependent.Word_Size range 0 .. 7;
	    Same_Screen at 14 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	end record;

    type X_Crossing_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    Root : X_Configuration_Dependent.Long;
	    Subwindow : X_Configuration_Dependent.Long;
	    Event_Time : X_Configuration_Dependent.Long;
	    X : X_Configuration_Dependent.Int;
	    Y : X_Configuration_Dependent.Int;
	    X_Root : X_Configuration_Dependent.Int;
	    Y_Root : X_Configuration_Dependent.Int;
	    Mode : X_Configuration_Dependent.Int;
	    Detail : X_Configuration_Dependent.Int;
	    Same_Screen : X_Configuration_Dependent.Bool;
	    Focus : X_Configuration_Dependent.Bool;
	    State : X_Configuration_Dependent.Unsigned_Int;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Crossing_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Root at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Subwindow at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Event_Time at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X at 8 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y at 9 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X_Root at 10 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y_Root at 11 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Mode at 12 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Detail at 13 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Same_Screen at 14 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Focus at 15 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    State at 16 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Focus_Change_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    Mode : X_Configuration_Dependent.Int;
	    Detail : X_Configuration_Dependent.Int;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Focus_Change_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Mode at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Detail at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Keymap_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    Key_Vector : X_Lib.Char_Array (0 .. 31);
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Keymap_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Key_Vector at 5 * X_Configuration_Dependent.Word_Size
	       range 0 .. 255;
	end record;

    type X_Expose_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    X : X_Configuration_Dependent.Int;
	    Y : X_Configuration_Dependent.Int;
	    Width : X_Configuration_Dependent.Int;
	    Height : X_Configuration_Dependent.Int;
	    Count : X_Configuration_Dependent.Int;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Expose_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Width at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Height at 8 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Count at 9 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Graphics_Expose_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    D : X_Configuration_Dependent.Long;
	    X : X_Configuration_Dependent.Int;
	    Y : X_Configuration_Dependent.Int;
	    Width : X_Configuration_Dependent.Int;
	    Height : X_Configuration_Dependent.Int;
	    Count : X_Configuration_Dependent.Int;
	    Major_Code : X_Configuration_Dependent.Int;
	    Minor_Code : X_Configuration_Dependent.Int;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Graphics_Expose_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    D at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Width at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Height at 8 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Count at 9 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Major_Code at 10 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Minor_Code at 11 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	end record;

    type X_No_Expose_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    D : X_Configuration_Dependent.Long;
	    Major_Code : X_Configuration_Dependent.Int;
	    Minor_Code : X_Configuration_Dependent.Int;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_No_Expose_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    D at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Major_Code at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Minor_Code at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Visibility_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    State : X_Configuration_Dependent.Int;
	    Word_06 : X_Configuration_Dependent.Long;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Visibility_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    State at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Create_Window_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Parent : X_Configuration_Dependent.Long;
	    Window_Id : X_Configuration_Dependent.Long;
	    X : X_Configuration_Dependent.Int;
	    Y : X_Configuration_Dependent.Int;
	    Width : X_Configuration_Dependent.Int;
	    Height : X_Configuration_Dependent.Int;
	    Border_Width : X_Configuration_Dependent.Int;
	    Override_Redirect : X_Configuration_Dependent.Bool;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Create_Window_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Parent at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Width at 8 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Height at 9 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Border_Width at 10 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Override_Redirect at 11 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	end record;

    type X_Destroy_Window_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Event_Window : X_Configuration_Dependent.Long;
	    Window_Id : X_Configuration_Dependent.Long;
	    Word_06 : X_Configuration_Dependent.Long;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Destroy_Window_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Event_Window at 4 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Window_Id at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Unmap_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Event_Window : X_Configuration_Dependent.Long;
	    Window_Id : X_Configuration_Dependent.Long;
	    From_Configure : X_Configuration_Dependent.Bool;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Unmap_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Event_Window at 4 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Window_Id at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    From_Configure at 6 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	end record;

    type X_Map_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Event_Window : X_Configuration_Dependent.Long;
	    Window_Id : X_Configuration_Dependent.Long;
	    Override_Redirect : X_Configuration_Dependent.Bool;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Map_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Event_Window at 4 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Window_Id at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Override_Redirect at 6 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	end record;

    type X_Map_Request_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Parent : X_Configuration_Dependent.Long;
	    Window_Id : X_Configuration_Dependent.Long;
	    Word_06 : X_Configuration_Dependent.Long;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Map_Request_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Parent at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Reparent_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Event_Window : X_Configuration_Dependent.Long;
	    Window_Id : X_Configuration_Dependent.Long;
	    Parent : X_Configuration_Dependent.Long;
	    X : X_Configuration_Dependent.Int;
	    Y : X_Configuration_Dependent.Int;
	    Override_Redirect : X_Configuration_Dependent.Bool;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Reparent_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Event_Window at 4 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Window_Id at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Parent at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y at 8 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Override_Redirect at 9 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	end record;

    type X_Configure_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Event_Window : X_Configuration_Dependent.Long;
	    Window_Id : X_Configuration_Dependent.Long;
	    X : X_Configuration_Dependent.Int;
	    Y : X_Configuration_Dependent.Int;
	    Width : X_Configuration_Dependent.Int;
	    Height : X_Configuration_Dependent.Int;
	    Border_Width : X_Configuration_Dependent.Int;
	    Above : X_Configuration_Dependent.Long;
	    Override_Redirect : X_Configuration_Dependent.Bool;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Configure_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Event_Window at 4 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Window_Id at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Width at 8 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Height at 9 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Border_Width at 10 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Above at 11 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Override_Redirect at 12 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	end record;

    type X_Gravity_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Event_Window : X_Configuration_Dependent.Long;
	    Window_Id : X_Configuration_Dependent.Long;
	    X : X_Configuration_Dependent.Int;
	    Y : X_Configuration_Dependent.Int;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Gravity_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Event_Window at 4 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Window_Id at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Resize_Request_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    Width : X_Configuration_Dependent.Int;
	    Height : X_Configuration_Dependent.Int;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Resize_Request_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Width at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Height at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Configure_Request_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Parent : X_Configuration_Dependent.Long;
	    Window_Id : X_Configuration_Dependent.Long;
	    X : X_Configuration_Dependent.Int;
	    Y : X_Configuration_Dependent.Int;
	    Width : X_Configuration_Dependent.Int;
	    Height : X_Configuration_Dependent.Int;
	    Border_Width : X_Configuration_Dependent.Int;
	    Above : X_Configuration_Dependent.Long;
	    Detail : X_Configuration_Dependent.Int;
	    Value_Mask : X_Configuration_Dependent.Unsigned_Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Configure_Request_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Parent at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    X at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Y at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Width at 8 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Height at 9 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Border_Width at 10 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Above at 11 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Detail at 12 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Value_Mask at 13 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	end record;

    type X_Circulate_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Parent : X_Configuration_Dependent.Long;
	    Window_Id : X_Configuration_Dependent.Long;
	    Place : X_Configuration_Dependent.Int;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Circulate_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Parent at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Place at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Circulate_Request_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Parent : X_Configuration_Dependent.Long;
	    Window_Id : X_Configuration_Dependent.Long;
	    Place : X_Configuration_Dependent.Int;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Circulate_Request_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Parent at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Place at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Property_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    Atom_Id : X_Lib.Atoms.Atom;
	    Time_Stamp : X_Configuration_Dependent.Long;
	    State : X_Configuration_Dependent.Int;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Property_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Atom_Id at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Time_Stamp at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    State at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Selection_Clear_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Owner : X_Configuration_Dependent.Long;
	    Selection : X_Lib.Atoms.Atom;
	    Time_Stamp : X_Configuration_Dependent.Long;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Selection_Clear_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Owner at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Selection at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Time_Stamp at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Selection_Request_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Owner : X_Configuration_Dependent.Long;
	    Requestor : X_Configuration_Dependent.Long;
	    Selection : X_Lib.Atoms.Atom;
	    Target : X_Lib.Atoms.Atom;
	    Property : X_Lib.Atoms.Atom;
	    Time_Stamp : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Selection_Request_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Owner at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Requestor at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Selection at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Target at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Property at 8 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Time_Stamp at 9 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Selection_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Requestor : X_Configuration_Dependent.Long;
	    Selection : X_Lib.Atoms.Atom;
	    Target : X_Lib.Atoms.Atom;
	    Property : X_Lib.Atoms.Atom;
	    Time_Stamp : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Selection_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Requestor at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Selection at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Target at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Property at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Time_Stamp at 8 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Colormap_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    Colormap : X_Lib.Colors.Color_Map;
	    New_Map : X_Configuration_Dependent.Bool;
	    State : X_Configuration_Dependent.Int;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Colormap_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Colormap at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    New_Map at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    State at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Client_Message_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    Message_Type : X_Lib.Atoms.Atom;
	    Format : X_Configuration_Dependent.Int;
	    Data : X_Lib.Long_Array (1 .. 5);
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Client_Message_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Message_Type at 5 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Format at 6 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Data at 7 * X_Configuration_Dependent.Word_Size range 0 .. 159;
	end record;

    type X_Mapping_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    Request : X_Configuration_Dependent.Int;
	    First_Keycode : X_Configuration_Dependent.Int;
	    Count : X_Configuration_Dependent.Int;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Mapping_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Request at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    First_Keycode at 6 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Count at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Error_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Display_Id : X_Lib.Display;
	    Resource_Id : X_Lib.Window_Manager.Resource;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Error_Code : X_Configuration_Dependent.Unsigned_Char;
	    Request_Code : X_Configuration_Dependent.Unsigned_Char;
	    Minor_Code : X_Configuration_Dependent.Unsigned_Char;
	    Word_05 : X_Configuration_Dependent.Long;
	    Word_06 : X_Configuration_Dependent.Long;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Error_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Resource_Id at 2 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Serial at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Error_Code at 4 * X_Configuration_Dependent.Word_Size range 0 .. 7;
	    Request_Code at 4 * X_Configuration_Dependent.Word_Size
	       range 8 .. 15;
	    Minor_Code at 4 * X_Configuration_Dependent.Word_Size
	       range 16 .. 23;
	end record;

    type X_Any_Event_Record is
	record
	    Kind : X_Configuration_Dependent.Int;
	    Serial : X_Configuration_Dependent.Unsigned_Long;
	    Send_Event : X_Configuration_Dependent.Bool;
	    Display_Id : X_Lib.Display;
	    Window_Id : X_Configuration_Dependent.Long;
	    Word_05 : X_Configuration_Dependent.Long;
	    Word_06 : X_Configuration_Dependent.Long;
	    Word_07 : X_Configuration_Dependent.Long;
	    Word_08 : X_Configuration_Dependent.Long;
	    Word_09 : X_Configuration_Dependent.Long;
	    Word_10 : X_Configuration_Dependent.Long;
	    Word_11 : X_Configuration_Dependent.Long;
	    Word_12 : X_Configuration_Dependent.Long;
	    Word_13 : X_Configuration_Dependent.Long;
	    Word_14 : X_Configuration_Dependent.Long;
	    Word_15 : X_Configuration_Dependent.Long;
	    Word_16 : X_Configuration_Dependent.Long;
	    Word_17 : X_Configuration_Dependent.Long;
	    Word_18 : X_Configuration_Dependent.Long;
	    Word_19 : X_Configuration_Dependent.Long;
	    Word_20 : X_Configuration_Dependent.Long;
	    Word_21 : X_Configuration_Dependent.Long;
	    Word_22 : X_Configuration_Dependent.Long;
	    Word_23 : X_Configuration_Dependent.Long;
	end record;

    for X_Any_Event_Record use
	record
	    Kind at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Serial at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Send_Event at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Display_Id at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Window_Id at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type X_Key_Event is access X_Key_Event_Record;
    type X_Button_Event is access X_Button_Event_Record;
    type X_Motion_Event is access X_Motion_Event_Record;
    type X_Crossing_Event is access X_Crossing_Event_Record;
    type X_Focus_Change_Event is access X_Focus_Change_Event_Record;
    type X_Keymap_Event is access X_Keymap_Event_Record;
    type X_Expose_Event is access X_Expose_Event_Record;
    type X_Graphics_Expose_Event is access X_Graphics_Expose_Event_Record;
    type X_No_Expose_Event is access X_No_Expose_Event_Record;
    type X_Visibility_Event is access X_Visibility_Event_Record;
    type X_Create_Window_Event is access X_Create_Window_Event_Record;
    type X_Destroy_Window_Event is access X_Destroy_Window_Event_Record;
    type X_Unmap_Event is access X_Unmap_Event_Record;
    type X_Map_Event is access X_Map_Event_Record;
    type X_Map_Request_Event is access X_Map_Request_Event_Record;
    type X_Reparent_Event is access X_Reparent_Event_Record;
    type X_Configure_Event is access X_Configure_Event_Record;
    type X_Gravity_Event is access X_Gravity_Event_Record;
    type X_Resize_Request_Event is access X_Resize_Request_Event_Record;
    type X_Configure_Request_Event is access X_Configure_Request_Event_Record;
    type X_Circulate_Event is access X_Circulate_Event_Record;
    type X_Circulate_Request_Event is access X_Circulate_Request_Event_Record;
    type X_Property_Event is access X_Property_Event_Record;
    type X_Selection_Clear_Event is access X_Selection_Clear_Event_Record;
    type X_Selection_Request_Event is access X_Selection_Request_Event_Record;
    type X_Selection_Event is access X_Selection_Event_Record;
    type X_Colormap_Event is access X_Colormap_Event_Record;
    type X_Client_Message_Event is access X_Client_Message_Event_Record;
    type X_Mapping_Event is access X_Mapping_Event_Record;
    type X_Error_Event is access X_Error_Event_Record;
    type X_Any_Event is access X_Any_Event_Record;

    type X_Event is access X_Crossing_Event_Record;

    Null_Event : constant X_Event := null;
    Null_X_Crossing_Event : constant X_Crossing_Event := null;

    function To_X_Key_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Key_Event);
    function To_X_Event is new Unchecked_Conversion
				  (Source => X_Key_Event, Target => X_Event);

    function To_X_Button_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Button_Event);
    function To_X_Event is new Unchecked_Conversion
				  (Source => X_Button_Event, Target => X_Event);

    function To_X_Motion_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Motion_Event);
    function To_X_Event is new Unchecked_Conversion
				  (Source => X_Motion_Event, Target => X_Event);

    function To_X_Crossing_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Crossing_Event);
    function To_X_Event is
       new Unchecked_Conversion (Source => X_Crossing_Event, Target => X_Event);

    function To_X_Focus_Change_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Focus_Change_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Focus_Change_Event, Target => X_Event);

    function To_X_Keymap_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Keymap_Event);
    function To_X_Event is new Unchecked_Conversion
				  (Source => X_Keymap_Event, Target => X_Event);

    function To_X_Expose_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Expose_Event);
    function To_X_Event is new Unchecked_Conversion
				  (Source => X_Expose_Event, Target => X_Event);

    function To_X_Graphics_Expose_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Graphics_Expose_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Graphics_Expose_Event, Target => X_Event);

    function To_X_No_Expose_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_No_Expose_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_No_Expose_Event, Target => X_Event);

    function To_X_Visibility_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Visibility_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Visibility_Event, Target => X_Event);

    function To_X_Create_Window_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Create_Window_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Create_Window_Event, Target => X_Event);

    function To_X_Destroy_Window_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Destroy_Window_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Destroy_Window_Event, Target => X_Event);

    function To_X_Unmap_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Unmap_Event);
    function To_X_Event is new Unchecked_Conversion
				  (Source => X_Unmap_Event, Target => X_Event);

    function To_X_Map_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Map_Event);
    function To_X_Event is new Unchecked_Conversion
				  (Source => X_Map_Event, Target => X_Event);

    function To_X_Map_Request_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Map_Request_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Map_Request_Event, Target => X_Event);

    function To_X_Reparent_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Reparent_Event);
    function To_X_Event is
       new Unchecked_Conversion (Source => X_Reparent_Event, Target => X_Event);

    function To_X_Configure_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Configure_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Configure_Event, Target => X_Event);

    function To_X_Gravity_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Gravity_Event);
    function To_X_Event is
       new Unchecked_Conversion (Source => X_Gravity_Event, Target => X_Event);

    function To_X_Resize_Request_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Resize_Request_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Resize_Request_Event, Target => X_Event);

    function To_X_Configure_Request_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Configure_Request_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Configure_Request_Event, Target => X_Event);

    function To_X_Circulate_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Circulate_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Circulate_Event, Target => X_Event);

    function To_X_Circulate_Request_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Circulate_Request_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Circulate_Request_Event, Target => X_Event);

    function To_X_Property_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Property_Event);
    function To_X_Event is
       new Unchecked_Conversion (Source => X_Property_Event, Target => X_Event);

    function To_X_Selection_Clear_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Selection_Clear_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Selection_Clear_Event, Target => X_Event);

    function To_X_Selection_Request_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Selection_Request_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Selection_Request_Event, Target => X_Event);

    function To_X_Selection_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Selection_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Selection_Event, Target => X_Event);

    function To_X_Colormap_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Colormap_Event);
    function To_X_Event is
       new Unchecked_Conversion (Source => X_Colormap_Event, Target => X_Event);

    function To_X_Client_Message_Event is
       new Unchecked_Conversion (Source => X_Event,
				 Target => X_Client_Message_Event);
    function To_X_Event is
       new Unchecked_Conversion
	      (Source => X_Client_Message_Event, Target => X_Event);

    function To_X_Mapping_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Mapping_Event);
    function To_X_Event is
       new Unchecked_Conversion (Source => X_Mapping_Event, Target => X_Event);

    function To_X_Error_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Error_Event);
    function To_X_Event is new Unchecked_Conversion
				  (Source => X_Error_Event, Target => X_Event);

    function To_X_Any_Event is
       new Unchecked_Conversion (Source => X_Event, Target => X_Any_Event);
    function To_X_Event is new Unchecked_Conversion
				  (Source => X_Any_Event, Target => X_Event);
    function Set_Event (Untyped_Event_Record : in X_Crossing_Event_Record)
		       return Event_Record;

    function Set_X_Event (The_Event : in Event_Record)
			 return X_Crossing_Event_Record;

    function To_Int is new Unchecked_Conversion
			      (Source => X_Mask_Type,
			       Target => X_Configuration_Dependent.Int);
    function Set_Keyboard_Vector (Vector_Mask : in X_Lib.Char_Array)
				 return Keyboard.Key_Vector_Mask_Type;
    function Set_Keyboard_Vector (Key_Vector : in Keyboard.Key_Vector_Mask_Type)
				 return X_Lib.Char_Array;

    function Address_Of (Display_Id : in Display) return System.Address;

    function To_Ada_Boolean
		(I : in X_Configuration_Dependent.Bool) return Boolean;

    function To_Ada_Window
		(W : in X_Configuration_Dependent.Long) return Window;
end X_Event_Utilities;
