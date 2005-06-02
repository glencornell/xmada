-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with Xm, X_Lib, Xt, Xm_Text;

package Xm_Text_Field is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    type Xm_Text_Field_Verify_Callback_Rec is
       new Xm_Text.Xm_Text_Verify_Callback_Rec;
    type Xm_Text_Field_Verify_Callback_Rec_Ptr is
       access Xm_Text_Field_Verify_Callback_Rec;

    subtype Text_Field_Class is Xm.Primitive_Class;
    subtype Text_Field_Widget is Xm.Primitive_Widget;

    function Xm_Text_Field_Widget_Class return Text_Field_Class;

    function Xm_Is_Text_Field (W : in Xm.Xt_Widget) return Boolean;

    function Xm_Create_Text_Field
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;

    function Xm_Text_Field_Get_String (W : in Xm.Xt_Widget) return Xt.Xt_String;

    -- overloaded procedure for non-ascii character sets
    function Xm_Text_Field_Get_String
		(W : in Xm.Xt_Widget) return X_Lib.String_Pointer_8;

    function Xm_Text_Field_Get_Substring
		(W : in Xm.Xt_Widget;
		 Start : in Xm.Xm_Text_Position;
		 Num_Chars : in X_Lib.X_Integer;
		 Buffer : in String) return X_Lib.X_Integer;

    function Xm_Text_Field_Get_String_Wcs
		(W : in Xm.Xt_Widget) return X_Lib.Wide_Character_Pointer;

    function Xm_Text_Field_Get_Substring_Wcs
		(W : in Xm.Xt_Widget;
		 Start : in Xm.Xm_Text_Position;
		 Num_Chars : in X_Lib.X_Integer;
		 Buffer : in X_Lib.Wide_Character_Array) return X_Lib.X_Integer;

    function Xm_Text_Field_Get_Last_Position
		(W : in Xm.Xt_Widget) return Xm.Xm_Text_Position;

    procedure Xm_Text_Field_Set_String (W : in Xm.Xt_Widget; Value : in String);

    -- overloaded procedure for non-ascii character sets
    procedure Xm_Text_Field_Set_String
		 (W : in Xm.Xt_Widget; Value : in X_Lib.String_8);

    procedure Xm_Text_Field_Set_String_Wcs
		 (W : in Xm.Xt_Widget;
		  Wc_String : in X_Lib.Wide_Character_Pointer);

    procedure Xm_Text_Field_Replace (W : in Xm.Xt_Widget;
				     From_Pos : in Xm.Xm_Text_Position;
				     To_Pos : in Xm.Xm_Text_Position;
				     Value : in String);

    -- overloaded procedure for non-ascii character sets
    procedure Xm_Text_Field_Replace (W : in Xm.Xt_Widget;
				     From_Pos : in Xm.Xm_Text_Position;
				     To_Pos : in Xm.Xm_Text_Position;
				     Value : in X_Lib.String_8);

    procedure Xm_Text_Field_Replace_Wcs
		 (W : in Xm.Xt_Widget;
		  From_Pos : in Xm.Xm_Text_Position;
		  To_Pos : in Xm.Xm_Text_Position;
		  Wc_String : in X_Lib.Wide_Character_Pointer);

    procedure Xm_Text_Field_Insert (W : in Xm.Xt_Widget;
				    The_Position : in Xm.Xm_Text_Position;
				    Value : in String);

    -- overloaded procedure for non-ascii character sets
    procedure Xm_Text_Field_Insert (W : in Xm.Xt_Widget;
				    The_Position : in Xm.Xm_Text_Position;
				    Value : in X_Lib.String_8);

    procedure Xm_Text_Field_Insert_Wcs
		 (W : in Xm.Xt_Widget;
		  Position : in Xm.Xm_Text_Position;
		  Wc_String : in X_Lib.Wide_Character_Pointer);

    procedure Xm_Text_Field_Set_Add_Mode
		 (W : in Xm.Xt_Widget; State : in Boolean);

    function Xm_Text_Field_Get_Add_Mode (W : in Xm.Xt_Widget) return Boolean;

    function Xm_Text_Field_Get_Editable (W : in Xm.Xt_Widget) return Boolean;

    procedure Xm_Text_Field_Set_Editable
		 (W : in Xm.Xt_Widget; Editable : in Boolean);

    function Xm_Text_Field_Get_Max_Length
		(W : in Xm.Xt_Widget) return X_Lib.X_Integer;

    procedure Xm_Text_Field_Set_Max_Length
		 (W : in Xm.Xt_Widget; Max_Length : in X_Lib.X_Integer);

    function Xm_Text_Field_Get_Cursor_Position
		(W : in Xm.Xt_Widget) return Xm.Xm_Text_Position;

    procedure Xm_Text_Field_Set_Cursor_Position
		 (W : in Xm.Xt_Widget; The_Position : in Xm.Xm_Text_Position);

    function Xm_Text_Field_Get_Insertion_Position
		(W : in Xm.Xt_Widget) return Xm.Xm_Text_Position;

    procedure Xm_Text_Field_Set_Insertion_Position
		 (W : in Xm.Xt_Widget; The_Position : in Xm.Xm_Text_Position);

    procedure Xm_Text_Field_Get_Selection_Position
		 (W : in Xm.Xt_Widget;
		  Left : out Xm.Xm_Text_Position;
		  Right : out Xm.Xm_Text_Position;
		  Return_Value : out Boolean);

    function Xm_Text_Field_Get_Selection
		(W : in Xm.Xt_Widget) return Xt.Xt_String;

    -- overloaded procedure for non-ascii character sets
    function Xm_Text_Field_Get_Selection
		(W : in Xm.Xt_Widget) return X_Lib.String_Pointer_8;

    function Xm_Text_Field_Get_Selection_Wcs
		(W : in Xm.Xt_Widget) return X_Lib.Wide_Character_Pointer;

    function Xm_Text_Field_Remove (W : in Xm.Xt_Widget) return Boolean;

    function Xm_Text_Field_Copy
		(W : in Xm.Xt_Widget; Copy_Time : in X_Lib.Time) return Boolean;

    function Xm_Text_Field_Cut
		(W : in Xm.Xt_Widget; Cut_Time : in X_Lib.Time) return Boolean;

    function Xm_Text_Field_Paste (W : in Xm.Xt_Widget) return Boolean;

    procedure Xm_Text_Field_Clear_Selection
		 (W : in Xm.Xt_Widget; Clear_Time : in X_Lib.Time);

    procedure Xm_Text_Field_Set_Selection (W : in Xm.Xt_Widget;
					   First : in Xm.Xm_Text_Position;
					   Last : in Xm.Xm_Text_Position;
					   Set_Time : in X_Lib.Time);

    function Xm_Text_Field_Xy_To_Pos
		(W : in Xm.Xt_Widget; X : in Xt.Position; Y : in Xt.Position)
		return Xm.Xm_Text_Position;

    procedure Xm_Text_Field_Pos_To_Xy (W : in Xm.Xt_Widget;
				       The_Position : in Xm.Xm_Text_Position;
				       X : out Xt.Position;
				       Y : out Xt.Position;
				       Return_Value : out Boolean);

    procedure Xm_Text_Field_Show_Position
		 (W : in Xm.Xt_Widget; The_Position : in Xm.Xm_Text_Position);

    procedure Xm_Text_Field_Set_Highlight (W : in Xm.Xt_Widget;
					   Left : in Xm.Xm_Text_Position;
					   Right : in Xm.Xm_Text_Position;
					   Mode : in Xm.Xm_Highlight_Mode);

    function Xm_Text_Field_Get_Baseline
		(W : in Xm.Xt_Widget) return X_Lib.X_Integer;
end Xm_Text_Field;

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
