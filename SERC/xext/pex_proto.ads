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

with X_Lib, X_Configuration_Dependent, Pex_Proto_St;

package Pex_Proto is
    Word_Size : constant := X_Configuration_Dependent.Word_Size;

-- Matches revision 5.0P

    -- REPLIES
    type Card8_Array is array (Natural range <>) of
			   X_Configuration_Dependent.Card8;

    type Pex_Get_Extension_Info_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Major_Version : X_Configuration_Dependent.Card16;
	    Minor_Version : X_Configuration_Dependent.Card16;
	    Release : X_Configuration_Dependent.Card32;
	    Length_Name : X_Configuration_Dependent.Card32;
	    Subset_Info : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 8);
	end record;

    for Pex_Get_Extension_Info_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Major_Version at 2 * Word_Size range 0 .. 15;
	    Minor_Version at 2 * Word_Size + 2 range 0 .. 15;
	    Release at 3 * Word_Size range 0 .. 31;
	    Length_Name at 4 * Word_Size range 0 .. 31;
	    Subset_Info at 5 * Word_Size range 0 .. 31;
	    Pad at 6 * Word_Size range 0 .. 8 * 8 - 1;
	end record;

    type Pex_Get_Enumerated_Type_Info_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Num_Lists : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 20);
	    --lists of lists begin afterwards
	end record;

    for Pex_Get_Enumerated_Type_Info_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Num_Lists at 2 * Word_Size range 0 .. 31;
	    Pad at 3 * Word_Size range 0 .. 8 * 20 - 1;
	end record;

    type Pex_Get_Imp_Dep_Constants_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 24);
	end record;

    for Pex_Get_Imp_Dep_Constants_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad at 2 * Word_Size range 0 .. 8 * 24 - 1;
	end record;

    type Pex_Get_Table_Info_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- 0
	    Unused : X_Configuration_Dependent.Card16;
	    Definable_Entries : X_Configuration_Dependent.Card16;
	    Num_Predefined : X_Configuration_Dependent.Card16;
	    Predefined_Min : X_Configuration_Dependent.Card16;
	    Predefined_Max : X_Configuration_Dependent.Card16;
	    Pad : X_Lib.Byte_Array (1 .. 14);
	end record;

    for Pex_Get_Table_Info_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Unused at 2 * Word_Size range 0 .. 15;
	    Definable_Entries at 2 * Word_Size + 2 range 0 .. 15;
	    Num_Predefined at 3 * Word_Size range 0 .. 15;
	    Predefined_Min at 3 * Word_Size + 2 range 0 .. 15;
	    Predefined_Max at 4 * Word_Size range 0 .. 15;
	    Pad at 4 * Word_Size + 2 range 0 .. 8 * 14 - 1;
	end record;

    type Pex_Get_Predefined_Entries_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;  -- not 0
	    Unused : X_Configuration_Dependent.Card32;
	    Num_Entries : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 16);
	end record;

    for Pex_Get_Predefined_Entries_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Unused at 2 * Word_Size range 0 .. 31;
	    Num_Entries at 3 * Word_Size range 0 .. 31;
	    Pad at 4 * Word_Size + 2 range 0 .. 8 * 16 - 1;
	end record;

    type Pex_Get_Defined_Indices_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Num_Indices : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 20);
	end record;

    for Pex_Get_Defined_Indices_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Num_Indices at 2 * Word_Size range 0 .. 31;
	    Pad at 3 * Word_Size range 0 .. 8 * 20 - 1;
	end record;

    type Pex_Get_Table_Entry_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Status : X_Configuration_Dependent.Card16;
	    Table_Type : X_Configuration_Dependent.Card16;
	    Pad : X_Lib.Byte_Array (1 .. 20);
	end record;

    for Pex_Get_Table_Entry_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Status at 2 * Word_Size range 0 .. 15;
	    Table_Type at 2 * Word_Size + 2 range 0 .. 15;
	    Pad at 3 * Word_Size range 0 .. 8 * 20 - 1;
	end record;

    type Pex_Get_Table_Entries_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Table_Type : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	    Num_Entries : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 16);
	end record;

    for Pex_Get_Table_Entries_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Table_Type at 2 * Word_Size range 0 .. 15;
	    Unused at 2 * Word_Size + 2 range 0 .. 15;
	    Num_Entries at 3 * Word_Size range 0 .. 31;
	    Pad at 4 * Word_Size range 0 .. 8 * 16 - 1;
	end record;

    type Pex_Get_Pipeline_Context_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 24);
	end record;

    for Pex_Get_Pipeline_Context_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad at 2 * Word_Size range 0 .. 8 * 24 - 1;
	end record;

    type Pex_Get_Renderer_Attributes_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 24);
	end record;

    for Pex_Get_Renderer_Attributes_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad at 2 * Word_Size range 0 .. 8 * 24 - 1;
	end record;

    type Pex_Get_Renderer_Dynamics_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Tables : Pex_Proto_St.Pex_Bitmask;
	    Namesets : Pex_Proto_St.Pex_Bitmask;
	    Attributes : Pex_Proto_St.Pex_Bitmask;
	    Pad : X_Lib.Byte_Array (1 .. 12);
	end record;

    for Pex_Get_Renderer_Dynamics_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Tables at 2 * Word_Size range 0 .. 31;
	    Namesets at 3 * Word_Size range 0 .. 31;
	    Attributes at 4 * Word_Size range 0 .. 31;
	    Pad at 5 * Word_Size range 0 .. 8 * 12 - 1;
	end record;

    type Pex_Get_Structure_Info_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Edit_Mode : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	    Element_Ptr : X_Configuration_Dependent.Card32;
	    Num_Elements : X_Configuration_Dependent.Card32;
	    Length_Structure : X_Configuration_Dependent.Card32;
	    Has_Refs : X_Configuration_Dependent.Card16;
	    Pad : X_Lib.Byte_Array (1 .. 6);
	end record;

    for Pex_Get_Structure_Info_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Edit_Mode at 2 * Word_Size range 0 .. 15;
	    Unused at 2 * Word_Size + 2 range 0 .. 15;
	    Element_Ptr at 3 * Word_Size range 0 .. 31;
	    Num_Elements at 4 * Word_Size range 0 .. 31;
	    Length_Structure at 5 * Word_Size range 0 .. 31;
	    Has_Refs at 6 * Word_Size range 0 .. 15;
	    Pad at 6 * Word_Size + 2 range 0 .. 8 * 6 - 1;
	end record;

    type Pex_Get_Element_Info_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Num_Info : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 20);
	end record;

    for Pex_Get_Element_Info_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Num_Info at 2 * Word_Size range 0 .. 31;
	    Pad at 3 * Word_Size range 0 .. 8 * 20 - 1;
	end record;

    type Pex_Get_Structures_In_Network_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Unused : Card8_Array (1 .. 8);
	    Num_Structures : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 12);
	end record;

    for Pex_Get_Structures_In_Network_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Unused at 2 * Word_Size range 0 .. 8 * 8 - 1;
	    Num_Structures at 4 * Word_Size range 0 .. 31;
	    Pad at 5 * Word_Size range 0 .. 8 * 12 - 1;
	end record;

    type Pex_Get_Ancestors_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Unused : Card8_Array (1 .. 12);
	    Num_Paths : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 8);
	end record;

    for Pex_Get_Ancestors_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Unused at 2 * Word_Size range 0 .. 8 * 12 - 1;
	    Num_Paths at 5 * Word_Size range 0 .. 31;
	    Pad at 6 * Word_Size range 0 .. 8 * 8 - 1;
	end record;

    subtype Pex_Get_Descendants_Reply is Pex_Get_Ancestors_Reply;

    type Pex_Fetch_Elements_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Num_Elements : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 20);
	end record;

    for Pex_Fetch_Elements_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Num_Elements at 2 * Word_Size range 0 .. 31;
	    Pad at 3 * Word_Size range 0 .. 8 * 20 - 1;
	end record;

    type Pex_Element_Search_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Status : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	    Found_Offset : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 16);
	end record;

    for Pex_Element_Search_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Status at 2 * Word_Size range 0 .. 15;
	    Unused at 2 * Word_Size + 2 range 0 .. 15;
	    Found_Offset at 3 * Word_Size range 0 .. 31;
	    Pad at 4 * Word_Size range 0 .. 8 * 16 - 1;
	end record;

    type Pex_Get_Name_Set_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Num_Names : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 20);
	end record;

    for Pex_Get_Name_Set_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Num_Names at 2 * Word_Size range 0 .. 31;
	    Pad at 3 * Word_Size range 0 .. 8 * 20 - 1;
	end record;

    type Pex_Get_Search_Context_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 24);
	end record;

    for Pex_Get_Search_Context_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad at 2 * Word_Size range 0 .. 8 * 24 - 1;
	end record;

    type Pex_Search_Network_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Unused : X_Configuration_Dependent.Card32;
	    Num_Items : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 16);
	end record;

    for Pex_Search_Network_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Unused at 2 * Word_Size range 0 .. 31;
	    Num_Items at 3 * Word_Size range 0 .. 31;
	    Pad at 4 * Word_Size range 0 .. 8 * 16 - 1;
	end record;

    type Pex_Get_Wks_Info_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 24);
	end record;

    for Pex_Get_Wks_Info_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad at 2 * Word_Size range 0 .. 8 * 24 - 1;
	end record;

    type Pex_Get_Dynamics_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    View_Rep : Pex_Proto_St.Pex_Dynamic_Type;
	    Marker_Bundle : Pex_Proto_St.Pex_Dynamic_Type;
	    Text_Bundle : Pex_Proto_St.Pex_Dynamic_Type;
	    Line_Bundle : Pex_Proto_St.Pex_Dynamic_Type;
	    Interior_Bundle : Pex_Proto_St.Pex_Dynamic_Type;
	    Edge_Bundle : Pex_Proto_St.Pex_Dynamic_Type;
	    Color_Table : Pex_Proto_St.Pex_Dynamic_Type;
	    Pattern_Table : Pex_Proto_St.Pex_Dynamic_Type;
	    Wks_Transform : Pex_Proto_St.Pex_Dynamic_Type;
	    Highlight_Filter : Pex_Proto_St.Pex_Dynamic_Type;
	    Invisibility_Filter : Pex_Proto_St.Pex_Dynamic_Type;
	    Hlhsr_Mode : Pex_Proto_St.Pex_Dynamic_Type;
	    Structure_Modify : Pex_Proto_St.Pex_Dynamic_Type;
	    Post_Structure : Pex_Proto_St.Pex_Dynamic_Type;
	    Unpost_Structure : Pex_Proto_St.Pex_Dynamic_Type;
	    Delete_Structure : Pex_Proto_St.Pex_Dynamic_Type;
	    Reference_Modify : Pex_Proto_St.Pex_Dynamic_Type;
	    Buffer_Modif : Pex_Proto_St.Pex_Dynamic_Type;
	    Light_Table : Pex_Proto_St.Pex_Dynamic_Type;
	    Depthcue_Table : Pex_Proto_St.Pex_Dynamic_Type;
	    Color_Approx_Table : Pex_Proto_St.Pex_Dynamic_Type;
	    Unused : Card8_Array (1 .. 3);
	end record;

    for Pex_Get_Dynamics_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    View_Rep at 2 * Word_Size range 0 .. 7;
	    Marker_Bundle at 2 * Word_Size + 1 range 0 .. 7;
	    Text_Bundle at 2 * Word_Size + 2 range 0 .. 7;
	    Line_Bundle at 2 * Word_Size + 3 range 0 .. 7;
	    Interior_Bundle at 3 * Word_Size range 0 .. 7;
	    Edge_Bundle at 3 * Word_Size + 1 range 0 .. 7;
	    Color_Table at 3 * Word_Size + 2 range 0 .. 7;
	    Pattern_Table at 3 * Word_Size + 3 range 0 .. 7;
	    Wks_Transform at 4 * Word_Size range 0 .. 7;
	    Highlight_Filter at 4 * Word_Size + 1 range 0 .. 7;
	    Invisibility_Filter at 4 * Word_Size + 2 range 0 .. 7;
	    Hlhsr_Mode at 4 * Word_Size + 3 range 0 .. 7;
	    Structure_Modify at 5 * Word_Size range 0 .. 7;
	    Post_Structure at 5 * Word_Size + 1 range 0 .. 7;
	    Unpost_Structure at 5 * Word_Size + 2 range 0 .. 7;
	    Delete_Structure at 5 * Word_Size + 3 range 0 .. 7;
	    Reference_Modify at 6 * Word_Size range 0 .. 7;
	    Buffer_Modif at 6 * Word_Size + 1 range 0 .. 7;
	    Light_Table at 6 * Word_Size + 2 range 0 .. 7;
	    Depthcue_Table at 6 * Word_Size + 3 range 0 .. 7;
	    Color_Approx_Table at 7 * Word_Size range 0 .. 7;
	    Unused at 7 * Word_Size + 1 range 0 .. 8 * 3 - 1;
	end record;

    type Pex_Get_View_Rep_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    View_Update : X_Configuration_Dependent.
			     Card16; -- Pending, NotPending
	    Pad : X_Lib.Byte_Array (1 .. 22);
	end record;

    for Pex_Get_View_Rep_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    View_Update at 2 * Word_Size range 0 .. 15;
	    Pad at 2 * Word_Size + 2 range 0 .. 8 * 22 - 1;
	end record;

    type Pex_Map_Dc_To_Wc_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    View_Index : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	    Num_Coords : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 16);
	end record;

    for Pex_Map_Dc_To_Wc_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    View_Index at 2 * Word_Size range 0 .. 15;
	    Unused at 2 * Word_Size + 2 range 0 .. 15;
	    Num_Coords at 3 * Word_Size range 0 .. 31;
	    Pad at 4 * Word_Size range 0 .. 8 * 16 - 1;
	end record;

    type Pex_Map_Wc_To_Dc_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Unused : X_Configuration_Dependent.Card32;
	    Num_Coords : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 16);
	end record;

    for Pex_Map_Wc_To_Dc_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Unused at 2 * Word_Size range 0 .. 31;
	    Num_Coords at 3 * Word_Size range 0 .. 31;
	    Pad at 4 * Word_Size + 2 range 0 .. 8 * 16 - 1;
	end record;

    type Pex_Get_Wks_Postings_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 24);
	end record;

    for Pex_Get_Wks_Postings_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad at 2 * Word_Size range 0 .. 8 * 24 - 1;
	end record;

    type Pex_Get_Pick_Device_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 24);
	end record;

    for Pex_Get_Pick_Device_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad at 2 * Word_Size range 0 .. 8 * 24 - 1;
	end record;

    type Pex_Get_Pick_Measure_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 24);
	end record;

    for Pex_Get_Pick_Measure_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad at 2 * Word_Size range 0 .. 8 * 24 - 1;
	end record;

    type Pex_Query_Font_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Length_Font_Info : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 20);
	end record;

    for Pex_Query_Font_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Length_Font_Info at 2 * Word_Size range 0 .. 31;
	    Pad at 3 * Word_Size range 0 .. 8 * 20 - 1;
	end record;

    type Pex_List_Fonts_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Num_Strings : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 20);
	end record;

    for Pex_List_Fonts_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Num_Strings at 2 * Word_Size range 0 .. 31;
	    Pad at 3 * Word_Size range 0 .. 8 * 20 - 1;
	end record;

    type Pex_List_Fonts_With_Info_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Num_Strings : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 20);
	end record;

    for Pex_List_Fonts_With_Info_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Num_Strings at 2 * Word_Size range 0 .. 31;
	    Pad at 3 * Word_Size range 0 .. 8 * 20 - 1;
	end record;

    type Pex_Query_Text_Extents_Reply is
	record
	    Types : X_Configuration_Dependent.Byte;    -- X_Reply
	    What : X_Configuration_Dependent.Card8;   -- unused
	    Sequence_Number : X_Configuration_Dependent.Card16;
	    Length : X_Configuration_Dependent.Card32;
	    Pad : X_Lib.Byte_Array (1 .. 24);
	end record;

    for Pex_Query_Text_Extents_Reply use
	record
	    Types at 0 * Word_Size range 0 .. 7;
	    What at 0 * Word_Size + 1 range 0 .. 7;
	    Sequence_Number at 0 * Word_Size + 2 range 0 .. 15;
	    Length at 1 * Word_Size range 0 .. 31;
	    Pad at 2 * Word_Size range 0 .. 8 * 24 - 1;
	end record;

    -- REQUESTS
    -- Request structure

    -- length in 4 bytes quantities of whole request, including this header
    type Pex_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.
			Card8;-- meaning depends on request type
	    Length : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	end record;

    --  structures that follow request.

    -- ResourceReq is used for any request which has a resource ID
    -- ( or Atom or Time ) as its one and only argument. 

    type Pex_Resource_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Id : X_Configuration_Dependent.Card32;
	    -- a Structure, Renderer, Font, LUT, etc.
	end record;

    --  Specific Requests 

    for Pex_Resource_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Id at 1 * Word_Size range 0 .. 31;
	end record;

    --  Specific Requests 

    type Pex_Get_Extension_Info_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Client_Protocol_Major : X_Configuration_Dependent.Card16;
	    Client_Protocol_Minor : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Get_Extension_Info_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Client_Protocol_Major at 1 * Word_Size range 0 .. 15;
	    Client_Protocol_Minor at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Get_Enumerated_Type_Info_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Drawable : X_Lib.Drawable;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask;
	    Num_Enums : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Get_Enumerated_Type_Info_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Drawable at 1 * Word_Size range 0 .. 31;
	    Item_Mask at 2 * Word_Size range 0 .. 31;
	    Num_Enums at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Get_Imp_Dep_Constants_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Drawable : X_Lib.Drawable;
	    Num_Names : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Get_Imp_Dep_Constants_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Drawable at 2 * Word_Size range 0 .. 31;
	    Num_Names at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Create_Lookup_Table_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Drawable_Example : X_Lib.Drawable;
	    Lut : Pex_Proto_St.Pex_Lookup_Table;
	    Table_Type : Pex_Proto_St.Pex_Table_Type;
	    Unused : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Create_Lookup_Table_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Drawable_Example at 1 * Word_Size range 0 .. 31;
	    Lut at 2 * Word_Size range 0 .. 31;
	    Table_Type at 3 * Word_Size range 0 .. 15;
	    Unused at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Copy_Lookup_Table_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Src : Pex_Proto_St.Pex_Lookup_Table;
	    Dst : Pex_Proto_St.Pex_Lookup_Table;
	end record;

    for Pex_Copy_Lookup_Table_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Src at 1 * Word_Size range 0 .. 31;
	    Dst at 2 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Free_Lookup_Table_Req is Pex_Resource_Req;

    type Pex_Get_Table_Info_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Drawable_Example : X_Lib.Drawable;
	    Table_Type : Pex_Proto_St.Pex_Table_Type;
	    Unused : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Get_Table_Info_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Drawable_Example at 1 * Word_Size range 0 .. 31;
	    Table_Type at 2 * Word_Size range 0 .. 15;
	    Unused at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Get_Predefined_Entries_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Drawable_Example : X_Lib.Drawable;
	    Table_Type : Pex_Proto_St.Pex_Table_Type;
	    Start : Pex_Proto_St.Pex_Table_Index;
	    Count : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Get_Predefined_Entries_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Drawable_Example at 2 * Word_Size range 0 .. 31;
	    Table_Type at 3 * Word_Size range 0 .. 15;
	    Start at 3 * Word_Size + 2 range 0 .. 15;
	    Count at 4 * Word_Size range 0 .. 15;
	    Pad at 4 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype Pex_Get_Defined_Indices_Req is Pex_Resource_Req;

    type Pex_Get_Table_Entry_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Value_Type : X_Configuration_Dependent.Card16;
	    Lut : Pex_Proto_St.Pex_Lookup_Table;
	    Index : Pex_Proto_St.Pex_Table_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Get_Table_Entry_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Value_Type at 1 * Word_Size + 2 range 0 .. 15;
	    Lut at 2 * Word_Size range 0 .. 31;
	    Index at 3 * Word_Size range 0 .. 15;
	    Pad at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Get_Table_Entries_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Value_Type : X_Configuration_Dependent.Card16;
	    Lut : Pex_Proto_St.Pex_Lookup_Table;
	    Start : Pex_Proto_St.Pex_Table_Index;
	    Count : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Get_Table_Entries_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Value_Type at 1 * Word_Size + 2 range 0 .. 15;
	    Lut at 2 * Word_Size range 0 .. 31;
	    Start at 3 * Word_Size range 0 .. 15;
	    Count at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Set_Table_Entries_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Lut : Pex_Proto_St.Pex_Lookup_Table;
	    Start : Pex_Proto_St.Pex_Table_Index;
	    Count : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Set_Table_Entries_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Lut at 2 * Word_Size range 0 .. 31;
	    Start at 3 * Word_Size range 0 .. 15;
	    Count at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Delete_Table_Entries_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Lut : Pex_Proto_St.Pex_Lookup_Table;
	    Start : Pex_Proto_St.Pex_Table_Index;
	    Count : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Delete_Table_Entries_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Lut at 1 * Word_Size range 0 .. 31;
	    Start at 2 * Word_Size range 0 .. 15;
	    Count at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Create_Pipeline_Context_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Pc : Pex_Proto_St.Pex_Pc;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask_Array (1 .. 3);
	end record;

    for Pex_Create_Pipeline_Context_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Pc at 2 * Word_Size range 0 .. 31;
	    Item_Mask at 3 * Word_Size range 0 .. 32 * 3 - 1;
	end record;

    type Pex_Copy_Pipeline_Context_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Src : Pex_Proto_St.Pex_Pc;
	    Dst : Pex_Proto_St.Pex_Pc;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask_Array (1 .. 3);
	end record;

    for Pex_Copy_Pipeline_Context_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Src at 1 * Word_Size range 0 .. 31;
	    Dst at 2 * Word_Size range 0 .. 31;
	    Item_Mask at 3 * Word_Size range 0 .. 32 * 3 - 1;
	end record;

    subtype Pex_Free_Pipeline_Context_Req is Pex_Resource_Req;

    type Pex_Get_Pipeline_Context_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Pc : Pex_Proto_St.Pex_Pc;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask_Array (1 .. 3);
	end record;

    for Pex_Get_Pipeline_Context_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Pc at 2 * Word_Size range 0 .. 31;
	    Item_Mask at 3 * Word_Size range 0 .. 32 * 3 - 1;
	end record;

    type Pex_Change_Pipeline_Context_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Pc : Pex_Proto_St.Pex_Pc;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask_Array (1 .. 3);
	end record;

    for Pex_Change_Pipeline_Context_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Pc at 2 * Word_Size range 0 .. 31;
	    Item_Mask at 3 * Word_Size range 0 .. 32 * 3 - 1;
	end record;

    type Pex_Create_Renderer_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Rdr : Pex_Proto_St.Pex_Renderer;
	    Drawable : X_Lib.Drawable;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask;
	end record;

    for Pex_Create_Renderer_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Rdr at 2 * Word_Size range 0 .. 31;
	    Drawable at 3 * Word_Size range 0 .. 31;
	    Item_Mask at 4 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Free_Renderer_Req is Pex_Resource_Req;

    type Pex_Change_Renderer_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Rdr : Pex_Proto_St.Pex_Renderer;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask;
	end record;

    for Pex_Change_Renderer_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Rdr at 2 * Word_Size range 0 .. 31;
	    Item_Mask at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Get_Renderer_Attributes_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Rdr : Pex_Proto_St.Pex_Renderer;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask;
	end record;

    for Pex_Get_Renderer_Attributes_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Rdr at 2 * Word_Size range 0 .. 31;
	    Item_Mask at 3 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Get_Renderer_Dynamics_Req is Pex_Resource_Req;

    type Pex_Begin_Rendering_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Rdr : Pex_Proto_St.Pex_Renderer;
	    Drawable : X_Lib.Drawable;
	end record;

    for Pex_Begin_Rendering_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Rdr at 1 * Word_Size range 0 .. 31;
	    Drawable at 2 * Word_Size range 0 .. 31;
	end record;

    type Pex_End_Rendering_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Rdr : Pex_Proto_St.Pex_Renderer;
	    Flushflag : Pex_Proto_St.Pex_Switch;
	    Pad : X_Lib.Byte_Array (1 .. 3);
	end record;

    for Pex_End_Rendering_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Rdr at 1 * Word_Size range 0 .. 31;
	    Flushflag at 2 * Word_Size range 0 .. 7;
	    Pad at 2 * Word_Size range 8 .. 31;
	end record;

    type Pex_Begin_Structure_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Rdr : Pex_Proto_St.Pex_Renderer;
	    Sid : Pex_Proto_St.Pex_Structure;
	end record;

    for Pex_Begin_Structure_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Rdr at 1 * Word_Size range 0 .. 31;
	    Sid at 2 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_End_Structure_Req is Pex_Resource_Req;

    type Pex_Render_Output_Commands_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Rdr : Pex_Proto_St.Pex_Renderer;
	    Num_Commands : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Render_Output_Commands_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Rdr at 2 * Word_Size range 0 .. 31;
	    Num_Commands at 3 * Word_Size range 0 .. 31;
	end record;

-- individual output commands may be found in the section "Output Commands"

    type Pex_Render_Network_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Rdr : Pex_Proto_St.Pex_Renderer;
	    Drawable : X_Lib.Drawable;
	    Sid : Pex_Proto_St.Pex_Structure;
	end record;

    for Pex_Render_Network_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Rdr at 1 * Word_Size range 0 .. 31;
	    Drawable at 2 * Word_Size range 0 .. 31;
	    Sid at 3 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Create_Structure_Req is Pex_Resource_Req;

    type Pex_Copy_Structure_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Src : Pex_Proto_St.Pex_Structure;
	    Dst : Pex_Proto_St.Pex_Structure;
	end record;

    for Pex_Copy_Structure_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Src at 1 * Word_Size range 0 .. 31;
	    Dst at 2 * Word_Size range 0 .. 31;
	end record;

    type Pex_Destroy_Structures_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Num_Structures : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Destroy_Structures_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Num_Structures at 1 * Word_Size range 0 .. 31;
	end record;

    type Pex_Get_Structure_Info_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Item_Mask : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	end record;

    for Pex_Get_Structure_Info_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Item_Mask at 1 * Word_Size + 2 range 0 .. 15;
	    Sid at 2 * Word_Size range 0 .. 31;
	end record;

    type Pex_Get_Element_Info_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Ranges : Pex_Proto_St.Pex_Element_Range;
	end record;

    for Pex_Get_Element_Info_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Sid at 2 * Word_Size range 0 .. 31;
	    Ranges at 3 * Word_Size range 0 .. 32 * 4 - 1;
	end record;

    type Pex_Get_Structures_In_Network_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Which : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Get_Structures_In_Network_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Sid at 1 * Word_Size range 0 .. 31;
	    Which at 2 * Word_Size range 0 .. 15;
	    Pad at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Get_Ancestors_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Path_Order : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	    Path_Depth : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Get_Ancestors_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Sid at 1 * Word_Size range 0 .. 31;
	    Path_Order at 2 * Word_Size range 0 .. 15;
	    Unused at 2 * Word_Size + 2 range 0 .. 15;
	    Path_Depth at 3 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Get_Descendants_Req is Pex_Get_Ancestors_Req;

    type Pex_Fetch_Elements_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Ranges : Pex_Proto_St.Pex_Element_Range;
	end record;

    for Pex_Fetch_Elements_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Sid at 2 * Word_Size range 0 .. 31;
	    Ranges at 3 * Word_Size range 0 .. 32 * 4 - 1;
	end record;

    type Pex_Set_Editing_Mode_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Mode : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Set_Editing_Mode_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Sid at 1 * Word_Size range 0 .. 31;
	    Mode at 2 * Word_Size range 0 .. 15;
	    Pad at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Set_Element_Pointer_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Position : Pex_Proto_St.Pex_Element_Pos;
	end record;

    for Pex_Set_Element_Pointer_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Sid at 1 * Word_Size range 0 .. 31;
	    Position at 2 * Word_Size range 0 .. 63;
	end record;

    type Pex_Set_Element_Pointer_At_Label_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Label : X_Lib.X_Integer;
	    Offset : X_Lib.X_Integer;
	end record;

    for Pex_Set_Element_Pointer_At_Label_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Sid at 1 * Word_Size range 0 .. 31;
	    Label at 2 * Word_Size range 0 .. 31;
	    Offset at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Element_Search_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Position : Pex_Proto_St.Pex_Element_Pos;
	    Direction : X_Configuration_Dependent.Card32;
	    Num_Incls : X_Configuration_Dependent.Card32;
	    Num_Excls : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Element_Search_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Sid at 1 * Word_Size range 0 .. 31;
	    Position at 2 * Word_Size range 0 .. 63;
	    Direction at 4 * Word_Size range 0 .. 31;
	    Num_Incls at 5 * Word_Size range 0 .. 31;
	    Num_Excls at 6 * Word_Size range 0 .. 31;
	end record;

    type Pex_Store_Elements_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Num_Commands : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Store_Elements_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Sid at 2 * Word_Size range 0 .. 31;
	    Num_Commands at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Delete_Elements_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Ranges : Pex_Proto_St.Pex_Element_Range;
	end record;

    for Pex_Delete_Elements_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Sid at 1 * Word_Size range 0 .. 31;
	    Ranges at 2 * Word_Size range 0 .. 32 * 4 - 1;
	end record;

    type Pex_Delete_Elements_To_Label_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Position : Pex_Proto_St.Pex_Element_Pos;
	    Label : X_Lib.X_Integer;
	end record;

    for Pex_Delete_Elements_To_Label_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Sid at 1 * Word_Size range 0 .. 31;
	    Position at 2 * Word_Size range 0 .. 63;
	    Label at 4 * Word_Size range 0 .. 31;
	end record;

    type Pex_Delete_Between_Labels_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Label1 : X_Lib.X_Integer;
	    Label2 : X_Lib.X_Integer;
	end record;

    for Pex_Delete_Between_Labels_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Sid at 1 * Word_Size range 0 .. 31;
	    Label1 at 2 * Word_Size range 0 .. 31;
	    Label2 at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Copy_Elements_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Src : Pex_Proto_St.Pex_Structure;
	    Src_Range : Pex_Proto_St.Pex_Element_Range;
	    Dst : Pex_Proto_St.Pex_Structure;
	    Position : Pex_Proto_St.Pex_Element_Pos;
	end record;

    for Pex_Copy_Elements_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Src at 1 * Word_Size range 0 .. 31;
	    Src_Range at 2 * Word_Size range 0 .. 32 * 4 - 1;
	    Dst at 6 * Word_Size range 0 .. 31;
	    Position at 7 * Word_Size range 0 .. 63;
	end record;

    type Pex_Change_Structure_Refs_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Old_Id : Pex_Proto_St.Pex_Structure;
	    New_Id : Pex_Proto_St.Pex_Structure;
	end record;

    for Pex_Change_Structure_Refs_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Old_Id at 1 * Word_Size range 0 .. 31;
	    New_Id at 2 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Create_Name_Set_Req is Pex_Resource_Req;

    type Pex_Copy_Name_Set_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Src : Pex_Proto_St.Pex_Name_Set;
	    Dst : Pex_Proto_St.Pex_Name_Set;
	end record;

    for Pex_Copy_Name_Set_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Src at 1 * Word_Size range 0 .. 31;
	    Dst at 2 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Free_Name_Set_Req is Pex_Resource_Req;

    subtype Pex_Get_Name_Set_Req is Pex_Resource_Req;

    type Pex_Change_Name_Set_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Ns : Pex_Proto_St.Pex_Name_Set;
	    Action : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Change_Name_Set_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Ns at 1 * Word_Size range 0 .. 31;
	    Action at 2 * Word_Size range 0 .. 15;
	    Unused at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Create_Search_Context_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Sc : Pex_Proto_St.Pex_Sc;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask;
	end record;

    for Pex_Create_Search_Context_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Sc at 2 * Word_Size range 0 .. 31;
	    Item_Mask at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Copy_Search_Context_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Src : Pex_Proto_St.Pex_Sc;
	    Dst : Pex_Proto_St.Pex_Sc;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask;
	end record;

    for Pex_Copy_Search_Context_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Src at 1 * Word_Size range 0 .. 31;
	    Dst at 2 * Word_Size range 0 .. 31;
	    Item_Mask at 3 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Free_Search_Context_Req is Pex_Resource_Req;

    type Pex_Get_Search_Context_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Sc : Pex_Proto_St.Pex_Sc;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask;
	end record;

    for Pex_Get_Search_Context_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Sc at 2 * Word_Size range 0 .. 31;
	    Item_Mask at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Change_Search_Context_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Sc : Pex_Proto_St.Pex_Sc;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask;
	end record;

    for Pex_Change_Search_Context_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Sc at 2 * Word_Size range 0 .. 31;
	    Item_Mask at 3 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Search_Network_Req is Pex_Resource_Req;

    type Pex_Create_Phigs_Wks_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Drawable : X_Lib.Drawable;
	    Marker_Bundle : Pex_Proto_St.Pex_Lookup_Table;
	    Text_Bundle : Pex_Proto_St.Pex_Lookup_Table;
	    Line_Bundle : Pex_Proto_St.Pex_Lookup_Table;
	    Interior_Bundle : Pex_Proto_St.Pex_Lookup_Table;
	    Edge_Bundle : Pex_Proto_St.Pex_Lookup_Table;
	    Color_Table : Pex_Proto_St.Pex_Lookup_Table;
	    Depth_Cue_Table : Pex_Proto_St.Pex_Lookup_Table;
	    Light_Table : Pex_Proto_St.Pex_Lookup_Table;
	    Color_Approx_Table : Pex_Proto_St.Pex_Lookup_Table;
	    Pattern_Table : Pex_Proto_St.Pex_Lookup_Table;
	    Text_Font_Table : Pex_Proto_St.Pex_Lookup_Table;
	    Highlight_Incl : Pex_Proto_St.Pex_Name_Set;
	    Highlight_Excl : Pex_Proto_St.Pex_Name_Set;
	    Invis_Incl : Pex_Proto_St.Pex_Name_Set;
	    Invis_Excl : Pex_Proto_St.Pex_Name_Set;
	    Buffer_Mode : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Create_Phigs_Wks_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Wks at 1 * Word_Size range 0 .. 31;
	    Drawable at 2 * Word_Size range 0 .. 31;
	    Marker_Bundle at 3 * Word_Size range 0 .. 31;
	    Text_Bundle at 4 * Word_Size range 0 .. 31;
	    Line_Bundle at 5 * Word_Size range 0 .. 31;
	    Interior_Bundle at 6 * Word_Size range 0 .. 31;
	    Edge_Bundle at 7 * Word_Size range 0 .. 31;
	    Color_Table at 8 * Word_Size range 0 .. 31;
	    Depth_Cue_Table at 9 * Word_Size range 0 .. 31;
	    Light_Table at 10 * Word_Size range 0 .. 31;
	    Color_Approx_Table at 11 * Word_Size range 0 .. 31;
	    Pattern_Table at 12 * Word_Size range 0 .. 31;
	    Text_Font_Table at 13 * Word_Size range 0 .. 31;
	    Highlight_Incl at 14 * Word_Size range 0 .. 31;
	    Highlight_Excl at 15 * Word_Size range 0 .. 31;
	    Invis_Incl at 16 * Word_Size range 0 .. 31;
	    Invis_Excl at 17 * Word_Size range 0 .. 31;
	    Buffer_Mode at 18 * Word_Size range 0 .. 15;
	    Pad at 19 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype Pex_Free_Phigs_Wks_Req is Pex_Resource_Req;

    type Pex_Get_Wks_Info_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask_Array (1 .. 2);
	end record;

    for Pex_Get_Wks_Info_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Wks at 2 * Word_Size range 0 .. 31;
	    Item_Mask at 3 * Word_Size range 0 .. 63;
	end record;

    type Pex_Get_Dynamics_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Drawable : X_Lib.Drawable;
	end record;

    for Pex_Get_Dynamics_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Drawable at 1 * Word_Size range 0 .. 31;
	end record;

    type Pex_Get_View_Rep_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Index : Pex_Proto_St.Pex_Table_Index;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	end record;

    for Pex_Get_View_Rep_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Index at 1 * Word_Size + 2 range 0 .. 15;
	    Wks at 2 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Redraw_All_Structures_Req is Pex_Resource_Req;

    subtype Pex_Update_Workstation_Req is Pex_Resource_Req;

    type Pex_Redraw_Clip_Region_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Num_Rects : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Redraw_Clip_Region_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Wks at 1 * Word_Size range 0 .. 31;
	    Num_Rects at 2 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Execute_Deferred_Actions_Req is Pex_Resource_Req;

    type Pex_Set_View_Priority_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Index1 : Pex_Proto_St.Pex_Table_Index;
	    Index2 : Pex_Proto_St.Pex_Table_Index;
	    Priority : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Set_View_Priority_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Wks at 1 * Word_Size range 0 .. 31;
	    Index1 at 2 * Word_Size range 0 .. 15;
	    Index2 at 2 * Word_Size + 2 range 0 .. 15;
	    Priority at 3 * Word_Size range 0 .. 15;
	    Pad at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Set_Display_Update_Mode_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Display_Update : Pex_Proto_St.Pex_Enum_Type_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Set_Display_Update_Mode_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Wks at 1 * Word_Size range 0 .. 31;
	    Display_Update at 2 * Word_Size range 0 .. 15;
	    Pad at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Map_Dc_To_Wc_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Num_Coords : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Map_Dc_To_Wc_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Wks at 2 * Word_Size range 0 .. 31;
	    Num_Coords at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Map_Wc_To_Dc_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Index : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Num_Coords : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Map_Wc_To_Dc_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Index at 1 * Word_Size + 2 range 0 .. 15;
	    Wks at 2 * Word_Size range 0 .. 31;
	    Num_Coords at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Set_View_Rep_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    View_Rep : Pex_Proto_St.Pex_View_Rep;
	end record;

    for Pex_Set_View_Rep_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Wks at 2 * Word_Size range 0 .. 31;
	    View_Rep at 3 * Word_Size range 0 .. 32 * 78 - 1;
	end record;

    type Pex_Set_Wks_Window_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Npc_Subvolume : Pex_Proto_St.Pex_Npc_Subvolume;
	end record;

    for Pex_Set_Wks_Window_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Wks at 2 * Word_Size range 0 .. 31;
	    Npc_Subvolume at 3 * Word_Size range 0 .. 32 * 12 - 1;
	end record;

    type Pex_Set_Wks_Viewport_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Viewport : Pex_Proto_St.Pex_Viewport;
	end record;

    for Pex_Set_Wks_Viewport_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Wks at 2 * Word_Size range 0 .. 31;
	    Viewport at 3 * Word_Size
	       range 0 .. 32 * Pex_Proto_St.Pex_Viewport_Word_Size - 1;
	end record;

    type Pex_Set_Hlhsr_Mode_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Mode : Pex_Proto_St.Pex_Enum_Type_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Set_Hlhsr_Mode_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Wks at 1 * Word_Size range 0 .. 31;
	    Mode at 2 * Word_Size range 0 .. 15;
	    Pad at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Set_Wks_Buffer_Mode_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Buffer_Mode : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Set_Wks_Buffer_Mode_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Wks at 1 * Word_Size range 0 .. 31;
	    Buffer_Mode at 2 * Word_Size range 0 .. 15;
	    Pad at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Post_Structure_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Sid : Pex_Proto_St.Pex_Structure;
	    Priority : Pex_Proto_St.Pex_Float;
	end record;

    for Pex_Post_Structure_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Wks at 2 * Word_Size range 0 .. 31;
	    Sid at 3 * Word_Size range 0 .. 31;
	    Priority at 4 * Word_Size range 0 .. 63;
	end record;

    type Pex_Unpost_Structure_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Sid : Pex_Proto_St.Pex_Structure;
	end record;

    for Pex_Unpost_Structure_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Wks at 1 * Word_Size range 0 .. 31;
	    Sid at 2 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Unpost_All_Structures_Req is Pex_Resource_Req;

    subtype Pex_Get_Wks_Postings_Req is Pex_Resource_Req;

    type Pex_Get_Pick_Device_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Dev_Type : Pex_Proto_St.Pex_Enum_Type_Index;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask;
	end record;

    for Pex_Get_Pick_Device_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Dev_Type at 1 * Word_Size + 2 range 0 .. 15;
	    Wks at 2 * Word_Size range 0 .. 31;
	    Item_Mask at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Change_Pick_Device_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Dev_Type : Pex_Proto_St.Pex_Enum_Type_Index;
	    Unused2 : X_Configuration_Dependent.Card16;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask;
	end record;

    for Pex_Change_Pick_Device_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Wks at 2 * Word_Size range 0 .. 31;
	    Dev_Type at 3 * Word_Size range 0 .. 15;
	    Unused2 at 3 * Word_Size + 2 range 0 .. 15;
	    Item_Mask at 4 * Word_Size range 0 .. 31;
	end record;

    type Pex_Create_Pick_Measure_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Wks : Pex_Proto_St.Pex_Phigs_Wks;
	    Pm : Pex_Proto_St.Pex_Pick_Measure;
	    Dev_Type : Pex_Proto_St.Pex_Enum_Type_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Create_Pick_Measure_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Wks at 1 * Word_Size range 0 .. 31;
	    Pm at 2 * Word_Size range 0 .. 31;
	    Dev_Type at 3 * Word_Size range 0 .. 15;
	    Pad at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype Pex_Free_Pick_Measure_Req is Pex_Resource_Req;

    type Pex_Get_Pick_Measure_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Pm : Pex_Proto_St.Pex_Pick_Measure;
	    Item_Mask : Pex_Proto_St.Pex_Bitmask;
	end record;

    for Pex_Get_Pick_Measure_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Pm at 1 * Word_Size range 0 .. 31;
	    Item_Mask at 2 * Word_Size range 0 .. 31;
	end record;

    type Pex_Update_Pick_Measure_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Pm : Pex_Proto_St.Pex_Pick_Measure;
	    Num_Bytes : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Update_Pick_Measure_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Pm at 1 * Word_Size range 0 .. 31;
	    Num_Bytes at 2 * Word_Size range 0 .. 31;
	end record;

    type Pex_Open_Font_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Font : Pex_Proto_St.Pex_Font;
	    Num_Bytes : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Open_Font_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Font at 1 * Word_Size range 0 .. 31;
	    Num_Bytes at 2 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Close_Font_Req is Pex_Resource_Req;

    type Pex_Query_Font_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Font : Pex_Proto_St.Pex_Font;
	end record;

    for Pex_Query_Font_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Font at 1 * Word_Size range 0 .. 31;
	end record;

    type Pex_List_Fonts_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Max_Names : X_Configuration_Dependent.Card16;
	    Num_Chars : X_Configuration_Dependent.Card16;
	end record;

    for Pex_List_Fonts_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Max_Names at 1 * Word_Size range 0 .. 15;
	    Num_Chars at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_List_Fonts_With_Info_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	    Max_Names : X_Configuration_Dependent.Card16;
	    Num_Chars : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_List_Fonts_With_Info_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Unused at 1 * Word_Size range 0 .. 15;
	    Max_Names at 1 * Word_Size + 2 range 0 .. 15;
	    Num_Chars at 2 * Word_Size range 0 .. 15;
	    Pad at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Query_Text_Extents_Req is
	record
	    Req_Type : X_Configuration_Dependent.Card8;
	    Opcode : X_Configuration_Dependent.Card8;
	    Length : X_Configuration_Dependent.Card16;
	    Fp_Format : Pex_Proto_St.Pex_Enum_Type_Index;
	    Text_Path : X_Configuration_Dependent.Card16;
	    Font_Group_Index : Pex_Proto_St.Pex_Table_Index;
	    Unused : X_Configuration_Dependent.Card16;
	    Id : X_Lib.X_Id;
	    Char_Expansion : Pex_Proto_St.Pex_Float;
	    Char_Spacing : Pex_Proto_St.Pex_Float;
	    Char_Height : Pex_Proto_St.Pex_Float;
	    Text_Alignment : Pex_Proto_St.Pex_Text_Alignment_Data;
	    Num_Strings : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Query_Text_Extents_Req use
	record
	    Req_Type at 0 * Word_Size range 0 .. 7;
	    Opcode at 0 * Word_Size + 1 range 0 .. 7;
	    Length at 0 * Word_Size + 2 range 0 .. 15;
	    Fp_Format at 1 * Word_Size range 0 .. 15;
	    Text_Path at 1 * Word_Size + 2 range 0 .. 15;
	    Font_Group_Index at 2 * Word_Size range 0 .. 15;
	    Unused at 2 * Word_Size + 2 range 0 .. 15;
	    Id at 3 * Word_Size range 0 .. 31;
	    Char_Expansion at 4 * Word_Size range 0 .. 63;
	    Char_Spacing at 6 * Word_Size range 0 .. 63;
	    Char_Height at 8 * Word_Size range 0 .. 63;
	    Text_Alignment at 10 * Word_Size range 0 .. 31;
	    Num_Strings at 11 * Word_Size range 0 .. 31;
	end record;

    -- * Output Commands 
    type Pex_Marker_Type is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Marker_Type : Pex_Proto_St.Pex_Enum_Type_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Marker_Type use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Marker_Type at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Marker_Scale is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Scale : Pex_Proto_St.Pex_Float;
	end record;

    for Pex_Marker_Scale use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Scale at 2 * Word_Size range 0 .. 63;
	end record;

    type Pex_Marker_Bundle_Index is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Index : Pex_Proto_St.Pex_Table_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Marker_Bundle_Index use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Index at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype Pex_Marker_Color_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Text_Color_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Line_Color_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Surface_Color_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Bf_Surface_Color_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Surface_Edge_Color_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Text_Font_Index is Pex_Marker_Bundle_Index;

    type Pex_Marker_Color is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Color_Spec : Pex_Proto_St.Pex_Color_Specifier;
	end record;

    for Pex_Marker_Color use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Color_Spec at 1 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Text_Color is Pex_Marker_Color;
    subtype Pex_Line_Color is Pex_Marker_Color;
    subtype Pex_Surface_Color is Pex_Marker_Color;
    subtype Pex_Bf_Surface_Color is Pex_Marker_Color;
    subtype Pex_Surface_Edge_Color is Pex_Marker_Color;

    type Pex_Atext_Style is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Style : Pex_Proto_St.Pex_Enum_Type_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Atext_Style use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Style at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype Pex_Text_Bundle_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Line_Bundle_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Interior_Bundle_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Interior_Style_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Bf_Interior_Style_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Edge_Bundle_Index is Pex_Marker_Bundle_Index;
    subtype Pex_View_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Depth_Cue_Index is Pex_Marker_Bundle_Index;
    subtype Pex_Color_Approx_Index is Pex_Marker_Bundle_Index;

    type Pex_Text_Precision is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Precision : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Text_Precision use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Precision at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Char_Expansion is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Expansion : Pex_Proto_St.Pex_Float;
	end record;

    for Pex_Char_Expansion use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Expansion at 2 * Word_Size range 0 .. 63;
	end record;

    type Pex_Char_Spacing is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Spacing : Pex_Proto_St.Pex_Float;
	end record;

    for Pex_Char_Spacing use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Spacing at 2 * Word_Size range 0 .. 63;
	end record;

    type Pex_Char_Height is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Height : Pex_Proto_St.Pex_Float;
	end record;

    for Pex_Char_Height use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Height at 2 * Word_Size range 0 .. 63;
	end record;

    subtype Pex_Atext_Height is Pex_Char_Height;

    type Pex_Char_Up_Vector is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Up : Pex_Proto_St.Pex_Vector2D;
	end record;

    for Pex_Char_Up_Vector use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Up at 1 * Word_Size range 0 .. 32 * 4 - 1;
	end record;

    subtype Pex_Atext_Up_Vector is Pex_Char_Up_Vector;

    type Pex_Text_Path is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Path : X_Configuration_Dependent.Card16;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Text_Path use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Path at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype Pex_Atext_Path is Pex_Text_Path;

    type Pex_Text_Alignment is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Alignment : Pex_Proto_St.Pex_Text_Alignment_Data;
	end record;

    for Pex_Text_Alignment use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Alignment at 1 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Atext_Alignment is Pex_Text_Alignment;

    type Pex_Line_Type is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Line_Type : Pex_Proto_St.Pex_Enum_Type_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Line_Type use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Line_Type at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Line_Width is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Width : Pex_Proto_St.Pex_Float;
	end record;

    for Pex_Line_Width use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Width at 2 * Word_Size range 0 .. 63;
	end record;

    subtype Pex_Surface_Edge_Width is Pex_Line_Width;

    type Pex_Curve_Approximation is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Approx : Pex_Proto_St.Pex_Curve_Approx;
	end record;
    for Pex_Curve_Approximation use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Approx at 2 * Word_Size
	       range 0 .. 32 * Pex_Proto_St.Pex_Curve_Approx_Word_Size - 1;
	end record;
    type Pex_Polyline_Interp is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Polyline_Interp : Pex_Proto_St.Pex_Enum_Type_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Polyline_Interp use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Polyline_Interp at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Interior_Style is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Interior_Style : Pex_Proto_St.Pex_Enum_Type_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Interior_Style use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Interior_Style at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype Pex_Bf_Interior_Style is Pex_Interior_Style;

    type Pex_Surface_Refl_Attr is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Reflection_Attr : Pex_Proto_St.Pex_Reflection_Attr;
	end record;

    for Pex_Surface_Refl_Attr use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Reflection_Attr at 1 * Word_Size range 0 .. 32 * 11 - 1;
	end record;

    subtype Pex_Bf_Surface_Refl_Attr is Pex_Surface_Refl_Attr;

    type Pex_Surface_Refl_Model is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Reflection_Model : Pex_Proto_St.Pex_Enum_Type_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Surface_Refl_Model use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Reflection_Model at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype Pex_Bf_Surface_Refl_Model is Pex_Surface_Refl_Model;

    type Pex_Surface_Interp is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Surface_Interp : Pex_Proto_St.Pex_Enum_Type_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Surface_Interp use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Surface_Interp at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    subtype Pex_Bf_Surface_Interp is Pex_Surface_Interp;

    type Pex_Surface_Approximation is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Approx : Pex_Proto_St.Pex_Surface_Approx;
	end record;

    for Pex_Surface_Approximation use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Approx at 1 * Word_Size
	       range 0 .. 32 * Pex_Proto_St.Pex_Surface_Approx_Word_Size - 1;
	end record;

    type Pex_Culling_Mode is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Cull_Mode : Pex_Proto_St.Pex_Cull_Mode;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Culling_Mode use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Cull_Mode at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Distinguish_Flag is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Distinguish : Pex_Proto_St.Pex_Switch;
	    Pad : X_Lib.Byte_Array (1 .. 3);
	end record;

    for Pex_Distinguish_Flag use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Distinguish at 1 * Word_Size range 0 .. 7;
	    Pad at 1 * Word_Size range 8 .. 31;
	end record;

    type Pex_Pattern_Size is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Size : Pex_Proto_St.Pex_Vector2D;
	end record;

    for Pex_Pattern_Size use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Size at 1 * Word_Size range 0 .. 32 * 4 - 1;
	end record;

    type Pex_Pattern_Ref_Pt is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Point : Pex_Proto_St.Pex_Coord2D;
	end record;

    for Pex_Pattern_Ref_Pt use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Point at 1 * Word_Size range 0 .. 32 * 4 - 1;
	end record;

    type Pex_Pattern_Attr is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Ref_Pt : Pex_Proto_St.Pex_Coord3D;
	    Vector1 : Pex_Proto_St.Pex_Vector3D;
	    Vector2 : Pex_Proto_St.Pex_Vector3D;
	end record;

    for Pex_Pattern_Attr use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Ref_Pt at 1 * Word_Size range 0 .. 32 * 6 - 1;
	    Vector1 at 7 * Word_Size range 0 .. 32 * 6 - 1;
	    Vector2 at 13 * Word_Size range 0 .. 32 * 6 - 1;
	end record;

    type Pex_Surface_Edge_Flag is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    On_Off : Pex_Proto_St.Pex_Switch;
	    Pad : X_Lib.Byte_Array (1 .. 3);
	end record;

    for Pex_Surface_Edge_Flag use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    On_Off at 1 * Word_Size range 0 .. 7;
	    Pad at 1 * Word_Size range 8 .. 31;
	end record;

    type Pex_Surface_Edge_Type is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Edge_Type : Pex_Proto_St.Pex_Enum_Type_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Surface_Edge_Type use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Edge_Type at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Set_Asf_Values is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Attribute : Pex_Proto_St.Pex_Asf_Attribute;
	    Source : Pex_Proto_St.Pex_Asf_Value;
	    Pad : X_Lib.Byte_Array (1 .. 3);
	end record;

    for Pex_Set_Asf_Values use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Attribute at 1 * Word_Size range 0 .. 31;
	    Source at 2 * Word_Size range 0 .. 7;
	    Pad at 2 * Word_Size range 8 .. 31;
	end record;

    type Pex_Local_Transform is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Comp_Type : Pex_Proto_St.Pex_Composition;
	    Unused : X_Configuration_Dependent.Card16;
	    Matrix : Pex_Proto_St.Pex_Matrix;
	end record;

    for Pex_Local_Transform use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Comp_Type at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Matrix at 2 * Word_Size range 0 .. 32 * 32 - 1;
	end record;

    type Pex_Local_Transform2D is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Comp_Type : Pex_Proto_St.Pex_Composition;
	    Unused : X_Configuration_Dependent.Card16;
	    Matrix3X3 : Pex_Proto_St.Pex_Matrix3X3;
	end record;

    for Pex_Local_Transform2D use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Comp_Type at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Matrix3X3 at 2 * Word_Size range 0 .. 32 * 18 - 1;
	end record;

    type Pex_Global_Transform is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Matrix : Pex_Proto_St.Pex_Matrix;
	end record;

    for Pex_Global_Transform use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Matrix at 2 * Word_Size range 0 .. 32 * 32 - 1;
	end record;

    type Pex_Global_Transform2D is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Matrix3X3 : Pex_Proto_St.Pex_Matrix3X3;
	end record;

    for Pex_Global_Transform2D use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Matrix3X3 at 2 * Word_Size range 0 .. 32 * 18 - 1;
	end record;

    type Pex_Model_Clip is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    On_Off : Pex_Proto_St.Pex_Switch;
	    Pad : X_Lib.Byte_Array (1 .. 3);
	end record;

    for Pex_Model_Clip use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    On_Off at 1 * Word_Size range 0 .. 7;
	    Pad at 1 * Word_Size range 8 .. 31;
	end record;

    type Pex_Model_Clip_Volume is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Model_Clip_Operator : Pex_Proto_St.Pex_Enum_Type_Index;
	    Num_Half_Spaces : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Model_Clip_Volume use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Model_Clip_Operator at 1 * Word_Size range 0 .. 15;
	    Num_Half_Spaces at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Model_Clip_Volume2D is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Model_Clip_Operator : Pex_Proto_St.Pex_Enum_Type_Index;
	    Num_Half_Spaces : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Model_Clip_Volume2D use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Model_Clip_Operator at 1 * Word_Size range 0 .. 15;
	    Num_Half_Spaces at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Restore_Model_Clip is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	end record;

    for Pex_Restore_Model_Clip use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	end record;

    type Pex_Light_State is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Num_Enable : X_Configuration_Dependent.Card16;
	    Num_Disable : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Light_State use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Num_Enable at 1 * Word_Size range 0 .. 15;
	    Num_Disable at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Pick_Id is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Pick_Id : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Pick_Id use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Pick_Id at 1 * Word_Size range 0 .. 31;
	end record;

    type Pex_Hlhsr_Identifier is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Hlhsr_Id : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Hlhsr_Identifier use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Hlhsr_Id at 1 * Word_Size range 0 .. 31;
	end record;

    type Pex_Rendering_Color_Model is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Model : Pex_Proto_St.Pex_Enum_Type_Index;
	    Pad : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Rendering_Color_Model use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Model at 1 * Word_Size range 0 .. 15;
	    Pad at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Para_Surf_Characteristics is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Characteristics : Pex_Proto_St.Pex_Enum_Type_Index;
	    Length : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Para_Surf_Characteristics use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Characteristics at 1 * Word_Size range 0 .. 15;
	    Length at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Add_To_Name_Set is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	end record;

    for Pex_Add_To_Name_Set use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	end record;

    subtype Pex_Remove_From_Name_Set is Pex_Add_To_Name_Set;

    type Pex_Execute_Structure is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Id : Pex_Proto_St.Pex_Structure;
	end record;

    for Pex_Execute_Structure use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Id at 1 * Word_Size range 0 .. 31;
	end record;

    type Pex_Label is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Label : X_Lib.X_Integer;
	end record;

    for Pex_Label use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Label at 1 * Word_Size range 0 .. 31;
	end record;

    type Pex_Application_Data is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Num_Elements : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Application_Data use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Num_Elements at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Gse is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Id : X_Configuration_Dependent.Card32;
	    Num_Elements : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Gse use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Id at 1 * Word_Size range 0 .. 31;
	    Num_Elements at 2 * Word_Size range 0 .. 15;
	    Unused at 2 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Marker is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	end record;

    for Pex_Marker use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	end record;

    type Marker2D is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	end record;

    for Marker2D use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	end record;

    type Pex_Text is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Origin : Pex_Proto_St.Pex_Coord3D;
	    Vector1 : Pex_Proto_St.Pex_Vector3D;
	    Vector2 : Pex_Proto_St.Pex_Vector3D;
	    Num_Encodings : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Text use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Origin at 1 * Word_Size range 0 .. 32 * 6 - 1;
	    Vector1 at 7 * Word_Size range 0 .. 32 * 6 - 1;
	    Vector2 at 13 * Word_Size range 0 .. 32 * 6 - 1;
	    Num_Encodings at 19 * Word_Size range 0 .. 15;
	    Unused at 19 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Text2D is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Origin : Pex_Proto_St.Pex_Coord2D;
	    Num_Encodings : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Text2D use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Origin at 1 * Word_Size range 0 .. 32 * 4 - 1;
	    Num_Encodings at 5 * Word_Size range 0 .. 15;
	    Unused at 5 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Annotation_Text is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Origin : Pex_Proto_St.Pex_Coord3D;
	    Offset : Pex_Proto_St.Pex_Coord3D;
	    Num_Encodings : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Annotation_Text use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Origin at 1 * Word_Size range 0 .. 32 * 6 - 1;
	    Offset at 7 * Word_Size range 0 .. 32 * 6 - 1;
	    Num_Encodings at 13 * Word_Size range 0 .. 15;
	    Unused at 13 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Annotation_Text2D is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Origin : Pex_Proto_St.Pex_Coord2D;
	    Offset : Pex_Proto_St.Pex_Coord2D;
	    Num_Encodings : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Annotation_Text2D use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Origin at 1 * Word_Size range 0 .. 32 * 4 - 1;
	    Offset at 5 * Word_Size range 0 .. 32 * 4 - 1;
	    Num_Encodings at 9 * Word_Size range 0 .. 15;
	    Unused at 9 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Polyline is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	end record;

    for Pex_Polyline use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	end record;

    type Pex_Polyline2D is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	end record;

    for Pex_Polyline2D use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	end record;

    type Pex_Polyline_Set is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Color_Type : Pex_Proto_St.Pex_Color_Type;
	    Vertex_Attribs : Pex_Proto_St.Pex_Bitmask_Short;
	    Num_Lists : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Polyline_Set use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Color_Type at 1 * Word_Size range 0 .. 15;
	    Vertex_Attribs at 1 * Word_Size + 2 range 0 .. 15;
	    Num_Lists at 2 * Word_Size range 0 .. 31;
	end record;

    type Pex_Nurb_Curve is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Curve_Order : X_Configuration_Dependent.Card16;
	    Coord_Type : Pex_Proto_St.Pex_Coord_Type;
	    Tmin : Pex_Proto_St.Pex_Float;
	    Tmax : Pex_Proto_St.Pex_Float;
	    Num_Knots : X_Configuration_Dependent.Card32;
	    Num_Points : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Nurb_Curve use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Curve_Order at 1 * Word_Size range 0 .. 15;
	    Coord_Type at 1 * Word_Size + 2 range 0 .. 15;
	    Tmin at 2 * Word_Size range 0 .. 63;
	    Tmax at 4 * Word_Size range 0 .. 63;
	    Num_Knots at 6 * Word_Size range 0 .. 31;
	    Num_Points at 7 * Word_Size range 0 .. 31;
	end record;

    type Pex_Fill_Area is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Shape : X_Configuration_Dependent.Card16;
	    Ignore_Edges : Pex_Proto_St.Pex_Switch;
	    Pad : X_Configuration_Dependent.Card8;
	end record;

    for Pex_Fill_Area use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Shape at 1 * Word_Size range 0 .. 15;
	    Ignore_Edges at 1 * Word_Size + 2 range 0 .. 7;
	    Pad at 1 * Word_Size + 3 range 0 .. 7;
	end record;

    type Pex_Fill_Area2D is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Shape : X_Configuration_Dependent.Card16;
	    Ignore_Edges : Pex_Proto_St.Pex_Switch;
	    Unused : X_Configuration_Dependent.Card8;
	end record;

    for Pex_Fill_Area2D use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Shape at 1 * Word_Size range 0 .. 15;
	    Ignore_Edges at 1 * Word_Size + 2 range 0 .. 7;
	    Unused at 1 * Word_Size + 3 range 0 .. 7;
	end record;

    type Pex_Ext_Fill_Area is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Shape : X_Configuration_Dependent.Card16;
	    Ignore_Edges : Pex_Proto_St.Pex_Switch;
	    Unused : X_Configuration_Dependent.Card8;
	    Color_Type : Pex_Proto_St.Pex_Color_Type;
	    Facet_Attribs : Pex_Proto_St.Pex_Bitmask_Short;
	    Vertex_Attribs : Pex_Proto_St.Pex_Bitmask_Short;
	    Unused2 : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Ext_Fill_Area use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Shape at 1 * Word_Size range 0 .. 15;
	    Ignore_Edges at 1 * Word_Size + 2 range 0 .. 7;
	    Unused at 1 * Word_Size + 3 range 0 .. 7;
	    Color_Type at 2 * Word_Size range 0 .. 15;
	    Facet_Attribs at 2 * Word_Size + 2 range 0 .. 15;
	    Vertex_Attribs at 3 * Word_Size range 0 .. 15;
	    Unused2 at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Fill_Area_Set is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Shape : X_Configuration_Dependent.Card16;
	    Ignore_Edges : Pex_Proto_St.Pex_Switch;
	    Contour_Hint : X_Configuration_Dependent.Card8;
	    Num_Lists : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Fill_Area_Set use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Shape at 1 * Word_Size range 0 .. 15;
	    Ignore_Edges at 1 * Word_Size + 2 range 0 .. 7;
	    Contour_Hint at 1 * Word_Size + 3 range 0 .. 7;
	    Num_Lists at 2 * Word_Size range 0 .. 31;
	end record;

    type Pex_Fill_Area_Set2D is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Shape : X_Configuration_Dependent.Card16;
	    Ignore_Edges : Pex_Proto_St.Pex_Switch;
	    Contour_Hint : X_Configuration_Dependent.Card8;
	    Num_Lists : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Fill_Area_Set2D use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Shape at 1 * Word_Size range 0 .. 15;
	    Ignore_Edges at 1 * Word_Size + 2 range 0 .. 7;
	    Contour_Hint at 1 * Word_Size + 3 range 0 .. 7;
	    Num_Lists at 2 * Word_Size range 0 .. 31;
	end record;

    type Pex_Ext_Fill_Area_Set is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Shape : X_Configuration_Dependent.Card16;
	    Ignore_Edges : Pex_Proto_St.Pex_Switch;
	    Contour_Hint : X_Configuration_Dependent.Card8;
	    Color_Type : Pex_Proto_St.Pex_Color_Type;
	    Facet_Attribs : Pex_Proto_St.Pex_Bitmask_Short;
	    Vertex_Attribs : Pex_Proto_St.Pex_Bitmask_Short;
	    Unused2 : X_Configuration_Dependent.Card16;
	    Num_Lists : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Ext_Fill_Area_Set use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Shape at 1 * Word_Size range 0 .. 15;
	    Ignore_Edges at 1 * Word_Size + 2 range 0 .. 7;
	    Contour_Hint at 1 * Word_Size + 3 range 0 .. 7;
	    Color_Type at 2 * Word_Size range 0 .. 15;
	    Facet_Attribs at 2 * Word_Size + 2 range 0 .. 15;
	    Vertex_Attribs at 3 * Word_Size range 0 .. 15;
	    Unused2 at 3 * Word_Size + 2 range 0 .. 15;
	    Num_Lists at 4 * Word_Size range 0 .. 31;
	end record;

    type Pex_Triangle_Strip is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Color_Type : Pex_Proto_St.Pex_Color_Type;
	    Facet_Attribs : Pex_Proto_St.Pex_Bitmask_Short;
	    Vertex_Attribs : Pex_Proto_St.Pex_Bitmask_Short;
	    Unused : X_Configuration_Dependent.Card16;
	    Num_Vertices : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Triangle_Strip use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Color_Type at 1 * Word_Size range 0 .. 15;
	    Facet_Attribs at 1 * Word_Size + 2 range 0 .. 15;
	    Vertex_Attribs at 2 * Word_Size range 0 .. 15;
	    Unused at 2 * Word_Size + 2 range 0 .. 15;
	    Num_Vertices at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Quadrilateral_Mesh is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Color_Type : Pex_Proto_St.Pex_Color_Type;
	    M_Pts : X_Configuration_Dependent.Card16;
	    N_Pts : X_Configuration_Dependent.Card16;
	    Facet_Attribs : Pex_Proto_St.Pex_Bitmask_Short;
	    Vertex_Attribs : Pex_Proto_St.Pex_Bitmask_Short;
	    Shape : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Quadrilateral_Mesh use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Color_Type at 1 * Word_Size range 0 .. 15;
	    M_Pts at 1 * Word_Size + 2 range 0 .. 15;
	    N_Pts at 2 * Word_Size range 0 .. 15;
	    Facet_Attribs at 2 * Word_Size + 2 range 0 .. 15;
	    Vertex_Attribs at 3 * Word_Size range 0 .. 15;
	    Shape at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Sofas is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Shape : X_Configuration_Dependent.Card16;
	    Color_Type : Pex_Proto_St.Pex_Color_Type;
	    Fas_Attributes : X_Configuration_Dependent.Card16;
	    Vertex_Attributes : X_Configuration_Dependent.Card16;
	    Edge_Attributes : X_Configuration_Dependent.Card16;
	    Contour_Hint : X_Configuration_Dependent.Card8;
	    Contour_Counts_Flag : Pex_Proto_St.Pex_Switch;
	    Num_Fas : X_Configuration_Dependent.Card16;
	    Num_Vertices : X_Configuration_Dependent.Card16;
	    Num_Edges : X_Configuration_Dependent.Card16;
	    Num_Contours : X_Configuration_Dependent.Card16;
	end record;

    for Pex_Sofas use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Shape at 1 * Word_Size range 0 .. 15;
	    Color_Type at 1 * Word_Size + 2 range 0 .. 15;
	    Fas_Attributes at 2 * Word_Size range 0 .. 15;
	    Vertex_Attributes at 2 * Word_Size + 2 range 0 .. 15;
	    Edge_Attributes at 3 * Word_Size range 0 .. 15;
	    Contour_Hint at 3 * Word_Size + 2 range 0 .. 7;
	    Contour_Counts_Flag at 3 * Word_Size + 3 range 0 .. 7;
	    Num_Fas at 4 * Word_Size range 0 .. 15;
	    Num_Vertices at 4 * Word_Size + 2 range 0 .. 15;
	    Num_Edges at 5 * Word_Size range 0 .. 15;
	    Num_Contours at 5 * Word_Size + 2 range 0 .. 15;
	end record;

    type Pex_Nurb_Surface is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Types : Pex_Proto_St.Pex_Coord_Type;
	    U_Order : X_Configuration_Dependent.Card16;
	    V_Order : X_Configuration_Dependent.Card16;
	    Unused : X_Configuration_Dependent.Card16;
	    Num_Uknots : X_Configuration_Dependent.Card32;
	    Num_Vknots : X_Configuration_Dependent.Card32;
	    M_Pts : X_Configuration_Dependent.Card16;
	    N_Pts : X_Configuration_Dependent.Card16;
	    Num_Lists : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Nurb_Surface use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Types at 1 * Word_Size range 0 .. 15;
	    U_Order at 1 * Word_Size + 2 range 0 .. 15;
	    V_Order at 2 * Word_Size range 0 .. 15;
	    Unused at 2 * Word_Size + 2 range 0 .. 15;
	    Num_Uknots at 3 * Word_Size range 0 .. 31;
	    Num_Vknots at 4 * Word_Size range 0 .. 31;
	    M_Pts at 5 * Word_Size range 0 .. 15;
	    N_Pts at 5 * Word_Size + 2 range 0 .. 15;
	    Num_Lists at 6 * Word_Size range 0 .. 31;
	end record;

    type Pex_Cell_Array is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Point1 : Pex_Proto_St.Pex_Coord3D;
	    Point2 : Pex_Proto_St.Pex_Coord3D;
	    Point3 : Pex_Proto_St.Pex_Coord3D;
	    Dx : X_Configuration_Dependent.Card32;
	    Dy : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Cell_Array use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Point1 at 1 * Word_Size range 0 .. 32 * 6 - 1;
	    Point2 at 7 * Word_Size range 0 .. 32 * 6 - 1;
	    Point3 at 13 * Word_Size range 0 .. 32 * 6 - 1;
	    Dx at 19 * Word_Size range 0 .. 31;
	    Dy at 20 * Word_Size range 0 .. 31;
	end record;

    type Pex_Cell_Array2D is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Point1 : Pex_Proto_St.Pex_Coord2D;
	    Point2 : Pex_Proto_St.Pex_Coord2D;
	    Dx : X_Configuration_Dependent.Card32;
	    Dy : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Cell_Array2D use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Point1 at 1 * Word_Size range 0 .. 32 * 4 - 1;
	    Point2 at 5 * Word_Size range 0 .. 32 * 4 - 1;
	    Dx at 9 * Word_Size range 0 .. 31;
	    Dy at 10 * Word_Size range 0 .. 31;
	end record;

    type Pex_Ext_Cell_Array is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Color_Type : Pex_Proto_St.Pex_Color_Type;
	    Unused : X_Configuration_Dependent.Card16;
	    Point1 : Pex_Proto_St.Pex_Coord3D;
	    Point2 : Pex_Proto_St.Pex_Coord3D;
	    Point3 : Pex_Proto_St.Pex_Coord3D;
	    Dx : X_Configuration_Dependent.Card32;
	    Dy : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Ext_Cell_Array use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Color_Type at 1 * Word_Size range 0 .. 15;
	    Unused at 1 * Word_Size + 2 range 0 .. 15;
	    Point1 at 2 * Word_Size range 0 .. 32 * 6 - 1;
	    Point2 at 8 * Word_Size range 0 .. 32 * 6 - 1;
	    Point3 at 14 * Word_Size range 0 .. 32 * 6 - 1;
	    Dx at 20 * Word_Size range 0 .. 31;
	    Dy at 21 * Word_Size range 0 .. 31;
	end record;

    type Pex_Gdp is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Gdp_Id : X_Lib.X_Integer;
	    Num_Points : X_Configuration_Dependent.Card32;
	    Num_Bytes : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Gdp use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Gdp_Id at 1 * Word_Size range 0 .. 31;
	    Num_Points at 2 * Word_Size range 0 .. 31;
	    Num_Bytes at 3 * Word_Size range 0 .. 31;
	end record;

    type Pex_Gdp_2D is
	record
	    Head : Pex_Proto_St.Pex_Element_Info;
	    Gdp_Id : X_Lib.X_Integer;
	    Num_Points : X_Configuration_Dependent.Card32;
	    Num_Bytes : X_Configuration_Dependent.Card32;
	end record;

    for Pex_Gdp_2D use
	record
	    Head at 0 * Word_Size range 0 .. 31;
	    Gdp_Id at 1 * Word_Size range 0 .. 31;
	    Num_Points at 2 * Word_Size range 0 .. 31;
	    Num_Bytes at 3 * Word_Size range 0 .. 31;
	end record;
end Pex_Proto;

--package body PEX_Proto is end PEX_Proto;
