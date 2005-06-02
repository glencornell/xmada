-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with Xm, X_Lib, Xt, X_Configuration_Dependent;

package Xm_Text is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

--
-- XmTextBlock's are used to pass text around.
--
    type Xm_Text_Block_Rec is
	record
	    Ptr : Xt.Xt_Pointer;
	    Length : X_Lib.X_Integer;
	    Format : Xm.Xm_Text_Format;
	end record;
    for Xm_Text_Block_Rec use
	record
	    Ptr at 0 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Length at 1 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Format at 2 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	end record;
    Text_Block_Rec_Size : constant := 3 * X_Configuration_Dependent.Word_Size;
    type Xm_Text_Block is access Xm_Text_Block_Rec;

    type Xm_Text_Verify_Callback_Rec is
	record
	    Reason : Xm.Callback_Reason;
	    Event_Ptr : Xm.X_Event_Ptr;
	    Doit : Xm.Xm_Boolean;
	    Curr_Insert : Xm.Xm_Text_Position;
	    New_Insert : Xm.Xm_Text_Position;
	    Start_Pos : Xm.Xm_Text_Position;
	    End_Pos : Xm.Xm_Text_Position;
	    Text : Xm_Text_Block;
	end record;
    for Xm_Text_Verify_Callback_Rec use
	record
	    Reason at 0 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Event_Ptr at 1 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Doit at 2 * X_Configuration_Dependent.Word_Size range 0 .. 7;
	    Curr_Insert at 3 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    New_Insert at 4 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Start_Pos at 5 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    End_Pos at 6 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Text at 7 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	end record;
    type Xm_Text_Verify_Callback_Rec_Ptr is access Xm_Text_Verify_Callback_Rec;

    type Xm_Text_Block_Rec_Wcs is
	record
	    Wcsptr : X_Lib.Wide_Character_List;
	    Length : X_Lib.X_Integer;
	end record;

    for Xm_Text_Block_Rec_Wcs use
	record
	    Wcsptr at 0 * Word_Size range 0 .. 31;
	    Length at 1 * Word_Size range 0 .. 31;
	end record;

    type Xm_Text_Block_Wcs is access Xm_Text_Block_Rec_Wcs;

    type Xm_Text_Verify_Callback_Rec_Wcs is
	record
	    Reason : Xm.Callback_Reason;
	    Event_Ptr : Xm.X_Event_Ptr;
	    Do_It : Xm.Xm_Boolean;
	    Curr_Insert : Xm.Xm_Text_Position;
	    New_Insert : Xm.Xm_Text_Position;
	    Start_Pos : Xm.Xm_Text_Position;
	    End_Pos : Xm.Xm_Text_Position;
	    Text : Xm_Text_Block_Wcs;
	end record;

    for Xm_Text_Verify_Callback_Rec_Wcs use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event_Ptr at 1 * Word_Size range 0 .. 31;
	    Do_It at 2 * Word_Size range 0 .. 7;
	    Curr_Insert at 3 * Word_Size range 0 .. 31;
	    New_Insert at 4 * Word_Size range 0 .. 31;
	    Start_Pos at 5 * Word_Size range 0 .. 31;
	    End_Pos at 6 * Word_Size range 0 .. 31;
	    Text at 7 * Word_Size range 0 .. 31;
	end record;

    type Xm_Text_Verify_Ptr_Wcs is access Xm_Text_Verify_Callback_Rec_Wcs;

    subtype Text_Class is Xm.Primitive_Class;
    subtype Text_Widget is Xm.Primitive_Widget;
    type Xm_Text_Source is private;

    function Xm_Text_Widget_Class return Text_Class;

    function Xm_Is_Text (W : in Xm.Xt_Widget) return Boolean;

    procedure Xm_Text_Set_Highlight (W : in Xm.Xt_Widget;
				     Left : in Xm.Xm_Text_Position;
				     Right : in Xm.Xm_Text_Position;
				     Mode : in Xm.Xm_Highlight_Mode);

    function Xm_Create_Scrolled_Text
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;

    function Xm_Create_Text
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;

    function Xm_Text_Get_Substring (W : in Xm.Xt_Widget;
				    Start : in Xm.Xm_Text_Position;
				    Num_Chars : in X_Lib.X_Integer;
				    Buffer : in String) return X_Lib.X_Integer;

    function Xm_Text_Get_Substring_Wcs
		(W : in Xm.Xt_Widget;
		 Start : in Xm.Xm_Text_Position;
		 Num_Chars : in X_Lib.X_Integer;
		 Buffer : in X_Lib.Wide_Character_Array) return X_Lib.X_Integer;

    -- this routine allocates space on the heap.  It is up to the user
    -- to free this space.
    function Xm_Text_Get_String (W : in Xm.Xt_Widget) return Xt.Xt_String;

    -- overloaded version to enable getting of non-ASCII character strings
    -- this routine allocates space on the heap.  It is up to the user
    -- to free this space.
    function Xm_Text_Get_String (W : in Xm.Xt_Widget)
				return X_Lib.String_Pointer_8;

    function Xm_Text_Get_String_Wcs (W : in Xm.Xt_Widget)
				    return X_Lib.Wide_Character_Pointer;

    function Xm_Text_Get_Last_Position
		(W : in Xm.Xt_Widget) return Xm.Xm_Text_Position;

    procedure Xm_Text_Set_String (W : in Xm.Xt_Widget; Value : in String);

-- overloaded version to enable setting non-ASCII character strings
    procedure Xm_Text_Set_String
		 (W : in Xm.Xt_Widget; Value : in X_Lib.String_8);

    procedure Xm_Text_Set_String_Wcs
		 (W : in Xm.Xt_Widget;
		  Wc_String : in X_Lib.Wide_Character_Pointer);

    procedure Xm_Text_Replace (W : in Xm.Xt_Widget;
			       From_Pos : in Xm.Xm_Text_Position;
			       To_Pos : in Xm.Xm_Text_Position;
			       Value : in String);

-- overloaded version to enable replacing non-ASCII character strings
    procedure Xm_Text_Replace (W : in Xm.Xt_Widget;
			       From_Pos : in Xm.Xm_Text_Position;
			       To_Pos : in Xm.Xm_Text_Position;
			       Value : in X_Lib.String_8);

    procedure Xm_Text_Replace_Wcs (W : in Xm.Xt_Widget;
				   From_Pos : in Xm.Xm_Text_Position;
				   To_Pos : in Xm.Xm_Text_Position;
				   Wc_String : in X_Lib.Wide_Character_Pointer);

    procedure Xm_Text_Insert (W : in Xm.Xt_Widget;
			      The_Position : in Xm.Xm_Text_Position;
			      Value : in String);

-- overloaded version to enable inserting non-ASCII character strings
    procedure Xm_Text_Insert (W : in Xm.Xt_Widget;
			      The_Position : in Xm.Xm_Text_Position;
			      Value : in X_Lib.String_8);

    procedure Xm_Text_Insert_Wcs (W : in Xm.Xt_Widget;
				  Position : in Xm.Xm_Text_Position;
				  Wc_String : in X_Lib.Wide_Character_Pointer);

    procedure Xm_Text_Set_Add_Mode (W : in Xm.Xt_Widget; State : in Boolean);

    function Xm_Text_Get_Add_Mode (W : in Xm.Xt_Widget) return Boolean;

    function Xm_Text_Get_Editable (W : in Xm.Xt_Widget) return Boolean;

    procedure Xm_Text_Set_Editable (W : in Xm.Xt_Widget; Editable : in Boolean);

    function Xm_Text_Get_Max_Length
		(W : in Xm.Xt_Widget) return X_Lib.X_Integer;

    procedure Xm_Text_Set_Max_Length (W : in Xm.Xt_Widget;
				      Max_Length : in X_Lib.X_Integer);

    function Xm_Text_Get_Top_Character
		(W : in Xm.Xt_Widget) return Xm.Xm_Text_Position;

    procedure Xm_Text_Set_Top_Character
		 (W : in Xm.Xt_Widget; Top_Character : in Xm.Xm_Text_Position);

    function Xm_Text_Get_Cursor_Position
		(W : in Xm.Xt_Widget) return Xm.Xm_Text_Position;

    procedure Xm_Text_Set_Cursor_Position
		 (W : in Xm.Xt_Widget; The_Position : in Xm.Xm_Text_Position);

    function Xm_Text_Get_Insertion_Position
		(W : in Xm.Xt_Widget) return Xm.Xm_Text_Position;

    procedure Xm_Text_Set_Insertion_Position
		 (W : in Xm.Xt_Widget; The_Position : in Xm.Xm_Text_Position);

    function Xm_Text_Remove (W : in Xm.Xt_Widget) return Boolean;

    function Xm_Text_Copy
		(W : in Xm.Xt_Widget; Copy_Time : in X_Lib.Time) return Boolean;

    function Xm_Text_Cut
		(W : in Xm.Xt_Widget; Cut_Time : in X_Lib.Time) return Boolean;

    function Xm_Text_Paste (W : in Xm.Xt_Widget) return Boolean;

    function Xm_Text_Get_Selection (W : in Xm.Xt_Widget) return Xt.Xt_String;

-- overloaded version to enable Get_Selection of non-ASCII character strings
    function Xm_Text_Get_Selection
		(W : in Xm.Xt_Widget) return X_Lib.String_Pointer_8;

    function Xm_Text_Get_Selection_Wcs (W : in Xm.Xt_Widget)
				       return X_Lib.Wide_Character_Pointer;

    procedure Xm_Text_Set_Selection (W : in Xm.Xt_Widget;
				     First : in Xm.Xm_Text_Position;
				     Last : in Xm.Xm_Text_Position;
				     Set_Time : in X_Lib.Time);

    procedure Xm_Text_Clear_Selection
		 (W : in Xm.Xt_Widget; Clear_Time : in X_Lib.Time);

    procedure Xm_Text_Get_Selection_Position
		 (W : in Xm.Xt_Widget;
		  Left : in out Xm.Xm_Text_Position;
		  Right : in out Xm.Xm_Text_Position;
		  Return_Value : out Boolean);

    function Xm_Text_Xy_To_Pos
		(W : in Xm.Xt_Widget; X : in Xt.Position; Y : in Xt.Position)
		return Xm.Xm_Text_Position;

    procedure Xm_Text_Pos_To_Xy (W : in Xm.Xt_Widget;
				 The_Position : in Xm.Xm_Text_Position;
				 X : in out Xt.Position;
				 Y : in out Xt.Position;
				 Return_Value : out Boolean);

    function Xm_Text_Get_Source (W : in Xm.Xt_Widget) return Xm_Text_Source;

    procedure Xm_Text_Set_Source (W : in Xm.Xt_Widget;
				  Source : in Xm_Text_Source;
				  Top_Character : in Xm.Xm_Text_Position;
				  Cursor_Position : in Xm.Xm_Text_Position);

    procedure Xm_Text_Show_Position (W : in Xm.Xt_Widget;
				     The_Position : in Xm.Xm_Text_Position);

    procedure Xm_Text_Scroll (W : in Xm.Xt_Widget; N : in X_Lib.X_Integer);

    function Xm_Text_Get_Baseline (W : in Xm.Xt_Widget) return X_Lib.X_Integer;

    procedure Xm_Text_Disable_Redisplay (W : in Xm.Xt_Widget);

    procedure Xm_Text_Enable_Redisplay (W : in Xm.Xt_Widget);

    procedure Xm_Text_Find_String (W : in Xm.Xt_Widget;
				   Start : in Xm.Xm_Text_Position;
				   Search_String : in String;
				   Direction : in Xm.Xm_Text_Direction;
				   Position : out Xm.Xm_Text_Position;
				   Ret_Val : out Boolean);

    procedure Xm_Text_Find_String_Wcs
		 (W : in Xm.Xt_Widget;
		  Start : in Xm.Xm_Text_Position;
		  Wc_String : in X_Lib.Wide_Character_Pointer;
		  Direction : in Xm.Xm_Text_Direction;
		  Position : out Xm.Xm_Text_Position;
		  Ret_Val : out Boolean);

private
    type Xm_Text_Source_Rec;
    type Xm_Text_Source is access Xm_Text_Source_Rec;
end Xm_Text;

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
