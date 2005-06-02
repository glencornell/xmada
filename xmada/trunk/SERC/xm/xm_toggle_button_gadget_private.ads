-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm, Xt_Object_Private,
     Xt_Rect_Object_Private, Xm_Private, Xm_Label_Gadget_Private,
     Xm_Ext_Object_Private, Unchecked_Conversion;

package Xm_Toggle_Button_Gadget_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Toggle_Button_G_Cache_Obj_Class_Part is
	record
	    Dummy : X_Configuration_Dependent.Int;
	end record;

    for Xm_Toggle_Button_G_Cache_Obj_Class_Part use
	record
	    Dummy at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Toggle_Button_G_Cache_Obj_Class_Part_Size : constant := 32;
    Xm_Toggle_Button_G_Cache_Obj_Class_Rec_Size : constant :=
       Xm_Label_Gadget_Private.Xm_Label_G_Cache_Obj_Class_Rec_Size +
	  Xm_Toggle_Button_G_Cache_Obj_Class_Part_Size;

    type Xm_Toggle_Button_G_Cache_Obj_Class_Rec is
	record
	    Object_Class : Xt_Object_Private.Object_Class_Part;
	    Ext_Class : Xm_Ext_Object_Private.Ext_Object_Class_Part;
	    Label_Class_Cache : Xm_Label_Gadget_Private.
				   Xm_Label_G_Cache_Obj_Class_Part;
	    Toggle_Button_Class_Cache : Xm_Toggle_Button_G_Cache_Obj_Class_Part;
	end record;

    for Xm_Toggle_Button_G_Cache_Obj_Class_Rec use
	record
	    Object_Class at 0
	       range 0 .. Xt_Object_Private.Object_Class_Rec_Size - 1;
	    Ext_Class at 0
	       range Xt_Object_Private.Object_Class_Rec_Size ..
			Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size - 1;
	    Label_Class_Cache at 0
	       range Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size ..
			Xm_Label_Gadget_Private.
			   Xm_Label_G_Cache_Obj_Class_Rec_Size - 1;
	    Toggle_Button_Class_Cache at 0
	       range Xm_Label_Gadget_Private.
		     Xm_Label_G_Cache_Obj_Class_Rec_Size ..
			Xm_Toggle_Button_G_Cache_Obj_Class_Rec_Size - 1;
	end record;

    type Xm_Toggle_Button_G_Cache_Obj_Part is
	record
	    Ind_Type : X_Configuration_Dependent.Unsigned_Char;
	    Visible : Xm.Xm_Boolean;
	    Spacing : Xt.Dimension;
	    Indicator_Dim : Xt.Dimension;
	    On_Pixmap : X_Lib.Pixmap;
	    Insen_Pixmap : X_Lib.Pixmap;
	    Ind_On : Xm.Xm_Boolean;
	    Fill_On_Select : Xm.Xm_Boolean;
	    Select_Color : X_Lib.Pixel;
	    Select_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Background_Gc : X_Lib.Graphic_Output.Graphic_Context;
	end record;
    for Xm_Toggle_Button_G_Cache_Obj_Part use
	record
	    Ind_Type at 0 * Word_Size range 0 .. 7;
	    Visible at 0 * Word_Size + 1 range 0 .. 7;
	    Spacing at 0 * Word_Size + 2 range 0 .. 15;
	    Indicator_Dim at 1 * Word_Size range 0 .. 15;
	    On_Pixmap at 2 * Word_Size range 0 .. 31;
	    Insen_Pixmap at 3 * Word_Size range 0 .. 31;
	    Ind_On at 4 * Word_Size range 0 .. 7;
	    Fill_On_Select at 4 * Word_Size + 1 range 0 .. 7;
	    Select_Color at 5 * Word_Size range 0 .. 31;
	    Select_Gc at 6 * Word_Size range 0 .. 31;
	    Background_Gc at 7 * Word_Size range 0 .. 31;
	end record;


    Xm_Toggle_Button_G_Cache_Obj_Part_Size : constant := 8 * 32;
    Xm_Toggle_Button_G_Cache_Obj_Rec_Size : constant :=
       Xm_Label_Gadget_Private.Xm_Label_G_Cache_Obj_Rec_Size +
	  Xm_Toggle_Button_G_Cache_Obj_Part_Size;

    type Xm_Toggle_Button_G_Cache_Obj_Rec is
	record
	    Ext : Xm_Ext_Object_Private.Ext_Object_Part;
	    Label_Cache : Xm_Label_Gadget_Private.Xm_Label_G_Cache_Obj_Part;
	    Toggle_Button_Cache : Xm_Toggle_Button_G_Cache_Obj_Part;
	end record;


    for Xm_Toggle_Button_G_Cache_Obj_Rec use
	record
	    Ext at 0 range 0 .. Xm_Ext_Object_Private.Ext_Object_Part_Size - 1;
	    Label_Cache at 0
	       range Xm_Ext_Object_Private.Ext_Object_Part_Size ..
			Xm_Label_Gadget_Private.Xm_Label_G_Cache_Obj_Rec_Size -
			   1;
	    Toggle_Button_Cache at 0
	       range Xm_Label_Gadget_Private.Xm_Label_G_Cache_Obj_Rec_Size ..
			Xm_Toggle_Button_G_Cache_Obj_Rec_Size - 1;
	end record;

    type Xm_Toggle_Button_G_Cache_Obj_Rec_Ptr is
       access Xm_Toggle_Button_G_Cache_Obj_Rec;
    type Xm_Toggle_Button_G_Cache_Obj_Part_Ptr is
       access Xm_Toggle_Button_G_Cache_Obj_Part;
    type Xm_Toggle_Button_G_Cache_Obj_Class_Rec_Ptr is
       access Xm_Toggle_Button_G_Cache_Obj_Class_Rec;


--/*************************************************/


    type Xm_Toggle_Button_Gadget_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;


    for Xm_Toggle_Button_Gadget_Class_Part use
	record
	    Extension at 0 * Word_Size range 0 .. 31;
	end record;


    Xm_Toggle_Button_Gadget_Class_Part_Size : constant := 32;
    Xm_Toggle_Button_Gadget_Class_Rec_Size : constant :=
       Xm_Label_Gadget_Private.Xm_Label_Gadget_Class_Rec_Size +
	  Xm_Toggle_Button_Gadget_Class_Part_Size;

    type Xm_Toggle_Button_Gadget_Class_Rec is
	record
	    Rect_Class : Xt_Rect_Object_Private.Rect_Obj_Class_Part;
	    Gadget_Class : Xm_Private.Xm_Gadget_Class_Part;
	    Label_Class : Xm_Label_Gadget_Private.Xm_Label_Gadget_Class_Part;
	    Toggle_Button_Class : Xm_Toggle_Button_Gadget_Class_Part;
	end record;

    for Xm_Toggle_Button_Gadget_Class_Rec use
	record
	    Rect_Class at 0
	       range 0 .. Xt_Rect_Object_Private.Rect_Obj_Class_Rec_Size - 1;
	    Gadget_Class at 0
	       range Xt_Rect_Object_Private.Rect_Obj_Class_Rec_Size ..
			Xm_Private.Xm_Gadget_Class_Rec_Size - 1;
	    Label_Class at 0
	       range Xm_Private.Xm_Gadget_Class_Rec_Size ..
			Xm_Label_Gadget_Private.Xm_Label_Gadget_Class_Rec_Size -
			   1;
	    Toggle_Button_Class at 0
	       range Xm_Label_Gadget_Private.Xm_Label_Gadget_Class_Rec_Size ..
			Xm_Toggle_Button_Gadget_Class_Rec_Size - 1;
	end record;

    type Xm_Toggle_Button_Gadget_Part is
	record
	    Indicator_Set : Xm.Xm_Boolean;
	    Set : Xm.Xm_Boolean;
	    Visual_Set : Xm.Xm_Boolean;
	    Armed : Xm.Xm_Boolean;
	    Value_Changed_Cb : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Arm_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Disarm_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Cache : Xm_Toggle_Button_G_Cache_Obj_Part_Ptr;
	end record;

    for Xm_Toggle_Button_Gadget_Part use
	record
	    Indicator_Set at 0 * Word_Size range 0 .. 7;
	    Set at 0 * Word_Size + 1 range 0 .. 7;
	    Visual_Set at 0 * Word_Size + 2 range 0 .. 7;
	    Armed at 0 * Word_Size + 3 range 0 .. 7;
	    Value_Changed_Cb at 1 * Word_Size range 0 .. 31;
	    Arm_Callback at 2 * Word_Size range 0 .. 31;
	    Disarm_Callback at 3 * Word_Size range 0 .. 31;
	    Cache at 4 * Word_Size range 0 .. 31;
	end record;


    Xm_Toggle_Button_Gadget_Part_Size : constant := 5 * 32;
    Xm_Toggle_Button_Gadget_Rec_Size : constant :=
       Xm_Label_Gadget_Private.Xm_Label_Gadget_Rec_Size +
	  Xm_Toggle_Button_Gadget_Part_Size;

    type Xm_Toggle_Button_Gadget_Rec is
	record
	    Object : Xt_Object_Private.Object_Part;
	    Rectangle : Xt_Rect_Object_Private.Rect_Obj_Part;
	    Gadget : Xm_Private.Xm_Gadget_Part;
	    Label : Xm_Label_Gadget_Private.Xm_Label_Gadget_Part;
	    Toggle_Button : Xm_Toggle_Button_Gadget_Part;
	end record;

    for Xm_Toggle_Button_Gadget_Rec use
	record
	    Object at 0 range 0 .. Xt_Object_Private.Object_Rec_Size - 1;
	    Rectangle at 0
	       range Xt_Object_Private.Object_Part_Size ..
			Xt_Rect_Object_Private.Rect_Obj_Rec_Size - 1;
	    Gadget at 0 range Xt_Rect_Object_Private.Rect_Obj_Rec_Size ..
				 Xm_Private.Xm_Gadget_Rec_Size - 1;
	    Label at 0 range Xm_Private.Xm_Gadget_Rec_Size ..
				Xm_Label_Gadget_Private.
				   Xm_Label_Gadget_Rec_Size - 1;
	    Toggle_Button at 0
	       range Xm_Label_Gadget_Private.Xm_Label_Gadget_Rec_Size ..
			Xm_Toggle_Button_Gadget_Rec_Size - 1;
	end record;

    type Xm_Toggle_Button_Gadget_Class_Rec_Ptr is
       access Xm_Toggle_Button_Gadget_Class_Rec;
    type Xm_Toggle_Button_Gadget_Rec_Ptr is access Xm_Toggle_Button_Gadget_Rec;

    function To_Gadget_Class (X : in Xm_Toggle_Button_Gadget_Class_Rec_Ptr)
			     return Xm.Gadget_Class;

    function To_Xm_Toggle_Button_Gadget_Class
		(X : in Xm.Gadget_Class)
		return Xm_Toggle_Button_Gadget_Class_Rec_Ptr;

    function To_Gadget
		(X : in Xm_Toggle_Button_Gadget_Rec_Ptr) return Xm.Gadget;

    function To_Xm_Toggle_Button_Gadget (X : in Xm.Gadget)
					return Xm_Toggle_Button_Gadget_Rec_Ptr;


end Xm_Toggle_Button_Gadget_Private;

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
