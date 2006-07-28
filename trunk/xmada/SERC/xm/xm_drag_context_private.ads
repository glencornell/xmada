-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, Xt, X_Lib, Xm, System, Xm_Drag_Context,
     Unchecked_Conversion, Xt_Core_Private, Xm_Display,
     Xm_Drag_Icon_Private, Xm_Drag_Over_Shell_Private;

package Xm_Drag_Context_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    subtype Xm_Drag_Start_Proc is X_Lib.X_Address;
    subtype Xm_Drag_Cancel_Proc is X_Lib.X_Address;

    type Xm_Drag_Context_Class_Part is
	record
	    Start : Xm_Drag_Start_Proc;
	    Cancel : Xm_Drag_Cancel_Proc;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Drag_Context_Class_Part use
	record
	    Start at 0 * Word_Size range 0 .. 31;
	    Cancel at 1 * Word_Size range 0 .. 31;
	    Extension at 2 * Word_Size range 0 .. 31;
	end record;

    Xm_Drag_Context_Class_Part_Size : constant := 3 * 32;
    Xm_Drag_Context_Class_Rec_Size : constant :=
       Xt_Core_Private.Core_Class_Part_Size + Xm_Drag_Context_Class_Part_Size;

    type Xm_Drag_Context_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Drag_Class : Xm_Drag_Context_Class_Part;
	end record;

    for Xm_Drag_Context_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Part_Size - 1;
	    Drag_Class at 0 range Xt_Core_Private.Core_Class_Part_Size ..
				     Xm_Drag_Context_Class_Rec_Size - 1;
	end record;

    Xt_Drag_By_Poll : constant := 0;
    Xt_Drag_By_Event : constant := 1;

    type Xm_Drag_Receiver_Info_Rec is
	record
	    Frame : X_Lib.Window;
	    Win : X_Lib.Window;
	    Shell : Xm.Xt_Widget;
	    Flags : X_Lib.X_Character;
	    Drag_Protocol_Style : Xm_Display.Xm_Drag_Protocol_Style;
	    X_Origin : X_Lib.Coordinate;
	    Y_Origin : X_Lib.Coordinate;
	    Width : X_Lib.Width_Height;
	    Height : X_Lib.Width_Height;
	    Depth : X_Lib.Depth_Type;
	    Icc_Info : Xt.Xt_Pointer;
	end record;

    for Xm_Drag_Receiver_Info_Rec use
	record
	    Frame at 0 * Word_Size range 0 .. 31;
	    Win at 1 * Word_Size range 0 .. 31;
	    Shell at 2 * Word_Size range 0 .. 31;
	    Flags at 3 * Word_Size range 0 .. 7;
	    Drag_Protocol_Style at 3 * Word_Size + 1 range 0 .. 7;
	    X_Origin at 4 * Word_Size range 0 .. 31;
	    Y_Origin at 5 * Word_Size range 0 .. 31;
	    Width at 6 * Word_Size range 0 .. 31;
	    Height at 7 * Word_Size range 0 .. 31;
	    Depth at 8 * Word_Size range 0 .. 31;
	    Icc_Info at 9 * Word_Size range 0 .. 31;
	end record;

    Xm_Drag_Receiver_Info_Rec_Size : constant := 10 * 32;
    type Xm_Drag_Receiver_Info is access Xm_Drag_Receiver_Info_Rec;

    type Xm_Convert_Selection_Rec is
	record
	    Sel : X_Lib.X_Address;
	end record;

    for Xm_Convert_Selection_Rec use
	record
	    Sel at 0 range 0 .. 31;
	end record;

    type Xm_Drag_Context_Part is
	record
	    Export_Targets : X_Lib.Atoms.Atom_List;
	    Num_Export_Targets : Xt.Cardinal;
	    Convert_Proc : Xm_Convert_Selection_Rec;
	    Client_Data : Xt.Xt_Pointer;
	    Source_Cursor_Icon : Xm_Drag_Icon_Private.
				    Xm_Drag_Icon_Object_Rec_Ptr;
	    State_Cursor_Icon : Xm_Drag_Icon_Private.
				   Xm_Drag_Icon_Object_Rec_Ptr;
	    Operation_Cursor_Icon : Xm_Drag_Icon_Private.
				       Xm_Drag_Icon_Object_Rec_Ptr;
	    Source_Pixmap_Icon : Xm_Drag_Icon_Private.
				    Xm_Drag_Icon_Object_Rec_Ptr;
	    Cursor_Background : X_Lib.Pixel;
	    Cursor_Foreground : X_Lib.Pixel;
	    Valid_Cursor_Foreground : X_Lib.Pixel;
	    Invalid_Cursor_Foreground : X_Lib.Pixel;
	    None_Cursor_Foreground : X_Lib.Pixel;
	    Drag_Motion_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Operation_Changed_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Site_Enter_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Site_Leave_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Top_Level_Enter_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Top_Level_Leave_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Drop_Start_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Drop_Finish_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Drag_Drop_Finish_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Drag_Operations : X_Configuration_Dependent.Unsigned_Char;
	    Incremental : Xm.Xm_Boolean;
	    Blend_Model : Xm_Drag_Context.Xm_Blend_Type;
	    Src_Window : X_Lib.Window;
	    Drag_Start_Time : X_Lib.Time;
	    Icc_Handle : X_Lib.Atoms.Atom;
	    Source_Widget : Xm.Xt_Widget;
	    Source_Is_External : Xm.Xm_Boolean;
	    Top_Windows_Fetched : Xm.Xm_Boolean;
	    Comm_Type : X_Configuration_Dependent.Unsigned_Char;
	    Animation_Type : X_Configuration_Dependent.Unsigned_Char;
	    Operation : Xm_Drag_Context.Xm_Drop_Operation_Type;
	    Operations : Xm_Drag_Context.Xm_Drop_Operation_Type;
	    Last_Event_State : X_Configuration_Dependent.Unsigned_Int;
	    Drag_Completion_Status : Xm_Drag_Context.Xm_Drop_Type;
	    Drag_Drop_Completion_Status : Xm_Drag_Context.Xm_Completion_Status;
	    Force_Ipc : Xm.Xm_Boolean;
	    Server_Grabbed : Xm.Xm_Boolean;
	    Use_Local : Xm.Xm_Boolean;
	    In_Drop_Site : Xm.Xm_Boolean;
	    Drag_Timer_Id : Xt.Xt_Interval_Id;
	    Round_Off_Time : X_Lib.Time;
	    Last_Change_Time : X_Lib.Time;
	    Crossing_Time : X_Lib.Time;
	    Drag_Finish_Time : X_Lib.Time;
	    Drop_Finish_Time : X_Lib.Time;
	    Drop_Selection : X_Lib.Atoms.Atom;
	    Src_Shell : Xm.Xt_Widget;
	    Start_X : Xt.Position;
	    Start_Y : Xt.Position;
	    Site_Id : Xm_Drag_Context.Xm_Id;
	    Curr_Screen : X_Lib.Screen;
	    Curr_Wm_Root : X_Lib.Window;
	    Cur_Drag_Over : Xm_Drag_Over_Shell_Private.
			       Xm_Drag_Over_Shell_Rec_Ptr;
	    Orig_Drag_Over : Xm_Drag_Over_Shell_Private.
				Xm_Drag_Over_Shell_Rec_Ptr;
	    Curr_Receiver_Info : Xm_Drag_Receiver_Info;
	    Root_Receiver_Info : Xm_Drag_Receiver_Info;
	    Receiver_Infos : Xm_Drag_Receiver_Info;
	    Num_Receiver_Infos : Xt.Cardinal;
	    Max_Receiver_Infos : Xt.Cardinal;
	    Tracking_Mode : X_Configuration_Dependent.Unsigned_Char;
	    Active_Protocol_Style : Xm_Display.Xm_Drag_Protocol_Style;
	    Dummy : X_Lib.X_Character;
	end record;

    for Xm_Drag_Context_Part use
	record
	    Export_Targets at 0 * Word_Size range 0 .. 31;
	    Num_Export_Targets at 1 * Word_Size range 0 .. 31;
	    Convert_Proc at 2 * Word_Size range 0 .. 31;
	    Client_Data at 3 * Word_Size range 0 .. 31;
	    Source_Cursor_Icon at 4 * Word_Size range 0 .. 31;
	    State_Cursor_Icon at 5 * Word_Size range 0 .. 31;
	    Operation_Cursor_Icon at 6 * Word_Size range 0 .. 31;
	    Source_Pixmap_Icon at 7 * Word_Size range 0 .. 31;
	    Cursor_Background at 8 * Word_Size range 0 .. 31;
	    Cursor_Foreground at 9 * Word_Size range 0 .. 31;
	    Valid_Cursor_Foreground at 10 * Word_Size range 0 .. 31;
	    Invalid_Cursor_Foreground at 11 * Word_Size range 0 .. 31;
	    None_Cursor_Foreground at 12 * Word_Size range 0 .. 31;
	    Drag_Motion_Callback at 13 * Word_Size range 0 .. 31;
	    Operation_Changed_Callback at 14 * Word_Size range 0 .. 31;
	    Site_Enter_Callback at 15 * Word_Size range 0 .. 31;
	    Site_Leave_Callback at 16 * Word_Size range 0 .. 31;
	    Top_Level_Enter_Callback at 17 * Word_Size range 0 .. 31;
	    Top_Level_Leave_Callback at 18 * Word_Size range 0 .. 31;
	    Drop_Start_Callback at 19 * Word_Size range 0 .. 31;
	    Drop_Finish_Callback at 20 * Word_Size range 0 .. 31;
	    Drag_Drop_Finish_Callback at 21 * Word_Size range 0 .. 31;
	    Drag_Operations at 22 * Word_Size range 0 .. 7;
	    Incremental at 22 * Word_Size + 1 range 0 .. 7;
	    Blend_Model at 22 * Word_Size + 2 range 0 .. 7;
	    Src_Window at 23 * Word_Size range 0 .. 31;
	    Drag_Start_Time at 24 * Word_Size range 0 .. 31;
	    Icc_Handle at 25 * Word_Size range 0 .. 31;
	    Source_Widget at 26 * Word_Size range 0 .. 31;
	    Source_Is_External at 27 * Word_Size range 0 .. 7;
	    Top_Windows_Fetched at 27 * Word_Size + 1 range 0 .. 7;
	    Comm_Type at 27 * Word_Size + 2 range 0 .. 7;
	    Animation_Type at 27 * Word_Size + 3 range 0 .. 7;
	    Operation at 28 * Word_Size range 0 .. 7;
	    Operations at 28 * Word_Size + 1 range 0 .. 7;
	    Last_Event_State at 29 * Word_Size range 0 .. 31;
	    Drag_Completion_Status at 30 * Word_Size range 0 .. 7;
	    Drag_Drop_Completion_Status at 30 * Word_Size + 1 range 0 .. 7;
	    Force_Ipc at 30 * Word_Size + 2 range 0 .. 7;
	    Server_Grabbed at 30 * Word_Size + 3 range 0 .. 7;
	    Use_Local at 31 * Word_Size range 0 .. 7;
	    In_Drop_Site at 31 * Word_Size + 1 range 0 .. 7;
	    Drag_Timer_Id at 32 * Word_Size range 0 .. 31;
	    Round_Off_Time at 33 * Word_Size range 0 .. 31;
	    Last_Change_Time at 34 * Word_Size range 0 .. 31;
	    Crossing_Time at 35 * Word_Size range 0 .. 31;
	    Drag_Finish_Time at 36 * Word_Size range 0 .. 31;
	    Drop_Finish_Time at 37 * Word_Size range 0 .. 31;
	    Drop_Selection at 38 * Word_Size range 0 .. 31;
	    Src_Shell at 39 * Word_Size range 0 .. 31;
	    Start_X at 40 * Word_Size range 0 .. 15;
	    Start_Y at 40 * Word_Size + 2 range 0 .. 15;
	    Site_Id at 41 * Word_Size range 0 .. 31;
	    Curr_Screen at 42 * Word_Size range 0 .. 31;
	    Curr_Wm_Root at 43 * Word_Size range 0 .. 31;
	    Cur_Drag_Over at 44 * Word_Size range 0 .. 31;
	    Orig_Drag_Over at 45 * Word_Size range 0 .. 31;
	    Curr_Receiver_Info at 46 * Word_Size range 0 .. 31;
	    Root_Receiver_Info at 47 * Word_Size range 0 .. 31;
	    Receiver_Infos at 48 * Word_Size range 0 .. 31;
	    Num_Receiver_Infos at 49 * Word_Size range 0 .. 31;
	    Max_Receiver_Infos at 50 * Word_Size range 0 .. 31;
	    Tracking_Mode at 51 * Word_Size range 0 .. 7;
	    Active_Protocol_Style at 51 * Word_Size + 1 range 0 .. 7;
	    Dummy at 51 * Word_Size + 3 range 0 .. 7;
	end record;

    Xm_Drag_Context_Part_Size : constant := 52 * 32;
    Xm_Drag_Context_Rec_Size : constant :=
       Xt_Core_Private.Core_Part_Size + Xm_Drag_Context_Part_Size;

    type Xm_Drag_Context_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Drag : Xm_Drag_Context_Part;
	end record;

    for Xm_Drag_Context_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Drag at 0 range Xt_Core_Private.Core_Part_Size ..
			       Xm_Drag_Context_Rec_Size - 1;
	end record;

    type Xm_Drag_Context_Class_Rec_Ptr is access Xm_Drag_Context_Class_Rec;
    type Xm_Drag_Context_Rec_Ptr is access Xm_Drag_Context_Rec;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Drag_Context_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Drag_Context_Class (X : in Xt.Widget_Class)
				      return Xm_Drag_Context_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Drag_Context_Rec_Ptr) return Xt.Widget;

    function To_Xm_Drag_Context (X : in Xt.Widget)
				return Xm_Drag_Context_Rec_Ptr;
end Xm_Drag_Context_Private;

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
