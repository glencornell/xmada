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

with System, X_Lib, X_Configuration_Dependent;

use X_Configuration_Dependent;

package X_System_Utilities is
    -- Raised when a string or component of a string array is not
    -- terminated with an ASCII.NUL character and the option to
    -- raise exceptions in this case is on.
    String_Termination_Error : exception;

    package Command_Line_Utilities is
	-- Type declarations and functions for accessing the command line
	-- arguments.

	type Argc_Type is new Int;

	subtype Arg is X_Lib.String_Pointer;
	type Argv_Array is array (Argc_Type range <>) of Arg;
	type Argv_List is access Argv_Array;

	-- Each of  these functions will return the original
	-- command line arguments and count.

	function Get_Argc return Argc_Type;
	function Get_Argv
		    (Return_C_Array : in Boolean := True) return Argv_List;
    end Command_Line_Utilities;

    package String_Conversion_Utilities is
	-- C to/from Ada string conversion utilities.

	subtype C_String is System.Address;

	Null_C_String : constant C_String := Zero_Address;
	-- Convenience for test for Null C_String.

	function Length (C_Str : in C_String) return Natural;
	-- Returns the number of characters prior to an ASCII.NUL of the
	-- C string.  If the first character is ASCII.NUL, this routine
	-- returns the value 0.

	function To_C_String (S : in String) return C_String;
	-- Return the heap address of the first character in a null terminated
	-- sequence of characters, i.e., a C string, aka char *.
	-- If an application only needs to pass a string to a C function as
	-- a value parameter a c_string may be created on the stack by
	-- declaring a null-terminated ada string:
	--
	--     The_C_String : constant STRING := Ada_String & ASCII.NUL;
	--
	--     Call_C (The_C_String (The_C_String'FIRST)'ADDRESS);
	--
	-- This avoids creating something on the heap and does not require
	-- any deallocation.

	function To_C_String (S : in X_Lib.String_8) return C_String;
	-- An overloaded function for non-ASCII character sets.

	function To_C_String (S : in X_Lib.Fonts.String_16) return C_String;
	-- An overloaded function for non-ASCII character sets.

	function To_C_String (N : in Natural) return C_String;
	-- Returns a C string of spaces ' ' on the heap.
	-- If N = 0 then returns the configuration dependent Zero_Address.

	procedure Free (Cstr : in out C_String);
	-- Returns heap storage for Cstr.
	-- CAUTION: do not use UNCHECKED_DEALLOCATION on C_String;
	--          objects of C_String may be created by system
	--          dependent code such as UNIX malloc.

	function From_C_String (Cstr : in C_String) return String;
	-- Creates an Ada string from a C string.
	-- Does not allocate on the heap.

	function From_C_String (Cstr : in C_String) return X_Lib.String_8;
	-- An overloaded function for non-ASCII character sets.

	function From_C_String (Cstr : in C_String)
			       return X_Lib.Fonts.String_16;
	-- An overloaded function for non-ASCII character sets.

	function Allocate (S : in String) return X_Lib.String_Pointer;
	function Allocate (S : in X_Lib.String_8) return X_Lib.String_Pointer_8;
	function Allocate (S : in X_Lib.Fonts.String_16)
			  return X_Lib.Fonts.String_Pointer_16;

	procedure String_Termination_Check
		     (Str_Arr : in out X_Lib.String_Pointer_Array);

	function String_Termination_Check
		    (Orig : in String; Addr : in X_Lib.X_Address)
		    return X_Lib.X_Address;
    end String_Conversion_Utilities;
end X_System_Utilities;
