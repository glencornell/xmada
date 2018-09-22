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

with X_Lib, X_System_Utilities;

package Xt_System_Utilities is
    type Options_Type is
	record
	    Require_String_Termination : Boolean := False;
	    Fix_String_Termination : Boolean := True;
	    Single_Thread_Calls : Boolean := False;
	    Block : Boolean := True;
	    Poll_Delay : Duration := 0.5;
	end record;

    -- NOTES on Options_Type components:
    -- 1. Require_String_Termination when set to TRUE causes a precondition
    --    check to be performed where all strings must be ASCII.NUL terminated.
    -- 2. Fix_String_Termination when set to TRUE will cause the Xt package
    --    operations to append ASCII.NUL to any non-null terminated strings.
    --    This option will most likely result in memory leaks due to the
    --    need to copy strings.  The onus is on the user to perform memory
    --    deallocations if possible and where necessary when using this
    --    option.
    -- 3. If neither Require_String_Termination or Fix_String_Termination
    --    is set to TRUE then the binding will pass data to C which may
    --    not meet the semantics expected.  No precondition checks or
    --    attempts at null terminating a string will be made.  If a
    --    non-null terminated string is passed to this package, its
    --    run-time effects will be unknown and may be catostrophic.
    -- 4. Require_String_Termination and Fix_String_Termination
    --    are mutually exclusive.  At most one of these options should be
    --    set to TRUE.
    -- 5. Single_Thread_Calls will cause calls at all layers to be
    --    single threaded, in support of Ada tasking.  This option is
    --    best used when attempting to call X Window routines that
    --    require sequential access semantics.  Changing the current
    --    option setting from TRUE to FALSE might involve some waiting
    --    time due to the clearing out of other threads of control who are
    --    awaiting single threading prior to invocation of the Set_Options
    --    request.
    -- 6. Block, when set to FALSE, will cause Xt_App_Next_Event, Xt_Next_Event,
    --    Xt_App_Main_Loop, and Xt_Main_Loop to becoming unblocking.
    -- 7. Poll_Delay works in conjunction with the Block option when set to
    --    FALSE.  It specifies the length of time between polling inquiries
    --    when a previous attempt to grab an event yielded no event.

    function Allocate (S : in String) return X_Lib.String_Pointer
       renames X_System_Utilities.String_Conversion_Utilities.Allocate;
    function Allocate (S : in X_Lib.String_8) return X_Lib.String_Pointer_8
       renames X_System_Utilities.String_Conversion_Utilities.Allocate;
    function Allocate (S : in X_Lib.Fonts.String_16)
		      return X_Lib.Fonts.String_Pointer_16
       renames X_System_Utilities.String_Conversion_Utilities.Allocate;

    procedure String_Termination_Check
		 (Str_Arr : in out X_Lib.String_Pointer_Array)
       renames X_System_Utilities.String_Conversion_Utilities.
	       String_Termination_Check;

    function String_Termination_Check
		(Orig : in String; Addr : in X_Lib.X_Address)
		return X_Lib.X_Address
       renames X_System_Utilities.String_Conversion_Utilities.
	       String_Termination_Check;

    procedure Set_Options (To : in Options_Type);
    function Get_Options return Options_Type;

    -- Raised when a string or component of a string array is not
    -- terminated with an ASCII.NUL character and the option to
    -- raise exceptions in this case is on.
    String_Termination_Error :
       exception renames X_System_Utilities.String_Termination_Error;

    -- Raised upon a call to Set_Options above where the components of
    -- the Options_Type make no sense.
    Illegal_Options : exception;

    -- Use this routine to get an instantaneous and therefore perhaps unreliable
    -- count of the number of threads of control currently queued up after
    -- any point where Single_Thread_Calls has been set to TRUE.  Note that
    -- this routine can return a positive number even when Single_Thread_Calls
    -- is FALSE because not all threads might have been serviced during a prior
    -- period when Single_Thread_Calls was TRUE.
    function Threads_Queued return Natural;
end Xt_System_Utilities;
