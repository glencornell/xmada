-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib, X_Configuration_Dependent, Xt, Xm, System;

package Mrm is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    type Mrm_Return_Codes is
       (Mrm_Failure, Mrm_Success, Mrm_Not_Found, Mrm_Create_New,
	Mrm_Exists, Mrm_Index_Retry,          -- Retry on entering index required
	Mrm_Nul_Group, Mrm_Index_Gt,             -- Index orders greater-than entry
	Mrm_Nul_Type, Mrm_Index_Lt,             -- Index orders less-than entry
	Mrm_Wrong_Group, Mrm_Partial_Success,      -- operation partly succeeded
	Mrm_Wrong_Type, Mrm_Out_Of_Range,         -- Record number too big 
	Mrm_Bad_Record,           -- Record number wrong type
	Mrm_Null_Data,            -- No data for entry
	Mrm_Bad_Data_Index,       -- Data index in RID out of range
	Mrm_Bad_Order,            -- Bad ordering specifier
	Mrm_Bad_Context,          -- Invalid Mrm context
	Mrm_Not_Valid,            -- Validation failure
	Mrm_Bad_Btree,            -- GT/LT pointer error in BTree
	Mrm_Bad_Widget_Rec,       -- Validation failure on widget record
	Mrm_Bad_Class_Type,       -- Class type not a valid Mrmwc... value
	Mrm_No_Class_Name,        -- User class name is null
	Mrm_Too_Many,             -- Too many entries requested in some list
	Mrm_Bad_If_Module,        -- invalid interface module
	Mrm_Null_Desc,            -- Arglist or children descriptor null
	Mrm_Out_Of_Bounds,        -- Argument index out of arglist bounds
	Mrm_Bad_Compress,         -- Invalid compression code
	Mrm_Bad_Arg_Type,         -- Invalid type, not in RGMrType... 
	Mrm_Not_Imp,              -- Not yet implemented
	Mrm_Null_Index,           -- empty index string
	Mrm_Bad_Key_Type,         -- key must be MrmrIndex or MrmrRID
	Mrm_Bad_Callback,         -- Invalid callback descriptor
	Mrm_Null_Routine,         -- Empty callback routine name string
	Mrm_Vec_Too_Big,          -- too many elements in vector
	Mrm_Bad_Hierarchy,        -- invalid Mrm file hierarchy
	Mrm_Bad_Class_Code,       -- Class code not found in Mrmwc...
	Mrm_Display_Not_Opened,   -- Display not yet created
	Mrm_Eof,                  -- End of file
	Mrm_Unresolved_Refs);     -- Unresolved widget refs in callback

    for Mrm_Return_Codes'Size use Xt.Cardinal'Size;

    for Mrm_Return_Codes use (Mrm_Failure => 0,
			      Mrm_Success => 1,
			      Mrm_Not_Found => 2,
			      Mrm_Create_New => 3,
			      Mrm_Exists => 4,
			      Mrm_Index_Retry => 5,
			      Mrm_Nul_Group => 6,
			      Mrm_Index_Gt => 7,
			      Mrm_Nul_Type => 8,
			      Mrm_Index_Lt => 9,
			      Mrm_Wrong_Group => 10,
			      Mrm_Partial_Success => 11,
			      Mrm_Wrong_Type => 12,
			      Mrm_Out_Of_Range => 14,
			      Mrm_Bad_Record => 16,
			      Mrm_Null_Data => 18,
			      Mrm_Bad_Data_Index => 20,
			      Mrm_Bad_Order => 22,
			      Mrm_Bad_Context => 24,
			      Mrm_Not_Valid => 26,
			      Mrm_Bad_Btree => 28,
			      Mrm_Bad_Widget_Rec => 30,
			      Mrm_Bad_Class_Type => 32,
			      Mrm_No_Class_Name => 34,
			      Mrm_Too_Many => 36,
			      Mrm_Bad_If_Module => 38,
			      Mrm_Null_Desc => 40,
			      Mrm_Out_Of_Bounds => 42,
			      Mrm_Bad_Compress => 44,
			      Mrm_Bad_Arg_Type => 46,
			      Mrm_Not_Imp => 48,
			      Mrm_Null_Index => 50,
			      Mrm_Bad_Key_Type => 52,
			      Mrm_Bad_Callback => 54,
			      Mrm_Null_Routine => 56,
			      Mrm_Vec_Too_Big => 58,
			      Mrm_Bad_Hierarchy => 60,
			      Mrm_Bad_Class_Code => 62,
			      Mrm_Display_Not_Opened => 63,
			      Mrm_Eof => 64,
			      Mrm_Unresolved_Refs => 65);

--
-- Define the creation callback
--
    Mrm_N_Create_Callback : constant String := "createCallback" & Ascii.Nul;

    Mrmcr_Create : constant Xm.Callback_Reason := Xm.Xmcr_Create;

--
-- Codes for unknown (user-defined) classes.
--
    Mrmwc_Unknown : constant := 1;
    Urmwc_Unknown : constant := 1;

--
-- The data types of values stored in uid files.
--
    type Mrm_Data_Types is
       (Mrm_R_Type_Integer,        --int
	Mrm_R_Type_Boolean, Mrm_R_Type_Char8,          -- a nul-terminated string
	Mrm_R_Type_Char8_Vector,   -- a vector of char_8 strings
	Mrm_R_Type_C_String,       -- a compound string (DDIS)
	Mrm_R_Type_C_String_Vector,-- a vector of compound strings
	Mrm_R_Type_Float, Mrm_R_Type_Callback,       -- code for a callback descriptor
	Mrm_R_Type_Pixmap_Image,   -- Pixmap in image form
	Mrm_R_Type_Pixmap_Ddif,    -- Pixmap in DDIF form
	Mrm_R_Type_Resource,       -- Mrm resource descriptor
	Mrm_R_Type_Null,           -- no value given
	Mrm_R_Type_Addr_Name,      -- nul-terminated string to be interpreted as runtime address
	Mrm_R_Type_Icon_Image,     -- icon image
	Mrm_R_Type_Font,           -- Mrm font structure
	Mrm_R_Type_Font_List,      -- Mrm font list
	Mrm_R_Type_Color,          -- Mrm color descriptor
	Mrm_R_Type_Color_Table,    -- Mrm color table
	Mrm_R_Type_Any,            -- Any is allowed in UID file
	Mrm_R_Type_Trans_Table,    -- Translation table (ASCIZ string)
	Mrm_R_Type_Class_Rec_Name, -- class record name (ASCIZ string)
	Mrm_R_Type_Integer_Vector, -- a vector of integers
	Mrm_R_Type_X_Bitmap_File,  -- X bitmap file to make pixmap with
	Mrm_R_Type_Counted_Vector, -- vector with associated count
	Mrm_R_Type_Keysym,         -- X keysym data type
	Mrm_R_Type_Single_Float,  -- single float data type
	Mrm_R_Type_Wide_Character,    -- wide_character string type */
	Mrm_R_Type_Font_Set, Mrm_R_Type_Max);

    for Mrm_Data_Types'Size use 16;

    for Mrm_Data_Types use (Mrm_R_Type_Integer => 1,
			    Mrm_R_Type_Boolean => 2,
			    Mrm_R_Type_Char8 => 3,
			    Mrm_R_Type_Char8_Vector => 4,
			    Mrm_R_Type_C_String => 5,
			    Mrm_R_Type_C_String_Vector => 6,
			    Mrm_R_Type_Float => 7,
			    Mrm_R_Type_Callback => 9,
			    Mrm_R_Type_Pixmap_Image => 10,
			    Mrm_R_Type_Pixmap_Ddif => 11,
			    Mrm_R_Type_Resource => 12,
			    Mrm_R_Type_Null => 13,
			    Mrm_R_Type_Addr_Name => 14,
			    Mrm_R_Type_Icon_Image => 15,
			    Mrm_R_Type_Font => 16,
			    Mrm_R_Type_Font_List => 17,
			    Mrm_R_Type_Color => 18,
			    Mrm_R_Type_Color_Table => 19,
			    Mrm_R_Type_Any => 20,
			    Mrm_R_Type_Trans_Table => 21,
			    Mrm_R_Type_Class_Rec_Name => 22,
			    Mrm_R_Type_Integer_Vector => 23,
			    Mrm_R_Type_X_Bitmap_File => 24,
			    Mrm_R_Type_Counted_Vector => 25,
			    Mrm_R_Type_Keysym => 26,
			    Mrm_R_Type_Single_Float => 27,
			    Mrm_R_Type_Wide_Character => 28,
			    Mrm_R_Type_Font_Set => 29,
			    Mrm_R_Type_Max => 30);

    Mrm_R_Type_Min : constant := 1;

--
-- MRM primitive types
--
    -- Used for codes, e.g. Mrmcr...
    type Mrm_Code is new X_Configuration_Dependent.Short;

    -- Short code for small ranges
    type Mrm_S_Code is new X_Configuration_Dependent.Unsigned_Char;

    -- Used for offsets in records
    type Mrm_Offset is new X_Configuration_Dependent.Unsigned_Short;

    -- Used for types, e.g. MrmrType...
    type Mrm_Type is new X_Configuration_Dependent.Short;

    -- For size fields
    type Mrm_Size is new X_Configuration_Dependent.Unsigned_Short;

    -- For counter fields
    type Mrm_Count is new X_Configuration_Dependent.Short;

    -- flag fields
    type Mrm_Flag is new X_Configuration_Dependent.Unsigned_Char;

    -- Resource id in IDB files
    type Mrm_Resource_Id is new X_Configuration_Dependent.Long;

    -- For Mrm resource groups
    type Mrm_Group is new X_Configuration_Dependent.Short;

    Mrm_Max_Resource_Size : constant := 65535;

--
-- Operating System specific parameter struct.  Passed to low level
-- file OPEN.
--
    Mrm_Os_Open_Param_Version : constant Xt.Cardinal := 1;

    type Mrm_Os_Open_Param_Rec is
	record
	    Version : Xt.Cardinal := Mrm_Os_Open_Param_Version;
	    Default_Fname : X_Lib.String_Pointer;
--
--  C had a union of two items instead of OS_Dependent
--     Related_Name  was unsigned long
--     Clobber_Flg   was Boolean
--  
	    Os_Dependent : X_Configuration_Dependent.Unsigned_Long;
	    The_Display : X_Lib.Display;
	end record;

    type Mrm_Os_Open_Param_Array is
       array (Natural range <>) of Mrm_Os_Open_Param_Rec;
    type Mrm_Os_Open_Param_Table is access Mrm_Os_Open_Param_Rec;

--
-- The opaque result of opening a Mrm hierarchy.
--
    type Mrm_Hierarchy is private;

--
-- Structure used to pass name/value pairs to MrmRegisterNames
--
    subtype Mrm_Arg_Val is Xt.Xt_Pointer;
    type Mrm_Register_Arg is
	record
	    Name : Xt.Xt_String;
	    Value : Xt.Xt_Pointer;
	end record;
    for Mrm_Register_Arg'Size use 64;
    for Mrm_Register_Arg use
	record
	    Name at 0 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    Value at 1 * X_Configuration_Dependent.Word_Size
	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	end record;
    type Mrm_Register_Arg_List is array (Natural range <>) of Mrm_Register_Arg;
    type Mrm_Register_Arg_List_Ptr is access Mrm_Register_Arg_List;
    Null_Mrm_Register_Arg_List : Mrm_Register_Arg_List (1 .. 0);

    procedure Mrm_Initialize;

    procedure Mrm_Fetch_Literal (Hierarchy_Id : in Mrm_Hierarchy;
				 Index : in String;
				 The_Display : in X_Lib.Display;
				 Value_Ptr : out Xt.Xt_Pointer;
				 Data_Type : out Mrm_Code;
				 Result : out Mrm_Return_Codes);

    procedure Mrm_Fetch_Icon_Literal (Hierarchy_Id : in Mrm_Hierarchy;
				      Index : in String;
				      The_Screen : in X_Lib.Screen;
				      The_Display : in X_Lib.Display;
				      Fg_Pix : in X_Lib.Pixel;
				      Bg_Pix : in X_Lib.Pixel;
				      The_Pixmap : out X_Lib.Pixmap;
				      Result : out Mrm_Return_Codes);

    procedure Mrm_Fetch_Bitmap_Literal (Hierarchy_Id : in Mrm_Hierarchy;
					Index : in String;
					Src : in X_Lib.Screen;
					Dpy : in X_Lib.Display;
					Pixmap_Return : out X_Lib.Pixmap;
					Width : out Xt.Dimension;
					Height : out Xt.Dimension;
					Result : out Mrm_Return_Codes);

    procedure Mrm_Fetch_Color_Literal (Hierarchy_Id : in Mrm_Hierarchy;
				       Index : in String;
				       The_Display : in X_Lib.Display;
				       Colormap_Id : in X_Lib.Colors.Color_Map;
				       The_Pixel : out X_Lib.Pixel;
				       Result : out Mrm_Return_Codes);

    procedure Mrm_Open_Hierarchy
		 (Num_Files : in Mrm_Count;
		  Name_List : in X_Lib.String_List;
		  Ancillary_Structures_List : in Mrm_Os_Open_Param_Table;
		  Hierarchy_Id : out Mrm_Hierarchy;
		  Result : out Mrm_Return_Codes);

    procedure Mrm_Open_Hierarchy_Per_Display
		 (Dpy : in X_Lib.Display;
		  Num_Files : in Mrm_Count;
		  Name_List : in X_Lib.String_List;
		  Os_Ext_List : in Mrm_Os_Open_Param_Table;
		  Hierarchy_Id_Return : out Mrm_Hierarchy;
		  Result : out Mrm_Return_Codes);

    function Mrm_Register_Names
		(Reglist : in Mrm_Register_Arg_List :=
		    Null_Mrm_Register_Arg_List) return Mrm_Return_Codes;

    function Mrm_Register_Names_In_Hierarchy
		(Hierarchy_Id : in Mrm_Hierarchy;
		 Reglist : in Mrm_Register_Arg_List :=
		    Null_Mrm_Register_Arg_List) return Mrm_Return_Codes;

    function Mrm_Register_Class
		(Class_Name : in String;
		 Create_Name : in String;
		 Create_Proc : in System.Address;
		 Class_Record : in Xt.Widget_Class) return Mrm_Return_Codes;

    function Mrm_Close_Hierarchy
		(Hierarchy_Id : in Mrm_Hierarchy) return Mrm_Return_Codes;

    procedure Mrm_Fetch_Interface_Module (Hierarchy_Id : in Mrm_Hierarchy;
					  Module_Name : in String;
					  Parent : in Xt.Widget;
					  The_Widget : out Xt.Widget;
					  Result : out Mrm_Return_Codes);

    -- if The_Widget is not Xt.Null_Widget on input, returns Mrm_Failure
    procedure Mrm_Fetch_Widget (Hierarchy_Id : in Mrm_Hierarchy;
				Index : in String;
				Parent : in Xt.Widget;
				The_Widget : in out Xt.Widget;
				Class : out Mrm_Type;
				Result : out Mrm_Return_Codes);

    -- specify null override_name if don't want to override the name
    -- if The_Widget is not Xt.Null_Widget on input, returns Mrm_Failure
    procedure Mrm_Fetch_Widget_Override
		 (Hierarchy_Id : in Mrm_Hierarchy;
		  Index : in String;
		  Parent : in Xt.Widget;
		  Override_Name : in String := "";
		  Override_Args : in Xt.Xt_Ancillary_Types.Xt_Arg_List :=
		     Xm.Null_Xm_Arg_List;
		  The_Widget : in out Xt.Widget;
		  Class : out Mrm_Type;
		  Result : out Mrm_Return_Codes);

    function Mrm_Fetch_Set_Values
		(Hierarchy_Id : in Mrm_Hierarchy;
		 The_Widget : in Xt.Widget;
		 An_Arg_List : in Xt.Xt_Ancillary_Types.Xt_Arg_List :=
		    Xm.Null_Xm_Arg_List) return Mrm_Return_Codes;

private
    type Mrm_Hierarchy_Desc_Rec;
    type Mrm_Hierarchy is access Mrm_Hierarchy_Desc_Rec;

end Mrm;

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
