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

with System, X_Lib, Unchecked_Conversion, X_Configuration_Dependent;
use X_Configuration_Dependent;

package X_Lib_Interface is
    -- ********************************************************************
    -- *                                                                  *
    -- *                      FONTS                                       *
    -- *                                                                  *
    -- ********************************************************************

    type X_Character_Record is
	record
	    Left_Bearing : Short;
	    Right_Bearing : Short;
	    Width : Short;
	    Ascent : Short;
	    Descent : Short;
	    Attributes : Short;
	end record;

    for X_Character_Record use
	record
	    Left_Bearing at 0 * Word_Size range 0 .. 15;
	    Right_Bearing at 0 * Word_Size range 16 .. 31;
	    Width at 1 * Word_Size range 0 .. 15;
	    Ascent at 1 * Word_Size range 16 .. 31;
	    Descent at 2 * Word_Size range 0 .. 15;
	    Attributes at 2 * Word_Size range 16 .. 31;
	end record;
    type X_Character_Array is array (Natural range <>) of X_Character_Record;
    type X_Character_List is access X_Character_Array;

    type X_Font_Record is
	record
	    Ext_Data : System.Address;
	    Font_Id : X_Lib.Fonts.Font;
	    Direction : Int;
	    First_Char : Int;
	    Last_Char : Int;
	    First_Row : Int;
	    Last_Row : Int;
	    All_Exist : Bool;
	    Default_Char : Int;
	    N_Properties : Int;
	    Properties : System.Address;
	    Min_Bounds : X_Character_Record;
	    Max_Bounds : X_Character_Record;
	    Per_Char : System.Address;
	    Ascent : Int;
	    Descent : Int;
	end record;
    for X_Font_Record use
	record
	    Ext_Data at 0 * Word_Size range 0 .. 31;
	    Font_Id at 1 * Word_Size range 0 .. 31;
	    Direction at 2 * Word_Size range 0 .. 31;
	    First_Char at 3 * Word_Size range 0 .. 31;
	    Last_Char at 4 * Word_Size range 0 .. 31;
	    First_Row at 5 * Word_Size range 0 .. 31;
	    Last_Row at 6 * Word_Size range 0 .. 31;
	    All_Exist at 7 * Word_Size range 0 .. 31;
	    Default_Char at 8 * Word_Size range 0 .. 31;
	    N_Properties at 9 * Word_Size range 0 .. 31;
	    Properties at 10 * Word_Size range 0 .. 31;
	    Min_Bounds at 11 * Word_Size range 0 .. 95;
	    Max_Bounds at 14 * Word_Size range 0 .. 95;
	    Per_Char at 17 * Word_Size range 0 .. 31;
	    Ascent at 18 * Word_Size range 0 .. 31;
	    Descent at 19 * Word_Size range 0 .. 31;
	end record;
    type X_Font_Record_Pointer is access X_Font_Record;

    type X_Font_Record_Array is array (Natural range <>) of X_Font_Record;
    type X_Font_Record_List is access X_Font_Record_Array;


    type X_Char_2B is
	record
	    Byte_1 : Char;
	    Byte_2 : Char;
	end record;

    for X_Char_2B use
	record
	    Byte_1 at 0 * Word_Size range 0 .. 7;
	    Byte_2 at 0 * Word_Size range 8 .. 15;
	end record;

    type X_String_16 is array (Natural range <>) of X_Char_2B;
    type X_String_Pointer_16 is access X_String_16;

    type X_Rm_Value is
	record
	    Size : Int;
	    Address : X_Lib.X_Address;
	end record;

    for X_Rm_Value use
	record
	    Size at 0 * Word_Size range 0 .. 31;
	    Address at 1 * Word_Size range 0 .. 31;
	end record;

    type X_Rm_Value_Ptr is access X_Rm_Value;

    function Xloadfont (Display_Id : in System.Address;
			Font_Name : in System.Address) return Unsigned_Long;

    function Xqueryfont (Display_Id : in System.Address;
			 Font_Id : in Unsigned_Long) return System.Address;

    function Xlistfontswithinfo
		(Display_Id : in System.Address;
		 Pattern : in System.Address;
		 Max_Names : in Int;
		 Count : in System.Address;
		 Font_Info : in System.Address) return System.Address;

    procedure Xfreefontinfo (Names : in System.Address;
			     Info : in System.Address;
			     Count : in Int);

    function Xloadqueryfont
		(Display_Id : in System.Address; Font_Name : in System.Address)
		return System.Address;

    procedure Xfreefont (Display_Id : in System.Address;
			 Font_Info : in System.Address);

    function Xgetfontproperty (Font_Info : in System.Address;
			       Property : in Unsigned_Long;
			       Value : in System.Address) return Int;

    procedure Xunloadfont (Display_Id : in System.Address;
			   Font_Id : in Unsigned_Long);

    function Xlistfonts (Display_Id : in System.Address;
			 Pattern : in System.Address;
			 Max_Names : in Int;
			 Count : in System.Address) return System.Address;

    procedure Xfreefontnames (List : in System.Address);

    procedure Xsetfontpath (Display_Id : in System.Address;
			    Directories : in System.Address;
			    N_Dirs : in Int);

    function Xgetfontpath (Display_Id : in System.Address;
			   List_Length : in System.Address)
			  return System.Address;

    procedure Xfreefontpath (List : in System.Address);

    function Xtextwidth (Font_Info : in System.Address;
			 Text : in System.Address;
			 Length : in Int) return Int;

    function Xtextwidth16 (Font_Info : in System.Address;
			   Text : in System.Address;
			   Length : in Int) return Int;

    procedure Xtextextents (Font_Info : in System.Address;
			    Text : in System.Address;
			    N_Chars : in Int;
			    Direction : in System.Address;
			    Ascent : in System.Address;
			    Descent : in System.Address;
			    Overall : in System.Address);

    procedure Xtextextents16 (Font_Info : in System.Address;
			      Text : in System.Address;
			      N_Chars : in Int;
			      Direction : in System.Address;
			      Ascent : in System.Address;
			      Descent : in System.Address;
			      Overall : in System.Address);

    procedure Xquerytextextents (Display_Id : in System.Address;
				 Font_Id : in Unsigned_Long;
				 Text : in System.Address;
				 N_Chars : in Int;
				 Direction : in System.Address;
				 Ascent : in System.Address;
				 Descent : in System.Address;
				 Overall : in System.Address);

    procedure Xquerytextextents16 (Display_Id : in System.Address;
				   Font_Id : in Unsigned_Long;
				   Text : in System.Address;
				   N_Chars : in Int;
				   Direction : in System.Address;
				   Ascent : in System.Address;
				   Descent : in System.Address;
				   Overall : in System.Address);

    pragma Import (C, Xloadfont, "XLoadFont");

    pragma Import (C, Xqueryfont, "XQueryFont");

    pragma Import (C, Xlistfontswithinfo, "XListFontsWithInfo");

    pragma Import (C, Xfreefontinfo, "XFreeFontInfo");

    pragma Import (C, Xloadqueryfont, "XLoadQueryFont");

    pragma Import (C, Xfreefont, "XFreeFont");

    pragma Import (C, Xgetfontproperty, "XGetFontProperty");

    pragma Import (C, Xunloadfont, "XUnloadFont");

    pragma Import (C, Xlistfonts, "XListFonts");

    pragma Import (C, Xfreefontnames, "XFreeFontNames");

    pragma Import (C, Xsetfontpath, "XSetFontPath");

    pragma Import (C, Xgetfontpath, "XGetFontPath");

    pragma Import (C, Xfreefontpath, "XFreeFontPath");

    pragma Import (C, Xtextwidth, "XTextWidth");

    pragma Import (C, Xtextwidth16, "XTextWidth16");

    pragma Import (C, Xtextextents, "XTextExtents");

    pragma Import (C, Xtextextents16, "XTextExtents16");

    pragma Import (C, Xquerytextextents, "XQueryTextExtents");

    pragma Import (C, Xquerytextextents16, "XQueryTextExtents16");

    -- ********************************************************************
    -- *                                                                  *
    -- *                      COLORS                                      *
    -- *                                                                  *
    -- ********************************************************************

    type X_Color_Record is
	record
	    Value : Unsigned_Long;
	    Red : Unsigned_Short;
	    Green : Unsigned_Short;
	    Blue : Unsigned_Short;
	    Flags : Char;
	    Pad : Char;
	end record;

    for X_Color_Record use
	record
	    Value at 0 * Word_Size range 0 .. 31;
	    Red at 1 * Word_Size range 0 .. 15;
	    Green at 1 * Word_Size range 16 .. 31;
	    Blue at 2 * Word_Size range 0 .. 15;
	    Flags at 2 * Word_Size range 16 .. 23;
	    Pad at 2 * Word_Size range 24 .. 31;
	end record;

    type X_Color_Array is array (Natural range <>) of X_Color_Record;


    function Xcreatecolormap (Display_Id : in System.Address;
			      Window_Id : in Unsigned_Long;
			      Visual_Id : in System.Address;
			      Allocate : in Int) return Unsigned_Long;

    function Xcopycolormapandfree
		(Display_Id : in System.Address; Map_Id : in Unsigned_Long)
		return Unsigned_Long;

    procedure Xfreecolormap (Display_Id : in System.Address;
			     Map_Id : in Unsigned_Long);

    procedure Xsetwindowcolormap (Display_Id : in System.Address;
				  Window_Id : in Unsigned_Long;
				  Map_Id : in Unsigned_Long);

    function Xalloccolor (Display_Id : in System.Address;
			  Map_Id : in Unsigned_Long;
			  Definition : in System.Address) return Int;

    function Xallocnamedcolor (Display_Id : in System.Address;
			       Map_Id : in Unsigned_Long;
			       Color_Name : in System.Address;
			       Screen_Def : in System.Address;
			       Exact_Def : in System.Address) return Int;

    function Xlookupcolor (Display_Id : in System.Address;
			   Map_Id : in Unsigned_Long;
			   Color_Name : in System.Address;
			   Screen_Def : in System.Address;
			   Exact_Def : in System.Address) return Int;

    procedure Xstorecolors (Display_Id : in System.Address;
			    Map_Id : in Unsigned_Long;
			    Colors : in System.Address;
			    Num_Colors : in Int);

    procedure Xstorecolor (Display_Id : in System.Address;
			   Map_Id : in Unsigned_Long;
			   Screen_Def : in System.Address);

    function Xalloccolorcells (Display_Id : in System.Address;
			       Map_Id : in Unsigned_Long;
			       Contiguous : in Int;
			       Planes : in System.Address;
			       Num_Planes : in Unsigned_Int;
			       Pixel_Values : in System.Address;
			       Num_Colors : in Unsigned_Int) return Int;

    function Xalloccolorplanes (Display_Id : in System.Address;
				Map_Id : in Unsigned_Long;
				Contiguous : in Int;
				Pixel_Values : in System.Address;
				Num_Colors : in Int;
				No_Of_Reds : in Int;
				No_Of_Greens : in Int;
				No_Of_Blues : in Int;
				Red_Mask : in System.Address;
				Green_Mask : in System.Address;
				Blue_Mask : in System.Address) return Int;

    procedure Xstorenamedcolor (Display_Id : in System.Address;
				Map_Id : in Unsigned_Long;
				Color_Name : in System.Address;
				Map_Entry : in Unsigned_Long;
				Flags : in Int);

    procedure Xfreecolors (Display_Id : in System.Address;
			   Map_Id : in Unsigned_Long;
			   Colors_To_Free : in System.Address;
			   Num_Colors : in Int;
			   Planes : in Unsigned_Long);

    procedure Xquerycolor (Display_Id : in System.Address;
			   Map_Id : in Unsigned_Long;
			   The_Color : in System.Address);

    procedure Xquerycolors (Display_Id : in System.Address;
			    Map_Id : in Unsigned_Long;
			    The_Colors : in System.Address;
			    Num_Colors : in Int);

    function Xcreatepixmap (Display_Id : in System.Address;
			    D : in Unsigned_Long;
			    Width : in Unsigned_Int;
			    Height : in Unsigned_Int;
			    Depth : in Unsigned_Int) return Unsigned_Long;

    procedure Xfreepixmap (Display_Id : in System.Address;
			   Pixmap_Id : in Unsigned_Long);

    procedure Xinstallcolormap (Display_Id : in System.Address;
				Map_Id : in Unsigned_Long);

    procedure Xuninstallcolormap
		 (Display_Id : in System.Address; Map_Id : in Unsigned_Long);

    function Xlistinstalledcolormaps
		(Display_Id : in System.Address;
		 Window_Id : in Unsigned_Long;
		 Num_Maps : in System.Address) return System.Address;

    function Xparsecolor (Display_Id : in System.Address;
			  Map_Id : in Unsigned_Long;
			  Color_Name : in System.Address;
			  Screen_Def : in System.Address) return Int;

    pragma Import (C, Xcreatecolormap, "XCreateColormap");

    pragma Import (C, Xcopycolormapandfree, "XCopyColormapAndFree");

    pragma Import (C, Xfreecolormap, "XFreeColormap");

    pragma Import (C, Xsetwindowcolormap, "XSetWindowColormap");

    pragma Import (C, Xalloccolor, "XAllocColor");

    pragma Import (C, Xallocnamedcolor, "XAllocNamedColor");

    pragma Import (C, Xlookupcolor, "XLookupColor");

    pragma Import (C, Xstorecolors, "XStoreColors");

    pragma Import (C, Xstorecolor, "XStoreColor");

    pragma Import (C, Xalloccolorcells, "XAllocColorCells");

    pragma Import (C, Xalloccolorplanes, "XAllocColorPlanes");

    pragma Import (C, Xstorenamedcolor, "XStoreNamedColor");

    pragma Import (C, Xfreecolors, "XFreeColors");

    pragma Import (C, Xquerycolor, "XQueryColor");

    pragma Import (C, Xquerycolors, "XQueryColors");

    pragma Import (C, Xcreatepixmap, "XCreatePixmap");

    pragma Import (C, Xfreepixmap, "XFreePixmap");

    pragma Import (C, Xinstallcolormap, "XInstallColormap");

    pragma Import (C, Xuninstallcolormap, "XUninstallColormap");

    pragma Import (C, Xlistinstalledcolormaps, "XListInstalledColormaps");

    pragma Import (C, Xparsecolor, "XParseColor");

    -- ********************************************************************
    -- *                                                                  *
    -- *                      GRAPHIC OUTPUT                              *
    -- *                                                                  *
    -- ********************************************************************

    type X_Gc_Value_Record is
	record
	    Logical_Operation : Int;
	    Plane : Unsigned_Long;
	    Foreground : Unsigned_Long;
	    Background : Unsigned_Long;
	    Line_Width : Int;
	    Line_Style : Int;
	    Cap_Style : Int;
	    Join_Style : Int;
	    Fill_Style : Int;
	    Fill_Rule : Int;
	    Arc_Mode : Int;
	    Tile : Unsigned_Long;
	    Stipple : Unsigned_Long;
	    Ts_X_Origin : Int;
	    Ts_Y_Origin : Int;
	    Font_Id : X_Lib.Fonts.Font;
	    Subwindow_Mode : Int;
	    Graphics_Exposures : Bool;
	    Clip_X_Origin : Int;
	    Clip_Y_Origin : Int;
	    Clip_Mask : Unsigned_Long;
	    Dash_Offset : Int;
	    Dashes : Char;
	end record;

    for X_Gc_Value_Record use
	record
	    Logical_Operation at 0 * Word_Size range 0 .. 31;
	    Plane at 1 * Word_Size range 0 .. 31;
	    Foreground at 2 * Word_Size range 0 .. 31;
	    Background at 3 * Word_Size range 0 .. 31;
	    Line_Width at 4 * Word_Size range 0 .. 31;
	    Line_Style at 5 * Word_Size range 0 .. 31;
	    Cap_Style at 6 * Word_Size range 0 .. 31;
	    Join_Style at 7 * Word_Size range 0 .. 31;
	    Fill_Style at 8 * Word_Size range 0 .. 31;
	    Fill_Rule at 9 * Word_Size range 0 .. 31;
	    Arc_Mode at 10 * Word_Size range 0 .. 31;
	    Tile at 11 * Word_Size range 0 .. 31;
	    Stipple at 12 * Word_Size range 0 .. 31;
	    Ts_X_Origin at 13 * Word_Size range 0 .. 31;
	    Ts_Y_Origin at 14 * Word_Size range 0 .. 31;
	    Font_Id at 15 * Word_Size range 0 .. 31;
	    Subwindow_Mode at 16 * Word_Size range 0 .. 31;
	    Graphics_Exposures at 17 * Word_Size range 0 .. 31;
	    Clip_X_Origin at 18 * Word_Size range 0 .. 31;
	    Clip_Y_Origin at 19 * Word_Size range 0 .. 31;
	    Clip_Mask at 20 * Word_Size range 0 .. 31;
	    Dash_Offset at 21 * Word_Size range 0 .. 31;
	    Dashes at 22 * Word_Size range 0 .. 7;
	end record;

    function Xcreategc (Display_Id : in System.Address;
			D : in Unsigned_Long;
			Valuemask_Create : in Unsigned_Long;
			Values : in System.Address) return System.Address;

    procedure Xcopygc (Display_Id : in System.Address;
		       Source : in System.Address;
		       Value_Mask : in Unsigned_Long;
		       Destination : in System.Address);

    procedure Xchangegc (Display_Id : in System.Address;
			 Gc : in System.Address;
			 Value_Mask : in Unsigned_Long;
			 Values : in System.Address);

    procedure Xfreegc (Display_Id : in System.Address; Gc : in System.Address);

    procedure Xsetstate (Display_Id : System.Address;
			 Gc : in System.Address;
			 Foreground : in Unsigned_Long;
			 Background : in Unsigned_Long;
			 Gx_Function : in Int;
			 Plane : in Unsigned_Long);

    procedure Xsetfunction (Display_Id : in System.Address;
			    Gc : in System.Address;
			    Gx_Function : in Int);

    procedure Xsetplanemask (Display_Id : in System.Address;
			     Gc : in System.Address;
			     Plane : in Unsigned_Long);

    procedure Xsetforeground (Display_Id : in System.Address;
			      Gc : in System.Address;
			      Foreground : in Unsigned_Long);

    procedure Xsetbackground (Display_Id : in System.Address;
			      Gc : in System.Address;
			      Background : in Unsigned_Long);

    procedure Xsetlineattributes (Display_Id : in System.Address;
				  Gc : in System.Address;
				  Line_Width : in Unsigned_Int;
				  Line : in Int;
				  Cap : in Int;
				  Join : in Int);

    procedure Xsetdashes (Display_Id : in System.Address;
			  Gc : in System.Address;
			  Dash_Offset : in Int;
			  Dash_List : in System.Address;
			  Num_List : in Int);

    procedure Xsetfillstyle (Display_Id : in System.Address;
			     Gc : in System.Address;
			     Fill : in Int);

    procedure Xsetfillrule (Display_Id : in System.Address;
			    Gc : in System.Address;
			    Rule : in Int);

    function Xquerybestsize (Display_Id : in System.Address;
			     Class : in Int;
			     D : in Unsigned_Long;
			     Width : in Unsigned_Int;
			     Height : in Unsigned_Int;
			     Rwidth : in System.Address;
			     Rheight : in System.Address) return Int;

    function Xmaxrequestsize (Display_Id : in System.Address) return Long;

    function Xquerybesttile (Display_Id : in System.Address;
			     D : in Unsigned_Long;
			     Width : in Unsigned_Int;
			     Height : in Unsigned_Int;
			     Rwidth : in System.Address;
			     Rheight : in System.Address) return Int;

    function Xquerybeststipple (Display_Id : in System.Address;
				D : in Unsigned_Long;
				Width : in Unsigned_Int;
				Height : in Unsigned_Int;
				Rwidth : in System.Address;
				Rheight : in System.Address) return Int;

    procedure Xsettile (Display_Id : in System.Address;
			Gc : in System.Address;
			Tile : in Unsigned_Long);

    procedure Xsetstipple (Display_Id : in System.Address;
			   Gc : in System.Address;
			   Stipple : in Unsigned_Long);

    procedure Xsettsorigin (Display_Id : in System.Address;
			    Gc : in System.Address;
			    X_Origin : in Int;
			    Y_Origin : in Int);

    procedure Xsetfont (Display_Id : in System.Address;
			Gc : in System.Address;
			Font_Id : in Unsigned_Long);

    procedure Xsetcliporigin (Display_Id : in System.Address;
			      Gc : in System.Address;
			      X_Origin : in Int;
			      Y_Origin : in Int);

    procedure Xsetclipmask (Display_Id : in System.Address;
			    Gc : in System.Address;
			    Pixmap_Id : in Unsigned_Long);

    procedure Xsetcliprectangles (Display_Id : in System.Address;
				  Gc : in System.Address;
				  X_Origin : in Int;
				  Y_Origin : in Int;
				  Rectangles : in System.Address;
				  Num_Recs : in Int;
				  Ordering : in Int);

    procedure Xsetarcmode (Display_Id : in System.Address;
			   Gc : in System.Address;
			   Mode : in Int);

    procedure Xsetsubwindowmode (Display_Id : in System.Address;
				 Gc : in System.Address;
				 Mode : in Int);

    procedure Xsetgraphicsexposures (Display_Id : in System.Address;
				     Gc : in System.Address;
				     Graphics_Exposures : in Int);

    procedure Xcleararea (Display_Id : in System.Address;
			  Window_Id : in Unsigned_Long;
			  Bounds_X : in Int;
			  Bounds_Y : in Int;
			  Bounds_W : in Unsigned_Int;
			  Bounds_H : in Unsigned_Int;
			  Exposures : in Int);

    procedure Xclearwindow (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long);

    procedure Xcopyarea (Display_Id : in System.Address;
			 Source : in Unsigned_Long;
			 Destination : in Unsigned_Long;
			 Gc : in System.Address;
			 Source_X : in Int;
			 Source_Y : in Int;
			 Width : in Unsigned_Int;
			 Height : in Unsigned_Int;
			 Dest_X : in Int;
			 Dest_Y : in Int);

    procedure Xcopyplane (Display_Id : in System.Address;
			  Source : in Unsigned_Long;
			  Destination : in Unsigned_Long;
			  Gc : in System.Address;
			  Source_X : in Int;
			  Source_Y : in Int;
			  Width : in Unsigned_Int;
			  Height : in Unsigned_Int;
			  Dest_X : in Int;
			  Dest_Y : in Int;
			  Plane : in Unsigned_Long);

    procedure Xdrawpoint (Display_Id : in System.Address;
			  D : in Unsigned_Long;
			  Gc : in System.Address;
			  X : in Int;
			  Y : in Int);

    procedure Xdrawpoints (Display_Id : in System.Address;
			   D : in Unsigned_Long;
			   Gc : in System.Address;
			   Points : in System.Address;
			   Num_Points : in Int;
			   Mode : in Int);

    procedure Xdrawline (Display_Id : in System.Address;
			 D : in Unsigned_Long;
			 Gc : in System.Address;
			 X_1 : in Int;
			 Y_1 : in Int;
			 X_2 : in Int;
			 Y_2 : in Int);


    procedure Xdrawlines (Display_Id : in System.Address;
			  D : in Unsigned_Long;
			  Gc : in System.Address;
			  Points : in System.Address;
			  Num_Points : in Int;
			  Mode : in Int);

    procedure Xdrawsegments (Display_Id : in System.Address;
			     D : in Unsigned_Long;
			     Gc : in System.Address;
			     Segments : in System.Address;
			     Num_Segs : in Int);

    procedure Xdrawrectangle (Display_Id : in System.Address;
			      D : in Unsigned_Long;
			      Gc : in System.Address;
			      X : in Int;
			      Y : in Int;
			      Width : in Unsigned_Int;
			      Height : in Unsigned_Int);

    procedure Xdrawrectangles (Display_Id : in System.Address;
			       D : in Unsigned_Long;
			       Gc : in System.Address;
			       Rectangles : in System.Address;
			       Num_Recs : in Int);

    procedure Xdrawarc (Display_Id : in System.Address;
			D : in Unsigned_Long;
			Gc : in System.Address;
			Bounds_X : in Int;
			Bounds_Y : in Int;
			Bounds_W : in Unsigned_Int;
			Bounds_H : in Unsigned_Int;
			Angle_1 : in Int;
			Angle_2 : in Int);

    procedure Xdrawarcs (Display_Id : in System.Address;
			 D : in Unsigned_Long;
			 Gc : in System.Address;
			 Arcs : in System.Address;
			 Narcs : in Int);

    procedure Xfillrectangle (Display_Id : in System.Address;
			      D : in Unsigned_Long;
			      Gc : in System.Address;
			      Bounds_X : in Int;
			      Bounds_Y : in Int;
			      Bounds_W : in Unsigned_Int;
			      Bounds_H : in Unsigned_Int);

    procedure Xfillrectangles (Display_Id : in System.Address;
			       D : in Unsigned_Long;
			       Gc : in System.Address;
			       Rectangles : in System.Address;
			       Num_Recs : in Int);

    procedure Xfillpolygon (Display_Id : in System.Address;
			    D : in Unsigned_Long;
			    Gc : in System.Address;
			    Points : in System.Address;
			    Npoints : in Int;
			    Shape : in Int;
			    Mode : in Int);

    procedure Xfillarc (Display_Id : in System.Address;
			D : in Unsigned_Long;
			Gc : in System.Address;
			Bounds_X : in Int;
			Bounds_Y : in Int;
			Bounds_W : in Unsigned_Int;
			Bounds_H : in Unsigned_Int;
			Angle_1 : in Int;
			Angle_2 : in Int);

    procedure Xfillarcs (Display_Id : in System.Address;
			 D : in Unsigned_Long;
			 Gc : in System.Address;
			 Arcs : in System.Address;
			 Narcs : in Int);

    procedure Xdrawtext (Display_Id : in System.Address;
			 D : in Unsigned_Long;
			 Gc : in System.Address;
			 Baseline_X : in Int;
			 Baseline_Y : in Int;
			 Text_Items : in System.Address;
			 Num_Items : in Int);

    procedure Xdrawtext16 (Display_Id : in System.Address;
			   D : in Unsigned_Long;
			   Gc : in System.Address;
			   Baseline_X : in Int;
			   Baseline_Y : in Int;
			   Text_Items : in System.Address;
			   Num_Items : in Int);

    procedure Xdrawstring (Display_Id : in System.Address;
			   D : in Unsigned_Long;
			   Gc : in System.Address;
			   Baseline_X : in Int;
			   Baseline_Y : in Int;
			   Text : in System.Address;
			   Ntext : in Int);

    procedure Xdrawstring16 (Display_Id : in System.Address;
			     D : in Unsigned_Long;
			     Gc : in System.Address;
			     Baseline_X : in Int;
			     Baseline_Y : in Int;
			     Text : in System.Address;
			     Ntext : in Int);

    procedure Xdrawimagestring (Display_Id : in System.Address;
				D : in Unsigned_Long;
				Gc : in System.Address;
				Baseline_X : in Int;
				Baseline_Y : in Int;
				Text : in System.Address;
				Ntext : in Int);

    procedure Xdrawimagestring16 (Display_Id : in System.Address;
				  D : in Unsigned_Long;
				  Gc : in System.Address;
				  Baseline_X : in Int;
				  Baseline_Y : in Int;
				  Text : in System.Address;
				  Ntext : in Int);

    procedure Xputimage (Display_Id : in System.Address;
			 D : in Unsigned_Long;
			 Gc : in System.Address;
			 X_Image : in System.Address;
			 Src_X : in Int;
			 Src_Y : in Int;
			 Dest_X : in Int;
			 Dest_Y : in Int;
			 Dest_W : in Unsigned_Int;
			 Dest_H : in Unsigned_Int);

    function Xgetimage (Display_Id : in System.Address;
			D : in Unsigned_Long;
			Source_X : in Int;
			Source_Y : in Int;
			Source_W : in Unsigned_Int;
			Source_H : in Unsigned_Int;
			Planes : in Unsigned_Long;
			Format : in Int) return System.Address;

    function Xgetsubimage (Display_Id : in System.Address;
			   Drawable_Id : in Unsigned_Long;
			   Source_X : in Int;
			   Source_Y : in Int;
			   Source_Width : in Unsigned_Int;
			   Source_Height : in Unsigned_Int;
			   Planes : in Unsigned_Long;
			   Format : in Int;
			   Destination : in System.Address;
			   Dest_X : in Int;
			   Dest_Y : in Int) return System.Address;

    function Xcreateimage (Display_Id : in System.Address;
			   Visual_Id : in System.Address;
			   Depth : in Unsigned_Int;
			   Format : in Int;
			   Offset : in Int;
			   Data : in System.Address;
			   Width : in Unsigned_Int;
			   Height : in Unsigned_Int;
			   Bitmap_Pad : in Int;
			   Bytes_Per_Line : in Int) return System.Address;

    function Xgetpixel (X_Image : in System.Address; X : in Int; Y : in Int)
		       return Unsigned_Long;

    function Xputpixel (X_Image : in System.Address;
			X : in Int;
			Y : in Int;
			Pixel : in Unsigned_Long) return Int;

    function Xsubimage (X_Image : in System.Address;
			Bounds_X : in Int;
			Bounds_Y : in Int;
			Bounds_W : in Unsigned_Int;
			Bounds_H : in Unsigned_Int) return System.Address;

    function Xaddpixel (X_Image : in System.Address; Value : in Unsigned_Long)
		       return Int;

    function Xdestroyimage (X_Image : in System.Address) return Int;

    function Xreadbitmapfile (Display_Id : in System.Address;
			      D : in Unsigned_Long;
			      Filename : in System.Address;
			      Width : in System.Address;
			      Height : in System.Address;
			      Bitmap : in System.Address;
			      Hot_Spot_X : in System.Address;
			      Hot_Spot_Y : in System.Address) return Int;

    function Xwritebitmapfile (Display_Id : in System.Address;
			       Filename : in System.Address;
			       Bitmap : in Unsigned_Long;
			       Width : in Unsigned_Int;
			       Height : in Unsigned_Int;
			       Hot_Spot_X : in Int;
			       Hot_Spot_Y : in Int) return Int;

    function Xcreatebitmapfromdata
		(Display_Id : in System.Address;
		 D : in Unsigned_Long;
		 Data : in System.Address;
		 Width : in Unsigned_Int;
		 Height : in Unsigned_Int) return Unsigned_Long;

    function Xcreatepixmapfrombitmapdata
		(Display_Id : in System.Address;
		 Drawable_Id : in Unsigned_Long;
		 Data : in System.Address;
		 Width : in Unsigned_Int;
		 Height : in Unsigned_Int;
		 Foreground : in Unsigned_Long;
		 Background : in Unsigned_Long;
		 Depth : in Unsigned_Int) return Unsigned_Long;

    function Xgcontextfromgc (Gc : in System.Address) return Unsigned_Long;

    pragma Import (C, Xcreategc, "XCreateGC");

    pragma Import (C, Xcopygc, "XCopyGC");

    pragma Import (C, Xchangegc, "XChangeGC");

    pragma Import (C, Xfreegc, "XFreeGC");

    pragma Import (C, Xsetstate, "XSetState");

    pragma Import (C, Xsetfunction, "XSetFunction");

    pragma Import (C, Xsetplanemask, "XSetPlaneMask");

    pragma Import (C, Xsetforeground, "XSetForeground");

    pragma Import (C, Xsetbackground, "XSetBackground");

    pragma Import (C, Xsetlineattributes, "XSetLineAttributes");

    pragma Import (C, Xsetdashes, "XSetDashes");

    pragma Import (C, Xsetfillstyle, "XSetFillStyle");

    pragma Import (C, Xsetfillrule, "XSetFillRule");

    pragma Import (C, Xquerybestsize, "XQueryBestSize");

    -- R3
    pragma Import (C, Xmaxrequestsize, "XMaxRequestSize");
    --

    pragma Import (C, Xquerybesttile, "XQueryBestTile");

    pragma Import (C, Xquerybeststipple, "XQueryBestStipple");

    pragma Import (C, Xsettile, "XSetTile");

    pragma Import (C, Xsetstipple, "XSetStipple");

    pragma Import (C, Xsettsorigin, "XSetTSOrigin");

    pragma Import (C, Xsetfont, "XSetFont");

    pragma Import (C, Xsetcliporigin, "XSetClipOrigin");

    pragma Import (C, Xsetclipmask, "XSetClipMask");

    pragma Import (C, Xsetcliprectangles, "XSetClipRectangles");

    pragma Import (C, Xsetarcmode, "XSetArcMode");

    pragma Import (C, Xsetsubwindowmode, "XSetSubwindowMode");

    pragma Import (C, Xsetgraphicsexposures, "XSetGraphicsExposures");

    pragma Import (C, Xcleararea, "XClearArea");

    pragma Import (C, Xclearwindow, "XClearWindow");

    pragma Import (C, Xcopyarea, "XCopyArea");

    pragma Import (C, Xcopyplane, "XCopyPlane");

    pragma Import (C, Xdrawpoint, "XDrawPoint");

    pragma Import (C, Xdrawpoints, "XDrawPoints");

    pragma Import (C, Xdrawline, "XDrawLine");

    pragma Import (C, Xdrawlines, "XDrawLines");

    pragma Import (C, Xdrawsegments, "XDrawSegments");

    pragma Import (C, Xdrawrectangle, "XDrawRectangle");

    pragma Import (C, Xdrawrectangles, "XDrawRectangles");

    pragma Import (C, Xdrawarc, "XDrawArc");

    pragma Import (C, Xdrawarcs, "XDrawArcs");

    pragma Import (C, Xfillrectangle, "XFillRectangle");

    pragma Import (C, Xfillrectangles, "XFillRectangles");

    pragma Import (C, Xfillpolygon, "XFillPolygon");

    pragma Import (C, Xfillarc, "XFillArc");

    pragma Import (C, Xfillarcs, "XFillArcs");

    pragma Import (C, Xdrawtext, "XDrawText");

    pragma Import (C, Xdrawtext16, "XDrawText16");

    pragma Import (C, Xdrawstring, "XDrawString");

    pragma Import (C, Xdrawstring16, "XDrawString16");

    pragma Import (C, Xdrawimagestring, "XDrawImageString");

    pragma Import (C, Xdrawimagestring16, "XDrawImageString16");

    pragma Import (C, Xputimage, "XPutImage");

    pragma Import (C, Xgetimage, "XGetImage");

    pragma Import (C, Xgetsubimage, "XGetSubImage");

    pragma Import (C, Xcreateimage, "XCreateImage");

    pragma Import (C, Xgetpixel, "XGetPixel");

    pragma Import (C, Xputpixel, "XPutPixel");

    pragma Import (C, Xsubimage, "XSubImage");

    pragma Import (C, Xaddpixel, "XAddPixel");

    pragma Import (C, Xdestroyimage, "XDestroyImage");

    pragma Import (C, Xreadbitmapfile, "XReadBitmapFile");

    pragma Import (C, Xwritebitmapfile, "XWriteBitmapFile");

    pragma Import (C, Xcreatebitmapfromdata, "XCreateBitmapFromData");

    pragma Import (C, Xcreatepixmapfrombitmapdata,
		   "XCreatePixmapFromBitmapData");

    pragma Import (C, Xgcontextfromgc, "XGContextFromGC");

    -- ********************************************************************
    -- *                                                                  *
    -- *                      CURSORS                                     *
    -- *                                                                  *
    -- ********************************************************************

    function Xcreatefontcursor
		(Display_Id : in System.Address; Shape : in Unsigned_Int)
		return Unsigned_Long;

    function Xcreatepixmapcursor
		(Display_Id : in System.Address;
		 Source : in Unsigned_Long;
		 Mask : in Unsigned_Long;
		 Foreground : in System.Address;
		 Background : in System.Address;
		 Hot_Spot_X : in Unsigned_Int;
		 Hot_Spot_Y : in Unsigned_Int) return Unsigned_Long;

    function Xcreateglyphcursor
		(Display_Id : in System.Address;
		 Font_Glyph : in Unsigned_Long;
		 Font_Mask : in Unsigned_Long;
		 Shape : in Unsigned_Int;
		 Mask : in Unsigned_Int;
		 Foreground : in System.Address;
		 Background : in System.Address) return Unsigned_Long;

    procedure Xrecolorcursor (Display_Id : in System.Address;
			      Cursor_Id : in Unsigned_Long;
			      Foreground : in System.Address;
			      Background : in System.Address);

    procedure Xfreecursor (Display_Id : in System.Address;
			   Cursor_Id : in Unsigned_Long);

    function Xquerybestcursor (Display_Id : in System.Address;
			       D : in Unsigned_Long;
			       Width : in Unsigned_Int;
			       Height : in Unsigned_Int;
			       Closest_Width : in System.Address;
			       Closest_Height : in System.Address) return Int;

    procedure Xdefinecursor (Display_Id : in System.Address;
			     Window_Id : in Unsigned_Long;
			     Cursor_Id : in Unsigned_Long);

    procedure Xundefinecursor (Display_Id : in System.Address;
			       Window_Id : in Unsigned_Long);

    pragma Import (C, Xcreatefontcursor, "XCreateFontCursor");

    pragma Import (C, Xcreatepixmapcursor, "XCreatePixmapCursor");

    pragma Import (C, Xcreateglyphcursor, "XCreateGlyphCursor");

    pragma Import (C, Xrecolorcursor, "XRecolorCursor");

    pragma Import (C, Xfreecursor, "XFreeCursor");

    pragma Import (C, Xquerybestcursor, "XQueryBestCursor");

    pragma Import (C, Xdefinecursor, "XDefineCursor");

    pragma Import (C, Xundefinecursor, "XUndefineCursor");

    -- ********************************************************************
    -- *                                                                  *
    -- *                      DISPLAY ACTIONS                             *
    -- *                                                                  *
    -- ********************************************************************

    function Xopendisplay (Name : in System.Address) return System.Address;

    procedure Xnoop (Display_Id : in System.Address);

    procedure Xclosedisplay (Display_Id : in System.Address);

    pragma Import (C, Xopendisplay, "XOpenDisplay");

    pragma Import (C, Xnoop, "XNoOp");

    pragma Import (C, Xclosedisplay, "XCloseDisplay");

    -- ********************************************************************
    -- *                                                                  *
    -- *                      WINDOW ACTIONS                              *
    -- *                                                                  *
    -- ********************************************************************
    --

    type X_Visual_Info_Record is
	record
	    Visual_Record : System.Address;
	    Visual_Id : Long;
	    Screen_No : Int;
	    Depth : Int;
	    Class : Int;
	    Red_Mask : Long;
	    Green_Mask : Long;
	    Blue_Mask : Long;
	    Colormap_Size : Int;
	    Bits_Per_Rgb : Int;
	end record;
    type X_Visual_Info_Array is
       array (Natural range <>) of X_Visual_Info_Record;
    type X_Visual_Info_List is access X_Visual_Info_Array;

    type X_Set_Window_Attributes_Record is
	record
	    Background_Pixmap : Long;
	    Background_Pixel : Unsigned_Long;
	    Border_Pixmap : Long;
	    Border_Pixel : Unsigned_Long;
	    Bit_Gravity : Int;
	    Window_Gravity : Int;
	    Backing_Store : Int;
	    Backing_Planes : Unsigned_Long;
	    Backing_Pixel : Unsigned_Long;
	    Save_Under : Bool;
	    Event_Mask : Long;
	    Do_Not_Propagate : Long;
	    Override_Redirect : Bool;
	    Current_Color_Map : X_Lib.Colors.Color_Map;
	    Current_Cursor : X_Lib.Cursors.Cursor;
	end record;

    for X_Set_Window_Attributes_Record use
	record
	    Background_Pixmap at 0 * Word_Size range 0 .. 31;
	    Background_Pixel at 1 * Word_Size range 0 .. 31;
	    Border_Pixmap at 2 * Word_Size range 0 .. 31;
	    Border_Pixel at 3 * Word_Size range 0 .. 31;
	    Bit_Gravity at 4 * Word_Size range 0 .. 31;
	    Window_Gravity at 5 * Word_Size range 0 .. 31;
	    Backing_Store at 6 * Word_Size range 0 .. 31;
	    Backing_Planes at 7 * Word_Size range 0 .. 31;
	    Backing_Pixel at 8 * Word_Size range 0 .. 31;
	    Save_Under at 9 * Word_Size range 0 .. 31;
	    Event_Mask at 10 * Word_Size range 0 .. 31;
	    Do_Not_Propagate at 11 * Word_Size range 0 .. 31;
	    Override_Redirect at 12 * Word_Size range 0 .. 31;
	    Current_Color_Map at 13 * Word_Size range 0 .. 31;
	    Current_Cursor at 14 * Word_Size range 0 .. 31;
	end record;

    type X_Window_Attributes_Record is
	record
	    X : Int;
	    Y : Int;
	    Width : Int;
	    Height : Int;
	    Border_Width : Int;
	    Depth : Int;
	    Visuals : System.Address;
	    Root : Long;
	    Class : Int;
	    Bit_Gravity : Int;
	    Window_Gravity : Int;
	    Backing_Store : Int;
	    Backing_Planes : Long;
	    Backing_Pixel : Long;
	    Save_Under : Bool;
	    Colormap : X_Lib.Colors.Color_Map;
	    Map_Installed : Bool;
	    Map_State : Int;
	    All_Event_Masks : Long;
	    Your_Event_Mask : Long;
	    Do_Not_Propagate : Long;
	    Override_Redirect : Bool;
	    Screen_Id : System.Address;
	end record;

    type X_Window_Changes_Record is
	record
	    X : Int;
	    Y : Int;
	    Width : Int;
	    Height : Int;
	    Border_Width : Int;
	    Sibling : Unsigned_Long;
	    Stack_Mode : Int;
	end record;

    for X_Window_Changes_Record use
	record
	    X at 0 * Word_Size range 0 .. 31;
	    Y at 1 * Word_Size range 0 .. 31;
	    Width at 2 * Word_Size range 0 .. 31;
	    Height at 3 * Word_Size range 0 .. 31;
	    Border_Width at 4 * Word_Size range 0 .. 31;
	    Sibling at 5 * Word_Size range 0 .. 31;
	    Stack_Mode at 6 * Word_Size range 0 .. 31;
	end record;

    type X_Size_Hint_Record is
	record
	    Flags : Long;
	    X : Int;
	    Y : Int;
	    Width : Int;
	    Height : Int;
	    Min_Width : Int;
	    Min_Height : Int;
	    Max_Width : Int;
	    Max_Height : Int;
	    Width_Inc : Int;
	    Height_Inc : Int;
	    Min_Aspect_X : Int;
	    Min_Aspect_Y : Int;
	    Max_Aspect_X : Int;
	    Max_Aspect_Y : Int;
	    Base_Width : Int;             -- added by ICCCM version 1 for R4
	    Base_Height : Int;             -- added by ICCCM version 1 for R4
	    Win_Gravity : Int;             -- added by ICCCM version 1 for R4
	end record;
    for X_Size_Hint_Record use
	record
	    Flags at 0 * Word_Size range 0 .. 31;
	    X at 1 * Word_Size range 0 .. 31;
	    Y at 2 * Word_Size range 0 .. 31;
	    Width at 3 * Word_Size range 0 .. 31;
	    Height at 4 * Word_Size range 0 .. 31;
	    Min_Width at 5 * Word_Size range 0 .. 31;
	    Min_Height at 6 * Word_Size range 0 .. 31;
	    Max_Width at 7 * Word_Size range 0 .. 31;
	    Max_Height at 8 * Word_Size range 0 .. 31;
	    Width_Inc at 9 * Word_Size range 0 .. 31;
	    Height_Inc at 10 * Word_Size range 0 .. 31;
	    Min_Aspect_X at 11 * Word_Size range 0 .. 31;
	    Min_Aspect_Y at 12 * Word_Size range 0 .. 31;
	    Max_Aspect_X at 13 * Word_Size range 0 .. 31;
	    Max_Aspect_Y at 14 * Word_Size range 0 .. 31;
	    Base_Width at 15 * Word_Size range 0 .. 31;
	    Base_Height at 16 * Word_Size range 0 .. 31;
	    Win_Gravity at 17 * Word_Size range 0 .. 31;
	end record;

    type X_Wm_Hint_Record is
	record
	    Flags : Long;
	    Input : Bool;
	    Initial_State : Int;
	    Icon_Pixmap : Long;
	    Icon_Window : Long;
	    Icon_X : Int;
	    Icon_Y : Int;
	    Icon_Mask : Long;
	    Window_Group : X_Lib.X_Id;
	end record;
    for X_Wm_Hint_Record use
	record
	    Flags at 0 * Word_Size range 0 .. 31;
	    Input at 1 * Word_Size range 0 .. 31;
	    Initial_State at 2 * Word_Size range 0 .. 31;
	    Icon_Pixmap at 3 * Word_Size range 0 .. 31;
	    Icon_Window at 4 * Word_Size range 0 .. 31;
	    Icon_X at 5 * Word_Size range 0 .. 31;
	    Icon_Y at 6 * Word_Size range 0 .. 31;
	    Icon_Mask at 7 * Word_Size range 0 .. 31;
	    Window_Group at 8 * Word_Size range 0 .. 31;
	end record;

    type X_Wm_Hint is access X_Wm_Hint_Record;

    type X_Icon_Size_Record is
	record
	    Min_Width : Int;
	    Min_Height : Int;
	    Max_Width : Int;
	    Max_Height : Int;
	    Width_Inc : Int;
	    Height_Inc : Int;
	end record;
    for X_Icon_Size_Record use
	record
	    Min_Width at 0 * Word_Size range 0 .. 31;
	    Min_Height at 1 * Word_Size range 0 .. 31;
	    Max_Width at 2 * Word_Size range 0 .. 31;
	    Max_Height at 3 * Word_Size range 0 .. 31;
	    Width_Inc at 4 * Word_Size range 0 .. 31;
	    Height_Inc at 5 * Word_Size range 0 .. 31;
	end record;
    type X_Icon_Size is access X_Icon_Size_Record;
    type X_Icon_Size_Array is array (Natural range <>) of X_Icon_Size_Record;
    type X_Icon_Size_List is access X_Icon_Size_Array;

    type X_Text_Property_Record is
	record
	    Value : System.Address;
	    Encoding : Unsigned_Long;
	    Format : Unsigned_Long;
	    N_Items : Unsigned_Long;
	end record;
    for X_Text_Property_Record use
	record
	    Value at 0 * Word_Size range 0 .. 31;
	    Encoding at 1 * Word_Size range 0 .. 31;
	    Format at 2 * Word_Size range 0 .. 31;
	    N_Items at 3 * Word_Size range 0 .. 31;
	end record;

    type X_Wm_Class_Hint_Record is
	record
	    Res_Name : System.Address;
	    Res_Class : System.Address;
	end record;
    for X_Wm_Class_Hint_Record use
	record
	    Res_Name at 0 * Word_Size range 0 .. 31;
	    Res_Class at 1 * Word_Size range 0 .. 31;
	end record;

    type X_Wm_Class_Hint_Record_Ptr is access X_Wm_Class_Hint_Record;

    function Xgetvisualinfo
		(Display_Id : in System.Address;
		 Vinfo_Mask : in Long;
		 Vinfo_Template : in System.Address;
		 Nitems_Return : in System.Address) return System.Address;

    -- R3
    function Xvisualidfromvisual
		(Visual_Id : System.Address) return Unsigned_Long;
    --

    function Xmatchvisualinfo (Display_Id : in System.Address;
			       Screen_Id : in Int;
			       Depth_Of_Screen : in Int;
			       Class_Of_Screen : in Int;
			       Vinfo_Return : in System.Address) return Int;

    procedure Xsetstandardproperties (Display_Id : in System.Address;
				      Window_Id : in Unsigned_Long;
				      W_Name : in System.Address;
				      Icon_Name : in System.Address;
				      Icon : in Unsigned_Long;
				      Command : in System.Address;
				      Arg_Count : in Int;
				      Hints : in System.Address);

    procedure Xstorename (Display_Id : in System.Address;
			  Window_Id : in Unsigned_Long;
			  Name : in System.Address);

    function Xfetchname (Display_Id : in System.Address;
			 Window_Id : in Unsigned_Long;
			 Name : in System.Address) return Int;

    procedure Xseticonname (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long;
			    Name : in System.Address);

    function Xgeticonname (Display_Id : in System.Address;
			   Window_Id : in Unsigned_Long;
			   Name : in System.Address) return Int;

    procedure Xsetcommand (Display_Id : in System.Address;
			   Window_Id : in Unsigned_Long;
			   Command : in System.Address;
			   Arg_Count : in Int);

    procedure Xsetwmhints (Display_Id : in System.Address;
			   Window_Id : in Unsigned_Long;
			   Hints : in System.Address);

    function Xgetwmhints (Display_Id : in System.Address;
			  Window_Id : in Unsigned_Long) return System.Address;

    procedure Xsetnormalhints (Display_Id : in System.Address;
			       Window_Id : in Unsigned_Long;
			       Hints : in System.Address);

    function Xgetnormalhints (Display_Id : in System.Address;
			      Window_Id : in Unsigned_Long;
			      Hints : in System.Address) return Int;

    procedure Xsetzoomhints (Display_Id : in System.Address;
			     Window_Id : in Unsigned_Long;
			     Hints : in System.Address);

    function Xgetzoomhints (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long;
			    Hints : in System.Address) return Int;

    procedure Xsetsizehints (Display_Id : in System.Address;
			     Window_Id : in Unsigned_Long;
			     Hints : in System.Address;
			     Property : in Unsigned_Long);

    function Xgetsizehints (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long;
			    Hints : in System.Address;
			    Property : in Unsigned_Long) return Int;

    procedure Xgeterrordatabasetext (Display_Id : in System.Address;
				     Name : in System.Address;
				     Message : in System.Address;
				     Default_String : in System.Address;
				     Buffer : in System.Address;
				     N : in Unsigned_Long);

    procedure Xgeterrortext (Display_Id : in System.Address;
			     Code : in Int;
			     Buffer : in System.Address;
			     N : in Unsigned_Long);

    function Xqueryextension (Display_Id : in System.Address;
			      Name : in System.Address;
			      Major_Opcode : in System.Address;
			      First_Event : in System.Address;
			      First_Error : in System.Address) return Int;

    function Xlistextensions
		(Display_Id : in System.Address; Count : in System.Address)
		return System.Address;

    procedure Xfreeextensionlist (List : in System.Address);

    procedure Xseticonsizes (Display_Id : in System.Address;
			     Window_Id : in Unsigned_Long;
			     Size_List : in System.Address;
			     Count : in Int);

    function Xgeticonsizes (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long;
			    Size_List : in System.Address;
			    Count : in System.Address) return Int;

    procedure Xsetclasshint (Display_Id : in System.Address;
			     Window_Id : in Unsigned_Long;
			     Class_Hints : in System.Address);

    function Xgetclasshint (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long;
			    Class_Hints_Return : in System.Address) return Int;

    procedure Xsettransientforhint (Display_Id : in System.Address;
				    Window_Id : in Unsigned_Long;
				    Prop_Window : in Unsigned_Long);

    function Xgettransientforhint
		(Display_Id : in System.Address;
		 Window_Id : in Unsigned_Long;
		 Prop_Window_Return : in System.Address) return Int;

    function Xgetstandardcolormap (Display_Id : in System.Address;
				   W : in Unsigned_Long;
				   Cmap_Return : in System.Address;
				   Property : in Unsigned_Long) return Int;

    procedure Xsetstandardcolormap (Display_Id : in System.Address;
				    W : in Unsigned_Long;
				    Cmap : in System.Address;
				    Property : in Unsigned_Long);

    function Xcreatewindow
		(Display_Id : in System.Address;
		 Parent : in Unsigned_Long;
		 X : in Int;
		 Y : in Int;
		 Width : in Unsigned_Int;
		 Height : in Unsigned_Int;
		 Border_Width : in Unsigned_Int;
		 Depth : in Int;
		 Class : in Unsigned_Int;
		 Visuals : in System.Address;
		 Value_Mask : in Unsigned_Long;
		 Attributes : in System.Address) return Unsigned_Long;

    function Xcreatesimplewindow
		(Display_Id : in System.Address;
		 Parent : in Unsigned_Long;
		 X : in Int;
		 Y : in Int;
		 Width : in Unsigned_Int;
		 Height : in Unsigned_Int;
		 Border_Width : in Unsigned_Int;
		 Border : in Unsigned_Long;
		 Background : in Unsigned_Long) return Unsigned_Long;

    procedure Xdestroywindow (Display_Id : in System.Address;
			      Window_Id : in Unsigned_Long);

    procedure Xdestroysubwindows (Display_Id : in System.Address;
				  Window_Id : in Unsigned_Long);

    procedure Xmapwindow (Display_Id : in System.Address;
			  Window_Id : in Unsigned_Long);

    procedure Xmapraised (Display_Id : in System.Address;
			  Window_Id : in Unsigned_Long);

    procedure Xmapsubwindows (Display_Id : in System.Address;
			      Window_Id : in Unsigned_Long);

    procedure Xunmapwindow (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long);

    procedure Xunmapsubwindows (Display_Id : in System.Address;
				Window_Id : in Unsigned_Long);

    procedure Xconfigurewindow (Display_Id : in System.Address;
				Window_Id : in Unsigned_Long;
				Value_Mask : in Unsigned_Int;
				Changes : in System.Address);

    procedure Xmovewindow (Display_Id : in System.Address;
			   Window_Id : in Unsigned_Long;
			   X : in Int;
			   Y : in Int);

    procedure Xresizewindow (Display_Id : in System.Address;
			     Window_Id : in Unsigned_Long;
			     Width : in Unsigned_Int;
			     Height : in Unsigned_Int);

    procedure Xmoveresizewindow (Display_Id : in System.Address;
				 Window_Id : in Unsigned_Long;
				 X : in Int;
				 Y : in Int;
				 Width : in Unsigned_Int;
				 Height : in Unsigned_Int);

    procedure Xsetwindowborderwidth (Display_Id : in System.Address;
				     Window_Id : in Unsigned_Long;
				     Width : in Unsigned_Int);

    procedure Xraisewindow (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long);

    procedure Xlowerwindow (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long);

    procedure Xcirculatesubwindows (Display_Id : in System.Address;
				    Window_Id : in Unsigned_Long;
				    Direction : in Int);

    procedure Xcirculatesubwindowsup
		 (Display_Id : in System.Address; Window_Id : in Unsigned_Long);

    procedure Xcirculatesubwindowsdown
		 (Display_Id : in System.Address; Window_Id : in Unsigned_Long);

    procedure Xrestackwindows (Display_Id : in System.Address;
			       Windows : in System.Address;
			       N_Windows : in Int);

    procedure Xchangewindowattributes (Display_Id : in System.Address;
				       Window_Id : in Unsigned_Long;
				       Value_Mask : in Unsigned_Long;
				       Attributes : in System.Address);

    procedure Xsetwindowbackground (Display_Id : in System.Address;
				    Window_Id : in Unsigned_Long;
				    Background : in Unsigned_Long);

    procedure Xsetwindowbackgroundpixmap (Display_Id : in System.Address;
					  Window_Id : in Unsigned_Long;
					  Tile : in Unsigned_Long);

    procedure Xsetwindowborder (Display_Id : in System.Address;
				Window_Id : in Unsigned_Long;
				Border : in Unsigned_Long);

    procedure Xsetwindowborderpixmap (Display_Id : in System.Address;
				      Window_Id : in Unsigned_Long;
				      Tile : in Unsigned_Long);

    function Xtranslatecoordinates (Display_Id : in System.Address;
				    Source : in Unsigned_Long;
				    Destination : in Unsigned_Long;
				    Src_X : in Int;
				    Src_Y : in Int;
				    Dest_X : in System.Address;
				    Dest_Y : in System.Address;
				    Child : in System.Address) return Int;

    function Xquerytree (Display_Id : in System.Address;
			 Window_Id : in Unsigned_Long;
			 Root : in System.Address;
			 Parent : in System.Address;
			 Children : in System.Address;
			 N_Children : in System.Address) return Int;

    function Xgetwindowattributes (Display_Id : in System.Address;
				   Window_Id : in Unsigned_Long;
				   Attributes : in System.Address) return Int;

    function Xgetgeometry (Display_Id : in System.Address;
			   D : in Unsigned_Long;
			   Root : in System.Address;
			   X : in System.Address;
			   Y : in System.Address;
			   Width : in System.Address;
			   Height : in System.Address;
			   Border_Width : in System.Address;
			   Depths : in System.Address) return Int;

    function Xparsegeometry (Parse_String : in System.Address;
			     X : in System.Address;
			     Y : in System.Address;
			     Width : in System.Address;
			     Height : in System.Address) return Int;

    function Xgeometry (Display_Id : in System.Address;
			Screen_Id : in Int;
			Position : in System.Address;
			Default : in System.Address;
			Border_Width : in Unsigned_Int;
			Font_Width : in Unsigned_Int;
			Font_Height : in Unsigned_Int;
			X_Padding : in Int;
			Y_Padding : in Int;
			X : in System.Address;
			Y : in System.Address;
			Width : in System.Address;
			Height : in System.Address) return Int;

    function Xquerypointer (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long;
			    Root : in System.Address;
			    Child : in System.Address;
			    Root_X : in System.Address;
			    Root_Y : in System.Address;
			    Win_X : in System.Address;
			    Win_Y : in System.Address;
			    Mask : in System.Address) return Int;

    function Xinternatom (Display_Id : in System.Address;
			  Atom_Name : in System.Address;
			  Only_If_Exists : in Int) return Unsigned_Long;

    function Xgetatomname (Display_Id : in System.Address;
			   Atom_Id : in Unsigned_Long) return System.Address;

    function Xgetwindowproperty (Display_Id : in System.Address;
				 Window_Id : in Unsigned_Long;
				 Property : in Unsigned_Long;
				 Long_Offset : in Long;
				 Long_Length : in Long;
				 Delete : in Int;
				 Req_Type : in Unsigned_Long;
				 Actual_Type : in System.Address;
				 Actual_Form : in System.Address;
				 N_Items : in System.Address;
				 Bytes_After : in System.Address;
				 Data : in System.Address) return Int;

    function Xlistproperties
		(Display_Id : in System.Address;
		 Window_Id : in Unsigned_Long;
		 Num_Prop : in System.Address) return System.Address;

    procedure Xchangeproperty (Display_Id : in System.Address;
			       Window_Id : in Unsigned_Long;
			       Property : in Unsigned_Long;
			       Kind : in Unsigned_Long;
			       Format : in Int;
			       Mode : in Int;
			       Data : in System.Address;
			       N_Elements : in Int);

    procedure Xrotatewindowproperties (Display_Id : in System.Address;
				       Window_Id : in Unsigned_Long;
				       Properties : in System.Address;
				       Num_Prop : in Int;
				       N_Positions : in Int);

    procedure Xdeleteproperty (Display_Id : in System.Address;
			       Window_Id : in Unsigned_Long;
			       Property : in Unsigned_Long);

    procedure Xsetselectionowner (Display_Id : in System.Address;
				  Selection : in Unsigned_Long;
				  Owner : in Unsigned_Long;
				  Time_Stamp : in Unsigned_Long);

    function Xgetselectionowner
		(Display_Id : in System.Address; Selection : in Unsigned_Long)
		return Unsigned_Long;

    procedure Xconvertselection (Display_Id : in System.Address;
				 Selection : in Unsigned_Long;
				 Target : in Unsigned_Long;
				 Property : in Unsigned_Long;
				 Requestor : in Unsigned_Long;
				 Time_Stamp : in Unsigned_Long);

    procedure Xreparentwindow (Display_Id : in System.Address;
			       Window_Id : in Unsigned_Long;
			       Parent : in Unsigned_Long;
			       X : in Int;
			       Y : in Int);

    procedure Xchangesaveset (Display_Id : in System.Address;
			      Window_Id : in Unsigned_Long;
			      Mode : in Int);

    procedure Xaddtosaveset (Display_Id : in System.Address;
			     Window_Id : in Unsigned_Long);

    procedure Xremovefromsaveset (Display_Id : in System.Address;
				  Window_Id : in Unsigned_Long);

    function Xsavecontext (Display_Id : in System.Address;
			   Window_Id : in Unsigned_Long;
			   The_Context : in Int;
			   Data : in System.Address) return Int;

    function Xfindcontext (Display_Id : in System.Address;
			   Window_Id : in Unsigned_Long;
			   The_Context : in Int;
			   Data : in System.Address) return Int;

    function Xdeletecontext (Display_Id : in System.Address;
			     Window_Id : in Unsigned_Long;
			     The_Context : in Int) return Int;

    function Xsynchronize
		(Display_Id : in System.Address; Mode : in Int) return Int;

    function Xsetafterfunction
		(Display_Id : in System.Address; Func : in System.Address)
		return System.Address;

    function Xseterrorhandler
		(Handler : in System.Address) return System.Address;

    function Xsetioerrorhandler
		(Handler : in System.Address) return System.Address;

    pragma Import (C, Xgetvisualinfo, "XGetVisualInfo");

    -- R3
    -- R3
    pragma Import (C, Xvisualidfromvisual, "XVisualIDFromVisual");
    --

    pragma Import (C, Xmatchvisualinfo, "XMatchVisualInfo");

    pragma Import (C, Xsetstandardproperties, "XSetStandardProperties");

    pragma Import (C, Xstorename, "XStoreName");

    pragma Import (C, Xfetchname, "XFetchName");

    pragma Import (C, Xseticonname, "XSetIconName");

    pragma Import (C, Xgeticonname, "XGetIconName");

    pragma Import (C, Xsetcommand, "XSetCommand");

    pragma Import (C, Xsetwmhints, "XSetWMHints");

    pragma Import (C, Xgetwmhints, "XGetWMHints");

    pragma Import (C, Xgetstandardcolormap, "XGetStandardColormap");

    pragma Import (C, Xsetstandardcolormap, "XSetStandardColormap");

    pragma Import (C, Xcreatewindow, "XCreateWindow");

    pragma Import (C, Xcreatesimplewindow, "XCreateSimpleWindow");

    pragma Import (C, Xdestroywindow, "XDestroyWindow");

    pragma Import (C, Xdestroysubwindows, "XDestroySubwindows");

    pragma Import (C, Xmapwindow, "XMapWindow");

    pragma Import (C, Xmapraised, "XMapRaised");

    pragma Import (C, Xmapsubwindows, "XMapSubwindows");

    pragma Import (C, Xunmapwindow, "XUnmapWindow");

    pragma Import (C, Xunmapsubwindows, "XUnmapSubwindows");

    pragma Import (C, Xsetnormalhints, "XSetNormalHints");

    pragma Import (C, Xgetnormalhints, "XGetNormalHints");

    pragma Import (C, Xsetzoomhints, "XSetZoomHints");

    pragma Import (C, Xgetzoomhints, "XGetZoomHints");

    pragma Import (C, Xsetsizehints, "XSetSizeHints");

    pragma Import (C, Xgetsizehints, "XGetSizeHints");

    pragma Import (C, Xgeterrordatabasetext, "XGetErrorDatabaseText");

    pragma Import (C, Xgeterrortext, "XGetErrorText");

    pragma Import (C, Xqueryextension, "XQueryExtension");

    pragma Import (C, Xlistextensions, "XListExtensions");

    pragma Import (C, Xfreeextensionlist, "XFreeExtensionList");

    pragma Import (C, Xseticonsizes, "XSetIconSizes");

    pragma Import (C, Xgeticonsizes, "XGetIconSizes");

    pragma Import (C, Xsetclasshint, "XSetClassHint");

    pragma Import (C, Xgetclasshint, "XGetClassHint");

    pragma Import (C, Xsettransientforhint, "XSetTransientForHint");

    pragma Import (C, Xgettransientforhint, "XGetTransientForHint");

    pragma Import (C, Xconfigurewindow, "XConfigureWindow");

    pragma Import (C, Xmovewindow, "XMoveWindow");

    pragma Import (C, Xresizewindow, "XResizeWindow");

    pragma Import (C, Xmoveresizewindow, "XMoveResizeWindow");

    pragma Import (C, Xsetwindowborderwidth, "XSetWindowBorderWidth");

    pragma Import (C, Xraisewindow, "XRaiseWindow");

    pragma Import (C, Xlowerwindow, "XLowerWindow");

    pragma Import (C, Xcirculatesubwindows, "XCirculateSubwindows");

    pragma Import (C, Xcirculatesubwindowsup, "XCirculateSubwindowsUp");

    pragma Import (C, Xcirculatesubwindowsdown, "XCirculateSubwindowsDown");

    pragma Import (C, Xrestackwindows, "XRestackWindows");

    pragma Import (C, Xchangewindowattributes, "XChangeWindowAttributes");

    pragma Import (C, Xsetwindowbackground, "XSetWindowBackground");

    pragma Import (C, Xsetwindowbackgroundpixmap, "XSetWindowBackgroundPixmap");

    pragma Import (C, Xsetwindowborder, "XSetWindowBorder");

    pragma Import (C, Xsetwindowborderpixmap, "XSetWindowBorderPixmap");

    pragma Import (C, Xtranslatecoordinates, "XTranslateCoordinates");

    pragma Import (C, Xquerytree, "XQueryTree");

    pragma Import (C, Xgetwindowattributes, "XGetWindowAttributes");

    pragma Import (C, Xgetgeometry, "XGetGeometry");

    pragma Import (C, Xparsegeometry, "XParseGeometry");

    pragma Import (C, Xgeometry, "XGeometry");

    pragma Import (C, Xquerypointer, "XQueryPointer");

    pragma Import (C, Xinternatom, "XInternAtom");

    pragma Import (C, Xgetatomname, "XGetAtomName");

    pragma Import (C, Xgetwindowproperty, "XGetWindowProperty");

    pragma Import (C, Xlistproperties, "XListProperties");

    pragma Import (C, Xchangeproperty, "XChangeProperty");

    pragma Import (C, Xrotatewindowproperties, "XRotateWindowProperties");

    pragma Import (C, Xdeleteproperty, "XDeleteProperty");

    pragma Import (C, Xsetselectionowner, "XSetSelectionOwner");

    pragma Import (C, Xgetselectionowner, "XGetSelectionOwner");

    pragma Import (C, Xconvertselection, "XConvertSelection");

    pragma Import (C, Xreparentwindow, "XReparentWindow");

    pragma Import (C, Xchangesaveset, "XChangeSaveSet");

    pragma Import (C, Xaddtosaveset, "XAddToSaveSet");

    pragma Import (C, Xremovefromsaveset, "XRemoveFromSaveSet");

    pragma Import (C, Xsavecontext, "XSaveContext");

    pragma Import (C, Xfindcontext, "XFindContext");

    pragma Import (C, Xdeletecontext, "XDeleteContext");

    pragma Import (C, Xsynchronize, "XSynchronize");

    pragma Import (C, Xsetafterfunction, "XSetAfterFunction");

    pragma Import (C, Xseterrorhandler, "XSetErrorHandler");

    pragma Import (C, Xsetioerrorhandler, "XSetIOErrorHandler");

    --****************************************************************
    --**                                                            **
    --**                  CUT AND PASTE                             **
    --**                                                            **
    --****************************************************************

    function Xfetchbuffer (Display_Id : in System.Address;
			   Size : in System.Address;
			   From_Buffer : in Int) return System.Address;

    function Xfetchbytes (Display_Id : in System.Address;
			  Size : in System.Address) return System.Address;

    procedure Xstorebuffer (Display_Id : in System.Address;
			    Data : in System.Address;
			    Data_Length : in Int;
			    To_Buffer : in Int);

    procedure Xstorebytes (Display_Id : in System.Address;
			   Data : in System.Address;
			   Data_Length : in Int);

    procedure Xrotatebuffers (Display_Id : in System.Address; By : in Int);

    function Xdisplayname (Name : in System.Address) return System.Address;

    pragma Import (C, Xstorebuffer, "XStoreBuffer");

    pragma Import (C, Xstorebytes, "XStoreBytes");

    pragma Import (C, Xfetchbuffer, "XFetchBuffer");

    pragma Import (C, Xfetchbytes, "XFetchBytes");

    pragma Import (C, Xrotatebuffers, "XRotateBuffers");

    pragma Import (C, Xdisplayname, "XDisplayName");

    -- ********************************************************************
    -- *                                                                  *
    -- *                      EVENTS                                      *
    -- *                                                                  *
    -- ********************************************************************

    type X_Time_Coord_Record is
	record
	    Timestamp : Long;
	    X : Short;
	    Y : Short;
	end record;
    for X_Time_Coord_Record use
	record
	    Timestamp at 0 * Word_Size range 0 .. 31;
	    X at 1 * Word_Size range 0 .. 15;
	    Y at 1 * Word_Size range 16 .. 31;
	end record;

    type X_Time_Coord_Array is array (Natural range <>) of X_Time_Coord_Record;
    type X_Time_Coord_List is access X_Time_Coord_Array;

    type X_Modifier_Keymap_Record is
	record
	    Max_Keys_Per_Mod : Int;
	    Modifier_Map : System.Address;
	end record;
    type X_Modifier_Keymap_Pointer is access X_Modifier_Keymap_Record;

    for X_Modifier_Keymap_Record use
	record
	    Max_Keys_Per_Mod at 0 * Word_Size range 0 .. 31;
	    Modifier_Map at 1 * Word_Size range 0 .. 31;
	end record;

    procedure Xselectinput (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long;
			    Mask : in Long);

    procedure Xflush (Display_Id : in System.Address);

    -- the internal version
    procedure X_Flush (Display_Id : in System.Address);

    procedure Xsync (Display_Id : in System.Address; Discard : in Int);

    function Xeventsqueued
		(Display_Id : in System.Address; Mode : in Int) return Int;

    -- the internal version
    function X_Events_Queued
		(Display_Id : in System.Address; Mode : in Int) return Int;

    function Xpending (Display_Id : in System.Address) return Int;

    procedure Xnextevent (Display_Id : in System.Address;
			  Event_Rec : in System.Address);

    procedure Xpeekevent (Display_Id : in System.Address;
			  The_Event : in System.Address);

    procedure Xputbackevent (Display_Id : in System.Address;
			     The_Event : in System.Address);

    procedure Xwindowevent (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long;
			    Mask : in Long;
			    The_Event : in System.Address);

    function Xcheckwindowevent (Display_Id : in System.Address;
				Window_Id : in Unsigned_Long;
				Mask : in Long;
				The_Event : in System.Address) return Int;

    function Xchecktypedevent (Display_Id : in System.Address;
			       Event_Type : in Int;
			       Event_Return : in System.Address) return Int;

    function Xchecktypedwindowevent
		(Display_Id : in System.Address;
		 Window_Id : in Unsigned_Long;
		 Event_Type : in Int;
		 Event_Return : in System.Address) return Int;

    procedure Xmaskevent (Display_Id : in System.Address;
			  Mask : in Long;
			  The_Event : in System.Address);

    function Xcheckmaskevent (Display_Id : in System.Address;
			      Mask : in Long;
			      The_Event : in System.Address) return Int;

    function Xstringtokeysym
		(String_In : in System.Address) return Unsigned_Long;

    function Xkeysymtostring
		(Keysym_Str : in Unsigned_Long) return System.Address;

    function Xkeycodetokeysym (Display_Id : in System.Address;
			       Key_Code : in Unsigned_Long;
			       Index : in Int) return Unsigned_Long;

    function Xkeysymtokeycode (Display_Id : in System.Address;
			       Keysym_Kcode : in Unsigned_Long) return Char;

    function Xgetdefault (Display_Id : in System.Address;
			  Program : in System.Address;
			  Option : in System.Address) return System.Address;

    --  R3 function
    function Xresourcemanagerstring
		(Display_Id : in System.Address) return System.Address;
    --

    function Xgetmotionevents
		(Display_Id : in System.Address;
		 Window_Id : in Unsigned_Long;
		 Start : in Unsigned_Long;
		 Stop : in Unsigned_Long;
		 N_Events : in System.Address) return System.Address;

    --  R3 function
    function Xdisplaymotionbuffersize
		(Display_Id : in System.Address) return Unsigned_Long;
    --

    function Xsendevent (Display_Id : in System.Address;
			 Window_Id : in Unsigned_Long;
			 Propagate : in Int;
			 Mask : in Long;
			 The_Event : in System.Address) return Int;

    function Xlookupkeysym (The_Event : in System.Address; Index : in Int)
			   return Unsigned_Long;

    procedure Xrefreshkeyboardmapping (The_Event : in System.Address);

    function Xlookupstring (The_Event : in System.Address;
			    Buffer : in System.Address;
			    B_Length : in Int;
			    The_Symbol : in System.Address;
			    Status : in System.Address) return Int;

    procedure Xrebindkeysym (Display_Id : in System.Address;
			     The_Symbol : in Unsigned_Long;
			     Modifiers : in System.Address;
			     Mod_Count : in Int;
			     Text : in System.Address;
			     Length : in Int);

    pragma Import (C, Xselectinput, "XSelectInput");

    pragma Import (C, Xflush, "XFlush");

    pragma Import (C, X_Flush, "_XFlush");
    pragma Import (C, Xsync, "XSync");

    pragma Import (C, Xpending, "XPending");

    pragma Import (C, Xeventsqueued, "XEventsQueued");

    pragma Import (C, X_Events_Queued, "_XEventsQueued");
    pragma Import (C, Xnextevent, "XNextEvent");

    pragma Import (C, Xpeekevent, "XPeekEvent");

    pragma Import (C, Xputbackevent, "XPutBackEvent");

    pragma Import (C, Xwindowevent, "XWindowEvent");

    pragma Import (C, Xcheckwindowevent, "XCheckWindowEvent");

    pragma Import (C, Xchecktypedevent, "XCheckTypedEvent");

    pragma Import (C, Xchecktypedwindowevent, "XCheckTypedWindowEvent");

    pragma Import (C, Xmaskevent, "XMaskEvent");

    pragma Import (C, Xcheckmaskevent, "XCheckMaskEvent");

    pragma Import (C, Xgetmotionevents, "XGetMotionEvents");

    -- R3
    pragma Import (C, Xdisplaymotionbuffersize, "XDisplayMotionBufferSize");

    pragma Import (C, Xsendevent, "XSendEvent");

    pragma Import (C, Xlookupkeysym, "XLookupKeysym");

    pragma Import (C, Xrefreshkeyboardmapping, "XRefreshKeyboardMapping");

    pragma Import (C, Xlookupstring, "XLookupString");

    pragma Import (C, Xrebindkeysym, "XRebindKeysym");

    pragma Import (C, Xstringtokeysym, "XStringToKeysym");

    pragma Import (C, Xkeysymtostring, "XKeysymToString");

    pragma Import (C, Xkeycodetokeysym, "XKeycodeToKeysym");

    pragma Import (C, Xkeysymtokeycode, "XKeysymToKeycode");

    pragma Import (C, Xgetdefault, "XGetDefault");

    -- R3
    pragma Import (C, Xresourcemanagerstring, "XResourceManagerString");

    --**************************************************************
    --**                                                          **
    --**           WINDOW MANAGER                                 **
    --**                                                          **
    --**************************************************************

    -- lengthened for R4
    type X_Standard_Colormap_Record is
	record
	    Map_Id : X_Lib.Colors.Color_Map;
	    Red_Max : Long;
	    Red_Mult : Long;
	    Green_Max : Long;
	    Green_Mult : Long;
	    Blue_Max : Long;
	    Blue_Mult : Long;
	    Base_Pixel : Long;
	    Visual_Id : Long;
	    Kill_Id : X_Lib.X_Id;
	end record;

    type X_Host_Address_Record is
	record
	    Family : Int;
	    Length : Int;
	    Data : System.Address;
	end record;
    type X_Host_Address_Array is
       array (Natural range <>) of X_Host_Address_Record;
    type X_Host_Address_List is access X_Host_Address_Array;


    procedure Xgrabbutton (Display_Id : in System.Address;
			   Button : in Unsigned_Int;
			   Modifiers : in Unsigned_Long;
			   Window_Id : in Unsigned_Long;
			   Owner_Events : in Int;
			   Grab_Events : in Unsigned_Int;
			   Pointer_Mode : in Int;
			   Keyboard_Mode : in Int;
			   Confine_To : in Unsigned_Long;
			   Cursor_Id : in Unsigned_Long);

    procedure Xungrabbutton (Display_Id : in System.Address;
			     Button : in Unsigned_Int;
			     Modifiers : in Unsigned_Int;
			     Window_Id : in Unsigned_Long);

    function Xgrabpointer (Display_Id : in System.Address;
			   Window_Id : in Unsigned_Long;
			   Owner_Events : in Int;
			   Grab_Events : in Unsigned_Int;
			   Pointer_Mode : in Int;
			   Keyboard_Mode : in Int;
			   Confine_To : in Unsigned_Long;
			   Cursor_Id : in Unsigned_Long;
			   Grab_Time : in Unsigned_Long) return Int;

    procedure Xungrabpointer (Display_Id : in System.Address;
			      Ungrab_Time : in Unsigned_Long);

    procedure Xchangeactivepointergrab (Display_Id : in System.Address;
					Grab_Events : in Unsigned_Int;
					Cursor_Id : in Unsigned_Long;
					Grab_Time : in Unsigned_Long);

    function Xgrabkeyboard (Display_Id : in System.Address;
			    Window_Id : in Unsigned_Long;
			    Owner_Events : in Int;
			    Pointer_Mode : in Int;
			    Keyboard_Mode : in Int;
			    Grab_Time : in Unsigned_Long) return Int;

    procedure Xungrabkeyboard (Display_Id : in System.Address;
			       Ungrab_Time : in Unsigned_Long);

    procedure Xgrabkey (Display_Id : in System.Address;
			Key : in Int;
			Modifiers : in Unsigned_Int;
			Window_Id : in Unsigned_Long;
			Owner_Events : in Int;
			Pointer_Mode : in Int;
			Keyboard_Mode : in Int);

    procedure Xungrabkey (Display_Id : in System.Address;
			  Key : in Int;
			  Modifiers : in Unsigned_Int;
			  Window_Id : in Unsigned_Long);

    procedure Xallowevents (Display_Id : in System.Address;
			    Mode : in Int;
			    Event_Time : in Unsigned_Long);

    procedure Xgrabserver (Display_Id : in System.Address);

    procedure Xungrabserver (Display_Id : in System.Address);

    procedure Xwarppointer (Display_Id : in System.Address;
			    Source : in Unsigned_Long;
			    Destination : in Unsigned_Long;
			    Source_Bounds_X : in Int;
			    Source_Bounds_Y : in Int;
			    Source_Bounds_W : in Unsigned_Int;
			    Source_Bounds_H : in Unsigned_Int;
			    Dest_Xy_X : in Int;
			    Dest_Xy_Y : in Int);

    procedure Xsetinputfocus (Display_Id : in System.Address;
			      Focus : in Unsigned_Long;
			      Mode : in Int;
			      Grab_Time : in Unsigned_Long);

    procedure Xgetinputfocus (Display_Id : in System.Address;
			      Focus : in System.Address;
			      Mode : in System.Address);

    procedure Xchangepointercontrol (Display_Id : in System.Address;
				     Do_Accel : in Int;
				     Do_Threshold : in Int;
				     Numerator : in Int;
				     Denominator : in Int;
				     Threshold : in Int);

    procedure Xgetpointercontrol (Display_Id : in System.Address;
				  Numerator : in System.Address;
				  Denominator : in System.Address;
				  Threshold : in System.Address);

    procedure Xsetclosedownmode (Display_Id : in System.Address; Mode : in Int);

    procedure Xkillclient (Display_Id : in System.Address;
			   Resource_Id : in Unsigned_Long);

    procedure Xchangekeyboardcontrol (Display_Id : in System.Address;
				      Value_Mask : in Unsigned_Long;
				      Values : in System.Address);

    procedure Xgetkeyboardcontrol (Display_Id : in System.Address;
				   Keyboard_State : in System.Address);

    procedure Xautorepeaton (Display_Id : in System.Address);

    procedure Xautorepeatoff (Display_Id : in System.Address);

    procedure Xbell (Display_Id : in System.Address; Volume : in Int);

    function Xsetpointermapping (Display_Id : in System.Address;
				 Map : in System.Address;
				 Nmap : in Int) return Int;

    function Xgetpointermapping (Display_Id : in System.Address;
				 Map : in System.Address;
				 Nmap : in Int) return Int;


    procedure Xquerykeymap (Display_Id : in System.Address;
			    Keys_Return : in System.Address);

    function Xgetkeyboardmapping
		(Display_Id : in System.Address;
		 First_Code : in Unsigned_Long;
		 Count : in Int;
		 Keysym_Count : in System.Address) return System.Address;

    -- R3 proc
    procedure Xdisplaykeycodes (Display_Id : in System.Address;
				Min_Keycode : in System.Address;
				Max_Keycode : in System.Address);
    --

    procedure Xchangekeyboardmapping (Display_Id : in System.Address;
				      First_Code : in Int;
				      Syms_Per_Code : in Int;
				      Syms : in System.Address;
				      Num_Codes : in Int);

    function Xsetmodifiermapping
		(Display_Id : in System.Address; Modifiers : in System.Address)
		return Int;

    function Xgetmodifiermapping
		(Display_Id : in System.Address) return System.Address;

    procedure Xfreemodifiermap (Modifiers : in System.Address);

    function Xnewmodifiermap (Max_Keys_Per_Mod : in Int) return System.Address;

    function Xdeletemodifiermapentry (Map : in System.Address;
				      The_Keycode : in Unsigned_Long;
				      Modifier : in Int) return System.Address;


    function Xinsertmodifiermapentry (Map : in System.Address;
				      The_Keycode : in Unsigned_Long;
				      Modifier : in Int) return System.Address;

    procedure Xsetscreensaver (Display_Id : in System.Address;
			       Time_Out : in Int;
			       Interval : in Int;
			       Blanking : in Int;
			       Exposures : in Int);

    procedure Xforcescreensaver (Display_Id : in System.Address; Mode : in Int);

    procedure Xactivatescreensaver (Display_Id : in System.Address);

    procedure Xresetscreensaver (Display_Id : in System.Address);

    procedure Xgetscreensaver (Display_Id : in System.Address;
			       Time_Out : in System.Address;
			       Interval : in System.Address;
			       Blanking : in System.Address;
			       Exposures : in System.Address);

    procedure Xaddhost (Display_Id : in System.Address;
			Host : in System.Address);

    procedure Xaddhosts (Display_Id : in System.Address;
			 Hosts : in System.Address;
			 Nhosts : in Int);

    function Xlisthosts (Display_Id : in System.Address;
			 N_Hosts : in System.Address;
			 States : in System.Address) return System.Address;

    procedure Xremovehost (Display_Id : in System.Address;
			   Host : in System.Address);

    procedure Xremovehosts (Display_Id : in System.Address;
			    Hosts : in System.Address;
			    Nhosts : in Int);

    procedure Xsetaccesscontrol (Display_Id : in System.Address; Mode : in Int);

    procedure Xenableaccesscontrol (Display_Id : in System.Address);

    procedure Xdisableaccesscontrol (Display_Id : in System.Address);

    pragma Import (C, Xgrabbutton, "XGrabButton");

    pragma Import (C, Xungrabbutton, "XUngrabButton");

    pragma Import (C, Xgrabpointer, "XGrabPointer");

    pragma Import (C, Xungrabpointer, "XUngrabPointer");

    pragma Import (C, Xchangeactivepointergrab, "XChangeActivePointerGrab");

    pragma Import (C, Xgrabkeyboard, "XGrabKeyboard");

    pragma Import (C, Xungrabkeyboard, "XUngrabKeyboard");

    pragma Import (C, Xgrabkey, "XGrabKey");

    pragma Import (C, Xungrabkey, "XUngrabKey");

    pragma Import (C, Xallowevents, "XAllowEvents");

    pragma Import (C, Xgrabserver, "XGrabServer");

    pragma Import (C, Xungrabserver, "XUngrabServer");

    pragma Import (C, Xwarppointer, "XWarpPointer");

    pragma Import (C, Xsetinputfocus, "XSetInputFocus");

    pragma Import (C, Xgetinputfocus, "XGetInputFocus");

    pragma Import (C, Xchangepointercontrol, "XChangePointerControl");

    pragma Import (C, Xgetpointercontrol, "XGetPointerControl");

    pragma Import (C, Xsetclosedownmode, "XSetCloseDownMode");

    pragma Import (C, Xkillclient, "XKillClient");

    pragma Import (C, Xchangekeyboardcontrol, "XChangeKeyboardControl");

    pragma Import (C, Xgetkeyboardcontrol, "XGetKeyboardControl");

    pragma Import (C, Xautorepeaton, "XAutoRepeatOn");

    pragma Import (C, Xautorepeatoff, "XAutoRepeatOff");

    pragma Import (C, Xbell, "XBell");

    pragma Import (C, Xsetpointermapping, "XSetPointerMapping");

    pragma Import (C, Xgetpointermapping, "XGetPointerMapping");

    pragma Import (C, Xquerykeymap, "XQueryKeymap");

    pragma Import (C, Xgetkeyboardmapping, "XGetKeyboardMapping");

    -- R3
    pragma Import (C, Xdisplaykeycodes, "XDisplayKeycodes");

    pragma Import (C, Xchangekeyboardmapping, "XChangeKeyboardMapping");

    pragma Import (C, Xsetmodifiermapping, "XSetModifierMapping");

    pragma Import (C, Xgetmodifiermapping, "XGetModifierMapping");

    pragma Import (C, Xfreemodifiermap, "XFreeModifiermap");

    pragma Import (C, Xnewmodifiermap, "XNewModifiermap");

    pragma Import (C, Xdeletemodifiermapentry, "XDeleteModifiermapEntry");

    pragma Import (C, Xinsertmodifiermapentry, "XInsertModifiermapEntry");

    pragma Import (C, Xsetscreensaver, "XSetScreenSaver");

    pragma Import (C, Xforcescreensaver, "XForceScreenSaver");

    pragma Import (C, Xactivatescreensaver, "XActivateScreenSaver");

    pragma Import (C, Xresetscreensaver, "XResetScreenSaver");

    pragma Import (C, Xgetscreensaver, "XGetScreenSaver");

    pragma Import (C, Xaddhost, "XAddHost");

    pragma Import (C, Xaddhosts, "XAddHosts");

    pragma Import (C, Xlisthosts, "XListHosts");

    pragma Import (C, Xremovehost, "XRemoveHost");

    pragma Import (C, Xremovehosts, "XRemoveHosts");

    pragma Import (C, Xsetaccesscontrol, "XSetAccessControl");

    pragma Import (C, Xenableaccesscontrol, "XEnableAccessControl");

    pragma Import (C, Xdisableaccesscontrol, "XDisableAccessControl");

    --**************************************************************
    --**                                                          **
    --**               REGIONS                                    **
    --**                                                          **
    --**************************************************************

    function Xpolygonregion (Points : in System.Address;
			     Number_Of_Points : in Int;
			     Rule : in Int) return Unsigned_Long;

    procedure Xclipbox (Region_Id : in Unsigned_Long;
			Clip_Rectangle : in System.Address);

    function Xcreateregion return Unsigned_Long;

    procedure Xsetregion (Display_Id : in System.Address;
			  Gc : in System.Address;
			  Region_Id : in Unsigned_Long);

    procedure Xdestroyregion (Region_Id : in Unsigned_Long);

    procedure Xoffsetregion (Region_Id : in Unsigned_Long;
			     Delta_X, Delta_Y : in Int);

    procedure Xshrinkregion (Region_Id : in Unsigned_Long;
			     Delta_X, Delta_Y : in Int);

    procedure Xintersectregion (Source_A : in Unsigned_Long;
				Source_B : in Unsigned_Long;
				Destination : in Unsigned_Long);

    procedure Xunionrectwithregion (Source_A : in System.Address;
				    Source_B : in Unsigned_Long;
				    Destination : in Unsigned_Long);

    procedure Xunionregion (Source_A : in Unsigned_Long;
			    Source_B : in Unsigned_Long;
			    Destination : in Unsigned_Long);

    procedure Xsubtractregion (Source_A : in Unsigned_Long;
			       Source_B : in Unsigned_Long;
			       Destination : in Unsigned_Long);

    procedure Xxorregion (Source_A : in Unsigned_Long;
			  Source_B : in Unsigned_Long;
			  Destination : in Unsigned_Long);

    function Xemptyregion (Region_Id : in Unsigned_Long) return Int;

    function Xequalregion
		(Region_1 : in Unsigned_Long; Region_2 : in Unsigned_Long)
		return Int;

    function Xpointinregion
		(Region_Id : in Unsigned_Long; X, Y : in Int) return Int;

    function Xrectinregion (Region_Id : in Unsigned_Long;
			    X : in Int;
			    Y : in Int;
			    Width : in Unsigned_Int;
			    Height : in Unsigned_Int) return Int;

    pragma Import (C, Xpolygonregion, "XPolygonRegion");

    pragma Import (C, Xclipbox, "XClipBox");

    pragma Import (C, Xsetregion, "XSetRegion");

    pragma Import (C, Xcreateregion, "XCreateRegion");

    pragma Import (C, Xdestroyregion, "XDestroyRegion");

    pragma Import (C, Xoffsetregion, "XOffsetRegion");

    pragma Import (C, Xshrinkregion, "XShrinkRegion");

    pragma Import (C, Xintersectregion, "XIntersectRegion");

    pragma Import (C, Xunionregion, "XUnionRegion");

    pragma Import (C, Xunionrectwithregion, "XUnionRectWithRegion");

    pragma Import (C, Xsubtractregion, "XSubtractRegion");

    pragma Import (C, Xxorregion, "XXorRegion");

    pragma Import (C, Xemptyregion, "XEmptyRegion");

    pragma Import (C, Xequalregion, "XEqualRegion");

    pragma Import (C, Xpointinregion, "XPointInRegion");

    pragma Import (C, Xrectinregion, "XRectInRegion");

    --**************************************************************
    --**                                                          **
    --**               ANCILLARY C SUPPORT ROUTINES               **
    --**                                                          **
    --**************************************************************

    -- The procedure Bcopy is an external interface to the Bcopy routine
    -- supplied in the C library. It is used because we need a vehicle
    -- for copying bytes of information from the source to the
    -- newly made destination.

    procedure Xbcopy (Source : in System.Address;
		      Target : in System.Address;
		      Length : in Natural);
    pragma Import (C, Xbcopy, "xbcopy");

    -- Strlen returns the length of a C String excluding the null
    -- terminator

    function Xstrlen (Str : in System.Address) return Natural;
    pragma Import (C, Xstrlen, "xstrlen");

--    -- bittest returns 0 or 1 depending if the bit in Mask2 was set
--    -- in Mask_1
--
--    function xbittest (mask_1, mask_2 : in long) return long;
--


    --**************************************************************
    --**                                                          **
    --**               RESOURCE MANAGEMENT                        **
    --**                                                          **
    --**************************************************************

    type X_Xrmoptiondescrec is
	record
	    Option : System.Address;
	    Resource_Name : System.Address;
	    Arg_Kind : Int;
	    Value : X_Lib.X_Address;
	end record;

    for X_Xrmoptiondescrec use
	record
	    Option at 0 * Word_Size range 0 .. 31;
	    Resource_Name at 1 * Word_Size range 0 .. 31;
	    Arg_Kind at 2 * Word_Size range 0 .. 31;
	    Value at 3 * Word_Size range 0 .. 31;
	end record;

    type X_Xrmoptiondescarray is array (Natural range <>) of X_Xrmoptiondescrec;
    type X_Xrmoptiondescrecptr is access X_Xrmoptiondescrec;


    function Xrmgetfiledatabase
		(Filename : in System.Address) return System.Address;

    -- str_type and value returned, besides status
    function Xrmgetresource (Database : in System.Address;
			     Str_Name, Str_Class : in System.Address;
			     Str_Type : in System.Address;
			     Value : in System.Address) return Int;

    function Xrmgetstringdatabase
		(Data : in System.Address) return System.Address;

    procedure Xrminitialize;

    procedure Xrmmergedatabases (Source_Db : in System.Address;
				 Target_Db : in System.Address);

    procedure Xrmparsecommand (Db : in System.Address;
			       Table : in System.Address;
			       Table_Count : in Int;
			       Name : in System.Address;
			       Argc : in System.Address;
			       Argv : in System.Address);

    procedure Xrmputfiledatabase (Database : in System.Address;
				  Stored_Db : in System.Address);

    procedure Xrmputlineresource
		 (Database_Ptr : in System.Address; Line : in System.Address);

    procedure Xrmputresource (Database_Ptr : in System.Address;
			      Specifier : in System.Address;
			      Res_Type : in System.Address;
			      Res_Value : in System.Address);

    procedure Xrmputstringresource (Database_Ptr : in System.Address;
				    Resource : in System.Address;
				    Res_Value : in System.Address);

    -- quark_type, db_value, and status returned
    function Xrmqgetresource (Database : in System.Address;
			      Quark_Name : in System.Address;
			      Quark_Class : in System.Address;
			      Quark_Type : in System.Address;
			      Db_Value : in System.Address) return Int;

    -- search_list and status returned
    function Xrmqgetsearchlist (Database : in System.Address;
				Names : in System.Address;
				Classes : in System.Address;
				Search_List : in System.Address;
				List_Length : in Int) return Int;

    -- data_type, db_value, and status returned
    function Xrmqgetsearchresource (Search_List : in System.Address;
				    Name : in Int;
				    Class : in Int;
				    Data_Type : in System.Address;
				    Db_Value : in System.Address) return Int;

    procedure Xrmqputresource (Database : in System.Address;
			       Bindings : in System.Address;
			       Quarks : in System.Address;
			       Res_Type : in Int;
			       Res_Value : in System.Address);

    procedure Xrmqputstringresource (Database : in System.Address;
				     Bindings : in System.Address;
				     Quarks : in System.Address;
				     Str_Value : in System.Address);

    function Xrmquarktostring (Quark : in Int) return System.Address;

    procedure Xrmstringtobindingquarklist (String : in System.Address;
					   Bindings : in System.Address;
					   Quarks : in System.Address);

    function Xrmstringtoquark (String : in System.Address) return Int;

    procedure Xrmstringtoquarklist
		 (String : in System.Address; Quarks : in System.Address);

    function Xrmuniquequark return Int;

    --
    -- ** C pragma interfaces for Resource Mgmt routines **

    pragma Import (C, Xrmgetfiledatabase, "XrmGetFileDatabase");

    pragma Import (C, Xrmgetresource, "XrmGetResource");

    pragma Import (C, Xrmgetstringdatabase, "XrmGetStringDatabase");

    pragma Import (C, Xrminitialize, "XrmInitialize");

    pragma Import (C, Xrmmergedatabases, "XrmMergeDatabases");

    pragma Import (C, Xrmparsecommand, "XrmParseCommand");

    pragma Import (C, Xrmputfiledatabase, "XrmPutFileDatabase");

    pragma Import (C, Xrmputlineresource, "XrmPutLineResource");

    pragma Import (C, Xrmputresource, "XrmPutResource");

    pragma Import (C, Xrmputstringresource, "XrmPutStringResource");

    pragma Import (C, Xrmqgetresource, "XrmQGetResource");

    pragma Import (C, Xrmqgetsearchlist, "XrmQGetSearchList");

    pragma Import (C, Xrmqgetsearchresource, "XrmQGetSearchResource");

    pragma Import (C, Xrmqputresource, "XrmQPutResource");

    pragma Import (C, Xrmqputstringresource, "XrmQPutStringResource");

    pragma Import (C, Xrmquarktostring, "XrmQuarkToString");

    pragma Import (C, Xrmstringtobindingquarklist,
		   "XrmStringToBindingQuarkList");

    pragma Import (C, Xrmstringtoquark, "XrmStringToQuark");

    pragma Import (C, Xrmstringtoquarklist, "XrmStringToQuarkList");

    pragma Import (C, Xrmuniquequark, "XrmUniqueQuark");

    -- Here are the new R4 function interfaces

    function Xlistdepths (Display_Id : in System.Address;
			  Screen_Number : in Int;
			  Count_Ret : in System.Address) return System.Address;

    function Xlistpixmapformats
		(Display_Id : in System.Address; Count_Ret : in System.Address)
		return System.Address;

    function Xscreenofdisplay
		(Display_Id : in System.Address; Screen_Num : in Int)
		return System.Address;

    function Xscreennumberofscreen (Screen_Id : in System.Address) return Int;

    function Xgetgcvalues (Display_Id : in System.Address;
			   Gc : in System.Address;
			   Value_Mask : in Unsigned_Long;
			   Values_Ret : in System.Address) return Int;

    procedure Xrmdestroydatabase (Database : in System.Address);

    function Xiconifywindow (Display_Id : in System.Address;
			     Window_Id : in Unsigned_Long;
			     Screen_Num : in Int) return Int;

    function Xwithdrawwindow (Display_Id : in System.Address;
			      Window_Id : in Unsigned_Long;
			      Screen_Num : in Int) return Int;

    function Xreconfigurewmwindow (Display_Id : in System.Address;
				   Window_Id : in Unsigned_Long;
				   Screen_Num : in Int;
				   Value_Mask : in Unsigned_Int;
				   Values : in System.Address) return Int;

    function Xstringlisttotextproperty
		(List : in System.Address;
		 Count : in Int;
		 Text_Prop_Ret : in System.Address) return Int;

    function Xtextpropertytostringlist
		(Text_Prop : in System.Address;
		 List_Ret : in System.Address;
		 Count_Ret : in System.Address) return Int;

    procedure Xfreestringlist (List : in System.Address);

    procedure Xfree (Addr : in System.Address);

    procedure Xsettextproperty (Display_Id : in System.Address;
				Window_Id : in Unsigned_Long;
				Text_Prop : in System.Address;
				Property : in Unsigned_Long);

    function Xgettextproperty (Display_Id : in System.Address;
			       Window_Id : in Unsigned_Long;
			       Text_Prop_Ret : in System.Address;
			       Property : in Unsigned_Long) return Int;

    procedure Xsetwmname (Display_Id : in System.Address;
			  Window_Id : in Unsigned_Long;
			  Text_Prop : in System.Address);

    function Xgetwmname (Display_Id : in System.Address;
			 Window_Id : in Unsigned_Long;
			 Text_Prop_Ret : in System.Address) return Int;

    procedure Xsetwmiconname (Display_Id : in System.Address;
			      Window_Id : in Unsigned_Long;
			      Text_Prop : in System.Address);

    function Xgetwmiconname (Display_Id : in System.Address;
			     Window_Id : in Unsigned_Long;
			     Text_Prop_Ret : in System.Address) return Int;

    function Xallocwmhints return System.Address;

    function Xallocsizehints return System.Address;

    procedure Xsetwmnormalhints (Display_Id : in System.Address;
				 Window_Id : in Unsigned_Long;
				 Hints : in System.Address);

    function Xgetwmnormalhints (Display_Id : in System.Address;
				Window_Id : in Unsigned_Long;
				Hints_Ret : in System.Address;
				Supplied_Ret : in System.Address) return Int;

    procedure Xsetwmsizehints (Display_Id : in System.Address;
			       Window_Id : in Unsigned_Long;
			       Hints : in System.Address;
			       Property : in Unsigned_Long);

    function Xgetwmsizehints (Display_Id : in System.Address;
			      Window_Id : in Unsigned_Long;
			      Hints_Ret : in System.Address;
			      Supplied_Ret : in System.Address;
			      Property : in Unsigned_Long) return Int;

    function Xallocclasshint return System.Address;

    function Xsetwmprotocols (Display_Id : in System.Address;
			      Window_Id : in Unsigned_Long;
			      Protocols : in System.Address;
			      Count : in Int) return Int;

    function Xgetwmprotocols (Display_Id : in System.Address;
			      Window_Id : in Unsigned_Long;
			      Protocols_Ret : in System.Address;
			      Count_Ret : in System.Address) return Int;

    function Xsetwmcolormapwindows (Display_Id : in System.Address;
				    Window_Id : in Unsigned_Long;
				    Color_Map_Win : in System.Address;
				    Count : Int) return Int;

    function Xgetwmcolormapwindows (Display_Id : in System.Address;
				    Window_Id : in Unsigned_Long;
				    Color_Map_Win_Ret : in System.Address;
				    Count_Ret : in System.Address) return Int;

    function Xallociconsize return System.Address;

    procedure Xsetwmproperties (Display_Id : in System.Address;
				Window_Id : in Unsigned_Long;
				Window_Name : in System.Address;
				Icon_Name : in System.Address;
				Argv : in System.Address;
				Argc : in Int;
				Normal_Hints : in System.Address;
				Wm_Hints : in System.Address;
				Class_Hints : in System.Address);

    function Xwmgeometry (Display_Id : in System.Address;
			  Screen_Num : in Int;
			  User_Geom : in System.Address;
			  Def_Geom : in System.Address;
			  Bwidth : Unsigned_Int;
			  Hints : in System.Address;
			  X_Ret : in System.Address;
			  Y_Ret : in System.Address;
			  Width_Ret : in System.Address;
			  Height_Ret : in System.Address;
			  Gravity_Ret : in System.Address) return Int;

    function Xgetcommand (Display_Id : in System.Address;
			  Window_Id : in Unsigned_Long;
			  Text_Prop : in System.Address) return Int;

    procedure Xsetwmclientmachine (Display_Id : in System.Address;
				   Window_Id : in Unsigned_Long;
				   Text_Prop : in System.Address);

    function Xgetwmclientmachine (Display_Id : in System.Address;
				  Window_Id : in Unsigned_Long;
				  Text_Prop_Ret : in System.Address) return Int;

    function Xallocstandardcolormap return System.Address;

    procedure Xsetrgbcolormaps (Display_Id : in System.Address;
				Window_Id : in Unsigned_Long;
				Std_Color_Map : in System.Address;
				Count : in Int;
				Property : in Unsigned_Long);

    function Xgetrgbcolormaps (Display_Id : in System.Address;
			       Window_Id : in Unsigned_Long;
			       Std_Color_Map_Ret : in System.Address;
			       Count_Ret : in System.Address;
			       Property : in Unsigned_Long) return Int;

    pragma Import (C, Xlistdepths, "XListDepths");

    pragma Import (C, Xlistpixmapformats, "XListPixmapFormats");

    pragma Import (C, Xscreennumberofscreen, "XScreenNumberOfScreen");

    pragma Import (C, Xscreenofdisplay, "XScreenOfDisplay");

    pragma Import (C, Xgetgcvalues, "XGetGCValues");

    pragma Import (C, Xrmdestroydatabase, "XrmDestroyDatabase");

    pragma Import (C, Xiconifywindow, "XIconifyWindow");

    pragma Import (C, Xwithdrawwindow, "XWithdrawWindow");

    pragma Import (C, Xreconfigurewmwindow, "XReconfigureWMWindow");

    pragma Import (C, Xstringlisttotextproperty, "XStringListToTextProperty");

    pragma Import (C, Xtextpropertytostringlist, "XTextPropertyToStringList");

    pragma Import (C, Xfreestringlist, "XFreeStringList");

    pragma Import (C, Xfree, "XFree");

    pragma Import (C, Xsettextproperty, "XSetTextProperty");

    pragma Import (C, Xgettextproperty, "XGetTextProperty");

    pragma Import (C, Xsetwmname, "XSetWMName");

    pragma Import (C, Xgetwmname, "XGetWMName");

    pragma Import (C, Xsetwmiconname, "XSetWMIconName");

    pragma Import (C, Xgetwmiconname, "XGetWMIconName");

    pragma Import (C, Xallocwmhints, "XAllocWMHints");

    pragma Import (C, Xallocsizehints, "XAllocSizeHints");

    pragma Import (C, Xsetwmnormalhints, "XSetWMNormalHints");

    pragma Import (C, Xgetwmnormalhints, "XGetWMNormalHints");

    pragma Import (C, Xsetwmsizehints, "XSetWMSizeHints");

    pragma Import (C, Xgetwmsizehints, "XGetWMSizeHints");

    pragma Import (C, Xallocclasshint, "XAllocClassHint");

    pragma Import (C, Xsetwmprotocols, "XSetWMProtocols");

    pragma Import (C, Xgetwmprotocols, "XGetWMProtocols");

    pragma Import (C, Xsetwmcolormapwindows, "XSetWMColormapWindows");

    pragma Import (C, Xgetwmcolormapwindows, "XGetWMColormapWindows");

    pragma Import (C, Xallociconsize, "XAllocIconSize");

    pragma Import (C, Xsetwmproperties, "XSetWMProperties");

    pragma Import (C, Xwmgeometry, "XWMGeometry");

    pragma Import (C, Xgetcommand, "XGetCommand");

    pragma Import (C, Xsetwmclientmachine, "XSetWMClientMachine");

    pragma Import (C, Xgetwmclientmachine, "XGetWMClientMachine");

    pragma Import (C, Xallocstandardcolormap, "XAllocStandardColormap");

    pragma Import (C, Xsetrgbcolormaps, "XSetRGBColormaps");

    pragma Import (C, Xgetrgbcolormaps, "XGetRGBColormaps");

    -- C interface to functions called by check_if_event

--    procedure Lock_Display (Display_Id : in System.Address);
--
--    procedure Unlock_Display (Display_Id : in System.Address);

    function Get_Qfree return System.Address;

    procedure Set_Qfree (Addr : in System.Address);

    pragma Import (C, Lock_Display, "lock_display");

    pragma Import (C, Unlock_Display, "unlock_display");

    pragma Import (C, Get_Qfree, "get_qfree");

    pragma Import (C, Set_Qfree, "set_qfree");
end X_Lib_Interface;

