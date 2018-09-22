-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xt_Core_Private,
     Xt_Shell_Private, Xt_Composite_Private, Xm, Xm_Display,
     Xm_Drag_Context, Xm_Vendor_Shell_Ext_Private,
     Xm_Drag_Context_Private, Xm_Drop_Site_Manager_Private,
     Xm_Virtural_Keys_Private, Unchecked_Conversion;

package Xm_Display_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    subtype Xm_Display_Get_Display_Proc is X_Lib.X_Address;

    type Xm_Display_Class_Part is
	record
	    Get_Display : Xm_Display_Get_Display_Proc;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Display_Class_Part use
	record
	    Get_Display at 0 * Word_Size range 0 .. 31;
	    Extension at 1 * Word_Size range 0 .. 31;
	end record;

    Xm_Display_Class_Part_Size : constant := 2 * 32;
    Xm_Display_Class_Rec_Size : constant :=
       Xt_Shell_Private.Application_Shell_Class_Rec_Size +
	  Xm_Display_Class_Part_Size;

    type Xm_Display_Class_Rec is
	record
	    Core_Clas : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Shell_Class : Xt_Shell_Private.Shell_Class_Part;
	    Wm_Shell_Class : Xt_Shell_Private.Wm_Shell_Class_Part;
	    Vendor_Shell_Class : Xt_Shell_Private.Vendor_Shell_Class_Part;
	    Top_Level_Shell_Class : Xt_Shell_Private.Top_Level_Shell_Class_Part;
	    Application_Shell_Class : Xt_Shell_Private.
					 Application_Shell_Class_Part;
	    Display_Class : Xm_Display_Class_Part;
	end record;

    for Xm_Display_Class_Rec use
	record
	    Core_Clas at 0 range 0 .. Xt_Core_Private.Core_Class_Part_Size - 1;
	    Composite_Class at 0
	       range Xt_Core_Private.Core_Class_Part_Size ..
			Xt_Composite_Private.Composite_Class_Rec_Size - 1;
	    Shell_Class at 0
	       range Xt_Composite_Private.Composite_Class_Rec_Size ..
			Xt_Shell_Private.Shell_Class_Rec_Size - 1;
	    Wm_Shell_Class at 0
	       range Xt_Shell_Private.Shell_Class_Rec_Size ..
			Xt_Shell_Private.Wm_Shell_Class_Rec_Size - 1;
	    Vendor_Shell_Class at 0
	       range Xt_Shell_Private.Wm_Shell_Class_Rec_Size ..
			Xt_Shell_Private.Vendor_Shell_Class_Rec_Size - 1;
	    Top_Level_Shell_Class at 0
	       range Xt_Shell_Private.Vendor_Shell_Class_Rec_Size ..
			Xt_Shell_Private.Top_Level_Shell_Class_Rec_Size - 1;
	    Application_Shell_Class at 0
	       range Xt_Shell_Private.Top_Level_Shell_Class_Rec_Size ..
			Xt_Shell_Private.Application_Shell_Class_Rec_Size - 1;
	    Display_Class at 0
	       range Xt_Shell_Private.Application_Shell_Class_Rec_Size ..
			Xm_Display_Class_Rec_Size - 1;
	end record;

    type Xm_Modal_Data_Rec is
	record
	    Ve : Xm_Vendor_Shell_Ext_Private.Xm_Vendor_Shell_Ext_Rec_Ptr;
	    Grabber : Xm_Vendor_Shell_Ext_Private.Xm_Vendor_Shell_Ext_Rec_Ptr;
	    Exclusive : Xm.Xm_Boolean;
	    Spring_Loaded : Xm.Xm_Boolean;
	    Dummy : Xm.Xm_Boolean;
	end record;

    for Xm_Modal_Data_Rec use
	record
	    Ve at 0 * Word_Size range 0 .. 31;
	    Grabber at 1 * Word_Size range 0 .. 31;
	    Exclusive at 2 * Word_Size range 0 .. 7;
	    Spring_Loaded at 2 * Word_Size + 1 range 0 .. 7;
	    Dummy at 2 * Word_Size + 3 range 0 .. 7;
	end record;

    type Xm_Modal_Data is access Xm_Modal_Data_Rec;

    type Xm_Display_Part is
	record
	    Drag_Initiator_Protocol_Style : Xm_Display.Xm_Drag_Protocol_Style;
	    Drag_Receiver_Protocol_Style : Xm_Display.Xm_Drag_Protocol_Style;
	    User_Grabbed : X_Lib.X_Character;
	    Drag_Context_Class : Xm_Drag_Context.Drag_Context_Class;
	    Drop_Transfer_Class : Xt.Widget_Class;
	    Drop_Site_Manager_Class : Xt.Widget_Class;
	    Active_Dc : Xm_Drag_Context_Private.Xm_Drag_Context_Rec_Ptr;
	    Dsm : Xm_Drop_Site_Manager_Private.Xm_Drop_Site_Manager_Rec_Ptr;
	    Last_Drag_Time : X_Lib.Time;
	    Proxy_Window : X_Lib.Window;
	    Modals : Xm_Modal_Data;
	    Num_Modals : Xt.Cardinal;
	    Max_Modals : Xt.Cardinal;
	    Xmim_Info : Xt.Xt_Pointer;
	    Bindings_String : X_Lib.String_Pointer;
	    Bindings : Xm_Virtural_Keys_Private.Xm_Key_Binding;
	    Last_Key_Event : X_Lib.Events.Key_Event;
	    Keycode_Tag : X_Lib.Char_Array
			     (1 .. Xm_Virtural_Keys_Private.Xmkeycode_Tag_Size);
	    Shell_Count : X_Lib.X_Integer;
	    Display_Info : Xt.Xt_Pointer;
	end record;

    for Xm_Display_Part use
	record
	    Drag_Initiator_Protocol_Style at 0 * Word_Size range 0 .. 7;
	    Drag_Receiver_Protocol_Style at 0 * Word_Size + 1 range 0 .. 7;
	    User_Grabbed at 0 * Word_Size + 2 range 0 .. 7;
	    Drag_Context_Class at 1 * Word_Size range 0 .. 31;
	    Drop_Transfer_Class at 2 * Word_Size range 0 .. 31;
	    Drop_Site_Manager_Class at 3 * Word_Size range 0 .. 31;
	    Active_Dc at 4 * Word_Size range 0 .. 31;
	    Dsm at 5 * Word_Size range 0 .. 31;
	    Last_Drag_Time at 6 * Word_Size range 0 .. 31;
	    Proxy_Window at 7 * Word_Size range 0 .. 31;
	    Modals at 8 * Word_Size range 0 .. 31;
	    Num_Modals at 9 * Word_Size range 0 .. 31;
	    Max_Modals at 10 * Word_Size range 0 .. 31;
	    Xmim_Info at 11 * Word_Size range 0 .. 31;
	    Bindings_String at 12 * Word_Size range 0 .. 31;
	    Bindings at 13 * Word_Size range 0 .. 31;
	    Last_Key_Event at 14 * Word_Size range 0 .. 31;
	    Keycode_Tag at 15 * Word_Size
	       range 0 .. Xm_Virtural_Keys_Private.Xmkeycode_Tag_Size / 4 * 32 -
			     1;
	    Shell_Count at 23 * Word_Size range 0 .. 31;
	    Display_Info at 24 * Word_Size range 0 .. 31;
	end record;

    Xm_Display_Part_Size : constant := 25 * 32;
    Xm_Display_Rec_Size : constant :=
       Xt_Shell_Private.Application_Shell_Rec_Size + Xm_Display_Part_Size;

    type Xm_Display_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Shell : Xt_Shell_Private.Shell_Part;
	    Wm : Xt_Shell_Private.Wm_Shell_Part;
	    Vendor : Xt_Shell_Private.Vendor_Shell_Part;
	    Top_Level : Xt_Shell_Private.Top_Level_Shell_Part;
	    Application : Xt_Shell_Private.Application_Shell_Part;
	    Display : Xm_Display_Part;
	end record;

    for Xm_Display_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Size ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Shell at 0 range Xt_Composite_Private.Composite_Rec_Size ..
				Xt_Shell_Private.Shell_Rec_Size - 1;
	    Wm at 0 range Xt_Shell_Private.Shell_Rec_Size ..
			     Xt_Shell_Private.Wm_Shell_Rec_Size - 1;
	    Vendor at 0 range Xt_Shell_Private.Wm_Shell_Rec_Size ..
				 Xt_Shell_Private.Vendor_Shell_Rec_Size - 1;
	    Top_Level at 0
	       range Xt_Shell_Private.Vendor_Shell_Rec_Size ..
			Xt_Shell_Private.Top_Level_Shell_Rec_Size - 1;
	    Application at 0
	       range Xt_Shell_Private.Top_Level_Shell_Rec_Size ..
			Xt_Shell_Private.Application_Shell_Rec_Size - 1;
	    Display at 0 range Xt_Shell_Private.Application_Shell_Rec_Size ..
				  Xm_Display_Rec_Size - 1;
	end record;

    type Xm_Display_Class_Rec_Ptr is access Xm_Display_Class_Rec;
    type Xm_Display_Rec_Ptr is access Xm_Display_Rec;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Display_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Display_Class (X : in Xt.Widget_Class)
				 return Xm_Display_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Display_Rec_Ptr) return Xt.Widget;

    function To_Xm_Display (X : in Xt.Widget) return Xm_Display_Rec_Ptr;

end Xm_Display_Private;

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
