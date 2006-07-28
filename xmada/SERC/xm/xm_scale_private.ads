-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.


with X_Configuration_Dependent, X_Lib, Xt, Xm, Xt_Core_Private,
     Xt_Composite_Private, Xt_Constraint_Private, Xm_Private,
     X_Configuration_Dependent, Unchecked_Conversion;

package Xm_Scale_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Scale_Class_Part is
	record
	    Dummy : X_Configuration_Dependent.Int;
	end record;

    for Xm_Scale_Class_Part use
	record
	    Dummy at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Scale_Class_Part_Size : constant := 32;
    Xm_Scale_Class_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Class_Rec_Size + Xm_Scale_Class_Part_Size;

    type Xm_Scale_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Constraint_Class : Xt_Constraint_Private.Constraint_Class_Part;
	    Manager_Class : Xm_Private.Xm_Manager_Class_Part;
	    Scale_Class : Xm_Scale_Class_Part;
	end record;

    for Xm_Scale_Class_Rec use
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
	    Scale_Class at 0 range Xm_Private.Xm_Manager_Class_Rec_Size ..
				      Xm_Scale_Class_Rec_Size - 1;
	end record;

    type Xm_Font_Structure_Ptr is access Xm.Xm_Font_Structure;

    type Xm_Scale_Part is
	record
	    Value : X_Configuration_Dependent.Int;
	    Maximum : X_Configuration_Dependent.Int;
	    Minimum : X_Configuration_Dependent.Int;
	    Orientation : X_Configuration_Dependent.Unsigned_Char;
	    Processing_Direction : X_Configuration_Dependent.Unsigned_Char;
	    Title : Xm.Xm_String;
	    Font_List : Xm.Xm_Font_List;
	    Font_Struct : X_Lib.Fonts.Font_Record_Pointer;
	    Show_Value : Xm.Xm_Boolean;
	    Decimal_Points : X_Configuration_Dependent.Short;
	    Scale_Width : Xt.Dimension;
	    Scale_Height : Xt.Dimension;
	    Highlight_Thickness : Xt.Dimension;
	    Highlight_On_Enter : Xm.Xm_Boolean;
	    Drag_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Value_Changed_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Last_Value : X_Configuration_Dependent.Int;
	    Slider_Size : X_Configuration_Dependent.Int;
	    Foreground_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Show_Value_X : X_Configuration_Dependent.Int;
	    Show_Value_Y : X_Configuration_Dependent.Int;
	    Show_Value_Width : X_Configuration_Dependent.Int;
	    Show_Value_Height : X_Configuration_Dependent.Int;
	    Scale_Multiple : X_Configuration_Dependent.Int;
	end record;
    for Xm_Scale_Part use
	record
	    Value at 0 * Word_Size range 0 .. 31;
	    Maximum at 1 * Word_Size range 0 .. 31;
	    Minimum at 2 * Word_Size range 0 .. 31;
	    Orientation at 3 * Word_Size range 0 .. 07;
	    Processing_Direction at 3 * Word_Size + 1 range 0 .. 07;
	    Title at 4 * Word_Size range 0 .. 31;
	    Font_List at 5 * Word_Size range 0 .. 31;
	    Font_Struct at 6 * Word_Size range 0 .. 31;
	    Show_Value at 7 * Word_Size range 0 .. 07;
	    Decimal_Points at 7 * Word_Size + 2 range 0 .. 15;
	    Scale_Width at 8 * Word_Size range 0 .. 15;
	    Scale_Height at 8 * Word_Size + 2 range 0 .. 15;
	    Highlight_Thickness at 9 * Word_Size range 0 .. 15;
	    Highlight_On_Enter at 9 * Word_Size + 2 range 0 .. 07;
	    Drag_Callback at 10 * Word_Size range 0 .. 31;
	    Value_Changed_Callback at 11 * Word_Size range 0 .. 31;
	    Last_Value at 12 * Word_Size range 0 .. 31;
	    Slider_Size at 13 * Word_Size range 0 .. 31;
	    Foreground_Gc at 14 * Word_Size range 0 .. 31;
	    Show_Value_X at 15 * Word_Size range 0 .. 31;
	    Show_Value_Y at 16 * Word_Size range 0 .. 31;
	    Show_Value_Width at 17 * Word_Size range 0 .. 31;
	    Show_Value_Height at 18 * Word_Size range 0 .. 31;
	    Scale_Multiple at 19 * Word_Size range 0 .. 31;
	end record;

    Xm_Scale_Part_Size : constant := 20 * 32;
    Xm_Scale_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Rec_Size + Xm_Scale_Part_Size;


    type Xm_Scale_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Xt_Constraint_Private.Constraint_Part;
	    Manager : Xm_Private.Xm_Manager_Part;
	    Scale : Xm_Scale_Part;
	end record;

    for Xm_Scale_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Constraint at 0
	       range Xt_Composite_Private.Composite_Rec_Size ..
			Xt_Constraint_Private.Constraint_Rec_Size - 1;
	    Manager at 0 range Xt_Constraint_Private.Constraint_Rec_Size ..
				  Xm_Private.Xm_Manager_Rec_Size - 1;
	    Scale at 0 range Xm_Private.Xm_Manager_Rec_Size ..
				Xm_Scale_Rec_Size - 1;
	end record;

    type Xm_Scale_Rec_Ptr is access Xm_Scale_Rec;
    type Xm_Scale_Class_Rec_Ptr is access Xm_Scale_Class_Rec;

    function To_Widget_Class
		(X : in Xm_Scale_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Scale_Class (X : in Xt.Widget_Class)
			       return Xm_Scale_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Scale_Rec_Ptr) return Xt.Widget;

    function To_Xm_Scale (X : in Xt.Widget) return Xm_Scale_Rec_Ptr;

end Xm_Scale_Private;

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

