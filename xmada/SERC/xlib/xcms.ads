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

-- this package contains the X11R5 device independent color manipulation
-- routines and types

package Xcms is
    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xcms_Status is (Xcms_Failure, Xcms_Success,
			 Xcms_Success_With_Compression);
    for Xcms_Status'Size use 32;

    type Xcms_Color_Format is
       (Xcms_Rgb_Format, Xcms_Rgbi_Format, Xcms_Undefined_Format,
	Xcms_Cie_Xyz_Format, Xcms_Cie_Uvy_Format, Xcms_Cie_Xyy_Format,
	Xcms_Cie_Lab_Format, Xcms_Cie_Luv_Format, Xcms_Tek_Hvc_Format);
    for Xcms_Color_Format'Size use 32;
    for Xcms_Color_Format use
       (Xcms_Rgb_Format => X_Configuration_Dependent.Int32'Pos
			      (X_Configuration_Dependent.Int32'First),
	Xcms_Rgbi_Format => X_Configuration_Dependent.Int32'Pos
			       (X_Configuration_Dependent.Int32'First) + 1,
	Xcms_Undefined_Format => 0,
	Xcms_Cie_Xyz_Format => 1,
	Xcms_Cie_Uvy_Format => 2,
	Xcms_Cie_Xyy_Format => 3,
	Xcms_Cie_Lab_Format => 4,
	Xcms_Cie_Luv_Format => 5,
	Xcms_Tek_Hvc_Format => 6);

    subtype Xcms_Float is X_Lib.X_Long_Float;

    -- State of XcmsPerScrnInfo
    type Per_Scrn_Info_States is (Xcmsinitnone,                     -- no initialization attempted
				  Xcmsinitsuccess,                  -- initialization successful
				  Xcmsinitdefault);                 -- initialization failed
    for Per_Scrn_Info_States'Size use 8;
    for Per_Scrn_Info_States use
       (Xcmsinitnone => 0, Xcmsinitsuccess => 1, Xcmsinitdefault => 16#FF#);

    type Xcms_Rgb is
	record
	    Red : X_Lib.Colors.Rgb_Value_Type;
	    Green : X_Lib.Colors.Rgb_Value_Type;
	    Blue : X_Lib.Colors.Rgb_Value_Type;
	end record;
    for Xcms_Rgb'Size use 48;
    for Xcms_Rgb use
	record
	    Red at 0 * Word_Size range 0 .. 15;
	    Green at 0 * Word_Size range 16 .. 31;
	    Blue at 1 * Word_Size range 0 .. 15;
	end record;

    type Xcms_Rgbi is
	record
	    Red : Xcms_Float;
	    Green : Xcms_Float;
	    Blue : Xcms_Float;
	end record;
    for Xcms_Rgbi use
	record
	    Red at 0 * Word_Size range 0 .. 63;
	    Green at 2 * Word_Size range 0 .. 63;
	    Blue at 4 * Word_Size range 0 .. 63;
	end record;

    type Xcms_Cie_Xyz is
	record
	    X : Xcms_Float;
	    Y : Xcms_Float;
	    Z : Xcms_Float;
	end record;
    for Xcms_Cie_Xyz use
	record
	    X at 0 * Word_Size range 0 .. 63;
	    Y at 2 * Word_Size range 0 .. 63;
	    Z at 4 * Word_Size range 0 .. 63;
	end record;

    type Xcms_Cie_Uvy is
	record
	    U_Prime : Xcms_Float;
	    V_Prime : Xcms_Float;
	    Y : Xcms_Float;
	end record;
    for Xcms_Cie_Uvy use
	record
	    U_Prime at 0 * Word_Size range 0 .. 63;
	    V_Prime at 2 * Word_Size range 0 .. 63;
	    Y at 4 * Word_Size range 0 .. 63;
	end record;

    type Xcms_Cie_Xyy is
	record
	    X : Xcms_Float;
	    Y : Xcms_Float;
	    Big_Y : Xcms_Float;
	end record;
    for Xcms_Cie_Xyy use
	record
	    X at 0 * Word_Size range 0 .. 63;
	    Y at 2 * Word_Size range 0 .. 63;
	    Big_Y at 4 * Word_Size range 0 .. 63;
	end record;

    type Xcms_Cie_Lab is
	record
	    L_Star : Xcms_Float;
	    A_Star : Xcms_Float;
	    B_Star : Xcms_Float;
	end record;

    for Xcms_Cie_Lab use
	record
	    L_Star at 0 * Word_Size range 0 .. 63;
	    A_Star at 2 * Word_Size range 0 .. 63;
	    B_Star at 4 * Word_Size range 0 .. 63;
	end record;

    type Xcms_Cie_Luv is
	record
	    L_Star : Xcms_Float;
	    U_Star : Xcms_Float;
	    V_Star : Xcms_Float;
	end record;

    for Xcms_Cie_Luv use
	record
	    L_Star at 0 * Word_Size range 0 .. 63;
	    U_Star at 2 * Word_Size range 0 .. 63;
	    V_Star at 4 * Word_Size range 0 .. 63;
	end record;

    type Xcms_Tek_Hvc is
	record
	    H : Xcms_Float;
	    V : Xcms_Float;
	    C : Xcms_Float;
	end record;
    for Xcms_Tek_Hvc use
	record
	    H at 0 * Word_Size range 0 .. 63;
	    V at 2 * Word_Size range 0 .. 63;
	    C at 4 * Word_Size range 0 .. 63;
	end record;

    type Xcms_Pad is
	record
	    Pad0 : Xcms_Float;
	    Pad1 : Xcms_Float;
	    Pad2 : Xcms_Float;
	    Pad3 : Xcms_Float;
	end record;
    for Xcms_Pad use
	record
	    Pad0 at 0 * Word_Size range 0 .. 63;
	    Pad1 at 2 * Word_Size range 0 .. 63;
	    Pad2 at 4 * Word_Size range 0 .. 63;
	    Pad3 at 6 * Word_Size range 0 .. 63;
	end record;

    type Xcms_Color_Rec (Format : Xcms_Color_Format := Xcms_Undefined_Format) is
	record
	    Pixel_Value : X_Lib.Pixel;

	    case Format is
		when Xcms_Undefined_Format =>
		    null;
		when Xcms_Cie_Xyz_Format =>
		    Cie_Xyz : Xcms_Cie_Xyz;
		when Xcms_Cie_Uvy_Format =>
		    Cie_Uvy : Xcms_Cie_Uvy;
		when Xcms_Cie_Xyy_Format =>
		    Cie_Xyy : Xcms_Cie_Xyy;
		when Xcms_Cie_Lab_Format =>
		    Cie_Lab : Xcms_Cie_Lab;
		when Xcms_Cie_Luv_Format =>
		    Cie_Luv : Xcms_Cie_Luv;
		when Xcms_Tek_Hvc_Format =>
		    Tek_Hvc : Xcms_Tek_Hvc;
		when Xcms_Rgb_Format =>
		    Rgb : Xcms_Rgb;
		when Xcms_Rgbi_Format =>
		    Rgbi : Xcms_Rgbi;
	    end case;
	end record;

    for Xcms_Color_Rec use
	record
	    Format at 0 * Word_Size range 0 .. 31;
	    Pixel_Value at 1 * Word_Size range 0 .. 31;
	    Cie_Xyz at 2 * Word_Size range 0 .. 32 * 6 - 1;
	    Cie_Uvy at 2 * Word_Size range 0 .. 32 * 6 - 1;
	    Cie_Xyy at 2 * Word_Size range 0 .. 32 * 6 - 1;
	    Cie_Lab at 2 * Word_Size range 0 .. 32 * 6 - 1;
	    Cie_Luv at 2 * Word_Size range 0 .. 32 * 6 - 1;
	    Tek_Hvc at 2 * Word_Size range 0 .. 32 * 6 - 1;
	    Rgb at 2 * Word_Size range 0 .. 32 * 2 - 1;
	    Rgbi at 2 * Word_Size range 0 .. 32 * 6 - 1;
	end record;

    type Xcms_Color_Rec_Ptr is access Xcms_Color_Rec;
    type Xcms_Color_Array is array (Natural range <>) of Xcms_Color_Rec_Ptr;

    type Xcms_Per_Scrn_Info is
	record
	    Screen_White_Pt : Xcms_Color_Rec;
	    Function_Set : X_Lib.X_Pointer;
	    Screen_Data : X_Lib.X_Pointer;
	    State : Per_Scrn_Info_States;
	    Pad : X_Lib.Char_Array (1 .. 3);
	end record;

    for Xcms_Per_Scrn_Info use
	record
	    Screen_White_Pt at 0 * Word_Size range 0 .. 32 * 8 - 1;
	    Function_Set at 8 * Word_Size range 0 .. 31;
	    Screen_Data at 9 * Word_Size range 0 .. 31;
	    State at 10 * Word_Size range 0 .. 7;
	    Pad at 10 * Word_Size range 8 .. 31;
	end record;

    type Xcms_Per_Scrn_Info_Ptr is access Xcms_Per_Scrn_Info;

    subtype Xcms_Compression_Proc is X_Lib.X_Address;

    subtype Xcms_White_Adjust_Proc is X_Lib.X_Address;

    subtype Xcms_Screen_Init_Proc is X_Lib.X_Address;

    subtype Xcms_Screen_Free_Proc is X_Lib.X_Address;

    subtype Xcms_Conversion_Proc is X_Lib.X_Address;

    -- Note: This array must be NULL terminated before being passed to C
    type Xcms_Func_List_Array is
       array (Natural range <>) of Xcms_Conversion_Proc;
    type Xcms_Func_List_Ptr is access Xcms_Func_List_Array;

    subtype Xcms_Parse_String_Proc is X_Lib.X_Address;

    type Xcms_Ccc_Rec is
	record
	    Dpy : X_Lib.Display;
	    Screen_Number : X_Lib.Screen_Number;
	    Vis : X_Lib.Visual;
	    Client_White_Pt : Xcms_Color_Rec;
	    Gamut_Comp_Proc : Xcms_Compression_Proc;
	    Gamut_Comp_Client_Data : X_Lib.X_Pointer;
	    White_Pt_Adj_Proc : Xcms_White_Adjust_Proc;
	    White_Pt_Adj_Client_Data : X_Lib.X_Pointer;
	    P_Per_Scrn_Info : Xcms_Per_Scrn_Info_Ptr;
	end record;

    for Xcms_Ccc_Rec use
	record
	    Dpy at 0 * Word_Size range 0 .. 31;
	    Screen_Number at 1 * Word_Size range 0 .. 31;
	    Vis at 2 * Word_Size range 0 .. 31;
	    Client_White_Pt at 3 * Word_Size range 0 .. 32 * 8 - 1;
	    Gamut_Comp_Proc at 11 * Word_Size range 0 .. 31;
	    Gamut_Comp_Client_Data at 12 * Word_Size range 0 .. 31;
	    White_Pt_Adj_Proc at 13 * Word_Size range 0 .. 31;
	    White_Pt_Adj_Client_Data at 14 * Word_Size range 0 .. 31;
	    P_Per_Scrn_Info at 15 * Word_Size range 0 .. 31;
	end record;

    type Xcms_Ccc is access Xcms_Ccc_Rec;

    type Xcms_Color_Space is
	record
	    Prefix : X_Lib.String_Pointer;
	    Id : Xcms_Color_Format;
	    Parse_String : Xcms_Parse_String_Proc;
	    To_Ciexyz : Xcms_Func_List_Ptr;
	    From_Ciexyz : Xcms_Func_List_Ptr;
	    Invers_Flag : X_Lib.X_Integer;
	end record;

    for Xcms_Color_Space use
	record
	    Prefix at 0 * Word_Size range 0 .. 31;
	    Id at 1 * Word_Size range 0 .. 31;
	    Parse_String at 2 * Word_Size range 0 .. 31;
	    To_Ciexyz at 3 * Word_Size range 0 .. 31;
	    From_Ciexyz at 4 * Word_Size range 0 .. 31;
	    Invers_Flag at 5 * Word_Size range 0 .. 31;
	end record;

    type Xcms_Color_Space_Ptr is access Xcms_Color_Space;
    type Xcms_Color_Space_Array is array (Natural range <>) of Xcms_Color_Space;
    type Xcms_Color_Space_List is access Xcms_Color_Space_Array;

    type Xcms_Function_Set is
	record
	    Dd_Color_Space : Xcms_Color_Space_List;
	    Screen_Init_Proc : Xcms_Screen_Init_Proc;
	    Screen_Free_Proc : Xcms_Screen_Free_Proc;
	end record;

    for Xcms_Function_Set use
	record
	    Dd_Color_Space at 0 * Word_Size range 0 .. 31;
	    Screen_Init_Proc at 1 * Word_Size range 0 .. 31;
	    Screen_Free_Proc at 2 * Word_Size range 0 .. 31;
	end record;

    type Xcms_Function_Set_Ptr is access Xcms_Function_Set;

    subtype Cardinal is X_Configuration_Dependent.Card32;

    function Display_Of_Ccc (Ccc : in Xcms_Ccc_Rec) return X_Lib.Display;

    function Screen_Number_Of_Ccc
		(Ccc : in Xcms_Ccc_Rec) return X_Lib.Screen_Number;

    function Visual_Of_Ccc (Ccc : in Xcms_Ccc_Rec) return X_Lib.Visual;

    function Client_White_Point_Of_Ccc
		(Ccc : in Xcms_Ccc_Rec) return Xcms_Color_Rec;

    function Screen_White_Point_Of_Ccc
		(Ccc : in Xcms_Ccc_Rec) return Xcms_Color_Rec;

    function Function_Set_Of_Ccc (Ccc : in Xcms_Ccc_Rec) return X_Lib.X_Pointer;

    function Xcms_Add_Color_Space
		(P_Color_Space : in Xcms_Color_Space) return Xcms_Status;

    function Xcms_Add_Function_Set
		(Function_Set : in Xcms_Function_Set) return Xcms_Status;

    procedure Xcms_Alloc_Color (Dpy : in X_Lib.Display;
				Color_Map : in X_Lib.Colors.Color_Map;
				Color_In_Out : in out Xcms_Color_Rec;
				Result_Format : in Xcms_Color_Format;
				Return_Status : out Xcms_Status);

    procedure Xcms_Alloc_Named_Color (Dpy : in X_Lib.Display;
				      Color_Map : in X_Lib.Colors.Color_Map;
				      Color_String : in String;
				      Color_Screen_Return : out Xcms_Color_Rec;
				      Color_Exact_Return : out Xcms_Color_Rec;
				      Result_Format : in Xcms_Color_Format;
				      Return_Status : out Xcms_Status);

    function Xcms_Ccc_Of_Colormap
		(Dpy : in X_Lib.Display; Color_Map : in X_Lib.Colors.Color_Map)
		return Xcms_Ccc_Rec;


    -- Note: pass Compress_Flags_Return = Null if compression status is not useful
    procedure Xcms_Cie_Lab_Clip_Ab
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Index : in Cardinal;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    -- Note: pass Compress_Flags_Return = Null if compression status is not useful
    procedure Xcms_Cie_Lab_Clip_L
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Index : in Cardinal;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    -- Note: pass Compress_Flags_Return = Null if compression status is not useful
    procedure Xcms_Cie_Lab_Clip_Lab
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Index : in Cardinal;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Lab_Query_Max_C (Ccc : in Xcms_Ccc_Rec;
					Hue_Angle : in Xcms_Float;
					L_Star : in Xcms_Float;
					Color_Return : out Xcms_Color_Rec;
					Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Lab_Query_Max_L (Ccc : in Xcms_Ccc_Rec;
					Hue_Angle : in Xcms_Float;
					Chroma : in Xcms_Float;
					Color_Return : out Xcms_Color_Rec;
					Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Lab_Query_Max_Lc (Ccc : in Xcms_Ccc_Rec;
					 Hue_Angle : in Xcms_Float;
					 Color_Return : out Xcms_Color_Rec;
					 Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Lab_Query_Min_L (Ccc : in Xcms_Ccc_Rec;
					Hue_Angle : in Xcms_Float;
					Chroma : in Xcms_Float;
					Color_Return : out Xcms_Color_Rec;
					Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Lab_To_Cie_Xyz (Ccc : in Xcms_Ccc_Rec;
				       White_Point : in Xcms_Color_Rec;
				       Colors : in out Xcms_Color_Array;
				       Return_Status : out Xcms_Status);

    -- Note: pass Compress_Flags_Return = Null if compression status is not useful
    procedure Xcms_Cie_Lab_White_Shift_Colors
		 (Ccc : in Xcms_Ccc_Rec;
		  Initial_White_Point : in Xcms_Color_Rec;
		  Target_White_Point : in Xcms_Color_Rec;
		  Target_Format : in Xcms_Color_Format;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Luv_Clip_L
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Index : in Cardinal;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Luv_Clip_Luv
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Index : in Cardinal;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Luv_Clip_Uv
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Index : in Cardinal;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Luv_Query_Max_C (Ccc : in Xcms_Ccc_Rec;
					Hue_Angle : in Xcms_Float;
					L_Star : in Xcms_Float;
					Color_Return : out Xcms_Color_Rec;
					Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Luv_Query_Max_L (Ccc : in Xcms_Ccc_Rec;
					Hue_Angle : in Xcms_Float;
					Chroma : in Xcms_Float;
					Color_Return : out Xcms_Color_Rec;
					Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Luv_Query_Max_Lc (Ccc : in Xcms_Ccc_Rec;
					 Hue_Angle : in Xcms_Float;
					 Color_Return : out Xcms_Color_Rec;
					 Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Luv_Query_Min_L (Ccc : in Xcms_Ccc_Rec;
					Hue_Angle : in Xcms_Float;
					Chroma : in Xcms_Float;
					Color_Return : out Xcms_Color_Rec;
					Return_Status : out Xcms_Status);

    procedure Xcms_Cie_Luv_To_Cie_Uvy (Ccc : in Xcms_Ccc_Rec;
				       White_Point : in Xcms_Color_Rec;
				       Colors : in out Xcms_Color_Array;
				       Return_Status : out Xcms_Status);

    -- Note: pass Compress_Flags_Return = Null if compression status is not useful
    procedure Xcms_Cie_Luv_White_Shift_Colors
		 (Ccc : in Xcms_Ccc_Rec;
		  Initial_White_Point : in Xcms_Color_Rec;
		  Target_White_Point : in Xcms_Color_Rec;
		  Target_Format : in Xcms_Color_Format;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    function Xcms_Cie_Xyz_To_Cie_Lab
		(Ccc : in Xcms_Ccc_Rec;
		 White_Point : in Xcms_Color_Rec;
		 Colors : in Xcms_Color_Array) return Xcms_Status;

    function Xcms_Cie_Xyz_To_Cie_Uvy
		(Ccc : in Xcms_Ccc_Rec;
		 White_Point : in Xcms_Color_Rec;
		 Colors : in Xcms_Color_Array) return Xcms_Status;

    function Xcms_Cie_Xyz_To_Cie_Xyy
		(Ccc : in Xcms_Ccc_Rec;
		 White_Point : in Xcms_Color_Rec;
		 Colors : in Xcms_Color_Array) return Xcms_Status;

    procedure Xcms_Cie_Xyz_To_Rgbi
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors : in Xcms_Color_Array;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    function Xcms_Cie_Uvy_To_Cie_Luv
		(Ccc : in Xcms_Ccc_Rec;
		 White_Point : in Xcms_Color_Rec;
		 Colors : in Xcms_Color_Array) return Xcms_Status;

    function Xcms_Cie_Uvy_To_Cie_Xyz
		(Ccc : in Xcms_Ccc_Rec;
		 White_Point : in Xcms_Color_Rec;
		 Colors : in Xcms_Color_Array) return Xcms_Status;

    function Xcms_Cie_Uvy_To_Tek_Hvc
		(Ccc : in Xcms_Ccc_Rec;
		 White_Point : in Xcms_Color_Rec;
		 Colors : in Xcms_Color_Array) return Xcms_Status;

    function Xcms_Cie_Xyy_To_Cie_Xyz
		(Ccc : in Xcms_Ccc_Rec;
		 White_Point : in Xcms_Color_Rec;
		 Colors : in Xcms_Color_Array) return Xcms_Status;

    function Xcms_Client_White_Point_Of_Ccc
		(Ccc : in Xcms_Ccc_Rec) return Xcms_Color_Rec;

    -- Note: pass Compress_Flags_Return = Null if compression status is not useful
    procedure Xcms_Convert_Colors
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Target_Format : in Xcms_Color_Format;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    function Xcms_Create_Ccc (Dpy : in X_Lib.Display;
			      Screen_Number : in X_Lib.Screen_Number;
			      Visual : in X_Lib.Visual;
			      Client_White_Ptr : in Xcms_Color_Rec;
			      Gamut_Comp_Proc : in Xcms_Compression_Proc;
			      Gamut_Comp_Client_Data : in X_Lib.X_Pointer;
			      White_Pt_Adj_Proc : in Xcms_White_Adjust_Proc;
			      White_Pt_Adj_Client_Data : in X_Lib.X_Pointer)
			     return Xcms_Ccc_Rec;

    function Xcms_Default_Ccc
		(Dpy : in X_Lib.Display; Screen_Number : in X_Lib.Screen_Number)
		return Xcms_Ccc_Rec;

    function Xcms_Display_Of_Ccc (Ccc : in Xcms_Ccc_Rec) return X_Lib.Display;

    function Xcms_Format_Of_Prefix
		(Prefix : in String) return Xcms_Color_Format;

    procedure Xcms_Free_Ccc (Ccc : in Xcms_Ccc_Rec);

    procedure Xcms_Lookup_Color (Dpy : in X_Lib.Display;
				 Color_Map : in X_Lib.Colors.Color_Map;
				 Color_String : in String;
				 P_Color_Exact_In_Out : out Xcms_Color_Rec;
				 P_Color_Scrn_In_Out : out Xcms_Color_Rec;
				 Result_Format : in Xcms_Color_Format;
				 Return_Status : out Xcms_Status);

    function Xcms_Prefix_Of_Format (Id : in Xcms_Color_Format) return String;

    procedure Xcms_Query_Black (Ccc : in Xcms_Ccc_Rec;
				Target_Format : in Xcms_Color_Format;
				Color_Return : out Xcms_Color_Rec;
				Return_Status : out Xcms_Status);

    procedure Xcms_Query_Blue (Ccc : in Xcms_Ccc_Rec;
			       Target_Format : in Xcms_Color_Format;
			       Color_Return : out Xcms_Color_Rec;
			       Return_Status : out Xcms_Status);

    procedure Xcms_Query_Color (Dpy : in X_Lib.Display;
				Color_Map : in X_Lib.Colors.Color_Map;
				Color_In_Out : in out Xcms_Color_Rec;
				Result_Format : in Xcms_Color_Format;
				Return_Status : out Xcms_Status);

    procedure Xcms_Query_Colors (Dpy : in X_Lib.Display;
				 Color_Map : in X_Lib.Colors.Color_Map;
				 Colors_In_Out : in out Xcms_Color_Array;
				 Result_Format : in Xcms_Color_Format;
				 Return_Status : out Xcms_Status);

    procedure Xcms_Query_Green (Ccc : in Xcms_Ccc_Rec;
				Target_Format : in Xcms_Color_Format;
				Color_Return : out Xcms_Color_Rec;
				Return_Status : out Xcms_Status);

    procedure Xcms_Query_Red (Ccc : in Xcms_Ccc_Rec;
			      Target_Format : in Xcms_Color_Format;
			      Color_Return : out Xcms_Color_Rec;
			      Return_Status : out Xcms_Status);

    procedure Xcms_Query_White (Ccc : in Xcms_Ccc_Rec;
				Target_Format : in Xcms_Color_Format;
				Color_Return : out Xcms_Color_Rec;
				Return_Status : out Xcms_Status);

    procedure Xcms_Rgbi_To_Cie_Xyz
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors : out Xcms_Color_Array;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    procedure Xcms_Rgbi_To_Rgb
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors : out Xcms_Color_Array;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    procedure Xcms_Rgb_To_Rgbi
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors : out Xcms_Color_Array;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    function Xcms_Screen_Number_Of_Ccc
		(Ccc : in Xcms_Ccc_Rec) return X_Lib.Screen_Number;

    function Xcms_Screen_White_Point_Of_Ccc
		(Ccc : in Xcms_Ccc_Rec) return Xcms_Color_Rec;

    function Xcms_Set_Ccc_Of_Colormap
		(Dpy : in X_Lib.Display;
		 Color_Map : in X_Lib.Colors.Color_Map;
		 Ccc : in Xcms_Ccc_Rec) return Xcms_Ccc_Rec;

    function Xcms_Set_Compression_Proc
		(Ccc : in Xcms_Ccc_Rec;
		 Compression_Proc : in Xcms_Compression_Proc;
		 Client_Data : in X_Lib.X_Pointer) return Xcms_Compression_Proc;

    function Xcms_Set_White_Adjust_Proc
		(Ccc : in Xcms_Ccc_Rec;
		 White_Adjust_Proc : in Xcms_White_Adjust_Proc;
		 Client_Data : in X_Lib.X_Pointer)
		return Xcms_White_Adjust_Proc;

    function Xcms_Set_White_Point
		(Ccc : in Xcms_Ccc_Rec; Color : in Xcms_Color_Rec)
		return Xcms_Status;

    function Xcms_Store_Color (Dpy : in X_Lib.Display;
			       Color_Map : in X_Lib.Colors.Color_Map;
			       Color : in Xcms_Color_Rec) return Xcms_Status;

    -- Note: pass Compress_Flags_Return = Null if compression status is not useful
    procedure Xcms_Store_Colors
		 (Dpy : in X_Lib.Display;
		  Color_Map : in X_Lib.Colors.Color_Map;
		  Colors : in Xcms_Color_Array;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    procedure Xcms_Tek_Hvc_Clip_C
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Index : in Cardinal;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    procedure Xcms_Tek_Hvc_Clip_V
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Index : in Cardinal;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    procedure Xcms_Tek_Hvc_Clip_Vc
		 (Ccc : in Xcms_Ccc_Rec;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Index : in Cardinal;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    procedure Xcms_Tek_Hvc_Query_Max_C (Ccc : in Xcms_Ccc_Rec;
					Hue : in Xcms_Float;
					Value : in Xcms_Float;
					Color_Return : out Xcms_Color_Rec;
					Return_Status : out Xcms_Status);

    procedure Xcms_Tek_Hvc_Query_Max_V (Ccc : in Xcms_Ccc_Rec;
					Hue : in Xcms_Float;
					Chroma : in Xcms_Float;
					Color_Return : out Xcms_Color_Rec;
					Return_Status : out Xcms_Status);

    procedure Xcms_Tek_Hvc_Query_Max_Vc (Ccc : in Xcms_Ccc_Rec;
					 Hue : in Xcms_Float;
					 Color_Return : out Xcms_Color_Rec;
					 Return_Status : out Xcms_Status);

    -- note: N_Samples parameter determined from Colors_Return'LENGTH
    procedure Xcms_Tek_Hvc_Query_Max_V_Samples
		 (Ccc : in Xcms_Ccc_Rec;
		  Hue : in Xcms_Float;
		  Colors_Return : out Xcms_Color_Array;
		  Return_Status : out Xcms_Status);

    procedure Xcms_Tek_Hvc_Query_Min_V (Ccc : in Xcms_Ccc_Rec;
					Hue : in Xcms_Float;
					Chroma : in Xcms_Float;
					Color_Return : out Xcms_Color_Rec;
					Return_Status : out Xcms_Status);

    function Xcms_Tek_Hvc_To_Ci_Euvy
		(Ccc : in Xcms_Ccc_Rec;
		 White_Point : in Xcms_Color_Rec;
		 Colors : in Xcms_Color_Array) return Xcms_Status;

    procedure Xcms_Tek_Hvc_White_Shift_Colors
		 (Ccc : in Xcms_Ccc_Rec;
		  Initial_White_Point : in Xcms_Color_Rec;
		  Target_White_Point : in Xcms_Color_Rec;
		  Target_Format : in Xcms_Color_Format;
		  Colors_In_Out : in out Xcms_Color_Array;
		  Compression_Flags_Return : out X_Configuration_Dependent.Bool;
		  Return_Status : out Xcms_Status);

    function Xcms_Visual_Of_Ccc (Ccc : in Xcms_Ccc_Rec) return X_Lib.Visual;
end Xcms;
