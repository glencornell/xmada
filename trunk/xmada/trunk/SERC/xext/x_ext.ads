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

with X_Lib, X_Configuration_Dependent, X_Masks, X_Proto;

package X_Ext is
    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    X_Extension_Unknown : constant String := "unknown" & Ascii.Nul;
    X_Extension_Missing : constant String := "missing" & Ascii.Nul;

    package X_Iproto is
	type Int32_Array is array (Natural range <>) of
			       X_Configuration_Dependent.Int32;

	-- ********************************************************
	-- *
	-- * number of events, errors, and extension name.
	-- *

	More_Events : constant := 16#80#;
	Device_Bits : constant := 16#7F#;

	Input_Class_Bits : constant := 16#3F#;
	Mode_Bits_Shift : constant := 6;

	Num_Input_Classes : constant := 7;

	I_Events : constant := 15;
	I_Errors : constant := 5;
	Client_Req : constant := 1;

	type X_Ext_Event_Info is
	    record
		Mask : X_Lib.Events.Event_Mask_Type;
		Types : X_Configuration_Dependent.Byte;
		Word : X_Configuration_Dependent.Byte;
		Dummy : X_Configuration_Dependent.Byte;
	    end record;

	for X_Ext_Event_Info use
	    record
		Mask at 0 * Word_Size range 0 .. 31;
		Types at 1 * Word_Size range 0 .. 7;
		Word at 1 * Word_Size + 1 range 0 .. 7;
		Dummy at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type Pointer is access X_Lib.X_Character;

	type T_Mask is
	    record
		Mask : X_Lib.Events.Event_Mask_Type;
		Selection : Pointer;
	    end record;

	for T_Mask use
	    record
		Mask at 0 * Word_Size range 0 .. 31;
		Selection at 1 * Word_Size range 0 .. 31;
	    end record;

	-- Event constants used by library.

	Xi_Device_Valuator : constant := 0;
	Xi_Device_Key_Press : constant := 1;
	Xi_Device_Key_Release : constant := 2;
	Xi_Device_Button_Press : constant := 3;
	Xi_Device_Button_Release : constant := 4;
	Xi_Device_Motion_Notify : constant := 5;
	Xi_Device_Focus_In : constant := 6;
	Xi_Device_Focus_Out : constant := 7;
	Xi_Proximity_In : constant := 8;
	Xi_Proximity_Out : constant := 9;
	Xi_Device_State_Notify : constant := 10;
	Xi_Device_Mapping_Notify : constant := 11;
	Xi_Change_Device_Notify : constant := 12;
	Xi_Device_Key_State_Notify : constant := 13;
	Xi_Device_Button_State_Notify : constant := 14;

	-- Protocol request constants

	X_Get_Extension_Version : constant := 1;
	X_List_Input_Devices : constant := 2;
	X_Open_Device : constant := 3;
	X_Close_Device : constant := 4;
	X_Set_Device_Mode : constant := 5;
	X_Select_Extension_Event : constant := 6;
	X_Get_Selected_Extension_Events : constant := 7;
	X_Change_Device_Dont_Propagate_List : constant := 8;
	X_Get_Device_Dont_Propagate_List : constant := 9;
	X_Get_Device_Motion_Events : constant := 10;
	X_Change_Keyboard_Device : constant := 11;
	X_Change_Pointer_Device : constant := 12;
	X_Grab_Device : constant := 13;
	X_Ungrab_Device : constant := 14;
	X_Grab_Device_Key : constant := 15;
	X_Ungrab_Device_Key : constant := 16;
	X_Grab_Device_Button : constant := 17;
	X_Ungrab_Device_Button : constant := 18;
	X_Allow_Device_Events : constant := 19;
	X_Get_Device_Focus : constant := 20;
	X_Set_Device_Focus : constant := 21;
	X_Get_Feedback_Control : constant := 22;
	X_Change_Feedback_Control : constant := 23;
	X_Get_Device_Key_Mapping : constant := 24;
	X_Change_Device_Key_Mapping : constant := 25;
	X_Get_Device_Modifier_Mapping : constant := 26;
	X_Set_Device_Modifier_Mapping : constant := 27;
	X_Get_Device_Button_Mapping : constant := 28;
	X_Set_Device_Button_Mapping : constant := 29;
	X_Query_Device_State : constant := 30;
	X_Send_Extension_Event : constant := 31;
	X_Device_Bell : constant := 32;
	X_Set_Device_Valuators : constant := 33;
	X_Get_Device_Control : constant := 34;
	X_Change_Device_Control : constant := 35;

	-- Protocol request and reply structures.
	--
	-- GetExtensionVersion.

	type X_Get_Extension_Version_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		N_Bytes : X_Configuration_Dependent.Card16;
		Pad1 : X_Configuration_Dependent.Card8;
		Pad2 : X_Configuration_Dependent.Card8;
	    end record;

	for X_Get_Extension_Version_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		N_Bytes at 1 * Word_Size range 0 .. 15;
		Pad1 at 1 * Word_Size + 2 range 0 .. 7;
		Pad2 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Get_Extension_Version_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8;  -- X_Reply
		Rep_Types : X_Configuration_Dependent.Card8;
		-- X_GetExtensionVersion
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Major_Version : X_Configuration_Dependent.Card16;
		Minor_Version : X_Configuration_Dependent.Card16;
		Present : X_Configuration_Dependent.Bool;
		Pad1 : X_Configuration_Dependent.Card8;
		Pad2 : X_Configuration_Dependent.Card8;
		Pad3 : X_Configuration_Dependent.Card8;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Get_Extension_Version_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Major_Version at 2 * Word_Size range 0 .. 15;
		Minor_Version at 2 * Word_Size + 2 range 0 .. 15;
		Present at 3 * Word_Size range 0 .. 31;
		Pad1 at 4 * Word_Size range 0 .. 7;
		Pad2 at 4 * Word_Size + 1 range 0 .. 7;
		Pad3 at 4 * Word_Size + 2 range 0 .. 7;
		Pad01 at 5 * Word_Size range 0 .. 31;
		Pad02 at 6 * Word_Size range 0 .. 31;
		Pad03 at 7 * Word_Size range 0 .. 31;
		Pad04 at 8 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * ListInputDevices.
	-- *

	type X_List_Input_Devices_Req is
	    record
		Req_Type : X_Configuration_Dependent.
			      Card8;-- extension major code
		Req_Types : X_Configuration_Dependent.
			       Card8;-- X_ListInputDevices
		Length : X_Configuration_Dependent.Card16;
	    end record;

	for X_List_Input_Devices_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_List_Input_Devices_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8;-- X_Reply
		Rep_Types : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		N_Devices : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Card8;
		Pad2 : X_Configuration_Dependent.Card8;
		Pad3 : X_Configuration_Dependent.Card8;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
	    end record;

	for X_List_Input_Devices_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		N_Devices at 2 * Word_Size range 0 .. 7;
		Pad1 at 2 * Word_Size + 1 range 0 .. 7;
		Pad2 at 2 * Word_Size + 2 range 0 .. 7;
		Pad3 at 2 * Word_Size + 3 range 0 .. 7;
		Pad01 at 3 * Word_Size range 0 .. 31;
		Pad02 at 4 * Word_Size range 0 .. 31;
		Pad03 at 5 * Word_Size range 0 .. 31;
		Pad04 at 6 * Word_Size range 0 .. 31;
		Pad05 at 7 * Word_Size range 0 .. 31;
	    end record;

	type X_Any_Class_Info is
	    record
		Class : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card8;
		Dummy : X_Configuration_Dependent.Card8;
	    end record;

	for X_Any_Class_Info use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Dummy at 0 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Any_Class_Info_Ptr is access X_Any_Class_Info;

	type X_Device_Info is
	    record
		Types : X_Lib.Events.Event_Type;
		Id : X_Configuration_Dependent.Card8;
		Num_Classes : X_Configuration_Dependent.Card8;
		Used : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Card8;
	    end record;

	for X_Device_Info use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Id at 1 * Word_Size range 0 .. 7;
		Num_Classes at 1 * Word_Size + 1 range 0 .. 7;
		Used at 1 * Word_Size + 2 range 0 .. 7;
		Pad1 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Device_Info_Ptr is access X_Device_Info;

	type X_Key_Info is
	    record
		Class : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card8;
		Min_Key_Code : X_Lib.Keyboard.Key_Code;
		Max_Key_Code : X_Lib.Keyboard.Key_Code;
		Num_Keys : X_Configuration_Dependent.Card16;
		Pad1 : X_Configuration_Dependent.Card8;
		Pad2 : X_Configuration_Dependent.Card8;
	    end record;

	for X_Key_Info use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Min_Key_Code at 0 * Word_Size + 2 range 0 .. 7;
		Max_Key_Code at 0 * Word_Size + 3 range 0 .. 7;
		Num_Keys at 1 * Word_Size range 0 .. 15;
		Pad1 at 1 * Word_Size + 2 range 0 .. 7;
		Pad2 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Key_Info_Ptr is access X_Key_Info;

	type X_Button_Info is
	    record
		Class : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card8;
		Num_Buttons : X_Configuration_Dependent.Card16;
	    end record;

	for X_Button_Info use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Num_Buttons at 1 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Button_Info_Ptr is access X_Button_Info;

	type X_Valuator_Info is
	    record
		Class : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card8;
		Num_Axes : X_Configuration_Dependent.Card8;
		Mode : X_Configuration_Dependent.Card8;
		Motion_Buffer_Size : X_Configuration_Dependent.Card32;
	    end record;

	for X_Valuator_Info use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Num_Axes at 0 * Word_Size + 2 range 0 .. 7;
		Mode at 0 * Word_Size + 3 range 0 .. 7;
		Motion_Buffer_Size at 1 * Word_Size range 0 .. 31;
	    end record;

	type X_Valuator_Info_Ptr is access X_Valuator_Info;

	type X_Axis_Info is
	    record
		Resolution : X_Configuration_Dependent.Card32;
		Min_Value : X_Configuration_Dependent.Card32;
		Max_Value : X_Configuration_Dependent.Card32;
	    end record;

	for X_Axis_Info use
	    record
		Resolution at 0 * Word_Size range 0 .. 31;
		Min_Value at 1 * Word_Size range 0 .. 31;
		Max_Value at 2 * Word_Size range 0 .. 31;
	    end record;

	type X_Axis_Info_Ptr is access X_Axis_Info;

	-- ********************************************************
	-- *
	-- * OpenDevice.
	-- *

	type X_Open_Device_Req is
	    record
		Req_Type : X_Configuration_Dependent.
			      Card8; -- extension major code
		Req_Types : X_Configuration_Dependent.Card8;  -- X_OpenDevice
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Open_Device_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		Pad1 at 1 * Word_Size + 1 range 0 .. 7;
		Pad2 at 1 * Word_Size + 2 range 0 .. 7;
		Pad3 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Open_Device_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8;  -- X_Reply
		Rep_Types : X_Configuration_Dependent.Card8;  -- X_OpenDevice
		Sequence_Number : X_Configuration_Dependent.
				     Card16; -- X_OpenDevice
		Length : X_Configuration_Dependent.Card32;
		Num_Classes : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pad00 : X_Configuration_Dependent.Card32;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Open_Device_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Num_Classes at 2 * Word_Size range 0 .. 7;
		Pad1 at 2 * Word_Size + 1 range 0 .. 7;
		Pad2 at 2 * Word_Size + 2 range 0 .. 7;
		Pad3 at 2 * Word_Size + 3 range 0 .. 7;
		Pad00 at 3 * Word_Size range 0 .. 31;
		Pad01 at 4 * Word_Size range 0 .. 31;
		Pad02 at 5 * Word_Size range 0 .. 31;
		Pad03 at 6 * Word_Size range 0 .. 31;
		Pad04 at 7 * Word_Size range 0 .. 31;
	    end record;

	type X_Input_Class_Info is
	    record
		Class : X_Configuration_Dependent.Card8;
		Event_Type_Base : X_Configuration_Dependent.Card8;
		Dummy : X_Configuration_Dependent.Card8;
	    end record;

	for X_Input_Class_Info use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Event_Type_Base at 0 * Word_Size + 1 range 0 .. 7;
		Dummy at 0 * Word_Size + 3 range 0 .. 7;
	    end record;

	-- ********************************************************
	-- *
	-- * CloseDevice.
	-- *

	type X_Close_Device_Req is
	    record
		Req_Type : X_Configuration_Dependent.
			      Card8;-- extension major code
		Req_Types : X_Configuration_Dependent.Card8; -- X_CloseDevice
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Close_Device_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		Pad1 at 1 * Word_Size + 1 range 0 .. 7;
		Pad2 at 1 * Word_Size + 2 range 0 .. 7;
		Pad3 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	-- ********************************************************
	-- *
	-- * SetDeviceMode.
	-- *

	type X_Set_Device_Mode_Req is
	    record
		Req_Type : X_Configuration_Dependent.
			      Card8;-- extension major code
		Req_Types : X_Configuration_Dependent.Card8;-- X_SetDeviceMode
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Mode : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Set_Device_Mode_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		Mode at 1 * Word_Size + 1 range 0 .. 7;
		Pad1 at 1 * Word_Size + 2 range 0 .. 7;
		Pad2 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Set_Device_Mode_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8;
		-- extension major code
		Rep_Types : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Status : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Set_Device_Mode_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Status at 2 * Word_Size range 0 .. 7;
		Pad1 at 2 * Word_Size + 1 range 0 .. 7;
		Pad2 at 2 * Word_Size + 2 range 0 .. 7;
		Pad3 at 2 * Word_Size + 3 range 0 .. 7;
		Pad01 at 3 * Word_Size range 0 .. 31;
		Pad02 at 4 * Word_Size range 0 .. 31;
		Pad03 at 5 * Word_Size range 0 .. 31;
		Pad04 at 6 * Word_Size range 0 .. 31;
		Pad05 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * SelectExtensionEvent.
	-- *

	type X_Select_Extension_Event_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Window : X_Lib.Window;
		Count : X_Configuration_Dependent.Card16;
		Pad00 : X_Configuration_Dependent.Card16;
	    end record;

	for X_Select_Extension_Event_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Window at 1 * Word_Size range 0 .. 31;
		Count at 2 * Word_Size range 0 .. 15;
		Pad00 at 2 * Word_Size + 2 range 0 .. 15;
	    end record;

	-- ********************************************************
	-- *
	-- * GetSelectedExtensionEvent.
	-- *

	type X_Get_Selected_Extension_Events_Req is
	    record
		Req_Type : X_Configuration_Dependent.
			      Card8;-- extension major code
		Req_Types : X_Configuration_Dependent.Card8;
		-- X_GetSelectedExtensionEvents;
		Length : X_Configuration_Dependent.Card16;
		Window : X_Lib.Window;
	    end record;

	for X_Get_Selected_Extension_Events_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Window at 1 * Word_Size range 0 .. 31;
	    end record;

	type X_Get_Selected_Extension_Events_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8;  -- X_Reply
		Rep_Types : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		This_Client_Count : X_Configuration_Dependent.Card16;
		All_Clients_Count : X_Configuration_Dependent.Card16;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Get_Selected_Extension_Events_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		This_Client_Count at 2 * Word_Size range 0 .. 15;
		All_Clients_Count at 2 * Word_Size + 2 range 0 .. 15;
		Pad01 at 3 * Word_Size range 0 .. 31;
		Pad02 at 4 * Word_Size range 0 .. 31;
		Pad03 at 5 * Word_Size range 0 .. 31;
		Pad04 at 6 * Word_Size range 0 .. 31;
		Pad05 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * ChangeDeviceDontPropagateList.
	-- *

	type X_Change_Device_Dont_Propagate_List_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		-- X_ChangeDeviceDontPropagateList
		Length : X_Configuration_Dependent.Card16;
		Window : X_Lib.Window;
		Count : X_Configuration_Dependent.Card16;
		Mode : X_Configuration_Dependent.Card8;
		Pad : X_Configuration_Dependent.Byte;
	    end record;

	for X_Change_Device_Dont_Propagate_List_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Window at 1 * Word_Size range 0 .. 31;
		Count at 2 * Word_Size range 0 .. 15;
		Mode at 2 * Word_Size + 2 range 0 .. 7;
		Pad at 2 * Word_Size + 3 range 0 .. 7;
	    end record;

	-- ********************************************************
	-- *
	-- * GetDeviceDontPropagateList.
	-- *

	type X_Get_Device_Dont_Propagate_List_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		-- X_ChangeDeviceDontPropagateList
		Length : X_Configuration_Dependent.Card16;
		Window : X_Lib.Window;
	    end record;

	for X_Get_Device_Dont_Propagate_List_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Window at 1 * Word_Size range 0 .. 31;
	    end record;

	type X_Get_Device_Dont_Propagate_List_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8;  -- X_Reply
		Rep_Types : X_Configuration_Dependent.Card8;
		-- GetDeviceDontPropagateList
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Count : X_Configuration_Dependent.Card16;
		Pad00 : X_Configuration_Dependent.Card16;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Get_Device_Dont_Propagate_List_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Count at 2 * Word_Size range 0 .. 15;
		Pad00 at 2 * Word_Size + 2 range 0 .. 15;
		Pad01 at 3 * Word_Size range 0 .. 31;
		Pad02 at 4 * Word_Size range 0 .. 31;
		Pad03 at 5 * Word_Size range 0 .. 31;
		Pad04 at 6 * Word_Size range 0 .. 31;
		Pad05 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * GetDeviceMotionEvents.
	-- *

	type X_Get_Device_Motion_Events_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Start : X_Lib.Time;
		Stop : X_Lib.Time;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Get_Device_Motion_Events_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Start at 1 * Word_Size range 0 .. 31;
		Stop at 2 * Word_Size range 0 .. 31;
		Device_Id at 3 * Word_Size range 0 .. 7;
		Pad1 at 3 * Word_Size + 1 range 0 .. 7;
		Pad2 at 3 * Word_Size + 2 range 0 .. 7;
		Pad3 at 3 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Get_Device_Motion_Events_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8; -- X_Reply
		Rep_Types : X_Configuration_Dependent.Card8;
		-- X_GetDeviceMotionEvents
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		N_Events : X_Configuration_Dependent.Card32;
		Axes : X_Configuration_Dependent.Card8;
		Mode : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Get_Device_Motion_Events_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		N_Events at 2 * Word_Size range 0 .. 31;
		Axes at 3 * Word_Size range 0 .. 7;
		Mode at 3 * Word_Size + 1 range 0 .. 7;
		Pad1 at 3 * Word_Size + 2 range 0 .. 7;
		Pad2 at 3 * Word_Size + 3 range 0 .. 7;
		Pad01 at 4 * Word_Size range 0 .. 31;
		Pad02 at 5 * Word_Size range 0 .. 31;
		Pad03 at 6 * Word_Size range 0 .. 31;
		Pad04 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * ChangeKeyboardDevice.
	-- *

	type X_Change_Keyboard_Device_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Change_Keyboard_Device_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		Pad1 at 1 * Word_Size + 1 range 0 .. 7;
		Pad2 at 1 * Word_Size + 2 range 0 .. 7;
		Pad3 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Change_Keyboard_Device_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8;
		Rep_Types : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Status : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Change_Keyboard_Device_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Status at 2 * Word_Size range 0 .. 7;
		Pad1 at 2 * Word_Size + 1 range 0 .. 7;
		Pad2 at 2 * Word_Size + 2 range 0 .. 7;
		Pad3 at 2 * Word_Size + 3 range 0 .. 7;
		Pad01 at 3 * Word_Size range 0 .. 31;
		Pad02 at 4 * Word_Size range 0 .. 31;
		Pad03 at 5 * Word_Size range 0 .. 31;
		Pad04 at 6 * Word_Size range 0 .. 31;
		Pad05 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * ChangePointerDevice.
	-- *

	type X_Change_Pointer_Device_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		X_Axis : X_Configuration_Dependent.Card8;
		Y_Axis : X_Configuration_Dependent.Card8;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Change_Pointer_Device_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		X_Axis at 1 * Word_Size range 0 .. 7;
		Y_Axis at 1 * Word_Size + 1 range 0 .. 7;
		Device_Id at 1 * Word_Size + 2 range 0 .. 7;
		Pad1 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Change_Pointer_Device_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8;
		Rep_Types : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Status : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Change_Pointer_Device_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Status at 2 * Word_Size range 0 .. 7;
		Pad1 at 2 * Word_Size + 1 range 0 .. 7;
		Pad2 at 2 * Word_Size + 2 range 0 .. 7;
		Pad3 at 2 * Word_Size + 3 range 0 .. 7;
		Pad01 at 3 * Word_Size range 0 .. 31;
		Pad02 at 4 * Word_Size range 0 .. 31;
		Pad03 at 5 * Word_Size range 0 .. 31;
		Pad04 at 6 * Word_Size range 0 .. 31;
		Pad05 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * GrabDevice.
	-- *

	type X_Grab_Device_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Grab_Window : X_Lib.Window;
		Time : X_Lib.Time;
		Event_Count : X_Configuration_Dependent.Card16;
		This_Device_Mode : X_Configuration_Dependent.Card8;
		Other_Devices_Mode : X_Configuration_Dependent.Card8;
		Owner_Events : X_Configuration_Dependent.Bool;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad01 : X_Configuration_Dependent.Card16;
	    end record;

	for X_Grab_Device_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Grab_Window at 1 * Word_Size range 0 .. 31;
		Time at 2 * Word_Size range 0 .. 31;
		Event_Count at 3 * Word_Size range 0 .. 15;
		This_Device_Mode at 3 * Word_Size + 2 range 0 .. 7;
		Other_Devices_Mode at 3 * Word_Size + 3 range 0 .. 7;
		Owner_Events at 4 * Word_Size range 0 .. 31;
		Device_Id at 5 * Word_Size range 0 .. 7;
		Pad01 at 5 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Grab_Device_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8;
		Rep_Types : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Status : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Grab_Device_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Status at 2 * Word_Size range 0 .. 7;
		Pad1 at 2 * Word_Size + 1 range 0 .. 7;
		Pad2 at 2 * Word_Size + 2 range 0 .. 7;
		Pad3 at 2 * Word_Size + 3 range 0 .. 7;
		Pad01 at 3 * Word_Size range 0 .. 31;
		Pad02 at 4 * Word_Size range 0 .. 31;
		Pad03 at 5 * Word_Size range 0 .. 31;
		Pad04 at 6 * Word_Size range 0 .. 31;
		Pad05 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * UngrabDevice.
	-- *

	type X_Ungrab_Device_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Time : X_Lib.Time;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Ungrab_Device_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Time at 1 * Word_Size range 0 .. 31;
		Device_Id at 2 * Word_Size range 0 .. 7;
		Pad1 at 2 * Word_Size + 1 range 0 .. 7;
		Pad2 at 2 * Word_Size + 2 range 0 .. 7;
		Pad3 at 2 * Word_Size + 3 range 0 .. 7;
	    end record;

	-- ********************************************************
	-- *
	-- * GrabDeviceKey.
	-- *

	type X_Grab_Device_Key_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		-- extension major code
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Grab_Window : X_Lib.Window;
		Event_Count : X_Configuration_Dependent.Card16;
		Modifiers : X_Configuration_Dependent.Card16;
		Modifier_Device : X_Configuration_Dependent.Card8;
		Grabbed_Device : X_Configuration_Dependent.Card8;
		Key : X_Configuration_Dependent.Card8;
		This_Device_Mode : X_Configuration_Dependent.Byte;
		Other_Devices_Mode : X_Configuration_Dependent.Byte;
		Owner_Events : X_Configuration_Dependent.Bool;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;
	for X_Grab_Device_Key_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Grab_Window at 1 * Word_Size range 0 .. 31;
		Event_Count at 2 * Word_Size range 0 .. 15;
		Modifiers at 2 * Word_Size + 2 range 0 .. 15;
		Modifier_Device at 3 * Word_Size range 0 .. 7;
		Grabbed_Device at 3 * Word_Size + 1 range 0 .. 7;
		Key at 3 * Word_Size + 2 range 0 .. 7;
		This_Device_Mode at 3 * Word_Size + 3 range 0 .. 7;
		Other_Devices_Mode at 4 * Word_Size range 0 .. 7;
		Owner_Events at 5 * Word_Size range 0 .. 31;
		Pad1 at 6 * Word_Size range 0 .. 7;
		Pad2 at 6 * Word_Size + 1 range 0 .. 7;
		Pad3 at 6 * Word_Size + 3 range 0 .. 7;
	    end record;
	-- ********************************************************
	-- *
	-- * UngrabDeviceKey.
	-- *

	type X_Ungrab_Device_Key_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;-- X_GrabDeviceKey
		Length : X_Configuration_Dependent.Card16;
		Grab_Window : X_Lib.Window;
		Modifiers : X_Configuration_Dependent.Card16;
		Modifier_Device : X_Configuration_Dependent.Card8;
		Key : X_Configuration_Dependent.Card8;
		Grabbed_Device : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Ungrab_Device_Key_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Grab_Window at 1 * Word_Size range 0 .. 31;
		Modifiers at 2 * Word_Size range 0 .. 15;
		Modifier_Device at 2 * Word_Size + 2 range 0 .. 7;
		Key at 2 * Word_Size + 3 range 0 .. 7;
		Grabbed_Device at 3 * Word_Size range 0 .. 7;
		Pad1 at 3 * Word_Size + 1 range 0 .. 7;
		Pad2 at 3 * Word_Size + 2 range 0 .. 7;
		Pad3 at 3 * Word_Size + 3 range 0 .. 7;
	    end record;

	-- ********************************************************
	-- *
	-- * GrabDeviceButton.
	-- *

	type X_Grab_Device_Button_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Grab_Window : X_Lib.Window;
		Grabbed_Device : X_Configuration_Dependent.Card8;
		Modifier_Device : X_Configuration_Dependent.Card8;
		Event_Count : X_Configuration_Dependent.Card16;
		Modifiers : X_Configuration_Dependent.Card16;
		This_Device_Mode : X_Configuration_Dependent.Byte;
		Other_Devices_Mode : X_Configuration_Dependent.Byte;
		Button : X_Configuration_Dependent.Card8;
		Owner_Events : X_Configuration_Dependent.Bool;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;
	for X_Grab_Device_Button_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Grab_Window at 1 * Word_Size range 0 .. 31;
		Grabbed_Device at 2 * Word_Size range 0 .. 7;
		Modifier_Device at 2 * Word_Size + 1 range 0 .. 7;
		Event_Count at 2 * Word_Size + 2 range 0 .. 15;
		Modifiers at 3 * Word_Size range 0 .. 15;
		This_Device_Mode at 3 * Word_Size + 2 range 0 .. 7;
		Other_Devices_Mode at 3 * Word_Size + 3 range 0 .. 7;
		Button at 4 * Word_Size range 0 .. 7;
		Owner_Events at 5 * Word_Size range 0 .. 31;
		Pad1 at 6 * Word_Size range 0 .. 7;
		Pad2 at 6 * Word_Size + 1 range 0 .. 7;
		Pad3 at 6 * Word_Size + 3 range 0 .. 7;
	    end record;
	-- ********************************************************
	-- *
	-- * UngrabDeviceButton.
	-- *

	type X_Ungrab_Device_Button_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		-- extension major code
		Req_Types : X_Configuration_Dependent.Card8;
		-- X_GrabDeviceKeyButton
		Length : X_Configuration_Dependent.Card16;
		Grab_Window : X_Lib.Window;
		Modifiers : X_Configuration_Dependent.Card16;
		Modifier_Device : X_Configuration_Dependent.Card8;
		Button : X_Configuration_Dependent.Card8;
		Grabbed_Device : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Ungrab_Device_Button_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Grab_Window at 1 * Word_Size range 0 .. 31;
		Modifiers at 2 * Word_Size range 0 .. 15;
		Modifier_Device at 2 * Word_Size + 2 range 0 .. 7;
		Button at 2 * Word_Size + 3 range 0 .. 7;
		Grabbed_Device at 3 * Word_Size range 0 .. 7;
		Pad1 at 3 * Word_Size + 1 range 0 .. 7;
		Pad2 at 3 * Word_Size + 2 range 0 .. 7;
		Pad3 at 3 * Word_Size + 3 range 0 .. 7;
	    end record;

	-- ********************************************************
	-- *
	-- * AllowDeviceEvents.
	-- *

	type X_Allow_Device_Events_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Time : X_Lib.Time;
		Mode : X_Configuration_Dependent.Card8;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Allow_Device_Events_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Time at 1 * Word_Size range 0 .. 31;
		Mode at 2 * Word_Size range 0 .. 7;
		Device_Id at 2 * Word_Size + 1 range 0 .. 7;
		Pad1 at 2 * Word_Size + 2 range 0 .. 7;
		Pad2 at 2 * Word_Size + 3 range 0 .. 7;
	    end record;

	-- ********************************************************
	-- *
	-- * GetDeviceFocus.
	-- *

	type X_Get_Device_Focus_Req is
	    record
		Req_Type : X_Configuration_Dependent.
			      Card8;-- extension major code
		Req_Types : X_Configuration_Dependent.Card8; -- X_GetDeviceFocus
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Get_Device_Focus_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		Pad1 at 1 * Word_Size + 1 range 0 .. 7;
		Pad2 at 1 * Word_Size + 2 range 0 .. 7;
		Pad3 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Get_Device_Focus_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8;
		-- extension major code
		Rep_Types : X_Configuration_Dependent.Card8; -- X_GetDeviceFocus
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Focus : X_Configuration_Dependent.Card32;
		Time : X_Lib.Time;
		Revert_To : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Get_Device_Focus_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Focus at 2 * Word_Size range 0 .. 31;
		Time at 3 * Word_Size range 0 .. 31;
		Revert_To at 4 * Word_Size range 0 .. 7;
		Pad1 at 4 * Word_Size + 1 range 0 .. 7;
		Pad2 at 4 * Word_Size + 2 range 0 .. 7;
		Pad3 at 4 * Word_Size + 3 range 0 .. 7;
		Pad01 at 5 * Word_Size range 0 .. 31;
		Pad02 at 6 * Word_Size range 0 .. 31;
		Pad03 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * SetDeviceFocus.
	-- *

	type X_Set_Device_Focus_Req is
	    record
		Req_Type : X_Configuration_Dependent.
			      Card8;-- extension major code
		Req_Types : X_Configuration_Dependent.Card8; -- X_SetDeviceFocus
		Length : X_Configuration_Dependent.Card16;
		Focus : X_Lib.Window;
		Time : X_Lib.Time;
		Revert_To : X_Configuration_Dependent.Card8;
		Device : X_Configuration_Dependent.Card8;
		Pad01 : X_Configuration_Dependent.Card16;
	    end record;

	for X_Set_Device_Focus_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Focus at 1 * Word_Size range 0 .. 31;
		Time at 2 * Word_Size range 0 .. 31;
		Revert_To at 3 * Word_Size range 0 .. 7;
		Device at 3 * Word_Size + 1 range 0 .. 7;
		Pad01 at 3 * Word_Size + 2 range 0 .. 15;
	    end record;

	-- ********************************************************
	-- *
	-- * GetFeedbackControl.
	-- *

	type X_Get_Feedback_Control_Req is
	    record
		Req_Type : X_Configuration_Dependent.
			      Card8;-- extension major code
		Req_Types : X_Configuration_Dependent.
			       Card8;-- X_GetFeedbackControl
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Get_Feedback_Control_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		Pad1 at 1 * Word_Size + 1 range 0 .. 7;
		Pad2 at 1 * Word_Size + 2 range 0 .. 7;
		Pad3 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Get_Feedback_Control_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8;
		-- extension major code
		Rep_Types : X_Configuration_Dependent.Card8;
		-- X_GetFeedbackControl
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Num_Feedbacks : X_Configuration_Dependent.Card16;
		Pad01 : X_Configuration_Dependent.Card16;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
		Pad06 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Get_Feedback_Control_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Num_Feedbacks at 2 * Word_Size range 0 .. 15;
		Pad01 at 2 * Word_Size + 2 range 0 .. 15;
		Pad02 at 3 * Word_Size range 0 .. 31;
		Pad03 at 4 * Word_Size range 0 .. 31;
		Pad04 at 5 * Word_Size range 0 .. 31;
		Pad05 at 6 * Word_Size range 0 .. 31;
		Pad06 at 7 * Word_Size range 0 .. 31;
	    end record;

	type X_Feedback_State is
	    record
		Class : X_Configuration_Dependent.Card8;   -- feedback class
		Id : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;   -- feedback id
	    end record;

	for X_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Kbd_Feedback_State is
	    record
		Class : X_Configuration_Dependent.Card8;
		Id : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Pitch : X_Configuration_Dependent.Card16;
		Duration : X_Configuration_Dependent.Card16;
		Led_Mask : X_Lib.Keyboard.Led_Mask_Type;
		Led_Values : X_Configuration_Dependent.Card32;
		Global_Auto_Repeat : X_Lib.Keyboard.Auto_Repeat_Mode_Type;
		Click : X_Configuration_Dependent.Card8;
		Percent : X_Configuration_Dependent.Card8;
		Pad : X_Configuration_Dependent.Byte;
		Auto_Repeats : X_Lib.Byte_Array (1 .. 32);
	    end record;

	for X_Kbd_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Pitch at 1 * Word_Size range 0 .. 15;
		Duration at 1 * Word_Size + 2 range 0 .. 15;
		Led_Mask at 2 * Word_Size range 0 .. 31;
		Led_Values at 3 * Word_Size range 0 .. 31;
		Global_Auto_Repeat at 4 * Word_Size range 0 .. 31;
		Click at 5 * Word_Size range 0 .. 7;
		Percent at 5 * Word_Size + 1 range 0 .. 7;
		Pad at 5 * Word_Size + 2 range 0 .. 7;
		Auto_Repeats at 6 * Word_Size + 3 range 0 .. 8 * 32 - 1;
	    end record;

	type X_Ptr_Feedback_State is
	    record
		Class : X_Configuration_Dependent.Card8;
		Id : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Pad1 : X_Configuration_Dependent.Card8;
		Pad2 : X_Configuration_Dependent.Card8;
		Accel_Num : X_Configuration_Dependent.Card16;
		Accel_Denom : X_Configuration_Dependent.Card16;
		Threshold : X_Configuration_Dependent.Card16;
	    end record;

	for X_Ptr_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Pad1 at 1 * Word_Size range 0 .. 7;
		Pad2 at 1 * Word_Size + 1 range 0 .. 7;
		Accel_Num at 1 * Word_Size + 2 range 0 .. 15;
		Accel_Denom at 2 * Word_Size range 0 .. 15;
		Threshold at 2 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Integer_Feedback_State is
	    record
		Class : X_Configuration_Dependent.Card8; -- feedback class id
		Id : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16; -- feedback Length
		Resolution : X_Configuration_Dependent.Card32;
		Min_Value : X_Configuration_Dependent.Int32;
		Max_Value : X_Configuration_Dependent.Int32;
	    end record;

	for X_Integer_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Resolution at 1 * Word_Size range 0 .. 31;
		Min_Value at 2 * Word_Size range 0 .. 31;
		Max_Value at 3 * Word_Size range 0 .. 31;
	    end record;

	type X_String_Feedback_State is
	    record
		Class : X_Configuration_Dependent.Card8; -- class id
		Id : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Max_Symbols : X_Configuration_Dependent.Card16;
		Num_Syms_Supported : X_Configuration_Dependent.Card16;
	    end record;

	for X_String_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Max_Symbols at 1 * Word_Size range 0 .. 15;
		Num_Syms_Supported at 1 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Bell_Feedback_State is
	    record
		Class : X_Configuration_Dependent.Card8;   -- feedback class id
		Id : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;   -- feedback length
		Percent : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pitch : X_Configuration_Dependent.Card16;
		Duration : X_Configuration_Dependent.Card16;
	    end record;

	for X_Bell_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Percent at 1 * Word_Size range 0 .. 7;
		Pad1 at 1 * Word_Size + 1 range 0 .. 7;
		Pad2 at 1 * Word_Size + 2 range 0 .. 7;
		Pad3 at 1 * Word_Size + 3 range 0 .. 7;
		Pitch at 2 * Word_Size range 0 .. 15;
		Duration at 2 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Led_Feedback_State is
	    record
		Class : X_Configuration_Dependent.Card8;  -- feedback class id
		Id : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;  -- feedback length
		Led_Mask : X_Lib.Keyboard.Led_Mask_Type;
		Led_Values : X_Configuration_Dependent.Card32;
	    end record;

	for X_Led_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Led_Mask at 1 * Word_Size range 0 .. 31;
		Led_Values at 2 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * ChangeFeedbackControl.
	-- *

	type X_Change_Feedback_Control_Req is
	    record
		Req_Type : X_Configuration_Dependent.
			      Card8; -- extension major code
		Req_Types : X_Configuration_Dependent.
			       Card8; -- X_GetFeedbackControl
		Length : X_Configuration_Dependent.Card16;
		Mask : X_Masks.Mask_Type;
		Device_Id : X_Configuration_Dependent.Card8;
		Feedback_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Change_Feedback_Control_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Mask at 1 * Word_Size range 0 .. 31;
		Device_Id at 2 * Word_Size range 0 .. 7;
		Feedback_Id at 2 * Word_Size + 1 range 0 .. 7;
		Pad1 at 2 * Word_Size + 2 range 0 .. 7;
		Pad2 at 2 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Feedback_Ctl is
	    record
		Class : X_Configuration_Dependent.Card8; -- feedback class id
		Id : X_Configuration_Dependent.Card8;
		Lengths : X_Configuration_Dependent.Card16; -- feedback length
	    end record;

	for X_Feedback_Ctl use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Lengths at 0 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Kbd_Feedback_Ctl is
	    record
		Class : X_Configuration_Dependent.Card8;
		Id : X_Configuration_Dependent.Card8;
		Lengths : X_Configuration_Dependent.Card16;
		Key : X_Lib.Keyboard.Key_Code;
		Auto_Repeat_Mode : X_Configuration_Dependent.Card8;
		Click : X_Configuration_Dependent.Int8;
		Percent : X_Configuration_Dependent.Int8;
		Pitch : X_Configuration_Dependent.Short;
		Duration : X_Configuration_Dependent.Short;
		Led_Mask : X_Lib.Keyboard.Led_Mask_Type;
		Led_Values : X_Configuration_Dependent.Card32;
	    end record;

	for X_Kbd_Feedback_Ctl use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Lengths at 0 * Word_Size + 2 range 0 .. 15;
		Key at 1 * Word_Size range 0 .. 7;
		Auto_Repeat_Mode at 1 * Word_Size + 1 range 0 .. 7;
		Click at 1 * Word_Size + 2 range 0 .. 7;
		Percent at 1 * Word_Size + 3 range 0 .. 7;
		Pitch at 2 * Word_Size range 0 .. 15;
		Duration at 2 * Word_Size + 2 range 0 .. 15;
		Led_Mask at 3 * Word_Size range 0 .. 31;
		Led_Values at 4 * Word_Size range 0 .. 31;
	    end record;

	type X_Ptr_Feedback_Ctl is
	    record
		Class : X_Configuration_Dependent.Card8;  -- feedback class id
		Id : X_Configuration_Dependent.Card8;
		Lengths : X_Configuration_Dependent.Card16;  -- feedback length
		Pad1 : X_Configuration_Dependent.Card8;
		Pad2 : X_Configuration_Dependent.Card8;
		Num : X_Configuration_Dependent.Short;
		Denom : X_Configuration_Dependent.Short;
		Thresh : X_Configuration_Dependent.Short;
	    end record;

	for X_Ptr_Feedback_Ctl use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Lengths at 0 * Word_Size + 2 range 0 .. 15;
		Pad1 at 1 * Word_Size range 0 .. 7;
		Pad2 at 1 * Word_Size + 1 range 0 .. 7;
		Num at 1 * Word_Size + 2 range 0 .. 15;
		Denom at 2 * Word_Size range 0 .. 15;
		Thresh at 2 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Integer_Feedback_Ctl is
	    record
		Class : X_Configuration_Dependent.Card8; -- feedback class id
		Id : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16; -- feedback length
		Int_To_Display : X_Configuration_Dependent.Int32;
	    end record;

	for X_Integer_Feedback_Ctl use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Int_To_Display at 1 * Word_Size range 0 .. 31;
	    end record;

	type X_String_Feedback_Ctl is
	    record
		Class : X_Configuration_Dependent.Card8;-- feedback class id
		Id : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;-- feedback length
		Pad1 : X_Configuration_Dependent.Card8;
		Pad2 : X_Configuration_Dependent.Card8;
		Num_Key_Syms : X_Configuration_Dependent.Card16;
	    end record;

	for X_String_Feedback_Ctl use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Pad1 at 1 * Word_Size range 0 .. 7;
		Pad2 at 1 * Word_Size + 1 range 0 .. 7;
		Num_Key_Syms at 1 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Bell_Feedback_Ctl is
	    record
		Class : X_Configuration_Dependent.Card8;   -- feedback class id
		Id : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;   -- feedback length
		Percent : X_Configuration_Dependent.Int8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pitch : X_Configuration_Dependent.Short;
		Duration : X_Configuration_Dependent.Short;
	    end record;

	for X_Bell_Feedback_Ctl use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Percent at 1 * Word_Size range 0 .. 7;
		Pad1 at 1 * Word_Size + 1 range 0 .. 7;
		Pad2 at 1 * Word_Size + 2 range 0 .. 7;
		Pad3 at 1 * Word_Size + 3 range 0 .. 7;
		Pitch at 2 * Word_Size range 0 .. 15;
		Duration at 2 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Led_Feedback_Ctl is
	    record
		Class : X_Configuration_Dependent.Card8;  -- feedback class id
		Id : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;  -- feedback length
		Led_Mask : X_Lib.Keyboard.Led_Mask_Type;
		Led_Values : X_Configuration_Dependent.Card32;
	    end record;

	for X_Led_Feedback_Ctl use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Id at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Led_Mask at 1 * Word_Size range 0 .. 31;
		Led_Values at 2 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * GetDeviceKeyMapping.
	-- *

	type X_Get_Device_Key_Mapping_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		First_Key_Code : X_Lib.Keyboard.Key_Code;
		Count : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Get_Device_Key_Mapping_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		First_Key_Code at 1 * Word_Size + 1 range 0 .. 7;
		Count at 1 * Word_Size + 2 range 0 .. 7;
		Pad1 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Get_Device_Key_Mapping_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8; -- X_Reply
		Rep_Types : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Key_Syms_Per_Key_Code : X_Lib.Keyboard.Key_Code;
		Pad0 : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Card16;
		Pad2 : X_Configuration_Dependent.Card32;
		Pad3 : X_Configuration_Dependent.Card32;
		Pad4 : X_Configuration_Dependent.Card32;
		Pad5 : X_Configuration_Dependent.Card32;
		Pad6 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Get_Device_Key_Mapping_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Key_Syms_Per_Key_Code at 2 * Word_Size range 0 .. 7;
		Pad0 at 2 * Word_Size + 1 range 0 .. 7;
		Pad1 at 2 * Word_Size + 2 range 0 .. 15;
		Pad2 at 3 * Word_Size range 0 .. 31;
		Pad3 at 4 * Word_Size range 0 .. 31;
		Pad4 at 5 * Word_Size range 0 .. 31;
		Pad5 at 6 * Word_Size range 0 .. 31;
		Pad6 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * ChangeDeviceKeyMapping.
	-- *

	type X_Change_Device_Key_Mapping_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		First_Key_Code : X_Lib.Keyboard.Key_Code;
		Key_Syms_Per_Key_Code : X_Configuration_Dependent.Card8;
		Key_Codes : X_Lib.Keyboard.Key_Code;
	    end record;

	for X_Change_Device_Key_Mapping_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		First_Key_Code at 1 * Word_Size + 1 range 0 .. 7;
		Key_Syms_Per_Key_Code at 1 * Word_Size + 2 range 0 .. 7;
		Key_Codes at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	-- ********************************************************
	-- *
	-- * GetDeviceModifierMapping.
	-- *

	type X_Get_Device_Modifier_Mapping_Req is
	    record
		Req_Type : X_Configuration_Dependent.
			      Card8;-- extension major code
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Get_Device_Modifier_Mapping_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		Pad1 at 1 * Word_Size + 1 range 0 .. 7;
		Pad2 at 1 * Word_Size + 2 range 0 .. 7;
		Pad3 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Get_Device_Modifier_Mapping_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8; -- X_Reply
		Rep_Types : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Num_Key_Per_Modifier : X_Configuration_Dependent.Card8;
		Pad0 : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Card16;
		Pad2 : X_Configuration_Dependent.Card32;
		Pad3 : X_Configuration_Dependent.Card32;
		Pad4 : X_Configuration_Dependent.Card32;
		Pad5 : X_Configuration_Dependent.Card32;
		Pad6 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Get_Device_Modifier_Mapping_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Num_Key_Per_Modifier at 2 * Word_Size range 0 .. 7;
		Pad0 at 2 * Word_Size + 1 range 0 .. 7;
		Pad1 at 2 * Word_Size + 2 range 0 .. 15;
		Pad2 at 3 * Word_Size range 0 .. 31;
		Pad3 at 4 * Word_Size range 0 .. 31;
		Pad4 at 5 * Word_Size range 0 .. 31;
		Pad5 at 6 * Word_Size range 0 .. 31;
		Pad6 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * SetDeviceModifierMapping.
	-- *

	type X_Set_Device_Modifier_Mapping_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		-- input extension major code
		Req_Types : X_Configuration_Dependent.Card8;
		-- X_SetDeviceModifierMapping
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Num_Key_Per_Modifier : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Card16;
	    end record;

	for X_Set_Device_Modifier_Mapping_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		Num_Key_Per_Modifier at 1 * Word_Size + 1 range 0 .. 7;
		Pad1 at 1 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Set_Device_Modifier_Mapping_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8; -- X_Reply
		Rep_Types : X_Configuration_Dependent.Card8;
		-- X_SetDeviceModifierMapping
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Success : X_Configuration_Dependent.Card8;
		Pad0 : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Card16;
		Pad2 : X_Configuration_Dependent.Card32;
		Pad3 : X_Configuration_Dependent.Card32;
		Pad4 : X_Configuration_Dependent.Card32;
		Pad5 : X_Configuration_Dependent.Card32;
		Pad6 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Set_Device_Modifier_Mapping_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Success at 2 * Word_Size range 0 .. 7;
		Pad0 at 2 * Word_Size + 1 range 0 .. 7;
		Pad1 at 2 * Word_Size + 2 range 0 .. 15;
		Pad2 at 3 * Word_Size range 0 .. 31;
		Pad3 at 4 * Word_Size range 0 .. 31;
		Pad4 at 5 * Word_Size range 0 .. 31;
		Pad5 at 6 * Word_Size range 0 .. 31;
		Pad6 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * GetDeviceButtonMapping.
	-- *

	type X_Get_Device_Button_Mapping_Req is
	    record
		Req_Type : X_Configuration_Dependent.
			      Card8; -- extension major code
		Req_Types : X_Configuration_Dependent.Card8;
		-- X_GetDeviceButtonMapping
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Get_Device_Button_Mapping_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		Pad1 at 1 * Word_Size + 1 range 0 .. 7;
		Pad2 at 1 * Word_Size + 2 range 0 .. 7;
		Pad3 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Get_Device_Button_Mapping_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8; -- X_Reply
		Rep_Types : X_Configuration_Dependent.Card8;
		-- X_GetDeviceButtonMapping
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		N_Elts : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Get_Device_Button_Mapping_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		N_Elts at 2 * Word_Size range 0 .. 7;
		Pad1 at 2 * Word_Size + 1 range 0 .. 7;
		Pad2 at 2 * Word_Size + 2 range 0 .. 7;
		Pad3 at 2 * Word_Size + 3 range 0 .. 7;
		Pad01 at 3 * Word_Size range 0 .. 31;
		Pad02 at 4 * Word_Size range 0 .. 31;
		Pad03 at 5 * Word_Size range 0 .. 31;
		Pad04 at 6 * Word_Size range 0 .. 31;
		Pad05 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * SetDeviceButtonMapping.
	-- *

	type X_Set_Device_Button_Mapping_Req is
	    record
		Req_Type : X_Configuration_Dependent.
			      Card8;-- extension major code
		Req_Types : X_Configuration_Dependent.Card8;
		-- X_SetDeviceButtonMapping
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Map_Length : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Set_Device_Button_Mapping_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		Map_Length at 1 * Word_Size + 1 range 0 .. 7;
		Pad1 at 1 * Word_Size + 2 range 0 .. 7;
		Pad2 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Set_Device_Button_Mapping_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8; -- X_Reply
		Rep_Types : X_Configuration_Dependent.Card8;
		-- X_SetDeviceButtonMapping
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Status : X_Configuration_Dependent.Card8;
		Pad0 : X_Configuration_Dependent.Byte;
		Pad1 : X_Configuration_Dependent.Card16;
		Pad2 : X_Configuration_Dependent.Card32;
		Pad3 : X_Configuration_Dependent.Card32;
		Pad4 : X_Configuration_Dependent.Card32;
		Pad5 : X_Configuration_Dependent.Card32;
		Pad6 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Set_Device_Button_Mapping_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Status at 2 * Word_Size range 0 .. 7;
		Pad0 at 2 * Word_Size + 1 range 0 .. 7;
		Pad1 at 2 * Word_Size + 2 range 0 .. 15;
		Pad2 at 3 * Word_Size range 0 .. 31;
		Pad3 at 4 * Word_Size range 0 .. 31;
		Pad4 at 5 * Word_Size range 0 .. 31;
		Pad5 at 6 * Word_Size range 0 .. 31;
		Pad6 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************
	-- *
	-- * QueryDeviceState.
	-- *

	type X_Query_Device_State_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.
			       Card8;   -- X_QueryDeviceState
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Query_Device_State_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		Pad1 at 1 * Word_Size + 1 range 0 .. 7;
		Pad2 at 1 * Word_Size + 2 range 0 .. 7;
		Pad3 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Query_Device_State_Reply is
	    record
		Rep_Type : X_Configuration_Dependent.Card8;-- X_Reply
		Rep_Types : X_Configuration_Dependent.
			       Card8;-- X_QueryDeviceState
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Num_Classes : X_Configuration_Dependent.Card8;
		Pad0 : X_Configuration_Dependent.Byte;
		Pad1 : X_Configuration_Dependent.Card16;
		Pad2 : X_Configuration_Dependent.Card32;
		Pad3 : X_Configuration_Dependent.Card32;
		Pad4 : X_Configuration_Dependent.Card32;
		Pad5 : X_Configuration_Dependent.Card32;
		Pad6 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Query_Device_State_Reply use
	    record
		Rep_Type at 0 * Word_Size range 0 .. 7;
		Rep_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Num_Classes at 2 * Word_Size range 0 .. 7;
		Pad0 at 2 * Word_Size + 1 range 0 .. 7;
		Pad1 at 2 * Word_Size + 2 range 0 .. 15;
		Pad2 at 3 * Word_Size range 0 .. 31;
		Pad3 at 4 * Word_Size range 0 .. 31;
		Pad4 at 5 * Word_Size range 0 .. 31;
		Pad5 at 6 * Word_Size range 0 .. 31;
		Pad6 at 7 * Word_Size range 0 .. 31;
	    end record;

	type Card32_Array is array (Natural range <>) of
				X_Configuration_Dependent.Card32;

	type X_Key_State is
	    record
		Class : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card8;
		Num_Keys : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Keys : X_Lib.Byte_Array (1 .. 32);
	    end record;

	for X_Key_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Num_Keys at 0 * Word_Size + 2 range 0 .. 7;
		Pad1 at 0 * Word_Size + 3 range 0 .. 7;
		Keys at 1 * Word_Size range 0 .. 8 * 32 - 1;
	    end record;

	type X_Button_State is
	    record
		Class : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card8;
		Num_Buttons : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Buttons : X_Lib.Byte_Array (1 .. 32);
	    end record;

	for X_Button_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Num_Buttons at 0 * Word_Size + 2 range 0 .. 7;
		Pad1 at 0 * Word_Size + 3 range 0 .. 7;
		Buttons at 1 * Word_Size range 0 .. 8 * 32 - 1;
	    end record;

	type X_Valuator_State is
	    record
		Class : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card8;
		Num_Valuators : X_Configuration_Dependent.Card8;
		Mode : X_Configuration_Dependent.Card8;
	    end record;

	for X_Valuator_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Num_Valuators at 0 * Word_Size + 2 range 0 .. 7;
		Mode at 0 * Word_Size + 3 range 0 .. 7;
	    end record;

	-- ********************************************************************
	-- *
	-- * SendExtensionEvent.  THIS REQUEST MUST BE KEPT A MULTIPLE OF 8
	-- * X_Configuration_Dependent.Byte;S IN LENGTH! MORE EVENTS MAY FOLLOW
	-- * AND THEY MUST BE QUAD-ALIGNED!
	-- *

	type X_Send_Extension_Event_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Destination : X_Lib.Window;
		Device_Id : X_Configuration_Dependent.Card8;
		Propagate : X_Configuration_Dependent.Bool;
		Count : X_Configuration_Dependent.Card16;
		Num_Events : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pad4 : X_Configuration_Dependent.Byte;
	    end record;
	for X_Send_Extension_Event_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Destination at 1 * Word_Size range 0 .. 31;
		Device_Id at 2 * Word_Size range 0 .. 7;
		Propagate at 3 * Word_Size range 0 .. 31;
		Count at 4 * Word_Size range 0 .. 15;
		Num_Events at 4 * Word_Size + 2 range 0 .. 7;
		Pad1 at 4 * Word_Size + 3 range 0 .. 7;
		Pad2 at 5 * Word_Size range 0 .. 7;
		Pad3 at 5 * Word_Size + 1 range 0 .. 7;
		Pad4 at 5 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Device_Bell_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Feedback_Id : X_Configuration_Dependent.Card8;
		Feedback_Class : X_Configuration_Dependent.Card8;
		Percent : X_Configuration_Dependent.Int8;
	    end record;

	for X_Device_Bell_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		Feedback_Id at 1 * Word_Size + 1 range 0 .. 7;
		Feedback_Class at 1 * Word_Size + 2 range 0 .. 7;
		Percent at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	-- SetDeviceValuators.
	type X_Set_Device_Valuators_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		First_Valuator : X_Configuration_Dependent.Card8;
		Num_Valuators : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Set_Device_Valuators_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Device_Id at 1 * Word_Size range 0 .. 7;
		First_Valuator at 1 * Word_Size + 1 range 0 .. 7;
		Num_Valuators at 1 * Word_Size + 2 range 0 .. 7;
		Pad1 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Set_Device_Valuators_Reply is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Status : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Set_Device_Valuators_Reply use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Status at 2 * Word_Size range 0 .. 7;
		Pad1 at 2 * Word_Size + 1 range 0 .. 7;
		Pad2 at 2 * Word_Size + 2 range 0 .. 7;
		Pad3 at 2 * Word_Size + 3 range 0 .. 7;
		Pad01 at 3 * Word_Size range 0 .. 31;
		Pad02 at 4 * Word_Size range 0 .. 31;
		Pad03 at 5 * Word_Size range 0 .. 31;
		Pad04 at 6 * Word_Size range 0 .. 31;
		Pad05 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- GetDeviceControl.

	type X_Get_Device_Control_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Control : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad2 : X_Configuration_Dependent.Byte;
	    end record;

	for X_Get_Device_Control_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Control at 1 * Word_Size range 0 .. 15;
		Device_Id at 1 * Word_Size + 2 range 0 .. 7;
		Pad2 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Get_Device_Control_Reply is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Status : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Get_Device_Control_Reply use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Status at 2 * Word_Size range 0 .. 7;
		Pad1 at 2 * Word_Size + 1 range 0 .. 7;
		Pad2 at 2 * Word_Size + 2 range 0 .. 7;
		Pad3 at 2 * Word_Size + 3 range 0 .. 7;
		Pad01 at 3 * Word_Size range 0 .. 31;
		Pad02 at 4 * Word_Size range 0 .. 31;
		Pad03 at 5 * Word_Size range 0 .. 31;
		Pad04 at 6 * Word_Size range 0 .. 31;
		Pad05 at 7 * Word_Size range 0 .. 31;
	    end record;

	type X_Device_State is
	    record
		Control : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card16;
	    end record;

	for X_Device_State use
	    record
		Control at 0 * Word_Size range 0 .. 15;
		Length at 0 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Device_Resolution_State is
	    record
		Control : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card16;
		Num_Valuators : X_Configuration_Dependent.Card32;
	    end record;

	for X_Device_Resolution_State use
	    record
		Control at 0 * Word_Size range 0 .. 15;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Num_Valuators at 1 * Word_Size range 0 .. 31;
	    end record;

	-- ChangeDeviceControl.

	type X_Change_Device_Control_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
		Control : X_Configuration_Dependent.Card16;
		Device_Id : X_Configuration_Dependent.Card8;
		Num_Valuators : X_Configuration_Dependent.Card8;
	    end record;

	for X_Change_Device_Control_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Control at 1 * Word_Size range 0 .. 15;
		Device_Id at 1 * Word_Size + 2 range 0 .. 7;
		Num_Valuators at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Change_Device_Control_Reply is
	    record
		Req_Type : X_Configuration_Dependent.Card8;
		Req_Types : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;
		Status : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Change_Device_Control_Reply use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		Req_Types at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Status at 2 * Word_Size range 0 .. 7;
		Pad1 at 2 * Word_Size + 1 range 0 .. 7;
		Pad2 at 2 * Word_Size + 2 range 0 .. 7;
		Pad3 at 2 * Word_Size + 3 range 0 .. 7;
		Pad01 at 3 * Word_Size range 0 .. 31;
		Pad02 at 4 * Word_Size range 0 .. 31;
		Pad03 at 5 * Word_Size range 0 .. 31;
		Pad04 at 6 * Word_Size range 0 .. 31;
		Pad05 at 7 * Word_Size range 0 .. 31;
	    end record;

	type X_Device_Ctl is
	    record
		Control : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card16;
	    end record;

	for X_Device_Ctl use
	    record
		Control at 0 * Word_Size range 0 .. 15;
		Length at 0 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Device_Resolution_Ctl is
	    record
		Control : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card16;
		First_Valuator : X_Configuration_Dependent.Card8;
		Num_Valuators : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Card8;
		Pad2 : X_Configuration_Dependent.Card8;
	    end record;

	for X_Device_Resolution_Ctl use
	    record
		Control at 0 * Word_Size range 0 .. 15;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		First_Valuator at 1 * Word_Size range 0 .. 7;
		Num_Valuators at 1 * Word_Size + 1 range 0 .. 7;
		Pad1 at 1 * Word_Size + 2 range 0 .. 7;
		Pad2 at 1 * Word_Size + 3 range 0 .. 7;
	    end record;

	-- *********************************************************
	-- *
	-- * Input extension events.
	-- *
	-- * DeviceValuator
	-- *

	type Device_Valuator is
	    record
		Types : X_Configuration_Dependent.Byte;
		Device_Id : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Device_State : X_Proto.Key_But_Mask;
		Num_Valuators : X_Configuration_Dependent.Card8;
		First_Valuator : X_Configuration_Dependent.Card8;
		Valuators : Int32_Array (1 .. 6);
	    end record;

	for Device_Valuator use
	    record
		Types at 0 * Word_Size range 0 .. 7;
		Device_Id at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Device_State at 1 * Word_Size range 0 .. 15;
		Num_Valuators at 1 * Word_Size + 2 range 0 .. 7;
		First_Valuator at 1 * Word_Size + 3 range 0 .. 7;
		Valuators at 2 * Word_Size range 0 .. 32 * 6 - 1;
	    end record;

	-- ******************************************************************
	-- *
	-- * DeviceKeyButtonPointer.
	-- *
	-- * Used for: DeviceKeyPress, DeviceKeyRelease, DeviceButtonPress,
	-- *           DeviceButtonRelease, ProximityIn, ProximityOut
	-- *           DeviceMotionNotify,
	-- *

	type Device_Key_Button_Pointer is
	    record
		Types : X_Configuration_Dependent.Byte;
		Detail : X_Configuration_Dependent.Byte;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Time : X_Lib.Time;
		Root : X_Lib.Window;
		Event : X_Lib.Window;
		Child : X_Lib.Window;
		Root_X : X_Lib.Millimeters;
		Root_Y : X_Lib.Millimeters;
		Event_X : X_Lib.Millimeters;
		Event_Y : X_Lib.Millimeters;
		State : X_Proto.Key_But_Mask;
		Same_Screen : X_Configuration_Dependent.Bool;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad : X_Configuration_Dependent.Byte;
	    end record;
	for Device_Key_Button_Pointer use
	    record
		Types at 0 * Word_Size range 0 .. 7;
		Detail at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Time at 1 * Word_Size range 0 .. 31;
		Root at 2 * Word_Size range 0 .. 31;
		Event at 3 * Word_Size range 0 .. 31;
		Child at 4 * Word_Size range 0 .. 31;
		Root_X at 5 * Word_Size range 0 .. 15;
		Root_Y at 5 * Word_Size + 2 range 0 .. 15;
		Event_X at 6 * Word_Size range 0 .. 15;
		Event_Y at 6 * Word_Size + 2 range 0 .. 15;
		State at 7 * Word_Size range 0 .. 15;
		Same_Screen at 8 * Word_Size range 0 .. 31;
		Device_Id at 9 * Word_Size range 0 .. 7;
		Pad at 9 * Word_Size + 3 range 0 .. 7;
	    end record;
	-- *********************************************************
	-- *
	-- * DeviceFocus.
	-- *

	type Device_Focus is
	    record
		Types : X_Configuration_Dependent.Byte;
		Detail : X_Configuration_Dependent.Byte;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Time : X_Lib.Time;
		Window : X_Lib.Window;
		Mode : X_Configuration_Dependent.Byte;
		Device_Id : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad00 : X_Configuration_Dependent.Card32;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
	    end record;

	for Device_Focus use
	    record
		Types at 0 * Word_Size range 0 .. 7;
		Detail at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Time at 1 * Word_Size range 0 .. 31;
		Window at 2 * Word_Size range 0 .. 31;
		Mode at 3 * Word_Size range 0 .. 7;
		Device_Id at 3 * Word_Size + 1 range 0 .. 7;
		Pad1 at 3 * Word_Size + 2 range 0 .. 7;
		Pad2 at 3 * Word_Size + 3 range 0 .. 7;
		Pad00 at 4 * Word_Size range 0 .. 31;
		Pad01 at 5 * Word_Size range 0 .. 31;
		Pad02 at 6 * Word_Size range 0 .. 31;
		Pad03 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- *********************************************************
	-- *
	-- * DeviceStateNotify.
	-- *

	type Device_State_Notify is
	    record
		Types : X_Configuration_Dependent.Byte;
		Device_Id : X_Configuration_Dependent.Byte;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Time : X_Lib.Time;
		Num_Keys : X_Configuration_Dependent.Card8;
		Num_Buttons : X_Configuration_Dependent.Card8;
		Num_Valuators : X_Configuration_Dependent.Card8;
		Classes_Reported : X_Configuration_Dependent.Card8;
		Buttons : X_Lib.Byte_Array (1 .. 4);
		Keys : X_Lib.Byte_Array (1 .. 4);
		Valuators : Int32_Array (1 .. 3);
	    end record;

	for Device_State_Notify use
	    record
		Types at 0 * Word_Size range 0 .. 7;
		Device_Id at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Time at 1 * Word_Size range 0 .. 31;
		Num_Keys at 2 * Word_Size range 0 .. 7;
		Num_Buttons at 2 * Word_Size + 1 range 0 .. 7;
		Num_Valuators at 2 * Word_Size + 2 range 0 .. 7;
		Classes_Reported at 2 * Word_Size + 3 range 0 .. 7;
		Buttons at 3 * Word_Size range 0 .. 8 * 4 - 1;
		Keys at 4 * Word_Size range 0 .. 8 * 4 - 1;
		Valuators at 5 * Word_Size range 0 .. 32 * 3 - 1;
	    end record;

	-- *********************************************************
	-- *
	-- * DeviceKeyStateNotify.
	-- *

	type Device_Key_State_Notify is
	    record
		Types : X_Configuration_Dependent.Byte;
		Device_Id : X_Configuration_Dependent.Byte;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Keys : X_Lib.Byte_Array (1 .. 28);
	    end record;

	for Device_Key_State_Notify use
	    record
		Types at 0 * Word_Size range 0 .. 7;
		Device_Id at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Keys at 1 * Word_Size range 0 .. 8 * 28 - 1;
	    end record;

	-- *********************************************************
	-- *
	-- * DeviceButtonStateNotify.
	-- *

	type Device_Button_State_Notify is
	    record
		Types : X_Configuration_Dependent.Byte;
		Device_Id : X_Configuration_Dependent.Byte;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Buttons : X_Lib.Byte_Array (1 .. 28);
	    end record;

	for Device_Button_State_Notify use
	    record
		Types at 0 * Word_Size range 0 .. 7;
		Device_Id at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Buttons at 1 * Word_Size range 0 .. 8 * 28 - 1;
	    end record;

	-- *********************************************************
	-- *
	-- * DeviceMappingNotify.
	-- * Fields must be kept in sync with core mappingnotify event.
	-- *

	type Device_Mapping_Notify is
	    record
		Types : X_Configuration_Dependent.Byte;
		Device_Id : X_Configuration_Dependent.Byte;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Request : X_Configuration_Dependent.Card8;
		First_Key_Code : X_Lib.Keyboard.Key_Code;
		Count : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Time : X_Lib.Time;
		Pad00 : X_Configuration_Dependent.Card32;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
	    end record;

	for Device_Mapping_Notify use
	    record
		Types at 0 * Word_Size range 0 .. 7;
		Device_Id at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Request at 1 * Word_Size range 0 .. 7;
		First_Key_Code at 1 * Word_Size + 1 range 0 .. 7;
		Count at 1 * Word_Size + 2 range 0 .. 7;
		Pad1 at 1 * Word_Size + 3 range 0 .. 7;
		Time at 2 * Word_Size range 0 .. 31;
		Pad00 at 3 * Word_Size range 0 .. 31;
		Pad01 at 4 * Word_Size range 0 .. 31;
		Pad02 at 5 * Word_Size range 0 .. 31;
		Pad03 at 6 * Word_Size range 0 .. 31;
		Pad04 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- *********************************************************
	-- *
	-- * ChangeDeviceNotify.
	-- *

	type Change_Device_Notify is
	    record
		Types : X_Configuration_Dependent.Byte;
		Device_Id : X_Configuration_Dependent.Byte;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Time : X_Lib.Time;
		Request : X_Configuration_Dependent.Card8;
		Pad1 : X_Configuration_Dependent.Byte;
		Pad2 : X_Configuration_Dependent.Byte;
		Pad3 : X_Configuration_Dependent.Byte;
		Pad00 : X_Configuration_Dependent.Card32;
		Pad01 : X_Configuration_Dependent.Card32;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
	    end record;

	for Change_Device_Notify use
	    record
		Types at 0 * Word_Size range 0 .. 7;
		Device_Id at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Time at 1 * Word_Size range 0 .. 31;
		Request at 2 * Word_Size range 0 .. 7;
		Pad1 at 2 * Word_Size + 1 range 0 .. 7;
		Pad2 at 2 * Word_Size + 2 range 0 .. 7;
		Pad3 at 2 * Word_Size + 3 range 0 .. 7;
		Pad00 at 3 * Word_Size range 0 .. 31;
		Pad01 at 4 * Word_Size range 0 .. 31;
		Pad02 at 5 * Word_Size range 0 .. 31;
		Pad03 at 6 * Word_Size range 0 .. 31;
		Pad04 at 7 * Word_Size range 0 .. 31;
	    end record;
    end X_Iproto;

    package Mit_Misc is

	X_Mit_Set_Bug_Mode : constant := 0;
	X_Mit_Get_Bug_Mode : constant := 1;

	Mit_Misc_Number_Events : constant := 0;
	Mit_Misc_Number_Errors : constant := 0;

	procedure X_Mit_Misc_Query_Extension
		     (Dpy : in X_Lib.Display;
		      Event_Basep : in out X_Lib.Events.Event_Type;
		      Error_Basep : in out X_Lib.Events.Event_Type;
		      Status : out Boolean);

	function X_Mit_Misc_Set_Bug_Mode
		    (Dpy : in X_Lib.Display; On_Off : in X_Lib.Set_Mode)
		    return X_Lib.X_Integer;

	function X_Mit_Misc_Get_Bug_Mode
		    (Dpy : in X_Lib.Display) return Boolean;
    end Mit_Misc;

    package Multi_Buf is
	Multi_Buffer_Protocol_Name : constant String :=
	   "Multi-Buffering" & Ascii.Nul;

	Multi_Buffer_Major_Version : constant := 1;    -- current version numbers
	Multi_Buffer_Minor_Version : constant := 0;

	X_Mbuf_Get_Buffer_Version : constant := 0;
	X_Mbuf_Create_Image_Buffers : constant := 1;
	X_Mbuf_Destroy_Image_Buffers : constant := 2;
	X_Mbuf_Display_Image_Buffers : constant := 3;
	X_Mbuf_Set_Multi_Buffer_Attributes : constant := 4;
	X_Mbuf_Get_Multi_Buffer_Attributes : constant := 5;
	X_Mbuf_Set_Buffer_Attributes : constant := 6;
	X_Mbuf_Get_Buffer_Attributes : constant := 7;
	X_Mbuf_Get_Buffer_Info : constant := 8;
	X_Mbuf_Create_Stereo_Window : constant := 9;

	-- update_action field
	Multi_Buffer_Update_Action_Undefined : constant := 0;
	Multi_Buffer_Update_Action_Background : constant := 1;
	Multi_Buffer_Update_Action_Untouched : constant := 2;
	Multi_Buffer_Update_Action_Copied : constant := 3;

	-- update_hint field
	Multi_Buffer_Update_Hint_Frequent : constant := 0;
	Multi_Buffer_Update_Hint_Intermittent : constant := 1;
	Multi_Buffer_Update_Hint_Static : constant := 2;

	Multi_Buffer_Window_Update_Hint : constant := 1;
	Multi_Buffer_Buffer_Event_Mask : constant := 1;

	-- mono vs. stereo and left vs. right

	Multi_Buffer_Mode_Mono : constant := 0;
	Multi_Buffer_Mode_Stereo : constant := 1;
	Multi_Buffer_Side_Mono : constant := 0;
	Multi_Buffer_Side_Left : constant := 1;
	Multi_Buffer_Side_Right : constant := 2;

	-- clobber state
	Multi_Buffer_Unclobbered : constant := 0;
	Multi_Buffer_Partially_Clobbered : constant := 1;
	Multi_Buffer_Fully_Clobbered : constant := 2;

	-- event stuff
	Multi_Buffer_Clobber_Notify_Mask : constant := 16#02000000#;
	Multi_Buffer_Update_Notify_Mask : constant := 16#04000000#;

	Multi_Buffer_Clobber_Notify : constant := 0;
	Multi_Buffer_Update_Notify : constant := 1;
	Multi_Buffer_Number_Events : constant := 2;

	Multi_Buffer_Bad_Buffer : constant := 0;
	Multi_Buffer_Number_Errors : constant := 1;

	-- Extra definitions that will only be needed in the client
	subtype Multi_Buffer is X_Lib.X_Id;
	type Multi_Buffer_Ptr is access Multi_Buffer;

	-- Record Xm_Buf_Colbber_Notify_Event defines
	--    type of event
	--    number of last request processed by server
	--    true if this came frome a SendEvent request
	--    the Display from which the event was read
	--    buffer of event
	--    refer state of Clobbered constants above
	type Xm_Buf_Clobber_Notify_Event is
	    record
		Types : X_Lib.Events.Notify_Detail_Type;
		Serial : X_Configuration_Dependent.Unsigned_Long;
		Send_Event : X_Lib.Events.Event_Type;
		Display : X_Lib.Display;
		Buffer : Multi_Buffer;
		State : X_Lib.X_Integer;
	    end record;

	for Xm_Buf_Clobber_Notify_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Serial at 1 * Word_Size range 0 .. 31;
		Send_Event at 2 * Word_Size range 0 .. 31;
		Display at 3 * Word_Size range 0 .. 31;
		Buffer at 4 * Word_Size range 0 .. 31;
		State at 5 * Word_Size range 0 .. 31;
	    end record;

	-- Record Xm_Buf_Update_Notify_Event defines
	--    type of event
	--    number of last request processed by server
	--    true if this came from a SendEvent request
	--    the Display from which the event was read
	--    buffer of event
	type Xm_Buf_Update_Notify_Event is
	    record
		Types : X_Lib.Events.Notify_Detail_Type;
		Serial : X_Configuration_Dependent.Unsigned_Long;
		Send_Event : X_Lib.Events.Event_Type;
		Display : X_Lib.Display;
		Buffer : Multi_Buffer;
	    end record;

	for Xm_Buf_Update_Notify_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Serial at 1 * Word_Size range 0 .. 31;
		Send_Event at 2 * Word_Size range 0 .. 31;
		Display at 3 * Word_Size range 0 .. 31;
		Buffer at 4 * Word_Size range 0 .. 31;
	    end record;


	-- per-window attributes that can be got
	-- Displayed_Index : which buffer is being displayed
	-- Update_Action   : Undefined, Background, Untouched, Copied
	-- Update_Hint     : Frequent, Intermittent, Static
	-- Window_Mode     : Mono, Stereo
	type Xm_Buf_Window_Attributes is
	    record
		Displayed_Index : X_Lib.X_Integer;
		Update_Action : X_Lib.X_Integer;
		Update_Hint : X_Lib.X_Integer;
		Window_Mode : X_Lib.X_Integer;
		Nbuffers : X_Lib.X_Integer;
		Buffers : Multi_Buffer_Ptr;
	    end record;

	for Xm_Buf_Window_Attributes use
	    record
		Displayed_Index at 0 * Word_Size range 0 .. 31;
		Update_Action at 1 * Word_Size range 0 .. 31;
		Update_Hint at 2 * Word_Size range 0 .. 31;
		Window_Mode at 3 * Word_Size range 0 .. 31;
		Nbuffers at 4 * Word_Size range 0 .. 31;
		Buffers at 5 * Word_Size range 0 .. 31;
	    end record;

	-- per-window attributes that can be set Update_Hint for
	-- Frequent, Intermittent, Static */
	type Xm_Buf_Set_Window_Attributes is
	    record
		Update_Hint : X_Lib.X_Integer;
	    end record;

	for Xm_Buf_Set_Window_Attributes use
	    record
		Update_Hint at 0 * Word_Size range 0 .. 31;
	    end record;

	-- per-buffer attributes that defines
	--    the window to which this belongs */
	--    events that have been selected */
	--    which buffer is this */
	--    Mono, Left, Right */
	type Xm_Buf_Buffer_Attributes is
	    record
		Window : X_Lib.Window;
		Event_Mask : X_Lib.Events.Event_Mask_Type;
		Buffer_Index : X_Lib.X_Integer;
		Side : X_Lib.X_Integer;
	    end record;

	for Xm_Buf_Buffer_Attributes use
	    record
		Window at 0 * Word_Size range 0 .. 31;
		Event_Mask at 1 * Word_Size range 0 .. 31;
		Buffer_Index at 2 * Word_Size range 0 .. 31;
		Side at 3 * Word_Size range 0 .. 31;
	    end record;

	-- per-buffer attributes that can set events that have been selected
	type Xm_Buf_Set_Buffer_Attributes is
	    record
		Event_Mask : X_Lib.Events.Event_Mask_Type;
	    end record;

	for Xm_Buf_Set_Buffer_Attributes use
	    record
		Event_Mask at 0 * Word_Size range 0 .. 31;
	    end record;


	-- per-screen buffer info (there will be lists of them)
	--   visual usuable at this depth
	--   most buffers for this visual
	--   depth of buffers to be created
	type Xm_Buf_Buffer_Info_Rec is
	    record
		Visual_Id : X_Lib.Visual_Id_Type;
		Max_Buffers : X_Lib.X_Integer;
		Depth : X_Lib.X_Integer;
	    end record;

	for Xm_Buf_Buffer_Info_Rec use
	    record
		Visual_Id at 0 * Word_Size range 0 .. 31;
		Max_Buffers at 1 * Word_Size range 0 .. 31;
		Depth at 2 * Word_Size range 0 .. 31;
	    end record;

	type Xm_Buf_Buffer_Info_Rec_Ptr is access Xm_Buf_Buffer_Info_Rec;
	type Xm_Buf_Buffer_Info_Array is
	   array (Natural range <>) of Xm_Buf_Buffer_Info_Rec;
	type Xm_Buf_Buffer_Info_List is access Xm_Buf_Buffer_Info_Array;
	type Xm_Buf_Buffer_Info_List_Ptr is access Xm_Buf_Buffer_Info_List;

	-- The application programming library contains the interfaces described
	-- below With the exception of XmbufQueryExtension, if any of these
	-- routines are called with a display that does not support the
	-- extension, the ExtensionErrorHandler (which can be set with
	-- XSetExtensionErrorHandler and functions the same way as
	-- XSetErrorHandler) will be called.

	procedure Xm_Buf_Query_Extension
		     (Dpy : in X_Lib.Display;
		      Event_Base_Return : in out X_Lib.Events.Event_Type;
		      Error_Base_Return : in out X_Lib.Events.Event_Type;
		      Status : out X_Configuration_Dependent.Bool);

	-- Returns True if the multibuffering/stereo extension is available on
	-- the given display.  If the extension exists, the value of the first
	-- event code (which should be added to the event type constants
	-- MultibufferClobberNotify and MultibufferUpdateNotify to get the actual
	-- values) is stored into event_base_return and the value of the first
	-- error code (which should be added to the error type constant
	-- MultibufferBadBuffer to get the actual value) is stored into
	-- error_base_return.

	procedure Xm_Buf_Get_Version
		     (Dpy : in X_Lib.Display;
		      Major_Version_Return : in out X_Lib.X_Integer;
		      Minor_Version_Return : in out X_Lib.X_Integer;
		      Status : out X_Lib.X_Integer);

	-- Gets the major and minor version numbers of the extension. The return
	-- value is zero if an error occurs or non-zero if no error happens.

	function Xm_Buf_Create_Buffers
		    (Dpy : in X_Lib.Display;
		     Window : in X_Lib.Window;
		     Count : in X_Lib.X_Integer;
		     Update_Action : in X_Lib.X_Integer;
		     Update_Hint : in X_Lib.X_Integer;
		     Buffers_Update : in Multi_Buffer) return X_Lib.X_Integer;

	-- Requests that "count" buffers be created with the given update_action
	-- and update_hint and be associated with the indicated window. The
	-- number of buffers created is returned (zero if an error occurred) and
	-- buffers_update is filled in with that many Multibuffer identifiers.

	procedure Xm_Buf_Destroy_Buffers
		     (Dpy : in X_Lib.Display; Window : in X_Lib.Window);

	-- Destroys the buffers associated with the given window.

	procedure Xm_Buf_Display_Buffers (Dpy : in X_Lib.Display;
					  Count : in X_Lib.X_Integer;
					  Buffers : in Multi_Buffer;
					  Min_Delay : in X_Lib.X_Integer;
					  Max_Delay : in X_Lib.X_Integer);

	-- Displays the indicated buffers their appropriate windows within
	-- max_delay milliseconds after min_delay milliseconds have passed. No
	-- two buffers may be associated with the same window or else a Matc
	-- error is generated.

	procedure Xm_Buf_Get_Window_Attributes
		     (Dpy : in X_Lib.Display;
		      Window : in X_Lib.Window;
		      Attributes : in out Xm_Buf_Window_Attributes;
		      Status : out X_Lib.X_Integer);

	-- Gets the multibuffering attributes that apply to all buffers
	-- associated with the given window.  Returns non-zero on success and
	-- zero if an error occurs.

	procedure Xm_Buf_Change_Window_Attributes
		     (Dpy : in X_Lib.Display;
		      Window : in X_Lib.Window;
		      Value_Mask : in X_Masks.Mask_Type;
		      Attributes : in Xm_Buf_Set_Window_Attributes);

	-- Sets the multibuffering attributes that apply to all buffers associated
	-- with the given window. This is currently limited to the update_hint.

	procedure Xm_Buf_Get_Buffer_Attributes
		     (Dpy : in X_Lib.Display;
		      Buffer : in Multi_Buffer;
		      Attributes : in out Xm_Buf_Buffer_Attributes;
		      Status : out X_Lib.X_Integer);

	-- Gets the attributes for the indicated buffer. Returns non-zero on
	-- success and zero if an error occurs.

	procedure Xm_Buf_Change_Buffer_Attributes
		     (Dpy : in X_Lib.Display;
		      Buffer : in Multi_Buffer;
		      Value_Mask : in X_Masks.Mask_Type;
		      Attributes : in Xm_Buf_Set_Buffer_Attributes);

	-- Sets the attributes for the indicated buffer.  This is currently
	-- limited to the event_mask.

	procedure Xm_Buf_Get_Screen_Info
		     (Dpy : in X_Lib.Display;
		      Drawable : in X_Lib.Drawable;
		      Mono_Info_Return : out Xm_Buf_Buffer_Info_List;
		      Stereo_Info_Return : out Xm_Buf_Buffer_Info_List;
		      Status : out X_Lib.X_Integer);

	-- Gets the parameters controlling how mono and stereo windows may be
	-- created on the screen of the given drawable.  The numbers of sets of
	-- visual and depths are returned in nmono_return and nstereo_return.  If
	-- nmono_return is greater than zero, then mono_info_return is set to the
	-- address of an array of XmbufBufferInfo structures describing the
	-- various visuals and depths that may be used.  Otherwise,
	-- mono_info_return is set to NULL.  Similarly, stereo_info_return is set
	-- according to nstereo_return.  The storage returned in mono_info_return
	-- and stereo_info_return may be released by XFree.  If no errors are
	-- encounted, non-zero will be returned.


	function Xm_Buf_Create_Stereo_Window
		    (Dpy : in X_Lib.Display;
		     Parent : in X_Lib.Window;
		     X : in X_Lib.Coordinate;
		     Y : in X_Lib.Coordinate;
		     Width : in X_Lib.Width_Height;
		     Height : in X_Lib.Width_Height;
		     Border_Width : in X_Lib.Width_Height;
		     Depth : in X_Lib.X_Integer;
		     Class : in X_Configuration_Dependent.Unsigned_Int;
		     Visual : in X_Lib.Visual;
		     Value_Mask : in X_Masks.Mask_Type;
		     Attributes : in X_Lib.Set_Window_Attributes_Record;
		     Left_Return : in Multi_Buffer;
		     Right_Return : in Multi_Buffer) return X_Lib.Window;

	-- Creates a stereo window in the same way that XCreateWindow creates
	-- a mono window.  The buffer ids for the left and right buffers are
	-- returned in left_return and right_return, respectively.  If an
	-- extension error handler that returns is installed, None will be
	-- returned if the extension is not available on this display.
    end Multi_Buf;

    package Shape is
	Xshape_Query_Version : constant := 0;
	Xshape_Rectangles : constant := 1;
	Xshape_Mask : constant := 2;
	Xshape_Combine : constant := 3;
	Xshape_Offset : constant := 4;
	Xshape_Query_Extents : constant := 5;
	Xshape_Select_Input : constant := 6;
	Xshape_Input_Selected : constant := 7;
	Xshape_Get_Rectangles : constant := 8;

	Shape_Set : constant := 0;
	Shape_Union : constant := 1;
	Shape_Intersect : constant := 2;
	Shape_Subtract : constant := 3;
	Shape_Invert : constant := 4;

	Shape_Bounding : constant := 0;
	Shape_Clip : constant := 1;

	Shape_Notify_Mask : constant := 1;
	Shape_Notify : constant := 0;

	Shape_Number_Events : constant := 1;

	-- The record defines
	--    Type of event
	--    Serial number of last request processed by server
	--    Send_Event is true if this came from a SendEvent request
	--    Display the event was read from
	--    Window of event
	--    ShapeBounding or ShapeClip
	--    extents of new region
	--    Server timestamp when region changed
	--    Shap is true if the region exists
	type X_Shape_Event is
	    record
		Types : X_Lib.Graphic_Output.Shape_Type;
		Serial : X_Lib.X_Id;
		Send_Event : X_Configuration_Dependent.Bool;
		Display : X_Lib.Display;
		Window : X_Lib.Window;
		Kind : X_Lib.X_Integer;
		X : X_Lib.Coordinate;
		Y : X_Lib.Coordinate;
		Width : X_Lib.Width_Height;
		Height : X_Lib.Width_Height;
		Time : X_Lib.Time;
		Shaped : X_Configuration_Dependent.Bool;
	    end record;

	for X_Shape_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Serial at 1 * Word_Size range 0 .. 31;
		Send_Event at 2 * Word_Size range 0 .. 31;
		Display at 3 * Word_Size range 0 .. 31;
		Window at 4 * Word_Size range 0 .. 31;
		Kind at 5 * Word_Size range 0 .. 31;
		X at 6 * Word_Size range 0 .. 31;
		Y at 7 * Word_Size range 0 .. 31;
		Width at 8 * Word_Size range 0 .. 31;
		Height at 9 * Word_Size range 0 .. 31;
		Time at 10 * Word_Size range 0 .. 31;
		Shaped at 11 * Word_Size range 0 .. 31;
	    end record;

	procedure X_Shape_Query_Extension
		     (Dpy : in X_Lib.Display;
		      Event_Basep : in out X_Lib.Events.Event_Type;
		      Error_Basep : in out X_Lib.Events.Event_Type;
		      Status : out X_Lib.X_Integer);

	procedure X_Shape_Query_Version
		     (Dpy : in X_Lib.Display;
		      Major_Versionp : in out X_Lib.X_Integer;
		      Minor_Versionp : in out X_Lib.X_Integer;
		      Status : out X_Lib.X_Integer);

	procedure X_Shape_Combine_Region (Dpy : in X_Lib.Display;
					  Dest : in X_Lib.Window;
					  Dest_Kind : in X_Lib.X_Integer;
					  X_Off : in X_Lib.Coordinate;
					  Y_Off : in X_Lib.Coordinate;
					  Region : in X_Lib.Ext_Region;
					  Op : in X_Lib.X_Integer);

	procedure X_Shape_Combine_Rectangles
		     (Dpy : in X_Lib.Display;
		      Dest : in X_Lib.Window;
		      Dest_Kind : in X_Lib.X_Integer;
		      X_Off : in X_Lib.Coordinate;
		      Y_Off : in X_Lib.Coordinate;
		      Rects : in X_Lib.Rectangle;
		      N_Rects : in X_Lib.X_Integer;
		      Op : in X_Lib.X_Integer;
		      Ordering : in X_Lib.Graphic_Output.Ordering_Type);

	procedure X_Shape_Combine_Mask (Dpy : in X_Lib.Display;
					Dest : in X_Lib.Window;
					Dest_Kind : in X_Lib.X_Integer;
					X_Off : in X_Lib.Coordinate;
					Y_Off : in X_Lib.Coordinate;
					Src : in X_Lib.Pixmap;
					Op : in X_Lib.X_Integer);

	procedure X_Shape_Combine_Shape
		     (Dpy : in X_Lib.Display;
		      Dest : in X_Lib.Window;
		      Dest_Kind : in X_Lib.X_Integer;
		      X_Off : in X_Lib.Coordinate;
		      Y_Off : in X_Lib.Coordinate;
		      Src : in X_Lib.Window;
		      Src_Kind : in X_Lib.Graphic_Output.Shape_Type;
		      Op : in X_Lib.X_Integer);

	procedure X_Shape_Offset_Shape (Dpy : in X_Lib.Display;
					Dest : in X_Lib.Window;
					Dest_Kind : in X_Lib.X_Integer;
					X_Off : in X_Lib.Coordinate;
					Y_Off : in X_Lib.Coordinate);

	procedure X_Shape_Query_Extents
		     (Dpy : in X_Lib.Display;
		      Window : in X_Lib.Window;
		      B_Shaped : in out X_Configuration_Dependent.Bool;
		      X_Bs : in out X_Lib.Coordinate;
		      Y_Bs : in out X_Lib.Coordinate;
		      W_Bs : in out X_Lib.Width_Height;
		      H_Bs : in out X_Lib.Width_Height;
		      C_Shaped : in out X_Configuration_Dependent.Bool;
		      X_Cs : in out X_Lib.Coordinate;
		      Y_Cs : in out X_Lib.Coordinate;
		      W_Cs : in out X_Lib.Width_Height;
		      H_Cs : in out X_Lib.Width_Height;
		      Status : out X_Lib.X_Integer);

	procedure X_Shape_Select_Input (Dpy : in X_Lib.Display;
					Window : in X_Lib.Window;
					Mask : in X_Masks.Mask_Type);

	function X_Shape_Input_Selected
		    (Dpy : in X_Lib.Display; Window : in X_Lib.Window)
		    return X_Lib.X_Id;

	procedure X_Shape_Get_Rectangles
		     (Dpy : in X_Lib.Display;
		      Window : in X_Lib.Window;
		      Kind : in X_Lib.X_Integer;
		      Count : in out X_Lib.X_Integer;
		      Ordering : in out X_Lib.Graphic_Output.Ordering_Type;
		      Rect : out X_Lib.Rectangle);
    end Shape;

    package X_Shm is
	Xshm_Query_Version : constant := 0;
	Xshm_Attach : constant := 1;
	Xshm_Detach : constant := 2;
	Xshm_Put_Image : constant := 3;
	Xshm_Get_Image : constant := 4;
	Xshm_Create_Pixmap : constant := 5;

	Shm_Completion : constant := 0;
	Shm_Number_Events : constant := 1;

	Bad_Shm_Seg : constant := 0;
	Shm_Number_Errors : constant := 1;

	subtype Shm_Seg is X_Lib.X_Id;

	type X_Shm_Completion_Event is
	    record
		Types : X_Lib.Events.Event_Queue_Mode_Type;
		Serial : X_Configuration_Dependent.Bool;
		Send_Event : X_Lib.Events.Event_Type;
		Display : X_Lib.Display;    -- Display the event was read from
		Drawable : X_Lib.Drawable;   -- drawable of request
		Major_Code : X_Lib.X_Integer;  -- ShmReqCode
		Minor_Code : X_Lib.X_Integer;  -- X_ShmPutImage
		Shm_Segmnet : Shm_Seg;            -- the ShmSeg used in the request
		Off_Set : X_Configuration_Dependent.Unsigned_Long;
		-- the offset into ShmSeg used in the request
	    end record;

	for X_Shm_Completion_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Serial at 1 * Word_Size range 0 .. 31;
		Send_Event at 2 * Word_Size range 0 .. 31;
		Display at 3 * Word_Size range 0 .. 31;
		Drawable at 4 * Word_Size range 0 .. 31;
		Major_Code at 5 * Word_Size range 0 .. 31;
		Minor_Code at 6 * Word_Size range 0 .. 31;
		Shm_Segmnet at 7 * Word_Size range 0 .. 31;
		Off_Set at 8 * Word_Size range 0 .. 31;
	    end record;

	type X_Shm_Segment_Info is
	    record
		Shm_Segment : Shm_Seg;                         -- resource id
		Shm_Id : X_Lib.X_Integer;                 -- kernel id
		Shm_Addr : X_Lib.String_Pointer;            -- address in client
		Read_Only : X_Configuration_Dependent.Bool;
		-- how the server should attach it
	    end record;

	for X_Shm_Segment_Info use
	    record
		Shm_Segment at 0 * Word_Size range 0 .. 31;
		Shm_Id at 1 * Word_Size range 0 .. 31;
		Shm_Addr at 2 * Word_Size range 0 .. 31;
		Read_Only at 3 * Word_Size range 0 .. 31;
	    end record;

	procedure X_Shm_Query_Version
		     (Dpy : in X_Lib.Display;
		      Major_Version : in out X_Lib.X_Integer;
		      Minor_Version : in out X_Lib.X_Integer;
		      Shared_Pixmaps : in out X_Configuration_Dependent.Bool;
		      Status : out X_Configuration_Dependent.Bool);

	function X_Shm_Pixmap_Format
		    (Dpy : in X_Lib.Display) return X_Lib.X_Integer;

	procedure X_Shm_Attach (Dpy : in X_Lib.Display;
				Shm_Info : in out X_Shm_Segment_Info;
				Status : out X_Lib.X_Integer);

	function X_Shm_Detach (Dpy : in X_Lib.Display;
			       Shm_Info : in X_Shm_Segment_Info)
			      return X_Lib.X_Integer;

	function X_Shm_Put_Image
		    (Dpy : in X_Lib.Display;
		     Drawable : in X_Lib.Drawable;
		     Gc : in X_Lib.Graphic_Output.Graphic_Context;
		     Image : in X_Lib.Graphic_Output.Image;
		     Src_X : in X_Lib.Coordinate;
		     Src_Y : in X_Lib.Coordinate;
		     Dst_X : in X_Lib.Coordinate;
		     Dst_Y : in X_Lib.Coordinate;
		     Src_Width : in X_Lib.Width_Height;
		     Src_Height : in X_Lib.Width_Height;
		     Send_Event : in X_Configuration_Dependent.Bool)
		    return X_Lib.X_Integer;

	function X_Shm_Get_Image
		    (Dpy : in X_Lib.Display;
		     Drawable : in X_Lib.Drawable;
		     Image : in X_Lib.Graphic_Output.Image;
		     X : in X_Lib.Coordinate;
		     Y : in X_Lib.Coordinate;
		     Plane_Mask : in X_Lib.Plane_Mask) return X_Lib.X_Integer;

	function X_Shm_Create_Image (Dpy : in X_Lib.Display;
				     Visual : in X_Lib.Visual;
				     Depth : in X_Lib.Depth_Type;
				     Format : in X_Lib.Pixmap_Format;
				     Data : in String;
				     Shm_Info : in X_Shm_Segment_Info;
				     Width : in X_Lib.Width_Height;
				     Height : in X_Lib.Width_Height)
				    return X_Lib.Graphic_Output.Image;

	function X_Shm_Create_Pixmap
		    (Dpy : in X_Lib.Display;
		     Drawable : in X_Lib.Drawable;
		     Data : in String;
		     Shm_Info : in X_Shm_Segment_Info;
		     Width : in X_Lib.Width_Height;
		     Height : in X_Lib.Width_Height;
		     Depth : in X_Lib.Depth_Type) return X_Lib.Pixmap;
    end X_Shm;

    package X_Test_Ext1 is
	--  used in the XTestPressButton and XTestPressKey functions
	X_Test_Press : constant := 1;
	X_Test_Release : constant := 2;
	X_Test_Stroke : constant := 4;

	--  used in the XTestGetInput function
	X_Test_Exclusive : constant := 1;
	X_Test_Packed_Actions : constant := 2;
	X_Test_Packed_Motion : constant := 4;


	-- *********************************************************************
	-- * When doing a key or button stroke, the number of milliseconds
	-- * to delay between the press and the release of a key or button
	-- * in the X_Test_PressButton and XTestPressKey functions.

	X_Test_Stroke_Delay_Time : constant := 10;

	-- used in the X_Test_FakeInput function

	X_Test_Fake_Ack_Not_Needed : constant := 0;
	X_Test_Fake_Ack_Request : constant := 1;

	-- used in the X_Test_ extension initialization routine

	X_Test_Extension_Name : constant String :=
	   "XTestExtension1" & Ascii.Nul;
	X_Test_Event_Count : constant := 2;

	-- *******************************************************************
	-- * X_Test_ request type values
	-- *
	-- * used in the X_Test_ extension protocol requests

	X_Test_Fake_Input : constant := 1;
	X_Test_Get_Input : constant := 2;
	X_Test_Stop_Input : constant := 3;
	X_Test_Reset : constant := 4;
	X_Test_Query_Input_Size : constant := 5;

	-- **********************************************************************
	-- * This defines the maximum size of a list of input actions to be
	-- * sent to the server.  It should always be a multiple of 4 so that
	-- * the entire xTestFakeInputReq structure size is a multiple of 4.

	X_Test_Max_Action_List_Size : constant := 64;

	type X_Test_Fake_Input_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;-- X_Test_ReqCode
		X_Test_Req_Type : X_Configuration_Dependent.
				     Card8;-- X_TestFakeInput
		Length : X_Configuration_Dependent.Card16;
		-- 2 + X_Test_MAX_ACTION_LIST_SIZE/4
		Ack : X_Configuration_Dependent.Card32;
		Action_List : X_Lib.Byte_Array
				 (1 .. X_Test_Max_Action_List_Size);
	    end record;

	for X_Test_Fake_Input_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		X_Test_Req_Type at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Ack at 1 * Word_Size range 0 .. 31;
		Action_List at 2 * Word_Size
		   range 0 .. 8 * X_Test_Max_Action_List_Size - 1;
	    end record;

	Sz_X_Test_Fake_Input_Req : constant := 72;

	type X_Test_Get_Input_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;-- X_TestReqCode
		X_Test_Req_Type : X_Configuration_Dependent.
				     Card8;-- X_TestGetInput
		Length : X_Configuration_Dependent.Card16; -- 2
		Mode : X_Configuration_Dependent.Card32;
	    end record;

	for X_Test_Get_Input_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		X_Test_Req_Type at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
		Mode at 1 * Word_Size range 0 .. 31;
	    end record;

	Sz_X_Test_Get_Input_Req : constant := 8;

	type X_Test_Stop_Input_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;-- X_TestReqCode
		X_Test_Req_Type : X_Configuration_Dependent.Card8;
		Length : X_Configuration_Dependent.Card16;
	    end record;

	for X_Test_Stop_Input_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		X_Test_Req_Type at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
	    end record;

	Sz_X_Test_Stop_Input_Req : constant := 4;

	type X_Test_Reset_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;-- X_TestReqCode
		X_Test_Req_Type : X_Configuration_Dependent.Card8;-- X_TestReset
		Length : X_Configuration_Dependent.Card16; -- 1
	    end record;

	for X_Test_Reset_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		X_Test_Req_Type at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
	    end record;

	Sz_X_Test_Reset_Req : constant := 4;

	type X_Test_Query_Input_Size_Req is
	    record
		Req_Type : X_Configuration_Dependent.Card8;-- X_TestReqCode
		X_Test_Req_Type : X_Configuration_Dependent.Card8;
		-- X_TestQueryInputSize
		Length : X_Configuration_Dependent.Card16; -- 1
	    end record;

	for X_Test_Query_Input_Size_Req use
	    record
		Req_Type at 0 * Word_Size range 0 .. 7;
		X_Test_Req_Type at 0 * Word_Size + 1 range 0 .. 7;
		Length at 0 * Word_Size + 2 range 0 .. 15;
	    end record;

	Sz_X_Test_Query_Input_Size_Req : constant := 4;

	-- *******************************************************************
	-- * This is the definition of the reply for the xTestQueryInputSize
	-- * request.  It should remain the same minimum size as other replies
	-- * (32 bytes).

	type X_Test_Query_Input_Size_Reply is
	    record
		Types : X_Configuration_Dependent.Card8;-- always X_Reply
		Pad1 : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Length : X_Configuration_Dependent.Card32;-- always 0
		Size_Return : X_Configuration_Dependent.Card32;
		Pad2 : X_Configuration_Dependent.Card32;
		Pad3 : X_Configuration_Dependent.Card32;
		Pad4 : X_Configuration_Dependent.Card32;
		Pad5 : X_Configuration_Dependent.Card32;
		Pad6 : X_Configuration_Dependent.Card32;
	    end record;

	for X_Test_Query_Input_Size_Reply use
	    record
		Types at 0 * Word_Size range 0 .. 7;
		Pad1 at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Length at 1 * Word_Size range 0 .. 31;
		Size_Return at 2 * Word_Size range 0 .. 31;
		Pad2 at 3 * Word_Size range 0 .. 31;
		Pad3 at 4 * Word_Size range 0 .. 31;
		Pad4 at 5 * Word_Size range 0 .. 31;
		Pad5 at 6 * Word_Size range 0 .. 31;
		Pad6 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ********************************************************************
	-- * This is the definition for the input action wire event structure.
	-- * This event is sent to the client when the server has one or more
	-- * user input actions to report to the client.  It must remain the
	-- * same size as all other wire events (32 bytes).

	X_Test_Actions_Size : constant := 28;

	type Xtest_Input_Action_Event is
	    record
		Types : X_Configuration_Dependent.Card8;
		-- X_Test_InputActionType
		Pad00 : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Actions : X_Lib.Byte_Array (1 .. X_Test_Actions_Size);
	    end record;

	for Xtest_Input_Action_Event use
	    record
		Types at 0 * Word_Size range 0 .. 7;
		Pad00 at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Actions at 1 * Word_Size range 0 .. 8 * X_Test_Actions_Size - 1;
	    end record;

	-- *******************************************************************
	-- * This is the definition for the xTestFakeAck wire event structure.
	-- * This event is sent to the client when the server has completely
	-- * processed its input action buffer, and is ready for more.
	-- * It must remain the same size as all other wire events (32 bytes).

	type Xtest_Fake_Ack_Event is
	    record
		Types : X_Configuration_Dependent.Card8;
		-- X_Test_FakeAckType
		Pad00 : X_Configuration_Dependent.Card8;
		Sequence_Number : X_Configuration_Dependent.Card16;
		Pad02 : X_Configuration_Dependent.Card32;
		Pad03 : X_Configuration_Dependent.Card32;
		Pad04 : X_Configuration_Dependent.Card32;
		Pad05 : X_Configuration_Dependent.Card32;
		Pad06 : X_Configuration_Dependent.Card32;
		Pad07 : X_Configuration_Dependent.Card32;
		Pad08 : X_Configuration_Dependent.Card32;
	    end record;

	for Xtest_Fake_Ack_Event use
	    record
		Types at 0 * Word_Size range 0 .. 7;
		Pad00 at 0 * Word_Size + 1 range 0 .. 7;
		Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
		Pad02 at 1 * Word_Size range 0 .. 31;
		Pad03 at 2 * Word_Size range 0 .. 31;
		Pad04 at 3 * Word_Size range 0 .. 31;
		Pad05 at 4 * Word_Size range 0 .. 31;
		Pad06 at 5 * Word_Size range 0 .. 31;
		Pad07 at 6 * Word_Size range 0 .. 31;
		Pad08 at 7 * Word_Size range 0 .. 31;
	    end record;

	-- *********************************************************************
	-- * The server side of this extension does not (and should not) have
	-- * definitions for X_Lib.Display and X_Lib.Window.  The ifndef allows
	-- * the server side of the extension to ignore the following typedefs.

	-- *********************************************************************
	-- * This is the definition for the input action host format event
	-- * structure. This is the form that a client using this extension will
	-- * see when it receives an input action event.

	type X_Test_Input_Action_Event is
	    record
		Types : X_Lib.Events.Event_Queue_Mode_Type;
		-- X_Test_InputActionType
		Display : X_Lib.Display;
		Window : X_Lib.Window;
		Actions : X_Lib.Byte_Array (1 .. X_Test_Actions_Size);
	    end record;

	for X_Test_Input_Action_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Display at 1 * Word_Size range 0 .. 31;
		Window at 2 * Word_Size range 0 .. 31;
		Actions at 3 * Word_Size range 0 .. 8 * X_Test_Actions_Size - 1;
	    end record;

	-- *********************************************************************
	-- * This is the definition for the xTestFakeAck host format event
	-- * structure. This is the form that a client using this extension
	-- * will see when it receives an X_Test_FakeAck event.

	type X_Test_Fake_Ack_Event is
	    record
		Types : X_Lib.Events.Event_Type;    -- X_Test_FakeAckType
		Display : X_Lib.Display;
		Window : X_Lib.Window;
	    end record;

	for X_Test_Fake_Ack_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Display at 1 * Word_Size range 0 .. 31;
		Window at 2 * Word_Size range 0 .. 31;
	    end record;

	-- *********************************************************************
	-- * This is the definition for the format of the header byte in the
	-- * input action structures.

	X_Test_Action_Type_Mask : constant := 16#03#;    -- bits 0 and 1
	X_Test_Key_State_Mask : constant := 16#04#;    -- bit 2 (key action)
	X_Test_X_Sign_Bit_Mask : constant := 16#04#;    -- bit 2 (motion action)
	X_Test_Y_Sign_Bit_Mask : constant := 16#08#;    -- bit 3 (motion action)
	X_Test_Device_Id_Mask : constant := 16#F0#;    -- bits 4 through 7
	X_Test_Max_Device_Id : constant := 16#0F#;

	-- These are the possible action types.

	X_Test_Delay_Action : constant := 0;
	X_Test_Key_Action : constant := 1;
	X_Test_Motion_Action : constant := 2;
	X_Test_Jump_Action : constant := 3;

	-- These are the definitions for key/button motion input actions.

	X_Test_Key_Up : constant := 16#04#;
	X_Test_Key_Down : constant := 16#00#;

	type X_Test_Key_Info is
	    record
		Header : X_Configuration_Dependent.Card8;-- device, key up/down
		Key_Code : X_Lib.Keyboard.Key_Code;        -- key/button to move
		Delay_Time : X_Configuration_Dependent.Card16;  -- delay in ms.
	    end record;

	for X_Test_Key_Info use
	    record
		Header at 0 * Word_Size range 0 .. 7;
		Key_Code at 0 * Word_Size + 1 range 0 .. 7;
		Delay_Time at 0 * Word_Size + 2 range 0 .. 15;
	    end record;

	-- *********************************************************************
	-- * This is the definition for poX_Configuration_Dependent.Inter jump
	-- * input actions.

	type X_Test_Jump_Info is
	    record
		Header : X_Configuration_Dependent.Card8; -- which pointer
		Pad1 : X_Configuration_Dependent.Card8;-- unused padding byte
		Jump_X : X_Configuration_Dependent.Card16;-- x coord to jump to
		Jump_Y : X_Configuration_Dependent.Card16;-- y coord to jump to
		Delay_Time : X_Configuration_Dependent.Card16;-- delay (in ms)
	    end record;

	for X_Test_Jump_Info use
	    record
		Header at 0 * Word_Size range 0 .. 7;
		Pad1 at 0 * Word_Size + 1 range 0 .. 7;
		Jump_X at 0 * Word_Size + 2 range 0 .. 15;
		Jump_Y at 1 * Word_Size range 0 .. 15;
		Delay_Time at 1 * Word_Size + 2 range 0 .. 15;
	    end record;

	-- ********************************************************************
	-- * These are the definitions for poX_Configuration_Dependent.Inter
	-- * relative motion input actions.
	-- *
	-- * The sign bits for the x and y relative motions are contained
	-- * in the header byte.  The x and y relative motions are packed
	-- * X_Configuration_Dependent.Into one byte to make things fit in
	-- * 32 bits.  If the relative
	-- * motion range is larger than +/-15, use the
	-- * poX_Configuration_Dependent.Inter jump action.

	X_Test_Motion_Max : constant := 15;
	X_Test_Motion_Min : constant := -15;

	X_Test_X_Negative : constant := 16#04#;
	X_Test_Y_Negative : constant := 16#08#;

	X_Test_X_Motion_Mask : constant := 16#0F#;
	X_Test_Y_Motion_Mask : constant := 16#F0#;

	function X_Test_Pack_Device_Id
		    (X : in X_Masks.Mask_Type) return X_Masks.Mask_Type;

	function X_Test_Unpack_Device_Id
		    (X : in X_Masks.Mask_Type) return X_Masks.Mask_Type;

	function X_Test_Pack_X_Motion_Value
		    (X : in X_Masks.Mask_Type) return X_Masks.Mask_Type;

	function X_Test_Pack_Y_Motion_Value
		    (X : in X_Masks.Mask_Type) return X_Masks.Mask_Type;

	function X_Test_Unpack_X_Motion_Value
		    (X : in X_Masks.Mask_Type) return X_Masks.Mask_Type;

	function X_Test_Unpack_Y_Motion_Value
		    (X : in X_Masks.Mask_Type) return X_Masks.Mask_Type;

	type X_Test_Motion_Info is
	    record
		Header : X_Configuration_Dependent.Card8;-- which pointer
		Motion_Data : X_Configuration_Dependent.
				 Card8;-- x,y relative motion
		Delay_Time : X_Configuration_Dependent.Card16; -- delay (in ms)
	    end record;

	for X_Test_Motion_Info use
	    record
		Header at 0 * Word_Size range 0 .. 7;
		Motion_Data at 0 * Word_Size + 1 range 0 .. 7;
		Delay_Time at 1 * Word_Size + 2 range 0 .. 15;
	    end record;

	-- ********************************************************************
	-- * These are the definitions for a long delay input action.  It is
	-- * used when more than X_Test_SHORT_DELAY_TIME milliseconds of delay
	-- * (approximately one minute) is needed.
	-- *
	-- * The device ID for a delay is always set to X_Test_DELAY_DEVICE_ID.
	-- * This guarantees that a header byte with a value of 0 is not
	-- * a valid header, so it can be used as a flag to indicate that
	-- * there are no more input actions in an X_Test_InputAction event.

	X_Test_Short_Delay_Time : constant := 16#FFFF#;
	X_Test_Delay_Device_Id : constant := 16#0F#;

	type X_Test_Delay_Info is
	    record
		Header : X_Configuration_Dependent.Card8;
		-- X_TestDELAY_DEVICE_ID
		Pad1 : X_Configuration_Dependent.Card8;
		Pad2 : X_Configuration_Dependent.Card16;
		Delay_Time : X_Configuration_Dependent.Card32;-- delay (in ms)
	    end record;

	for X_Test_Delay_Info use
	    record
		Header at 0 * Word_Size range 0 .. 7;
		Pad1 at 0 * Word_Size + 1 range 0 .. 7;
		Pad2 at 0 * Word_Size + 2 range 0 .. 15;
		Delay_Time at 1 * Word_Size range 0 .. 31;
	    end record;
    end X_Test_Ext1;

    package X_I is
	-- Definitions used by the server, library and client

	Sz_X_Get_Extension_Version_Req : constant := 8;
	Sz_X_Get_Extension_Version_Reply : constant := 32;
	Sz_X_List_Input_Devices_Req : constant := 4;
	Sz_X_List_Input_Devices_Reply : constant := 32;
	Sz_X_Open_Device_Req : constant := 8;
	Sz_X_Open_Device_Reply : constant := 32;
	Sz_X_Close_Device_Req : constant := 8;
	Sz_X_Set_Device_Mode_Req : constant := 8;
	Sz_X_Set_Device_Mode_Reply : constant := 32;
	Sz_X_Select_Extension_Event_Req : constant := 12;
	Sz_X_Get_Selected_Extension_Events_Req : constant := 8;
	Sz_X_Get_Selected_Extension_Events_Reply : constant := 32;
	Sz_X_Change_Device_Dont_Propagate_List_Req : constant := 12;
	Sz_X_Get_Device_Dont_Propagate_List_Req : constant := 8;
	Sz_X_Get_Device_Dont_Propagate_List_Reply : constant := 32;
	Sz_X_Get_Device_Motion_Events_Req : constant := 16;
	Sz_X_Get_Device_Motion_Events_Reply : constant := 32;
	Sz_X_Change_Keyboard_Device_Req : constant := 8;
	Sz_X_Change_Keyboard_Device_Reply : constant := 32;
	Sz_X_Change_Pointer_Device_Req : constant := 8;
	Sz_X_Change_Pointer_Device_Reply : constant := 32;
	Sz_X_Grab_Device_Req : constant := 20;
	Sz_X_Grab_Device_Reply : constant := 32;
	Sz_X_Ungrab_Device_Req : constant := 12;
	Sz_X_Grab_Device_Key_Req : constant := 20;
	Sz_X_Grab_Device_Key_Reply : constant := 32;
	Sz_X_Ungrab_Device_Key_Req : constant := 16;
	Sz_X_Grab_Device_Button_Req : constant := 20;
	Sz_X_Grab_Device_Button_Reply : constant := 32;
	Sz_X_Ungrab_Device_Button_Req : constant := 16;
	Sz_X_Allow_Device_Events_Req : constant := 12;
	Sz_X_Get_Device_Focus_Req : constant := 8;
	Sz_X_Get_Device_Focus_Reply : constant := 32;
	Sz_X_Set_Device_Focus_Req : constant := 16;
	Sz_X_Get_Feedback_Control_Req : constant := 8;
	Sz_X_Get_Feedback_Control_Reply : constant := 32;
	Sz_X_Change_Feedback_Control_Req : constant := 12;
	Sz_X_Get_Device_Key_Mapping_Req : constant := 8;
	Sz_X_Get_Device_Key_Mapping_Reply : constant := 32;
	Sz_X_Change_Device_Key_Mapping_Req : constant := 8;
	Sz_X_Get_Device_Modifier_Mapping_Req : constant := 8;
	Sz_X_Set_Device_Modifier_Mapping_Req : constant := 8;
	Sz_X_Set_Device_Modifier_Mapping_Reply : constant := 32;
	Sz_X_Get_Device_Button_Mapping_Req : constant := 8;
	Sz_X_Get_Device_Button_Mapping_Reply : constant := 32;
	Sz_X_Set_Device_Button_Mapping_Req : constant := 8;
	Sz_X_Set_Device_Button_Mapping_Reply : constant := 32;
	Sz_X_Query_Device_State_Req : constant := 8;
	Sz_X_Query_Device_State_Reply : constant := 32;
	Sz_X_Send_Extension_Event_Req : constant := 16;
	Sz_X_Device_Bell_Req : constant := 8;
	Sz_X_Set_Device_Valuators_Req : constant := 8;
	Sz_X_Set_Device_Valuators_Reply : constant := 32;
	Sz_X_Get_Device_Control_Req : constant := 8;
	Sz_X_Get_Device_Control_Reply : constant := 32;
	Sz_X_Change_Device_Control_Req : constant := 8;
	Sz_X_Change_Device_Control_Reply : constant := 32;

	I_Name : constant String := "XInputExtension" & Ascii.Nul;

	Xi_Keyboard : constant String := "KEYBOARD" & Ascii.Nul;
	Xi_Mouse : constant String := "MOUSE" & Ascii.Nul;
	Xi_Tablet : constant String := "TABLET" & Ascii.Nul;
	Xi_Touchscreen : constant String := "TOUCHSCREEN" & Ascii.Nul;
	Xi_Touchpad : constant String := "TOUCHPAD" & Ascii.Nul;
	Xi_Barcode : constant String := "BARCODE" & Ascii.Nul;
	Xi_Buttonbox : constant String := "BUTTONBOX" & Ascii.Nul;
	Xi_Knob_Box : constant String := "KNOB_BOX" & Ascii.Nul;
	Xi_One_Knob : constant String := "ONE_KNOB" & Ascii.Nul;
	Xi_Nine_Knob : constant String := "NINE_KNOB" & Ascii.Nul;
	Xi_Trackball : constant String := "TRACKBALL" & Ascii.Nul;
	Xi_Quadrature : constant String := "QUADRATURE" & Ascii.Nul;
	Xi_Id_Module : constant String := "ID_MODULE" & Ascii.Nul;
	Xi_Spaceball : constant String := "SPACEBALL" & Ascii.Nul;
	Xi_Dataglove : constant String := "DATAGLOVE" & Ascii.Nul;
	Xi_Eyetracker : constant String := "EYETRACKER" & Ascii.Nul;
	Xi_Cursorkeys : constant String := "CURSORKEYS" & Ascii.Nul;
	Xi_Footmouse : constant String := "FOOTMOUSE" & Ascii.Nul;

	Dont_Check : constant := 0;
	X_Input_Initial_Release : constant := 1;
	Xinput_Add_X_Device_Bell : constant := 2;
	Xinput_Add_X_Set_Device_Valuators : constant := 3;
	Xinput_Add_X_Change_Device_Control : constant := 4;

	Xi_Absent : constant := 0;
	Xi_Present : constant := 1;

	Xi_Initial_Release_Major : constant := 1;
	Xi_Initial_Release_Minor : constant := 0;

	Xi_Add_X_Device_Bell_Major : constant := 1;
	Xi_Add_X_Device_Bell_Minor : constant := 1;

	Xi_Add_X_Set_Device_Valuators_Major : constant := 1;
	Xi_Add_X_Set_Device_Valuators_Minor : constant := 2;

	Xi_Add_X_Change_Device_Control_Major : constant := 1;
	Xi_Add_X_Change_Device_Control_Minor : constant := 3;

	Device_Resolution : constant := 1;

	No_Such_Extension : constant := 1;

	Count : constant := 0;
	Create : constant := 1;

	New_Pointer : constant := 0;
	New_Keyboard : constant := 1;

	X_Pointer : constant := 0;
	X_Keyboard : constant := 1;

	Use_X_Keyboard : constant := 16#FF#;

	Is_X_Pointer : constant := 0;
	Is_X_Keyboard : constant := 1;
	Is_X_Extension_Device : constant := 2;

	Async_This_Device : constant := 0;
	Sync_This_Device : constant := 1;
	Replay_This_Device : constant := 2;
	Async_Other_Devices : constant := 3;
	Async_All : constant := 4;
	Sync_All : constant := 5;

	Follow_Key_Board : constant := 3;
	Revert_To_Follow_Keyboard : constant := 3;

	Dv_Accel_Num : constant := 1;
	Dv_Accel_Denom : constant := 2;
	Dv_Threshold : constant := 4;

	Dv_Key_Click_Percent : constant := 1;
	Dv_Percent : constant := 2;
	Dv_Pitch : constant := 4;
	Dv_Duration : constant := 8;
	Dv_Led : constant := 16;
	Dv_Led_Mode : constant := 32;
	Dv_Key : constant := 64;
	Dv_Auto_Repeat_Mode : constant := 128;

	Device_Mode : constant := 1;
	Dv_String : constant := 1;
	Dv_Integer : constant := 1;

	Relative : constant := 0;
	Absolute : constant := 1;

	Proximity_State : constant := 2;
	In_Proximity : constant := 0;
	Out_Of_Proximity : constant := 2;

	Add_To_List : constant := 0;
	Delete_From_List : constant := 1;

	Key_Class : constant := 0;
	Button_Class : constant := 1;
	Valuator_Class : constant := 2;
	Feedback_Class : constant := 3;
	Proximity_Class : constant := 4;
	Focus_Class : constant := 5;
	Other_Class : constant := 6;

	Kbd_Feedback_Class : constant := 0;
	Ptr_Feedback_Class : constant := 1;
	String_Feedback_Class : constant := 2;
	Integer_Feedback_Class : constant := 3;
	Led_Feedback_Class : constant := 4;
	Bell_Feedback_Class : constant := 5;

	Device_Pointer_Motion_Hint : constant := 0;
	Device_Button1_Motion : constant := 1;
	Device_Button2_Motion : constant := 2;
	Device_Button3_Motion : constant := 3;
	Device_Button4_Motion : constant := 4;
	Device_Button5_Motion : constant := 5;
	Device_Button_Motion : constant := 6;
	Device_Button_Grab : constant := 7;
	Device_Owner_Grab_Button : constant := 8;
	No_Extension_Event : constant := 9;

	Xi_Bad_Device : constant := 0;
	Xi_Bad_Event : constant := 1;
	Xi_Bad_Mode : constant := 2;
	Xi_Device_Busy : constant := 3;
	Xi_Bad_Class : constant := 4;

	subtype X_Event_Class is X_Lib.X_Id;

	-- *******************************************************************
	-- *
	-- * Extension version structure.
	-- *

	type X_Extension_Version is
	    record
		Present : X_Lib.X_Integer;
		Major_Version : X_Lib.X_Short_Integer;
		Minor_Version : X_Lib.X_Short_Integer;
	    end record;

	for X_Extension_Version use
	    record
		Present at 0 * Word_Size range 0 .. 31;
		Major_Version at 1 * Word_Size range 0 .. 15;
		Minor_Version at 1 * Word_Size + 2 range 0 .. 15;
	    end record;
    end X_I;

    package X_Input is
	-- Definitions used by the library and client

	X_Device_Key_Press : constant := 0;
	X_Device_Key_Release : constant := 1;

	X_Device_Button_Press : constant := 0;
	X_Device_Button_Release : constant := 1;

	X_Device_Motion_Notify : constant := 0;

	X_Device_Focus_In : constant := 0;
	X_Device_Focus_Out : constant := 1;

	X_Proximity_In : constant := 0;
	X_Proximity_Out : constant := 1;

	X_Device_State_Notify : constant := 0;
	X_Device_Mapping_Notify : constant := 1;
	X_Change_Device_Notify : constant := 2;

	-- *********************************************************************
	-- *
	-- * X_Device_Key_events:  These events are sent by input devices that
	-- *    support input class Keys. The location of the X pointer is
	-- *    reported in the coordinate fields of the x,y and x_root, y_root
	-- *    fields.
	-- *
	-- * The record defines:
	-- *    Type of event
	-- *    Serial number of last request processed
	-- *    Send_Event is true if it is from SendEvent request
	-- *    Display from which the event was read
	-- *    "event" window reported relative to
	-- *    root window event occured on
	-- *    child window
	-- *    Time in milliseconds
	-- *    x, y coordinates in event window
	-- *    x, y coordinates relative to root
	-- *    State of key or button mask
	-- *    detail of Key code
	-- *    same screen flag
	-- *    Device State for device key or button mask

	type X_Device_Key_Event is
	    record
		Types : X_Lib.Events.Event_Type;
		Serial : X_Lib.X_Id;
		Send_Event : X_Configuration_Dependent.Bool;
		Display : X_Lib.Display;
		Window : X_Lib.Window;
		Device_Id : X_Lib.X_Id;
		Root : X_Lib.Window;
		Sub_Window : X_Lib.Window;
		Time : X_Lib.Time;
		X : X_Lib.Coordinate;
		Y : X_Lib.Coordinate;
		X_Root : X_Lib.Coordinate;
		Y_Root : X_Lib.Coordinate;
		State : X_Configuration_Dependent.Unsigned_Int;
		Key_Code : X_Configuration_Dependent.Unsigned_Int;
		Same_Screen : X_Configuration_Dependent.Bool;
		Device_State : X_Configuration_Dependent.Unsigned_Int;
		Axes_Count : X_Lib.X_Character;
		First_Axis : X_Lib.X_Character;
		Axis_Data : X_Lib.Long_Array (1 .. 6);
	    end record;
	for X_Device_Key_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Serial at 1 * Word_Size range 0 .. 31;
		Send_Event at 2 * Word_Size range 0 .. 31;
		Display at 3 * Word_Size range 0 .. 31;
		Window at 4 * Word_Size range 0 .. 31;
		Device_Id at 5 * Word_Size range 0 .. 31;
		Root at 6 * Word_Size range 0 .. 31;
		Sub_Window at 7 * Word_Size range 0 .. 31;
		Time at 8 * Word_Size range 0 .. 31;
		X at 9 * Word_Size range 0 .. 31;
		Y at 10 * Word_Size range 0 .. 31;
		X_Root at 11 * Word_Size range 0 .. 31;
		Y_Root at 12 * Word_Size range 0 .. 31;
		State at 13 * Word_Size range 0 .. 31;
		Key_Code at 14 * Word_Size range 0 .. 31;
		Same_Screen at 15 * Word_Size range 0 .. 31;
		Device_State at 16 * Word_Size range 0 .. 31;
		Axes_Count at 17 * Word_Size range 0 .. 7;
		First_Axis at 17 * Word_Size + 1 range 0 .. 7;
		Axis_Data at 18 * Word_Size range 0 .. 32 * 6 - 1;
	    end record;
	subtype X_Device_Key_Pressed_Event is X_Device_Key_Event;
	subtype X_Device_Key_Released_Event is X_Device_Key_Event;

	-- ********************************************************************
	-- *
	-- * X_Device_Button_Events: These events are sent by extension devices
	-- *    that support input class Buttons.
	-- *
	-- * The record defines:
	-- *    Type of event
	-- *    Serial number of last request processed
	-- *    Send_Event is true if it is from SendEvent request
	-- *    Display from which the event was read
	-- *    "event" window reported relative to
	-- *    root window event occured on
	-- *    child window
	-- *    Time in milliseconds
	-- *    x, y coordinates in event window
	-- *    x, y coordinates relative to root
	-- *    State of key or button mask
	-- *    detail of button
	-- *    same screen flag
	-- *    Device State for device key or button mask


	type X_Device_Button_Event is
	    record
		Types : X_Lib.Events.Event_Type;
		Serial : X_Lib.X_Id;
		Send_Event : X_Configuration_Dependent.Bool;
		Display : X_Lib.Display;
		Window : X_Lib.Window;
		Device_Id : X_Lib.X_Id;
		Root : X_Lib.Window;
		Sub_Window : X_Lib.Window;
		Time : X_Lib.Time;
		X : X_Lib.Coordinate;
		Y : X_Lib.Coordinate;
		X_Root : X_Lib.Coordinate;
		Y_Root : X_Lib.Coordinate;
		State : X_Configuration_Dependent.Unsigned_Int;
		Button : X_Lib.Events.Button_Name_Type;
		Same_Screen : X_Configuration_Dependent.Bool;
		Device_State : X_Configuration_Dependent.Unsigned_Int;
		Axes_Count : X_Lib.X_Character;
		First_Axis : X_Lib.X_Character;
		Axis_Data : X_Lib.Long_Array (1 .. 6);
	    end record;
	for X_Device_Button_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Serial at 1 * Word_Size range 0 .. 31;
		Send_Event at 2 * Word_Size range 0 .. 31;
		Display at 3 * Word_Size range 0 .. 31;
		Window at 4 * Word_Size range 0 .. 31;
		Device_Id at 5 * Word_Size range 0 .. 31;
		Root at 6 * Word_Size range 0 .. 31;
		Sub_Window at 7 * Word_Size range 0 .. 31;
		Time at 8 * Word_Size range 0 .. 31;
		X at 9 * Word_Size range 0 .. 31;
		Y at 10 * Word_Size range 0 .. 31;
		X_Root at 11 * Word_Size range 0 .. 31;
		Y_Root at 12 * Word_Size range 0 .. 31;
		State at 13 * Word_Size range 0 .. 31;
		Button at 14 * Word_Size range 0 .. 31;
		Same_Screen at 15 * Word_Size range 0 .. 31;
		Device_State at 16 * Word_Size range 0 .. 31;
		Axes_Count at 17 * Word_Size range 0 .. 7;
		First_Axis at 17 * Word_Size + 1 range 0 .. 7;
		Axis_Data at 18 * Word_Size range 0 .. 32 * 6 - 1;
	    end record;
	subtype X_Device_Button_Pressed_Event is X_Device_Button_Event;
	subtype X_Device_Button_Released_Event is X_Device_Button_Event;

	-- ********************************************************************
	-- *
	-- * X_Device_Motion_Notify_Event: These events are sent by extension
	-- *    devices that support input class Valuators.
	-- *
	-- * The record defines:
	-- *    Type of event
	-- *    Serial number of last request processed
	-- *    Send_Event is true if it is from SendEvent request
	-- *    Display from which the event was read
	-- *    "event" window reported relative to
	-- *    root window event occured on
	-- *    child window
	-- *    Time in milliseconds
	-- *    x, y coordinates in event window
	-- *    x, y coordinates relative to root
	-- *    State of key or button mask
	-- *    same screen flag
	-- *    Device State for device key or button mask

	type X_Device_Motion_Event is
	    record
		Types : X_Lib.Events.Event_Type;
		Serial : X_Lib.X_Id;
		Send_Event : X_Configuration_Dependent.Bool;
		Display : X_Lib.Display;
		Window : X_Lib.Window;
		Device_Id : X_Lib.X_Id;
		Root : X_Lib.Window;
		Sub_Window : X_Lib.Window;
		Time : X_Lib.Time;
		X : X_Lib.Coordinate;
		Y : X_Lib.Coordinate;
		X_Root : X_Lib.Coordinate;
		Y_Root : X_Lib.Coordinate;
		State : X_Configuration_Dependent.Unsigned_Int;
		Is_Hint : X_Lib.X_Character;
		Same_Screen : X_Configuration_Dependent.Bool;
		Device_State : X_Configuration_Dependent.Unsigned_Int;
		Axes_Count : X_Lib.X_Character;
		First_Axis : X_Lib.X_Character;
		Axis_Data : X_Lib.Long_Array (1 .. 6);
	    end record;
	for X_Device_Motion_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Serial at 1 * Word_Size range 0 .. 31;
		Send_Event at 2 * Word_Size range 0 .. 31;
		Display at 3 * Word_Size range 0 .. 31;
		Window at 4 * Word_Size range 0 .. 31;
		Device_Id at 5 * Word_Size range 0 .. 31;
		Root at 6 * Word_Size range 0 .. 31;
		Sub_Window at 7 * Word_Size range 0 .. 31;
		Time at 8 * Word_Size range 0 .. 31;
		X at 9 * Word_Size range 0 .. 31;
		Y at 10 * Word_Size range 0 .. 31;
		X_Root at 11 * Word_Size range 0 .. 31;
		Y_Root at 12 * Word_Size range 0 .. 31;
		State at 13 * Word_Size range 0 .. 31;
		Is_Hint at 14 * Word_Size range 0 .. 7;
		Same_Screen at 15 * Word_Size range 0 .. 31;
		Device_State at 16 * Word_Size range 0 .. 31;
		Axes_Count at 17 * Word_Size range 0 .. 7;
		First_Axis at 17 * Word_Size + 1 range 0 .. 7;
		Axis_Data at 18 * Word_Size range 0 .. 32 * 6 - 1;
	    end record;
	-- ********************************************************************
	-- *
	-- * X_Device_Focus_Change_Events: These events are sent when the focus
	-- *    of an extension device that can be focused is changed.
	-- *
	-- * The record defines:
	-- *    Type of event
	-- *    Serial number of last request processed
	-- *    Send_Event is true if it is from SendEvent request
	-- *    Display from which the event was read
	-- *    "event" window reported relative to
	-- *    mode of NotifyNormal, NotifyGrab or NotifyUngrab
	-- *    Detail of NotifyAncestor, NotifyVirtual, NotifyInferior,
	-- *       NotifyNonLinear,NotifyNonLinearVirtual, NotifyPointer,
	-- *       NotifyPointerRoot, NotifyDetailNone
	-- *    Time in milliseconds


	type X_Device_Focus_Change_Event is
	    record
		Types : X_Lib.X_Integer;
		Serial : X_Lib.X_Id;
		Send_Event : X_Configuration_Dependent.Bool;
		Display : X_Lib.Display;
		Window : X_Lib.Window;
		Device_Id : X_Lib.X_Id;
		Mode : X_Lib.Events.Notify_Mode_Type;
		Detail : X_Lib.Events.Notify_Detail_Type;
		Time : X_Lib.Time;
	    end record;

	for X_Device_Focus_Change_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Serial at 1 * Word_Size range 0 .. 31;
		Send_Event at 2 * Word_Size range 0 .. 31;
		Display at 3 * Word_Size range 0 .. 31;
		Window at 4 * Word_Size range 0 .. 31;
		Device_Id at 5 * Word_Size range 0 .. 31;
		Mode at 6 * Word_Size range 0 .. 31;
		Detail at 7 * Word_Size range 0 .. 31;
		Time at 8 * Word_Size range 0 .. 31;
	    end record;

	subtype X_Device_Focus_In_Event is X_Device_Focus_Change_Event;
	subtype X_Device_Focus_Out_Event is X_Device_Focus_Change_Event;

	-- *********************************************************************
	-- *
	-- * X_Proximity_Notify_Events:  These events are sent by those absolute
	-- *    positioning devices that are capable of generating proximity
	-- *    information.
	-- *
	-- * The record defines:
	-- *    Type of event
	-- *    Serial number of last request processed
	-- *    Send_Event is true if it is from SendEvent request
	-- *    Display from which the event was read
	-- *    "event" window reported relative to
	-- *    root window event occured on
	-- *    child window
	-- *    Time in milliseconds
	-- *    x, y coordinates in event window
	-- *    x, y coordinates relative to root
	-- *    State of key or button mask
	-- *    same screen flag
	-- *    Device State for device key or button mask

	type X_Proximity_Notify_Event is
	    record
		Types : X_Lib.Events.Event_Type;
		Serial : X_Lib.X_Id;
		Send_Event : X_Configuration_Dependent.Bool;
		Display : X_Lib.Display;
		Window : X_Lib.Window;
		Device_Id : X_Lib.X_Id;
		Root : X_Lib.Window;
		Sub_Window : X_Lib.Window;
		Time : X_Lib.Time;
		X : X_Lib.Coordinate;
		Y : X_Lib.Coordinate;
		X_Root : X_Lib.Coordinate;
		Y_Root : X_Lib.Coordinate;
		State : X_Configuration_Dependent.Unsigned_Int;
		Same_Screen : X_Configuration_Dependent.Bool;
		Device_State : X_Configuration_Dependent.Unsigned_Int;
		Axes_Count : X_Lib.X_Character;
		First_Axis : X_Lib.X_Character;
		Axis_Data : X_Lib.Long_Array (1 .. 6);
	    end record;
	for X_Proximity_Notify_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Serial at 1 * Word_Size range 0 .. 31;
		Send_Event at 2 * Word_Size range 0 .. 31;
		Display at 3 * Word_Size range 0 .. 31;
		Window at 4 * Word_Size range 0 .. 31;
		Device_Id at 5 * Word_Size range 0 .. 31;
		Root at 6 * Word_Size range 0 .. 31;
		Sub_Window at 7 * Word_Size range 0 .. 31;
		Time at 8 * Word_Size range 0 .. 31;
		X at 9 * Word_Size range 0 .. 31;
		Y at 10 * Word_Size range 0 .. 31;
		X_Root at 11 * Word_Size range 0 .. 31;
		Y_Root at 12 * Word_Size range 0 .. 31;
		State at 13 * Word_Size range 0 .. 31;
		Same_Screen at 14 * Word_Size range 0 .. 31;
		Device_State at 15 * Word_Size range 0 .. 31;
		Axes_Count at 16 * Word_Size range 0 .. 7;
		First_Axis at 16 * Word_Size + 1 range 0 .. 7;
		Axis_Data at 17 * Word_Size range 0 .. 32 * 6 - 1;
	    end record;
	subtype X_Proximity_In_Event is X_Proximity_Notify_Event;
	subtype X_Proximity_Out_Event is X_Proximity_Notify_Event;

	-- ********************************************************************
	-- *
	-- * X_Device_State_Notify_Events are generated on EnterWindow and
	-- * FocusIn for those clients who have selected DeviceState.
	-- *

	type X_Input_Class is
	    record
		Class : X_Lib.X_Character;
		Length : X_Lib.X_Character;
		Dummy : X_Lib.X_Character;
	    end record;

	for X_Input_Class use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Dummy at 0 * Word_Size + 3 range 0 .. 7;
	    end record;

	type X_Input_Class_Ptr is access X_Input_Class;
	for X_Input_Class_Ptr'Storage_Size use 0;
	type X_Device_State_Notify_Event is
	    record
		Types : X_Lib.Events.Event_Type;
		Serial : X_Lib.X_Id;
		Send_Event : X_Configuration_Dependent.Bool;
		Display : X_Lib.Display;
		Window : X_Lib.Window;
		Device_Id : X_Lib.X_Id;
		Time : X_Lib.Time;
		Num_Classes : X_Lib.X_Integer;
		Data : String (1 .. 64);
	    end record;

	for X_Device_State_Notify_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Serial at 1 * Word_Size range 0 .. 31;
		Send_Event at 2 * Word_Size range 0 .. 31;
		Display at 3 * Word_Size range 0 .. 31;
		Window at 4 * Word_Size range 0 .. 31;
		Device_Id at 5 * Word_Size range 0 .. 31;
		Time at 6 * Word_Size range 0 .. 31;
		Num_Classes at 7 * Word_Size range 0 .. 31;
		Data at 8 * Word_Size range 0 .. 8 * 64 - 1;
	    end record;

	type X_Valuator_Status is
	    record
		Class : X_Lib.X_Character;
		Length : X_Lib.X_Character;
		Num_Valuators : X_Lib.X_Character;
		Mode : X_Lib.X_Character;
		Valuators : X_Lib.Long_Array (1 .. 6);
	    end record;

	for X_Valuator_Status use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Num_Valuators at 0 * Word_Size + 2 range 0 .. 7;
		Mode at 0 * Word_Size + 3 range 0 .. 7;
		Valuators at 1 * Word_Size range 0 .. 32 * 6 - 1;
	    end record;

	type X_Key_Status is
	    record
		Class : X_Lib.X_Character;
		Length : X_Lib.X_Character;
		Num_Keys : X_Lib.X_Short_Integer;
		Keys : String (1 .. 32);
	    end record;

	for X_Key_Status use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Num_Keys at 0 * Word_Size + 2 range 0 .. 15;
		Keys at 1 * Word_Size range 0 .. 8 * 32 - 1;
	    end record;

	type X_Button_Status is
	    record
		Class : X_Lib.X_Character;
		Length : X_Lib.X_Character;
		Num_Buttons : X_Lib.X_Short_Integer;
		Buttons : String (1 .. 32);
	    end record;

	for X_Button_Status use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Num_Buttons at 0 * Word_Size + 2 range 0 .. 15;
		Buttons at 1 * Word_Size range 0 .. 8 * 32 - 1;
	    end record;

	-- **********************************************************************
	-- * DeviceMappingNotify event.  This event is sent when the key mapping,
	-- * modifier mapping, or button mapping of an extension device is changed.
	-- *

	type X_Device_Mapping_Event is
	    record
		Types : X_Lib.Events.Event_Type;
		Serial : X_Lib.X_Id;
		-- # of last request processed by server
		Send_Event : X_Configuration_Dependent.Bool;
		-- Send_Event request
		Display : X_Lib.Display;  -- Display the event was read from
		Window : X_Lib.Window;   -- unused
		Device_Id : X_Lib.X_Id;
		Time : X_Lib.Time;
		Request : X_Lib.Events.Mapping_Request_Type;
		-- one of MappingModifier, MappingKeyboard, MappingPointer
		First_Key_Code : X_Lib.X_Integer;  -- first keycode
		Count : X_Lib.X_Integer;
		-- defines range of change w. first_keycode
	    end record;

	for X_Device_Mapping_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Serial at 1 * Word_Size range 0 .. 31;
		Send_Event at 2 * Word_Size range 0 .. 31;
		Display at 3 * Word_Size range 0 .. 31;
		Window at 4 * Word_Size range 0 .. 31;
		Device_Id at 5 * Word_Size range 0 .. 31;
		Time at 6 * Word_Size range 0 .. 31;
		Request at 7 * Word_Size range 0 .. 31;
		First_Key_Code at 8 * Word_Size range 0 .. 31;
		Count at 9 * Word_Size range 0 .. 31;
	    end record;

	-- ******************************************************************
	-- *
	-- * X_Change_Device_Notify_Event: This event is sent when an
	-- *    XChangeKeyboard or XChangePointer request is made.
	-- *

	type X_Change_Device_Notify_Event is
	    record
		Types : X_Lib.Events.Event_Type;
		Serial : X_Lib.X_Id;
		Send_Event : X_Configuration_Dependent.Bool;
		Display : X_Lib.Display;
		Window : X_Lib.Window;
		Device_Id : X_Lib.X_Id;
		Time : X_Lib.Time;
		Request : X_Lib.X_Integer;    -- NewPointer or NewKeyboard
	    end record;

	for X_Change_Device_Notify_Event use
	    record
		Types at 0 * Word_Size range 0 .. 31;
		Serial at 1 * Word_Size range 0 .. 31;
		Send_Event at 2 * Word_Size range 0 .. 31;
		Display at 3 * Word_Size range 0 .. 31;
		Window at 4 * Word_Size range 0 .. 31;
		Device_Id at 5 * Word_Size range 0 .. 31;
		Time at 6 * Word_Size range 0 .. 31;
		Request at 7 * Word_Size range 0 .. 31;
	    end record;

	-- ******************************************************************
	-- *
	-- * Control structures for input devices that support input class
	-- * Feedback.  These are used by the XGetFeedbackControl and
	-- * XChangeFeedbackControl functions.
	-- *

	type X_Feedback_State is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
	    end record;

	for X_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
	    end record;

	type X_Kbd_Feedback_State is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
		Click : X_Lib.X_Integer;
		Percent : X_Lib.X_Integer;
		Pitch : X_Lib.X_Integer;
		Duration : X_Lib.X_Integer;
		Led_Mask : X_Lib.Keyboard.Led_Mode_Type;
		Global_Auto_Repeat : X_Lib.Keyboard.Auto_Repeat_Mode_Type;
		Auto_Repeats : String (1 .. 32);
	    end record;

	for X_Kbd_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
		Click at 3 * Word_Size range 0 .. 31;
		Percent at 4 * Word_Size range 0 .. 31;
		Pitch at 5 * Word_Size range 0 .. 31;
		Duration at 6 * Word_Size range 0 .. 31;
		Led_Mask at 7 * Word_Size range 0 .. 31;
		Global_Auto_Repeat at 8 * Word_Size range 0 .. 31;
		Auto_Repeats at 9 * Word_Size range 0 .. 8 * 32 - 1;
	    end record;

	type X_Ptr_Feedback_State is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
		Accel_Num : X_Lib.X_Integer;
		Accel_Denom : X_Lib.X_Integer;
		Threshold : X_Lib.X_Integer;
	    end record;

	for X_Ptr_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
		Accel_Num at 3 * Word_Size range 0 .. 31;
		Accel_Denom at 4 * Word_Size range 0 .. 31;
		Threshold at 5 * Word_Size range 0 .. 31;
	    end record;

	type X_Integer_Feedback_State is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
		Resolution : X_Lib.X_Integer;
		Min_Val : X_Lib.X_Integer;
		Max_Val : X_Lib.X_Integer;
	    end record;

	for X_Integer_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
		Resolution at 3 * Word_Size range 0 .. 31;
		Min_Val at 4 * Word_Size range 0 .. 31;
		Max_Val at 5 * Word_Size range 0 .. 31;
	    end record;

	type X_String_Feedback_State is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
		Max_Symbols : X_Lib.X_Integer;
		Num_Syms_Supported : X_Lib.X_Integer;
		Syms_Supported : X_Lib.Keyboard.Key_Sym;
	    end record;

	for X_String_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
		Max_Symbols at 3 * Word_Size range 0 .. 31;
		Num_Syms_Supported at 4 * Word_Size range 0 .. 31;
		Syms_Supported at 5 * Word_Size range 0 .. 31;
	    end record;

	type X_Bell_Feedback_State is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
		Percent : X_Lib.X_Integer;
		Pitch : X_Lib.X_Integer;
		Duration : X_Lib.X_Integer;
	    end record;

	for X_Bell_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
		Percent at 3 * Word_Size range 0 .. 31;
		Pitch at 4 * Word_Size range 0 .. 31;
		Duration at 5 * Word_Size range 0 .. 31;
	    end record;

	type X_Led_Feedback_State is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
		Led_Values : X_Lib.X_Integer;
		Led_Mask : X_Lib.X_Integer;
	    end record;

	for X_Led_Feedback_State use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
		Led_Values at 3 * Word_Size range 0 .. 31;
		Led_Mask at 4 * Word_Size range 0 .. 31;
	    end record;

	type X_Feedback_Control is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
	    end record;

	for X_Feedback_Control use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
	    end record;

	type X_Ptr_Feedback_Control is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
		Accel_Num : X_Lib.X_Integer;
		Accel_Denom : X_Lib.X_Integer;
		Threshold : X_Lib.X_Integer;
	    end record;

	for X_Ptr_Feedback_Control use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
		Accel_Num at 3 * Word_Size range 0 .. 31;
		Accel_Denom at 4 * Word_Size range 0 .. 31;
		Threshold at 5 * Word_Size range 0 .. 31;
	    end record;

	type X_Kbd_Feedback_Control is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
		Click : X_Lib.X_Integer;
		Percent : X_Lib.X_Integer;
		Pitch : X_Lib.X_Integer;
		Duration : X_Lib.X_Integer;
		Led_Mask : X_Lib.Keyboard.Led_Mode_Type;
		Led_Value : X_Lib.X_Integer;
		Key : X_Lib.Events.Key_And_Button_Mask;
		Auto_Repeat_Mode : X_Lib.Keyboard.Auto_Repeat_Mode_Type;
	    end record;

	for X_Kbd_Feedback_Control use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
		Click at 3 * Word_Size range 0 .. 31;
		Percent at 4 * Word_Size range 0 .. 31;
		Pitch at 5 * Word_Size range 0 .. 31;
		Duration at 6 * Word_Size range 0 .. 31;
		Led_Mask at 7 * Word_Size range 0 .. 31;
		Led_Value at 8 * Word_Size range 0 .. 31;
		Key at 9 * Word_Size range 0 .. 31;
		Auto_Repeat_Mode at 10 * Word_Size range 0 .. 31;
	    end record;

	type X_String_Feedback_Control is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
		Num_Key_Syms : X_Lib.X_Integer;
		Syms_To_Display : X_Lib.Keyboard.Key_Sym_List;
	    end record;

	for X_String_Feedback_Control use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
		Num_Key_Syms at 3 * Word_Size range 0 .. 31;
		Syms_To_Display at 4 * Word_Size range 0 .. 31;
	    end record;

	type X_Integer_Feedback_Control is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
		Int_To_Display : X_Lib.X_Integer;
	    end record;

	for X_Integer_Feedback_Control use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
		Int_To_Display at 3 * Word_Size range 0 .. 31;
	    end record;

	type X_Bell_Feedback_Control is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
		Percent : X_Lib.X_Integer;
		Pitch : X_Lib.X_Integer;
		Duration : X_Lib.X_Integer;
	    end record;

	for X_Bell_Feedback_Control use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
		Percent at 3 * Word_Size range 0 .. 31;
		Pitch at 4 * Word_Size range 0 .. 31;
		Duration at 5 * Word_Size range 0 .. 31;
	    end record;

	type X_Led_Feedback_Control is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Id : X_Lib.X_Id;
		Led_Mask : X_Lib.Keyboard.Led_Mode_Type;
		Led_Value : X_Lib.X_Integer;
	    end record;

	for X_Led_Feedback_Control use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Id at 2 * Word_Size range 0 .. 31;
		Led_Mask at 3 * Word_Size range 0 .. 31;
		Led_Value at 4 * Word_Size range 0 .. 31;
	    end record;

	type X_Device_Control is
	    record
		Control : X_Lib.X_Id;
		Lengths : X_Lib.X_Integer;
	    end record;

	for X_Device_Control use
	    record
		Control at 0 * Word_Size range 0 .. 31;
		Lengths at 1 * Word_Size range 0 .. 31;
	    end record;

	type Int_Ptr is access X_Lib.X_Integer;

	type X_Device_Resolution_Control is
	    record
		Control : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		First_Valuator : X_Lib.X_Integer;
		Num_Valuators : X_Lib.X_Integer;
		Resolutions : Int_Ptr;
	    end record;

	for X_Device_Resolution_Control use
	    record
		Control at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		First_Valuator at 2 * Word_Size range 0 .. 31;
		Num_Valuators at 3 * Word_Size range 0 .. 31;
		Resolutions at 4 * Word_Size range 0 .. 31;
	    end record;

	type X_Device_Resolution_State is
	    record
		Control : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Num_Valuators : X_Lib.X_Integer;
		Resolutions : Int_Ptr;
		Min_Resolutions : Int_Ptr;
		Max_Resolutions : Int_Ptr;
	    end record;

	for X_Device_Resolution_State use
	    record
		Control at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Num_Valuators at 2 * Word_Size range 0 .. 31;
		Resolutions at 3 * Word_Size range 0 .. 31;
		Min_Resolutions at 4 * Word_Size range 0 .. 31;
		Max_Resolutions at 5 * Word_Size range 0 .. 31;
	    end record;

	-- ******************************************************************
	-- *
	-- * An array of XDeviceList structures is returned by the
	-- * XListInputDevices function.  Each entry contains information
	-- * about one input device.  Among that information is an array of
	-- * pointers to structures that describe the characteristics of
	-- * the input device.
	-- *

	type X_Any_Class_Info is
	    record
		Class : X_Lib.X_Id;
		Lengths : X_Lib.X_Integer;
	    end record;

	for X_Any_Class_Info use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Lengths at 1 * Word_Size range 0 .. 31;
	    end record;

	type X_Any_Class_Ptr is access X_Any_Class_Info;
	for X_Any_Class_Ptr'Storage_Size use 0;
	type X_Device_Info is
	    record
		Id : X_Lib.X_Id;
		Types : X_Lib.Atoms.Atom;
		Name : X_Lib.String_Pointer;
		Num_Classes : X_Lib.X_Integer;
		Used : X_Lib.X_Integer;
		Input_Class_Info : X_Any_Class_Ptr;
	    end record;

	for X_Device_Info use
	    record
		Id at 0 * Word_Size range 0 .. 31;
		Types at 1 * Word_Size range 0 .. 31;
		Name at 2 * Word_Size range 0 .. 31;
		Num_Classes at 3 * Word_Size range 0 .. 31;
		Used at 4 * Word_Size range 0 .. 31;
		Input_Class_Info at 5 * Word_Size range 0 .. 31;
	    end record;

	type X_Key_Info is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Min_Key_Code : X_Configuration_Dependent.Card16;
		Max_Key_Code : X_Configuration_Dependent.Card16;
		Num_Keys : X_Configuration_Dependent.Card16;
		Dummy : X_Configuration_Dependent.Card16;
	    end record;

	for X_Key_Info use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Min_Key_Code at 2 * Word_Size range 0 .. 15;
		Max_Key_Code at 2 * Word_Size + 2 range 0 .. 15;
		Num_Keys at 3 * Word_Size range 0 .. 15;
		Dummy at 3 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Key_Info_Ptr is access X_Key_Info;
	for X_Key_Info_Ptr'Storage_Size use 0;

	type X_Button_Info is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Num_Buttons : X_Lib.X_Short_Integer;
		Dummy : X_Lib.X_Short_Integer;
	    end record;

	for X_Button_Info use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Num_Buttons at 2 * Word_Size range 0 .. 15;
		Dummy at 2 * Word_Size + 2 range 0 .. 15;
	    end record;

	type X_Button_Info_Ptr is access X_Button_Info;
	for X_Button_Info_Ptr'Storage_Size use 0;

	type X_Axis_Info is
	    record
		Resolution : X_Lib.X_Integer;
		Min_Value : X_Lib.X_Integer;
		Max_Value : X_Lib.X_Integer;
	    end record;

	for X_Axis_Info use
	    record
		Resolution at 0 * Word_Size range 0 .. 31;
		Min_Value at 1 * Word_Size range 0 .. 31;
		Max_Value at 2 * Word_Size range 0 .. 31;
	    end record;

	type X_Axis_Info_Ptr is access X_Axis_Info;
	for X_Axis_Info_Ptr'Storage_Size use 0;
	type X_Valuator_Info is
	    record
		Class : X_Lib.X_Id;
		Length : X_Lib.X_Integer;
		Num_Axes : X_Lib.X_Character;
		Mode : X_Lib.X_Character;
		Motion_Buffer : X_Configuration_Dependent.Unsigned_Long;
		Axes : X_Axis_Info_Ptr;
	    end record;
	for X_Valuator_Info use
	    record
		Class at 0 * Word_Size range 0 .. 31;
		Length at 1 * Word_Size range 0 .. 31;
		Num_Axes at 2 * Word_Size range 0 .. 7;
		Mode at 2 * Word_Size + 1 range 0 .. 7;
		Motion_Buffer at 3 * Word_Size range 0 .. 31;
		Axes at 4 * Word_Size range 0 .. 31;
	    end record;
	-- *********************************************************************
	-- * An XDevice structure is returned by the XOpenDevice function.
	-- * It contains an array of pointers to XInputClassInfo structures.
	-- * Each contains information about a class of input supported by the
	-- * device, including a pointer to an array of data for each type of
	-- * event the device reports.
	-- *

	type X_Input_Class_Info is
	    record
		Input_Class : X_Lib.X_Character;
		Event_Type_Base : X_Lib.X_Character;
		Dummy : X_Lib.X_Character;
	    end record;

	for X_Input_Class_Info use
	    record
		Input_Class at 0 * Word_Size range 0 .. 7;
		Event_Type_Base at 0 * Word_Size + 1 range 0 .. 7;
		Dummy at 0 * Word_Size + 3 range 0 .. 7;
	    end record;

	X_Input_Class_Info_Size : constant := 16;

	type X_Input_Class_Info_Ptr is access X_Input_Class_Info;
	for X_Input_Class_Info_Ptr'Storage_Size use 0;
	type X_Device is
	    record
		Device_Id : X_Lib.X_Id;
		Num_Classes : X_Lib.X_Integer;
		Classes : X_Input_Class_Info_Ptr;
	    end record;

	for X_Device use
	    record
		Device_Id at 0 * Word_Size range 0 .. 31;
		Num_Classes at 1 * Word_Size range 0 .. 31;
		Classes at 2 * Word_Size range 0 .. 31;
	    end record;

	-- ******************************************************************
	-- *
	-- * The following structure is used to return information for the
	-- * XGetSelectedExtensionEvents function.
	-- *

	type X_Event_List is
	    record
		Event_Type : X_I.X_Event_Class;
		Device : X_Lib.X_Id;
	    end record;

	for X_Event_List use
	    record
		Event_Type at 0 * Word_Size range 0 .. 31;
		Device at 1 * Word_Size range 0 .. 31;
	    end record;

	-- *********************************************************************
	-- *
	-- * The following structure is used to return motion history data from
	-- * an input device that supports the input class Valuators.
	-- * This information is returned by the XGetDeviceMotionEvents function.
	-- *
	type Card32_Ptr is access X_Configuration_Dependent.Card32;

	type X_Device_Time_Coord is
	    record
		Time : X_Lib.Time;
		Data : Int_Ptr;
	    end record;

	for X_Device_Time_Coord use
	    record
		Time at 0 * Word_Size range 0 .. 31;
		Data at 1 * Word_Size range 0 .. 31;
	    end record;

	-- ******************************************************************
	-- *
	-- * Device state structure.
	-- *

	type X_Device_State is
	    record
		Device_Id : X_Lib.X_Id;
		Num_Classes : X_Lib.X_Integer;
		Data : X_Input_Class_Ptr;
	    end record;

	for X_Device_State use
	    record
		Device_Id at 0 * Word_Size range 0 .. 31;
		Num_Classes at 1 * Word_Size range 0 .. 31;
		Data at 2 * Word_Size range 0 .. 31;
	    end record;

	type X_Valuator_State is
	    record
		Class : X_Lib.X_Character;
		Length : X_Lib.X_Character;
		Num_Valuators : X_Lib.X_Character;
		Mode : X_Lib.X_Character;
		Valuators : Int_Ptr;
	    end record;

	for X_Valuator_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Num_Valuators at 0 * Word_Size + 2 range 0 .. 7;
		Mode at 0 * Word_Size + 3 range 0 .. 7;
		Valuators at 1 * Word_Size range 0 .. 31;
	    end record;

	type X_Key_State is
	    record
		Class : X_Lib.X_Character;
		Length : X_Lib.X_Character;
		Num_Keys : X_Lib.X_Short_Integer;
		Keys : String (1 .. 32);
	    end record;

	for X_Key_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Num_Keys at 0 * Word_Size + 2 range 0 .. 15;
		Keys at 1 * Word_Size range 0 .. 8 * 32 - 1;
	    end record;

	type X_Button_State is
	    record
		Class : X_Lib.X_Character;
		Length : X_Lib.X_Character;
		Num_Buttons : X_Lib.X_Short_Integer;
		Buttons : String (1 .. 32);
	    end record;

	for X_Button_State use
	    record
		Class at 0 * Word_Size range 0 .. 7;
		Length at 0 * Word_Size + 1 range 0 .. 7;
		Num_Buttons at 0 * Word_Size + 2 range 0 .. 15;
		Buttons at 1 * Word_Size range 0 .. 8 * 32 - 1;
	    end record;

	procedure Find_Type_And_Class (D : in X_Device;
				       Types : in out X_Masks.Mask_Type;
				       Class : in out X_Masks.Mask_Type;
				       Class_Id : in X_Lib.X_Character;
				       Offset : in X_Lib.X_Integer);

	procedure Device_Key_Press (D : in X_Device;
				    Types : in out X_Masks.Mask_Type;
				    Class : in out X_Masks.Mask_Type);

	procedure Device_Key_Release (D : in X_Device;
				      Types : in out X_Masks.Mask_Type;
				      Class : in out X_Masks.Mask_Type);

	procedure Device_Button_Press (D : in X_Device;
				       Types : in out X_Masks.Mask_Type;
				       Class : in out X_Masks.Mask_Type);

	procedure Device_Button_Release (D : in X_Device;
					 Types : in out X_Masks.Mask_Type;
					 Class : in out X_Masks.Mask_Type);

	procedure Device_Motion_Notify (D : in X_Device;
					Types : in out X_Masks.Mask_Type;
					Class : in out X_Masks.Mask_Type);

	procedure Device_Focus_In (D : in X_Device;
				   Types : in out X_Masks.Mask_Type;
				   Class : in out X_Masks.Mask_Type);

	procedure Device_Focus_Out (D : in X_Device;
				    Types : in out X_Masks.Mask_Type;
				    Class : in out X_Masks.Mask_Type);

	procedure Proximity_In (D : in X_Device;
				Types : in out X_Masks.Mask_Type;
				Class : in out X_Masks.Mask_Type);

	procedure Proximity_Out (D : in X_Device;
				 Types : in out X_Masks.Mask_Type;
				 Class : in out X_Masks.Mask_Type);

	procedure Device_State_Notify (D : in X_Device;
				       Types : in out X_Masks.Mask_Type;
				       Class : in out X_Masks.Mask_Type);

	procedure Device_Mapping_Notify (D : in X_Device;
					 Types : in out X_Masks.Mask_Type;
					 Class : in out X_Masks.Mask_Type);

	procedure Change_Device_Notify (D : in X_Device;
					Types : in out X_Masks.Mask_Type;
					Class : in out X_Masks.Mask_Type);

	function Device_Pointer_Motion_Hint
		    (D : in X_Device) return X_Masks.Mask_Type;

	function Device_Button1_Motion
		    (D : in X_Device) return X_Masks.Mask_Type;

	function Device_Button2_Motion
		    (D : in X_Device) return X_Masks.Mask_Type;

	function Device_Button3_Motion
		    (D : in X_Device) return X_Masks.Mask_Type;

	function Device_Button4_Motion
		    (D : in X_Device) return X_Masks.Mask_Type;

	function Device_Button5_Motion
		    (D : in X_Device) return X_Masks.Mask_Type;

	function Device_Button_Motion
		    (D : in X_Device) return X_Masks.Mask_Type;

	function Device_Owner_Grab_Button
		    (D : in X_Device) return X_Masks.Mask_Type;

	function Device_Button_Press_Grab
		    (D : in X_Device) return X_Masks.Mask_Type;

	-- ******************************************************************
	-- *
	-- * Function definitions.
	-- *

	function X_Open_Device (Dpy : in X_Lib.Display; Id : in X_Lib.X_Id)
			       return X_Device;

	procedure X_List_Input_Devices (Dpy : in X_Lib.Display;
					N_Devices : out X_Lib.X_Integer;
					Dev_Info : out X_Device_Info);

	procedure X_Get_Device_Motion_Events
		     (Dpy : in X_Lib.Display;
		      Dev : in X_Device;
		      Start : in X_Lib.Time;
		      Stop : in X_Lib.Time;
		      N_Events : out X_Lib.X_Integer;
		      Mode : out X_Lib.X_Integer;
		      Axis_Count : out X_Lib.X_Integer;
		      Dev_Coord : out X_Device_Time_Coord);

	procedure X_Get_Device_Key_Mapping
		     (Dpy : in X_Lib.Display;
		      Dev : in X_Device;
		      First : in X_Lib.Keyboard.Key_Code;
		      Key_Count : in X_Lib.X_Integer;
		      Syms_Per_Code : out X_Lib.X_Integer;
		      Key_Sym : out X_Lib.Keyboard.Key_Sym);

	function X_Get_Device_Modifier_Mapping
		    (Dpy : in X_Lib.Display; Dev : in X_Device)
		    return X_Lib.Keyboard.Modifier_Keymap;

	procedure X_Get_Feedback_Control (Dpy : in X_Lib.Display;
					  Dev : in X_Device;
					  Num_Feedbacks : out X_Lib.X_Integer;
					  State : out X_Feedback_State);

	function X_Get_Extension_Version
		    (Dpy : in X_Lib.Display; Name : in String)
		    return X_I.X_Extension_Version;

	function X_Query_Device_State
		    (Dpy : in X_Lib.Display; Dev : in X_Device)
		    return X_Device_State;

	procedure X_Get_Device_Dont_Propagate_List
		     (Dpy : in X_Lib.Display;
		      Window : in X_Lib.Window;
		      Count : out X_Lib.X_Integer;
		      Class : out X_I.X_Event_Class);
    end X_Input;

    -- called on missing exts
    function X_Set_Extension_Error_Handler
		(Handler : in X_Lib.X_Address) return X_Lib.X_Integer;

    -- no extension for routine
    function X_Missing_Extension (Dpy : in X_Lib.Display; Ext_Name : in String)
				 return X_Lib.X_Integer;
end X_Ext;
