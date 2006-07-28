-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xt_Object, Xm, Xm_Drag_Context;

package Xm_Drop_Site_Manager is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Drag_Callback_Reason is
       (Xmcr_Drop_Site_Leave_Message, Xmcr_Drop_Site_Enter_Message,
	Xmcr_Drop_Site_Motion_Message, Xmcr_Drop_Message);
    for Xm_Drag_Callback_Reason'Size use Xm.Xm_Enum_Length;
    for Xm_Drag_Callback_Reason use (Xmcr_Drop_Site_Leave_Message => 1,
				     Xmcr_Drop_Site_Enter_Message => 2,
				     Xmcr_Drop_Site_Motion_Message => 3,
				     Xmcr_Drop_Message => 4);

    type Xm_Drop_Site_Status is
       (Xmno_Drop_Site, Xminvalid_Drop_Site, Xmvalid_Drop_Site);
    for Xm_Drop_Site_Status'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;
    for Xm_Drop_Site_Status use
       (Xmno_Drop_Site => 1, Xminvalid_Drop_Site => 2, Xmvalid_Drop_Site => 3);

    type Xm_Drag_Under_Animation_Style is
       (Xmdrag_Under_None, Xmdrag_Under_Pixmap, Xmdrag_Under_Shadow_In,
	Xmdrag_Under_Shadow_Out, Xmdrag_Under_Highlight);
    for Xm_Drag_Under_Animation_Style'Size use
       Xt.Xt_Ancillary_Types.Xt_Enum'Size;

    type Xm_Drop_Site_Type is (Xmdrop_Site_Simple, Xmdrop_Site_Composite,
			       Xmdrop_Site_Simple_Clip_Only,
			       Xmdrop_Site_Composite_Clip_Only);
    for Xm_Drop_Site_Type'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;
    for Xm_Drop_Site_Type use (Xmdrop_Site_Simple => 0,
			       Xmdrop_Site_Composite => 1,
			       Xmdrop_Site_Simple_Clip_Only => 128,
			       Xmdrop_Site_Composite_Clip_Only => 129);

    type Xm_Stack_Position is (Xmabove, Xmbelow);
    for Xm_Stack_Position'Size use Xm.Xm_Enum_Length;
    for Xm_Stack_Position use (Xmabove => 0, Xmbelow => 1);

    type Xm_Drop_Site_Activity is (Xmdrop_Site_Active, Xmdrop_Site_Inactive);
    for Xm_Drop_Site_Activity'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;

    type Xm_Drag_Proc_Callback_Rec is
	record
	    Reason : X_Lib.X_Integer;
	    Event : X_Lib.Events.Event;
	    Time_Stamp : X_Lib.Time;
	    Drag_Context : Xm.Xt_Widget;
	    X : Xt.Position;
	    Y : Xt.Position;
	    Drop_Site_Status : Xm_Drop_Site_Status;
	    Operation : Xm_Drag_Context.Xm_Drop_Operation_Type;
	    Operations : Xm_Drag_Context.Xm_Drop_Operation_Type;
	    Animate : Xm.Xm_Boolean;
	end record;

    for Xm_Drag_Proc_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Time_Stamp at 2 * Word_Size range 0 .. 31;
	    Drag_Context at 3 * Word_Size range 0 .. 31;
	    X at 4 * Word_Size range 0 .. 15;
	    Y at 4 * Word_Size + 2 range 0 .. 15;
	    Drop_Site_Status at 5 * Word_Size range 0 .. 7;
	    Operation at 5 * Word_Size + 1 range 0 .. 7;
	    Operations at 5 * Word_Size + 2 range 0 .. 7;
	    Animate at 5 * Word_Size + 3 range 0 .. 7;
	end record;

    type Xm_Drag_Proc_Callback_Rec_Ptr is access Xm_Drag_Proc_Callback_Rec;

    type Xm_Drop_Proc_Callback_Rec is
	record
	    Reason : Xm_Drag_Context.Xm_Drag_Drop_Callback_Reason;
	    Event : X_Lib.Events.Event;
	    Time_Stamp : X_Lib.Time;
	    Drag_Context : Xm.Xt_Widget;
	    X : Xt.Position;
	    Y : Xt.Position;
	    Drop_Site_Status : Xm_Drop_Site_Status;
	    Operation : Xm_Drag_Context.Xm_Drop_Operation_Type;
	    Operations : Xm_Drag_Context.Xm_Drop_Operation_Type;
	    Drop_Action : Xm_Drag_Context.Xm_Completion_Status;
	end record;

    for Xm_Drop_Proc_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Time_Stamp at 2 * Word_Size range 0 .. 31;
	    Drag_Context at 3 * Word_Size range 0 .. 31;
	    X at 4 * Word_Size range 0 .. 15;
	    Y at 4 * Word_Size + 2 range 0 .. 15;
	    Drop_Site_Status at 5 * Word_Size range 0 .. 7;
	    Operation at 5 * Word_Size + 1 range 0 .. 7;
	    Operations at 5 * Word_Size + 2 range 0 .. 7;
	    Drop_Action at 5 * Word_Size + 3 range 0 .. 7;
	end record;

    type Xm_Drop_Proc_Callback_Rec_Ptr is access Xm_Drop_Proc_Callback_Rec;

    type Xm_Drop_Site_Visuals_Rec is
	record
	    Background : X_Lib.Pixel;
	    Foreground : X_Lib.Pixel;
	    Top_Shadow_Color : X_Lib.Pixel;
	    Top_Shadow_Pixmap : X_Lib.Pixmap;
	    Bottom_Shadow_Color : X_Lib.Pixel;
	    Bottom_Shadow_Pixmap : X_Lib.Pixmap;
	    Shadow_Thickness : Xt.Dimension;
	    Highlight_Color : X_Lib.Pixel;
	    Highlight_Pixmap : X_Lib.Pixmap;
	    Highlight_Thickness : Xt.Dimension;
	    Border_Width : Xt.Dimension;
	end record;

    for Xm_Drop_Site_Visuals_Rec use
	record
	    Background at 0 * Word_Size range 0 .. 31;
	    Foreground at 1 * Word_Size range 0 .. 31;
	    Top_Shadow_Color at 2 * Word_Size range 0 .. 31;
	    Top_Shadow_Pixmap at 3 * Word_Size range 0 .. 31;
	    Bottom_Shadow_Color at 4 * Word_Size range 0 .. 31;
	    Bottom_Shadow_Pixmap at 5 * Word_Size range 0 .. 31;
	    Shadow_Thickness at 6 * Word_Size range 0 .. 15;
	    Highlight_Color at 7 * Word_Size range 0 .. 31;
	    Highlight_Pixmap at 8 * Word_Size range 0 .. 31;
	    Highlight_Thickness at 9 * Word_Size range 0 .. 15;
	    Border_Width at 9 * Word_Size + 2 range 0 .. 15;
	end record;

    type Xm_Drop_Site_Visuals is access Xm_Drop_Site_Visuals_Rec;

    subtype Drop_Site_Manager_Object is Xt_Object.Obj_Widget;
    subtype Drop_Site_Manager_Object_Class is Xt_Object.Obj_Class;

    function Xm_Drop_Site_Manager_Object_Class
		return Drop_Site_Manager_Object_Class;

    function Xm_Is_Drop_Site_Manager (W : in Xm.Xt_Widget) return Boolean;

    procedure Xm_Drop_Site_Register
		 (W : in Xm.Xt_Widget;
		  Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List);

    procedure Xm_Drop_Site_Unregister (W : in Xm.Xt_Widget);

    procedure Xm_Drop_Site_Start_Update (Ref_Widget : in Xm.Xt_Widget);

    procedure Xm_Drop_Site_Update
		 (Enclosing_Widget : in Xm.Xt_Widget;
		  Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List);

    procedure Xm_Drop_Site_End_Update (Ref_Widget : in Xm.Xt_Widget);

    procedure Xm_Drop_Site_Retrieve
		 (Enclosing_Widget : in Xm.Xt_Widget;
		  Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List);

    procedure Xm_Drop_Site_Query_Stacking_Order
		 (W : in Xm.Xt_Widget;
		  Parent_Rtn : out Xm.Xt_Widget;
		  Children_Rtn : out Xt.Xt_Ancillary_Types.Xt_Widget_List;
		  Num_Children : out Xt.Cardinal;
		  Ret_Val : out X_Lib.X_Integer);

    procedure Xm_Drop_Site_Configure_Stacking_Order
		 (W : in Xm.Xt_Widget;
		  Sibling : in Xm.Xt_Widget;
		  Stack_Mode : in Xt.Cardinal);

    function Xm_Drop_Site_Get_Active_Visuals
		(W : in Xm.Xt_Widget) return Xm_Drop_Site_Visuals;

end Xm_Drop_Site_Manager;

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
