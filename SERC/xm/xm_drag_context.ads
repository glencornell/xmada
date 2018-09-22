-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib, X_Configuration_Dependent, Xt, Xt_Core,
     Xm, Unchecked_Conversion, Xm_Display;

package Xm_Drag_Context is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    Xm_Help : constant := 2;

    subtype Xm_Id is X_Configuration_Dependent.Unsigned_Int;

    type Xm_Message_Type is (Xmtop_Level_Enter, Xmtop_Level_Leave,
			     Xmdrag_Motion, Xmdrop_Site_Enter,
			     Xmdrop_Site_Leave, Xmdrop_Start, Xmdrop_Finish,
			     Xmdrag_Drop_Finish, Xmoperation_Changed);
    for Xm_Message_Type'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;

    type Xm_Completion_Status is (Xmdrop, Xmdrop_Help,
				  Xmdrop_Cancel, Xmdrop_Interrupt);
    for Xm_Completion_Status'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;

    function To_X_Character is new Unchecked_Conversion
				      (Integer, X_Lib.X_Character);

    -- values for operation
    type Xm_Drop_Operation_Type is
       (Xmdrop_Noop, Xmdrop_Move, Xmdrop_Copy, Xmdrop_Link);
    for Xm_Drop_Operation_Type'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;
    for Xm_Drop_Operation_Type use
       (Xmdrop_Noop => 0, Xmdrop_Move => 1, Xmdrop_Copy => 2, Xmdrop_Link => 4);

    type Xm_Blend_Type is (Xmblend_All, Xmblend_State_Source,
			   Xmblend_Just_Source, Xmblend_None);
    for Xm_Blend_Type'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;

    --(ms) The Apex compiler will not allow the 32-bit enumeration value  to
    --     be sized at 8 bits later in a record representation clause.  We
    --     need to make it the proper size here.  Note: the C code does
    --     not use the enumeration nor does it assign it a typename. It uses
    --     unsigned char.
    type Xm_Drop_Type is (Xmdrop_Failure, Xmdrop_Success);
    --for Xm_Drop_Type'Size use Xm.Xm_Enum_Length;
    for Xm_Drop_Type'Size use 8;

    type Xm_Drag_Drop_Callback_Reason is
       (Xmcr_Top_Level_Enter, Xmcr_Top_Level_Leave, Xmcr_Drag_Motion,
	Xmcr_Drop_Site_Enter, Xmcr_Drop_Site_Leave, Xmcr_Drop_Start,
	Xmcr_Drop_Finish, Xmcr_Drag_Drop_Finish, Xmcr_Operation_Changed);
    for Xm_Drag_Drop_Callback_Reason'Size use Xm.Xm_Enum_Length;

    type Xm_Any_Icc_Callback_Rec is
	record
	    Reason : Xm_Drag_Drop_Callback_Reason;
	    Event : X_Lib.Events.Event;
	    Time_Stamp : X_Lib.Time;
	end record;

    for Xm_Any_Icc_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Time_Stamp at 2 * Word_Size range 0 .. 31;
	end record;

    type Xm_Any_Icc_Callback_Rec_Ptr is access Xm_Any_Icc_Callback_Rec;

    type Xm_Toplevel_Enter_Callback_Rec is
	record
	    Reason : Xm_Drag_Drop_Callback_Reason;
	    Event : X_Lib.Events.Event;
	    Time_Stamp : X_Lib.Time;
	    Screen : X_Lib.Screen;
	    Window : X_Lib.Window;
	    X : Xt.Position;
	    Y : Xt.Position;
	    Drag_Protocol_Style : Xm_Display.Xm_Drag_Protocol_Style;
	    Icc_Handle : X_Lib.Atoms.Atom;
	end record;

    for Xm_Toplevel_Enter_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Time_Stamp at 2 * Word_Size range 0 .. 31;
	    Screen at 3 * Word_Size range 0 .. 31;
	    Window at 4 * Word_Size range 0 .. 31;
	    X at 5 * Word_Size range 0 .. 15;
	    Y at 5 * Word_Size range 16 .. 31;
	    Drag_Protocol_Style at 6 * Word_Size range 0 .. 7;
	    Icc_Handle at 7 * Word_Size range 0 .. 31;
	end record;

    Xm_Toplevel_Enter_Callback_Rec_Size : constant := 8 * 32;

    type Xm_Top_Level_Enter_Callback_Rec_Ptr is
       access Xm_Toplevel_Enter_Callback_Rec;

    type Xm_Top_Level_Leave_Callback_Rec is
	record
	    Reason : Xm_Drag_Drop_Callback_Reason;
	    Event : X_Lib.Events.Event;
	    Time_Stamp : X_Lib.Time;
	    Screen : X_Lib.Screen;
	    Window : X_Lib.Window;
	end record;

    for Xm_Top_Level_Leave_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Time_Stamp at 2 * Word_Size range 0 .. 31;
	    Screen at 3 * Word_Size range 0 .. 31;
	    Window at 4 * Word_Size range 0 .. 31;
	end record;

    type Xm_Top_Level_Leave_Callback_Rec_Ptr is
       access Xm_Top_Level_Leave_Callback_Rec;

    type Xm_Drop_Site_Enter_Callback_Rec is
	record
	    Reason : Xm_Drag_Drop_Callback_Reason;
	    Event : X_Lib.Events.Event;
	    Time_Stamp : X_Lib.Time;
	    Operation : Xm_Drop_Operation_Type;
	    Operations : Xm_Drop_Operation_Type;
	    Drop_Site_Status : X_Configuration_Dependent.Unsigned_Char;
	    X : Xt.Position;
	    Y : Xt.Position;
	end record;

    for Xm_Drop_Site_Enter_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Time_Stamp at 2 * Word_Size range 0 .. 31;
	    Operation at 3 * Word_Size range 0 .. 7;
	    Operations at 3 * Word_Size range 8 .. 15;
	    Drop_Site_Status at 3 * Word_Size range 16 .. 23;
	    X at 4 * Word_Size range 0 .. 15;
	    Y at 4 * Word_Size range 16 .. 31;
	end record;

    type Xm_Drop_Site_Enter_Callback_Rec_Ptr is
       access Xm_Drop_Site_Enter_Callback_Rec;

    type Xm_Drop_Site_Leave_Callback_Rec is
	record
	    Reason : Xm_Drag_Drop_Callback_Reason;
	    Event : X_Lib.Events.Event;
	    Time_Stamp : X_Lib.Time;
	end record;

    for Xm_Drop_Site_Leave_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Time_Stamp at 2 * Word_Size range 0 .. 31;
	end record;

    type Xm_Drop_Site_Leave_Callback_Rec_Ptr is
       access Xm_Drop_Site_Leave_Callback_Rec;

    type Xm_Drag_Motion_Callback_Rec is
	record
	    Reason : Xm_Drag_Drop_Callback_Reason;
	    Event : X_Lib.Events.Event;
	    Time_Stamp : X_Lib.Time;
	    Operation : Xm_Drop_Operation_Type;
	    Operations : Xm_Drop_Operation_Type;
	    Drop_Site_Status : X_Configuration_Dependent.Unsigned_Char;
	    X : Xt.Position;
	    Y : Xt.Position;
	end record;

    for Xm_Drag_Motion_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Time_Stamp at 2 * Word_Size range 0 .. 31;
	    Operation at 3 * Word_Size range 0 .. 7;
	    Operations at 3 * Word_Size range 8 .. 15;
	    Drop_Site_Status at 3 * Word_Size range 16 .. 23;
	    X at 4 * Word_Size range 0 .. 15;
	    Y at 4 * Word_Size range 16 .. 31;
	end record;

    type Xm_Drag_Motion_Callback_Rec_Ptr is access Xm_Drag_Motion_Callback_Rec;

    type Xm_Operation_Changed_Callback_Rec is
	record
	    Reason : Xm_Drag_Drop_Callback_Reason;
	    Event : X_Lib.Events.Event;
	    Time_Stamp : X_Lib.Time;
	    Operation : Xm_Drop_Operation_Type;
	    Operations : Xm_Drop_Operation_Type;
	    Drop_Site_Status : X_Configuration_Dependent.Unsigned_Char;
	    Dummy : X_Configuration_Dependent.Unsigned_Char;
	end record;

    for Xm_Operation_Changed_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Time_Stamp at 2 * Word_Size range 0 .. 31;
	    Operation at 3 * Word_Size range 0 .. 7;
	    Operations at 3 * Word_Size range 8 .. 15;
	    Drop_Site_Status at 3 * Word_Size range 16 .. 23;
	    Dummy at 3 * Word_Size range 24 .. 31;
	end record;

    type Xm_Operation_Changed_Callback_Rec_Ptr is
       access Xm_Operation_Changed_Callback_Rec;

    type Xm_Drop_Start_Callback_Rec is
	record
	    Reason : Xm_Drag_Drop_Callback_Reason;
	    Event : X_Lib.Events.Event;
	    Time_Stamp : X_Lib.Time;
	    Operation : Xm_Drop_Operation_Type;
	    Operations : Xm_Drop_Operation_Type;
	    Drop_Site_Status : X_Configuration_Dependent.Unsigned_Char;
	    Drop_Action : Xm_Completion_Status;
	    X : Xt.Position;
	    Y : Xt.Position;
	    Window : X_Lib.Window;
	    Icc_Handle : X_Lib.Atoms.Atom;
	end record;

    for Xm_Drop_Start_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Time_Stamp at 2 * Word_Size range 0 .. 31;
	    Operation at 3 * Word_Size range 0 .. 7;
	    Operations at 3 * Word_Size range 8 .. 15;
	    Drop_Site_Status at 3 * Word_Size range 16 .. 23;
	    Drop_Action at 3 * Word_Size range 24 .. 31;
	    X at 4 * Word_Size range 0 .. 15;
	    Y at 4 * Word_Size range 16 .. 31;
	    Window at 5 * Word_Size range 0 .. 31;
	    Icc_Handle at 6 * Word_Size range 0 .. 31;
	end record;

    type Xm_Drop_Start_Callback_Rec_Ptr is access Xm_Drop_Start_Callback_Rec;

    type Xm_Drop_Finish_Callback_Rec is
	record
	    Reason : Xm_Drag_Drop_Callback_Reason;
	    Event : X_Lib.Events.Event;
	    Time_Stamp : X_Lib.Time;
	    Operation : Xm_Drop_Operation_Type;
	    Operations : Xm_Drop_Operation_Type;
	    Drop_Site_Status : X_Configuration_Dependent.Unsigned_Char;
	    Drop_Action : Xm_Completion_Status;
	    Completion_Status : Xm_Drop_Type;
	    Dummy : X_Lib.X_Character;
	end record;

    for Xm_Drop_Finish_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Time_Stamp at 2 * Word_Size range 0 .. 31;
	    Operation at 3 * Word_Size range 0 .. 7;
	    Operations at 3 * Word_Size range 8 .. 15;
	    Drop_Site_Status at 3 * Word_Size range 16 .. 23;
	    Drop_Action at 3 * Word_Size range 24 .. 31;
	    Completion_Status at 4 * Word_Size range 0 .. 7;
	    Dummy at 4 * Word_Size + 3 range 0 .. 7;
	end record;

    type Xm_Drop_Finish_Callback_Ptr is access Xm_Drop_Finish_Callback_Rec;

    type Xm_Drag_Drop_Finish_Callback_Rec is
	record
	    Reason : Xm_Drag_Drop_Callback_Reason;
	    Event : X_Lib.Events.Event;
	    Time_Stamp : X_Lib.Time;
	end record;

    for Xm_Drag_Drop_Finish_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Time_Stamp at 2 * Word_Size range 0 .. 31;
	end record;

    type Xm_Drag_Drop_Finish_Callback_Rec_Ptr is
       access Xm_Drag_Drop_Finish_Callback_Rec;

--    subtype Drag_Context_Widget is Xt_Core.Core_Widget;
--    subtype Drag_Context_Class is Xt_Core.Core_Class;
--
--    function Xm_Drag_Context_Widget_Class return Drag_Context_Class;
--
--    function Xm_Is_Drag_Context (W : in Xm.Xt_Widget) return Boolean;

    function Xm_Drag_Start (W : in Xm.Xt_Widget;
			    Event : in X_Lib.Events.Event;
			    Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
			   return Xm.Xt_Widget;

    procedure Xm_Drag_Cancel (Drag_Context : in Xm.Xt_Widget);

    function Xm_Targets_Are_Compatible
		(Dpy : in X_Lib.Display;
		 Export_Targets : in X_Lib.Atoms.Atom_List;
		 Import_Targets : in X_Lib.Atoms.Atom_List) return Boolean;

end Xm_Drag_Context;

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
