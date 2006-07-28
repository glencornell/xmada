-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm, Xt_Core_Private,
     Xt_Composite_Private, Xt_Constraint_Private, Xm_Private,
     Unchecked_Conversion, Xm_Scroll_Bar_Private, Xm_Drawing_Area_Private;

package Xm_Scrolled_Window_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Scrolled_Window_Class_Part is
	record
	    Dummy : X_Configuration_Dependent.Int;
	end record;

    for Xm_Scrolled_Window_Class_Part use
	record
	    Dummy at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Scrolled_Window_Class_Part_Size : constant := 32;
    Xm_Scrolled_Window_Class_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Class_Rec_Size +
	  Xm_Scrolled_Window_Class_Part_Size;

    type Xm_Scrolled_Window_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Constraint_Class : Xt_Constraint_Private.Constraint_Class_Part;
	    Manager_Class : Xm_Private.Xm_Manager_Class_Part;
	    Scrolled_Window_Class : Xm_Scrolled_Window_Class_Part;
	end record;

    for Xm_Scrolled_Window_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xt_Composite_Private.Composite_Class_Rec_Size - 1;
	    Constraint_Class at 0
	       range Xt_Composite_Private.Composite_Class_Rec_Size ..
			Xt_Constraint_Private.Constraint_Class_Rec_Size - 1;
	    Manager_Class at 0
	       range Xt_Constraint_Private.Constraint_Class_Rec_Size ..
			Xm_Private.Xm_Manager_Class_Rec_Size - 1;
	    Scrolled_Window_Class at 0
	       range Xm_Private.Xm_Manager_Class_Rec_Size ..
			Xm_Scrolled_Window_Class_Rec_Size - 1;
	end record;

    type Xm_Scrolled_Window_Part is
	record
	    V_Min : X_Configuration_Dependent.Int;
	    V_Max : X_Configuration_Dependent.Int;
	    V_Origin : X_Configuration_Dependent.Int;
	    V_Extent : X_Configuration_Dependent.Int;
	    H_Min : X_Configuration_Dependent.Int;
	    H_Max : X_Configuration_Dependent.Int;
	    H_Origin : X_Configuration_Dependent.Int;
	    H_Extent : X_Configuration_Dependent.Int;
	    Hsb_X : Xt.Position;
	    Hsb_Y : Xt.Position;
	    Hsb_Width : Xt.Dimension;
	    Hsb_Height : Xt.Dimension;
	    Vsb_X : Xt.Position;
	    Vsb_Y : Xt.Position;
	    Vsb_Width : Xt.Dimension;
	    Vsb_Height : Xt.Dimension;
	    Given_Height : Xt.Dimension;
	    Given_Width : Xt.Dimension;
	    Area_Width : Xt.Dimension;
	    Area_Height : Xt.Dimension;
	    Width_Pad : Xt.Dimension;
	    Height_Pad : Xt.Dimension;
	    X_Offset : Xt.Position;
	    Y_Offset : Xt.Position;
	    Pad : Xt.Dimension;
	    Has_Hsb : Xm.Xm_Boolean;
	    Has_Vsb : Xm.Xm_Boolean;
	    In_Init : Xm.Xm_Boolean;
	    From_Resize : Xm.Xm_Boolean;
	    Visual_Policy : X_Configuration_Dependent.Unsigned_Char;
	    Scroll_Policy : X_Configuration_Dependent.Unsigned_Char;
	    Scroll_Bar_Policy : X_Configuration_Dependent.Unsigned_Char;
	    Placement : X_Configuration_Dependent.Unsigned_Char;
	    H_Scroll_Bar : Xm_Scroll_Bar_Private.Xm_Scroll_Bar_Rec_Ptr;
	    V_Scroll_Bar : Xm_Scroll_Bar_Private.Xm_Scroll_Bar_Rec_Ptr;
	    Clip_Window : Xm_Drawing_Area_Private.Xm_Drawing_Area_Rec_Ptr;
	    Work_Window : Xt.Widget;
	    Traverse_Obscured_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	end record;

    for Xm_Scrolled_Window_Part use
	record
	    V_Min at 0 * Word_Size range 0 .. 31;
	    V_Max at 1 * Word_Size range 0 .. 31;
	    V_Origin at 2 * Word_Size range 0 .. 31;
	    V_Extent at 3 * Word_Size range 0 .. 31;
	    H_Min at 4 * Word_Size range 0 .. 31;
	    H_Max at 5 * Word_Size range 0 .. 31;
	    H_Origin at 6 * Word_Size range 0 .. 31;
	    H_Extent at 7 * Word_Size range 0 .. 31;
	    Hsb_X at 8 * Word_Size range 0 .. 15;
	    Hsb_Y at 8 * Word_Size + 2 range 0 .. 15;
	    Hsb_Width at 9 * Word_Size range 0 .. 15;
	    Hsb_Height at 9 * Word_Size + 2 range 0 .. 15;
	    Vsb_X at 10 * Word_Size range 0 .. 15;
	    Vsb_Y at 10 * Word_Size + 2 range 0 .. 15;
	    Vsb_Width at 11 * Word_Size range 0 .. 15;
	    Vsb_Height at 11 * Word_Size + 2 range 0 .. 15;
	    Given_Height at 12 * Word_Size range 0 .. 15;
	    Given_Width at 12 * Word_Size + 2 range 0 .. 15;
	    Area_Width at 13 * Word_Size range 0 .. 15;
	    Area_Height at 13 * Word_Size + 2 range 0 .. 15;
	    Width_Pad at 14 * Word_Size range 0 .. 15;
	    Height_Pad at 14 * Word_Size + 2 range 0 .. 15;
	    X_Offset at 15 * Word_Size range 0 .. 15;
	    Y_Offset at 15 * Word_Size + 2 range 0 .. 15;
	    Pad at 16 * Word_Size range 0 .. 15;
	    Has_Hsb at 16 * Word_Size + 2 range 0 .. 07;
	    Has_Vsb at 16 * Word_Size + 3 range 0 .. 07;
	    In_Init at 17 * Word_Size + 0 range 0 .. 07;
	    From_Resize at 17 * Word_Size + 1 range 0 .. 07;
	    Visual_Policy at 17 * Word_Size + 2 range 0 .. 07;
	    Scroll_Policy at 17 * Word_Size + 3 range 0 .. 07;
	    Scroll_Bar_Policy at 18 * Word_Size + 0 range 0 .. 07;
	    Placement at 18 * Word_Size + 1 range 0 .. 07;
	    H_Scroll_Bar at 19 * Word_Size range 0 .. 31;
	    V_Scroll_Bar at 20 * Word_Size range 0 .. 31;
	    Clip_Window at 21 * Word_Size range 0 .. 31;
	    Work_Window at 22 * Word_Size range 0 .. 31;
	    Traverse_Obscured_Callback at 23 * Word_Size range 0 .. 31;
	end record;

    Xm_Scrolled_Window_Part_Size : constant := 24 * 32;
    Xm_Scrolled_Window_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Rec_Size + Xm_Scrolled_Window_Part_Size;

    type Xm_Scrolled_Window_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Xt_Constraint_Private.Constraint_Part;
	    Manager : Xm_Private.Xm_Manager_Part;
	    Scrolled_Window : Xm_Scrolled_Window_Part;
	end record;

    for Xm_Scrolled_Window_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Constraint at 0
	       range Xt_Composite_Private.Composite_Rec_Size ..
			Xt_Constraint_Private.Constraint_Rec_Size - 1;
	    Manager at 0 range Xt_Constraint_Private.Constraint_Rec_Size ..
				  Xm_Private.Xm_Manager_Rec_Size - 1;
	    Scrolled_Window at 0 range Xm_Private.Xm_Manager_Rec_Size ..
					  Xm_Scrolled_Window_Rec_Size - 1;
	end record;

    Default_Height : constant := 20;
    Default_Width : constant := 20;

    type Xm_Scrolled_Window_Rec_Ptr is access Xm_Scrolled_Window_Rec;
    type Xm_Scrolled_Window_Class_Rec_Ptr is
       access Xm_Scrolled_Window_Class_Rec;

    function To_Widget_Class (X : in Xm_Scrolled_Window_Class_Rec_Ptr)
			     return Xt.Widget_Class;

    function To_Xm_Scrolled_Window_Class
		(X : in Xt.Widget_Class)
		return Xm_Scrolled_Window_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Scrolled_Window_Rec_Ptr) return Xt.Widget;

    function To_Xm_Scrolled_Window (X : in Xt.Widget)
				   return Xm_Scrolled_Window_Rec_Ptr;

end Xm_Scrolled_Window_Private;

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

