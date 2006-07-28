-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, Xt, Xm, Xm_Ext_Object_Private,
     Xm_Desktop_Private, Xt_Object_Private, Unchecked_Conversion;

package Xm_Shell_Ext_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Shell_Ext_Class_Part is
	record
	    Structure_Notify_Handler : Xt.Xt_Event_Handler;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Shell_Ext_Class_Part use
	record
	    Structure_Notify_Handler at 0 * Word_Size range 0 .. 31;
	    Extension at 1 * Word_Size range 0 .. 31;
	end record;

    Shell_Ext_Class_Part_Size : constant := 2 * 32;
    Shell_Ext_Class_Rec_Size : constant :=
       Xm_Desktop_Private.Xm_Desktop_Class_Rec_Size + Shell_Ext_Class_Part_Size;

    type Xm_Shell_Ext_Class_Rec is
	record
	    Object_Class : Xt_Object_Private.Object_Class_Part;
	    Ext_Class : Xm_Ext_Object_Private.Ext_Object_Class_Part;
	    Desktop_Class : Xm_Desktop_Private.Xm_Desktop_Class_Part;
	    Shell_Class : Xm_Shell_Ext_Class_Part;
	end record;

    for Xm_Shell_Ext_Class_Rec use
	record
	    Object_Class at 0
	       range 0 .. Xt_Object_Private.Object_Class_Rec_Size - 1;
	    Ext_Class at 0
	       range Xt_Object_Private.Object_Class_Rec_Size ..
			Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size - 1;
	    Desktop_Class at 0
	       range Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size ..
			Xm_Desktop_Private.Xm_Desktop_Class_Rec_Size - 1;
	    Shell_Class at 0
	       range Xm_Desktop_Private.Xm_Desktop_Class_Rec_Size ..
			Shell_Ext_Class_Rec_Size - 1;
	end record;

    type Xm_Shell_Ext_Part is
	record
	    Last_Configure_Request : X_Configuration_Dependent.Unsigned_Long;
	    Use_Async_Geometry : Xm.Xm_Boolean;
	    Dummy : X_Configuration_Dependent.Char;
	end record;

    for Xm_Shell_Ext_Part use
	record
	    Last_Configure_Request at 0 * Word_Size range 0 .. 31;
	    Use_Async_Geometry at 1 * Word_Size range 0 .. 7;
	    Dummy at 1 * Word_Size range 24 .. 31;
	end record;

    Shell_Ext_Part_Size : constant := 2 * 32;
    Shell_Ext_Rec_Size : constant :=
       Xm_Desktop_Private.Xm_Desktop_Rec_Size + Shell_Ext_Part_Size;

    type Xm_Shell_Ext_Rec is
	record
	    Object : Xt_Object_Private.Object_Part;
	    Ext : Xm_Ext_Object_Private.Ext_Object_Part;
	    Desktop : Xm_Desktop_Private.Xm_Desktop_Part;
	    Shell : Xm_Shell_Ext_Part;
	end record;

    for Xm_Shell_Ext_Rec use
	record
	    Object at 0 range 0 .. Xt_Object_Private.Object_Rec_Size - 1;
	    Ext at 0 range Xt_Object_Private.Object_Rec_Size ..
			      Xm_Ext_Object_Private.Ext_Object_Rec_Size - 1;
	    Desktop at 0 range Xm_Ext_Object_Private.Ext_Object_Rec_Size ..
				  Xm_Desktop_Private.Xm_Desktop_Rec_Size - 1;
	    Shell at 0 range Xm_Desktop_Private.Xm_Desktop_Rec_Size ..
				Shell_Ext_Rec_Size - 1;
	end record;

    type Xm_Shell_Ext_Rec_Ptr is access Xm_Shell_Ext_Rec;
    type Xm_Shell_Ext_Class_Rec_Ptr is access Xm_Shell_Ext_Class_Rec;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Shell_Ext_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Shell_Ext_Class (X : in Xt.Widget_Class)
				   return Xm_Shell_Ext_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Shell_Ext_Rec_Ptr) return Xt.Widget;

    function To_Xm_Shell_Ext (X : in Xt.Widget) return Xm_Shell_Ext_Rec_Ptr;

end Xm_Shell_Ext_Private;

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
