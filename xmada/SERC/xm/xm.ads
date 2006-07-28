-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib, X_Configuration_Dependent, Xt, Xt_Core,
     Xt_Rect_Object, Xt_Constraint, X_Event_Utilities;

package Xm is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    subtype Xm_Font_Structure is X_Lib.Fonts.X_Font_Ptr;
    subtype X_Event_Ptr is X_Event_Utilities.X_Crossing_Event;
    subtype Xt_Widget is Xt.Widget;

    subtype Xm_Arg_List is Xt.Xt_Ancillary_Types.Xt_Arg_List;
    Null_Xm_Arg_List : Xm_Arg_List
       renames Xt.Xt_Ancillary_Types.Null_Xt_Arg_List;

-- For use in enumeration type representation clauses which were
-- one word in C.
    Xm_Enum_Length : constant := X_Configuration_Dependent.Bits_Per_Word;

    Xm_Major_Version : constant := 1;
    Xm_Revision : constant := 2;
    Xm_Version : constant := 1000 * Xm_Major_Version + Xm_Revision;
    Xm_Version_String : constant String := "@(#)OSF/Motif Version 1.2";

    function Xm_Use_Version return X_Lib.X_Integer;

--    Xm_Unspecified_Pixmap : constant X_Lib.Pixmap := 2;
--
--
-- Default resources
--
    subtype Xmdefault_Font is X_Lib.X_Address;
    subtype Xmdefault_Background is X_Lib.X_Address;

    Xmdefault_Dark_Threshold : constant := 15;
    Xmdefault_Light_Threshold : constant := 77;
    Xmdefault_Foreground_Threshold : constant := 35;

--    type Xm_Direction is new X_Configuration_Dependent.Unsigned_Char;
--
-- XmString structure defines. These must be here (at the start of the file)
-- becaused they are used later on.
--
    type Xm_Font_Type is (Xmfont_Is_Font, Xmfont_Is_Fontset);
    for Xm_Font_Type'Size use Xm_Enum_Length;
    for Xm_Font_Type use (Xmfont_Is_Font => 0, Xmfont_Is_Fontset => 1);

--    type Xm_String_Direction is
--       (Xm_String_Direction_L_To_R, Xm_String_Direction_R_To_L,
--	Xm_String_Direction_Default);
--    for Xm_String_Direction'Size use X_Configuration_Dependent.Byte'Size;
--    for Xm_String_Direction use (Xm_String_Direction_L_To_R => 0,
--				 Xm_String_Direction_R_To_L => 1,
--				 Xm_String_Direction_Default => 255);
--
--    subtype Xm_String is X_Lib.X_Address;
--    Null_Xm_String : constant Xm_String := X_Lib.Null_Address;

    type Xm_String_Table is array (Natural range <>) of Xm_String;
    type Xm_String_Table_Ptr is access Xm_String_Table;

--    subtype Xm_String_Char_Set is String;
    subtype Xm_String_Char_Set_Ptr is Xt.Xt_String;

    type Xm_String_Char_Set_Array is
       array (Natural range <>) of Xm_String_Char_Set_Ptr;
    type Xm_String_Char_Set_Table is access Xm_String_Char_Set_Array;

--
-- Charsets
--
    Xm_String_Os_Charset : constant Xm_String_Char_Set := "ISO8859-1";
    Xm_Fallback_Charset : constant Xm_String_Char_Set := "ISO8859-1";
--    Xm_String_Default_Charset : constant Xm_String_Char_Set := (1 => Ascii.Nul);

    type Xm_Font_List_Entry is private;

    type Xm_Font_List is private;

--    type Xm_String_Context is private;

    type Xm_Font_Context is private;

--    type Xm_String_Component_Type is
--       (Xmstring_Component_Unknown, Xmstring_Component_Charset,
--	Xmstring_Component_Text, Xmstring_Component_Direction,
--	Xmstring_Component_Separator, Xmstring_Component_Locale_Text,
--	Xmstring_Component_End, Xmstring_Component_User_Begin,
--	Xmstring_Component_User_End);
--    for Xm_String_Component_Type'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;
--    for Xm_String_Component_Type use (Xmstring_Component_Unknown => 0,
--				      Xmstring_Component_Charset => 1,
--				      Xmstring_Component_Text => 2,
--				      Xmstring_Component_Direction => 3,
--				      Xmstring_Component_Separator => 4,
--				      Xmstring_Component_Locale_Text => 5,
--				      Xmstring_Component_End => 126,
--				      Xmstring_Component_User_Begin => 128,
--				      Xmstring_Component_User_End => 255);

    type Xm_Boolean is new Xt.Xt_Ancillary_Types.Xt_Boolean;

--    subtype Primitive_Class is Xt_Core.Core_Class;
--    subtype Primitive_Widget is Xt_Core.Core_Widget;
--    function Xm_Primitive_Widget_Class return Primitive_Class;
--
--    subtype Gadget_Class is Xt_Rect_Object.Rect_Object_Class;
--    subtype Gadget is Xt_Rect_Object.Rect_Object_Widget;
--    function Xm_Gadget_Class return Gadget_Class;
--
--    subtype Manager_Class is Xt_Constraint.Constraint_Class;
--    subtype Manager_Widget is Xt_Constraint.Constraint_Widget;
--    function Xm_Manager_Widget_Class return Manager_Class;
--
--    function Xm_Is_Primitive (W : in Xt_Widget) return Boolean;
--
--    function Xm_Is_Gadget (W : in Xt_Widget) return Boolean;
--
--    function Xm_Is_Manager (W : in Xt_Widget) return Boolean;
--
---- size policy values
--    type Xm_Size_Policy_Values is (Xmchange_All, Xmchange_None,
--				   Xmchange_Width, Xmchange_Height);
--    for Xm_Size_Policy_Values'Size use Xm_Enum_Length;
--    for Xm_Size_Policy_Values use (Xmchange_All => 0,
--				   Xmchange_None => 1,
--				   Xmchange_Width => 2,
--				   Xmchange_Height => 3);
----
---- unit type values
----
--    type Xm_Unit_Types is (Xmpixels, Xm100Th_Millimeters, Xm1000Th_Inches,
--			   Xm100Th_Points, Xm100Th_Font_Units);
--    for Xm_Unit_Types'Size use Xm_Enum_Length;
--    for Xm_Unit_Types use (Xmpixels => 0,
--			   Xm100Th_Millimeters => 1,
--			   Xm1000Th_Inches => 2,
--			   Xm100Th_Points => 3,
--			   Xm100Th_Font_Units => 4);
--
----
---- DeleteResponse Values
----
--    type Xm_Delete_Responses is (Xmdestroy, Xmunmap, Xmdo_Nothing);
--    for Xm_Delete_Responses'Size use Xm_Enum_Length;
--    for Xm_Delete_Responses use
--       (Xmdestroy => 0, Xmunmap => 1, Xmdo_Nothing => 2);
--
--    type Xm_Focus_Model is (Xmexplicit, Xmpointer);
--    for Xm_Focus_Model'Size use Xm_Enum_Length;
--    for Xm_Focus_Model use (Xmexplicit => 0, Xmpointer => 1);
--
----
---- Navigation defines
----
--    type Xm_Navigation_Type is
--       (Xmnone, Xmtab_Group, Xmsticky_Tab_Group,
--	Xmexclusive_Tab_Group, Xmdynamic_Default_Tab_Group);
--    for Xm_Navigation_Type'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;
--    for Xm_Navigation_Type use (Xmnone => 0,
--				Xmtab_Group => 1,
--				Xmsticky_Tab_Group => 2,
--				Xmexclusive_Tab_Group => 3,
--				Xmdynamic_Default_Tab_Group => 255);
--
----
---- Audible Warning
----
--    type Xm_Audibles is (Xmbell);
--    for Xm_Audibles'Size use Xm_Enum_Length;
--    for Xm_Audibles use (Xmbell => 1);
--
--    type Xm_Input_Policy is new X_Configuration_Dependent.Unsigned_Char;
----
---- Menu defines
----
--    type Xm_Orientations is (Xmno_Orientation, Xmvertical, Xmhorizontal);
--    for Xm_Orientations'Size use Xm_Enum_Length;
--    for Xm_Orientations use
--       (Xmno_Orientation => 0, Xmvertical => 1, Xmhorizontal => 2);
--
--    type Xm_Menus is (Xmwork_Area, Xmmenu_Bar, Xmmenu_Pulldown,
--		      Xmmenu_Popup, Xmmenu_Option);
--    for Xm_Menus'Size use Xm_Enum_Length;
--    for Xm_Menus use (Xmwork_Area => 0,
--		      Xmmenu_Bar => 1,
--		      Xmmenu_Pulldown => 2,
--		      Xmmenu_Popup => 3,
--		      Xmmenu_Option => 4);
--
--    type Xm_Packings is (Xmno_Packing, Xmpack_Tight,
--			 Xmpack_Column, Xmpack_None);
--    for Xm_Packings'Size use Xm_Enum_Length;
--    for Xm_Packings use (Xmno_Packing => 0,
--			 Xmpack_Tight => 1,
--			 Xmpack_Column => 2,
--			 Xmpack_None => 3);
--
----
---- Menu alignments
----
--    type Xm_Menu_Alignments is (Xmalignment_Contents_Top,
--				Xmalignment_Contents_Bottom);
--    for Xm_Menu_Alignments'Size use Xm_Enum_Length;
--    for Xm_Menu_Alignments use (Xmalignment_Contents_Top => 3,
--				Xmalignment_Contents_Bottom => 4);
--
--    type Xm_Tear_Offs is (Xmtear_Off_Enabled, Xmtear_Off_Disabled);
--    for Xm_Tear_Offs'Size use Xm_Enum_Length;
--    for Xm_Tear_Offs use (Xmtear_Off_Enabled => 0, Xmtear_Off_Disabled => 1);
--
--    type Xm_Unposts is (Xmunpost, Xmunpost_And_Replay);
--    for Xm_Unposts'Size use Xm_Enum_Length;
--    for Xm_Unposts use (Xmunpost => 0, Xmunpost_And_Replay => 1);

    type Xm_Positions is (Xmlast_Position, Xmfirst_Position);
    for Xm_Positions'Size use Xm_Enum_Length;
    for Xm_Positions use (Xmlast_Position => -1, Xmfirst_Position => 0);

----
---- Label defines
----
--    type Xm_Alignments is (Xmalignment_Beginning,
--			   Xmalignment_Center, Xmalignment_End);
--    for Xm_Alignments'Size use Xm_Enum_Length;
--    for Xm_Alignments use (Xmalignment_Beginning => 0,
--			   Xmalignment_Center => 1,
--			   Xmalignment_End => 2);
--
--    Xm_Alignment_Beginning : constant Xm_Alignments := Xmalignment_Beginning;
--    Xm_Alignment_Center : constant Xm_Alignments := Xmalignment_Center;
--    Xm_Alignment_End : constant Xm_Alignments := Xmalignment_End;
--
----
---- Frame alignments
----
--    type Xm_Frame_Alignments is
--       (Xmalignment_Baseline_Top, Xmalignment_Baseline_Bottom,
--	Xmalignment_Widget_Top, Xmalignment_Widget_Bottom);
--    for Xm_Frame_Alignments'Size use Xm_Enum_Length;
--    for Xm_Frame_Alignments use (Xmalignment_Baseline_Top => 0,
--				 Xmalignment_Baseline_Bottom => 2,
--				 Xmalignment_Widget_Top => 3,
--				 Xmalignment_Widget_Bottom => 4);
--
--    type Xm_Frame_Child is (Xmframe_Generic_Child,
--			    Xmframe_Workarea_Child, Xmframe_Title_Child);
--    for Xm_Frame_Child'Size use Xm_Enum_Length;
--    for Xm_Frame_Child use (Xmframe_Generic_Child => 0,
--			    Xmframe_Workarea_Child => 1,
--			    Xmframe_Title_Child => 2);
--
----
---- ToggleButton defines
----
--    type Xm_Toggles is (Xmn_Of_Many, Xmone_Of_Many);
--    for Xm_Toggles'Size use Xm_Enum_Length;
--    for Xm_Toggles use (Xmn_Of_Many => 1, Xmone_Of_Many => 2);
----
---- Form defines
----
--    type Xm_Form_Attaches is (Xmattach_None, Xmattach_Form,
--			      Xmattach_Opposite_Form, Xmattach_Widget,
--			      Xmattach_Opposite_Widget,
--			      Xmattach_Position, Xmattach_Self);
--    for Xm_Form_Attaches'Size use Xm_Enum_Length;
--    for Xm_Form_Attaches use (Xmattach_None => 0,
--			      Xmattach_Form => 1,
--			      Xmattach_Opposite_Form => 2,
--			      Xmattach_Widget => 3,
--			      Xmattach_Opposite_Widget => 4,
--			      Xmattach_Position => 5,
--			      Xmattach_Self => 6);
--
--    type Xm_Form_Resizes is (Xmresize_None, Xmresize_Grow, Xmresize_Any);
--    for Xm_Form_Resizes'Size use Xm_Enum_Length;
--    for Xm_Form_Resizes use
--       (Xmresize_None => 0, Xmresize_Grow => 1, Xmresize_Any => 2);
--
----
---- Indicator types
----
--
--    type Xm_Indicator_Type is (XmINDICATOR_NONE, XmINDICATOR_FILL,
--				XmINDICATOR_CHECK, XmINDICATOR_CHECK_BOX,
--				XmINDICATOR_CROSS, XmINDICATOR_CROSS_BOX,
--  				XmINDICATOR_BOX);
--
--    for Xm_Indicator_Type'Size use Xm_Enum_Length;
--    Xm_INDICATOR_3D_BOX              : constant Integer := 1;
--    Xm_INDICATOR_FLAT_BOX            : constant Integer := 2;
--    Xm_INDICATOR_CHECK_GLYPH         : constant Integer := 16;
--    Xm_INDICATOR_CROSS_GLYPH         : constant Integer := 32;
--    for Xm_Indicator_Type use (
--	XmINDICATOR_NONE      => 0, 
--	XmINDICATOR_FILL      => 1,
--	XmINDICATOR_CHECK     => Xm_INDICATOR_CHECK_GLYPH,
--	XmINDICATOR_CHECK_BOX => Xm_INDICATOR_CHECK_GLYPH + Xm_INDICATOR_3D_BOX,
--	XmINDICATOR_CROSS     => Xm_INDICATOR_CROSS_GLYPH,
--	XmINDICATOR_CROSS_BOX => Xm_INDICATOR_CROSS_GLYPH + Xm_INDICATOR_3D_BOX,
--	XmINDICATOR_BOX       => 255
--    );
--
----
---- Scroll bar defines
----
--    type Xm_Sliding_Mode is (XmSLIDER, XmTHERMOMETER);
--    for Xm_Sliding_Mode'Size use Xm_Enum_Length;
--    for Xm_Sliding_Mode use ( XmSLIDER => 0, XmTHERMOMETER=> 1 );
--
----
---- Callback reasons
----
--    type Callback_Reason is (Xmcr_None, Xmcr_Help, Xmcr_Value_Changed,
--			     Xmcr_Increment, Xmcr_Decrement,
--			     Xmcr_Page_Increment, Xmcr_Page_Decrement,
--			     Xmcr_To_Top, Xmcr_To_Bottom, Xmcr_Drag,
--			     Xmcr_Activate, Xmcr_Arm, Xmcr_Disarm,
--			     Xmcr_Map, Xmcr_Unmap, Xmcr_Focus,
--			     Xmcr_Losing_Focus, Xmcr_Modifying_Text_Value,
--			     Xmcr_Moving_Insert_Cursor, Xmcr_Execute,
--			     Xmcr_Single_Select, Xmcr_Multiple_Select,
--			     Xmcr_Extended_Select, Xmcr_Browse_Select,
--			     Xmcr_Default_Action, Xmcr_Clipboard_Data_Request,
--			     Xmcr_Clipboard_Data_Delete, Xmcr_Cascading,
--			     Xmcr_Ok, Xmcr_Cancel, Xmcr_Apply, Xmcr_No_Match,
--			     Xmcr_Command_Entered, Xmcr_Command_Changed,
--			     Xmcr_Expose, Xmcr_Resize, Xmcr_Input,
--			     Xmcr_Gain_Primary, Xmcr_Lose_Primary,
--			     Xmcr_Create, Xmcr_Tear_Off_Activate,
--			     Xmcr_Tear_Off_Deactivate, Xmcr_Obscured_Traversal);
--    for Callback_Reason'Size use Xm_Enum_Length;
--    for Callback_Reason use (Xmcr_None => 0,
--			     Xmcr_Help => 1,
--			     Xmcr_Value_Changed => 2,
--			     Xmcr_Increment => 3,
--			     Xmcr_Decrement => 4,
--			     Xmcr_Page_Increment => 5,
--			     Xmcr_Page_Decrement => 6,
--			     Xmcr_To_Top => 7,
--			     Xmcr_To_Bottom => 8,
--			     Xmcr_Drag => 9,
--			     Xmcr_Activate => 10,
--			     Xmcr_Arm => 11,
--			     Xmcr_Disarm => 12,
--			     Xmcr_Map => 16,
--			     Xmcr_Unmap => 17,
--			     Xmcr_Focus => 18,
--			     Xmcr_Losing_Focus => 19,
--			     Xmcr_Modifying_Text_Value => 20,
--			     Xmcr_Moving_Insert_Cursor => 21,
--			     Xmcr_Execute => 22,
--			     Xmcr_Single_Select => 23,
--			     Xmcr_Multiple_Select => 24,
--			     Xmcr_Extended_Select => 25,
--			     Xmcr_Browse_Select => 26,
--			     Xmcr_Default_Action => 27,
--			     Xmcr_Clipboard_Data_Request => 28,
--			     Xmcr_Clipboard_Data_Delete => 29,
--			     Xmcr_Cascading => 30,
--			     Xmcr_Ok => 31,
--			     Xmcr_Cancel => 32,
--			     Xmcr_Apply => 34,
--			     Xmcr_No_Match => 35,
--			     Xmcr_Command_Entered => 36,
--			     Xmcr_Command_Changed => 37,
--			     Xmcr_Expose => 38,
--			     Xmcr_Resize => 39,
--			     Xmcr_Input => 40,
--			     Xmcr_Gain_Primary => 41,
--			     Xmcr_Lose_Primary => 42,
--			     Xmcr_Create => 43,
--			     Xmcr_Tear_Off_Activate => 44,
--			     Xmcr_Tear_Off_Deactivate => 45,
--			     Xmcr_Obscured_Traversal => 46);
--
--    Word_Size : constant := X_Configuration_Dependent.Word_Size;
--
---- non-specific Callback structure -- see the specific widget
---- specs for specific widget callback structures
----
--    type Xm_Any_Callback_Rec is
--	record
--	    Reason : Callback_Reason;
--	    Event_Ptr : X_Event_Ptr;
--	end record;
--    for Xm_Any_Callback_Rec use
--	record
--	    Reason at 0 * Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	    Event_Ptr at 1 * Word_Size
--	       range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
--	end record;
--    type Xm_Any_Callback_Rec_Ptr is access Xm_Any_Callback_Rec;
--
----
---- PushButton defines
----
--    type Xm_Multiclicks is (Xmmulticlick_Discard, Xmmulticlick_Keep);
--    for Xm_Multiclicks'Size use Xm_Enum_Length;
--    for Xm_Multiclicks use (Xmmulticlick_Discard => 0, Xmmulticlick_Keep => 1);
----
---- DrawnButton defines
----
--    type Xm_Shadows is (Xmshadow_In, Xmshadow_Out);
--    for Xm_Shadows'Size use Xm_Enum_Length;
--    for Xm_Shadows use (Xmshadow_In => 7, Xmshadow_Out => 8);
----
---- Arrow defines
----
--    type Xm_Arrows is (Xmarrow_Up, Xmarrow_Down, Xmarrow_Left, Xmarrow_Right);
--    for Xm_Arrows'Size use Xm_Enum_Length;
--    for Xm_Arrows use (Xmarrow_Up => 0,
--		       Xmarrow_Down => 1,
--		       Xmarrow_Left => 2,
--		       Xmarrow_Right => 3);
----
---- Separator defines
----
--    type Xm_Lines is (Xmno_Line, Xmsingle_Line, Xmdouble_Line,
--		      Xmsingle_Dashed_Line, Xmdouble_Dashed_Line,
--		      Xmshadow_Etched_In, Xmshadow_Etched_Out,
--		      Xmshadow_Etched_In_Dash, Xmshadow_Etched_Out_Dash,
--		      Xminvalid_Separator_Type);
--    for Xm_Lines'Size use Xm_Enum_Length;
--    for Xm_Lines use (Xmno_Line => 0,
--		      Xmsingle_Line => 1,
--		      Xmdouble_Line => 2,
--		      Xmsingle_Dashed_Line => 3,
--		      Xmdouble_Dashed_Line => 4,
--		      Xmshadow_Etched_In => 5,
--		      Xmshadow_Etched_Out => 6,
--		      Xmshadow_Etched_In_Dash => 7,
--		      Xmshadow_Etched_Out_Dash => 8,
--		      Xminvalid_Separator_Type => 9);
--
--    type Xm_Labels is (Xmpixmap, Xmstring);
--    for Xm_Labels'Size use Xm_Enum_Length;
--    for Xm_Labels use (Xmpixmap => 1, Xmstring => 2);

    type Xm_Drag_Drop is (Xmwindow, Xmcursor);
    for Xm_Drag_Drop'Size use Xm_Enum_Length;
    for Xm_Drag_Drop use (Xmwindow => 0, Xmcursor => 2);

--    type Xm_Scrollbar_Maximums is (Xmmax_On_Top, Xmmax_On_Bottom,
--				   Xmmax_On_Left, Xmmax_On_Right);
--    for Xm_Scrollbar_Maximums'Size use Xm_Enum_Length;
--    for Xm_Scrollbar_Maximums use (Xmmax_On_Top => 0,
--				   Xmmax_On_Bottom => 1,
--				   Xmmax_On_Left => 2,
--				   Xmmax_On_Right => 3);
----
---- Selection types
----
--    type Xm_Selections is (Xmsingle_Select, Xmmultiple_Select,
--			   Xmextended_Select, Xmbrowse_Select);
--    for Xm_Selections'Size use Xm_Enum_Length;
--    for Xm_Selections use (Xmsingle_Select => 0,
--			   Xmmultiple_Select => 1,
--			   Xmextended_Select => 2,
--			   Xmbrowse_Select => 3);

    type Xm_States is (Xmstatic, Xmdynamic);
    for Xm_States'Size use Xm_Enum_Length;
    for Xm_States use (Xmstatic => 0, Xmdynamic => 1);
----
---- Scrolled Window defines
----
--    type Xm_Visual_Policy is (Xmvariable, Xmconstant, Xmresize_If_Possible);
--    for Xm_Visual_Policy'Size use Xm_Enum_Length;
--    for Xm_Visual_Policy use
--       (Xmvariable => 0, Xmconstant => 1, Xmresize_If_Possible => 2);
--
--    Xm_Constant : constant Xm_Visual_Policy := Xmconstant;
--
--    type Xm_Scrolling_Policy is (Xmautomatic, Xmapplication_Defined);
--    for Xm_Scrolling_Policy'Size use Xm_Enum_Length;
--    for Xm_Scrolling_Policy use (Xmautomatic => 0, Xmapplication_Defined => 1);
--
--    type Xm_Scroll_Bar_Display_Policy is (Xmas_Needed);
--    for Xm_Scroll_Bar_Display_Policy'Size use Xm_Enum_Length;
--    for Xm_Scroll_Bar_Display_Policy use (Xmas_Needed => 1);
--
--    type Xm_Scroll_Bar_Placement is
--       (Xmbottom_Right, Xmtop_Right, Xmbottom_Left, Xmtop_Left);
--    for Xm_Scroll_Bar_Placement'Size use Xm_Enum_Length;
--    for Xm_Scroll_Bar_Placement use (Xmbottom_Right => 0,
--				     Xmtop_Right => 1,
--				     Xmbottom_Left => 2,
--				     Xmtop_Left => 3);
----
---- MainWindow Resources
----
--    type Xm_Command_Locations is
--       (Xmcommand_Above_Workspace, Xmcommand_Below_Workspace);
--    for Xm_Command_Locations'Size use Xm_Enum_Length;
--    for Xm_Command_Locations use (Xmcommand_Above_Workspace => 0,
--				  Xmcommand_Below_Workspace => 1);
----
---- Text Widget defines
----
--    type Xm_Line_Edits is (Xmmulti_Line_Edit, Xmsingle_Line_Edit);
--    for Xm_Line_Edits'Size use Xm_Enum_Length;
--    for Xm_Line_Edits use (Xmmulti_Line_Edit => 0, Xmsingle_Line_Edit => 1);
--
--    type Xm_Text_Direction is (Xmtext_Forward, Xmtext_Backward);
--    for Xm_Text_Direction'Size use Xm_Enum_Length;
--    for Xm_Text_Direction use (Xmtext_Forward => 0, Xmtext_Backward => 1);
--
--    subtype Xm_Text_Position is X_Configuration_Dependent.Long;
--    type Xm_Text_Format is new X_Lib.Atoms.Atom;

    Fmt8Bit : constant Xm_Text_Format := Xm_Text_Format (X_Lib.Atoms.Xa_String);
    Fmt16Bit : constant Xm_Text_Format := 2;

    Fmt_8_Bit : constant Xm_Text_Format := Fmt8Bit;
    Fmt_16_Bit : constant Xm_Text_Format := Fmt16Bit;

    type Xm_Text_Scan_Type is (Xm_Select_Position, Xmselect_Whitespace,
			       Xm_Select_Word, Xmselect_Line,
			       Xm_Select_All, Xmselect_Paragraph);
    for Xm_Text_Scan_Type'Size use Xm_Enum_Length;
    for Xm_Text_Scan_Type use (Xm_Select_Position => 0,
			       Xmselect_Whitespace => 1,
			       Xm_Select_Word => 2,
			       Xmselect_Line => 3,
			       Xm_Select_All => 4,
			       Xmselect_Paragraph => 5);

    type Xm_Text_Scan_Type_Array is
       array (Natural range <>) of Xm_Text_Scan_Type;
    type Xm_Text_Scan_Type_Ptr is access Xm_Text_Scan_Type_Array;

--    type Xm_Highlight_Mode is (Xmhighlight_Normal, Xmhighlight_Selected,
--			       Xmhighlight_Secondary_Selected);
--    for Xm_Highlight_Mode'Size use Xm_Enum_Length;
--    for Xm_Highlight_Mode use (Xmhighlight_Normal => 0,
--			       Xmhighlight_Selected => 1,
--			       Xmhighlight_Secondary_Selected => 2);
--
--    Xmcopy_Failed : constant := 0;
--    Xmcopy_Succeeded : constant := 1;
--    Xmcopy_Truncated : constant := 2;
--
--
---- DIALOG defines..  BulletinBoard and things common to its subclasses
---- CommandBox    MessageBox    Selection    FileSelection
----
---- child type defines for Xm...GetChild()
--    type Xm_Child_Types is (Xmdialog_None, Xmdialog_Apply_Button,
--			    Xmdialog_Cancel_Button, Xmdialog_Default_Button,
--			    Xmdialog_Ok_Button, Xmdialog_Filter_Label,
--			    Xmdialog_Filter_Text, Xmdialog_Help_Button,
--			    Xmdialog_List, Xmdialog_List_Label,
--			    Xmdialog_Message_Label, Xmdialog_Selection_Label,
--			    Xmdialog_Symbol_Label, Xmdialog_Text,
--			    Xmdialog_Separator, Xmdialog_Dir_List,
--			    Xmdialog_Dir_List_Label);
--    for Xm_Child_Types'Size use Xm_Enum_Length;
--    for Xm_Child_Types use (Xmdialog_None => 0,
--			    Xmdialog_Apply_Button => 1,
--			    Xmdialog_Cancel_Button => 2,
--			    Xmdialog_Default_Button => 3,
--			    Xmdialog_Ok_Button => 4,
--			    Xmdialog_Filter_Label => 5,
--			    Xmdialog_Filter_Text => 6,
--			    Xmdialog_Help_Button => 7,
--			    Xmdialog_List => 8,
--			    Xmdialog_List_Label => 9,
--			    Xmdialog_Message_Label => 10,
--			    Xmdialog_Selection_Label => 11,
--			    Xmdialog_Symbol_Label => 12,
--			    Xmdialog_Text => 13,
--			    Xmdialog_Separator => 14,
--			    Xmdialog_Dir_List => 15,
--			    Xmdialog_Dir_List_Label => 16);
--
--    Xmdialog_History_List : constant Xm_Child_Types := Xmdialog_List;
--    Xmdialog_Prompt_Label : constant Xm_Child_Types := Xmdialog_Selection_Label;
--    Xmdialog_Value_Text : constant Xm_Child_Types := Xmdialog_Text;
--    Xmdialog_Command_Text : constant Xm_Child_Types := Xmdialog_Text;
--    Xmdialog_File_List : constant Xm_Child_Types := Xmdialog_List;
--    Xmdialog_File_List_Label : constant Xm_Child_Types := Xmdialog_List_Label;
--
----
---- dialog style defines
----
--    type Xm_Dialog_Styles is
--       (Xmdialog_Modeless, Xmdialog_Primary_Application_Modal,
--	Xmdialog_Full_Application_Modal, Xmdialog_System_Modal);
--    for Xm_Dialog_Styles'Size use Xm_Enum_Length;
--    for Xm_Dialog_Styles use (Xmdialog_Modeless => 0,
--			      Xmdialog_Primary_Application_Modal => 1,
--			      Xmdialog_Full_Application_Modal => 2,
--			      Xmdialog_System_Modal => 3);
--
--    Xmdialog_Application_Modal : constant Xm_Dialog_Styles :=
--       Xmdialog_Primary_Application_Modal;
--
--    type Xm_Selection_Box is (Xmplace_Top, Xmplace_Above_Selection,
--			      Xmplace_Below_Selection);
--    for Xm_Selection_Box'Size use Xm_Enum_Length;
--    for Xm_Selection_Box use (Xmplace_Top => 0,
--			      Xmplace_Above_Selection => 1,
--			      Xmplace_Below_Selection => 2);

--
-- XmSelectionBox, XmFileSelectionBox and XmCommand - misc. stuff
--
--Defines for file type mask:
--
    type Xm_File_Type_Masks is
       (Xmfile_Directory, Xmfile_Regular, Xmfile_Any_Type);
    for Xm_File_Type_Masks'Size use Xm_Enum_Length;
    for Xm_File_Type_Masks use
       (Xmfile_Directory => 1, Xmfile_Regular => 2, Xmfile_Any_Type => 3);
----
---- Defines for selection dialog type:
----
--    type Xm_Selection_Dialog_Types is
--       (Xmdialog_Work_Area, Xmdialog_Prompt, Xmdialog_Selection,
--	Xmdialog_Command, Xmdialog_File_Selection);
--    for Xm_Selection_Dialog_Types'Size use Xm_Enum_Length;
--    for Xm_Selection_Dialog_Types use (Xmdialog_Work_Area => 0,
--				       Xmdialog_Prompt => 1,
--				       Xmdialog_Selection => 2,
--				       Xmdialog_Command => 3,
--				       Xmdialog_File_Selection => 4);
----
---- XmMessageBox           stuff not common to other dialogs
----
---- defines for dialog type
----
--    type Xm_Dialog_Types is
--       (Xmdialog_Template, Xmdialog_Error, Xmdialog_Information,
--	Xmdialog_Message, Xmdialog_Question,
--	Xmdialog_Warning, Xmdialog_Working);
--    for Xm_Dialog_Types'Size use Xm_Enum_Length;
--    for Xm_Dialog_Types use (Xmdialog_Template => 0,
--			     Xmdialog_Error => 1,
--			     Xmdialog_Information => 2,
--			     Xmdialog_Message => 3,
--			     Xmdialog_Question => 4,
--			     Xmdialog_Warning => 5,
--			     Xmdialog_Working => 6);
--
-- Traversal types defines
--
    type Xm_Visibility is (Xmvisibility_Unobscured,
			   Xmvisibility_Partially_Obscured,
			   Xmvisibility_Fully_Obscured);
    for Xm_Visibility'Size use Xm_Enum_Length;
    for Xm_Visibility use (Xmvisibility_Unobscured => 0,
			   Xmvisibility_Partially_Obscured => 1,
			   Xmvisibility_Fully_Obscured => 2);
----
---- Traversal direction defines
----
--    type Xm_Traversal_Directions is
--       (Xmtraverse_Current, Xmtraverse_Next, Xmtraverse_Prev, Xmtraverse_Home,
--	Xmtraverse_Next_Tab_Group, Xmtraverse_Prev_Tab_Group,
--	Xmtraverse_Up, Xmtraverse_Down, Xmtraverse_Left, Xmtraverse_Right);
--    for Xm_Traversal_Directions'Size use Xm_Enum_Length;
--    for Xm_Traversal_Directions use (Xmtraverse_Current => 0,
--				     Xmtraverse_Next => 1,
--				     Xmtraverse_Prev => 2,
--				     Xmtraverse_Home => 3,
--				     Xmtraverse_Next_Tab_Group => 4,
--				     Xmtraverse_Prev_Tab_Group => 5,
--				     Xmtraverse_Up => 6,
--				     Xmtraverse_Down => 7,
--				     Xmtraverse_Left => 8,
--				     Xmtraverse_Right => 9);
--
--    type Xm_Traverse_Obscured_Callback_Rec is
--	record
--	    Reason : Xm.Callback_Reason;
--	    Event : X_Lib.Events.Event;
--	    Traversal_Destination : Xm.Xt_Widget;
--	    Direction : Xm.Xm_Traversal_Directions;
--	end record;
--
--    for Xm_Traverse_Obscured_Callback_Rec use
--	record
--	    Reason at 0 * Word_Size range 0 .. 31;
--	    Event at 1 * Word_Size range 0 .. 31;
--	    Traversal_Destination at 2 * Word_Size range 0 .. 31;
--	    Direction at 3 * Word_Size range 0 .. 31;
--	end record;

--
-- SimpleMenu declarations and definitions.
--
    type Xm_Button_Type is new X_Configuration_Dependent.Unsigned_Char;
    type Xm_Button_Type_Array is array (Natural range <>) of Xm_Button_Type;
    type Xm_Button_Type_Table is access Xm_Button_Type_Array;

    subtype Xm_Key_Sym_Array is X_Lib.Keyboard.Key_Sym_Array;
    subtype Xm_Key_Sym_Table is X_Lib.Keyboard.Key_Sym_List;

    type Xm_Menu_Parts is (Xmpushbutton, Xmtogglebutton, Xmradiobutton,
			   Xmcascadebutton, Xmseparator,
			   Xmdouble_Separator, Xmtitle);
    for Xm_Menu_Parts'Size use Xm_Enum_Length;
    for Xm_Menu_Parts use (Xmpushbutton => 1,
			   Xmtogglebutton => 2,
			   Xmradiobutton => 3,
			   Xmcascadebutton => 4,
			   Xmseparator => 5,
			   Xmdouble_Separator => 6,
			   Xmtitle => 7);

    Xmcheckbutton : constant Xm_Menu_Parts := Xmtogglebutton;

--    -- ********    BaseClass.c    ********
--    subtype Xm_Resource_Base_Proc is Xt.Xt_Pointer;
--
--    type Xm_Secondary_Resource_Data_Rec is
--	record
--	    Base_Proc : Xm_Resource_Base_Proc;
--	    Client_Data : Xt.Xt_Pointer;
--	    Name : X_Lib.String_Pointer;
--	    Res_Class : X_Lib.String_Pointer;
--	    Resources : Xt.Xt_Ancillary_Types.Xt_Resource_List;
--	    Num_Resources : Xt.Cardinal;
--	end record;
--
--    for Xm_Secondary_Resource_Data_Rec use
--	record
--	    Base_Proc at 0 * Word_Size range 0 .. 31;
--	    Client_Data at 1 * Word_Size range 0 .. 31;
--	    Name at 2 * Word_Size range 0 .. 31;
--	    Res_Class at 3 * Word_Size range 0 .. 31;
--	    Resources at 4 * Word_Size range 0 .. 31;
--	    Num_Resources at 5 * Word_Size range 0 .. 31;
--	end record;
--
--    type Xm_Secondary_Resource_Data is access Xm_Secondary_Resource_Data_Rec;
--    type Xm_Secondary_Resource_Data_Ptr is access Xm_Secondary_Resource_Data;
--    type Xm_Secondary_Resource_Data_Ptr_Ptr is
--       access Xm_Secondary_Resource_Data_Ptr;
--
--    function Xm_Get_Secondary_Resource_Data
--		(W_Class : in Xt.Widget_Class;
--		 Secondary_Data_Rtn : in Xm_Secondary_Resource_Data_Ptr_Ptr)
--		return Xt.Cardinal;

    function Xm_Uninstall_Image
		(Image : in X_Lib.Graphic_Output.Image) return Boolean;

    function Xm_Install_Image
		(Image : in X_Lib.Graphic_Output.Image; Image_Name : in String)
		return Boolean;

    function Xm_Destroy_Pixmap
		(The_Screen : in X_Lib.Screen; The_Pixmap : in X_Lib.Pixmap)
		return Boolean;

    function Xm_Get_Pixmap (The_Screen : in X_Lib.Screen;
			    Image_Name : in String;
			    Foreground : in X_Lib.Pixel;
			    Background : in X_Lib.Pixel) return X_Lib.Pixmap;

    function Xm_Get_Pixmap_By_Depth
		(Screen : in X_Lib.Screen;
		 Image_Name : in String;
		 Foreground : in X_Lib.Pixel;
		 Background : in X_Lib.Pixel;
		 Depth : in X_Lib.X_Integer) return X_Lib.Pixmap;

--    procedure Xm_Update_Display (W : in Xt_Widget);

    type Xm_Offset is new X_Configuration_Dependent.Long;
    type Xm_Offset_Array is array (Natural range <>) of Xm_Offset;
    type Xm_Offset_Table is access Xm_Offset_Array;

    procedure Xm_Resolve_Part_Offsets
		 (W_Class : in Xt.Widget_Class; Offsets : out Xm_Offset_Table);

    procedure Xm_Resolve_All_Part_Offsets
		 (W_Class : in Xt.Widget_Class;
		  Offsets : out Xm_Offset_Table;
		  Constraint_Offset : out Xm_Offset_Table);

    procedure Xm_Widget_Get_Baselines (W : in Xt_Widget;
				       Baselines : out Xt.Dimension_List;
				       Ret_Val : out Boolean);

    function Xm_Widget_Get_Display_Rect
		(W : in Xt_Widget; Display_Rect : in X_Lib.Rectangle_Ptr)
		return Boolean;

    procedure Xm_Register_Converters;

--
-- string to unit type converter.
--
    procedure Xm_Cvt_String_To_Unit_Type
		 (Args : in X_Lib.Resource_Manager.Xrm_Value_Array;
		  From_Val : in X_Lib.Resource_Manager.Xrm_Value;
		  To_Val : out X_Lib.Resource_Manager.Xrm_Value);

    function Xm_Register_Segment_Encoding
		(Fontlist_Tag : in Xm_String_Char_Set;
		 Ct_Encoding : in Xm_String_Char_Set) return Xm_String_Char_Set;

    function Xm_Map_Segment_Encoding (Fontlist_Tag : in Xm_String_Char_Set)
				     return Xm_String_Char_Set;

    -- note CT is compount_text
--    function Xm_Cvt_Ct_To_Xm_String (Text : in String) return Xm_String;

    function Xm_Cvt_Text_To_Xm_String
		(Dpy : in X_Lib.Display;
		 Args : in X_Lib.Resource_Manager.Xrm_Value_Array;
		 From_Value : in X_Lib.Resource_Manager.Xrm_Value;
		 To_Value : in X_Lib.Resource_Manager.Xrm_Value;
		 Converter_Data : in Xt.Xt_Pointer) return Boolean;

--    function Xm_Cvt_Xm_String_To_Ct (The_String : in Xm_String) return String;

    function Xm_Cvt_Xm_String_To_Text
		(Dpy : in X_Lib.Display;
		 Args : in X_Lib.Resource_Manager.Xrm_Value_Array;
		 From_Value : in X_Lib.Resource_Manager.Xrm_Value;
		 To_Value : in X_Lib.Resource_Manager.Xrm_Value;
		 Converter_Data : in Xt.Xt_Pointer) return Boolean;

--    function Xm_Convert_Units
--		(The_Widget : in Xt_Widget;
--		 The_Orientation : in Xm_Orientations;
--		 From_Type : in Xm_Unit_Types;
--		 From_Val : in X_Lib.X_Integer;
--		 To_Type : in Xm_Unit_Types) return X_Lib.X_Integer;

    function Xm_Cvt_From_Horizontal_Pixels
		(The_Screen : in X_Lib.Screen;
		 From_Value : in X_Lib.X_Integer;
		 To_Type : in Xm_Unit_Types) return X_Lib.X_Integer;

    function Xm_Cvt_To_Horizontal_Pixels
		(The_Screen : in X_Lib.Screen;
		 From_Value : in X_Lib.X_Integer;
		 From_Type : in Xm_Unit_Types) return X_Lib.X_Integer;

    function Xm_Cvt_From_Vertical_Pixels
		(The_Screen : in X_Lib.Screen;
		 From_Value : in X_Lib.X_Integer;
		 To_Type : in Xm_Unit_Types) return X_Lib.X_Integer;

    function Xm_Cvt_To_Vertical_Pixels
		(The_Screen : in X_Lib.Screen;
		 From_Value : in X_Lib.X_Integer;
		 From_Type : in Xm_Unit_Types) return X_Lib.X_Integer;

--    function Xm_Get_Menu_Cursor (Dpy : in X_Lib.Display)
--				return X_Lib.Cursors.Cursor;
--
--    procedure Xm_Set_Menu_Cursor (Dpy : in X_Lib.Display;
--				  Cursor_Id : in X_Lib.Cursors.Cursor);

--    function Xm_Create_Simple_Menu_Bar
--		(Parent : in Xt_Widget;
--		 Name : in String;
--		 An_Arg_List : in Xm_Arg_List := Null_Xm_Arg_List)
--		return Xt_Widget;
--
--    function Xm_Create_Simple_Popup_Menu
--		(Parent : in Xt_Widget;
--		 Name : in String;
--		 An_Arg_List : in Xm_Arg_List := Null_Xm_Arg_List)
--		return Xt_Widget;
--
--    function Xm_Create_Simple_Pulldown_Menu
--		(Parent : in Xt_Widget;
--		 Name : in String;
--		 An_Arg_List : in Xm_Arg_List := Null_Xm_Arg_List)
--		return Xt_Widget;
--
--    function Xm_Create_Simple_Option_Menu
--		(Parent : in Xt_Widget;
--		 Name : in String;
--		 An_Arg_List : in Xm_Arg_List := Null_Xm_Arg_List)
--		return Xt_Widget;
--
--    function Xm_Create_Simple_Radio_Box
--		(Parent : in Xt_Widget;
--		 Name : in String;
--		 An_Arg_List : in Xm_Arg_List := Null_Xm_Arg_List)
--		return Xt_Widget;
--
--    function Xm_Create_Simple_Check_Box
--		(Parent : in Xt_Widget;
--		 Name : in String;
--		 An_Arg_List : in Xm_Arg_List := Null_Xm_Arg_List)
--		return Xt_Widget;

    procedure Xm_Tracking_Event (The_Widget : in Xt_Widget;
				 The_Cursor : in X_Lib.Cursors.Cursor;
				 Confine_To : in Boolean;
				 Event_Rtn : out X_Lib.Events.Event_Record;
				 Ret_Val : out Xt_Widget);

    function Xm_Tracking_Locate (The_Widget : in Xt_Widget;
				 The_Cursor : in X_Lib.Cursors.Cursor;
				 Confine_To : in Boolean) return Xt_Widget;

--
-- Color generation function.
--
    type Xm_Color_Proc is new X_Lib.X_Address;

    function Xm_Get_Color_Calculation return Xm_Color_Proc;

    function Xm_Set_Color_Calculation
		(Proc : in Xm_Color_Proc) return Xm_Color_Proc;

---- If one (or more) of Foreground_Ret, Top_Shadow_Ret, Bottom_Shadow_Ret,
----    or Select_Ret are null, then that value is not returned.
--    procedure Xm_Get_Colors (The_Screen : in X_Lib.Screen;
--			     The_Colormap : in X_Lib.Colors.Color_Map;
--			     Background : in X_Lib.Pixel;
--			     Foreground_Ret : out X_Lib.Pixel;
--			     Top_Shadow_Ret : out X_Lib.Pixel;
--			     Bottom_Shadow_Ret : out X_Lib.Pixel;
--			     Select_Ret : out X_Lib.Pixel);
--
--    procedure Xm_Change_Color (W : in Xt_Widget; Background : in X_Lib.Pixel);

    function Xm_Get_Destination (Dpy : in X_Lib.Display) return Xt_Widget;

--    function Xm_Is_Traversable (Wid : in Xt_Widget) return Boolean;

    function Xm_Get_Visibility (Wid : in Xt_Widget) return Xm_Visibility;

--    function Xm_Get_Tab_Group (Wid : in Xt_Widget) return Xt_Widget;
--
--    function Xm_Get_Focus_Widget (Wid : in Xt_Widget) return Xt_Widget;
--
--    function Xm_Process_Traversal
--		(W : in Xt_Widget; Dir : in Xm_Traversal_Directions)
--		return Boolean;
--
--    procedure Xm_Add_Tab_Group (Tab_Group : in Xt_Widget);
--
--    procedure Xm_Remove_Tab_Group (W : in Xt_Widget);
--
--    procedure Xm_Im_Register
--		 (W : in Xt_Widget;
--		  Reserved : in X_Configuration_Dependent.Unsigned_Int);
--
--    procedure Xm_Im_Unregister (W : in Xt_Widget);
--
--    procedure Xm_Im_Set_Focus_Values
--		 (W : in Xt_Widget;
--		  Arg_List : in Xm_Arg_List := Null_Xm_Arg_List);
--
--    procedure Xm_Im_Set_Values (W : in Xt_Widget;
--				Arg_List : in Xm_Arg_List := Null_Xm_Arg_List);
--
--    procedure Xm_Im_Unset_Focus (W : in Xt_Widget);

    function Xm_Im_Get_X_Im (W : in Xt_Widget) return X_Lib.X_Im;

    procedure Xm_Im_Mb_Lookup_String
		 (W : in Xt_Widget;
		  Event : in X_Lib.Events.Event;  -- XKeyPressedEvent *event,
		  Buf : in String;
		  Key_Sym : in X_Lib.Keyboard.Key_Sym;
		  Status : in out X_Lib.X_Integer;
		  Ret_Val : out X_Lib.X_Integer);

    package Xm_Atom_Manager is
--	function Xm_Intern_Atom
--		    (Dpy : in X_Lib.Display;
--		     Name : in String;
--		     Only_If_Exists : in Boolean) return X_Lib.Atoms.Atom;
--
--	function Xm_Get_Atom_Name
--		    (Dpy : in X_Lib.Display; An_Atom : in X_Lib.Atoms.Atom)
--		    return Xt.Xt_String;

	function Xm_Name_To_Atom
		    (Dpy : in X_Lib.Display; An_Atom : in X_Lib.Atoms.Atom)
		    return Xt.Xt_String renames Xm_Get_Atom_Name;
    end Xm_Atom_Manager;

    package Xm_Cut_Paste is
--	type Xm_Clipboard_Results is
--	   (Xmclipboard_Fail, Xmclipboard_Success, Xmclipboard_Truncate,
--	    Xmclipboard_Locked, Xmclipboard_Bad_Format, Xmclipboard_No_Data);
--	for Xm_Clipboard_Results'Size use Xm.Xm_Enum_Length;
--	for Xm_Clipboard_Results use (Xmclipboard_Fail => 0,
--				      Xmclipboard_Success => 1,
--				      Xmclipboard_Truncate => 2,
--				      Xmclipboard_Locked => 4,
--				      Xmclipboard_Bad_Format => 5,
--				      Xmclipboard_No_Data => 6);

	type Xm_Clipboard_Pending_Rec is
	    record
		Data_Id : X_Configuration_Dependent.Long;
		Private_Id : X_Configuration_Dependent.Long;
	    end record;

	for Xm_Clipboard_Pending_Rec use
	    record
		Data_Id at 0 * X_Configuration_Dependent.Word_Size
		   range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
		Private_Id at 1 * X_Configuration_Dependent.Word_Size
		   range 0 .. X_Configuration_Dependent.Bits_Per_Word - 1;
	    end record;
	type Xm_Clipboard_Pending_List is
	   array (Natural range <>) of Xm_Clipboard_Pending_Rec;
	type Xm_Clipboard_Pending_List_Ptr is access Xm_Clipboard_Pending_List;

	subtype Xm_Cut_Paste_Proc is X_Lib.X_Address;
	subtype Void_Proc is X_Lib.X_Address;

	procedure Xm_Clipboard_Begin_Copy (Dpy : in X_Lib.Display;
					   X_Window : in X_Lib.Window;
					   Label : in Xm.Xm_String;
					   The_Widget : in Xm.Xt_Widget;
					   Callback_Proc : in Void_Proc;
					   Item_Id : out X_Lib.X_Long_Integer;
					   Result : out Xm_Clipboard_Results);

	procedure Xm_Clipboard_Start_Copy (Dpy : in X_Lib.Display;
					   X_Window : in X_Lib.Window;
					   Label : in Xm.Xm_String;
					   Time_Stamp : in X_Lib.Time;
					   The_Widget : in Xm.Xt_Widget;
					   Callback_Proc : in Xm_Cut_Paste_Proc;
					   Item_Id : out X_Lib.X_Long_Integer;
					   Result : out Xm_Clipboard_Results);

--	procedure Xm_Clipboard_Copy
--		     (Dpy : in X_Lib.Display;
--		      X_Window : in X_Lib.Window;
--		      Item_Id : in X_Lib.X_Long_Integer;
--		      Format_Name : in String;
--		      Buffer : in Xt.Xt_Pointer;
--		      Length : in X_Configuration_Dependent.Unsigned_Long;
--		      Private_Id : in X_Lib.X_Long_Integer;
--		      Data_Id : out X_Lib.X_Long_Integer;
--		      Result : out Xm_Clipboard_Results);
--
--	function Xm_Clipboard_End_Copy (Dpy : in X_Lib.Display;
--					X_Window : in X_Lib.Window;
--					Item_Id : in X_Lib.X_Long_Integer)
--				       return Xm_Clipboard_Results;
--
--	function Xm_Clipboard_Cancel_Copy (Dpy : in X_Lib.Display;
--					   X_Window : in X_Lib.Window;
--					   Item_Id : in X_Lib.X_Long_Integer)
--					  return Xm_Clipboard_Results;

	function Xm_Clipboard_Withdraw_Format
		    (Dpy : in X_Lib.Display;
		     X_Window : in X_Lib.Window;
		     Data_Id : in X_Lib.X_Long_Integer)
		    return Xm_Clipboard_Results;

--	function Xm_Clipboard_Copy_By_Name
--		    (Dpy : in X_Lib.Display;
--		     X_Window : in X_Lib.Window;
--		     Data_Id : in X_Lib.X_Long_Integer;
--		     Buffer : in Xt.Xt_Pointer;
--		     Length : in X_Configuration_Dependent.Unsigned_Long;
--		     Private_Id : in X_Lib.X_Long_Integer)
--		    return Xm_Clipboard_Results;

	function Xm_Clipboard_Undo_Copy
		    (Dpy : in X_Lib.Display; X_Window : in X_Lib.Window)
		    return Xm_Clipboard_Results;

--	function Xm_Clipboard_Lock (Dpy : in X_Lib.Display;
--				    X_Window : in X_Lib.Window)
--				   return Xm_Clipboard_Results;
--
--	function Xm_Clipboard_Unlock
--		    (Dpy : in X_Lib.Display;
--		     X_Window : in X_Lib.Window;
--		     All_Levels : in Boolean) return Xm_Clipboard_Results;

	function Xm_Clipboard_Start_Retrieve
		    (Dpy : in X_Lib.Display;
		     X_Window : in X_Lib.Window;
		     Time_Stamp : in X_Lib.Time) return Xm_Clipboard_Results;

--	function Xm_Clipboard_End_Retrieve
--		    (Dpy : in X_Lib.Display; X_Window : in X_Lib.Window)
--		    return Xm_Clipboard_Results;

	procedure Xm_Clipboard_Retrieve
		     (Dpy : in X_Lib.Display;
		      X_Window : in X_Lib.Window;
		      Format : in String;
		      Buffer : in Xt.Xt_Pointer;
		      Length : in X_Configuration_Dependent.Unsigned_Long;
		      Out_Length : out X_Configuration_Dependent.Unsigned_Long;
		      Private_Id : out X_Lib.X_Long_Integer;
		      Result : out Xm_Clipboard_Results);

--	procedure Xm_Clipboard_Inquire_Count
--		     (Dpy : in X_Lib.Display;
--		      X_Window : in X_Lib.Window;
--		      Count : out X_Lib.X_Integer;
--		      Max_Length : out X_Configuration_Dependent.Unsigned_Long;
--		      Result : out Xm_Clipboard_Results);
--
--	procedure Xm_Clipboard_Inquire_Format
--		     (Dpy : in X_Lib.Display;
--		      X_Window : in X_Lib.Window;
--		      Index : in X_Lib.X_Integer;
--		      Format_Name_Buf : out Xt.Xt_Pointer;
--		      Buffer_Length : in Xt.Cardinal;
--		      Out_Length : out Xt.Cardinal;
--		      Result : out Xm_Clipboard_Results);
--
--	procedure Xm_Clipboard_Inquire_Length
--		     (Dpy : in X_Lib.Display;
--		      X_Window : in X_Lib.Window;
--		      Format : in String;
--		      Length : out Xt.Cardinal;
--		      Result : out Xm_Clipboard_Results);

	procedure Xm_Clipboard_Inquire_Pending_Items
		     (Dpy : in X_Lib.Display;
		      X_Window : in X_Lib.Window;
		      Format_Name : in String;
		      Item_List : out Xm_Clipboard_Pending_List_Ptr;
		      Result : out Xm_Clipboard_Results);

	function Xm_Clipboard_Register_Format
		    (Dpy : in X_Lib.Display; Format_Name : in String)
		    return Xm_Clipboard_Results;

    end Xm_Cut_Paste;

    package Xm_Fonts is
--	procedure Xm_Set_Font_Unit (Dpy : in X_Lib.Display;
--				    Value : in X_Lib.X_Integer);
--
--	procedure Xm_Set_Font_Units (Dpy : in X_Lib.Display;
--				     Hvalue : in X_Lib.X_Integer;
--				     Vvalue : in X_Lib.X_Integer);

	function Xm_Font_List_Entry_Create
		    (Tag : in String;
		     Types : in Xm_Font_Type;
		     Font : in Xt.Xt_Pointer) return Xm_Font_List_Entry;

	procedure Xm_Font_List_Entry_Free (Entries : in Xm_Font_List_Entry);

	procedure Xm_Font_List_Entry_Get_Font (Entries : in Xm_Font_List_Entry;
					       Type_Return : out Xm_Font_Type;
					       List_Return : out Xt.Xt_Pointer);

	function Xm_Font_List_Entry_Get_Tag
		    (Entries : in Xm_Font_List_Entry) return String;

	function Xm_Font_List_Append_Entry
		    (Old : in Xm_Font_List; Entries : in Xm_Font_List_Entry)
		    return Xm_Font_List;

	function Xm_Font_List_Next_Entry
		    (Context : in Xm_Font_Context) return Xm_Font_List_Entry;

	function Xm_Font_List_Remove_Entry
		    (Old : in Xm_Font_List; Entries : in Xm_Font_List_Entry)
		    return Xm_Font_List;

	function Xm_Font_List_Entry_Load
		    (Dpy : in X_Lib.Display;
		     Font_Name : in String;
		     Types : in Xm_Font_Type;
		     Tag : in String) return Xm_Font_List_Entry;

	function Xm_Font_List_Create
		    (Font : in Xm_Font_Structure;
		     Charset : in Xm_String_Char_Set :=
			Xm_String_Default_Charset) return Xm_Font_List;

	procedure Xm_Font_List_Free (Font_List : in Xm_Font_List);

	function Xm_Font_List_Add
		    (Old : in Xm_Font_List;
		     Font : in Xm_Font_Structure;
		     Charset : in Xm_String_Char_Set :=
			Xm_String_Default_Charset) return Xm_Font_List;

	function Xm_Font_List_Copy
		    (Font_List : in Xm_Font_List) return Xm_Font_List;

	procedure Xm_Font_List_Init_Font_Context (Context : out Xm_Font_Context;
						  Font_List : in Xm_Font_List;
						  Result : out Boolean);

	function Xm_Font_List_Get_Next_Font
		    (Context : in Xm_Font_Context;
		     Charset : in Xm_String_Char_Set :=
			Xm_String_Default_Charset;
		     Font : in Xm_Font_Structure) return Boolean;

	procedure Xm_Font_List_Free_Font_Context (Context : in Xm_Font_Context);
    end Xm_Fonts;

    package Xm_Strings is
--	function Xm_String_Create
--		    (Text : in String;
--		     Charset : in Xm_String_Char_Set :=
--			Xm_String_Default_Charset) return Xm_String;
--
--	-- overloaded function to support non-ASCII charsets
--	function Xm_String_Create
--		    (Text : in X_Lib.String_8;
--		     Charset : in Xm_String_Char_Set :=
--			Xm_String_Default_Charset) return Xm_String;

	-- overloaded function to support non-ASCII charsets
	function Xm_String_Create
		    (Text : in X_Lib.Fonts.String_16;
		     Charset : in Xm_String_Char_Set :=
			Xm_String_Default_Charset) return Xm_String;

--	function Xm_String_Create_Simple (Text : in String) return Xm_String;
--
--	-- overloaded function to support non-ASCII charsets
--	function Xm_String_Create_Simple
--		    (Text : in X_Lib.String_8) return Xm_String;

	-- overloaded function to support non-ASCII charsets
	function Xm_String_Create_Simple
		    (Text : in X_Lib.Fonts.String_16) return Xm_String;

--	function Xm_String_Create_Localized (Text : in String) return Xm_String;
--
--	function Xm_String_Create_Localized
--		    (Text : in X_Lib.String_8) return Xm_String;

	function Xm_String_Create_Localized
		    (Text : in X_Lib.Fonts.String_16) return Xm_String;

--	function Xm_String_Direction_Create
--		    (Direction : in Xm_String_Direction :=
--			Xm_String_Direction_L_To_R) return Xm_String;
--
--	function Xm_String_Separator_Create return Xm_String;

	function Xm_String_Segment_Create
		    (Text : in String;
		     Charset : in Xm_String_Char_Set :=
			Xm_String_Default_Charset;
		     Direction : in Xm_String_Direction :=
			Xm_String_Direction_L_To_R;
		     Separator : in Boolean := False) return Xm_String;

	-- overloaded to support non-ASCII character sets
	function Xm_String_Segment_Create
		    (Text : in X_Lib.String_8;
		     Charset : in Xm_String_Char_Set :=
			Xm_String_Default_Charset;
		     Direction : in Xm_String_Direction :=
			Xm_String_Direction_L_To_R;
		     Separator : in Boolean := False) return Xm_String;

	-- overloaded to support non-ASCII character sets
	function Xm_String_Segment_Create
		    (Text : in X_Lib.Fonts.String_16;
		     Charset : in Xm_String_Char_Set :=
			Xm_String_Default_Charset;
		     Direction : in Xm_String_Direction :=
			Xm_String_Direction_L_To_R;
		     Separator : in Boolean := False) return Xm_String;

	function Xm_String_L_To_R_Create
		    (Text : in String;
		     Charset : in Xm_String_Char_Set :=
			Xm_String_Default_Charset) return Xm_String;

	-- overloaded function to support non-ASCII charsets
	function Xm_String_L_To_R_Create
		    (Text : in X_Lib.String_8;
		     Charset : in Xm_String_Char_Set :=
			Xm_String_Default_Charset) return Xm_String;

	-- overloaded function to support non-ASCII charsets
	function Xm_String_L_To_R_Create
		    (Text : in X_Lib.Fonts.String_16;
		     Charset : in Xm_String_Char_Set :=
			Xm_String_Default_Charset) return Xm_String;

--	function Xm_String_Create_L_To_R
--		    (Text : in String;
--		     Charset : in Xm_String_Char_Set :=
--			Xm_String_Default_Charset) return Xm_String;
--
--	-- overloaded function to support non-ASCII charsets
--	function Xm_String_Create_L_To_R
--		    (Text : in X_Lib.String_8;
--		     Charset : in Xm_String_Char_Set :=
--			Xm_String_Default_Charset) return Xm_String;

	-- overloaded function to support non-ASCII charsets
	function Xm_String_Create_L_To_R
		    (Text : in X_Lib.Fonts.String_16;
		     Charset : in Xm_String_Char_Set :=
			Xm_String_Default_Charset) return Xm_String;

--	procedure Xm_String_Init_Context (Context : out Xm_String_Context;
--					  The_String : in Xm_String;
--					  Status : out Boolean);
--
--	procedure Xm_String_Free_Context (Context : in Xm_String_Context);

	-- space is allocated on the heap for TEXT and CHARSET.  It is the
	-- users responsibility to free this memory.
	procedure Xm_String_Get_Next_Component
		     (Context : in Xm_String_Context;
		      Text : out Xt.Xt_String;
		      Charset : out Xm_String_Char_Set;
		      Direction : out Xm_String_Direction;
		      Unknown_Tag : out Xm_String_Component_Type;
		      Unknown_Length : out
			 X_Configuration_Dependent.Unsigned_Short;
		      Unknown_Value : out X_Lib.Bytes;
		      Component_Type : out Xm_String_Component_Type);

	-- overloaded function to support non-ASCII charsets
	-- space is allocated on the heap for TEXT and CHARSET.  It is the
	-- users responsibility to free this memory.
	procedure Xm_String_Get_Next_Component
		     (Context : in Xm_String_Context;
		      Text : out X_Lib.String_Pointer_8;
		      Charset : out Xm_String_Char_Set;
		      Direction : out Xm_String_Direction;
		      Unknown_Tag : out Xm_String_Component_Type;
		      Unknown_Length : out
			 X_Configuration_Dependent.Unsigned_Short;
		      Unknown_Value : out X_Lib.Bytes;
		      Component_Type : out Xm_String_Component_Type);

	-- overloaded function to support non-ASCII charsets
	-- space is allocated on the heap for TEXT and CHARSET.  It is the
	-- users responsibility to free this memory.
	procedure Xm_String_Get_Next_Component
		     (Context : in Xm_String_Context;
		      Text : out X_Lib.Fonts.String_Pointer_16;
		      Charset : out Xm_String_Char_Set;
		      Direction : out Xm_String_Direction;
		      Unknown_Tag : out Xm_String_Component_Type;
		      Unknown_Length : out
			 X_Configuration_Dependent.Unsigned_Short;
		      Unknown_Value : out X_Lib.Bytes;
		      Component_Type : out Xm_String_Component_Type);

	function Xm_String_Peek_Next_Component (Context : in Xm_String_Context)
					       return Xm_String_Component_Type;

	-- space is allocated on the heap for TEXT and CHARSET.  It is the
	-- users responsibility to free this memory.
	procedure Xm_String_Get_Next_Segment
		     (Context : in Xm_String_Context;
		      Text : out Xt.Xt_String;
		      Charset : out Xm_String_Char_Set;
		      Direction : out Xm_String_Direction;
		      Separator : out Boolean;
		      Status : out Boolean);

	-- overloaded function to support non-ASCII charsets
	-- space is allocated on the heap for TEXT and CHARSET.  It is the
	-- users responsibility to free this memory.
	procedure Xm_String_Get_Next_Segment
		     (Context : in Xm_String_Context;
		      Text : out X_Lib.String_Pointer_8;
		      Charset : out Xm_String_Char_Set;
		      Direction : out Xm_String_Direction;
		      Separator : out Boolean;
		      Status : out Boolean);

	-- overloaded function to support non-ASCII charsets
	-- space is allocated on the heap for TEXT and CHARSET.  It is the
	-- users responsibility to free this memory.
	procedure Xm_String_Get_Next_Segment
		     (Context : in Xm_String_Context;
		      Text : out X_Lib.Fonts.String_Pointer_16;
		      Charset : out Xm_String_Char_Set;
		      Direction : out Xm_String_Direction;
		      Separator : out Boolean;
		      Status : out Boolean);

--	-- space is allocated on the heap for TEXT.  It is the users
--	-- responsibility to free this memory.
--	procedure Xm_String_Get_L_To_R (The_String : in Xm_String;
--					Charset : in Xm_String_Char_Set :=
--					   Xm_String_Default_Charset;
--					Text : out Xt.Xt_String;
--					Result : out Boolean);
--
--	-- space is allocated on the heap for TEXT.  It is the users
--	-- responsibility to free this memory.
--	procedure Xm_String_Get_L_To_R (The_String : in Xm_String;
--					Charset : in Xm_String_Char_Set :=
--					   Xm_String_Default_Charset;
--					Text : out X_Lib.String_Pointer_8;
--					Result : out Boolean);

	-- space is allocated on the heap for TEXT.  It is the users
	-- responsibility to free this memory.
	procedure Xm_String_Get_L_To_R
		     (The_String : in Xm_String;
		      Charset : in Xm_String_Char_Set :=
			 Xm_String_Default_Charset;
		      Text : out X_Lib.Fonts.String_Pointer_16;
		      Result : out Boolean);

	function Xm_String_Create_Font_List
		    (Font : in Xm_Font_Structure;
		     Charset : in Xm_String_Char_Set :=
			Xm_String_Default_Charset) return Xm_Font_List;

--	function Xm_String_Concat
--		    (A : in Xm_String; B : in Xm_String) return Xm_String;

	function Xm_String_N_Concat (First : in Xm_String;
				     Second : in Xm_String;
				     N : in X_Lib.X_Integer) return Xm_String;

--	function Xm_String_Copy (The_String : in Xm_String) return Xm_String;

	function Xm_String_N_Copy
		    (The_String : in Xm_String; N : in X_Lib.X_Integer)
		    return Xm_String;

--	function Xm_String_Byte_Compare
--		    (A : in Xm_String; B : in Xm_String) return Boolean;
--
--	function Xm_String_Compare
--		    (A : in Xm_String; B : in Xm_String) return Boolean;
--
--	function Xm_String_Length
--		    (The_String : in Xm_String) return X_Lib.X_Integer;
--
--	function Xm_String_Empty (The_String : in Xm_String) return Boolean;
--
--	function Xm_String_Has_Substring
--		    (The_String : in Xm_String; Substring : in Xm_String)
--		    return Boolean;
--
--	procedure Xm_String_Free (The_String : in out Xm_String);
--
--	function Xm_String_Baseline
--		    (Font_List : in Xm_Font_List; The_String : in Xm_String)
--		    return Xt.Dimension;
--
--	function Xm_String_Width
--		    (Font_List : in Xm_Font_List; The_String : in Xm_String)
--		    return Xt.Dimension;
--
--	function Xm_String_Height
--		    (Font_List : in Xm_Font_List; The_String : in Xm_String)
--		    return Xt.Dimension;
--
--	procedure Xm_String_Extent (Font_List : in Xm_Font_List;
--				    The_String : in Xm_String;
--				    Width : out Xt.Dimension;
--				    Height : out Xt.Dimension);
--
--	function Xm_String_Line_Count
--		    (The_String : in Xm_String) return X_Lib.X_Integer;

	procedure Xm_String_Draw
		     (Dpy : in X_Lib.Display;
		      X_Window : in X_Lib.Window;
		      Font_List : in Xm_Font_List;
		      The_String : in Xm_String;
		      Gc : in X_Lib.Graphic_Output.Graphic_Context;
		      X : in Xt.Position;
		      Y : in Xt.Position;
		      Width : in Xt.Dimension;
		      Align : in Xm_Alignments := Xm_Alignment_Center;
		      Lay_Out_Direction : in Xm_String_Direction :=
			 Xm_String_Direction_L_To_R;
		      Clip : in X_Lib.Rectangle_Ptr);

	procedure Xm_String_Draw_Image
		     (Dpy : in X_Lib.Display;
		      X_Window : in X_Lib.Window;
		      Font_List : in Xm_Font_List;
		      The_String : in Xm_String;
		      Gc : in X_Lib.Graphic_Output.Graphic_Context;
		      X : in Xt.Position;
		      Y : in Xt.Position;
		      Width : in Xt.Dimension;
		      Align : in Xm_Alignments := Xm_Alignment_Center;
		      Lay_Out_Direction : in Xm_String_Direction :=
			 Xm_String_Direction_L_To_R;
		      Clip : in X_Lib.Rectangle_Ptr);

	procedure Xm_String_Draw_Underline
		     (Dpy : in X_Lib.Display;
		      X_Window : in X_Lib.Window;
		      Font_List : in Xm_Font_List;
		      The_String : in Xm_String;
		      Gc : in X_Lib.Graphic_Output.Graphic_Context;
		      X : in Xt.Position;
		      Y : in Xt.Position;
		      Width : in Xt.Dimension;
		      Align : in Xm_Alignments := Xm_Alignment_Center;
		      Lay_Out_Direction : in Xm_String_Direction :=
			 Xm_String_Direction_L_To_R;
		      Clip : in X_Lib.Rectangle_Ptr;
		      Under : in Xm_String);
    end Xm_Strings;

    package Xm_Utilities is
	function To_Xt_Arg_Val (Ch : in Character)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_String_Direction)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Focus_Model)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Size_Policy_Values)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Navigation_Type)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Orientations)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Menus)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Packings)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Alignments)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Toggles)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Form_Attaches)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Form_Resizes)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Indicator_Type)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Multiclicks)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Shadows)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Arrows)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Lines)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Labels)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Selections)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Scrollbar_Maximums)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_States)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Visual_Policy)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Scrolling_Policy)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Scroll_Bar_Display_Policy)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Scroll_Bar_Placement)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Sliding_Mode)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Command_Locations)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Line_Edits)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Text_Scan_Type)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Highlight_Mode)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Child_Types)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Dialog_Styles)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_File_Type_Masks)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Selection_Dialog_Types)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Dialog_Types)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Traversal_Directions)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Menu_Parts)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

	function To_Xt_Arg_Val (Value : in Xm_Unit_Types)
			       return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

    end Xm_Utilities;
private
    type Xm_Font_List_Rec;
    type Xm_Font_List_Entry is access Xm_Font_List_Rec;
    type Xm_Font_List is access Xm_Font_List_Rec;
    for Xm_Font_List_Entry'Storage_Size use 0;

    type Xm_Font_List_Context_Rec;
    type Xm_Font_Context is access Xm_Font_List_Context_Rec;
    for Xm_Font_Context'Storage_Size use 0;

    type Xm_String_Context_Rec;
    type Xm_String_Context is access Xm_String_Context_Rec;
    for Xm_String_Context'Storage_Size use 0;
end Xm;

------ COPYRIGHT AND DISTRIBUTION NOTICE ----------
--
-- (C) Copyright 1991, 1993 Systems Engineering Research Corporation
-- All Rights Reserved
--
-- This notice must be included in all copies of this software.
--
-- THIS SOFTWARE AND MANUAL ARE BOTH PROTECTED BY U.S. COPYRIGHT
-- LAW (TITLE 17 UNITED STATES CODE).  UNAUTHORIZED REPRODUCTION
-- AND/OR SALES MAY RESULT IN IMPRISIONMENT OF UP TO ONE YEAR AND
-- FINES OF UP TO $10,000 (17 USC 506).  COPYRIGHT INFRINGERS MAY
-- ALSO BE SUBJECT TO CIVIL LIABILITY.
--
-- THIS PROGRAM IS AN UNPUBLISHED WORK FULLY PROTECTED BY THE
-- UNITED STATES COPYRIGHT LAWS AND IS CONSIDERED A TRADE SECRET
-- BELONGING TO THE COPYRIGHT HOLDER.
--
-- Use of this software is restricted to those individuals and/or
-- organizations who have acquired a license from Systems Engineering
-- Research Corporation for a particular machine or set of machines.
-- No copying, use, or distribution of this software from or to an unlicensed
-- machine is allowed without the prior written consent of Systems
-- Engineering Research Corporation.
--
-- The SOFTWARE and documentation are provided with RESTRICTED RIGHTS.  Use,
-- duplication, or disclosure by the Government is subject to the restrictions
-- as set forth in subparagraph (c)(1)(ii) of The Rights in Technical Data
-- and Computer Software clause at 52.227-7013.  Contractor/manufacturer is
-- Systems Engineering Research Corporation/2555 Charleston Road/
-- Mountain View, CA 94043 1-800-Ada-SERC.
--
------- DISCLAIMER -------
--
-- This software and its documentation are provided "AS IS" and
-- without any expressed or implied warranties whatsoever.
-- No warranties as to performance, merchantability, or fitness
-- for a particular purpose exist.
--
-- Because of the diversity of conditions and hardware under
-- which this software may be used, no warranty of fitness for
-- a particular purpose is offered.  The user is advised to
-- test the software thoroughly before relying on it.  The user
-- must assume the entire risk and liability of using this
-- software.
--
-- In no event shall Systems Engineering Research Corporation and its
-- personnel be held responsible for any direct, indirect, consequential
-- or inconsequential damages or lost profits.
