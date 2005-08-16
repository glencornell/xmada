-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm, Xm_Drag_Icon_Private,
     Xt_Shell_Private, Xt_Composite_Private, Xt_Core_Private;

package Xm_Drag_Over_Shell_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Drag_Over_Shell_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Drag_Over_Shell_Class_Part use
	record
	    Extension at 0 * Word_Size range 0 .. 31;
	end record;

    Drag_Over_Shell_Class_Part_Size : constant := 32;
    Drag_Over_Shell_Class_Rec_Size : constant :=
       Xt_Shell_Private.Vendor_Shell_Class_Rec_Size +
	  Drag_Over_Shell_Class_Part_Size;

    type Xm_Drag_Over_Shell_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Shell_Class : Xt_Shell_Private.Shell_Class_Part;
	    Wm_Shell_Class : Xt_Shell_Private.Wm_Shell_Class_Part;
	    Vendor_Shell_Class : Xt_Shell_Private.Vendor_Shell_Class_Part;
	    Drag_Over_Shell_Class : Xm_Drag_Over_Shell_Class_Part;
	end record;

    for Xm_Drag_Over_Shell_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xt_Composite_Private.Composite_Class_Rec_Size - 1;
	    Shell_Class at 0
	       range Xt_Composite_Private.Composite_Class_Rec_Size ..
			Xt_Shell_Private.Shell_Class_Rec_Size - 1;
	    Wm_Shell_Class at 0
	       range Xt_Shell_Private.Shell_Class_Rec_Size ..
			Xt_Shell_Private.Wm_Shell_Class_Rec_Size - 1;
	    Vendor_Shell_Class at 0
	       range Xt_Shell_Private.Wm_Shell_Class_Rec_Size ..
			Xt_Shell_Private.Vendor_Shell_Class_Rec_Size - 1;
	    Drag_Over_Shell_Class at 0
	       range Xt_Shell_Private.Vendor_Shell_Class_Rec_Size ..
			Drag_Over_Shell_Class_Rec_Size - 1;
	end record;

    type Xm_Backing_Rec is
	record
	    X : Xt.Position;
	    Y : Xt.Position;
	    Pixmap : X_Lib.Pixmap;
	end record;

    for Xm_Backing_Rec use
	record
	    X at 0 * Word_Size range 0 .. 15;
	    Y at 0 * Word_Size range 16 .. 31;
	    Pixmap at 1 * Word_Size range 0 .. 31;
	end record;

    Xm_Backing_Rec_Size : constant := 2 * 32;

    type Xm_Backing is access Xm_Backing_Rec;

    type Xm_Drag_Over_Blend_Rec is
	record
	    Source_Icon : Xm_Drag_Icon_Private.Xm_Drag_Icon_Object_Rec_Ptr;
	    Source_X : Xt.Position;
	    Source_Y : Xt.Position;
	    Mixed_Icon : Xm_Drag_Icon_Private.Xm_Drag_Icon_Object_Rec_Ptr;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	end record;

    for Xm_Drag_Over_Blend_Rec use
	record
	    Source_Icon at 0 * Word_Size range 0 .. 31;
	    Source_X at 1 * Word_Size range 0 .. 15;
	    Source_Y at 1 * Word_Size range 16 .. 31;
	    Mixed_Icon at 2 * Word_Size range 0 .. 31;
	    Gc at 3 * Word_Size range 0 .. 31;
	end record;

    Xm_Drag_Over_Blend_Rec_Size : constant := 4 * 32;

    type Xm_Drag_Over_Blend is access Xm_Drag_Over_Blend_Rec;

    type Xm_Drag_Over_Shell_Part is
	record
	    Hot_X : Xt.Position;
	    Hot_Y : Xt.Position;
	    Cursor_State : X_Configuration_Dependent.Unsigned_Char;
	    Mode : X_Configuration_Dependent.Unsigned_Char;
	    Active_Mode : X_Configuration_Dependent.Unsigned_Char;
	    Initial_X : Xt.Position;
	    Initial_Y : Xt.Position;
	    State_Icon : Xm_Drag_Icon_Private.Xm_Drag_Icon_Object_Rec_Ptr;
	    Op_Icon : Xm_Drag_Icon_Private.Xm_Drag_Icon_Object_Rec_Ptr;
	    Cursor_Blend : Xm_Drag_Over_Blend_Rec;
	    Root_Blend : Xm_Drag_Over_Blend_Rec;
	    Cursor_Foreground : X_Lib.Pixel;
	    Cursor_Background : X_Lib.Pixel;
	    Nc_Cursor : X_Lib.Cursors.Cursor;
	    Active_Cursor : X_Lib.Cursors.Cursor;
	    Backing : Xm_Backing_Rec;
	    Tmp_Pix : X_Lib.Pixmap;
	    Tmp_Bit : X_Lib.Pixmap;
	    Is_Visible : Xm.Xm_Boolean;
	    Dummy : Xm.Xm_Boolean;
	end record;

    for Xm_Drag_Over_Shell_Part use
	record
	    Hot_X at 0 * Word_Size range 0 .. 15;
	    Hot_Y at 0 * Word_Size + 2 range 0 .. 15;
	    Cursor_State at 1 * Word_Size range 0 .. 7;
	    Mode at 1 * Word_Size + 1 range 0 .. 7;
	    Active_Mode at 1 * Word_Size + 2 range 0 .. 7;
	    Initial_X at 2 * Word_Size range 0 .. 15;
	    Initial_Y at 2 * Word_Size + 2 range 0 .. 15;
	    State_Icon at 3 * Word_Size range 0 .. 31;
	    Op_Icon at 4 * Word_Size range 0 .. 31;
	    Cursor_Blend at 5 * Word_Size range 0 .. 4 * 32 - 1;
	    Root_Blend at 9 * Word_Size range 0 .. 4 * 32 - 1;
	    Cursor_Foreground at 13 * Word_Size range 0 .. 31;
	    Cursor_Background at 14 * Word_Size range 0 .. 31;
	    Nc_Cursor at 15 * Word_Size range 0 .. 31;
	    Active_Cursor at 16 * Word_Size range 0 .. 31;
	    Backing at 17 * Word_Size range 0 .. 2 * 32 - 1;
	    Tmp_Pix at 19 * Word_Size range 0 .. 31;
	    Tmp_Bit at 20 * Word_Size range 0 .. 31;
	    Is_Visible at 21 * Word_Size range 0 .. 7;
	    Dummy at 21 * Word_Size + 3 range 0 .. 7;
	end record;

    Drag_Over_Shell_Part_Size : constant := 22 * 32;
    Drag_Over_Shell_Rec_Size : constant :=
       Xt_Shell_Private.Vendor_Shell_Rec_Size + Drag_Over_Shell_Part_Size;

    type Xm_Drag_Over_Shell_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Shell : Xt_Shell_Private.Shell_Part;
	    Wm_Shell : Xt_Shell_Private.Wm_Shell_Part;
	    Vendor_Shell : Xt_Shell_Private.Vendor_Shell_Part;
	    Drag : Xm_Drag_Over_Shell_Part;
	end record;

    for Xm_Drag_Over_Shell_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Size ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Shell at 0 range Xt_Composite_Private.Composite_Rec_Size ..
				Xt_Shell_Private.Shell_Rec_Size - 1;
	    Wm_Shell at 0 range Xt_Shell_Private.Shell_Rec_Size ..
				   Xt_Shell_Private.Wm_Shell_Rec_Size - 1;
	    Vendor_Shell at 0
	       range Xt_Shell_Private.Wm_Shell_Rec_Size ..
			Xt_Shell_Private.Vendor_Shell_Rec_Size - 1;
	    Drag at 0 range Xt_Shell_Private.Vendor_Shell_Rec_Size ..
			       Drag_Over_Shell_Rec_Size - 1;
	end record;

    type Xm_Drag_Over_Shell_Rec_Ptr is access Xm_Drag_Over_Shell_Rec;
    type Xm_Drag_Over_Shell_Class_Rec_Ptr is
       access Xm_Drag_Over_Shell_Class_Rec;

    function To_Widget_Class (X : in Xm_Drag_Over_Shell_Class_Rec_Ptr)
			     return Xt.Widget_Class;

    function To_Xm_Drag_Over_Shell_Class
		(X : in Xt.Widget_Class)
		return Xm_Drag_Over_Shell_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Drag_Over_Shell_Rec_Ptr) return Xt.Widget;

    function To_Xm_Drag_Over_Shell (X : in Xt.Widget)
				   return Xm_Drag_Over_Shell_Rec_Ptr;
end Xm_Drag_Over_Shell_Private;

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
