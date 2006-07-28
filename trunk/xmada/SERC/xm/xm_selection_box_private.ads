-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm, Xt_Core_Private,
     Xt_Composite_Private, Xt_Constraint_Private, Xm_Private,
     Xm_Bulletin_Board_Private, Unchecked_Conversion;

package Xm_Selection_Box_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    Xmsb_Max_Widgets_Vert : constant := 8;

    Xmunspecified : constant := 1;

    type Xm_Selection_Box_Class_Part is
	record
	    List_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Selection_Box_Class_Part use
	record
	    List_Callback at 0 * Word_Size range 0 .. 31;
	    Extension at 1 * Word_Size range 0 .. 31;
	end record;

    Xm_Selection_Box_Class_Part_Size : constant := 2 * 32;
    Xm_Selection_Box_Class_Rec_Size : constant :=
       Xm_Bulletin_Board_Private.Xm_Bulletin_Board_Class_Rec_Size +
	  Xm_Selection_Box_Class_Part_Size;

    type Xm_Selection_Box_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Constraint_Class : Xt_Constraint_Private.Constraint_Class_Part;
	    Manager_Class : Xm_Private.Xm_Manager_Class_Part;
	    Bulletin_Board_Class : Xm_Bulletin_Board_Private.
				      Xm_Bulletin_Board_Class_Part;
	    Selection_Box_Class : Xm_Selection_Box_Class_Part;
	end record;

    for Xm_Selection_Box_Class_Rec use
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
	    Bulletin_Board_Class at 0
	       range Xm_Private.Xm_Manager_Class_Rec_Size ..
			Xm_Bulletin_Board_Private.
			   Xm_Bulletin_Board_Class_Rec_Size - 1;
	    Selection_Box_Class at 0
	       range Xm_Bulletin_Board_Private.
		     Xm_Bulletin_Board_Class_Rec_Size ..
			Xm_Selection_Box_Class_Rec_Size - 1;
	end record;

    type Xm_Selection_Box_Part is
	record
	    List_Label : Xt.Widget;
	    List_Label_String : Xm.Xm_String;
	    List : Xt.Widget;
	    List_Items : Xm.Xm_String;
	    List_Item_Count : X_Configuration_Dependent.Int;
	    List_Visible_Item_Count : X_Configuration_Dependent.Int;
	    List_Selected_Item_Position : X_Configuration_Dependent.Int;
	    Selection_Label : Xt.Widget;
	    Selection_Label_String : Xm.Xm_String;
	    Text : Xt.Widget;
	    Text_String : Xm.Xm_String;
	    Text_Columns : X_Configuration_Dependent.Short;
	    Work_Area : Xt.Widget;
	    Separator : Xt.Widget;
	    Ok_Button : Xt.Widget;
	    Ok_Label_String : Xm.Xm_String;
	    Apply_Button : Xt.Widget;
	    Apply_Label_String : Xm.Xm_String;
	    Cancel_Label_String : Xm.Xm_String;
	    Help_Button : Xt.Widget;
	    Help_Label_String : Xm.Xm_String;
	    Ok_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Apply_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Cancel_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    No_Match_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Text_Accelerators : Xt.Xt_Translation_Management.Xt_Accelerators;
	    Must_Match : Xm.Xm_Boolean;
	    Adding_Sel_Widgets : Xm.Xm_Boolean;
	    Minimize_Buttons : Xm.Xm_Boolean;
	    Dialog_Type : X_Configuration_Dependent.Unsigned_Char;
	    Child_Placement : X_Configuration_Dependent.Unsigned_Char;
	    Dummy : X_Configuration_Dependent.Unsigned_Char;
	end record;

    for Xm_Selection_Box_Part use
	record
	    List_Label at 0 * Word_Size range 0 .. 31;
	    List_Label_String at 1 * Word_Size range 0 .. 31;
	    List at 2 * Word_Size range 0 .. 31;
	    List_Items at 3 * Word_Size range 0 .. 31;
	    List_Item_Count at 4 * Word_Size range 0 .. 31;
	    List_Visible_Item_Count at 5 * Word_Size range 0 .. 31;
	    List_Selected_Item_Position at 6 * Word_Size range 0 .. 31;
	    Selection_Label at 7 * Word_Size range 0 .. 31;
	    Selection_Label_String at 8 * Word_Size range 0 .. 31;
	    Text at 9 * Word_Size range 0 .. 31;
	    Text_String at 10 * Word_Size range 0 .. 31;
	    Text_Columns at 11 * Word_Size range 0 .. 15;
	    Work_Area at 12 * Word_Size range 0 .. 31;
	    Separator at 13 * Word_Size range 0 .. 31;
	    Ok_Button at 14 * Word_Size range 0 .. 31;
	    Ok_Label_String at 15 * Word_Size range 0 .. 31;
	    Apply_Button at 16 * Word_Size range 0 .. 31;
	    Apply_Label_String at 17 * Word_Size range 0 .. 31;
	    Cancel_Label_String at 18 * Word_Size range 0 .. 31;
	    Help_Button at 19 * Word_Size range 0 .. 31;
	    Help_Label_String at 20 * Word_Size range 0 .. 31;
	    Ok_Callback at 21 * Word_Size range 0 .. 31;
	    Apply_Callback at 22 * Word_Size range 0 .. 31;
	    Cancel_Callback at 23 * Word_Size range 0 .. 31;
	    No_Match_Callback at 24 * Word_Size range 0 .. 31;
	    Text_Accelerators at 25 * Word_Size range 0 .. 31;
	    Must_Match at 26 * Word_Size range 0 .. 7;
	    Adding_Sel_Widgets at 26 * Word_Size + 1 range 0 .. 7;
	    Minimize_Buttons at 26 * Word_Size + 2 range 0 .. 7;
	    Dialog_Type at 26 * Word_Size + 3 range 0 .. 7;
	    Child_Placement at 27 * Word_Size range 0 .. 7;
	    Dummy at 27 * Word_Size + 3 range 0 .. 7;
	end record;

    Xm_Selection_Box_Part_Size : constant := 28 * 32;
    Xm_Selection_Box_Rec_Size : constant :=
       Xm_Bulletin_Board_Private.Xm_Bulletin_Board_Rec_Size +
	  Xm_Selection_Box_Part_Size;

    type Xm_Selection_Box_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Xt_Constraint_Private.Constraint_Part;
	    Manager : Xm_Private.Xm_Manager_Part;
	    Bulletin_Board : Xm_Bulletin_Board_Private.Xm_Bulletin_Board_Part;
	    Selection_Box : Xm_Selection_Box_Part;
	end record;

    for Xm_Selection_Box_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Constraint at 0
	       range Xt_Composite_Private.Composite_Rec_Size ..
			Xt_Constraint_Private.Constraint_Rec_Size - 1;
	    Manager at 0 range Xt_Constraint_Private.Constraint_Rec_Size ..
				  Xm_Private.Xm_Manager_Rec_Size - 1;
	    Bulletin_Board at 0
	       range Xm_Private.Xm_Manager_Rec_Size ..
			Xm_Bulletin_Board_Private.Xm_Bulletin_Board_Rec_Size -
			   1;
	    Selection_Box at 0
	       range Xm_Bulletin_Board_Private.Xm_Bulletin_Board_Rec_Size ..
			Xm_Selection_Box_Rec_Size - 1;
	end record;

    type Xm_Selection_Box_Rec_Ptr is access Xm_Selection_Box_Rec;
    type Xm_Selection_Box_Class_Rec_Ptr is access Xm_Selection_Box_Class_Rec;

    function To_Widget_Class
		(X : in Xm_Selection_Box_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Selection_Box_Class (X : in Xt.Widget_Class)
				       return Xm_Selection_Box_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Selection_Box_Rec_Ptr) return Xt.Widget;

    function To_Xm_Selection_Box (X : in Xt.Widget)
				 return Xm_Selection_Box_Rec_Ptr;
end Xm_Selection_Box_Private;

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

