-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm, Xm_Private,
     Xt_Core_Private, Xm_Text_String_Source_Private,
     Xm_Text_Out_Private, Xm_Text_In_Private, Unchecked_Conversion;

package Xm_Text_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    Maxint : constant := 2147483647;

    Nodelta : constant := Maxint;

    Textwidgetclass : constant String := "Text" & Ascii.Nul;

    function Get_Src (W : Xm.Xt_Widget) return Xm_Text_String_Source_Private.
					       Xm_Text_Source_Rec_Ptr;

    type Xm_Text_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Text_Class_Part use
	record
	    Extension at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Text_Class_Part_Size : constant := 32;
    Xm_Text_Class_Rec_Size : constant :=
       Xm_Private.Xm_Primitive_Class_Rec_Size + Xm_Text_Class_Part_Size;

    type Xm_Text_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Primitive_Class : Xm_Private.Xm_Primitive_Class_Part;
	    Text_Class : Xm_Text_Class_Part;
	end record;

    for Xm_Text_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Primitive_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xm_Private.Xm_Primitive_Class_Rec_Size - 1;
	    Text_Class at 0 range Xm_Private.Xm_Primitive_Class_Rec_Size ..
				     Xm_Text_Class_Rec_Size - 1;
	end record;

    type Line_Rec is
	record
	    Start : Xm.Xm_Text_Position;
	    Changed : Xm.Xm_Boolean;
	    Changed_Position : Xm.Xm_Text_Position;
	    Past_End : Xm.Xm_Boolean;
	    Extra : Xm_Text_Out_Private.Line_Table_Extra_Rec_Ptr;
	end record;
    for Line_Rec use
	record
	    Start at 0 * Word_Size range 0 .. 31;
	    Changed at 1 * Word_Size range 0 .. 7;
	    Changed_Position at 2 * Word_Size range 0 .. 31;
	    Past_End at 3 * Word_Size range 0 .. 7;
	    Extra at 4 * Word_Size range 0 .. 31;
	end record;

    Line_Rec_Size : constant := 5 * 32;
    type Line_Rec_Ptr is access Line_Rec;

    type Xm_Text_Line_Table_Rec is
	record
	    Start_Pos : X_Configuration_Dependent.Unsigned_Int := 31;
	    Virt_Line : X_Configuration_Dependent.Unsigned_Int := 1;
	end record;

    for Xm_Text_Line_Table_Rec use
	record
	    Start_Pos at 0 * Word_Size range 0 .. 31;
	    Virt_Line at 1 * Word_Size range 0 .. 31;
	end record;

    Xm_Text_Line_Table_Rec_Size : constant := 32 * 2;
    type Xm_Text_Line_Table_Rec_Ptr is access Xm_Text_Line_Table_Rec;

    type Range_Rec is
	record
	    From : Xm.Xm_Text_Position;
	    To : Xm.Xm_Text_Position;
	end record;

    for Range_Rec use
	record
	    From at 0 * Word_Size range 0 .. 31;
	    To at 1 * Word_Size range 0 .. 31;
	end record;

    Range_Rec_Size : constant := 64;
    type Range_Rec_Ptr is access Range_Rec;

    type Ranges is
	record
	    Number : Xt.Cardinal;
	    Maximum : Xt.Cardinal;
	    Range_Ptr : Range_Rec_Ptr;
	end record;

    for Ranges use
	record
	    Number at 0 * Word_Size range 0 .. 31;
	    Maximum at 1 * Word_Size range 0 .. 31;
	    Range_Ptr at 2 * Word_Size range 0 .. 31;
	end record;

    Ranges_Size : constant := 3 * 32;
    type Ranges_Ptr is access Ranges;

    type Xm_Text_Part is
	record
	    Source : Xm_Text_String_Source_Private.Xm_Text_Source_Rec_Ptr;
	    Activate_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Focus_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Losing_Focus_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Value_Changed_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Modify_Verify_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Wcs_Modify_Verify_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Motion_Verify_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Gain_Primary_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Lose_Primary_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Value : X_Lib.String_Pointer;
	    Wc_Value : X_Lib.Wide_Character_Pointer;
	    Margin_Height : Xt.Dimension;
	    Margin_Width : Xt.Dimension;
	    Cursor_Position_X : Xt.Position;
	    Output_Create : Xm_Text_Out_Private.Output_Create_Proc;
	    Input_Create : Xm_Text_In_Private.Input_Create_Proc;
	    Top_Character : Xm.Xm_Text_Position;
	    Bottom_Position : Xm.Xm_Text_Position;
	    Cursor_Position : Xm.Xm_Text_Position;
	    Max_Length : X_Configuration_Dependent.Int;
	    Edit_Mode : X_Configuration_Dependent.Int;
	    Auto_Show_Cursor_Position : Xm.Xm_Boolean;
	    Editable : Xm.Xm_Boolean;
	    Verify_Bell : Xm.Xm_Boolean;
	    Add_Mode : Xm.Xm_Boolean;
	    Traversed : Xm.Xm_Boolean;
	    In_Redisplay : Xm.Xm_Boolean;
	    Needs_Redisplay : Xm.Xm_Boolean;
	    In_Refigure_Lines : Xm.Xm_Boolean;
	    Needs_Refigure_Lines : Xm.Xm_Boolean;
	    In_Set_Values : Xm.Xm_Boolean;
	    In_Resize : Xm.Xm_Boolean;
	    In_Expose : Xm.Xm_Boolean;
	    Highlight_Changed : Xm.Xm_Boolean;
	    Pending_Off : Xm.Xm_Boolean;
	    Char_Size : X_Lib.X_Character;
	    On_Off : Xm_Text_Out_Private.On_Or_Off;
	    Output : Xm_Text_Out_Private.Output_Rec_Ptr;
	    Input : Xm_Text_In_Private.Input_Rec_Ptr;
	    First_Position : Xm.Xm_Text_Position;
	    Last_Position : Xm.Xm_Text_Position;
	    Forget_Past : Xm.Xm_Text_Position;
	    Force_Display : Xm.Xm_Text_Position;
	    New_Top : Xm.Xm_Text_Position;
	    Last_Top_Char : Xm.Xm_Text_Position;
	    Dest_Position : Xm.Xm_Text_Position;
	    Disable_Depth : X_Configuration_Dependent.Int;
	    Pending_Scroll : X_Configuration_Dependent.Int;
	    Total_Lines : X_Configuration_Dependent.Int;
	    Top_Line : X_Configuration_Dependent.Int;
	    Vsbar_Scrolling : X_Configuration_Dependent.Int;
	    Number_Lines : Xt.Cardinal;
	    Maximum_Lines : Xt.Cardinal;
	    Line : Line_Rec_Ptr;
	    Repaint : Ranges;
	    Highlight : Xm_Private.Xm_Highlight_Data;
	    Old_Highlight : Xm_Private.Xm_Highlight_Data;
	    Inner_Widget : Xm.Xt_Widget;
	    Line_Table : Xm_Text_Line_Table_Rec_Ptr;
	    Table_Size : X_Configuration_Dependent.Unsigned_Int;
	    Table_Index : X_Configuration_Dependent.Unsigned_Int;
	end record;
    for Xm_Text_Part use
	record
	    Source at 0 * Word_Size range 0 .. 31;
	    Activate_Callback at 1 * Word_Size range 0 .. 31;
	    Focus_Callback at 2 * Word_Size range 0 .. 31;
	    Losing_Focus_Callback at 3 * Word_Size range 0 .. 31;
	    Value_Changed_Callback at 4 * Word_Size range 0 .. 31;
	    Modify_Verify_Callback at 5 * Word_Size range 0 .. 31;
	    Wcs_Modify_Verify_Callback at 6 * Word_Size range 0 .. 31;
	    Motion_Verify_Callback at 7 * Word_Size range 0 .. 31;
	    Gain_Primary_Callback at 8 * Word_Size range 0 .. 31;
	    Lose_Primary_Callback at 9 * Word_Size range 0 .. 31;
	    Value at 10 * Word_Size range 0 .. 31;
	    Wc_Value at 11 * Word_Size range 0 .. 31;
	    Margin_Height at 12 * Word_Size range 0 .. 15;
	    Margin_Width at 12 * Word_Size range 16 .. 31;
	    Cursor_Position_X at 13 * Word_Size range 0 .. 15;
	    Output_Create at 14 * Word_Size range 0 .. 31;
	    Input_Create at 15 * Word_Size range 0 .. 31;
	    Top_Character at 16 * Word_Size range 0 .. 31;
	    Bottom_Position at 17 * Word_Size range 0 .. 31;
	    Cursor_Position at 18 * Word_Size range 0 .. 31;
	    Max_Length at 19 * Word_Size range 0 .. 31;
	    Edit_Mode at 20 * Word_Size range 0 .. 31;
	    Auto_Show_Cursor_Position at 21 * Word_Size range 0 .. 7;
	    Editable at 21 * Word_Size + 1 range 0 .. 7;
	    Verify_Bell at 21 * Word_Size + 2 range 0 .. 7;
	    Add_Mode at 21 * Word_Size + 3 range 0 .. 7;
	    Traversed at 22 * Word_Size range 0 .. 7;
	    In_Redisplay at 22 * Word_Size + 1 range 0 .. 7;
	    Needs_Redisplay at 22 * Word_Size + 2 range 0 .. 7;
	    In_Refigure_Lines at 22 * Word_Size + 3 range 0 .. 7;
	    Needs_Refigure_Lines at 23 * Word_Size range 0 .. 7;
	    In_Set_Values at 23 * Word_Size + 1 range 0 .. 7;
	    In_Resize at 23 * Word_Size + 2 range 0 .. 7;
	    In_Expose at 23 * Word_Size + 3 range 0 .. 7;
	    Highlight_Changed at 24 * Word_Size range 0 .. 7;
	    Pending_Off at 24 * Word_Size + 1 range 0 .. 7;
	    Char_Size at 24 * Word_Size + 2 range 0 .. 7;
	    On_Off at 25 * Word_Size range 0 .. 31;
	    Output at 26 * Word_Size range 0 .. 31;
	    Input at 27 * Word_Size range 0 .. 31;
	    First_Position at 28 * Word_Size range 0 .. 31;
	    Last_Position at 29 * Word_Size range 0 .. 31;
	    Forget_Past at 30 * Word_Size range 0 .. 31;
	    Force_Display at 31 * Word_Size range 0 .. 31;
	    New_Top at 32 * Word_Size range 0 .. 31;
	    Last_Top_Char at 33 * Word_Size range 0 .. 31;
	    Dest_Position at 34 * Word_Size range 0 .. 31;
	    Disable_Depth at 35 * Word_Size range 0 .. 31;
	    Pending_Scroll at 36 * Word_Size range 0 .. 31;
	    Total_Lines at 37 * Word_Size range 0 .. 31;
	    Top_Line at 38 * Word_Size range 0 .. 31;
	    Vsbar_Scrolling at 39 * Word_Size range 0 .. 31;
	    Number_Lines at 40 * Word_Size range 0 .. 31;
	    Maximum_Lines at 41 * Word_Size range 0 .. 31;
	    Line at 42 * Word_Size range 0 .. 31;
	    Repaint at 43 * Word_Size range 0 .. Ranges_Size - 1; -- 3 words
	    Highlight at 46 * Word_Size
	       range 0 .. Xm_Private.Highlight_Data_Size - 1; -- 3 words
	    Old_Highlight at 49 * Word_Size
	       range 0 .. Xm_Private.Highlight_Data_Size - 1; -- 3 words
	    Inner_Widget at 52 * Word_Size range 0 .. 31;
	    Line_Table at 53 * Word_Size range 0 .. 31;
	    Table_Size at 54 * Word_Size range 0 .. 31;
	    Table_Index at 55 * Word_Size range 0 .. 31;
	end record;

    Xm_Text_Part_Size : constant := 56 * 32;
    Xm_Text_Rec_Size : constant :=
       Xm_Private.Xm_Primitive_Rec_Size + Xm_Text_Part_Size;

    type Xm_Text_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Primitive : Xm_Private.Xm_Primitive_Part;
	    Text : Xm_Text_Part;
	end record;

    for Xm_Text_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Primitive at 0 range Xt_Core_Private.Core_Part_Size ..
				    Xm_Private.Xm_Primitive_Rec_Size - 1;
	    Text at 0 range Xm_Private.Xm_Primitive_Rec_Size ..
			       Xm_Text_Rec_Size - 1;
	end record;

    type Xm_Text_Class_Rec_Ptr is access Xm_Text_Class_Rec;
    type Xm_Text_Rec_Ptr is access Xm_Text_Rec;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Text_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Text_Class (X : in Xt.Widget_Class)
			      return Xm_Text_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Text_Rec_Ptr) return Xt.Widget;

    function To_Xm_Text (X : in Xt.Widget) return Xm_Text_Rec_Ptr;

end Xm_Text_Private;

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
