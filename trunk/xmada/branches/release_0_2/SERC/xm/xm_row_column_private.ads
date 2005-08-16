-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.


with X_Configuration_Dependent, X_Lib, Xt, Xm, Xt_Core_Private,
     Xt_Composite_Private, Xt_Constraint_Private, Xm_Private,
     X_Configuration_Dependent, Unchecked_Conversion;

package Xm_Row_Column_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Rc_Kid_Geometry_Rec is
	record
	    Kid : Xm.Xt_Widget;
	    Box : Xt.Xt_Ancillary_Types.Xt_Widget_Geometry_Ptr;
	    Margin_Top : Xt.Dimension;
	    Margin_Bottom : Xt.Dimension;
	    Baseline : Xt.Dimension;
	    Dummy : Xt.Dimension;
	end record;

    for Xm_Rc_Kid_Geometry_Rec use
	record
	    Kid at 0 * Word_Size range 0 .. 31;
	    Box at 1 * Word_Size range 0 .. 31;
	    Margin_Top at 2 * Word_Size range 0 .. 15;
	    Margin_Bottom at 2 * Word_Size + 2 range 0 .. 15;
	    Baseline at 3 * Word_Size range 0 .. 15;
	    Dummy at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type Xm_Rc_Kid_Geometry is access Xm_Rc_Kid_Geometry_Rec;

    type Xm_Row_Column_Part is
	record
	    Margin_Height : Xt.Dimension;  
	    Margin_Width : Xt.Dimension;  
	    Spacing : Xt.Dimension;  
	    Entry_Border : Xt.Dimension;  
	    Help_Pushbutton : Xm.Xt_Widget;  
	    Cascade_Btn : Xm.Xt_Widget;  
	    Option_Label : Xm.Xm_String;
	    Option_Submenu : Xm.Xt_Widget;  
	    Boxes : Xm_Rc_Kid_Geometry;
	    Entry_Class : Xt.Widget_Class;
	    Entry_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;  
	    Map_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;  
	    Unmap_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;  
	    Memory_Subwidget : Xm.Xt_Widget;  
	    Num_Columns : X_Configuration_Dependent.Short;
	    Menu_Post : Xt.Xt_String;
	    Post_Button : X_Configuration_Dependent.Unsigned_Int;
	    Post_Event_Type : X_Configuration_Dependent.Int;
	    Post_Modifiers : X_Configuration_Dependent.Unsigned_Int;
	    Menu_Accelerator : Xt.Xt_String;
	    Mnemonic : X_Lib.Keyboard.Key_Sym;  
	    Mnemonic_Char_Set : Xm.Xm_String_Char_Set_Ptr;
	    Entry_Alignment : X_Configuration_Dependent.Unsigned_Char;
	    Packing : X_Configuration_Dependent.Unsigned_Char;
	    Types : X_Configuration_Dependent.Unsigned_Char;
	    Orientation : X_Configuration_Dependent.Unsigned_Char;
	    Armed : Xm.Xm_Boolean;  
	    Adjust_Margin : Xm.Xm_Boolean;  
	    Adjust_Last : Xm.Xm_Boolean;  
	    Do_Alignment : Xm.Xm_Boolean;  
	    Radio : Xm.Xm_Boolean;  
	    Radio_One : Xm.Xm_Boolean;  
	    Homogeneous : Xm.Xm_Boolean;  
	    Resize_Width : Xm.Xm_Boolean;  
	    Resize_Height : Xm.Xm_Boolean;  
	    Popup_Enabled : Xm.Xm_Boolean;  
	    Old_Width : Xt.Dimension;  
	    Old_Height : Xt.Dimension;  
	    Old_Shadow_Thickness : Xt.Dimension;  
	    Post_From_List : Xt.Xt_Ancillary_Types.Widget_List_Ptr;
	    Post_From_Count : X_Configuration_Dependent.Int;
	    Post_From_List_Size : X_Configuration_Dependent.Int;
	    Last_Select_Top_Level : Xm.Xt_Widget;  
	    Popup_Posted : Xm.Xt_Widget;  
	    Old_Focus_Policy : X_Configuration_Dependent.Unsigned_Char;
	    Tear_Off_Model : X_Configuration_Dependent.Unsigned_Char;
	    Parent_Shell : Xm.Xt_Widget;
	    Tear_Off_Control : Xm.Xt_Widget;
	    To_State : Xm.Xm_Boolean;
	    Tear_Off_Activated_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Tear_Off_Deactivated_Callback :
	       Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Tear_Off_Lastselecttoplevel : Xm.Xt_Widget;
	    Tear_Off_Focus_Item : Xm.Xt_Widget;
	    Entry_Vertical_Alignment : X_Configuration_Dependent.Unsigned_Char;
	    Popup_Menu_Click : X_Configuration_Dependent.Unsigned_Char;
	    Popup_Timeout_Timer : Xt.Xt_Interval_Id;
	end record;

    for Xm_Row_Column_Part use
	record
	    Margin_Height at 0 * Word_Size range 0 .. 15;
	    Margin_Width at 0 * Word_Size + 2 range 0 .. 15;
	    Spacing at 1 * Word_Size range 0 .. 15;
	    Entry_Border at 1 * Word_Size + 2 range 0 .. 15;
	    Help_Pushbutton at 2 * Word_Size range 0 .. 31;
	    Cascade_Btn at 3 * Word_Size range 0 .. 31;
	    Option_Label at 4 * Word_Size range 0 .. 31;
	    Option_Submenu at 5 * Word_Size range 0 .. 31;
	    Boxes at 6 * Word_Size range 0 .. 31;
	    Entry_Class at 7 * Word_Size range 0 .. 31;
	    Entry_Callback at 8 * Word_Size range 0 .. 31;
	    Map_Callback at 9 * Word_Size range 0 .. 31;  
	    Unmap_Callback at 10 * Word_Size range 0 .. 31;
	    Memory_Subwidget at 11 * Word_Size range 0 .. 31;
	    Num_Columns at 12 * Word_Size range 0 .. 15;
	    Menu_Post at 13 * Word_Size range 0 .. 31;
	    Post_Button at 14 * Word_Size range 0 .. 31;
	    Post_Event_Type at 15 * Word_Size range 0 .. 31;
	    Post_Modifiers at 16 * Word_Size range 0 .. 31;
	    Menu_Accelerator at 17 * Word_Size range 0 .. 31;
	    Mnemonic at 18 * Word_Size range 0 .. 31;
	    Mnemonic_Char_Set at 19 * Word_Size range 0 .. 31;
	    Entry_Alignment at 20 * Word_Size range 0 .. 07;
	    Packing at 20 * Word_Size + 1 range 0 .. 07;
	    Types at 20 * Word_Size + 2 range 0 .. 07;
	    Orientation at 20 * Word_Size + 3 range 0 .. 07;
	    Armed at 21 * Word_Size range 0 .. 07;
	    Adjust_Margin at 21 * Word_Size + 1 range 0 .. 07;
	    Adjust_Last at 21 * Word_Size + 2 range 0 .. 07;
	    Do_Alignment at 21 * Word_Size + 3 range 0 .. 07;
	    Radio at 22 * Word_Size range 0 .. 07;
	    Radio_One at 22 * Word_Size + 1 range 0 .. 07;
	    Homogeneous at 22 * Word_Size + 2 range 0 .. 07;
	    Resize_Width at 22 * Word_Size + 3 range 0 .. 07;
	    Resize_Height at 23 * Word_Size range 0 .. 07;
	    Popup_Enabled at 23 * Word_Size + 1 range 0 .. 07;
	    Old_Width at 23 * Word_Size + 2 range 0 .. 15;
	    Old_Height at 24 * Word_Size range 0 .. 15;
	    Old_Shadow_Thickness at 24 * Word_Size + 2 range 0 .. 15;
	    Post_From_List at 25 * Word_Size range 0 .. 31;
	    Post_From_Count at 26 * Word_Size range 0 .. 31;
	    Post_From_List_Size at 27 * Word_Size range 0 .. 31;
	    Last_Select_Top_Level at 28 * Word_Size range 0 .. 31;
	    Popup_Posted at 29 * Word_Size range 0 .. 31;
	    Old_Focus_Policy at 30 * Word_Size range 0 .. 7;
	    Tear_Off_Model at 30 * Word_Size + 1 range 0 .. 7;
	    Parent_Shell at 31 * Word_Size range 0 .. 31;
	    Tear_Off_Control at 32 * Word_Size range 0 .. 31;
	    To_State at 33 * Word_Size range 0 .. 7;
	    Tear_Off_Activated_Callback at 34 * Word_Size range 0 .. 31;
	    Tear_Off_Deactivated_Callback at 35 * Word_Size range 0 .. 31;
	    Tear_Off_Lastselecttoplevel at 36 * Word_Size range 0 .. 31;
	    Tear_Off_Focus_Item at 37 * Word_Size range 0 .. 31;
	    Entry_Vertical_Alignment at 38 * Word_Size range 0 .. 7;
	    Popup_Menu_Click at 38 * Word_Size + 1 range 0 .. 7;
	    Popup_Timeout_Timer at 39 * Word_Size range 0 .. 31;
	end record;

    Xm_Row_Column_Part_Size : constant := 40 * 32;
    Xm_Row_Column_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Rec_Size + Xm_Row_Column_Part_Size;

    type Xm_Row_Column_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Xt_Constraint_Private.Constraint_Part;
	    Manager : Xm_Private.Xm_Manager_Part;
	    Row_Column : Xm_Row_Column_Part;
	end record;

    for Xm_Row_Column_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Constraint at 0
	       range Xt_Composite_Private.Composite_Rec_Size ..
			Xt_Constraint_Private.Constraint_Rec_Size - 1;
	    Manager at 0 range Xt_Constraint_Private.Constraint_Rec_Size ..
				  Xm_Private.Xm_Manager_Rec_Size - 1;
	    Row_Column at 0 range Xm_Private.Xm_Manager_Rec_Size ..
				     Xm_Row_Column_Rec_Size - 1;
	end record;

    type Xm_Row_Column_Widget_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Xt_Constraint_Private.Constraint_Part;
	    Manager : Xm_Private.Xm_Manager_Part;
	    Row_Column : Xm_Row_Column_Part;
	end record;

    for Xm_Row_Column_Widget_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Constraint at 0
	       range Xt_Composite_Private.Composite_Rec_Size ..
			Xt_Constraint_Private.Constraint_Rec_Size - 1;
	    Manager at 0 range Xt_Constraint_Private.Constraint_Rec_Size ..
				  Xm_Private.Xm_Manager_Rec_Size - 1;
	    Row_Column at 0 range Xm_Private.Xm_Manager_Rec_Size ..
				     Xm_Row_Column_Rec_Size - 1;
	end record;

    type Xm_Row_Column_Class_Part is
	record
	    Menu_Procedures : Xm_Private.Xm_Menu_Proc;
	    Arm_And_Activate : Xt.Xt_Action_Proc;
	    Traversal_Handler : Xm_Private.Xm_Menu_Traversal_Proc;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Row_Column_Class_Part use
	record
	    Menu_Procedures at 0 * Word_Size range 0 .. 31;
	    Arm_And_Activate at 1 * Word_Size range 0 .. 31;
	    Traversal_Handler at 2 * Word_Size range 0 .. 31;
	    Extension at 3 * Word_Size range 0 .. 31;
	end record;

    Xm_Row_Column_Class_Part_Size : constant := 4 * 32;
    Xm_Row_Column_Class_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Class_Rec_Size + Xm_Row_Column_Class_Part_Size;

    type Xm_Row_Column_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Constraint_Class : Xt_Constraint_Private.Constraint_Class_Part;
	    Manager_Class : Xm_Private.Xm_Manager_Class_Part;
	    Row_Column_Class : Xm_Row_Column_Class_Part;
	end record;

    for Xm_Row_Column_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xt_Composite_Private.Composite_Class_Rec_Size - 1;
	    Constraint_Class at 0
	       range Xt_Composite_Private.Composite_Class_Rec_Size ..
			Xt_Constraint_Private.Constraint_Class_Rec_Size - 1;
	    Manager_Class at 0
	       range Xt_Constraint_Private.Constraint_Class_Rec_Size ..
			Xm_Private.Xm_Manager_Class_Rec_Size - 1;
	    Row_Column_Class at 0 range Xm_Private.Xm_Manager_Class_Rec_Size ..
					   Xm_Row_Column_Class_Rec_Size - 1;
	end record;

    type Xm_Row_Column_Constraint_Part is
	record
	    Was_Managed : Xm.Xm_Boolean;
	    Margin_Top : Xt.Dimension;
	    Margin_Bottom : Xt.Dimension;
	    Baseline : Xt.Dimension;
	    Position_Index : X_Configuration_Dependent.Short;
	    Dummy : X_Configuration_Dependent.Short;
	end record;

    for Xm_Row_Column_Constraint_Part use
	record
	    Was_Managed at 0 * Word_Size range 0 .. 07;
	    Margin_Top at 0 * Word_Size + 2 range 0 .. 15;
	    Margin_Bottom at 1 * Word_Size range 0 .. 15;
	    Baseline at 1 * Word_Size + 2 range 0 .. 15;
	    Position_Index at 2 * Word_Size range 0 .. 15;
	    Dummy at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    Xm_Row_Column_Constraint_Part_Size : constant := 32 * 3;
    Xm_Row_Column_Constraint_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Constraint_Rec_Size +
	  Xm_Row_Column_Constraint_Part_Size;

    type Xm_Row_Column_Constraint_Rec is
	record
	    Manager : Xm_Private.Xm_Manager_Constraint_Part;
	    Row_Column : Xm_Row_Column_Constraint_Part;
	end record;

    for Xm_Row_Column_Constraint_Rec use
	record
	    Manager at 0
	       range 0 .. Xm_Private.Xm_Manager_Constraint_Rec_Size - 1;
	    Row_Column at 0 range Xm_Private.Xm_Manager_Constraint_Rec_Size ..
				     Xm_Row_Column_Constraint_Rec_Size - 1;
	end record;

    -- Button Event Status Record for popup verification at manage time

    type Xm_Button_Event_Status_Rec is
	record
	    Time : X_Lib.Time;
	    Verified : Xm.Xm_Boolean;
	    Waiting_To_Be_Managed : Xm.Xm_Boolean;
	    Event : X_Lib.Events.Event_Type;
	end record;

    for Xm_Button_Event_Status_Rec use
	record
	    Time at 0 * Word_Size range 0 .. 31;
	    Verified at 1 * Word_Size range 0 .. 07;
	    Waiting_To_Be_Managed at 1 * Word_Size range 8 .. 15;
	    Event at 2 * Word_Size range 0 .. 31;
	end record;

    Xm_Button_Event_Status_Rec_Size : constant := 3 * 32;

    type Xm_Replay_Info_Rec is
	record
	    Time : X_Lib.Time;
	    Toplevel_Menu : Xm.Xt_Widget;
	end record;

    for Xm_Replay_Info_Rec use
	record
	    Time at 0 * Word_Size range 0 .. 31;
	    Toplevel_Menu at 1 * Word_Size range 0 .. 31;
	end record;

    type Xm_Row_Column_Rec_Ptr is access Xm_Row_Column_Rec;
    type Xm_Row_Column_Class_Rec_Ptr is access Xm_Row_Column_Class_Rec;
    type Xm_Row_Column_Constraint_Rec_Ptr is
       access Xm_Row_Column_Constraint_Rec;
    type Xm_Button_Event_Status_Rec_Ptr is access Xm_Button_Event_Status_Rec;

    function To_Widget_Class
		(X : in Xm_Row_Column_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Row_Column_Class (X : in Xt.Widget_Class)
				    return Xm_Row_Column_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Row_Column_Rec_Ptr) return Xt.Widget;

    function To_Xm_Row_Column (X : in Xt.Widget) return Xm_Row_Column_Rec_Ptr;

end Xm_Row_Column_Private;

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

