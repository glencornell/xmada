-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with Xm, Xm_Bulletin_Board;

package Xm_Form is
--    Copyright_Notice : constant String :=
--       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
--	  "All Rights Reserved.";
--
--    subtype Form_Class is Xm_Bulletin_Board.Bulletin_Board_Class;
--    subtype Form_Widget is Xm_Bulletin_Board.Bulletin_Board_Widget;
    subtype Form_Dialog_Class is Xm_Bulletin_Board.Bulletin_Board_Class;
    subtype Form_Dialog_Widget is Xm_Bulletin_Board.Bulletin_Board_Widget;

--    function Xm_Form_Widget_Class return Form_Class;
    function Xm_Form_Dialog_Widget_Class return Form_Class;

--    function Xm_Is_Form (W : in Xm.Xt_Widget) return Boolean;
--
--    function Xm_Create_Form
--		(Parent : in Xm.Xt_Widget;
--		 Name : in String;
--		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
--		return Xm.Xt_Widget;
--
--    function Xm_Create_Form_Dialog
--		(Parent : in Xm.Xt_Widget;
--		 Name : in String;
--		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
--		return Xm.Xt_Widget;
end Xm_Form;

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
