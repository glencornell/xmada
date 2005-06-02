-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xm;

package Xm_Rep_Type is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    Xmrep_Type_Invalid : constant := 16#1FFF#;

    subtype Xm_Rep_Type_Id is X_Configuration_Dependent.Unsigned_Short;

    type Unsigned_Char_Array is array (Natural range <>) of
				   X_Configuration_Dependent.Unsigned_Char;
    type Unsigned_Char_Array_Ptr is access Unsigned_Char_Array;

    type Xm_Rep_Type_Entry_Rec is
	record
	    Rep_Type_Name : X_Lib.String_Pointer;
	    Value_Names : X_Lib.String_List;
	    Values : Unsigned_Char_Array_Ptr;
	    Num_Values : X_Lib.X_Character;
	    Reverse_Installed : Xm.Xm_Boolean;
	    Rep_Type_Id : Xm_Rep_Type_Id;
	end record;

    for Xm_Rep_Type_Entry_Rec use
	record
	    Rep_Type_Name at 0 * Word_Size range 0 .. 31;
	    Value_Names at 1 * Word_Size range 0 .. 31;
	    Values at 2 * Word_Size range 0 .. 31;
	    Num_Values at 3 * Word_Size range 0 .. 7;
	    Reverse_Installed at 3 * Word_Size + 1 range 0 .. 7;
	    Rep_Type_Id at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type Xm_Rep_Type_Entry is access Xm_Rep_Type_Entry_Rec;
    type Xm_Rep_Type_List_Rec is
       array (Natural range <>) of Xm_Rep_Type_Entry_Rec;
    type Xm_Rep_Type_List is access Xm_Rep_Type_Entry_Rec;

    function Xm_Rep_Type_Register
		(Rep_Type : in String;
		 Value_Names : in X_Lib.String_Pointer_Array;
		 Values : in Unsigned_Char_Array) return Xm_Rep_Type_Id;

    procedure Xm_Rep_Type_Add_Reverse (Rep_Type_Id : in Xm_Rep_Type_Id);

    function Xm_Rep_Type_Valid_Value
		(Rep_Type_Id : in Xm_Rep_Type_Id;
		 Test_Value : in X_Lib.X_Character;
		 Enable_Default_Warning : in Xm.Xt_Widget) return Boolean;

    function Xm_Rep_Type_Get_Registered return Xm_Rep_Type_List;

    function Xm_Rep_Type_Get_Record
		(Rep_Type_Id : in Xm_Rep_Type_Id) return Xm_Rep_Type_Entry;

    function Xm_Rep_Type_Get_Id (Rep_Type : in String) return Xm_Rep_Type_Id;

    function Xm_Rep_Type_Get_Name_List (Rep_Type_Id : in Xm_Rep_Type_Id;
					Use_Uppercase_Format : in Boolean)
				       return X_Lib.String_Pointer_Array;

    procedure Xm_Rep_Type_Install_Tear_Off_Model_Converter;

end Xm_Rep_Type;

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
