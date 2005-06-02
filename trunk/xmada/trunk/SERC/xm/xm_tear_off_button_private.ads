-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib, X_Configuration_Dependent, Xt, Xm, Xt_Core_Private,
     Xm_Private, Xm_Label_Private, Xm_Push_Button_Private;

package Xm_Tear_Off_Button_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";
    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Tear_Off_Button_Class_Part is
	record
	    Translations : X_Lib.String_Pointer;
	end record;

    for Xm_Tear_Off_Button_Class_Part use
	record
	    Translations at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Tear_Off_Button_Class_Part_Size : constant := 32;
    Xm_Tear_Off_Button_Class_Rec_Size : constant :=
       Xm_Push_Button_Private.Xm_Push_Button_Class_Rec_Size +
	  Xm_Tear_Off_Button_Class_Part_Size;

    type Xm_Tear_Off_Button_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Primitive_Class : Xm_Private.Xm_Primitive_Class_Part;
	    Label_Class : Xm_Label_Private.Xm_Label_Class_Part;
	    Push_Button_Class : Xm_Push_Button_Private.
				   Xm_Push_Button_Class_Part;
	    Tear_Off_Button_Class : Xm_Tear_Off_Button_Class_Part;
	end record;

    for Xm_Tear_Off_Button_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Primitive_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xm_Private.Xm_Primitive_Class_Rec_Size - 1;
	    Label_Class at 0
	       range Xm_Private.Xm_Primitive_Class_Rec_Size ..
			Xm_Label_Private.Xm_Label_Class_Rec_Size - 1;
	    Push_Button_Class at 0
	       range Xm_Label_Private.Xm_Label_Class_Rec_Size ..
			Xm_Push_Button_Private.Xm_Push_Button_Class_Rec_Size -
			   1;
	    Tear_Off_Button_Class at 0
	       range Xm_Push_Button_Private.Xm_Push_Button_Class_Rec_Size ..
			Xm_Tear_Off_Button_Class_Rec_Size - 1;
	end record;

    -- New fields for the TearOffButton widget record
    type Xm_Tear_Off_Button_Part is
	record
	    Margin : Xt.Dimension;
	    Orientation : X_Lib.X_Character;
	    Separator_Type : X_Lib.X_Character;
	    Separator_Gc : X_Lib.Graphic_Output.Graphic_Context;
	end record;

    for Xm_Tear_Off_Button_Part use
	record
	    Margin at 0 * Word_Size range 0 .. 15;
	    Orientation at 0 * Word_Size + 2 range 0 .. 7;
	    Separator_Type at 0 * Word_Size + 3 range 0 .. 7;
	    Separator_Gc at 1 * Word_Size range 0 .. 31;
	end record;

    Xm_Tear_Off_Button_Part_Size : constant := 2 * 32;
    Xm_Tear_Off_Button_Rec_Size : constant :=
       Xm_Push_Button_Private.Xm_Push_Button_Rec_Size +
	  Xm_Tear_Off_Button_Part_Size;

    type Xm_Tear_Off_Button_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Primitive : Xm_Private.Xm_Primitive_Part;
	    Label : Xm_Label_Private.Xm_Label_Part;
	    Push_Button : Xm_Push_Button_Private.Xm_Push_Button_Part;
	    Tear_Off_Button : Xm_Tear_Off_Button_Part;
	end record;

    for Xm_Tear_Off_Button_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Primitive at 0 range Xt_Core_Private.Core_Part_Size ..
				    Xm_Private.Xm_Primitive_Rec_Size - 1;
	    Label at 0 range Xm_Private.Xm_Primitive_Rec_Size ..
				Xm_Label_Private.Xm_Label_Rec_Size - 1;
	    Push_Button at 0
	       range Xm_Label_Private.Xm_Label_Rec_Size ..
			Xm_Push_Button_Private.Xm_Push_Button_Rec_Size - 1;
	    Tear_Off_Button at 0
	       range Xm_Push_Button_Private.Xm_Push_Button_Rec_Size ..
			Xm_Tear_Off_Button_Rec_Size - 1;
	end record;

    type Xm_Tear_Off_Button_Class_Rec_Ptr is
       access Xm_Tear_Off_Button_Class_Rec;
    type Xm_Tear_Off_Button_Rec_Ptr is access Xm_Tear_Off_Button_Rec;

    -- functions for conversions.

    function To_Widget_Class (X : in Xm_Tear_Off_Button_Class_Rec_Ptr)
			     return Xt.Widget_Class;

    function To_Xm_Tear_Off_Button_Class
		(X : in Xt.Widget_Class)
		return Xm_Tear_Off_Button_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Tear_Off_Button_Rec_Ptr) return Xt.Widget;

    function To_Xm_Tear_Off_Button (X : in Xt.Widget)
				   return Xm_Tear_Off_Button_Rec_Ptr;

end Xm_Tear_Off_Button_Private;

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
