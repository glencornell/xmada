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

with X_Lib;
use X_Lib;

package Xt_Unix_Devices is
    type Errno_Type is new X_Lib.X_Integer;

    Eintr : constant Errno_Type := 4;  -- UNIX errno for intr

    function Get_Errno return Errno_Type;

    C_Fd_Mask_Size : constant := 32;  -- Number of bits per C fd mask

    -- UNIX time abstraction
    type Timeval is
	record
	    Tv_Secs : X_Lib.X_Integer;  -- seconds
	    Tv_Usecs : X_Lib.X_Integer;  -- microseconds
	end record;

    for Timeval use
	record
	    Tv_Secs at 0 range 0 .. 31;
	    Tv_Usecs at 0 range 32 .. 63;
	end record;

    type Timeval_Ptr is access Timeval;

    -- UNIX file descriptor/device abstraction
    Num_Files : constant := 32; -- max number of files per process

    subtype Unix_Device is X_Lib.X_Integer range 0 .. Num_Files - 1;

    subtype Ada_Fd_Mask is X_Lib.Boolean_Array (Natural (Unix_Device'First) ..
						   Natural (Unix_Device'Last));

    -- the 1 compiler has problems resolving the arithmatic
    -- in this expression so I just forced it.
    -- C_Mask_Array_Extent : constant := (Num_Files / C_Fd_Mask_Size) + 1;
    C_Mask_Array_Extent : constant := 1;
    subtype C_Fd_Mask is X_Lib.X_Integer;
    type C_Mask_Array is array (0 .. C_Mask_Array_Extent) of C_Fd_Mask;
    type Fd_Set_Rec is
	record
	    Fd_Masks : C_Mask_Array;
	end record;
    type C_Fd_Set is access Fd_Set_Rec;

    -- Fd_Rec is a trio of boolean arrays indexed by devices, and indicate
    -- per-device whether we should be checking for read, write, or exceptions
    -- as source of events.  C was using array of 8-bit bit-vectors.
    type Fd_Rec is
	record
	    Rmask : Ada_Fd_Mask;
	    Wmask : Ada_Fd_Mask;
	    Emask : Ada_Fd_Mask;
	    Count : Natural;
	    Num_Fds : Natural;
	end record;

    -- This procedure will set the position'th bit of the c_fd_mask whose
    -- address is passed in.
    procedure Set_Fd_Mask_Bit (C_Mask_Addr : in X_Lib.X_Address;
			       Position : in X_Lib.X_Integer);

    -- This procedure will clear the position'th bit of the c_fd_mask whose
    -- address is passed in.
    procedure Clear_Fd_Mask_Bit (C_Mask_Addr : in X_Lib.X_Address;
				 Position : in X_Lib.X_Integer);

    -- This procedure will check the position'th bit of the c_fd_mask whose
    -- address is passed in, and return set.all=1 if true, set.all=0 if false
    procedure Check_Fd_Mask_Bit (C_Mask_Addr : in X_Lib.X_Address;
				 Position : in X_Lib.X_Integer;
				 Set : in X_Lib.X_Address);

    -- This function returns the c_fd_set equivalent of an Ada_Fd_Mask.
    function Get_C_Fd_Set (Ada_Mask : in Ada_Fd_Mask) return C_Fd_Set;

    -- This function returns the Ada_Fd_Mask equivalent of a C_Fd_Set.
    function Get_Ada_Fd_Mask (The_Fd_Set : in C_Fd_Set) return Ada_Fd_Mask;

    -- These functions check, set and clear the masks which indicate which
    -- input sources are active
    procedure Fd_Set (Index : in Unix_Device;
		      The_Ada_Fd_Mask : in out Ada_Fd_Mask);

    procedure Fd_Clr (Index : in Unix_Device;
		      The_Ada_Fd_Mask : in out Ada_Fd_Mask);

    function Fd_Is_Set
		(Index : in Unix_Device; The_Ada_Fd_Mask : in Ada_Fd_Mask)
		return Boolean;

    procedure Fd_Zero (The_Ada_Fd_Mask : in out Ada_Fd_Mask);

    -- This procedure wraps the C select function which scans the socket
    -- connections and marks the masks when an event has occurred.
    -- the number of inputs is returned in Num_Found.
    procedure Socket_Select (Num_Fds : in Natural;
			     Rmask, Wmask, Emask : in out Ada_Fd_Mask;
			     Time_Out : in Timeval;
			     Num_Found : out X_Lib.X_Integer);
end Xt_Unix_Devices;
