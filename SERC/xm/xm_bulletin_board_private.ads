-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.


with X_Configuration_Dependent, X_Lib, Xt, Xm,
     Xt_Core_Private, Xt_Composite_Private,
     Xt_Constraint_Private, Xm_Private, Unchecked_Conversion;

package Xm_Bulletin_Board_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;


    Xmdialog_Suffix : constant String := "_popup" & Ascii.Nul;
    Xmdialog_Suffix_Size : constant := 6;

-- /*  New fields for the BulletinBoard widget class record  */

    subtype Xm_Geo_Create_Proc is X_Lib.X_Address;
    subtype Xm_Focus_Moved_Proc is X_Lib.X_Address;

    type Xm_Bulletin_Board_Class_Part is
	record
	    Always_Install_Accelerators : Xm.Xm_Boolean;
	    Geo_Matrix_Create : Xm_Geo_Create_Proc;
	    Focus_Moved_Proc : Xm_Focus_Moved_Proc;
	    Extension : Xt.Xt_Pointer;
	end record;
    for Xm_Bulletin_Board_Class_Part use
	record
	    Always_Install_Accelerators at 0 * Word_Size range 0 .. 7;
	    Geo_Matrix_Create at 1 * Word_Size range 0 .. 31;
	    Focus_Moved_Proc at 2 * Word_Size range 0 .. 31;
	    Extension at 3 * Word_Size range 0 .. 31;
	end record;

    Xm_Bulletin_Board_Class_Part_Size : constant := 4 * 32;
    Xm_Bulletin_Board_Class_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Class_Rec_Size + Xm_Bulletin_Board_Class_Part_Size;

    type Xm_Bulletin_Board_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Constraint_Class : Xt_Constraint_Private.Constraint_Class_Part;
	    Manager_Class : Xm_Private.Xm_Manager_Class_Part;
	    Bulletin_Board_Class : Xm_Bulletin_Board_Class_Part;
	end record;

    for Xm_Bulletin_Board_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xt_Composite_Private.Composite_Class_Rec_Size - 1;
	    Constraint_Class at 0
	       range Xt_Composite_Private.Composite_Class_Rec_Size ..
			Xt_Constraint_Private.Constraint_Class_Rec_Size - 1;
	    Manager_Class at 0
	       range Xt_Constraint_Private.Constraint_Class_Rec_Size ..
			Xm_Private.Xm_Manager_Class_Rec_Size - 1;
	    Bulletin_Board_Class at 0
	       range Xm_Private.Xm_Manager_Class_Rec_Size ..
			Xm_Bulletin_Board_Class_Rec_Size - 1;
	end record;


    type Xm_Bulletin_Board_Part is
	record
	    Margin_Width : Xt.Dimension; -- 16 Bits
	    Margin_Height : Xt.Dimension;
	    Default_Button : Xt.Widget;
	    Dynamic_Default_Button : Xt.Widget;
	    Cancel_Button : Xt.Widget;
	    Dynamic_Cancel_Button : Xt.Widget;
	    Focus_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Map_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Unmap_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Text_Translations : Xt.Xt_Translation_Management.Xt_Translations;
	    Button_Font_List : Xm.Xm_Font_List;
	    Label_Font_List : Xm.Xm_Font_List;
	    Text_Font_List : Xm.Xm_Font_List;
	    Allow_Overlap : Xm.Xm_Boolean;
	    Default_Position : Xm.Xm_Boolean;
	    Auto_Unmanage : Xm.Xm_Boolean;
	    Resize_Policy : X_Configuration_Dependent.Unsigned_Char;
	    Old_Width : Xt.Dimension;
	    Old_Height : Xt.Dimension;
	    Old_Shadow_Thickness : Xt.Dimension;
	    Shadow_Type : X_Configuration_Dependent.Unsigned_Char;
	    In_Set_Values : Xm.Xm_Boolean;
	    Initial_Focus : Xm.Xm_Boolean;
	    No_Resize : Xm.Xm_Boolean;
	    Dialog_Style : X_Configuration_Dependent.Unsigned_Char;
	    Dialog_Title : Xm.Xm_String;
	    Shell : Xt.Widget;
	    Descendant_Focus : Xt.Widget;
	    Geo_Cache : Xm_Private.Xm_Geo_Matrix;
	end record;


    for Xm_Bulletin_Board_Part use
	record
	    Margin_Width at 0 * Word_Size range 0 .. 15;
	    Margin_Height at 0 * Word_Size range 16 .. 31;
	    Default_Button at 1 * Word_Size range 0 .. 31;
	    Dynamic_Default_Button at 2 * Word_Size range 0 .. 31;
	    Cancel_Button at 3 * Word_Size range 0 .. 31;
	    Dynamic_Cancel_Button at 4 * Word_Size range 0 .. 31;
	    Focus_Callback at 5 * Word_Size range 0 .. 31;
	    Map_Callback at 6 * Word_Size range 0 .. 31;
	    Unmap_Callback at 7 * Word_Size range 0 .. 31;
	    Text_Translations at 8 * Word_Size range 0 .. 31;
	    Button_Font_List at 9 * Word_Size range 0 .. 31;
	    Label_Font_List at 10 * Word_Size range 0 .. 31;
	    Text_Font_List at 11 * Word_Size range 0 .. 31;
	    Allow_Overlap at 12 * Word_Size range 0 .. 7;
	    Default_Position at 12 * Word_Size + 1 range 0 .. 7;
	    Auto_Unmanage at 12 * Word_Size + 2 range 0 .. 7;
	    Resize_Policy at 12 * Word_Size + 3 range 0 .. 7;
	    Old_Width at 13 * Word_Size range 0 .. 15;
	    Old_Height at 13 * Word_Size + 2 range 0 .. 15;
	    Old_Shadow_Thickness at 14 * Word_Size range 0 .. 15;
	    Shadow_Type at 14 * Word_Size + 2 range 0 .. 7;
	    In_Set_Values at 14 * Word_Size + 3 range 0 .. 7;
	    Initial_Focus at 15 * Word_Size range 0 .. 7;
	    No_Resize at 15 * Word_Size + 1 range 0 .. 7;
	    Dialog_Style at 15 * Word_Size + 2 range 0 .. 7;
	    Dialog_Title at 16 * Word_Size range 0 .. 31;
	    Shell at 17 * Word_Size range 0 .. 31;
	    Descendant_Focus at 18 * Word_Size range 0 .. 31;
	    Geo_Cache at 19 * Word_Size range 0 .. 31;
	end record;

    Xm_Bulletin_Board_Part_Size : constant := 20 * 32;
    Xm_Bulletin_Board_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Rec_Size + Xm_Bulletin_Board_Part_Size;

    type Xm_Bulletin_Board_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Xt_Constraint_Private.Constraint_Part;
	    Manager : Xm_Private.Xm_Manager_Part;
	    Bulletin_Board : Xm_Bulletin_Board_Part;
	end record;

    for Xm_Bulletin_Board_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Constraint at 0
	       range Xt_Composite_Private.Composite_Rec_Size ..
			Xt_Constraint_Private.Constraint_Rec_Size - 1;
	    Manager at 0 range Xt_Constraint_Private.Constraint_Rec_Size ..
				  Xm_Private.Xm_Manager_Rec_Size - 1;
	    Bulletin_Board at 0 range Xm_Private.Xm_Manager_Rec_Size ..
					 Xm_Bulletin_Board_Rec_Size - 1;
	end record;

    type Xm_Bulletin_Board_Rec_Ptr is access Xm_Bulletin_Board_Rec;
    type Xm_Bulletin_Board_Class_Rec_Ptr is access Xm_Bulletin_Board_Class_Rec;

    function To_Widget_Class
		(X : in Xm_Bulletin_Board_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Bulletin_Board_Class (X : in Xt.Widget_Class)
					return Xm_Bulletin_Board_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Bulletin_Board_Rec_Ptr) return Xt.Widget;

    function To_Bulletin_Board (X : in Xt.Widget)
			       return Xm_Bulletin_Board_Rec_Ptr;
end Xm_Bulletin_Board_Private;

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
