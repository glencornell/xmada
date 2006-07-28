-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.


with X_Configuration_Dependent, X_Lib, Xt, Xm, Xt_Core_Private,
     Xt_Composite_Private, Xt_Constraint_Private, Xm_Private,
     X_Configuration_Dependent, Unchecked_Conversion;

package Xm_Drawing_Area_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    Xmresize_Swindow : constant := 10;

    type Xm_Drawing_Area_Class_Part is
	record
	    Mumble : X_Configuration_Dependent.Int;
	end record;

    for Xm_Drawing_Area_Class_Part use
	record
	    Mumble at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Drawing_Area_Class_Part_Size : constant := 32;
    Xm_Drawing_Area_Class_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Class_Rec_Size + Xm_Drawing_Area_Class_Part_Size;

    type Xm_Drawing_Area_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Constraint_Class : Xt_Constraint_Private.Constraint_Class_Part;
	    Manager_Class : Xm_Private.Xm_Manager_Class_Part;
	    Drawing_Area_Class : Xm_Drawing_Area_Class_Part;
	end record;

    for Xm_Drawing_Area_Class_Rec use
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
	    Drawing_Area_Class at 0
	       range Xm_Private.Xm_Manager_Class_Rec_Size ..
			Xm_Drawing_Area_Class_Rec_Size - 1;
	end record;

    type Xm_Drawing_Area_Part is
	record
	    Margin_Width : Xt.Dimension; -- 16 Bits
	    Margin_Height : Xt.Dimension;
	    Resize_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Expose_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Input_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Resize_Policy : X_Configuration_Dependent.Unsigned_Char;
	    Dummy : X_Configuration_Dependent.Unsigned_Char;
	end record;

    for Xm_Drawing_Area_Part use
	record
	    Margin_Width at 0 * Word_Size range 0 .. 15;
	    Margin_Height at 0 * Word_Size range 16 .. 31;
	    Resize_Callback at 1 * Word_Size range 0 .. 31;
	    Expose_Callback at 2 * Word_Size range 0 .. 31;
	    Input_Callback at 3 * Word_Size range 0 .. 31;
	    Resize_Policy at 4 * Word_Size range 0 .. 7;
	    Dummy at 4 * Word_Size range 24 .. 31;
	end record;

    Xm_Drawing_Area_Part_Size : constant := 5 * 32;
    Xm_Drawing_Area_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Rec_Size + Xm_Drawing_Area_Part_Size;

    type Xm_Drawing_Area_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Xt_Constraint_Private.Constraint_Part;
	    Manager : Xm_Private.Xm_Manager_Part;
	    Drawing_Area : Xm_Drawing_Area_Part;
	end record;

    for Xm_Drawing_Area_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Constraint at 0
	       range Xt_Composite_Private.Composite_Rec_Size ..
			Xt_Constraint_Private.Constraint_Rec_Size - 1;
	    Manager at 0 range Xt_Constraint_Private.Constraint_Rec_Size ..
				  Xm_Private.Xm_Manager_Rec_Size - 1;
	    Drawing_Area at 0 range Xm_Private.Xm_Manager_Rec_Size ..
				       Xm_Drawing_Area_Rec_Size - 1;
	end record;

    type Xm_Drawing_Area_Rec_Ptr is access Xm_Drawing_Area_Rec;
    type Xm_Drawing_Area_Class_Rec_Ptr is access Xm_Drawing_Area_Class_Rec;

    function To_Widget_Class
		(X : in Xm_Drawing_Area_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Drawing_Area_Class (X : in Xt.Widget_Class)
				      return Xm_Drawing_Area_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Drawing_Area_Rec_Ptr) return Xt.Widget;

    function To_Xm_Drawing_Area (X : in Xt.Widget)
				return Xm_Drawing_Area_Rec_Ptr;
end Xm_Drawing_Area_Private;

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
