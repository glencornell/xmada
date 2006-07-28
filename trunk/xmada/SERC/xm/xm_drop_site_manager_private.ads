-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, Xt, X_Lib, Xt_Object_Private,
     Xm, Xm_Private, Xm_Drop_Site_Manager;

package Xm_Drop_Site_Manager_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    subtype Xm_Dsm_Create_Info_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Destroy_Info_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Start_Update_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Retrieve_Info_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Update_Info_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_End_Update_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Update_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Process_Motion_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Process_Drop_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Operation_Changed_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Change_Root_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Insert_Info_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Remove_Info_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Sync_Tree_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Get_Tree_From_Dsm_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Create_Ds_Info_Table is X_Lib.X_Address;
    subtype Xm_Dsm_Destroy_Ds_Info_Table is X_Lib.X_Address;
    subtype Xm_Dsm_Register_Info_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Widget_To_Info_Proc is X_Lib.X_Address;
    subtype Xm_Dsm_Unregister_Info_Proc is X_Lib.X_Address;

    type Xm_Drop_Site_Manager_Class_Part is
	record
	    Create_Info : Xm_Dsm_Create_Info_Proc;
	    Destroy_Info : Xm_Dsm_Destroy_Info_Proc;
	    Start_Update : Xm_Dsm_Start_Update_Proc;
	    Retrieve_Info : Xm_Dsm_Retrieve_Info_Proc;
	    Update_Info : Xm_Dsm_Update_Info_Proc;
	    End_Update : Xm_Dsm_End_Update_Proc;
	    Update_Dsm : Xm_Dsm_Update_Proc;
	    Process_Motion : Xm_Dsm_Process_Motion_Proc;
	    Process_Drop : Xm_Dsm_Process_Drop_Proc;
	    Operation_Changed : Xm_Dsm_Operation_Changed_Proc;
	    Change_Root : Xm_Dsm_Change_Root_Proc;
	    Insert_Info : Xm_Dsm_Insert_Info_Proc;
	    Remove_Info : Xm_Dsm_Remove_Info_Proc;
	    Sync_Tree : Xm_Dsm_Sync_Tree_Proc;
	    Get_Tree_From_Dsm : Xm_Dsm_Get_Tree_From_Dsm_Proc;
	    Create_Table : Xm_Dsm_Create_Ds_Info_Table;
	    Destroy_Table : Xm_Dsm_Destroy_Ds_Info_Table;
	    Register_Info : Xm_Dsm_Register_Info_Proc;
	    Widget_To_Info : Xm_Dsm_Widget_To_Info_Proc;
	    Unregister_Info : Xm_Dsm_Unregister_Info_Proc;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Drop_Site_Manager_Class_Part use
	record
	    Create_Info at 0 * Word_Size range 0 .. 31;
	    Destroy_Info at 1 * Word_Size range 0 .. 31;
	    Start_Update at 2 * Word_Size range 0 .. 31;
	    Retrieve_Info at 3 * Word_Size range 0 .. 31;
	    Update_Info at 4 * Word_Size range 0 .. 31;
	    End_Update at 5 * Word_Size range 0 .. 31;
	    Update_Dsm at 6 * Word_Size range 0 .. 31;
	    Process_Motion at 7 * Word_Size range 0 .. 31;
	    Process_Drop at 8 * Word_Size range 0 .. 31;
	    Operation_Changed at 9 * Word_Size range 0 .. 31;
	    Change_Root at 10 * Word_Size range 0 .. 31;
	    Insert_Info at 11 * Word_Size range 0 .. 31;
	    Remove_Info at 12 * Word_Size range 0 .. 31;
	    Sync_Tree at 13 * Word_Size range 0 .. 31;
	    Get_Tree_From_Dsm at 14 * Word_Size range 0 .. 31;
	    Create_Table at 15 * Word_Size range 0 .. 31;
	    Destroy_Table at 16 * Word_Size range 0 .. 31;
	    Register_Info at 17 * Word_Size range 0 .. 31;
	    Widget_To_Info at 18 * Word_Size range 0 .. 31;
	    Unregister_Info at 19 * Word_Size range 0 .. 31;
	    Extension at 20 * Word_Size range 0 .. 31;
	end record;

    Xm_Drop_Site_Manager_Class_Part_Size : constant := 21 * 32;
    Xm_Drop_Site_Manager_Class_Rec_Size : constant :=
       Xt_Object_Private.Object_Class_Rec_Size +
	  Xm_Drop_Site_Manager_Class_Part_Size;

    type Xm_Drop_Site_Manager_Class_Rec is
	record
	    Object_Class : Xt_Object_Private.Object_Class_Part;
	    Drop_Manager_Class : Xm_Drop_Site_Manager_Class_Part;
	end record;

    for Xm_Drop_Site_Manager_Class_Rec use
	record
	    Object_Class at 0
	       range 0 .. Xt_Object_Private.Object_Class_Rec_Size - 1;
	    Drop_Manager_Class at 0
	       range Xt_Object_Private.Object_Class_Rec_Size ..
			Xm_Drop_Site_Manager_Class_Rec_Size - 1;
	end record;

    type Xm_Drop_Site_Manager_Part is
	record
	    Notify_Proc : Xt.Xt_Callback_Proc;
	    Tree_Update_Proc : Xt.Xt_Callback_Proc;
	    Client_Data : Xt.Xt_Pointer;
	    Drag_Under_Data : Xt.Xt_Pointer;
	    Cur_Info : Xt.Xt_Pointer;
	    Cur_Time : X_Lib.Time;
	    Cur_X : Xt.Position;
	    Cur_Y : Xt.Position;
	    Old_X : Xt.Position;
	    Old_Y : Xt.Position;
	    Cur_Drop_Site_Status : Xm_Drop_Site_Manager.Xm_Drop_Site_Status;
	    Cur_Drag_Context : Xm.Xt_Widget;
	    Cur_Animate : Xm.Xm_Boolean;
	    Cur_Operations : X_Configuration_Dependent.Unsigned_Char;
	    Cur_Operation : X_Configuration_Dependent.Unsigned_Char;
	    Cur_Ancestor_Clip_Region : Xm_Private.Xm_Region;
	    New_Ancestor_Clip_Region : Xm_Private.Xm_Region;
	    Ds_Table : Xt.Xt_Pointer;
	    Ds_Root : Xt.Xt_Pointer;
	    Root_X : Xt.Position;
	    Root_Y : Xt.Position;
	    Root_W : Xt.Dimension;
	    Root_H : Xt.Dimension;
	    Clipper_List : Xt.Xt_Pointer;
	end record;

    for Xm_Drop_Site_Manager_Part use
	record
	    Notify_Proc at 0 * Word_Size range 0 .. 31;
	    Tree_Update_Proc at 1 * Word_Size range 0 .. 31;
	    Client_Data at 2 * Word_Size range 0 .. 31;
	    Drag_Under_Data at 3 * Word_Size range 0 .. 31;
	    Cur_Info at 4 * Word_Size range 0 .. 31;
	    Cur_Time at 5 * Word_Size range 0 .. 31;
	    Cur_X at 6 * Word_Size range 0 .. 15;
	    Cur_Y at 6 * Word_Size + 2 range 0 .. 15;
	    Old_X at 7 * Word_Size range 0 .. 15;
	    Old_Y at 7 * Word_Size + 2 range 0 .. 15;
	    Cur_Drop_Site_Status at 8 * Word_Size range 0 .. 7;
	    Cur_Drag_Context at 9 * Word_Size range 0 .. 31;
	    Cur_Animate at 10 * Word_Size range 0 .. 7;
	    Cur_Operations at 10 * Word_Size + 1 range 0 .. 7;
	    Cur_Operation at 10 * Word_Size + 2 range 0 .. 7;
	    Cur_Ancestor_Clip_Region at 11 * Word_Size range 0 .. 31;
	    New_Ancestor_Clip_Region at 12 * Word_Size range 0 .. 31;
	    Ds_Table at 13 * Word_Size range 0 .. 31;
	    Ds_Root at 14 * Word_Size range 0 .. 31;
	    Root_X at 15 * Word_Size range 0 .. 15;
	    Root_Y at 15 * Word_Size + 2 range 0 .. 15;
	    Root_W at 16 * Word_Size range 0 .. 15;
	    Root_H at 16 * Word_Size + 2 range 0 .. 15;
	    Clipper_List at 17 * Word_Size range 0 .. 31;
	end record;

    Xm_Drop_Site_Manager_Part_Size : constant := 18 * 32;
    Xm_Drop_Site_Manager_Rec_Size : constant :=
       Xt_Object_Private.Object_Part_Size + Xm_Drop_Site_Manager_Part_Size;

    type Xm_Drop_Site_Manager_Rec is
	record
	    Object : Xt_Object_Private.Object_Part;
	    Drop_Manager : Xm_Drop_Site_Manager_Part;
	end record;

    for Xm_Drop_Site_Manager_Rec use
	record
	    Object at 0 range 0 .. Xt_Object_Private.Object_Part_Size - 1;
	    Drop_Manager at 0 range Xt_Object_Private.Object_Part_Size ..
				       Xm_Drop_Site_Manager_Rec_Size - 1;
	end record;

    type Xm_Drop_Site_Manager_Class_Rec_Ptr is
       access Xm_Drop_Site_Manager_Class_Rec;
    type Xm_Drop_Site_Manager_Rec_Ptr is access Xm_Drop_Site_Manager_Rec;

    -- functions for conversions.

    function To_Widget_Class (X : in Xm_Drop_Site_Manager_Class_Rec_Ptr)
			     return Xt.Widget_Class;

    function To_Xm_Drop_Site_Manager_Class
		(X : in Xt.Widget_Class)
		return Xm_Drop_Site_Manager_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Drop_Site_Manager_Rec_Ptr) return Xt.Widget;

    function To_Xm_Drop_Site_Manager (X : in Xt.Widget)
				     return Xm_Drop_Site_Manager_Rec_Ptr;

end Xm_Drop_Site_Manager_Private;

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
