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

with X_Configuration_Dependent, X_Lib, Xt, System;

-- the Xmu package contains the following subpackages.
-- atoms

package Xmu is
    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type String_Pointer_Ptr is access X_Lib.String_Pointer;
    -- a pointer to a pointer to a string.
    subtype File_Ptr is X_Lib.X_Address;

    subtype Status is X_Lib.X_Integer;

    package Atom is
	type Xmu_Atom is private;

	function Xa_Atom_Pair (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Character_Position
		    (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Class (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Client_Window
		    (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Clipboard (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Compound_Text
		    (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Decnet_Address
		    (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Delete (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Filename (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Hostname (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Ip_Address (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Length (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_List_Length (Dpy : in X_Lib.Display)
				return X_Lib.Atoms.Atom;
	function Xa_Name (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Net_Address (Dpy : in X_Lib.Display)
				return X_Lib.Atoms.Atom;
	function Xa_Null (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Owner_Os (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Span (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Targets (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Text (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_Timestamp (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;
	function Xa_User (Dpy : in X_Lib.Display) return X_Lib.Atoms.Atom;

	-- by convention the atom string is all UPPER CASE
	function Xmu_Make_Atom (Name : in String) return Xmu_Atom;

	function Xmu_Intern_Atom
		    (Dpy : in X_Lib.Display; The_Atom : in Xmu_Atom)
		    return X_Lib.Atoms.Atom;

	procedure Xmu_Intern_Strings (Dpy : in X_Lib.Display;
				      Names : in X_Lib.String_List;
				      The_List : in X_Lib.Atoms.Atom_List);

	function Xmu_Get_Atom_Name
		    (Dpy : in X_Lib.Display; The_Atom : in X_Lib.Atoms.Atom)
		    return X_Lib.String_Pointer; -- deallocate string when done.

	function Xmu_Name_Of_Atom
		    (The_Atom : in Xmu_Atom)
		    return X_Lib.String_Pointer;-- deallocate string when done

    private
	type Atom_Rec;
	type Xmu_Atom is access Atom_Rec;
    end Atom;

-----------------------------------------------------

    package Char_Set is
	procedure Xmu_Copy_Iso_Latin1_Lowered
		     (Dst : out X_Lib.String_Pointer; Src : in String);

	procedure Xmu_Copy_Iso_Latin1_Uppered
		     (Dst : out X_Lib.String_Pointer; Src : in String);

	function Xmu_Compare_Iso_Latin1 (First : in String; Second : in String)
					return X_Lib.X_Integer;
    end Char_Set;

------------------------------------------------------

    package Close_Hook is
	subtype Xmu_Close_Hook_Proc is X_Lib.X_Address;
	subtype X_Close_Hook is X_Lib.X_Address;

	function Xmu_Add_Close_Display_Hook
		    (Dpy : in X_Lib.Display;
		     Func : in Xmu_Close_Hook_Proc;
		     Arg : in X_Lib.X_Address) return X_Close_Hook;

	function Xmu_Remove_Close_Display_Hook
		    (Dpy : in X_Lib.Display;
		     Hook : in X_Close_Hook;
		     Func : in Xmu_Close_Hook_Proc;
		     Arg : in X_Lib.X_Address) return Boolean;

	function Xmu_Lookup_Close_Display_Hook
		    (Dpy : in X_Lib.Display;
		     Hook : in X_Close_Hook;
		     Func : in Xmu_Close_Hook_Proc;
		     Arg : in X_Lib.X_Address) return Boolean;
    end Close_Hook;

-----------------------------------------------------

    package Converters is
	--/*
	-- * Converters - insert in alphabetical order
	-- */

	type Cvt_Type is (Xmu_Cvt_Function_To_Callback,
			  Xmu_Cvt_String_To_Backing_Store,
			  Xmu_Cvt_String_To_Cursor, Xmu_Cvt_String_To_Justify,
			  Xmu_Cvt_String_To_Long, Xmu_Cvt_String_To_Orientation,
			  Xmu_Cvt_String_To_Bitmap,
			  Xmu_Cvt_String_To_Shape_Style, Xmu_Reshape_Widget,
			  Xmu_Cvt_String_To_Widget);

	function Cvt_Address (Cvt : in Cvt_Type) return X_Lib.X_Address;

	-- XmuCvtFunctionToCallback();
	procedure Xmu_Cvt_Function_To_Callback
		     (Args : in X_Lib.Resource_Manager.Xrm_Value_Array; -- unused
		      From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		      To_Val : out X_Lib.Resource_Manager.Xrm_Value);

	-- XmuCvtStringToBackingStore
	procedure Xmu_Cvt_String_To_Backing_Store
		     (Args : in X_Lib.Resource_Manager.Xrm_Value_Array; -- unused
		      From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		      To_Val : out X_Lib.Resource_Manager.Xrm_Value);

	Xt_N_Backing_Store : constant String := "backingStore" & Ascii.Nul;
	Xt_C_Backing_Store : constant String := "BackingStore" & Ascii.Nul;
	Xt_R_Backing_Store : constant String := "BackingStore" & Ascii.Nul;
	Xt_E_Not_Useful : constant String := "notUseful" & Ascii.Nul;
	Xt_E_When_Mapped : constant String := "whenMapped" & Ascii.Nul;
	Xt_E_Always : constant String := "always" & Ascii.Nul;
	Xt_E_Default : constant String := "default" & Ascii.Nul;

	-- XmuCvtStringToCursor
	procedure Xmu_Cvt_String_To_Cursor
		     (Args : in X_Lib.Resource_Manager.Xrm_Value_Array;
		      From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		      To_Val : out X_Lib.Resource_Manager.Xrm_Value);

	procedure Xmu_Cvt_String_To_Color_Cursor
		     (Dpy : in X_Lib.Display;
		      Args : in X_Lib.Resource_Manager.Xrm_Value_Array;
		      From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		      To_Val : out X_Lib.Resource_Manager.Xrm_Value;
		      Converter_Data : out Xt.Xt_Pointer;
		      Ret_Val : out Boolean);

	Xt_R_Color_Cursor : constant String := "ColorCursor" & Ascii.Nul;
	Xt_N_Pointer_Color : constant String := "pointerColor" & Ascii.Nul;
	Xt_N_Pointer_Color_Background : constant String :=
	   "pointerColorBackground" & Ascii.Nul;

	--  XmuCvtStringToGravity
	subtype Xt_Gravity is X_Lib.X_Integer;

	Xt_R_Gravity : constant String := "Gravity" & Ascii.Nul;
	Xt_E_Forget : constant String := "forget" & Ascii.Nul;
	Xt_E_North_West : constant String := "northwest" & Ascii.Nul;
	Xt_E_North : constant String := "north" & Ascii.Nul;
	Xt_E_North_East : constant String := "northeast" & Ascii.Nul;
	Xt_E_West : constant String := "west" & Ascii.Nul;
	Xt_E_Center : constant String := "center" & Ascii.Nul;
	Xt_E_East : constant String := "east" & Ascii.Nul;
	Xt_E_South_West : constant String := "southwest" & Ascii.Nul;
	Xt_E_South : constant String := "south" & Ascii.Nul;
	Xt_E_South_East : constant String := "southeast" & Ascii.Nul;
	Xt_E_Static : constant String := "static" & Ascii.Nul;
	Xt_E_Unmap : constant String := "unmap" & Ascii.Nul;

	procedure Xmu_Cvt_String_To_Gravity
		     (Args : in X_Lib.Resource_Manager.Xrm_Value_Array;
		      From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		      To_Val : out X_Lib.Resource_Manager.Xrm_Value);

	-- XmuCvtStringToJustify
	type Xt_Justify is
	   (Xt_Justify_Left,       -- justify text to left side of button   */
	    Xt_Justify_Center,     -- justify text in center of button      */
	    Xt_Justify_Right);     -- justify text to right side of button  */
	for Xt_Justify'Size use 32;

	Xt_E_Left : constant String := "left" & Ascii.Nul;
	Xt_E_Right : constant String := "right" & Ascii.Nul;
	Xt_E_Top : constant String := "top" & Ascii.Nul;
	Xt_E_Bottom : constant String := "bottom" & Ascii.Nul;

	procedure Xmu_Cvt_String_To_Justify
		     (Args : in X_Lib.Resource_Manager.
				   Xrm_Value_Array; -- not used
		      From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		      To_Val : out X_Lib.Resource_Manager.Xrm_Value);

	-- XmuCvtStringToLong
	Xt_R_Long : constant String := "Long" & Ascii.Nul;

	procedure Xmu_Cvt_String_To_Long
		     (Args : in X_Lib.Resource_Manager.Xrm_Value_Array; -- unused
		      From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		      To_Val : out X_Lib.Resource_Manager.Xrm_Value);

	-- XmuCvtStringToOrientation
	type Xt_Orientation is (Xt_Orient_Horizontal, Xt_Orient_Vertical);
	for Xt_Orientation'Size use 32;

	procedure Xmu_Cvt_String_To_Orientation
		     (Args : in X_Lib.Resource_Manager.Xrm_Value_Array; -- unused
		      From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		      To_Val : out X_Lib.Resource_Manager.Xrm_Value);

	-- XmuCvtStringToBitmap
	procedure Xmu_Cvt_String_To_Bitmap
		     (Args : in X_Lib.Resource_Manager.Xrm_Value_Array;
		      From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		      To_Val : out X_Lib.Resource_Manager.Xrm_Value);

	-- XmuCvtStringToShapeStyle; is XtTypeConverter (i.e. new style)
	Xt_R_Shape_Style : constant String := "ShapeStyle" & Ascii.Nul;
	Xt_E_Rectangle : constant String := "Rectangle" & Ascii.Nul;
	Xt_E_Oval : constant String := "Oval" & Ascii.Nul;
	Xt_E_Ellipse : constant String := "Ellipse" & Ascii.Nul;
	Xt_E_Rounded_Rectangle : constant String :=
	   "RoundedRectangle" & Ascii.Nul;

	type Xmu_Shape_Type is (Xmu_Shape_Rectangle, Xmu_Shape_Oval,
				Xmu_Shape_Ellipse, Xmu_Shape_Rounded_Rectangle);
	for Xmu_Shape_Type'Size use 32;
	for Xmu_Shape_Type use (Xmu_Shape_Rectangle => 1,
				Xmu_Shape_Oval => 2,
				Xmu_Shape_Ellipse => 3,
				Xmu_Shape_Rounded_Rectangle => 4);

	procedure Xmu_Cvt_String_To_Shape_Style
		     (Dpy : in X_Lib.Display;
		      Args : in X_Lib.Resource_Manager.
				   Xrm_Value_Array;-- not used
		      From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		      To_Val : out X_Lib.Resource_Manager.Xrm_Value;
		      Data : in Xt.Xt_Pointer;  -- not used
		      Status : out Boolean);

	function Xmu_Reshape_Widget
		    (W : in Xt.Widget;
		     Shape_Style : in X_Lib.X_Integer;
		     Corner_Width : in X_Lib.X_Integer;
		     Corner_Height : in X_Lib.X_Integer) return Boolean;

	-- XmuCvtStringToWidget
	-- number of args should (must) be 1
	procedure Xmu_Cvt_String_To_Widget
		     (Args : in X_Lib.Resource_Manager.Xrm_Value_Array;
		      From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		      To_Val : out X_Lib.Resource_Manager.Xrm_Value);

	procedure Xmu_New_Cvt_String_To_Widget
		     (Dpy : in X_Lib.Display;
		      Args : in X_Lib.Resource_Manager.Xrm_Value_Array;
		      From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		      To_Val : out X_Lib.Resource_Manager.Xrm_Value;
		      Converter_Data : out Xt.Xt_Pointer;
		      Ret_Val : out Boolean);
    end Converters;

-----------------------------------------------------

    package Cur_Util is
	function Xmu_Cursor_Name_To_Index
		    (Name : in String) return X_Lib.X_Integer;
    end Cur_Util;

-----------------------------------------------------

    package Convert_Cashe is
	type Xmu_Cvt_Cache is
	    record
		Bitmap_File_Path : String_Pointer_Ptr;
		-- * add other per-display data that needs to be cached
	    end record;
	for Xmu_Cvt_Cache use
	    record
		Bitmap_File_Path at 0 range 0 .. 31;
	    end record;

	type Xmu_Cvt_Cache_Ptr is access Xmu_Cvt_Cache;
    end Convert_Cashe;

-----------------------------------------------------

    package Display_Que is
	subtype Xmu_Close_Display_Queue_Proc is X_Lib.X_Address;
	subtype Xmu_Free_Display_Queue_Proc is X_Lib.X_Address;

	type Xmu_Display_Queue;
	type Xmu_Display_Queue_Ptr is access Xmu_Display_Queue;

	type Xmu_Display_Queue_Entry;
	type Xmu_Display_Queue_Entry_Ptr is access Xmu_Display_Queue_Entry;

	type Xmu_Display_Queue_Entry is
	    record
		Prev : Xmu_Display_Queue_Entry_Ptr;
		Next : Xmu_Display_Queue_Entry_Ptr;
		Dpy : X_Lib.Display;
		Close_Hook_X : Xmu.Close_Hook.X_Close_Hook;
		Data : X_Lib.X_Address;
	    end record;

	for Xmu_Display_Queue_Entry use
	    record
		Prev at 0 * Word_Size range 0 .. 31;
		Next at 1 * Word_Size range 0 .. 31;
		Dpy at 2 * Word_Size range 0 .. 31;
		Close_Hook_X at 3 * Word_Size range 0 .. 31;
		Data at 4 * Word_Size range 0 .. 31;
	    end record;

	Xmu_Display_Queue_Entry_Size : constant := 5 * 32;

	type Xmu_Display_Queue is
	    record
		N_Entries : X_Lib.X_Integer;
		Head : Xmu_Display_Queue_Entry_Ptr;
		Tail : Xmu_Display_Queue_Entry_Ptr;
		Close_Func : Xmu_Close_Display_Queue_Proc;
		Free_Func : Xmu_Free_Display_Queue_Proc;
		Data : X_Lib.X_Address;
	    end record;

	for Xmu_Display_Queue use
	    record
		N_Entries at 0 * Word_Size range 0 .. 31;
		Head at 1 * Word_Size range 0 .. 31;
		Tail at 2 * Word_Size range 0 .. 31;
		Close_Func at 3 * Word_Size range 0 .. 31;
		Free_Func at 4 * Word_Size range 0 .. 31;
		Data at 5 * Word_Size range 0 .. 31;
	    end record;
	Xmu_Display_Queue_Size : constant := 6 * 32;

	-- Xmu_DQ_Create
	--    Creates and returns a queue into which displays may be placed.  When
	--    the display is closed, the closefunc (if non-NULL) is upcalled with
	--    as follows:
	--
	--            (*closefunc) (queue, entry)
	--
	--    The freeproc, if non-NULL, is called whenever the last display is
	--    closed, notifying the creator that display queue may be released
	--    using XmuDQDestroy.

	function Xmu_Dq_Create (Close_Func : in Xmu_Close_Display_Queue_Proc;
				Free_Func : in Xmu_Free_Display_Queue_Proc;
				Data : in X_Lib.X_Address)
			       return Xmu_Display_Queue_Ptr;

-- Xmu_DQ_Destroy
--     Releases all memory for the indicated display queue.  If docallbacks
--     is true, then the closefunc (if non-NULL) is called for each
--     display.
--
	function Xmu_Dq_Destroy (Que : in Xmu_Display_Queue_Ptr;
				 Do_Callbacks : X_Configuration_Dependent.Bool)
				return X_Configuration_Dependent.Bool;

-- Xmu_DQ_Lookup_Display
--         Returns the queue entry for the specified display or NULL if the
--         display is not in the queue.
--
	function Xmu_Dq_Lookup_Display
		    (Que : in Xmu_Display_Queue_Ptr; Dpy : in X_Lib.Display)
		    return Xmu_Display_Queue_Entry_Ptr;

-- Xmu_DQ_Add_Display
--         Adds the indicated display to the end of the queue or NULL if it
--         is unable to allocate memory.  The data field may be used by the
--         caller to attach arbitrary data to this display in this queue.  The
--         caller should use XmuDQLookupDisplay to make sure that the display
--         hasn't already been added.
--
	function Xmu_Dq_Add_Display (Que : in Xmu_Display_Queue_Ptr;
				     Dpy : in X_Lib.Display;
				     Data : in X_Lib.X_Address)
				    return Xmu_Display_Queue_Entry_Ptr;

-- Xmu_DQ_Remove_Display
--         Removes the specified display from the given queue.  If the
--         indicated display is not found on this queue, False is returned,
--         otherwise True is returned.
--
	function Xmu_Dq_Remove_Display
		    (Que : in Xmu_Display_Queue_Ptr; Dpy : in X_Lib.Display)
		    return X_Configuration_Dependent.Bool;
    end Display_Que;

-----------------------------------------------------

    package Drawing is
	procedure Xmu_Draw_Rounded_Rectangle
		     (Dpy : in X_Lib.Display;
		      Draw : in X_Lib.Drawable;
		      Gc : in X_Lib.Graphic_Output.Graphic_Context;
		      X, Y, W : in X_Lib.X_Integer;
		      H, Ew, Eh : in X_Lib.X_Integer);

	procedure Xmu_Fill_Rounded_Rectangle
		     (Dpy : in X_Lib.Display;
		      Draw : in X_Lib.Drawable;
		      Gc : in X_Lib.Graphic_Output.Graphic_Context;
		      X, Y, W : in X_Lib.X_Integer;
		      H, Ew, Eh : in X_Lib.X_Integer);

	procedure Xmu_Draw_Logo
		     (Dpy : in X_Lib.Display;
		      Draw : in X_Lib.Drawable;
		      Gc_Fore : in X_Lib.Graphic_Output.Graphic_Context;
		      Gc_Back : in X_Lib.Graphic_Output.Graphic_Context;
		      X, Y : in X_Lib.X_Integer;
		      Width : in X_Lib.Width_Height;
		      Height : in X_Lib.Width_Height);

	function Xmu_Create_Pixmap_From_Bitmap
		    (Dpy : in X_Lib.Display;
		     Draw : in X_Lib.Drawable;
		     Bit_Map : in X_Lib.Pixmap;
		     Width : in X_Lib.Width_Height;
		     Height : in X_Lib.Width_Height;
		     Depth : in X_Lib.Depth_Type;
		     Fore : in X_Configuration_Dependent.Card32;
		     Back : in X_Configuration_Dependent.Card32)
		    return X_Lib.Pixmap;

	function Xmu_Create_Stippled_Pixmap
		    (Scrn : in X_Lib.Screen;
		     Fore : in X_Lib.U_Pixel;
		     Back : in X_Lib.U_Pixel;
		     Depth : in X_Lib.Depth_Type) return X_Lib.Pixmap;

	procedure Xmu_Release_Stippled_Pixmap
		     (Scrn : in X_Lib.Screen; P_Map : in X_Lib.Pixmap);

	-- A new string is allocated "Scrn_Name" the caller
	-- must deallocate when done.
	procedure Xmu_Locate_Bitmap_File
		     (Scrn : in X_Lib.Screen;
		      Name : in String;
		      Scrn_Name : out X_Lib.String_Pointer; -- return value
		      Width_P : out X_Lib.X_Integer;
		      Height_P : out X_Lib.X_Integer;
		      X_Hot_P : out X_Lib.X_Integer;
		      Y_Hot_P : out X_Lib.X_Integer;
		      P_Map : out X_Lib.Pixmap);

	procedure Xmu_Locate_Pixmap_File
		     (Scr : in X_Lib.Screen;
		      Name : in String;
		      Fore : in X_Lib.U_Pixel;
		      Back : in X_Lib.U_Pixel;
		      Depth : in X_Lib.Depth_Type;
		      Srcname_Return : out X_Lib.String_Pointer;
		      Width_Return : out X_Lib.X_Integer;
		      Height_Return : out X_Lib.X_Integer;
		      X_Hot_Return : out X_Lib.X_Integer;
		      Y_Hot_Return : out X_Lib.X_Integer;
		      Ret_Val : out X_Lib.Pixmap);

	-- note double pointer for Data_P, user must deallocate
	-- both data structures when done.
	procedure Xmu_Read_Bitmap_Data (Fstream : in File_Ptr;
					Width : out X_Lib.Width_Height;
					Height : out X_Lib.Width_Height;
					Data_P_Rtn : out X_Lib.String_Pointer;
					X_Hot : out X_Lib.X_Integer;
					Y_Hot : out X_Lib.X_Integer;
					Ret_Val : out X_Lib.X_Integer);

	-- note double pointer for Data_P, user must deallocate
	-- both data structures when done.
	procedure Xmu_Read_Bitmap_Data_From_File
		     (File_Name : in String;
		      Width : out X_Lib.Width_Height;
		      Height : out X_Lib.Width_Height;
		      Data_P : out X_Lib.String_Pointer;
		      X_Hot : out X_Lib.X_Integer;
		      Y_Hot : out X_Lib.X_Integer;
		      Ret_Val : out X_Lib.X_Integer);
    end Drawing;

-----------------------------------------------------

    package Error is
	-- int XmuPrintDefaultErrorMessage();
	function Xmu_Print_Default_Error_Message
		    (Dpy : in X_Lib.Display;
		     The_Event : in X_Lib.Events.Error_Event;
		     Fp : in File_Ptr) return X_Lib.X_Integer;

	-- int XmuSimpleErrorHandler();
	function Xmu_Simple_Error_Handler
		    (Dpy : in X_Lib.Display;
		     The_Event : in X_Lib.Events.Error_Event)
		    return X_Lib.X_Integer;
    end Error;

-----------------------------------------------------
-- init

    package Init is
	subtype Xmu_Initializer_Proc is X_Lib.X_Address;

	-- XmuCallInitializers
	procedure Xmu_Call_Initializers (App_Con : in Xt.Xt_App_Context);

	-- XmuAddInitializer(/* (*void)(), caddr_t */);
	procedure Xmu_Add_Initializer (Func : in Xmu_Initializer_Proc;
				       Data : in X_Lib.X_Address);
    end Init;

-----------------------------------------------------

    package Colors is
	function Xmu_All_Standard_Colormaps
		    (Dpy : in X_Lib.Display) return Status;

	function Xmu_Create_Colormap
		    (Dpy : in X_Lib.Display;
		     Colormap : in X_Lib.Colors.Standard_Colormap_Record)
		    return Status;

	procedure Xmu_Delete_Standard_Colormap (Dpy : in X_Lib.Display;
						Scr : in X_Lib.X_Integer;
						Property : in X_Lib.Atoms.Atom);

	procedure Xmu_Get_Colormap_Allocation
		     (V_Info : in X_Lib.Visual_Info_Record;
		      Property : in X_Lib.Atoms.Atom;
		      Red_Max_Return : out
			 X_Configuration_Dependent.Unsigned_Long;
		      Green_Max_Return : out
			 X_Configuration_Dependent.Unsigned_Long;
		      Blue_Max_Return : out
			 X_Configuration_Dependent.Unsigned_Long;
		      Ret_Val : out Status);


	function Xmu_Lookup_Standard_Colormap
		    (Dpy : in X_Lib.Display;
		     Scr : in X_Lib.X_Integer;
		     Vis_Id : in X_Lib.Visual_Id_Type;
		     Depth : in X_Lib.Depth_Type;
		     Property : in X_Lib.Atoms.Atom;
		     Replace : in X_Configuration_Dependent.Bool;
		     Retain : in X_Configuration_Dependent.Bool) return Status;

	procedure Xmu_Standard_Colormap
		     (Dpy : in X_Lib.Display;
		      Scr : in X_Lib.X_Integer;
		      Vis_Id : in X_Lib.Visual_Id_Type;
		      Depth : in X_Lib.Depth_Type;
		      Property : in X_Lib.Atoms.Atom;
		      Cmap : in X_Lib.Colors.Color_Map;
		      Red_Max_Return : out
			 X_Configuration_Dependent.Unsigned_Long;
		      Green_Max_Return : out
			 X_Configuration_Dependent.Unsigned_Long;
		      Blue_Max_Return : out
			 X_Configuration_Dependent.Unsigned_Long;
		      Ret_Val : out X_Lib.Colors.Standard_Colormap_Record);

	function Xmu_Visual_Standard_Colormaps
		    (Dpy : in X_Lib.Display;
		     Scr : in X_Lib.X_Integer;
		     Vis_Id : in X_Lib.Visual_Id_Type;
		     Depth : in X_Lib.Depth_Type;
		     Replace : in X_Configuration_Dependent.Bool;
		     Retain : in X_Configuration_Dependent.Bool) return Status;
    end Colors;

-----------------------------------------------------

    package Std_Sel is
	-- XmuConvertStandardSelection
	procedure Xmu_Convert_Standard_Selection
		     (W : in Xt.Widget;
		      The_Time : in X_Lib.Time;
		      Selection : in X_Lib.Atoms.Atom;
		      Target : in X_Lib.Atoms.Atom;
		      Type_Return : out X_Lib.Atoms.Atom;
		      Value_Return : out X_Lib.X_Address;
		      Length_Return : out
			 X_Configuration_Dependent.Unsigned_Long;
		      Format_Return : out X_Lib.X_Integer;
		      Ret_Val : out Boolean);
    end Std_Sel;

----------------------------------------------------

    package Sys_Util is
	-- XmuGetHostname
	procedure Xmu_Get_Hostname (Buf_Return : out String;
				    Max_Length : in X_Lib.X_Integer;
				    Ret_Val : out X_Lib.X_Integer);
    end Sys_Util;

-----------------------------------------------------

    package Win_Util is
	-- XmuClientWindow
	function Xmu_Client_Window
		    (Dpy : in X_Lib.Display; Win : in X_Lib.Window)
		    return X_Lib.Window;

	-- XmuUpdateMapHints
	function Xmu_Update_Map_Hints (Dpy : in X_Lib.Display;
				       Win : in X_Lib.Window;
				       Hints : in X_Lib.Size_Hint_Record)
				      return X_Configuration_Dependent.Bool;

	-- XmuScreenOfWindow
	function Xmu_Screen_Of_Window
		    (Dpy : in X_Lib.Display; Win : in X_Lib.Window)
		    return X_Lib.Screen;
    end Win_Util;

-----------------------------------------------------

    package Xct is
	Xct_Version : constant := 1;

	subtype Xct_String is X_Lib.String_Pointer;

	type Xct_H_Direction is
	   (Xct_Unspecified, Xct_Left_To_Right, Xct_Right_To_Left);
	for Xct_H_Direction'Size use 32;

	subtype Xct_Flags is X_Configuration_Dependent.Unsigned_Long;

	Xct_Single_Set_Segments : constant Xct_Flags := 16#0001#;
	Xct_Provide_Extensions : constant Xct_Flags := 16#0002#;
	Xct_Accept_C0_Extensions : constant Xct_Flags := 16#0004#;
	Xct_Accept_C1_Extensions : constant Xct_Flags := 16#0008#;
	Xct_Hide_Direction : constant Xct_Flags := 16#0010#;
	Xct_Free_String : constant Xct_Flags := 16#0020#;
	Xct_Shift_Multi_Gr_To_Gl : constant Xct_Flags := 16#0040#;

	type Xct_Result is (Xctsegment, Xctc0Segment, Xctglsegment,
			    Xctc1Segment, Xctgrsegment,
			    Xctextendedsegment, Xctextension,
			    Xcthorizontal, Xctendoftext, Xcterror);
	for Xct_Result'Size use 32;

	subtype Xct_Priv_Ptr is X_Lib.X_Address;

--    type Xct_Priv;
--    type Xct_Priv_Ptr is access Xct_Priv;

	type Xct_Rec is
	    record
		Total_String : Xct_String;
		Total_Length : X_Lib.X_Integer;
		Flags : Xct_Flags;
		Version : X_Lib.X_Integer;
		Can_Ignore_Exts : X_Lib.X_Integer;
		Item : Xct_String;
		Item_Length : X_Lib.X_Integer;
		Char_Size : X_Lib.X_Integer;
		Encoding : X_Lib.String_Pointer;
		Horizontal : Xct_H_Direction;
		Horz_Depth : X_Lib.X_Integer;
		Gl : X_Lib.String_Pointer;
		Gl_Encoding : X_Lib.String_Pointer;
		Gl_Set_Size : X_Lib.X_Integer;
		Gl_Char_Size : X_Lib.X_Integer;
		Gr : X_Lib.String_Pointer;
		Gr_Encoding : X_Lib.String_Pointer;
		Gr_Set_Size : X_Lib.X_Integer;
		Gr_Char_Size : X_Lib.X_Integer;
		Glgr_Encoding : X_Lib.String_Pointer;
		Priv : Xct_Priv_Ptr;
	    end record;

	for Xct_Rec use
	    record
		Total_String at 0 * Word_Size range 0 .. 31;
		Total_Length at 1 * Word_Size range 0 .. 31;
		Flags at 2 * Word_Size range 0 .. 31;
		Version at 3 * Word_Size range 0 .. 31;
		Can_Ignore_Exts at 4 * Word_Size range 0 .. 31;
		Item at 5 * Word_Size range 0 .. 31;
		Item_Length at 6 * Word_Size range 0 .. 31;
		Char_Size at 7 * Word_Size range 0 .. 31;
		Encoding at 8 * Word_Size range 0 .. 31;
		Horizontal at 9 * Word_Size range 0 .. 31;
		Horz_Depth at 10 * Word_Size range 0 .. 31;
		Gl at 11 * Word_Size range 0 .. 31;
		Gl_Encoding at 12 * Word_Size range 0 .. 31;
		Gl_Set_Size at 13 * Word_Size range 0 .. 31;
		Gl_Char_Size at 14 * Word_Size range 0 .. 31;
		Gr at 15 * Word_Size range 0 .. 31;
		Gr_Encoding at 16 * Word_Size range 0 .. 31;
		Gr_Set_Size at 17 * Word_Size range 0 .. 31;
		Gr_Char_Size at 18 * Word_Size range 0 .. 31;
		Glgr_Encoding at 19 * Word_Size range 0 .. 31;
		Priv at 20 * Word_Size range 0 .. 31;
	    end record;

	Xct_Rec_Size : constant := 21 * 32;
	type Xct_Data is access Xct_Rec;

--    type Xct_Priv is
--      record
--        Ptr       :  Xct_String;
--        Ptrend    :  Xct_String;
--        Flags     :  Xct_Flags;
--        Dirstack  :  Xct_H_Direction;
--        Dirsize   :  X_Configuration_Dependent.Unsigned_Long;
--        Encoding  :  X_Lib.X_Address ; -- Pntr To Pntr To String
--        Enc_Count :  Xct_Flags;
--        Itembuf   :  Xct_String;
--        Buf_Count :  X_Configuration_Dependent.Unsigned_Long;
--      end record;

--    for Xct_Priv use
--      record
--        Ptr       at  0 * Word_Size     range 0 .. 31;
--        Ptrend    at  1 * Word_Size     range 0 .. 31;
--        Flags     at  2 * Word_Size     range 0 .. 31;
--        Dirstack  at  3 * Word_Size     range 0 .. 31;
--        Dirsize   at  4 * Word_Size     range 0 .. 31;
--        Encoding  at  5 * Word_Size     range 0 .. 31;
--        Enc_Count at  6 * Word_Size     range 0 .. 31;
--        Itembuf   at  7 * Word_Size     range 0 .. 31;
--        Buf_Count at  8 * Word_Size     range 0 .. 31;
--      end record;

--    Xct_Priv_Size : constant := 9 * 32;

	-- XctCreate
	function Xct_Create
		    (The_String : in Xct_String;       -- need not be null term
		     The_Length : in
			X_Lib.X_Integer;  -- need not be full lenght of string
		     The_Flags : in Xct_Flags) return Xct_Rec;

	-- XctNextItem
	function Xct_Next_Item (Data : in Xct_Rec) return Xct_Result;

	-- XctFree
	procedure Xct_Free (Data : in Xct_Rec);

	-- XctReset
	procedure Xct_Reset (Data : in Xct_Rec);
    end Xct;

    package Widget_Node is
	type Xmu_Widget_Node_Rec;
	type Xmu_Widget_Node_Rec_Ptr is access Xmu_Widget_Node_Rec;
	type Widget_Node_Array is
	   array (Natural range <>) of Xmu_Widget_Node_Rec_Ptr;
	type Widget_Node_List is access Widget_Node_Array;

	type Xmu_Widget_Node_Rec is
	    record
		Label : X_Lib.String_Pointer;
		Widget_Class_Ptr : X_Lib.X_Address;
		Superclass : Xmu_Widget_Node_Rec_Ptr;
		Children : Xmu_Widget_Node_Rec_Ptr;
		Siblings : Xmu_Widget_Node_Rec_Ptr;
		Lowered_Label : X_Lib.String_Pointer;
		Lowered_Classname : X_Lib.String_Pointer;
		Have_Resources : X_Configuration_Dependent.Bool;
		Resources : Xt.Xt_Ancillary_Types.Xt_Resource_List;
		Resourcewn : Widget_Node_List;
		Nresources : Xt.Cardinal;
		Constraints : Xt.Xt_Ancillary_Types.Xt_Resource_List;
		Constraintwn : Widget_Node_List;
		Nconstraints : Xt.Cardinal;
		Data : Xt.Xt_Pointer;
	    end record;

	for Xmu_Widget_Node_Rec use
	    record
		Label at 0 * Word_Size range 0 .. 31;
		Widget_Class_Ptr at 1 * Word_Size range 0 .. 31;
		Superclass at 2 * Word_Size range 0 .. 31;
		Children at 3 * Word_Size range 0 .. 31;
		Siblings at 4 * Word_Size range 0 .. 31;
		Lowered_Label at 5 * Word_Size range 0 .. 31;
		Lowered_Classname at 6 * Word_Size range 0 .. 31;
		Have_Resources at 7 * Word_Size range 0 .. 31;
		Resources at 8 * Word_Size range 0 .. 31;
		Resourcewn at 9 * Word_Size range 0 .. 31;
		Nresources at 10 * Word_Size range 0 .. 31;
		Constraints at 11 * Word_Size range 0 .. 31;
		Constraintwn at 12 * Word_Size range 0 .. 31;
		Nconstraints at 13 * Word_Size range 0 .. 31;
		Data at 14 * Word_Size range 0 .. 31;
	    end record;

	procedure Xmu_Wn_Initialize_Nodes (Nodearray : in Widget_Node_Array);

	procedure Xmu_Wn_Fetch_Resources (Node : in Xmu_Widget_Node_Rec;
					  Top_Level : in Xt.Widget;
					  Top_Node : in Xmu_Widget_Node_Rec);

	function Xmu_Wn_Count_Owned_Resources
		    (Node : in Xmu_Widget_Node_Rec;
		     Owner_Node : in Xmu_Widget_Node_Rec;
		     Constraints : in X_Configuration_Dependent.Bool)
		    return X_Lib.X_Integer;

	function Xmu_Wn_Name_To_Node
		    (Node_List : in Widget_Node_Array; Name : in String)
		    return Xmu_Widget_Node_Rec;
    end Widget_Node;
end Xmu;
