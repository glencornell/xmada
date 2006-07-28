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

with X_Lib, Unchecked_Conversion, X_Configuration_Dependent;

package Pex_Proto_St is
    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    -- Matches revision 5.0P

    -- This is FLOAT as defined and used by the Protocol Encoding
    subtype Pex_Float is X_Configuration_Dependent.Long_Flt;
    subtype Pex_Asf_Attribute is X_Configuration_Dependent.Card32;
    subtype Pex_Asf_Value is X_Configuration_Dependent.Card8;
    subtype Pex_Bitmask is X_Configuration_Dependent.Card32;
    subtype Pex_Bitmask_Short is X_Configuration_Dependent.Card16;
    subtype Pex_Coord_Type is X_Configuration_Dependent.Card16;
    subtype Pex_Composition is X_Configuration_Dependent.Card16;
    subtype Pex_Cull_Mode is X_Configuration_Dependent.Card16;
    subtype Pex_Dynamic_Type is X_Configuration_Dependent.Byte;
    subtype Pex_Enum_Type_Index is X_Configuration_Dependent.Int16;
    subtype Pex_Lookup_Table is X_Lib.X_Id;
    subtype Pex_Name is X_Configuration_Dependent.Card32;
    subtype Pex_Name_Set is X_Lib.X_Id;
    subtype Pex_Pc is X_Lib.X_Id;
    subtype Pex_Font is X_Lib.X_Id;
    subtype Pex_Phigs_Wks is X_Lib.X_Id;
    subtype Pex_Pick_Measure is X_Lib.X_Id;
    subtype Pex_Renderer is X_Lib.X_Id;
    subtype Pex_Sc is X_Lib.X_Id;
    subtype Pex_Structure is X_Lib.X_Id;
    subtype Pex_Switch is X_Configuration_Dependent.Card8;
    subtype Pex_Table_Index is X_Configuration_Dependent.Card16;
    subtype Pex_Table_Type is X_Configuration_Dependent.
				 Card16;-- could be smaller if it ever helps
    subtype Pex_Text_H_Alignment is X_Configuration_Dependent.Card16;
    subtype Pex_Text_V_Alignment is X_Configuration_Dependent.Card16;
    subtype Pex_Type_Or_Table_Index is X_Configuration_Dependent.Card16;
    subtype Pex_Color_Type is Pex_Enum_Type_Index;

    type Boolean_Array is array (Natural range <>) of Boolean;

    -- PEX_FLOAT_Rec is used as a compiler bug work-around.

    type Pex_Float_Rec is
	record
	    X, Y : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Float_Rec'Size use 64;
    for Pex_Float_Rec use
	record
	    X at 0 * Word_Size range 0 .. 31;
	    Y at 1 * Word_Size range 0 .. 31;
	end record;

    function To_Pex_Float is new Unchecked_Conversion
				    (Pex_Float_Rec, Pex_Float);
    function To_Pex_Float_Rec is
       new Unchecked_Conversion (Pex_Float, Pex_Float_Rec);

    type Pex_Matrix is array (1 .. 4, 1 .. 4) of Pex_Float_Rec;
    type Pex_Matrix3X3 is array (1 .. 3, 1 .. 3) of Pex_Float_Rec;

    type Pex_Bitmask_Array is array (Natural range <>) of Pex_Bitmask;

    -- included in others
    type Pex_String is
	record
	    Lengths : X_Configuration_Dependent.Card16;
	    -- list of CARD8 -- don't swap
	end record;

    for Pex_String use
	record
	    Lengths at 0 range 0 .. 15;
	    -- list of CARD8 -- don't swap
	end record;

    type Pex_Structure_Info is
	record
	    Sid : Pex_Structure;
	    Priority : Pex_Float;
	end record;

    for Pex_Structure_Info use
	record
	    Sid at 0 * Word_Size range 0 .. 31;
	    Priority at 2 * Word_Size range 0 .. 63;
	end record;

    Pex_Structure_Info_Word_Size : constant := 4;

    type Pex_Vector2D is
	record
	    X : Pex_Float;
	    Y : Pex_Float;
	end record;

    for Pex_Vector2D use
	record
	    X at 0 * Word_Size range 0 .. 63;
	    Y at 2 * Word_Size range 0 .. 63;
	end record;

    type Pex_Vector3D is
	record
	    X : Pex_Float;
	    Y : Pex_Float;
	    Z : Pex_Float;
	end record;

    for Pex_Vector3D use
	record
	    X at 0 * Word_Size range 0 .. 63;
	    Y at 2 * Word_Size range 0 .. 63;
	    Z at 4 * Word_Size range 0 .. 63;
	end record;

    -- Coord structures

    type Pex_Coord2D is
	record
	    X : Pex_Float;
	    Y : Pex_Float;
	end record;

    for Pex_Coord2D use
	record
	    X at 0 * Word_Size range 0 .. 63;
	    Y at 2 * Word_Size range 0 .. 63;
	end record;

    type Pex_Coord3D is
	record
	    X : Pex_Float;
	    Y : Pex_Float;
	    Z : Pex_Float;
	end record;

    for Pex_Coord3D use
	record
	    X at 0 * Word_Size range 0 .. 63;
	    Y at 2 * Word_Size range 0 .. 63;
	    Z at 4 * Word_Size range 0 .. 63;
	end record;

    type Pex_Coord4D is
	record
	    X : Pex_Float;
	    Y : Pex_Float;
	    Z : Pex_Float;
	    W : Pex_Float;
	end record;

    for Pex_Coord4D use
	record
	    X at 0 * Word_Size range 0 .. 63;
	    Y at 2 * Word_Size range 0 .. 63;
	    Z at 4 * Word_Size range 0 .. 63;
	    W at 6 * Word_Size range 0 .. 63;
	end record;

    -- Color structures
    type Pex_Rgb_Float_Color is
	record
	    Red : Pex_Float;
	    Green : Pex_Float;
	    Blue : Pex_Float;
	end record;

    for Pex_Rgb_Float_Color use
	record
	    Red at 0 * Word_Size range 0 .. 63;
	    Green at 2 * Word_Size range 0 .. 63;
	    Blue at 4 * Word_Size range 0 .. 63;
	end record;

    type Pex_Hsv_Color is
	record
	    Hue : Pex_Float;
	    Saturation : Pex_Float;
	    Value : Pex_Float;
	end record;

    for Pex_Hsv_Color use
	record
	    Hue at 0 * Word_Size range 0 .. 63;
	    Saturation at 2 * Word_Size range 0 .. 63;
	    Value at 4 * Word_Size range 0 .. 63;
	end record;

    type Pex_Hls_Color is
	record
	    Hue : Pex_Float;
	    Lightness : Pex_Float;
	    Saturation : Pex_Float;
	end record;

    for Pex_Hls_Color use
	record
	    Hue at 0 * Word_Size range 0 .. 63;
	    Lightness at 2 * Word_Size range 0 .. 63;
	    Saturation at 4 * Word_Size range 0 .. 63;
	end record;

    type Pex_Cie_Color is
	record
	    X : Pex_Float;
	    Y : Pex_Float;
	    Z : Pex_Float;
	end record;

    for Pex_Cie_Color use
	record
	    X at 0 * Word_Size range 0 .. 63;
	    Y at 2 * Word_Size range 0 .. 63;
	    Z at 4 * Word_Size range 0 .. 63;
	end record;

    type Pex_Rgb8_Color is
	record
	    Red : X_Configuration_Dependent.Card8;
	    Green : X_Configuration_Dependent.Card8;
	    Blue : X_Configuration_Dependent.Card8;
	    Pad : X_Configuration_Dependent.Card8;
	end record;

    for Pex_Rgb8_Color use
	record
	    Red at 0 * Word_Size range 0 .. 7;
	    Green at 0 * Word_Size + 1 range 0 .. 7;
	    Blue at 0 * Word_Size + 2 range 0 .. 7;
	    Pad at 0 * Word_Size + 3 range 0 .. 7;
	end record;

    type Pex_Rgb16_Color is
	record
	    Red : X_Configuration_Dependent.Card16;
	    Green : X_Configuration_Dependent.Card16;
	    Blue : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Rgb16_Color use
	record
	    Red at 0 * Word_Size range 0 .. 15;
	    Green at 0 * Word_Size + 2 range 0 .. 15;
	    Blue at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Indexed_Color is
	record
	    Index : Pex_Table_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Indexed_Color use
	record
	    Index at 0 * Word_Size range 0 .. 15;
	    Pad at 0 * Word_Size + 2 range 0 .. 15;
	end record;

--   type PEX_Color (Kind : ) is record
--   typedef struct {
--    union {
--      indexed  : PEX_Indexed_Color;
--      rgb8     : PEX_Rgb8_Color;
--      rgb16    : PEX_Rgb16_Color;
--      rgb_Float : PEX_Rgb_Float_Color;
--      hsv_Float : PEX_Hsv_Color;
--      hls_Float : PEX_Hls_Color;
--      cie_Float : PEX_Cie_Color;
--    } format;
--} PEX_Color;

    type Pex_Float_Color is
	record
	    First : Pex_Float;
	    Second : Pex_Float;
	    Third : Pex_Float;
	end record;

    for Pex_Float_Color use
	record
	    First at 0 * Word_Size range 0 .. 63;
	    Second at 2 * Word_Size range 0 .. 63;
	    Third at 4 * Word_Size range 0 .. 63;
	end record;

    type Pex_Color_Specifier is
	record
	    Color_Type : Pex_Color_Type;   -- ColorType enumerated type B16
	    Unused : X_Configuration_Dependent.Card16; -- SINGLE COLOR(colorType)
	end record;

    for Pex_Color_Specifier use
	record
	    Color_Type at 0 * Word_Size range 0 .. 15;
	    Unused at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Curve_Approx is
	record
	    Approx_Method : Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Tolerance : Pex_Float;
	end record;

    for Pex_Curve_Approx use
	record
	    Approx_Method at 0 * Word_Size range 0 .. 15;
	    Unused at 0 * Word_Size + 2 range 0 .. 15;
	    Tolerance at 2 * Word_Size range 0 .. 63;
	end record;

    Pex_Curve_Approx_Word_Size : constant := 4;

    type Pex_Device_Coord is
	record
	    X : X_Configuration_Dependent.Short;
	    Y : X_Configuration_Dependent.Short;
	    Z : Pex_Float;
	end record;

    for Pex_Device_Coord use
	record
	    X at 0 * Word_Size range 0 .. 15;
	    Y at 0 * Word_Size + 2 range 0 .. 15;
	    Z at 2 * Word_Size range 0 .. 63;
	end record;

    Pex_Device_Coord_Word_Size : constant := 4;

    type Pex_Device_Coord2D is
	record
	    X : X_Configuration_Dependent.Short;
	    Y : X_Configuration_Dependent.Short;
	end record;

    for Pex_Device_Coord2D use
	record
	    X at 0 * Word_Size range 0 .. 15;
	    Y at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Device_Rect is
	record
	    X_Min : X_Configuration_Dependent.Short;
	    Y_Min : X_Configuration_Dependent.Short;
	    X_Max : X_Configuration_Dependent.Short;
	    Y_Max : X_Configuration_Dependent.Short;
	end record;

    for Pex_Device_Rect use
	record
	    X_Min at 0 * Word_Size range 0 .. 15;
	    Y_Min at 0 * Word_Size + 2 range 0 .. 15;
	    X_Max at 1 * Word_Size range 0 .. 15;
	    Y_Max at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Element_Info is
	record
	    Element_Type : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Element_Info use
	record
	    Element_Type at 0 * Word_Size range 0 .. 15;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Element_Pos is
	record
	    Whence : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	    Offset : X_Configuration_Dependent.Int;
	end record;

    for Pex_Element_Pos use
	record
	    Whence at 0 * Word_Size range 0 .. 15;
	    Unused at 0 * Word_Size + 2 range 0 .. 15;
	    Offset at 1 * Word_Size range 0 .. 31;
	end record;

    type Pex_Element_Range is
	record
	    Position1 : Pex_Element_Pos;
	    Position2 : Pex_Element_Pos;
	end record;

    for Pex_Element_Range use
	record
	    Position1 at 0 * Word_Size range 0 .. 63;
	    Position2 at 2 * Word_Size range 0 .. 63;
	end record;

    type Pex_Element_Ref is
	record
	    Structure : Pex_Structure;
	    Offset : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Element_Ref use
	record
	    Structure at 0 * Word_Size range 0 .. 31;
	    Offset at 1 * Word_Size range 0 .. 31;
	end record;

    type Pex_Extent_Info is
	record
	    Lower_Left : Pex_Coord2D;
	    Upper_Right : Pex_Coord2D;
	    Concatpoint : Pex_Coord2D;
	end record;

    for Pex_Extent_Info use
	record
	    Lower_Left at 0 * Word_Size range 0 .. 32 * 4 - 1;
	    Upper_Right at 4 * Word_Size range 0 .. 32 * 4 - 1;
	    Concatpoint at 8 * Word_Size range 0 .. 32 * 4 - 1;
	end record;

    type Pex_Enum_Type_Desc is
	record
	    Index : Pex_Enum_Type_Index;
	    Descriptor : Pex_String;
	end record;

    for Pex_Enum_Type_Desc use
	record
	    Index at 0 * Word_Size range 0 .. 15;
	    Descriptor at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Half_Space is
	record
	    Point : Pex_Coord3D;
	    Vector : Pex_Vector3D;
	end record;

    for Pex_Half_Space use
	record
	    Point at 0 * Word_Size range 0 .. 32 * 6 - 1;
	    Vector at 6 * Word_Size range 0 .. 32 * 6 - 1;
	end record;

    type Pex_Name_Set_Pair is
	record
	    Incl : Pex_Name_Set;
	    Excl : Pex_Name_Set;
	end record;

    for Pex_Name_Set_Pair use
	record
	    Incl at 0 * Word_Size range 0 .. 31;
	    Excl at 1 * Word_Size range 0 .. 31;
	end record;

    type Pex_Half_Space2D is
	record
	    Point : Pex_Coord2D;
	    Vector : Pex_Vector2D;
	end record;

    for Pex_Half_Space2D use
	record
	    Point at 0 * Word_Size range 0 .. 32 * 4 - 1;
	    Vector at 4 * Word_Size range 0 .. 32 * 4 - 1;
	end record;

    type Pex_Local_Transform3D_Data is
	record
	    Composition : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	    Matrix : Pex_Matrix;
	end record;

    for Pex_Local_Transform3D_Data use
	record
	    Composition at 0 * Word_Size range 0 .. 15;
	    Unused at 0 * Word_Size + 2 range 0 .. 15;
	    Matrix at 1 * Word_Size range 0 .. 32 * 32 - 1;
	end record;

    type Pex_Local_Transform2D_Data is
	record
	    Composition : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	    Matrix : Pex_Matrix3X3;
	end record;

    for Pex_Local_Transform2D_Data use
	record
	    Composition at 0 * Word_Size range 0 .. 15;
	    Unused at 0 * Word_Size + 2 range 0 .. 15;
	    Matrix at 1 * Word_Size range 0 .. 32 * 18 - 1;
	end record;

    type Pex_Npc_Subvolume is
	record
	    Minval : Pex_Coord3D;
	    Maxval : Pex_Coord3D;
	end record;

    for Pex_Npc_Subvolume use
	record
	    Minval at 0 * Word_Size range 0 .. 32 * 6 - 1;
	    Maxval at 6 * Word_Size range 0 .. 32 * 6 - 1;
	end record;

    -- an OPT_DATA  structure cannot be defined because it has variable content
    -- and size.  An union structure could be used to define a template for
    -- the data. However, since unions pad to a fixed amount of space and the
    -- protocol uses variable lengths, this is not appropriate for protocol
    -- data    types.  The most correct way of defining this data is to define
    -- one data structure for every possible combination of color, normal and
    -- edge data that could be given with a vertex or facet.

    type Pex_Pick_Path is
	record
	    Sid : Pex_Structure;
	    Offset : X_Configuration_Dependent.Card32;
	    Pickid : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Pick_Path use
	record
	    Sid at 0 * Word_Size range 0 .. 31;
	    Offset at 1 * Word_Size range 0 .. 31;
	    Pickid at 2 * Word_Size range 0 .. 31;
	end record;

    type Pex_Text_Alignment_Data is
	record
	    Vertical : Pex_Text_V_Alignment;
	    Horizontal : Pex_Text_H_Alignment;
	end record;

    for Pex_Text_Alignment_Data use
	record
	    Vertical at 0 * Word_Size range 0 .. 15;
	    Horizontal at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Trim_Curve is
	record
	    Visibility : Pex_Switch;
	    Unused : X_Configuration_Dependent.Card8;
	    Order : X_Configuration_Dependent.Card16;
	    Types : Pex_Coord_Type;
	    Approx_Method : X_Configuration_Dependent.Short;
	    Tolerance : Pex_Float;
	    T_Min : Pex_Float;
	    T_Max : Pex_Float;
	    Num_Knots : X_Configuration_Dependent.Card32;
	    Num_Coord : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Trim_Curve use
	record
	    Visibility at 0 * Word_Size range 0 .. 7;
	    Unused at 0 * Word_Size + 1 range 0 .. 7;
	    Order at 0 * Word_Size + 2 range 0 .. 15;
	    Types at 1 * Word_Size range 0 .. 15;
	    Approx_Method at 1 * Word_Size + 2 range 0 .. 15;
	    Tolerance at 2 * Word_Size range 0 .. 63;
	    T_Min at 4 * Word_Size range 0 .. 63;
	    T_Max at 6 * Word_Size range 0 .. 63;
	    Num_Knots at 8 * Word_Size range 0 .. 31;
	    Num_Coord at 9 * Word_Size range 0 .. 31;
	end record;

    type Pex_Reflection_Attr is
	record
	    Ambient : Pex_Float;
	    Diffuse : Pex_Float;
	    Specular : Pex_Float;
	    Specularconc : Pex_Float;
	    Transmission : Pex_Float;     -- 0.0 = opaque, 1.0 = transparent
	    Specular_Color : Pex_Color_Specifier;  -- SINGLE COLOR()
	end record;

    for Pex_Reflection_Attr use
	record
	    Ambient at 0 * Word_Size range 0 .. 63;
	    Diffuse at 2 * Word_Size range 0 .. 63;
	    Specular at 4 * Word_Size range 0 .. 63;
	    Specularconc at 6 * Word_Size range 0 .. 63;
	    Transmission at 8 * Word_Size range 0 .. 63;
	    Specular_Color at 10 * Word_Size range 0 .. 31;
	end record;

    type Pex_Surface_Approx is
	record
	    Approx_Method : Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    U_Tolerance : Pex_Float;
	    V_Tolerance : Pex_Float;
	end record;

    for Pex_Surface_Approx use
	record
	    Approx_Method at 0 * Word_Size range 0 .. 15;
	    Unused at 0 * Word_Size + 2 range 0 .. 15;
	    U_Tolerance at 2 * Word_Size range 0 .. 63;
	    V_Tolerance at 4 * Word_Size range 0 .. 63;
	end record;

    Pex_Surface_Approx_Word_Size : constant := 6;

    type Pex_Vertex is
	record
	    Point : Pex_Coord3D;       -- SINGLE OPT_DATA()
	end record;

    for Pex_Vertex use
	record
	    Point at 0 * Word_Size range 0 .. 32 * 6 - 1;
	end record;

    type Pex_Viewport is
	record
	    Minval : Pex_Device_Coord;
	    Maxval : Pex_Device_Coord;
	    Use_Drawable : Pex_Switch;
	    Pad : X_Lib.Byte_Array (1 .. 3);
	end record;

    for Pex_Viewport use
	record
	    Minval at 0 * Word_Size
	       range 0 .. 32 * Pex_Device_Coord_Word_Size - 1;
	    Maxval at Pex_Device_Coord_Word_Size * Word_Size
	       range 0 .. 32 * Pex_Device_Coord_Word_Size - 1;
	    Use_Drawable at Pex_Device_Coord_Word_Size * 2 * Word_Size
	       range 0 .. 7;
	    Pad at Pex_Device_Coord_Word_Size * 2 * Word_Size + 1
	       range 0 .. 8 * 3 - 1;
	end record;

    Pex_Viewport_Word_Size : constant := Pex_Device_Coord_Word_Size * 2 + 1;

    type Pex_View_Entry is
	record
	    Clip_Flags : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	    Clip_Limits : Pex_Npc_Subvolume;
	    Orientation : Pex_Matrix;
	    Mapping : Pex_Matrix;
	end record;

    for Pex_View_Entry use
	record
	    Clip_Flags at 0 * Word_Size range 0 .. 15;
	    Unused at 0 * Word_Size + 2 range 0 .. 15;
	    Clip_Limits at 1 * Word_Size range 0 .. 32 * 12 - 1;
	    Orientation at 13 * Word_Size range 0 .. 32 * 32 - 1;
	    Mapping at 45 * Word_Size range 0 .. 32 * 32 - 1;
	end record;

    type Pex_View_Rep is
	record
	    Index : Pex_Table_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    View : Pex_View_Entry;
	end record;

    for Pex_View_Rep use
	record
	    Index at 0 * Word_Size range 0 .. 15;
	    Unused at 0 * Word_Size + 2 range 0 .. 15;
	    View at 1 * Word_Size range 0 .. 32 * 77 - 1;
	end record;

    -- typedefs for lookup tables

    type Pex_Table_Info is
	record
	    Definable_Entries : X_Configuration_Dependent.Card16;
	    Num_Predefined : X_Configuration_Dependent.Card16;
	    Predefined_Min : X_Configuration_Dependent.Card16;
	    Predefined_Max : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Table_Info use
	record
	    Definable_Entries at 0 * Word_Size range 0 .. 15;
	    Num_Predefined at 0 * Word_Size + 2 range 0 .. 15;
	    Predefined_Min at 1 * Word_Size range 0 .. 15;
	    Predefined_Max at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Line_Bundle_Entry is
	record
	    Line_Type : Pex_Enum_Type_Index;
	    Polyline_Interp : Pex_Enum_Type_Index;
	    Curve_Approx : Pex_Curve_Approx;
	    Line_Width : Pex_Float;
	    Line_Color : Pex_Color_Specifier; -- SINGLE COLOR()
	end record;
    for Pex_Line_Bundle_Entry use
	record
	    Line_Type at 0 * Word_Size range 0 .. 15;
	    Polyline_Interp at 0 * Word_Size + 2 range 0 .. 15;
	    Curve_Approx at 2 * Word_Size
	       range 0 .. 32 * Pex_Curve_Approx_Word_Size - 1;
	    Line_Width at (Pex_Curve_Approx_Word_Size + 2) * Word_Size
	       range 0 .. 63;
	    Line_Color at (Pex_Curve_Approx_Word_Size + 4) * Word_Size
	       range 0 .. 31;
	end record;
    type Pex_Marker_Bundle_Entry is
	record
	    Marker_Type : Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Short;
	    Marker_Scale : Pex_Float;
	    Marker_Color : Pex_Color_Specifier; -- SINGLE COLOR()
	end record;

    for Pex_Marker_Bundle_Entry use
	record
	    Marker_Type at 0 * Word_Size range 0 .. 15;
	    Unused at 0 * Word_Size + 2 range 0 .. 15;
	    Marker_Scale at 2 * Word_Size range 0 .. 63;
	    Marker_Color at 4 * Word_Size range 0 .. 31;
	end record;
    Pex_Marker_Bundle_Entry_Word_Size : constant := 5;

    type Pex_Text_Bundle_Entry is
	record
	    Text_Font_Index : X_Configuration_Dependent.Card16;
	    Text_Precision : X_Configuration_Dependent.Card16;
	    Char_Expansion : Pex_Float;
	    Char_Spacing : Pex_Float;
	    Text_Color : Pex_Color_Specifier; -- SINGLE COLOR()
	end record;

    for Pex_Text_Bundle_Entry use
	record
	    Text_Font_Index at 0 * Word_Size range 0 .. 15;
	    Text_Precision at 0 * Word_Size + 2 range 0 .. 15;
	    Char_Expansion at 2 * Word_Size range 0 .. 63;
	    Char_Spacing at 4 * Word_Size range 0 .. 63;
	    Text_Color at 6 * Word_Size range 0 .. 31;
	end record;

    Pex_Text_Bundle_Entry_Word_Size : constant := 7;

    -- Note that since an InteriorBundleEntry contains 4 embedded instances of 
    -- PEX_ColorSpecifier, a variable-sized item, a data structure cannot be
    -- defined for it.

    type Pex_Interior_Bundle_Entry is
	record
	    Interior_Style : Pex_Enum_Type_Index;
	    Interior_Style_Index : X_Configuration_Dependent.Short;
	    Reflection_Model : Pex_Enum_Type_Index;
	    Surface_Interp : Pex_Enum_Type_Index;
	    Bf_Interior_Style : Pex_Enum_Type_Index;
	    Bf_Interior_Style_Index : X_Configuration_Dependent.Short;
	    Bf_Reflection_Model : Pex_Enum_Type_Index;
	    Bf_Surface_Interp : Pex_Enum_Type_Index;
	    Surface_Approx : Pex_Surface_Approx;
	end record;

    for Pex_Interior_Bundle_Entry use
	record
	    Interior_Style at 0 * Word_Size range 0 .. 15;
	    Interior_Style_Index at 0 * Word_Size + 2 range 0 .. 15;
	    Reflection_Model at 1 * Word_Size range 0 .. 15;
	    Surface_Interp at 1 * Word_Size + 2 range 0 .. 15;
	    Bf_Interior_Style at 2 * Word_Size range 0 .. 15;
	    Bf_Interior_Style_Index at 2 * Word_Size + 2 range 0 .. 15;
	    Bf_Reflection_Model at 3 * Word_Size range 0 .. 15;
	    Bf_Surface_Interp at 3 * Word_Size + 2 range 0 .. 15;
	    Surface_Approx at 4 * Word_Size
	       range 0 .. 32 * Pex_Surface_Approx_Word_Size - 1;
	end record;

    type Pex_Edge_Bundle_Entry is
	record
	    Edges : Pex_Switch;
	    Unused : X_Configuration_Dependent.Card8;
	    Edge_Type : Pex_Enum_Type_Index;
	    Edge_Width : Pex_Float;
	    Edge_Color : Pex_Color_Specifier;
	end record;

    for Pex_Edge_Bundle_Entry use
	record
	    Edges at 0 * Word_Size range 0 .. 7;
	    Unused at 0 * Word_Size + 1 range 0 .. 7;
	    Edge_Type at 0 * Word_Size + 2 range 0 .. 15;
	    Edge_Width at 2 * Word_Size range 0 .. 63;
	    Edge_Color at 4 * Word_Size range 0 .. 31;
	end record;

    Pex_Edge_Bundle_Entry_Size : constant := 5;

    type Pex_Pattern_Entry is
	record
	    Color_Type : Pex_Color_Type;
	    Num_X : X_Configuration_Dependent.Card16;
	    Num_Y : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Pattern_Entry use
	record
	    Color_Type at 0 * Word_Size range 0 .. 15;
	    Num_X at 0 * Word_Size + 2 range 0 .. 15;
	    Num_Y at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    -- a PEX_Color_Entry is just a PEX_Color_Specifier
    type Pex_Text_Font_Entry is
	record
	    Num_Fonts : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Text_Font_Entry use
	record
	    Num_Fonts at 0 * Word_Size range 0 .. 31;
	end record;

    -- a PEX_View_Entry is defined above

    type Pex_Light_Entry is
	record
	    Light_Type : Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Short;
	    Direction : Pex_Vector3D;
	    Point : Pex_Coord3D;
	    Concentration : Pex_Float;
	    Spread_Angle : Pex_Float;
	    Attenuation1 : Pex_Float;
	    Attenuation2 : Pex_Float;
	    Light_Color : Pex_Color_Specifier;
	end record;

    for Pex_Light_Entry use
	record
	    Light_Type at 0 * Word_Size range 0 .. 15;
	    Unused at 0 * Word_Size + 2 range 0 .. 15;
	    Direction at 1 * Word_Size range 0 .. 32 * 6 - 1;
	    Point at 7 * Word_Size range 0 .. 32 * 6 - 1;
	    Concentration at 14 * Word_Size range 0 .. 63;
	    Spread_Angle at 16 * Word_Size range 0 .. 63;
	    Attenuation1 at 18 * Word_Size range 0 .. 63;
	    Attenuation2 at 20 * Word_Size range 0 .. 63;
	    Light_Color at 22 * Word_Size range 0 .. 31;
	end record;

    Pex_Light_Entry_Word_Size : constant := 23;

    type Pex_Depth_Cue_Entry is
	record
	    Mode : Pex_Switch;
	    Unused : X_Configuration_Dependent.Card8;
	    Unused2 : X_Configuration_Dependent.Card16;
	    Front_Plane : Pex_Float;
	    Back_Plane : Pex_Float;
	    Front_Scaling : Pex_Float;
	    Back_Scaling : Pex_Float;
	    Depth_Cue_Color : Pex_Color_Specifier;
	end record;

    for Pex_Depth_Cue_Entry use
	record
	    Mode at 0 * Word_Size range 0 .. 7;
	    Unused at 0 * Word_Size + 1 range 0 .. 7;
	    Unused2 at 0 * Word_Size + 2 range 0 .. 15;
	    Front_Plane at 2 * Word_Size range 0 .. 63;
	    Back_Plane at 4 * Word_Size range 0 .. 63;
	    Front_Scaling at 6 * Word_Size range 0 .. 63;
	    Back_Scaling at 8 * Word_Size range 0 .. 63;
	    Depth_Cue_Color at 10 * Word_Size range 0 .. 31;
	end record;

    Pex_Depth_Cue_Entry_Word_Size : constant := 11;

    type Pex_Color_Approx_Entry is
	record
	    Approx_Type : X_Configuration_Dependent.Short;
	    Approx_Model : X_Configuration_Dependent.Short;
	    Max1 : X_Configuration_Dependent.Card16;
	    Max2 : X_Configuration_Dependent.Card16;
	    Max3 : X_Configuration_Dependent.Card16;
	    Dither : X_Configuration_Dependent.Card8;
	    Unused : X_Configuration_Dependent.Card8;
	    Mult1 : X_Configuration_Dependent.Card32;
	    Mult2 : X_Configuration_Dependent.Card32;
	    Mult3 : X_Configuration_Dependent.Card32;
	    Weight1 : Pex_Float;
	    Weight2 : Pex_Float;
	    Weight3 : Pex_Float;
	    Base_Pixel : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Color_Approx_Entry use
	record
	    Approx_Type at 0 * Word_Size range 0 .. 15;
	    Approx_Model at 0 * Word_Size + 2 range 0 .. 15;
	    Max1 at 1 * Word_Size range 0 .. 15;
	    Max2 at 1 * Word_Size + 2 range 0 .. 15;
	    Max3 at 2 * Word_Size range 0 .. 15;
	    Dither at 2 * Word_Size + 2 range 0 .. 7;
	    Unused at 2 * Word_Size + 3 range 0 .. 7;
	    Mult1 at 3 * Word_Size range 0 .. 31;
	    Mult2 at 4 * Word_Size range 0 .. 31;
	    Mult3 at 5 * Word_Size range 0 .. 31;
	    Weight1 at 6 * Word_Size range 0 .. 63;
	    Weight2 at 8 * Word_Size range 0 .. 63;
	    Weight3 at 10 * Word_Size range 0 .. 63;
	    Base_Pixel at 12 * Word_Size range 0 .. 31;
	end record;

    --  Font structures

    type Pex_Font_Prop is
	record
	    Name : X_Lib.Atoms.Atom;
	    Value : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Font_Prop use
	record
	    Name at 0 * Word_Size range 0 .. 31;
	    Value at 1 * Word_Size range 0 .. 31;
	end record;

    type Pex_Font_Info is
	record
	    First_Glyph : X_Configuration_Dependent.Card32;
	    Last_Glyph : X_Configuration_Dependent.Card32;
	    Default_Glyph : X_Configuration_Dependent.Card32;
	    All_Exist : Pex_Switch;
	    Stroke_Font : Pex_Switch;
	    Unused : X_Configuration_Dependent.Card16;
	    Num_Props : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Font_Info use
	record
	    First_Glyph at 0 * Word_Size range 0 .. 31;
	    Last_Glyph at 1 * Word_Size range 0 .. 31;
	    Default_Glyph at 2 * Word_Size range 0 .. 31;
	    All_Exist at 3 * Word_Size range 0 .. 7;
	    Stroke_Font at 3 * Word_Size + 1 range 0 .. 7;
	    Unused at 3 * Word_Size + 2 range 0 .. 15;
	    Num_Props at 4 * Word_Size range 0 .. 31;
	end record;

    -- Text Structures

    type Pex_Mono_Encoding is
	record
	    Character_Set : X_Configuration_Dependent.Short;
	    Character_Set_Width : X_Configuration_Dependent.Card8;
	    Encoding_State : X_Configuration_Dependent.Card8;
	    Unused : X_Configuration_Dependent.Card16;
	    Num_Chars : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Mono_Encoding use
	record
	    Character_Set at 0 * Word_Size range 0 .. 15;
	    Character_Set_Width at 0 * Word_Size + 2 range 0 .. 7;
	    Encoding_State at 0 * Word_Size + 3 range 0 .. 7;
	    Unused at 1 * Word_Size range 0 .. 15;
	    Num_Chars at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    -- CHARACTER is either a CARD8, a CARD16, or a CARD32
    -- Parametric Surface Characteristics    types
    --    type 1 None
    --    type 2 Implementation Dependent

    type Pex_Psc_Isoparametric_Curves is
	record
	    Placement_Type : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	    Num_Ucurves : X_Configuration_Dependent.Card16;
	    Num_Vcurves : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Psc_Isoparametric_Curves use
	record
	    Placement_Type at 0 * Word_Size range 0 .. 15;
	    Unused at 0 * Word_Size + 2 range 0 .. 15;
	    Num_Ucurves at 1 * Word_Size range 0 .. 15;
	    Num_Vcurves at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Psc_Level_Curves is
	record
	    Origin : Pex_Coord3D;
	    Direction : Pex_Vector3D;
	    Number_Intersections : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Psc_Level_Curves use
	record
	    Origin at 0 * Word_Size range 0 .. 32 * 6 - 1;
	    Direction at 6 * Word_Size range 0 .. 32 * 6 - 1;
	    Number_Intersections at 12 * Word_Size range 0 .. 15;
	    Pad at 12 * Word_Size + 2 range 0 .. 15;
	end record;

    -- Pick Device data records

    type Pex_Pd_Dc_Hit_Box is
	record
	    Position : Pex_Device_Coord2D;
	    Distance : Pex_Float;
	end record;

    for Pex_Pd_Dc_Hit_Box use
	record
	    Position at 0 * Word_Size range 0 .. 31;
	    Distance at 2 * Word_Size range 0 .. 63;
	end record;

    Pex_Pd_Dc_Hit_Box_Word_Size : constant := 4;

    subtype Pex_Pd_Npc_Hit_Volume is Pex_Npc_Subvolume;   -- pick device 2

    -- Output Command errors

    type Pex_Output_Command_Error is
	record
	    Types : X_Configuration_Dependent.Card8;
	    Error_Code : X_Configuration_Dependent.Card8;
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Resource_Id : X_Configuration_Dependent.Card32;
	    Minor_Code : X_Configuration_Dependent.Card16;
	    Major_Code : X_Configuration_Dependent.Card8;
	    Unused : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card16;
	    Num_Commands : X_Configuration_Dependent.Card16;
	    Pad : X_Lib.Byte_Array (1 .. 16);
	end record;

    for Pex_Output_Command_Error use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    Error_Code at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Resource_Id at 1 * Word_Size range 0 .. 31;
	    Minor_Code at 2 * Word_Size range 0 .. 15;
	    Major_Code at 2 * Word_Size + 2 range 0 .. 7;
	    Unused at 2 * Word_Size + 3 range 0 .. 7;
	    Opcode at 3 * Word_Size range 0 .. 15;
	    Num_Commands at 3 * Word_Size + 2 range 0 .. 15;
	    Pad at 4 * Word_Size range 0 .. 8 * 16 - 1;
	end record;
end Pex_Proto_St;

--package body PEX_Proto_St is end PEX_Proto_St;
