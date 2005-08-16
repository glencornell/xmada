-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm, Xt_Core_Private,
     Xt_Composite_Private, Xt_Constraint_Private, Xm_Private,
     Xm_Bulletin_Board_Private, Xm_Selection_Box_Private, Unchecked_Conversion;

package Xm_File_Selection_Box_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    -- Defines for use in allocation geometry matrix.

    Xmfsb_Max_Widgets_Vert : constant := 10;

    -- Bit locations for the state_flags bit field.
    Xmfs_No_Match : constant := 1;
    Xmfs_In_File_Search : constant := 2;
    Xmfs_Dir_Search_Proc : constant := 4;

    type Xm_File_Selection_Box_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_File_Selection_Box_Class_Part use
	record
	    Extension at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_File_Selection_Box_Class_Part_Size : constant := 32;
    Xm_File_Selection_Box_Class_Rec_Size : constant :=
       Xm_Selection_Box_Private.Xm_Selection_Box_Class_Rec_Size +
	  Xm_File_Selection_Box_Class_Part_Size;


    type Xm_File_Selection_Box_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Constraint_Class : Xt_Constraint_Private.Constraint_Class_Part;
	    Manager_Class : Xm_Private.Xm_Manager_Class_Part;
	    Bulletin_Board_Class : Xm_Bulletin_Board_Private.
				      Xm_Bulletin_Board_Class_Part;
	    Selection_Box_Class : Xm_Selection_Box_Private.
				     Xm_Selection_Box_Class_Part;
	    File_Selection_Box_Class : Xm_File_Selection_Box_Class_Part;
	end record;

    for Xm_File_Selection_Box_Class_Rec use
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
			Xm_Bulletin_Board_Private.
			   Xm_Bulletin_Board_Class_Rec_Size - 1;
	    Selection_Box_Class at 0
	       range Xm_Bulletin_Board_Private.
		     Xm_Bulletin_Board_Class_Rec_Size ..
			Xm_Selection_Box_Private.
			   Xm_Selection_Box_Class_Rec_Size - 1;
	    File_Selection_Box_Class at 0
	       range Xm_Selection_Box_Private.Xm_Selection_Box_Class_Rec_Size ..
			Xm_File_Selection_Box_Class_Rec_Size - 1;
	end record;

    subtype Xm_Qualify_Proc is X_Lib.X_Address;
    subtype Xm_Search_Proc is X_Lib.X_Address;

    type Xm_File_Selection_Box_Part is
	record
	    Directory : Xm.Xm_String;
	    Pattern : Xm.Xm_String;
	    Dir_List_Label : Xt.Widget;
	    Dir_List_Label_String : Xm.Xm_String;
	    Dir_List : Xt.Widget;
	    Dir_List_Items : Xm.Xm_String_Table_Ptr;
	    Dir_List_Item_Count : X_Configuration_Dependent.Int;
	    Dir_List_Selected_Item_Position : X_Configuration_Dependent.Int;
	    Filter_Label : Xt.Widget;
	    Filter_Label_String : Xm.Xm_String;
	    Filter_Text : Xt.Widget;
	    Dir_Mask : Xm.Xm_String;
	    No_Match_String : Xm.Xm_String;
	    Qualify_Search_Data_Proc : Xm_Qualify_Proc;
	    Dir_Search_Proc : Xm_Search_Proc;
	    File_Search_Proc : Xm_Search_Proc;
	    File_Type_Mask : X_Configuration_Dependent.Unsigned_Char;
	    List_Updated : Xm.Xm_Boolean;
	    Directory_Valid : Xm.Xm_Boolean;
	    State_Flags : X_Configuration_Dependent.Unsigned_Char;
	end record;

    for Xm_File_Selection_Box_Part use
	record
	    Directory at 0 * Word_Size range 0 .. 31;
	    Pattern at 1 * Word_Size range 0 .. 31;
	    Dir_List_Label at 2 * Word_Size range 0 .. 31;
	    Dir_List_Label_String at 3 * Word_Size range 0 .. 31;
	    Dir_List at 4 * Word_Size range 0 .. 31;
	    Dir_List_Items at 5 * Word_Size range 0 .. 31;
	    Dir_List_Item_Count at 6 * Word_Size range 0 .. 31;
	    Dir_List_Selected_Item_Position at 7 * Word_Size range 0 .. 31;
	    Filter_Label at 8 * Word_Size range 0 .. 31;
	    Filter_Label_String at 9 * Word_Size range 0 .. 31;
	    Filter_Text at 10 * Word_Size range 0 .. 31;
	    Dir_Mask at 11 * Word_Size range 0 .. 31;
	    No_Match_String at 12 * Word_Size range 0 .. 31;
	    Qualify_Search_Data_Proc at 13 * Word_Size range 0 .. 31;
	    Dir_Search_Proc at 14 * Word_Size range 0 .. 31;
	    File_Search_Proc at 15 * Word_Size range 0 .. 31;
	    File_Type_Mask at 16 * Word_Size range 0 .. 07;
	    List_Updated at 16 * Word_Size + 1 range 0 .. 07;
	    Directory_Valid at 16 * Word_Size + 2 range 0 .. 07;
	    State_Flags at 16 * Word_Size + 3 range 0 .. 07;
	end record;


    Xm_File_Selection_Box_Part_Size : constant := 17 * 32;
    Xm_File_Selection_Box_Rec_Size : constant :=
       Xm_Selection_Box_Private.Xm_Selection_Box_Rec_Size +
	  Xm_File_Selection_Box_Part_Size;

    type Xm_File_Selection_Box_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Xt_Constraint_Private.Constraint_Part;
	    Manager : Xm_Private.Xm_Manager_Part;
	    Bulletin_Board : Xm_Bulletin_Board_Private.Xm_Bulletin_Board_Part;
	    Selection_Box : Xm_Selection_Box_Private.Xm_Selection_Box_Part;
	    File_Selection_Box : Xm_File_Selection_Box_Part;
	end record;

    for Xm_File_Selection_Box_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Constraint at 0
	       range Xt_Composite_Private.Composite_Rec_Size ..
			Xt_Constraint_Private.Constraint_Rec_Size - 1;
	    Manager at 0 range Xt_Constraint_Private.Constraint_Rec_Size ..
				  Xm_Private.Xm_Manager_Rec_Size - 1;
	    Bulletin_Board at 0
	       range Xm_Private.Xm_Manager_Rec_Size ..
			Xm_Bulletin_Board_Private.Xm_Bulletin_Board_Rec_Size -
			   1;
	    Selection_Box at 0
	       range Xm_Bulletin_Board_Private.Xm_Bulletin_Board_Rec_Size ..
			Xm_Selection_Box_Private.Xm_Selection_Box_Rec_Size - 1;
	    File_Selection_Box at 0
	       range Xm_Selection_Box_Private.Xm_Selection_Box_Rec_Size ..
			Xm_File_Selection_Box_Rec_Size - 1;
	end record;

    type Xm_File_Selection_Box_Rec_Ptr is access Xm_File_Selection_Box_Rec;
    type Xm_File_Selection_Box_Class_Rec_Ptr is
       access Xm_File_Selection_Box_Class_Rec;


    function To_Widget_Class (X : in Xm_File_Selection_Box_Class_Rec_Ptr)
			     return Xt.Widget_Class;

    function To_Xm_File_Selection_Box_Class
		(X : in Xt.Widget_Class)
		return Xm_File_Selection_Box_Class_Rec_Ptr;

    function To_Widget (X : in Xm_File_Selection_Box_Rec_Ptr) return Xt.Widget;

    function To_Xm_File_Selection_Box (X : in Xt.Widget)
				      return Xm_File_Selection_Box_Rec_Ptr;


end Xm_File_Selection_Box_Private;

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

