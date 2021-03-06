-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with Xt, X_Lib, X_Configuration_Dependent, Xm, Xm_Private,
     Xm_Label_Private, Xt_Core_Private, Unchecked_Conversion;

package Xm_Drawn_Button_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Drawn_Button_Class_Part is
	record
	    Foo : X_Configuration_Dependent.Int;
	end record;

    for Xm_Drawn_Button_Class_Part use
	record
	    Foo at 0 range 0 .. 31;
	end record;

    Xm_Drawn_Button_Class_Part_Size : constant := 32;
    Xm_Drawn_Button_Class_Rec_Size : constant :=
       Xm_Label_Private.Xm_Label_Class_Rec_Size +
	  Xm_Drawn_Button_Class_Part_Size;

    type Xm_Drawn_Button_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Primitive_Class : Xm_Private.Xm_Primitive_Class_Part;
	    Label_Class : Xm_Label_Private.Xm_Label_Class_Part;
	    Drawn_Button_Class : Xm_Drawn_Button_Class_Part;
	end record;

    for Xm_Drawn_Button_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Primitive_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xm_Private.Xm_Primitive_Class_Rec_Size - 1;
	    Label_Class at 0
	       range Xm_Private.Xm_Primitive_Class_Rec_Size ..
			Xm_Label_Private.Xm_Label_Class_Rec_Size - 1;
	    Drawn_Button_Class at 0
	       range Xm_Label_Private.Xm_Label_Class_Rec_Size ..
			Xm_Drawn_Button_Class_Rec_Size - 1;
	end record;


    type Xm_Drawn_Button_Part is
	record
	    Pushbutton_Enabled : Xm.Xm_Boolean;
	    Shadow_Type : X_Configuration_Dependent.Unsigned_Char;
	    Activate_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Arm_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Disarm_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Expose_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Resize_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Armed : Xm.Xm_Boolean;
	    Old_Width : Xt.Dimension;
	    Old_Height : Xt.Dimension;
	    Old_Shadow_Thickness : Xt.Dimension;
	    Old_Highlight_Thickness : Xt.Dimension;
	    Timer : Xt.Xt_Interval_Id;
	    Multi_Click : X_Configuration_Dependent.Unsigned_Char;
	    Click_Count : X_Configuration_Dependent.Int;
	    Arm_Time_Stamp : X_Lib.Time;
	end record;
    for Xm_Drawn_Button_Part use
	record
	    Pushbutton_Enabled at 0 * Word_Size range 0 .. 7;
	    Shadow_Type at 0 * Word_Size + 1 range 0 .. 7;
	    Activate_Callback at 1 * Word_Size range 0 .. 31;
	    Arm_Callback at 2 * Word_Size range 0 .. 31;
	    Disarm_Callback at 3 * Word_Size range 0 .. 31;
	    Expose_Callback at 4 * Word_Size range 0 .. 31;
	    Resize_Callback at 5 * Word_Size range 0 .. 31;
	    Armed at 6 * Word_Size range 0 .. 7;
	    Old_Width at 6 * Word_Size + 2 range 0 .. 15;
	    Old_Height at 7 * Word_Size range 0 .. 15;
	    Old_Shadow_Thickness at 7 * Word_Size + 2 range 0 .. 15;
	    Old_Highlight_Thickness at 8 * Word_Size range 0 .. 15;
	    Timer at 9 * Word_Size range 0 .. 31;
	    Multi_Click at 10 * Word_Size range 0 .. 7;
	    Click_Count at 11 * Word_Size range 0 .. 31;
	    Arm_Time_Stamp at 12 * Word_Size range 0 .. 31;
	end record;

    Xm_Drawn_Button_Part_Size : constant := 13 * 32;
    Xm_Drawn_Button_Rec_Size : constant :=
       Xm_Label_Private.Xm_Label_Rec_Size + Xm_Drawn_Button_Part_Size;

    type Xm_Drawn_Button_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Primitive : Xm_Private.Xm_Primitive_Part;
	    Label : Xm_Label_Private.Xm_Label_Part;
	    Drawn_Button : Xm_Drawn_Button_Part;
	end record;

    for Xm_Drawn_Button_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Primitive at 0 range Xt_Core_Private.Core_Part_Size ..
				    Xm_Private.Xm_Primitive_Rec_Size - 1;
	    Label at 0 range Xm_Private.Xm_Primitive_Rec_Size ..
				Xm_Label_Private.Xm_Label_Rec_Size - 1;
	    Drawn_Button at 0 range Xm_Label_Private.Xm_Label_Rec_Size ..
				       Xm_Drawn_Button_Rec_Size - 1;
	end record;

    type Xm_Drawn_Button_Class_Rec_Ptr is access Xm_Drawn_Button_Class_Rec;
    type Xm_Drawn_Button_Rec_Ptr is access Xm_Drawn_Button_Rec;


    function To_Widget_Class
		(X : in Xm_Drawn_Button_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Drawn_Button_Class (X : in Xt.Widget_Class)
				      return Xm_Drawn_Button_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Drawn_Button_Rec_Ptr) return Xt.Widget;

    function To_Xm_Drawn_Button (X : in Xt.Widget)
				return Xm_Drawn_Button_Rec_Ptr;
end Xm_Drawn_Button_Private;

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
