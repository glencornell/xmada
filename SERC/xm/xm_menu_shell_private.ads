-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib, Xt, Xm, Xt_Object_Private, Xm_Ext_Object_Private,
     Xm_Private, Xt_Core_Private, Xt_Composite_Private,
     Xt_Shell_Private, X_Configuration_Dependent, Unchecked_Conversion;

package Xm_Menu_Shell_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    subtype Xm_Focus_Data is Xt.Xt_Pointer;

    type Xm_Menu_Shell_Part is
	record
	    Focus_Policy : X_Configuration_Dependent.Unsigned_Char;
	    Focus_Data : Xm_Focus_Data;
	    Private_Shell : Xm.Xm_Boolean;
	    Default_Font_List : Xm.Xm_Font_List;
	    Button_Font_List : Xm.Xm_Font_List;
	    Label_Font_List : Xm.Xm_Font_List;
	end record;
    for Xm_Menu_Shell_Part use
	record
	    Focus_Policy at 0 * Word_Size range 0 .. 07;
	    Focus_Data at 1 * Word_Size range 0 .. 31;
	    Private_Shell at 2 * Word_Size range 0 .. 07;
	    Default_Font_List at 3 * Word_Size range 0 .. 31;
	    Button_Font_List at 4 * Word_Size range 0 .. 31;
	    Label_Font_List at 5 * Word_Size range 0 .. 31;
	end record;

    Xm_Menu_Shell_Part_Size : constant := 6 * 32;
    Xm_Menu_Shell_Rec_Size : constant :=
       Xm_Menu_Shell_Part_Size + Xt_Shell_Private.Override_Shell_Rec_Size;

    type Xm_Menu_Shell_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Shell : Xt_Shell_Private.Shell_Part;
	    Override : Xt_Shell_Private.Override_Shell_Part;
	    Menu_Shell : Xm_Menu_Shell_Part;
	end record;

    for Xm_Menu_Shell_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Size ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Shell at 0 range Xt_Composite_Private.Composite_Rec_Size ..
				Xt_Shell_Private.Shell_Rec_Size - 1;
	    Override at 0 range Xt_Shell_Private.Shell_Rec_Size ..
				   Xt_Shell_Private.Override_Shell_Rec_Size - 1;
	    Menu_Shell at 0 range Xt_Shell_Private.Override_Shell_Rec_Size ..
				     Xm_Menu_Shell_Rec_Size - 1;
	end record;

    subtype Xm_Pop_Func is X_Lib.X_Address;

    type Xm_Menu_Shell_Class_Part is
	record
	    Popdown_One : Xt.Xt_Action_Proc;
	    Popdown_Everyone : Xt.Xt_Action_Proc;
	    Popdown_Done : Xt.Xt_Action_Proc;
	    Popup_Shared_Menupane : Xm_Private.Xm_Menu_Popup_Proc;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Menu_Shell_Class_Part use
	record
	    Popdown_One at 0 * Word_Size range 0 .. 31;
	    Popdown_Everyone at 1 * Word_Size range 0 .. 31;
	    Popdown_Done at 2 * Word_Size range 0 .. 31;
	    Popup_Shared_Menupane at 3 * Word_Size range 0 .. 31;
	    Extension at 4 * Word_Size range 0 .. 31;
	end record;

    Xm_Menu_Shell_Class_Part_Size : constant := 5 * 32;
    Xm_Menu_Shell_Class_Rec_Size : constant :=
       Xm_Menu_Shell_Class_Part_Size +
	  Xt_Shell_Private.Override_Shell_Class_Rec_Size;

    type Xm_Menu_Shell_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Shell_Class : Xt_Shell_Private.Shell_Class_Part;
	    Override_Class : Xt_Shell_Private.Override_Shell_Class_Part;
	    Menu_Shell_Class : Xm_Menu_Shell_Class_Part;
	end record;

    for Xm_Menu_Shell_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xt_Composite_Private.Composite_Class_Rec_Size - 1;
	    Shell_Class at 0
	       range Xt_Composite_Private.Composite_Class_Rec_Size ..
			Xt_Shell_Private.Shell_Class_Rec_Size - 1;
	    Override_Class at 0
	       range Xt_Shell_Private.Shell_Class_Rec_Size ..
			Xt_Shell_Private.Override_Shell_Class_Rec_Size - 1;
	    Menu_Shell_Class at 0
	       range Xt_Shell_Private.Override_Shell_Class_Rec_Size ..
			Xm_Menu_Shell_Class_Rec_Size - 1;
	end record;

    type Xm_Menu_Shell_Rec_Ptr is access Xm_Menu_Shell_Rec;
    type Xm_Menu_Shell_Class_Rec_Ptr is access Xm_Menu_Shell_Class_Rec;

    type Xm_Menu_Shell_Widget_Rec is access Xm_Menu_Shell_Rec;
    type Xm_Menu_Shell_Widget_Rec_Ptr is access Xm_Menu_Shell_Widget_Rec;

    function To_Widget_Class
		(X : in Xm_Menu_Shell_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Menu_Shell_Class (X : in Xt.Widget_Class)
				    return Xm_Menu_Shell_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Menu_Shell_Rec_Ptr) return Xt.Widget;

    function To_Xm_Menu_Shell (X : in Xt.Widget) return Xm_Menu_Shell_Rec_Ptr;

end Xm_Menu_Shell_Private;

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

