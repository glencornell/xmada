-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xt_Object, Xm;

package Xm_Drop_Transfer is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Transfer_Status is (Xmtransfer_Failure, Xmtransfer_Success);
    for Xm_Transfer_Status'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;

    type Xm_Drop_Transfer_Entry_Rec is
	record
	    Client_Data : Xt.Xt_Pointer;
	    Target : X_Lib.Atoms.Atom;
	end record;

    for Xm_Drop_Transfer_Entry_Rec use
	record
	    Client_Data at 0 * Word_Size range 0 .. 31;
	    Target at 1 * Word_Size range 0 .. 31;
	end record;

    type Xm_Drop_Transfer_Entry is access Xm_Drop_Transfer_Entry_Rec;
    type Xm_Drop_Transfer_Entry_Array is
       array (Natural range <>) of Xm_Drop_Transfer_Entry_Rec;
    type Xm_Drop_Transfer_Entry_List is access Xm_Drop_Transfer_Entry_Rec;

    subtype Drop_Transfer_Object_Widget is Xt_Object.Obj_Widget;
    subtype Drop_Transfer_Object_Class is Xt_Object.Obj_Class;

    function Xm_Drop_Transfer_Object_Class return Drop_Transfer_Object_Class;

    function Xm_Is_Drop_Transfer (W : in Xm.Xt_Widget) return Boolean;

    function Xm_Drop_Transfer_Start
		(Ref_Widget : in Xm.Xt_Widget;
		 Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;

    procedure Xm_Drop_Transfer_Add
		 (W : in Xm.Xt_Widget;
		  Transfers : in Xm_Drop_Transfer_Entry_Array);
end Xm_Drop_Transfer;

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
