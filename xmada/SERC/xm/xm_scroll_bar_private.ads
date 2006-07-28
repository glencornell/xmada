-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with Xt, X_Lib, X_Configuration_Dependent, Xm,
     Xm_Private, Xt_Core_Private, Unchecked_Conversion;

package Xm_Scroll_Bar_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    Min_Slider_Thickness : constant := 1;
    Min_Slider_Length : constant := 6;

    type Xm_Scroll_Bar_Class_Part is
	record
	    Foo : X_Configuration_Dependent.Int;
	end record;

    for Xm_Scroll_Bar_Class_Part use
	record
	    Foo at 0 range 0 .. 31;
	end record;

    Xm_Scroll_Bar_Class_Part_Size : constant := 32;
    Xm_Scroll_Bar_Class_Rec_Size : constant :=
       Xm_Private.Xm_Primitive_Class_Rec_Size + Xm_Scroll_Bar_Class_Part_Size;

    type Xm_Scroll_Bar_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Primitive_Class : Xm_Private.Xm_Primitive_Class_Part;
	    Scroll_Bar_Class : Xm_Scroll_Bar_Class_Part;
	end record;

    for Xm_Scroll_Bar_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Primitive_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xm_Private.Xm_Primitive_Class_Rec_Size - 1;
	    Scroll_Bar_Class at 0
	       range Xm_Private.Xm_Primitive_Class_Rec_Size ..
			Xm_Scroll_Bar_Class_Rec_Size - 1;
	end record;

    type Xm_Scroll_Bar_Part is
	record
	    Value : X_Configuration_Dependent.Int;
	    Minimum : X_Configuration_Dependent.Int;
	    Maximum : X_Configuration_Dependent.Int;
	    Slider_Size : X_Configuration_Dependent.Int;
	    Orientation : X_Configuration_Dependent.Unsigned_Char;
	    Processing_Direction : X_Configuration_Dependent.Unsigned_Char;
	    Show_Arrows : Xm.Xm_Boolean;
	    Increment : X_Configuration_Dependent.Int;
	    Page_Increment : X_Configuration_Dependent.Int;
	    Initial_Delay : X_Configuration_Dependent.Int;
	    Repeat_Delay : X_Configuration_Dependent.Int;
	    Value_Changed_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Increment_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Decrement_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Page_Increment_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Page_Decrement_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    To_Top_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    To_Bottom_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Drag_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Unhighlight_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Foreground_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Trough_Color : X_Lib.Pixel;
	    Pixmap : X_Lib.Drawable;
	    Sliding_On : Xm.Xm_Boolean;
	    Etched_Slider : Xm.Xm_Boolean;
	    Saved_Value : X_Configuration_Dependent.Int;
	    Flags : X_Configuration_Dependent.Unsigned_Char;
	    Change_Type : X_Configuration_Dependent.Unsigned_Char;
	    Timer : Xt.Xt_Interval_Id;
	    Initial_X : X_Configuration_Dependent.Short;
	    Initial_Y : X_Configuration_Dependent.Short;
	    Separation_X : X_Configuration_Dependent.Short;
	    Separation_Y : X_Configuration_Dependent.Short;
	    Slider_X : X_Configuration_Dependent.Short;
	    Slider_Y : X_Configuration_Dependent.Short;
	    Slider_Width : X_Configuration_Dependent.Short;
	    Slider_Height : X_Configuration_Dependent.Short;
	    Slider_Area_X : X_Configuration_Dependent.Short;
	    Slider_Area_Y : X_Configuration_Dependent.Short;
	    Slider_Area_Width : X_Configuration_Dependent.Short;
	    Slider_Area_Height : X_Configuration_Dependent.Short;
	    Arrow1_X : X_Configuration_Dependent.Short;
	    Arrow1_Y : X_Configuration_Dependent.Short;
	    Arrow1_Orientation : X_Configuration_Dependent.Unsigned_Char;
	    Arrow1_Selected : Xm.Xm_Boolean;
	    Arrow2_X : X_Configuration_Dependent.Short;
	    Arrow2_Y : X_Configuration_Dependent.Short;
	    Arrow2_Orientation : X_Configuration_Dependent.Unsigned_Char;
	    Arrow2_Selected : Xm.Xm_Boolean;
	    Arrow_Width : X_Configuration_Dependent.Short;
	    Arrow_Height : X_Configuration_Dependent.Short;
	    Arrow1_Top_Count : X_Configuration_Dependent.Short;
	    Arrow1_Cent_Count : X_Configuration_Dependent.Short;
	    Arrow1_Bot_Count : X_Configuration_Dependent.Short;
	    Arrow1_Top : X_Lib.Rectangle_Ptr;
	    Arrow1_Cent : X_Lib.Rectangle_Ptr;
	    Arrow1_Bot : X_Lib.Rectangle_Ptr;
	    Arrow2_Top_Count : X_Configuration_Dependent.Short;
	    Arrow2_Cent_Count : X_Configuration_Dependent.Short;
	    Arrow2_Bot_Count : X_Configuration_Dependent.Short;
	    Arrow2_Top : X_Lib.Rectangle_Ptr;
	    Arrow2_Cent : X_Lib.Rectangle_Ptr;
	    Arrow2_Bot : X_Lib.Rectangle_Ptr;
	    Unavailable_Gc : X_Lib.Graphic_Output.Graphic_Context;
	end record;
    for Xm_Scroll_Bar_Part use
	record
	    Value at 0 * Word_Size range 0 .. 31;
	    Minimum at 1 * Word_Size range 0 .. 31;
	    Maximum at 2 * Word_Size range 0 .. 31;
	    Slider_Size at 3 * Word_Size range 0 .. 31;
	    Orientation at 4 * Word_Size + 0 range 0 .. 7;
	    Processing_Direction at 4 * Word_Size + 1 range 0 .. 7;
	    Show_Arrows at 4 * Word_Size + 2 range 0 .. 7;
	    Increment at 5 * Word_Size range 0 .. 31;
	    Page_Increment at 6 * Word_Size range 0 .. 31;
	    Initial_Delay at 7 * Word_Size range 0 .. 31;
	    Repeat_Delay at 8 * Word_Size range 0 .. 31;
	    Value_Changed_Callback at 9 * Word_Size range 0 .. 31;
	    Increment_Callback at 10 * Word_Size range 0 .. 31;
	    Decrement_Callback at 11 * Word_Size range 0 .. 31;
	    Page_Increment_Callback at 12 * Word_Size range 0 .. 31;
	    Page_Decrement_Callback at 13 * Word_Size range 0 .. 31;
	    To_Top_Callback at 14 * Word_Size range 0 .. 31;
	    To_Bottom_Callback at 15 * Word_Size range 0 .. 31;
	    Drag_Callback at 16 * Word_Size range 0 .. 31;
	    Unhighlight_Gc at 17 * Word_Size range 0 .. 31;
	    Foreground_Gc at 18 * Word_Size range 0 .. 31;
	    Trough_Color at 19 * Word_Size range 0 .. 31;
	    Pixmap at 20 * Word_Size range 0 .. 31;
	    Sliding_On at 21 * Word_Size + 0 range 0 .. 7;
	    Etched_Slider at 21 * Word_Size + 1 range 0 .. 7;
	    Saved_Value at 22 * Word_Size range 0 .. 31;
	    Flags at 23 * Word_Size + 0 range 0 .. 7;
	    Change_Type at 23 * Word_Size + 1 range 0 .. 7;
	    Timer at 24 * Word_Size range 0 .. 31;
	    Initial_X at 25 * Word_Size range 0 .. 15;
	    Initial_Y at 25 * Word_Size + 2 range 0 .. 15;
	    Separation_X at 26 * Word_Size range 0 .. 15;
	    Separation_Y at 26 * Word_Size + 2 range 0 .. 15;
	    Slider_X at 27 * Word_Size range 0 .. 15;
	    Slider_Y at 27 * Word_Size + 2 range 0 .. 15;
	    Slider_Width at 28 * Word_Size range 0 .. 15;
	    Slider_Height at 28 * Word_Size + 2 range 0 .. 15;
	    Slider_Area_X at 29 * Word_Size range 0 .. 15;
	    Slider_Area_Y at 29 * Word_Size + 2 range 0 .. 15;
	    Slider_Area_Width at 30 * Word_Size range 0 .. 15;
	    Slider_Area_Height at 30 * Word_Size + 2 range 0 .. 15;
	    Arrow1_X at 31 * Word_Size range 0 .. 15;
	    Arrow1_Y at 31 * Word_Size + 2 range 0 .. 15;
	    Arrow1_Orientation at 32 * Word_Size + 0 range 0 .. 7;
	    Arrow1_Selected at 32 * Word_Size + 1 range 0 .. 7;
	    Arrow2_X at 32 * Word_Size + 2 range 0 .. 15;
	    Arrow2_Y at 33 * Word_Size range 0 .. 15;
	    Arrow2_Orientation at 33 * Word_Size + 2 range 0 .. 7;
	    Arrow2_Selected at 33 * Word_Size + 3 range 0 .. 7;
	    Arrow_Width at 34 * Word_Size range 0 .. 15;
	    Arrow_Height at 34 * Word_Size + 2 range 0 .. 15;
	    Arrow1_Top_Count at 35 * Word_Size range 0 .. 15;
	    Arrow1_Cent_Count at 35 * Word_Size + 2 range 0 .. 15;
	    Arrow1_Bot_Count at 36 * Word_Size range 0 .. 15;
	    Arrow1_Top at 37 * Word_Size range 0 .. 31;
	    Arrow1_Cent at 38 * Word_Size range 0 .. 31;
	    Arrow1_Bot at 39 * Word_Size range 0 .. 31;
	    Arrow2_Top_Count at 40 * Word_Size range 0 .. 15;
	    Arrow2_Cent_Count at 40 * Word_Size + 2 range 0 .. 15;
	    Arrow2_Bot_Count at 41 * Word_Size range 0 .. 15;
	    Arrow2_Top at 42 * Word_Size range 0 .. 31;
	    Arrow2_Cent at 43 * Word_Size range 0 .. 31;
	    Arrow2_Bot at 44 * Word_Size range 0 .. 31;
	    Unavailable_Gc at 45 * Word_Size range 0 .. 31;
	end record;

    Xm_Scroll_Bar_Part_Size : constant := 32 * 46;
    Xm_Scroll_Bar_Rec_Size : constant :=
       Xm_Private.Xm_Primitive_Rec_Size + Xm_Scroll_Bar_Part_Size;

    type Xm_Scroll_Bar_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Primitive : Xm_Private.Xm_Primitive_Part;
	    Scroll_Bar : Xm_Scroll_Bar_Part;
	end record;

    for Xm_Scroll_Bar_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Primitive at 0 range Xt_Core_Private.Core_Part_Size ..
				    Xm_Private.Xm_Primitive_Rec_Size - 1;
	    Scroll_Bar at 0 range Xm_Private.Xm_Primitive_Rec_Size ..
				     Xm_Scroll_Bar_Rec_Size - 1;
	end record;

    type Xm_Scroll_Bar_Class_Rec_Ptr is access Xm_Scroll_Bar_Class_Rec;
    type Xm_Scroll_Bar_Rec_Ptr is access Xm_Scroll_Bar_Rec;

    function To_Widget_Class
		(X : in Xm_Scroll_Bar_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Scroll_Bar_Class (X : in Xt.Widget_Class)
				    return Xm_Scroll_Bar_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Scroll_Bar_Rec_Ptr) return Xt.Widget;

    function To_Xm_Scroll_Bar (X : in Xt.Widget) return Xm_Scroll_Bar_Rec_Ptr;

end Xm_Scroll_Bar_Private;

------ Copyright AND DISTRIBUTION NOTICE ----------
--
-- (C) Copyright 1991, 1993 Systems Engineering Research Corporation
-- All Rights Reserved
--
-- This notice must be included in all copies of this software.
--
-- THIS SOFTWARE AND MANUAL ARE BOTH PROTECTED BY U.S. COPYRIGHT
-- LAW (TITLE 17 UNITED STATES CODE).  UNAUTHORIZED REPRODUCTION
-- AND/OR SALES MAY RESULT IN IMPRISIONMENT OF UP TO ONE YEAR AND
-- FINES OF UP TO $10,000 (17 USC 506).  COPYRIGHT INFRINGERS MAY
-- ALSO BE SUBJECT TO CIVIL LIABILITY.
--
-- THIS PROGRAM IS AN UNPUBLISHED WORK FULLY PROTECTED BY THE
-- UNITED STATES COPYRIGHT LAWS AND IS CONSIDERED A TRADE SECRET
-- BELONGING TO THE COPYRIGHT HOLDER.
--
-- Use of this software is restricted to those individuals and/or
-- organizations who have acquired a license from Systems Engineering
-- Research Corporation for a particular machine or set of machines.
-- No copying, use, or distribution of this software from or to an unlicensed
-- machine is allowed without the prior written consent of Systems
-- Engineering Research Corporation.
--
-- The SOFTWARE and documentation are provided with RESTRICTED RIGHTS.  Use,
-- duplication, or disclosure by the Government is subject to the restrictions
-- as set forth in subparagraph (c)(1)(ii) of The Rights in Technical Data
-- and Computer Software clause at 52.227-7013.  Contractor/manufacturer is
-- Systems Engineering Research Corporation/2555 Charleston Road/
-- Mountain View, CA 94043 1-800-Ada-SERC.
--
------- DISCLAIMER -------
--
-- This software and its documentation are provided "AS IS" and
-- without any expressed or implied warranties whatsoever.
-- No warranties as to performance, merchantability, or fitness
-- for a particular purpose exist.
--
-- Because of the diversity of conditions and hardware under
-- which this software may be used, no warranty of fitness for
-- a particular purpose is offered.  The user is advised to
-- test the software thoroughly before relying on it.  The user
-- must assume the entire risk and liability of using this
-- software.
--
-- In no event shall Systems Engineering Research Corporation and its
-- personnel be held responsible for any direct, indirect, consequential
-- or inconsequential damages or lost profits.
