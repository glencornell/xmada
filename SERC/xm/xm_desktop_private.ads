-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, Xt, Xm, Xt_Object_Private,
     Xm_Ext_Object_Private, Unchecked_Conversion;

package Xm_Desktop_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Desktop_Class_Part is
	record
	    Child_Class : Xt.Widget_Class;
	    Insert_Child : Xt.Xt_Widget_Proc;
	    Delete_Child : Xt.Xt_Widget_Proc;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Desktop_Class_Part use
	record
	    Child_Class at 0 * Word_Size range 0 .. 31;
	    Insert_Child at 1 * Word_Size range 0 .. 31;
	    Delete_Child at 2 * Word_Size range 0 .. 31;
	    Extension at 3 * Word_Size range 0 .. 31;
	end record;

    Xm_Desktop_Class_Part_Size : constant := 4 * 32;
    Xm_Desktop_Class_Rec_Size : constant :=
       Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size +
	  Xm_Desktop_Class_Part_Size;

    type Xm_Desktop_Class_Rec is
	record
	    Object_Class : Xt_Object_Private.Object_Class_Part;
	    Ext_Class : Xm_Ext_Object_Private.Ext_Object_Class_Part;
	    Desktop_Class : Xm_Desktop_Class_Part;
	end record;

    for Xm_Desktop_Class_Rec use
	record
	    Object_Class at 0
	       range 0 .. Xt_Object_Private.Object_Class_Size - 1;
	    Ext_Class at 0
	       range Xt_Object_Private.Object_Class_Size ..
			Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size - 1;
	    Desktop_Class at 0
	       range Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size ..
			Xm_Desktop_Class_Rec_Size - 1;
	end record;

    type Xm_Desktop_Part is
	record
	    Parent : Xm.Xt_Widget;
	    Children : Xt.Xt_Ancillary_Types.Xt_Widget_List_Ptr;
	    Num_Children : Xt.Cardinal;
	    Num_Slots : Xt.Cardinal;
	end record;

    for Xm_Desktop_Part use
	record
	    Parent at 0 * Word_Size range 0 .. 31;
	    Children at 1 * Word_Size range 0 .. 31;
	    Num_Children at 2 * Word_Size range 0 .. 31;
	    Num_Slots at 3 * Word_Size range 0 .. 31;
	end record;

    Xm_Desktop_Part_Size : constant := 4 * 32;
    Xm_Desktop_Rec_Size : constant :=
       Xm_Ext_Object_Private.Ext_Object_Rec_Size + Xm_Desktop_Part_Size;

    type Xm_Desktop_Rec is
	record
	    Object : Xt_Object_Private.Object_Part;
	    Ext : Xm_Ext_Object_Private.Ext_Object_Part;
	    Desktop : Xm_Desktop_Part;
	end record;

    for Xm_Desktop_Rec use
	record
	    Object at 0 range 0 .. Xt_Object_Private.Object_Part_Size - 1;
	    Ext at 0 range Xt_Object_Private.Object_Part_Size ..
			      Xm_Ext_Object_Private.Ext_Object_Rec_Size - 1;
	    Desktop at 0 range Xm_Ext_Object_Private.Ext_Object_Rec_Size ..
				  Xm_Desktop_Rec_Size - 1;
	end record;

    type Xm_Desktop_Rec_Ptr is access Xm_Desktop_Rec;
    type Xm_Desktop_Class_Rec_Ptr is access Xm_Desktop_Class_Rec;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Desktop_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Desktop_Class (X : in Xt.Widget_Class)
				 return Xm_Desktop_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Desktop_Rec_Ptr) return Xt.Widget;

    function To_Xm_Desktop (X : in Xt.Widget) return Xm_Desktop_Rec_Ptr;

end Xm_Desktop_Private;

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
