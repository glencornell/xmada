-- AdaXlibXt: Ada bindings to the X Window System, developed by SERC
-- Copyright (C) 1991, 1992, 1993  Free Software Foundation
--
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Library General Public
-- License as published by the Free Software Foundation; either
-- version 2 of the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Library General Public License for more details.
--
-- You should have received a copy of the GNU Library General Public
-- License along with this library; if not, write to the Free
-- Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

with X_Configuration_Dependent, X_Lib, X_Lib_Interface, X_System_Utilities,
     Xt_Unix_Devices, Xt_System_Utilities, Unchecked_Conversion;

use X_Lib, X_Configuration_Dependent;

package Xt is
    use X_Lib.Resource_Manager;
    use X_System_Utilities.Command_Line_Utilities;

--    type Cardinal is new X_Configuration_Dependent.Unsigned_Long;

    type Short_Cardinal is new X_Configuration_Dependent.Unsigned_Short;

--    type Position is new X_Configuration_Dependent.Short;

--    subtype Dimension is Short_Cardinal;
    type Dimension_Array is array (Natural range <>) of Dimension;
    type Dimension_List is access Dimension_Array;

    subtype Xt_Geometry_Mask is X_Lib.Cw_Mask_Type;

--    subtype Xt_Pointer is X_Address;
    subtype Opaque is Xt_Pointer;

--    type Widget is private;
--    type Widget_Class is private;
--
--    Null_Xt_Pointer : constant Xt_Pointer := Xt_Pointer (Null_Address);
--    Null_Widget : constant Widget;
--    Null_Widget_Class : constant Widget_Class;
--
--    type Xt_App_Context is private;
    subtype Application_Context is Xt_App_Context;
--    Null_Xt_App_Context : constant Xt_App_Context;

    -- This type is needed by event manager and is also needed in definition of
    -- Xt_App_Context.
    type Xt_Input_Id is new X_Lib.X_Id;

    -- Device specifies the particular device in a Device_Queue.
    subtype Device is Xt_Unix_Devices.Unix_Device;

    -- Device_Queue is the list of files/devices which are providing
    -- input events.
    type Device_Queue is array (Device range <>) of Xt_Input_Id;
    Null_Device_Queue : Device_Queue (1 .. 0);

    type Xt_Interval_Id is new X_Lib.X_Id;

--    type Xt_Work_Proc_Id is new X_Lib.X_Id;

    -- Convenient subtypes used as renamings for X_Lib types follow below:

    subtype Event_Mask is X_Lib.Events.Event_Mask_Type;
--    subtype X_Event is X_Lib.Events.Event_Record;
    subtype X_Set_Window_Attributes is
       X_Lib_Interface.X_Set_Window_Attributes_Record;
    subtype X_Region is X_Lib.Regions.Region;
    subtype Gc is X_Lib.Graphic_Output.Graphic_Context;
    subtype X_Gc_Values is X_Lib.Graphic_Output.Gc_Value_Record;
--    subtype Xt_String is X_Lib.String_Pointer;
--    subtype Xt_String_List is X_Lib.String_Pointer_Array;
--    subtype Xt_String_List_Ptr is X_Lib.String_List;
    subtype Modifiers is X_Lib.X_Mask_Type;
    subtype Xt_Value_Mask is X_Lib.Wa_Mask_Type;
    subtype Xt_Gc_Mask is X_Lib.X_Mask_Type;
    subtype Xt_Stack_Mode is X_Lib.Stack_Mode_Type;
    subtype Argv_Type is Argv_List;

--    Null_Xt_String_List : Xt_String_List
--       renames X_Lib.Null_String_Pointer_Array;
    function Null_Event return X_Event renames X_Lib.Events.Null_Event;

    -- Named address subtypes follow below:

    subtype Xt_Proc is X_Address;
    subtype Xt_Widget_Class_Proc is X_Address;
    subtype Xt_Init_Proc is X_Address;
    subtype Xt_Args_Proc is X_Address;
    subtype Xt_Realize_Proc is X_Address;
    subtype Xt_Widget_Proc is X_Address;
    subtype Xt_Expose_Proc is X_Address;
    subtype Xt_Almost_Proc is X_Address;
    subtype Xt_Accept_Focus_Proc is X_Address;
    subtype Xt_Geometry_Handler is X_Address;
    subtype Xt_String_Proc is X_Address;
    subtype Xt_Set_Values_Func is X_Address;
    subtype Xt_Args_Func is X_Address;
--    subtype Xt_Callback_Proc is X_Address;
    subtype Xt_Resource_Default_Proc is X_Address;
--    subtype Xt_Language_Proc is X_Address;
    subtype Xt_Error_Msg_Handler is X_Address;
    subtype Xt_Error_Handler is X_Address;
    subtype Xt_Input_Callback_Proc is X_Address;
    subtype Xt_Timer_Callback_Proc is X_Address;
    subtype Xt_Create_Popup_Child_Proc is X_Address;
--    subtype Xt_Work_Proc is X_Address;
    subtype Xt_Event_Handler is X_Address;
    subtype Xt_Converter is X_Address;
    subtype Xt_Cache_Ref is X_Address;
    subtype Xt_Key_Proc is X_Address;
    subtype Xt_Case_Proc is X_Address;
    subtype Xt_Action_Hook_Proc is X_Address;
    subtype Xt_Action_Hook_Id is X_Address;
--    subtype Xt_Action_Proc is X_Address;
    subtype Xt_Selection_Callback_Proc is X_Address;
    subtype Xt_Convert_Selection_Proc is X_Address;
    subtype Xt_Lose_Selection_Proc is X_Address;
    subtype Xt_Lose_Selection_Incr_Proc is X_Address;
    subtype Xt_Selection_Done_Proc is X_Address;
    subtype Xt_Request_Id is X_Address;
    subtype Xt_Cancel_Convert_Selection_Proc is X_Address;
    subtype Xt_Convert_Selection_Incr_Proc is X_Address;
    subtype Xt_Selection_Done_Incr_Proc is X_Address;
    subtype Xt_Order_Proc is X_Address;
--    subtype Xt_Destructor is X_Address;
--    subtype Xt_Type_Converter is X_Address;
    subtype Xt_File_Predicate is X_Address;
    subtype Xt_Convert_Arg_Proc is X_Address;

--    subtype Xt_Cache_Type is Int;
--
--    Xt_Cache_None : constant := 16#001#;
--    Xt_Cache_All : constant := 16#002#;
--    Xt_Cache_By_Display : constant := 16#003#;
--    Xt_Cache_Ref_Count : constant := 16#100#;

    subtype Options_Type is Xt_System_Utilities.Options_Type;

    procedure Set_Options (To : in Options_Type)
       renames Xt_System_Utilities.Set_Options;
    function Get_Options return Options_Type
       renames Xt_System_Utilities.Get_Options;

    -- Raised when a string or component of a string array is not
    -- terminated with an ASCII.NUL character and the option to
    -- raise exceptions in this case is on.
    String_Termination_Error :
       exception renames X_System_Utilities.String_Termination_Error;

    -- Raised upon a call to Set_Options above where the components of
    -- the Options_Type make no sense.
    Illegal_Options : exception renames Xt_System_Utilities.Illegal_Options;

    -- Raised in calls to instantiations of generic Xt_Set_Arg procedures
    -- where the sizes of the types differ.
    Size_Incompatible : exception;

--    Xt_Unspecified_Pixmap : constant Pixmap := 2;
    Xt_Unspecified_Shellint : constant := -1;
    Xt_Unspecified_Window : constant Window := 2;
    Xt_Unspecified_Windowgroup : constant Window := 3;

    Xt_Default_Foreground : constant String :=
       "XtDefaultForeground" & Ascii.Nul;
    Xt_Default_Background : constant String :=
       "XtDefaultBackground" & Ascii.Nul;
    Xt_Default_Font : constant String := "XtDefaultFont" & Ascii.Nul;
    Xt_Default_Font_Set : constant String := "XtDefaultFontSet" & Ascii.Nul;

    -- compress_exposure options
    Xt_Expose_No_Compress : constant := 0;
    Xt_Expose_Compress_Series : constant := 1;
    Xt_Expose_Compress_Multiple : constant := 2;
    Xt_Expose_Compress_Maximal : constant := 3;

    -- modifiers
    Xt_Expose_Graphics_Expose : constant := 16#10#;
    Xt_Expose_Graphics_Expose_Merged : constant := 16#20#;
    Xt_Expose_No_Expose : constant := 16#40#;

    package Xt_Ancillary_Types is
--	subtype Xt_Boolean is X_Configuration_Dependent.Char;
	type Xt_Boolean_Ptr is access Xt_Boolean;
--	Xt_False : constant Xt_Boolean := 0;
--	Xt_True : constant Xt_Boolean := 1;
--
--	type Xt_Enum is new X_Configuration_Dependent.Byte;

	-- Geometry management types:
	type Xt_Geometry_Result is (Xt_Geometry_Yes, Xt_Geometry_No,
				    Xt_Geometry_Almost, Xt_Geometry_Done);
	for Xt_Geometry_Result'Size use 32;

	type Xt_Widget_Geometry is
	    record
		Request_Mode : Xt_Geometry_Mask;
		X, Y : Position;
		Width, Height, Border_Width : Dimension;
		Sibling : Xt_Pointer;
		Stack_Mode : Xt_Stack_Mode;
	    end record;
	-- Component Sibling is of type Xt_Pointer instead of Widget because
	-- Widget is a private type and the following representation clause
	-- would be disallowed in that case.  Due to the location of this
	-- type, the representation clause below cannot be moved to the body.
	-- Type conversions can be done using the Xt_Utilities operations.
	for Xt_Widget_Geometry use
	    record
		Request_Mode at 0 * Word_Size range 0 .. 31;
		X at 1 * Word_Size range 0 .. 15;
		Y at 1 * Word_Size range 16 .. 31;
		Width at 2 * Word_Size range 0 .. 15;
		Height at 2 * Word_Size range 16 .. 31;
		Border_Width at 3 * Word_Size range 0 .. 15;
		Sibling at 4 * Word_Size range 0 .. 31;
		Stack_Mode at 5 * Word_Size range 0 .. 31;
	    end record;

	Xt_Widget_Geometry_Size : constant := 6 * 32;
	type Xt_Widget_Geometry_Ptr is access Xt_Widget_Geometry;

	subtype Xt_Version_Type is Cardinal;

	Xt_Version_Level : constant := 11;
	Xt_Revision_Level : constant := 5;
--      Telesoft compiler has problems with arithmatic.
--      so I forced the value of version.
--      Xt_Version            : constant Xt_Version_Type :=
--        (Xt_Version_Level * 1000) + Xt_Revision_Level;
	Xt_Version : constant Xt_Version_Type := 11005;
	Xt_Version_Dont_Check : constant Xt_Version_Type := 0;

--	subtype Xt_Arg_Val is X_Long_Integer;
--
--	type Xt_Arg is
--	    record
--		Name : Xt_String;
--		Value : Xt_Arg_Val;
--	    end record;
--	for Xt_Arg'Size use 64;
--	for Xt_Arg use
--	    record
--		Name at 0 range 0 .. 31;
--		Value at 0 range 32 .. 63;
--	    end record;
--
--	type Xt_Arg_List is array (Natural range <>) of Xt_Arg;
--	type Xt_Arg_List_Ptr is access Xt_Arg_List;
--	subtype Arg_List is Xt_Arg_List;
--	subtype Arg_List_Ptr is Xt_Arg_List_Ptr;
--	Null_Xt_Arg_List : Xt_Arg_List (1 .. 0);
--
--	type Xt_Resource is
--	    record
--		Resource_Name : Xt_String;
--		Resource_Class : Xt_String;
--		Resource_Type : Xt_String;
--		Resource_Size : Cardinal;
--		Resource_Offset : Cardinal;
--		Default_Type : Xt_String;
--		Default_Address : Xt_Pointer;
--	    end record;
--
--	for Xt_Resource use
--	    record
--		Resource_Name at 0 * Word_Size range 0 .. 31;
--		Resource_Class at 1 * Word_Size range 0 .. 31;
--		Resource_Type at 2 * Word_Size range 0 .. 31;
--		Resource_Size at 3 * Word_Size range 0 .. 31;
--		Resource_Offset at 4 * Word_Size range 0 .. 31;
--		Default_Type at 5 * Word_Size range 0 .. 31;
--		Default_Address at 6 * Word_Size range 0 .. 31;
--	    end record;
--
--	type Xt_Resource_Ptr is access Xt_Resource;

	type Xrm_Resource is
	    record
		Xrm_Name : X_Lib.Resource_Manager.Xrm_Quark;
		Xrm_Class : X_Lib.Resource_Manager.Xrm_Quark;
		Xrm_Type : X_Lib.Resource_Manager.Xrm_Quark;
		Xrm_Size : Cardinal;
		Xrm_Offset : X_Lib.X_Long_Integer;
		Xrm_Default_Type : X_Lib.Resource_Manager.Xrm_Quark;
		Xrm_Default_Addr : Xt_Pointer;
	    end record;

	for Xrm_Resource use
	    record
		Xrm_Name at 0 * Word_Size range 0 .. 31;
		Xrm_Class at 1 * Word_Size range 0 .. 31;
		Xrm_Type at 2 * Word_Size range 0 .. 31;
		Xrm_Size at 3 * Word_Size range 0 .. 31;
		Xrm_Offset at 4 * Word_Size range 0 .. 31;
		Xrm_Default_Type at 5 * Word_Size range 0 .. 31;
		Xrm_Default_Addr at 6 * Word_Size range 0 .. 31;
	    end record;

	type Xrm_Resource_Ptr is access Xrm_Resource;
	type Xrm_Resource_Array is array (Natural range <>) of Xrm_Resource;
	type Xrm_Resource_List is access Xrm_Resource_Array;

--	type Xt_Address_Mode is (Xt_Address, Xt_Base_Offset, Xt_Immediate,
--				 Xt_Resource_String, Xt_Resource_Quark,
--				 Xt_Widget_Base_Offset, Xt_Procedure_Arg);
--
--	type Xt_Convert_Arg is
--	    record
--		Address_Mode : Xt_Address_Mode;
--		Address_Id : Xt_Pointer;
--		Size : Cardinal;
--	    end record;

	-- List types.
	type Xt_Offset_Rec;
	type Xt_Offset_List_Ptr is access Xt_Offset_Rec;
	type Xt_Offset_Rec is
	    record
		Next : Xt_Offset_List_Ptr;
		Name : X_Lib.Resource_Manager.Xrm_Quark;
		Offset : Cardinal;
	    end record;

--      XT_CONVERT_FAIL : constant X_Lib.Atoms.Atom := 16#80000001#;

	type Atom_List is array (Natural range <>) of X_Lib.Atoms.Atom;
	type Atom_List_Ptr is access Atom_List;
	Null_Atom_List : Atom_List (1 .. 0);

--	type Xt_Widget_List is array (Natural range <>) of Widget;
--	type Xt_Widget_List_Ptr is access Xt_Widget_List;
--	subtype Widget_List is Xt_Widget_List;
--	subtype Widget_List_Ptr is Xt_Widget_List_Ptr;

	type Xt_Resource_Array is array (Natural range <>) of Xt_Resource;
	type Xt_Resource_List is access Xt_Resource_Array;
	Null_Xt_Resource_Array : Xt_Resource_Array (1 .. 0);

	subtype Xrm_Value_List is X_Lib.Resource_Manager.Xrm_Value_Array;
	Null_Xrm_Value_List : Xrm_Value_List
	   renames X_Lib.Resource_Manager.Null_Xrm_Value_Array;
    end Xt_Ancillary_Types;

    use Xt_Ancillary_Types;

    package Xt_Type_Operations is
	type Xt_Bool_Array is array (Natural range <>) of Xt_Boolean;

	function "and" (X : in Xt_Boolean; Y : in Xt_Boolean) return Xt_Boolean;
	function "and" (X : in Xt_Boolean; Y : in Boolean) return Xt_Boolean;
	function "and" (X : in Boolean; Y : in Xt_Boolean) return Xt_Boolean;
	function "and" (X : in Xt_Boolean; Y : in Xt_Boolean) return Boolean;
	function "and" (X : in Xt_Boolean; Y : in Boolean) return Boolean;
	function "and" (X : in Boolean; Y : in Xt_Boolean) return Boolean;

	function "or" (X : in Xt_Boolean; Y : in Xt_Boolean) return Xt_Boolean;
	function "or" (X : in Xt_Boolean; Y : in Boolean) return Xt_Boolean;
	function "or" (X : in Boolean; Y : in Xt_Boolean) return Xt_Boolean;
	function "or" (X : in Xt_Boolean; Y : in Xt_Boolean) return Boolean;
	function "or" (X : in Xt_Boolean; Y : in Boolean) return Boolean;
	function "or" (X : in Boolean; Y : in Xt_Boolean) return Boolean;

	function "xor" (X : in Xt_Boolean; Y : in Xt_Boolean) return Xt_Boolean;
	function "xor" (X : in Xt_Boolean; Y : in Boolean) return Xt_Boolean;
	function "xor" (X : in Boolean; Y : in Xt_Boolean) return Xt_Boolean;
	function "xor" (X : in Xt_Boolean; Y : in Xt_Boolean) return Boolean;
	function "xor" (X : in Xt_Boolean; Y : in Boolean) return Boolean;
	function "xor" (X : in Boolean; Y : in Xt_Boolean) return Boolean;

	function "not" (X : in Xt_Boolean) return Xt_Boolean;
	function "not" (X : in Boolean) return Xt_Boolean;
	function "not" (X : in Xt_Boolean) return Boolean;

	function To_Boolean (X : in Xt_Boolean) return Boolean;
	function To_Xt_Boolean (B : in Boolean) return Xt_Boolean;

	-- Operations on Xt_Boolean arrays.

	function "and" (X, Y : in Xt_Bool_Array) return Xt_Bool_Array;
	function "not" (X : in Xt_Bool_Array) return Xt_Bool_Array;
	function "or" (X, Y : in Xt_Bool_Array) return Xt_Bool_Array;
	function "xor" (X, Y : in Xt_Bool_Array) return Xt_Bool_Array;
    end Xt_Type_Operations;

    package Xt_Utilities is
	use X_Lib.Graphic_Output;

	type Xt_Substitution_Rec is
	    record
		Match : X_Lib.X_Character;
		Substitution : Xt_String;
	    end record;
	for Xt_Substitution_Rec use
	    record
		Match at 0 * Word_Size range 0 .. 7;
		Substitution at 1 * Word_Size range 0 .. 31;
	    end record;
	type Substitution_Array is
	   array (Natural range <>) of Xt_Substitution_Rec;
	type Substitution is access Substitution_Array;

--	-- new for R4
--	-- XtName
--	function Xt_Name (Object : in Widget) return String;
--
--	-- XtNameToWidget
--	function Xt_Name_To_Widget
--		    (Reference : in Widget; Names : in String) return Widget;

	-- Sharing graphics contexts:

--	-- XtGetGC
--	function Xt_Get_Gc (W : in Widget;
--			    Value_Mask : in Gc_Mask_Type;
--			    Values : in X_Gc_Values) return Gc;

	function Xt_Allocate_Gc (W : in Widget;
				 Depth : in X_Lib.Depth_Type;
				 Value_Mask : in Gc_Mask_Type;
				 Values : in X_Gc_Values;
				 Dynamic_Mask : in Gc_Mask_Type;
				 Unused_Mask : in Gc_Mask_Type) return Gc;

--	-- XtReleaseGC
--	procedure Xt_Release_Gc (W : in Widget; The_Gc : in Gc);

	-- XtDestroyGC
	procedure Xt_Destroy_Gc (The_Gc : in Gc);

	-- handling errors

	-- XtAppGetErrorDatabase
	function Xt_App_Get_Error_Database
		    (App_Context : in Xt_App_Context) return Xrm_Database;

	-- XtGetErrorDatabase
	function Xt_Get_Error_Database return Xrm_Database;

	-- XtAppGetErrorDatabaseText
	procedure Xt_App_Get_Error_Database_Text
		     (App_Context : in Xt_App_Context;
		      Name, Restype, Class : in String;
		      Default : in String;
		      Buffer : out String;
		      Database : in Xrm_Database);

	-- XtGetErrorDatabaseText
	procedure Xt_Get_Error_Database_Text (Name, Restype, Class : in String;
					      Default : in String;
					      Buffer : out String);

	-- XtAppSetErrorMsgHandler
	function Xt_App_Set_Error_Msg_Handler
		    (App_Context : in Xt_App_Context;
		     Msg_Handler : in Xt_Error_Msg_Handler)
		    return Xt_Error_Msg_Handler;

	-- XtSetErrorMsgHandler
	procedure Xt_Set_Error_Msg_Handler
		     (Msg_Handler : in Xt_Error_Msg_Handler);

	-- XtAppSetWarningMsgHandler
	function Xt_App_Set_Warning_Msg_Handler
		    (App_Context : in Xt_App_Context;
		     Msg_Handler : in Xt_Error_Msg_Handler)
		    return Xt_Error_Msg_Handler;

	-- XtSetWarningMsgHandler
	procedure Xt_Set_Warning_Msg_Handler
		     (Msg_Handler : in Xt_Error_Msg_Handler);

	-- XtAppSetErrorHandler
	function Xt_App_Set_Error_Handler
		    (App_Context : in Xt_App_Context;
		     Handler : in Xt_Error_Handler) return Xt_Error_Handler;

	-- XtSetErrorHandler
	procedure Xt_Set_Error_Handler (Handler : in Xt_Error_Handler);

	-- XtAppSetWarningHandler
	function Xt_App_Set_Warning_Handler
		    (App_Context : in Xt_App_Context;
		     Handler : in Xt_Error_Handler) return Xt_Error_Handler;

	-- XtSetWarningHandler
	procedure Xt_Set_Warning_Handler (Handler : in Xt_Error_Handler);

	-- XtAppErrorMsg
	procedure Xt_App_Error_Msg
		     (App_Context : in Xt_App_Context;
		      Name, Restype, Class, Default : in String;
		      Params : in Xt_String_List := Null_Xt_String_List);

	-- XtErrorMsg
	procedure Xt_Error_Msg
		     (Name, Restype, Class, Default : in String;
		      Params : in Xt_String_List := Null_Xt_String_List);

	-- XtAppWarningMsg
	procedure Xt_App_Warning_Msg
		     (App_Context : in Xt_App_Context;
		      Name, Restype, Class, Default : in String;
		      Params : in Xt_String_List := Null_Xt_String_List);

	-- XtWarningMsg
	procedure Xt_Warning_Msg
		     (Name, Restype, Class, Default : in String;
		      Params : in Xt_String_List := Null_Xt_String_List);

	-- XtError
	procedure Xt_Error (Message : in String);

	-- XtAppError
	procedure Xt_App_Error
		     (App_Context : in Xt_App_Context; Message : in String);

	-- XtWarning
	procedure Xt_Warning (Message : in String);

	-- XtAppWarning
	procedure Xt_App_Warning
		     (App_Context : in Xt_App_Context; Message : in String);

--	-- XtSetSensitive
--	procedure Xt_Set_Sensitive (W : in Widget; Sensitive : in Boolean);

	-- XtIsSensitive
	function Xt_Is_Sensitive (W : in Widget) return Boolean;

	-- XtFree
	procedure Xt_Free (Ptr : in Xt_Pointer);

	-- XtMalloc
	function Xt_Malloc (Size : in Cardinal) return String;

	-- XtCalloc
	function Xt_Calloc (Num, Size : in Cardinal) return String;

	-- XtRealloc
	function Xt_Realloc
		    (Ptr : in Xt_String; Num : in Cardinal) return String;
	-- XtNewString
	-- Exempt from the requirements of ASCII.NUL termination preconditions.
	function Xt_New_String (S : in String) return Xt_String;

	-- XtFindFile
	function Xt_Find_File
		    (Path : in String;
		     Substitutions : in Substitution;
		     Predicate : in Xt_File_Predicate) return Xt_String;

	-- XtResolvePathname
	function Xt_Resolve_Pathname
		    (The_Display : in X_Lib.Display;
		     File_Type : in String;
		     Filename : in String;
		     Suffix : in String;
		     Path : in String;
		     Substitutions : in Substitution;
		     Predicate : in Xt_File_Predicate) return Xt_String;

	procedure Xt_Set_Wm_Colormap_Windows
		     (W : in Widget;
		      W_List : in Xt_Ancillary_Types.Xt_Widget_List);

--	-- new for R4
--	-- XtDisplayOfObject
--	function Xt_Display_Of_Object (Object : in Widget) return X_Lib.Display;
--
--	-- new for R4
--	-- XtScreenOfObject
--	function Xt_Screen_Of_Object (Object : in Widget) return X_Lib.Screen;
--
--	-- new for R4
--	-- XtWindowOfObject
--	function Xt_Window_Of_Object (Object : in Widget) return X_Lib.Window;
--
--	-- new for R4
--	-- XtIsObject
--	function Xt_Is_Object (Object : in Widget) return Boolean;
--
--	-- XtIsRectObj
--	function Xt_Is_Rect_Obj (Object : in Widget) return Boolean;
--
--	-- XtIsConstraint
--	function Xt_Is_Constraint (Object : in Widget) return Boolean;

	function To_Widget (Addr : in Xt_Pointer) return Widget;

	function To_Widget_Class (Addr : in Xt_Pointer) return Widget_Class;

	function To_Xt_Pointer (W : in Widget) return Xt_Pointer;

	function To_Xt_Pointer (Wc : in Widget_Class) return Xt_Pointer;
    end Xt_Utilities;

    package Xt_Initializers is
	procedure Xt_Initialize
		     (Shell_Name : in String;
		      Application_Class : in String;
		      Options : in Xrm_Option_Desc_List := Null_Xrm_Options;
		      Argc : in out Argc_Type;
		      Argv : in out Argv_Type;
		      Widget_Id : out Widget);

--	-- new for R4
--	-- XtAppInitialize
--	procedure Xt_App_Initialize
--		     (App_Context_Return : in out Xt_App_Context;
--		      Application_Class : in String;
--		      Options : in Xrm_Option_Desc_List := Null_Xrm_Options;
--		      Argc_In_Out : in out Argc_Type;
--		      Argv_In_Out : in out Argv_Type;
--		      Fallback_Resources : in Xt_String_List :=
--			 Null_Xt_String_List;
--		      Args : in Xt_Arg_List := Null_Xt_Arg_List;
--		      Widget_Id : out Widget);
--
--	-- XtToolkitInitialize
--	procedure Xt_Toolkit_Initialize;
--
--	-- XtInitializeWidgetClass
--	procedure Xt_Initialize_Widget_Class (Object_Class : in Widget_Class);
--
--	-- XtCreateApplicationContext
--	function Xt_Create_Application_Context return Xt_App_Context;

	-- XtDisplayToApplicationContext
	function Xt_Display_To_Application_Context
		    (The_Display : in X_Lib.Display) return Xt_App_Context;

--	-- XtDestroyApplicationContext
--	procedure Xt_Destroy_Application_Context
--		     (Context : in out Xt_App_Context);
--
--	-- XtWidgetToApplicationContext
--	function Xt_Widget_To_Application_Context
--		    (Object : in Widget) return Xt_App_Context;
--
--	function Xt_Set_Language_Proc
--		    (App_Context : in Xt_App_Context;
--		     Proc : in Xt_Language_Proc;
--		     Client_Data : in Xt_Pointer) return Xt_Language_Proc;

	-- XtDisplayInitialize
	procedure Xt_Display_Initialize
		     (App_Context : in Xt_App_Context;
		      The_Display : in out X_Lib.Display;
		      Application_Name : in String;
		      Application_Class : in String;
		      Options : in Xrm_Option_Desc_List := Null_Xrm_Options;
		      Argc : in out Argc_Type;
		      Argv : in out Argv_Type);

--	-- XtOpenDisplay
--	procedure Xt_Open_Display
--		     (App_Context : in Xt_App_Context;
--		      Display_Name : in String;
--		      Application_Name : in String;
--		      Application_Class : in String;
--		      Options : in Xrm_Option_Desc_List := Null_Xrm_Options;
--		      Argc : in out Argc_Type;
--		      Argv : in out Argv_Type;
--		      Return_Display : out X_Lib.Display);
--
--	-- XtCloseDisplay
--	procedure Xt_Close_Display (The_Display : in out X_Lib.Display);
--
--	-- XtAppCreateShell
--	function Xt_App_Create_Shell
--		    (Application_Name : in String;
--		     Application_Class : in String;
--		     Wc : in Widget_Class;
--		     The_Display : in X_Lib.Display;
--		     Args : in Xt_Arg_List := Null_Xt_Arg_List) return Widget;

	-- XtCreateApplicationShell
	function Xt_Create_Application_Shell
		    (Application_Name : in String;
		     Wc : in Widget_Class;
		     Args : in Xt_Arg_List := Null_Xt_Arg_List) return Widget;
    end Xt_Initializers;

    -- operations on widget instances
    package Xt_Instance_Management is
--	-- XtIsWidget
--	function Xt_Is_Widget (Object : in Widget) return Boolean;
--
--	-- XtCreateWidget
--	function Xt_Create_Widget
--		    (Name : in String;
--		     Of_Class : in Widget_Class;
--		     Parent : in Widget;
--		     Args : in Xt_Arg_List := Null_Xt_Arg_List) return Widget;
--
--	-- XtCreateManagedWidget
--	function Xt_Create_Managed_Widget
--		    (Name : in String;
--		     Of_Class : in Widget_Class;
--		     Parent : in Widget;
--		     Args : in Xt_Arg_List := Null_Xt_Arg_List) return Widget;
--
--	-- XtSetMappedWhenManaged
--	procedure Xt_Set_Mapped_When_Managed
--		     (W : in Widget; Map_When_Managed : in Boolean);
--
--	-- XtMapWidget
--	procedure Xt_Map_Widget (W : in Widget);
--
--	-- XtUnmapWidget
--	procedure Xt_Unmap_Widget (W : in Widget);
--
--	-- XtRealizeWidget
--	procedure Xt_Realize_Widget (W : in Widget);
--
--	-- XtUnrealizeWidget
--	procedure Xt_Unrealize_Widget (W : in Widget);
--
--	-- XtDestroyWidget
--	procedure Xt_Destroy_Widget (W : in Widget);

	-- XtCreateWindow
	procedure Xt_Create_Window (W : in Widget;
				    Win_Class : in X_Lib.Window_Class;
				    The_Visual : in X_Lib.Visual;
				    Value_Mask : in Xt_Value_Mask;
				    Attributes : in X_Set_Window_Attributes);

--	-- XtIsRealized
--	function Xt_Is_Realized (W : in Widget) return Boolean;
--
--	-- XtDisplay
--	function Xt_Display (W : in Widget) return X_Lib.Display;
--
--	-- XtParent
--	function Xt_Parent (W : in Widget) return Widget;
--
--	-- XtScreen
--	function Xt_Screen (W : in Widget) return X_Lib.Screen;
--
--	-- XtWindow
--	function Xt_Window (W : in Widget) return X_Lib.Window;

	procedure Xt_Exit_Toolkit;

--	-- new for R4
--	-- XtAppSetFallbackResources
--	procedure Xt_App_Set_Fallback_Resources
--		     (App_Context : in Xt_App_Context;
--		      Specification_List : in Xt_String_List);
    end Xt_Instance_Management;

--    package Xt_Composite_Management is
--	-- XtIsComposite
--	function Xt_Is_Composite (W : in Widget) return Boolean;
--
--	-- XtManageChildren
--	procedure Xt_Manage_Children (Wlist : in Xt_Widget_List);
--
--	-- XtManageChild
--	procedure Xt_Manage_Child (Child : in Widget);
--
--	-- XtUnmanageChildren
--	procedure Xt_Unmanage_Children (Wlist : in Xt_Widget_List);
--
--	-- XtUnmanageChild
--	procedure Xt_Unmanage_Child (W : in Widget);
--
--	-- XtIsManaged
--	function Xt_Is_Managed (W : in Widget) return Boolean;
--    end Xt_Composite_Management;

    package Xt_Geometry_Management is
	-- Xt_Dont_Change and Cw_Query_Only are constants added by the toolkit:
	Xt_Sm_Dont_Change : constant Xt_Stack_Mode := Create_Constant (5);
	Xt_Cw_Query_Only : constant Xt_Geometry_Mask :=
	   Create_Constant (2 ** 7);

	Null_Rectangle : constant Rectangle := (0, 0, 0, 0);

	-- XtMakeGeometryRequest
	procedure Xt_Make_Geometry_Request
		     (W : in Widget;
		      Request : in Xt_Widget_Geometry;
		      Reply_Return : out Xt_Widget_Geometry;
		      Result : out Xt_Geometry_Result);

	-- XtQueryGeometry
	procedure Xt_Query_Geometry (W : in Widget;
				     Intended : in Xt_Widget_Geometry;
				     Preferred_Return : out Xt_Widget_Geometry;
				     Result : out Xt_Geometry_Result);

	-- XtMakeResizeRequest
	procedure Xt_Make_Resize_Request
		     (W : in Widget;
		      Width, Height : in Dimension;
		      Width_Return, Height_Return : out Dimension;
		      Result : out Xt_Geometry_Result);

--	-- XtMoveWidget
--	procedure Xt_Move_Widget (W : in Widget; X, Y : in Position);

	-- XtResizeWidget
	procedure Xt_Resize_Widget (W : in Widget;
				    Width, Height, Border_Width : in Dimension);

--	-- XtConfigureWidget
--	procedure Xt_Configure_Widget
--		     (W : in Widget;
--		      X, Y : in Position;
--		      Width, Height, Border_Width : in Dimension);
--
--	-- XtResizeWindow
--	procedure Xt_Resize_Window (W : in Widget);
--
--	-- XtTranslateCoords
--	procedure Xt_Translate_Coords
--		     (W : in Widget;
--		      X, Y : in Position;
--		      Root_X_Return, Root_Y_Return : out Position);
    end Xt_Geometry_Management;

    package Xt_Popup_Management is
--	type Xt_Grab_Kind is
--	   (Xt_Grab_None, Xt_Grab_Nonexclusive, Xt_Grab_Exclusive);
--	for Xt_Grab_Kind'Size use 32;  -- C uses enum which is 32 bits.

	type Xt_Popdown_Id_Rec is
	    record
		Shell_Widget : Widget;
		Enable_Widget : Widget;
	    end record;
	type Xt_Popdown_Id is access Xt_Popdown_Id_Rec;

--	-- XtCreatePopupShell
--	function Xt_Create_Popup_Shell
--		    (Name : in String;
--		     Of_Class : in Widget_Class;
--		     Parent : in Widget;
--		     Args : in Xt_Arg_List := Null_Xt_Arg_List) return Widget;
--
--	-- XtPopup
--	procedure Xt_Popup (Popup_Shell : in Widget;
--			    Grab_Kind : in Xt_Grab_Kind);

	-- XtMenuPopupAction
	procedure Xt_Menu_Popup_Action (W : in Widget;
					Event : in X_Event;
					Params : in Xt_String_List);

	-- new for R4
	-- XtPopupSpringLoaded
	procedure Xt_Popup_Spring_Loaded (Popup_Shell : in Widget);

--	-- XtPopdown
--	procedure Xt_Popdown (Popup_Shell : in Widget);
--
    end Xt_Popup_Management;

--    -- operations on the widget class hierarchy
--    package Xt_Class_Management is
--	-- XtClass
--	function Xt_Class (W : in Widget) return Widget_Class;
--
--	-- XtSuperclass
--	function Xt_Superclass (W : in Widget) return Widget_Class;
--
--	-- XtIsSubclass
--	function Xt_Is_Subclass
--		    (W : in Widget; Wc : in Widget_Class) return Boolean;
--
--	-- XtCheckSubclass
--	procedure Xt_Check_Subclass
--		     (W : in Widget; Wc : in Widget_Class; Message : in String);
--
--	-- XtIsShell
--	function Xt_Is_Shell (W : in Widget) return Boolean;
--
--	-- XtIsApplicationShell
--	function Xt_Is_Application_Shell (Object : in Widget) return Boolean;
--
--	-- XtIsOverrideShell
--	function Xt_Is_Override_Shell (Object : in Widget) return Boolean;
--
--	-- XtIsTopLevelShell
--	function Xt_Is_Toplevel_Shell (Object : in Widget) return Boolean;
--
--	-- XtIsTransientShell
--	function Xt_Is_Transient_Shell (Object : in Widget) return Boolean;
--
--	-- XtIsVendorShell
--	function Xt_Is_Vendor_Shell (Object : in Widget) return Boolean;
--
--	-- XtIsWMShell
--	function Xt_Is_Wm_Shell (Object : in Widget) return Boolean;
--    end Xt_Class_Management;

    package Xt_Callbacks is
	-- The external Xt_Callback_Lists:
	type Xt_Callback_Rec is
	    record
		Callback : Xt_Callback_Proc;
		Closure : Xt_Pointer;
	    end record;
	type Xt_Callback_List is array (Natural range <>) of Xt_Callback_Rec;
	type Xt_Callback_List_Ptr is access Xt_Callback_List;
	Null_Xt_Callback_List : Xt_Callback_List (1 .. 0);

	type Xt_Callback_Status is
	   (Xt_Callback_No_List, Xt_Callback_Has_None, Xt_Callback_Has_Some);

	-- internal representation of compiled callbacks
	type Xt_Callback_Struct is private;
	type Xt_Callback_Struct_Ptr is access Xt_Callback_Struct;
	type Ptr_Xt_Callback_Struct_Ptr is access Xt_Callback_Struct_Ptr;

	-- the internal Xt_Callback_Lists
	type Callback_Rec is private;
	type Xt_Callback_Ptr is access Callback_Rec;

--	-- XtAddCallback
--	procedure Xt_Add_Callback (Object : in Widget;
--				   Callback_Name : in String;
--				   Callback : in Xt_Callback_Proc;
--				   Client_Data : in Xt_Pointer);

	procedure Xt_Add_Callback (Object : in Widget;
				   Callback_Name : in String;
				   Callback : in Xt_Callback_Proc;
				   Client_Data : in Widget);

	procedure Xt_Add_Callback (Object : in Widget;
				   Callback_Name : in String;
				   Callback : in Xt_Callback_Proc;
				   Client_Data : in integer);

	-- XtAddCallbacks
	procedure Xt_Add_Callbacks (Object : in Widget;
				    Callback_Name : in String;
				    Callbacks : in Xt_Callback_List);

--	-- XtRemoveCallback
--	procedure Xt_Remove_Callback (Object : in Widget;
--				      Callback_Name : in String;
--				      Callback : in Xt_Callback_Proc;
--				      Client_Data : in Xt_Pointer);

	-- XtRemoveCallbacks
	procedure Xt_Remove_Callbacks (Object : in Widget;
				       Callback_Name : in String;
				       Callbacks : in Xt_Callback_List);

	-- XtRemoveAllCallbacks
	procedure Xt_Remove_All_Callbacks
		     (Object : in Widget; Callback_Name : in String);

	-- XtCallCallbacks
	procedure Xt_Call_Callbacks (Object : in Widget;
				     Callback_Name : in String;
				     Client_Data : in Xt_Pointer);

	-- new for R4
	-- XtCallCallbackList
	procedure Xt_Call_Callback_List (Object : in Widget;
					 Callbacks : in Xt_Callback_List;
					 Call_Data : in Xt_Pointer);

	-- XtHasCallbacks
	function Xt_Has_Callbacks (Object : in Widget;
				   Callback_Name : in String)
				  return Xt_Callback_Status;

	-- XtCallbackExclusive
	procedure Xt_Callback_Exclusive (Object : in Widget;
					 Client_Data : in Xt_Pointer;
					 Call_Data : in Xt_Pointer);

	-- XtCallbackNone
	procedure Xt_Callback_None (Object : in Widget;
				    Client_Data : in Xt_Pointer;
				    Call_Data : in Xt_Pointer);

	-- XtCallbackNoneExclusive
	procedure Xt_Callback_None_Exclusive (Object : in Widget;
					      Client_Data : in Xt_Pointer;
					      Call_Data : in Xt_Pointer);

	-- XtCallbackPopdown
	procedure Xt_Callback_Popdown (Object : in Widget;
				       Client_Data : in Xt_Pointer;
				       Call_Data : in Xt_Pointer);
    private
	type Callback_Rec is
	    record
		Next : Xt_Callback_Ptr;
		The_Widget : Widget;
		Callback : Xt_Callback_Proc;
		Closure : Xt_Pointer;
	    end record;

	-- combined representation
	type Xt_Callback_Struct is
	    record
		External_Form : Xt_Callback_List_Ptr;
		Internal_Form : Xt_Callback_Ptr;
	    end record;
    end Xt_Callbacks;

    package Xt_Event_Management is
	function To_Event_Mask is
	   new Unchecked_Conversion (Integer, Event_Mask);

	type Xt_Event_Table is private;

	Null_Event_Table : constant Xt_Event_Table;

	Xt_All_Events : constant Event_Mask := To_Event_Mask (-1);

	-- Xt types.
	type Xt_Input_Mask is new X_Mask_Type;

	type Xt_List_Position is (Xt_List_Head, Xt_List_Tail);
	for Xt_List_Position'Size use 32;

	Xt_Null_Input_Mask : constant Xt_Input_Mask :=
	   Xt_Input_Mask (Null_X_Mask);
	Xt_Im_Xevent : constant Xt_Input_Mask := Create_Constant (2 ** 0);
	Xt_Im_Timer : constant Xt_Input_Mask := Create_Constant (2 ** 1);
	Xt_Im_Alternate_Input : constant Xt_Input_Mask :=
	   Create_Constant (2 ** 2);
	Xt_Im_All : constant Xt_Input_Mask :=
	   Xt_Im_Xevent or Xt_Im_Timer or Xt_Im_Alternate_Input;

	Xt_Input_Read_Mask : constant Xt_Input_Mask := Create_Constant (2 ** 0);
	Xt_Input_Write_Mask : constant Xt_Input_Mask :=
	   Create_Constant (2 ** 1);
	Xt_Input_Except_Mask : constant Xt_Input_Mask :=
	   Create_Constant (2 ** 2);

	-- Xt_Input_Mask is boolean bit mask
	-- for: XtIMXEvent,
	--      XtIMTimer, and
	--      XtIMAlternateInput

	-- X types.
	subtype Interval_Type is X_Lib.Time;

	-- XtAppAddInput
	function Xt_App_Add_Input
		    (App_Context : in Xt_App_Context;
		     Source : in Device;
		     Condition : in Xt_Pointer;
		     Proc : in Xt_Input_Callback_Proc;
		     Client_Data : in Xt_Pointer) return Xt_Input_Id;

	-- XtAddInput
	function Xt_Add_Input (Source : in Device;
			       Condition : in Xt_Pointer;
			       Proc : in Xt_Input_Callback_Proc;
			       Client_Data : in Xt_Pointer) return Xt_Input_Id;

	-- XtRemoveInput
	procedure Xt_Remove_Input (Id : in Xt_Input_Id);

	-- XtAppAddTimeOut
	function Xt_App_Add_Time_Out
		    (App_Context : in Xt_App_Context;
		     Interval : in Interval_Type;
		     Proc : in Xt_Timer_Callback_Proc;
		     Client_Data : in Xt_Pointer) return Xt_Interval_Id;

	-- XtAddTimeOut
	function Xt_Add_Time_Out
		    (Interval : in Interval_Type;
		     Proc : in Xt_Timer_Callback_Proc;
		     Closure : in Xt_Pointer) return Xt_Interval_Id;

	-- XtRemoveTimeOut
	procedure Xt_Remove_Time_Out (Id : in Xt_Interval_Id);

	-- XtAddGrab
	procedure Xt_Add_Grab (W : in Widget;
			       Exclusive, Spring_Loaded : in Boolean);

	-- XtRemoveGrab
	procedure Xt_Remove_Grab (W : in Widget);

	-- XtGrabButton
	procedure Xt_Grab_Button
		     (W : in Widget;
		      Button : in X_Lib.Events.Event_Type;
		      Modifier : in Modifiers;
		      Owner_Events : in Boolean;
		      Grab_Events : in X_Lib.Events.Event_Mask_Type;
		      Pointer_Mode : in X_Lib.Window_Manager.Grab_Mode;
		      Keyboard_Mode : in X_Lib.Window_Manager.Grab_Mode;
		      Confine_To : in X_Lib.Window;
		      Cursor_Id : in X_Lib.Cursors.Cursor);

	-- XtGrabKey
	procedure Xt_Grab_Key
		     (W : in Widget;
		      Key : in X_Lib.Keyboard.Key_Code;
		      Modifier : in Modifiers;
		      Owner_Events : in Boolean;
		      Pointer_Mode : in X_Lib.Window_Manager.Grab_Mode;
		      Keyboard_Mode : in X_Lib.Window_Manager.Grab_Mode);

	-- XtGrabKeyboard
	function Xt_Grab_Keyboard
		    (W : in Widget;
		     Owner_Events : in Boolean;
		     Pointer_Mode : in X_Lib.Window_Manager.Grab_Mode;
		     Keyboard_Mode : in X_Lib.Window_Manager.Grab_Mode;
		     Grab_Time : in X_Lib.Time)
		    return X_Lib.Window_Manager.Grab_Reply_Status;

	-- XtGrabPointer
	function Xt_Grab_Pointer
		    (W : in Widget;
		     Owner_Events : in Boolean;
		     Grab_Events : in X_Lib.Events.Event_Mask_Type;
		     Pointer_Mode : in X_Lib.Window_Manager.Grab_Mode;
		     Keyboard_Mode : in X_Lib.Window_Manager.Grab_Mode;
		     Confine_To : in X_Lib.Window;
		     Cursor_Id : in X_Lib.Cursors.Cursor;
		     Grab_Time : in X_Lib.Time)
		    return X_Lib.Window_Manager.Grab_Reply_Status;

	-- XtUngrabButton
	procedure Xt_Ungrab_Button (W : in Widget;
				    Button : in X_Lib.Events.Button_Name_Type;
				    Modifier : in Modifiers);

	-- XtUngrabKey
	procedure Xt_Ungrab_Key (W : in Widget;
				 Key : in X_Lib.Keyboard.Key_Code;
				 Modifier : in Modifiers);

	-- XtUngrabKeyboard
	procedure Xt_Ungrab_Keyboard (W : in Widget;
				      Ungrab_Time : in X_Lib.Time);

	-- XtUngrabPointer
	procedure Xt_Ungrab_Pointer (W : in Widget;
				     Ungrab_Time : in X_Lib.Time);

	-- XtGetMultiClickTime
	function Xt_Get_Multi_Click_Time
		    (The_Display : in X_Lib.Display) return X_Lib.X_Integer;

	-- XtSetMultiClickTime
	procedure Xt_Set_Multi_Click_Time (The_Display : in X_Lib.Display;
					   Timestamp : in X_Lib.X_Integer);

	-- XtSetKeyboardFocus
	procedure Xt_Set_Keyboard_Focus (Subtree, Descendant : in Widget);

	-- XtCallAcceptFocus
	function Xt_Call_Accept_Focus
		    (W : in Widget; T : in X_Lib.Time) return Boolean;

	-- XtAppPending
	function Xt_App_Pending (App_Context : in Xt_App_Context;
				 Block : in Boolean := Get_Options.Block)
				return Xt_Input_Mask;

	-- XtPending
	function Xt_Pending (Block : in Boolean := Get_Options.Block)
			    return Xt_Input_Mask;

	-- XtAppPeekEvent
	procedure Xt_App_Peek_Event (App_Context : in Xt_App_Context;
				     Event_Return : out X_Event;
				     Event_Found : out Boolean);

	-- XtPeekEvent
	procedure Xt_Peek_Event (Event_Return : out X_Event;
				 Event_Found : out Boolean);

--	-- XtAppNextEvent
--	procedure Xt_App_Next_Event (App_Context : in Xt_App_Context;
--				     Event_Return : out X_Event;
--				     Block : in Boolean := Get_Options.Block);

	-- XtNextEvent
	procedure Xt_Next_Event (Event_Return : out X_Event;
				 Block : in Boolean := Get_Options.Block);

	-- XtAppProcessEvent
	procedure Xt_App_Process_Event
		     (App_Context : in Xt_App_Context; Mask : in Xt_Input_Mask);

	-- XtProcessEvent
	procedure Xt_Process_Event (Mask : in Xt_Input_Mask);

--	-- XtDispatchEvent
--	function Xt_Dispatch_Event
--		    (Event : in X_Event;
--		     Block : in Boolean := Get_Options.Block) return Boolean;
--
--	-- XtAppMainLoop
--	procedure Xt_App_Main_Loop
--		     (App_Context : in Xt_App_Context;
--		      Block : in Boolean := Get_Options.Block;
--		      Poll_Delay : in Duration := Get_Options.Poll_Delay);

	-- XtMainLoop
	procedure Xt_Main_Loop (Block : in Boolean := Get_Options.Block;
				Poll_Delay : in Duration :=
				   Get_Options.Poll_Delay);

--	-- XtAppAddWorkProc
--	function Xt_App_Add_Work_Proc
--		    (App_Context : in Xt_App_Context;
--		     Proc : in Xt_Work_Proc;
--		     Client_Data : in Xt_Pointer) return Xt_Work_Proc_Id;
--
--	-- XtAddWorkProc
--	function Xt_Add_Work_Proc
--		    (Proc : in Xt_Work_Proc; Client_Data : in Xt_Pointer)
--		    return Xt_Work_Proc_Id;
--
--	-- XtRemoveWorkProc
--	procedure Xt_Remove_Work_Proc (Id : in Xt_Work_Proc_Id);

	-- XtAddEventHandler
	procedure Xt_Add_Event_Handler (W : in Widget;
					An_Event_Mask : in Event_Mask;
					Non_Maskable : in Boolean;
					Proc : in Xt_Event_Handler;
					Client_Data : in Xt_Pointer);

	-- new for R4
	-- XtInsertEventHandler
	procedure Xt_Insert_Event_Handler (Widget_Id : in Widget;
					   Mask : in Events.Event_Mask_Type;
					   Other : in Boolean;
					   Proc : in Xt_Event_Handler;
					   Closure : in Xt_Pointer;
					   Position : in Xt_List_Position);

	-- new for R4
	-- XtInsertRawEventHandler
	procedure Xt_Insert_Raw_Event_Handler (Widget_Id : in Widget;
					       Mask : in Events.Event_Mask_Type;
					       Other : in Boolean;
					       Proc : in Xt_Event_Handler;
					       Closure : in Xt_Pointer;
					       Position : in Xt_List_Position);

	-- XtRemoveEventHandler
	procedure Xt_Remove_Event_Handler (W : in Widget;
					   An_Event_Mask : in Event_Mask;
					   Non_Maskable : in Boolean;
					   Proc : in Xt_Event_Handler;
					   Client_Data : in Xt_Pointer);

	-- XtAddRawEventHandler
	procedure Xt_Add_Raw_Event_Handler (W : in Widget;
					    An_Event_Mask : in Event_Mask;
					    Non_Maskable : in Boolean;
					    Proc : in Xt_Event_Handler;
					    Client_Data : in Xt_Pointer);

	-- XtRemoveRawEventHandler
	procedure Xt_Remove_Raw_Event_Handler (W : in Widget;
					       An_Event_Mask : in Event_Mask;
					       Non_Maskable : in Boolean;
					       Proc : in Xt_Event_Handler;
					       Client_Data : in Xt_Pointer);

	-- XtBuildEventMask
	function Xt_Build_Event_Mask (W : in Widget) return Event_Mask;

	-- XtAddExposureToRegion
	procedure Xt_Add_Exposure_To_Region
		     (The_Event : in X_Event; The_Region : in X_Region);

	-- new for R4
	-- XtLastTimestampProcessed
	function Xt_Last_Timestamp_Processed
		    (The_Display : in X_Lib.Display) return X_Lib.Time;

	-- XtWindowToWidget
	function Xt_Window_To_Widget
		    (The_Display : in X_Lib.Display;
		     The_Window : in X_Lib.Window) return Widget;
    private
	type Xt_Event_Table is new Xt_Pointer;

	Null_Event_Table : constant Xt_Event_Table :=
	   Xt_Event_Table (Null_Xt_Pointer);
    end Xt_Event_Management;

    package Xt_Resource_Management is

--	type Xt_Convert_Arg_List is array (Natural range <>) of Xt_Convert_Arg;
--	type Xt_Convert_Arg_List_Ptr is access Xt_Convert_Arg_List;
--	Null_Xt_Convert_Arg_List : Xt_Convert_Arg_List (1 .. 0);

	type Xrm_Value_Ptr_List is array (Natural range <>) of Xrm_Value_Ptr;
	Null_Xrm_Value_Ptr_List : Xrm_Value_Ptr_List (1 .. 0);

	-- XtDatabase
	function Xt_Database
		    (The_Display : in X_Lib.Display) return Xrm_Database;

--	function Xt_Screen_Database (Scr : in X_Lib.Screen) return Xrm_Database;
--
--	function To_Xt_String is
--	   new Unchecked_Conversion (Xt_Pointer, Xt_String);
--
--	-- Functions to set up various argument lists follow.  The first set are
--	-- convenient to use, but allocate memory for all parameters of
--	-- type STRING.  Use the Free routine in package
--	-- X_System_Utilities.String_Conversion_Utilities on the Arg components
--	-- to free such strings after they are no longer needed.
--
--	-- XtSetArg
--	procedure Xt_Set_Arg (Arg : in out Xt_Arg;
--			      Name : in String;
--			      Value : in Xt_Pointer);
--	-- XtSetArg
--	procedure Xt_Set_Arg (Arg : in out Xt_Arg;
--			      Name : in String;
--			      Value : in Xt_Arg_Val);
--
--	-- XtSetArg
--	procedure Xt_Set_Arg
--		     (Arg : in out Xt_Arg; Name : in String; Value : in String);

	-- XtSetArg
	procedure Xt_Set_Arg (Arg : in out Xt_Arg;
			      Name : in String;
			      Value : in X_Lib.String_8);

	-- XtSetArg
	procedure Xt_Set_Arg (Arg : in out Xt_Arg;
			      Name : in String;
			      Value : in X_Lib.Fonts.String_16);

--	-- XtSetArg
--	procedure Xt_Set_Arg (Arg : in out Xt_Arg;
--			      Name : in String;
--			      Value : in Boolean);

	-- Overloadings of Xt_Set_Arg below do not allocate memory for strings.
	-- They require the user to pass in persistent strings, thereby
	-- putting the onus on the user to free such strings after they are
	-- no longer needed.

--	-- XtSetArg
--	procedure Xt_Set_Arg (Arg : in out Xt_Arg;
--			      Name : in Xt_String;
--			      Value : in Xt_Pointer);
--	-- XtSetArg
--	procedure Xt_Set_Arg (Arg : in out Xt_Arg;
--			      Name : in Xt_String;
--			      Value : in Xt_Arg_Val);
--
--	-- XtSetArg
--	procedure Xt_Set_Arg (Arg : in out Xt_Arg;
--			      Name : in Xt_String;
--			      Value : in Boolean);
--
--	-- XtSetArg
--	procedure Xt_Set_Arg (Arg : in out Xt_Arg;
--			      Name : in Xt_Pointer;
--			      Value : in Xt_Pointer);
--	-- XtSetArg
--	procedure Xt_Set_Arg (Arg : in out Xt_Arg;
--			      Name : in Xt_Pointer;
--			      Value : in Xt_Arg_Val);
--
--	-- XtSetArg
--	procedure Xt_Set_Arg (Arg : in out Xt_Arg;
--			      Name : in Xt_Pointer;
--			      Value : in Boolean);
--
--	-- The following generic subprograms can be instantiated for any
--	-- type T whose 'SIZE is equal to that of Xt_Arg_Val'SIZE.  This
--	-- allows any user-defined data type to be used as the "Value"
--	-- component of the "Arg" parameter.  The Size_Incompatible exception
--	-- is raised on any call to an instance where the 'SIZEs differ.
--
--	generic
--	    type T is private;
--	procedure Xt_Set_Arg_Generic
--		     (Arg : in out Xt_Arg; Name : in String; Value : in T);
--
--	generic
--	    type T is private;
--	procedure Xt_Set_Arg_Generic_No_Malloc
--		     (Arg : in out Xt_Arg;
--		      Name : in Xt_String;  -- No string allocation performed.
--		      Value : in T);

	-- XtMergeArgLists
	function Xt_Merge_Arg_Lists
		    (Args1, Args2 : in Xt_Arg_List) return Xt_Arg_List_Ptr;

--	-- XtGetResourceList
--	procedure Xt_Get_Resource_List
--		     (Object_Class : in Widget_Class;
--		      Resources_Return : out Xt_Resource_List);
--
--	-- new for R4
--	-- XtGetConstraintResourceList
--	procedure Xt_Get_Constraint_Resource_List
--		     (Object_Class : in Widget_Class;
--		      Resources_Return : out Xt_Resource_List);

	-- XtGetSubresources
	procedure Xt_Get_Subresources
		     (Object : in out Widget;
		      Base : in Xt_Pointer;
		      Name : in String;
		      Class : in String;
		      Resources : in Xt_Resource_Array;
		      Args : in Xt_Arg_List := Null_Xt_Arg_List);

	-- XtGetApplicationNameAndClass
	procedure Xt_Get_Application_Name_And_Class
		     (The_Display : in X_Lib.Display;
		      Name_Return : in out Xt_String;
		      Class_Return : in out Xt_String);

	-- XtGetApplicationResources
	procedure Xt_Get_Application_Resources
		     (W : in out Widget;
		      Base : in Xt_Pointer;
		      Resources : in Xt_Resource_Array;
		      Args : in Xt_Arg_List := Null_Xt_Arg_List);

	procedure Xt_String_Conversion_Warning (Src, Dst_Type : in String);

--	-- new for R4
--	-- XtDisplayStringConversionWarning
--	procedure Xt_Display_String_Conversion_Warning
--		     (The_Display : in X_Lib.Display;
--		      Src, Dst_Type : in String);

	-- XtAddConverter
	procedure Xt_Add_Converter (From_Type, To_Type : in String;
				    Converter : in Xt_Converter;
				    Converter_Args : in Xt_Convert_Arg_List);

	-- XtAppAddConverter
	procedure Xt_App_Add_Converter
		     (App_Context : in Xt_App_Context;
		      From_Type, To_Type : in String;
		      Converter : in Xt_Converter;
		      Converter_Args : in Xt_Convert_Arg_List);

--	-- XtAppSetTypeConverter
--	procedure Xt_App_Set_Type_Converter
--		     (App_Context : in Xt_App_Context;
--		      From_Type : in String;
--		      To_Type : in String;
--		      Converter : in Xt_Type_Converter;
--		      Converter_Args : in Xt_Convert_Arg_List;
--		      Cache_Type : in Xt_Cache_Type;
--		      Destructor : in Xt_Destructor);
--
--	-- XtSetTypeConverter
--	procedure Xt_Set_Type_Converter (From_Type : in String;
--					 To_Type : in String;
--					 Converter : in Xt_Type_Converter;
--					 Convert_Args : in Xt_Convert_Arg_List;
--					 Cache_Type : in Xt_Cache_Type;
--					 Destructor : in Xt_Destructor);

	-- XtCallConverter
	function Xt_Call_Converter
		    (The_Display : in X_Lib.Display;
		     Converter : in Xt_Type_Converter;
		     Args : in Xrm_Value_List;
		     From : in Xrm_Value;
		     To_In_Out : in Xrm_Value;
		     Cache_Ref_Return : in Xt_Cache_Ref) return Boolean;

	-- XtConvert
	procedure Xt_Convert (W : in Widget;
			      From_Type : in String;
			      From : in Xrm_Value;
			      To_Type : in String;
			      To : in out Xrm_Value);

	-- XtDirectConvert
	procedure Xt_Direct_Convert
		     (Converter : in Xt_Converter;
		      Args : in Xrm_Value_List := Null_Xrm_Value_List;
		      From : in Xrm_Value;
		      To_Return : out Xrm_Value);

--	-- XtConverterAndStore
--	function Xt_Convert_And_Store (Object : in Widget;
--				       From_Type : in String;
--				       From : in Xrm_Value;
--				       To_Type : in String;
--				       To_In_Out : in Xrm_Value) return Boolean;
--
--	-- XtGetValues
--	procedure Xt_Get_Values (W : in Widget; Args : in out Xt_Arg_List);

	-- XtGetSubvalues
	procedure Xt_Get_Subvalues (Base : in Xt_Pointer;
				    Resources : in Xt_Resource_Array;
				    Args : in out Xt_Arg_List);

--	-- XtSetValues
--	procedure Xt_Set_Values (W : in out Widget; Args : in Xt_Arg_List);

	-- XtSetSubvalues
	procedure Xt_Set_Subvalues (Base : in Xt_Pointer;
				    Resources : in Xt_Resource_Array;
				    Args : in Xt_Arg_List);

	-- new for R4
	-- XtAppReleaseCacheRefs
	procedure Xt_App_Release_Cache_Refs
		     (App : in Xt_App_Context; Refs : in Xt_Cache_Ref);

	-- new for R4
	-- XtCallbackReleaseCacheRefList
	procedure Xt_Callback_Release_Cache_Ref_List
		     (Object : in Widget;
		      Client_Data : in Xt_Pointer;
		      Call_Data : in Xt_Pointer);

	-- new for R4
	-- XtCallbackReleaseCacheRef
	procedure Xt_Callback_Release_Cache_Ref (Object : in Widget;
						 Client_Data : in Xt_Pointer;
						 Call_Data : in Xt_Pointer);

	function Xt_Number (Arr : in Xt_Pointer) return Cardinal;

	function Xt_Offset
		    (Pointer_Type : in Xt_Pointer; Field_Name : in String)
		    return Cardinal;

	function Xt_Offset_Of
		    (Structure_Type : in Xt_Pointer; Field_Name : in String)
		    return Cardinal;

	procedure Xt_Cvt_String_To_Accelerator_Table
		     (Dpy : in X_Lib.Display;
		      Args : in out Xrm_Value_List;
		      From_Val : in Xrm_Value;
		      To_Val : in Xrm_Value;
		      Closure_Ret : out Xt_Pointer;
		      Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Atom (Dpy : in X_Lib.Display;
					 Args : in out Xrm_Value_List;
					 From_Val : in Xrm_Value;
					 To_Val : in Xrm_Value;
					 Closure_Ret : in Xt_Pointer;
					 Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Boolean (Dpy : in X_Lib.Display;
					    Args : in out Xrm_Value_List;
					    From_Val : in Xrm_Value;
					    To_Val : in Xrm_Value;
					    Closure_Ret : in Xt_Pointer;
					    Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Bool (Dpy : in X_Lib.Display;
					 Args : in out Xrm_Value_List;
					 From_Val : in Xrm_Value;
					 To_Val : in Xrm_Value;
					 Closure_Ret : in Xt_Pointer;
					 Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Cursor
		     (Dpy : in X_Lib.Display;
		      Args : in out Xrm_Value_List;     -- Display
		      From_Val : in Xrm_Value;
		      To_Val : in Xrm_Value;
		      Closure_Ret : in Xt_Pointer;
		      Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Dimension
		     (Dpy : in X_Lib.Display;
		      Args : in out Xrm_Value_List;     -- None
		      From_Val : in Xrm_Value;
		      To_Val : in Xrm_Value;
		      Closure_Ret : in Xt_Pointer;
		      Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Display (Dpy : in X_Lib.Display;
					    Args : in out Xrm_Value_List;     -- None
					    From_Val : in Xrm_Value;
					    To_Val : in Xrm_Value;
					    Closure_Ret : in Xt_Pointer;
					    Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_File (Dpy : in X_Lib.Display;
					 Args : in out Xrm_Value_List;     -- None
					 From_Val : in Xrm_Value;
					 To_Val : in Xrm_Value;
					 Closure_Ret : in Xt_Pointer;
					 Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Float (Dpy : in X_Lib.Display;
					  Args : in out Xrm_Value_List;     -- None
					  From_Val : in Xrm_Value;
					  To_Val : in Xrm_Value;
					  Closure_Ret : in Xt_Pointer;
					  Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Font (Dpy : in X_Lib.Display;
					 Args : in out Xrm_Value_List;     -- Display
					 From_Val : in Xrm_Value;
					 To_Val : in Xrm_Value;
					 Closure_Ret : in Xt_Pointer;
					 Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Font_Set
		     (Dpy : in X_Lib.Display;
		      Args : in out Xrm_Value_List;     -- Display, locale
		      From_Val : in Xrm_Value;
		      To_Val : in Xrm_Value;
		      Closure_Ret : in Xt_Pointer;
		      Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Font_Struct
		     (Dpy : in X_Lib.Display;
		      Args : in out Xrm_Value_List;     -- Display
		      From_Val : in Xrm_Value;
		      To_Val : in Xrm_Value;
		      Closure_Ret : in Xt_Pointer;
		      Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Int (Dpy : in X_Lib.Display;
					Args : in out Xrm_Value_List;     -- none
					From_Val : in Xrm_Value;
					To_Val : in Xrm_Value;
					Closure_Ret : in Xt_Pointer;
					Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Initial_State
		     (Dpy : in X_Lib.Display;
		      Args : in out Xrm_Value_List;     -- none
		      From_Val : in Xrm_Value;
		      To_Val : in Xrm_Value;
		      Closure_Ret : in Xt_Pointer;
		      Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Pixel
		     (Dpy : in X_Lib.Display;
		      Args : in out Xrm_Value_List;     -- Screen, Colormap
		      From_Val : in Xrm_Value;
		      To_Val : in Xrm_Value;
		      Closure_Ret : in Xt_Pointer;
		      Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Short (Dpy : in X_Lib.Display;
					  Args : in out Xrm_Value_List;     -- none
					  From_Val : in Xrm_Value;
					  To_Val : in Xrm_Value;
					  Closure_Ret : in Xt_Pointer;
					  Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Position
		     (Dpy : in X_Lib.Display;
		      Args : in out Xrm_Value_List;     -- none
		      From_Val : in Xrm_Value;
		      To_Val : in Xrm_Value;
		      Closure_Ret : in Xt_Pointer;
		      Ret_Val : out Boolean) renames Xt_Cvt_String_To_Short;

	procedure Xt_Cvt_String_To_Translation_Table
		     (Dpy : in X_Lib.Display;
		      Args : in out Xrm_Value_List;     -- none
		      From_Val : in Xrm_Value;
		      To_Val : in Xrm_Value;
		      Closure_Ret : in Xt_Pointer;
		      Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Unsigned_Char
		     (Dpy : in X_Lib.Display;
		      Args : in out Xrm_Value_List;     -- none
		      From_Val : in Xrm_Value;
		      To_Val : in Xrm_Value;
		      Closure_Ret : in Xt_Pointer;
		      Ret_Val : out Boolean);

	procedure Xt_Cvt_String_To_Visual (Dpy : in X_Lib.Display;
					   Args : in out Xrm_Value_List;     -- none
					   From_Val : in Xrm_Value;
					   To_Val : in Xrm_Value;
					   Closure_Ret : in Xt_Pointer;
					   Ret_Val : out Boolean);

	procedure Xt_Cvt_Int_To_Boolean (Dpy : in X_Lib.Display;
					 Args : in out Xrm_Value_List;     -- none
					 From_Val : in Xrm_Value;
					 To_Val : in Xrm_Value;
					 Closure_Ret : in Xt_Pointer;
					 Ret_Val : out Boolean);

	procedure Xt_Cvt_Int_To_Bool (Dpy : in X_Lib.Display;
				      Args : in out Xrm_Value_List;     -- none
				      From_Val : in Xrm_Value;
				      To_Val : in Xrm_Value;
				      Closure_Ret : in Xt_Pointer;
				      Ret_Val : out Boolean);

	procedure Xt_Cvt_Int_To_Color (Dpy : in X_Lib.Display;
				       Args : in out Xrm_Value_List;     -- none
				       From_Val : in Xrm_Value;
				       To_Val : in Xrm_Value;
				       Closure_Ret : in Xt_Pointer;
				       Ret_Val : out Boolean);

	procedure Xt_Cvt_Int_To_Float (Dpy : in X_Lib.Display;
				       Args : in out Xrm_Value_List;     -- none
				       From_Val : in Xrm_Value;
				       To_Val : in Xrm_Value;
				       Closure_Ret : in Xt_Pointer;
				       Ret_Val : out Boolean);

	procedure Xt_Cvt_Int_To_Font (Dpy : in X_Lib.Display;
				      Args : in out Xrm_Value_List;     -- none
				      From_Val : in Xrm_Value;
				      To_Val : in Xrm_Value;
				      Closure_Ret : in Xt_Pointer;
				      Ret_Val : out Boolean);

	procedure Xt_Cvt_Int_To_Pixel (Dpy : in X_Lib.Display;
				       Args : in out Xrm_Value_List;     -- none
				       From_Val : in Xrm_Value;
				       To_Val : in Xrm_Value;
				       Closure_Ret : in Xt_Pointer;
				       Ret_Val : out Boolean);

	procedure Xt_Cvt_Int_To_Pixmap (Dpy : in X_Lib.Display;
					Args : in out Xrm_Value_List;     -- none
					From_Val : in Xrm_Value;
					To_Val : in Xrm_Value;
					Closure_Ret : in Xt_Pointer;
					Ret_Val : out Boolean);

	procedure Xt_Cvt_Int_To_Short (Dpy : in X_Lib.Display;
				       Args : in out Xrm_Value_List;     -- none
				       From_Val : in Xrm_Value;
				       To_Val : in Xrm_Value;
				       Closure_Ret : in Xt_Pointer;
				       Ret_Val : out Boolean);

	procedure Xt_Cvt_Int_To_Dimension (Dpy : in X_Lib.Display;
					   Args : in out Xrm_Value_List;     -- none
					   From_Val : in Xrm_Value;
					   To_Val : in Xrm_Value;
					   Closure_Ret : in Xt_Pointer;
					   Ret_Val : out Boolean)
	   renames Xt_Cvt_Int_To_Short;

	procedure Xt_Cvt_Int_To_Position (Dpy : in X_Lib.Display;
					  Args : in out Xrm_Value_List;     -- none
					  From_Val : in Xrm_Value;
					  To_Val : in Xrm_Value;
					  Closure_Ret : in Xt_Pointer;
					  Ret_Val : out Boolean)
	   renames Xt_Cvt_Int_To_Short;

	procedure Xt_Cvt_Int_To_Unsigned_Char
		     (Dpy : in X_Lib.Display;
		      Args : in out Xrm_Value_List;     -- none
		      From_Val : in Xrm_Value;
		      To_Val : in Xrm_Value;
		      Closure_Ret : in Xt_Pointer;
		      Ret_Val : out Boolean);

	-- Color converter

	procedure Xt_Cvt_Color_To_Pixel (Dpy : in X_Lib.Display;
					 Args : in out Xrm_Value_List;     -- none
					 From_Val : in Xrm_Value;
					 To_Val : in Xrm_Value;
					 Closure_Ret : in Xt_Pointer;
					 Ret_Val : out Boolean);

	procedure Xt_Cvt_Pixel_To_Color (Dpy : in X_Lib.Display;
					 Args : in out Xrm_Value_List;     -- none
					 From_Val : in Xrm_Value;
					 To_Val : in Xrm_Value;
					 Closure_Ret : in Xt_Pointer;
					 Ret_Val : out Boolean)
	   renames Xt_Cvt_Int_To_Color;
    end Xt_Resource_Management;

    package Xt_Translation_Management is
--	type Xt_Translations is private;
	type Xt_Accelerators is private;
	type Xt_Tm_Rec is private;
	type Mod_To_Keysym_Table is private;

	Null_Translations : constant Xt_Translations;
	Null_Mod_To_Keysym_Table : constant Mod_To_Keysym_Table;

--	type Xt_Action_Rec is
--	    record
--		Action_Name : Xt_String;
--		Action_Proc : Xt_Action_Proc;
--	    end record;
--
--	type Xt_Action_List is array (Natural range <>) of Xt_Action_Rec;
--	Null_Xt_Action_List : Xt_Action_List (1 .. 0);

	-- XtAddActions
	procedure Xt_Add_Actions (Actions : in Xt_Action_List);

--	-- XtAppAddActions
--	procedure Xt_App_Add_Actions (App_Context : in Xt_App_Context;
--				      Actions : in Xt_Action_List);
--
--	-- XtParseTranslationTable
--	function Xt_Parse_Translation_Table
--		    (Table : in String) return Xt_Translations;

	-- XtAugmentTranslations
	procedure Xt_Augment_Translations (W : in Widget;
					   Translations : in Xt_Translations);

--	-- XtOverrideTranslations
--	procedure Xt_Override_Translations (W : in Widget;
--					    Translations : in Xt_Translations);

	-- XtUninstallTranslations
	procedure Xt_Uninstall_Translations (W : in Widget);

	-- XtParseAcceleratorTable
	function Xt_Parse_Accelerator_Table
		    (Table : in String) return Xt_Accelerators;

	-- XtInstallAccelerators
	procedure Xt_Install_Accelerators (Destination, Source : in Widget);

	-- XtInstallAllAccelerators
	procedure Xt_Install_All_Accelerators (Destination, Source : in Widget);

	-- XtSetKeyTranslator
	procedure Xt_Set_Key_Translator
		     (The_Display : in X_Lib.Display; Proc : in Xt_Key_Proc);

	-- XtTranslateKey
	procedure Xt_Translate_Key (The_Display : in X_Lib.Display;
				    The_Keycode : in X_Lib.Keyboard.Key_Code;
				    Some_Modifiers : in Modifiers;
				    Modifiers_Return : out Modifiers;
				    Keysym_Return : out X_Lib.Keyboard.Key_Sym);

	-- XtTranslateKeycode
	procedure Xt_Translate_Keycode
		     (The_Display : in X_Lib.Display;
		      The_Keycode : in X_Lib.Keyboard.Key_Code;
		      Some_Modifiers : in Modifiers;
		      Modifiers_Return : out Modifiers;
		      Keysym_Return : out X_Lib.Keyboard.Key_Sym);

	-- XtRegisterCaseConverter
	procedure Xt_Register_Case_Converter
		     (The_Display : in X_Lib.Display;
		      Proc : in Xt_Case_Proc;
		      Start, Stop : in X_Lib.Keyboard.Key_Sym);

	-- XtConvertCase
	procedure Xt_Convert_Case
		     (The_Display : in X_Lib.Display;
		      Some_Keysym : in X_Lib.Keyboard.Key_Sym;
		      Lower_Return, Upper_Return : out X_Lib.Keyboard.Key_Sym);

	-- new for R4
	-- XtAppAddActionHook
	function Xt_App_Add_Action_Hook
		    (App : in Xt_App_Context;
		     Proc : in Xt_Action_Hook_Proc;
		     Closure : in Xt_Pointer) return Xt_Action_Hook_Id;

	-- new for R4
	-- XtRemoveActionHook
	procedure Xt_Remove_Action_Hook (Id : in Xt_Action_Hook_Id);

	procedure Xt_Get_Action_List (W : in Widget_Class;
				      Actions_Return : out Xt_Action_List);

	-- new for R4
	-- XtCallActionProc
	procedure Xt_Call_Action_Proc
		     (Widget_Id : in Widget;
		      Action : in String;
		      Event : in X_Event;
		      Params : in Xt_String_List := Null_Xt_String_List);

	-- new for R4
	-- XtGetActionKeysym
	procedure Xt_Get_Action_Keysym (Event : in X_Event;
					Modifiers_Return : in out Modifiers;
					Keysym : out X_Lib.Keyboard.Key_Sym);

	-- new for R4
	-- XtGetKeysymTable
	procedure Xt_Get_Keysym_Table
		     (The_Display : in X_Lib.Display;
		      Min_Keycode_Return : out X_Lib.Keyboard.Key_Code;
		      Keysyms_Per_Keycode_Return : out X_Lib.X_Integer;
		      Keysym : out X_Lib.Keyboard.Keyboard_Encoding_Array_Ptr);

	-- new for R4
	-- XtKeysymToKeycodeList
	procedure Xt_Keysym_To_Keycode_List
		     (The_Display : in X_Lib.Display;
		      Keysym : in X_Lib.Keyboard.Key_Sym;
		      Keycodes_Return : out X_Lib.Keyboard.Key_Code_List;
		      Keycount_Return : out Cardinal);

	-- new for R4
	-- XtRegisterGrabAction
	procedure Xt_Register_Grab_Action
		     (Action_Proc : in Xt_Action_Proc;
		      Owner_Events : in Boolean;
		      Event_Mask : in X_Configuration_Dependent.Unsigned_Int;
		      Pointer_Mode : in X_Lib.X_Integer;
		      Keyboard_Mode : in X_Lib.X_Integer);
    private
	type Xt_Translations is new Xt_Pointer;
	type Xt_Accelerators is new Xt_Translations;

	type Xt_Bound_Actions_Array is array (Natural range <>) of Xt_Pointer;
	type Xt_Bound_Actions is access Xt_Bound_Actions_Array;
	for Xt_Bound_Actions'Storage_Size use 0;
	Null_Translations : constant Xt_Translations :=
	   Xt_Translations (Null_Xt_Pointer);

	type Xt_Tm_Rec is
	    record
		Translations : Xt_Translations;
		Proc_Table : Xt_Bound_Actions;
		Current_State : Xt_Pointer;
		Last_Event_Time : X_Lib.Time;
	    end record;

	for Xt_Tm_Rec use
	    record
		Translations at 0 range 0 .. 31;
		Proc_Table at 0 range 32 .. 63;
		Current_State at 0 range 64 .. 95;
		Last_Event_Time at 0 range 96 .. 127;
	    end record;

	type Xt_Tm is access Xt_Tm_Rec;

	type Mod_To_Keysym_Table_Rec is
	    record
		Mask : Modifiers;
		Count : Natural;
		Index : Natural;
	    end record;
	type Mod_To_Keysym_Array is
	   array (Natural range <>) of Mod_To_Keysym_Table_Rec;
	type Mod_To_Keysym_Table is access Mod_To_Keysym_Array;
	for Mod_To_Keysym_Table'Storage_Size use 0;
	Null_Mod_To_Keysym_Table : constant Mod_To_Keysym_Table := null;
    end Xt_Translation_Management;

    package Xt_Selection_Management is
	-- XtAppSetSelectionTimeout
	procedure Xt_App_Set_Selection_Timeout
		     (App_Context : in Xt_App_Context; Timeout : in X_Lib.Time);

	-- XtSetSelectionTimeout
	procedure Xt_Set_Selection_Timeout (Timeout : in X_Lib.Time);

	-- XtAppGetSelectionTimeout
	function Xt_App_Get_Selection_Timeout
		    (App_Context : in Xt_App_Context) return X_Lib.Time;

	-- XtGetSelectionTimeout
	function Xt_Get_Selection_Timeout return X_Lib.Time;

	-- XtGetSelectionValue
	procedure Xt_Get_Selection_Value
		     (W : in Widget;
		      Selection : in X_Lib.Atoms.Atom;
		      Target : in X_Lib.Atoms.Atom;
		      Callback : in Xt_Selection_Callback_Proc;
		      Client_Data : in Xt_Pointer;
		      Timestamp : in X_Lib.Time);

	-- XtGetSelectionValueIncremental
	procedure Xt_Get_Selection_Value_Incremental
		     (W : in Widget;
		      Selection : in X_Lib.Atoms.Atom;
		      Target : in X_Lib.Atoms.Atom;
		      Callback : in Xt_Selection_Callback_Proc;
		      Client_Data : in Xt_Pointer;
		      Timestamp : in X_Lib.Time);

	-- XtGetSelectionValues
	procedure Xt_Get_Selection_Values
		     (W : in Widget;
		      Selection : in X_Lib.Atoms.Atom;
		      Targets : in Atom_List;
		      Callback : in Xt_Selection_Callback_Proc;
		      Client_Data : in Xt_Pointer;
		      Timestamp : in X_Lib.Time);

	-- XtGetSelectionValuesIncremental
	procedure Xt_Get_Selection_Values_Incremental
		     (W : in Widget;
		      Selection : in X_Lib.Atoms.Atom;
		      Targets : in Atom_List;
		      Callback : in Xt_Selection_Callback_Proc;
		      Client_Data : in Xt_Pointer;
		      Timestamp : in X_Lib.Time);

	-- XtOwnSelection
	function Xt_Own_Selection
		    (W : in Widget;
		     Selection : in X_Lib.Atoms.Atom;
		     Timestamp : in X_Lib.Time;
		     Convert_Proc : in Xt_Convert_Selection_Proc;
		     Lose_Selection : in Xt_Lose_Selection_Proc;
		     Done_Proc : in Xt_Selection_Done_Proc) return Boolean;

	-- XtOwnSelectionIncremental
	function Xt_Own_Selection_Incremental
		    (W : in Widget;
		     Selection : in X_Lib.Atoms.Atom;
		     Timestamp : in X_Lib.Time;
		     Convert_Callback : in Xt_Convert_Selection_Incr_Proc;
		     Lose_Callback : in Xt_Lose_Selection_Incr_Proc;
		     Done_Callback : in Xt_Selection_Done_Incr_Proc;
		     Cancel_Callback : in Xt_Cancel_Convert_Selection_Proc;
		     Client_Data : in Xt_Pointer) return Boolean;

	-- XtDisownSelection
	procedure Xt_Disown_Selection (W : in Widget;
				       Selection : in X_Lib.Atoms.Atom;
				       Time : in X_Lib.Time);

	-- new for R4
	-- XtGetSelectionRequest
	function Xt_Get_Selection_Request
		    (Widget_Id : in Widget;
		     Selection : in X_Lib.Atoms.Atom;
		     Id : in Xt_Request_Id)
		    return X_Lib.Events.Selection_Request_Event;
    end Xt_Selection_Management;
private
    type Widget is new X_Address;
    type Widget_Class is new X_Address;

    Null_Widget : constant Widget := Widget (Null_Address);
    Null_Widget_Class : constant Widget_Class := Widget_Class (Null_Address);

    function To_Xt_Pointer is new Unchecked_Conversion (Integer, Xt_Pointer);

    type Xt_App_Context is
	record
	    App : Xt_Pointer := Null_Xt_Pointer;
	end record;

    Null_Xt_App_Context : constant Xt_App_Context :=
       (App => To_Xt_Pointer (1));  -- Assuming 1 is an illegal address.
end Xt;
