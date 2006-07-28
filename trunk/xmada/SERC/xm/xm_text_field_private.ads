-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xt_Core_Private,
     Xm, Xm_Private, Xm_Text_Field, Xm_Text_Private;

package Xm_Text_Field_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";
    Word_Size : constant := X_Configuration_Dependent.Word_Size;
    -- Defines for different cursors
    Ibeam_Width : constant := 3;
    Caret_Width : constant := 9;
    Caret_Height : constant := 5;

    Caret_Bits : X_Lib.Bits :=
       new X_Lib.Bit_Array'(16#10#, 16#00#, 16#38#, 16#00#, 16#6C#,
			    16#00#, 16#C6#, 16#00#, 16#83#, 16#01#);

    -- Here is the Text Field Widget class structure.
    type Xm_Text_Field_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Text_Field_Class_Part use
	record
	    Extension at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Text_Field_Class_Part_Size : constant := 32;
    Xm_Text_Field_Class_Rec_Size : constant :=
       Xm_Private.Xm_Primitive_Class_Rec_Size +
	  Xm_Text_Private.Xm_Text_Class_Part_Size;

    type Xm_Text_Field_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Primitive_Class : Xm_Private.Xm_Primitive_Class_Part;
	    Text_Class : Xm_Text_Field_Class_Part;
	end record;

    for Xm_Text_Field_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Primitive_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xm_Private.Xm_Primitive_Class_Rec_Size - 1;
	    Text_Class at 0 range Xm_Private.Xm_Primitive_Class_Rec_Size ..
				     Xm_Text_Field_Class_Rec_Size - 1;
	end record;

    -- Here is the Text Field Widget instance structures.
    type Xm_Text_Field_Part is
	record
	    Activate_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Focus_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Losing_Focus_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Modify_Verify_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Wcs_Modify_Verify_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Motion_Verify_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Gain_Primary_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Lose_Primary_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Value_Changed_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Value : Xm.Xm_String;
	    Wc_Value : X_Lib.Wide_Character_Pointer;
	    Font_List : Xm.Xm_Font_List;
	    Font : X_Lib.Fonts.Font_Record_Pointer;
	    Selection_Array : Xm.Xm_Text_Scan_Type_Ptr;
	    Highlight : Xm_Private.Xm_Highlight_Data;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Image_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Save_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Ibeam_Off : X_Lib.Pixmap;
	    Add_Mode_Cursor : X_Lib.Pixmap;
	    Cursor : X_Lib.Pixmap;
	    Putback : X_Lib.Pixmap;
	    Stipple_Tile : X_Lib.Pixmap;
	    Image_Clip : X_Lib.Pixmap;
	    Cursor_Position : Xm.Xm_Text_Position;
	    New_H_Offset : Xm.Xm_Text_Position;
	    H_Offset : Xm.Xm_Text_Position;
	    Orig_Left : Xm.Xm_Text_Position;
	    Orig_Right : Xm.Xm_Text_Position;
	    Prim_Pos_Left : Xm.Xm_Text_Position;
	    Prim_Pos_Right : Xm.Xm_Text_Position;
	    Prim_Anchor : Xm.Xm_Text_Position;
	    Sec_Pos_Left : Xm.Xm_Text_Position;
	    Sec_Pos_Right : Xm.Xm_Text_Position;
	    Sec_Anchor : Xm.Xm_Text_Position;
	    Stuff_Pos : Xm.Xm_Text_Position;
	    Select_Pos_X : Xt.Position;
	    Prim_Time : X_Lib.Time;
	    Dest_Time : X_Lib.Time;
	    Sec_Time : X_Lib.Time;
	    Last_Time : X_Lib.Time;
	    Timer_Id : Xt.Xt_Interval_Id;
	    Select_Id : Xt.Xt_Interval_Id;
	    Blink_Rate : X_Configuration_Dependent.Int;
	    Selection_Array_Count : X_Configuration_Dependent.Int;
	    Threshold : X_Configuration_Dependent.Int;
	    Size_Allocd : X_Configuration_Dependent.Int;
	    String_Length : X_Configuration_Dependent.Int;
	    Cursor_Height : X_Configuration_Dependent.Int;
	    Cursor_Width : X_Configuration_Dependent.Int;
	    Sarray_Index : X_Configuration_Dependent.Int;
	    Max_Length : X_Configuration_Dependent.Int;
	    Max_Char_Size : X_Configuration_Dependent.Int;
	    Columns : X_Configuration_Dependent.Short;
	    Margin_Width : Xt.Dimension;
	    Margin_Height : Xt.Dimension;
	    Average_Char_Width : Xt.Dimension;
	    Margin_Top : Xt.Dimension;
	    Margin_Bottom : Xt.Dimension;
	    Font_Ascent : Xt.Dimension;
	    Font_Descent : Xt.Dimension;
	    Resize_Width : Xm.Xm_Boolean;
	    Pending_Delete : Xm.Xm_Boolean;
	    Editable : Xm.Xm_Boolean;
	    Verify_Bell : Xm.Xm_Boolean;
	    Cursor_Position_Visible : Xm.Xm_Boolean;
	    Traversed : Xm.Xm_Boolean;
	    Add_Mode : Xm.Xm_Boolean;
	    Has_Focus : Xm.Xm_Boolean;
	    Blink_On : Xm.Xm_Boolean;
	    Cursor_On : X_Configuration_Dependent.Short;
	    Refresh_Ibeam_Off : Xm.Xm_Boolean;
	    Have_Inverted_Image_Gc : Xm.Xm_Boolean;
	    Has_Primary : Xm.Xm_Boolean;
	    Has_Secondary : Xm.Xm_Boolean;
	    Has_Destination : Xm.Xm_Boolean;
	    Sec_Drag : Xm.Xm_Boolean;
	    Selection_Move : Xm.Xm_Boolean;
	    Pending_Off : Xm.Xm_Boolean;
	    Fontlist_Created : Xm.Xm_Boolean;
	    Has_Rect : Xm.Xm_Boolean;
	    Do_Drop : Xm.Xm_Boolean;
	    Cancel : Xm.Xm_Boolean;
	    Extending : Xm.Xm_Boolean;
	    Sec_Extending : Xm.Xm_Boolean;
	    Changed_Visible : Xm.Xm_Boolean;
	    Have_Fontset : Xm.Xm_Boolean;
	    In_Setvalues : Xm.Xm_Boolean;
	    Do_Resize : Xm.Xm_Boolean;
	    Redisplay : Xm.Xm_Boolean;
	    Overstrike : Xm.Xm_Boolean;
	    Sel_Start : Xm.Xm_Boolean;
	    Extension : Xt.Xt_Pointer;
	end record;
    for Xm_Text_Field_Part use
	record
	    Activate_Callback at 0 * Word_Size range 0 .. 31;
	    Focus_Callback at 1 * Word_Size range 0 .. 31;
	    Losing_Focus_Callback at 2 * Word_Size range 0 .. 31;
	    Modify_Verify_Callback at 3 * Word_Size range 0 .. 31;
	    Wcs_Modify_Verify_Callback at 4 * Word_Size range 0 .. 31;
	    Motion_Verify_Callback at 5 * Word_Size range 0 .. 31;
	    Gain_Primary_Callback at 6 * Word_Size range 0 .. 31;
	    Lose_Primary_Callback at 7 * Word_Size range 0 .. 31;
	    Value_Changed_Callback at 8 * Word_Size range 0 .. 31;
	    Value at 9 * Word_Size range 0 .. 31;
	    Wc_Value at 10 * Word_Size range 0 .. 31;
	    Font_List at 11 * Word_Size range 0 .. 31;
	    Font at 12 * Word_Size range 0 .. 31;
	    Selection_Array at 13 * Word_Size range 0 .. 31;
	    Highlight at 14 * Word_Size range 0 .. 3 * 32 - 1;
	    Gc at 17 * Word_Size range 0 .. 31;
	    Image_Gc at 18 * Word_Size range 0 .. 31;
	    Save_Gc at 19 * Word_Size range 0 .. 31;
	    Ibeam_Off at 20 * Word_Size range 0 .. 31;
	    Add_Mode_Cursor at 21 * Word_Size range 0 .. 31;
	    Cursor at 22 * Word_Size range 0 .. 31;
	    Putback at 23 * Word_Size range 0 .. 31;
	    Stipple_Tile at 24 * Word_Size range 0 .. 31;
	    Image_Clip at 25 * Word_Size range 0 .. 31;
	    Cursor_Position at 26 * Word_Size range 0 .. 31;
	    New_H_Offset at 27 * Word_Size range 0 .. 31;
	    H_Offset at 28 * Word_Size range 0 .. 31;
	    Orig_Left at 29 * Word_Size range 0 .. 31;
	    Orig_Right at 30 * Word_Size range 0 .. 31;
	    Prim_Pos_Left at 31 * Word_Size range 0 .. 31;
	    Prim_Pos_Right at 32 * Word_Size range 0 .. 31;
	    Prim_Anchor at 33 * Word_Size range 0 .. 31;
	    Sec_Pos_Left at 34 * Word_Size range 0 .. 31;
	    Sec_Pos_Right at 35 * Word_Size range 0 .. 31;
	    Sec_Anchor at 36 * Word_Size range 0 .. 31;
	    Stuff_Pos at 37 * Word_Size range 0 .. 31;
	    Select_Pos_X at 38 * Word_Size range 0 .. 15;
	    Prim_Time at 39 * Word_Size range 0 .. 31;
	    Dest_Time at 40 * Word_Size range 0 .. 31;
	    Sec_Time at 41 * Word_Size range 0 .. 31;
	    Last_Time at 42 * Word_Size range 0 .. 31;
	    Timer_Id at 43 * Word_Size range 0 .. 31;
	    Select_Id at 44 * Word_Size range 0 .. 31;
	    Blink_Rate at 45 * Word_Size range 0 .. 31;
	    Selection_Array_Count at 46 * Word_Size range 0 .. 31;
	    Threshold at 47 * Word_Size range 0 .. 31;
	    Size_Allocd at 48 * Word_Size range 0 .. 31;
	    String_Length at 49 * Word_Size range 0 .. 31;
	    Cursor_Height at 50 * Word_Size range 0 .. 31;
	    Cursor_Width at 51 * Word_Size range 0 .. 31;
	    Sarray_Index at 52 * Word_Size range 0 .. 31;
	    Max_Length at 53 * Word_Size range 0 .. 31;
	    Max_Char_Size at 54 * Word_Size range 0 .. 31;
	    Columns at 55 * Word_Size range 0 .. 15;
	    Margin_Width at 55 * Word_Size + 2 range 0 .. 15;
	    Margin_Height at 56 * Word_Size range 0 .. 15;
	    Average_Char_Width at 56 * Word_Size + 2 range 0 .. 15;
	    Margin_Top at 57 * Word_Size range 0 .. 15;
	    Margin_Bottom at 57 * Word_Size + 2 range 0 .. 15;
	    Font_Ascent at 58 * Word_Size range 0 .. 15;
	    Font_Descent at 58 * Word_Size + 2 range 0 .. 15;
	    Resize_Width at 59 * Word_Size range 0 .. 7;
	    Pending_Delete at 59 * Word_Size + 1 range 0 .. 7;
	    Editable at 59 * Word_Size + 2 range 0 .. 7;
	    Verify_Bell at 59 * Word_Size + 3 range 0 .. 7;
	    Cursor_Position_Visible at 60 * Word_Size range 0 .. 7;
	    Traversed at 60 * Word_Size + 1 range 0 .. 7;
	    Add_Mode at 60 * Word_Size + 2 range 0 .. 7;
	    Has_Focus at 60 * Word_Size + 3 range 0 .. 7;
	    Blink_On at 61 * Word_Size range 0 .. 7;
	    Cursor_On at 61 * Word_Size + 2 range 0 .. 15;
	    Refresh_Ibeam_Off at 62 * Word_Size range 0 .. 7;
	    Have_Inverted_Image_Gc at 62 * Word_Size + 1 range 0 .. 7;
	    Has_Primary at 62 * Word_Size + 2 range 0 .. 7;
	    Has_Secondary at 62 * Word_Size + 3 range 0 .. 7;
	    Has_Destination at 63 * Word_Size range 0 .. 7;
	    Sec_Drag at 63 * Word_Size + 1 range 0 .. 7;
	    Selection_Move at 63 * Word_Size + 2 range 0 .. 7;
	    Pending_Off at 63 * Word_Size + 3 range 0 .. 7;
	    Fontlist_Created at 64 * Word_Size range 0 .. 7;
	    Has_Rect at 64 * Word_Size + 1 range 0 .. 7;
	    Do_Drop at 64 * Word_Size + 2 range 0 .. 7;
	    Cancel at 64 * Word_Size + 3 range 0 .. 7;
	    Extending at 65 * Word_Size range 0 .. 7;
	    Sec_Extending at 65 * Word_Size + 1 range 0 .. 7;
	    Changed_Visible at 65 * Word_Size + 2 range 0 .. 7;
	    Have_Fontset at 65 * Word_Size + 3 range 0 .. 7;
	    In_Setvalues at 66 * Word_Size range 0 .. 7;
	    Do_Resize at 66 * Word_Size + 1 range 0 .. 7;
	    Redisplay at 66 * Word_Size + 2 range 0 .. 7;
	    Overstrike at 66 * Word_Size + 3 range 0 .. 7;
	    Sel_Start at 67 * Word_Size range 0 .. 7;
	    Extension at 68 * Word_Size range 0 .. 31;
	end record;

    Xm_Text_Field_Part_Size : constant := 69 * 32;
    Xm_Text_Field_Rec_Size : constant :=
       Xm_Private.Xm_Primitive_Rec_Size + Xm_Text_Field_Part_Size;

    type Xm_Text_Field_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Primitive : Xm_Private.Xm_Primitive_Part;
	    Text : Xm_Text_Field_Part;
	end record;

    for Xm_Text_Field_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Primitive at 0 range Xt_Core_Private.Core_Part_Size ..
				    Xm_Private.Xm_Primitive_Rec_Size - 1;
	    Text at 0 range Xm_Private.Xm_Primitive_Rec_Size ..
			       Xm_Text_Field_Rec_Size - 1;
	end record;

    type Xm_Text_Field_Class_Rec_Ptr is access Xm_Text_Field_Class_Rec;
    type Xm_Text_Field_Rec_Ptr is access Xm_Text_Field_Rec;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Text_Field_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Text_Field_Class (X : in Xt.Widget_Class)
				    return Xm_Text_Field_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Text_Field_Rec_Ptr) return Xt.Widget;

    function To_Xm_Text_Field (X : in Xt.Widget) return Xm_Text_Field_Rec_Ptr;
end Xm_Text_Field_Private;

------ COPYRIGHT AND DISTRIBUTION NOTICE ----------
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
