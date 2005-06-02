-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with Xm, Xm_Scrolled_Window;

package Xm_Main_Window is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    subtype Main_Window_Class is Xm_Scrolled_Window.Scrolled_Window_Class;
    subtype Main_Window_Widget is Xm_Scrolled_Window.Scrolled_Window_Widget;

    function Xm_Main_Window_Widget_Class return Main_Window_Class;

    function Xm_Is_Main_Window (W : in Xm.Xt_Widget) return Boolean;

    procedure Xm_Main_Window_Set_Areas (W : in Xm.Xt_Widget;
					Menu : in Xm.Xt_Widget;
					Command : in Xm.Xt_Widget;
					H_Scroll : in Xm.Xt_Widget;
					V_Scroll : in Xm.Xt_Widget;
					W_Region : in Xm.Xt_Widget);

    function Xm_Main_Window_Sep1 (W : in Xm.Xt_Widget) return Xm.Xt_Widget;

    function Xm_Main_Window_Sep2 (W : in Xm.Xt_Widget) return Xm.Xt_Widget;

    function Xm_Main_Window_Sep3 (W : in Xm.Xt_Widget) return Xm.Xt_Widget;

    function Xm_Create_Main_Window
		(Parent : in Xm.Xt_Widget;
		 Name : in String;
		 An_Arg_List : in Xm.Xm_Arg_List := Xm.Null_Xm_Arg_List)
		return Xm.Xt_Widget;
end Xm_Main_Window;

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
