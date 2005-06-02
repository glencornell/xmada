-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with Xm, Xt, X_Lib, X_Configuration_Dependent;

package Xm_Row_Column is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    type Xm_Row_Column_Callback_Rec is
	record
	    Reason : Xm.Callback_Reason;
	    Event_Ptr : Xm.X_Event_Ptr;
	    Widget : Xm.Xt_Widget;
	    Data : Xt.Xt_Pointer;
	    Callback_Rec : Xt.Xt_Pointer;
	end record;
    for Xm_Row_Column_Callback_Rec use
	record
	    Reason at 0 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Event_Ptr at 1 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Widget at 2 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Data at 3 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Callback_Rec at 4 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	end record;
    type Xm_Row_Column_Callback_Rec_Ptr is access Xm_Row_Column_Callback_Rec;

    subtype Row_Column_Class is Xm.Manager_Class;
    subtype Row_Column_Widget is Xm.Manager_Widget;

    subtype Option_Menu_Class is Row_Column_Class;
    subtype Option_Menu_Widget is Row_Column_Widget;

    function Xm_Row_Column_Widget_Class return Row_Column_Class;

    function Xm_Is_Row_Column (W : Xm.Xt_Widget) return Boolean;

    function Xm_Create_Radio_Box
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;

    function Xm_Create_Row_Column
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;

    function Xm_Create_Work_Area
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;

    function Xm_Create_Popup_Menu
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;

    function Xm_Create_Pulldown_Menu
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;

    function Xm_Create_Option_Menu
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;

    function Xm_Create_Menu_Bar
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;

    procedure Xm_Menu_Position (Parent : in Xm.Xt_Widget;
				The_Event : in X_Lib.Events.Button_Event);

    function Xm_Option_Label_Gadget (M : Xm.Xt_Widget) return Xm.Xt_Widget;

    function Xm_Option_Button_Gadget (M : Xm.Xt_Widget) return Xm.Xt_Widget;

    function Xm_Get_Posted_From_Widget
		(Menu : Xm.Xt_Widget) return Xm.Xt_Widget;

    procedure Xm_Add_To_Post_From_List
		 (Menu_Wid : in Xm.Xt_Widget; Wid : in Xm.Xt_Widget);

    procedure Xm_Remove_From_Post_From_List
		 (Menu_Wid : in Xm.Xt_Widget; Wid : in Xm.Xt_Widget);

    function Xm_Get_Tear_Off_Control
		(Menu : in Xm.Xt_Widget) return Xm.Xt_Widget;

end Xm_Row_Column;

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
