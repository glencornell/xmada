-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm, Xt_Core_Private,
     Xm_Private, Xm_Label_Private, Unchecked_Conversion;

package Xm_Cascade_Button_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

-- /* The CascadeButton instance record */

    type Xm_Cascade_Button_Part is
	record
	    Activate_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Cascade_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Submenu : Xt.Widget;
	    Cascade_Pixmap : X_Lib.Pixmap;
	    Map_Delay : X_Configuration_Dependent.Int;
	    Armed : Xm.Xm_Boolean;
	    Cascade_Rect : X_Lib.Rectangle;
	    Timer : Xt.Xt_Interval_Id;
	    Armed_Pixmap : X_Lib.Pixmap;
	end record;

    for Xm_Cascade_Button_Part use
	record
	    Activate_Callback at 0 * Word_Size range 0 .. 31;
	    Cascade_Callback at 1 * Word_Size range 0 .. 31;
	    Submenu at 2 * Word_Size range 0 .. 31;
	    Cascade_Pixmap at 3 * Word_Size range 0 .. 31;
	    Map_Delay at 4 * Word_Size range 0 .. 31;
	    Armed at 5 * Word_Size range 0 .. 7;
	    Cascade_Rect at 6 * Word_Size range 0 .. 63;
	    Timer at 8 * Word_Size range 0 .. 31;
	    Armed_Pixmap at 9 * Word_Size range 0 .. 31;
	end record;

    Xm_Cascade_Button_Part_Size : constant := 10 * 32;
    Xm_Cascade_Button_Rec_Size : constant :=
       Xm_Label_Private.Xm_Label_Rec_Size + Xm_Cascade_Button_Part_Size;

    type Xm_Cascade_Button_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Primitive : Xm_Private.Xm_Primitive_Part;
	    Label : Xm_Label_Private.Xm_Label_Part;
	    Cascade_Button : Xm_Cascade_Button_Part;
	end record;

    for Xm_Cascade_Button_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Primitive at 0 range Xt_Core_Private.Core_Part_Size ..
				    Xm_Private.Xm_Primitive_Rec_Size - 1;
	    Label at 0 range Xm_Private.Xm_Primitive_Rec_Size ..  
				Xm_Label_Private.Xm_Label_Rec_Size - 1;
	    Cascade_Button at 0 range Xm_Label_Private.Xm_Label_Rec_Size ..
					 Xm_Cascade_Button_Rec_Size - 1;
	end record;


    type Xm_Cascade_Button_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Cascade_Button_Class_Part use
	record
	    Extension at 0 range 0 .. 31;
	end record;

    Xm_Cascade_Button_Class_Part_Size : constant := 32;
    Xm_Cascade_Button_Class_Rec_Size : constant :=
       Xm_Label_Private.Xm_Label_Class_Rec_Size +  
	  Xm_Cascade_Button_Class_Part_Size;


    type Xm_Cascade_Button_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Primitive_Class : Xm_Private.Xm_Primitive_Class_Part;
	    Label_Class : Xm_Label_Private.Xm_Label_Class_Part;
	    Cascade_Button_Class : Xm_Cascade_Button_Class_Part;
	end record;

    for Xm_Cascade_Button_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Primitive_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xm_Private.Xm_Primitive_Class_Rec_Size - 1;
	    Label_Class at 0
	       range Xm_Private.Xm_Primitive_Class_Rec_Size ..
			Xm_Label_Private.Xm_Label_Class_Rec_Size - 1;
	    Cascade_Button_Class at 0
	       range Xm_Label_Private.Xm_Label_Class_Rec_Size ..
			Xm_Cascade_Button_Class_Rec_Size - 1;
	end record;

    type Xm_Cascade_Button_Rec_Ptr is access Xm_Cascade_Button_Rec;
    type Xm_Cascade_Button_Class_Rec_Ptr is access Xm_Cascade_Button_Class_Rec;

    subtype Xm_Cascade_Button_Widget_Rec_Ptr is Xm_Cascade_Button_Rec_Ptr;
    subtype Xm_Cascade_Button_Widget_Rec is Xm_Cascade_Button_Rec;


    Xmcb_Armed_Bit : constant := 1;
    Xmcb_Traverse_Bit : constant := 2;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Cascade_Button_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Cascade_Button_Class (X : in Xt.Widget_Class)
					return Xm_Cascade_Button_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Cascade_Button_Rec_Ptr) return Xt.Widget;

    function To_Xm_Cascade_Button (X : in Xt.Widget)
				  return Xm_Cascade_Button_Rec_Ptr;



end Xm_Cascade_Button_Private;

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
