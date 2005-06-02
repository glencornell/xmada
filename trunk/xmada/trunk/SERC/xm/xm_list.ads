-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, Xt, X_Lib, Xm, System;

package Xm_List is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Xminitial : constant := 0;
    Xmaddition : constant := 1;
    Xmmodification : constant := 2;

    type Int_Ptr is access X_Configuration_Dependent.Int;

    type Position_List is array (Natural range <>) of X_Lib.X_Integer;
    type Position_List_Ptr is access Position_List;

    type Xm_List_Callback_Rec is
	record
	    Reason : Xm.Callback_Reason;
	    Event_Ptr : Xm.X_Event_Ptr;
	    Item : Xm.Xm_String;
	    Item_Length : X_Lib.X_Integer;
	    Item_Position : X_Lib.X_Integer;
	    Selected_Items : Xm.Xm_String_Table_Ptr;
	    Selected_Items_Count : X_Lib.X_Integer;
	    Selected_Items_Positions : Int_Ptr;
	    Selection_Type : X_Configuration_Dependent.Char;
	    Pad1 : X_Configuration_Dependent.Char;
	    Pad2 : X_Configuration_Dependent.Int16;
	end record;
    for Xm_List_Callback_Rec use
	record
	    Reason at 0 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Event_Ptr at 1 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Item at 2 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Item_Length at 3 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Item_Position at 4 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Selected_Items at 5 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Selected_Items_Count at 6 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Selected_Items_Positions at 7 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Selection_Type at 8 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Byte'Size - 1;
	    Pad1 at 8 * X_Configuration_Dependent.Word_Size + 1
	       range 0 .. X_Configuration_Dependent.Byte'Size - 1;
	    Pad2 at 8 * X_Configuration_Dependent.Word_Size + 2
	       range 0 .. X_Configuration_Dependent.Int16'Size - 1;
	end record;
    type Xm_List_Callback_Rec_Ptr is access Xm_List_Callback_Rec;

    subtype List_Class is Xm.Primitive_Class;
    subtype List_Widget is Xm.Primitive_Widget;

--
-- this function should be used to convert the Selected_Item field in the callback
-- record above into an Xm_String_Table.  This function allocates
-- storage for an Xm_String_Table containing Selected_Items_Count elements
-- The user is responsible for freeing this memory.
--
    function To_Xm_String_Table (Selected_Items_Ptr : in Xt.Xt_Pointer;
				 Selected_Items_Count : in X_Lib.X_Integer)
				return Xm.Xm_String_Table_Ptr;

--
-- this function should be used to convert the Selected_Items_Positions field in the callback
-- record above into an Position_List.  This function allocates storage 
-- storage for a Position_List containing Selected_Items_Count elements
-- The user is responsible for freeing this memory.
--
    function To_Position_List (Selected_Items_Positions_Ptr : in Xt.Xt_Pointer;
			       Selected_Items_Count : in X_Lib.X_Integer)
			      return Position_List_Ptr;

    function Xm_List_Widget_Class return List_Class;

    function Xm_Is_List (W : in Xm.Xt_Widget) return Boolean;

    procedure Xm_List_Add_Item (W : in Xm.Xt_Widget;
				Item : in Xm.Xm_String;
				Pos : in X_Lib.X_Integer);

    procedure Xm_List_Add_Items (W : in Xm.Xt_Widget;
				 Items : in Xm.Xm_String_Table;
				 Pos : in X_Lib.X_Integer);

    procedure Xm_List_Add_Items_Unselected (W : in Xt.Widget;
					    Items : in Xm.Xm_String_Table;
					    Pos : in X_Lib.X_Integer);

    procedure Xm_List_Add_Item_Unselected (W : in Xm.Xt_Widget;
					   Item : in Xm.Xm_String;
					   Pos : in X_Lib.X_Integer);

    procedure Xm_List_Delete_Item (W : in Xm.Xt_Widget; Item : in Xm.Xm_String);

    procedure Xm_List_Delete_Items
		 (W : in Xm.Xt_Widget;
		  Items : in Xm.Xm_String_Table); -- array of Xm_Strings

    procedure Xm_List_Delete_Positions (W : in Xt.Widget;
					Position_List : in X_Lib.Long_Array);

    procedure Xm_List_Delete_Pos
		 (W : in Xm.Xt_Widget; Pos : in X_Lib.X_Integer);

    procedure Xm_List_Delete_Items_Pos (W : in Xm.Xt_Widget;
					Item_Count : in X_Lib.X_Integer;
					Pos : in X_Lib.X_Integer);

    procedure Xm_List_Delete_All_Items (W : in Xm.Xt_Widget);

    procedure Xm_List_Replace_Items (W : in Xm.Xt_Widget;
				     Old_Items : in Xm.Xm_String_Table;
				     New_Items : in Xm.Xm_String_Table);

    procedure Xm_List_Replace_Items_Pos (W : in Xm.Xt_Widget;
					 New_Items : in Xm.Xm_String_Table;
					 The_Position : in X_Lib.X_Integer);

    procedure Xm_List_Replace_Items_Unselected
		 (W : in Xt.Widget;
		  Old_Items : in Xm.Xm_String_Table;
		  New_Items : in Xm.Xm_String_Table);

    procedure Xm_List_Replace_Items_Pos_Unselected
		 (W : in Xt.Widget;
		  New_Items : in Xm.Xm_String_Table;
		  Position : in X_Lib.X_Integer);

    procedure Xm_List_Replace_Positions
		 (W : in Xt.Widget;
		  Position_List : in out X_Lib.Long_Array;
		  Item_List : in Xm.Xm_String_Table);

    procedure Xm_List_Select_Item (W : in Xm.Xt_Widget;
				   Item : in Xm.Xm_String;
				   Notify : in Boolean);

    procedure Xm_List_Select_Pos (W : in Xm.Xt_Widget;
				  Pos : in X_Lib.X_Integer;
				  Notify : in Boolean);

    procedure Xm_List_Deselect_Item
		 (W : in Xm.Xt_Widget; Item : in Xm.Xm_String);

    procedure Xm_List_Deselect_Pos
		 (W : in Xm.Xt_Widget; Pos : in X_Lib.X_Integer);

    procedure Xm_List_Deselect_All_Items (W : in Xm.Xt_Widget);

    procedure Xm_List_Set_Pos (W : in Xm.Xt_Widget; Pos : in X_Lib.X_Integer);

    procedure Xm_List_Set_Bottom_Pos
		 (W : in Xm.Xt_Widget; Pos : in X_Lib.X_Integer);

    procedure Xm_List_Set_Item (W : in Xm.Xt_Widget; Item : in Xm.Xm_String);

    procedure Xm_List_Set_Bottom_Item
		 (W : in Xm.Xt_Widget; Item : in Xm.Xm_String);

    procedure Xm_List_Set_Add_Mode (W : in Xm.Xt_Widget; Add_Mode : in Boolean);

    function Xm_List_Item_Exists
		(W : in Xm.Xt_Widget; Item : in Xm.Xm_String) return Boolean;

    function Xm_List_Item_Pos (W : in Xm.Xt_Widget; Item : in Xm.Xm_String)
			      return X_Lib.X_Integer;

    function Xm_List_Get_Kbd_Item_Pos (W : in Xt.Widget) return X_Lib.X_Integer;

    function Xm_List_Set_Kbd_Item_Pos
		(W : in Xt.Widget; Position : in X_Lib.X_Integer)
		return Boolean;

    function Xm_List_Y_To_Pos
		(W : in Xt.Widget; Y : in Xt.Position) return X_Lib.X_Integer;

    procedure Xm_List_Pos_To_Bounds (W : in Xt.Widget;
				     Position : in X_Lib.X_Integer;
				     X : out Xt.Position;
				     Y : out Xt.Position;
				     Width : out Xt.Dimension;
				     Height : out Xt.Dimension;
				     Ret_Val : out Boolean);

-- This procedure returns a list of positions in the array Position _List
-- When Item_Present is true, the routine allocates memory for
-- this array.  The user is responsible for freeing this memory....
    procedure Xm_List_Get_Match_Pos (W : in Xm.Xt_Widget;
				     Item : in Xm.Xm_String;
				     Pos_List : out Position_List_Ptr;
				     Item_Present : out Boolean);

-- the comments above also apply to this routine
    procedure Xm_List_Get_Selected_Pos (W : in Xm.Xt_Widget;
					Pos_List : out Position_List_Ptr;
					Any_Selected_Items : out Boolean);

    procedure Xm_List_Set_Horiz_Pos (W : in Xm.Xt_Widget;
				     The_Position : in X_Lib.X_Integer);

    procedure Xm_List_Update_Selected_List (W : in Xt.Widget);

    function Xm_List_Pos_Selected
		(W : in Xt.Widget; Pos : in X_Lib.X_Integer) return Boolean;
    function Xm_Create_List
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;

    function Xm_Create_Scrolled_List
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;
end Xm_List;

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
