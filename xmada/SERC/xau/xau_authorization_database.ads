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

with X_Lib, X_Configuration_Dependent;

package Xau_Authorization_Database is
    Family_Local : constant := 256;
    Family_Wild : constant := 65535;
    Family_Netname : constant := 254;

    type Xauth is
	record
	    Family : X_Configuration_Dependent.Unsigned_Short;
	    Address_Length : X_Configuration_Dependent.Unsigned_Short;
	    Address : X_Lib.String_Pointer;
	    Number_Length : X_Configuration_Dependent.Unsigned_Short;
	    Number : X_Lib.String_Pointer;
	    Name_Length : X_Configuration_Dependent.Unsigned_Short;
	    Name : X_Lib.String_Pointer;
	    Data_Length : X_Configuration_Dependent.Unsigned_Short;
	    Data : X_Lib.String_Pointer;
	end record;

    for Xauth use
	record
	    Family at 0 * X_Configuration_Dependent.Word_Size range 0 .. 15;
	    Address_Length at 0 * X_Configuration_Dependent.Word_Size
	       range 16 .. 31;
	    Address at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Number_Length at 2 * X_Configuration_Dependent.Word_Size
	       range 0 .. 15;
	    Number at 3 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Name_Length at 4 * X_Configuration_Dependent.Word_Size
	       range 0 .. 15;
	    Name at 5 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Data_Length at 6 * X_Configuration_Dependent.Word_Size
	       range 0 .. 15;
	    Data at 7 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	end record;

    function Xau_File_Name return String;

    function Xau_Read_Auth (Auth_File : in X_Lib.X_Address) return Xauth;

    function Xau_Lock_Auth (File_Name : in String;     -- ??? X_const char* ???
			    Retries : in X_Lib.X_Integer;
			    Timeout : in X_Lib.X_Integer;
			    Dead : in X_Lib.X_Long_Integer)
			   return X_Lib.X_Integer;

    -- Return values from Xau_Lock_Auth:

    Lock_Success : constant := 0;  -- Lock succeeded.
    Lock_Error : constant := 1;  -- Lock unexpectedly failed, check errno.
    Lock_Timeout : constant := 2;  -- Locked Failed, timeouts expired.

    procedure Xau_Unlock_Auth (File_Name : in String); -- ??? _Xconst char* ???

    function Xau_Write_Auth
		(Auth_File : in String; Auth : in Xauth) return Boolean;

-- The following function is not included in the libXau.a archive or Xau
-- C code off a standard X11R4 distribution, though it does appear in the
-- Xauth.h file.  To avoid linking problems against X11R4, this capability
-- has been stubbed out.
--  function Xau_Get_Auth_By_Name (Display_Name : in STRING) return Xauth;

    function Xau_Get_Auth_By_Addr
		(Family : in X_Configuration_Dependent.Unsigned_Int;
		 Address : in String;
		 Number : in String;
		 Name : in String) return Xauth;

    function Xau_Get_Best_Auth_By_Addr
		(Family : in X_Configuration_Dependent.Unsigned_Int;
		 Address : in String;
		 Number : in String;
		 Type_Names : in X_Lib.String_List;
		 Type_Lengths : in X_Lib.X_Integer) return Xauth;

    procedure Xau_Dispose_Auth (Auth : in out Xauth);
end Xau_Authorization_Database;
