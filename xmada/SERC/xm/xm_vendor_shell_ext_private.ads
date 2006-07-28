-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib, Xt, Xm, X_Configuration_Dependent, Xm_Ext_Object_Private,
     Xm_Desktop_Private, Xt_Object_Private, Xm_Shell_Ext_Private,
     Mwm_Util, Xm_Private, Unchecked_Conversion;

package Xm_Vendor_Shell_Ext_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Vendor_Shell_Ext_Class_Part is
	record
	    Delete_Window_Handler : Xt.Xt_Callback_Proc;
	    Offset_Handler : Xt.Xt_Callback_Proc;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Vendor_Shell_Ext_Class_Part use
	record
	    Delete_Window_Handler at 0 * Word_Size range 0 .. 31;
	    Offset_Handler at 1 * Word_Size range 0 .. 31;
	    Extension at 2 * Word_Size range 0 .. 31;
	end record;

    Vendor_Shell_Ext_Class_Part_Size : constant := 3 * 32;
    Vendor_Shell_Ext_Class_Rec_Size : constant :=
       Xm_Shell_Ext_Private.Shell_Ext_Class_Rec_Size +
	  Vendor_Shell_Ext_Class_Part_Size;

    type Xm_Vendor_Shell_Ext_Class_Rec is
	record
	    Object_Class : Xt_Object_Private.Object_Class_Part;
	    Ext_Class : Xm_Ext_Object_Private.Ext_Object_Class_Part;
	    Desktop_Class : Xm_Desktop_Private.Xm_Desktop_Class_Part;
	    Shell_Ext_Class : Xm_Shell_Ext_Private.Xm_Shell_Ext_Class_Part;
	    Vendor_Class : Xm_Vendor_Shell_Ext_Class_Part;
	end record;

    for Xm_Vendor_Shell_Ext_Class_Rec use
	record
	    Object_Class at 0
	       range 0 .. Xt_Object_Private.Object_Class_Rec_Size - 1;
	    Ext_Class at 0
	       range Xt_Object_Private.Object_Class_Rec_Size ..
			Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size - 1;
	    Desktop_Class at 0
	       range Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size ..
			Xm_Desktop_Private.Xm_Desktop_Class_Rec_Size - 1;
	    Shell_Ext_Class at 0
	       range Xm_Desktop_Private.Xm_Desktop_Class_Rec_Size ..
			Xm_Shell_Ext_Private.Shell_Ext_Class_Rec_Size - 1;
	    Vendor_Class at 0
	       range Xm_Shell_Ext_Private.Shell_Ext_Class_Rec_Size ..
			Vendor_Shell_Ext_Class_Rec_Size - 1;
	end record;

    type Xm_Vendor_Shell_Ext_Part is
	record
	    Default_Font_List : Xm.Xm_Font_List;
	    Focus_Policy : X_Lib.X_Character;
	    Focus_Data : Xm_Private.Xm_Focus_Data;
	    Delete_Response : X_Lib.X_Character;
	    Unit_Type : X_Lib.X_Character;
	    Mwm_Hints : Mwm_Util.Mwm_Hints;
	    Mwm_Info : Mwm_Util.Mwm_Info;
	    Mwm_Menu : X_Lib.String_Pointer;
	    Focus_Moved_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Old_Managed : Xm.Xt_Widget;
	    X_At_Map : Xt.Position;
	    Y_At_Map : Xt.Position;
	    X_Offset : Xt.Position;
	    Y_Offset : Xt.Position;
	    Last_Offset_Serial : X_Configuration_Dependent.Unsigned_Long;
	    Last_Map_Request : X_Configuration_Dependent.Unsigned_Long;
	    External_Reposition : Xm.Xm_Boolean;
	    Map_Style : X_Lib.X_Character;
	    Realize_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Grab_Kind : Xt.Xt_Popup_Management.Xt_Grab_Kind;
	    Audible_Warning : Xm.Xm_Boolean;
	    Button_Font_List : Xm.Xm_Font_List;
	    Label_Font_List : Xm.Xm_Font_List;
	    Text_Font_List : Xm.Xm_Font_List;
	    Input_Method_String : X_Lib.String_Pointer;
	    Preedit_Type_String : X_Lib.String_Pointer;
	    Light_Threshold : X_Configuration_Dependent.Unsigned_Int;
	    Dark_Threshold : X_Configuration_Dependent.Unsigned_Int;
	    Foreground_Threshold : X_Configuration_Dependent.Unsigned_Int;
	    Im_Height : X_Configuration_Dependent.Unsigned_Int;
	    Im_Info : Xt.Xt_Pointer;
	    Im_Vs_Height_Set : Xm.Xm_Boolean;
	    Dummy : Xm.Xm_Boolean;
	end record;
    for Xm_Vendor_Shell_Ext_Part use
	record
	    Default_Font_List at 0 * Word_Size range 0 .. 31;
	    Focus_Policy at 1 * Word_Size range 0 .. 7;
	    Focus_Data at 2 * Word_Size range 0 .. 31;
	    Delete_Response at 3 * Word_Size range 0 .. 7;
	    Unit_Type at 3 * Word_Size + 1 range 0 .. 7;
	    Mwm_Hints at 4 * Word_Size
	       range 0 .. Mwm_Util.Mwm_Hints_Size - 1;      -- 5 words
	    Mwm_Info at 9 * Word_Size
	       range 0 .. Mwm_Util.Mwm_Info_Size - 1;       -- 2 words
	    Mwm_Menu at 11 * Word_Size range 0 .. 31;
	    Focus_Moved_Callback at 12 * Word_Size range 0 .. 31;
	    Old_Managed at 13 * Word_Size range 0 .. 31;
	    X_At_Map at 14 * Word_Size range 0 .. 15;
	    Y_At_Map at 14 * Word_Size + 2 range 0 .. 15;
	    X_Offset at 15 * Word_Size range 0 .. 15;
	    Y_Offset at 15 * Word_Size + 2 range 0 .. 15;
	    Last_Offset_Serial at 16 * Word_Size range 0 .. 31;
	    Last_Map_Request at 17 * Word_Size range 0 .. 31;
	    External_Reposition at 18 * Word_Size range 0 .. 7;
	    Map_Style at 18 * Word_Size + 1 range 0 .. 7;
	    Realize_Callback at 19 * Word_Size range 0 .. 31;
	    Grab_Kind at 20 * Word_Size range 0 .. 31;
	    Audible_Warning at 21 * Word_Size range 0 .. 7;
	    Button_Font_List at 22 * Word_Size range 0 .. 31;
	    Label_Font_List at 23 * Word_Size range 0 .. 31;
	    Text_Font_List at 24 * Word_Size range 0 .. 31;
	    Input_Method_String at 25 * Word_Size range 0 .. 31;
	    Preedit_Type_String at 26 * Word_Size range 0 .. 31;
	    Light_Threshold at 27 * Word_Size range 0 .. 31;
	    Dark_Threshold at 28 * Word_Size range 0 .. 31;
	    Foreground_Threshold at 29 * Word_Size range 0 .. 31;
	    Im_Height at 30 * Word_Size range 0 .. 31;
	    Im_Info at 31 * Word_Size range 0 .. 31;
	    Im_Vs_Height_Set at 32 * Word_Size range 0 .. 7;
	    Dummy at 32 * Word_Size + 3 range 0 .. 7;
	end record;

    Vendor_Shell_Ext_Part_Size : constant := 33 * 32;
    Vendor_Shell_Ext_Rec_Size : constant :=
       Xm_Shell_Ext_Private.Shell_Ext_Rec_Size + Vendor_Shell_Ext_Part_Size;

    type Xm_Vendor_Shell_Ext_Rec is
	record
	    Object : Xt_Object_Private.Object_Part;
	    Ext : Xm_Ext_Object_Private.Ext_Object_Part;
	    Desktop : Xm_Desktop_Private.Xm_Desktop_Part;
	    Shell_Ext : Xm_Shell_Ext_Private.Xm_Shell_Ext_Part;
	    Vendor : Xm_Vendor_Shell_Ext_Part;
	end record;

    for Xm_Vendor_Shell_Ext_Rec use
	record
	    Object at 0 range 0 .. Xt_Object_Private.Object_Rec_Size - 1;
	    Ext at 0 range Xt_Object_Private.Object_Rec_Size ..
			      Xm_Ext_Object_Private.Ext_Object_Rec_Size - 1;
	    Desktop at 0 range Xm_Ext_Object_Private.Ext_Object_Rec_Size ..
				  Xm_Desktop_Private.Xm_Desktop_Rec_Size - 1;
	    Shell_Ext at 0 range Xm_Desktop_Private.Xm_Desktop_Rec_Size ..
				    Xm_Shell_Ext_Private.Shell_Ext_Rec_Size - 1;
	    Vendor at 0 range Xm_Shell_Ext_Private.Shell_Ext_Rec_Size ..
				 Vendor_Shell_Ext_Rec_Size - 1;  
	end record;

    type Xm_Vendor_Shell_Ext_Rec_Ptr is access Xm_Vendor_Shell_Ext_Rec;
    type Xm_Vendor_Shell_Ext_Class_Rec_Ptr is
       access Xm_Vendor_Shell_Ext_Class_Rec;

    -- functions for conversions.

    function To_Widget_Class (X : in Xm_Vendor_Shell_Ext_Class_Rec_Ptr)
			     return Xt.Widget_Class;

    function To_Xm_Vendor_Shell_Ext_Class
		(X : in Xt.Widget_Class)
		return Xm_Vendor_Shell_Ext_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Vendor_Shell_Ext_Rec_Ptr) return Xt.Widget;

    function To_Xm_Vendor_Shell_Ext (X : in Xt.Widget)
				    return Xm_Vendor_Shell_Ext_Rec_Ptr;

end Xm_Vendor_Shell_Ext_Private;

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
