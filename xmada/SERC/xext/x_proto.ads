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

with X_Lib, X_Configuration_Dependent, X_Masks;

package X_Proto is
    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    -- **********************************************************************
    -- * Define constants for the sizes of the network packets. The sz_ prefix
    -- * is used instead of something more descriptive so that the symbols are
    -- * no more than 32 characters in length (which causes problems for some
    -- * compilers).

    Sz_X_Segment : constant := 8;
    Sz_X_Point : constant := 4;
    Sz_X_Rectangle : constant := 8;
    Sz_X_Arc : constant := 12;
    Sz_X_Conn_Client_Prefix : constant := 12;
    Sz_X_Conn_Setup_Prefix : constant := 8;
    Sz_X_Conn_Setup : constant := 32;
    Sz_X_Pixmap_Format : constant := 8;
    Sz_X_Depth : constant := 8;
    Sz_X_Visual_Type : constant := 24;
    Sz_X_Window_Root : constant := 40;
    Sz_X_Time_Coord : constant := 8;
    Sz_X_Host_Entry : constant := 4;
    Sz_X_Char_Info : constant := 12;
    Sz_X_Font_Prop : constant := 8;
    Sz_X_Text_Elt : constant := 2;
    Sz_X_Color_Item : constant := 12;
    Sz_X_Rgb : constant := 8;
    Sz_X_Generic_Reply : constant := 32;
    Sz_X_Get_Window_Attributes_Reply : constant := 44;
    Sz_X_Get_Geometry_Reply : constant := 32;
    Sz_X_Query_Tree_Reply : constant := 32;
    Sz_X_Intern_Atom_Reply : constant := 32;
    Sz_X_Get_Atom_Name_Reply : constant := 32;
    Sz_X_Get_Property_Reply : constant := 32;
    Sz_X_List_Properties_Reply : constant := 32;
    Sz_X_Get_Selection_Owner_Reply : constant := 32;
    Sz_X_Grab_Pointer_Reply : constant := 32;
    Sz_X_Query_Pointer_Reply : constant := 32;
    Sz_X_Get_Motion_Events_Reply : constant := 32;
    Sz_X_Translate_Coords_Reply : constant := 32;
    Sz_X_Getinput_Focus_Reply : constant := 32;
    Sz_X_Query_Keymap_Reply : constant := 40;
    Sz_X_Query_Font_Reply : constant := 60;
    Sz_X_Query_Text_Extents_Reply : constant := 32;
    Sz_X_List_Fonts_Reply : constant := 32;
    Sz_X_Get_Font_Path_Reply : constant := 32;
    Sz_X_Get_Image_Reply : constant := 32;
    Sz_X_List_Installed_Colormaps_Reply : constant := 32;
    Sz_X_Alloc_Color_Reply : constant := 32;
    Sz_X_Alloc_Named_Color_Reply : constant := 32;
    Sz_X_Alloc_Color_Cells_Reply : constant := 32;
    Sz_X_Alloc_Color_Planes_Reply : constant := 32;
    Sz_X_Query_Colors_Reply : constant := 32;
    Sz_X_Lookup_Color_Reply : constant := 32;
    Sz_X_Query_Best_Size_Reply : constant := 32;
    Sz_X_Query_Extension_Reply : constant := 32;
    Sz_X_List_Extensions_Reply : constant := 32;
    Sz_X_Set_Mapping_Reply : constant := 32;
    Sz_X_Get_Keyboard_Control_Reply : constant := 52;
    Sz_X_Get_Pointer_Control_Reply : constant := 32;
    Sz_X_Get_Screen_Saver_Reply : constant := 32;
    Sz_X_List_Hosts_Reply : constant := 32;
    Sz_X_Set_Modifier_Mapping_Reply : constant := 32;
    Sz_X_Error : constant := 32;
    Sz_X_Event : constant := 32;
    Sz_X_Keymap_Event : constant := 32;
    Sz_X_Req : constant := 4;
    Sz_X_Resource_Req : constant := 8;
    Sz_X_Create_Window_Req : constant := 32;
    Sz_X_Change_Window_Attributes_Req : constant := 12;
    Sz_X_Change_Save_Set_Req : constant := 8;
    Sz_X_Reparent_Window_Req : constant := 16;
    Sz_X_Configure_Window_Req : constant := 12;
    Sz_X_Circulate_Window_Req : constant := 8;
    Sz_X_Intern_Atom_Req : constant := 8;
    Sz_X_Change_Property_Req : constant := 24;
    Sz_X_Delete_Property_Req : constant := 12;
    Sz_X_Get_Property_Req : constant := 24;
    Sz_X_Set_Selection_Owner_Req : constant := 16;
    Sz_X_Convert_Selection_Req : constant := 24;
    Sz_X_Send_Event_Req : constant := 44;
    Sz_X_Grab_Pointer_Req : constant := 24;
    Sz_X_Grab_Button_Req : constant := 24;
    Sz_X_Ungrab_Button_Req : constant := 12;
    Sz_X_Change_Active_Pointer_Grab_Req : constant := 16;
    Sz_X_Grab_Keyboard_Req : constant := 16;
    Sz_X_Grab_Key_Req : constant := 16;
    Sz_X_Ungrab_Key_Req : constant := 12;
    Sz_X_Allow_Events_Req : constant := 8;
    Sz_X_Get_Motion_Events_Req : constant := 16;
    Sz_X_Translate_Coords_Req : constant := 16;
    Sz_X_Warp_Pointer_Req : constant := 24;
    Sz_X_Set_Input_Focus_Req : constant := 12;
    Sz_X_Open_Font_Req : constant := 12;
    Sz_X_Query_Text_Extents_Req : constant := 8;
    Sz_X_List_Fonts_Req : constant := 8;
    Sz_X_Set_Font_Path_Req : constant := 8;
    Sz_X_Create_Pixmap_Req : constant := 16;
    Sz_X_Create_Gc_Req : constant := 16;
    Sz_X_Change_Gc_Req : constant := 12;
    Sz_X_Copy_Gc_Req : constant := 16;
    Sz_X_Set_Dashes_Req : constant := 12;
    Sz_X_Setclip_Rectangles_Req : constant := 12;
    Sz_X_Copy_Area_Req : constant := 28;
    Sz_X_Copy_Plane_Req : constant := 32;
    Sz_X_Poly_Point_Req : constant := 12;
    Sz_X_Poly_Segment_Req : constant := 12;
    Sz_X_Fill_Poly_Req : constant := 16;
    Sz_X_Put_Image_Req : constant := 24;
    Sz_X_Get_Image_Req : constant := 20;
    Sz_X_Poly_Text_Req : constant := 16;
    Sz_X_Image_Text_Req : constant := 16;
    Sz_X_Create_Colormap_Req : constant := 16;
    Sz_X_Copy_Colormap_And_Free_Req : constant := 12;
    Sz_X_Alloc_Color_Req : constant := 16;
    Sz_X_Alloc_Named_Color_Req : constant := 12;
    Sz_X_Alloc_Color_Cells_Req : constant := 12;
    Sz_X_Alloc_Color_Planes_Req : constant := 16;
    Sz_X_Free_Colors_Req : constant := 12;
    Sz_X_Store_Colors_Req : constant := 8;
    Sz_X_Store_Named_Color_Req : constant := 16;
    Sz_X_Query_Colors_Req : constant := 8;
    Sz_X_Lookup_Color_Req : constant := 12;
    Sz_X_Create_Cursor_Req : constant := 32;
    Sz_X_Create_Glyph_Cursor_Req : constant := 32;
    Sz_X_Recolor_Cursor_Req : constant := 20;
    Sz_X_Query_Best_Size_Req : constant := 12;
    Sz_X_Query_Extension_Req : constant := 8;
    Sz_X_Change_Keyboard_Control_Req : constant := 8;
    Sz_X_Bell_Req : constant := 4;
    Sz_X_Change_Pointer_Control_Req : constant := 12;
    Sz_X_Set_Screen_Saver_Req : constant := 12;
    Sz_X_Change_Hosts_Req : constant := 8;
    Sz_X_List_Hosts_Req : constant := 4;
    Sz_X_Change_Mode_Req : constant := 4;
    Sz_X_Rotate_Properties_Req : constant := 12;
    Sz_X_Reply : constant := 32;
    Sz_X_Grab_Keyboard_Reply : constant := 32;
    Sz_X_List_Fonts_With_Info_Reply : constant := 60;
    Sz_X_Set_Pointer_Mapping_Reply : constant := 32;
    Sz_X_Get_Keyboard_Mapping_Reply : constant := 32;
    Sz_X_Get_Pointer_Mapping_Reply : constant := 32;
    Sz_X_List_Fonts_With_Info_Req : constant := 8;
    Sz_X_Poly_Line_Req : constant := 12;
    Sz_X_Poly_Arc_Req : constant := 12;
    Sz_X_Poly_Rectangle_Req : constant := 12;
    Sz_X_Poly_Fill_Rectangle_Req : constant := 12;
    Sz_X_Poly_Fill_Arc_Req : constant := 12;
    Sz_X_Poly_Text8_Req : constant := 16;
    Sz_X_Poly_Text16_Req : constant := 16;
    Sz_X_Image_Text8_Req : constant := 16;
    Sz_X_Image_Text16_Req : constant := 16;
    Sz_X_Set_Pointer_Mapping_Req : constant := 4;
    Sz_X_Force_Screen_Saver_Req : constant := 4;
    Sz_X_Set_Close_Down_Mode_Req : constant := 4;
    Sz_X_Clear_Area_Req : constant := 16;
    Sz_X_Set_Access_Control_Req : constant := 4;
    Sz_X_Get_Keyboard_Mapping_Req : constant := 8;
    Sz_X_Set_Modifier_Mapping_Req : constant := 4;
    Sz_X_Prop_Icon_Size : constant := 24;
    Sz_X_Change_Keyboard_Mapping_Req : constant := 8;


    X_Tcp_Port : constant := 6000;     -- add display number

    X_True : constant := 1;
    X_False : constant := 0;


    subtype Key_But_Mask is X_Lib.Word;

    -- ****************
    -- * connection setup structure.  This is followed by
    -- * numRoots X_X_Lib.WindowRoot structs.
    -- *****************

    type X_Conn_Client_Prefix is
	record
	    Byte_Order : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Major_Version : X_Configuration_Dependent.Card16;
	    Minor_Version : X_Configuration_Dependent.Card16;
	    N_Bytes_Auth_Proto : X_Configuration_Dependent.Card16;
	    -- Authorization protocol
	    N_Bytes_Auth_String : X_Configuration_Dependent.Card16;
	    -- Authorization string
	    Pad2 : X_Configuration_Dependent.Card16;
	end record;

    for X_Conn_Client_Prefix use
	record
	    Byte_Order at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Major_Version at 0 * Word_Size + 2 range 0 .. 15;
	    Minor_Version at 1 * Word_Size range 0 .. 15;
	    N_Bytes_Auth_Proto at 1 * Word_Size + 2 range 0 .. 15;
	    N_Bytes_Auth_String at 2 * Word_Size range 0 .. 15;
	    Pad2 at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Conn_Setup_Prefix is
	record
	    Success : X_Configuration_Dependent.Bool;
	    Length_Reason : X_Configuration_Dependent.Byte;
	    --num bytes in string following if failure
	    Major_Version : X_Configuration_Dependent.Card16;
	    Minor_Version : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card16;
	    -- 1/4 additional bytes in setup info
	end record;

    for X_Conn_Setup_Prefix use
	record
	    Success at 0 * Word_Size range 0 .. 31;
	    Length_Reason at 1 * Word_Size range 0 .. 7;
	    Major_Version at 1 * Word_Size + 2 range 0 .. 15;
	    Minor_Version at 2 * Word_Size range 0 .. 15;
	    Length at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Conn_Setup is
	record
	    Release : X_Configuration_Dependent.Card32;
	    Rid_Base : X_Configuration_Dependent.Card32;
	    Rid_Mask : X_Masks.Mask_Type;
	    Motion_Buffer_Size : X_Configuration_Dependent.Card32;
	    N_Bytes_Vendor : X_Configuration_Dependent.Card16;
	    -- number of bytes in vendor string
	    Max_Request_Size : X_Configuration_Dependent.Card16;
	    Num_Roots : X_Configuration_Dependent.Card8;
	    -- number of roots structs to follow
	    Num_Formats : X_Configuration_Dependent.Card8;
	    -- number of pixmap formats
	    Image_Byte_Order : X_Configuration_Dependent.Card8;
	    -- LSBFirst, MSBFirst
	    Bitmap_Bit_Order : X_Configuration_Dependent.Card8;
	    -- LeastSignificant, MostSign...
	    Bitmap_Scan_Line_Unit : X_Configuration_Dependent.Card8;-- 8, 16, 32
	    Bitmap_Scan_Line_Pad : X_Configuration_Dependent.Card8;-- 8, 16, 32
	    Min_Key_Code : X_Lib.Keyboard.Key_Code;
	    Max_Key_Code : X_Lib.Keyboard.Key_Code;
	    Pad2 : X_Configuration_Dependent.Card32;
	end record;

    for X_Conn_Setup use
	record
	    Release at 0 * Word_Size range 0 .. 31;
	    Rid_Base at 1 * Word_Size range 0 .. 31;
	    Rid_Mask at 2 * Word_Size range 0 .. 31;
	    Motion_Buffer_Size at 3 * Word_Size range 0 .. 31;
	    N_Bytes_Vendor at 4 * Word_Size range 0 .. 15;
	    Max_Request_Size at 4 * Word_Size + 2 range 0 .. 15;
	    Num_Roots at 5 * Word_Size range 0 .. 7;
	    Num_Formats at 5 * Word_Size + 1 range 0 .. 7;
	    Image_Byte_Order at 5 * Word_Size + 2 range 0 .. 7;
	    Bitmap_Bit_Order at 5 * Word_Size + 3 range 0 .. 7;
	    Bitmap_Scan_Line_Unit at 6 * Word_Size range 0 .. 7;
	    Bitmap_Scan_Line_Pad at 6 * Word_Size + 1 range 0 .. 7;
	    Min_Key_Code at 6 * Word_Size + 2 range 0 .. 7;
	    Max_Key_Code at 6 * Word_Size + 3 range 0 .. 7;
	    Pad2 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Pixmap_Format is
	record
	    Depth : X_Configuration_Dependent.Card8;
	    Bits_Per_Pixel : X_Configuration_Dependent.Card8;
	    Scan_Line_Pad : X_Configuration_Dependent.Card8;
	    Pad1 : X_Configuration_Dependent.Card8;
	    Pad2 : X_Configuration_Dependent.Card32;
	end record;

    for X_Pixmap_Format use
	record
	    Depth at 0 * Word_Size range 0 .. 7;
	    Bits_Per_Pixel at 0 * Word_Size + 1 range 0 .. 7;
	    Scan_Line_Pad at 0 * Word_Size + 2 range 0 .. 7;
	    Pad1 at 0 * Word_Size + 3 range 0 .. 7;
	    Pad2 at 1 * Word_Size range 0 .. 31;
	end record;

    -- window root
    type X_Depth is
	record
	    Depth : X_Configuration_Dependent.Card8;
	    Pad1 : X_Configuration_Dependent.Card8;
	    N_Visuals : X_Configuration_Dependent.Card16;
	    -- number of xVisualType structures following
	    Pad2 : X_Configuration_Dependent.Card32;
	end record;

    for X_Depth use
	record
	    Depth at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    N_Visuals at 0 * Word_Size + 2 range 0 .. 15;
	    Pad2 at 1 * Word_Size range 0 .. 31;
	end record;

    type X_Visual_Type is
	record
	    Visual_Id : X_Lib.Visual;
	    Class : X_Configuration_Dependent.Card8;
	    Bits_Per_Rgb : X_Configuration_Dependent.Card8;
	    Color_Map_Entries : X_Configuration_Dependent.Card16;
	    Red_Mask : X_Lib.U_Pixel;
	    Green_Mask : X_Lib.U_Pixel;
	    Blue_Mask : X_Lib.U_Pixel;
	    Pad : X_Configuration_Dependent.Card32;
	end record;

    for X_Visual_Type use
	record
	    Visual_Id at 0 * Word_Size range 0 .. 31;
	    Class at 1 * Word_Size range 0 .. 7;
	    Bits_Per_Rgb at 1 * Word_Size + 1 range 0 .. 7;
	    Color_Map_Entries at 1 * Word_Size + 2 range 0 .. 15;
	    Red_Mask at 2 * Word_Size range 0 .. 31;
	    Green_Mask at 3 * Word_Size range 0 .. 31;
	    Blue_Mask at 4 * Word_Size range 0 .. 31;
	    Pad at 5 * Word_Size range 0 .. 31;
	end record;

    type X_Window_Root is
	record
	    Window_Id : X_Lib.Window;
	    Default_Color_Map : X_Lib.Colors.Color_Map;
	    White_Pixel : X_Lib.U_Pixel;
	    Black_Pixel : X_Lib.U_Pixel;
	    Current_Input_Mask : X_Masks.Mask_Type;
	    Pix_Width : X_Configuration_Dependent.Card16;
	    Pix_Height : X_Configuration_Dependent.Card16;
	    Mm_Width : X_Configuration_Dependent.Card16;
	    Mm_Height : X_Configuration_Dependent.Card16;
	    Min_Installed_Maps : X_Configuration_Dependent.Card16;
	    Max_Installed_Maps : X_Configuration_Dependent.Card16;
	    Root_Visual_Id : X_Lib.Visual;
	    Backing_Store : X_Configuration_Dependent.Card8;
	    Save_Unders : X_Configuration_Dependent.Bool;
	    Root_Depth : X_Configuration_Dependent.Card8;
	    N_Depths : X_Configuration_Dependent.Card8;
	    -- number of xDepth structures following
	end record;
    for X_Window_Root use
	record
	    Window_Id at 0 * Word_Size range 0 .. 31;
	    Default_Color_Map at 1 * Word_Size range 0 .. 31;
	    White_Pixel at 2 * Word_Size range 0 .. 31;
	    Black_Pixel at 3 * Word_Size range 0 .. 31;
	    Current_Input_Mask at 4 * Word_Size range 0 .. 31;
	    Pix_Width at 5 * Word_Size range 0 .. 15;
	    Pix_Height at 5 * Word_Size + 2 range 0 .. 15;
	    Mm_Width at 6 * Word_Size range 0 .. 15;
	    Mm_Height at 6 * Word_Size + 2 range 0 .. 15;
	    Min_Installed_Maps at 7 * Word_Size range 0 .. 15;
	    Max_Installed_Maps at 7 * Word_Size + 2 range 0 .. 15;
	    Root_Visual_Id at 8 * Word_Size range 0 .. 31;
	    Backing_Store at 9 * Word_Size range 0 .. 7;
	    Save_Unders at 10 * Word_Size range 0 .. 31;
	    Root_Depth at 11 * Word_Size range 0 .. 7;
	    N_Depths at 11 * Word_Size + 1 range 0 .. 7;
	end record;
-- ****************************************************************
-- * Structure Defns
-- *   Structures needed for replies
-- *****************************************************************

-- Used in GetMotionEvents

    type X_Time_Coord is
	record
	    Time : X_Lib.Time;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;
	end record;

    for X_Time_Coord use
	record
	    Time at 0 * Word_Size range 0 .. 31;
	    X at 1 * Word_Size range 0 .. 15;
	    Y at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Host_Entry is
	record
	    Family : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	end record;

    for X_Host_Entry use
	record
	    Family at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Char_Info is
	record
	    Left_Side_Bearing : X_Lib.Millimeters;
	    Right_Side_Bearing : X_Lib.Millimeters;
	    Character_Width : X_Lib.Millimeters;
	    Ascent : X_Lib.Millimeters;
	    Descent : X_Lib.Millimeters;
	    Attributes : X_Configuration_Dependent.Card16;
	end record;

    for X_Char_Info use
	record
	    Left_Side_Bearing at 0 * Word_Size range 0 .. 15;
	    Right_Side_Bearing at 0 * Word_Size + 2 range 0 .. 15;
	    Character_Width at 1 * Word_Size range 0 .. 15;
	    Ascent at 1 * Word_Size + 2 range 0 .. 15;
	    Descent at 2 * Word_Size range 0 .. 15;
	    Attributes at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Font_Prop is
	record
	    Name : X_Lib.Atoms.Atom;
	    Value : X_Lib.Fonts.Font;
	end record;

    for X_Font_Prop use
	record
	    Name at 0 * Word_Size range 0 .. 31;
	    Value at 1 * Word_Size range 0 .. 31;
	end record;

    -- *********************************************************************
    -- * non-aligned big-endian font ID follows this struct
    -- * Len :  number of *characters* in string, or _FontChange (255)
    -- *        for font change, or 0 if just delta given

    type X_Text_Elt is
	record
	    Len : X_Configuration_Dependent.Card8;
	    Deltas : X_Configuration_Dependent.Int8;
	end record;

    for X_Text_Elt use
	record
	    Len at 0 * Word_Size range 0 .. 7;
	    Deltas at 0 * Word_Size + 1 range 0 .. 7;
	end record;

    type X_Color_Item is
	record
	    Pixel : X_Lib.U_Pixel;
	    Red : X_Lib.Colors.Rgb_Value_Type;
	    Green : X_Lib.Colors.Rgb_Value_Type;
	    Blue : X_Lib.Colors.Rgb_Value_Type;
	    Flags : X_Configuration_Dependent.Card8;
	    -- DoRed, DoGreen, DoBlue booleans
	    Pad : X_Configuration_Dependent.Card8;
	end record;

    for X_Color_Item use
	record
	    Pixel at 0 * Word_Size range 0 .. 31;
	    Red at 1 * Word_Size range 0 .. 15;
	    Green at 1 * Word_Size + 2 range 0 .. 15;
	    Blue at 2 * Word_Size range 0 .. 15;
	    Flags at 2 * Word_Size + 2 range 0 .. 7;
	    Pad at 2 * Word_Size + 3 range 0 .. 7;
	end record;

    type X_Rgb is
	record
	    Red : X_Lib.Colors.Rgb_Value_Type;
	    Green : X_Lib.Colors.Rgb_Value_Type;
	    Blue : X_Lib.Colors.Rgb_Value_Type;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for X_Rgb use
	record
	    Red at 0 * Word_Size range 0 .. 15;
	    Green at 0 * Word_Size + 2 range 0 .. 15;
	    Blue at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;


    -- ****************
    -- * XRep:
    -- *    meant to be 32 byte quantity
    -- *****************

    -- Generic_Reply is the common format of all replies.  The "data" items
    -- are specific to each individual reply type.

    type X_Generic_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;     -- X__Reply
	    Data1 : X_Configuration_Dependent.Byte;
	    -- depends on reply type
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    -- of last request received by server
	    Length : X_Configuration_Dependent.Card32;
	    -- 4 byte quantities beyond size of Generic_Reply
	    Data00 : X_Configuration_Dependent.Card32;
	    Data01 : X_Configuration_Dependent.Card32;
	    Data02 : X_Configuration_Dependent.Card32;
	    Data03 : X_Configuration_Dependent.Card32;
	    Data04 : X_Configuration_Dependent.Card32;
	    Data05 : X_Configuration_Dependent.Card32;
	end record;

    for X_Generic_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Data1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Data00 at 2 * Word_Size range 0 .. 31;
	    Data01 at 3 * Word_Size range 0 .. 31;
	    Data02 at 4 * Word_Size range 0 .. 31;
	    Data03 at 5 * Word_Size range 0 .. 31;
	    Data04 at 6 * Word_Size range 0 .. 31;
	    Data05 at 7 * Word_Size range 0 .. 31;
	end record;

    -- Individual reply formats.

    type X_Get_Window_Attributes_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Backing_Store : X_Configuration_Dependent.Card8;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    -- NOT 0; this is an extra-large reply
	    Visual_Id : X_Lib.Visual;
	    Class : X_Configuration_Dependent.Card16;
	    Bit_Gravity : X_Configuration_Dependent.Card8;
	    Win_Gravity : X_Configuration_Dependent.Card8;
	    Backing_Bit_Planes : X_Lib.Plane_Mask;
	    Backing_Pixel : X_Lib.U_Pixel;
	    Save_Under : X_Configuration_Dependent.Bool;
	    Map_Installed : X_Configuration_Dependent.Bool;
	    Map_State : X_Configuration_Dependent.Card8;
	    Over_Ride : X_Configuration_Dependent.Bool;
	    Color_Map : X_Lib.Colors.Color_Map;
	    All_Event_Masks : X_Lib.Events.Event_Mask_Type;
	    Your_Event_Mask : X_Lib.Events.Event_Mask_Type;
	    Do_Not_Propagate_Mask : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;
    for X_Get_Window_Attributes_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Backing_Store at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Visual_Id at 2 * Word_Size range 0 .. 31;
	    Class at 3 * Word_Size range 0 .. 15;
	    Bit_Gravity at 3 * Word_Size + 2 range 0 .. 7;
	    Win_Gravity at 3 * Word_Size + 3 range 0 .. 7;
	    Backing_Bit_Planes at 4 * Word_Size range 0 .. 31;
	    Backing_Pixel at 5 * Word_Size range 0 .. 31;
	    Save_Under at 6 * Word_Size range 0 .. 31;
	    Map_Installed at 7 * Word_Size range 0 .. 31;
	    Map_State at 8 * Word_Size range 0 .. 7;
	    Over_Ride at 9 * Word_Size range 0 .. 31;
	    Color_Map at 10 * Word_Size range 0 .. 31;
	    All_Event_Masks at 11 * Word_Size range 0 .. 31;
	    Your_Event_Mask at 12 * Word_Size range 0 .. 31;
	    Do_Not_Propagate_Mask at 13 * Word_Size range 0 .. 15;
	    Pad at 13 * Word_Size + 2 range 0 .. 15;
	end record;
    type X_Get_Geometry_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X__Reply
	    Depth : X_Configuration_Dependent.Card8;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 0
	    Root : X_Lib.Window;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	    Border_Width : X_Configuration_Dependent.Card16;
	    Pad1 : X_Configuration_Dependent.Card16;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	end record;

    for X_Get_Geometry_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Depth at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Root at 2 * Word_Size range 0 .. 31;
	    X at 3 * Word_Size range 0 .. 15;
	    Y at 3 * Word_Size + 2 range 0 .. 15;
	    Width at 4 * Word_Size range 0 .. 15;
	    Height at 4 * Word_Size + 2 range 0 .. 15;
	    Border_Width at 5 * Word_Size range 0 .. 15;
	    Pad1 at 5 * Word_Size + 2 range 0 .. 15;
	    Pad2 at 6 * Word_Size range 0 .. 31;
	    Pad3 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Query_Tree_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Root : X_Lib.Window;
	    Parent : X_Lib.Window;
	    N_Children : X_Configuration_Dependent.Card16;
	    Pad2 : X_Configuration_Dependent.Card16;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	end record;

    for X_Query_Tree_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Root at 2 * Word_Size range 0 .. 31;
	    Parent at 3 * Word_Size range 0 .. 31;
	    N_Children at 4 * Word_Size range 0 .. 15;
	    Pad2 at 4 * Word_Size + 2 range 0 .. 15;
	    Pad3 at 5 * Word_Size range 0 .. 31;
	    Pad4 at 6 * Word_Size range 0 .. 31;
	    Pad5 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Intern_Atom_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X_Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32; -- 0
	    Atom : X_Lib.Atoms.Atom;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	end record;

    for X_Intern_Atom_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Atom at 2 * Word_Size range 0 .. 31;
	    Pad2 at 3 * Word_Size range 0 .. 31;
	    Pad3 at 4 * Word_Size range 0 .. 31;
	    Pad4 at 5 * Word_Size range 0 .. 31;
	    Pad5 at 6 * Word_Size range 0 .. 31;
	    Pad6 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Get_Atom_Name_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    -- of additional bytes
	    Name_Length : X_Configuration_Dependent.Card16;
	    -- # of characters in name
	    Pad2 : X_Configuration_Dependent.Card16;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_Get_Atom_Name_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Name_Length at 2 * Word_Size range 0 .. 15;
	    Pad2 at 2 * Word_Size + 2 range 0 .. 15;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Get_Property_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Format : X_Configuration_Dependent.Card8;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    -- of additional bytes
	    Property_Type : X_Lib.Atoms.Atom;
	    Bytes_After : X_Configuration_Dependent.Card32;
	    N_Item : X_Configuration_Dependent.Card32;
	    -- # of 8, 16, or 32-bit entities in reply
	    Pad1 : X_Configuration_Dependent.Card32;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	end record;

    for X_Get_Property_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Format at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Property_Type at 2 * Word_Size range 0 .. 31;
	    Bytes_After at 3 * Word_Size range 0 .. 31;
	    N_Item at 4 * Word_Size range 0 .. 31;
	    Pad1 at 5 * Word_Size range 0 .. 31;
	    Pad2 at 6 * Word_Size range 0 .. 31;
	    Pad3 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_List_Properties_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    N_Properties : X_Configuration_Dependent.Card16;
	    Pad2 : X_Configuration_Dependent.Card16;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_List_Properties_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    N_Properties at 2 * Word_Size range 0 .. 15;
	    Pad2 at 2 * Word_Size + 2 range 0 .. 15;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Get_Selection_Owner_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 0
	    Owner : X_Lib.Window;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	end record;

    for X_Get_Selection_Owner_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Owner at 2 * Word_Size range 0 .. 31;
	    Pad2 at 3 * Word_Size range 0 .. 31;
	    Pad3 at 4 * Word_Size range 0 .. 31;
	    Pad4 at 5 * Word_Size range 0 .. 31;
	    Pad5 at 6 * Word_Size range 0 .. 31;
	    Pad6 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Grab_Pointer_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Status : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 0
	    Pad1 : X_Configuration_Dependent.Card32;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	end record;

    for X_Grab_Pointer_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Status at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad1 at 2 * Word_Size range 0 .. 31;
	    Pad2 at 3 * Word_Size range 0 .. 31;
	    Pad3 at 4 * Word_Size range 0 .. 31;
	    Pad4 at 5 * Word_Size range 0 .. 31;
	    Pad5 at 6 * Word_Size range 0 .. 31;
	    Pad6 at 7 * Word_Size range 0 .. 31;
	end record;

    subtype X_Grab_Keyboard_Reply is X_Grab_Pointer_Reply;

    type X_Query_Pointer_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Same_Screen : X_Configuration_Dependent.Bool;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 0
	    Root : X_Lib.Window;
	    Child : X_Lib.Window;
	    Root_X : X_Lib.Millimeters;
	    Root_Y : X_Lib.Millimeters;
	    Win_X : X_Lib.Millimeters;
	    Win_Y : X_Lib.Millimeters;
	    Mask : X_Configuration_Dependent.Card16;
	    Pad1 : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card32;
	end record;
    for X_Query_Pointer_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Same_Screen at 1 * Word_Size range 0 .. 31;
	    Sequence_Number at 2 * Word_Size range 0 .. 15;
	    Length at 3 * Word_Size range 0 .. 31;
	    Root at 4 * Word_Size range 0 .. 31;
	    Child at 5 * Word_Size range 0 .. 31;
	    Root_X at 6 * Word_Size range 0 .. 15;
	    Root_Y at 6 * Word_Size + 2 range 0 .. 15;
	    Win_X at 7 * Word_Size range 0 .. 15;
	    Win_Y at 7 * Word_Size + 2 range 0 .. 15;
	    Mask at 8 * Word_Size range 0 .. 15;
	    Pad1 at 8 * Word_Size + 2 range 0 .. 15;
	    Pad at 9 * Word_Size range 0 .. 31;
	end record;
    type X_Get_Motion_Events_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    N_Events : X_Configuration_Dependent.Card32;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	end record;

    for X_Get_Motion_Events_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    N_Events at 2 * Word_Size range 0 .. 31;
	    Pad2 at 3 * Word_Size range 0 .. 31;
	    Pad3 at 4 * Word_Size range 0 .. 31;
	    Pad4 at 5 * Word_Size range 0 .. 31;
	    Pad5 at 6 * Word_Size range 0 .. 31;
	    Pad6 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Translate_Coords_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Same_Screen : X_Configuration_Dependent.Bool;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32; -- 0
	    Child : X_Lib.Window;
	    Dst_X : X_Lib.Millimeters;
	    Dst_Y : X_Lib.Millimeters;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	end record;
    for X_Translate_Coords_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Same_Screen at 1 * Word_Size range 0 .. 31;
	    Sequence_Number at 2 * Word_Size range 0 .. 15;
	    Length at 3 * Word_Size range 0 .. 31;
	    Child at 4 * Word_Size range 0 .. 31;
	    Dst_X at 5 * Word_Size range 0 .. 15;
	    Dst_Y at 5 * Word_Size + 2 range 0 .. 15;
	    Pad2 at 6 * Word_Size range 0 .. 31;
	    Pad3 at 7 * Word_Size range 0 .. 31;
	    Pad4 at 8 * Word_Size range 0 .. 31;
	    Pad5 at 9 * Word_Size range 0 .. 31;
	end record;
    type X_Get_Input_Focus_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Revert_To : X_Configuration_Dependent.Card8;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 0
	    Focus : X_Lib.Window;
	    Pad1 : X_Configuration_Dependent.Card32;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	end record;

    for X_Get_Input_Focus_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Revert_To at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Focus at 2 * Word_Size range 0 .. 31;
	    Pad1 at 3 * Word_Size range 0 .. 31;
	    Pad2 at 4 * Word_Size range 0 .. 31;
	    Pad3 at 5 * Word_Size range 0 .. 31;
	    Pad4 at 6 * Word_Size range 0 .. 31;
	    Pad5 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Query_Keymap_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    -- 2, NOT 0; this is an extra-large reply
	    Map : X_Lib.Byte_Array (1 .. 32);
	end record;

    for X_Query_Keymap_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Map at 2 * Word_Size range 0 .. 8 * 32 - 1;
	end record;

    type X_Char_Info_Ptr is access X_Char_Info;
    for X_Char_Info_Ptr'Storage_Size use 0;
-- Warning: this MUST match (up to component renaming) xList_FontsWithInfo_Reply
    type X_Query_Font_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    -- definitely > 0, even if "nCharInfos" is 0
	    Min_Bounds : X_Char_Info_Ptr;
	    Walign1 : X_Configuration_Dependent.Card32;
	    Max_Bounds : X_Char_Info_Ptr;
	    Walign2 : X_Configuration_Dependent.Card32;
	    Min_Char_Or_Byte2 : X_Configuration_Dependent.Card16;
	    Max_Char_Or_Byte2 : X_Configuration_Dependent.Card16;
	    Default_Char : X_Configuration_Dependent.Card16;
	    N_Font_Props : X_Configuration_Dependent.Card16;
	    -- followed by this many xFontProp structures
	    Draw_Direction : X_Configuration_Dependent.Card8;
	    Min_Byte1 : X_Configuration_Dependent.Card8;
	    Max_Byte1 : X_Configuration_Dependent.Card8;
	    All_Chars_Exist : X_Configuration_Dependent.Bool;
	    Font_Ascent : X_Lib.Millimeters;
	    Font_Descent : X_Lib.Millimeters;
	    N_Char_Infos : X_Configuration_Dependent.Card32;
	    -- followed by this many xCharInfo structures
	end record;

    for X_Query_Font_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Min_Bounds at 2 * Word_Size range 0 .. 31;
	    Walign1 at 3 * Word_Size range 0 .. 31;
	    Max_Bounds at 4 * Word_Size range 0 .. 31;
	    Walign2 at 5 * Word_Size range 0 .. 31;
	    Min_Char_Or_Byte2 at 6 * Word_Size range 0 .. 15;
	    Max_Char_Or_Byte2 at 6 * Word_Size + 2 range 0 .. 15;
	    Default_Char at 7 * Word_Size range 0 .. 15;
	    N_Font_Props at 7 * Word_Size + 2 range 0 .. 15;
	    Draw_Direction at 8 * Word_Size range 0 .. 7;
	    Min_Byte1 at 8 * Word_Size + 1 range 0 .. 7;
	    Max_Byte1 at 8 * Word_Size + 2 range 0 .. 7;
	    All_Chars_Exist at 9 * Word_Size range 0 .. 31;
	    Font_Ascent at 10 * Word_Size range 0 .. 15;
	    Font_Descent at 10 * Word_Size + 2 range 0 .. 15;
	    N_Char_Infos at 11 * Word_Size range 0 .. 31;
	end record;

    type X_Query_Text_Extents_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X__Reply
	    Draw_Direction : X_Configuration_Dependent.Card8;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 0
	    Font_Ascent : X_Lib.Millimeters;
	    Font_Descent : X_Lib.Millimeters;
	    Over_All_Ascent : X_Lib.Millimeters;
	    Over_All_Descent : X_Lib.Millimeters;
	    Over_All_Width : X_Lib.X_Long_Integer;
	    Over_All_Left : X_Lib.X_Long_Integer;
	    Over_All_Right : X_Lib.X_Long_Integer;
	    Pad : X_Configuration_Dependent.Card32;
	end record;

    for X_Query_Text_Extents_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Draw_Direction at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Font_Ascent at 2 * Word_Size range 0 .. 15;
	    Font_Descent at 2 * Word_Size + 2 range 0 .. 15;
	    Over_All_Ascent at 3 * Word_Size range 0 .. 15;
	    Over_All_Descent at 3 * Word_Size + 2 range 0 .. 15;
	    Over_All_Width at 4 * Word_Size range 0 .. 31;
	    Over_All_Left at 5 * Word_Size range 0 .. 31;
	    Over_All_Right at 6 * Word_Size range 0 .. 31;
	    Pad at 7 * Word_Size range 0 .. 31;
	end record;

    type X_List_Fonts_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    N_Fonts : X_Configuration_Dependent.Card16;
	    Pad2 : X_Configuration_Dependent.Card16;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_List_Fonts_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    N_Fonts at 2 * Word_Size range 0 .. 15;
	    Pad2 at 2 * Word_Size + 2 range 0 .. 15;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

-- Warning: this MUST match (up to component renaming) xQuery_Font_Reply
    type X_List_Fonts_With_Info_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Name_Length : X_Configuration_Dependent.Card8;
	    -- 0 indicates end-of-reply-sequence
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    -- definitely > 0, even if "nameLength" is 0
	    Min_Bounds : X_Char_Info_Ptr;
	    Walign1 : X_Configuration_Dependent.Card32;
	    Max_Bounds : X_Char_Info_Ptr;
	    Walign2 : X_Configuration_Dependent.Card32;
	    Min_Char_Or_Byte2 : X_Configuration_Dependent.Card16;
	    Max_Char_Or_Byte2 : X_Configuration_Dependent.Card16;
	    Default_Char : X_Configuration_Dependent.Card16;
	    N_Font_Props : X_Configuration_Dependent.Card16;
	    -- followed by this many xFontProp structures
	    Draw_Direction : X_Configuration_Dependent.Card8;
	    Min_Byte1 : X_Configuration_Dependent.Card8;
	    Max_Byte1 : X_Configuration_Dependent.Card8;
	    All_Chars_Exist : X_Configuration_Dependent.Bool;
	    Font_Ascent : X_Lib.Millimeters;
	    Font_Descent : X_Lib.Millimeters;
	    N_Replies : X_Configuration_Dependent.Card32;
	    -- hint as to how many more replies might be coming
	end record;

    for X_List_Fonts_With_Info_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Name_Length at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Min_Bounds at 2 * Word_Size range 0 .. 31;
	    Walign1 at 3 * Word_Size range 0 .. 31;
	    Max_Bounds at 4 * Word_Size range 0 .. 31;
	    Walign2 at 5 * Word_Size range 0 .. 31;
	    Min_Char_Or_Byte2 at 6 * Word_Size range 0 .. 15;
	    Max_Char_Or_Byte2 at 6 * Word_Size + 2 range 0 .. 15;
	    Default_Char at 7 * Word_Size range 0 .. 15;
	    N_Font_Props at 7 * Word_Size + 2 range 0 .. 15;
	    Draw_Direction at 8 * Word_Size range 0 .. 7;
	    Min_Byte1 at 8 * Word_Size + 1 range 0 .. 7;
	    Max_Byte1 at 8 * Word_Size + 2 range 0 .. 7;
	    All_Chars_Exist at 9 * Word_Size range 0 .. 31;
	    Font_Ascent at 10 * Word_Size range 0 .. 15;
	    Font_Descent at 10 * Word_Size + 2 range 0 .. 15;
	    N_Replies at 11 * Word_Size range 0 .. 31;
	end record;

    type X_Get_Font_Path_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    N_Paths : X_Configuration_Dependent.Card16;
	    Pad2 : X_Configuration_Dependent.Card16;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_Get_Font_Path_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    N_Paths at 2 * Word_Size range 0 .. 15;
	    Pad2 at 2 * Word_Size + 2 range 0 .. 15;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Get_Image_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Depth : X_Configuration_Dependent.Card8;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Visual_Id : X_Lib.Visual;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_Get_Image_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Depth at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Visual_Id at 2 * Word_Size range 0 .. 31;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_List_Installed_Color_Maps_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    N_Color_Maps : X_Configuration_Dependent.Card16;
	    Pad2 : X_Configuration_Dependent.Card16;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_List_Installed_Color_Maps_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    N_Color_Maps at 2 * Word_Size range 0 .. 15;
	    Pad2 at 2 * Word_Size + 2 range 0 .. 15;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Alloc_Color_Reply is
	record
	    Types : X_Configuration_Dependent.Byte; -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;   -- 0
	    Red : X_Lib.Colors.Rgb_Value_Type;
	    Green : X_Lib.Colors.Rgb_Value_Type;
	    Blue : X_Lib.Colors.Rgb_Value_Type;
	    Pad2 : X_Configuration_Dependent.Card16;
	    Pixel : X_Lib.U_Pixel;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	end record;

    for X_Alloc_Color_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Red at 2 * Word_Size range 0 .. 15;
	    Green at 2 * Word_Size + 2 range 0 .. 15;
	    Blue at 3 * Word_Size range 0 .. 15;
	    Pad2 at 3 * Word_Size + 2 range 0 .. 15;
	    Pixel at 4 * Word_Size range 0 .. 31;
	    Pad3 at 5 * Word_Size range 0 .. 31;
	    Pad4 at 6 * Word_Size range 0 .. 31;
	    Pad5 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Alloc_Named_Color_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 0
	    Pixel : X_Lib.U_Pixel;
	    Exact_Red : X_Lib.Colors.Rgb_Value_Type;
	    Exact_Green : X_Lib.Colors.Rgb_Value_Type;
	    Exact_Blue : X_Lib.Colors.Rgb_Value_Type;
	    Screen_Red : X_Lib.Colors.Rgb_Value_Type;
	    Screen_Green : X_Lib.Colors.Rgb_Value_Type;
	    Screen_Blue : X_Lib.Colors.Rgb_Value_Type;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	end record;

    for X_Alloc_Named_Color_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pixel at 2 * Word_Size range 0 .. 31;
	    Exact_Red at 3 * Word_Size range 0 .. 15;
	    Exact_Green at 3 * Word_Size + 2 range 0 .. 15;
	    Exact_Blue at 4 * Word_Size range 0 .. 15;
	    Screen_Red at 4 * Word_Size + 2 range 0 .. 15;
	    Screen_Green at 5 * Word_Size range 0 .. 15;
	    Screen_Blue at 5 * Word_Size + 2 range 0 .. 15;
	    Pad2 at 6 * Word_Size range 0 .. 31;
	    Pad3 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Alloc_Color_Cells_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    N_Pixels : X_Configuration_Dependent.Card16;
	    N_Masks : X_Configuration_Dependent.Card16;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_Alloc_Color_Cells_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    N_Pixels at 2 * Word_Size range 0 .. 15;
	    N_Masks at 2 * Word_Size + 2 range 0 .. 15;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Alloc_Color_Planes_Reply is
	record
	    Types : X_Configuration_Dependent.Byte; -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    N_Pixels : X_Configuration_Dependent.Card16;
	    Pad2 : X_Configuration_Dependent.Card16;
	    Red_Mask : X_Lib.Plane_Mask;
	    Green_Mask : X_Lib.Plane_Mask;
	    Blue_Mask : X_Lib.Plane_Mask;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	end record;

    for X_Alloc_Color_Planes_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    N_Pixels at 2 * Word_Size range 0 .. 15;
	    Pad2 at 2 * Word_Size + 2 range 0 .. 15;
	    Red_Mask at 3 * Word_Size range 0 .. 31;
	    Green_Mask at 4 * Word_Size range 0 .. 31;
	    Blue_Mask at 5 * Word_Size range 0 .. 31;
	    Pad3 at 6 * Word_Size range 0 .. 31;
	    Pad4 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Query_Colors_Reply is
	record
	    Types : X_Configuration_Dependent.Byte; -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    N_Colors : X_Configuration_Dependent.Card16;
	    Pad2 : X_Configuration_Dependent.Card16;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_Query_Colors_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    N_Colors at 2 * Word_Size range 0 .. 15;
	    Pad2 at 2 * Word_Size + 2 range 0 .. 15;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Lookup_Color_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 0
	    Exact_Red : X_Lib.Colors.Rgb_Value_Type;
	    Exact_Green : X_Lib.Colors.Rgb_Value_Type;
	    Exact_Blue : X_Lib.Colors.Rgb_Value_Type;
	    Screen_Red : X_Lib.Colors.Rgb_Value_Type;
	    Screen_Green : X_Lib.Colors.Rgb_Value_Type;
	    Screen_Blue : X_Lib.Colors.Rgb_Value_Type;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	end record;

    for X_Lookup_Color_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Exact_Red at 2 * Word_Size range 0 .. 15;
	    Exact_Green at 2 * Word_Size + 2 range 0 .. 15;
	    Exact_Blue at 3 * Word_Size range 0 .. 15;
	    Screen_Red at 3 * Word_Size + 2 range 0 .. 15;
	    Screen_Green at 4 * Word_Size range 0 .. 15;
	    Screen_Blue at 4 * Word_Size + 2 range 0 .. 15;
	    Pad3 at 5 * Word_Size range 0 .. 31;
	    Pad4 at 6 * Word_Size range 0 .. 31;
	    Pad5 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Query_Best_Size_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 0
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_Query_Best_Size_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Width at 2 * Word_Size range 0 .. 15;
	    Height at 2 * Word_Size + 2 range 0 .. 15;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Query_Extension_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32; -- 0
	    Present : X_Configuration_Dependent.Bool;
	    Major_Op_Code : X_Configuration_Dependent.Card8;
	    First_Event : X_Configuration_Dependent.Card8;
	    First_Error : X_Configuration_Dependent.Card8;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_Query_Extension_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Present at 2 * Word_Size range 0 .. 31;
	    Major_Op_Code at 3 * Word_Size range 0 .. 7;
	    First_Event at 3 * Word_Size + 1 range 0 .. 7;
	    First_Error at 3 * Word_Size + 2 range 0 .. 7;
	    Pad3 at 4 * Word_Size range 0 .. 31;
	    Pad4 at 5 * Word_Size range 0 .. 31;
	    Pad5 at 6 * Word_Size range 0 .. 31;
	    Pad6 at 7 * Word_Size range 0 .. 31;
	    Pad7 at 8 * Word_Size range 0 .. 31;
	end record;

    type X_List_Extensions_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    N_Extensions : X_Configuration_Dependent.Card8;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_List_Extensions_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    N_Extensions at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad2 at 2 * Word_Size range 0 .. 31;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Set_Mapping_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Success : X_Configuration_Dependent.Card8;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_Set_Mapping_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Success at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad2 at 2 * Word_Size range 0 .. 31;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    subtype X_Set_Pointer_Mapping_Reply is X_Set_Mapping_Reply;
    subtype X_Set_Modifier_Mapping_Reply is X_Set_Mapping_Reply;

    type X_Get_Pointer_Mapping_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    N_Elts : X_Configuration_Dependent.Card8;
	    -- how many elements does the map have
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_Get_Pointer_Mapping_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    N_Elts at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad2 at 2 * Word_Size range 0 .. 31;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Get_Keyboard_Mapping_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;
	    Key_Syms_Per_Key_Code : X_Configuration_Dependent.Card8;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_Get_Keyboard_Mapping_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Key_Syms_Per_Key_Code at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad2 at 2 * Word_Size range 0 .. 31;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Get_Modifier_Mapping_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;
	    Num_Key_Per_Modifier : X_Configuration_Dependent.Card8;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad1 : X_Configuration_Dependent.Card32;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	end record;

    for X_Get_Modifier_Mapping_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Num_Key_Per_Modifier at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad1 at 2 * Word_Size range 0 .. 31;
	    Pad2 at 3 * Word_Size range 0 .. 31;
	    Pad3 at 4 * Word_Size range 0 .. 31;
	    Pad4 at 5 * Word_Size range 0 .. 31;
	    Pad5 at 6 * Word_Size range 0 .. 31;
	    Pad6 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Get_Keyboard_Control_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X__Reply
	    Global_Auto_Repeat : X_Lib.Keyboard.Auto_Repeat_Mode_Type;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 5
	    Led_Mask : X_Lib.Keyboard.Led_Mask_Type;
	    Key_Click_Percent : X_Configuration_Dependent.Card8;
	    Bell_Percent : X_Configuration_Dependent.Card8;
	    Bell_Pitch : X_Configuration_Dependent.Card16;
	    Bell_Duration : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	    Map : X_Lib.Byte_Array (1 .. 32); -- bit masks start here
	end record;
    for X_Get_Keyboard_Control_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Global_Auto_Repeat at 1 * Word_Size range 0 .. 31;
	    Sequence_Number at 2 * Word_Size range 0 .. 15;
	    Length at 3 * Word_Size range 0 .. 31;
	    Led_Mask at 4 * Word_Size range 0 .. 31;
	    Key_Click_Percent at 5 * Word_Size range 0 .. 7;
	    Bell_Percent at 5 * Word_Size + 1 range 0 .. 7;
	    Bell_Pitch at 5 * Word_Size + 2 range 0 .. 15;
	    Bell_Duration at 6 * Word_Size range 0 .. 15;
	    Pad at 6 * Word_Size + 2 range 0 .. 15;
	    Map at 7 * Word_Size range 0 .. 8 * 32 - 1;
	end record;
    type X_Get_Pointer_Control_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 0
	    Accel_Numerator : X_Configuration_Dependent.Card16;
	    Accel_Denominator : X_Configuration_Dependent.Card16;
	    Threshold : X_Configuration_Dependent.Card16;
	    Pad2 : X_Configuration_Dependent.Card16;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	end record;

    for X_Get_Pointer_Control_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Accel_Numerator at 2 * Word_Size range 0 .. 15;
	    Accel_Denominator at 2 * Word_Size + 2 range 0 .. 15;
	    Threshold at 3 * Word_Size range 0 .. 15;
	    Pad2 at 3 * Word_Size + 2 range 0 .. 15;
	    Pad3 at 4 * Word_Size range 0 .. 31;
	    Pad4 at 5 * Word_Size range 0 .. 31;
	    Pad5 at 6 * Word_Size range 0 .. 31;
	    Pad6 at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Get_Screen_Saver_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Pad1 : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 0
	    Time_Out : X_Configuration_Dependent.Card16;
	    Interval : X_Configuration_Dependent.Card16;
	    Prefer_Blanking : X_Configuration_Dependent.Bool;
	    Allow_Exposures : X_Configuration_Dependent.Bool;
	    Pad2 : X_Configuration_Dependent.Card16;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	end record;
    for X_Get_Screen_Saver_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Pad1 at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Time_Out at 2 * Word_Size range 0 .. 15;
	    Interval at 2 * Word_Size + 2 range 0 .. 15;
	    Prefer_Blanking at 3 * Word_Size range 0 .. 31;
	    Allow_Exposures at 4 * Word_Size range 0 .. 31;
	    Pad2 at 5 * Word_Size range 0 .. 15;
	    Pad3 at 6 * Word_Size range 0 .. 31;
	    Pad4 at 7 * Word_Size range 0 .. 31;
	    Pad5 at 8 * Word_Size range 0 .. 31;
	    Pad6 at 9 * Word_Size range 0 .. 31;
	end record;
    type X_List_Hosts_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;  -- X__Reply
	    Enabled : X_Configuration_Dependent.Bool;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    N_Hosts : X_Configuration_Dependent.Card16;
	    Pad1 : X_Configuration_Dependent.Card16;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;
    for X_List_Hosts_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Enabled at 1 * Word_Size range 0 .. 31;
	    Sequence_Number at 2 * Word_Size range 0 .. 15;
	    Length at 3 * Word_Size range 0 .. 31;
	    N_Hosts at 4 * Word_Size range 0 .. 15;
	    Pad1 at 4 * Word_Size + 2 range 0 .. 15;
	    Pad3 at 5 * Word_Size range 0 .. 31;
	    Pad4 at 6 * Word_Size range 0 .. 31;
	    Pad5 at 7 * Word_Size range 0 .. 31;
	    Pad6 at 8 * Word_Size range 0 .. 31;
	    Pad7 at 9 * Word_Size range 0 .. 31;
	end record;

    -- ****************************************************************
    -- * Xerror
    -- *    All errors  are 32 bytes
    -- *****************************************************************/

    type X_Error is
	record
	    Types : X_Configuration_Dependent.Byte;     -- X_Error
	    Error_Code : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Resource_Id : X_Configuration_Dependent.Card32;
	    Minor_Code : X_Configuration_Dependent.Card16;
	    Major_Code : X_Configuration_Dependent.Card8;
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	    Pad5 : X_Configuration_Dependent.Card32;
	    Pad6 : X_Configuration_Dependent.Card32;
	    Pad7 : X_Configuration_Dependent.Card32;
	end record;

    for X_Error use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Error_Code at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Resource_Id at 1 * Word_Size range 0 .. 31;
	    Minor_Code at 2 * Word_Size range 0 .. 15;
	    Major_Code at 2 * Word_Size + 2 range 0 .. 7;
	    Pad1 at 2 * Word_Size + 3 range 0 .. 7;
	    Pad3 at 3 * Word_Size range 0 .. 31;
	    Pad4 at 4 * Word_Size range 0 .. 31;
	    Pad5 at 5 * Word_Size range 0 .. 31;
	    Pad6 at 6 * Word_Size range 0 .. 31;
	    Pad7 at 7 * Word_Size range 0 .. 31;
	end record;

    -- ****************************************************************
    -- * xEvent
    -- *    All events are 32 bytes
    -- *****************************************************************

    type Message_Type is (L, S, B);

    type Event_Types is (U, Key_Button_Pointer, Enter_Leave, Focus,
			 Expose, Graphics_Exposure, No_Exposure,
			 Visibility, Create_Notify, Destroy_Notify,
			 Unmap_Notify, Map_Notify, Map_Request,
			 Reparent, Configure_Notify, Configure_Request,
			 Gravity, Resize_Request, Circulate, Property,
			 Selection_Clear, Selection_Request, Selection_Notify,
			 Color_Map, Mapping_Notify, Client_Message);

    type U_Record is
	record
	    Types : X_Configuration_Dependent.Byte;
	    Detail : X_Configuration_Dependent.Byte;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	end record;

    for U_Record use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Detail at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    type Key_Button_Pointer_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Time : X_Lib.Time;
	    Root : X_Lib.Window;
	    Event : X_Lib.Window;
	    Child : X_Lib.Window;
	    Root_X : X_Lib.Millimeters;
	    Root_Y : X_Lib.Millimeters;
	    Event_X : X_Lib.Millimeters;
	    Event_Y : X_Lib.Millimeters;
	    State : Key_But_Mask;
	    Same_Screen : X_Configuration_Dependent.Bool;
	    Pad1 : X_Configuration_Dependent.Byte;
	end record;
    for Key_Button_Pointer_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
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
	    Pad1 at 9 * Word_Size range 0 .. 7;
	end record;
    type Enter_Leave_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Time : X_Lib.Time;
	    Root : X_Lib.Window;
	    Event : X_Lib.Window;
	    Child : X_Lib.Window;
	    Root_X : X_Lib.Millimeters;
	    Root_Y : X_Lib.Millimeters;
	    Event_X : X_Lib.Millimeters;
	    Event_Y : X_Lib.Millimeters;
	    State : Key_But_Mask;
	    Mode : X_Configuration_Dependent.Byte;-- really XMode
	    Flags : X_Configuration_Dependent.Byte;
	    -- same_Screen and focus booleans, packed together
	    El_Flag_Focus : X_Configuration_Dependent.Int := 1;
	    El_Flag_Same_Screen : X_Configuration_Dependent.Int := 2;
	end record;

    for Enter_Leave_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Time at 1 * Word_Size range 0 .. 31;
	    Root at 2 * Word_Size range 0 .. 31;
	    Event at 3 * Word_Size range 0 .. 31;
	    Child at 4 * Word_Size range 0 .. 31;
	    Root_X at 5 * Word_Size range 0 .. 15;
	    Root_Y at 5 * Word_Size + 2 range 0 .. 15;
	    Event_X at 6 * Word_Size range 0 .. 15;
	    Event_Y at 6 * Word_Size + 2 range 0 .. 15;
	    State at 7 * Word_Size range 0 .. 15;
	    Mode at 7 * Word_Size + 2 range 0 .. 7;
	    Flags at 7 * Word_Size + 3 range 0 .. 7;
	    El_Flag_Focus at 8 * Word_Size range 0 .. 31;
	    El_Flag_Same_Screen at 9 * Word_Size range 0 .. 31;
	end record;

    type Focus_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Window : X_Lib.Window;
	    Mode : X_Configuration_Dependent.Byte;   -- really XMode
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	    Pad3 : X_Configuration_Dependent.Byte;
	end record;

    for Focus_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Window at 1 * Word_Size range 0 .. 31;
	    Mode at 2 * Word_Size range 0 .. 7;
	    Pad1 at 2 * Word_Size + 1 range 0 .. 7;
	    Pad2 at 2 * Word_Size + 2 range 0 .. 7;
	    Pad3 at 2 * Word_Size + 3 range 0 .. 7;
	end record;

    type Expose_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Window : X_Lib.Window;
	    X : X_Configuration_Dependent.Card16;
	    Y : X_Configuration_Dependent.Card16;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	    Count : X_Configuration_Dependent.Card16;
	    Pad2 : X_Configuration_Dependent.Card16;
	end record;

    for Expose_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Window at 1 * Word_Size range 0 .. 31;
	    X at 2 * Word_Size range 0 .. 15;
	    Y at 2 * Word_Size + 2 range 0 .. 15;
	    Width at 3 * Word_Size range 0 .. 15;
	    Height at 3 * Word_Size + 2 range 0 .. 15;
	    Count at 4 * Word_Size range 0 .. 15;
	    Pad2 at 4 * Word_Size + 2 range 0 .. 15;
	end record;

    type Graphics_Exposure_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Drawable : X_Lib.Drawable;
	    X : X_Configuration_Dependent.Card16;
	    Y : X_Configuration_Dependent.Card16;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	    Minor_Event : X_Configuration_Dependent.Card16;
	    Count : X_Configuration_Dependent.Card16;
	    Major_Event : X_Configuration_Dependent.Byte;
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	    Pad3 : X_Configuration_Dependent.Byte;
	end record;

    for Graphics_Exposure_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Drawable at 1 * Word_Size range 0 .. 31;
	    X at 2 * Word_Size range 0 .. 15;
	    Y at 2 * Word_Size + 2 range 0 .. 15;
	    Width at 3 * Word_Size range 0 .. 15;
	    Height at 3 * Word_Size + 2 range 0 .. 15;
	    Minor_Event at 4 * Word_Size range 0 .. 15;
	    Count at 4 * Word_Size + 2 range 0 .. 15;
	    Major_Event at 5 * Word_Size range 0 .. 7;
	    Pad1 at 5 * Word_Size + 1 range 0 .. 7;
	    Pad2 at 5 * Word_Size + 2 range 0 .. 7;
	    Pad3 at 5 * Word_Size + 3 range 0 .. 7;
	end record;

    type No_Exposure_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Drawable : X_Lib.Drawable;
	    Minor_Event : X_Configuration_Dependent.Card16;
	    Major_Event : X_Configuration_Dependent.Byte;
	    B_Pad : X_Configuration_Dependent.Byte;
	end record;

    for No_Exposure_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Drawable at 1 * Word_Size range 0 .. 31;
	    Minor_Event at 2 * Word_Size range 0 .. 15;
	    Major_Event at 2 * Word_Size + 2 range 0 .. 7;
	    B_Pad at 2 * Word_Size + 3 range 0 .. 7;
	end record;

    type Visibility_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Window : X_Lib.Window;
	    State : X_Configuration_Dependent.Card8;
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	    Pad3 : X_Configuration_Dependent.Byte;
	end record;

    for Visibility_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Window at 1 * Word_Size range 0 .. 31;
	    State at 2 * Word_Size range 0 .. 7;
	    Pad1 at 2 * Word_Size + 1 range 0 .. 7;
	    Pad2 at 2 * Word_Size + 2 range 0 .. 7;
	    Pad3 at 2 * Word_Size + 3 range 0 .. 7;
	end record;

    type Create_Notify_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Parent : X_Lib.Window;
	    Window : X_Lib.Window;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	    Border_Width : X_Configuration_Dependent.Card16;
	    Over_Ride : X_Configuration_Dependent.Bool;
	    B_Pad : X_Configuration_Dependent.Byte;
	end record;
    for Create_Notify_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Parent at 1 * Word_Size range 0 .. 31;
	    Window at 2 * Word_Size range 0 .. 31;
	    X at 3 * Word_Size range 0 .. 15;
	    Y at 3 * Word_Size + 2 range 0 .. 15;
	    Width at 4 * Word_Size range 0 .. 15;
	    Height at 4 * Word_Size + 2 range 0 .. 15;
	    Border_Width at 5 * Word_Size range 0 .. 15;
	    Over_Ride at 6 * Word_Size range 0 .. 31;
	    B_Pad at 7 * Word_Size range 0 .. 7;
	end record;
    type Destroy_Notify_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Event : X_Lib.Window;
	    Window : X_Lib.Window;
	end record;

    for Destroy_Notify_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Window at 2 * Word_Size range 0 .. 31;
	end record;

    type Unmap_Notify_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Event : X_Lib.Window;
	    Window : X_Lib.Window;
	    From_Configure : X_Configuration_Dependent.Bool;
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	    Pad3 : X_Configuration_Dependent.Byte;
	end record;

    for Unmap_Notify_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Window at 2 * Word_Size range 0 .. 31;
	    From_Configure at 3 * Word_Size range 0 .. 31;
	    Pad1 at 4 * Word_Size range 0 .. 7;
	    Pad2 at 4 * Word_Size + 1 range 0 .. 7;
	    Pad3 at 4 * Word_Size + 2 range 0 .. 7;
	end record;

    type Map_Notify_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Event : X_Lib.Window;
	    Window : X_Lib.Window;
	    Override : X_Configuration_Dependent.Bool;
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	    Pad3 : X_Configuration_Dependent.Byte;
	end record;

    for Map_Notify_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Window at 2 * Word_Size range 0 .. 31;
	    Override at 3 * Word_Size range 0 .. 31;
	    Pad1 at 4 * Word_Size range 0 .. 7;
	    Pad2 at 4 * Word_Size + 1 range 0 .. 7;
	    Pad3 at 4 * Word_Size + 2 range 0 .. 7;
	end record;

    type Map_Request_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Parent : X_Lib.Window;
	    Window : X_Lib.Window;
	end record;

    for Map_Request_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Parent at 1 * Word_Size range 0 .. 31;
	    Window at 2 * Word_Size range 0 .. 31;
	end record;

    type Reparent_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Event : X_Lib.Window;
	    Window : X_Lib.Window;
	    Parent : X_Lib.Window;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;
	    Over_Ride : X_Configuration_Dependent.Bool;
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	    Pad3 : X_Configuration_Dependent.Byte;
	end record;

    for Reparent_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Window at 2 * Word_Size range 0 .. 31;
	    Parent at 3 * Word_Size range 0 .. 31;
	    X at 4 * Word_Size range 0 .. 15;
	    Y at 4 * Word_Size + 2 range 0 .. 15;
	    Over_Ride at 5 * Word_Size range 0 .. 31;
	    Pad1 at 6 * Word_Size range 0 .. 7;
	    Pad2 at 6 * Word_Size + 1 range 0 .. 7;
	    Pad3 at 6 * Word_Size + 2 range 0 .. 7;
	end record;

    type Configure_Notify_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Event : X_Lib.Window;
	    Window : X_Lib.Window;
	    Above_Sibling : X_Lib.Window;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	    Border_Width : X_Configuration_Dependent.Card16;
	    Over_Ride : X_Configuration_Dependent.Bool;
	    B_Pad : X_Configuration_Dependent.Byte;
	end record;
    for Configure_Notify_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Window at 2 * Word_Size range 0 .. 31;
	    Above_Sibling at 3 * Word_Size range 0 .. 31;
	    X at 4 * Word_Size range 0 .. 15;
	    Y at 4 * Word_Size + 2 range 0 .. 15;
	    Width at 5 * Word_Size range 0 .. 15;
	    Height at 5 * Word_Size + 2 range 0 .. 15;
	    Border_Width at 6 * Word_Size range 0 .. 15;
	    Over_Ride at 7 * Word_Size range 0 .. 31;
	    B_Pad at 8 * Word_Size range 0 .. 7;
	end record;
    type Configure_Request_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Parent : X_Lib.Window;
	    Window : X_Lib.Window;
	    Sibling : X_Lib.Window;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	    Border_Width : X_Configuration_Dependent.Card16;
	    Value_Mask : X_Configuration_Dependent.Card16;
	    Pad1 : X_Configuration_Dependent.Card32;
	end record;

    for Configure_Request_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Parent at 1 * Word_Size range 0 .. 31;
	    Window at 2 * Word_Size range 0 .. 31;
	    Sibling at 3 * Word_Size range 0 .. 31;
	    X at 4 * Word_Size range 0 .. 15;
	    Y at 4 * Word_Size + 2 range 0 .. 15;
	    Width at 5 * Word_Size range 0 .. 15;
	    Height at 5 * Word_Size + 2 range 0 .. 15;
	    Border_Width at 6 * Word_Size range 0 .. 15;
	    Value_Mask at 6 * Word_Size + 2 range 0 .. 15;
	    Pad1 at 7 * Word_Size range 0 .. 31;
	end record;

    type Gravity_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Event : X_Lib.Window;
	    Window : X_Lib.Window;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;
	    Pad1 : X_Configuration_Dependent.Card32;
	    Pad2 : X_Configuration_Dependent.Card32;
	    Pad3 : X_Configuration_Dependent.Card32;
	    Pad4 : X_Configuration_Dependent.Card32;
	end record;

    for Gravity_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Window at 2 * Word_Size range 0 .. 31;
	    X at 3 * Word_Size range 0 .. 15;
	    Y at 3 * Word_Size + 2 range 0 .. 15;
	    Pad1 at 4 * Word_Size range 0 .. 31;
	    Pad2 at 5 * Word_Size range 0 .. 31;
	    Pad3 at 6 * Word_Size range 0 .. 31;
	    Pad4 at 7 * Word_Size range 0 .. 31;
	end record;

    type Resize_Request_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Window : X_Lib.Window;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	end record;

    for Resize_Request_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Window at 1 * Word_Size range 0 .. 31;
	    Width at 2 * Word_Size range 0 .. 15;
	    Height at 2 * Word_Size + 2 range 0 .. 15;
	end record;

-- The event field in the circulate record is really the parent when this
-- is used as a Circulate_Request insteaad of a CircluateNotify

    type Circulate_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Event : X_Lib.Window;
	    Window : X_Lib.Window;
	    Parent : X_Lib.Window;
	    Place : X_Configuration_Dependent.Byte;   -- Top or Bottom
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	    Pad3 : X_Configuration_Dependent.Byte;
	end record;

    for Circulate_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Window at 2 * Word_Size range 0 .. 31;
	    Parent at 3 * Word_Size range 0 .. 31;
	    Place at 4 * Word_Size range 0 .. 7;
	    Pad1 at 4 * Word_Size + 1 range 0 .. 7;
	    Pad2 at 4 * Word_Size + 2 range 0 .. 7;
	    Pad3 at 4 * Word_Size + 3 range 0 .. 7;
	end record;

    type Property_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Window : X_Lib.Window;
	    Atom : X_Lib.Atoms.Atom;
	    Time : X_Lib.Time;
	    State : X_Configuration_Dependent.Byte;  -- NewValue or Deleted
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Card16;
	end record;

    for Property_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Window at 1 * Word_Size range 0 .. 31;
	    Atom at 2 * Word_Size range 0 .. 31;
	    Time at 3 * Word_Size range 0 .. 31;
	    State at 4 * Word_Size range 0 .. 7;
	    Pad1 at 4 * Word_Size + 1 range 0 .. 7;
	    Pad2 at 4 * Word_Size + 2 range 0 .. 15;
	end record;

    type Selection_Clear_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Time : X_Lib.Time;
	    Window : X_Lib.Window;
	    Atom : X_Lib.Atoms.Atom;
	end record;

    for Selection_Clear_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Time at 1 * Word_Size range 0 .. 31;
	    Window at 2 * Word_Size range 0 .. 31;
	    Atom at 3 * Word_Size range 0 .. 31;
	end record;

    type Selection_Request_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Time : X_Lib.Time;
	    Owner : X_Lib.Window;
	    Requestor : X_Lib.Window;
	    Selection : X_Lib.Atoms.Atom;
	    Target : X_Lib.Atoms.Atom;
	    Property : X_Lib.Atoms.Atom;
	end record;

    for Selection_Request_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Time at 1 * Word_Size range 0 .. 31;
	    Owner at 2 * Word_Size range 0 .. 31;
	    Requestor at 3 * Word_Size range 0 .. 31;
	    Selection at 4 * Word_Size range 0 .. 31;
	    Target at 5 * Word_Size range 0 .. 31;
	    Property at 6 * Word_Size range 0 .. 31;
	end record;

    type Selection_Notify_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Time : X_Lib.Time;
	    Requestor : X_Lib.Window;
	    Selection : X_Lib.Atoms.Atom;
	    Target : X_Lib.Atoms.Atom;
	    Property : X_Lib.Atoms.Atom;
	end record;

    for Selection_Notify_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Time at 1 * Word_Size range 0 .. 31;
	    Requestor at 2 * Word_Size range 0 .. 31;
	    Selection at 3 * Word_Size range 0 .. 31;
	    Target at 4 * Word_Size range 0 .. 31;
	    Property at 5 * Word_Size range 0 .. 31;
	end record;

    type Color_Map_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Window : X_Lib.Window;
	    Color_Map : X_Lib.Colors.Color_Map;
	    News : X_Configuration_Dependent.Bool;
	    State : X_Configuration_Dependent.Byte; -- Installed or UnInstalled
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	end record;

    for Color_Map_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Window at 1 * Word_Size range 0 .. 31;
	    Color_Map at 2 * Word_Size range 0 .. 31;
	    News at 3 * Word_Size range 0 .. 31;
	    State at 4 * Word_Size range 0 .. 7;
	    Pad1 at 4 * Word_Size + 1 range 0 .. 7;
	    Pad2 at 4 * Word_Size + 2 range 0 .. 7;
	end record;

    type Mapping_Notify_Record is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Request : X_Configuration_Dependent.Card8;
	    First_Key_Code : X_Lib.Keyboard.Key_Code;
	    Count : X_Configuration_Dependent.Card8;
	    Pad1 : X_Configuration_Dependent.Byte;
	end record;

    for Mapping_Notify_Record use
	record
	    Pad00 at 0 * Word_Size range 0 .. 31;
	    Request at 1 * Word_Size range 0 .. 7;
	    First_Key_Code at 1 * Word_Size + 1 range 0 .. 7;
	    Count at 1 * Word_Size + 2 range 0 .. 7;
	    Pad1 at 1 * Word_Size + 3 range 0 .. 7;
	end record;

    type Int8_Array is array (Natural range <>) of
			  X_Configuration_Dependent.Int8;

    type Client_Message_Record (Msg : Message_Type := L) is
	record
	    Pad00 : X_Configuration_Dependent.Card32;
	    Window : X_Lib.Window;
	    Types : X_Lib.Atoms.Atom;

	    case Msg is
		when L =>
		    Longs0 : X_Lib.X_Long_Integer;
		    Longs1 : X_Lib.X_Long_Integer;
		    Longs2 : X_Lib.X_Long_Integer;
		    Longs3 : X_Lib.X_Long_Integer;
		    Longs4 : X_Lib.X_Long_Integer;
		when S =>
		    Shorts0 : X_Lib.X_Short_Integer;
		    Shorts1 : X_Lib.X_Short_Integer;
		    Shorts2 : X_Lib.X_Short_Integer;
		    Shorts3 : X_Lib.X_Short_Integer;
		    Shorts4 : X_Lib.X_Short_Integer;
		    Shorts5 : X_Lib.X_Short_Integer;
		    Shorts6 : X_Lib.X_Short_Integer;
		    Shorts7 : X_Lib.X_Short_Integer;
		    Shorts8 : X_Lib.X_Short_Integer;
		    Shorts9 : X_Lib.X_Short_Integer;
		when B =>
		    Bytes : Int8_Array (1 .. 20);
	    end case;
	end record;

    type X_Event (Kind : Event_Types := U) is
	record
	    case Kind is
		when U =>
		    U_Rec : U_Record;
		when Key_Button_Pointer =>
		    Key_Button_Pointer_Rec : Key_Button_Pointer_Record;
		when Enter_Leave =>
		    Enter_Leave_Rec : Enter_Leave_Record;
		when Focus =>
		    Focus_Rec : Focus_Record;
		when Expose =>
		    Expose_Rec : Expose_Record;
		when Graphics_Exposure =>
		    Graphic_Expo_Rec : Graphics_Exposure_Record;
		when No_Exposure =>
		    No_Expo_Rec : No_Exposure_Record;
		when Visibility =>
		    Visibility_Rec : Visibility_Record;
		when Create_Notify =>
		    Create_Notify_Rec : Create_Notify_Record;

-- * The event feilds in the structures for DestroyNotify, UnmapNotify,
-- * MapNotify, ReparentNotify, ConfigureNotify, CirclulateNotify,
-- * GravityNotify, must be at the same offset because server internal
-- * code is depending upon this to patch up the events before they are
-- * delivered. Also note that Map_Request, ConfigureRequest and
-- * CirculateRequest have the same offset for the event window.

		when Destroy_Notify =>
		    Destroy_Notify_Rec : Destroy_Notify_Record;
		when Unmap_Notify =>
		    Unmap_Notify_Rec : Unmap_Notify_Record;
		when Map_Notify =>
		    Map_Notify_Rec : Map_Notify_Record;
		when Map_Request =>
		    Map_Request_Rec : Map_Request_Record;
		when Reparent =>
		    Reparent_Rec : Reparent_Record;
		when Configure_Notify =>
		    Configure_Notify_Rec : Configure_Notify_Record;
		when Configure_Request =>
		    Configure_Request_Rec : Configure_Request_Record;
		when Gravity =>
		    Gravity_Rec : Gravity_Record;
		when Resize_Request =>
		    Resize_Request_Rec : Resize_Request_Record;
		when Circulate =>
		    Circulate_Rec : Circulate_Record;
		when Property =>
		    Property_Rec : Property_Record;
		when Selection_Clear =>
		    Selection_Clear_Rec : Selection_Clear_Record;
		when Selection_Request =>
		    Selection_Request_Rec : Selection_Request_Record;
		when Selection_Notify =>
		    Selection_Notify_Rec : Selection_Notify_Record;
		when Color_Map =>
		    Color_Map_Rec : Color_Map_Record;
		when Mapping_Notify =>
		    Mapping_Notify_Rec : Mapping_Notify_Record;
		when Client_Message =>
		    Client_Message_Rec : Client_Message_Record;
	    end case;
	end record;

-- KeymapNotify events are not included in the above union because they
-- are different from all other events: they do not have a "detail" or
-- "sequenceNumber", so there is room for a 248-bit key mask.

    type X_Key_Map_Event is
	record
	    Types : X_Configuration_Dependent.Byte;
	    Map : X_Lib.Byte_Array (1 .. 31);
	end record;

    for X_Key_Map_Event use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Map at 0 * Word_Size + 2 range 0 .. 8 * 31 - 1;
	end record;

-- X_Reply is the union of all the replies above whose "fixed part"
-- fits in 32 bytes.  It does NOT include Get_Window_Attributes_Reply,
-- Query_Font_Reply, QueryKeymapReply, or Get_Keyboard_ControlReply
-- List_FontsWithInfo_Reply

    type Reply_Types is (Generics, Geom, Tree, Atom, Atom_Name, Property,
			 List_Properties, Selection, Grab_Pointer,
			 Grab_Keyboard, Pointer, Motion_Events, Coords,
			 Input_Focus, Text_Extents, Fonts, Font_Path, Image,
			 Color_Maps, Alloc_Color, Alloc_Named_Color,
			 Color_Cells, Color_Planes, Colors, Lookup_Color,
			 Best_Size, Extension, Extensions, Set_Modifier_Mapping,
			 Get_Modifier_Mapping, Set_Pointer_Mapping,
			 Get_Keyboard_Mapping, Get_Pointer_Mapping,
			 Pointer_Control, Screen_Saver, Hosts, Error, Event);

    type X_Reply (Kind : Reply_Types := Generics) is
	record
	    case Kind is
		when Generics =>
		    Generic_Rec : X_Generic_Reply;
		when Geom =>
		    Geom_Rec : X_Get_Geometry_Reply;
		when Tree =>
		    Tree_Rec : X_Query_Tree_Reply;
		when Atom =>
		    Atom_Rec : X_Intern_Atom_Reply;
		when Atom_Name =>
		    Atom_Name_Rec : X_Get_Atom_Name_Reply;
		when Property =>
		    Property_Rec : X_Get_Property_Reply;
		when List_Properties =>
		    List_Properties_Rec : X_List_Properties_Reply;
		when Selection =>
		    Selection_Rec : X_Get_Selection_Owner_Reply;
		when Grab_Pointer =>
		    Grab_Pointer_Rec : X_Grab_Pointer_Reply;
		when Grab_Keyboard =>
		    Grab_Keyboard_Rec : X_Grab_Keyboard_Reply;
		when Pointer =>
		    Pointer_Rec : X_Query_Pointer_Reply;
		when Motion_Events =>
		    Motion_Events_Rec : X_Get_Motion_Events_Reply;
		when Coords =>
		    Coords_Rec : X_Translate_Coords_Reply;
		when Input_Focus =>
		    Input_Focus_Rec : X_Get_Input_Focus_Reply;
		when Text_Extents =>
		    Text_Extents_Rec : X_Query_Text_Extents_Reply;
		when Fonts =>
		    Fonts_Rec : X_List_Fonts_Reply;
		when Font_Path =>
		    Font_Path_Rec : X_Get_Font_Path_Reply;
		when Image =>
		    Image_Rec : X_Get_Image_Reply;
		when Color_Maps =>
		    Colormap_Rec : X_List_Installed_Color_Maps_Reply;
		when Alloc_Color =>
		    Alloc_Color_Rec : X_Alloc_Color_Reply;
		when Alloc_Named_Color =>
		    Alloc_Named_Color_Rec : X_Alloc_Named_Color_Reply;
		when Color_Cells =>
		    Color_Cells_Rec : X_Alloc_Color_Cells_Reply;
		when Color_Planes =>
		    Color_Planes_Rec : X_Alloc_Color_Planes_Reply;
		when Colors =>
		    Colors_Rec : X_Query_Colors_Reply;
		when Lookup_Color =>
		    Lookup_Color_Rec : X_Lookup_Color_Reply;
		when Best_Size =>
		    Best_Size_Rec : X_Query_Best_Size_Reply;
		when Extension =>
		    Extension_Rec : X_Query_Extension_Reply;
		when Extensions =>
		    Extensions_Rec : X_List_Extensions_Reply;
		when Set_Modifier_Mapping =>
		    Set_Modifier_Mapping_Rec : X_Set_Modifier_Mapping_Reply;
		when Get_Modifier_Mapping =>
		    Get_Modifier_Mapping_Rec : X_Get_Modifier_Mapping_Reply;
		when Set_Pointer_Mapping =>
		    Set_Pointer_Mapping_Rec : X_Set_Pointer_Mapping_Reply;
		when Get_Keyboard_Mapping =>
		    Get_Keyboard_Mapping_Rec : X_Get_Keyboard_Mapping_Reply;
		when Get_Pointer_Mapping =>
		    Get_Pointer_Mapping_Rec : X_Get_Pointer_Mapping_Reply;
		when Pointer_Control =>
		    Pointer_Control_Rec : X_Get_Pointer_Control_Reply;
		when Screen_Saver =>
		    Screen_Saver_Rec : X_Get_Screen_Saver_Reply;
		when Hosts =>
		    Hosts_Rec : X_List_Hosts_Reply;
		when Error =>
		    Error_Rec : X_Error;
		when Event =>
		    Event_Rec : X_Event;
	    end case;
	end record;

    -- ****************************************************************
    -- * REQUESTS
    -- *****************************************************************/

    -- Request structure

    type X_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Data : X_Configuration_Dependent.Card8;
	    -- meaning depends on request type
	    Length : X_Configuration_Dependent.Card16;
	    -- length in 4 bytes quantities of whole request, including this header
	end record;

    for X_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Data at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    -- ****************************************************************
    -- *  structures that follow request.
    -- *****************************************************************/

    -- Resource_Req is used for any request which has a resource ID
    -- (or Atom or Time) as its one and only argument.

    type X_Resource_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Id : X_Lib.X_Id;
	    -- a _X_Lib.Window, Drawable, _Font, _GContext, _Pixmap, etc.
	end record;

    for X_Resource_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Id at 1 * Word_Size range 0 .. 31;
	end record;

    type X_Create_Window_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Depth : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Wid : X_Lib.Window;
	    Parent : X_Lib.Window;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	    Border_Width : X_Configuration_Dependent.Card16;
	    Class : X_Configuration_Dependent.Card16;
	    Visual_Id : X_Lib.Visual;
	    Mask : X_Masks.Mask_Type;
	end record;

    for X_Create_Window_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Depth at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Wid at 1 * Word_Size range 0 .. 31;
	    Parent at 2 * Word_Size range 0 .. 31;
	    X at 3 * Word_Size range 0 .. 15;
	    Y at 3 * Word_Size + 2 range 0 .. 15;
	    Width at 4 * Word_Size range 0 .. 15;
	    Height at 4 * Word_Size + 2 range 0 .. 15;
	    Border_Width at 5 * Word_Size range 0 .. 15;
	    Class at 5 * Word_Size + 2 range 0 .. 15;
	    Visual_Id at 6 * Word_Size range 0 .. 31;
	    Mask at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Change_Window_Attributes_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Window : X_Lib.Window;
	    Value_Mask : X_Masks.Mask_Type;
	end record;

    for X_Change_Window_Attributes_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Window at 1 * Word_Size range 0 .. 31;
	    Value_Mask at 2 * Word_Size range 0 .. 31;
	end record;

    type X_Change_Save_Set_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Mode : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Window : X_Lib.Window;
	end record;

    for X_Change_Save_Set_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Mode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Window at 1 * Word_Size range 0 .. 31;
	end record;

    type X_Reparent_Window_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Window : X_Lib.Window;
	    Parent : X_Lib.Window;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;
	end record;

    for X_Reparent_Window_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Window at 1 * Word_Size range 0 .. 31;
	    Parent at 2 * Word_Size range 0 .. 31;
	    X at 3 * Word_Size range 0 .. 15;
	    Y at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Configure_Window_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Window : X_Lib.Window;
	    Mask : X_Configuration_Dependent.Card16;
	    Pad2 : X_Configuration_Dependent.Card16;
	end record;

    for X_Configure_Window_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Window at 1 * Word_Size range 0 .. 31;
	    Mask at 2 * Word_Size range 0 .. 15;
	    Pad2 at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Circulate_Window_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Direction : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Window : X_Lib.Window;
	end record;

    for X_Circulate_Window_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Direction at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Window at 1 * Word_Size range 0 .. 31;
	end record;

    -- followed by padded string
    type X_Intern_Atom_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Only_If_Exists : X_Configuration_Dependent.Bool;
	    Length : X_Configuration_Dependent.Card16;
	    N_Bytes : X_Configuration_Dependent.Card16;
	    -- number of bytes in string
	    Pad : X_Configuration_Dependent.Card16;
	end record;
    for X_Intern_Atom_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Only_If_Exists at 1 * Word_Size range 0 .. 31;
	    Length at 2 * Word_Size range 0 .. 15;
	    N_Bytes at 2 * Word_Size + 2 range 0 .. 15;
	    Pad at 3 * Word_Size range 0 .. 15;
	end record;
    type X_Change_Property_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Mode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Window : X_Lib.Window;
	    Property : X_Lib.Atoms.Atom;
	    Types : X_Lib.Atoms.Atom;
	    Format : X_Configuration_Dependent.Card8;
	    Pad : X_Lib.Byte_Array (1 .. 3);
	    N_Units : X_Configuration_Dependent.Card32;
	    -- length of stuff following, depends on format
	end record;

    for X_Change_Property_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Mode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Window at 1 * Word_Size range 0 .. 31;
	    Property at 2 * Word_Size range 0 .. 31;
	    Types at 3 * Word_Size range 0 .. 31;
	    Format at 4 * Word_Size range 0 .. 7;
	    Pad at 4 * Word_Size + 1 range 0 .. 8 * 3 - 1;
	    N_Units at 5 * Word_Size range 0 .. 31;
	end record;

    type X_Delete_Property_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Window : X_Lib.Window;
	    Property : X_Lib.Atoms.Atom;
	end record;

    for X_Delete_Property_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Window at 1 * Word_Size range 0 .. 31;
	    Property at 2 * Word_Size range 0 .. 31;
	end record;

    type X_Get_Property_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Delete : X_Configuration_Dependent.Bool;
	    Length : X_Configuration_Dependent.Card16;
	    Window : X_Lib.Window;
	    Property : X_Lib.Atoms.Atom;
	    Types : X_Lib.Atoms.Atom;
	    Long_Off_Set : X_Lib.Width_Height;
	    Long_Length : X_Lib.Width_Height;
	end record;
    for X_Get_Property_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Delete at 1 * Word_Size range 0 .. 31;
	    Length at 2 * Word_Size range 0 .. 15;
	    Window at 3 * Word_Size range 0 .. 31;
	    Property at 4 * Word_Size range 0 .. 31;
	    Types at 5 * Word_Size range 0 .. 31;
	    Long_Off_Set at 6 * Word_Size range 0 .. 31;
	    Long_Length at 7 * Word_Size range 0 .. 31;
	end record;
    type X_Set_Selection_Owner_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Window : X_Lib.Window;
	    Selection : X_Lib.Atoms.Atom;
	    Time : X_Lib.Time;
	end record;

    for X_Set_Selection_Owner_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Window at 1 * Word_Size range 0 .. 31;
	    Selection at 2 * Word_Size range 0 .. 31;
	    Time at 3 * Word_Size range 0 .. 31;
	end record;

    type X_Convert_Selection_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Requestor : X_Lib.Window;
	    Selection : X_Lib.Atoms.Atom;
	    Target : X_Lib.Atoms.Atom;
	    Property : X_Lib.Atoms.Atom;
	    Time : X_Lib.Time;
	end record;

    for X_Convert_Selection_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Requestor at 1 * Word_Size range 0 .. 31;
	    Selection at 2 * Word_Size range 0 .. 31;
	    Target at 3 * Word_Size range 0 .. 31;
	    Property at 4 * Word_Size range 0 .. 31;
	    Time at 5 * Word_Size range 0 .. 31;
	end record;

    type X_Event_Ptr is access X_Event;
    for X_Event_Ptr'Storage_Size use 0;
    type X_Send_Event_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Propagate : X_Configuration_Dependent.Bool;
	    Length : X_Configuration_Dependent.Card16;
	    Destination : X_Lib.Window;
	    Event_Mask : X_Lib.Events.Event_Mask_Type;
	    Event : X_Event_Ptr;
	end record;
    for X_Send_Event_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Propagate at 1 * Word_Size range 0 .. 31;
	    Length at 2 * Word_Size range 0 .. 15;
	    Destination at 3 * Word_Size range 0 .. 31;
	    Event_Mask at 4 * Word_Size range 0 .. 31;
	    Event at 5 * Word_Size range 0 .. 31;
	end record;
    type X_Grab_Pointer_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Owner_Events : X_Configuration_Dependent.Bool;
	    Length : X_Configuration_Dependent.Card16;
	    Grab_Window : X_Lib.Window;
	    Event_Mask : X_Configuration_Dependent.Card16;
	    Pointer_Mode : X_Configuration_Dependent.Byte;
	    Keyboard_Mode : X_Configuration_Dependent.Byte;
	    Confine_To : X_Lib.Window;
	    Cursor : X_Lib.Cursors.Cursor;
	    Time : X_Lib.Time;
	end record;
    for X_Grab_Pointer_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Owner_Events at 1 * Word_Size range 0 .. 31;
	    Length at 2 * Word_Size range 0 .. 15;
	    Grab_Window at 3 * Word_Size range 0 .. 31;
	    Event_Mask at 4 * Word_Size range 0 .. 15;
	    Pointer_Mode at 4 * Word_Size + 2 range 0 .. 7;
	    Keyboard_Mode at 4 * Word_Size + 3 range 0 .. 7;
	    Confine_To at 5 * Word_Size range 0 .. 31;
	    Cursor at 6 * Word_Size range 0 .. 31;
	    Time at 7 * Word_Size range 0 .. 31;
	end record;
    type X_Grab_Button_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Owner_Events : X_Configuration_Dependent.Bool;
	    Length : X_Configuration_Dependent.Card16;
	    Grab_Window : X_Lib.Window;
	    Event_Mask : X_Configuration_Dependent.Card16;
	    Pointer_Mode : X_Configuration_Dependent.Byte;
	    Keyboard_Mode : X_Configuration_Dependent.Byte;
	    Confine_To : X_Lib.Window;
	    Cursor : X_Lib.Cursors.Cursor;
	    Button : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Modifiers : X_Configuration_Dependent.Card16;
	end record;
    for X_Grab_Button_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Owner_Events at 1 * Word_Size range 0 .. 31;
	    Length at 2 * Word_Size range 0 .. 15;
	    Grab_Window at 3 * Word_Size range 0 .. 31;
	    Event_Mask at 4 * Word_Size range 0 .. 15;
	    Pointer_Mode at 4 * Word_Size + 2 range 0 .. 7;
	    Keyboard_Mode at 4 * Word_Size + 3 range 0 .. 7;
	    Confine_To at 5 * Word_Size range 0 .. 31;
	    Cursor at 6 * Word_Size range 0 .. 31;
	    Button at 7 * Word_Size range 0 .. 7;
	    Pad at 7 * Word_Size + 1 range 0 .. 7;
	    Modifiers at 7 * Word_Size + 2 range 0 .. 15;
	end record;
    type X_Ungrab_Button_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Button : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Grab_Window : X_Lib.Window;
	    Modifiers : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for X_Ungrab_Button_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Button at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Grab_Window at 1 * Word_Size range 0 .. 31;
	    Modifiers at 2 * Word_Size range 0 .. 15;
	    Pad at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Change_Active_Pointer_Grab_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Cursor : X_Lib.Cursors.Cursor;
	    Time : X_Lib.Time;
	    Event_Mask : X_Configuration_Dependent.Card16;
	    Pad2 : X_Configuration_Dependent.Card16;
	end record;

    for X_Change_Active_Pointer_Grab_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Cursor at 1 * Word_Size range 0 .. 31;
	    Time at 2 * Word_Size range 0 .. 31;
	    Event_Mask at 3 * Word_Size range 0 .. 15;
	    Pad2 at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Grab_Keyboard_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Owner_Events : X_Configuration_Dependent.Bool;
	    Length : X_Configuration_Dependent.Card16;
	    Grab_Window : X_Lib.Window;
	    Time : X_Lib.Time;
	    Pointer_Mode : X_Lib.Keyboard.Key_Code;
	    Keyboard_Mode : X_Lib.Keyboard.Key_Code;
	    Pad : X_Configuration_Dependent.Card16;
	end record;
    for X_Grab_Keyboard_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Owner_Events at 1 * Word_Size range 0 .. 31;
	    Length at 2 * Word_Size range 0 .. 15;
	    Grab_Window at 3 * Word_Size range 0 .. 31;
	    Time at 4 * Word_Size range 0 .. 31;
	    Pointer_Mode at 5 * Word_Size range 0 .. 7;
	    Keyboard_Mode at 5 * Word_Size + 1 range 0 .. 7;
	    Pad at 5 * Word_Size + 2 range 0 .. 15;
	end record;
    type X_Grab_Key_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Owner_Events : X_Configuration_Dependent.Bool;
	    Length : X_Configuration_Dependent.Card16;
	    Grab_Window : X_Lib.Window;
	    Modifiers : X_Configuration_Dependent.Card16;
	    Key : X_Lib.Keyboard.Key_Code;
	    Pointer_Mode : X_Lib.Keyboard.Key_Code;
	    Keyboard_Mode : X_Lib.Keyboard.Key_Code;
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	    Pad3 : X_Configuration_Dependent.Byte;
	end record;
    for X_Grab_Key_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Owner_Events at 1 * Word_Size range 0 .. 31;
	    Length at 2 * Word_Size range 0 .. 15;
	    Grab_Window at 3 * Word_Size range 0 .. 31;
	    Modifiers at 4 * Word_Size range 0 .. 15;
	    Key at 4 * Word_Size + 2 range 0 .. 7;
	    Pointer_Mode at 4 * Word_Size + 3 range 0 .. 7;
	    Keyboard_Mode at 5 * Word_Size range 0 .. 7;
	    Pad1 at 5 * Word_Size + 1 range 0 .. 7;
	    Pad2 at 5 * Word_Size + 2 range 0 .. 7;
	    Pad3 at 5 * Word_Size + 3 range 0 .. 7;
	end record;
    type X_Ungrab_Key_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Key : X_Lib.Keyboard.Key_Code;
	    Length : X_Configuration_Dependent.Card16;
	    Grab_Window : X_Lib.Window;
	    Modifiers : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for X_Ungrab_Key_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Key at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Grab_Window at 1 * Word_Size range 0 .. 31;
	    Modifiers at 2 * Word_Size range 0 .. 15;
	    Pad at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Allow_Events_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Mode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Time : X_Lib.Time;
	end record;

    for X_Allow_Events_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Mode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Time at 1 * Word_Size range 0 .. 31;
	end record;

    type X_Get_Motion_Events_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Window : X_Lib.Window;
	    Start : X_Lib.Time;
	    Stop : X_Lib.Time;
	end record;

    for X_Get_Motion_Events_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Window at 1 * Word_Size range 0 .. 31;
	    Start at 2 * Word_Size range 0 .. 31;
	    Stop at 3 * Word_Size range 0 .. 31;
	end record;

    type X_Translate_Coords_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Src_Wid : X_Lib.Window;
	    Dst_Wid : X_Lib.Window;
	    Src_X : X_Lib.Millimeters;
	    Src_Y : X_Lib.Millimeters;
	end record;

    for X_Translate_Coords_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Src_Wid at 1 * Word_Size range 0 .. 31;
	    Dst_Wid at 2 * Word_Size range 0 .. 31;
	    Src_X at 3 * Word_Size range 0 .. 15;
	    Src_Y at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Warp_Pointer_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Src_Wid : X_Lib.Window;
	    Dst_Wid : X_Lib.Window;
	    Src_X : X_Lib.Millimeters;
	    Src_Y : X_Lib.Millimeters;
	    Src_Width : X_Configuration_Dependent.Card16;
	    Src_Height : X_Configuration_Dependent.Card16;
	    Dst_X : X_Lib.Millimeters;
	    Dst_Y : X_Lib.Millimeters;
	end record;

    for X_Warp_Pointer_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Src_Wid at 1 * Word_Size range 0 .. 31;
	    Dst_Wid at 2 * Word_Size range 0 .. 31;
	    Src_X at 3 * Word_Size range 0 .. 15;
	    Src_Y at 3 * Word_Size + 2 range 0 .. 15;
	    Src_Width at 4 * Word_Size range 0 .. 15;
	    Src_Height at 4 * Word_Size + 2 range 0 .. 15;
	    Dst_X at 5 * Word_Size range 0 .. 15;
	    Dst_Y at 5 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Set_Input_Focus_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Revert_To : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Focus : X_Lib.Window;
	    Time : X_Lib.Time;
	end record;

    for X_Set_Input_Focus_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Revert_To at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Focus at 1 * Word_Size range 0 .. 31;
	    Time at 2 * Word_Size range 0 .. 31;
	end record;

    type X_Open_Font_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Fid : X_Lib.Fonts.Font;
	    N_Bytes : X_Configuration_Dependent.Card16;
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	    -- string follows on word boundary
	end record;

    for X_Open_Font_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fid at 1 * Word_Size range 0 .. 31;
	    N_Bytes at 2 * Word_Size range 0 .. 15;
	    Pad1 at 2 * Word_Size + 2 range 0 .. 7;
	    Pad2 at 2 * Word_Size + 3 range 0 .. 7;
	end record;

    type X_Query_Text_Extents_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Odd_Length : X_Configuration_Dependent.Bool;
	    Length : X_Configuration_Dependent.Card16;
	    Fid : X_Lib.Fonts.Font;
	end record;
    for X_Query_Text_Extents_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Odd_Length at 1 * Word_Size range 0 .. 31;
	    Length at 2 * Word_Size range 0 .. 15;
	    Fid at 3 * Word_Size range 0 .. 31;
	end record;
    type X_List_Fonts_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Max_Names : X_Configuration_Dependent.Card16;
	    N_Bytes : X_Configuration_Dependent.Card16;
	    -- followed immediately by string bytes
	end record;

    for X_List_Fonts_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Max_Names at 1 * Word_Size range 0 .. 15;
	    N_Bytes at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype X_List_Fonts_With_Info_Req is X_List_Fonts_Req;

    type X_Set_Font_Path_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    N_Fonts : X_Configuration_Dependent.Card16;
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	    -- LISTofSTRING8 follows on word boundary
	end record;

    for X_Set_Font_Path_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    N_Fonts at 1 * Word_Size range 0 .. 15;
	    Pad1 at 1 * Word_Size + 2 range 0 .. 7;
	    Pad2 at 1 * Word_Size + 3 range 0 .. 7;
	end record;

    type X_Create_Pixmap_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Depth : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Pid : X_Lib.Pixmap;
	    Drawable : X_Lib.Drawable;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	end record;

    for X_Create_Pixmap_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Depth at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Pid at 1 * Word_Size range 0 .. 31;
	    Drawable at 2 * Word_Size range 0 .. 31;
	    Width at 3 * Word_Size range 0 .. 15;
	    Height at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Create_Gc_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Drawable : X_Lib.Drawable;
	    Mask : X_Masks.Mask_Type;
	end record;

    for X_Create_Gc_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Gc at 1 * Word_Size range 0 .. 31;
	    Drawable at 2 * Word_Size range 0 .. 31;
	    Mask at 3 * Word_Size range 0 .. 31;
	end record;

    type X_Change_Gc_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Mask : X_Masks.Mask_Type;
	end record;

    for X_Change_Gc_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Gc at 1 * Word_Size range 0 .. 31;
	    Mask at 2 * Word_Size range 0 .. 31;
	end record;

    type X_Copy_Gc_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Src_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Dst_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Mask : X_Masks.Mask_Type;
	end record;

    for X_Copy_Gc_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Src_Gc at 1 * Word_Size range 0 .. 31;
	    Dst_Gc at 2 * Word_Size range 0 .. 31;
	    Mask at 3 * Word_Size range 0 .. 31;
	end record;

    type X_Set_Dashes_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Dash_Off_Set : X_Configuration_Dependent.Card16;
	    N_Dashes : X_Configuration_Dependent.Card16;
	    -- length LISTofCARD8 of values following
	end record;

    for X_Set_Dashes_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Gc at 1 * Word_Size range 0 .. 31;
	    Dash_Off_Set at 2 * Word_Size range 0 .. 15;
	    N_Dashes at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Set_Clip_Rectangles_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Ordering : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	    X_Origin : X_Lib.Millimeters;
	    Y_Origin : X_Lib.Millimeters;
	end record;

    for X_Set_Clip_Rectangles_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Ordering at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Gc at 1 * Word_Size range 0 .. 31;
	    X_Origin at 2 * Word_Size range 0 .. 15;
	    Y_Origin at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Clear_Area_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Exposures : X_Configuration_Dependent.Bool;
	    Length : X_Configuration_Dependent.Card16;
	    Window : X_Lib.Window;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	end record;
    for X_Clear_Area_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Exposures at 1 * Word_Size range 0 .. 31;
	    Length at 2 * Word_Size range 0 .. 15;
	    Window at 3 * Word_Size range 0 .. 31;
	    X at 4 * Word_Size range 0 .. 15;
	    Y at 4 * Word_Size + 2 range 0 .. 15;
	    Width at 5 * Word_Size range 0 .. 15;
	    Height at 5 * Word_Size + 2 range 0 .. 15;
	end record;
    type X_Copy_Area_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Src_Drawable : X_Lib.Drawable;
	    Dst_Drawable : X_Lib.Drawable;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Src_X : X_Lib.Millimeters;
	    Src_Y : X_Lib.Millimeters;
	    Dst_X : X_Lib.Millimeters;
	    Dst_Y : X_Lib.Millimeters;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	end record;

    for X_Copy_Area_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Src_Drawable at 1 * Word_Size range 0 .. 31;
	    Dst_Drawable at 2 * Word_Size range 0 .. 31;
	    Gc at 3 * Word_Size range 0 .. 31;
	    Src_X at 4 * Word_Size range 0 .. 15;
	    Src_Y at 4 * Word_Size + 2 range 0 .. 15;
	    Dst_X at 5 * Word_Size range 0 .. 15;
	    Dst_Y at 5 * Word_Size + 2 range 0 .. 15;
	    Width at 6 * Word_Size range 0 .. 15;
	    Height at 6 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Copy_Plane_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Src_Drawable : X_Lib.Drawable;
	    Dst_Drawable : X_Lib.Drawable;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Src_X : X_Lib.Millimeters;
	    Src_Y : X_Lib.Millimeters;
	    Dst_X : X_Lib.Millimeters;
	    Dst_Y : X_Lib.Millimeters;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	    Bit_Plane : X_Lib.Plane_Mask;
	end record;

    for X_Copy_Plane_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Src_Drawable at 1 * Word_Size range 0 .. 31;
	    Dst_Drawable at 2 * Word_Size range 0 .. 31;
	    Gc at 3 * Word_Size range 0 .. 31;
	    Src_X at 4 * Word_Size range 0 .. 15;
	    Src_Y at 4 * Word_Size + 2 range 0 .. 15;
	    Dst_X at 5 * Word_Size range 0 .. 15;
	    Dst_Y at 5 * Word_Size + 2 range 0 .. 15;
	    Width at 6 * Word_Size range 0 .. 15;
	    Height at 6 * Word_Size + 2 range 0 .. 15;
	    Bit_Plane at 7 * Word_Size range 0 .. 31;
	end record;

    type X_Poly_Point_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Coord_Mode : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Drawable : X_Lib.Drawable;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	end record;

    for X_Poly_Point_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Coord_Mode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Drawable at 1 * Word_Size range 0 .. 31;
	    Gc at 2 * Word_Size range 0 .. 31;
	end record;

    subtype X_Poly_Line_Req is X_Poly_Point_Req;   -- same request structure

    -- The following used for Poly_Segment, Poly_Rectangle, PolyArc,
    -- PolyFillRectangle, PolyFillArc

    type X_Poly_Segment_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Drawable : X_Lib.Drawable;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	end record;

    for X_Poly_Segment_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Drawable at 1 * Word_Size range 0 .. 31;
	    Gc at 2 * Word_Size range 0 .. 31;
	end record;

    subtype X_Poly_Arc_Req is X_Poly_Segment_Req;
    subtype X_Poly_Rectangle_Req is X_Poly_Segment_Req;
    subtype X_Poly_Fill_Rectangle_Req is X_Poly_Segment_Req;
    subtype X_Poly_Fill_Arc_Req is X_Poly_Segment_Req;

    type X_Fill_Poly_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Drawable : X_Lib.Drawable;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Shape : X_Configuration_Dependent.Byte;
	    Coord_Mode : X_Configuration_Dependent.Byte;
	    Pad1 : X_Configuration_Dependent.Card16;
	end record;

    for X_Fill_Poly_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Drawable at 1 * Word_Size range 0 .. 31;
	    Gc at 2 * Word_Size range 0 .. 31;
	    Shape at 3 * Word_Size range 0 .. 7;
	    Coord_Mode at 3 * Word_Size + 1 range 0 .. 7;
	    Pad1 at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Put_Image_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Format : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Drawable : X_Lib.Drawable;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	    Dst_X : X_Lib.Millimeters;
	    Dst_Y : X_Lib.Millimeters;
	    Left_Pad : X_Configuration_Dependent.Card8;
	    Depth : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for X_Put_Image_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Format at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Drawable at 1 * Word_Size range 0 .. 31;
	    Gc at 2 * Word_Size range 0 .. 31;
	    Width at 3 * Word_Size range 0 .. 15;
	    Height at 3 * Word_Size + 2 range 0 .. 15;
	    Dst_X at 4 * Word_Size range 0 .. 15;
	    Dst_Y at 4 * Word_Size + 2 range 0 .. 15;
	    Left_Pad at 5 * Word_Size range 0 .. 7;
	    Depth at 5 * Word_Size + 1 range 0 .. 7;
	    Pad at 5 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Get_Image_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Format : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Drawable : X_Lib.Drawable;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	    Plane_Mask : X_Lib.Plane_Mask;
	end record;

    for X_Get_Image_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Format at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Drawable at 1 * Word_Size range 0 .. 31;
	    X at 2 * Word_Size range 0 .. 15;
	    Y at 2 * Word_Size + 2 range 0 .. 15;
	    Width at 3 * Word_Size range 0 .. 15;
	    Height at 3 * Word_Size + 2 range 0 .. 15;
	    Plane_Mask at 4 * Word_Size range 0 .. 31;
	end record;

-- the folloiwng used by Poly_Text8 and PolyText16

    type X_Poly_Text_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Drawable : X_Lib.Drawable;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;-- items (X_TextElt) start after struct
	end record;

    for X_Poly_Text_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Drawable at 1 * Word_Size range 0 .. 31;
	    Gc at 2 * Word_Size range 0 .. 31;
	    X at 3 * Word_Size range 0 .. 15;
	    Y at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype X_Poly_Text8_Req is X_Poly_Text_Req;
    subtype X_Poly_Text16_Req is X_Poly_Text_Req;

    type X_Image_Text_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    N_Chars : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Drawable : X_Lib.Drawable;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	    X : X_Lib.Millimeters;
	    Y : X_Lib.Millimeters;
	end record;

    for X_Image_Text_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    N_Chars at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Drawable at 1 * Word_Size range 0 .. 31;
	    Gc at 2 * Word_Size range 0 .. 31;
	    X at 3 * Word_Size range 0 .. 15;
	    Y at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype X_Image_Text8_Req is X_Image_Text_Req;
    subtype X_Image_Text16_Req is X_Image_Text_Req;

    type X_Create_Colormap_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Alloc : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Mid : X_Lib.Colors.Color_Map;
	    Window : X_Lib.Window;
	    Visual_Id : X_Lib.Visual;
	end record;

    for X_Create_Colormap_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Alloc at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Mid at 1 * Word_Size range 0 .. 31;
	    Window at 2 * Word_Size range 0 .. 31;
	    Visual_Id at 3 * Word_Size range 0 .. 31;
	end record;

    type X_Copy_Color_Map_And_Free_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Mid : X_Lib.Colors.Color_Map;
	    Src_Cmap : X_Lib.Colors.Color_Map;
	end record;

    for X_Copy_Color_Map_And_Free_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Mid at 1 * Word_Size range 0 .. 31;
	    Src_Cmap at 2 * Word_Size range 0 .. 31;
	end record;

    type X_Alloc_Color_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Cmap : X_Lib.Colors.Color_Map;
	    Red : X_Lib.Colors.Rgb_Value_Type;
	    Green : X_Lib.Colors.Rgb_Value_Type;
	    Blue : X_Lib.Colors.Rgb_Value_Type;
	    Pad2 : X_Configuration_Dependent.Card16;
	end record;

    for X_Alloc_Color_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Cmap at 1 * Word_Size range 0 .. 31;
	    Red at 2 * Word_Size range 0 .. 15;
	    Green at 2 * Word_Size + 2 range 0 .. 15;
	    Blue at 3 * Word_Size range 0 .. 15;
	    Pad2 at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Alloc_Named_Color_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Cmap : X_Lib.Colors.Color_Map;
	    N_Bytes : X_Configuration_Dependent.Card16;-- followed by structure
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	end record;

    for X_Alloc_Named_Color_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Cmap at 1 * Word_Size range 0 .. 31;
	    N_Bytes at 2 * Word_Size range 0 .. 15;
	    Pad1 at 2 * Word_Size + 2 range 0 .. 7;
	    Pad2 at 2 * Word_Size + 3 range 0 .. 7;
	end record;

    type X_Alloc_Color_Cells_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Contiguous : X_Configuration_Dependent.Bool;
	    Length : X_Configuration_Dependent.Card16;
	    Cmap : X_Lib.Colors.Color_Map;
	    Colors : X_Configuration_Dependent.Card16;
	    Planes : X_Configuration_Dependent.Card16;
	end record;
    for X_Alloc_Color_Cells_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Contiguous at 1 * Word_Size range 0 .. 31;
	    Length at 2 * Word_Size range 0 .. 15;
	    Cmap at 3 * Word_Size range 0 .. 31;
	    Colors at 4 * Word_Size range 0 .. 15;
	    Planes at 4 * Word_Size + 2 range 0 .. 15;
	end record;
    type X_Alloc_Color_Planes_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Contiguous : X_Configuration_Dependent.Bool;
	    Length : X_Configuration_Dependent.Card16;
	    Cmap : X_Lib.Colors.Color_Map;
	    Colors : X_Configuration_Dependent.Card16;
	    Red : X_Lib.Colors.Rgb_Value_Type;
	    Green : X_Lib.Colors.Rgb_Value_Type;
	    Blue : X_Lib.Colors.Rgb_Value_Type;
	end record;
    for X_Alloc_Color_Planes_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Contiguous at 1 * Word_Size range 0 .. 31;
	    Length at 2 * Word_Size range 0 .. 15;
	    Cmap at 3 * Word_Size range 0 .. 31;
	    Colors at 4 * Word_Size range 0 .. 15;
	    Red at 4 * Word_Size + 2 range 0 .. 15;
	    Green at 5 * Word_Size range 0 .. 15;
	    Blue at 5 * Word_Size + 2 range 0 .. 15;
	end record;
    type X_Free_Colors_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Cmap : X_Lib.Colors.Color_Map;
	    Plane_Mask : X_Lib.Plane_Mask;
	end record;

    for X_Free_Colors_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Cmap at 1 * Word_Size range 0 .. 31;
	    Plane_Mask at 2 * Word_Size range 0 .. 31;
	end record;

    type X_Store_Colors_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Cmap : X_Lib.Colors.Color_Map;
	end record;

    for X_Store_Colors_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Cmap at 1 * Word_Size range 0 .. 31;
	end record;

    type X_Store_Named_Color_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Flags : X_Configuration_Dependent.Card8;
	    -- DoRed, DoGreen, DoBlue, as in X_ColorItem
	    Length : X_Configuration_Dependent.Card16;
	    Cmap : X_Lib.Colors.Color_Map;
	    Pixel : X_Lib.U_Pixel;
	    N_Bytes : X_Configuration_Dependent.Card16;
	    -- number of name string bytes following structure
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	end record;

    for X_Store_Named_Color_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Flags at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Cmap at 1 * Word_Size range 0 .. 31;
	    Pixel at 2 * Word_Size range 0 .. 31;
	    N_Bytes at 3 * Word_Size range 0 .. 15;
	    Pad1 at 3 * Word_Size + 2 range 0 .. 7;
	    Pad2 at 3 * Word_Size + 3 range 0 .. 7;
	end record;

    type X_Query_Colors_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Cmap : X_Lib.Colors.Color_Map;
	end record;

    for X_Query_Colors_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Cmap at 1 * Word_Size range 0 .. 31;
	end record;

    -- followed  by string of length len
    type X_Lookup_Color_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Cmap : X_Lib.Colors.Color_Map;
	    N_Bytes : X_Configuration_Dependent.Card16;
	    -- number of string bytes following structure
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	end record;

    for X_Lookup_Color_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Cmap at 1 * Word_Size range 0 .. 31;
	    N_Bytes at 3 * Word_Size range 0 .. 15;
	    Pad1 at 3 * Word_Size + 2 range 0 .. 7;
	    Pad2 at 3 * Word_Size + 3 range 0 .. 7;
	end record;

    type X_Create_Cursor_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Cid : X_Lib.Cursors.Cursor;
	    Source : X_Lib.Pixmap;
	    Mask : X_Lib.Pixmap;
	    Fore_Red : X_Lib.Colors.Rgb_Value_Type;
	    Fore_Green : X_Lib.Colors.Rgb_Value_Type;
	    Fore_Blue : X_Lib.Colors.Rgb_Value_Type;
	    Back_Red : X_Lib.Colors.Rgb_Value_Type;
	    Back_Green : X_Lib.Colors.Rgb_Value_Type;
	    Back_Blue : X_Lib.Colors.Rgb_Value_Type;
	    X : X_Configuration_Dependent.Card16;
	    Y : X_Configuration_Dependent.Card16;
	end record;

    for X_Create_Cursor_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Cid at 1 * Word_Size range 0 .. 31;
	    Source at 2 * Word_Size range 0 .. 31;
	    Mask at 3 * Word_Size range 0 .. 31;
	    Fore_Red at 4 * Word_Size range 0 .. 15;
	    Fore_Green at 4 * Word_Size + 2 range 0 .. 15;
	    Fore_Blue at 5 * Word_Size range 0 .. 15;
	    Back_Red at 5 * Word_Size + 2 range 0 .. 15;
	    Back_Green at 6 * Word_Size range 0 .. 15;
	    Back_Blue at 6 * Word_Size + 2 range 0 .. 15;
	    X at 7 * Word_Size range 0 .. 15;
	    Y at 7 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Create_Glyph_Cursor_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Cid : X_Lib.Cursors.Cursor;
	    Source : X_Lib.Fonts.Font;
	    Mask : X_Lib.Fonts.Font;
	    Source_Char : X_Configuration_Dependent.Card16;
	    Mask_Char : X_Configuration_Dependent.Card16;
	    Fore_Red : X_Lib.Colors.Rgb_Value_Type;
	    Fore_Green : X_Lib.Colors.Rgb_Value_Type;
	    Fore_Blue : X_Lib.Colors.Rgb_Value_Type;
	    Back_Red : X_Lib.Colors.Rgb_Value_Type;
	    Back_Green : X_Lib.Colors.Rgb_Value_Type;
	    Back_Blue : X_Lib.Colors.Rgb_Value_Type;
	end record;

    for X_Create_Glyph_Cursor_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Cid at 1 * Word_Size range 0 .. 31;
	    Source at 2 * Word_Size range 0 .. 31;
	    Mask at 3 * Word_Size range 0 .. 31;
	    Source_Char at 4 * Word_Size range 0 .. 15;
	    Mask_Char at 4 * Word_Size + 2 range 0 .. 15;
	    Fore_Red at 5 * Word_Size range 0 .. 15;
	    Fore_Green at 5 * Word_Size + 2 range 0 .. 15;
	    Fore_Blue at 6 * Word_Size range 0 .. 15;
	    Back_Red at 6 * Word_Size + 2 range 0 .. 15;
	    Back_Green at 7 * Word_Size range 0 .. 15;
	    Back_Blue at 7 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Recolor_Cursor_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Cursor : X_Lib.Cursors.Cursor;
	    Fore_Red : X_Lib.Colors.Rgb_Value_Type;
	    Fore_Green : X_Lib.Colors.Rgb_Value_Type;
	    Fore_Blue : X_Lib.Colors.Rgb_Value_Type;
	    Back_Red : X_Lib.Colors.Rgb_Value_Type;
	    Back_Green : X_Lib.Colors.Rgb_Value_Type;
	    Back_Blue : X_Lib.Colors.Rgb_Value_Type;
	end record;

    for X_Recolor_Cursor_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Cursor at 1 * Word_Size range 0 .. 31;
	    Fore_Red at 2 * Word_Size range 0 .. 15;
	    Fore_Green at 2 * Word_Size + 2 range 0 .. 15;
	    Fore_Blue at 3 * Word_Size range 0 .. 15;
	    Back_Red at 3 * Word_Size + 2 range 0 .. 15;
	    Back_Green at 4 * Word_Size range 0 .. 15;
	    Back_Blue at 4 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Query_Best_Size_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Class : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Drawable : X_Lib.Drawable;
	    Width : X_Configuration_Dependent.Card16;
	    Height : X_Configuration_Dependent.Card16;
	end record;

    for X_Query_Best_Size_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Class at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Drawable at 1 * Word_Size range 0 .. 31;
	    Width at 2 * Word_Size range 0 .. 15;
	    Height at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Query_Extension_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    N_Bytes : X_Configuration_Dependent.Card16;
	    -- number of string bytes following structure
	    Pad1 : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Byte;
	end record;

    for X_Query_Extension_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    N_Bytes at 1 * Word_Size range 0 .. 15;
	    Pad1 at 1 * Word_Size + 2 range 0 .. 7;
	    Pad2 at 1 * Word_Size + 3 range 0 .. 7;
	end record;

    type X_Set_Modifier_Mapping_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Num_Key_Per_Modifier : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	end record;

    for X_Set_Modifier_Mapping_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Num_Key_Per_Modifier at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Set_Pointer_Mapping_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    N_Elts : X_Configuration_Dependent.Card8;
	    -- how many elements in the map
	    Length : X_Configuration_Dependent.Card16;
	end record;

    for X_Set_Pointer_Mapping_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    N_Elts at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Get_Keyboard_Mapping_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    First_Key_Code : X_Lib.Keyboard.Key_Code;
	    Count : X_Configuration_Dependent.Card8;
	    Pad1 : X_Configuration_Dependent.Card16;
	end record;

    for X_Get_Keyboard_Mapping_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    First_Key_Code at 1 * Word_Size range 0 .. 7;
	    Count at 1 * Word_Size + 1 range 0 .. 7;
	    Pad1 at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Change_Keyboard_Mapping_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Key_Code : X_Lib.Keyboard.Key_Code;
	    Length : X_Configuration_Dependent.Card16;
	    First_Key_Code : X_Lib.Keyboard.Key_Code;
	    Key_Syms_Per_Key_Code : X_Configuration_Dependent.Card8;
	    Pad1 : X_Configuration_Dependent.Card16;
	end record;

    for X_Change_Keyboard_Mapping_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Key_Code at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    First_Key_Code at 1 * Word_Size range 0 .. 7;
	    Key_Syms_Per_Key_Code at 1 * Word_Size + 1 range 0 .. 7;
	    Pad1 at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Change_Keyboard_Control_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Mask : X_Masks.Mask_Type;
	end record;

    for X_Change_Keyboard_Control_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Mask at 1 * Word_Size range 0 .. 31;
	end record;

    type X_Bell_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Percent : X_Configuration_Dependent.Int8;  -- -100 to 100
	    Length : X_Configuration_Dependent.Card16;
	end record;

    for X_Bell_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Percent at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Change_Pointer_Control_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Accel_Num : X_Lib.X_Short_Integer;
	    Accel_Denum : X_Lib.X_Short_Integer;
	    Threshold : X_Lib.X_Short_Integer;
	    Do_Accel : X_Configuration_Dependent.Bool;
	    Do_Thresh : X_Configuration_Dependent.Bool;
	end record;
    for X_Change_Pointer_Control_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Accel_Num at 1 * Word_Size range 0 .. 15;
	    Accel_Denum at 1 * Word_Size + 2 range 0 .. 15;
	    Threshold at 2 * Word_Size range 0 .. 15;
	    Do_Accel at 3 * Word_Size range 0 .. 31;
	    Do_Thresh at 4 * Word_Size range 0 .. 31;
	end record;
    type X_Set_Screen_Saver_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Time_Out : X_Lib.X_Short_Integer;
	    Interval : X_Lib.X_Short_Integer;
	    Prefer_Blank : X_Configuration_Dependent.Byte;
	    Allow_Expose : X_Configuration_Dependent.Byte;
	    Pad2 : X_Configuration_Dependent.Card16;
	end record;

    for X_Set_Screen_Saver_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Time_Out at 1 * Word_Size range 0 .. 15;
	    Interval at 1 * Word_Size + 2 range 0 .. 15;
	    Prefer_Blank at 2 * Word_Size range 0 .. 7;
	    Allow_Expose at 2 * Word_Size + 1 range 0 .. 7;
	    Pad2 at 4 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Change_Hosts_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Mode : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Host_Family : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Host_Length : X_Configuration_Dependent.Card16;
	end record;

    for X_Change_Hosts_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Mode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Host_Family at 1 * Word_Size range 0 .. 7;
	    Pad at 1 * Word_Size + 1 range 0 .. 7;
	    Host_Length at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_List_Hosts_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	end record;

    for X_List_Hosts_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    type X_Change_Mode_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Mode : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	end record;

    for X_Change_Mode_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Mode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype X_Set_Access_Control_Req is X_Change_Mode_Req;
    subtype X_Set_Close_Down_Mode_Req is X_Change_Mode_Req;
    subtype X_Force_Screen_Saver_Req is X_Change_Mode_Req;

    -- followed by LIST of ATOM
    type X_Rotate_Properties_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Byte;
	    Length : X_Configuration_Dependent.Card16;
	    Window : X_Lib.Window;
	    N_Atoms : X_Configuration_Dependent.Card16;
	    N_Positions : X_Lib.X_Short_Integer;
	end record;

    for X_Rotate_Properties_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Pad at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Window at 1 * Word_Size range 0 .. 31;
	    N_Atoms at 2 * Word_Size range 0 .. 15;
	    N_Positions at 2 * Word_Size + 2 range 0 .. 15;
	end record;

-- Reply codes

    X_Replys : constant := 1;   -- Normal reply
    X_Errors : constant := 0;   -- Error

-- Request codes

    X_Create_Window : constant := 1;
    X_Change_Window_Attributes : constant := 2;
    X_Get_Window_Attributes : constant := 3;
    X_Destroy_Window : constant := 4;
    X_Destroy_Subwindows : constant := 5;
    X_Change_Save_Set : constant := 6;
    X_Reparent_Window : constant := 7;
    X_Map_Window : constant := 8;
    X_Map_Subwindows : constant := 9;
    X_Unmap_Window : constant := 10;
    X_Unmap_Subwindows : constant := 11;
    X_Configure_Window : constant := 12;
    X_Circulate_Window : constant := 13;
    X_Get_Geometry : constant := 14;
    X_Query_Tree : constant := 15;
    X_Intern_Atom : constant := 16;
    X_Get_Atom_Name : constant := 17;
    X_Change_Property : constant := 18;
    X_Delete_Property : constant := 19;
    X_Get_Property : constant := 20;
    X_List_Properties : constant := 21;
    X_Set_Selection_Owner : constant := 22;
    X_Get_Selection_Owner : constant := 23;
    X_Convert_Selection : constant := 24;
    X_Send_Event : constant := 25;
    X_Grab_Pointer : constant := 26;
    X_Ungrab_Pointer : constant := 27;
    X_Grab_Button : constant := 28;
    X_Ungrab_Button : constant := 29;
    X_Change_Active_Pointer_Grab : constant := 30;
    X_Grab_Keyboard : constant := 31;
    X_Ungrab_Keyboard : constant := 32;
    X_Grab_Key : constant := 33;
    X_Ungrab_Key : constant := 34;
    X_Allow_Events : constant := 35;
    X_Grab_Server : constant := 36;
    X_Ungrab_Server : constant := 37;
    X_Query_Pointer : constant := 38;
    X_Get_Motion_Events : constant := 39;
    X_Translate_Coords : constant := 40;
    X_Warp_Pointer : constant := 41;
    X_Set_Input_Focus : constant := 42;
    X_Get_Input_Focus : constant := 43;
    X_Query_Key_Map : constant := 44;
    X_Open_Font : constant := 45;
    X_Close_Font : constant := 46;
    X_Query_Font : constant := 47;
    X_Query_Text_Extents : constant := 48;
    X_List_Fonts : constant := 49;
    X_List_Fonts_With_Info : constant := 50;
    X_Set_Font_Path : constant := 51;
    X_Get_Font_Path : constant := 52;
    X_Create_Pixmap : constant := 53;
    X_Free_Pixmap : constant := 54;
    X_Create_Gc : constant := 55;
    X_Change_Gc : constant := 56;
    X_Copy_Gc : constant := 57;
    X_Set_Dashes : constant := 58;
    X_Set_Clip_Rectangles : constant := 59;
    X_Free_Gc : constant := 60;
    X_Clear_Area : constant := 61;
    X_Copy_Area : constant := 62;
    X_Copy_Plane : constant := 63;
    X_Poly_Point : constant := 64;
    X_Poly_Line : constant := 65;
    X_Poly_Segment : constant := 66;
    X_Poly_Rectangle : constant := 67;
    X_Poly_Arc : constant := 68;
    X_Fill_Poly : constant := 69;
    X_Poly_Fill_Rectangle : constant := 70;
    X_Poly_Fill_Arc : constant := 71;
    X_Put_Image : constant := 72;
    X_Get_Image : constant := 73;
    X_Poly_Text8 : constant := 74;
    X_Poly_Text16 : constant := 75;
    X_Image_Text8 : constant := 76;
    X_Image_Text16 : constant := 77;
    X_Create_Color_Map : constant := 78;
    X_Free_Color_Map : constant := 79;
    X_Copy_Color_Map_And_Free : constant := 80;
    X_Install_Color_Map : constant := 81;
    X_Uninstall_Color_Map : constant := 82;
    X_List_Installed_Color_Maps : constant := 83;
    X_Alloc_Color : constant := 84;
    X_Alloc_Named_Color : constant := 85;
    X_Alloc_Color_Cells : constant := 86;
    X_Alloc_Color_Planes : constant := 87;
    X_Free_Colors : constant := 88;
    X_Store_Colors : constant := 89;
    X_Store_Named_Color : constant := 90;
    X_Query_Colors : constant := 91;
    X_Lookup_Color : constant := 92;
    X_Create_Cursor : constant := 93;
    X_Create_Glyph_Cursor : constant := 94;
    X_Free_Cursor : constant := 95;
    X_Recolor_Cursor : constant := 96;
    X_Query_Best_Size : constant := 97;
    X_Query_Extension : constant := 98;
    X_List_Extensions : constant := 99;
    X_Change_Keyboard_Mapping : constant := 100;
    X_Get_Keyboard_Mapping : constant := 101;
    X_Change_Keyboard_Control : constant := 102;
    X_Get_Keyboard_Control : constant := 103;
    X_Bell : constant := 104;
    X_Change_Pointer_Control : constant := 105;
    X_Get_Pointer_Control : constant := 106;
    X_Set_Screen_Saver : constant := 107;
    X_Get_Screen_Saver : constant := 108;
    X_Change_Hosts : constant := 109;
    X_List_Hosts : constant := 110;
    X_Set_Access_Control : constant := 111;
    X_Set_Close_Down_Mode : constant := 112;
    X_Kill_Client : constant := 113;
    X_Rotate_Properties : constant := 114;
    X_Force_Screen_Saver : constant := 115;
    X_Set_Pointer_Mapping : constant := 116;
    X_Get_Pointer_Mapping : constant := 117;
    X_Set_Modifier_Mapping : constant := 118;
    X_Get_Modifier_Mapping : constant := 119;
    X_No_Operation : constant := 127;
end X_Proto;

--package body X_Proto is end X_Proto;
