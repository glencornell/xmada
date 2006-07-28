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

with X_Configuration_Dependent, X_Lib;

package Xdmcp_Display_Manager_Control_Protocol is
    Xdm_Protocol_Version : constant := 1;
    Xdm_Udp_Port : constant := 177;
    Xdm_Max_Msglen : constant := 8192;
    Xdm_Min_Rtx : constant := 2;
    Xdm_Max_Rtx : constant := 32;
    Xdm_Rtx_Limit : constant := 7;
    Xdm_Ka_Rtx_Limit : constant := 4;
    Xdm_Def_Dormancy : constant := 3 * 60;        -- 3 minutes
    Xdm_Max_Dormancy : constant := 24 * 60 * 60;  -- 24 hours

    type Xdm_Op_Code is (Broadcast_Query, Query, Indirect_Query, Forward_Query,
			 Willing, Unwilling, Request, Accept_Op, Decline,
			 Manage, Refuse, Failed, Keepalive, Alive);

    for Xdm_Op_Code use (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14);

    type Xdmcp_States is (Xdm_Query, Xdm_Broadcast, Xdm_Indirect,
			  Xdm_Collect_Query, Xdm_Collect_Broadcast_Query,
			  Xdm_Collect_Indirect_Query, Xdm_Start_Connection,
			  Xdm_Await_Request_Response, Xdm_Await_Manage_Response,
			  Xdm_Manage, Xdm_Run_Session,
			  Xdm_Off, Xdm_Await_User_Input,
			  Xdm_Keepalive, Xdm_Await_Alive_Response);

    for Xdmcp_States use (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);

    Xdm_Max_Str_Len : constant := 21;
    Xdm_Max_Hosts : constant := 20;

    type Xdm_Host_Table is
	record
	    Sockaddr : X_Lib.X_Address;
	    Name : String (1 .. Xdm_Max_Str_Len);
	    Status : String (1 .. Xdm_Max_Str_Len);
	end record;

    type Card8_Ptr is access X_Configuration_Dependent.Card8;
    type Card16_Ptr is access X_Configuration_Dependent.Card16;
    type Card32_Ptr is access X_Configuration_Dependent.Card32;

    type Array8 is
	record
	    Length : X_Configuration_Dependent.Card16;
	    Data : Card8_Ptr;
	end record;

    for Array8 use
	record
	    Length at 0 * X_Configuration_Dependent.Word_Size range 0 .. 15;
	    Data at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type Array8_Ptr is access Array8;

    type Array16 is
	record
	    Length : X_Configuration_Dependent.Card8;
	    Data : Card16_Ptr;
	end record;

    for Array16 use
	record
	    Length at 0 * X_Configuration_Dependent.Word_Size range 0 .. 7;
	    Data at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type Array32 is
	record
	    Length : X_Configuration_Dependent.Card8;
	    Data : Card32_Ptr;
	end record;

    for Array32 use
	record
	    Length at 0 * X_Configuration_Dependent.Word_Size range 0 .. 7;
	    Data at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type Array_Of_Array8 is
	record
	    Length : X_Configuration_Dependent.Card8;
	    Data : Array8_Ptr;
	end record;

    for Array_Of_Array8 use
	record
	    Length at 0 * X_Configuration_Dependent.Word_Size range 0 .. 7;
	    Data at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type Xdmcp_Header is
	record
	    Version, Opcode, Length : X_Configuration_Dependent.Card16;
	    Dummy : X_Configuration_Dependent.Card16;
	end record;

    for Xdmcp_Header use
	record
	    Version at 0 * X_Configuration_Dependent.Word_Size range 0 .. 15;
	    Opcode at 0 * X_Configuration_Dependent.Word_Size range 16 .. 31;
	    Length at 1 * X_Configuration_Dependent.Word_Size range 0 .. 15;
	    Dummy at 1 * X_Configuration_Dependent.Word_Size range 16 .. 31;
	end record;

    type Xdmcp_Buffer is
	record
	    Data : X_Lib.Bytes;
	    Size : X_Lib.X_Integer;
	    Pointer : X_Lib.X_Integer;
	    Count : X_Lib.X_Integer;  -- Amount of data read.
	end record;

    for Xdmcp_Buffer use
	record
	    Data at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Size at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Pointer at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Count at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    type Xdm_Auth_Key is
	record
	    Data : X_Lib.Byte_Array (0 .. 7);
	end record;

    for Xdm_Auth_Key use
	record
	    Data at 0 * X_Configuration_Dependent.Word_Size range 0 .. 63;
	end record;

    subtype Xdmcp_Netaddr is X_Lib.String_Pointer;

    procedure Xdmcp_Write_Card8 (Buffer : in out Xdmcp_Buffer;
				 Value : in X_Configuration_Dependent.Card8;
				 Status : out Boolean);

    procedure Xdmcp_Write_Card16 (Buffer : in out Xdmcp_Buffer;
				  Value : in X_Configuration_Dependent.Card16;
				  Status : out Boolean);

    procedure Xdmcp_Write_Card32 (Buffer : in out Xdmcp_Buffer;
				  Value : in X_Configuration_Dependent.Card32;
				  Status : out Boolean);

    procedure Xdmcp_Write_Array8 (Buffer : in out Xdmcp_Buffer;
				  Value : in Array8;
				  Status : out Boolean);

    procedure Xdmcp_Write_Array16 (Buffer : in out Xdmcp_Buffer;
				   Value : in Array16;
				   Status : out Boolean);

    procedure Xdmcp_Write_Array32 (Buffer : in out Xdmcp_Buffer;
				   Value : in Array32;
				   Status : out Boolean);

    procedure Xdmcp_Write_Array_Of_Array8 (Buffer : in out Xdmcp_Buffer;
					   Value : in Array_Of_Array8;
					   Status : out Boolean);

    procedure Xdmcp_Write_Header (Buffer : in out Xdmcp_Buffer;
				  Header : in Xdmcp_Header;
				  Status : out Boolean);

    function Xdmcp_Flush (Fd : in X_Lib.X_Integer;
			  Buffer : in Xdmcp_Buffer;
			  To : in X_Lib.X_Address;
			  To_Len : in X_Lib.X_Integer) return Boolean;

    procedure Xdmcp_Read_Card8 (Buffer : in Xdmcp_Buffer;
				Value : out X_Configuration_Dependent.Card8;
				Status : out Boolean);

    procedure Xdmcp_Read_Card16 (Buffer : in Xdmcp_Buffer;
				 Value : out X_Configuration_Dependent.Card16;
				 Status : out Boolean);

    procedure Xdmcp_Read_Card32 (Buffer : in Xdmcp_Buffer;
				 Value : out X_Configuration_Dependent.Card32;
				 Status : out Boolean);

    procedure Xdmcp_Read_Array8 (Buffer : in Xdmcp_Buffer;
				 The_Array : out Array8;
				 Status : out Boolean);

    procedure Xdmcp_Read_Array16 (Buffer : in Xdmcp_Buffer;
				  The_Array : out Array16;
				  Status : out Boolean);

    procedure Xdmcp_Read_Array32 (Buffer : in Xdmcp_Buffer;
				  The_Array : out Array32;
				  Status : out Boolean);

    procedure Xdmcp_Read_Array_Of_Array8 (Buffer : in Xdmcp_Buffer;
					  The_Array : out Array_Of_Array8;
					  Status : out Boolean);

    procedure Xdmcp_Read_Header (Buffer : in Xdmcp_Buffer;
				 Header : out Xdmcp_Header;
				 Status : out Boolean);

    procedure Xdmcp_Fill (Fd : in X_Lib.X_Integer;
			  Buffer : out Xdmcp_Buffer;
			  From : in X_Lib.X_Address;
			  From_Len : in X_Lib.X_Integer;
			  Status : out Boolean);

    function Xdmcp_Read_Remaining
		(Buffer : in Xdmcp_Buffer) return X_Lib.X_Integer;

    procedure Xdmcp_Dispose_Array8 (The_Array : in out Array8);

    procedure Xdmcp_Dispose_Array16 (The_Array : in out Array16);

    procedure Xdmcp_Dispose_Array32 (The_Array : in out Array32);

    procedure Xdmcp_Dispose_Array_Of_Array8
		 (The_Array : in out Array_Of_Array8);

    procedure Xdmcp_Copy_Array8
		 (Src : in Array8; Dst : out Array8; Status : out Boolean);

    function Xdmcp_Array8_Equal (Array1, Array2 : in Array8) return Boolean;

    procedure Xdmcp_Generate_Key (Key : out Xdm_Auth_Key);

    procedure Xdmcp_Increment_Key (Key : in out Xdm_Auth_Key);

    procedure Xdmcp_Decrement_Key (Key : in out Xdm_Auth_Key);

    procedure Xdmcp_Wrap;

    procedure Xdmcp_Unwrap;
end Xdmcp_Display_Manager_Control_Protocol;
