-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.


with X_Configuration_Dependent, X_Lib, Xt, Xt_Core_Private, Xm_Private,

     Unchecked_Conversion;

package Xm_Arrow_Button_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Arrow_Button_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Arrow_Button_Class_Part use
	record
	    Extension at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Arrow_Button_Class_Part_Size : constant := 32;
    Xm_Arrow_Button_Class_Rec_Size : constant :=
       Xm_Private.Xm_Primitive_Class_Rec_Size + Xm_Arrow_Button_Class_Part_Size;

    type Xm_Arrow_Button_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Primitive_Class : Xm_Private.Xm_Primitive_Class_Part;
	    Arrow_Button_Class : Xm_Arrow_Button_Class_Part;
	end record;

    for Xm_Arrow_Button_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Primitive_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xm_Private.Xm_Primitive_Class_Rec_Size - 1;
	    Arrow_Button_Class at 0
	       range Xm_Private.Xm_Primitive_Class_Rec_Size ..
			Xm_Arrow_Button_Class_Rec_Size - 1;
	end record;

---- parts

    type Xm_Arrow_Button_Part is
	record
	    Activate_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Arm_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Disarm_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Direction : X_Configuration_Dependent.Unsigned_Char;
	    Selected : Xt.Xt_Ancillary_Types.Xt_Boolean;
	    Top_Count : X_Configuration_Dependent.Short;
	    Cent_Count : X_Configuration_Dependent.Short;
	    Bot_Count : X_Configuration_Dependent.Short;
	    Top : X_Lib.Rectangle_Ptr;
	    Cent : X_Lib.Rectangle_Ptr;
	    Bot : X_Lib.Rectangle_Ptr;
	    Arrow_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Timer : Xt.Xt_Interval_Id;
	    Multi_Click : X_Configuration_Dependent.Unsigned_Char;
	    Click_Count : X_Configuration_Dependent.Int;
	    Arm_Time_Stamp : X_Lib.Time;
	    Insensitive_Gc : X_Lib.Graphic_Output.Graphic_Context;
	end record;
    for Xm_Arrow_Button_Part use
	record
	    Activate_Callback at 0 * Word_Size range 0 .. 31;  
	    Arm_Callback at 1 * Word_Size range 0 .. 31;  
	    Disarm_Callback at 2 * Word_Size range 0 .. 31;  
	    Direction at 3 * Word_Size range 0 .. 7;
	    Selected at 3 * Word_Size + 1 range 0 .. 7;  
	    Top_Count at 3 * Word_Size + 2 range 0 .. 15;
	    Cent_Count at 4 * Word_Size range 0 .. 15;
	    Bot_Count at 4 * Word_Size + 2 range 0 .. 15;
	    Top at 5 * Word_Size range 0 .. 31;
	    Cent at 6 * Word_Size range 0 .. 31;
	    Bot at 7 * Word_Size range 0 .. 31;
	    Arrow_Gc at 8 * Word_Size range 0 .. 31;
	    Timer at 9 * Word_Size range 0 .. 31;
	    Multi_Click at 10 * Word_Size range 0 .. 7;
	    Click_Count at 11 * Word_Size range 0 .. 31;
	    Arm_Time_Stamp at 12 * Word_Size range 0 .. 31;
	    Insensitive_Gc at 13 * Word_Size range 0 .. 31;
	end record;

    Xm_Arrow_Button_Part_Size : constant := 14 * 32;
    Xm_Arrow_Button_Rec_Size : constant :=
       Xm_Private.Xm_Primitive_Rec_Size + Xm_Arrow_Button_Part_Size;
    type Xm_Arrow_Button_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Primitive : Xm_Private.Xm_Primitive_Part;
	    Arrow_Button : Xm_Arrow_Button_Part;
	end record;

    for Xm_Arrow_Button_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Primitive at 0 range Xt_Core_Private.Core_Part_Size ..
				    Xm_Private.Xm_Primitive_Rec_Size - 1;
	    Arrow_Button at 0 range Xm_Private.Xm_Primitive_Rec_Size ..
				       Xm_Arrow_Button_Rec_Size - 1;
	end record;

    type Xm_Arrow_Button_Class_Rec_Ptr is access Xm_Arrow_Button_Class_Rec;
    type Xm_Arrow_Button_Rec_Ptr is access Xm_Arrow_Button_Rec;

    function To_Widget_Class
		(X : in Xm_Arrow_Button_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Arrow_Button_Class (X : in Xt.Widget_Class)
				      return Xm_Arrow_Button_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Arrow_Button_Rec_Ptr) return Xt.Widget;

    function To_Xm_Arrow_Button (X : in Xt.Widget)
				return Xm_Arrow_Button_Rec_Ptr;

end Xm_Arrow_Button_Private;

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
