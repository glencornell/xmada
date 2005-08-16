-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with Xm, X_Lib, Xm_Selection_Box, X_Configuration_Dependent;

package Xm_File_Selection_Box is
--    Copyright_Notice : constant String :=
--       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
--	  "All Rights Reserved.";

    subtype Xm_Qualify_Proc is X_Lib.X_Address;
    subtype Xm_Search_Proc is X_Lib.X_Address;

--    type Xm_File_Selection_Box_Callback_Rec is
--	record
--	    Reason : Xm.Callback_Reason;
--	    Event_Ptr : Xm.X_Event_Ptr;
--	    Value : Xm.Xm_String;
--	    Length : X_Lib.X_Integer;
--	    Mask : Xm.Xm_String;
--	    Mask_Length : X_Lib.X_Integer;
--	    Dir : Xm.Xm_String;
--	    Dir_Length : X_Lib.X_Integer;
--	    Pattern : Xm.Xm_String;
--	    Pattern_Length : X_Lib.X_Integer;
--	end record;
--    for Xm_File_Selection_Box_Callback_Rec use
--	record
--	    Reason at 0 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Event_Ptr at 1 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Value at 2 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Length at 3 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Mask at 4 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Mask_Length at 5 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Dir at 6 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Dir_Length at 7 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Pattern at 8 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Pattern_Length at 9 * X_Configuration_Dependent.Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	end record;
--    type Xm_File_Selection_Box_Callback_Rec_Ptr is
--       access Xm_File_Selection_Box_Callback_Rec;
--
--    subtype File_Selection_Box_Class is Xm_Selection_Box.Selection_Box_Class;
--    subtype File_Selection_Box_Widget is Xm_Selection_Box.Selection_Box_Widget;
--
--    function Xm_File_Selection_Box_Widget_Class return File_Selection_Box_Class;
--
--    function Xm_Is_File_Selection_Box (W : in Xm.Xt_Widget) return Boolean;
--
--    function Xm_File_Selection_Box_Get_Child
--		(Fs : in Xm.Xt_Widget; Child : in Xm.Xm_Child_Types)
--		return Xm.Xt_Widget;
--
--    procedure Xm_File_Selection_Do_Search
--		 (Fs : in Xm.Xt_Widget; Dir_Mask : in Xm.Xm_String);
--
--    function Xm_Create_File_Selection_Box
--		(Parent : in Xm.Xt_Widget;
--		 Name : in String;
--		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
--		return Xm.Xt_Widget;
--
--    function Xm_Create_File_Selection_Dialog
--		(Parent : in Xm.Xt_Widget;
--		 Name : in String;
--		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
--		return Xm.Xt_Widget;
end Xm_File_Selection_Box;

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
