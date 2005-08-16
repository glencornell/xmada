-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm, Xt_Core_Private,
     Xt_Composite_Private, Xt_Constraint_Private, Xm_Private,
     X_Configuration_Dependent, Unchecked_Conversion;

package Xm_Frame_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Frame_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Frame_Class_Part use
	record
	    Extension at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Frame_Class_Part_Size : constant := 32;
    Xm_Frame_Class_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Class_Rec_Size + Xm_Frame_Class_Part_Size;

    type Xm_Frame_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Constraint_Class : Xt_Constraint_Private.Constraint_Class_Part;
	    Manager_Class : Xm_Private.Xm_Manager_Class_Part;
	    Frame_Class : Xm_Frame_Class_Part;
	end record;

    for Xm_Frame_Class_Rec use
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
	    Frame_Class at 0 range Xm_Private.Xm_Manager_Class_Rec_Size ..
				      Xm_Frame_Class_Rec_Size - 1;
	end record;

    type Xm_Frame_Part is
	record
	    Margin_Width : Xt.Dimension; -- 16 Bits
	    Margin_Height : Xt.Dimension;
	    Shadow_Type : X_Configuration_Dependent.Unsigned_Char;
	    Old_Width : Xt.Dimension;
	    Old_Height : Xt.Dimension;
	    Old_Shadow_Thickness : Xt.Dimension;
	    Old_Shadow_X : Xt.Position;
	    Old_Shadow_Y : Xt.Position;
	    Work_Area : Xt.Widget;
	    Title_Area : Xt.Widget;
	    Processing_Constraints : Xm.Xm_Boolean;
	    Dummy : Xm.Xm_Boolean;
	end record;

    for Xm_Frame_Part use
	record
	    Margin_Width at 0 * Word_Size range 0 .. 15;
	    Margin_Height at 0 * Word_Size range 16 .. 31;
	    Shadow_Type at 1 * Word_Size range 0 .. 7;
	    Old_Width at 1 * Word_Size range 16 .. 31;
	    Old_Height at 2 * Word_Size range 0 .. 15;
	    Old_Shadow_Thickness at 2 * Word_Size range 16 .. 31;
	    Old_Shadow_X at 3 * Word_Size range 0 .. 15;
	    Old_Shadow_Y at 3 * Word_Size range 16 .. 31;
	    Work_Area at 4 * Word_Size range 0 .. 31;
	    Title_Area at 5 * Word_Size range 0 .. 31;
	    Processing_Constraints at 6 * Word_Size range 0 .. 7;
	    Dummy at 7 * Word_Size + 3 range 0 .. 7;
	end record;

    Xm_Frame_Part_Size : constant := 8 * 32;
    Xm_Frame_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Rec_Size + Xm_Frame_Part_Size;

    type Xm_Frame_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Xt_Constraint_Private.Constraint_Part;
	    Manager : Xm_Private.Xm_Manager_Part;
	    Frame : Xm_Frame_Part;
	end record;

    for Xm_Frame_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Constraint at 0
	       range Xt_Composite_Private.Composite_Rec_Size ..
			Xt_Constraint_Private.Constraint_Rec_Size - 1;
	    Manager at 0 range Xt_Constraint_Private.Constraint_Rec_Size ..
				  Xm_Private.Xm_Manager_Rec_Size - 1;
	    Frame at 0 range Xm_Private.Xm_Manager_Rec_Size ..
				Xm_Frame_Rec_Size - 1;
	end record;

    type Xm_Frame_Rec_Ptr is access Xm_Frame_Rec;
    type Xm_Frame_Class_Rec_Ptr is access Xm_Frame_Class_Rec;

    -- /*  Frame constraint records  */

    type Xm_Frame_Constraint_Part is
	record
	    Unused : X_Configuration_Dependent.Int;
	    Child_Type : X_Configuration_Dependent.Unsigned_Char;
	    Child_H_Alignment : X_Configuration_Dependent.Unsigned_Char;
	    Child_H_Spacing : Xt.Dimension;
	    Child_V_Alignment : X_Configuration_Dependent.Unsigned_Char;
	    Dummy : X_Configuration_Dependent.Unsigned_Char;
	end record;

    for Xm_Frame_Constraint_Part use
	record
	    Unused at 0 * Word_Size range 0 .. 31;
	    Child_Type at 1 * Word_Size range 0 .. 7;
	    Child_H_Alignment at 1 * Word_Size range 8 .. 15;
	    Child_H_Spacing at 1 * Word_Size range 16 .. 31;
	    Child_V_Alignment at 2 * Word_Size range 0 .. 7;
	    Dummy at 2 * Word_Size range 24 .. 31;
	end record;

    Xm_Frame_Constraint_Part_Size : constant := 32 * 3;
    Xm_Frame_Constraint_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Constraint_Rec_Size +
	  Xm_Frame_Constraint_Part_Size;

    type Xm_Frame_Constraint_Rec is
	record
	    Manager : Xm_Private.Xm_Manager_Constraint_Part;
	    Frame : Xm_Frame_Constraint_Part;
	end record;

    for Xm_Frame_Constraint_Rec use
	record
	    Manager at 0
	       range 0 .. Xm_Private.Xm_Manager_Constraint_Rec_Size - 1;
	    Frame at 0 range Xm_Private.Xm_Manager_Constraint_Rec_Size ..
				Xm_Frame_Constraint_Rec_Size - 1;
	end record;

    function To_Widget_Class
		(X : in Xm_Frame_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Frame_Class (X : in Xt.Widget_Class)
			       return Xm_Frame_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Frame_Rec_Ptr) return Xt.Widget;

    function To_Xm_Frame (X : in Xt.Widget) return Xm_Frame_Rec_Ptr;
end Xm_Frame_Private;

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

