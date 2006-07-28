-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib, X_Configuration_Dependent, Xt, Xt_Core,
     Xt_Object_Private, Xm_Drop_Transfer, Xm;

package Xm_Drop_Transfer_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    -- DropTransfer class structure

    subtype Xm_Drop_Transfer_Start_Transfer_Proc is X_Lib.X_Address;
    subtype Xm_Drop_Transfer_Add_Transfer_Proc is X_Lib.X_Address;

    type Xm_Drop_Transfer_Class_Part is
	record
	    Start_Drop_Transfer : Xm_Drop_Transfer_Start_Transfer_Proc;
	    Add_Drop_Transfer : Xm_Drop_Transfer_Add_Transfer_Proc;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Drop_Transfer_Class_Part use
	record
	    Start_Drop_Transfer at 0 * Word_Size range 0 .. 31;
	    Add_Drop_Transfer at 1 * Word_Size range 0 .. 31;
	    Extension at 2 * Word_Size range 0 .. 31;
	end record;

    Xm_Drop_Transfer_Class_Part_Size : constant := 3 * 32;
    Xm_Drop_Transfer_Class_Rec_Size : constant :=
       Xt_Object_Private.Object_Class_Size + Xm_Drop_Transfer_Class_Part_Size;

    -- Full class record declaration

    type Xm_Drop_Transfer_Class_Rec is
	record
	    Object_Class : Xt_Object_Private.Object_Class_Part;
	    Drop_Transfer_Class : Xm_Drop_Transfer_Class_Part;
	end record;

    for Xm_Drop_Transfer_Class_Rec use
	record
	    Object_Class at 0
	       range 0 .. Xt_Object_Private.Object_Class_Size - 1;
	    Drop_Transfer_Class at 0
	       range Xt_Object_Private.Object_Class_Size ..
			Xm_Drop_Transfer_Class_Rec_Size - 1;
	end record;

    type Xm_Drop_Transfer_List_Rec is
	record
	    Transfer_List : Xm_Drop_Transfer.Xm_Drop_Transfer_Entry;
	    Num_Transfers : Xt.Cardinal;
	end record;

    for Xm_Drop_Transfer_List_Rec use
	record
	    Transfer_List at 0 * Word_Size range 0 .. 31;
	    Num_Transfers at 1 * Word_Size range 0 .. 31;
	end record;

    type Xm_Drop_Transfer_Array is
       array (Natural range <>) of Xm_Drop_Transfer_List_Rec;
    type Xm_Drop_Transfer_List is access Xm_Drop_Transfer_Array;

    -- The DropTransfer instance record
    type Xm_Drop_Transfer_Part is
	record
	    Drop_Transfers : Xm_Drop_Transfer.Xm_Drop_Transfer_Entry;
	    Num_Drop_Transfers : Xt.Cardinal;
	    Selection : X_Lib.Atoms.Atom;
	    Drag_Context : Xm.Xt_Widget;
	    Timestamp : X_Lib.Time;
	    Incremental : Xm.Xm_Boolean;
	    Source_Window : X_Lib.Window;
	    Tag : X_Configuration_Dependent.Unsigned_Int;
	    Transfer_Callback : Xt.Xt_Selection_Callback_Proc;
	    Transfer_Status : Xm_Drop_Transfer.Xm_Transfer_Status;
	    Motif_Drop_Atom : X_Lib.Atoms.Atom;
	    Drop_Transfer_Lists : Xm_Drop_Transfer_List;
	    Num_Drop_Transfer_Lists : Xt.Cardinal;
	    Cur_Drop_Transfer_List : Xt.Cardinal;
	    Cur_Xfer : Xt.Cardinal;
	    Cur_Targets : X_Lib.Atoms.Atom_List;
	    Cur_Client_Data : X_Lib.X_Address;
	end record;

    for Xm_Drop_Transfer_Part use
	record
	    Drop_Transfers at 0 * Word_Size range 0 .. 31;
	    Num_Drop_Transfers at 1 * Word_Size range 0 .. 31;
	    Selection at 2 * Word_Size range 0 .. 31;
	    Drag_Context at 3 * Word_Size range 0 .. 31;
	    Timestamp at 4 * Word_Size range 0 .. 31;
	    Incremental at 5 * Word_Size range 0 .. 7;
	    Source_Window at 6 * Word_Size range 0 .. 31;
	    Tag at 7 * Word_Size range 0 .. 31;
	    Transfer_Callback at 8 * Word_Size range 0 .. 31;
	    Transfer_Status at 9 * Word_Size range 0 .. 7;
	    Motif_Drop_Atom at 10 * Word_Size range 0 .. 31;
	    Drop_Transfer_Lists at 11 * Word_Size range 0 .. 31;
	    Num_Drop_Transfer_Lists at 12 * Word_Size range 0 .. 31;
	    Cur_Drop_Transfer_List at 13 * Word_Size range 0 .. 31;
	    Cur_Xfer at 14 * Word_Size range 0 .. 31;
	    Cur_Targets at 15 * Word_Size range 0 .. 31;
	    Cur_Client_Data at 16 * Word_Size range 0 .. 31;
	end record;

    Xm_Drop_Transfer_Part_Size : constant := 17 * 32;
    Xm_Drop_Transfer_Rec_Size : constant :=
       Xt_Object_Private.Object_Part_Size + Xm_Drop_Transfer_Part_Size;

    -- Full instance record declaration

    type Xm_Drop_Transfer_Rec is
	record
	    Object : Xt_Object_Private.Object_Part;
	    Drop_Transfer : Xm_Drop_Transfer_Part;
	end record;

    for Xm_Drop_Transfer_Rec use
	record
	    Object at 0 range 0 .. Xt_Object_Private.Object_Part_Size - 1;
	    Drop_Transfer at 0 range Xt_Object_Private.Object_Part_Size ..
					Xm_Drop_Transfer_Rec_Size - 1;
	end record;

    type Xm_Drop_Transfer_Class_Rec_Ptr is access Xm_Drop_Transfer_Class_Rec;
    type Xm_Drop_Transfer_Rec_Ptr is access Xm_Drop_Transfer_Rec;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Drop_Transfer_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Drop_Transfer_Class (X : in Xt.Widget_Class)
				       return Xm_Drop_Transfer_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Drop_Transfer_Rec_Ptr) return Xt.Widget;

    function To_Xm_Drop_Transfer (X : in Xt.Widget)
				 return Xm_Drop_Transfer_Rec_Ptr;

end Xm_Drop_Transfer_Private;

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
