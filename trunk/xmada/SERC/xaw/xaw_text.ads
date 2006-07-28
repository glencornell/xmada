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

with Xt, X_Lib, X_Configuration_Dependent, Xaw_Simple, Xt_Object;

package Xaw_Text is
    -- 1) Resources documentation:

    -- Name                Class              RepType         Default Value
    -- ----                -----              -------         -------------
    -- background          Background         Pixel           XtDefaultBackground
    -- border              BorderColor        Pixel           XtDefaultForeground
    -- borderWidth         BorderWidth        Dimension       1
    -- destroyCallback     Callback           Pointer         NULL
    -- dialogHOffset       Margin             int             10
    -- dialogVOffset       Margin             int             10
    -- displayPosition     TextPosition       int             0
    -- editType            EditType           XtTextEditType  XttextRead
    -- height              Height             Dimension       font height
    -- insertPosition      TextPosition       int             0
    -- leftMargin          Margin             Dimension       2
    -- mappedWhenManaged   MappedWhenManaged  Boolean         True
    -- selectTypes         SelectTypes        Pointer         (internal)
    -- selection           Selection          Pointer         empty selection
    -- sensitive           Sensitive          Boolean         True
    -- textOptions         TextOptions        int             0
    -- textSink            TextSink           Pointer         (none)
    -- textSource          TextSource         Pointer         (none)
    -- width               Width              Dimension       100
    -- x                   Position           int             0
    -- y                   Position           int             0

    -- 2) Define constants for new resources.

    -- in Xt_Stringdefs:

    -- xt_n_text_options         : constant STRING := "textOptions" & ASCII.NUL;
    -- xt_n_insert_position      : constant STRING := "insertPosition" & ASCII.NUL;
    -- xt_n_text_source          : constant STRING := "textSource" & ASCII.NUL;
    -- xt_n_text_sink            : constant STRING := "textSink" & ASCII.NUL;
    -- xt_n_selection            : constant STRING := "selection" & ASCII.NUL;
    -- xt_n_edit_type            : constant STRING := "editType" & ASCII.NUL;
    -- xt_n_file                 : constant STRING := "file" & ASCII.NUL;
    -- xt_n_string               : constant STRING := "string" & ASCII.NUL;
    -- xt_n_length               : constant STRING := "length" & ASCII.NUL;
    -- xt_n_font                 : constant STRING := "font" & ASCII.NUL;

    -- Define for Text
    subtype Xaw_Text_Position is X_Lib.X_Long_Integer;

    type Xaw_Text_Block is
	record
	    First_Pos : X_Lib.X_Integer;
	    Length : X_Lib.X_Integer;
	    Ptr : Xt.Xt_String;
	    Format : X_Configuration_Dependent.Unsigned_Long;
	end record;

    for Xaw_Text_Block use
	record
	    First_Pos at 0 range 0 .. 31;
	    Length at 4 range 0 .. 31;
	    Ptr at 8 range 0 .. 31;
	    Format at 12 range 0 .. 31;
	end record;
    type Xaw_Text_Block_Ptr is access Xaw_Text_Block;

    type Xaw_Text_Scroll_Mode is
       (Xaw_Text_Scroll_Never, Xaw_Text_Scroll_When_Needed,
	Xaw_Text_Scroll_Always);

    type Xaw_Text_Wrap_Mode is
       (Xaw_Text_Wrap_Never, Xaw_Text_Wrap_Line, Xaw_Text_Wrap_Word);

    type Xaw_Text_Resize_Mode is (Xaw_Text_Resize_Never, Xaw_Text_Resize_Width,
				  Xaw_Text_Resize_Height, Xaw_Text_Resize_Both);

    type Xaw_Text_Scan_Direction is (Xaw_Sd_Left, Xaw_Sd_Right);

    type Xaw_Text_Edit_Type is (Xaw_Text_Read, Xaw_Text_Append, Xaw_Text_Edit);

    type Xaw_Text_Select_Type is
       (Xaw_Select_Null, Xaw_Select_Position, Xaw_Select_Char, Xaw_Select_Word,
	Xaw_Select_Line, Xaw_Select_Paragraph, Xaw_Select_All);

    -- new:

    Xt_E_Text_Scroll_Never : constant String := "never" & Ascii.Nul;
    Xt_E_Text_Scroll_When_Needed : constant String := "whenneeded" & Ascii.Nul;
    Xt_E_Text_Scroll_Always : constant String := "always" & Ascii.Nul;

    Xt_E_Text_Wrap_Never : constant String := "never" & Ascii.Nul;
    Xt_E_Text_Wrap_Line : constant String := "line" & Ascii.Nul;
    Xt_E_Text_Wrap_Word : constant String := "word" & Ascii.Nul;

    Xt_E_Text_Resize_Never : constant String := "never" & Ascii.Nul;
    Xt_E_Text_Resize_Width : constant String := "width" & Ascii.Nul;
    Xt_E_Text_Resize_Height : constant String := "height" & Ascii.Nul;
    Xt_E_Text_Resize_Both : constant String := "both" & Ascii.Nul;

    Xt_N_Auto_Fill : constant String := "autoFill" & Ascii.Nul;
    Xt_N_Bottom_Margin : constant String := "bottomMargin" & Ascii.Nul;
    Xt_N_Dialog_H_Offset : constant String := "dialogHOffset" & Ascii.Nul;
    Xt_N_Dialog_V_Offset : constant String := "dialogVOffset" & Ascii.Nul;
    Xt_N_Display_Caret : constant String := "displayCaret" & Ascii.Nul;
    Xt_N_Display_Position : constant String := "displayPosition" & Ascii.Nul;
    Xt_N_Left_Margin : constant String := "leftMargin" & Ascii.Nul;
    Xt_N_Right_Margin : constant String := "rightMargin" & Ascii.Nul;
    Xt_N_Scroll_Vertical : constant String := "scrollVertical" & Ascii.Nul;
    Xt_N_Scroll_Horizontal : constant String := "scrollHorizontal" & Ascii.Nul;
    Xt_N_Select_Types : constant String := "selectTypes" & Ascii.Nul;
    Xt_N_Top_Margin : constant String := "topMargin" & Ascii.Nul;
    Xt_N_Wrap : constant String := "wrap" & Ascii.Nul;

    Xt_N_Insert_Position : constant String := "insertPosition" & Ascii.Nul;
    Xt_N_Resize : constant String := "resize" & Ascii.Nul;
    Xt_N_Selection : constant String := "selection" & Ascii.Nul;
    Xt_C_Resize : constant String := "Resize" & Ascii.Nul;

    Xt_C_Auto_Fill : constant String := "AutoFill" & Ascii.Nul;
    Xt_C_Scroll : constant String := "Scroll" & Ascii.Nul;
    Xt_C_Select_Types : constant String := "SelectTypes" & Ascii.Nul;
    Xt_C_Wrap : constant String := "Wrap" & Ascii.Nul;

    -- Return Error code for XawTextSearch

    Xaw_Text_Search_Error : constant := -12345;

    -- Return codes from XawTextReplace

    Xaw_Replace_Error : constant := -1;

    type Xaw_Edit_Status is (Xaw_Edit_Done, Xaw_Edit_Error, Xaw_Position_Error);
    for Xaw_Edit_Status'Size use 32;

    subtype Fmt8Bit is X_Configuration_Dependent.Unsigned_Long;

    -- Resource Definitions for Ascii_Src.

    Xt_C_Data_Compression : constant String := "DataCompression" & Ascii.Nul;
    Xt_C_Piece_Size : constant String := "PieceSize" & Ascii.Nul;
    Xt_C_Type : constant String := "Type" & Ascii.Nul;
    Xt_C_Use_String_In_Place : constant String :=
       "UseStringInPlace" & Ascii.Nul;

    Xt_N_Data_Compression : constant String := "dataCompression" & Ascii.Nul;
    Xt_N_Piece_Size : constant String := "pieceSize" & Ascii.Nul;
    Xt_N_Type : constant String := "type" & Ascii.Nul;
    Xt_N_Use_String_In_Place : constant String :=
       "useStringInPlace" & Ascii.Nul;

    Xt_R_Ascii_Type : constant String := "AsciiType" & Ascii.Nul;

    Xt_E_String : constant String := "string" & Ascii.Nul;
    Xt_E_File : constant String := "file" & Ascii.Nul;

    type Ascii_Type is (Xaw_Ascii_File, Xaw_Ascii_String);


    -- Define for Text_Src
    subtype Text_Src_Widget is Xt_Object.Obj_Widget;
    subtype Text_Src_Class is Xt_Object.Obj_Class;

    function Text_Src_Object_Class return Text_Src_Class;

    type Xaw_Text_Scan_Type is (Xaw_St_Positions, Xaw_St_White_Space,
				Xaw_St_Eol, Xaw_St_Paragraph, Xaw_St_All);

    type Highlight_Type is (Normal, Selected);

    type Xaw_Text_Selection_Mode is (Xaw_Sm_Text_Select, Xaw_Sm_Text_Extend);

    type Xaw_Text_Selection_Action is (Xaw_Action_Start,
				       Xaw_Action_Adjust, Xaw_Action_End);

    -- Error Conditions:
    Xaw_Text_Read_Error : constant := -1;
    Xaw_Text_Scan_Error : constant := -1;


    -- Define for Text_Sink
    type Xaw_Text_Insert_State is (Xaw_Is_On, Xaw_Is_Off);

    subtype Text_Sink_Widget is Xt_Object.Obj_Widget;
    subtype Text_Sink_Class is Xt_Object.Obj_Class;


    -- Resource definition for Ascii_Sink
    Xt_C_Output : constant String := "Output" & Ascii.Nul;
    Xt_N_Display_Nonprinting : constant String :=
       "displayNonprinting" & Ascii.Nul;
    Xt_N_Echo : constant String := "echo" & Ascii.Nul;


    -- Class record constants

    subtype Ascii_Sink_Widget is Text_Sink_Widget;
    subtype Ascii_Sink_Class is Text_Sink_Class;

    subtype Ascii_Src_Widget is Text_Src_Widget;
    subtype Ascii_Src_Class is Text_Src_Class;


    -- 3) Define application interface to types and constants for intrisics use:

    subtype Text_Widget is Xaw_Simple.Simple_Widget;
    subtype Text_Class is Xaw_Simple.Simple_Class;

    subtype Ascii_Text_Widget is Xaw_Text.Text_Widget;
    subtype Ascii_Text_Class is Xaw_Text.Text_Class;


    function Text_Widget_Class return Text_Class;

    -- XawTextDisplay
    procedure Xaw_Text_Display (W : in Xt.Widget);

    -- XawTextEnableRedisplay
    procedure Xaw_Text_Enable_Redisplay (W : in Xt.Widget);

    -- XawTextDisableRedisplay
    procedure Xaw_Text_Disable_Redisplay (W : in Xt.Widget);

    -- XawTextSetSelectionArray
    procedure Xaw_Text_Set_Selection_Array
		 (W : in Xt.Widget; Sarray : in Xaw_Text_Select_Type);

    -- XawTextGetSelectionPos
    procedure Xaw_Text_Get_Selection_Pos
		 (W : in Xt.Widget;
		  Begin_Return, End_Return : out Xaw_Text_Position);

    -- XawTextSetSource
    procedure Xaw_Text_Set_Source (W : in Xt.Widget;
				   Source : in Xt.Widget;
				   Position : in Xaw_Text_Position);

    -- XawTextReplace
    function Xaw_Text_Replace (W : in Xt.Widget;
			       Start_Pos, End_Pos : in Xaw_Text_Position;
			       Text : in Xaw_Text_Block) return X_Lib.X_Integer;

    -- XawTextTopPosition
    function Xaw_Text_Top_Position (W : in Xt.Widget) return Xaw_Text_Position;

    -- XawTextSetInsertionPoint
    procedure Xaw_Text_Set_Insertion_Point
		 (W : in Xt.Widget; Position : in Xaw_Text_Position);

    -- XawTextGetInsertionPoint
    function Xaw_Text_Get_Insertion_Point
		(W : in Xt.Widget) return Xaw_Text_Position;

    -- XawTextUnsetSelection
    procedure Xaw_Text_Unset_Selection (W : in Xt.Widget);

    -- XawTextSetSelection
    procedure Xaw_Text_Set_Selection (W : in Xt.Widget;
				      Left, Right : in Xaw_Text_Position);

    -- XawTextInvalidate
    procedure Xaw_Text_Invalidate (W : in Xt.Widget;
				   From, To : in Xaw_Text_Position);

    -- XawTextGetSource
    function Xaw_Text_Get_Source (W : in Xt.Widget) return Xt.Widget;

    function Xaw_Text_Search (W : in Xt.Widget;
			      Dir : in Xaw_Text_Scan_Direction;
			      Text : in Xaw_Text_Block)
			     return Xaw_Text_Position;

    -- XawTextDisplayCaret
    procedure Xaw_Text_Display_Caret (W : in Xt.Widget; Visible : in Boolean);


    -- Functions in Text_Src
    procedure Xaw_Text_Source_Read (W : in Xt.Widget;
				    Pos : in Xaw_Text.Xaw_Text_Position;
				    Text_Return : out Xaw_Text.Xaw_Text_Block;
				    Length : in X_Lib.X_Integer;
				    Ret_Val : out Xaw_Text.Xaw_Text_Position);

    function Xaw_Text_Source_Replace (W : in Xt.Widget;
				      Start : in Xaw_Text.Xaw_Text_Position;
				      Ends : in Xaw_Text.Xaw_Text_Position;
				      Text : in Xaw_Text.Xaw_Text_Block)
				     return Xaw_Text.Xaw_Edit_Status;

    function Xaw_Text_Source_Scan
		(W : in Xt.Widget;
		 Position : in Xaw_Text.Xaw_Text_Position;
		 Types : in Xaw_Text_Scan_Type;
		 Dir : in Xaw_Text.Xaw_Text_Scan_Direction;
		 Count : in X_Lib.X_Integer;
		 Include : in Boolean) return Xaw_Text.Xaw_Text_Position;

    function Xaw_Text_Source_Search (W : in Xt.Widget;
				     Position : in Xaw_Text.Xaw_Text_Position;
				     Dir : in Xaw_Text_Scan_Direction;
				     Text : in Xaw_Text.Xaw_Text_Block)
				    return Xaw_Text.Xaw_Text_Position;

    procedure Xaw_Text_Source_Convert_Selection
		 (W : in Xt.Widget;
		  Selection : in X_Lib.Atoms.Atom;
		  Target : in X_Lib.Atoms.Atom;
		  Types : in X_Lib.Atoms.Atom;
		  Value_Return : out Xt.Xt_Pointer;
		  Length_Return : out X_Lib.X_Integer;
		  Format_Return : out X_Lib.X_Integer;
		  Ret_Val : out Boolean);

    procedure Xaw_Text_Source_Set_Selection
		 (W : in Xt.Widget;
		  Start : in Xaw_Text.Xaw_Text_Position;
		  Ends : in Xaw_Text.Xaw_Text_Position;
		  Selection : in X_Lib.Atoms.Atom);


    -- Functions in Text_Sink
    function Text_Sink_Object_Class return Text_Sink_Class;

    procedure Xaw_Text_Sink_Display_Text (W : in Xt.Widget;
					  X : in Xt.Position;
					  Y : in Xt.Position;
					  Pos1 : in Xaw_Text.Xaw_Text_Position;
					  Pos2 : in Xaw_Text.Xaw_Text_Position;
					  Highlight : in Boolean);

    procedure Xaw_Text_Sink_Insert_Cursor (W : in Xt.Widget;
					   X : in Xt.Position;
					   Y : in Xt.Position;
					   State : in Xaw_Text_Insert_State);

    procedure Xaw_Text_Sink_Clear_To_Background (W : in Xt.Widget;
						 X : in Xt.Position;
						 Y : in Xt.Position;
						 Width : in Xt.Dimension;
						 Height : in Xt.Dimension);

    procedure Xaw_Text_Sink_Find_Position
		 (W : in Xt.Widget;
		  From_Pos : in Xaw_Text.Xaw_Text_Position;
		  From_X : in X_Lib.X_Integer;
		  Width : in X_Lib.X_Integer;
		  Stop_At_Word_Break : in Boolean;
		  Pos_Return : out Xaw_Text.Xaw_Text_Position;
		  Width_Return : out X_Lib.X_Integer;
		  Height_Return : out X_Lib.X_Integer);

    procedure Xaw_Text_Sink_Find_Distance
		 (W : in Xt.Widget;
		  From_Pos : in Xaw_Text.Xaw_Text_Position;
		  From_X : in X_Lib.X_Integer;
		  To_Pos : in Xaw_Text.Xaw_Text_Position;
		  Width_Return : out X_Lib.X_Integer;
		  Pos_Return : out Xaw_Text.Xaw_Text_Position;
		  Height_Return : out X_Lib.X_Integer);

    procedure Xaw_Text_Sink_Resolve
		 (W : in Xt.Widget;
		  From_Pos : in Xaw_Text.Xaw_Text_Position;
		  From_X : in X_Lib.X_Integer;
		  Width : in X_Lib.X_Integer;
		  Pos_Return : out Xaw_Text.Xaw_Text_Position);

    function Xaw_Text_Sink_Max_Lines
		(W : in Xt.Widget; Height : in Xt.Dimension)
		return X_Lib.X_Integer;

    function Xaw_Text_Sink_Max_Height
		(W : in Xt.Widget; Lines : in X_Lib.X_Integer)
		return X_Lib.X_Integer;

    procedure Xaw_Text_Sink_Set_Tabs (W : in Xt.Widget;
				      Tab_Count : in X_Lib.X_Integer;
				      Tabs : out X_Lib.X_Integer);

    procedure Xaw_Text_Sink_Get_Cursor_Bounds
		 (W : in Xt.Widget; Rect_Return : out X_Lib.Rectangle);


    -- Function in Ascii_Text
    function Ascii_Text_Widget_Class return Ascii_Text_Class;

    function Ascii_Src_Object_Class return Ascii_Src_Class;

    function Ascii_Source_Object_Class return Text_Src_Class
       renames Ascii_Src_Object_Class;

    function Ascii_Sink_Object_Class return Ascii_Sink_Class;
end Xaw_Text;
