-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm,
     Xt_Object_Private, Xt_Rect_Object_Private, Xm_Private,
     Xm_Ext_Object_Private, Unchecked_Conversion;

package Xm_Separator_Gadget_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Separator_G_Cache_Obj_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Separator_G_Cache_Obj_Class_Part use
	record
	    Extension at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Separator_G_Cache_Obj_Class_Part_Size : constant := 32;
    Xm_Separator_G_Cache_Obj_Class_Rec_Size : constant :=
       Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size +
	  Xm_Separator_G_Cache_Obj_Class_Part_Size;

    type Xm_Separator_G_Cache_Obj_Class_Rec is
	record
	    Object_Class : Xt_Object_Private.Object_Class_Part;
	    Ext_Class : Xm_Ext_Object_Private.Ext_Object_Class_Part;
	    Separator_Class_Cache : Xm_Separator_G_Cache_Obj_Class_Part;
	end record;

    for Xm_Separator_G_Cache_Obj_Class_Rec use
	record
	    Object_Class at 0
	       range 0 .. Xt_Object_Private.Object_Class_Rec_Size - 1;
	    Ext_Class at 0
	       range Xt_Object_Private.Object_Class_Rec_Size ..
			Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size - 1;
	    Separator_Class_Cache at 0
	       range Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size ..
			Xm_Separator_G_Cache_Obj_Class_Rec_Size - 1;
	end record;


    type Xm_Separator_G_Cache_Obj_Part is
	record
	    Margin : Xt.Dimension;
	    Orientation : X_Configuration_Dependent.Unsigned_Char;
	    Separator_Type : X_Configuration_Dependent.Unsigned_Char;
	    Separator_Gc : X_Lib.Graphic_Output.Graphic_Context;
	end record;

    for Xm_Separator_G_Cache_Obj_Part use
	record
	    Margin at 0 * Word_Size range 0 .. 15;
	    Orientation at 0 * Word_Size + 2 range 0 .. 7;
	    Separator_Type at 0 * Word_Size + 3 range 0 .. 7;
	    Separator_Gc at 1 * Word_Size range 0 .. 31;
	end record;

    Xm_Separator_G_Cache_Obj_Part_Size : constant := 2 * 32;
    Xm_Separator_G_Cache_Obj_Rec_Size : constant :=
       Xm_Ext_Object_Private.Ext_Object_Part_Size +
	  Xm_Separator_G_Cache_Obj_Part_Size;

    type Xm_Separator_G_Cache_Obj_Rec is
	record
	    Ext : Xm_Ext_Object_Private.Ext_Object_Part;
	    Separator_Cache : Xm_Separator_G_Cache_Obj_Part;
	end record;

    for Xm_Separator_G_Cache_Obj_Rec use
	record
	    Ext at 0 range 0 .. Xm_Ext_Object_Private.Ext_Object_Part_Size - 1;
	    Separator_Cache at 0
	       range Xm_Ext_Object_Private.Ext_Object_Part_Size ..
			Xm_Separator_G_Cache_Obj_Rec_Size - 1;
	end record;

    type Xm_Separator_G_Cache_Obj_Rec_Ptr is
       access Xm_Separator_G_Cache_Obj_Rec;
    type Xm_Separator_G_Cache_Obj_Part_Ptr is
       access Xm_Separator_G_Cache_Obj_Part;
    type Xm_Separator_G_Cache_Obj_Class_Rec_Ptr is
       access Xm_Separator_G_Cache_Obj_Class_Rec;

    type Xm_Separator_Gadget_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Separator_Gadget_Class_Part use
	record
	    Extension at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Separator_Gadget_Class_Part_Size : constant := 32;
    Xm_Separator_Gadget_Class_Rec_Size : constant :=
       Xm_Private.Xm_Gadget_Class_Rec_Size +
	  Xm_Separator_Gadget_Class_Part_Size;

    type Xm_Separator_Gadget_Class_Rec is
	record
	    Rect_Class : Xt_Rect_Object_Private.Rect_Obj_Class_Part;
	    Gadget_Class : Xm_Private.Xm_Gadget_Class_Part;
	    Separator_Class : Xm_Separator_Gadget_Class_Part;
	end record;

    for Xm_Separator_Gadget_Class_Rec use
	record
	    Rect_Class at 0
	       range 0 .. Xt_Rect_Object_Private.Rect_Obj_Class_Rec_Size - 1;
	    Gadget_Class at 0
	       range Xt_Rect_Object_Private.Rect_Obj_Class_Rec_Size ..
			Xm_Private.Xm_Gadget_Class_Rec_Size - 1;
	    Separator_Class at 0
	       range Xm_Private.Xm_Gadget_Class_Rec_Size ..
			Xm_Separator_Gadget_Class_Rec_Size - 1;
	end record;

    type Xm_Separator_Gadget_Part is
	record
	    Cache : Xm_Separator_G_Cache_Obj_Part_Ptr;
	end record;

    for Xm_Separator_Gadget_Part use
	record
	    Cache at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Separator_Gadget_Part_Size : constant := 32;
    Xm_Separator_Gadget_Rec_Size : constant :=
       Xm_Private.Xm_Gadget_Rec_Size + Xm_Separator_Gadget_Part_Size;

    type Xm_Separator_Gadget_Rec is
	record
	    Object : Xt_Object_Private.Object_Part;
	    Rectangle : Xt_Rect_Object_Private.Rect_Obj_Part;
	    Gadget : Xm_Private.Xm_Gadget_Part;
	    Separator : Xm_Separator_Gadget_Part;
	end record;

    for Xm_Separator_Gadget_Rec use
	record
	    Object at 0 range 0 .. Xt_Object_Private.Object_Rec_Size - 1;
	    Rectangle at 0
	       range Xt_Object_Private.Object_Part_Size ..
			Xt_Rect_Object_Private.Rect_Obj_Rec_Size - 1;
	    Gadget at 0 range Xt_Rect_Object_Private.Rect_Obj_Rec_Size ..
				 Xm_Private.Xm_Gadget_Rec_Size - 1;
	    Separator at 0 range Xm_Private.Xm_Gadget_Rec_Size ..
				    Xm_Separator_Gadget_Rec_Size - 1;
	end record;

    type Xm_Separator_Gadget_Class_Rec_Ptr is
       access Xm_Separator_Gadget_Class_Rec;
    type Xm_Separator_Gadget_Rec_Ptr is access Xm_Separator_Gadget_Rec;

    function To_Gadget_Class (X : in Xm_Separator_Gadget_Class_Rec_Ptr)
			     return Xm.Gadget_Class;

    function To_Xm_Separator_Gadget_Class
		(X : in Xm.Gadget_Class)
		return Xm_Separator_Gadget_Class_Rec_Ptr;

    function To_Gadget (X : in Xm_Separator_Gadget_Rec_Ptr) return Xm.Gadget;

    function To_Xm_Separator_Gadget (X : in Xm.Gadget)
				    return Xm_Separator_Gadget_Rec_Ptr;

end Xm_Separator_Gadget_Private;

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
