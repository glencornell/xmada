-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib, Xt, Xm, Xt_Object_Private,
     Xm_Ext_Object_Private, X_Configuration_Dependent;

package Xm_Protocols_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;
    type Xm_Protocol_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Protocol_Class_Part use
	record
	    Extension at 0 range 0 .. 31;
	end record;

    Xm_Protocol_Class_Part_Size : constant := 32;
    Xm_Protocol_Class_Rec_Size : constant :=
       Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size +
	  Xm_Protocol_Class_Part_Size;

    type Xm_Protocol_Class_Rec is
	record
	    Object_Class : Xt_Object_Private.Object_Class_Part;
	    Ext_Object_Class : Xm_Ext_Object_Private.Ext_Object_Class_Part;
	    Protocol_Class : Xm_Protocol_Class_Part;
	end record;

    for Xm_Protocol_Class_Rec use
	record
	    Object_Class at 0
	       range 0 .. Xt_Object_Private.Object_Class_Rec_Size - 1;
	    Ext_Object_Class at 0
	       range Xt_Object_Private.Object_Class_Rec_Size ..
			Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size - 1;
	    Protocol_Class at 0
	       range Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size ..
			Xm_Protocol_Class_Rec_Size - 1;
	end record;

    type Xm_Protocol_Object_Class is access Xm_Protocol_Class_Rec;

    type Xm_Protocol_Part is
	record
	    Pre_Hook : Xt.Xt_Callbacks.Xt_Callback_Rec;
	    Post_Hook : Xt.Xt_Callbacks.Xt_Callback_Rec;
	    Callbacks : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Atom : X_Lib.Atoms.Atom;
	    Active : Xm.Xm_Boolean;
	    Dummy : Xm.Xm_Boolean;
	end record;

    for Xm_Protocol_Part use
	record
	    Pre_Hook at 0 * Word_Size range 0 .. 63;
	    Post_Hook at 2 * Word_Size range 0 .. 63;
	    Callbacks at 4 * Word_Size range 0 .. 31;
	    Atom at 5 * Word_Size range 0 .. 31;
	    Active at 6 * Word_Size range 0 .. 7;
	    Dummy at 6 * Word_Size range 24 .. 31;
	end record;

    Xm_Protocol_Part_Size : constant := 7 * 32;
    Xm_Protocol_Rec_Size : constant :=
       Xm_Ext_Object_Private.Ext_Object_Rec_Size + Xm_Protocol_Part_Size;

    type Xm_Protocol_Rec is
	record
	    Object : Xt_Object_Private.Object_Part;
	    Ext_Object : Xm_Ext_Object_Private.Ext_Object_Part;
	    Protocol : Xm_Protocol_Part;
	end record;

    for Xm_Protocol_Rec use
	record
	    Object at 0 range 0 .. Xt_Object_Private.Object_Rec_Size - 1;
	    Ext_Object at 0
	       range Xt_Object_Private.Object_Rec_Size ..
			Xm_Ext_Object_Private.Ext_Object_Rec_Size - 1;
	    Protocol at 0 range Xm_Ext_Object_Private.Ext_Object_Rec_Size ..
				   Xm_Protocol_Rec_Size - 1;
	end record;

    type Xm_Protocol is access Xm_Protocol_Rec;
    type Xm_Protocol_Array is array (Natural range <>) of Xm_Protocol_Rec;
    type Xm_Protocol_Array_Ptr is access Xm_Protocol_Array;
    type Xm_Protocol_List is access Xm_Protocol_Array_Ptr;

    type Xm_Protocol_Mgr_Rec is
	record
	    Property : X_Lib.Atoms.Atom;
	    Protocols : Xm_Protocol_List;
	    Num_Protocols : Xt.Cardinal;
	    Max_Protocols : Xt.Cardinal;
	end record;

    for Xm_Protocol_Mgr_Rec use
	record
	    Property at 0 * Word_Size range 0 .. 31;
	    Protocols at 1 * Word_Size range 0 .. 31;
	    Num_Protocols at 2 * Word_Size range 0 .. 31;
	    Max_Protocols at 3 * Word_Size range 0 .. 31;
	end record;

    type Xm_Protocol_Mgr is access Xm_Protocol_Mgr_Rec;
    type Xm_Protocol_Mgr_Array is
       array (Natural range <>) of Xm_Protocol_Mgr_Rec;
    type Xm_Protocol_Mgr_Array_Ptr is access Xm_Protocol_Mgr_Array;
    type Xm_Protocol_Mgr_List is access Xm_Protocol_Mgr_Array_Ptr;

    type Xm_All_Protocols_Mgr_Rec is
	record
	    Protocol_Mgrs : Xm_Protocol_Mgr_List;
	    Num_Protocol_Mgrs : Xt.Cardinal;
	    Max_Protocol_Mgrs : Xt.Cardinal;
	    Shell : Xm.Xt_Widget;
	end record;

    for Xm_All_Protocols_Mgr_Rec use
	record
	    Protocol_Mgrs at 0 * Word_Size range 0 .. 31;
	    Num_Protocol_Mgrs at 1 * Word_Size range 0 .. 31;
	    Max_Protocol_Mgrs at 2 * Word_Size range 0 .. 31;
	    Shell at 3 * Word_Size range 0 .. 31;
	end record;

    type Xm_Protocol_Class_Rec_Ptr is access Xm_Protocol_Class_Rec;
    type Xm_Protocol_Rec_Ptr is access Xm_Protocol_Rec;
    type Xm_All_Protocols_Mgr is access Xm_All_Protocols_Mgr_Rec;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Protocol_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Protocol_Class (X : in Xt.Widget_Class)
				  return Xm_Protocol_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Protocol_Rec_Ptr) return Xt.Widget;

    function To_Xm_Protocol (X : in Xt.Widget) return Xm_Protocol_Rec_Ptr;

end Xm_Protocols_Private;

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
