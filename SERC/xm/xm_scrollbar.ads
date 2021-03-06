-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with Xm, X_Lib, X_Configuration_Dependent;

package Xm_Scrollbar is
--    Copyright_Notice : constant String :=
--       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
--	  "All Rights Reserved.";
--
--    type Xm_Scroll_Bar_Callback_Rec is
--	record
--	    Reason : Xm.Callback_Reason;
--	    Event_Ptr : Xm.X_Event_Ptr;
--	    Value : X_Lib.X_Integer;
--	    Pixel : X_Lib.X_Integer;
--	end record;
--    for Xm_Scroll_Bar_Callback_Rec use
--	record
--	    Reason at 0 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Event_Ptr at 1 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Value at 2 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Pixel at 3 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	end record;
--    type Xm_Scroll_Bar_Callback_Rec_Ptr is access Xm_Scroll_Bar_Callback_Rec;

    subtype Scrollbar_Class is Xm.Primitive_Class;
    subtype Scrollbar_Widget is Xm.Primitive_Widget;

    function Xm_Scrollbar_Widget_Class return Scrollbar_Class;

--    function Xm_Is_Scrollbar (W : in Xm.Xt_Widget) return Boolean;

    procedure Xm_Scrollbar_Get_Values (W : in Xm.Xt_Widget;
				       Value : out X_Lib.X_Integer;
				       Slider_Size : out X_Lib.X_Integer;
				       Increment : out X_Lib.X_Integer;
				       Page_Increment : out X_Lib.X_Integer);

    procedure Xm_Scrollbar_Set_Values (W : in Xm.Xt_Widget;
				       Value : in X_Lib.X_Integer;
				       Slider_Size : in X_Lib.X_Integer;
				       Increment : in X_Lib.X_Integer;
				       Page_Increment : in X_Lib.X_Integer;
				       Notify : in Boolean);

    function Xm_Create_Scrollbar
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;
end Xm_Scrollbar;

------ COPYRIGHT AND DISTRIBUTION NOTICE ----------
--
-- (C) Copyright 1991, 1993 Systems Engineering Research Corporation
-- (C) Copyright 2005 Integrated Computer Solutions
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
