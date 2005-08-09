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

with System, X_Configuration_Dependent, X_Masks;

use X_Configuration_Dependent, X_Masks;

package X_Lib is
--    subtype X_Id is Unsigned_Long;
--    subtype Drawable is X_Id;
--    subtype Window is X_Id;
--    subtype Pixmap is X_Id;

    type Context is private;

    type Visual is private;

--    type Screen is private;

--    type Display is private;

    type Visual_Id_Type is new Unsigned_Long;

--    Null_Display : constant Display;

    Null_Context : constant Context;

--    Null_Drawable : constant Drawable := 0;
    Copy_Drawable_From_Parent : constant Drawable := 0;
    None : constant Drawable := 0;

--    Null_Window : constant Window := Null_Drawable;
    Pointer_Window : constant Window := Null_Drawable;
    Input_Focus_Window : constant Window := 1;
    Pointer_Root_Window : constant Window := 1;

--    Null_Pixmap : constant Pixmap := Null_Drawable;
    Parent_Relative : constant Pixmap := 0;

    Null_X_Id : constant X_Id := 0;

    function Copy_Visual_From_Parent return Visual;

    type Property_Format_Type is new Unsigned_Long;
    Format_8 : constant Property_Format_Type := 8;
    Format_16 : constant Property_Format_Type := 16;
    Format_32 : constant Property_Format_Type := 32;

    type X_Short_Integer is new Short;
    type X_Integer is new Int;
    type X_Long_Integer is new Long;

    type X_Float is new Flt;
    type X_Long_Float is new Long_Flt;

    function Create_Constant (Value : in X_Long_Integer)
			     return Property_Format_Type;

    subtype X_Mask_Type is Mask_Type;

    Null_X_Mask : constant X_Mask_Type := X_Masks.Null_Mask;

    type Boolean_Array is array (Natural range <>) of Boolean;

    type Bit_Array is array (Natural range <>) of Byte;
    type Bits is access Bit_Array;

    type Byte_Array is array (Natural range <>) of Byte;
    type Bytes is access Byte_Array;

    type Word is new Unsigned_Short;
    type Word_Array is array (Natural range <>) of Word;
    type Words is access Word_Array;

--    type String_Pointer is access String;
--    type String_Pointer_Array is array (Natural range <>) of String_Pointer;
--    type String_List is access String_Pointer_Array;
--    Null_String_Pointer_Array : String_Pointer_Array (1 .. 0);

    type Wide_Character is new Unsigned_Long;
    type Wide_Character_Pointer is access Wide_Character;
    type Wide_Character_Array is array (Natural range <>) of Wide_Character;
    type Wide_Character_List is access Wide_Character_Array;
    Null_Wide_Character_Array : Wide_Character_Array (1 .. 0);

--    --subtype X_Pointer is String_List;
--    subtype X_Pointer is System.Address;

    type Long_Array is array (Natural range <>) of X_Long_Integer;
    type Long_Array_Ptr is access Long_Array;

    subtype X_Character is Card8;

    type Char_Array is array (Natural range <>) of Char;
    type Char_List is access Char_Array;
    Null_Char_Array : Char_Array (1 .. 0);

    type String_8 is array (Positive range <>) of X_Character;
    type String_Pointer_8 is access String_8;
    Null_String_8 : String_8 (1 .. 0);

--    type Time is new Unsigned_Long;

--    type Angle is new Int;

--    type Pixel is new Int;
    type Pixel_Ptr is access Pixel;
    type U_Pixel is new Unsigned_Long;
    type Width_Height is new Unsigned_Int;

    type Millimeters is new Short;

    subtype Coordinate is Pixel;

    subtype Depth_Type is Unsigned_Long;

    -- new for R4; X_List_Depths
    type Depth_Array is array (Natural range <>) of Depth_Type;
    type Depth_List is access Depth_Array;
    Null_Depth_Array : Depth_Array (1 .. 0);

--    type Screen_Number is new Int;
--
--    type Segment is
--	record
--	    X_1, Y_1 : Coordinate := 0;
--	    X_2, Y_2 : Coordinate := 0;
--	end record;
--    type Segment_Array is array (Natural range <>) of Segment;
--    Null_Segment_Array : Segment_Array (1 .. 0);
--
--    type Point is
--	record
--	    X, Y : Coordinate := 0;
--	end record;
--    type Point_Array is array (Natural range <>) of Point;
--    Null_Point_Array : Point_Array (1 .. 0);
--
--    type Rectangle is
--	record
--	    X, Y : Millimeters := 0;
--	    Width, Height : Word := 0;
--	end record;
--
--    for Rectangle use
--	record
--	    X at 0 * X_Configuration_Dependent.Word_Size range 0 .. 15;
--	    Y at 0 * X_Configuration_Dependent.Word_Size range 16 .. 31;
--	    Width at 1 * X_Configuration_Dependent.Word_Size range 0 .. 15;
--	    Height at 1 * X_Configuration_Dependent.Word_Size range 16 .. 31;
--	end record;
--
--    type Rectangle_Ptr is access Rectangle;
--    type Rectangle_Array is array (Natural range <>) of Rectangle;
--    type Rectangle_List is access Rectangle_Array;
--    Null_Rectangle_Array : Rectangle_Array (1 .. 0);
--
--    type Arc is
--	record
--	    X, Y : Millimeters := 0;
--	    Width : Word := 0;
--	    Height : Word := 0;
--	    Angle_1 : Millimeters := 0;
--	    Angle_2 : Millimeters := 0;
--	end record;
--    type Arc_Array is array (Natural range <>) of Arc;
--    Null_Arc_Array : Arc_Array (1 .. 0);

    type Plane_Mask is new X_Mask_Type;
    All_Planes : constant Plane_Mask := Plane_Mask (not Null_X_Mask);
    type Plane_Mask_Array is array (Natural range <>) of Plane_Mask;
    Null_Plane_Mask_Array : Plane_Mask_Array (1 .. 0);

    type Depth_Record is
	record
	    Depth : Depth_Type;
	    Number_Of_Visuals : Natural;
	    Visuals : Visual;
	end record;

    type Pixmap_Format is private;
    Xy_Bitmap : constant Pixmap_Format;
    Xy_Pixmap : constant Pixmap_Format;
    Z_Pixmap : constant Pixmap_Format;
    function Create_Constant (Value : in X_Long_Integer) return Pixmap_Format;

    type Order_Type is private;
    Lsb_First : constant Order_Type;
    Msb_First : constant Order_Type;
    function Create_Constant (Value : in X_Long_Integer) return Order_Type;

    type Backing_Store_Type is private;
    Not_Useful : constant Backing_Store_Type;
    When_Mapped : constant Backing_Store_Type;
    Always : constant Backing_Store_Type;
    function Create_Constant (Value : in X_Long_Integer)
			     return Backing_Store_Type;

    type Stack_Mode_Type is private;
    Above : constant Stack_Mode_Type;
    Below : constant Stack_Mode_Type;
    Top_If : constant Stack_Mode_Type;
    Bottom_If : constant Stack_Mode_Type;
    Opposite : constant Stack_Mode_Type;
    function Create_Constant (Value : in X_Long_Integer) return Stack_Mode_Type;

    type Map_Status is private;
    Success : constant Map_Status;
    Busy : constant Map_Status;
    Failed : constant Map_Status;
    function Create_Constant (Value : in X_Long_Integer) return Map_Status;

    subtype X_Address is System.Address;
    Null_Address : X_Address renames X_Configuration_Dependent.Zero_Address;

    type Ext_Data is
	record
	    Number : X_Integer;
	    Next : X_Address;
	    Free_Private : X_Address;
	    Private_Data : String_Pointer;
	end record;

    for Ext_Data use
	record
	    Number at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Next at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Free_Private at 2 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    Private_Data at 3 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	end record;

    type Ext_Data_Ptr is access Ext_Data;
    type Ext_Data_Array is array (Natural range <>) of Ext_Data;
    type Ext_Data_List is access Ext_Data_Array;

    type Ext_Codes is
	record
	    Extension, Major_Opcode, First_Event, First_Error : X_Integer;
	end record;

    for Ext_Codes use
	record
	    Extension at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Major_Opcode at 1 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    First_Event at 2 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	    First_Error at 3 * X_Configuration_Dependent.Word_Size
	       range 0 .. 31;
	end record;

    type Ext_Codes_Ptr is access Ext_Codes;

    type Ext_Box is
	record
	    X1, X2, Y1, Y2 : X_Short_Integer;
	end record;

    for Ext_Box use
	record
	    X1 at 0 * X_Configuration_Dependent.Word_Size range 0 .. 15;
	    X2 at 0 * X_Configuration_Dependent.Word_Size range 16 .. 31;
	    Y1 at 1 * X_Configuration_Dependent.Word_Size range 0 .. 15;
	    Y2 at 1 * X_Configuration_Dependent.Word_Size range 16 .. 31;
	end record;

    type Ext_Box_Ptr is access Ext_Box;

    type Ext_Region is
	record
	    Size : X_Long_Integer;
	    Num_Rects : X_Long_Integer;
	    Rects : Ext_Box_Ptr;
	    Extents : Ext_Box;
	end record;

    for Ext_Region use
	record
	    Size at 0 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Num_Rects at 1 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Rects at 2 * X_Configuration_Dependent.Word_Size range 0 .. 31;
	    Extents at 3 * X_Configuration_Dependent.Word_Size range 0 .. 63;
	end record;

-- typedef union { Display *display;
--              GC gc;
--              Visual *visual;
--              Screen *screen;
--              ScreenFormat *pixmap_format;
--              XFontStruct *font; } XEDataObject;

    -- Associative lookup table return codes

    X_C_Success : constant := 0;    -- No error.
    X_C_Nomem : constant := 1;    -- Out of memory
    X_C_Noent : constant := 2;    -- No entry in table

    subtype X_Context is Int;

    subtype X_Font_Set is X_Address;

    type Xmb_Text_Item is
	record
	    Chars : String_Pointer;
	    N_Chars : X_Integer;
	    Deltas : X_Integer;
	    Font_Set : X_Font_Set;
	end record;

    for Xmb_Text_Item use
	record
	    Chars at 0 * Word_Size range 0 .. 31;
	    N_Chars at 1 * Word_Size range 0 .. 31;
	    Deltas at 2 * Word_Size range 0 .. 31;
	    Font_Set at 3 * Word_Size range 0 .. 31;
	end record;

    type Xmb_Text_Item_Array is array (Natural range <>) of Xmb_Text_Item;
    type Xmb_Text_Item_List is access Xmb_Text_Item_Array;

    type Xwc_Text_Item is
	record
	    Chars : Wide_Character_Pointer;
	    N_Chars : X_Integer;
	    Deltas : X_Integer;
	    Font_Set : X_Font_Set;
	end record;

    for Xwc_Text_Item use
	record
	    Chars at 0 * Word_Size range 0 .. 31;
	    N_Chars at 1 * Word_Size range 0 .. 31;
	    Deltas at 2 * Word_Size range 0 .. 31;
	    Font_Set at 3 * Word_Size range 0 .. 31;
	end record;

    type Xwc_Text_Item_Array is array (Natural range <>) of Xwc_Text_Item;
    type Xwc_Text_Item_List is access Xwc_Text_Item_Array;

    subtype X_Im_Proc is X_Address;
    subtype X_Im is X_Address;
    subtype X_Ic is X_Address;

    type X_Im_Style is new Unsigned_Long;

    type X_Im_Styles is
	record
	    Count_Styles : Unsigned_Short;
	    Supported_Styles : X_Im_Style;
	end record;

    for X_Im_Styles use
	record
	    Count_Styles at 0 range 0 .. 15;
	    Supported_Styles at 0 range 32 .. 63;
	end record;

    type Im_Style_Type is private;
    X_Im_Preedit_Area : constant Im_Style_Type;
    X_Im_Preedit_Callbacks : constant Im_Style_Type;
    X_Im_Preedit_Position : constant Im_Style_Type;
    X_Im_Preedit_Nothing : constant Im_Style_Type;
    X_Im_Preedit_None : constant Im_Style_Type;
    X_Im_Status_Area : constant Im_Style_Type;
    X_Im_Status_Callbacks : constant Im_Style_Type;
    X_Im_Status_Nothing : constant Im_Style_Type;
    X_Im_Status_None : constant Im_Style_Type;

    X_N_Va_Nested_List : constant String := "XNVaNestedList" & Ascii.Nul;
    X_N_Query_Input_Style : constant String := "queryInputStyle" & Ascii.Nul;
    X_N_Client_Window : constant String := "clientWindow" & Ascii.Nul;
    X_N_Input_Style : constant String := "inputStyle" & Ascii.Nul;
    X_N_Focus_Window : constant String := "focusWindow" & Ascii.Nul;
    X_N_Resource_Name : constant String := "resourceName" & Ascii.Nul;
    X_N_Resource_Class : constant String := "resourceClass" & Ascii.Nul;
    X_N_Geometry_Callback : constant String := "geometryCallback" & Ascii.Nul;
    X_N_Filter_Events : constant String := "filterEvents" & Ascii.Nul;
    X_N_Preedit_Start_Callback : constant String :=
       "preeditStartCallback" & Ascii.Nul;
    X_N_Preedit_Done_Callback : constant String :=
       "preeditDoneCallback" & Ascii.Nul;
    X_N_Preedit_Draw_Callback : constant String :=
       "preeditDrawCallback" & Ascii.Nul;
    X_N_Preedit_Caret_Callback : constant String :=
       "preeditCaretCallback" & Ascii.Nul;
    X_N_Preedit_Attributes : constant String := "preeditAttributes" & Ascii.Nul;
    X_N_Status_Start_Callback : constant String :=
       "statusStartCallback" & Ascii.Nul;
    X_N_Status_Done_Callback : constant String :=
       "statusDoneCallback" & Ascii.Nul;
    X_N_Status_Draw_Callback : constant String :=
       "statusDrawCallback" & Ascii.Nul;
    X_N_Status_Attributes : constant String := "statusAttributes" & Ascii.Nul;
    X_N_Area : constant String := "area" & Ascii.Nul;
    X_N_Area_Needed : constant String := "areaNeeded" & Ascii.Nul;
    X_N_Spot_Location : constant String := "spotLocation" & Ascii.Nul;
    X_N_Colormap : constant String := "colorMap" & Ascii.Nul;
    X_N_Std_Colormap : constant String := "stdColorMap" & Ascii.Nul;
    X_N_Foreground : constant String := "foreground" & Ascii.Nul;
    X_N_Background : constant String := "background" & Ascii.Nul;
    X_N_Background_Pixmap : constant String := "backgroundPixmap" & Ascii.Nul;
    X_N_Font_Set : constant String := "fontSet" & Ascii.Nul;
    X_N_Line_Space : constant String := "lineSpace" & Ascii.Nul;
    X_N_Cursor : constant String := "cursor" & Ascii.Nul;

    type Im_Feedback_Type is private;
    X_Im_Reverse : constant Im_Feedback_Type;
    X_Im_Underline : constant Im_Feedback_Type;
    X_Im_Highlight : constant Im_Feedback_Type;
    X_Im_Primary : constant Im_Feedback_Type;
    X_Im_Secondary : constant Im_Feedback_Type;
    X_Im_Tertiary : constant Im_Feedback_Type;


    subtype X_Va_Nested_List is X_Pointer;

    type X_Im_Style_Type is access Im_Style_Type;

    type X_Im_Callback is
	record
	    Client_Data : X_Pointer;
	    Callback : X_Im_Proc;
	end record;

    for X_Im_Callback use
	record
	    Client_Data at 0 * Word_Size range 0 .. 31;
	    Callback at 1 * Word_Size range 0 .. 31;
	end record;

    type X_Im_Feedback_Type is access Im_Feedback_Type;

    type String_Type is (X_String_8, X_String_32);
    for String_Type'Size use Int'Size;
    for String_Type use (X_String_8 => 0, X_String_32 => 1);

    type X_Im_Text (Kind : String_Type := X_String_8) is
	record
	    Length : Unsigned_Short;
	    Feedback : Im_Feedback_Type;
	    Encoding_Is_Wchar : Bool;
	    case Kind is
		when X_String_8 =>
		    Multi_Byte : String_Pointer;
		when X_String_32 =>
		    Wide_Char : Wide_Character_Pointer;
	    end case;
	end record;
    type X_Im_Text_Ptr is access X_Im_Text;

    type X_Im_Preedit_Draw_Callback_Rec is
	record
	    Caret : X_Integer;
	    Chg_First : X_Integer;
	    Chg_Length : X_Integer;
	    Text : X_Im_Text_Ptr;
	end record;

    for X_Im_Preedit_Draw_Callback_Rec use
	record
	    Caret at 0 * Word_Size range 0 .. 31;
	    Chg_First at 1 * Word_Size range 0 .. 31;
	    Chg_Length at 2 * Word_Size range 0 .. 31;
	    Text at 3 * Word_Size range 0 .. 31;
	end record;

    type X_Im_Caret_Direction is (X_Im_Forward_Char, X_Im_Backward_Char,
				  X_Im_Forward_Word, X_Im_Backward_Word,
				  X_Im_Caret_Up, X_Im_Caret_Down,
				  X_Im_Next_Line, X_Im_Previous_Line,
				  X_Im_Line_Start, X_Im_Line_End,
				  X_Im_Absolute_Position, X_Im_Dont_Change);
    for X_Im_Caret_Direction'Size use Int'Size;

    type X_Im_Caret_Style is
       (X_Im_Is_Invisible, X_Im_Is_Primary, X_Im_Is_Secondary);
    for X_Im_Caret_Style'Size use Int'Size;

    type X_Im_Preedit_Caret_Callback_Rec is
	record
	    Position : X_Integer;
	    Direction : X_Im_Caret_Direction;
	    Style : X_Im_Caret_Style;
	end record;

    for X_Im_Preedit_Caret_Callback_Rec use
	record
	    Position at 0 * Word_Size range 0 .. 31;
	    Direction at 1 * Word_Size range 0 .. 31;
	    Style at 2 * Word_Size range 0 .. 31;
	end record;

    type X_Im_Status_Data_Type is (X_Im_Text_Type, X_Im_Bitmap_Type);
    for X_Im_Status_Data_Type'Size use Int'Size;

    type X_Im_Status_Draw_Callback_Rec
	    (Kind : X_Im_Status_Data_Type := X_Im_Text_Type) is
	record
	    Types : X_Im_Status_Data_Type;
	    case Kind is
		when X_Im_Text_Type =>
		    Text : X_Im_Text_Ptr;
		when X_Im_Bitmap_Type =>
		    Bitmap : Pixmap;
	    end case;
	end record;

    package Atoms is
--	type Atom is new Unsigned_Long;
--	type Atom_Array is array (Natural range <>) of Atom;
	type Atom_List is access Atom_Array;
	Null_Atom_Array : Atom_Array (1 .. 0);
	Null_Atom : constant Atom := 0;

	--
	-- Predefined Standard Properties
	--
	Any_Property_Type : constant Atom := 0;
	Xa_Primary : constant Atom := 1;
	Xa_Secondary : constant Atom := 2;
	Xa_Arc : constant Atom := 3;
	Xa_Atom : constant Atom := 4;
	Xa_Bitmap : constant Atom := 5;
	Xa_Cardinal : constant Atom := 6;
	Xa_Colormap : constant Atom := 7;
	Xa_Cursor : constant Atom := 8;
	Xa_Cut_Buffer_0 : constant Atom := 9;
	Xa_Cut_Buffer_1 : constant Atom := 10;
	Xa_Cut_Buffer_2 : constant Atom := 11;
	Xa_Cut_Buffer_3 : constant Atom := 12;
	Xa_Cut_Buffer_4 : constant Atom := 13;
	Xa_Cut_Buffer_5 : constant Atom := 14;
	Xa_Cut_Buffer_6 : constant Atom := 15;
	Xa_Cut_Buffer_7 : constant Atom := 16;
	Xa_Drawable : constant Atom := 17;
	Xa_Font : constant Atom := 18;
	Xa_Integer : constant Atom := 19;
	Xa_Pixmap : constant Atom := 20;
	Xa_Point : constant Atom := 21;
	Xa_Rectangle : constant Atom := 22;
	Xa_Resource_Manager : constant Atom := 23;
	Xa_Rgb_Color_Map : constant Atom := 24;
	Xa_Rgb_Best_Map : constant Atom := 25;
	Xa_Rgb_Blue_Map : constant Atom := 26;
	Xa_Rgb_Default_Map : constant Atom := 27;
	Xa_Rgb_Gray_Map : constant Atom := 28;
	Xa_Rgb_Green_Map : constant Atom := 29;
	Xa_Rgb_Red_Map : constant Atom := 30;
	Xa_String : constant Atom := 31;
	Xa_Visual_Id : constant Atom := 32;
	Xa_Window : constant Atom := 33;

	--
	-- Window Manager Standard Properties
	--

	Xa_Wm_Command : constant Atom := 34;
	Xa_Wm_Hints : constant Atom := 35;
	Xa_Wm_Client_Machine : constant Atom := 36;
	Xa_Wm_Icon_Name : constant Atom := 37;
	Xa_Wm_Icon_Size : constant Atom := 38;
	Xa_Wm_Name : constant Atom := 39;
	Xa_Wm_Normal_Hints : constant Atom := 40;
	Xa_Wm_Size_Hints : constant Atom := 41;
	Xa_Wm_Zoom_Hints : constant Atom := 42;
	Xa_Wm_Class : constant Atom := 67;
	Xa_Wm_Transient_Height : constant Atom := 68;

	--
	-- Standard Font Properties
	--

	Xa_Min_Space : constant Atom := 43;
	Xa_Norm_Space : constant Atom := 44;
	Xa_Max_Space : constant Atom := 45;
	Xa_End_Space : constant Atom := 46;
	Xa_Superscript_X : constant Atom := 47;
	Xa_Superscript_Y : constant Atom := 48;
	Xa_Subscript_X : constant Atom := 49;
	Xa_Subscript_Y : constant Atom := 50;
	Xa_Underline_Position : constant Atom := 51;
	Xa_Underline_Thickness : constant Atom := 52;
	Xa_Strikeout_Ascent : constant Atom := 53;
	Xa_Strikeout_Descent : constant Atom := 54;
	Xa_Italic_Angle : constant Atom := 55;
	Xa_X_Height : constant Atom := 56;
	Xa_Quad_Width : constant Atom := 57;
	Xa_Weight : constant Atom := 58;
	Xa_Point_Size : constant Atom := 59;
	Xa_Resolution : constant Atom := 60;
	Xa_Copyright : constant Atom := 61;
	Xa_Notice : constant Atom := 62;
	Xa_Font_Name : constant Atom := 63;
	Xa_Family_Name : constant Atom := 64;
	Xa_Full_Name : constant Atom := 65;
	Xa_Cap_Height : constant Atom := 66;

	Xa_Last_Predefined : constant Atom := Xa_Wm_Transient_Height;

--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Intern_Atom
--	--
--	--  Description
--	--
--	--    This function returns an atom for a specified name.
--	--
--	--  Parameters
--	--
--	--  Display_Id     : Specifies the connection to the X Server.
--	--  Atom_Name      : Specifies the name associated with the atom.
--	--  Only_If_Exists : Specifies that the atom be returned if it exists.
--	--
--	--  Documentation
--	--
--	--    Please refer to XInternAtom in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Atoms
--	--======================================================================
--
--	function X_Intern_Atom
--		    (Display_Id : in Display;
--		     Atom_Name : in String;
--		     Only_If_Exists : in Boolean := True) return Atom;
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Get_Atom_Name
--	--
--	--  Description
--	--
--	--    This function returns the name for the specified atom.
--	--
--	--  Parameters
--	--
--	--  Display_Id     : Specifies the connection to the X Server.
--	--  Atom_Id        : Specifies the Atom.
--	--
--	--  Documentation
--	--
--	--    Please refer to XGetAtomName in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Atoms
--	--======================================================================
--
--	function X_Get_Atom_Name
--		    (Display_Id : in Display; Atom_Id : in Atom) return String;
    end Atoms;

    package Fonts is
	type Font is private;
	type X_Font_Ptr is private;

	Null_Font : constant Font;

	type Font_Direction is private;
	Left_To_Right : constant Font_Direction;
	Right_To_Left : constant Font_Direction;
	function Create_Constant
		    (Value : in X_Long_Integer) return Font_Direction;

	type Character_Record is
	    record
		Left_Bearing : Millimeters;
		Right_Bearing : Millimeters;
		Width : Millimeters;
		Ascent : Millimeters;
		Descent : Millimeters;
		Attributes : Word;
	    end record;
	type Character_Array is array (Natural range <>) of Character_Record;
	type Character_List is access Character_Array;
	Null_Character_Array : Character_Array (1 .. 0);

	type Font_Property_Record is
	    record
		Name : Atoms.Atom;
		Card_32 : Unsigned_Long;
	    end record;
	type Font_Property_Array is
	   array (Natural range <>) of Font_Property_Record;
	type Font_Property_List is access Font_Property_Array;

	type Font_Record is
	    record
		Ext_Data : X_Address;
		Font_Id : Font;
		Direction : Font_Direction;
		First_Char : X_Character;
		Last_Char : X_Character;
		First_Row : X_Character;
		Last_Row : X_Character;
		All_Exist : Boolean;
		Default_Char : X_Character;
		Properties : Font_Property_List;
		Min_Bounds : Character_Record;
		Max_Bounds : Character_Record;
		Per_Char : Character_List;
		Ascent : Pixel;
		Descent : Pixel;
	    end record;
	type Font_Record_Pointer is access Font_Record;

	type Font_Record_Array is array (Natural range <>) of Font_Record;
	type Font_Record_List is access Font_Record_Array;

	type Character_2B is
	    record
		Byte_1 : Byte;
		Byte_2 : Byte;
	    end record;
	type String_16 is array (Natural range <>) of Character_2B;
	type String_Pointer_16 is access String_16;
	Null_String_16 : String_16 (1 .. 0);

	type Font_Set_Extents is
	    record
		Max_Ink_Extent : Rectangle;
		Max_Logical_Extent : Rectangle;
	    end record;

	for Font_Set_Extents use
	    record
		Max_Ink_Extent at 0 * Word_Size range 0 .. 63;
		Max_Logical_Extent at 2 * Word_Size range 0 .. 63;
	    end record;

	type Font_Set_Extents_Ptr is access Font_Set_Extents;

	type Text_Item is
	    record
		Characters : String_Pointer;
		String_Delta : Pixel;
		Font_Id : Fonts.Font;
	    end record;
	type Text_Item_Array is array (Natural range <>) of Text_Item;
	type Text_Item_List is access Text_Item_Array;

	type Text_Item_8 is
	    record
		Characters : String_Pointer_8;
		String_Delta : Pixel;
		Font_Id : Fonts.Font;
	    end record;
	type Text_Item_8_Array is array (Natural range <>) of Text_Item_8;
	type Text_Item_8_List is access Text_Item_8_Array;

	type Text_Item_16 is
	    record
		Characters : Fonts.String_Pointer_16;
		String_Delta : Pixel;
		Font_Id : Fonts.Font;
	    end record;
	type Text_Item_16_Array is array (Natural range <>) of Text_Item_16;
	type Text_Item_16_List is access Text_Item_16_Array;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Load_Font
	--
	--  Description
	--
	--     This function loads the specified font and returns its associated
	--  ID.  When the font is no longer needed, the client should call
	--  X_unload_font.
	--
	--  Parameters
	--
	--  Display_Id : The X Server connection.
	--  Font_Name  : The name of the font.
	--
	--  Documentation
	--
	--    Please refer to XLoadFont in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Atoms
	--======================================================================

	function X_Load_Font (Display_Id : in Display; Font_Name : in String)
			     return Font;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Query_Font
	--
	--  Description
	--
	--    This subroutine returns the Font_Record, which contains information
	--  associated with the font. Use Free_Font_Info to free thisstructure
	--
	--  Parameters
	--
	--  Display_Id : The X Server connection.
	--  Font_Id    : The associated Id.
	--  Font_Info  : Associated font information.
	--
	--  Documentation
	--
	--    Please refer to XQueryFont in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	function X_Query_Font (Display_Id : in Display; Font_Id : in Font)
			      return Font_Record;

	function X_Query_Font (Display_Id : in Display; Font_Id : in Font)
			      return X_Font_Ptr;

	--======================================================================
	--  Subprogram Name
	--
	--    X_List_Fonts_With_Info
	--
	--  Description
	--
	--    This subroutine returns a list of names of fonts that match the
	--  specified pattern and their associated font information. The list of
	--  names is limited to the length of the Names_List. The information
	--  returned for each font is identical to what X_Load_Query_Font would
	--  return, except that per-character metrics are not returned. Note that
	--  Names_List and Font_Info_List are dynamic. Use 'LENGTH to determine
	--  the length of the returned lists.
	--
	--  Use Free_Font_Names to free the Names_List.
	--  Use Free_Font_Info to free the Font_Info_List.
	--
	--  Parameters
	--
	--  Display_Id   : The X Server connection.
	--  Pattern      : Specifies the string associated with the font names
	--                 that are returned.
	--  Font_Info_List : The list of font records returned, one for each name
	--                   found.
	--  Names_List     : The list of names found matching the pattern.
	--
	--  Documentation
	--
	--    Please refer to XListFontsWithInfo in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_List_Fonts_With_Info
		     (Display_Id : in Display;
		      Pattern : in String;
		      Font_Info_List : in out Font_Record_List;
		      Names_List : in out String_List);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Free_Font_Info
	--
	--  Description
	--
	--    This subroutine frees the Font_Info_List allocated in the previous
	--  call.
	--
	--  Note : using Unchecked_Deallocation to free this list will have
	--         unpredictable results.
	--
	--  Parameters
	--
	--  Display_Id     : The X Server connection.
	--  Font_Info_List : The list to be freed.
	--
	--  Documentation
	--
	--    Please refer to XFreeFontInfo in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Free_Font_Info (Names_List : in out String_List;
				    Font_Info_List : in out Font_Record_List);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Load_Query_Font
	--
	--  Description
	--
	--    This function loads a font and returns its associated font
	--  information in a single call.
	--
	--  Parameters
	--
	--  Display_Id : The X Server connection.
	--  Font_Name  : The name of the font.
	--
	--  Documentation
	--
	--    Please refer to XLoadQueryFont in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	function X_Load_Query_Font
		    (Display_Id : in Display; Font_Name : in String)
		    return Font_Record;

	function X_Load_Query_Font
		    (Display_Id : in Display; Font_Name : in String)
		    return X_Font_Ptr;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Free_Font
	--
	--  Description
	--
	--    This subroutine deletes the association between the font id and the
	--  specified font. The font itself will be freed when no other resource
	--  references it. The data and font should not be referenced again.
	--
	--  Parameters
	--
	--  Display_Id : The X Server connection.
	--  Font_Info  : The associated font information.
	--
	--  Documentation
	--
	--    Please refer to XFreeFont in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Free_Font (Display_Id : in Display;
			       Font_Info : in out Font_Record);

	procedure X_Free_Font (Display_Id : in Display;
			       Font_Info : in out X_Font_Ptr);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Font_Property
	--
	--  Description
	--
	--    This subroutine returns the value of the specified font property,
	--  if Defined. The set of predefined font properties are in the package
	--  Atoms.
	--
	--  Parameters
	--
	--  Font_Id    : The associated Id.
	--  Property   : The specified property.
	--  Value      : The value of that property.
	--  Defined    : True if the property is defined.
	--
	--  Documentation
	--
	--    Please refer to XGetFontProperty in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Get_Font_Property (Font_Info : in Font_Record;
				       Property : in Atoms.Atom;
				       Value : out X_Long_Integer;
				       Defined : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Unload_Font
	--
	--  Description
	--
	--    This subroutine unloads a font loaded with Load_Font.
	--
	--  Parameters
	--
	--  Display_Id : The X Server connection.
	--  Font_Id    : The associated Id.
	--
	--  Documentation
	--
	--    Please refer to XUnloadFont in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Unload_Font (Display_Id : in Display; Font_Id : in Font);

	--======================================================================
	--  Subprogram Name
	--
	--    X_List_Fonts
	--
	--  Description
	--
	--    This function returns a list of font names that match the string
	--  passed as the pattern argument. The length of the list passed
	--  determines the maximum number returned. The length of the returned
	--  list is the actual number found.
	--
	--  Parameters
	--
	--  Display_Id : The X Server connection.
	--  Pattern    : The name(s) to be searched.
	--
	--  Documentation
	--
	--    Please refer to XListFonts in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_List_Fonts (Display_Id : in Display;
				Pattern : in String;
				Names : in out String_List);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Free_Font_Names
	--
	--  Description
	--
	--    This subroutine frees a font name list. Use this instead of
	--  unchecked deallocation.
	--
	--  Parameters
	--
	--  Display_Id : The X Server connection.
	--  Directories: The list to free.
	--
	--  Documentation
	--
	--    Please refer to XFreeFontNames in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Free_Font_Names (Display_Id : in Display;
				     Directories : in out String_List);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Font_Path
	--
	--  Description
	--
	--    This procedure specifies the directory search path for font lookup.
	--  There is only one search path per X Server, not per client. The
	--  interpretation of search strings is operating system dependent, but
	--  they are intended to specify directories to be searched in the order
	--  listed.
	--
	--  Parameters
	--
	--  Display_Id  : The X Server connection.
	--  Directories : The list of directories.
	--
	--  Documentation
	--
	--    Please refer to XSetFontPath in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Set_Font_Path (Display_Id : in Display;
				   Directories : in String_List);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Font_Path
	--
	--  Description
	--
	--    This function returns the directory search path for the X Server.
	--
	--  Parameters
	--
	--  Display_Id  : The X Server connection.
	--
	--  Documentation
	--
	--    Please refer to XGetFontPath in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	function X_Get_Font_Path (Display_Id : in Display) return String_List;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Free_Font_Path
	--
	--  Description
	--
	--    This procedure frees the Directories List.
	--
	--  Parameters
	--
	--  Directories : The list of directories to be freed.
	--
	--  Documentation
	--
	--    Please refer to XFreeFontPath in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Free_Font_Path (Directories : in out String_List);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Text_Width
	--
	--  Description
	--
	--    This function returns the width in pixels of an ASCII string.
	--
	--  Parameters
	--
	--  Font_Info  : The font information used for the computation.
	--  Text       : The ASCII Character string.
	--
	--  Documentation
	--
	--    Please refer to XTextWidth in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	function X_Text_Width
		    (Font_Info : in Font_Record; Text : in String) return Pixel;

	function X_Text_Width
		    (Font_Info : in X_Font_Ptr; Text : in String) return Pixel;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Text_Width
	--
	--  Description
	--
	--    This function returns the width in pixels of an X_Character string.
	--
	--  Parameters
	--
	--  Font_Info  : The font information used for the computation.
	--  Text       : The X_Character string.
	--
	--  Documentation
	--
	--    Please refer to XTextWidth in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	function X_Text_Width (Font_Info : in Font_Record; Text : in String_8)
			      return Pixel;

	function X_Text_Width (Font_Info : in X_Font_Ptr; Text : in String_8)
			      return Pixel;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Text_Width_16
	--
	--  Description
	--
	--    This function returns the width in pixels of a Char_2b String_16.
	--
	--  Parameters
	--
	--  Font_Info  : The font information used for the computation.
	--  Text       : The String_16.
	--
	--  Documentation
	--
	--    Please refer to XTextWidth16 in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	function X_Text_Width_16
		    (Font_Info : in Font_Record; Text : in String_16)
		    return Pixel;

	function X_Text_Width_16
		    (Font_Info : in X_Font_Ptr; Text : in String_16)
		    return Pixel;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Text_Extents
	--
	--  Description
	--
	--    This procedure returns the logical extents of the specified string.
	--  The logical extents of a string is the width and height of the
	--  bounding box occupied by the string in the specified font.
	--
	--  Parameters
	--
	--  Font_Info  : The font information used for the computation.
	--  Text       : The ASCII Character string.
	--  Direction  : Returns Font_Left_To_Right or Font_Right_To_Left.
	--  Ascent     : The maximum ascent of all characters in the string.
	--  Descent    : The maximum descent of all characters in the string.
	--  Overall    : The overall size.
	--
	--  Documentation
	--
	--    Please refer to XTextExtents in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Text_Extents (Font_Info : in Font_Record;
				  Text : in String;
				  Direction : out Font_Direction;
				  Ascent : out Pixel;
				  Descent : out Pixel;
				  Overall : out Character_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Text_Extents
	--
	--  Description
	--
	--    This procedure returns the logical extents of the specified string.
	--  The logical extents of a string is the width and height of the
	--  bounding box occupied by the string in the specified font.
	--
	--  Parameters
	--
	--  Font_Info  : The font information used for the computation.
	--  Text       : The X_Character string.
	--  Direction  : Returns Font_Left_To_Right or Font_Right_To_Left.
	--  Ascent     : The maximum ascent of all characters in the string.
	--  Descent    : The maximum descent of all characters in the string.
	--  Overall    : The overall size.
	--
	--  Documentation
	--
	--    Please refer to XTextExtents in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Text_Extents (Font_Info : in Font_Record;
				  Text : in String_8;
				  Direction : out Font_Direction;
				  Ascent : out Pixel;
				  Descent : out Pixel;
				  Overall : out Character_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Text_Extents_16
	--
	--  Description
	--
	--    This procedure returns the logical extents of the specified
	--  String_16.  The logical extents of a string is the width and height
	--  of the bounding box occupied by the string in the specified font.
	--
	--  Parameters
	--
	--  Font_Info  : The font information used for the computation.
	--  Text       : The String_16.
	--  Direction  : Returns Font_Left_To_Right or Font_Right_To_Left.
	--  Ascent     : The maximum ascent of all characters in the string.
	--  Descent    : The maximum descent of all characters in the string.
	--  Overall    : The overall size.
	--
	--  Documentation
	--
	--    Please refer to XTextExtents16 in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Text_Extents_16 (Font_Info : in Font_Record;
				     Text : in String_16;
				     Direction : out Font_Direction;
				     Ascent : out Pixel;
				     Descent : out Pixel;
				     Overall : out Character_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Query_Text_Extents
	--
	--  Description
	--
	--    This procedure returns the logical extents of the specified String.
	--  The logical extents of a string is the width and height of the
	--  bounding box occupied by the string in the specified font.
	--
	--  This function queries the X Server and, therefore suffers the round
	--  trip overhead avoided by Text_Extents.
	--
	--  Parameters
	--
	--  Font_Info  : The font information used for the computation.
	--  Text       : The String.
	--  Direction  : Returns Font_Left_To_Right or Font_Right_To_Left.
	--  Ascent     : The maximum ascent of all characters in the string.
	--  Descent    : The maximum descent of all characters in the string.
	--  Overall    : The overall size.
	--
	--  Documentation
	--
	--    Please refer to XQueryTextExtents in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Query_Text_Extents (Display_Id : in Display;
					Font_Id : in Font;
					Text : in String;
					Direction : out Font_Direction;
					Ascent : out Pixel;
					Descent : out Pixel;
					Overall : out Character_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Query_Text_Extents
	--
	--  Description
	--
	--    This procedure returns the logical extents of the specified
	--  String_8.  The logical extents of a string is the width and height
	--  of the bounding box occupied by the string in the specified font.
	--
	--  This function queries the X Server and, therefore suffers the round
	--  trip overhead avoided by Text_Extents.
	--
	--  Parameters
	--
	--  Font_Info  : The font information used for the computation.
	--  Text       : The X_Character string.
	--  Direction  : Returns Font_Left_To_Right or Font_Right_To_Left.
	--  Ascent     : The maximum ascent of all characters in the string.
	--  Descent    : The maximum descent of all characters in the string.
	--  Overall    : The overall size.
	--
	--  Documentation
	--
	--    Please refer to XQueryTextExtents in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Query_Text_Extents (Display_Id : in Display;
					Font_Id : in Font;
					Text : in String_8;
					Direction : out Font_Direction;
					Ascent : out Pixel;
					Descent : out Pixel;
					Overall : out Character_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Query_Text_Extents_16
	--
	--  Description
	--
	--    This procedure returns the logical extents of the specified
	--  String_16.  The logical extents of a string is the width and height
	--  of the bounding box occupied by the string in the specified font.
	--
	--  This function queries the X Server and, therefore suffers the round
	--  trip overhead avoided by Text_Extents.
	--
	--  Parameters
	--
	--  Font_Info  : The font information used for the computation.
	--  Text       : The String_16.
	--  Direction  : Returns Font_Left_To_Right or Font_Right_To_Left.
	--  Ascent     : The maximum ascent of all characters in the string.
	--  Descent    : The maximum descent of all characters in the string.
	--  Overall    : The overall size.
	--
	--  Documentation
	--
	--    Please refer to XQueryTextExtents16 in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Fonts
	--======================================================================

	procedure X_Query_Text_Extents_16 (Display_Id : in Display;
					   Font_Id : in Font;
					   Text : in String_16;
					   Direction : out Font_Direction;
					   Ascent : out Pixel;
					   Descent : out Pixel;
					   Overall : out Character_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    Set_Font_Values
	--
	--  Description
	--
	--  Parameters
	--
	--  Font_Info  : The font information used for the computation.
	--
	--
	--   This function converts an Ada declared font_record into the form
	--   expected by the C interfaced routine.
	--
	--  Package:      Fonts
	--======================================================================

	function Set_Font_Values (Font_Info : in Font_Record) return X_Font_Ptr;

	function Set_Font_Values (X_Font : in X_Font_Ptr) return Font_Record;

	procedure X_Create_Font_Set (Dpy : in Display;
				     Base_Font_Name_List : in String;
				     Missing_Charset_List : in out String_List;
				     Missing_Charset_Count : out Int;
				     Def_String : in String_List;
				     Ret_Val : out X_Font_Set);

	procedure X_Free_Font_Set (Dpy : in Display; Font_Set : in X_Font_Set);

	function X_Fonts_Of_Font_Set
		    (Font_Set : in X_Font_Set;
		     Font_Struct_List : in Font_Record_List;
		     Font_Name_List : in String_List) return Int;

	function X_Base_Font_Name_List_Of_Font_Set
		    (Font_Set : in X_Font_Set) return String;

	function X_Locale_Of_Font_Set (Font_Set : in X_Font_Set) return String;

	function X_Context_Dependent_Drawing
		    (Font_Set : in X_Font_Set) return Bool;

	function X_Extents_Of_Font_Set
		    (Font_Set : in X_Font_Set) return Font_Set_Extents_Ptr;

    private
	type Font is new X_Id;
	type X_Font_Ptr is new X_Address;

	Null_Font : constant Font := 0;

	type Font_Direction is new Int32;
	Left_To_Right : constant Font_Direction := 0;
	Right_To_Left : constant Font_Direction := 1;
    end Fonts;

    package Graphic_Output is
--	type Graphic_Context is private;
	type Image is private;

	type Resource_Gc is private;

	Image_Context : constant Image;

--	Null_Graphic_Context : constant Graphic_Context;

	type Bitmap_Status_Type is private;
	Bitmap_Success : constant Bitmap_Status_Type;
	Bitmap_Open_Failed : constant Bitmap_Status_Type;
	Bitmap_File_Invalid : constant Bitmap_Status_Type;
	Bitmap_No_Memory : constant Bitmap_Status_Type;
	function Create_Constant (Value : in X_Long_Integer)
				 return Bitmap_Status_Type;

--	type Gx_Function_Code is private;
--	Gx_Clear : constant Gx_Function_Code;
--	Gx_And : constant Gx_Function_Code;
--	Gx_And_Reverse : constant Gx_Function_Code;
--	Gx_Copy : constant Gx_Function_Code;
--	Gx_And_Inverted : constant Gx_Function_Code;
--	Gx_Noop : constant Gx_Function_Code;
--	Gx_Xor : constant Gx_Function_Code;
--	Gx_Or : constant Gx_Function_Code;
--	Gx_Nor : constant Gx_Function_Code;
--	Gx_Equiv : constant Gx_Function_Code;
--	Gx_Invert : constant Gx_Function_Code;
--	Gx_Or_Reverse : constant Gx_Function_Code;
--	Gx_Copy_Inverted : constant Gx_Function_Code;
--	Gx_Or_Inverted : constant Gx_Function_Code;
--	Gx_Nand : constant Gx_Function_Code;
--	Gx_Set : constant Gx_Function_Code;
--	function Create_Constant
--		    (Value : in X_Long_Integer) return Gx_Function_Code;

	type Z_Color_Mask is new X_Mask_Type;
	Null_Z_Color_Mask : constant Z_Color_Mask := Z_Color_Mask (Null_X_Mask);

	-- default values may be machine dependent (e.g., Order_Type fields)
	type Set_Image_Record is
	    record
		Width : Pixel := 0;
		Height : Pixel := 0;
		X_Offset : Pixel := 0;
		Format : Pixmap_Format := Xy_Pixmap;
		Data : Bytes := null;
		Byte_Order : Order_Type := Msb_First;
		Bitmap_Unit : Pixel := 0;
		Bitmap_Bit_Order : Order_Type := Msb_First;
		Bitmap_Pad : Pixel := 0;
		Depth : Depth_Type := 1;
		Bytes_Per_Line : Pixel := 0;
		Bits_Per_Pixel : Pixel := 0;
		Red_Mask : Z_Color_Mask := Null_Z_Color_Mask;
		Green_Mask : Z_Color_Mask := Null_Z_Color_Mask;
		Blue_Mask : Z_Color_Mask := Null_Z_Color_Mask;
		Obdata : X_Address := Null_Address;
	    end record;

	type Line_Style_Type is private;
	Line_Solid : constant Line_Style_Type;
	Line_On_Off_Dash : constant Line_Style_Type;
	Line_Double_Dash : constant Line_Style_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Line_Style_Type;

	type Cap_Style_Type is private;
	Cap_Not_Last : constant Cap_Style_Type;
	Cap_Butt : constant Cap_Style_Type;
	Cap_Round : constant Cap_Style_Type;
	Cap_Projecting : constant Cap_Style_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Cap_Style_Type;

	type Join_Style_Type is private;
	Join_Miter : constant Join_Style_Type;
	Join_Round : constant Join_Style_Type;
	Join_Bevel : constant Join_Style_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Join_Style_Type;

	type Fill_Style_Type is private;
	Fill_Solid : constant Fill_Style_Type;
	Fill_Tiled : constant Fill_Style_Type;
	Fill_Stippled : constant Fill_Style_Type;
	Fill_Opaque_Stippled : constant Fill_Style_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Fill_Style_Type;

	type Fill_Rule_Type is private;
	Even_Odd_Rule : constant Fill_Rule_Type;
	Winding_Rule : constant Fill_Rule_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Fill_Rule_Type;

	type Shape_Class_Type is private;
	Cursor_Shape_Class : constant Shape_Class_Type;
	Tile_Shape_Class : constant Shape_Class_Type;
	Stipple_Shape_Class : constant Shape_Class_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Shape_Class_Type;

	type Ordering_Type is private;
	Unsorted : constant Ordering_Type;
	Y_Sorted : constant Ordering_Type;
	Yx_Sorted : constant Ordering_Type;
	Yx_Banded : constant Ordering_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Ordering_Type;

	type Arc_Mode_Type is private;
	Arc_Chord : constant Arc_Mode_Type;
	Arc_Pie_Slice : constant Arc_Mode_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Arc_Mode_Type;

	type Subwindow_Mode_Type is private;
	Clip_By_Children : constant Subwindow_Mode_Type;
	Include_Inferiors : constant Subwindow_Mode_Type;
	function Create_Constant (Value : in X_Long_Integer)
				 return Subwindow_Mode_Type;

--	type Coordinate_Mode_Type is private;
--	Origin : constant Coordinate_Mode_Type;
--	Previous : constant Coordinate_Mode_Type;
--	function Create_Constant (Value : in X_Long_Integer)
--				 return Coordinate_Mode_Type;
--
--	type Shape_Type is private;
--	Complex : constant Shape_Type;
--	Convex : constant Shape_Type;
--	Nonconvex : constant Shape_Type;
--	function Create_Constant (Value : in X_Long_Integer) return Shape_Type;

--	type Gc_Mask_Type is new X_Mask_Type;
	No_Gc_Mask : constant Gc_Mask_Type := Gc_Mask_Type (Null_X_Mask);
--	Gc_Function : constant Gc_Mask_Type := Create_Constant (2 ** 0);
--	Gc_Plane_Mask : constant Gc_Mask_Type := Create_Constant (2 ** 1);
--	Gc_Foreground : constant Gc_Mask_Type := Create_Constant (2 ** 2);
--	Gc_Background : constant Gc_Mask_Type := Create_Constant (2 ** 3);
--	Gc_Line_Width : constant Gc_Mask_Type := Create_Constant (2 ** 4);
--	Gc_Line_Style : constant Gc_Mask_Type := Create_Constant (2 ** 5);
--	Gc_Cap_Style : constant Gc_Mask_Type := Create_Constant (2 ** 6);
--	Gc_Join_Style : constant Gc_Mask_Type := Create_Constant (2 ** 7);
--	Gc_Fill_Style : constant Gc_Mask_Type := Create_Constant (2 ** 8);
--	Gc_Fill_Rule : constant Gc_Mask_Type := Create_Constant (2 ** 9);
--	Gc_Tile : constant Gc_Mask_Type := Create_Constant (2 ** 10);
--	Gc_Stipple : constant Gc_Mask_Type := Create_Constant (2 ** 11);
--	Gc_Ts_X_Origin : constant Gc_Mask_Type := Create_Constant (2 ** 12);
--	Gc_Ts_Y_Origin : constant Gc_Mask_Type := Create_Constant (2 ** 13);
--	Gc_Font : constant Gc_Mask_Type := Create_Constant (2 ** 14);
--	Gc_Subwindow_Mode : constant Gc_Mask_Type := Create_Constant (2 ** 15);
--	Gc_Graphics_Exposure : constant Gc_Mask_Type :=
--	   Create_Constant (2 ** 16);
--	Gc_Clip_X_Origin : constant Gc_Mask_Type := Create_Constant (2 ** 17);
--	Gc_Clip_Y_Origin : constant Gc_Mask_Type := Create_Constant (2 ** 18);
--	Gc_Clip_Mask : constant Gc_Mask_Type := Create_Constant (2 ** 19);
--	Gc_Dash_Offset : constant Gc_Mask_Type := Create_Constant (2 ** 20);
--	Gc_Dash_List : constant Gc_Mask_Type := Create_Constant (2 ** 21);
--	Gc_Arc_Mode : constant Gc_Mask_Type := Create_Constant (2 ** 22);

	type Gc_Value_Record is
	    record
		Logical_Operation : Gx_Function_Code := Gx_Copy;
		Plane : Plane_Mask := All_Planes;
		Foreground : U_Pixel := 0;
		Background : U_Pixel := 1;
		Line_Width : Pixel := 0;
		Line_Style : Line_Style_Type := Line_Solid;
		Cap_Style : Cap_Style_Type := Cap_Butt;
		Join_Style : Join_Style_Type := Join_Miter;
		Fill_Style : Fill_Style_Type := Fill_Solid;
		Fill_Rule : Fill_Rule_Type := Even_Odd_Rule;
		Arc_Mode : Arc_Mode_Type := Arc_Pie_Slice;
		Tile : Pixmap;
		Stipple : Pixmap;
		Ts_X_Origin : Coordinate := 0;
		Ts_Y_Origin : Coordinate := 0;
		Font_Id : Fonts.Font;
		Subwindow_Mode : Subwindow_Mode_Type := Clip_By_Children;
		Graphics_Exposures : Boolean := True;
		Clip_X_Origin : Coordinate := 0;
		Clip_Y_Origin : Coordinate := 0;
		Clip_Mask : Pixmap;
		Dash_Offset : Pixel := 0;
		Dashes : Char := 4;
	    end record;

	-- new for R4; X_List_Pixmap_Formats
	type Pixmap_Format_Value_Record is
	    record
		Depth : Depth_Type;
		Bits_Per_Pixel : Pixel;
		Scanline_Pad : Pixel;
	    end record;
	type Pixmap_Format_Value_Array is
	   array (Natural range <>) of Pixmap_Format_Value_Record;
	type Pixmap_Format_Value_List is access Pixmap_Format_Value_Array;

	-- new for R4
	procedure X_Get_Gc_Values (Display_Id : in Display;
				   Gc : in Graphic_Context;
				   Value_Mask : in Gc_Mask_Type;
				   Values : in out Gc_Value_Record;
				   Status : out Boolean);

--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Create_GC
--	--
--	--  Description
--	--
--	--    This function creates a graphics context and returns its ID.
--	--  The graphics context can be used with any destination drawable having
--	--  the same root and depth as the specified drawable.
--	--
--	--  Parameters
--	--
--	--  Display_Id  : Specifies the connection to the X Server.
--	--  Drawable_Id : Specifies the drawable.
--	--  Value_Mask  : Specifies which components in the GC_Value_Record are
--	--                to be set. This argument is the bitwise OR of one or
--	--                more of the GC_Mask_Type constants.
--	--  Values      : Specifies the GC_Values_Record.
--	--
--	--  Documentation
--	--
--	--    Please refer to XCreateGC in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	function X_Create_Gc (Display_Id : in Display;
--			      Drawable_Id : in Drawable;
--			      Value_Mask : in Gc_Mask_Type;
--			      Values : in Gc_Value_Record)
--			     return Graphic_Context;
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Copy_GC
--	--
--	--  Description
--	--
--	--    This procedure copies the components specified in Value_Mask from
--	--  the source graphics context to the destination graphics context.
--	--
--	--  Parameters
--	--
--	--  Display_Id : Specifies the connection to the X Server.
--	--  Value_Mask : Specifies which components in the GC_Value_Record are
--	--               to be set. This argument is the bitwise OR of one or
--	--               more of the GC_Mask_Type constants.
--	-- Source      : Specifies the source graphics context.
--	-- Destination : Specifies the destination graphics context.
--	--
--	--  Documentation
--	--
--	--    Please refer to XCopyGC in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Copy_Gc (Display_Id : in Display;
--			     Value_Mask : in Gc_Mask_Type;
--			     Source : in Graphic_Context;
--			     Destination : in Graphic_Context);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Change_GC
	--
	--  Description
	--
	--    This procedure changes the components specified by the Value_Mask
	--  for the specified graphics context. The values argument contains
	--  the values to be set and are the same, as are the restrictions as
	--  for Create_GC.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  GC         : Specifies the graphic context ID.
	--  Value_Mask : Specifies which components in the GC_Value_Record are
	--               to be set. This argument is the bitwise OR of one or
	--               more of the GC_Mask_Type constants.
	--  Values     : Specifies the GC_Values_Record.
	--
	--  Documentation
	--
	--    Please refer to XChangeGC in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Change_Gc (Display_Id : in Display;
			       Gc : in Graphic_Context;
			       Value_Mask : in Gc_Mask_Type;
			       Values : in Gc_Value_Record);

--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Free_GC
--	--
--	--  Description
--	--
--	--    This procedure destroys the specified graphics context as well as
--	--  the shadow copy.
--	--
--	--  Parameters
--	--
--	--  Display_Id : Specifies the connection to the X Server.
--	--  GC         : Returns the graphic context ID.
--	--
--	--  Documentation
--	--
--	--    Please refer to XFreeGC in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Free_Gc (Display_Id : in Display;
--			     Gc : in out Graphic_Context);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_State
	--
	--  Description
	--
	--    This procedure sets the foreground, background, plane and function
	--  components for the specified graphics context.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  GC          : Specifies the graphic context ID.
	--  Foreground  : Specifies the foreground value to set.
	--  Background  : Specifies the background value to set.
	--  GX_Function : Specifies the graphic function to set.
	--  Plane       : Specifies the plane mask to set.
	--
	--  Documentation
	--
	--    Please refer to XSetState in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_State (Display_Id : in Display;
			       Gc : in Graphic_Context;
			       Foreground : in U_Pixel;
			       Background : in U_Pixel;
			       Gx_Function : in Gx_Function_Code;
			       Plane : in Plane_Mask);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Function
	--
	--  Description
	--
	--    This procedure sets the function component  for the specified
	--  graphics context.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  GC          : Specifies the graphic context ID.
	--  GX_Function : Specifies the graphic function to set.
	--
	--  Documentation
	--
	--    Please refer to XSetFunction in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Function (Display_Id : in Display;
				  Gc : in Graphic_Context;
				  Gx_Function : in Gx_Function_Code);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Plane_Mask
	--
	--  Description
	--
	--    This procedure sets the plane component for the specified
	--  graphics context.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  GC          : Specifies the graphic context ID.
	--  Plane       : Specifies the plane mask to set.
	--
	--  Documentation
	--
	--    Please refer to XSetPlaneMask in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Plane_Mask (Display_Id : in Display;
				    Gc : in Graphic_Context;
				    Plane : in Plane_Mask);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Foreground
	--
	--  Description
	--
	--    This procedure sets the foreground component for the specified
	--  graphics context.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  GC          : Specifies the graphic context ID.
	--  Foreground  : Specifies the foreground value to set.
	--
	--
	--  Documentation
	--
	--    Please refer to XSetForeground in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Foreground (Display_Id : in Display;
				    Gc : in Graphic_Context;
				    Foreground : in U_Pixel);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Background
	--
	--  Description
	--
	--    This procedure sets the background component for the specified
	--  graphics context.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  GC          : Specifies the graphic context ID.
	--  Background  : Specifies the background value to set.
	--
	--  Documentation
	--
	--    Please refer to XSetBackground in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Background (Display_Id : in Display;
				    Gc : in Graphic_Context;
				    Background : in U_Pixel);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Line_Attributes
	--
	--  Description
	--
	--    This procedure sets the line drawing components of the
	--  graphic context.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  GC          : Specifies the graphic context ID.
	--  Line_Width  : Specifies the line width to set.
	--  Line_Style  : Specifies the line style to set.
	--  Cap_Style   : Specifies the cap style to set.
	--  Join_Style  : Specifies the join style to set.
	--
	--
	--  Documentation
	--
	--    Please refer to XSetLineAttributes in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Line_Attributes (Display_Id : in Display;
					 Gc : in Graphic_Context;
					 Line_Width : in Width_Height;
					 Line_Style : in Line_Style_Type;
					 Cap_Style : in Cap_Style_Type;
					 Join_Style : in Join_Style_Type);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Dashes
	--
	--  Description
	--
	--    This procedure sets the dash_offset and dash_List in the specified
	--  graphics context for dashed line styles.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  GC          : Specifies the graphic context ID.
	--  Dash_Offset : Specifies phase of the pattern for the dashed line
	--                style you want to set.
	--  Dash_List   : Specifies the dash list for the dashed line style you
	--                want to set.
	--
	--  Documentation
	--
	--    Please refer to XSetDashes in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Dashes (Display_Id : in Display;
				Gc : in Graphic_Context;
				Dash_Offset : in Pixel;
				Dash_List : in Bits);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Fill_Style
	--
	--  Description
	--
	--    This procedure sets the fill style in the specified graphics
	--  context.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  GC          : Specifies the graphic context ID.
	--  Fill_Style  : Specifies the fill style to be set.
	--
	--  Documentation
	--
	--    Please refer to XSetFillStyle in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Fill_Style (Display_Id : in Display;
				    Gc : in Graphic_Context;
				    Fill_Style : in Fill_Style_Type);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Fill_Rule
	--
	--  Description
	--
	--   This procedure sets the fill rule in the specified graphics context.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  GC          : Specifies the graphic context ID.
	--  Fill_Rule   : Specifies either Even_Odd_Rule or Winding_Rule.
	--
	--  Documentation
	--
	--    Please refer to XSetFillRule in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Fill_Rule (Display_Id : in Display;
				   Gc : in Graphic_Context;
				   Fill_Rule : in Fill_Rule_Type);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Query_Best_Size
	--
	--  Description
	--
	--    This procedure returns the best or closest size to the requested
	--  size for the specified shape class.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  Shape_Class  : Specifies Tile_Shape, Cursor_Shape or Stipple_Shape.
	--  Which_Screen : Specifies the drawable on a screen.
	--  Width        : Specifies the requested width.
	--  Height       : Specifies the requested height.
	--  Ret_Width    : Returns the best or closest width.
	--  Ret_Height   : Returns the best or closest height.
	--  Status       : true if returned a closest width and height. False
	--                 if failed.
	--
	--
	--  Documentation
	--
	--    Please refer to XQueryBestSize in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Query_Best_Size (Display_Id : in Display;
				     Shape_Class : in Shape_Class_Type;
				     Which_Screen : in Drawable;
				     Width : in Width_Height;
				     Height : in Width_Height;
				     Ret_Width : out Width_Height;
				     Ret_Height : out Width_Height;
				     Status : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Query_Best_Tile
	--
	--  Description
	--
	--    This procedure returns the best or closest size to the requested
	--  size for tiling.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  Which_Screen : Specifies the drawable on a screen.
	--  Width        : Specifies the requested width.
	--  Height       : Specifies the requested height.
	--  Ret_Width    : Returns the best or closest width.
	--  Ret_Height   : Returns the best or closest height.
	--  Status       : True if closest fit returned.  False if failed.
	--
	--
	--  Documentation
	--
	--    Please refer to XQueryBestTile in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Query_Best_Tile (Display_Id : in Display;
				     Which_Screen : in Drawable;
				     Width : in Width_Height;
				     Height : in Width_Height;
				     Ret_Width : out Width_Height;
				     Ret_Height : out Width_Height;
				     Status : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Query_Best_Stipple
	--
	--  Description
	--
	--    This procedure returns the best or closest size to the requested
	--  size for stippling.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  Which_Screen : Specifies the drawable on a screen.
	--  Width        : Specifies the requested width.
	--  Height       : Specifies the requested height.
	--  Ret_Width    : Returns the best or closest width.
	--  Ret_Height   : Returns the best or closest height.
	--  Status       : True if closest fit found. False if failed.
	--
	--  Documentation
	--
	--    Please refer to XQueryBestStipple in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Query_Best_Stipple (Display_Id : in Display;
					Which_Screen : in Drawable;
					Width : in Width_Height;
					Height : in Width_Height;
					Ret_Width : out Width_Height;
					Ret_Height : out Width_Height;
					Status : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Tile
	--
	--  Description
	--
	--   This procedure sets the fill tile in the specified graphics context.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  GC           : Specifies the graphics context.
	--  Tile         : Specifies the fill tile to set.
	--
	--  Documentation
	--
	--    Please refer to XSetTile in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Tile (Display_Id : in Display;
			      Gc : in Graphic_Context;
			      Tile : in Pixmap);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Stipple
	--
	--  Description
	--
	--    This procedure sets the stipple in the specified graphics context.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  GC           : Specifies the graphics context.
	--  Stipple      : Specifies the stipple to set.
	--
	--  Documentation
	--
	--    Please refer to XSetStipple in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Stipple (Display_Id : in Display;
				 Gc : in Graphic_Context;
				 Stipple : in Pixmap);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Ts_Origin
	--
	--  Description
	--
	--    This procedure sets the tile or stipple origin in the graphics
	--  context.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  GC           : Specifies the graphics context.
	--  Origin       : Specifies the origin of the tile or stipple.
	--
	--  Documentation
	--
	--    Please refer to XSetTsOrigin in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Ts_Origin (Display_Id : in Display;
				   Gc : in Graphic_Context;
				   Ts_X_Origin : in Coordinate;
				   Ts_Y_Origin : in Coordinate);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Font
	--
	--  Description
	--
	--    This procedure sets the current font in the specified graphics
	--  context.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  GC           : Specifies the graphics context.
	--  Font_Id      : Specifies the requested font.
	--
	--  Documentation
	--
	--    Please refer to XSetFont in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Font (Display_Id : in Display;
			      Gc : in Graphic_Context;
			      Font_Id : in Fonts.Font);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Clip_Origin
	--
	--  Description
	--
	--    This procedure sets the clip origin in the specified graphics
	--  context.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  GC           : Specifies the graphics context.
	--  Origin       : Specifies the origin of the tile or stipple.
	--
	--  Documentation
	--
	--    Please refer to XSetClipOrigin in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Clip_Origin (Display_Id : in Display;
				     Gc : in Graphic_Context;
				     Clip_X_Origin : in Coordinate;
				     Clip_Y_Origin : in Coordinate);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Clip_Mask
	--
	--  Description
	--
	--   This procedure sets the Clip_Mask in the specified graphics context.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  GC           : Specifies the graphics context.
	--  Clip_Mask    : Specifies the clip mask.
	--
	--  Documentation
	--
	--    Please refer to XSetClipMask in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Clip_Mask (Display_Id : in Display;
				   Gc : in Graphic_Context;
				   Clip_Mask : in Pixmap);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Clip_Rectangles
	--
	--  Description
	--
	--    This procedure sets the clip mask in the specified graphics context
	--  to the specified list of rectangles.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  GC           : Specifies the graphics context.
	--  Origin       : Specifies the origin of the tile or stipple.
	--  Rectangles   : Specifies the list of rectangles.
	--  Ordering     : Specifies the ordering relations on the rectangles.
	--
	--  Documentation
	--
	--    Please refer to XSetClipRectangles in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Clip_Rectangles (Display_Id : in Display;
					 Gc : in Graphic_Context;
					 Clip_X_Origin : in Coordinate;
					 Clip_Y_Origin : in Coordinate;
					 Rectangles : in Rectangle_Array;
					 Ordering : in Ordering_Type);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Arc_Mode
	--
	--  Description
	--
	--    This procedure sets the arc mode in the specified graphics context.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  GC           : Specifies the graphics context.
	--  Arc_Mode     : Specifies either Arc_Chord or Arc_Pie_Slice.
	--
	--  Documentation
	--
	--    Please refer to XSetArcMode in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Arc_Mode (Display_Id : in Display;
				  Gc : in Graphic_Context;
				  Arc_Mode : in Arc_Mode_Type);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_SubWindow_Mode
	--
	--  Description
	--
	--    This procedure sets the subwindow mode in the specified graphics
	--  context.
	--
	--  Parameters
	--
	--  Display_Id     : Specifies the connection to the X Server.
	--  GC             : Specifies the graphics context.
	--  SubWindow_Mode : Specifies either Clip_By_Children or
	--                   Include_Inferiors.
	--
	--  Documentation
	--
	--    Please refer to XSetSubwindowMode in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Subwindow_Mode
		     (Display_Id : in Display;
		      Gc : in Graphic_Context;
		      Subwindow_Mode : in Subwindow_Mode_Type);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Graphics_Exposures
	--
	--  Description
	--
	--    This procedure sets the graphics_exposures flag in the specified
	--  graphics context.
	--
	--  Parameters
	--
	--  Display_Id         : Specifies the connection to the X Server.
	--  GC                 : Specifies the graphics context.
	--  Graphics_Exposures : Specifies if events are to be reported when
	--                       calling Copy_Area and Copy_Plane.
	--
	--  Documentation
	--
	--    Please refer to XSetGraphicsExposures in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Set_Graphics_Exposures (Display_Id : in Display;
					    Gc : in Graphic_Context;
					    Graphics_Exposures : in Boolean);

--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Clear_Area
--	--
--	--  Description
--	--
--	--    This procedure clears a specified rectangular area in the specified
--	--  window. If either width or height are zero, they are replaced by the
--	--  current width or height of the specified window minus X or y.
--	--
--	--  Parameters
--	--
--	--  Display_Id   : Specifies the connection to the X Server.
--	--  Window_Id    : Specifies the window.
--	--  Bounds       : Specifies the rectangle to clear.
--	--  Exposures    : Specifies that exposure event are to be generated.
--	--
--	--  Documentation
--	--
--	--    Please refer to XClearArea in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Clear_Area (Display_Id : in Display;
--				Window_Id : in Window;
--				X : in Coordinate;
--				Y : in Coordinate;
--				Width : in Width_Height;
--				Height : in Width_Height;
--				Exposures : in Boolean);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Clear_Window
--	--
--	--  Description
--	--
--	--    This procedure clears the entire area in the specified window.
--	--
--	--  Parameters
--	--
--	--  Display_Id   : Specifies the connection to the X Server.
--	--  Window_Id    : Specifies the window.
--	--
--	--  Documentation
--	--
--	--    Please refer to XClearWindow in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Clear_Window
--		     (Display_Id : in Display; Window_Id : in Window);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Copy_Area
--	--
--	--  Description
--	--
--	--    This procedure copies an area of the source drawable to the target
--	--  drawable (pixmap or Window).
--	--
--	--  Parameters
--	--
--	--  Display_Id   : Specifies the connection to the X Server.
--	--  Source       : Specifies the source window or pixmap.
--	--  Destination  : Specifies the source window or pixmap.
--	--  GC           : Specifies the graphics context.
--	--  Source_Area  : Specifies the origin of the source rectangle.
--	--  Dest_Origin  : Specifies the destination origin.
--	--
--	--
--	--  Documentation
--	--
--	--    Please refer to XCopyArea in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Copy_Area (Display_Id : in Display;
--			       Source : in Drawable;
--			       Destination : in Drawable;
--			       Gc : in Graphic_Context;
--			       Source_X : in Coordinate;
--			       Source_Y : in Coordinate;
--			       Width : in Width_Height;
--			       Height : in Width_Height;
--			       Destination_X : in Coordinate;
--			       Destination_Y : in Coordinate);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Copy_Plane
	--
	--  Description
	--
	--    This procedure copies an area of the source drawable to the target
	--  drawable (pixmap or Window).
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  Source       : Specifies the source window or pixmap.
	--  Destination  : Specifies the source window or pixmap.
	--  GC           : Specifies the graphics context.
	--  Source_Area  : Specifies the origin of the source rectangle.
	--  Dest_Origin  : Specifies the destination origin.
	--
	--  Documentation
	--
	--    Please refer to XCopyPlane in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Copy_Plane (Display_Id : in Display;
				Source : in Drawable;
				Destination : in Drawable;
				Gc : in Graphic_Context;
				Source_X : in Coordinate;
				Source_Y : in Coordinate;
				Width : in Width_Height;
				Height : in Width_Height;
				Destination_X : in Coordinate;
				Destination_Y : in Coordinate;
				Plane : in Plane_Mask);

--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Draw_Point
--	--
--	--  Description
--	--
--	--    This procedure draws a single point in the drawable (pixmap or
--	--  Window).
--	--
--	--  Parameters
--	--
--	--  Display_Id   : Specifies the connection to the X Server.
--	--  Drawable_Id  : Specifies the drawable (pixmap or Window).
--	--  GC           : Specifies the graphics context.
--	--  Xy           : Specifies the point location.
--	--
--	--  Documentation
--	--
--	--    Please refer to XDrawPoint in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Draw_Point (Display_Id : in Display;
--				Drawable_Id : in Drawable;
--				Gc : in Graphic_Context;
--				X : in Coordinate;
--				Y : in Coordinate);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Draw_Points
--	--
--	--  Description
--	--
--	--    This procedure draws the points specified in the point array. If
--	--  the Coordinate_Mode is Origin, all points are relative to the
--	--  drawable's origin. If the mode is Previous, all points after the
--	--  first are relative to the previous point.
--	--
--	--  Parameters
--	--
--	--  Display_Id      : Specifies the connection to the X Server.
--	--  Drawable_Id     : Specifies the drawable (pixmap or Window).
--	--  GC              : Specifies the graphics context.
--	--  Points          : Specifies an array of point locations.
--	--  Coordinate_Mode : Specifies Previous or Origin.
--	--
--	--
--	--
--	--  Documentation
--	--
--	--    Please refer to XDrawPoints in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Draw_Points (Display_Id : in Display;
--				 Drawable_Id : in Drawable;
--				 Gc : in Graphic_Context;
--				 Points : in Point_Array;
--				 Coordinate_Mode : in Coordinate_Mode_Type);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Draw_Line
--	--
--	--  Description
--	--
--	--    This procedure draws a single line in the drawable (pixmap or
--	--  Window).
--	--
--	--  Parameters
--	--
--	--  Display_Id   : Specifies the connection to the X Server.
--	--  Drawable_Id  : Specifies the drawable (pixmap or Window).
--	--  GC           : Specifies the graphics context.
--	--  Point_1      : Specifies the beginning point of the line.
--	--  Point_2      : Specifies the ending point of the line.
--	--
--	--  Documentation
--	--
--	--    Please refer to XDrawLine in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Draw_Line (Display_Id : in Display;
--			       Drawable_Id : in Drawable;
--			       Gc : in Graphic_Context;
--			       X_1 : in Coordinate;
--			       Y_1 : in Coordinate;
--			       X_2 : in Coordinate;
--			       Y_2 : in Coordinate);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Draw_Lines
--	--
--	--  Description
--	--
--	--    This procedure draws multiple, connected lines in the drawable.
--	--  If Coordinate_Mode is Origin, all points are treated as relative
--	--  to the drawable origin. If Previous, all points are treated
--	--  as relative to the previous point.
--	--
--	--  Parameters
--	--
--	--  Display_Id      : Specifies the connection to the X Server.
--	--  Drawable_Id     : Specifies the drawable (pixmap or Window).
--	--  GC              : Specifies the graphics context.
--	--  Points          : Specifies an array of points.
--	--  Coordinate_Mode : Specifies either Origin or Previous.
--	--
--	--
--	--  Documentation
--	--
--	--    Please refer to XDrawLines in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Draw_Lines (Display_Id : in Display;
--				Drawable_Id : in Drawable;
--				Gc : in Graphic_Context;
--				Points : in Point_Array;
--				Coordinate_Mode : in Coordinate_Mode_Type);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Draw_Segments
--	--
--	--  Description
--	--
--	--    This procedure draws multiple, unconnected lines in the drawable.
--	--
--	--  Parameters
--	--
--	--  Display_Id  : Specifies the connection to the X Server.
--	--  Drawable_Id : Specifies the drawable (pixmap or Window).
--	--  GC          : Specifies the graphics context.
--	--  Segments    : Specifies an array of pairs of points (start and end).
--	--
--	--  Documentation
--	--
--	--    Please refer to XDrawSegments in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Draw_Segments (Display_Id : in Display;
--				   Drawable_Id : in Drawable;
--				   Gc : in Graphic_Context;
--				   Segments : in Segment_Array);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Draw_Rectangle
--	--
--	--  Description
--	--
--	--    This procedure draws a single rectangle in the specified drawable.
--	--  The X and Y components of the rectangle are drawn relative
--	--  to the origin of the drawable.
--	--
--	--  Parameters
--	--
--	--  Display_Id   : Specifies the connection to the X Server.
--	--  Drawable_Id  : Specifies the drawable (pixmap or Window).
--	--  GC           : Specifies the graphics context.
--	--  Bounds       : Specifies the rectangle to draw.
--	--
--	--  Documentation
--	--
--	--    Please refer to XDrawRectangle in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Draw_Rectangle (Display_Id : in Display;
--				    Drawable_Id : in Drawable;
--				    Gc : in Graphic_Context;
--				    X : in Coordinate;
--				    Y : in Coordinate;
--				    Width : in Width_Height;
--				    Height : in Width_Height);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Draw_Rectangles
--	--
--	--  Description
--	--
--	--    This procedure draws multiple rectangles in the specified drawable
--	--  The X and Y components of the rectangles are drawn relative
--	--  to the origin of the drawable.
--	--
--	--  Parameters
--	--
--	--  Display_Id   : Specifies the connection to the X Server.
--	--  Drawable_Id  : Specifies the drawable (pixmap or Window).
--	--  GC           : Specifies the graphics context.
--	--  Bounds       : Specifies an array of rectangles to draw.
--	--
--	--  Documentation
--	--
--	--    Please refer to XDrawRectangles in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Draw_Rectangles (Display_Id : in Display;
--				     Drawable_Id : in Drawable;
--				     Gc : in Graphic_Context;
--				     Bounds : in Rectangle_Array);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Draw_Arc
--	--
--	--  Description
--	--
--	--    This procedure draws a single arc in the specified drawable (pixmap
--	--  or Window). The X and Y components of the arc are drawn relative
--	--  to the origin of the drawable.
--	--
--	--  Parameters
--	--
--	--  Display_Id  : Specifies the connection to the X Server.
--	--  Drawable_Id : Specifies the drawable (pixmap or Window).
--	--  GC          : Specifies the graphics context.
--	--  X           : Specifies the origin's X coordinate.
--	--  Y           : Specifies the origin's Y coordinate.
--	--  Width       : Specifies the width.
--	--  Height      : Specifies the height.
--	--  Angle_1     : Specifies the angle.
--	--  Angle_2     : Specifies the angle.
--	--
--	--
--	--  Documentation
--	--
--	--    Please refer to XDrawArc in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Draw_Arc (Display_Id : in Display;
--			      Drawable_Id : in Drawable;
--			      Gc : in Graphic_Context;
--			      X : in Coordinate;
--			      Y : in Coordinate;
--			      Width : in Width_Height;
--			      Height : in Width_Height;
--			      Angle_1 : in Angle;
--			      Angle_2 : in Angle);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Draw_Arcs
--	--
--	--  Description
--	--
--	--    This procedure draws multiple arcs in the specified drawable
--	--  (pixmap or Window). The X and Y components of the arcs are drawn
--	--  relative to the origin of the drawable.
--	--
--	--  Parameters
--	--
--	--  Display_Id   : Specifies the connection to the X Server.
--	--  Drawable_Id  : Specifies the drawable (pixmap or Window).
--	--  GC           : Specifies the graphics context.
--	--  Bounds       : Specifies an array of arcs to draw.
--	--
--	--  Documentation
--	--
--	--    Please refer to XDrawArcs in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Draw_Arcs (Display_Id : in Display;
--			       Drawable_Id : in Drawable;
--			       Gc : in Graphic_Context;
--			       Bounds : in Arc_Array);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Fill_Rectangle
--	--
--	--  Description
--	--
--	--    This procedure draws a filled rectangle in the specified drawable.
--	--  The X and Y components of the rectangle are drawn relative
--	--  to the origin of the drawable.
--	--
--	--  Parameters
--	--
--	--  Display_Id   : Specifies the connection to the X Server.
--	--  Drawable_Id  : Specifies the drawable (pixmap or Window).
--	--  GC           : Specifies the graphics context.
--	--  Bounds       : Specifies the rectangle to fill.
--	--
--	--  Documentation
--	--
--	--    Please refer to XFillRectangle in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Fill_Rectangle (Display_Id : in Display;
--				    Drawable_Id : in Drawable;
--				    Gc : in Graphic_Context;
--				    X : in Coordinate;
--				    Y : in Coordinate;
--				    Width : in Width_Height;
--				    Height : in Width_Height);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Fill_Rectangles
--	--
--	--  Description
--	--
--	--    This procedure draws multiple filled rectangles in the specified
--	--  drawable The X and Y components of the rectangles are drawn
--	--  relative to the origin of the drawable.
--	--
--	--  Parameters
--	--
--	--  Display_Id   : Specifies the connection to the X Server.
--	--  Drawable_Id  : Specifies the drawable (pixmap or Window).
--	--  GC           : Specifies the graphics context.
--	--  Bounds       : Specifies an array of rectangles to fill.
--	--
--	--  Documentation
--	--
--	--    Please refer to XFillRectangles in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Fill_Rectangles (Display_Id : in Display;
--				     Drawable_Id : in Drawable;
--				     Gc : in Graphic_Context;
--				     Rectangles : in Rectangle_Array);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Fill_Polygon
--	--
--	--  Description
--	--
--	--    This procedure draws a filled polygon in the drawable (pixmap or
--	--  Window).  Coordinate_Mode is Origin, all points are relative to the
--	--  drawable's origin. If the mode is Previous, all points after the
--	--  first are relative to the previous point. If the shape is Complex,
--	--  the path may intersect. If Nonconvex, the path does not intersect
--	--  but the shape is not convex. If shape is Convex, the path is wholly
--	--  convex.
--	--
--	--  Parameters
--	--
--	--  Display_Id      : Specifies the connection to the X Server.
--	--  Drawable_Id     : Specifies the drawable (pixmap or Window).
--	--  GC              : Specifies the graphics context.
--	--  Points          : Specifies an array of point locations.
--	--  Shape           : Specifies Complex, Nonconvex or Convex.
--	--  Coordinate_Mode : Specifies Previous or Origin.
--	--
--	--
--	--  Documentation
--	--
--	--    Please refer to XFillPolygon in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Fill_Polygon (Display_Id : in Display;
--				  Drawable_Id : in Drawable;
--				  Gc : in Graphic_Context;
--				  Points : in Point_Array;
--				  Shape : in Shape_Type;
--				  Coordinate_Mode : in Coordinate_Mode_Type);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Fill_Arc
--	--
--	--  Description
--	--
--	--    This procedure draws a single filled arc in the specified drawable
--	--  The X and Y components of the arc are drawn relative
--	--  to the origin of the drawable.
--	--
--	--  Parameters
--	--
--	--  Display_Id  : Specifies the connection to the X Server.
--	--  Drawable_Id : Specifies the drawable (pixmap or Window).
--	--  GC          : Specifies the graphics context.
--	--  Bounds      : Specifies the origin, width, height and angles or
--	--                the arc.
--	--
--	--  Documentation
--	--
--	--    Please refer to XFillArc in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Fill_Arc (Display_Id : in Display;
--			      Drawable_Id : in Drawable;
--			      Gc : in Graphic_Context;
--			      X : in Coordinate;
--			      Y : in Coordinate;
--			      Width : in Width_Height;
--			      Height : in Width_Height;
--			      Angle_1 : in Angle;
--			      Angle_2 : in Angle);
--
--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Fill_Arcs
--	--
--	--  Description
--	--
--	--    This procedure draws multiple filled arcs in the specified drawable
--	--  The X and Y components of the arcs are drawn relative
--	--  to the origin of the drawable.
--	--
--	--  Parameters
--	--
--	--  Display_Id   : Specifies the connection to the X Server.
--	--  Drawable_Id  : Specifies the drawable (pixmap or Window).
--	--  GC           : Specifies the graphics context.
--	--  Bounds       : Specifies an array of arcs to draw.
--	--
--	--  Documentation
--	--
--	--    Please refer to XFillArcs in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Graphic_Output
--	--======================================================================
--
--	procedure X_Fill_Arcs (Display_Id : in Display;
--			       Drawable_Id : in Drawable;
--			       Gc : in Graphic_Context;
--			       Arcs : in Arc_Array);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Draw_Text
	--
	--  Description
	--
	--    This convenience procedure draws an array of ASCII text strings at
	--  the baseline position in the drawable (pixmap or Window). This
	--  array specifies, for each string, a font and the distance between
	--  the string and the previously drawn string.
	--
	--  Parameters
	--
	--  Display_Id      : Specifies the connection to the X Server.
	--  Drawable_Id     : Specifies the drawable (pixmap or Window).
	--  GC              : Specifies the graphics context.
	--  Baseline        : Specifies the starting position for the first
	--                    string.
	--  Text_Items      : Specifies the array of text strings to be drawn.
	--
	--
	--  Documentation
	--
	--    Please refer to XDrawText in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Draw_Text (Display_Id : in Display;
			       Drawable_Id : in Drawable;
			       Gc : in Graphic_Context;
			       X : in Coordinate;
			       Y : in Coordinate;
			       Text_Items : in Fonts.Text_Item_Array);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Draw_Text
	--
	--  Description
	--
	--   This procedure draws an array of X_Character strings at the baseline
	--  position in the drawable (pixmap or Window). This array specifies,
	--  for each string, a font and the distance between the string and the
	--  previously drawn string.
	--
	--  Parameters
	--
	--  Display_Id      : Specifies the connection to the X Server.
	--  Drawable_Id     : Specifies the drawable (pixmap or Window).
	--  GC              : Specifies the graphics context.
	--  Baseline        : Specifies the starting position for the first
	--                    string.
	--  Text_Items      : Specifies the array of text strings to be drawn.
	--
	--
	--  Documentation
	--
	--    Please refer to XDrawText in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Draw_Text (Display_Id : in Display;
			       Drawable_Id : in Drawable;
			       Gc : in Graphic_Context;
			       X : in Coordinate;
			       Y : in Coordinate;
			       Text_Items : in Fonts.Text_Item_8_Array);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Draw_Text_16
	--
	--  Description
	--
	--    This procedure draws an array of Char_2b String_16 at the baseline
	--  position in the drawable (pixmap or Window).  This array specifies,
	--  for each string, a font and the distance between the string and the
	--  previously drawn string.
	--
	--  Parameters
	--
	--  Display_Id      : Specifies the connection to the X Server.
	--  Drawable_Id     : Specifies the drawable (pixmap or Window).
	--  GC              : Specifies the graphics context.
	--  Baseline        : Specifies the starting position for the first
	--                    string.
	--  Text_Items      : Specifies the array of text strings to be drawn.
	--
	--
	--  Documentation
	--
	--    Please refer to XDrawText16 in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Draw_Text_16 (Display_Id : in Display;
				  Drawable_Id : in Drawable;
				  Gc : in Graphic_Context;
				  X : in Coordinate;
				  Y : in Coordinate;
				  Text_Items : in Fonts.Text_Item_16_Array);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Draw_String
	--
	--  Description
	--
	--    This procedure draws an ASCII text string at the baseline position
	--  in the drawable (pixmap or Window).
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  Drawable_Id : Specifies the drawable (pixmap or Window).
	--  GC          : Specifies the graphics context.
	--  Baseline    : Specifies the starting position for the string.
	--  Text        : Specifies the ASCII string to be drawn.
	--
	--
	--  Documentation
	--
	--    Please refer to XDrawString in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Draw_String (Display_Id : in Display;
				 Drawable_Id : in Drawable;
				 Gc : in Graphic_Context;
				 X : in Coordinate;
				 Y : in Coordinate;
				 Text : in String);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Draw_String
	--
	--  Description
	--
	--    This procedure draws an X_Character string at the baseline
	--  position in the drawable (pixmap or Window).
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  Drawable_Id : Specifies the drawable (pixmap or Window).
	--  GC          : Specifies the graphics context.
	--  Baseline    : Specifies the starting position for the string.
	--  Text        : Specifies the X_Character string to be drawn.
	--
	--
	--  Documentation
	--
	--    Please refer to XDrawString in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Draw_String (Display_Id : in Display;
				 Drawable_Id : in Drawable;
				 Gc : in Graphic_Context;
				 X : in Coordinate;
				 Y : in Coordinate;
				 Text : in String_8);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Draw_String_16
	--
	--  Description
	--
	--    This procedure draws a String_16 (Char_2b) at the baseline
	--  position in the drawable (pixmap or Window).
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  Drawable_Id : Specifies the drawable (pixmap or Window).
	--  GC          : Specifies the graphics context.
	--  Baseline    : Specifies the starting position for the string.
	--  Text        : Specifies the String_16 to be drawn.
	--
	--
	--  Documentation
	--
	--    Please refer to XDrawString16 in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Draw_String_16 (Display_Id : in Display;
				    Drawable_Id : in Drawable;
				    Gc : in Graphic_Context;
				    X : in Coordinate;
				    Y : in Coordinate;
				    Text : in Fonts.String_16);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Draw_Image_String
	--
	--  Description
	--
	--    This procedure draws an ASCII text string at the baseline
	--  position in the drawable (pixmap or Window). This procedure differs
	--  from Draw_String by drawing both the foreground and background bits
	--  of each character painted to avoid flicker.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Drawable_Id         : Specifies the drawable (pixmap or Window).
	--  GC         : Specifies the graphics context.
	--  Baseline   : Specifies the starting position for the string.
	--  Text       : Specifies the ASCII string to be drawn.
	--
	--
	--  Documentation
	--
	--    Please refer to XDrawImageString in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Draw_Image_String (Display_Id : in Display;
				       Drawable_Id : in Drawable;
				       Gc : in Graphic_Context;
				       X : in Coordinate;
				       Y : in Coordinate;
				       Text : in String);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Draw_Image_String
	--
	--  Description
	--
	--    This procedure draws an X_Character string at the baseline
	--  position in the drawable (pixmap or Window). This procedure differs
	--  from Draw_String by drawing both the foreground and background bits
	--  of each character painted to avoid flicker.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Drawable_Id         : Specifies the drawable (pixmap or Window).
	--  GC         : Specifies the graphics context.
	--  Baseline   : Specifies the starting position for the string.
	--  Text       : Specifies the X_Character string to be drawn.
	--
	--
	--  Documentation
	--
	--    Please refer to XDrawImageString in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Draw_Image_String (Display_Id : in Display;
				       Drawable_Id : in Drawable;
				       Gc : in Graphic_Context;
				       X : in Coordinate;
				       Y : in Coordinate;
				       Text : in String_8);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Draw_String_16
	--
	--  Description
	--
	--   This procedure draws a String_16 (Char_2b) at the baseline position
	--  in the drawable. This procedure differs from Draw_String_16
	--  by drawing both the foreground and background bits of each character
	--  painted to avoid flicker.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  Drawable_Id : Specifies the drawable (pixmap or Window).
	--  GC          : Specifies the graphics context.
	--  Baseline    : Specifies the starting position for the string.
	--  Text        : Specifies the String_16 to be drawn.
	--
	--
	--  Documentation
	--
	--    Please refer to XDrawString16 in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Draw_Image_String_16 (Display_Id : in Display;
					  Drawable_Id : in Drawable;
					  Gc : in Graphic_Context;
					  X : in Coordinate;
					  Y : in Coordinate;
					  Text : in Fonts.String_16);

	--======================================================================
	--  Subprogram Name
	--
	--    Set_Image
	--
	--  Description
	--
	--    This procedure loads the private image representation with the
	--  information provided in the Set_Image_Record passed.
	--
	--  Parameters
	--
	--  X_Image         : Specifies the image to be loaded.
	--  Values          : Specifies the Set_Image_Record whose values will
	--                    be used to load the X_Image.
	--
	--  Documentation
	--
	--    This subroutine has been added to the standard C language Xlib
	--  interface as a convenience routine.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure Set_Image (X_Image : in out Image;
			     Values : in Set_Image_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Put_Image
	--
	--  Description
	--
	--    This procedure combines an image in memory with a rectangle of a
	--  drawable on your display.
	--
	--  Parameters
	--
	--  Display_Id      : Specifies the connection to the X Server.
	--  Drawable_Id     : Specifies the drawable (pixmap or Window).
	--  GC              : Specifies the graphics context.
	--  X_Image         : Specifies the image to combine with the rectangle.
	--  Source_XY       : Specifies the offset from the image origin.
	--  Destination     : Specifies the rectangle of the drawable.
	--
	--
	--  Documentation
	--
	--    Please refer to XPutImage in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Put_Image (Display_Id : in Display;
			       Drawable_Id : in Drawable;
			       Gc : in Graphic_Context;
			       X_Image : in Image;
			       Source_X : in Coordinate;
			       Source_Y : in Coordinate;
			       Destination_X : in Coordinate;
			       Destination_Y : in Coordinate;
			       Width : in Width_Height;
			       Height : in Width_Height);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Image
	--
	--  Description
	--
	--    This function returns the contents of a rectangle in the drawable
	--  as an Image.
	--
	--  Parameters
	--
	--  Display_Id      : Specifies the connection to the X Server.
	--  Drawable_Id     : Specifies the drawable (pixmap or Window).
	--  Sources         : Specifies the source rectangle.
	--  Planes          : Specifies the plane mask.
	--  Format          : Specifies either XY_Pixmap or Z_Pixmap.
	--
	--
	--  Documentation
	--
	--    Please refer to XGetImage in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	function X_Get_Image (Display_Id : in Display;
			      Drawable_Id : in Drawable;
			      X : in Coordinate;
			      Y : in Coordinate;
			      Width : in Width_Height;
			      Height : in Width_Height;
			      Planes : in Plane_Mask;
			      Format : in Pixmap_Format) return Image;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Subimage
	--
	--  Description
	--
	--    This function copies the contents of a rectangle in a drawable to
	--  an image, as well as returning an Image.
	--
	--  Parameters
	--
	--  Display_Id      : Specifies the connection to the X Server.
	--  Drawable_Id     : Specifies the drawable (pixmap or Window).
	--  Sources         : Specifies the source rectangle.
	--  Planes          : Specifies the plane mask.
	--  Format          : Specifies either XY_Pixmap or Z_Pixmap.
	--  Dest_Origin     : Specifies the destination rectangle origin.
	--  Destination     : Specifies the destination image.
	--
	--
	--  Documentation
	--
	--    Please refer to XGetSubimage in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	function X_Get_Subimage (Display_Id : in Display;
				 Drawable_Id : in Drawable;
				 Source_X : in Coordinate;
				 Source_Y : in Coordinate;
				 Width : in Width_Height;
				 Height : in Width_Height;
				 Planes : in Plane_Mask;
				 Format : in Pixmap_Format;
				 Destination_X : in Coordinate;
				 Destination_Y : in Coordinate;
				 Destination : in Image) return Image;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Create_Image
	--
	--  Description
	--
	--    This function allocates the memory for an image for the display.
	--  It does not allocate the space for the image itself but intializes
	--  the structure with default values.
	--
	--  Parameters
	--
	--  Display_Id      : Specifies the connection to the X Server.
	--  Visual_Id       : Specifies the visual.
	--  Depth           : Specifies the depth.
	--  Format          : Specifies the pixmap format.
	--  Offset          : Specifies the number of Pixel to ignore at the
	--                    start of the scanline.
	--  Data            : Specifies the image data.
	--  Width           : Specifies the width of the image.
	--  Height          : Specifies the height of the image.
	--  Scanline_Pad    : Specifies the scanline separation pad.
	--  Bytes_Per_Line  : Specifies the length of a scanline and its pad.
	--
	--  Documentation
	--
	--    Please refer to XCreateImage in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	function X_Create_Image (Display_Id : in Display;
				 Visual_Id : in Visual;
				 Depth : in Depth_Type;
				 Format : in Pixmap_Format;
				 Offset : in Pixel;
				 Data : in Bits;
				 Width : in Width_Height;
				 Height : in Width_Height;
				 Scanline_Pad : in Pixel;
				 Scanline_Length : in Pixel) return Image;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Pixel
	--
	--  Description
	--
	--    This function obtains a pixel value in an image.
	--
	--  Parameters
	--
	--  X_Image         : Specifies the image.
	--  Xy              : Specifies the pixel location.
	--
	--  Documentation
	--
	--    Please refer to XGetPixel in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	function X_Get_Pixel
		    (X_Image : in Image; X : in Coordinate; Y : in Coordinate)
		    return U_Pixel;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Put_Pixel
	--
	--  Description
	--
	--    This procedure overwrites a pixel in an image.
	--
	--  Parameters
	--
	--  X_Image         : Specifies the image.
	--  Xy              : Specifies the pixel location.
	--  Pixel           : Specifies the new pixel value.
	--
	--  Documentation
	--
	--    Please refer to XPutPixel in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	function X_Put_Pixel (X_Image : in Image;
			      X : in Coordinate;
			      Y : in Coordinate;
			      Value : in U_Pixel) return Boolean;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Sub_Image
	--
	--  Description
	--
	--    This function creates a new image that is a subsection of an
	--  existing image.
	--
	--  Parameters
	--
	--  X_Image         : Specifies the image.
	--  Bounds          : Specifies the subimage coordinates.
	--
	--  Documentation
	--
	--    Please refer to XSubImage in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	function X_Sub_Image (X_Image : in Image;
			      X : in Coordinate;
			      Y : in Coordinate;
			      Subimage_Width : in Width_Height;
			      Subimage_Height : in Width_Height) return Image;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Add_Pixel
	--
	--  Description
	--
	--    This procedure increments each pixel in the Image by Value.
	--
	--  Parameters
	--
	--  X_Image         : Specifies the image.
	--  Value           : Specifies the value to be added to each pixel.
	--
	--  Documentation
	--
	--    Please refer to XAddPixel in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	function X_Add_Pixel
		    (X_Image : in Image; Value : in U_Pixel) return Boolean;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Destroy_Image
	--
	--  Description
	--
	--    This procedure deallocates the memory allocated in a previous call
	--  to Create_Image.
	--
	--  Parameters
	--
	--  X_Image         : Specifies the image.
	--
	--  Documentation
	--
	--    Please refer to XDestroyImage in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Destroy_Image
		     (X_Image : in out Image; Status : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Read_Bitmap_File
	--
	--  Description
	--
	--    This procedure reads a bitmap in from disk.
	--  The file is in either standard X10 or X11 Bitmap format.
	--
	--  Parameters
	--
	--  Display_Id      : Specifies the connection to the X Server.
	--  Drawable_Id     : Specifies the drawable (pixmap or Window).
	--  Filename        : Specifies the file name.
	--  Width           : Returns the width of the bitmap.
	--  Height          : Returns the height of the bitmap.
	--  Bitmap          : Returns the bitmap.
	--  Hot_Spot        : Returns the hot spot coordinates.
	--  Status          : Returns the status of the operation
	--
	--  Documentation
	--
	--    Please refer to XReadBitmapFile in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	procedure X_Read_Bitmap_File (Display_Id : in Display;
				      Drawable_Id : in Drawable;
				      Filename : in String;
				      Width : out Width_Height;
				      Height : out Width_Height;
				      Bitmap : out Pixmap;
				      X_Hot : out Coordinate;
				      Y_Hot : out Coordinate;
				      Status : out Bitmap_Status_Type);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Write_Bitmap_File
	--
	--  Description
	--
	--    This function writes a bitmap to the disk. The file is written in
	--  standard X11 Bitmap format.
	--
	--  Parameters
	--
	--  Display_Id      : Specifies the connection to the X Server.
	--  Filename        : Specifies the file name.
	--  Bitmap          : Specifies the bitmap.
	--  Width           : Specifies the width of the bitmap.
	--  Height          : Specifies the height of the bitmap.
	--  Hot_Spot        : Specifies the hot spot coordinates.
	--
	--  Documentation
	--
	--    Please refer to XWriteBitmapFile in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	function X_Write_Bitmap_File
		    (Display_Id : in Display;
		     Filename : in String;
		     Bitmap : in Pixmap;
		     Width : in Width_Height;
		     Height : in Width_Height;
		     X_Hot : in Coordinate;
		     Y_Hot : in Coordinate) return Bitmap_Status_Type;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Create_Bitmap_From_Data
	--
	--  Description
	--
	--    This function is used to include a bitmap written out by
	--  Write_Bitmap_File in a program directly as opposed to reading it in
	--  every time at run time.
	--
	--  Parameters
	--
	--       Display_Id  : The X Server connection.
	--       Drawable_Id : The drawable. (The desired Screen)
	--       Data        : The location of the bitmap data.
	--       Width       : The width you want.
	--       Height      : The height you want.
	--
	--  Documentation
	--
	--    Please refer to XCreateBitmapFromData in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	function X_Create_Bitmap_From_Data
		    (Display_Id : in Display;
		     Drawable_Id : in Drawable;
		     Data : in Bits;
		     Width : in Width_Height;
		     Height : in Width_Height) return Pixmap;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Create_Pixmap_From_Bitmap_Data
	--
	--  Description
	--
	--    This function creates a pixmap of the given depth and then does
	--  a bitmap format Put_Image of the data into it.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  Drawable_Id : Specifies which screen the pixmap is created on.
	--  Data        : Specifies the pixmap data.
	--  Width       : Specifies the width.
	--  Height      : Specifies the Height.
	--  Foreground  : Specifies the foreground color.
	--  Background  : Specifies the background color.
	--  Depth       : Specifies the depth.
	--
	--  Documentation
	--
	--    Please refer to XCreatePixmapFromBitmapData in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	function X_Create_Pixmap_From_Bitmap_Data
		    (Display_Id : in Display;
		     Drawable_Id : in Drawable;
		     Data : in Bits;
		     Width : in Width_Height;
		     Height : in Width_Height;
		     Foreground : in U_Pixel;
		     Background : in U_Pixel;
		     Depth : in Depth_Type) return Pixmap;

	-- new for R4
	procedure X_List_Pixmap_Formats
		     (Display_Id : in Display;
		      Formats : in out Pixmap_Format_Value_List);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Resource_Gc_From_Graphic_Context
	--
	--  Description
	--
	--    This function returns the Resource_Gc for the specified
	--  Graphic_Context.
	--
	-- Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  Drawable_Id : Specifies which screen the pixmap is created on.
	--  Data        : Specifies the pixmap data.
	--  Width       : Specifies the width.
	--  Height      : Specifies the Height.
	--  Foreground  : Specifies the foreground color.
	--  Background  : Specifies the background color.
	--  Depth       : Specifies the depth.
	--
	--  Documentation
	--
	--    Please refer to XResourceGcFromGraphicContext in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Graphic_Output
	--======================================================================

	function X_Resource_Gc_From_Graphic_Context
		    (Gc : in Graphic_Context) return Resource_Gc;

	function X_Graphic_Context_From_Gc
		    (Gc : in Graphic_Context) return Graphic_Context;

	procedure X_Flush_Gc (Dpy : in Display; Gc : in Graphic_Context);

    private
--	type Gc_Record;
--	type Graphic_Context is access Gc_Record;
--
--	Null_Graphic_Context : constant Graphic_Context := null;

	type Image_Record;
	type Image is access Image_Record;
	Image_Context : constant Image := null;

	type Resource_Gc is new Unsigned_Long range 0 .. (16#10000000#) - 1;
	-- range 0 .. (2 ** 28) - 1;

	type Bitmap_Status_Type is new Int32;
	Bitmap_Success : constant Bitmap_Status_Type := 0;
	Bitmap_Open_Failed : constant Bitmap_Status_Type := 1;
	Bitmap_File_Invalid : constant Bitmap_Status_Type := 2;
	Bitmap_No_Memory : constant Bitmap_Status_Type := 3;

--	type Gx_Function_Code is new Int32;
--	Gx_Clear : constant Gx_Function_Code := 0;
--	Gx_And : constant Gx_Function_Code := 1;
--	Gx_And_Reverse : constant Gx_Function_Code := 2;
--	Gx_Copy : constant Gx_Function_Code := 3;
--	Gx_And_Inverted : constant Gx_Function_Code := 4;
--	Gx_Noop : constant Gx_Function_Code := 5;
--	Gx_Xor : constant Gx_Function_Code := 6;
--	Gx_Or : constant Gx_Function_Code := 7;
--	Gx_Nor : constant Gx_Function_Code := 8;
--	Gx_Equiv : constant Gx_Function_Code := 9;
--	Gx_Invert : constant Gx_Function_Code := 10;
--	Gx_Or_Reverse : constant Gx_Function_Code := 11;
--	Gx_Copy_Inverted : constant Gx_Function_Code := 12;
--	Gx_Or_Inverted : constant Gx_Function_Code := 13;
--	Gx_Nand : constant Gx_Function_Code := 14;
--	Gx_Set : constant Gx_Function_Code := 15;

	type Line_Style_Type is new Int32;
	Line_Solid : constant Line_Style_Type := 0;
	Line_On_Off_Dash : constant Line_Style_Type := 1;
	Line_Double_Dash : constant Line_Style_Type := 2;

	type Cap_Style_Type is new Int32;
	Cap_Not_Last : constant Cap_Style_Type := 0;
	Cap_Butt : constant Cap_Style_Type := 1;
	Cap_Round : constant Cap_Style_Type := 2;
	Cap_Projecting : constant Cap_Style_Type := 3;

	type Join_Style_Type is new Int32;
	Join_Miter : constant Join_Style_Type := 0;
	Join_Round : constant Join_Style_Type := 1;
	Join_Bevel : constant Join_Style_Type := 2;

	type Fill_Style_Type is new Int32;
	Fill_Solid : constant Fill_Style_Type := 0;
	Fill_Tiled : constant Fill_Style_Type := 1;
	Fill_Stippled : constant Fill_Style_Type := 2;
	Fill_Opaque_Stippled : constant Fill_Style_Type := 3;

	type Fill_Rule_Type is new Int32;
	Even_Odd_Rule : constant Fill_Rule_Type := 0;
	Winding_Rule : constant Fill_Rule_Type := 1;

	type Shape_Class_Type is new Int32;
	Cursor_Shape_Class : constant Shape_Class_Type := 0;
	Tile_Shape_Class : constant Shape_Class_Type := 1;
	Stipple_Shape_Class : constant Shape_Class_Type := 2;

	type Ordering_Type is new Int32;
	Unsorted : constant Ordering_Type := 0;
	Y_Sorted : constant Ordering_Type := 1;
	Yx_Sorted : constant Ordering_Type := 2;
	Yx_Banded : constant Ordering_Type := 3;

	type Arc_Mode_Type is new Int32;
	Arc_Chord : constant Arc_Mode_Type := 0;
	Arc_Pie_Slice : constant Arc_Mode_Type := 1;

	type Subwindow_Mode_Type is new Int32;
	Clip_By_Children : constant Subwindow_Mode_Type := 0;
	Include_Inferiors : constant Subwindow_Mode_Type := 1;

	type Coordinate_Mode_Type is new Int32;
	Origin : constant Coordinate_Mode_Type := 0;
	Previous : constant Coordinate_Mode_Type := 1;

	type Shape_Type is new Int32;
	Complex : constant Shape_Type := 0;
	Nonconvex : constant Shape_Type := 1;
	Convex : constant Shape_Type := 2;
    end Graphic_Output;


    package Colors is
--	type Color_Map is private;
	type Color_Map_Array is array (Natural range <>) of Color_Map;
	type Color_Map_List is access Color_Map_Array;
	Null_Color_Map : constant Color_Map;

	type Color_Flag is new X_Mask_Type;
	No_Color_Flags : constant Color_Flag := Color_Flag (Null_X_Mask);
	Do_Red : constant Color_Flag := Create_Constant (2 ** 0);
	Do_Green : constant Color_Flag := Create_Constant (2 ** 1);
	Do_Blue : constant Color_Flag := Create_Constant (2 ** 2);
	Do_All : constant Color_Flag := Do_Red or Do_Green or Do_Blue;

	type Rgb_Value_Type is new Unsigned_Short range 0 .. 65_535;

	Full_Color : constant Rgb_Value_Type := Rgb_Value_Type'Last;
	Half_Color : constant Rgb_Value_Type := Rgb_Value_Type'Last / 2;
	Color_Off : constant Rgb_Value_Type := 0;

	type Color_Record is
	    record
		Value : U_Pixel;
		Red : Rgb_Value_Type;
		Green : Rgb_Value_Type;
		Blue : Rgb_Value_Type;
		Flags : Color_Flag;
	    end record;

	type Color_Array is array (Natural range <>) of Color_Record;
	Null_Color_Array : Color_Array (1 .. 0);

	type Pixel_Array is array (Natural range <>) of Pixel;
	type Pixel_List is access Pixel_Array;
	Null_Pixel_Array : Pixel_Array (1 .. 0);

	type Color_Map_Allocator is private;
	Allocate_None : constant Color_Map_Allocator;
	Allocate_All : constant Color_Map_Allocator;
	function Create_Constant (Value : in X_Long_Integer)
				 return Color_Map_Allocator;

	-- lengthened for R4
	type Standard_Colormap_Record is
	    record
		Map_Id : Colors.Color_Map;
		Red_Max : U_Pixel;
		Red_Mult : U_Pixel;
		Green_Max : U_Pixel;
		Green_Mult : U_Pixel;
		Blue_Max : U_Pixel;
		Blue_Mult : U_Pixel;
		Base_Pixel : U_Pixel;
		Visual_Id : Visual_Id_Type;
		Kill_Id : X_Id;
	    end record;
	-- new for R4; X_Set_Rgb_Colormaps,
	--             X_Get_Rgb_Colormaps
	type Standard_Colormap_Array is
	   array (Natural range <>) of Standard_Colormap_Record;
	type Standard_Colormap_List is access Standard_Colormap_Array;

	-- for killid field above
	Release_By_Freeing_Colormap : constant X_Id := 1;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Create_Colormap
	--
	--  Description
	--
	--    This function creates a Colormap of the specified Visual type for
	--  the screen on which the window resides and associates the color map
	--  ID with it.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Window_Id  : Specifies the window on which you create the Colormap.
	--  Visual_Id  : Specifies the visual type supported on the screen.
	--  Allocate   : Specifies either Allocate_None or Allocate_All.
	--
	--  Documentation
	--
	--    Please refer to XCreateColormap in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	function X_Create_Colormap
		    (Display_Id : in Display;
		     Window_Id : in Window;
		     Visual_Id : in Visual;
		     Allocate : in Color_Map_Allocator) return Color_Map;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Copy_Colormap_And_Free
	--
	--  Description
	--
	--    This procedure creates a new Colormap of the same visual type and
	--  for the same screen as the Source, returning this new ID as Target.
	--  It then moves all of the client's existing allocation from Source to
	--  Target with their color values intact and their read-only/writable
	--  characteristics intact and frees those entries. It then frees the
	--  Source Colormap.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Source     : The Color_Map ID to be copied from.
	--  Target     : The returned Color_Map ID.
	--
	--  Documentation
	--
	--    Please refer to XCopyColormapAndFree in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Copy_Colormap_And_Free (Display_Id : in Display;
					    Source : in out Color_Map;
					    Target : out Color_Map);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Free_Colormap
	--
	--  Description
	--
	--    This procedure deletes the association between a Colormap and its
	--  ID, and uninstalls it if it was installed. It has no effect on the
	--  default color map for a screen.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map_Id     : The Color_Map ID to be freed.
	--
	--  Documentation
	--
	--    Please refer to XFreeColormap in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Free_Colormap (Display_Id : in Display;
				   Map_Id : in out Color_Map);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Window_Colormap
	--
	--  Description
	--
	--   This procedure sets the specified Colormap for the specified window.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Window_Id  : Specifies the window on whose screen you set the
	--               Colormap.
	--  Map_Id     : Specifies the Color_Map ID.
	--
	--  Documentation
	--
	--    Please refer to XSetWindowColormap in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Set_Window_Colormap (Display_Id : in Display;
					 Window_Id : in Window;
					 Map_Id : in Color_Map);

	-- new for R4
	procedure X_Set_Rgb_Colormaps
		     (Display_Id : in Display;
		      Window_Id : in Window;
		      Standard_Colormaps : in Standard_Colormap_List;
		      Property : in Atoms.Atom);

	-- new for R4
	procedure X_Get_Rgb_Colormaps
		     (Display_Id : in Display;
		      Window_Id : in Window;
		      Standard_Colormaps : in out Standard_Colormap_List;
		      Property : in Atoms.Atom;
		      Status : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Allocate_Color
	--
	--  Description
	--
	--    This procedure returns the pixel values indicating the closest
	--  color supported by the hardware given a color definition. It also
	--  returns the red, green and blue values actually used.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map_Id     : Specifies the Color_Map ID.
	--  Definition : Returns the values actually used in the Colormap.
	--  Success    : Returns the success of the operation.
	--
	--  Documentation
	--
	--    Please refer to XAllocateColor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Allocate_Color (Display_Id : in Display;
				    Map_Id : in Color_Map;
				    Definition : in out Color_Record;
				    Success : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Allocate_Named_Color
	--
	--  Description
	--
	--    This procedure determines the correct color(shade) for the given
	--  screen.  It returns both the exact definition and the screen
	--  definition.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map_Id     : Specifies the Color_Map ID.
	--  Color_Name : Specifies the name of the color which is wanted.
	--  Screen_Def : Returns the values actually used in the Colormap.
	--  Exact_Def  : Returns the true pixel values of the closet color
	--               supported by the hardware.
	--  Success    : Returns the success of the operation.
	--
	--  Documentation
	--
	--    Please refer to XAllocateNamedColor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Allocate_Named_Color (Display_Id : in Display;
					  Map_Id : in Color_Map;
					  Color_Name : in String;
					  Screen_Def : out Color_Record;
					  Exact_Def : out Color_Record;
					  Success : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Lookup_Color
	--
	--  Description
	--
	--    This procedure looks up the string name of a color for the given
	--  screen.  It returns both the exact definition and the screen
	--  definition.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map_Id     : Specifies the Color_Map ID.
	--  Color_Name : Specifies the name of the color definition wanted.
	--  Screen_Def : Returns the values actually used in the Colormap.
	--  Exact_Def  : Returns the true pixel values of the closet color
	--               supported by the hardware.
	--  Success    : Returns the success of the operation.
	--
	--  Documentation
	--
	--    Please refer to XLookupColor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Lookup_Color (Display_Id : in Display;
				  Map_Id : in Color_Map;
				  Color_Name : in String;
				  Screen_Def : out Color_Record;
				  Exact_Def : out Color_Record;
				  Success : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Store_Colors
	--
	--  Description
	--
	--    This procedure changes the color map entries of the pixel values
	--  specified in the pixel members of the Color_Array members. You
	--  specify which color components to be changed by setting the
	--  Color_Flag in each member. If the color map is an installed color
	--  map, the effect is immediate.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map_Id     : Specifies the Color_Map ID.
	--  Colors     : Specifies the list of color definition structures.
	--
	--  Documentation
	--
	--    Please refer to XStoreColors in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Store_Colors (Display_Id : in Display;
				  Map_Id : in Color_Map;
				  Colors : in out Color_Array);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Store_Color
	--
	--  Description
	--
	--    This procedure changes the color map entry of the pixel value
	--  specified by the pixel member of the Screen_Def parameter and returns
	--  the actual value set.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map_Id     : Specifies the Color_Map ID.
	--  Screen_Def : Returns the values actually used in the color map.
	--
	--  Documentation
	--
	--    Please refer to XStoreColor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Store_Color (Display_Id : in Display;
				 Map_Id : in Color_Map;
				 Screen_Def : in out Color_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Allocate_Color_Cells
	--
	--  Description
	--
	--    This procedure allocates color cells. It returns the pixels and
	--  plane masks requested. All are allocated writeable by the request.
	--  The RGB values of the allocated entries are undefined.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  Map_Id       : Specifies the Color_Map ID.
	--  Contiguous   : Specifies if the planes must be contiguous.
	--  Planes       : Returns an array of allocated planes.
	--  Pixel_Values : Returns an array of allocated Pixel_Values.
	--  Success      : Returns the success of the operation.
	--
	--  Documentation
	--
	--    Please refer to XAllocateColorCells in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Allocate_Color_Cells (Display_Id : in Display;
					  Map_Id : in Color_Map;
					  Contiguous : in Boolean;
					  Planes : in out Plane_Mask_Array;
					  Pixel_Values : in out Pixel_Array;
					  Success : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Allocate_Color_Planes
	--
	--  Description
	--
	--    This procedure allocates color planes.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  Map_Id       : Specifies the Color_Map ID.
	--  Contiguous   : Specifies if the planes must be contiguous.
	--  Red_Shades   : Specifies the number of red Colors.
	--  Green_Shades : Specifies the number of green Colors.
	--  Blue_Shades  : Specifies the number of blue Colors.
	--  Pixel_Values : Returns an array of allocated Pixel_Values.
	--  Red_Mask     : Returns a bit mask for the red plane.
	--  Green_Mask   : Returns a bit mask for the green plane.
	--  Blue_Mask    : Returns a bit mask for the blue plane.
	--  Success      : Returns the success of the operation.
	--
	--  Documentation
	--
	--    Please refer to XAllocateColorPlanes in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Allocate_Color_Planes (Display_Id : in Display;
					   Map_Id : in Color_Map;
					   Contiguous : in Boolean;
					   Red_Shades : in Natural;
					   Green_Shades : in Natural;
					   Blue_Shades : in Natural;
					   Pixel_Values : in out Pixel_List;
					   Red_Mask : out Plane_Mask;
					   Green_Mask : out Plane_Mask;
					   Blue_Mask : out Plane_Mask;
					   Success : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Store_Named_Color
	--
	--  Description
	--
	--    This procedure allocates a color cell by looking up the named
	--  color.  The Map_Entry parameter determines the entry in the color
	--  map.  The Flags determine which of the red, green and blue indices
	--  are set.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map_Id     : Specifies the Color_Map ID.
	--  Color_Name : Specifies the color name.
	--  Map_Entry  : Specifies the entry in the color map.
	--  Flags      : Specifies which red, green and blue indices to set.
	--
	--  Documentation
	--
	--    Please refer to XStoreNamedColor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Store_Named_Color (Display_Id : in Display;
				       Map_Id : in Color_Map;
				       Color_Name : in String;
				       Map_Entry : in U_Pixel;
				       Flags : in Color_Flag);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Free_Colors
	--
	--  Description
	--
	--    This procedure frees the cells represented by pixels values in
	--  the Pixels_To_Free array. The Planes should not have any pixels
	--  in common with any of the pixels.
	--
	--  Parameters
	--
	--  Display_Id     : Specifies the connection to the X Server.
	--  Map_Id         : Specifies the Color_Map ID.
	--  Pixels_To_Free : Specifies the pixels to be freed.
	--  Planes         : Specifies the planes to be freed.
	--
	--  Documentation
	--
	--    Please refer to XFreeColors in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Free_Colors (Display_Id : in Display;
				 Map_Id : in Color_Map;
				 Pixels_To_Free : in Pixel_Array;
				 Planes : in Plane_Mask);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Query_Color
	--
	--  Description
	--
	--    This procedure obtains the color values for a single specified
	--  pixel value.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map_Id     : Specifies the Color_Map ID.
	--  The_Color  : Returns the RGB values for the pixel specified.
	--
	--  Documentation
	--
	--    Please refer to XQueryColor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Query_Color (Display_Id : in Display;
				 Map_Id : in Color_Map;
				 The_Color : in out Color_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Query_Colors
	--
	--  Description
	--
	--    This procedure obtains the color values for an array of pixels
	--  stored in color structures.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map_Id     : Specifies the Color_Map ID.
	--  The_Colors : Returns the RGB values for the pixels specified.
	--
	--  Documentation
	--
	--    Please refer to XQueryColors in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Query_Colors (Display_Id : in Display;
				  Map_Id : in Color_Map;
				  The_Colors : in out Color_Array);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Install_Colormap
	--
	--  Description
	--
	--    This procedure installs the specified color map. All windows
	--  associated with this color map immediately display with true
	--  Colors. This association was made when the windows were created.
	--
	--  This procedure is primarily used by window managers.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map_Id     : Specifies the Color_Map ID.
	--
	--  Documentation
	--
	--    Please refer to XInstallColormap in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Install_Colormap
		     (Display_Id : in Display; Map_Id : in Color_Map);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Uninstall_Colormap
	--
	--  Description
	--
	--    This procedure removes the specified color map. All windows
	--  associated with this color map immediately display with true
	--  Colors. This association was made when the windows were created.
	--
	--  This procedure is primarily used by window managers.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map_Id     : Specifies the Color_Map ID.
	--
	--  Documentation
	--
	--    Please refer to XUninstallColormap in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Uninstall_Colormap
		     (Display_Id : in Display; Map_Id : in Color_Map);

	--======================================================================
	--  Subprogram Name
	--
	--    X_List_Installed_Colormaps
	--
	--  Description
	--
	--    This function obtains a list of the currently installed color maps
	--  for the screen of the specified window.
	--
	--  This procedure is primarily used by window managers.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Window_Id  : Specifies the window.
	--
	--  Documentation
	--
	--    Please refer to XListInstalledColormaps in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	function X_List_Installed_Colormaps
		    (Display_Id : in Display; Window_Id : in Window)
		    return Color_Map_List;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Parse_Color
	--
	--  Description
	--
	--    This procedure provides a simple way to create a user interface to
	--  color. It takes a string specification of a color, typically from
	--  a command line or Get_Default option, and returns the corresponding
	--  red, green and blue values that are suitable for a subsequent call
	--  to Allocate_Color or Store_Color. The color can be specified as a
	--  color name, or as an initial sharp character followed by a numeric
	--  specification in one of the following formats:
	--
	--    #RGB                      ( 4 bits each)
	--    #RRGGBB                   ( 8 bits each)
	--    #RRRGGGBBB                (12 bits each)
	--    #RRRRGGGGBBBB             (16 bits each)
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map_Id     : Specifies the Color_Map ID.
	--  Color_Name : Specifies the name or specification.
	--  Screen_Def : Returns the actual values used in the color map.
	--  Success    : Returns the success of the operation.
	--
	--  Documentation
	--
	--    Please refer to XParseColor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Parse_Color (Display_Id : in Display;
				 Map_Id : in Color_Map;
				 Color_Name : in String;
				 Screen_Def : out Color_Record;
				 Success : out Boolean);

	-- new for R4
	function X_Alloc_Standard_Colormap return Standard_Colormap_Record;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Standard_Colormap
	--
	--  Description
	--
	--    This procedure gets the standard Colormap associated with on of the
	--  described atoms.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the X Server connection.
	--  Window_Id  : Specifies the Window.
	--  Property   : Specifies which property to set.
	--  Cmap_Return: Returns the Colormap record for the property.
	--
	--  Documentation
	--
	--    Please refer to XGetStandardColormap in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Get_Standard_Colormap
		     (Display_Id : in Display;
		      Window_Id : in Window;
		      Property : in Atoms.Atom;
		      Cmap_Return : out Standard_Colormap_Record;
		      Success : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Standard_Colormap
	--
	--  Description
	--
	--    This procedure sets the standard Colormap associated with on of the
	--  described atoms.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the X Server connection.
	--  Window_Id  : Specifies the Window.
	--  Cmap       : Specifies the Colormap record for the property.
	--  Property   : Specifies which property to set.
	--
	--  Documentation
	--
	--    Please refer to XSetStandardColormap in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  colors
	--======================================================================

	procedure X_Set_Standard_Colormap (Display_Id : in Display;
					   Window_Id : in Window;
					   Cmap : in Standard_Colormap_Record;
					   Property : in Atoms.Atom);
    private
--	type Color_Map is new X_Id;

	Null_Color_Map : constant Color_Map := 0;

	type Color_Map_Allocator is new Int32;
	Allocate_None : constant Color_Map_Allocator := 0;
	Allocate_All : constant Color_Map_Allocator := 1;
    end Colors;

    package Cursors is
--	type Cursor is private;

	Null_Cursor : constant Cursor;

	subtype Cursor_Shape is X_Character;

	--
	-- Font Cursors
	--
	Xc_X_Cursor : constant Cursor_Shape := 0;
	Xc_Arrow : constant Cursor_Shape := 2;
	Xc_Based_Arrow_Down : constant Cursor_Shape := 4;
	Xc_Based_Arrow_Up : constant Cursor_Shape := 6;
	Xc_Boat : constant Cursor_Shape := 8;
	Xc_Bogosity : constant Cursor_Shape := 10;
	Xc_Bottom_Left_Corner : constant Cursor_Shape := 12;
	Xc_Bottom_Right_Corner : constant Cursor_Shape := 14;
	Xc_Bottom_Side : constant Cursor_Shape := 16;
	Xc_Bottom_Tee : constant Cursor_Shape := 18;
	Xc_Box_Spiral : constant Cursor_Shape := 20;
	Xc_Center_Ptr : constant Cursor_Shape := 22;
	Xc_Circle : constant Cursor_Shape := 24;
	Xc_Clock : constant Cursor_Shape := 26;
	Xc_Coffee_Mug : constant Cursor_Shape := 28;
	Xc_Cross : constant Cursor_Shape := 30;
	Xc_Cross_Reverse : constant Cursor_Shape := 32;
	Xc_Crosshair : constant Cursor_Shape := 34;
	Xc_Diamond_Cross : constant Cursor_Shape := 36;
	Xc_Dot : constant Cursor_Shape := 38;
	Xc_Dot_Box_Mask : constant Cursor_Shape := 40;
	Xc_Double_Arrow : constant Cursor_Shape := 42;
	Xc_Draft_Large : constant Cursor_Shape := 44;
	Xc_Draft_Small : constant Cursor_Shape := 46;
	Xc_Draped_Box : constant Cursor_Shape := 48;
	Xc_Exchange : constant Cursor_Shape := 50;
	Xc_Fleur : constant Cursor_Shape := 52;
	Xc_Gobbler : constant Cursor_Shape := 54;
	Xc_Gumby : constant Cursor_Shape := 56;
	Xc_Hand : constant Cursor_Shape := 58;
	Xc_Handl_Mask : constant Cursor_Shape := 60;
	Xc_Heart : constant Cursor_Shape := 62;
	Xc_Icon : constant Cursor_Shape := 64;
	Xc_Iron_Cross : constant Cursor_Shape := 66;
	Xc_Left_Ptr : constant Cursor_Shape := 68;
	Xc_Left_Side : constant Cursor_Shape := 70;
	Xc_Left_Tee : constant Cursor_Shape := 72;
	Xc_Leftbutton : constant Cursor_Shape := 74;
	Xc_Ll_Angle : constant Cursor_Shape := 76;
	Xc_Lr_Angle : constant Cursor_Shape := 78;
	Xc_Man : constant Cursor_Shape := 80;
	Xc_Middlebutton : constant Cursor_Shape := 82;
	Xc_Mouse : constant Cursor_Shape := 84;
	Xc_Pencil : constant Cursor_Shape := 86;
	Xc_Pirate : constant Cursor_Shape := 88;
	Xc_Plus : constant Cursor_Shape := 90;
	Xc_Question_Arrow : constant Cursor_Shape := 92;
	Xc_Right_Ptr : constant Cursor_Shape := 94;
	Xc_Right_Side : constant Cursor_Shape := 96;
	Xc_Right_Tee : constant Cursor_Shape := 98;
	Xc_Rightbutton : constant Cursor_Shape := 100;
	Xc_Rtl_Logo : constant Cursor_Shape := 102;
	Xc_Sailboat : constant Cursor_Shape := 104;
	Xc_Sb_Down_Arrow : constant Cursor_Shape := 106;
	Xc_Sb_H_Double_Arrow : constant Cursor_Shape := 108;
	Xc_Sb_Left_Arrow : constant Cursor_Shape := 110;
	Xc_Sb_Right_Arrow : constant Cursor_Shape := 112;
	Xc_Sb_Up_Arrow : constant Cursor_Shape := 114;
	Xc_Sb_V_Double_Arrow : constant Cursor_Shape := 116;
	Xc_Shuttle : constant Cursor_Shape := 118;
	Xc_Sizing : constant Cursor_Shape := 120;
	Xc_Spider : constant Cursor_Shape := 122;
	Xc_Spraycan : constant Cursor_Shape := 124;
	Xc_Star : constant Cursor_Shape := 126;
	Xc_Target : constant Cursor_Shape := 128;
	Xc_Tcross : constant Cursor_Shape := 130;
	Xc_Top_Left_Arrow : constant Cursor_Shape := 132;
	Xc_Top_Left_Corner : constant Cursor_Shape := 134;
	Xc_Top_Right_Corner : constant Cursor_Shape := 136;
	Xc_Top_Side : constant Cursor_Shape := 138;
	Xc_Top_Tee : constant Cursor_Shape := 140;
	Xc_Trek : constant Cursor_Shape := 142;
	Xc_Ul_Angle : constant Cursor_Shape := 144;
	Xc_Umbrella : constant Cursor_Shape := 146;
	Xc_Ur_Angle : constant Cursor_Shape := 148;
	Xc_Watch : constant Cursor_Shape := 150;
	Xc_Xterm : constant Cursor_Shape := 152;
	Xc_Num_Glyphs : constant Cursor_Shape := 154;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Create_Font_Cursor
	--
	--  Description
	--
	--    This function creates a cursor from a standard set of cursor shapes
	--- (Font cursors).
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Shape      : Specifies a cursor shape.
	--
	--  Documentation
	--
	--    Please refer to XCreateFontCursor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  cursors
	--======================================================================

	function X_Create_Font_Cursor
		    (Display_Id : in Display; Shape : in Cursor_Shape)
		    return Cursor;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Create_Pixmap_Cursor
	--
	--  Description
	--
	--    This function creates a cursor from two bitmaps.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Source     : Specifies the Cursor pixmap.
	--  Mask       : Specifies the Mask pixmap.
	--  Foreground : Specifies the RGB values for the foreground of Source.
	--  Background : Specifies the RGB values for the background of Source.
	--  Hot_Spot   : Specifies the coordinates of the hot spot.
	--
	--  Documentation
	--
	--    Please refer to XCreatePixmapCursor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  cursors
	--======================================================================

	function X_Create_Pixmap_Cursor (Display_Id : in Display;
					 Source : in Pixmap;
					 Mask : in Pixmap;
					 Foreground : in Colors.Color_Record;
					 Background : in Colors.Color_Record;
					 X_Hot : in Coordinate;
					 Y_Hot : in Coordinate) return Cursor;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Create_Glyph_Cursor
	--
	--  Description
	--
	--    This function creates a cursor from font glyphs, that is, it will
	--  use an element (glyph) of a specified font as the cursor.
	--
	--  Parameters
	--
	--  Display_Id   : Specifies the connection to the X Server.
	--  Source_Font  : Specifies the font for the source glyph.
	--  Mask_Font    : Specifies the font for the mask glyph.
	--  Source_Glyph : Specifies a glyph character in the source font.
	--  Mask_Glyph   : Specifies a glyph character in the mask font.
	--  Foreground   : Specifies the RGB values for the foreground of Source.
	--  Background   : Specifies the RGB values for the background of Source.
	--
	--  Documentation
	--
	--    Please refer to XCreateGlyphCursor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  cursors
	--======================================================================

	function X_Create_Glyph_Cursor
		    (Display_Id : in Display;
		     Source_Font : in Fonts.Font;
		     Mask_Font : in Fonts.Font;
		     Source_Glyph : in X_Character;
		     Mask_Glyph : in X_Character;
		     Foreground : in Colors.Color_Record;
		     Background : in Colors.Color_Record) return Cursor;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Recolor_Cursor
	--
	--  Description
	--
	--    This procedure changes the color of the specified cursor.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Cursor_Id  : Specifies the Id of the cursor.
	--  Foreground : Specifies the RGB values for the cursor foreground.
	--  Background : Specifies the RGB values for the cursor background.
	--
	--  Documentation
	--
	--    Please refer to XRecolorCursor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  cursors
	--======================================================================

	procedure X_Recolor_Cursor (Display_Id : in Display;
				    Cursor_Id : in Cursor;
				    Foreground : in Colors.Color_Record;
				    Background : in Colors.Color_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Free_Cursor
	--
	--  Description
	--
	--    This procedure frees a cursor.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Cursor_Id  : Specfies the Id of the cursor.
	--
	--  Documentation
	--
	--    Please refer to XFreeCursor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  cursors
	--======================================================================

	procedure X_Free_Cursor (Display_Id : in Display;
				 Cursor_Id : in out Cursor);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Query_Best_Cursor
	--
	--  Description
	--
	--    This procedure returns the best cursor width and height for the
	--  current display.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  Drawable_Id : Specifies the drawable.
	--  Width       : Specifies the requested width.
	--                Returns the closest width.
	--  Height      : Specifies the requested height.
	--                Returns the closest height.
	--
	--
	--  Documentation
	--
	--    Please refer to XQueryBestCursor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  cursors
	--======================================================================

	procedure X_Query_Best_Cursor (Display_Id : in Display;
				       Drawable_Id : in Drawable;
				       Width : in out Width_Height;
				       Height : in out Width_Height);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Define_Cursor
	--
	--  Description
	--
	--    This procedure defines the cursor to be used in a window.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Window_Id  : Specifies the window.
	--  Cursor_Id  : Specifies the Id of the cursor.
	--
	--  Documentation
	--
	--    Please refer to XDefineCursor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  cursors
	--======================================================================

	procedure X_Define_Cursor (Display_Id : in Display;
				   Window_Id : in Window;
				   Cursor_Id : in Cursor);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Undefine_Cursor
	--
	--  Description
	--
	--    This procedure undefines the mouse cursor in the specified window.
	--  When the mouse is in the window, the parent cursor will now then be
	--  used.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Window_Id  : Specifies the window.
	--
	--
	--  Documentation
	--
	--    Please refer to XUndefineCursor in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  cursors
	--======================================================================

	procedure X_Undefine_Cursor
		     (Display_Id : in Display; Window_Id : in Window);
    private
--	type Cursor is new X_Id;

	Null_Cursor : constant Cursor := 0;
    end Cursors;

    package Cut_And_Paste is
	--======================================================================
	--  Subprogram Name
	--
	--    X_Store_Buffer
	--    (X_Store_Bytes)
	--
	--  Description
	--
	--    This procedure stores data in the specified cut buffer.
	--  The default for To_Buffer makes this equivalent to Store_Bytes.
	--
	--  Parameters
	--
	--  Display_Id      : Specifies the connection to the X Server.
	--  Data            : Specifies the data to store.
	--  Number_Of_Bytes : Specifies the length in bytes of the data.
	--  To_Buffer       : Specifies the buffer to use.
	--
	--  Documentation
	--
	--    Please refer to XStoreBuffer in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  cut_and_paste
	--======================================================================

	procedure X_Store_Buffer (Display_Id : in Display;
				  Data : in Bytes;
				  Number_Of_Bytes : in Positive;
				  To_Buffer : in Natural := 0);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Fetch_Buffer
	--    (X_Fetch_Bytes)
	--
	--  Description
	--
	--    This function fetches data from the specified cut buffer.
	--  The default for From_Buffer makes this equivalent to Fetch_Bytes.
	--
	--  Parameters
	--
	--  Display_Id  : Specifies the connection to the X Server.
	--  From_Buffer : Specifies the buffer to use.
	--
	--  Documentation
	--
	--    Please refer to XFetchBuffer in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  cut_and_paste
	--======================================================================

	function X_Fetch_Buffer
		    (Display_Id : in Display; From_Buffer : in Natural := 0)
		    return Bytes;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Rotate_Buffers
	--
	--  Description
	--
	--    This procedure rotates the cut buffers such that buffer 0 becomes
	--  buffer n, buffer 1 becomes buffer n+1 mod 8, etc.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  To_Buffer  : Specifies the buffer to use.
	--
	--  Documentation
	--
	--    Please refer to XRotateBuffers in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  cut_and_paste
	--======================================================================

	procedure X_Rotate_Buffers (Display_Id : in Display; By : in Integer);
    end Cut_And_Paste;

    package Regions is
	type Region is private;

	type Region_Results is private;
	Rectangle_Out : constant Region_Results;
	Rectangle_In : constant Region_Results;
	Rectangle_Part : constant Region_Results;
	function Create_Constant
		    (Value : in X_Long_Integer) return Region_Results;

	Null_Region : constant Region;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Polygon_Region
	--
	--  Description
	--
	--    This function generates a region from an array of points.
	--
	--  Parameters
	--
	--  Points    : Specifies an array of points defining the region.
	--  Rule      : Specifies Even_Odd_Rule or Winding_Rule.
	--
	--  Documentation
	--
	--    Please refer to XPolygonRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	function X_Polygon_Region
		    (Points : in Point_Array;
		     Rule : in Graphic_Output.Fill_Rule_Type) return Region;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Clip_Box
	--
	--  Description
	--
	--    This procedure generates the smallest rectangle enclosing the
	--  specified rectangle that is in the specified region.
	--
	--  Parameters
	--
	--  Region_Id : Specifies the region Id.
	--  Rectangle : Specifies the requested rectangle.
	--              Returns the smallest enclosing rectangle.
	--
	--  Documentation
	--
	--    Please refer to XClipBox in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	procedure X_Clip_Box (Region_Id : in Region; Bounds : in out Rectangle);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Create_Region
	--
	--  Description
	--
	--    This function creates a new, empty region.
	--
	--  Documentation
	--
	--    Please refer to XCreateRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	function X_Create_Region return Region;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Region
	--
	--  Description
	--
	--    This procedure sets the clip_Mask in the gc to the specified
	--  region. Once it is set in the graphics context, the region can be
	--  destroyed.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  GC         : Specifies the graphics context ID.
	--  Region_Id  : Specifies the region Id.
	--
	--  Documentation
	--
	--    Please refer to XSetRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	procedure X_Set_Region (Display_Id : in Display;
				Gc : in Graphic_Output.Graphic_Context;
				Region_Id : in Region);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Destroy_Region
	--
	--  Description
	--
	--    This procedure frees a previously defined region.
	--
	--  Parameters
	--
	--  Region_Id : Specifies the region Id.
	--
	--  Documentation
	--
	--    Please refer to XDestroyRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	procedure X_Destroy_Region (Region_Id : in out Region);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Offset_Region
	--
	--  Description
	--
	--    This procedure moves a region by a specified amount.
	--
	--  Parameters
	--
	--  Region_Id : Specifies the region Id.
	--  Delta_Xy  : The X and Y amount to offset the region.
	--
	--  Documentation
	--
	--    Please refer to XOffsetRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	procedure X_Offset_Region (Region_Id : in Region;
				   Delta_X : in Coordinate;
				   Delta_Y : in Coordinate);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Shrink_Region
	--
	--  Description
	--
	--    This procedure expands or shrinks a region
	--  by the Delta_XY amount. POSITIVE
	--  values shrink the region and negative values expand the region.
	--
	--  Parameters
	--
	--  Region_Id : Specifies the region Id.
	--  Delta_Xy  : The X and Y amount to shrink the region.
	--
	--  Documentation
	--
	--    Please refer to XShrinkRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	procedure X_Shrink_Region (Region_Id : in Region;
				   Delta_X : in Coordinate;
				   Delta_Y : in Coordinate);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Intersect_Region
	--
	--  Description
	--
	--    This procedure computes the intersection of two regions.
	--
	--  Parameters
	--
	--  Source_A    :
	--  Source_B    : The regions to intersect.
	--  Destination : The result of the computation.
	--
	--  Documentation
	--
	--    Please refer to XIntersectRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	procedure X_Intersect_Region (Source_A : in Region;
				      Source_B : in Region;
				      Destination : in Region);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Union_Region
	--
	--  Description
	--
	--    This procedure computes the union of two regions.
	--
	--  Parameters
	--
	--  Source_A    :
	--  Source_B    : The regions with which you perform the union.
	--  Destination : The result of the computation.
	--
	--  Documentation
	--
	--    Please refer to XUnionRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	procedure X_Union_Region (Source_A : in Region;
				  Source_B : in Region;
				  Destination : in Region);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Union_Rectangle_With_Region
	--
	--  Description
	--
	--    This procedure computes the union of a rectangle and a region.
	--
	--  Parameters
	--
	--  Source_A      : The rectangle
	--  Source_B      : The region with which you perform the union.
	--  Destination   : The result of the computation.
	--
	--  Documentation
	--
	--    Please refer to XUnionRectangleWithRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	procedure X_Union_Rect_With_Region (Source_A : in Rectangle;
					    Source_B : in Region;
					    Destination : in Region);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Subtract_Region
	--
	--  Description
	--
	--    This procedure computes the intersection of two regions.
	--
	--  Parameters
	--
	--  Source_A    :
	--  Source_B    : The regions with which you perform the subtraction.
	--  Destination : The result of the computation.
	--
	--  Documentation
	--
	--    Please refer to XSubtractRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	procedure X_Subtract_Region (Source_A : in Region;
				     Source_B : in Region;
				     Destination : in Region);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Xor_Region
	--
	--  Description
	--
	--    This procedure computes the difference between
	--  the union and intersection of two regions.
	--
	--  Parameters
	--
	--  Source_A    :
	--  Source_B    : The regions to compute.
	--  Destination : The result of the computation.
	--
	--  Documentation
	--
	--    Please refer to XXorRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	procedure X_Xor_Region (Source_A : in Region;
				Source_B : in Region;
				Destination : in Region);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Empty_Region
	--
	--  Description
	--
	--    This function returns TRUE if the specified region is empty.
	--
	--  Parameters
	--
	--  Region_Id : Specifies the region.
	--
	--  Documentation
	--
	--    Please refer to XEmptyRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	function X_Empty_Region (Region_Id : in Region) return Boolean;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Equal_Region
	--
	--  Description
	--
	--    This function returns TRUE if the specified regions are equal.
	--
	--  Parameters
	--
	--  Region_1 :
	--  Region_2 : Specifies the two regions.
	--
	--  Documentation
	--
	--    Please refer to XEqualRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	function X_Equal_Region (Region_1, Region_2 : in Region) return Boolean;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Point_In_Region
	--
	--  Description
	--
	--    This function returns TRUE if the point is in the specified region.
	--
	--  Parameters
	--
	--  Region_Id : Specifies the region.
	--  Xy        : Specifies the point.
	--
	--  Documentation
	--
	--    Please refer to XPointInRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	function X_Point_In_Region (Region_Id : in Region;
				    X : in Coordinate;
				    Y : in Coordinate) return Boolean;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Rectangle_In_Region
	--
	--  Description
	--
	--    This function returns TRUE if the rectangle is in the specified
	--  region.
	--
	--  Parameters
	--
	--  Region_Id : Specifies the region.
	--  Bounds    : Specifies the rectangle.
	--
	--  Documentation
	--
	--    Please refer to XRectangleInRegion in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  regions
	--======================================================================

	function X_Rect_In_Region
		    (Region_Id : in Region;
		     X : in Coordinate;
		     Y : in Coordinate;
		     Width : in Width_Height;
		     Height : in Width_Height) return Region_Results;
    private
	type Region is new Unsigned_Long; -- range 0 .. (2 ** 28) - 1;

	type Region_Results is new Int32;
	Rectangle_Out : constant Region_Results := 0;
	Rectangle_In : constant Region_Results := 1;
	Rectangle_Part : constant Region_Results := 2;

	Null_Region : constant Region := 0;
    end Regions;

    package Keyboard is
	type Key_Code is new X_Character;
	type Key_Code_Array is array (Natural range <>) of Key_Code;
	type Key_Code_List is access Key_Code_Array;
	Null_Key_Code_Array : Key_Code_Array (1 .. 0);

	type Key_Sym is new X_Id;

	No_Symbol : constant Key_Sym := 0;

	type Key_Sym_Array is array (Natural range <>) of Key_Sym;
	type Key_Sym_List is access Key_Sym_Array;
	Null_Key_Sym_Array : Key_Sym_Array (1 .. 0);

	type Keyboard_Encoding_Array is
	   array (Key_Code range <>) of Key_Sym_List;
	type Keyboard_Encoding_Array_Ptr is access Keyboard_Encoding_Array;
	Null_Keyboard_Encoding_Array : Keyboard_Encoding_Array (1 .. 0);

	type Key_Vector_Mask_Type is array (Key_Code) of Boolean;

	type Milliseconds_Type is new Short range -1 .. 5_000;

	type Bell_Volume_Type is new Char range -100 .. 100;

	type Percent_Type is new Char range -1 .. 100;

	type Hertz_Type is new Short range -1 .. 1000;

	type Led_Mode_Type is private;
	Led_Mode_Off : constant Led_Mode_Type;
	Led_Mode_On : constant Led_Mode_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Led_Mode_Type;

	subtype Led_Type is Card8 range 1 .. 32;

	type Led_Mask_Type is new X_Mask_Type;
	No_Led_Mask : constant Led_Mask_Type := Led_Mask_Type (Null_X_Mask);

	type Auto_Repeat_Mode_Type is private;
	Auto_Repeat_Off : constant Auto_Repeat_Mode_Type;
	Auto_Repeat_On : constant Auto_Repeat_Mode_Type;
	Auto_Repeat_Default : constant Auto_Repeat_Mode_Type;
	function Create_Constant (Value : in X_Long_Integer)
				 return Auto_Repeat_Mode_Type;

	type Keyboard_Control_Record is
	    record
		Key_Click_Percent : Percent_Type;
		Bell_Volume : Bell_Volume_Type;
		Bell_Pitch : Hertz_Type;
		Bell_Duration : Milliseconds_Type;
		Led : Led_Type;
		Led_Mode : Led_Mode_Type;
		Key : Key_Code;
		Auto_Repeat_Mode : Auto_Repeat_Mode_Type;
	    end record;

	type Keyboard_Control_Mask is new X_Mask_Type;

	No_Keyboard_Control : constant Keyboard_Control_Mask :=
	   Keyboard_Control_Mask (Null_X_Mask);
	Key_Click_Percent_Mask : constant Keyboard_Control_Mask :=
	   Create_Constant (2 ** 0);
	Bell_Volume_Mask : constant Keyboard_Control_Mask :=
	   Create_Constant (2 ** 1);
	Bell_Pitch_Mask : constant Keyboard_Control_Mask := Create_Constant (2);
	Bell_Duration_Mask : constant Keyboard_Control_Mask :=
	   Create_Constant (2 ** 3);
	Led_Mask : constant Keyboard_Control_Mask := Create_Constant (2 ** 4);
	Led_Mode_Mask : constant Keyboard_Control_Mask :=
	   Create_Constant (2 ** 5);
	Key_Code_Mask : constant Keyboard_Control_Mask :=
	   Create_Constant (2 ** 6);
	Auto_Repeat_Mode_Mask : constant Keyboard_Control_Mask :=
	   Create_Constant (2 ** 7);

	type Keyboard_State_Record is
	    record
		Key_Click_Percent : Percent_Type;
		Bell_Volume : Bell_Volume_Type;
		Bell_Pitch : Hertz_Type;
		Bell_Duration : Milliseconds_Type;
		Led_Mask : Led_Mask_Type;
		Global_Auto_Repeat : Auto_Repeat_Mode_Type;
		Auto_Repeats : Key_Vector_Mask_Type;
	    end record;

	type Modifier_Type is private;
	Shift : constant Modifier_Type;
	Lock : constant Modifier_Type;
	Control : constant Modifier_Type;
	Mod_1 : constant Modifier_Type;
	Mod_2 : constant Modifier_Type;
	Mod_3 : constant Modifier_Type;
	Mod_4 : constant Modifier_Type;
	Mod_5 : constant Modifier_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Modifier_Type;

	Num_Modifiers : constant := 8;
	-- corresponding to ShiftMapIndex, LockMapIndex, CnotrolMapIndex,
	--                  Mod1MapIndex, Mod2MapIndex, Mod3MapIndex
	--                  Mod4MapIndex, Mod5MapIndex, above

	-- Map_Size is Max_Keys_Per_Mod * Num_Modifiers
	type Modifier_Key_Record (Map_Size : Natural) is
	    record
		Max_Keys_Per_Mod : Natural := Map_Size / Num_Modifiers;
		Modifier_Map : Key_Code_Array (1 .. Map_Size);
	    end record;
	type Modifier_Keymap is access Modifier_Key_Record;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Rebind_Keysym
	--
	--  Description
	--
	--    This Procedure rebinds the meaning of a Key_Sym for a client.
	--  It does not redefine the Key_Code in the X Server but merely provides
	--  an easy way for long strings to be attached to keys. Lookup_String
	--  returns this string when the appropriate set of modifier keys are
	--  pressed and when the Key_Sym would have been used for the
	--  translation.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  The_Symbol : Specifies the Key_Sym to be rebound.
	--  Modifiers  : Specifies a list of Key_Syms to be used as modifiers.
	--  Text       : Specifies the string to be returned by Lookup_String.
	--
	--  Documentation
	--
	--    Please refer to XRebindKeysym in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	procedure X_Rebind_Keysym (Display_Id : in Display;
				   The_Symbol : in Key_Sym;
				   Modifiers : in Key_Sym_List;
				   Text : in String);

	--======================================================================
	--  Subprogram Name
	--
	--    X_String_To_Keysym
	--
	--  Description
	--
	--    This Function converts the name of the Key_Sym to the Key_Sym code.
	--  No_Symbol is returned when the specified string does not match a
	--  valid Key_Sym.
	--
	--  Parameters
	--
	--  Name : Specifies the name of the Key_Sym.
	--
	--  Documentation
	--
	--    Please refer to XStringToKeysym in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function X_String_To_Keysym (Name : in String) return Key_Sym;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Keysym_To_String
	--
	--  Description
	--
	--    This Function converts the Key_Sym code to the Key_Sym name.
	--  Null string is returned when the specified Key_Sym is not defined.
	--
	--  Parameters
	--
	--  The_Symbol : Specifies the Key_Sym to be converted.
	--
	--  Documentation
	--
	--    Please refer to XKeysymToString in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function X_Keysym_To_String (The_Symbol : in Key_Sym) return String;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Keycode_To_Keysym
	--
	--  Description
	--
	--    This procedure returns the Key_Sym defined for the specified
	--  Key_Code and the element of the Key_Code vector.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Key_Code   : Specifies the Key_Code to be searched for.
	--  Key        : Returns the Key number in the key_vector.
	--  The_Symbol : Returns the Key_Sym defined for the Key Code.
	--
	--  Documentation
	--
	--    Please refer to XKeycodeToKeysym in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	procedure X_Keycode_To_Keysym (Display_Id : in Display;
				       Kc : in Key_Code;
				       Index : in Int;
				       The_Symbol : out Key_Sym);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Keysym_To_Keycode
	--
	--  Description
	--
	--    This Function converts a Key_Sym to the appropriate Key_Code. Zero
	--  is returned when the specified Key_Sym is not defined.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  The_Symbol : Specifies the Key_Sym to be converted.
	--
	--  Documentation
	--
	--    Please refer to XKeysymToKeycode in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function X_Keysym_To_Keycode
		    (Display_Id : in Display; The_Symbol : in Key_Sym)
		    return Key_Code;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Change_Keyboard_Control
	--
	--  Description
	--
	--    This Procedure controls the keyboard characteristics defined by the
	--  Keyboard_Control record.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Value_Mask : Specifies which values are to be changed.
	--  Values     : Specifies the new values.
	--
	--  Documentation
	--
	--    Please refer to XChangeKeyboardControl in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	procedure X_Change_Keyboard_Control
		     (Display_Id : in Display;
		      Value_Mask : in Keyboard_Control_Mask;
		      Values : in Keyboard_Control_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Keyboard_Control
	--
	--  Description
	--
	--    This function returns the current control values for the Keyboard.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Keyboard_State : returns the State of the Keyboard.
	--
	--  Documentation
	--
	--    Please refer to XGetKeyboardControl in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function X_Get_Keyboard_Control
		    (Display_Id : in Display) return Keyboard_State_Record;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Auto_Repeat_On
	--
	--  Description
	--
	--    This Procedure turns on the auto-repeat for the keyboard on the
	--  display.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--
	--  Documentation
	--
	--    Please refer to XAutoRepeatOn in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	procedure X_Auto_Repeat_On (Display_Id : in Display);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Auto_Repeat_Off
	--
	--  Description
	--
	--    This Procedure turns off the auto-repeat for the keyboard on the
	--  display.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--
	--  Documentation
	--
	--    Please refer to XAutoRepeatOff in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	procedure X_Auto_Repeat_Off (Display_Id : in Display);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Bell
	--
	--  Description
	--
	--    This Procedure rings the bell on the keyboard on the specified
	--  display, if possible. The specified volume is relative to the base
	--  volume for the Keyboard.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Volume     : Specifies the base volume for the bell.
	--
	--  Documentation
	--
	--    Please refer to XBell in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	procedure X_Bell (Display_Id : in Display;
			  Volume : in Bell_Volume_Type);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Query_Keymap
	--
	--  Description
	--
	--    This function returns a bit vector for the keyboard where each one
	--  bit indicates that the corresponding key is down.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Key_Map    : Returns the key map vector.
	--
	--  Documentation
	--
	--    Please refer to XQueryKeymap in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function X_Query_Keymap (Display_Id : in Display)
				return Keyboard.Key_Vector_Mask_Type;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Keyboard_Mapping
	--
	--  Description
	--
	--    This procedure returns the symbols for the specified number of
	--  keycodes beginning with the First_Code specified. The Syms array
	--  must be indexed by a range of key codes which indicates both the
	--  first code and the desired number of codes. That is,
	--
	--    Mappings : Keyboard_Encoding_Array ( 100 .. 110 );
	--
	--  indicates that eleven codes should be returned starting with key code
	--  100. The length of the Key_Syms list for each key code is implicit
	--  in the list returned.
	--
	--  Parameters
	--
	--  Display_Id    : Specifies the connection to the X Server.
	--  Syms          : The keys to look up.
	--
	--
	--  Documentation
	--
	--    Please refer to XGetKeyboardMapping in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	procedure X_Get_Keyboard_Mapping
		     (Display_Id : in Display;
		      Syms : in out Keyboard_Encoding_Array);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Change_Keyboard_Mapping
	--
	--  Description
	--
	--    This Procedure defines the symbols for the specified number of
	--  keycodes beginning with the First_Keycode. As above, the first
	--  keycode and number of key codes is set by the indexes of the key_
	--  encoding_Array. The length of the Key_Syms_List for each key code
	--  must be a fixed length.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Syms       : Specifies key syms for each key code in the list.
	--
	--  Documentation
	--
	--    Please refer to XChangeKeyboardMapping in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	procedure X_Change_Keyboard_Mapping (Display_Id : in Display;
					     Syms : in Keyboard_Encoding_Array);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Display_Keycodes
	--
	--  Description
	--
	--    This function is returns BOTH the Minimum and Maximum keycode
	--  supported by the specified display.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--
	--  Documentation
	--
	--    Please refer to XDisplayKeycodes in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	procedure X_Display_Keycodes
		     (Display_Id : in Display;
		      Min_Keycode_Return : out Keyboard.Key_Code;
		      Max_Keycode_Return : out Keyboard.Key_Code);

	function X_New_Modifier_Map (Max_Keys_Per_Mod : in X_Long_Integer)
				    return Modifier_Keymap;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Modifier_Mapping
	--
	--  Description
	--
	--    This function maps the key codes to be used as modifiers.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Modifiers  : Specifies a Modifier_Keymap containing modifier:Key_Code
	--               mappings for each modifier. This length of this list is
	--               set by the Max_Keys_Per_Modifier discriminant.
	--
	--  Documentation
	--
	--    Please refer to XSetModifierMapping in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function X_Set_Modifier_Mapping
		    (Display_Id : in Display; Modifiers : in Modifier_Keymap)
		    return Map_Status;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Insert_Modifier_Map_Entry
	--
	--  Description
	--
	--    This procedure inserts a Key : Modifier mapping into a client
	--  modifier mapping.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map        : Specifies the client map.
	--  Key        : The key to insert
	--  Modifier   : The modifier to map to the key
	--
	--  Documentation
	--
	--    Please refer to XInsertModifierMapEntry in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function X_Insert_Modifier_Map_Entry
		    (Map : in Modifier_Keymap;
		     Key : in Key_Code;
		     Modifier : in Modifier_Type) return Modifier_Keymap;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Delete_Modifier_Map_Entry
	--
	--  Description
	--
	--    This procedure deletes a Key : Modifier mapping in a client
	--  modifier mapping.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--  Map        : Specifies the client map.
	--  Key        : The key to delete
	--  Modifier   : The modifier mapped to the key
	--
	--  Documentation
	--
	--    Please refer to XDeleteModifierMapEntry in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function X_Delete_Modifier_Map_Entry
		    (Map : in Modifier_Keymap;
		     Key : in Key_Code;
		     Modifier : in Modifier_Type) return Modifier_Keymap;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Modifier_Mapping
	--
	--  Description
	--
	--    This function returns the modifier:key code mapping for the X
	--  Server.
	--
	--  Parameters
	--
	--  Display_Id : Specifies the connection to the X Server.
	--
	--  Documentation
	--
	--    Please refer to XGetModifierMapping in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function X_Get_Modifier_Mapping
		    (Display_Id : in Display) return Modifier_Keymap;

	procedure X_Free_Modifier_Map (Modmap : in Modifier_Keymap);

	--======================================================================
	--  Subprogram Name
	--
	--    Is_Keypad_Key
	--
	--  Description
	--
	--    This Function returns true if the Key_Sym is a Keypad Key.
	--
	--  Documentation
	--
	--    Please refer to IsKeypadKey in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function Is_Keypad_Key (Sym : in Key_Sym) return Boolean;

	--======================================================================
	--  Subprogram Name
	--
	--    Is_Cursor_Key
	--
	--  Description
	--
	--    This Function returns true if the Key_Sym is a Cursor Key.
	--
	--  Documentation
	--
	--    Please refer to IsCursorKey in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function Is_Cursor_Key (Sym : in Key_Sym) return Boolean;

	--======================================================================
	--  Subprogram Name
	--
	--    Is_PF_Key
	--
	--  Description
	--
	--    This Function returns true if the Key_Sym is a PF Key.
	--
	--  Documentation
	--
	--    Please refer to IsPFKey in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function Is_Pf_Key (Sym : in Key_Sym) return Boolean;

	--======================================================================
	--  Subprogram Name
	--
	--    Is_Function_Key
	--
	--  Description
	--
	--    This Function returns true if the Key_Sym is a Function Key.
	--
	--  Documentation
	--
	--    Please refer to IsFunctionKey in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function Is_Function_Key (Sym : in Key_Sym) return Boolean;

	--======================================================================
	--  Subprogram Name
	--
	--    Is_Misc_Function_Key
	--
	--  Description
	--
	--    This Function returns true if the Key_Sym is a Misc Function Key.
	--
	--  Documentation
	--
	--    Please refer to IsMiscFunctionKey in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function Is_Misc_Function_Key (Sym : in Key_Sym) return Boolean;

	--======================================================================
	--  Subprogram Name
	--
	--    Is_Modifier_Key
	--
	--  Description
	--
	--    This Function returns true if the Key_Sym is a Modifier Key.
	--
	--  Documentation
	--
	--    Please refer to IsModifierKey in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  keyboard
	--======================================================================

	function Is_Modifier_Key (Sym : in Key_Sym) return Boolean;
    private
	type Led_Mode_Type is new Int32;
	Led_Mode_Off : constant Led_Mode_Type := 0;
	Led_Mode_On : constant Led_Mode_Type := 1;

	type Auto_Repeat_Mode_Type is new Int32;
	Auto_Repeat_Off : constant Auto_Repeat_Mode_Type := 0;
	Auto_Repeat_On : constant Auto_Repeat_Mode_Type := 1;
	Auto_Repeat_Default : constant Auto_Repeat_Mode_Type := 2;

	type Modifier_Type is new Int32;
	Shift : constant Modifier_Type := 0;
	Lock : constant Modifier_Type := 1;
	Control : constant Modifier_Type := 2;
	Mod_1 : constant Modifier_Type := 3;
	Mod_2 : constant Modifier_Type := 4;
	Mod_3 : constant Modifier_Type := 5;
	Mod_4 : constant Modifier_Type := 6;
	Mod_5 : constant Modifier_Type := 7;
    end Keyboard;

    package Events is
	type Event_Queue_Mode_Type is private;
	Queued_Already : constant Event_Queue_Mode_Type;
	Queued_After_Reading : constant Event_Queue_Mode_Type;
	Queued_After_Flush : constant Event_Queue_Mode_Type;
	function Create_Constant (Value : in X_Long_Integer)
				 return Event_Queue_Mode_Type;

--	type Event_Type is new Long;

	Unused_Event_1 : constant Event_Type := 0;
	Unused_Event_2 : constant Event_Type := 1;
--	Key_Press : constant Event_Type := 2;
--	Key_Release : constant Event_Type := 3;
--	Button_Press : constant Event_Type := 4;
--	Button_Release : constant Event_Type := 5;
--	Motion_Notify : constant Event_Type := 6;
--	Enter_Notify : constant Event_Type := 7;
--	Leave_Notify : constant Event_Type := 8;
--	Focus_In : constant Event_Type := 9;
--	Focus_Out : constant Event_Type := 10;
--	Keymap_Notify : constant Event_Type := 11;
--	Expose : constant Event_Type := 12;
--	Graphics_Expose : constant Event_Type := 13;
--	No_Expose : constant Event_Type := 14;
--	Visibility_Notify : constant Event_Type := 15;
--	Create_Notify : constant Event_Type := 16;
--	Destroy_Notify : constant Event_Type := 17;
--	Unmap_Notify : constant Event_Type := 18;
--	Map_Notify : constant Event_Type := 19;
--	Map_Request : constant Event_Type := 20;
--	Reparent_Notify : constant Event_Type := 21;
--	Configure_Notify : constant Event_Type := 22;
--	Configure_Request : constant Event_Type := 23;
--	Gravity_Notify : constant Event_Type := 24;
--	Resize_Request : constant Event_Type := 25;
--	Circulate_Notify : constant Event_Type := 26;
--	Circulate_Request : constant Event_Type := 27;
--	Property_Notify : constant Event_Type := 28;
--	Selection_Clear : constant Event_Type := 29;
--	Selection_Request : constant Event_Type := 30;
--	Selection_Notify : constant Event_Type := 31;
--	Colormap_Notify : constant Event_Type := 32;
--	Client_Message : constant Event_Type := 33;
--	Mapping_Notify : constant Event_Type := 34;
--	Last_Event : constant Event_Type := 35;
	Null_Event_Kind : constant Event_Type := 1000;

	type Event_Mask_Type is new X_Mask_Type;

	No_Event_Mask : constant Event_Mask_Type :=
	   Event_Mask_Type (Null_X_Mask);

	Key_Press_Mask : constant Event_Mask_Type := Create_Constant (2 ** 0);
	Key_Release_Mask : constant Event_Mask_Type := Create_Constant (2 ** 1);
	Button_Press_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 2);
	Button_Release_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 3);
	Enter_Window_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 4);
	Leave_Window_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 5);
	Pointer_Motion_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 6);
	Pointer_Motion_Hint_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 7);
	Button_1_Motion_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 8);
	Button_2_Motion_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 9);
	Button_3_Motion_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 10);
	Button_4_Motion_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 11);
	Button_5_Motion_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 12);
	Button_Motion_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 13);
	Keymap_State_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 14);
	Exposure_Mask : constant Event_Mask_Type := Create_Constant (2 ** 15);
	Visibility_Change_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 16);
	Structure_Notify_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 17);
	Resize_Redirect_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 18);
	Substructure_Notify_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 19);
	Substructure_Redirect_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 20);
	Focus_Change_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 21);
	Property_Change_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 22);
	Colormap_Change_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 23);
	Owner_Grab_Button_Mask : constant Event_Mask_Type :=
	   Create_Constant (2 ** 24);

	type Key_And_Button_Mask is new X_Mask_Type;

	No_Key_And_Button_Mask : constant Key_And_Button_Mask :=
	   Key_And_Button_Mask (Null_X_Mask);

	Shift_Mask : constant Key_And_Button_Mask := Create_Constant (2 ** 0);
	Lock_Mask : constant Key_And_Button_Mask := Create_Constant (2 ** 1);
	Control_Mask : constant Key_And_Button_Mask := Create_Constant (2 ** 2);
	Mod_1_Mask : constant Key_And_Button_Mask := Create_Constant (2 ** 3);
	Mod_2_Mask : constant Key_And_Button_Mask := Create_Constant (2 ** 4);
	Mod_3_Mask : constant Key_And_Button_Mask := Create_Constant (2 ** 5);
	Mod_4_Mask : constant Key_And_Button_Mask := Create_Constant (2 ** 6);
	Mod_5_Mask : constant Key_And_Button_Mask := Create_Constant (2 ** 7);
	Button_1_Mask : constant Key_And_Button_Mask :=
	   Create_Constant (2 ** 8);
	Button_2_Mask : constant Key_And_Button_Mask :=
	   Create_Constant (2 ** 9);
	Button_3_Mask : constant Key_And_Button_Mask :=
	   Create_Constant (2 ** 10);
	Button_4_Mask : constant Key_And_Button_Mask :=
	   Create_Constant (2 ** 11);
	Button_5_Mask : constant Key_And_Button_Mask :=
	   Create_Constant (2 ** 12);
	Any_Modifier_Mask : constant Key_And_Button_Mask :=
	   Create_Constant (2 ** 15);

	type Button_Name_Type is private;
	Any_Button : constant Button_Name_Type;
	Button_1 : constant Button_Name_Type;
	Button_2 : constant Button_Name_Type;
	Button_3 : constant Button_Name_Type;
	Button_4 : constant Button_Name_Type;
	Button_5 : constant Button_Name_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Button_Name_Type;

	type Notify_Mode_Type is private;
	Notify_Normal : constant Notify_Mode_Type;
	Notify_Grab : constant Notify_Mode_Type;
	Notify_Ungrab : constant Notify_Mode_Type;
	Notify_While_Grabbed : constant Notify_Mode_Type;
	Notify_Hint : constant Notify_Mode_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Notify_Mode_Type;

	type Notify_Detail_Type is private;
	Notify_Ancestor : constant Notify_Detail_Type;
	Notify_Virtual : constant Notify_Detail_Type;
	Notify_Inferior : constant Notify_Detail_Type;
	Notify_Nonlinear : constant Notify_Detail_Type;
	Notify_Nonlinear_Virtual : constant Notify_Detail_Type;
	Notify_Pointer : constant Notify_Detail_Type;
	Notify_Pointer_Root : constant Notify_Detail_Type;
	Notify_Detail_None : constant Notify_Detail_Type;
	function Create_Constant (Value : in X_Long_Integer)
				 return Notify_Detail_Type;

	type Mapping_Request_Type is private;
	Mapping_Modifier : constant Mapping_Request_Type;
	Mapping_Keyboard : constant Mapping_Request_Type;
	Mapping_Pointer : constant Mapping_Request_Type;
	function Create_Constant (Value : in X_Long_Integer)
				 return Mapping_Request_Type;

	type Colormap_State_Type is private;
	Uninstalled : constant Colormap_State_Type;
	Installed : constant Colormap_State_Type;
	function Create_Constant (Value : in X_Long_Integer)
				 return Colormap_State_Type;

	type Property_State_Type is private;
	New_Value : constant Property_State_Type;
	Delete : constant Property_State_Type;
	function Create_Constant (Value : in X_Long_Integer)
				 return Property_State_Type;

	type Placement_Type is private;
	Place_On_Top : constant Placement_Type;
	Place_On_Bottom : constant Placement_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Placement_Type;

	type Configure_Request_Mask_Type is new X_Mask_Type;

	type Visibility_Type is private;
	Visibility_Unobscured : constant Visibility_Type;
	Visibility_Partially_Obscured : constant Visibility_Type;
	Visibility_Full_Obscured : constant Visibility_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Visibility_Type;

	type Graphic_Expose_Code_Type is private;
	X_Copy_Area : constant Graphic_Expose_Code_Type;
	X_Copy_Plane : constant Graphic_Expose_Code_Type;
	function Create_Constant (Value : in X_Long_Integer)
				 return Graphic_Expose_Code_Type;

	type Any_Event_Record is
	    record
		null;
	    end record;
	type Any_Event is access Any_Event_Record;

	type Error_Event_Record is
	    record
		Typ : X_Integer;
		Dpy : Display;
		Resourceid : X_Id;
		Serial : X_Id;
		Error_Code, Request_Code, Minor_Code : X_Character;
	    end record;
	type Error_Event is access Error_Event_Record;

	type Key_Event_Record is
	    record
		Root : Window;
		Subwindow : Window;
		Event_Time : Time;
		X : Coordinate;
		Y : Coordinate;
		X_Root : Coordinate;
		Y_Root : Coordinate;
		State : Key_And_Button_Mask;
		Key_Code : Keyboard.Key_Code;
		Same_Screen : Boolean;
	    end record;
	type Key_Event is access Key_Event_Record;

	type Button_Event_Record is
	    record
		Root : Window;
		Subwindow : Window;
		Event_Time : Time;
		X : Coordinate;
		Y : Coordinate;
		X_Root : Coordinate;
		Y_Root : Coordinate;
		State : Key_And_Button_Mask;
		Button : Button_Name_Type;
		Same_Screen : Boolean;
	    end record;
	type Button_Event is access Button_Event_Record;

	type Motion_Event_Record is
	    record
		Root : Window;
		Subwindow : Window;
		Event_Time : Time;
		X : Coordinate;
		Y : Coordinate;
		X_Root : Coordinate;
		Y_Root : Coordinate;
		State : Key_And_Button_Mask;
		Is_Hint : Notify_Mode_Type;
		Same_Screen : Boolean;
	    end record;
	type Motion_Event is access Motion_Event_Record;

	type Crossing_Event_Record is
	    record
		Root : Window;
		Subwindow : Window;
		Event_Time : Time;
		X : Coordinate;
		Y : Coordinate;
		X_Root : Coordinate;
		Y_Root : Coordinate;
		Mode : Notify_Mode_Type;
		Detail : Notify_Detail_Type;
		Same_Screen : Boolean;
		Focus : Boolean;
		State : Key_And_Button_Mask;
	    end record;
	type Crossing_Event is access Crossing_Event_Record;

	type Focus_Change_Event_Record is
	    record
		Mode : Notify_Mode_Type;
		Detail : Notify_Detail_Type;
	    end record;
	type Focus_Change_Event is access Focus_Change_Event_Record;

	type Keymap_Event_Record is
	    record
		Key_Vector : Keyboard.Key_Vector_Mask_Type;
	    end record;
	type Keymap_Event is access Keymap_Event_Record;

	type Expose_Event_Record is
	    record
		X : Coordinate;
		Y : Coordinate;
		Width : Width_Height;
		Height : Width_Height;
		Count : Natural;
	    end record;
	type Expose_Event is access Expose_Event_Record;

	type Graphics_Expose_Event_Record is
	    record
		X : Coordinate;
		Y : Coordinate;
		Width : Width_Height;
		Height : Width_Height;
		Count : Natural;
		Major_Code : Graphic_Expose_Code_Type;
		Minor_Code : Graphic_Expose_Code_Type;
	    end record;
	type Graphics_Expose_Event is access Graphics_Expose_Event_Record;

	type No_Expose_Event_Record is
	    record
		Major_Code : Graphic_Expose_Code_Type;
		Minor_Code : Graphic_Expose_Code_Type;
	    end record;
	type No_Expose_Event is access No_Expose_Event_Record;

	type Visibility_Event_Record is
	    record
		State : Visibility_Type;
	    end record;
	type Visibility_Event is access Visibility_Event_Record;

	type Create_Window_Event_Record is
	    record
		Wind_Id : Window;
		X : Coordinate;
		Y : Coordinate;
		Width : Width_Height;
		Height : Width_Height;
		Border_Width : Width_Height;
		Override_Redirect : Boolean;
	    end record;
	type Create_Window_Event is access Create_Window_Event_Record;

	type Destroy_Window_Event_Record is
	    record
		Wind_Id : Window;
	    end record;
	type Destroy_Window_Event is access Destroy_Window_Event_Record;

	type Unmap_Event_Record is
	    record
		Wind_Id : Window;
		From_Configure : Boolean;
	    end record;
	type Unmap_Event is access Unmap_Event_Record;

	type Map_Event_Record is
	    record
		Wind_Id : Window;
		Override_Redirect : Boolean;
	    end record;
	type Map_Event is access Map_Event_Record;

	type Map_Request_Event_Record is
	    record
		Wind_Id : Window;
	    end record;
	type Map_Request_Event is access Map_Request_Event_Record;

	type Reparent_Event_Record is
	    record
		Wind_Id : Window;
		Parent : Window;
		X : Coordinate;
		Y : Coordinate;
		Override_Redirect : Boolean;
	    end record;
	type Reparent_Event is access Reparent_Event_Record;

	type Resize_Request_Event_Record is
	    record
		Width : Width_Height;
		Height : Width_Height;
	    end record;
	type Resize_Request_Event is access Resize_Request_Event_Record;

	type Gravity_Event_Record is
	    record
		Wind_Id : Window;
		X : Coordinate;
		Y : Coordinate;
	    end record;
	type Gravity_Event is access Gravity_Event_Record;

	type Configure_Event_Record is
	    record
		Wind_Id : Window;
		X : Coordinate;
		Y : Coordinate;
		Width : Width_Height;
		Height : Width_Height;
		Border_Width : Width_Height;
		Above : Window;
		Override_Redirect : Boolean;
	    end record;
	type Configure_Event is access Configure_Event_Record;

	type Configure_Request_Event_Record is
	    record
		Wind_Id : Window;
		X : Coordinate;
		Y : Coordinate;
		Width : Width_Height;
		Height : Width_Height;
		Border_Width : Width_Height;
		Above : Window;
		Detail : Stack_Mode_Type;
		Value_Mask : Configure_Request_Mask_Type;
	    end record;
	type Configure_Request_Event is access Configure_Request_Event_Record;

	type Circulate_Event_Record is
	    record
		Wind_Id : Window;
		Place : Placement_Type;
	    end record;
	type Circulate_Event is access Circulate_Event_Record;

	type Circulate_Request_Event_Record is
	    record
		Wind_Id : Window;
		Place : Placement_Type;
	    end record;
	type Circulate_Request_Event is access Circulate_Request_Event_Record;

	type Property_Event_Record is
	    record
		Atom_Id : Atoms.Atom;
		Time_Stamp : Time;
		State : Property_State_Type;
	    end record;
	type Property_Event is access Property_Event_Record;

	type Selection_Clear_Event_Record is
	    record
		Selection : Atoms.Atom;
		Time_Stamp : Time;
	    end record;
	type Selection_Clear_Event is access Selection_Clear_Event_Record;

	type Selection_Request_Event_Record is
	    record
		Requestor : Window;
		Selection : Atoms.Atom;
		Target : Atoms.Atom;
		Property : Atoms.Atom;
		Time_Stamp : Time;
	    end record;
	type Selection_Request_Event is access Selection_Request_Event_Record;

	type Selection_Event_Record is
	    record
		Selection : Atoms.Atom;
		Target : Atoms.Atom;
		Property : Atoms.Atom;
		Time_Stamp : Time;
	    end record;
	type Selection_Event is access Selection_Event_Record;

	type Colormap_Event_Record is
	    record
		Colormap : Colors.Color_Map;
		New_Map : Boolean;
		State : Colormap_State_Type;
	    end record;
	type Colormap_Event is access Colormap_Event_Record;

	type Client_Message_Event_Record is
	    record
		Message_Type : Atoms.Atom;
		Format : Property_Format_Type;
		Data : Long_Array (1 .. 5);
	    end record;
	type Client_Message_Event is access Client_Message_Event_Record;

	type Mapping_Event_Record is
	    record
		Request : Mapping_Request_Type;
		First_Keycode : Keyboard.Key_Code;
		Count : X_Integer;
	    end record;
	type Mapping_Event is access Mapping_Event_Record;

	type Event_Component (Kind : Event_Type := Enter_Notify) is
	    record
		Serial : Unsigned_Long;
		Send_Event : Boolean;
		Display_Id : Display;
		Window_Id : Window;

		case Kind is
		    when Button_Press | Button_Release =>
			Button : Button_Event_Record;
		    when Circulate_Notify =>
			Circulate : Circulate_Event_Record;
		    when Circulate_Request =>
			Circulate_Reqst : Circulate_Request_Event_Record;
		    when Client_Message =>
			Client : Client_Message_Event_Record;
		    when Colormap_Notify =>
			Colormap : Colormap_Event_Record;
		    when Configure_Notify =>
			Configure : Configure_Event_Record;
		    when Configure_Request =>
			Configure_Reqst : Configure_Request_Event_Record;
		    when Create_Notify =>
			Create_Window : Create_Window_Event_Record;
		    when Destroy_Notify =>
			Destroy_Window : Destroy_Window_Event_Record;
		    when Enter_Notify | Leave_Notify =>
			Crossing : Crossing_Event_Record;
		    when Expose =>
			Expose_Notify : Expose_Event_Record;
		    when Focus_In | Focus_Out =>
			Focus : Focus_Change_Event_Record;
		    when Graphics_Expose =>
			Graphics : Graphics_Expose_Event_Record;
		    when Gravity_Notify =>
			Gravity : Gravity_Event_Record;
		    when Key_Press | Key_Release =>
			Key : Key_Event_Record;
		    when Keymap_Notify =>
			Keymap : Keymap_Event_Record;
		    when Map_Notify =>
			Map : Map_Event_Record;
		    when Map_Request =>
			Map_Reqst : Map_Request_Event_Record;
		    when Motion_Notify =>
			Motion : Motion_Event_Record;
		    when No_Expose =>
			Noexpose : No_Expose_Event_Record;
		    when Property_Notify =>
			Property : Property_Event_Record;
		    when Reparent_Notify =>
			Reparent : Reparent_Event_Record;
		    when Resize_Request =>
			Resize_Reqst : Resize_Request_Event_Record;
		    when Selection_Clear =>
			Selection_Clr : Selection_Clear_Event_Record;
		    when Selection_Notify =>
			Selection : Selection_Event_Record;
		    when Selection_Request =>
			Selection_Reqst : Selection_Request_Event_Record;
		    when Unmap_Notify =>
			Unmap : Unmap_Event_Record;
		    when Visibility_Notify =>
			Visibility : Visibility_Event_Record;
		    when Mapping_Notify =>
			X_Mapping : Mapping_Event_Record;
		    when others =>
			Any : Any_Event_Record;
		end case;
	    end record;

	type Event_Record is
	    record
		E : Event_Component;
	    end record;

	type Event is access Event_Record;

	function Null_Event return Event_Record;  -- Kind = Null_Event_Kind

	type Time_Coord_Record is
	    record
		X, Y : Coordinate;
		Timestamp : Time;
	    end record;
	type Time_Coord_Array is array (Natural range <>) of Time_Coord_Record;
	type Time_Coord_List is access Time_Coord_Array;
	Null_Time_Coord_Array : Time_Coord_Array (1 .. 0);

	type Compose_Status_Record is
	    record
		Compose_Pointer : String_Pointer;
		Chars_Matched : X_Long_Integer;
	    end record;

	X_Buffer_Overflow : constant := -1;
	X_Lookup_None : constant := 1;
	X_Lookup_Chars : constant := 2;
	X_Lookup_Key_Sym : constant := 3;
	X_Lookup_Both : constant := 4;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Select_Input
	--
	--  Description
	--
	--    This procedure requests that the Server report events associated
	--  with the event mask you pass to the Mask argument.
	--
	--  Documentation
	--
	--    Please refer to XSelectInput in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Select_Input (Display_Id : in Display;
				  Window_Id : in Window;
				  Mask : in Event_Mask_Type);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Flush
	--
	--  Description
	--
	--    This procedure flushes the output buffer.
	--
	--  Documentation
	--
	--    Please refer to XFlush in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Flush (Display_Id : in Display);

--	--======================================================================
--	--  Subprogram Name
--	--
--	--    X_Sync
--	--
--	--  Description
--	--
--	--    This procedure flushes the output buffer then waits until all
--	--  (events including error events) have been received and processed by
--	--  the X Server.
--	--
--	--    In addition, this procedure places the events recently processed by
--	--  the X Server on the event queue.
--	--
--	--    If Discard is TRUE, Sync discards all events on the queue,
--	--  including those events that were on the queue before Sync was called.
--	--
--	--  Documentation
--	--
--	--    Please refer to XSync in the
--	--  Xlib - C Language X Interface X Window System
--	--  manual for more information.
--	--
--	--  Package:  Events
--	--======================================================================
--
--	procedure X_Sync (Display_Id : in Display;
--			  Discard : in Boolean := False);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Events_Queued
	--
	--  Description
	--
	--    This function returns the number of events in the event queue.
	--  If the mode is Queued_Already, the number of events already in
	--  the queue is returned. If the mode is Queued_After_Flush, it
	--  flushes the output queue if necessary and returns the number of
	--  events. If the mode is Queued_After_Reading, it attempts to read
	--  the number of events without attempting a flush.
	--
	--  Documentation
	--
	--    Please refer to XEventsQueued in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	function X_Events_Queued
		    (Display_Id : in Display; Mode : in Event_Queue_Mode_Type)
		    return Natural;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Pending
	--
	--  Description
	--
	--    This function flushes the output buffer. It then returns the
	--  number of events received from the X Server but not yet removed from
	--  the event queue.
	--
	--  Documentation
	--
	--    Please refer to XPending in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	function X_Pending (Display_Id : in Display; Block : in Boolean := True)
			   return Natural;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Next_Event
	--
	--  Description
	--
	--    This procedure flushes the output buffer. If the event queue is
	--  empty, Next_Event blocks until an event is received, when the Block
	--  parameter defaults to TRUE.   In blocking mode, it then removes
	--  an event from the head of the queue and copies its associated
	--  structure into a client-supplied Event record.  In non-blocking
	--  mode, if an event is queued it is returned as described above;
	--  otherwise when no event is queued, the event value null is
	--  returned.
	--
	--  Documentation
	--
	--    Please refer to XNextEvent in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Next_Event (Display_Id : in Display;
				The_Event : in out Event;
				Block : in Boolean := True);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Peek_Event
	--
	--  Description
	--
	--    TBD.
	--
	--  Documentation
	--
	--    Please refer to XPeekEvent in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Peek_Event (Display_Id : in Display;
				The_Event : in out Event);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Put_Back_Event
	--
	--  Description
	--
	--    This procedure pushes an event back onto the head of the
	--  current display's event queue. This can be useful if you have
	--  read an event and then decide that you would rather deal with it
	--  later.
	--
	--  Documentation
	--
	--    Please refer to XPutBackEvent in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Put_Back_Event
		     (Display_Id : in Display; The_Event : in Event);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Window_Event
	--
	--  Description
	--
	--    This procedure flushes the output buffer then searches the event
	--  queue for events associated with the specified window. Window_Event
	--  removes the next event in the queue that matches both the window and
	--  the event mask passed. It then copies the event's associated
	--  structure into the the user-supplied Event record. Earlier events in
	--  the queue are not discarded.
	--
	--  If the event you requested is not in the queue, Window_Event blocks
	--  until one is received.
	--
	--
	--  Documentation
	--
	--    Please refer to XWindowEvent in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Window_Event (Display_Id : in Display;
				  Window_Id : in Window;
				  Mask : in Event_Mask_Type;
				  The_Event : in out Event);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Check_Window_Event
	--
	--  Description
	--
	--    This procedure flushes the output buffer then searches the event
	--  queue for the events associated with the specified window. Check_
	--  Window_Event removes the next event in the queue that matches both
	--  the window and the event mask supplied. It then copies the event's
	--  associated structure into the client-supplied Event record and
	--  returns TRUE in Event_Found. If the event requested is not in the
	--  queue, Check_Window_Event immediately returns and Event_Found returns
	--  FALSE.
	--
	--  Documentation
	--
	--    Please refer to XCheckWindowEvent in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Check_Window_Event (Display_Id : in Display;
					Window_Id : in Window;
					Mask : in Event_Mask_Type;
					The_Event : in out Event;
					Event_Found : in out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Check_Typed_Event
	--
	--  Description
	--
	--    This procedure flushes the output buffer then searches the event
	--  queue for the events associated with the specified window.
	--  Check_Typed_Event removes the next event in the queue that
	--  matches the window and specified event type you passed. It then
	--  copies the event's associated structure into the client-supplied
	--  Event record and returns TRUE in Event_Found. Earlier events in the
	--  queue are not discarded. If the event you requested is not in the
	--  queue, Check_Typed_Event immediately returns and Event_Found is set
	--  to FALSE.
	--
	--  Documentation
	--
	--    Please refer to XCheckTypedEvent in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Check_Typed_Event (Display_Id : in Display;
				       Event_Kind : in Event_Type;
				       Event_Return : in out Event;
				       Event_Found : in out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Check_Typed_Window_Event
	--
	--  Description
	--
	--    This procedure flushes the output buffer then searches the event
	--  queue for the events associated with the specified window.
	--  Check_Typed_Window_Event removes the next event in the queue that
	--  matches the window and specified event type you passed. It then
	--  copies the event's associated structure into the client-supplied
	--  Event record and returns TRUE in Event_Found. Earlier events in the
	--  queue are not discarded. If the event you requested is not in the
	--  queue, Check_Typed_Window_Event immediately returns and Event_Found
	--  is set to FALSE.
	--
	--  Documentation
	--
	--    Please refer to XCheckTypedWindowEvent in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Check_Typed_Window_Event (Display_Id : in Display;
					      Window_Id : in Window;
					      Event_Kind : in Event_Type;
					      Event_Return : in out Event;
					      Event_Found : in out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Mask_Event
	--
	--  Description
	--
	--    This procedure flushes the output buffer then searches the event
	--  queue for the events associated with the specified mask. Mask_Event
	--  removes the next event in the queue that matches the event mask you
	--  passed. It then copies the event's associated structure into the
	--  client-supplied Event record. Earlier events in the queue are not
	--  discarded. If the event you requested is not in the queue, Mask_Event
	--  blocks until one is received.
	--
	--
	--  Documentation
	--
	--    Please refer to XMaskEvent in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Mask_Event (Display_Id : in Display;
				Mask : in Event_Mask_Type;
				The_Event : in out Event);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Check_Mask_Event
	--
	--  Description
	--
	--    This procedure flushes the output buffer then searches the event
	--  queue for the events associated with the specified mask. Check_Mask_
	--  Event removes the next event in the queue that matches the event
	--  mask you passed. It then copies the event's associated structure
	--  into the client-supplied Event record and returns TRUE in Event_
	--  Found. Earlier events in the queue are not discarded. If the event
	--  you requested is not in the queue, Check_Mask_Event immediately
	--  returns and Event_Found is set to FALSE.
	--
	--
	--  Documentation
	--
	--    Please refer to XCheckMaskEvent in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Check_Mask_Event (Display_Id : in Display;
				      Mask : in Event_Mask_Type;
				      The_Event : in out Event;
				      Event_Found : in out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Motion_Events
	--
	--  Description
	--
	--    This function returns all events in the motion history buffer that
	--  fall between the specified start and stop times inclusive and that
	--  have coordinates that lie within (including borders) the specified
	--  window at its present placement. If the start time is later than the
	--  stop time or if the start time is in the future, no events are
	--  returned. Each time member in the Time_Coordinate list is set to the
	--  time in milliseconds. The X and Y members are set to the coordinates
	--  of the pointer relative to the origin of the specified window.
	--
	--
	--  Documentation
	--
	--    Please refer to XGetMotionEvents in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	function X_Get_Motion_Events (Display_Id : in Display;
				      Window_Id : in Window;
				      Start : in Time;
				      Stop : in Time) return Time_Coord_List;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Display_Motion_Buffer_Size
	--
	--  Description
	--
	--    returns the size of the motion events buffer
	--
	--
	--  Documentation
	--
	--    Please refer to XDisplayMotionBufferSize in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	function X_Display_Motion_Buffer_Size
		    (Display_Id : in Display) return Natural;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Send_Event
	--
	--  Description
	--
	--    This procedure identifies the destination window, determines which
	--  clients should receive the specified events, and ignores any
	--  active grabs.
	--
	--
	--  Documentation
	--
	--    Please refer to XSendEvent in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Send_Event (Display_Id : in Display;
				Window_Id : in Window;
				Propagate : in Boolean;
				Mask : in Event_Mask_Type;
				The_Event : in Event);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Lookup_Keysym
	--
	--  Description
	--
	--    This function uses a given keyboard event and the index specified
	--  to return the Key_Sym from the list that corresponds to the keycode
	--  in the event record. The Event must be of type Key_Release or
	--  Key_Pressed.
	--
	--
	--  Documentation
	--
	--    Please refer to XLookupKeysym in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	function X_Lookup_Keysym (The_Event : in Event; Index : in Natural)
				 return Keyboard.Key_Sym;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Refresh_Keyboard_Mapping
	--
	--  Description
	--
	--    This procedure refreshes the stored modifier and keymap
	--  information.  You usually call this when a Mapping_Notify event
	--  occurs. The result is to update a client application's knowledge of
	--  the Keyboard.
	--
	--  Documentation
	--
	--    Please refer to XRefreshKeyboardMapping in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	procedure X_Refresh_Keyboard_Mapping (The_Event : in Event);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Lookup_String
	--
	--  Description
	--
	--    This procedure is a convenience routine that can be used to map a
	--  key event to an ASCII string, using the modifier bits in the key
	--  event to deal with shift, lock and control. It returns the
	--  translated string into the user's buffer. It also detects any
	--  rebound Key_Syms and returns the specified bytes
	--
	--
	--  Documentation
	--
	--    Please refer to XLookupString in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	-- First overloading returns an exact length string, using allocation.
	-- Second overloading returns a string and its length, no allocation.

	procedure X_Lookup_String (The_Event : in Event;
				   Buffer : in out String_Pointer;
				   The_Symbol : out Keyboard.Key_Sym;
				   Status : out Compose_Status_Record);

	procedure X_Lookup_String (The_Event : in Event;
				   Buffer : in out String_Pointer;
				   Length : out Natural;
				   The_Symbol : out Keyboard.Key_Sym;
				   Status : out Compose_Status_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Peek_If_Event
	--
	--  Description
	--
	--    This generic procedure returns the next queued event matched by
	--  generic procedure parameter predicate.  The event is NOT removed
	--  from the queue.  The procedure sets status to false if no event is
	--  found.
	--
	--
	--  Documentation
	--
	--    Please refer to XPeekIfEvent in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	generic
	    type Arg_Type is private;
	    with procedure Predicate (Dpy : in Display;
				      The_Event : in out Event;
				      Arg : in out Arg_Type;
				      Status : out Boolean);
	procedure X_Peek_If_Event (Dpy : in Display;
				   The_Event : in out Event;
				   Arg : in out Arg_Type);

	generic
	    type Arg_Type is private;
	    with procedure Predicate (Dpy : in Display;
				      The_Event : in out Event;
				      Arg : in out Arg_Type;
				      Status : out Boolean);
	procedure X_If_Event (Dpy : in Display;
			      The_Event : in out Event;
			      Arg : in out Arg_Type);
	--======================================================================
	--  Subprogram Name
	--
	--    X_check_if_event
	--
	--  Description
	--
	--    This generic procedure returns the next queued event matched by
	--  generic procedure parameter predicate.  The event is removed from
	--  the queue.  The procedure sets status to false if no event is
	--  found.
	--
	--
	--  Documentation
	--
	--    Please refer to XCheckIfEvent in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Events
	--======================================================================

	generic
	    type Arg_Type is private;
	    with procedure Predicate (Dpy : in Display;
				      The_Event : in out Event;
				      Arg : in out Arg_Type;
				      Status : out Boolean);

	procedure X_Check_If_Event (Dpy : in Display;
				    The_Event : in out Event;
				    Arg : in out Arg_Type;
				    Status : out Boolean);

	function X_Filter_Event
		    (Event : in Events.Event; Win : in Window) return Boolean;

	procedure Xmb_Lookup_String (Ic : in X_Ic;
				     Event : in Events.Event;
				     Buffer_Return : out String;
				     Keysym_Return : out Keyboard.Key_Sym;
				     Status_Return : out Int;
				     Ret_Val : out Int);

	procedure Xwc_Lookup_String (Ic : in X_Ic;
				     Event : in Events.Event;
				     Buffer_Return : out Wide_Character_Array;
				     Keysym_Return : out Keyboard.Key_Sym;
				     Status_Return : out Int;
				     Ret_Val : out Int);

    private
	type Event_Queue_Mode_Type is new Int32;
	Queued_Already : constant Event_Queue_Mode_Type := 0;
	Queued_After_Reading : constant Event_Queue_Mode_Type := 1;
	Queued_After_Flush : constant Event_Queue_Mode_Type := 2;

	type Button_Name_Type is new Unsigned_Int;
	Any_Button : constant Button_Name_Type := 0;
	Button_1 : constant Button_Name_Type := 1;
	Button_2 : constant Button_Name_Type := 2;
	Button_3 : constant Button_Name_Type := 3;
	Button_4 : constant Button_Name_Type := 4;
	Button_5 : constant Button_Name_Type := 5;

	type Notify_Mode_Type is new Int;
	Notify_Normal : constant Notify_Mode_Type := 0;
	Notify_Grab : constant Notify_Mode_Type := 1;
	Notify_Ungrab : constant Notify_Mode_Type := 2;
	Notify_While_Grabbed : constant Notify_Mode_Type := 3;
	Notify_Hint : constant Notify_Mode_Type := 1;

	type Notify_Detail_Type is new Int;
	Notify_Ancestor : constant Notify_Detail_Type := 0;
	Notify_Virtual : constant Notify_Detail_Type := 1;
	Notify_Inferior : constant Notify_Detail_Type := 2;
	Notify_Nonlinear : constant Notify_Detail_Type := 3;
	Notify_Nonlinear_Virtual : constant Notify_Detail_Type := 4;
	Notify_Pointer : constant Notify_Detail_Type := 5;
	Notify_Pointer_Root : constant Notify_Detail_Type := 6;
	Notify_Detail_None : constant Notify_Detail_Type := 7;

	type Mapping_Request_Type is new Int32;
	Mapping_Modifier : constant Mapping_Request_Type := 0;
	Mapping_Keyboard : constant Mapping_Request_Type := 1;
	Mapping_Pointer : constant Mapping_Request_Type := 2;

	type Colormap_State_Type is new Int32;
	Uninstalled : constant Colormap_State_Type := 0;
	Installed : constant Colormap_State_Type := 1;

	type Property_State_Type is new Int32;
	New_Value : constant Property_State_Type := 0;
	Delete : constant Property_State_Type := 1;

	type Placement_Type is new Int32;
	Place_On_Top : constant Placement_Type := 0;
	Place_On_Bottom : constant Placement_Type := 1;

	type Visibility_Type is new Int32;
	Visibility_Unobscured : constant Visibility_Type := 0;
	Visibility_Partially_Obscured : constant Visibility_Type := 1;
	Visibility_Full_Obscured : constant Visibility_Type := 2;

	type Graphic_Expose_Code_Type is new Int;
	X_Copy_Area : constant Graphic_Expose_Code_Type := 63;
	X_Copy_Plane : constant Graphic_Expose_Code_Type := 64;
    end Events;

    package Window_Manager is
	type Resource is private;

	type Grab_Mode is private;
	Sync : constant Grab_Mode;
	Async : constant Grab_Mode;
	function Create_Constant (Value : in X_Long_Integer) return Grab_Mode;

	type Grab_Reply_Status is private;
	Grab_Success : constant Grab_Reply_Status;
	Already_Grabbed : constant Grab_Reply_Status;
	Grab_Invalid_Time : constant Grab_Reply_Status;
	Grab_Not_Viewable : constant Grab_Reply_Status;
	Grab_Frozen : constant Grab_Reply_Status;
	function Create_Constant (Value : in X_Long_Integer)
				 return Grab_Reply_Status;

	type Notify_Mode is private;
	Normal : constant Notify_Mode;
	Grab : constant Notify_Mode;
	Ungrab : constant Notify_Mode;
	While_Grabbed : constant Notify_Mode;
	function Create_Constant (Value : in X_Long_Integer) return Notify_Mode;

	type Notify_Detail is private;
	Ancestor : constant Notify_Detail;
	Virtual : constant Notify_Detail;
	Inferior : constant Notify_Detail;
	Nonlinear : constant Notify_Detail;
	Nonlinear_Virtual : constant Notify_Detail;
	Pointer : constant Notify_Detail;
	Pointer_Root : constant Notify_Detail;
	Detail_None : constant Notify_Detail;
	function Create_Constant
		    (Value : in X_Long_Integer) return Notify_Detail;

	type Visibility_Notify_Type is private;
	Unobscured : constant Visibility_Notify_Type;
	Partially_Obscured : constant Visibility_Notify_Type;
	Fully_Obscured : constant Visibility_Notify_Type;
	function Create_Constant (Value : in X_Long_Integer)
				 return Visibility_Notify_Type;

	type Circulation_Request is private;
	Place_On_Top : constant Circulation_Request;
	Place_On_Bottom : constant Circulation_Request;
	function Create_Constant (Value : in X_Long_Integer)
				 return Circulation_Request;

	type Protocol_Family is private;
	Internet : constant Protocol_Family;
	Decnet : constant Protocol_Family;
	Chaos : constant Protocol_Family;
	function Create_Constant
		    (Value : in X_Long_Integer) return Protocol_Family;

	type Property_Notification is private;
	New_Value : constant Property_Notification;
	Delete : constant Property_Notification;
	function Create_Constant (Value : in X_Long_Integer)
				 return Property_Notification;

	type Colormap_Notification is private;
	Uninstalled : constant Colormap_Notification;
	Installed : constant Colormap_Notification;
	function Create_Constant (Value : in X_Long_Integer)
				 return Colormap_Notification;

	type Allow_Event_Mode is private;
	Async_Pointer : constant Allow_Event_Mode;
	Sync_Pointer : constant Allow_Event_Mode;
	Replay_Pointer : constant Allow_Event_Mode;
	Async_Keyboard : constant Allow_Event_Mode;
	Sync_Keyboard : constant Allow_Event_Mode;
	Replay_Keyboard : constant Allow_Event_Mode;
	Async_Both : constant Allow_Event_Mode;
	Sync_Both : constant Allow_Event_Mode;
	function Create_Constant
		    (Value : in X_Long_Integer) return Allow_Event_Mode;

	type Revert_Mode is private;
	Revert_To_None : constant Revert_Mode;
	Revert_To_Pointer_Root : constant Revert_Mode;
	Revert_To_Parent : constant Revert_Mode;
	function Create_Constant (Value : in X_Long_Integer) return Revert_Mode;

	type Close_Mode is private;
	Destroy_All : constant Close_Mode;
	Retain_Permanent : constant Close_Mode;
	Retain_Temporary : constant Close_Mode;
	function Create_Constant (Value : in X_Long_Integer) return Close_Mode;

	type Map_Array is array (Natural range <>) of X_Short_Integer;
	Null_Map_Array : Map_Array (1 .. 0);

	type Screen_Saver_Mode is private;
	Active : constant Screen_Saver_Mode;
	Reset : constant Screen_Saver_Mode;
	function Create_Constant (Value : in X_Long_Integer)
				 return Screen_Saver_Mode;

	type Exposure_Type is private;
	Dont_Allow_Exposures : constant Exposure_Type;
	Allow_Exposures : constant Exposure_Type;
	Default_Exposures : constant Exposure_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Exposure_Type;

	type Blanking_Type is private;
	Dont_Prefer_Blanking : constant Blanking_Type;
	Prefer_Blanking : constant Blanking_Type;
	Default_Blanking : constant Blanking_Type;
	function Create_Constant
		    (Value : in X_Long_Integer) return Blanking_Type;

	type Host_Address_Record is
	    record
		Family : X_Id;
		Length : X_Id;
		The_Address : X_Address;
	    end record;
	type Host_Array is array (Natural range <>) of Host_Address_Record;
	type Host_List is access Host_Array;
	Null_Host_Array : Host_Array (1 .. 0);

	type Access_Control_Mode is private;
	Enable : constant Access_Control_Mode;
	Disable : constant Access_Control_Mode;
	function Create_Constant (Value : in X_Long_Integer)
				 return Access_Control_Mode;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Grab_Button
	--
	--  Description
	--
	--    This procedure is used to establish a passive grab on a mouse
	--  button.
	--
	--
	--  Documentation
	--
	--    Please refer to XGrabButton in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Grab_Button (Display_Id : in Display;
				 Button : in Events.Button_Name_Type;
				 Modifiers : in Events.Key_And_Button_Mask;
				 Window_Id : in Window;
				 Owner_Events : in Boolean;
				 Grab_Events : in Events.Event_Mask_Type;
				 Pointer_Mode : in Grab_Mode;
				 Keyboard_Mode : in Grab_Mode;
				 Confine_To : in Window;
				 Cursor_Id : in Cursors.Cursor);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Ungrab_Button
	--
	--  Description
	--
	--    This procedure is used to release the passive button/key
	--  combination on the specified window if it was grabbed by this client.
	--
	--
	--  Documentation
	--
	--    Please refer to XUngrabButton in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Ungrab_Button (Display_Id : in Display;
				   Button : in Events.Button_Name_Type;
				   Modifiers : in Events.Key_And_Button_Mask;
				   Window_Id : in Window);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Grab_Pointer
	--
	--  Description
	--
	--    This function is used to actively grab control of the pointer.
	--
	--
	--  Documentation
	--
	--    Please refer to XGrabPointer in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	function X_Grab_Pointer (Display_Id : in Display;
				 Window_Id : in Window;
				 Owner_Events : in Boolean;
				 Grab_Events : in Events.Event_Mask_Type;
				 Pointer_Mode : in Grab_Mode;
				 Keyboard_Mode : in Grab_Mode;
				 Confine_To : in Window;
				 Cursor_Id : in Cursors.Cursor;
				 Grab_Time : in Time) return Grab_Reply_Status;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Ungrab_Pointer
	--
	--  Description
	--
	--    This procedure is used to release the pointer and any queued events
	--  if this client has actively grabbed the pointer from Grab_Pointer,
	--  Grab_Button, or from a normal button press.
	--
	--
	--  Documentation
	--
	--    Please refer to XUngrabPointer in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Ungrab_Pointer
		     (Display_Id : in Display; Ungrab_Time : in Time);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Change_Active_Pointer_Grab
	--
	--  Description
	--
	--    This procedure is used to change the specified dynamic parameters
	--  if the pointer is actively grabbed by the client and if the
	--  specified time is no earlier than the last-pointer-grab and no later
	--  than the current X server time.
	--
	--
	--  Documentation
	--
	--    Please refer to XChangeActivePointerGrab in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Change_Active_Pointer_Grab
		     (Display_Id : in Display;
		      Grab_Events : in Events.Event_Mask_Type;
		      Cursor_Id : in Cursors.Cursor;
		      Grab_Time : in Time);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Grab_Keyboard
	--
	--  Description
	--
	--    This function is used to actively grab control of the main
	--  keyboard and generates FocusIn and FocusOut Events.
	--
	--
	--  Documentation
	--
	--    Please refer to XGrabKeyboard in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	function X_Grab_Keyboard (Display_Id : in Display;
				  Window_Id : in Window;
				  Owner_Events : in Boolean;
				  Pointer_Mode : in Grab_Mode;
				  Keyboard_Mode : in Grab_Mode;
				  Grab_Time : in Time) return Grab_Reply_Status;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Ungrab_Keyboard
	--
	--  Description
	--
	--    This procedure is used to release the keyboard and any queued
	--  events if this client has it actively grabbed from either Grab_
	--  Keyboard or Grab_Key.
	--
	--
	--  Documentation
	--
	--    Please refer to XUngrabKeyboard in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Ungrab_Keyboard
		     (Display_Id : in Display; Ungrab_Time : in Time);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Grab_Key
	--
	--  Description
	--
	--    This procedure is used to passively grab a single key of the
	--  Keyboard.
	--
	--
	--  Documentation
	--
	--    Please refer to XGrabKey in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Grab_Key (Display_Id : in Display;
			      Key : in Keyboard.Key_Code;
			      Modifiers : in Events.Key_And_Button_Mask;
			      Owner_Events : in Boolean;
			      Window_Id : in Window;
			      Pointer_Mode : in Grab_Mode;
			      Keyboard_Mode : in Grab_Mode);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Ungrab_Key
	--
	--  Description
	--
	--    This procedure is used to release the key combination on the
	--  specified window if it was grabbed by this client.
	--
	--
	--  Documentation
	--
	--    Please refer to XUngrabKey in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Ungrab_Key (Display_Id : in Display;
				Key : in Keyboard.Key_Code;
				Modifiers : in Events.Key_And_Button_Mask;
				Window_Id : in Window);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Allow_Events
	--
	--  Description
	--
	--    This procedure is used to release some queued events if the client
	--  has caused a device to freeze. The function has no effect if the
	--  specified time is earlier than the last-grab time of the most recent
	--  active grab for that client, or if the specified time is later
	--  than the current X server time.
	--
	--
	--  Documentation
	--
	--    Please refer to XAllowEvents in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Allow_Events (Display_Id : in Display;
				  Mode : in Allow_Event_Mode;
				  Event_Time : in Time);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Grab_Server
	--
	--  Description
	--
	--    This procedure is used to disable processing of requests and
	--  close-downs on all other connections than the one this request
	--  arrived on.
	--
	--
	--  Documentation
	--
	--    Please refer to XGrabServer in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Grab_Server (Display_Id : in Display);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Ungrab_Server
	--
	--  Description
	--
	--    This procedure is used to restart processing of requests and close
	--  downs on other connections.
	--
	--
	--  Documentation
	--
	--    Please refer to XUngrabServer in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Ungrab_Server (Display_Id : in Display);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Warp_Pointer
	--
	--  Description
	--
	--    This procedure is used to move the pointer to the coordinates
	--  specified by the Dest_Xy argument, relative to the destination
	--  window's origin.
	--
	--
	--  Documentation
	--
	--    Please refer to XWarpPointer in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Warp_Pointer (Display_Id : in Display;
				  Source : in Window;
				  Destination : in Window;
				  Source_X : in Coordinate;
				  Source_Y : in Coordinate;
				  Source_Width : in Width_Height;
				  Source_Height : in Width_Height;
				  Destination_X : in Coordinate;
				  Destination_Y : in Coordinate);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Input_Focus
	--
	--  Description
	--
	--    This procedure is used to change the input focus and the last
	--  focus-change time.  The function has no effect if the specified time
	--  is earlier than the last-focus change time of the most recent
	--  active grab for that client, or if the specified time is later
	--  than the current X server time.
	--
	--
	--  Documentation
	--
	--    Please refer to XSetInputFocus in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Set_Input_Focus (Display_Id : in Display;
				     Focus : in Window;
				     Mode : in Revert_Mode;
				     Grab_Time : in Time);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Input_Focus
	--
	--  Description
	--
	--    This procedure is used to return the focus window Id and the
	--  current focus state.
	--
	--
	--  Documentation
	--
	--    Please refer to XGetInputFocus in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Get_Input_Focus (Display_Id : in Display;
				     Focus : in out Window;
				     Mode : in out Revert_Mode);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Change_Pointer_Control
	--
	--  Description
	--
	--    This procedure is used to control the interactive feel of the
	--  pointer device.
	--
	--
	--  Documentation
	--
	--    Please refer to XChangePointerControl in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Change_Pointer_Control (Display_Id : in Display;
					    Do_Accel : in Boolean;
					    Do_Threshold : in Boolean;
					    Numerator : in Integer;
					    Denominator : in Integer;
					    Threshold : in Integer);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Pointer_Control
	--
	--  Description
	--
	--    This procedure is used to return the pointer's current acceleration
	--  multiplier and acceleration threshold.
	--
	--
	--  Documentation
	--
	--    Please refer to XGetPointerControl in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Get_Pointer_Control (Display_Id : in Display;
					 Numerator : out Integer;
					 Denominator : out Integer;
					 Threshold : out Integer);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Pointer_Mapping
	--
	--  Description
	--
	--    This procedure is used to set the mapping of the pointer and causes
	--  a MAPPING_NOTIFY event on a status of MAPPING_SUCCESS.
	--
	--
	--  Documentation
	--
	--    Please refer to XSetPointerMapping in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Set_Pointer_Mapping (Display_Id : in Display;
					 Map : in Map_Array;
					 Status : out Map_Status);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Pointer_Mapping
	--
	--  Description
	--
	--    This procedure is used to return the current mapping of the
	--  pointer.
	--
	--
	--  Documentation
	--
	--    Please refer to XGetPointerMapping in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Get_Pointer_Mapping (Display_Id : in Display;
					 Map : in out Map_Array;
					 Status : out Map_Status);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Close_Down_Mode
	--
	--  Description
	--
	--    This procedure is used to define what will happen to the clients
	--  resources at connection close.
	--
	--
	--  Documentation
	--
	--    Please refer to XSetCloseDownMode in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Set_Close_Down_Mode
		     (Display_Id : in Display; Mode : in Close_Mode);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Kill_Client
	--
	--  Description
	--
	--    This procedure is used to forces a close-down of the client that
	--  created the resource if a valid resource is specified.
	--
	--
	--  Documentation
	--
	--    Please refer to XKillClient in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Kill_Client (Display_Id : in Display;
				 Resource_Id : in Resource);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Screen_Saver
	--
	--  Description
	--
	--    This procedure is used to set the screen saver. Timeout and
	--  intervals are specified in seconds. A timeout of 0 seconds disables
	--  the screen saver, while a timeout of -1 restores the default.
	--
	--
	--  Documentation
	--
	--    Please refer to XSetScreenSaver in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Set_Screen_Saver (Display_Id : in Display;
				      Time_Out : in Time;
				      Interval : in Time;
				      Blanking : in Blanking_Type;
				      Exposures : in Exposure_Type);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Force_Screen_Saver
	--
	--  Description
	--
	--    This procedure is used to force the screen saver. If the specified
	--  mode is active and the screen saver currently is deactivated, the
	--  screen saver is activated, event if the screen saver had been
	--  disabled with a timeout of (0).
	--
	--
	--  Documentation
	--
	--    Please refer to XForceScreenSaver in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Force_Screen_Saver
		     (Display_Id : in Display; Mode : in Screen_Saver_Mode);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Activate_Screen_Saver
	--
	--  Description
	--
	--    This procedure is used to activate the screen saver.
	--
	--
	--  Documentation
	--
	--    Please refer to XActivateScreenSaver in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Activate_Screen_Saver (Display_Id : in Display);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Reset_Screen_Saver
	--
	--  Description
	--
	--    This procedure is used to reset the screen saver.
	--
	--
	--  Documentation
	--
	--    Please refer to XResetScreenSaver in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Reset_Screen_Saver (Display_Id : in Display);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Screen_Saver
	--
	--  Description
	--
	--    This procedure is used to get the current screen saver values.
	--
	--
	--  Documentation
	--
	--    Please refer to XGetScreenSaver in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Get_Screen_Saver (Display_Id : in Display;
				      Time_Out : out Time;
				      Interval : out Time;
				      Blanking : out Blanking_Type;
				      Exposures : out Exposure_Type);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Add_Host
	--
	--  Description
	--
	--    This procedure is used to add the specified host to the access
	--  control list for that display. The display hardware must be on the
	--  same host as the program issuing the command.
	--
	--
	--  Documentation
	--
	--    Please refer to XAddHost in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Add_Host (Display_Id : in Display;
			      Host : in Host_Address_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Add_Hosts
	--
	--  Description
	--
	--    This procedure is used to add each specified host to the access
	--  control list for that display. The display hardware must be on the
	--  same host as the program issuing the command.
	--
	--
	--  Documentation
	--
	--    Please refer to XAddHosts in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Add_Hosts (Display_Id : in Display; Hosts : in Host_Array);

	--======================================================================
	--  Subprogram Name
	--
	--    X_List_Hosts
	--
	--  Description
	--
	--    This procedure is used to return the current access control list as
	--  well as whether the use of the list at connection setup was enabled
	--  or disabled.
	--
	--
	--  Documentation
	--
	--    Please refer to XListHosts in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_List_Hosts (Display_Id : in Display;
				States : in out Boolean_Array;
				Hosts : in out Host_List);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Remove_Host
	--
	--  Description
	--
	--    This procedure is used to remove the specified host from the access
	--  control list for that display.
	--
	--
	--  Documentation
	--
	--    Please refer to XRemoveHost in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Remove_Host (Display_Id : in Display;
				 Host : in Host_Address_Record);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Remove_Hosts
	--
	--  Description
	--
	--    This procedure is used to remove each specified host from the
	--  access control list for that display.
	--
	--
	--  Documentation
	--
	--    Please refer to XRemoveHosts in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Remove_Hosts
		     (Display_Id : in Display; Hosts : in Host_Array);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Set_Access_Control
	--
	--  Description
	--
	--    This procedure is used to either enable or disable the use of the
	--  access control list at connection setups.
	--
	--
	--  Documentation
	--
	--    Please refer to XSetAccessControl in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Set_Access_Control (Display_Id : in Display;
					Mode : in Access_Control_Mode);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Enable_Access_Control
	--
	--  Description
	--
	--    This procedure is used to enable the use of the access control list
	--  at connection setups.
	--
	--
	--  Documentation
	--
	--    Please refer to XEnableAccessControl in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Enable_Access_Control (Display_Id : in Display);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Disable_Access_Control
	--
	--  Description
	--
	--    This procedure is used to disable the use of the access control
	--  list at connection setups.
	--
	--
	--  Documentation
	--
	--    Please refer to XDisableAccessControl in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	procedure X_Disable_Access_Control (Display_Id : in Display);

	--======================================================================
	--  Subprogram Name
	--
	--    X_Get_Default
	--
	--  Description
	--
	--    This procedure is used to find out the fonts, colors, and other
	--  environment defaults favored by a particular user.
	--
	--  Documentation
	--
	--    Please refer to XGetDefault in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	function X_Get_Default (Display_Id : in Display;
				Program : in String;
				Option : in String) return String;

	--======================================================================
	--  Subprogram Name
	--
	--    X_Resource_Manager_String
	--
	--  Description
	--
	--    This function returns the RESOURCE_MANAGER property from the
	--  server's root window of screen 0, which was returned when the
	--  connection was opened using XOpenDisplay.
	--
	--  Documentation
	--
	--    Please refer to XResourceManagerString in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Window_Manager
	--======================================================================

	function X_Resource_Manager_String
		    (Display_Id : in Display) return String_Pointer;

    private
	type Resource is new Unsigned_Long;

	type Grab_Mode is new Int32;
	Sync : constant Grab_Mode := 0;
	Async : constant Grab_Mode := 1;

	type Grab_Reply_Status is new Int32;
	Grab_Success : constant Grab_Reply_Status := 0;
	Already_Grabbed : constant Grab_Reply_Status := 1;
	Grab_Invalid_Time : constant Grab_Reply_Status := 2;
	Grab_Not_Viewable : constant Grab_Reply_Status := 3;
	Grab_Frozen : constant Grab_Reply_Status := 4;

	type Notify_Mode is new Int32;
	Normal : constant Notify_Mode := 0;
	Grab : constant Notify_Mode := 1;
	Ungrab : constant Notify_Mode := 2;
	While_Grabbed : constant Notify_Mode := 3;

	type Notify_Detail is new Int32;
	Ancestor : constant Notify_Detail := 0;
	Virtual : constant Notify_Detail := 1;
	Inferior : constant Notify_Detail := 2;
	Nonlinear : constant Notify_Detail := 3;
	Nonlinear_Virtual : constant Notify_Detail := 4;
	Pointer : constant Notify_Detail := 5;
	Pointer_Root : constant Notify_Detail := 6;
	Detail_None : constant Notify_Detail := 7;

	type Visibility_Notify_Type is new Int32;
	Unobscured : constant Visibility_Notify_Type := 0;
	Partially_Obscured : constant Visibility_Notify_Type := 1;
	Fully_Obscured : constant Visibility_Notify_Type := 2;

	type Circulation_Request is new Int32;
	Place_On_Top : constant Circulation_Request := 0;
	Place_On_Bottom : constant Circulation_Request := 1;

	type Protocol_Family is new Int32;
	Internet : constant Protocol_Family := 0;
	Decnet : constant Protocol_Family := 1;
	Chaos : constant Protocol_Family := 2;

	type Property_Notification is new Int32;
	New_Value : constant Property_Notification := 0;
	Delete : constant Property_Notification := 1;

	type Colormap_Notification is new Int32;
	Uninstalled : constant Colormap_Notification := 0;
	Installed : constant Colormap_Notification := 1;

	type Allow_Event_Mode is new Int32;
	Async_Pointer : constant Allow_Event_Mode := 0;
	Sync_Pointer : constant Allow_Event_Mode := 1;
	Replay_Pointer : constant Allow_Event_Mode := 2;
	Async_Keyboard : constant Allow_Event_Mode := 3;
	Sync_Keyboard : constant Allow_Event_Mode := 4;
	Replay_Keyboard : constant Allow_Event_Mode := 5;
	Async_Both : constant Allow_Event_Mode := 6;
	Sync_Both : constant Allow_Event_Mode := 7;

	type Revert_Mode is new Int32;
	Revert_To_None : constant Revert_Mode := Revert_Mode (None);
	Revert_To_Pointer_Root : constant Revert_Mode :=
	   Revert_Mode (Pointer_Root_Window);
	Revert_To_Parent : constant Revert_Mode := 2;

	type Close_Mode is new Int32;
	Destroy_All : constant Close_Mode := 0;
	Retain_Permanent : constant Close_Mode := 1;
	Retain_Temporary : constant Close_Mode := 2;

	type Screen_Saver_Mode is new Int32;
	Reset : constant Screen_Saver_Mode := 0;
	Active : constant Screen_Saver_Mode := 1;

	type Exposure_Type is new Int32;
	Dont_Allow_Exposures : constant Exposure_Type := 0;
	Allow_Exposures : constant Exposure_Type := 1;
	Default_Exposures : constant Exposure_Type := 2;

	type Blanking_Type is new Int32;
	Dont_Prefer_Blanking : constant Blanking_Type := 0;
	Prefer_Blanking : constant Blanking_Type := 1;
	Default_Blanking : constant Blanking_Type := 2;

	type Access_Control_Mode is new Int32;
	Enable : constant Access_Control_Mode := 1;
	Disable : constant Access_Control_Mode := 0;
    end Window_Manager;

    package Resource_Manager is
	subtype Xrm_String is String_Pointer;
	Null_Xrm_String : constant Xrm_String := null;

	-- If a string value is returned in Xrm_Value, it is a C string and
	-- needs to be converted to an Ada STRING.

--	type Xrm_Value is
--	    record
--		Size : X_Long_Integer;
--		Address : X_Address;
--	    end record;
--
--	type Xrm_Value_Ptr is access Xrm_Value;
	type Xrm_Value_Array is array (Natural range <>) of Xrm_Value;
	type Xrm_Value_Table is access Xrm_Value_Array;
	Null_Xrm_Value_Array : Xrm_Value_Array (1 .. 0);

--	type Xrm_Option_Kind is
--	   (Xrm_Option_No_Arg, Xrm_Option_Is_Arg, Xrm_Option_Sticky_Arg,
--	    Xrm_Option_Sep_Arg, Xrm_Option_Res_Arg, Xrm_Option_Skip_Arg,
--	    Xrm_Option_Skip_Line, Xrm_Option_Skip_N_Args); --R4
--	for Xrm_Option_Kind'Size use X_Integer'Size;

	type Xrm_Binding is (Xrm_Bind_Tightly, Xrm_Bind_Loosely);

	type Xrm_Binding_Array is array (Natural range <>) of Xrm_Binding;
	type Xrm_Binding_List is access Xrm_Binding_Array;
	Null_Xrm_Binding_Array : Xrm_Binding_Array (1 .. 0);

	type Xrm_Quark is new Long;
	type Xrm_Quark_Array is array (Natural range <>) of Xrm_Quark;
	type Xrm_Quark_List is access Xrm_Quark_Array;
	Null_Xrm_Quark_Array : Xrm_Quark_Array (1 .. 0);

	subtype Xrm_Class_Array is Xrm_Quark_Array;
	subtype Xrm_Class_List is Xrm_Quark_List;
	subtype Xrm_Class is Xrm_Quark;

	subtype Xrm_Name_Array is Xrm_Quark_Array;
	subtype Xrm_Name_List is Xrm_Quark_List;
	subtype Xrm_Name is Xrm_Quark;

	subtype Xrm_Representation is Xrm_Quark;
	type Xrm_Representation_Ptr is access Xrm_Representation;

--	type Xrm_Option_Desc_Rec is
--	    record
--		Option : String_Pointer;
--		Resource_Name : String_Pointer;
--		Arg_Kind : Xrm_Option_Kind;
--		Value : X_Address;
--	    end record;
--
--	type Xrm_Option_Desc_List is
--	   array (Natural range <>) of Xrm_Option_Desc_Rec;
--
--	Null_Xrm_Options : Xrm_Option_Desc_List (1 .. 0);

	Null_Quark : constant Xrm_Quark := 0;

--	type Xrm_Database is private;

	type Xrm_Searchlist is private;

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Get_File_Database
	--
	--  Description
	--
	--    This function retrieves a database from a file.
	--
	--
	--  Documentation
	--
	--    Please refer to XrmGetFileDatabase in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	function Xrm_Get_File_Database
		    (Filename : in String) return Xrm_Database;

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Get_Resource
	--
	--  Description
	--
	--     This function gets a resource from the specified database by
	--  taking fully qualified name and class strings and returning the
	--  representation and value of the matching resource. The function
	--  returns TRUE if the resource was found; FALSE otherwise.
	--
	--
	--  Documentation
	--
	--    Please refer to XrmGetResource in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Get_Resource (Database : in Xrm_Database;
				    Str_Name, Str_Class : in String;
				    Str_Type : out String_Pointer;
				    Db_Value : out Xrm_Value;
				    Status : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Get_String_Database
	--
	--  Description
	--
	--    This function creates a new database and stores in it the resources
	--  specified in data.
	--
	--  Documentation
	--
	--    Please refer to XrmGetStringDatabase in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	function Xrm_Get_String_Database (Data : in String) return Xrm_Database;

	--=======================================================================
	--  Subprogram Name
	--
	--    Xrm_Initialize
	--
	--  Description
	--
	--     This procedure initializes the resource manager, and should be
	--  called once before using any other resource manager functions.
	--
	--
	--  Documentation
	--
	--    Please refer to XrmInitialize in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Initialize;

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Merge_Databases
	--
	--  Description
	--
	--    This function combines the contents of one database with another;
	--  It will destroy the original Source_db and modify the original
	--  Target_db.
	--
	--
	--  Documentation
	--
	--    Please refer to XrmMergeDatabases in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Merge_Databases (Source_Db : in Xrm_Database;
				       Target_Db : in out Xrm_Database);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Parse_Command
	--
	--  Description
	--
	--  This function loads a resource database from command line arguments.
	--
	--    Documentation
	--
	--    Please refer to XrmParseCommand in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Parse_Command (Db : in out Xrm_Database;
				     Table : in Xrm_Option_Desc_List;
				     Table_Count : in X_Integer;
				     Name : in String;
				     Argc : in out X_Long_Integer;
				     Argv : in out String_List);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Put_File_Database
	--
	--  Description
	--
	--    This function stores a copy of the application's current database
	--  in the specified ASCII text file in a format that is accepted by
	--  Xrm_Put_Line_Resource.
	--
	--
	--  Documentation
	--
	--    Please refer to XrmPutFileDatabase in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Put_File_Database
		     (Database : in Xrm_Database; Filename : in String);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Put_Line_Resource
	--
	--  Description
	--
	--    This function is used to add a resource entry, given as a string
	--  of name and value, to the specified database. If database is
	--  NULL, then a new resource db is created and returned.
	--
	--  Documentation
	--
	--    Please refer to XrmPutLineResource in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Put_Line_Resource
		     (Database : in out Xrm_Database; Line : in String);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Put_Resource
	--
	--  Description
	--
	--    This function is used to store a resource into the database.
	--  If database is NULL, a new resource db is created and returned.
	--
	--
	--  Documentation
	--
	--    Please refer to XrmPutResource in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Put_Resource (Database : in out Xrm_Database;
				    Specifier : in String;
				    Res_Type : in String;
				    Res_Value : in Xrm_Value);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Put_String_Resource
	--
	--  Description
	--
	--    This function adds a resource with the specified value to the
	--  specified database.  If database is NULL, a new resource db is
	--  created and returned.
	--
	--
	--  Documentation
	--
	--    Please refer to XrmPutStringResource in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Put_String_Resource (Database : in out Xrm_Database;
					   Resource : in String;
					   Res_Value : in String);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Q_Get_Resource
	--
	--  Description
	--
	--    For a given database, this function reads in the fully qualified
	--  name and class strings as lists of quarks, and returns the
	--  representation and value of the matching resource. If a resource
	--  was found, True is returned; otherwise False is returned.
	--
	--
	--  Documentation
	--
	--    Please refer to XrmQGetResource in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Q_Get_Resource (Database : in Xrm_Database;
				      Quark_Name : in Xrm_Name_Array;
				      Quark_Class : in Xrm_Class_Array;
				      Quark_Type : out Xrm_Representation;
				      Db_Value : out Xrm_Value;
				      Status : out Boolean);

	procedure Xrm_Q_Get_Resource (Database : in Xrm_Database;
				      Quark_Name : in Xrm_Name_List;
				      Quark_Class : in Xrm_Class_List;
				      Quark_Type : out Xrm_Representation;
				      Db_Value : out Xrm_Value;
				      Status : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Q_Get_Search_List
	--
	--  Description
	--
	--    This function takes a list of names and classes and returns a list
	--  database levels where a match occurs. If Search_List was large
	--  enough for the search list, True is returned; otherwise False is
	--  returned.
	--
	--
	--  Documentation
	--
	--    Please refer to XrmQGetSearchList in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Q_Get_Search_List (Database : in Xrm_Database;
					 Names : in Xrm_Name_List;
					 Classes : in Xrm_Class_List;
					 Search_List : in out Xrm_Searchlist;
					 List_Length : in X_Integer;
					 Status : out Boolean);

	procedure Xrm_Q_Get_Search_List (Database : in Xrm_Database;
					 Names : in Xrm_Name_Array;
					 Classes : in Xrm_Class_Array;
					 Search_List : in out Xrm_Searchlist;
					 List_Length : in X_Integer;
					 Status : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Q_Get_Search_Resource
	--
	--  Description
	--
	--    This function searches the Search_List for the resource that is
	--  fully identified by Name and Class. If the resource was found,
	--  True is returned; otherwise False is returned.
	--
	--
	--  Documentation
	--
	--    Please refer to XrmQGetSearchResource in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Q_Get_Search_Resource (Search_List : in Xrm_Searchlist;
					     Name : in Xrm_Name;
					     Class : in Xrm_Class;
					     Data_Type : out Xrm_Representation;
					     Db_Value : in out Xrm_Value;
					     Status : out Boolean);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Q_Put_Resource
	--
	--  Description
	--    This procedure stores a resource into a database using quarks.
	--
	--
	--    Documentation
	--
	--    Please refer to XrmQPutResource in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Q_Put_Resource (Database : in out Xrm_Database;
				      Bindings : in Xrm_Binding_Array;
				      Quarks : in Xrm_Quark_Array;
				      Res_Type : in Xrm_Representation;
				      Res_Value : in Xrm_Value);

	procedure Xrm_Q_Put_Resource (Database : in out Xrm_Database;
				      Bindings : in Xrm_Binding_List;
				      Quarks : in Xrm_Quark_List;
				      Res_Type : in Xrm_Representation;
				      Res_Value : in Xrm_Value);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Q_Put_String_Resource
	--
	--  Description
	--
	--    This procedure adds a string resource value to a database using
	--  quarks.
	--
	--  Documentation
	--
	--    Please refer to XrmQPutStringResource in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Q_Put_String_Resource (Database : in out Xrm_Database;
					     Bindings : in Xrm_Binding_List;
					     Quarks : in Xrm_Quark_List;
					     Str_Value : in String);

	procedure Xrm_Q_Put_String_Resource (Database : in out Xrm_Database;
					     Bindings : in Xrm_Binding_Array;
					     Quarks : in Xrm_Quark_Array;
					     Str_Value : in String);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Quark_To_String
	--
	--  Description
	--
	--    This function converts a quark to a string.
	--
	--  Documentation
	--
	--    Please refer to XrmQuarkToString in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	function Xrm_Quark_To_String (Quark : in Xrm_Quark) return Xrm_String;

	function Xrm_Quark_To_String (Quark : in Xrm_Quark) return String;

	function Xrm_Name_To_String (Name : in Xrm_Name) return String
	   renames Xrm_Quark_To_String;

	function Xrm_Name_To_String (Name : in Xrm_Name) return Xrm_String
	   renames Xrm_Quark_To_String;

	function Xrm_Class_To_String (Class : in Xrm_Class) return String
	   renames Xrm_Quark_To_String;

	function Xrm_Class_To_String (Class : in Xrm_Class) return Xrm_String
	   renames Xrm_Quark_To_String;

	function Xrm_Representation_To_String
		    (Representation : in Xrm_Representation) return String
	   renames Xrm_Quark_To_String;

	function Xrm_Representation_To_String
		    (Representation : in Xrm_Representation) return Xrm_String
	   renames Xrm_Quark_To_String;

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_String_To_Binding_Quark_List
	--
	--  Description
	--
	--    This procedure converts a key string to a binding list & a quark
	--  list.
	--
	--  Documentation
	--
	--    Please refer to XrmStringToBindingQuarkList in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_String_To_Binding_Quark_List
		     (Str : in String;
		      Bindings : in out Xrm_Binding_Array;
		      Quarks : in out Xrm_Quark_Array);

	procedure Xrm_String_To_Binding_Quark_List
		     (Str : in String;
		      Bindings : in out Xrm_Binding_List;
		      Quarks : in out Xrm_Quark_List);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_String_To_Quark
	--
	--  Description
	--
	--    This function converts a string to a quark.
	--
	--  Documentation
	--
	--    Please refer to XrmStringToQuark in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	function Xrm_String_To_Quark (Str : in String) return Xrm_Quark;

	function Xrm_String_To_Quark (Str : in Xrm_String) return Xrm_Quark;

	function Xrm_String_To_Name (Str : in String) return Xrm_Name
	   renames Xrm_String_To_Quark;

	function Xrm_String_To_Name (Str : in Xrm_String) return Xrm_Name
	   renames Xrm_String_To_Quark;

	function Xrm_String_To_Class (Str : in String) return Xrm_Class
	   renames Xrm_String_To_Quark;

	function Xrm_String_To_Class (Str : in Xrm_String) return Xrm_Class
	   renames Xrm_String_To_Quark;

	function Xrm_String_To_Representation
		    (Str : in String) return Xrm_Representation
	   renames Xrm_String_To_Quark;

	function Xrm_String_To_Representation
		    (Str : in Xrm_String) return Xrm_Representation
	   renames Xrm_String_To_Quark;

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_String_To_Quark_List
	--
	--  Description
	--
	--    This procedure converts a key string to a binding list & a quark
	--  list.
	--
	--  Documentation
	--
	--    Please refer to XrmStringToQuarkList in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_String_To_Quark_List
		     (Str : in String; Quarks : out Xrm_Quark_Array);

	procedure Xrm_String_To_Quark_List
		     (Str : in Xrm_String; Quarks : out Xrm_Quark_List);

	procedure Xrm_String_To_Name_List
		     (Str : in String; Quarks : out Xrm_Name_Array)
	   renames Xrm_String_To_Quark_List;

	procedure Xrm_String_To_Name_List
		     (Str : in Xrm_String; Quarks : out Xrm_Name_List)
	   renames Xrm_String_To_Quark_List;

	procedure Xrm_String_To_Class_List
		     (Str : in String; Quarks : out Xrm_Class_Array)
	   renames Xrm_String_To_Quark_List;

	procedure Xrm_String_To_Class_List
		     (Str : in Xrm_String; Quarks : out Xrm_Class_List)
	   renames Xrm_String_To_Quark_List;

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Unique_Quark
	--
	--  Description
	--
	--    This function allocates a new quark that has no string
	--  representation.
	--
	--  Documentation
	--
	--    Please refer to XrmUniqueQuark in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--======================================================================

	function Xrm_Unique_Quark return Xrm_Quark;

	--======================================================================
	--  Subprogram Name
	--
	--    New_Database
	--
	--  Description
	--
	--    This function allocates a new resource database
	--
	--
	--  Documentation
	--
	--    This subroutine has been added to the standard C language Xlib
	--  interface as a convenience routine.
	--
	--  Package:  Resource_Manager
	--======================================================================

	function New_Database return Xrm_Database;

	--======================================================================
	--  Subprogram Name
	--
	--    Destroy_Database
	--
	--  Description
	--
	--    These two procedures will destroy and deallocation any space
	--  associated with an Xrm_Database.  If the Database is specified,
	--  then that database is destroyed.  If a Display is specified,
	--  then the resource database associated with the display is
	--  destroyed.
	--
	--
	--  Documentation
	--
	--    This subroutine has been added to the standard C language Xlib
	--  interface as a convenience routine.
	--
	--  Package:  Resource_Manager
	--======================================================================

	procedure Xrm_Destroy_Database (Db : in out Xrm_Database);

	procedure Xrm_Destroy_Database (The_Display : in out Display);

	-- The following routines are not part of the C Xlib Resource Manager.
	-- Rather, they have been written as convenience routines specifically
	-- for Ada Toolkit and Ada widget developers.  Application programmers
	-- should exercise caution when using the following routines.

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_null_db
	--
	--  Description
	--
	--    This function initializes a database structure to null
	--
	--
	--  Documentation
	--
	--    This subroutine has been added to the standard C language Xlib
	--  interface as a convenience routine.
	--
	--  Package:  Resource_Manager
	--=======================================================================

	function Xrm_Null_Db return Xrm_Database;

	--======================================================================
	--  Subprogram Name
	--
	--    Get_Display_Resource_Db
	--
	--  Description
	--
	--    This function retrieves the resource database field in a display
	--  record.
	--
	--
	--  Documentation
	--
	--    This subroutine has been added to the standard C language Xlib
	--  interface as a convenience routine.
	--
	--  Package:  Resource_Manager
	--=======================================================================

	function Get_Display_Resource_Db
		    (Display_Id : in Display) return Xrm_Database;

	--======================================================================
	--  Subprogram Name
	--
	--    Set_Display_Resource_Db
	--
	--  Description
	--
	--    This function stores the resource database in a display
	--  record.
	--
	--
	--  Documentation
	--
	--    This subroutine has been added to the standard C language Xlib
	--  interface as a convenience routine.
	--
	--  Package:  Resource_Manager
	--=======================================================================

	procedure Set_Display_Resource_Db
		     (Display_Id : in out Display; Database : in Xrm_Database);

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Create_SearchList
	--
	--  Description
	--
	--    This function creates the opaque data structure SearchList of the
	--  given size, where size is the number of elements in the searchlist.
	--
	--

	--  Documentation
	--
	--    Please refer to XrmCreateSearchList in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--=======================================================================

	function Xrm_Create_Searchlist
		    (Size : in Positive) return Xrm_Searchlist;

	--======================================================================
	--  Subprogram Name
	--
	--    Xrm_Free_SearchList
	--
	--  Description
	--
	--    This procedure destroys the opaque data structure SearchList.
	--
	--
	--  Documentation
	--
	--    Please refer to XrmFreeSearchList in the
	--  Xlib - C Language X Interface X Window System
	--  manual for more information.
	--
	--  Package:  Resource_Manager
	--=======================================================================

	procedure Xrm_Free_Searchlist (List : in out Xrm_Searchlist);
    private
	type Xrm_Hash_Bucket_Rec;
	type Xrm_Hash_Bucket is access Xrm_Hash_Bucket_Rec;

	type Xrm_Hash_Table is array (Natural range <>) of Xrm_Hash_Bucket;
	Null_Xrm_Hash_Table : Xrm_Hash_Table (1 .. 0);

	type Xrm_Hash_Bucket_Rec is
	    record
		Next : Xrm_Hash_Bucket;
		Quark : Xrm_Quark;
		Rep_Type : Xrm_Representation;
		Rm_Value : Xrm_Value;
		Tables : Xrm_Hash_Table (1 .. 2);
		Has_Values : Byte_Array (1 ..
					    2); -- used by R4 as 8-bit booleans.
	    end record;

	type Xrm_Database is new Xrm_Hash_Bucket;

	type Xrm_Searchlist is access Xrm_Hash_Table;
    end Resource_Manager;

    --========================================================================
    --  Subprogram Name
    --
    --    Get_Command_Line_Arguments
    --
    --  Description
    --
    --    This function returns a list containing any command line arguments
    --  to the main program. If there are no arguments then it returns null.
    --  The meaning of the arguments is application specific.
    --
    --
    --  Documentation
    --
    --    This subroutine has been added to the standard C language Xlib
    --  interface as a convenience routine.
    --
    --  Package:  X_Lib
    --========================================================================

    function Get_Command_Line_Arguments return String_List;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Open_Display
--    --
--    --  Description
--    --
--    --    This function opens a connection to the X Server controlling the
--    --  specified display and returns a Display ID for use in all
--    --  subsequent calls.
--    --
--    --  Parameters
--    --
--    --  Name        : Specifies the hardware display name.
--    --
--    --  Documentation
--    --
--    --    Please refer to XOpenDisplay in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function X_Open_Display (Name : in String) return Display;
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_No_Op
--    --
--    --  Description
--    --
--    --    This procedure executes a NoOperation protocol request to exercise the
--    --  X Server. The output buffer is not flushed.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --
--    --  Documentation
--    --
--    --    Please refer to XNoOp in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_No_Op (Display_Id : in Display);
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Close_Display
--    --
--    --  Description
--    --
--    --    This procedure closes the connection with the X Server.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --
--    --  Documentation
--    --
--    --    Please refer to XCloseDisplay in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_Close_Display (The_Display : in Display);

    --========================================================================
    --  Subprogram Name
    --
    --    Bitmap_Bit_Order
    --
    --  Description
    --
    --    This function is used to determine whether the leftmost bit in the
    --  bitmap is either the least or most significant bit in the unit.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to BitmapBitOrder in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Bitmap_Bit_Order (Display_Id : in Display) return Order_Type;

    function X_Bitmap_Bit_Order (Display_Id : in Display) return Order_Type
       renames Bitmap_Bit_Order;

    --========================================================================
    --  Subprogram Name
    --
    --    Bitmap_Pad
    --
    --  Description
    --
    --    This function is used to determine whether the leftmost bit in the
    --  bitmap is either the least or most significnt bit in the unit.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to BitmapPad in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Bitmap_Pad (Display_Id : in Display) return Pixel;

    function X_Bitmap_Pad (Display_Id : in Display) return Pixel
       renames Bitmap_Pad;

    --========================================================================
    --  Subprogram Name
    --
    --    Bitmap_Unit
    --
    --  Description
    --
    --    This function is used to get the size of the bitmap's unit in
    --  bits.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to BitmapUnit in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Bitmap_Unit (Display_Id : in Display) return Pixel;

    function X_Bitmap_Unit (Display_Id : in Display) return Pixel
       renames Bitmap_Unit;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Black_Pixel
--    --
--    --  Description
--    --
--    --    This function is used to return the black pixel value of the
--    --  specified screen.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Screen_No  : Specifies the screen number.
--    --
--    --  Documentation
--    --
--    --    Please refer to BlackPixel in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Black_Pixel (Display_Id : in Display; Screen_No : in Screen_Number)
--			 return U_Pixel;
--
--    function X_Black_Pixel
--		(Display_Id : in Display; Screen_No : in Screen_Number)
--		return U_Pixel renames Black_Pixel;

    --========================================================================
    --  Subprogram Name
    --
    --    Connection_Number
    --
    --  Description
    --
    --    This function is used to return the connection number for the
    --  specified display.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to ConnectionNumber in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Connection_Number (Display_Id : in Display) return X_Long_Integer;

    --========================================================================
    --  Subprogram Name
    --
    --    Default_Colormap
    --
    --  Description
    --
    --    This function is used to determine the default Colormap Id for
    --  allocation on the specified screen. Most routine allocations. of
    --  color should be made out of this map.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Screen_No  : Specifies the screen number.
    --
    --  Documentation
    --
    --    Please refer to DefaultColormap in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Default_Colormap
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Colors.Color_Map;

    function X_Default_Colormap
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Colors.Color_Map renames Default_Colormap;

    -- new for R4
    procedure X_List_Depths (Display_Id : in Display;
			     Screen_No : in Screen_Number;
			     Count : in out Depth_List);

    --========================================================================
    --  Subprogram Name
    --
    --    Default_Depth
    --
    --  Description
    --
    --    This function is used to return the depth (number of planes) of the
    --  default root window for the specified screen.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Screen_No  : Specifies the screen number.
    --
    --  Documentation
    --
    --    Please refer to DefaultDepth in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Default_Depth
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Depth_Type;

    function X_Default_Depth
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Depth_Type renames Default_Depth;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Default_GC
--    --
--    --  Description
--    --
--    --    This function is used to return the default graphic context for the
--    --  root window of the specified screen.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Screen_No  : Specifies the screen number.
--    --
--    --  Documentation
--    --
--    --    Please refer to DefaultGC in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Default_Gc (Display_Id : in Display; Screen_No : in Screen_Number)
--			return Graphic_Output.Graphic_Context;
--
--    function X_Default_Gc
--		(Display_Id : in Display; Screen_No : in Screen_Number)
--		return Graphic_Output.Graphic_Context renames Default_Gc;
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Default_Root_Window
--    --
--    --  Description
--    --
--    --    This function is used to determine the default root window for the
--    --  default screen.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --
--    --  Documentation
--    --
--    --    Please refer to DefaultRootWindow in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Default_Root_Window (Display_Id : in Display) return Window;
--
--    function X_Default_Root_Window (Display_Id : in Display) return Window
--       renames Default_Root_Window;
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Default_Screen
--    --
--    --  Description
--    --
--    --    This function is used to return the default screen referenced in the
--    --  X_Open_Display routine.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --
--    --  Documentation
--    --
--    --    Please refer to DefaultScreen in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Default_Screen (Display_Id : in Display) return Screen_Number;
--
--    function X_Default_Screen (Display_Id : in Display) return Screen_Number
--       renames Default_Screen;

    -- new for R4
    function X_Screen_Number_Of_Screen
		(Screen_Id : in Screen) return Screen_Number;

    --========================================================================
    --  Subprogram Name
    --
    --    Default_Visual
    --
    --  Description
    --
    --    This function is used to return the default visual type for the
    --  specified screen.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Screen_No  : Specifies the screen number.
    --
    --  Documentation
    --
    --    Please refer to DefaultVisual in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Default_Visual
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Visual;

    function X_Default_Visual
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Visual renames Default_Visual;

    --========================================================================
    --  Subprogram Name
    --
    --    Display_Cells
    --
    --  Description
    --
    --    This function is used to return the number of entries in the default
    --  color map.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Screen_No  : Specifies the screen number.
    --
    --  Documentation
    --
    --    Please refer to DisplayCells in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Display_Cells
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Natural;

    function X_Display_Cells
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Natural renames Display_Cells;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Display_Height
--    --
--    --  Description
--    --
--    --    This function is used to return an integer that describes the height
--    --  of the screen in pixels.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Screen_No  : Specifies the screen number.
--    --
--    --  Documentation
--    --
--    --    Please refer to DisplayHeight in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Display_Height
--		(Display_Id : in Display; Screen_No : in Screen_Number)
--		return Width_Height;
--
--    function X_Display_Height
--		(Display_Id : in Display; Screen_No : in Screen_Number)
--		return Width_Height renames Display_Height;

    --========================================================================
    --  Subprogram Name
    --
    --    Display_Height_Mm
    --
    --  Description
    --
    --    This function is used to return the height of the specified screen
    --  in millimeters.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Screen_No  : Specifies the screen number.
    --
    --  Documentation
    --
    --    Please refer to DisplayHeightMm in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Display_Height_Mm
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Millimeters;

    function X_Display_Height_Mm
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Millimeters renames Display_Height_Mm;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Display_Name
    --
    --  Description
    --
    --    This function is used to return the name of the display that you are
    --  currently using. If a NULL string is specified, X_Display_Name looks in
    --  the environment for the display and returns the display name that the
    --  user was requesting. This makes it easier to report to the user
    --  precisely which display the program attempted to open when the initial
    --  connection attempt failed.
    --
    --  Parameters
    --
    --  Name : Specifies the name.
    --
    --  Documentation
    --
    --    Please refer to XDisplayName in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function X_Display_Name (Name : in String) return String;

    --========================================================================
    --  Subprogram Name
    --
    --    Display_Planes
    --
    --  Description
    --
    --    This function is used to get the depth of the root window of the
    --  specified screen.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Screen_No  : Specifies the screen number.
    --
    --  Documentation
    --
    --    Please refer to DisplayPlanes in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Display_Planes
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Depth_Type;

    function X_Display_Planes
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Depth_Type renames Display_Planes;

    --========================================================================
    --  Subprogram Name
    --
    --    Display_String
    --
    --  Description
    --
    --    This function is used to return the string that was passed to the
    --  X_Open_Display function. On UNIX-based systems, if the passed string was
    --  null then the function returns the DISPLAY environment variable when the
    --  current display was opened.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to DisplayString in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Display_String (Display_Id : in Display) return String;

    function X_Display_String (Display_Id : in Display) return String
       renames Display_String;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Display_Width
--    --
--    --  Description
--    --
--    --    This function is used to obtain the width of the screen in pixels.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Screen_No  : Specifies the screen number.
--    --
--    --  Documentation
--    --
--    --    Please refer to DisplayWidth in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Display_Width
--		(Display_Id : in Display; Screen_No : in Screen_Number)
--		return Width_Height;
--
--    function X_Display_Width
--		(Display_Id : in Display; Screen_No : in Screen_Number)
--		return Width_Height renames Display_Width;

    --========================================================================
    --  Subprogram Name
    --
    --    Display_Width_Mm
    --
    --  Description
    --
    --    This function is used to obtain the width of the screen in
    --  millimeters.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Screen_No  : Specifies the screen number.
    --
    --  Documentation
    --
    --    Please refer to DisplayWidthMm in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Display_Width_Mm
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Millimeters;

    function X_Display_Width_Mm
		(Display_Id : in Display; Screen_No : in Screen_Number)
		return Millimeters renames Display_Width_Mm;

    --========================================================================
    --  Subprogram Name
    --
    --    Image_Byte_Order
    --
    --  Description
    --
    --    This function is used to specify the required byte order order for
    --  images for each scanline unit in XY_Format (bitmap) or for each pixel
    --  value in Z_Format. The function can return one of the constants LSB_
    --  First or MSB_First.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to ImageByteOrder in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Image_Byte_Order (Display_Id : in Display) return Order_Type;

    function X_Image_Byte_Order (Display_Id : in Display) return Order_Type
       renames Image_Byte_Order;

    --========================================================================
    --  Subprogram Name
    --
    --    Last_Known_Request_Processed
    --
    --  Description
    --
    --    This function returns the full serial number of the last request
    --  known by Xlib to have been processed by the X Server.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to LastKnownRequestProcessed in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Last_Known_Request_Processed
		(Display_Id : in Display) return X_Long_Integer;

    --========================================================================
    --  Subprogram Name
    --
    --    Next_Request
    --
    --  Description
    --
    --    This function returns the full serial number to be used for the
    --  next request.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to NextRequest in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Next_Request (Display_Id : in Display) return X_Long_Integer;

    function X_Next_Request (Display_Id : in Display) return X_Long_Integer
       renames Next_Request;

    --========================================================================
    --  Subprogram Name
    --
    --    Protocol_Version
    --
    --  Description
    --
    --    This function is used to return the major version number(11) of the
    --  X Protocol associated with the connected Display.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to ProtocolVersion in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Protocol_Version (Display_Id : in Display) return Natural;

    function X_Protocol_Version (Display_Id : in Display) return Natural
       renames Protocol_Version;

    --========================================================================
    --  Subprogram Name
    --
    --    Protocol_Revision
    --
    --  Description
    --
    --    This function is used to return the minor protocol revision of the
    --  X Server.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to ProtocolRevision in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Protocol_Revision (Display_Id : in Display) return Natural;

    function X_Protocol_Revision (Display_Id : in Display) return Natural
       renames Protocol_Revision;

    --========================================================================
    --  Subprogram Name
    --
    --    Q_Length
    --
    --  Description
    --
    --    This function is used to return the length of the event queue for the
    --  connected display. Note that there may be more event that have not
    --  been read into the queue yet.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to QLength in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Q_Length (Display_Id : in Display) return Natural;

    function X_Q_Length (Dpy : in Display) return Natural renames Q_Length;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Root_Window
--    --
--    --  Description
--    --
--    --    This function is used to return the root window. This function is
--    --  useful with function that take a parent window as an argument.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Screen_No  : Specifies the screen number.
--    --
--    --  Documentation
--    --
--    --    Please refer to RootWindow in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Root_Window (Display_Id : in Display; Screen_No : in Screen_Number)
--			 return Window;
--
--    function X_Root_Window
--		(Display_Id : in Display; Screen_No : in Screen_Number)
--		return Window renames Root_Window;

    --========================================================================
    --  Subprogram Name
    --
    --    Screen_Count
    --
    --  Description
    --
    --    This function is used to return the number of available screens.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to ScreenCount in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Screen_Count (Display_Id : in Display) return Screen_Number;

    function X_Screen_Count (Display_Id : in Display) return Screen_Number
       renames Screen_Count;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Server_Vendor
--    --
--    --  Description
--    --
--    --    This function is used to return a string that provides some
--    --  identification of the owner of the X Server implementation.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --
--    --  Documentation
--    --
--    --    Please refer to ServerVendor in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Server_Vendor (Display_Id : in Display) return String;
--
--    function X_Server_Vendor (Display_Id : in Display) return String
--       renames Server_Vendor;

    --========================================================================
    --  Subprogram Name
    --
    --    Vendor_Release
    --
    --  Description
    --
    --    This function is used to return a number related to a vendor's
    --  release of the X Server.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to VendorRelease in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Vendor_Release (Display_Id : in Display) return Natural;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    White_Pixel
--    --
--    --  Description
--    --
--    --    This function is used to return the white pixel value for the
--    --  specified display.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Screen_No  : Specifies the screen number.
--    --
--    --  Documentation
--    --
--    --    Please refer to WhitePixel in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function White_Pixel (Display_Id : in Display; Screen_No : in Screen_Number)
--			 return U_Pixel;
--
--    function X_White_Pixel
--		(Display_Id : in Display; Screen_No : in Screen_Number)
--		return U_Pixel renames White_Pixel;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Screen_Of_Display, X_Screen_Of_Display
--    --
--    --  Description
--    --
--    --    This function is used to return a pointer to the screen record of
--    --  the specified display.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Screen_No : Specifies which screen to return.
--    --
--    --  Documentation
--    --
--    --    Please refer to ScreenOfDisplay in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Screen_Of_Display
--		(Display_Id : in Display; Screen_No : in Screen_Number)
--		return Screen;
--
--    function X_Screen_Of_Display
--		(Display_Id : in Display; Screen_No : in Screen_Number)
--		return Screen renames Screen_Of_Display;
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Default_Screen_Of_Display
--    --
--    --  Description
--    --
--    --    This function is used to return the default screen of the specified
--    --  display.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --
--    --  Documentation
--    --
--    --    Please refer to DefaultScreenOfDisplay in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Default_Screen_Of_Display (Display_Id : in Display) return Screen;
--
--    function X_Default_Screen_Of_Display (Display_Id : in Display) return Screen
--       renames Default_Screen_Of_Display;
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Display_Of_Screen
--    --
--    --  Description
--    --
--    --    This function is used to return the display of the specified screen.
--    --
--    --  Parameters
--    --
--    --  Screen_Id  : Specifies the screen Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to DisplayOfScreen in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Display_Of_Screen (Screen_Id : in Screen) return Display;
--
--    function X_Display_Of_Screen (Screen_Id : in Screen) return Display
--       renames Display_Of_Screen;
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Root_Window_Of_Screen
--    --
--    --  Description
--    --
--    --    This function is used to return the root window of the specified
--    --  screen.
--    --
--    --  Parameters
--    --
--    --  Screen_Id  : Specifies the screen Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to RootWindowOfScreen in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Root_Window_Of_Screen (Screen_Id : in Screen) return Window;
--
--    function X_Root_Window_Of_Screen (Screen_Id : in Screen) return Window
--       renames Root_Window_Of_Screen;
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Black_Pixel_Of_Screen
--    --
--    --  Description
--    --
--    --    This function is used to return the black pixel value of the specified
--    --  screen.
--    --
--    --  Parameters
--    --
--    --  Screen_Id  : Specifies the screen Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to BlackPixelOfScreen in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Black_Pixel_Of_Screen (Screen_Id : in Screen) return U_Pixel;
--
--    function X_Black_Pixel_Of_Screen (Screen_Id : in Screen) return U_Pixel
--       renames Black_Pixel_Of_Screen;
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    White_Pixel_Of_Screen
--    --
--    --  Description
--    --
--    --    This function is used to return the white pixel value of the specified
--    --  screen.
--    --
--    --  Parameters
--    --
--    --  Screen_Id  : Specifies the screen Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to WhitePixelOfScreen in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function White_Pixel_Of_Screen (Screen_Id : in Screen) return U_Pixel;
--
--    function X_White_Pixel_Of_Screen (Screen_Id : in Screen) return U_Pixel
--       renames White_Pixel_Of_Screen;

    --========================================================================
    --  Subprogram Name
    --
    --    Default_Colormap_Of_Screen
    --
    --  Description
    --
    --    This function is used to return the default Colormap from the
    --  specified screen.
    --
    --  Parameters
    --
    --  Screen_Id  : Specifies the screen Id.
    --
    --  Documentation
    --
    --    Please refer to DefaultColormapOfScreen in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Default_Colormap_Of_Screen
		(Screen_Id : in Screen) return Colors.Color_Map;

    function X_Default_Colormap_Of_Screen
		(Screen_Id : in Screen) return Colors.Color_Map
       renames Default_Colormap_Of_Screen;

    --========================================================================
    --  Subprogram Name
    --
    --    Default_Depth_Of_Screen
    --
    --  Description
    --
    --    This function is used to return the default depth of the
    --  specified screen.
    --
    --  Parameters
    --
    --  Screen_Id  : Specifies the screen Id.
    --
    --  Documentation
    --
    --    Please refer to DefaultDepthOfScreen in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Default_Depth_Of_Screen (Screen_Id : in Screen) return Depth_Type;

    function X_Default_Depth_Of_Screen (Screen_Id : in Screen) return Depth_Type
       renames Default_Depth_Of_Screen;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Default_GC_Of_Screen
--    --
--    --  Description
--    --
--    --    This function is used to return the default Graphic Context of from
--    --  the specified screen.
--    --
--    --  Parameters
--    --
--    --  Screen_Id  : Specifies the screen Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to DefaultGCOfScreen in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Default_Gc_Of_Screen (Screen_Id : in Screen)
--				  return Graphic_Output.Graphic_Context;
--
--    function X_Default_Gc_Of_Screen
--		(Screen_Id : in Screen) return Graphic_Output.Graphic_Context
--       renames Default_Gc_Of_Screen;

    --========================================================================
    --  Subprogram Name
    --
    --    Default_Visual_Of_Screen
    --
    --  Description
    --
    --    This function is used to return the default visual from the
    --  specified screen.
    --
    --  Parameters
    --
    --  Screen_Id  : Specifies the screen Id.
    --
    --  Documentation
    --
    --    Please refer to DefaultVisualOfScreen in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Default_Visual_Of_Screen (Screen_Id : in Screen) return Visual;

    function X_Default_Visual_Of_Screen (Screen_Id : in Screen) return Visual
       renames Default_Visual_Of_Screen;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Width_Of_Screen
--    --
--    --  Description
--    --
--    --    This function is used to return the width of the specified screen.
--    --
--    --  Parameters
--    --
--    --  Screen_Id  : Specifies the screen Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to WidthOfScreen in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Width_Of_Screen (Screen_Id : in Screen) return Width_Height;
--
--    function X_Width_Of_Screen (Screen_Id : in Screen) return Width_Height
--       renames Width_Of_Screen;
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Height_Of_Screen
--    --
--    --  Description
--    --
--    --    This function is used to return the height of the specified screen.
--    --
--    --  Parameters
--    --
--    --  Screen_Id  : Specifies the screen Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to HeightOfScreen in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Height_Of_Screen (Screen_Id : in Screen) return Width_Height;
--
--    function X_Height_Of_Screen (Screen_Id : in Screen) return Width_Height
--       renames Height_Of_Screen;

    --========================================================================
    --  Subprogram Name
    --
    --    Width_MM_Of_Screen
    --
    --  Description
    --
    --    This function is used to return the width of the specified screen in
    --  millimeters.
    --
    --  Parameters
    --
    --  Screen_Id  : Specifies the screen Id.
    --
    --  Documentation
    --
    --    Please refer to WidthMMOfScreen in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Width_Mm_Of_Screen (Screen_Id : in Screen) return Millimeters;

    function X_Width_Mm_Of_Screen (Screen_Id : in Screen) return Millimeters
       renames Width_Mm_Of_Screen;

    --========================================================================
    --  Subprogram Name
    --
    --    Height_MM_Of_Screen
    --
    --  Description
    --
    --    This function is used to return the height of the specified screen in
    --  millimeters.
    --
    --  Parameters
    --
    --  Screen_Id  : Specifies the screen Id.
    --
    --  Documentation
    --
    --    Please refer to HeightMMOfScreen in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Height_Mm_Of_Screen (Screen_Id : in Screen) return Millimeters;

    function X_Height_Mm_Of_Screen (Screen_Id : in Screen) return Millimeters
       renames Height_Mm_Of_Screen;

    --========================================================================
    --  Subprogram Name
    --
    --    Planes_Of_Screen
    --
    --  Description
    --
    --    This function is used to return the number of planes in the
    --  specified screen.
    --
    --  Parameters
    --
    --  Screen_Id  : Specifies the screen Id.
    --
    --  Documentation
    --
    --    Please refer to PlanesOfScreen in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Planes_Of_Screen (Screen_Id : in Screen) return Natural;

    function X_Planes_Of_Screen (Screen_Id : in Screen) return Natural
       renames Planes_Of_Screen;

    --========================================================================
    --  Subprogram Name
    --
    --    Cells_Of_Screen
    --
    --  Description
    --
    --    This function is used to return the number of Colormap cells in the
    --  specified screen.
    --
    --  Parameters
    --
    --  Screen_Id  : Specifies the screen Id.
    --
    --  Documentation
    --
    --    Please refer to CellsOfScreen in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Cells_Of_Screen (Screen_Id : in Screen) return Natural;

    --========================================================================
    --  Subprogram Name
    --
    --    Min_Cmaps_Of_Screen
    --
    --  Description
    --
    --    This function is used to return the minimum number of color maps
    --  supported by the specified screen.
    --
    --  Parameters
    --
    --  Screen_Id  : Specifies the screen Id.
    --
    --  Documentation
    --
    --    Please refer to MinCmapsOfScreen in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Min_Cmaps_Of_Screen (Screen_Id : in Screen) return Natural;

    function X_Min_Cmaps_Of_Screen (Screen_Id : in Screen) return Natural
       renames Min_Cmaps_Of_Screen;

    --========================================================================
    --  Subprogram Name
    --
    --    Max_Cmaps_Of_Screen
    --
    --  Description
    --
    --    This function is used to return the maximum number of color maps
    --  supported by the specified screen.
    --
    --  Parameters
    --
    --  Screen_Id  : Specifies the screen Id.
    --
    --  Documentation
    --
    --    Please refer to MaxCmapsOfScreen in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Max_Cmaps_Of_Screen (Screen_Id : in Screen) return Natural;

    function X_Max_Cmaps_Of_Screen (Screen_Id : in Screen) return Natural
       renames Max_Cmaps_Of_Screen;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    Does_Save_Unders
--    --
--    --  Description
--    --
--    --    This function is used to return a Boolean value indicating whether
--    --  the screen supports save unders.
--    --
--    --  Parameters
--    --
--    --  Screen_Id  : Specifies the screen Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to DoesSaveUnders in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    function Does_Save_Unders (Screen_Id : in Screen) return Boolean;
--
--    function X_Does_Save_Unders (Screen_Id : in Screen) return Boolean
--       renames Does_Save_Unders;

    --========================================================================
    --  Subprogram Name
    --
    --    Does_Backing_Store
    --
    --  Description
    --
    --    This function is used to return a value indicating whether
    --  the screen supports Backing Stores. The value returned can be one of
    --  When_Mapped, Not_Useful or Always.
    --
    --  Parameters
    --
    --  Screen_Id  : Specifies the screen Id.
    --
    --  Documentation
    --
    --    Please refer to DoesBackingStore in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Does_Backing_Store
		(Screen_Id : in Screen) return Backing_Store_Type;

    function X_Does_Backing_Store
		(Screen_Id : in Screen) return Backing_Store_Type
       renames Does_Backing_Store;

    --========================================================================
    --  Subprogram Name
    --
    --    Event_Mask_Of_Screen
    --
    --  Description
    --
    --    This function is used to return the initial root event mask for the
    --  specified screen.
    --
    --  Parameters
    --
    --  Screen_Id  : Specifies the screen Id.
    --
    --  Documentation
    --
    --    Please refer to EventMaskOfScreen in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Event_Mask_Of_Screen (Screen_Id : in Screen)
				  return Events.Event_Mask_Type;

    function X_Event_Mask_Of_Screen
		(Screen_Id : in Screen) return Events.Event_Mask_Type
       renames Event_Mask_Of_Screen;

    --========================================================================
    --  Subprogram Name
    --
    --    Min_Keycode
    --
    --  Description
    --
    --    This function is used to return the minimum keycode supported by the
    --  specified display.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to MinKeycode in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Min_Keycode (Display_Id : in Display) return Keyboard.Key_Code;

    --========================================================================
    --  Subprogram Name
    --
    --    Max_Keycode
    --
    --  Description
    --
    --    This function is used to return the Maximum keycode supported by the
    --  specified display.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to MaxKeycode in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function Max_Keycode (Display_Id : in Display) return Keyboard.Key_Code;

    --========================================================================
    --  Subprogram Name
    --
    --    Server_Defaults
    --
    --  Description
    --
    --    This function returns the value of the Defaults field of the display
    --  record.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    This subroutine has been added to the standard C language Xlib
    --  interface as a convenience routine.
    --
    --  Package:  X_Lib
    --========================================================================

    function X_String_To_Context (Str : in String) return X_Context;

    function Server_Defaults (Display_Id : Display) return String;

    function X_Max_Request_Size (Display_Id : Display) return X_Long_Integer;

    function X_Last_Known_Request_Processed (Dpy : in Display) return X_Id;

    function X_Connection_Number (Dpy : Display) return Int;

    function X_All_Planes return X_Id;

    --  pragma INLINE (Bitmap_Bit_Order, Bitmap_Pad, Bitmap_Unit, Black_Pixel,
    --                 Connection_Number, Default_Colormap, Default_Root_Window,
    --                 Default_Depth, Default_GC, Default_Screen,
    --                 Default_Visual, Display_Cells, Display_Height_Mm,
    --                 Display_Height, X_Display_Name,
    --                 Display_Planes, Display_String, Display_Width_Mm,
    --                 Display_Width,
    --                 Image_Byte_Order, Protocol_Version, Protocol_Revision,
    --                 Q_Length, Root_Window, Screen_Count, Server_Vendor,
    --                 White_Pixel, Screen_Of_Display,
    --                 Default_Screen_Of_Display,
    --                 Display_Of_Screen, Root_Window_Of_Screen,
    --                 Black_Pixel_Of_Screen, White_Pixel_Of_Screen,
    --                 Default_Colormap_Of_Screen, Default_Depth_Of_Screen,
    --                 Default_Gc_Of_Screen, Default_Visual_Of_Screen,
    --                 Width_Of_Screen, Height_Of_Screen, Width_Mm_Of_Screen,
    --                 Height_Mm_Of_Screen, Planes_Of_Screen, Cells_Of_Screen,
    --                 Min_Cmaps_Of_Screen, Max_Cmaps_Of_Screen,
    --                 Does_Save_Unders,
    --                 Does_Backing_Store, Event_Mask_Of_Screen, Min_Keycode,
    --                 Max_Keycode, X_Defaults, Resource_Db);

    type Visual_Class_Type is private;
    Static_Gray : constant Visual_Class_Type;
    Gray_Scale : constant Visual_Class_Type;
    Static_Color : constant Visual_Class_Type;
    Pseudo_Color : constant Visual_Class_Type;
    True_Color : constant Visual_Class_Type;
    Direct_Color : constant Visual_Class_Type;
    function Create_Constant (Value : in X_Long_Integer)
			     return Visual_Class_Type;

    type Visual_Info_Record is
	record
	    Visual_Record : Visual;
	    Visual_Id : Visual_Id_Type;
	    Screen_No : Screen_Number;
	    Depth : Depth_Type;
	    Class : Visual_Class_Type;
	    Red_Mask : U_Pixel;
	    Green_Mask : U_Pixel;
	    Blue_Mask : U_Pixel;
	    Colormap_Size : Integer;
	    Bits_Per_Rgb : U_Pixel;
	end record;
    type Visual_Info_Array is array (Natural range <>) of Visual_Info_Record;
    type Visual_Info_List is access Visual_Info_Array;

    type Visual_Mask_Type is new X_Mask_Type;
    Visual_No_Mask : constant Visual_Mask_Type :=
       Create_Constant (16#00000000#);
    Visual_Id_Mask : constant Visual_Mask_Type :=
       Create_Constant (16#00000001#);
    Visual_Screen_Mask : constant Visual_Mask_Type :=
       Create_Constant (16#00000002#);
    Visual_Depth_Mask : constant Visual_Mask_Type :=
       Create_Constant (16#00000004#);
    Visual_Class_Mask : constant Visual_Mask_Type :=
       Create_Constant (16#00000008#);
    Visual_Red_Mask_Mask : constant Visual_Mask_Type :=
       Create_Constant (16#00000010#);
    Visual_Green_Mask_Mask : constant Visual_Mask_Type :=
       Create_Constant (16#00000020#);
    Visual_Blue_Mask_Mask : constant Visual_Mask_Type :=
       Create_Constant (16#00000040#);
    Visual_Colormap_Size_Mask : constant Visual_Mask_Type :=
       Create_Constant (16#00000080#);
    Visual_Bits_Per_Rgb_Mask : constant Visual_Mask_Type :=
       Create_Constant (16#00000100#);
    Visual_All_Mask : constant Visual_Mask_Type :=
       Create_Constant (16#000001FF#);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Visual_Info
    --
    --  Description
    --
    --    This function obtains a list of visual information records matching
    --  the Info_Template.
    --
    --  Parameters
    --
    --  Display_Id    : Specifies the connection to the X Server.
    --  Info_Mask     : Specifies which components of the Info_Template are to
    --                  be matched.
    --  Info_Template : Species the template to match.
    --
    --  Documentation
    --
    --    Please refer to XGetVisualInfo in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function X_Get_Visual_Info
		(Display_Id : in Display;
		 Info_Mask : in Visual_Mask_Type;
		 Info_Template : in Visual_Info_Record) return Visual_Info_List;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Visual_Id_From_Visual
    --
    --  Description
    --
    --    This function returns the visual ID for the specified visualtype
    --
    --  Parameters
    --
    --  Display_Id    : Specifies the connection to the X Server.
    --
    --  Documentation
    --
    --    Please refer to XVisualIdFromVisual in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function X_Visual_Id_From_Visual
		(Visual_Id : in Visual) return Visual_Id_Type;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Match_Visual_Info
    --
    --  Description
    --
    --    This procedure returns a visual information record  matching the
    --  specified depth and class of the screen.
    --
    --  Parameters
    --
    --  Display_Id      : Specifies the connection to the X Server.
    --  Screen_No       : Specifies the screen.
    --  Depth_Of_Screen : Specifies the Depth to match.
    --  Class_Of_Screen : Specifies the Class to match.
    --  Visual_Info     : Returns the matching Visual information record.
    --  Success         : True is a visual is found.
    --
    --  Documentation
    --
    --    Please refer to XMatchVisualInfo in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Match_Visual_Info (Display_Id : in Display;
				   Screen_No : in Screen_Number;
				   Depth_Of_Screen : in Depth_Type;
				   Class_Of_Screen : in Visual_Class_Type;
				   Visual_Info : out Visual_Info_Record;
				   Success : out Boolean);

    type Window_Array is array (Natural range <>) of Window;
    type Window_List is access Window_Array;
    Null_Window_Array : Window_Array (1 .. 0);

    type Window_Class is private;
    Copy_Class_From_Parent : constant Window_Class;
    Input_Output : constant Window_Class;
    Input_Only : constant Window_Class;
    function Create_Constant (Value : in X_Long_Integer) return Window_Class;

    type Direction_Type is private;
    Raise_Lowest : constant Direction_Type;
    Lower_Highest : constant Direction_Type;
    function Create_Constant (Value : in X_Long_Integer) return Direction_Type;

    type Property_Mode is private;
    Replace : constant Property_Mode;
    Prepend : constant Property_Mode;
    Append : constant Property_Mode;
    function Create_Constant (Value : in X_Long_Integer) return Property_Mode;

    type Set_Mode is private;
    Insert : constant Set_Mode;
    Delete : constant Set_Mode;
    function Create_Constant (Value : in X_Long_Integer) return Set_Mode;

    type Gravity_Type is private;
    Forget_Gravity : constant Gravity_Type;
    Northwest_Gravity : constant Gravity_Type;
    North_Gravity : constant Gravity_Type;
    Northeast_Gravity : constant Gravity_Type;
    West_Gravity : constant Gravity_Type;
    Center_Gravity : constant Gravity_Type;
    East_Gravity : constant Gravity_Type;
    Southwest_Gravity : constant Gravity_Type;
    South_Gravity : constant Gravity_Type;
    Southeast_Gravity : constant Gravity_Type;
    Static_Gravity : constant Gravity_Type;
    Unmap_Gravity : constant Gravity_Type;

    function Create_Constant (Value : in X_Long_Integer) return Gravity_Type;

    type Map_State_Type is private;
    Is_Unmapped : constant Map_State_Type;
    Is_Unviewable : constant Map_State_Type;
    Is_Viewable : constant Map_State_Type;
    function Create_Constant (Value : in X_Long_Integer) return Map_State_Type;

    type Geometry_Mask_Type is new X_Mask_Type;
    No_Value : constant Geometry_Mask_Type := Create_Constant (16#00000000#);
    X_Value : constant Geometry_Mask_Type := Create_Constant (16#00000001#);
    Y_Value : constant Geometry_Mask_Type := Create_Constant (16#00000002#);
    Width_Value : constant Geometry_Mask_Type := Create_Constant (16#00000004#);
    Height_Value : constant Geometry_Mask_Type :=
       Create_Constant (16#00000008#);
    All_Values : constant Geometry_Mask_Type := Create_Constant (16#0000000F#);
    X_Negative : constant Geometry_Mask_Type := Create_Constant (16#00000010#);
    Y_Negative : constant Geometry_Mask_Type := Create_Constant (16#00000020#);

    type Set_Window_Attributes_Record is
	record
	    Background_Pixmap : Pixmap;
	    Background_Pixel : U_Pixel := 0;
	    Border_Pixmap : Pixmap;
	    Border_Pixel : U_Pixel := 1;
	    Bit_Gravity : Gravity_Type := Forget_Gravity;
	    Window_Gravity : Gravity_Type := Northwest_Gravity;
	    Backing_Store : Backing_Store_Type := Not_Useful;
	    Backing_Planes : Plane_Mask := All_Planes;
	    Backing_Pixel : U_Pixel := 0;
	    Save_Under : Boolean := False;
	    Event_Mask : Events.Event_Mask_Type := Events.No_Event_Mask;
	    Do_Not_Propagate : Events.Event_Mask_Type := Events.No_Event_Mask;
	    Override_Redirect : Boolean := False;
	    Current_Color_Map : Colors.Color_Map;
	    Current_Cursor : Cursors.Cursor;
	end record;

    type Window_Attributes_Record is
	record
	    X : Coordinate;
	    Y : Coordinate;
	    Width : Coordinate;
	    Height : Coordinate;
	    Border_Width : Coordinate;
	    Depth : Depth_Type;
	    Visuals : Visual;
	    Root : Window;
	    Class : Window_Class;
	    Bit_Gravity : Gravity_Type;
	    Window_Gravity : Gravity_Type;
	    Backing_Store : Backing_Store_Type;
	    Backing_Planes : Plane_Mask;
	    Backing_Pixel : U_Pixel;
	    Save_Under : Boolean;
	    Colormap : Colors.Color_Map;
	    Map_Installed : Boolean;
	    Map_State : Map_State_Type;
	    All_Event_Masks : Events.Event_Mask_Type;
	    Your_Event_Mask : Events.Event_Mask_Type;
	    Do_Not_Propagate : Events.Event_Mask_Type;
	    Override_Redirect : Boolean;
	    Screen_Id : Screen;
	end record;

    type Wa_Mask_Type is new X_Mask_Type;
    Wa_Null_Mask : constant Wa_Mask_Type := Create_Constant (16#00000000#);
    Wa_Background_Pixmap : constant Wa_Mask_Type :=
       Create_Constant (16#00000001#);
    Wa_Background_Pixel : constant Wa_Mask_Type :=
       Create_Constant (16#00000002#);
    Wa_Border_Pixmap : constant Wa_Mask_Type := Create_Constant (16#00000004#);
    Wa_Border_Pixel : constant Wa_Mask_Type := Create_Constant (16#00000008#);
    Wa_Bit_Gravity : constant Wa_Mask_Type := Create_Constant (16#00000010#);
    Wa_Win_Gravity : constant Wa_Mask_Type := Create_Constant (16#00000020#);
    Wa_Backing_Store : constant Wa_Mask_Type := Create_Constant (16#00000040#);
    Wa_Backing_Plane : constant Wa_Mask_Type := Create_Constant (16#00000080#);
    Wa_Backing_Pixel : constant Wa_Mask_Type := Create_Constant (16#00000100#);
    Wa_Override_Redirect : constant Wa_Mask_Type :=
       Create_Constant (16#00000200#);
    Wa_Save_Under : constant Wa_Mask_Type := Create_Constant (16#00000400#);
    Wa_Event_Mask : constant Wa_Mask_Type := Create_Constant (16#00000800#);
    Wa_Dont_Propagate : constant Wa_Mask_Type := Create_Constant (16#00001000#);
    Wa_Colormap : constant Wa_Mask_Type := Create_Constant (16#00002000#);
    Wa_Cursor : constant Wa_Mask_Type := Create_Constant (16#00004000#);

    type Cw_Mask_Type is new X_Mask_Type;
    Cw_Null_Mask : constant Cw_Mask_Type := Create_Constant (16#00000000#);

    -- Window attributes for CreateWindow and ChangeWindowAttributes
    Cwbackpixmap : constant Cw_Mask_Type := Create_Constant (16#00000001#);
    Cwbackpixel : constant Cw_Mask_Type := Create_Constant (16#00000002#);
    Cwborderpixmap : constant Cw_Mask_Type := Create_Constant (16#00000004#);
    Cwborderpixel : constant Cw_Mask_Type := Create_Constant (16#00000008#);
    Cwbitgravity : constant Cw_Mask_Type := Create_Constant (16#00000010#);
    Cwwingravity : constant Cw_Mask_Type := Create_Constant (16#00000020#);
    Cwbackingstore : constant Cw_Mask_Type := Create_Constant (16#00000040#);
    Cwbackingplanes : constant Cw_Mask_Type := Create_Constant (16#00000080#);
    Cwbackingpixel : constant Cw_Mask_Type := Create_Constant (16#00000100#);
    Cwoverrideredirect : constant Cw_Mask_Type :=
       Create_Constant (16#00000200#);
    Cwsaveunder : constant Cw_Mask_Type := Create_Constant (16#00000400#);
    Cweventmask : constant Cw_Mask_Type := Create_Constant (16#00000800#);
    Cwdontpropagate : constant Cw_Mask_Type := Create_Constant (16#00001000#);
    Cwcolormap : constant Cw_Mask_Type := Create_Constant (16#00002000#);
    Cwcursor : constant Cw_Mask_Type := Create_Constant (16#00004000#);

    -- ConfigureWindow structure
    Cw_X : constant Cw_Mask_Type := Create_Constant (16#00000001#);
    Cw_Y : constant Cw_Mask_Type := Create_Constant (16#00000002#);
    Cw_Width : constant Cw_Mask_Type := Create_Constant (16#00000004#);
    Cw_Height : constant Cw_Mask_Type := Create_Constant (16#00000008#);
    Cw_Border_Width : constant Cw_Mask_Type := Create_Constant (16#00000010#);
    Cw_Sibling : constant Cw_Mask_Type := Create_Constant (16#00000020#);
    Cw_Stack_Mode : constant Cw_Mask_Type := Create_Constant (16#00000040#);

    type Window_Changes_Record is
	record
	    X, Y : Coordinate;
	    Width, Height : Pixel;
	    Border_Width : Pixel;
	    Sibling : Window;
	    Stack_Mode : Stack_Mode_Type;
	end record;

    type Size_Hint_Mask_Type is new X_Mask_Type;
    User_Specified_Position : constant Size_Hint_Mask_Type :=
       Create_Constant (16#00000001#);
    User_Specified_Size : constant Size_Hint_Mask_Type :=
       Create_Constant (16#00000002#);
    Program_Specified_Position : constant Size_Hint_Mask_Type :=
       Create_Constant (16#00000004#);
    Program_Specified_Size : constant Size_Hint_Mask_Type :=
       Create_Constant (16#00000008#);
    Program_Specified_Min_Size : constant Size_Hint_Mask_Type :=
       Create_Constant (16#00000010#);
    Program_Specified_Max_Size : constant Size_Hint_Mask_Type :=
       Create_Constant (16#00000020#);
    Program_Specified_Resize_Inc : constant Size_Hint_Mask_Type :=
       Create_Constant (16#00000040#);
    Program_Specified_Aspect : constant Size_Hint_Mask_Type :=
       Create_Constant (16#00000080#);
    Program_Base_Size : constant Size_Hint_Mask_Type :=
       Create_Constant (16#00000100#);
    Program_Window_Gravity : constant Size_Hint_Mask_Type :=
       Create_Constant (16#00000200#);
    Program_Specified_All_Hints : constant Size_Hint_Mask_Type :=
       (Program_Specified_Position or Program_Specified_Size or
	Program_Specified_Min_Size or Program_Specified_Max_Size or
	Program_Specified_Resize_Inc or Program_Specified_Aspect);

    -- flags argument in size hints
    -- user specified x, y
    Us_Position : constant := 2 ** 0;

    -- user specified width, height
    Us_Size : constant := 2 ** 1;

    -- program specified position
    P_Position : constant := 2 ** 2;

    -- program specified size
    P_Size : constant := 2 ** 3;

    -- program specified minimum size
    P_Min_Size : constant := 2 ** 4;

    -- program specified maximum size
    P_Max_Size : constant := 2 ** 5;

    -- program specified resize increments
    P_Resize_Inc : constant := 2 ** 6;

    -- program specified min and max aspect ratios
    P_Aspect : constant := 2 ** 7;

    -- program specified base for incrementing
    P_Base_Size : constant := 2 ** 8;

    -- program specified window gravity
    P_Win_Gravity : constant := 2 ** 9;

    -- obsolete
    P_All_Hints : constant := P_Position + P_Size + P_Min_Size +
				 P_Max_Size + P_Resize_Inc + P_Aspect;

    X_No_Memory : constant := -1;
    X_Locale_Not_Supported : constant := -2;
    X_Converter_Not_Found : constant := -3;

    type X_Icc_Encoding_Style is
       (Xstringstyle,            -- STRING
	Xcompoundtextstyle,      -- COMPOUND_TEXT
	Xtextstyle,              -- text in owner's encoding (current locale)
	Xstdicctextstyle);       -- STRING, else COMPOUND_TEXT
    for X_Icc_Encoding_Style'Size use Int'Size;

    type Size_Hint_Record is
	record
	    Flags : Size_Hint_Mask_Type;
	    X : Coordinate;
	    Y : Coordinate;
	    Width : Pixel;
	    Height : Pixel;
	    Min_Width : Pixel;
	    Min_Height : Pixel;
	    Max_Width : Pixel;
	    Max_Height : Pixel;
	    Width_Inc : Pixel;
	    Height_Inc : Pixel;
	    Min_Aspect : Point;
	    Max_Aspect : Point;
	    Base_Width : Pixel;             -- added by ICCCM version 1
	    Base_Height : Pixel;             -- added by ICCCM version 1
	    Win_Gravity : Gravity_Type;             -- added by ICCCM version 1
	end record;

    type Size_Hint_Record_Ptr is access Size_Hint_Record;

    -- new for R4; X_String_List_To_Text_Property,
    --             X_Text_Property_To_String_List
    --             X_Set_Text_Property
    --             X_Get_Text_Property
    type Text_Property_Record is
	record
	    Value : String_Pointer;
	    Encoding : Atoms.Atom;
	    Format : Property_Format_Type;
	    N_Items : X_Integer;             -- number of data items in value
	end record;

    for Text_Property_Record use
	record
	    Value at 0 * Word_Size range 0 .. 31;
	    Encoding at 1 * Word_Size range 0 .. 31;
	    Format at 2 * Word_Size range 0 .. 31;
	    N_Items at 3 * Word_Size range 0 .. 31;
	end record;

    function Xmb_Text_Escapement
		(Font_Set : in X_Font_Set; Text : in String) return Int;

    function Xwc_Text_Escapement
		(Font_Set : in X_Font_Set; Text : in Wide_Character_Array)
		return Int;

    procedure Xmb_Text_Extents (Font_Set : in X_Font_Set;
				Text : in String;
				Overall_Ink_Return : out Rectangle;
				Overall_Logical_Return : out Rectangle;
				Ret_Val : out Int);

    procedure Xwc_Text_Extents (Font_Set : in X_Font_Set;
				Text : in Wide_Character_Array;
				Overall_Ink_Return : out Rectangle;
				Overall_Logical_Return : out Rectangle;
				Ret_Val : out Int);

    procedure Xmb_Text_Per_Char_Extents
		 (Font_Set : in X_Font_Set;
		  Text : in String;
		  Ink_Extents_Buffer : in Rectangle_Array;
		  Logical_Extents_Buffer : in Rectangle_Array;
		  Num_Chars : out Int;
		  Overall_Ink_Return : out Rectangle;
		  Overall_Logical_Return : out Rectangle;
		  Ret_Val : out Int);

    procedure Xwc_Text_Per_Char_Extents
		 (Font_Set : in X_Font_Set;
		  Text : in Wide_Character_Array;
		  Ink_Extents_Buffer : in Rectangle_Array;
		  Logical_Extents_Buffer : in Rectangle_Array;
		  Num_Chars : out Int;
		  Overall_Ink_Return : out Rectangle;
		  Overall_Logical_Return : out Rectangle;
		  Ret_Val : out Int);

    procedure Xmb_Draw_Text (Dpy : in Display;
			     D : in Drawable;
			     Gc : in Graphic_Output.Graphic_Context;
			     X : in Coordinate;
			     Y : in Coordinate;
			     Text_Items : in Xmb_Text_Item_List);

    procedure Xwc_Draw_Text (Dpy : in Display;
			     D : in Drawable;
			     Gc : in Graphic_Output.Graphic_Context;
			     X : in Coordinate;
			     Y : in Coordinate;
			     Text_Items : in Xwc_Text_Item_List);

    procedure Xmb_Draw_String (Dpy : in Display;
			       D : in Drawable;
			       Font_Set : in X_Font_Set;
			       Gc : in Graphic_Output.Graphic_Context;
			       X : in Coordinate;
			       Y : in Coordinate;
			       Text : in String);

    procedure Xwc_Draw_String (Dpy : in Display;
			       D : in Drawable;
			       Font_Set : in X_Font_Set;
			       Gc : in Graphic_Output.Graphic_Context;
			       X : in Coordinate;
			       Y : in Coordinate;
			       Text : in Wide_Character_Array);

    procedure Xmb_Draw_Image_String (Dpy : in Display;
				     D : in Drawable;
				     Font_Set : in X_Font_Set;
				     Gc : in Graphic_Output.Graphic_Context;
				     X : in Coordinate;
				     Y : in Coordinate;
				     Text : in String);

    procedure Xwc_Draw_Image_String (Dpy : in Display;
				     D : in Drawable;
				     Font_Set : in X_Font_Set;
				     Gc : in Graphic_Output.Graphic_Context;
				     X : in Coordinate;
				     Y : in Coordinate;
				     Text : in Wide_Character_Array);

    -- new to R4
    procedure X_String_List_To_Text_Property
		 (Strings : in String_List;
		  Text_Prop : out Text_Property_Record;
		  Status : out Boolean);

    procedure Xmb_Text_List_To_Text_Property
		 (Dpy : in Display;
		  List : in String_List;
		  Style : in X_Icc_Encoding_Style;
		  Text_Prop_Return : out Text_Property_Record;
		  Ret_Val : out X_Integer);

    procedure Xwc_Text_List_To_Text_Property
		 (Dpy : in Display;
		  List : in Wide_Character_Array;
		  Style : in X_Icc_Encoding_Style;
		  Text_Prop_Return : out Text_Property_Record;
		  Ret_Val : out X_Integer);

    procedure Xwc_Free_String_List (List : in Wide_Character_Array);

    procedure Xmb_Text_Property_To_Text_List
		 (Dpy : in Display;
		  Text_Prop : in Text_Property_Record;
		  List_Rtn : out String_List;
		  Ret_Val : out X_Integer);

    procedure Xwc_Text_Property_To_Text_List
		 (Dpy : in Display;
		  Text_Prop : in Text_Property_Record;
		  List_Rtn : out Wide_Character_List;
		  Ret_Val : out X_Integer);

    function X_Open_Im (Dpy : in Display;
			Rdb : in X_Address;
			Res_Name : in String;
			Res_Class : in String) return X_Im;

    function X_Close_Im (Im : in X_Im) return Int;

    function X_Display_Of_Im (Im : in X_Im) return Display;

    function X_Locale_Of_Im (Im : in X_Im) return String;

    procedure X_Destroy_Ic (Ic : in X_Ic);

    procedure X_Set_Ic_Focus (Ic : in X_Ic);

    procedure X_Unset_Ic_Focus (Ic : in X_Ic);

    function Xwc_Reset_Ic (Ic : in X_Ic) return Wide_Character_Pointer;

    function Xmb_Reset_Ic (Ic : in X_Ic) return String;

    function X_Im_Of_Ic (Ic : in X_Ic) return X_Im;

    -- new to R4
    procedure X_Text_Property_To_String_List
		 (Text_Prop : in Text_Property_Record;
		  Strings : out String_List;
		  Status : out Boolean);

    -- new to R4
    procedure X_Free_String_List (Strings : in out String_List);

    procedure X_Free (Addr : in X_Address);

    -- new to R4
    procedure X_Set_Text_Property (Display_Id : in Display;
				   Window_Id : in Window;
				   Text_Prop : in Text_Property_Record;
				   Property : in Atoms.Atom);

    -- new to R4
    procedure X_Get_Text_Property (Display_Id : in Display;
				   Window_Id : in Window;
				   Text_Prop : out Text_Property_Record;
				   Property : in Atoms.Atom;
				   Status : out Boolean);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Standard_Properties
    --
    --  Description
    --
    --    This procedure specifies a minimum set of properties describing the
    --  "quickie" application.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --  W_Name     : Specifies the name of the window.
    --  Icon_Name  : Specifies the name of the icon.
    --  Icon       : Specifies the icon to be used.
    --  Command    : Specifies the command and arguments used
    --               to start the application
    --  Hints      : Specifies the sizing hints for the window.
    --
    --  Documentation
    --
    --    Please refer to XSetStandardProperties in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Standard_Properties (Display_Id : in Display;
					 Window_Id : in Window;
					 W_Name : in String;
					 Icon_Name : in String;
					 Icon : in Pixmap;
					 Command : in String_List;
					 Hints : in Size_Hint_Record);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Store_Name
    --
    --  Description
    --
    --    This procedure assigns a name to a window.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --  Name       : Specifies the name of the window.
    --
    --  Documentation
    --
    --    Please refer to XStoreName[-1z in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Store_Name (Display_Id : in Display;
			    Window_Id : in Window;
			    Name : in String);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Fetch_Name
    --
    --  Description
    --
    --    This procedure gets the name of a window.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --
    --  Documentation
    --
    --    Please refer to XFetchName in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Fetch_Name (Display_Id : in Display;
			    Window_Id : in Window;
			    Name : in out String_Pointer;
			    Status : out Boolean);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Icon_Name
    --
    --  Description
    --
    --    This procedure Sets the name to be displayed in a window's icon.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --  Name       : Specifies the name of the window.
    --
    --  Documentation
    --
    --    Please refer to XSetIconName in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Icon_Name (Display_Id : in Display;
			       Window_Id : in Window;
			       Name : in String);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Icon_Name
    --
    --  Description
    --
    --    This procedure gets the name a window wants displayed in its icon.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --
    --
    --  Documentation
    --
    --    Please refer to XGetIconName in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Get_Icon_Name (Display_Id : in Display;
			       Window_Id : in Window;
			       Icon_Name : in out String_Pointer;
			       Status : out Boolean);

    -- new for R4
    procedure X_Set_Wm_Name (Display_Id : in Display;
			     Window_Id : in Window;
			     Text_Prop : in Text_Property_Record);

    -- new for R4
    procedure X_Get_Wm_Name (Display_Id : in Display;
			     Window_Id : in Window;
			     Text_Prop : out Text_Property_Record;
			     Status : out Boolean);

    -- new for R4
    procedure X_Set_Wm_Icon_Name (Display_Id : in Display;
				  Window_Id : in Window;
				  Text_Prop : in Text_Property_Record);

    -- new for R4
    procedure X_Get_Wm_Icon_Name (Display_Id : in Display;
				  Window_Id : in Window;
				  Text_Prop : out Text_Property_Record;
				  Status : out Boolean);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Command
    --
    --  Description
    --
    --    This procedure sets the value of the command atom.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --  Command    : Specifies the command and arguments used
    --               to start the application
    --
    --  Documentation
    --
    --    Please refer to XSetCommand in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Command (Display_Id : in Display;
			     Window_Id : in Window;
			     Command : in String_List);

    -- new to R4
    procedure X_Get_Command (Display_Id : in Display;
			     Window_Id : in Window;
			     Command : in out String_List;
			     Status : out Boolean);

    type Initial_State_Type is private;
    Dont_Care_State : constant Initial_State_Type;
    Withdrawn_State : constant Initial_State_Type;
    Normal_State : constant Initial_State_Type;
    Zoom_State : constant Initial_State_Type;
    Iconic_State : constant Initial_State_Type;
    Inactive_State : constant Initial_State_Type;
    function Create_Constant (Value : in X_Long_Integer)
			     return Initial_State_Type;

    type Wm_Hint_Mask_Type is new X_Mask_Type;
    Input_Hint : constant Wm_Hint_Mask_Type := Create_Constant (2 ** 0);
    State_Hint : constant Wm_Hint_Mask_Type := Create_Constant (2 ** 1);
    Icon_Pixmap_Hint : constant Wm_Hint_Mask_Type := Create_Constant (2 ** 2);
    Icon_Window_Hint : constant Wm_Hint_Mask_Type := Create_Constant (2 ** 3);
    Icon_Position_Hint : constant Wm_Hint_Mask_Type := Create_Constant (2 ** 4);
    Icon_Mask_Hint : constant Wm_Hint_Mask_Type := Create_Constant (2 ** 5);
    Window_Group_Hint : constant Wm_Hint_Mask_Type := Create_Constant (2 ** 6);
    All_Hints : constant Wm_Hint_Mask_Type :=
       (Input_Hint or State_Hint or Icon_Pixmap_Hint or Icon_Window_Hint or
	Icon_Position_Hint or Icon_Mask_Hint or Window_Group_Hint);

    type Wm_Hint_Record is
	record
	    Flags : Wm_Hint_Mask_Type;
	    Input : Boolean;
	    Initial_State : Initial_State_Type;
	    Icon_Pixmap : Pixmap;
	    Icon_Window : Window;
	    Icon_X : Coordinate;
	    Icon_Y : Coordinate;
	    Icon_Mask : Pixmap;
	    Window_Group : X_Id;
	end record;

    type Wm_Hints_Ptr is access Wm_Hint_Record;

    type Wm_Class_Hint_Record is
	record
	    Res_Name : String_Pointer;
	    Res_Class : String_Pointer;
	end record;

    type Wm_Class_Hint_Record_Ptr is access Wm_Class_Hint_Record;

    type Icon_Size_Record is
	record
	    Min_Width : Pixel;
	    Min_Height : Pixel;
	    Max_Width : Pixel;
	    Max_Height : Pixel;
	    Width_Inc : Pixel;
	    Height_Inc : Pixel;
	end record;
    type Icon_Size_Array is array (Natural range <>) of Icon_Size_Record;
    type Icon_Size_List is access Icon_Size_Array;
    Null_Icon_Size_Array : Icon_Size_Array (1 .. 0);

    type Icon_Size_Record_Ptr is access Icon_Size_Record;

    procedure Xmb_Set_Wm_Properties (Dpy : in Display;
				     W : in Window;
				     Window_Name : in String;
				     Icon_Name : in String;
				     Argv : in String_List;
				     Normal_Hints : in Size_Hint_Record;
				     Wm_Hints : in Wm_Hint_Record;
				     Class_Hints : in Wm_Class_Hint_Record);

    -- new for R4
    function X_Alloc_Wm_Hints return Wm_Hint_Record;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Wm_Hints
    --
    --  Description
    --
    --    This procedure sets the window manager hints property.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --  Hints      : Specifies the hints for the window.
    --
    --  Documentation
    --
    --    Please refer to XSetWmHints in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Wm_Hints (Display_Id : in Display;
			      Window_Id : in Window;
			      Hints : in Wm_Hint_Record);

    procedure X_Set_Wm_Size_Hints (Display_Id : in Display;
				   Window_Id : in Window;
				   Hints : in Size_Hint_Record;
				   Property : in Atoms.Atom);
    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Wm_Hints
    --
    --  Description
    --
    --    This function gets the window manager hints property.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --
    --  Documentation
    --
    --    Please refer to XGetWmHints in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function X_Get_Wm_Hints (Display_Id : in Display; Window_Id : in Window)
			    return Wm_Hint_Record;

    procedure X_Get_Wm_Size_Hints (Display_Id : in Display;
				   Window_Id : in Window;
				   Hints : in out Size_Hint_Record;
				   Supplied : in out X_Long_Integer;
				   Property : in Atoms.Atom;
				   Hints_Found : out Boolean);
    -- new for R4
    function X_Alloc_Size_Hints return Size_Hint_Record;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Normal_Hints
    --
    --  Description
    --
    --    This procedure sets the size hints for a window in its normal state.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --  Hints      : Specifies the hints for the window.
    --
    --  Documentation
    --
    --    Please refer to XSetNormalHints in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Normal_Hints (Display_Id : in Display;
				  Window_Id : in Window;
				  Hints : in Size_Hint_Record);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Normal_Hints
    --
    --  Description
    --
    --    This procedure gets the size hints for a window in its normal state.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --  Hints      : Returns the hints for the window (if found).
    --
    --  Documentation
    --
    --    Please refer to XGetNormalHints in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Get_Normal_Hints (Display_Id : in Display;
				  Window_Id : in Window;
				  Hints : in out Size_Hint_Record;
				  Hints_Found : out Boolean);

    -- new for R4
    procedure X_Set_Wm_Normal_Hints (Display_Id : in Display;
				     Window_Id : in Window;
				     Hints : in Size_Hint_Record);

    -- new for R4
    procedure X_Get_Wm_Normal_Hints (Display_Id : in Display;
				     Window_Id : in Window;
				     Hints : in out Size_Hint_Record;
				     Supplied_Mask : in out Size_Hint_Mask_Type;
				     Status : out Boolean);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Zoom_Hints
    --
    --  Description
    --
    --    This procedure sets the zoom hints for a window.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --  Hints      : Specifies the hints for the window.
    --
    --  Documentation
    --
    --    Please refer to XSetZoomHints in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Zoom_Hints (Display_Id : in Display;
				Window_Id : in Window;
				Hints : in Size_Hint_Record);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Zoom_Hints
    --
    --  Description
    --
    --    This procedure gets the zoom hints for a window.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --  Hints      : Returns the hints for the window (if found).
    --
    --  Documentation
    --
    --    Please refer to XGetZoomHints in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Get_Zoom_Hints (Display_Id : in Display;
				Window_Id : in Window;
				Hints : in out Size_Hint_Record;
				Hints_Found : out Boolean);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Size_Hints
    --
    --  Description
    --
    --    This procedure sets the value of any size hint property.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --  Hints      : Specifies the hints for the window.
    --  Property   : Specifies which property to set.
    --
    --  Documentation
    --
    --    Please refer to XSetSizeHints in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Size_Hints (Display_Id : in Display;
				Window_Id : in Window;
				Hints : in Size_Hint_Record;
				Property : in Atoms.Atom);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Size_Hints
    --
    --  Description
    --
    --    This procedure gets the value of any size hint property.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --  Property   : Specifies which property to get.
    --  Hints      : Returns the hints for the window.
    --
    --  Documentation
    --
    --    Please refer to XGetSizeHints in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Get_Size_Hints (Display_Id : in Display;
				Window_Id : in Window;
				Property : in Atoms.Atom;
				Hints : in out Size_Hint_Record;
				Hints_Found : out Boolean);

    -- XGetErrorDatabaseText
    procedure X_Get_Error_Database_Text (Display_Id : in Display;
					 Name : in String;
					 Message : in String;
					 Default_String : in String;
					 Buffer : in out String_Pointer);

    -- XGetErrorText
    procedure X_Get_Error_Text (Display_Id : in Display;
				Code : in X_Integer;
				Buffer : in out String_Pointer);

    procedure X_Query_Extension (Display_Id : in Display;
				 Name : in String;
				 Major_Opcode : out X_Long_Integer;
				 First_Event : out X_Long_Integer;
				 First_Error : out X_Long_Integer;
				 Notify : out Boolean);

    -- xlistextensions
    procedure X_List_Extensions (Display_Id : in Display;
				 Extensions : out String_List);

    procedure X_Free_Extension_List (List : in out String_List);

    -- new for R4
    function X_Alloc_Icon_Size return Icon_Size_Record;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Icon_Sizes
    --
    --  Description
    --
    --    This procedure sets the value of the icon size atom.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --  Size_List  : Specifies the icon sizes.
    --
    --  Documentation
    --
    --    Please refer to XSetIconSizes in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Icon_Sizes (Display_Id : in Display;
				Window_Id : in Window;
				Size_List : in Icon_Size_List);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Icon_Sizes
    --
    --  Description
    --
    --    This function gets the value of the icon size atom.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the X Server connection.
    --  Window_Id  : Specifies the Window.
    --
    --  Documentation
    --
    --    Please refer to XGetIconSizes in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Get_Icon_Sizes (Display_Id : in Display;
				Window_Id : in Window;
				Size_List : in out Icon_Size_List;
				Status : in out Boolean);

    -- new for R4
    function X_Alloc_Class_Hint return Wm_Class_Hint_Record;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Class_Hint
    --
    --  Description
    --
    --    This procedure sets the class of a window.
    --
    --  Parameters
    --
    --  Display_Id  : Specifies the X Server connection.
    --  Window_Id   : Specifies the Window.
    --  Class_Hints : Specifies the class hints for the window.
    --
    --  Documentation
    --
    --    Please refer to XSetClassHint in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Class_Hint (Display_Id : in Display;
				Window_Id : in Window;
				Class_Hints : in Wm_Class_Hint_Record);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Class_Hint
    --
    --  Description
    --
    --    This procedure gets the class of a window.
    --
    --  Parameters
    --
    --  Display_Id         : Specifies the X Server connection.
    --  Window_Id          : Specifies the Window.
    --  Class_Hints_Return : Returns the class hints for the window.
    --
    --  Documentation
    --
    --    Please refer to XGetClassHint in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Get_Class_Hint
		 (Display_Id : in Display;
		  Window_Id : in Window;
		  Class_Hints_Return : in out Wm_Class_Hint_Record;
		  Success : out Boolean);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Transient_For_Hint
    --
    --  Description
    --
    --    This procedure sets the transient hint for a window.
    --
    --  Parameters
    --
    --  Display_Id  : Specifies the X Server connection.
    --  Window_Id   : Specifies the Window.
    --  Prop_Window : Specifies the window id that transient hint is to be
    --                set in.
    --
    --  Documentation
    --
    --    Please refer to XSetTransientForHint in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Transient_For_Hint (Display_Id : in Display;
					Window_Id : in Window;
					Prop_Window : in Window);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Transient_For_Hint
    --
    --  Description
    --
    --    This procedure gets the transient hint for a window.
    --
    --  Parameters
    --
    --  Display_Id         : Specifies the X Server connection.
    --  Window_Id          : Specifies the Window.
    --  Prop_Window_Return : Returns the window id that transient hint is
    --                       set in.
    --
    --  Documentation
    --
    --    Please refer to XGetTransientForHint in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Get_Transient_For_Hint (Display_Id : in Display;
					Window_Id : in Window;
					Prop_Window_Return : in out Window;
					Success : out Boolean);

    -- new for R4
    function X_Set_Wm_Protocols (Display_Id : in Display;
				 Window_Id : in Window;
				 Protocols : in Atoms.Atom_List) return Boolean;

    -- new for R4
    procedure X_Get_Wm_Protocols (Display_Id : in Display;
				  Window_Id : in Window;
				  Protocols : in out Atoms.Atom_List;
				  Status : out Boolean);

    -- new for R4
    function X_Set_Wm_Colormap_Windows
		(Display_Id : in Display;
		 Window_Id : in Window;
		 Colormap_Windows : in Window_List) return Boolean;

    -- new for R4
    procedure X_Get_Wm_Colormap_Windows (Display_Id : in Display;
					 Window_Id : in Window;
					 Colormap_Windows : in out Window_List;
					 Status : out Boolean);

    -- new for R4
    procedure X_Set_Wm_Client_Machine (Display_Id : in Display;
				       Window_Id : in Window;
				       Text_Prop : in Text_Property_Record);

    -- new for R4
    procedure X_Get_Wm_Client_Machine (Display_Id : in Display;
				       Window_Id : in Window;
				       Text_Prop : out Text_Property_Record;
				       Status : out Boolean);

    -- new for R4
    procedure X_Set_Wm_Properties (Display_Id : in Display;
				   Window_Id : in Window;
				   Window_Name : in Text_Property_Record;
				   Icon_Name : in Text_Property_Record;
				   Argv : in String_List;
				   Size_Hints : in Size_Hint_Record;
				   Wm_Hints : in Wm_Hint_Record;
				   Class_Hints : in Wm_Class_Hint_Record);

    -- new for R4
    procedure X_Wm_Geometry (Display_Id : in Display;
			     Screen_No : in Screen_Number;
			     User_Geometry : in String;
			     Default_Geometry : in String;
			     Border_Width : in Width_Height;
			     Size_Hints : in Size_Hint_Record;
			     X : out Pixel;
			     Y : out Pixel;
			     Width : out Width_Height;
			     Height : out Width_Height;
			     Gravity : out Gravity_Type;
			     Return_Mask : out X_Integer);

    --======================================================================
    --  Subprogram Name
    --
    --    X_Create_Pixmap
    --
    --  Description
    --
    --    This function creates a pixmap of the width, height and depth
    --  specified, and returns its ID.
    --
    --  Parameters
    --
    --  Display_Id  : Specifies the connection to the X Server.
    --  Drawable_Id : Specifies which screen the pixmap is created on.
    --  Width       : Specifies the width.
    --  Height      : Specifies the Height.
    --  Depth       : Specifies the depth.
    --
    --  Documentation
    --
    --    Please refer to XCreatePixmap in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --======================================================================

    function X_Create_Pixmap (Display_Id : in Display;
			      Drawable_Id : in Drawable;
			      Width : in Width_Height;
			      Height : in Width_Height;
			      Depth : in Depth_Type) return Pixmap;

    --======================================================================
    --  Subprogram Name
    --
    --    X_Free_Pixmap
    --
    --  Description
    --
    --    This procedure frees a previously created pixmap.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Pixmap_Id  : Specifies the pixmap to be freed.
    --
    --  Documentation
    --
    --    Please refer to XFreePixmap in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --======================================================================

    procedure X_Free_Pixmap (Display_Id : in Display;
			     Pixmap_Id : in out Pixmap);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Create_Window
    --
    --  Description
    --
    --   This function creates an unmapped subwindow for a specified parent
    -- window.
    --
    --  Parameters
    --
    --  Display_Id   : Specifies the connection to the X Server.
    --  Parent       : Specifies the parent window Id.
    --  Bounds       : Specifies the window dimensions.
    --  Border_Width : Specifies the border width.
    --  Depth        : Specifies the depth.
    --  Class        : Specifies the window's class.
    --  Visuals      : Specifies the visual type.
    --  Value_Mask   : Specifies which window attributes are to be set.
    --  Attributes   : Specifies the values of the window attributes.
    --
    --  Documentation
    --
    --    Please refer to XCreateWindow in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function X_Create_Window
		(Display_Id : in Display;
		 Parent : in Window;
		 X : in Coordinate;
		 Y : in Coordinate;
		 Width : in Width_Height;
		 Height : in Width_Height;
		 Border_Width : in Width_Height;
		 Depth : in Depth_Type;
		 Class : in Window_Class;
		 Visuals : in Visual;
		 Value_Mask : in Cw_Mask_Type;
		 Attributes : in Set_Window_Attributes_Record) return Window;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Create_Simple_Window
    --
    --  Description
    --
    --    This function creates an unmapped Input_Output subwindow for a
    --  specified parent window.
    --
    --  Parameters
    --
    --  Display_Id   : Specifies the connection to the X Server.
    --  Parent       : Specifies the parent window Id.
    --  Bounds       : Specifies the window dimensions.
    --  Border_Width : Specifies the border width.
    --  Border       : Specifies the border pixel value (color).
    --  Background   : Specifies the background pixel value.
    --
    --
    --  Documentation
    --
    --    Please refer to XCreateSimpleWindow in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function X_Create_Simple_Window (Display_Id : in Display;
				     Parent : in Window;
				     X : in Coordinate;
				     Y : in Coordinate;
				     Width : in Width_Height;
				     Height : in Width_Height;
				     Border_Width : in Width_Height;
				     Border : in U_Pixel;
				     Background : in U_Pixel) return Window;

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Destroy_Window
--    --
--    --  Description
--    --
--    --    This procedure destroys a window and all of its subwindows.
--    --
--    --  Parameters
--    --
--    --  Display_Id   : Specifies the connection to the X Server.
--    --  Window_Id    : Specifies the Window Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to XDestroyWindow in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_Destroy_Window (Display_Id : in Display; Window_Id : in Window);
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Destroy_Subwindows
--    --
--    --  Description
--    --
--    --    This procedure destroys all the subwindows of a specified window.
--    --
--    --  Parameters
--    --
--    --  Display_Id   : Specifies the connection to the X Server.
--    --  Window_Id    : Specifies the Window Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to XDestroySubwindows in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_Destroy_Subwindows
--		 (Display_Id : in Display; Window_Id : in Window);
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Map_Window
--    --
--    --  Description
--    --
--    --   This procedure maps a specified window on the display.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Window_Id  : Specifies the window Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to XMapWindow in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_Map_Window (Display_Id : in Display; Window_Id : in Window);
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Map_Raised
--    --
--    --  Description
--    --
--    --   This procedure maps and raises a specified window on the display.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Window_Id  : Specifies the window Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to XMapRaised in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_Map_Raised (Display_Id : in Display; Window_Id : in Window);
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Map_Subwindows
--    --
--    --  Description
--    --
--    --   This procedure maps the subwindows of a specified window on the
--    --  display.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Window_Id  : Specifies the window Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to XMapSubwindows in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_Map_Subwindows (Display_Id : in Display; Window_Id : in Window);
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Unmap_Window
--    --
--    --  Description
--    --
--    --   This procedure unmaps a specified window on the display.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Window_Id  : Specifies the window Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to XUnmapWindow in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_Unmap_Window (Display_Id : in Display; Window_Id : in Window);
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Unmap_Subwindows
--    --
--    --  Description
--    --
--    --   This procedure unmaps the subwindows of a specified window on the
--    --  display.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Window_Id  : Specifies the window Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to XUnmapSubwindows in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_Unmap_Subwindows
--		 (Display_Id : in Display; Window_Id : in Window);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Configure_Window
    --
    --  Description
    --
    --   This procedure reconfigures a window's size, position, border and
    -- stacking order.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Window_Id  : Specifies the window Id.
    --  Value_Mask : Specifies which values are to be changed.
    --  Changes    : Specifies the values to be changes.
    --
    --  Documentation
    --
    --    Please refer to XConfigureWindow in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Configure_Window (Display_Id : in Display;
				  Window_Id : in Window;
				  Value_Mask : in Cw_Mask_Type;
				  Changes : in Window_Changes_Record);

    -- new for R4
    function X_Reconfigure_Wm_Window
		(Display_Id : in Display;
		 Window_Id : in Window;
		 Screen_No : in Screen_Number;
		 Value_Mask : in Cw_Mask_Type;
		 Changes : in Window_Changes_Record) return Boolean;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Move_Window
    --
    --  Description
    --
    --   This procedure moves a window without changing its size.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Window_Id  : Specifies the window Id.
    --  Xy         : Specifies the new origin of the window.
    --
    --  Documentation
    --
    --    Please refer to XMoveWindow in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Move_Window (Display_Id : in Display;
			     Window_Id : in Window;
			     X : in Coordinate;
			     Y : in Coordinate);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Resize_Window
    --
    --  Description
    --
    --   This procedure resizes a window without changing its origin.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Window_Id  : Specifies the window Id.
    --  Width      : Specifies the new width.
    --  Height     : Specifies the new height.
    --
    --  Documentation
    --
    --    Please refer to XResizeWindow in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Resize_Window (Display_Id : in Display;
			       Window_Id : in Window;
			       Width : in Width_Height;
			       Height : in Width_Height);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Move_Resize_Window
    --
    --  Description
    --
    --   This procedure moves and resizes a window.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Window_Id  : Specifies the window Id.
    --  Bounds     : Specifies the new size and origin of the window.
    --
    --  Documentation
    --
    --    Please refer to XMoveResizeWindow in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Move_Resize_Window (Display_Id : in Display;
				    Window_Id : in Window;
				    X : in Coordinate;
				    Y : in Coordinate;
				    Width : in Width_Height;
				    Height : in Width_Height);

    -- new for R4
    function X_Iconify_Window (Display_Id : in Display;
			       Window_Id : in Window;
			       Screen_No : in Screen_Number) return Boolean;

    -- new for R4
    function X_Withdraw_Window (Display_Id : in Display;
				Window_Id : in Window;
				Screen_No : in Screen_Number) return Boolean;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Window_Border_Width
    --
    --  Description
    --
    --   This procedure changes the border width of the window.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Window_Id  : Specifies the window Id.
    --  Width      : Specifies the new width.
    --
    --  Documentation
    --
    --    Please refer to XSetWindowBorderWidth in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Window_Border_Width (Display_Id : in Display;
					 Window_Id : in Window;
					 Width : in Width_Height);

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Raise_Window
--    --
--    --  Description
--    --
--    --   This procedure raises a window so that no sibling window obscures it.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Window_Id  : Specifies the window Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to XRaiseWindow in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_Raise_Window (Display_Id : in Display; Window_Id : in Window);
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Lower_Window
--    --
--    --  Description
--    --
--    --   This procedure lowers a window so that no sibling window is obscured
--    --  by it.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Window_Id  : Specifies the window Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to XLowerWindow in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_Lower_Window (Display_Id : in Display; Window_Id : in Window);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Circulate_Subwindows
    --
    --  Description
    --
    --   This procedure circulates the specified subwindow in the specified
    --  direction.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Window_Id  : Specifies the window Id.
    --  Direction  : Specifies Raise_Lowest or Raise_Highest.
    --
    --  Documentation
    --
    --    Please refer to XCirculateSubwindows in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Circulate_Subwindows (Display_Id : in Display;
				      Window_Id : in Window;
				      Direction : in Direction_Type);

--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Circulate_Subwindows_Up
--    --
--    --  Description
--    --
--    --   This procedure raises the lowest child of a the specified window.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Window_Id  : Specifies the window Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to XCirculateSubwindowsUp in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_Circulate_Subwindows_Up
--		 (Display_Id : in Display; Window_Id : in Window);
--
--    --========================================================================
--    --  Subprogram Name
--    --
--    --    X_Circulate_Subwindows_Down
--    --
--    --  Description
--    --
--    --   This procedure lowers the highest mapped child of the specified window.
--    --
--    --  Parameters
--    --
--    --  Display_Id : Specifies the connection to the X Server.
--    --  Window_Id  : Specifies the window Id.
--    --
--    --  Documentation
--    --
--    --    Please refer to XCirculateSubwindowsDown in the
--    --  Xlib - C Language X InterfaceWindow System manual
--    --  for more information.
--    --
--    --  Package:  X_Lib
--    --========================================================================
--
--    procedure X_Circulate_Subwindows_Down
--		 (Display_Id : in Display; Window_Id : in Window);
--
    --========================================================================
    --  Subprogram Name
    --
    --    X_Restack_Windows
    --
    --  Description
    --
    --   This procedure restacks a list of windows from top to bottom. All
    --  windows must have the same parent.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Window_Id  : Specifies the window Id.
    --
    --  Documentation
    --
    --    Please refer to XRestackWindows in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Restack_Windows
		 (Display_Id : in Display; Windows : in Window_List);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Change_Window_Attributes
    --
    --  Description
    --
    --   This procedure changes one or more window attributes.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Window_Id  : Specifies the window Id.
    --  Value_Mask : Specifies which window attributes to change.
    --  Attributes : Specifies the value of the attributes.
    --
    --  Documentation
    --
    --    Please refer to XChangeWindowAttributes in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Change_Window_Attributes
		 (Display_Id : in Display;
		  Window_Id : in Window;
		  Value_Mask : in Wa_Mask_Type;
		  Attributes : in Set_Window_Attributes_Record);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Window_Background
    --
    --  Description
    --
    --   This procedure sets the window background to the specified pixel.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Window_Id  : Specifies the window Id.
    --  Background : Specifies the background to set.
    --
    --
    --  Documentation
    --
    --    Please refer to XSetWindowBackground in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Window_Background (Display_Id : in Display;
				       Window_Id : in Window;
				       Background : in U_Pixel);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Window_Background_Pixmap
    --
    --  Description
    --
    --   This procedure sets the background of a window to the specified pixmap.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Window_Id  : Specifies the window Id.
    --  Background : Specifies the new pixmap.
    --
    --  Documentation
    --
    --    Please refer to XSetWindowBackgroundPixmap in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Window_Background_Pixmap (Display_Id : in Display;
					      Window_Id : in Window;
					      Tile : in Pixmap);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Window_Border
    --
    --  Description
    --
    --   This procedure sets the window border to the specified pixel.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Window_Id  : Specifies the window Id.
    --  Border     : Specifies the new border color.
    --
    --
    --  Documentation
    --
    --    Please refer to XSetWindowBorder in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Window_Border (Display_Id : in Display;
				   Window_Id : in Window;
				   Border : in U_Pixel);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Window_Border_Pixmap
    --
    --  Description
    --
    --   This procedure changes the window border tile.
    --
    --  Parameters
    --
    --  Display_Id : Specifies the connection to the X Server.
    --  Window_Id  : Specifies the window Id.
    --  Tile       : Specifies the new border pixmap.
    --
    --
    --  Documentation
    --
    --    Please refer to XSetWindowBorderPixmap in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Window_Border_Pixmap (Display_Id : in Display;
					  Window_Id : in Window;
					  Tile : in Pixmap);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Translate_Coordinates
    --
    --  Description
    --
    --   This procedure performs a coordinate transformation from the
    -- coordinates of one window to another.
    --
    --  Parameters
    --
    --  Display_Id  : Specifies the connection to the X Server.
    --  Source      : Specifies the source window.
    --  Destination : Specifies the destination window.
    --  From        : Specifies the coordinates within the source window.
    --  To          : Returns the coordinate within the destination window.
    --  Child       : Returns the child if the coordinates are contained in the
    --                mapped child of the destination window.
    --  Same_Screen : True if source and destination are on the same screen.
    --
    --  Documentation
    --
    --    Please refer to XTranslateCoordinates in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Translate_Coordinates (Display_Id : in Display;
				       Source : in Window;
				       Destination : in Window;
				       Source_X : in Coordinate;
				       Source_Y : in Coordinate;
				       Destination_X : out Coordinate;
				       Destination_Y : out Coordinate;
				       Child : out Window;
				       Same_Screen : out Boolean);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Query_Tree
    --
    --  Description
    --
    --   This procedure performs a coordinate transformation from the
    -- coordinates of one window to another.
    --
    --  Parameters
    --
    --  Display_Id  : Specifies the connection to the X Server.
    --  Window_Id   : Specifies the window.
    --  Root        : Returns the root window id for the specified window.
    --  Parent      : Returns the parent window id for the specified window.
    --  Children    : Returns a list of children of the specified window.
    --  Status      : True if the operation was successful.
    --
    --  Documentation
    --
    --    Please refer to XQueryTree in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Query_Tree (Display_Id : in Display;
			    Window_Id : in Window;
			    Root : in out Window;
			    Parent : in out Window;
			    Children : in out Window_List;
			    Status : out Boolean);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Window_Attributes
    --
    --  Description
    --
    --   This procedure
    --
    --  Parameters
    --
    --  Display_Id  : Specifies the connection to the X Server.
    --  Window_Id   : Specifies the window.
    --  Attributes  : Returns the current attributes of the specified window.
    --  Status      : Returns true if successful.
    --
    --  Documentation
    --
    --    Please refer to XGetWindowAttributes in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Get_Window_Attributes
		 (Display_Id : in Display;
		  Window_Id : in Window;
		  Attributes : in out Window_Attributes_Record;
		  Status : out Boolean);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Geometry
    --
    --  Description
    --
    --   This procedure returns the root Id and the current geometry of the
    -- specified drawable.
    --
    --  Parameters
    --
    --  Display_Id  : Specifies the connection to the X Server.
    --  Drawable_Id : Specifies the drawable (pixmap or Window).
    --  Root        : Returns the root window id of the drawable.
    --  Bounds      : Returns the bounds of the drawable.
    --  Border_Width: Returns the border width if the drawable is a window.
    --  Depths      : Returns the depth of the drawable.
    --  Status      : True if the successful.
    --
    --  Documentation
    --
    --    Please refer to XGetGeometry in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Get_Geometry (Display_Id : in Display;
			      Drawable_Id : in Drawable;
			      Root : out Window;
			      X : out Coordinate;
			      Y : out Coordinate;
			      Width : out Width_Height;
			      Height : out Width_Height;
			      Border_Width : out Width_Height;
			      Depths : out Depth_Type;
			      Status : out Boolean);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Parse_Geometry
    --
    --  Description
    --
    --   This procedure parses standard geometry strings of the form:
    --    =<width>x<height>{+-}<x_offset>{+-}<y_offset>
    -- The items in this form are returned in the parameters.
    --
    --  Parameters
    --
    --  Parse_String : Specifies the string to parse.
    --  Geometry     : The values in the string.
    --  Values_Found : Returns information about the values that were found.
    --
    --  Documentation
    --
    --    Please refer to XParseGeometry in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Parse_Geometry (Parse_String : in String;
				X : out Coordinate;
				Y : out Coordinate;
				Width : out Width_Height;
				Height : out Width_Height;
				Values_Found : out Geometry_Mask_Type);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Geometry
    --
    --  Description
    --
    --   This procedure parses the window geometry given an argument and a
    -- default position. It returns the position the window should be placed
    -- given a position and a default position.
    --
    --  Parameters
    --
    --  Display_Id   : Specifies the connection to the X Server.
    --  Screen       : Specifies the screen.
    --  Position     :
    --  Default      : Specifies the geometry specifications;
    --  Border_Width : Specifies the border width.
    --  Font_Height  : Specifies the font height.
    --  Font_Width   : Specifies the font width.
    --  XY_Padding   : Specifies the additional interior window padding needed.
    --  Geometry     : Returns the Window postion.
    --  Values_Found : Returns information about the values that were found.
    --
    --  Documentation
    --
    --    Please refer to XGeometry in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Geometry (Display_Id : in Display;
			  Screen_No : in Screen_Number;
			  Position : in String;
			  Default : in String;
			  Border_Width : in Width_Height;
			  Font_Height : in Width_Height;
			  Font_Width : in Width_Height;
			  X_Padding : in Coordinate;
			  Y_Padding : in Coordinate;
			  X : out Coordinate;
			  Y : out Coordinate;
			  Width : out Coordinate;
			  Height : out Coordinate;
			  Values_Found : out Geometry_Mask_Type);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Query_Pointer
    --
    --  Description
    --
    --   This procedure obtains the root window the pointer is currently on and
    -- the pointer coordinates relative to the root's origin.
    -- of one window to another.
    --
    --  Parameters
    --
    --  Display_Id  : Specifies the connection to the X Server.
    --  Window_Id   : Specifies the window.
    --  Root        : Returns the root window Id.
    --  Child       : Returns the child, if any, the pointer was in.
    --  Root_Xy     : Returns the pointer coordinates relative to the root.
    --  Window_Xy   : Returns the coordinates relative to the specified window.
    --  Mask        : Returns the current state of the modifier keys and pointer
    --                buttons.
    --  Same_Screen : True if the pointer is on the same screen as the specified
    --                window.
    --
    --  Documentation
    --
    --    Please refer to XQueryPointer in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Query_Pointer
		 (Display_Id : in Display;
		  Window_Id : in Window;
		  Root : out Window;
		  Child : out Window;
		  Root_X : out Coordinate;
		  Root_Y : out Coordinate;
		  Window_X : out Coordinate;
		  Window_Y : out Coordinate;
		  Keys_And_Buttons : out Events.Key_And_Button_Mask;
		  Same_Screen : out Boolean);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Window_Property
    --
    --  Description
    --
    --   This procedure returns the atom type and property format for the
    -- specified window. After the data is returned it must be converted to the
    -- appropriate type.
    --
    --  Parameters
    --
    --  Display_Id  : Specifies the connection to the X Server.
    --  Window_Id   : Specifies the window.
    --  Property    : Specifies the property atom.
    --  Long_Offset : Specifies the offset in the property where data
    --                will be retrieved.
    --  Long_Length : Specifies the length of the data.
    --  Delete      : Specifies if the property should be deleted from the
    --                window.
    --  Req_Type    : Specifies the atom identifier type.
    --  Actual_Type : Returns the actual type of the property.
    --  Actual_Form : Returns the actual format of the property.
    --  Bytes_After : Returns the number of bytes remaining.
    --  Data        : Returns a pointer to the untyped data.
    --
    --
    --  Documentation
    --
    --    Please refer to XGetWindowProperty in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Get_Window_Property (Display_Id : in Display;
				     Window_Id : in Window;
				     Property : in Atoms.Atom;
				     Long_Offset : in X_Long_Integer;
				     Long_Length : in X_Long_Integer;
				     Delete : in Boolean;
				     Req_Type : in Atoms.Atom;
				     Actual_Type : out Atoms.Atom;
				     Actual_Form : out X_Long_Integer;
				     Bytes_After : out X_Long_Integer;
				     Data : out Bytes);

    --========================================================================
    --  Subprogram Name
    --
    --    X_List_Properties
    --
    --  Description
    --
    --   This function returns a list of properties for the specified window.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Window_Id      : Specifies the window.
    --
    --  Documentation
    --
    --    Please refer to XListProperties in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function X_List_Properties (Display_Id : in Display; Window_Id : in Window)
			       return Atoms.Atom_List;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Change_Property
    --
    --  Description
    --
    --   This procedure changes the property for a specified window. The data
    -- must be converted from a defined type to the bytes type.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Window_Id      : Specifies the window.
    --  Property       : Specifies the property atom.
    --  Kind           : Specifies the atom identifier type.
    --  Format         : Specifies the data format.
    --  Mode           : Specifies the property mode.
    --  Data           : Specifies the property data.
    --
    --
    --  Documentation
    --
    --    Please refer to XChangeProperty in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Change_Property (Display_Id : in Display;
				 Window_Id : in Window;
				 Property : in Atoms.Atom;
				 Kind : in Atoms.Atom;
				 Format : in Property_Format_Type;
				 Mode : in Property_Mode;
				 Data : in Bytes;
				 N_Items : in Natural);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Rotate_Window_Properties
    --
    --  Description
    --
    --   This procedure rotates properties in an atom list.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Window_Id      : Specifies the window.
    --  Properties     : Specifies the list to be rotated.
    --  N_Positions    : Specifies the rotation amount.
    --
    --  Documentation
    --
    --    Please refer to XRotateWindowProperties in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Rotate_Window_Properties (Display_Id : in Display;
					  Window_Id : in Window;
					  Properties : in Atoms.Atom_List;
					  N_Positions : in Natural);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Delete_Property
    --
    --  Description
    --
    --   This procedure deletes a property for the specified window.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Window_Id      : Specifies the window.
    --  Property       : Specifies the property atom to be deleted.
    --
    --
    --  Documentation
    --
    --    Please refer to XDeleteProperty in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Delete_Property (Display_Id : in Display;
				 Window_Id : in Window;
				 Property : in Atoms.Atom);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Set_Selection_Owner
    --
    --  Description
    --
    --    This procedure changes the owner and last time for the specified
    --  selection.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Selection      : Specifies the selection atom.
    --  Owner          : Specifies the owner of the selection atom.
    --  Time_Stamp     : Specifies the time.
    --
    --
    --  Documentation
    --
    --    Please refer to XSetSelectionOwner in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Set_Selection_Owner (Display_Id : in Display;
				     Selection : in Atoms.Atom;
				     Owner : in Window;
				     Time_Stamp : in Time);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Get_Selection_Owner
    --
    --  Description
    --
    --   This function gets the window id of the owner of the selection atom.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Selection      : Specifies the selection atom.
    --
    --  Documentation
    --
    --    Please refer to XGetSelectionOwner in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function X_Get_Selection_Owner
		(Display_Id : in Display; Selection : in Atoms.Atom)
		return Window;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Convert_Selection
    --
    --  Description
    --
    --   This procedure requests a selection conversion to the specific target
    --  type.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Selection      : Specifies the selection atom.
    --  Target         : Specifies the target atom.
    --  Property       : Specifies the property atom.
    --  Requestor      : Specifies the window Id of the requestor.
    --  Time_Stamp     : Specifies the time.
    --
    --  Documentation
    --
    --    Please refer to XConvertSelection in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Convert_Selection (Display_Id : in Display;
				   Selection : in Atoms.Atom;
				   Target : in Atoms.Atom;
				   Property : in Atoms.Atom;
				   Requestor : in Window;
				   Time_Stamp : in Time);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Reparent_Window
    --
    --  Description
    --
    --   This procedure changes the parent of a window within a screen. It is
    -- primarily used by window managers.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Window_Id      : Specifies the window.
    --  Parent         : Specifies the new parent.
    --  Upper_Left     : Specifies the origin of the specified window in the
    --                   new parent.
    --
    --  Documentation
    --
    --    Please refer to XReparentWindow in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Reparent_Window (Display_Id : in Display;
				 Window_Id : in Window;
				 Parent : in Window;
				 X : in Coordinate;
				 Y : in Coordinate);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Change_Save_Set
    --
    --  Description
    --
    --   This procedure adds or removes a window from the client's save set.
    -- It is primarily used by window managers.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Window_Id      : Specifies the window.
    --  Mode           : Specifies the change mode.
    --
    --  Documentation
    --
    --    Please refer to XChangeSaveSet in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Change_Save_Set (Display_Id : in Display;
				 Window_Id : in Window;
				 Mode : in Set_Mode);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Add_To_Save_Set
    --
    --  Description
    --
    --   This procedure adds a window to a client's save save-set.
    -- It is primarily used by window managers.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Window_Id      : Specifies the window.
    --
    --  Documentation
    --
    --    Please refer to XAddToSaveSet in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Add_To_Save_Set
		 (Display_Id : in Display; Window_Id : in Window);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Remove_From_Save_Set
    --
    --  Description
    --
    --   This procedure removes a window from a client's save save-set.
    -- It is primarily used by window managers.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Window_Id      : Specifies the window.
    --
    --  Documentation
    --
    --    Please refer to XRemoveFromSaveSet in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Remove_From_Save_Set
		 (Display_Id : in Display; Window_Id : in Window);

    -- Context status return constants
    type Context_Status_Type is private;
    Xc_Success : constant Context_Status_Type;
    Xc_No_Mem : constant Context_Status_Type;
    Xc_No_Ent : constant Context_Status_Type;
    function Create_Constant (Value : in X_Long_Integer)
			     return Context_Status_Type;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Save_Context
    --
    --  Description
    --
    --   This procedure saves a data value that corresponds to a window and
    -- context type.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Window_Id      : Specifies the window.
    --  The_Context    : Specifies the context type to which the data belongs.
    --  Data           : Specifies the untyped data to be associated with the
    --                   window and type.
    --  Status         : Specifies the return status of the call.
    --
    --  Documentation
    --
    --    Please refer to XSaveContext in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Save_Context (Display_Id : in Display;
			      R_Id : in X_Id;
			      The_Context : in Context;
			      Data : in X_Address;
			      Status : out Context_Status_Type);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Find_Context
    --
    --  Description
    --
    --   This procedure retrieves the data associated with the window and
    -- context type.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Window_Id      : Specifies the window.
    --  The_Context    : Specifies the context type to which the data belongs.
    --  Data           : Specifies the untyped data to be associated with the
    --                   window and type.
    --  Status         : Specifies the return status of the call.
    --
    --  Documentation
    --
    --    Please refer to XFindContext in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Find_Context (Display_Id : in Display;
			      R_Id : in X_Id;
			      The_Context : in Context;
			      Data : in out X_Address;
			      Status : out Context_Status_Type);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Delete_Context
    --
    --  Description
    --
    --   This procedure deletes an entry for a given window and type.
    --
    --  Parameters
    --
    --  Display_Id     : Specifies the connection to the X Server.
    --  Window_Id      : Specifies the window.
    --  The_Context    : Specifies the context type to which the data belongs.
    --  Status         : Specifies the return status of the call.
    --
    --  Documentation
    --
    --    Please refer to XDeleteContext in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    procedure X_Delete_Context (Display_Id : in Display;
				R_Id : in X_Id;
				The_Context : in Context;
				Status : out Context_Status_Type);

    --========================================================================
    --  Subprogram Name
    --
    --    X_Unique_Context
    --
    --  Description
    --
    --   This function creates a unique context type that may be used in
    -- subsequent context calls.
    --
    --
    --  Documentation
    --
    --    Please refer to XUniqueContext in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    function X_Unique_Context return X_Context;

    --========================================================================
    --  Subprogram Name
    --
    --    X_Synchronize
    --
    --  Description
    --
    --   This procedure enables or disables synchronization for debugging
    -- clients.  Synchronization ensures that errors will be seen when they are
    -- generated and not some time after.
    --
    --  Documentation
    --
    --    Please refer to XSynchronize in the
    --  Xlib - C Language X InterfaceWindow System manual
    --  for more information.
    --
    --  Package:  X_Lib
    --========================================================================

    type Synchronize_Mode is (Off, On);
    procedure X_Synchronize (Display_Id : in Display;
			     Mode : in Synchronize_Mode := On);

    function X_Set_After_Function
		(Display_Id : in Display; Func : in X_Address) return X_Address;

    subtype X_Error_Handler is X_Address;
    subtype X_Io_Error_Handler is X_Address;

    function X_Set_Error_Handler
		(Handler : in X_Error_Handler) return X_Error_Handler;

    function X_Set_Io_Error_Handler
		(Handler : in X_Io_Error_Handler) return X_Io_Error_Handler;

    function X_Supports_Locale return Boolean;

    function X_Set_Locale_Modifiers (Modifier_List : in String) return String;

    function X_Vendor_Release (Dpy : in Display) return Int;

    procedure X_Add_To_Extension_List
		 (Struct : in Ext_Data_Ptr; Ext_D : in Ext_Data);

    function X_Screen_Resource_String (Scr : in Screen) return String;

    function X_Init_Extension
		(Dpy : in Display; Name : in String) return Ext_Codes;

    function X_Add_Extension (Dpy : in Display) return Ext_Codes;

    function X_Find_On_Extension_List
		(Struct : in Ext_Data_Array) return Ext_Data;

-- ?   function X_E_Head_Of_Extension_List (Obj : in X_E_Data_Object)
-- ?      return Ext_Data_Ptr;

private
    type Context is new Unsigned_Long;

    type Visual_Record;
    type Visual is access Visual_Record;

    type Display_Record;
    type Display is access Display_Record;

    type Screen_Record;
    type Screen is access Screen_Record;

    Null_Display : constant Display := null;

    Null_Context : constant Context := Context (0);

    type Pixmap_Format is new Int32;
    Xy_Bitmap : constant Pixmap_Format := 0;
    Xy_Pixmap : constant Pixmap_Format := 1;
    Z_Pixmap : constant Pixmap_Format := 2;

    type Order_Type is new Int32;
    Lsb_First : constant Order_Type := 0;
    Msb_First : constant Order_Type := 1;

    type Backing_Store_Type is new Unsigned_Long;
    Not_Useful : constant Backing_Store_Type := 0;
    When_Mapped : constant Backing_Store_Type := 1;
    Always : constant Backing_Store_Type := 2;

    type Stack_Mode_Type is new Int32;
    Above : constant Stack_Mode_Type := 0;
    Below : constant Stack_Mode_Type := 1;
    Top_If : constant Stack_Mode_Type := 2;
    Bottom_If : constant Stack_Mode_Type := 3;
    Opposite : constant Stack_Mode_Type := 4;

    type Map_Status is new Int32;
    Success : constant Map_Status := 0;
    Busy : constant Map_Status := 1;
    Failed : constant Map_Status := 2;

    type Visual_Class_Type is new Int32;
    Static_Gray : constant Visual_Class_Type := 0;
    Gray_Scale : constant Visual_Class_Type := 1;
    Static_Color : constant Visual_Class_Type := 2;
    Pseudo_Color : constant Visual_Class_Type := 3;
    True_Color : constant Visual_Class_Type := 4;
    Direct_Color : constant Visual_Class_Type := 5;

    type Window_Class is new Int32;
    Copy_Class_From_Parent : constant Window_Class := 0;
    Input_Output : constant Window_Class := 1;
    Input_Only : constant Window_Class := 2;

    type Direction_Type is new Int32;
    Raise_Lowest : constant Direction_Type := 0;
    Lower_Highest : constant Direction_Type := 1;

    type Property_Mode is new Int32;
    Replace : constant Property_Mode := 0;
    Prepend : constant Property_Mode := 1;
    Append : constant Property_Mode := 2;

    type Set_Mode is new Int32;
    Insert : constant Set_Mode := 0;
    Delete : constant Set_Mode := 1;

    type Gravity_Type is new Int32;
    Forget_Gravity : constant Gravity_Type := 0;
    Northwest_Gravity : constant Gravity_Type := 1;
    North_Gravity : constant Gravity_Type := 2;
    Northeast_Gravity : constant Gravity_Type := 3;
    West_Gravity : constant Gravity_Type := 4;
    Center_Gravity : constant Gravity_Type := 5;
    East_Gravity : constant Gravity_Type := 6;
    Southwest_Gravity : constant Gravity_Type := 7;
    South_Gravity : constant Gravity_Type := 8;
    Southeast_Gravity : constant Gravity_Type := 9;
    Static_Gravity : constant Gravity_Type := 10;
    -- Unmap_Gravity = window gravity + bit gravity
    Unmap_Gravity : constant Gravity_Type := 0;

    type Map_State_Type is new Int32;
    Is_Unmapped : constant Map_State_Type := 0;
    Is_Unviewable : constant Map_State_Type := 1;
    Is_Viewable : constant Map_State_Type := 2;

    type Initial_State_Type is new Int32;
    Dont_Care_State : constant Initial_State_Type := 0;
    Withdrawn_State : constant Initial_State_Type := 0;
    Normal_State : constant Initial_State_Type := 1;
    Zoom_State : constant Initial_State_Type := 2;
    Iconic_State : constant Initial_State_Type := 3;
    Inactive_State : constant Initial_State_Type := 4;

    type Context_Status_Type is new Int32;
    Xc_Success : constant Context_Status_Type := 0;
    Xc_No_Mem : constant Context_Status_Type := 1;
    Xc_No_Ent : constant Context_Status_Type := 2;

    type Im_Style_Type is new Unsigned_Long;
    X_Im_Preedit_Area : constant Im_Style_Type := 16#0001#;
    X_Im_Preedit_Callbacks : constant Im_Style_Type := 16#0002#;
    X_Im_Preedit_Position : constant Im_Style_Type := 16#0004#;
    X_Im_Preedit_Nothing : constant Im_Style_Type := 16#0008#;
    X_Im_Preedit_None : constant Im_Style_Type := 16#0010#;
    X_Im_Status_Area : constant Im_Style_Type := 16#0100#;
    X_Im_Status_Callbacks : constant Im_Style_Type := 16#0200#;
    X_Im_Status_Nothing : constant Im_Style_Type := 16#0400#;
    X_Im_Status_None : constant Im_Style_Type := 16#0800#;

    type Im_Feedback_Type is new Unsigned_Long;
    X_Im_Reverse : constant Im_Feedback_Type := 1;
    X_Im_Underline : constant Im_Feedback_Type := 2;
    X_Im_Highlight : constant Im_Feedback_Type := 4;
    X_Im_Primary : constant Im_Feedback_Type := 32;
    X_Im_Secondary : constant Im_Feedback_Type := 64;
    X_Im_Tertiary : constant Im_Feedback_Type := 128;
end X_Lib;
