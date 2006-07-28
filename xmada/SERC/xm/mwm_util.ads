-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib;

package Mwm_Util is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    -- Contents of the _MWM_HINTS property.

    type Motif_Wm_Hints is
	record
	    Flags : X_Lib.X_Long_Integer;
	    Functions : X_Lib.X_Long_Integer;
	    Decorations : X_Lib.X_Long_Integer;
	    Input_Mode : X_Lib.X_Integer;
	    Status : X_Lib.X_Long_Integer;
	end record;

    for Motif_Wm_Hints use
	record
	    Flags at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Functions at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Decorations at 2 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Input_Mode at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Status at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    for Motif_Wm_Hints'Size use 5 * 32;

    subtype Mwm_Hints is Motif_Wm_Hints;

    Mwm_Hints_Size : constant := 5 * 32;

    -- bit definitions for MwmHints.flags

    Mwm_Hints_Functions : constant := 2 ** 0;
    Mwm_Hints_Decorations : constant := 2 ** 1;
    Mwm_Hints_Input_Mode : constant := 2 ** 2;
    Mwm_Hints_Status : constant := 2 ** 3;

    -- bit definitions for MwmHints.functions

    Mwm_Func_All : constant := 2 ** 0;
    Mwm_Func_Resize : constant := 2 ** 1;
    Mwm_Func_Move : constant := 2 ** 2;
    Mwm_Func_Minimize : constant := 2 ** 3;
    Mwm_Func_Maximize : constant := 2 ** 4;
    Mwm_Func_Close : constant := 2 ** 5;

    -- bit definitions for MwmHints.decorations

    Mwm_Decor_All : constant := 2 ** 0;
    Mwm_Decor_Border : constant := 2 ** 1;
    Mwm_Decor_Resizeh : constant := 2 ** 2;
    Mwm_Decor_Title : constant := 2 ** 3;
    Mwm_Decor_Menu : constant := 2 ** 4;
    Mwm_Decor_Minimize : constant := 2 ** 5;
    Mwm_Decor_Maximize : constant := 2 ** 6;

    -- values for MwmHints.input_mode

    Mwm_Input_Modeless : constant := 0;
    Mwm_Input_Primary_Application_Modal : constant := 1;
    Mwm_Input_System_Modal : constant := 2;
    Mwm_Input_Full_Application_Modal : constant := 3;

    Mwm_Tearoff_Window : constant := 1;

    -- The following is for compatibility only. It's use is deprecated.

    Mwm_Input_Application_Modal : constant :=
       Mwm_Input_Primary_Application_Modal;

    -- Contents of the _MWM_INFO property.

    type Motif_Wm_Info is
	record
	    Flags : X_Lib.X_Long_Integer;
	    Wm_Window : X_Lib.Window;
	end record;

    for Motif_Wm_Info use
	record
	    Flags at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Wm_Window at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    for Motif_Wm_Info'Size use 2 * 32;

    subtype Mwm_Info is Motif_Wm_Info;

    Mwm_Info_Size : constant := 32 * 2;

    -- bit definitions for MotifWmInfo .flags

    Mwm_Info_Startup_Standard : constant := 2 ** 0;
    Mwm_Info_Startup_Custom : constant := 2 ** 1;

    -- Definitions for the _MWM_HINTS property.

    type Prop_Motif_Wm_Hints is
	record
	    Flags : X_Configuration_Dependent.Card32;
	    Functions : X_Configuration_Dependent.Card32;
	    Decorations : X_Configuration_Dependent.Card32;
	    Input_Mode : X_Configuration_Dependent.Int32;
	    Status : X_Configuration_Dependent.Card32;
	end record;

    for Prop_Motif_Wm_Hints use
	record
	    Flags at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Functions at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Decorations at 2 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Input_Mode at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Status at 4 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    for Prop_Motif_Wm_Hints'Size use 5 * 32;

    subtype Prop_Mwm_Hints is Prop_Motif_Wm_Hints;

    -- number of elements of size 32 in _MWM_HINTS

    Prop_Motif_Wm_Hints_Elements : constant := 5;
    Prop_Mwm_Hints_Elements : constant := Prop_Motif_Wm_Hints_Elements;

    -- Definitions for the _MWM_INFO property.

    type Prop_Motif_Wm_Info is
	record
	    Flags : X_Configuration_Dependent.Card32;
	    Wm_Window : X_Configuration_Dependent.Card32;
	end record;

    for Prop_Motif_Wm_Info use
	record
	    Flags at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Wm_Window at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    for Prop_Motif_Wm_Info'Size use 2 * 32;

    subtype Prop_Mwm_Info is Prop_Motif_Wm_Info;

    -- number of elements of size 32 in _MWM_INFO

    Prop_Motif_Wm_Info_Elements : constant := 2;
    Prop_Mwm_Info_Elements : constant := Prop_Motif_Wm_Info_Elements;

end Mwm_Util;

--package body Mwm_Util is end Mwm_Util;

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
