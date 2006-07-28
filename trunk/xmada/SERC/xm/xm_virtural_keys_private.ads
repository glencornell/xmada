-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib, X_Configuration_Dependent, Xt;

package Xm_Virtural_Keys_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    Xmkeycode_Tag_Size : constant := 32;

    type Xm_Default_Binding_String_Rec is
	record
	    Vendor_Name : X_Lib.String_Pointer;
	    Defaults : X_Lib.String_Pointer;
	end record;

    for Xm_Default_Binding_String_Rec use
	record
	    Vendor_Name at 0 * Word_Size range 0 .. 31;
	    Defaults at 1 * Word_Size range 0 .. 31;
	end record;

    type Xm_Default_Binding_String is access Xm_Default_Binding_String_Rec;

    type Xm_Key_Binding_Rec is
	record
	    Key_Sym : X_Lib.Keyboard.Key_Sym;
	    Modifiers : Xt.Modifiers;
	end record;

    for Xm_Key_Binding_Rec use
	record
	    Key_Sym at 0 * Word_Size range 0 .. 31;
	    Modifiers at 1 * Word_Size range 0 .. 31;
	end record;

    type Xm_Key_Binding is access Xm_Key_Binding_Rec;

    type Xm_Virtual_Keysym_Rec is
	record
	    Name : X_Lib.String_Pointer;
	    Keysym : X_Lib.Keyboard.Key_Sym;
	end record;

    for Xm_Virtual_Keysym_Rec use
	record
	    Name at 0 * Word_Size range 0 .. 31;
	    Keysym at 1 * Word_Size range 0 .. 31;
	end record;

    type Xm_Virtual_Keysym is access Xm_Virtual_Keysym_Rec;

end Xm_Virtural_Keys_Private;

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
