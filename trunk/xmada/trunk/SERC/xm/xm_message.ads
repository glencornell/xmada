-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with Xm;
with Xm_Selection_Box; use Xm_Selection_Box;
with Xm_Message_Box; use Xm_Message_Box;

package Xm_Message is
    Copyright_Notice : constant String :=
       "(C) Copyright 2005, Integrated Computer Solutions, Inc.  " &
	  "All Rights Reserved.";

    subtype Message_Dialog_Class is Xm_Selection_Box.Selection_Box_Class;
    subtype Message_Dialog_Widget is Xm_Selection_Box.Selection_Box_Widget;


    function Xm_Message_Widget_Class
	return Xm_Message_Box.Message_Box_Class
	renames Xm_Message_Box.Xm_Message_Box_Widget_Class;

    function Xm_Message_Dialog_Widget_Class
	return Xm_Message_Box.Message_Box_Class
	renames Xm_Message_Box.Xm_Message_Box_Widget_Class;

    function Xm_Create_Message_Box
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget
		renames Xm_Message_Box.Xm_Create_Message_Box;

    function Xm_Create_Message_Dialog
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget
		renames Xm_Message_Box.Xm_Create_Message_Dialog;

end Xm_Message;

-- ------ COPYRIGHT AND DISTRIBUTION NOTICE ----------
--
-- (C) Copyright 2005 Integrated Computer Solutions Corporation
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
-- organizations who have acquired a license from Integrated Computer
-- Solutions Corporation for a particular machine or set of machines.
-- No copying, use, or distribution of this software from or to an unlicensed
-- machine is allowed without the prior written consent of Integrated
-- Computer Solutions Corporation.
--
-- The SOFTWARE and documentation are provided with RESTRICTED RIGHTS.  Use,
-- duplication, or disclosure by the Government is subject to the restrictions
-- as set forth in subparagraph (c)(1)(ii) of The Rights in Technical Data
-- and Computer Software clause at 52.227-7013.  Contractor/manufacturer is
-- Integrated Computer Solutions Corporation/54 Middlesex Tpke
-- Bedford, MA 01730 1-800-800-ICS1
--
-- ------- DISCLAIMER -------
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
-- In no event shall Integrated Computer Solutions Corporation and its
-- personnel be held responsible for any direct, indirect, consequential
-- or inconsequential damages or lost profits.
