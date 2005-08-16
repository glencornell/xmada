-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.


with X_Configuration_Dependent, X_Lib, Xt, Xm, Xt_Core_Private,
     Xt_Composite_Private, Xt_Constraint_Private, Xm_Private,
     Xm_Bulletin_Board_Private, Unchecked_Conversion;

package Xm_Form_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Form_Attachment_Rec is
	record
	    Types : X_Configuration_Dependent.Unsigned_Char;
	    W : Xt.Widget;
	    Percent : X_Configuration_Dependent.Int;
	    Offset : X_Configuration_Dependent.Int;
	    Value : X_Configuration_Dependent.Int;
	    Temp_Value : X_Configuration_Dependent.Int;
	end record;
    for Xm_Form_Attachment_Rec use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    W at 1 * Word_Size range 0 .. 31;
	    Percent at 2 * Word_Size range 0 .. 31;
	    Offset at 3 * Word_Size range 0 .. 31;
	    Value at 4 * Word_Size range 0 .. 31;
	    Temp_Value at 5 * Word_Size range 0 .. 31;
	end record;

    Xm_Form_Attachment_Rec_Size : constant := 6 * 32;
    Xm_Form_Attachment_Array_Size : constant := Xm_Form_Attachment_Rec_Size * 4;

    Atta_W : constant := Xm_Form_Attachment_Array_Size / 8;

    type Xm_Form_Attachment_Rec_Ptr is access Xm_Form_Attachment_Rec;
    type Xm_Form_Attachment_Array is array (0 .. 3) of Xm_Form_Attachment_Rec;
    type Xm_Form_Attachment_Array_Ptr is access Xm_Form_Attachment_Array;

    type Xm_Form_Constraint_Part is
	record
	    Att : Xm_Form_Attachment_Array;
	    Next_Sibling : Xt.Widget;
	    Sorted : Xm.Xm_Boolean;
	    Resizable : Xm.Xm_Boolean;
	    Preferred_Width : Xt.Dimension;
	    Preferred_Height : Xt.Dimension;
	end record;

    for Xm_Form_Constraint_Part use
	record
	    Att at 0 range 0 .. Xm_Form_Attachment_Array_Size - 1;
	    Next_Sibling at 0 * Word_Size + Atta_W range 0 .. 31;
	    Sorted at 1 * Word_Size + Atta_W range 0 .. 07;
	    Resizable at 1 * Word_Size + Atta_W + 1 range 0 .. 07;
	    Preferred_Width at 2 * Word_Size + Atta_W range 0 .. 15;
	    Preferred_Height at 2 * Word_Size + Atta_W + 2 range 0 .. 15;
	end record;

    Xm_Form_Constraint_Part_Size : constant :=
       Xm_Form_Attachment_Array_Size + 3 * 32;
    Xm_Form_Constraint_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Constraint_Rec_Size + Xm_Form_Constraint_Part_Size;

    type Xm_Form_Constraint_Rec is
	record
	    Manager : Xm_Private.Xm_Manager_Constraint_Part;
	    Form : Xm_Form_Constraint_Part;
	end record;

    for Xm_Form_Constraint_Rec use
	record
	    Manager at 0
	       range 0 .. Xm_Private.Xm_Manager_Constraint_Rec_Size - 1;
	    Form at 0 range Xm_Private.Xm_Manager_Constraint_Rec_Size ..
			       Xm_Form_Constraint_Rec_Size - 1;
	end record;

    type Xm_Form_Constraint_Rec_Ptr is access Xm_Form_Constraint_Rec;
    type Xm_Form_Constraint_Array is array (0 .. 3) of Xm_Form_Constraint_Rec;
    type Xm_Form_Constraint_Array_Ptr is access Xm_Form_Constraint_Array;

    type Xm_Form_Class_Part is
	record
	    Dummy : X_Configuration_Dependent.Int;
	end record;

    for Xm_Form_Class_Part use
	record
	    Dummy at 0 * Word_Size range 0 .. 31;
	end record;


    Xm_Form_Class_Part_Size : constant := 32;
    Xm_Form_Class_Rec_Size : constant :=
       Xm_Bulletin_Board_Private.Xm_Bulletin_Board_Class_Rec_Size +
	  Xm_Form_Class_Part_Size;


    type Xm_Form_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Constraint_Class : Xt_Constraint_Private.Constraint_Class_Part;
	    Manager_Class : Xm_Private.Xm_Manager_Class_Part;
	    Bulletin_Board_Class : Xm_Bulletin_Board_Private.
				      Xm_Bulletin_Board_Class_Part;
	    Form_Class : Xm_Form_Class_Part;
	end record;

    for Xm_Form_Class_Rec use
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
	    Form_Class at 0 range Xm_Bulletin_Board_Private.
				  Xm_Bulletin_Board_Class_Rec_Size ..
				     Xm_Form_Class_Rec_Size - 1;
	end record;

    type Xm_Form_Part is
	record
	    Horizontal_Spacing : Xt.Dimension;
	    Vertical_Spacing : Xt.Dimension;
	    Fraction_Base : X_Configuration_Dependent.Int;
	    Rubber_Positioning : Xm.Xm_Boolean;
	    First_Child : Xt.Widget;
	    Initial_Width : Xm.Xm_Boolean;
	    Initial_Height : Xm.Xm_Boolean;
	    Processing_Constraints : Xm.Xm_Boolean;
	    Dummy : Xm.Xm_Boolean;
	end record;
    for Xm_Form_Part use
	record
	    Horizontal_Spacing at 0 * Word_Size range 0 .. 15;
	    Vertical_Spacing at 0 * Word_Size + 2 range 0 .. 15;
	    Fraction_Base at 1 * Word_Size range 0 .. 31;
	    Rubber_Positioning at 2 * Word_Size range 0 .. 07;
	    First_Child at 3 * Word_Size range 0 .. 31;
	    Initial_Width at 4 * Word_Size range 0 .. 07;
	    Initial_Height at 4 * Word_Size + 1 range 0 .. 07;
	    Processing_Constraints at 4 * Word_Size + 2 range 0 .. 07;
	    Dummy at 4 * Word_Size + 3 range 0 .. 07;
	end record;

    Xm_Form_Part_Size : constant := 5 * 32;
    Xm_Form_Rec_Size : constant :=
       Xm_Bulletin_Board_Private.Xm_Bulletin_Board_Rec_Size + Xm_Form_Part_Size;

    type Xm_Form_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Xt_Constraint_Private.Constraint_Part;
	    Manager : Xm_Private.Xm_Manager_Part;
	    Bulletin_Board : Xm_Bulletin_Board_Private.Xm_Bulletin_Board_Part;
	    Form : Xm_Form_Part;
	end record;

    for Xm_Form_Rec use
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
	    Form at 0
	       range Xm_Bulletin_Board_Private.Xm_Bulletin_Board_Rec_Size ..
			Xm_Form_Rec_Size - 1;
	end record;

    type Xm_Form_Rec_Ptr is access Xm_Form_Rec;
    type Xm_Form_Class_Rec_Ptr is access Xm_Form_Class_Rec;

    function To_Widget_Class
		(X : in Xm_Form_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Form_Class (X : in Xt.Widget_Class)
			      return Xm_Form_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Form_Rec_Ptr) return Xt.Widget;

    function To_Xm_Form (X : in Xt.Widget) return Xm_Form_Rec_Ptr;
end Xm_Form_Private;

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

