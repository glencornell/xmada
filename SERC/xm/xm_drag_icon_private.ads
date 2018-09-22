-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm, Xm_Drag_Icon,
     Xt_Rect_Object_Private, Xt_Object_Private;

package Xm_Drag_Icon_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    subtype Xm_Clone_Visual_Proc is X_Lib.X_Address;
    subtype Xm_Move_Pixmap_Proc is X_Lib.X_Address;

    type Xm_Drag_Icon_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Drag_Icon_Class_Part use
	record
	    Extension at 0 range 0 .. 31;
	end record;

    Drag_Icon_Class_Part_Size : constant := 32;
    Drag_Icon_Class_Rec_Size : constant :=
       Xt_Rect_Object_Private.Rect_Obj_Class_Size + Drag_Icon_Class_Part_Size;

    type Xm_Drag_Icon_Class_Rec is
	record
	    Rectangle_Class : Xt_Rect_Object_Private.Rect_Obj_Class_Part;
	    Drag_Icon_Class : Xm_Drag_Icon_Class_Part;
	end record;

    for Xm_Drag_Icon_Class_Rec use
	record
	    Rectangle_Class at 0
	       range 0 .. Xt_Rect_Object_Private.Rect_Obj_Class_Size - 1;
	    Drag_Icon_Class at 0
	       range Xt_Rect_Object_Private.Rect_Obj_Class_Size ..
			Drag_Icon_Class_Rec_Size - 1;
	end record;

    type Xm_Drag_Icon_Part is
	record
	    Depth : Xt.Cardinal;
	    Pixmap : X_Lib.Pixmap;
	    Width : Xt.Dimension;
	    Height : Xt.Dimension;
	    Mask : X_Lib.Pixmap;
	    Hot_X : Xt.Position;
	    Hot_Y : Xt.Position;
	    Offset_X : Xt.Position;
	    Offset_Y : Xt.Position;
	    Attachment : Xm_Drag_Icon.Xm_Drag_Attach;
	    Is_Dirty : Xm.Xm_Boolean;
	    Dummy : Xm.Xm_Boolean;
	end record;

    for Xm_Drag_Icon_Part use
	record
	    Depth at 0 * Word_Size range 0 .. 31;
	    Pixmap at 1 * Word_Size range 0 .. 31;
	    Width at 2 * Word_Size range 0 .. 15;
	    Height at 2 * Word_Size + 2 range 0 .. 15;
	    Mask at 3 * Word_Size range 0 .. 31;
	    Hot_X at 4 * Word_Size range 0 .. 15;
	    Hot_Y at 4 * Word_Size + 2 range 0 .. 15;
	    Offset_X at 5 * Word_Size range 0 .. 15;
	    Offset_Y at 5 * Word_Size + 2 range 0 .. 15;
	    Attachment at 6 * Word_Size range 0 .. 7;
	    Is_Dirty at 6 * Word_Size + 1 range 0 .. 7;
	    Dummy at 6 * Word_Size + 3 range 0 .. 7;
	end record;

    Drag_Icon_Part_Size : constant := 7 * 32;
    Drag_Icon_Rec_Size : constant :=
       Xt_Rect_Object_Private.Rect_Obj_Rec_Size + Drag_Icon_Part_Size;

    type Xm_Drag_Icon_Rec is
	record
	    Object : Xt_Object_Private.Object_Part;
	    Rectangle : Xt_Rect_Object_Private.Rect_Obj_Part;
	    Drag : Xm_Drag_Icon_Part;
	end record;

    for Xm_Drag_Icon_Rec use
	record
	    Object at 0 range 0 .. Xt_Object_Private.Object_Part_Size - 1;
	    Rectangle at 0
	       range Xt_Object_Private.Object_Part_Size ..
			Xt_Rect_Object_Private.Rect_Obj_Rec_Size - 1;
	    Drag at 0 range Xt_Rect_Object_Private.Rect_Obj_Rec_Size ..
			       Drag_Icon_Rec_Size - 1;
	end record;

    type Xm_Drag_Icon_Object_Class_Rec_Ptr is access Xm_Drag_Icon_Class_Rec;
    type Xm_Drag_Icon_Object_Rec_Ptr is access Xm_Drag_Icon_Rec;

    -- functions for conversions.

    function To_Widget_Class (X : in Xm_Drag_Icon_Object_Class_Rec_Ptr)
			     return Xt.Widget_Class;

    function To_Xm_Drag_Icon_Object_Class
		(X : in Xt.Widget_Class)
		return Xm_Drag_Icon_Object_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Drag_Icon_Object_Rec_Ptr) return Xt.Widget;

    function To_Xm_Drag_Icon_Object (X : in Xt.Widget)
				    return Xm_Drag_Icon_Object_Rec_Ptr;
end Xm_Drag_Icon_Private;

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
