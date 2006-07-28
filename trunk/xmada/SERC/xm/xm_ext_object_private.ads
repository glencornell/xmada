-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm,
     Xm_Private, Xt_Object_Private, Unchecked_Conversion;

package Xm_Ext_Object_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Ext_Type is (Xmcache_Extension, Xmdesktop_Extension,
			 Xmshell_Extension, Xmprotocol_Extension,
			 Xmdefault_Extension);
    for Xm_Ext_Type'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;
    for Xm_Ext_Type use (Xmcache_Extension => 1,
			 Xmdesktop_Extension => 2,
			 Xmshell_Extension => 3,
			 Xmprotocol_Extension => 4,
			 Xmdefault_Extension => 5);

    Xmnum_Elements : constant := 4;
    Xmnum_Bytes : constant := 99;
    Bits_Per_Byte : constant := 8;

    type Ext_Object_Class_Part is
	record
	    Syn_Resources : Xm_Private.Xm_Synthetic_Resource_List;
	    Num_Syn_Resources : X_Configuration_Dependent.Int;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Ext_Object_Class_Part use
	record
	    Syn_Resources at 0 * Word_Size range 0 .. 31;
	    Num_Syn_Resources at 1 * Word_Size range 0 .. 31;
	    Extension at 2 * Word_Size range 0 .. 31;
	end record;

    Ext_Object_Class_Part_Size : constant := 3 * 32;
    Ext_Object_Class_Rec_Size : constant :=
       Xt_Object_Private.Object_Class_Rec_Size + Ext_Object_Class_Part_Size;

    type Ext_Object_Class_Rec is
	record
	    Object_Class : Xt_Object_Private.Object_Class_Part;
	    Ext_Object_Class : Ext_Object_Class_Part;
	end record;

    for Ext_Object_Class_Rec use
	record
	    Object_Class at 0
	       range 0 .. Xt_Object_Private.Object_Class_Rec_Size - 1;
	    Ext_Object_Class at 0
	       range Xt_Object_Private.Object_Class_Rec_Size ..
			Ext_Object_Class_Rec_Size - 1;
	end record;

    type Ext_Object_Part is
	record
	    Logical_Parent : Xm.Xt_Widget;
	    Extension_Type : Xm_Ext_Type;
	    Dummy : X_Configuration_Dependent.Unsigned_Char;
	end record;

    for Ext_Object_Part use
	record
	    Logical_Parent at 0 * Word_Size range 0 .. 31;
	    Extension_Type at 1 * Word_Size range 0 .. 7;
	    Dummy at 1 * Word_Size range 24 .. 31;
	end record;

    Ext_Object_Part_Size : constant := 2 * 32;

    Ext_Object_Rec_Size : constant :=
       Xt_Object_Private.Object_Rec_Size + Ext_Object_Part_Size;

    type Ext_Object_Rec is
	record
	    Object : Xt_Object_Private.Object_Part;
	    Ext_Object : Ext_Object_Part;
	end record;

    for Ext_Object_Rec use
	record
	    Object at 0 range 0 .. Xt_Object_Private.Object_Rec_Size - 1;
	    Ext_Object at 0 range Xt_Object_Private.Object_Rec_Size ..
				     Ext_Object_Rec_Size - 1;
	end record;

    type Xm_Ext_Cache is
	record
	    Data : X_Lib.Char_Array (1 .. Xmnum_Bytes);
	    Inuse : Xm.Xm_Boolean;
	end record;

    for Xm_Ext_Cache use
	record
	    Data at 0 range 0 .. Xmnum_Bytes * Bits_Per_Byte - 1;
	    Inuse at 0 range Xmnum_Bytes * Bits_Per_Byte ..
				(Xmnum_Bytes + 1) * Bits_Per_Byte - 1;
	end record;

    type Xm_Ext_Object_Rec_Ptr is access Ext_Object_Rec;
    type Xm_Ext_Object_Class_Rec_Ptr is access Ext_Object_Class_Rec;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Ext_Object_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Ext_Object_Class (X : in Xt.Widget_Class)
				    return Xm_Ext_Object_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Ext_Object_Rec_Ptr) return Xt.Widget;

    function To_Xm_Ext_Object (X : in Xt.Widget) return Xm_Ext_Object_Rec_Ptr;

end Xm_Ext_Object_Private;

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
