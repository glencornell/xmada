-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with Xt, X_Lib, X_Lib_Interface, X_Configuration_Dependent,
     X_Masks, Xm, Xt_Core_Private, Xt_Composite_Private,
     Xt_Constraint_Private, Xt_Object_Private,
     Xt_Rect_Object_Private, X_Event_Utilities, Unchecked_Conversion;

package Xm_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;
    type Xm_Menu_Type is (Xmmenu_Popdown, Xmmenu_Process_Tree, Xmmenu_Traversal,
			  Xmmenu_Shell_Popdown, Xmmenu_Callback, Xmmenu_Button,
			  Xmmenu_Cascading, Xmmenu_Submenu, Xmmenu_Arm,
			  Xmmenu_Disarm, Xmmenu_Bar_Cleanup, Xmmenu_Status,
			  Xmmenu_Memwidget_Update, Xmmenu_Button_Popdown,
			  Xmmenu_Restore_Excluded_Tearoff_To_Toplevel_Shell,
			  Xmmenu_Restore_Tearoff_To_Toplevel_Shell,
			  Xmmenu_Restore_Tearoff_To_Menushell,
			  Xmmenu_Get_Last_Select_Toplevel, Xmmenu_Tear_Off_Arm);
    for Xm_Menu_Type'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;
    for Xm_Menu_Type use
       (Xmmenu_Popdown => 0,
	Xmmenu_Process_Tree => 1,
	Xmmenu_Traversal => 3,
	Xmmenu_Shell_Popdown => 4,
	Xmmenu_Callback => 5,
	Xmmenu_Button => 6,
	Xmmenu_Cascading => 7,
	Xmmenu_Submenu => 8,
	Xmmenu_Arm => 9,
	Xmmenu_Disarm => 10,
	Xmmenu_Bar_Cleanup => 11,
	Xmmenu_Status => 12,
	Xmmenu_Memwidget_Update => 13,
	Xmmenu_Button_Popdown => 14,
	Xmmenu_Restore_Excluded_Tearoff_To_Toplevel_Shell => 15,
	Xmmenu_Restore_Tearoff_To_Toplevel_Shell => 16,
	Xmmenu_Restore_Tearoff_To_Menushell => 17,
	Xmmenu_Get_Last_Select_Toplevel => 18,
	Xmmenu_Tear_Off_Arm => 19);

    -- Status for menus
    Xmmenu_Torn_Bit : constant := 2 ** 0;
    Xmmenu_Tear_Off_Shell_Descendant_Bit : constant := 2 ** 1;
    Xmmenu_Popup_Posted_Bit : constant := 2 ** 2;

    function Xm_Is_Torn (Mask : in X_Masks.Mask_Type) return X_Masks.Mask_Type;

    function Xm_Is_Tear_Off_Shell_Descendant_Bit
		(Mask : in X_Masks.Mask_Type) return X_Masks.Mask_Type;

    function Xm_Is_Popup_Posted
		(Mask : in X_Masks.Mask_Type) return X_Masks.Mask_Type;

    subtype Xm_Menu_Proc is X_Lib.X_Address;

    type Xm_Simple_Menu_Rec is
	record
	    Count : X_Lib.X_Integer;
	    Post_From_Button : X_Lib.X_Integer;
	    Callback : Xt.Xt_Callback_Proc;
	    Label_String : Xm.Xm_String_Table_Ptr;
	    Accelerator : X_Lib.String_List;
	    Accelerator_Text : Xm.Xm_String_Table_Ptr;
	    Mnemonic : Xm.Xm_Key_Sym_Table;
	    Mnemonic_Charset : Xm.Xm_String_Table_Ptr;
	    Button_Type : Xm.Xm_Button_Type_Table;
	    Button_Set : X_Lib.X_Integer;
	    Option_Label : Xm.Xm_String;
	    Option_Mnemonic : X_Lib.Keyboard.Key_Sym;
	end record;

    for Xm_Simple_Menu_Rec use
	record
	    Count at 0 * Word_Size range 0 .. 31;
	    Post_From_Button at 1 * Word_Size range 0 .. 31;
	    Callback at 2 * Word_Size range 0 .. 31;
	    Label_String at 3 * Word_Size range 0 .. 31;
	    Accelerator at 4 * Word_Size range 0 .. 31;
	    Accelerator_Text at 5 * Word_Size range 0 .. 31;
	    Mnemonic at 6 * Word_Size range 0 .. 31;
	    Mnemonic_Charset at 7 * Word_Size range 0 .. 31;
	    Button_Type at 8 * Word_Size range 0 .. 31;
	    Button_Set at 9 * Word_Size range 0 .. 31;
	    Option_Label at 10 * Word_Size range 0 .. 31;
	    Option_Mnemonic at 11 * Word_Size range 0 .. 31;
	end record;

    Xm_Simple_Menu_Rec_Size : constant := 12 * 32;

    type Xm_Simple_Menu_Rec_Ptr is access Xm_Simple_Menu_Rec;

    -- For MapEvent: _XmMatchBtnEvent
    Xmignore_Eventtype : constant := -1;

    -- Default minimum Toggle indicator dimension
    Xmdefault_Indicator_Dim : constant := 9;

    -- defines needed for 3D visual enhancement of defaultButtonshadow and
    -- implementation of ToggleButton Indicatorsize.

    Xm3D_Enhance_Pixel : constant := 2;
    Xmdefault_Top_Margin : constant := 0;
    Xmdefault_Bottom_Margin : constant := 0;

    type Xm_Import_Operator_Type is (Xmsynthetic_None, Xmsynthetic_Load);
    for Xm_Import_Operator_Type'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;
    for Xm_Import_Operator_Type use
       (Xmsynthetic_None => 0, Xmsynthetic_Load => 1);

    subtype Xm_Export_Proc is X_Lib.X_Address;
    subtype Xm_Import_Proc is X_Lib.X_Address;

--
-- Xm_Synthetic_Resource
--
    type Xm_Synthetic_Resource_Rec is
	record
	    Resource_Name : X_Lib.String_Pointer;
	    Resource_Size : Xt.Cardinal;
	    Resource_Offset : Xt.Cardinal;
	    Export_Proc : Xm_Export_Proc;
	    Import_Proc : Xm_Import_Proc;
	end record;

    for Xm_Synthetic_Resource_Rec use
	record
	    Resource_Name at 0 * Word_Size range 0 .. 31;
	    Resource_Size at 1 * Word_Size range 0 .. 31;
	    Resource_Offset at 2 * Word_Size range 0 .. 31;
	    Export_Proc at 3 * Word_Size range 0 .. 31;
	    Import_Proc at 4 * Word_Size range 0 .. 31;
	end record;

    Xm_Synthetic_Resource_Rec_Size : constant := 5 * 32;
    type Xm_Synthetic_Resource_Rec_Ptr is access Xm_Synthetic_Resource_Rec;

    type Xm_Synthetic_Resource_Array is
       array (Natural range <>) of Xm_Synthetic_Resource_Rec;
    type Xm_Synthetic_Resource_List is access Xm_Synthetic_Resource_Array;
    subtype Xm_Synthetic_Resource_Array_Ptr is Xm_Synthetic_Resource_List;

    -- Structure and defines for parent process data */

    -- Common to all parent process records. */
    type Xm_Parent_Process_Any_Rec is
	record
	    Process_Type : X_Lib.X_Integer;
	end record;

    for Xm_Parent_Process_Any_Rec use
	record
	    Process_Type at 0 * Word_Size range 0 .. 31;
	end record;

    type Cardinal_Ptr is access Xt.Cardinal;

    type Xm_Parent_Input_Action_Rec is
	record
	    Process_Type : X_Lib.X_Integer; -- Common to all parent process rec.
	    Event : X_Lib.Events.Event;
	    Action : X_Lib.X_Integer;
	    Params : X_Lib.String_List;
	    Num_Params : Cardinal_Ptr;
	end record;

    for Xm_Parent_Input_Action_Rec use
	record
	    Process_Type at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Action at 2 * Word_Size range 0 .. 31;
	    Params at 3 * Word_Size range 0 .. 31;
	    Num_Params at 4 * Word_Size range 0 .. 31;
	end record;

    type Xm_Parent_Process_Type is (Xmparent_Process_Any, Xminput_Action);
    for Xm_Parent_Process_Type'Size use Xm.Xm_Enum_Length;

    type Xm_Parent_Process_Data_Rec
	    (Kind : Xm_Parent_Process_Type := Xmparent_Process_Any) is
	record
	    case Kind is
		when Xmparent_Process_Any =>
		    Any : Xm_Parent_Process_Any_Rec;
		when Xminput_Action =>
		    Input_Action : Xm_Parent_Input_Action_Rec;
	    end case;
	end record;

    type Xm_Parent_Process_Data is access Xm_Parent_Process_Data_Rec;

    type Xm_Parent_Status is (Xmparent_Activate, Xmparent_Cancel);
    for Xm_Parent_Status'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;

    Xmreturn : constant Xm_Parent_Status := Xmparent_Activate;
    Xmcancel : constant Xm_Parent_Status := Xmparent_Cancel;

    Xminvalid_Dimension : Xt.Dimension := 16#FFFF#;

    type Xm_Baseline_Type is (Xmbaseline_Get, Xmbaseline_Set);
    for Xm_Baseline_Type'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;

    type Xm_Baseline_Margins is
	record
	    Get_Or_Set : X_Configuration_Dependent.Unsigned_Char;
	    Margin_Top : Xt.Dimension;
	    Margin_Bottom : Xt.Dimension;
	    Shadow : Xt.Dimension;
	    Highlight : Xt.Dimension;
	    Text_Height : Xt.Dimension;
	    Margin_Height : Xt.Dimension;
	    Dummy : Xt.Dimension;
	end record;

    for Xm_Baseline_Margins use
	record
	    Get_Or_Set at 0 * Word_Size range 0 .. 7;
	    Margin_Top at 0 * Word_Size + 2 range 0 .. 15;
	    Margin_Bottom at 1 * Word_Size range 0 .. 15;
	    Shadow at 1 * Word_Size + 2 range 0 .. 15;
	    Highlight at 2 * Word_Size range 0 .. 15;
	    Text_Height at 2 * Word_Size + 2 range 0 .. 15;
	    Margin_Height at 3 * Word_Size range 0 .. 15;
	    Dummy at 3 * Word_Size + 2 range 0 .. 15;
	end record;

    type Xm_Focus_Change is (Xmfocus_In, Xmfocus_Out, Xmenter, Xmleave);
    for Xm_Focus_Change'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;
    for Xm_Focus_Change use
       (Xmfocus_In => 0, Xmfocus_Out => 1, Xmenter => 2, Xmleave => 3);

    type Xm_Navigability is (Xmnot_Navigable, Xmcontrol_Navigable,
			     Xmtab_Navigable, Xmdescendants_Navigable,
			     Xmdescendants_Tab_Navigable);
    for Xm_Navigability'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;
    for Xm_Navigability use (Xmnot_Navigable => 0,
			     Xmcontrol_Navigable => 1,
			     Xmtab_Navigable => 2,
			     Xmdescendants_Navigable => 3,
			     Xmdescendants_Tab_Navigable => 4);

    subtype Xm_Void_Proc is Xt.Xt_Proc;

    subtype Xm_Parent_Process_Proc is X_Lib.X_Address;
    subtype Xm_Widget_Dispatch_Proc is X_Lib.X_Address;
    subtype Xm_Menu_Popup_Proc is X_Lib.X_Address;
    subtype Xm_Menu_Traversal_Proc is X_Lib.X_Address;
    subtype Xm_Resize_Flag_Proc is X_Lib.X_Address;
    subtype Xm_Realize_Out_Proc is X_Lib.X_Address;
    subtype Xm_Visual_Change_Proc is X_Lib.X_Address;
    subtype Xm_Traversal_Proc is X_Lib.X_Address;
    subtype Xm_Focus_Moved_Proc is X_Lib.X_Address;
    subtype Xm_Cache_Copy_Proc is X_Lib.X_Address;
    subtype Xm_Gadget_Cache_Proc is X_Lib.X_Address;
    subtype Xm_Cache_Compare_Proc is X_Lib.X_Address;
    subtype Xm_Widget_Baseline_Proc is X_Lib.X_Address;
    subtype Xm_Widget_Display_Rect_Proc is X_Lib.X_Address;
    subtype Xm_Widget_Margins_Proc is X_Lib.X_Address;
    subtype Xm_Widget_Navigable_Proc is X_Lib.X_Address;
    subtype Xm_Focus_Change_Proc is X_Lib.X_Address;

    type Xm_Highlight_Data is
	record
	    Number : Xt.Cardinal;
	    Maximum : Xt.Cardinal;
	    List : X_Lib.X_Address;
	end record;

    for Xm_Highlight_Data use
	record
	    Number at 0 * Word_Size range 0 .. 31;
	    Maximum at 1 * Word_Size range 0 .. 31;
	    List at 2 * Word_Size range 0 .. 31;
	end record;

    Highlight_Data_Size : constant := 32 * 3;

    type Xm_Select_Type is (Xmdest_Select, Xmprim_Select);
    for Xm_Select_Type'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;
    for Xm_Select_Type use (Xmdest_Select => 0, Xmprim_Select => 1);

    type Xm_Text_Context_Data_Rec is
	record
	    Screen : X_Lib.Screen;
	    Context : X_Lib.X_Context;
	    Types : X_Lib.X_Character;
	    Dummy : X_Lib.X_Character;
	end record;

    for Xm_Text_Context_Data_Rec use
	record
	    Screen at 0 * Word_Size range 0 .. 31;
	    Context at 1 * Word_Size range 0 .. 31;
	    Types at 2 * Word_Size range 0 .. 7;
	    Dummy at 2 * Word_Size range 24 .. 31;
	end record;
    Xm_Text_Context_Data_Rec_Size : constant := 3 * 32;

    type Xm_Text_Context_Data is access Xm_Text_Context_Data_Rec;

    Xmtext_Drag_Icon_Width : constant := 64;
    Xmtext_Drag_Icon_Height : constant := 64;
    Xmtext_Drag_Icon_X_Hot : constant := 10;
    Xmtext_Drag_Icon_Y_Hot : constant := 4;

    -- * Types and functions for Geometry Utilities
    type Xm_Geo_Size_Type is (Xmget_Actual_Size, Xmget_Preferred_Size,
			      Xmgeo_Pre_Set, Xmgeo_Post_Set);
    for Xm_Geo_Size_Type'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;
    for Xm_Geo_Size_Type use (Xmget_Actual_Size => 1,
			      Xmget_Preferred_Size => 2,
			      Xmgeo_Pre_Set => 3,
			      Xmgeo_Post_Set => 4);

    -- Defaults for Geometry Utility defines are always 0.
    type Xm_Geo_Arrangement is (Xmgeo_Expand, Xmgeo_Center, Xmgeo_Pack);
    for Xm_Geo_Arrangement'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;

    type Xm_Geo_Form is (Xmgeo_Proportional, Xmgeo_Averaging, Xmgeo_Wrap);
    for Xm_Geo_Form'Size use Xt.Xt_Ancillary_Types.Xt_Enum'Size;

    type Xm_Geo_Layout_Type is (Xmgeo_Row_Major, Xmgeo_Column_Major);
    for Xm_Geo_Layout_Type'Size use Xm.Xm_Enum_Length;


    -- XmGEO_COLUMN_MAJOR is not yet supported.

    type Xm_Kid_Geometry_Rec is
	record
	    Kid : Xt.Widget;
	    Box : Xt.Xt_Ancillary_Types.Xt_Widget_Geometry;
	end record;

    for Xm_Kid_Geometry_Rec use
	record
	    Kid at 0 * Word_Size range 0 .. 31;
	    Box at 1 * Word_Size
	       range 0 .. Xt.Xt_Ancillary_Types.Xt_Widget_Geometry_Size - 1;
	end record;

    Xm_Kid_Geometry_Rec_Size : constant :=
       32 + Xt.Xt_Ancillary_Types.Xt_Widget_Geometry_Size;
    type Xm_Kid_Geometry_Rec_Ptr is access Xm_Kid_Geometry_Rec;

    type Xm_Kid_Geometry_Array is
       array (Natural range <>) of Xm_Kid_Geometry_Rec;
    type Xm_Kid_Geometry_Array_Ptr is access Xm_Kid_Geometry_Array;


    subtype Xm_Geo_Arrange_Proc is X_Lib.X_Address;
    subtype Xm_Geo_Except_Proc is X_Lib.X_Address;
    subtype Xm_Geo_Ext_Destructor_Proc is X_Lib.X_Address;
    subtype Xm_Geo_Segment_Fix_Up_Proc is X_Lib.X_Address;

    type Xm_Geo_Row_Layout_Rec is
	record  
	    The_End : Xm.Xm_Boolean;
	    Fix_Up : Xm_Geo_Segment_Fix_Up_Proc;
	    Even_Width : Xt.Dimension;
	    Even_Height : Xt.Dimension;
	    Min_Height : Xt.Dimension;
	    Stretch_Height : Xm.Xm_Boolean;
	    Uniform_Border : Xm.Xm_Boolean;
	    Border : Xt.Dimension;
	    Fill_Mode : X_Lib.X_Character;
	    Fit_Mode : X_Lib.X_Character;
	    Sticky_End : Xm.Xm_Boolean;
	    Space_Above : Xt.Dimension;
	    Space_End : Xt.Dimension;
	    Space_Between : Xt.Dimension;
	    Max_Box_Height : Xt.Dimension;
	    Boxes_Width : Xt.Dimension;
	    Fill_Width : Xt.Dimension;
	    Box_Count : Xt.Dimension;
	end record;  
    for Xm_Geo_Row_Layout_Rec use
	record  
	    The_End at 0 * Word_Size range 0 .. 7;
	    Fix_Up at 1 * Word_Size range 0 .. 31;
	    Even_Width at 2 * Word_Size range 0 .. 15;
	    Even_Height at 2 * Word_Size + 2 range 0 .. 15;
	    Min_Height at 3 * Word_Size range 0 .. 15;
	    Stretch_Height at 3 * Word_Size + 2 range 0 .. 7;
	    Uniform_Border at 3 * Word_Size + 3 range 0 .. 7;
	    Border at 4 * Word_Size range 0 .. 15;
	    Fill_Mode at 4 * Word_Size + 2 range 0 .. 7;
	    Fit_Mode at 4 * Word_Size + 3 range 0 .. 7;
	    Sticky_End at 5 * Word_Size range 0 .. 7;
	    Space_Above at 5 * Word_Size + 2 range 0 .. 15;
	    Space_End at 6 * Word_Size range 0 .. 15;
	    Space_Between at 6 * Word_Size + 2 range 0 .. 15;
	    Max_Box_Height at 7 * Word_Size range 0 .. 15;
	    Boxes_Width at 7 * Word_Size + 2 range 0 .. 15;
	    Fill_Width at 8 * Word_Size range 0 .. 15;
	    Box_Count at 8 * Word_Size + 2 range 0 .. 15;
	end record;

    Xm_Geo_Row_Layout_Rec_Size : constant := 9 * 32;

    type Xm_Geo_Column_Layout_Rec is
	record
	    The_End : Xm.Xm_Boolean;
	    Fix_Up : Xm_Geo_Segment_Fix_Up_Proc;
	    Even_Height : Xt.Dimension;
	    Even_Width : Xt.Dimension;
	    Min_Width : Xt.Dimension;
	    Stretch_Width : Xm.Xm_Boolean;
	    Uniform_Border : Xm.Xm_Boolean;
	    Border : Xt.Dimension;
	    Fill_Mode : X_Lib.X_Character;
	    Fit_Mode : X_Lib.X_Character;
	    Sticky_End : Xm.Xm_Boolean;
	    Space_Left : Xt.Dimension;
	    Space_End : Xt.Dimension;
	    Space_Between : Xt.Dimension;
	    Max_Box_Width : Xt.Dimension;
	    Boxes_Height : Xt.Dimension;
	    Fill_Height : Xt.Dimension;
	    Box_Count : Xt.Dimension;
	end record;
    for Xm_Geo_Column_Layout_Rec use
	record
	    The_End at 0 * Word_Size range 0 .. 7;
	    Fix_Up at 1 * Word_Size range 0 .. 31;
	    Even_Height at 2 * Word_Size range 0 .. 15;
	    Even_Width at 2 * Word_Size + 2 range 0 .. 15;
	    Min_Width at 3 * Word_Size range 0 .. 15;
	    Stretch_Width at 3 * Word_Size + 2 range 0 .. 7;
	    Uniform_Border at 3 * Word_Size + 3 range 0 .. 7;
	    Border at 4 * Word_Size range 0 .. 15;
	    Fill_Mode at 4 * Word_Size + 2 range 0 .. 7;
	    Fit_Mode at 4 * Word_Size + 3 range 0 .. 7;
	    Sticky_End at 5 * Word_Size range 0 .. 7;
	    Space_Left at 5 * Word_Size + 2 range 0 .. 15;
	    Space_End at 6 * Word_Size range 0 .. 15;
	    Space_Between at 6 * Word_Size + 2 range 0 .. 15;
	    Max_Box_Width at 7 * Word_Size range 0 .. 15;
	    Boxes_Height at 7 * Word_Size + 2 range 0 .. 15;
	    Fill_Height at 8 * Word_Size range 0 .. 15;
	    Box_Count at 8 * Word_Size + 2 range 0 .. 15;
	end record;

    Xm_Geo_Column_Layout_Rec_Size : constant := 9 * 32;
    type Xm_Geo_Column_Layout is access Xm_Geo_Column_Layout_Rec;

    type Xm_Geo_Major_Layout_Rec
	    (Kind : Xm_Geo_Layout_Type := Xmgeo_Row_Major) is
	record
	    case Kind is
		when Xmgeo_Row_Major =>
		    Row : Xm_Geo_Row_Layout_Rec;
		when Xmgeo_Column_Major =>
		    Col : Xm_Geo_Column_Layout_Rec;
	    end case;
	end record;

    type Xm_Geo_Major_Layout is access Xm_Geo_Major_Layout_Rec;

    type Xm_Geo_Matrix_Rec is
	record
	    Composite : Xt.Widget;
	    Instigator : Xt.Widget;
	    Instig_Request : Xt.Xt_Ancillary_Types.
				Xt_Widget_Geometry; -- 6 words.
	    Parent_Request : Xt.Xt_Ancillary_Types.Xt_Widget_Geometry;
	    In_Layout : Xt.Xt_Ancillary_Types.Xt_Widget_Geometry_Ptr;
	    Boxes : Xm_Kid_Geometry_Array_Ptr;
	    Layouts : Xm_Geo_Major_Layout;
	    Margin_W : Xt.Dimension;
	    Margin_H : Xt.Dimension;
	    Stretch_Boxes : Xm.Xm_Boolean;
	    Uniform_Border : Xm.Xm_Boolean;
	    Border : Xt.Dimension;
	    Max_Major : Xt.Dimension;
	    Boxes_Minor : Xt.Dimension;
	    Fill_Minor : Xt.Dimension;
	    Width : Xt.Dimension;
	    Height : Xt.Dimension;
	    Set_Except : Xm_Geo_Except_Proc;
	    Almost_Except : Xm_Geo_Except_Proc;
	    No_Geo_Request : Xm_Geo_Except_Proc;
	    Extension : Xt.Xt_Pointer;
	    Ext_Destructor : Xm_Geo_Ext_Destructor_Proc;
	    Arrange_Boxes : Xm_Geo_Arrange_Proc;
	    Major_Order : X_Lib.X_Character;
	    Dummy : X_Lib.X_Character;
	end record;  
    for Xm_Geo_Matrix_Rec use
	record
	    Composite at 0 * Word_Size range 0 .. 31;
	    Instigator at 1 * Word_Size range 0 .. 31;
	    Instig_Request at 2 * Word_Size
	       range 0 .. Xt.Xt_Ancillary_Types.Xt_Widget_Geometry_Size - 1;
	    Parent_Request at 8 * Word_Size
	       range 0 .. Xt.Xt_Ancillary_Types.Xt_Widget_Geometry_Size - 1;
	    In_Layout at 14 * Word_Size range 0 .. 31;
	    Boxes at 15 * Word_Size range 0 .. 31;
	    Layouts at 16 * Word_Size range 0 .. 31;
	    Margin_W at 17 * Word_Size range 0 .. 15;
	    Margin_H at 17 * Word_Size + 2 range 0 .. 15;
	    Stretch_Boxes at 18 * Word_Size range 0 .. 7;
	    Uniform_Border at 18 * Word_Size + 1 range 0 .. 7;
	    Border at 18 * Word_Size + 2 range 0 .. 15;
	    Max_Major at 19 * Word_Size range 0 .. 15;
	    Boxes_Minor at 19 * Word_Size + 2 range 0 .. 15;
	    Fill_Minor at 20 * Word_Size range 0 .. 15;
	    Width at 20 * Word_Size + 2 range 0 .. 15;
	    Height at 21 * Word_Size range 0 .. 15;
	    Set_Except at 22 * Word_Size range 0 .. 31;
	    Almost_Except at 23 * Word_Size range 0 .. 31;
	    No_Geo_Request at 24 * Word_Size range 0 .. 31;
	    Extension at 25 * Word_Size range 0 .. 31;
	    Ext_Destructor at 26 * Word_Size range 0 .. 31;
	    Arrange_Boxes at 27 * Word_Size range 0 .. 31;
	    Major_Order at 28 * Word_Size range 0 .. 7;
	    Dummy at 28 * Word_Size + 3 range 0 .. 7;
	end record;

    Xm_Geo_Matrix_Rec_Size : constant := 29 * 32;
    type Xm_Geo_Matrix is access Xm_Geo_Matrix_Rec;

    subtype Xm_Geo_Create_Proc is X_Lib.X_Address;

    Xmfirst_Application_Subclass_Bit : constant := 192;

    type Xm_Bit_Type is (Xmcascade_Button_Bit, Xmcascade_Button_Gadget_Bit,
			 Xmcommand_Box_Bit, Xmdialog_Shell_Bit,
			 Xmlist_Bit, Xmform_Bit, Xmtext_Field_Bit,
			 Xmgadget_Bit, Xmlabel_Bit, Xmlabel_Gadget_Bit,
			 Xmmain_Window_Bit, Xmmanager_Bit, Xmmenu_Shell_Bit,
			 Xmdrawn_Button_Bit, Xmprimitive_Bit, Xmpush_Button_Bit,
			 Xmpush_Button_Gadget_Bit, Xmrow_Column_Bit,
			 Xmscroll_Bar_Bit, Xmscrolled_Window_Bit,
			 Xmselection_Box_Bit, Xmseparator_Bit,
			 Xmseparator_Gadget_Bit, Xmtext_Bit,
			 Xmtoggle_Button_Bit, Xmtoggle_Button_Gadget_Bit,
			 Xmdrop_Transfer_Bit, Xmdrop_Site_Manager_Bit,
			 Xmdisplay_Bit, Xmscreen_Bit, Xmarrow_Button_Bit,
			 Xmarrow_Button_Gadget_Bit, Xmbulletin_Board_Bit,
			 Xmdrawing_Area_Bit, Xmfile_Selection_Box_Bit,
			 Xmframe_Bit, Xmmessage_Box_Bit, Xmsash_Bit,
			 Xmscale_Bit, Xmpaned_Window_Bit,
			 Xmvendor_Shell_Bit, Xmfast_Subclass_Tail_Bit);
    for Xm_Bit_Type'Size use Xm.Xm_Enum_Length;
    for Xm_Bit_Type use (Xmcascade_Button_Bit => 1,
			 Xmcascade_Button_Gadget_Bit => 2,
			 Xmcommand_Box_Bit => 3,
			 Xmdialog_Shell_Bit => 4,
			 Xmlist_Bit => 5,
			 Xmform_Bit => 6,
			 Xmtext_Field_Bit => 7,
			 Xmgadget_Bit => 8,
			 Xmlabel_Bit => 9,
			 Xmlabel_Gadget_Bit => 10,
			 Xmmain_Window_Bit => 11,
			 Xmmanager_Bit => 12,
			 Xmmenu_Shell_Bit => 13,
			 Xmdrawn_Button_Bit => 14,
			 Xmprimitive_Bit => 15,
			 Xmpush_Button_Bit => 16,
			 Xmpush_Button_Gadget_Bit => 17,
			 Xmrow_Column_Bit => 18,
			 Xmscroll_Bar_Bit => 19,
			 Xmscrolled_Window_Bit => 20,
			 Xmselection_Box_Bit => 21,
			 Xmseparator_Bit => 22,
			 Xmseparator_Gadget_Bit => 23,
			 Xmtext_Bit => 24,
			 Xmtoggle_Button_Bit => 25,
			 Xmtoggle_Button_Gadget_Bit => 26,
			 Xmdrop_Transfer_Bit => 27,  -- 28 is available
			 Xmdrop_Site_Manager_Bit => 29,
			 Xmdisplay_Bit => 30,
			 Xmscreen_Bit => 31,
			 Xmarrow_Button_Bit => 32,
			 Xmarrow_Button_Gadget_Bit => 33,
			 Xmbulletin_Board_Bit => 34,
			 Xmdrawing_Area_Bit => 35,
			 Xmfile_Selection_Box_Bit => 36,
			 Xmframe_Bit => 37,
			 Xmmessage_Box_Bit => 38,
			 Xmsash_Bit => 39,
			 Xmscale_Bit => 40,
			 Xmpaned_Window_Bit => 41,
			 Xmvendor_Shell_Bit => 42,  -- unused
			 Xmfast_Subclass_Tail_Bit => 43);

    function To_Xm_Bit_Type is new Unchecked_Conversion (Integer, Xm_Bit_Type);
    function To_Int is new Unchecked_Conversion (Xm_Bit_Type, Integer);

    Xmlast_Fast_Subclass_Bit : constant Xm_Bit_Type :=
       To_Xm_Bit_Type (To_Int (Xmfast_Subclass_Tail_Bit) - 1);

    -- Define for the XmResolvePart function
    -- Widget class indices used with XmPartOffset and XmField macros in C

    Xm_Object_Index : constant := 0;
    Object_Index : constant := Xm_Object_Index;
    Xm_Rect_Obj_Index : constant := Xm_Object_Index + 1;
    Rect_Obj_Index : constant := Xm_Rect_Obj_Index;
    Xm_Window_Obj_Index : constant := Xm_Rect_Obj_Index + 1;
    Window_Obj_Index : constant := Xm_Window_Obj_Index;
    Xm_Core_Index : constant := 0;
    Core_Index : constant := Xm_Core_Index;
    Xm_Composite_Index : constant := Xm_Window_Obj_Index + 2;
    Composite_Index : constant := Xm_Composite_Index;
    Xm_Constraint_Index : constant := Xm_Composite_Index + 1;
    Constraint_Index : constant := Xm_Constraint_Index;
    Xm_Gadget_Index : constant := Xm_Rect_Obj_Index + 1;
    Xm_Primitive_Index : constant := Xm_Window_Obj_Index + 2;
    Xm_Manager_Index : constant := Xm_Constraint_Index + 1;

    Xm_Arrow_B_Index : constant := Xm_Primitive_Index + 1;
    Xm_Arrow_Button_Index : constant := Xm_Arrow_B_Index;
    Xm_Label_Index : constant := Xm_Primitive_Index + 1;
    Xm_List_Index : constant := Xm_Primitive_Index + 1;
    Xm_Scroll_Bar_Index : constant := Xm_Primitive_Index + 1;
    Xm_Separator_Index : constant := Xm_Primitive_Index + 1;
    Xm_Text_Index : constant := Xm_Primitive_Index + 1;

    Xm_Cascade_B_Index : constant := Xm_Label_Index + 1;
    Xm_Cascade_Button_Index : constant := Xm_Cascade_B_Index;
    Xm_Drawn_B_Index : constant := Xm_Label_Index + 1;
    Xm_Drawn_Button_Index : constant := Xm_Drawn_B_Index;
    Xm_Push_B_Index : constant := Xm_Label_Index + 1;
    Xm_Push_Button_Index : constant := Xm_Push_B_Index;
    Xm_Toggle_B_Index : constant := Xm_Label_Index + 1;
    Xm_Toggle_Button_Index : constant := Xm_Toggle_B_Index;

    Xm_Arrow_B_G_Index : constant := Xm_Gadget_Index + 1;
    Xm_Arrow_Button_Gadget_Index : constant := Xm_Arrow_B_G_Index;
    Xm_Label_G_Index : constant := Xm_Gadget_Index + 1;
    Xm_Label_Gadget_Index : constant := Xm_Label_G_Index;
    Xm_Separato_G_Index : constant := Xm_Gadget_Index + 1;
    Xm_Separator_Gadget_Index : constant := Xm_Separato_G_Index;

    Xm_Cascade_B_G_Index : constant := Xm_Label_G_Index + 1;
    Xm_Cascade_Button_Gadget_Index : constant := Xm_Cascade_B_G_Index;
    Xm_Push_B_G_Index : constant := Xm_Label_G_Index + 1;
    Xm_Push_Button_Gadget_Index : constant := Xm_Push_B_G_Index;
    Xm_Toggle_B_G_Index : constant := Xm_Label_G_Index + 1;
    Xm_Toggle_Button_Gadget_Index : constant := Xm_Toggle_B_G_Index;

    Xm_Bulletin_B_Index : constant := Xm_Manager_Index + 1;
    Xm_Bulletin_Board_Index : constant := Xm_Bulletin_B_Index;
    Xm_Drawing_A_Index : constant := Xm_Manager_Index + 1;
    Xm_Drawing_Area_Index : constant := Xm_Drawing_A_Index;
    Xm_Frame_Index : constant := Xm_Manager_Index + 1;
    Xm_Paned_W_Index : constant := Xm_Manager_Index + 1;
    Xm_Paned_Window_Index : constant := Xm_Paned_W_Index;
    Xm_Row_Column_Index : constant := Xm_Manager_Index + 1;
    Xm_Scale_Index : constant := Xm_Manager_Index + 1;
    Xm_Scrolled_W_Index : constant := Xm_Manager_Index + 1;
    Xm_Scrolled_Window_Index : constant := Xm_Scrolled_W_Index;

    Xm_Form_Index : constant := Xm_Bulletin_B_Index + 1;
    Xm_Message_B_Index : constant := Xm_Bulletin_B_Index + 1;
    Xm_Message_Box_Index : constant := Xm_Message_B_Index;
    Xm_Selectio_B_Index : constant := Xm_Bulletin_B_Index + 1;
    Xm_Selection_Box_Index : constant := Xm_Selectio_B_Index;

    Xm_Main_W_Index : constant := Xm_Scrolled_W_Index + 1;
    Xm_Main_Window_Index : constant := Xm_Main_W_Index;

    Xm_Command_Index : constant := Xm_Selectio_B_Index + 1;
    Xm_File_S_B_Index : constant := Xm_Selectio_B_Index + 1;
    Xm_File_Selection_Box_Index : constant := Xm_File_S_B_Index;

    Xm_Shell_Index : constant := Xm_Composite_Index + 1;
    Shell_Index : constant := Xm_Shell_Index;
    Xm_Override_Shell_Index : constant := Xm_Shell_Index + 1;
    Override_Shell_Index : constant := Xm_Override_Shell_Index;
    Xm_Wm_Shell_Index : constant := Xm_Shell_Index + 1;
    Wm_Shell_Index : constant := Xm_Wm_Shell_Index;
    Xm_Vendor_Shell_Index : constant := Xm_Wm_Shell_Index + 1;
    Vendor_Shell_Index : constant := Xm_Vendor_Shell_Index;
    Xm_Transient_Shell_Index : constant := Xm_Vendor_Shell_Index + 1;
    Transient_Shell_Index : constant := Xm_Transient_Shell_Index;
    Xm_Top_Level_Shell_Index : constant := Xm_Vendor_Shell_Index + 1;
    Top_Level_Shell_Index : constant := Xm_Top_Level_Shell_Index;
    Xm_Application_Shell_Index : constant := Xm_Top_Level_Shell_Index + 1;
    Application_Shell_Index : constant := Xm_Application_Shell_Index;

    Xm_Dialog_S_Index : constant := Xm_Transient_Shell_Index + 1;
    Xm_Dialog_Shell_Index : constant := Xm_Dialog_S_Index;
    Xm_Menu_Shell_Index : constant := Xm_Override_Shell_Index + 1;

    Xm_Long_Bits : constant := X_Configuration_Dependent.Long'Size * 8;
    Xm_Half_Longb_Its : constant := Xm_Long_Bits / 2;

    type Xm_Part_Resource is
	record
	    Resource_Name : X_Lib.String_Pointer;
	    Resource_Class : X_Lib.String_Pointer;
	    Resource_Type : X_Lib.String_Pointer;
	    Resource_Size : Xt.Cardinal;
	    Resource_Offset : Xt.Cardinal;
	    Default_Type : X_Lib.String_Pointer;
	    Default_Addr : Xt.Xt_Pointer;
	end record;

    for Xm_Part_Resource use
	record
	    Resource_Name at 0 * Word_Size range 0 .. 31;
	    Resource_Class at 1 * Word_Size range 0 .. 31;
	    Resource_Type at 2 * Word_Size range 0 .. 31;
	    Resource_Size at 3 * Word_Size range 0 .. 31;
	    Resource_Offset at 4 * Word_Size range 0 .. 31;
	    Default_Type at 5 * Word_Size range 0 .. 31;
	    Default_Addr at 6 * Word_Size range 0 .. 31;
	end record;

    Xm_Part_Resource_Size : constant := 7 * 32;

    type Xm_Part_Resource_Ptr is access Xm_Part_Resource;

    type Xm_Region_Box_Rec is
	record
	    X1 : X_Configuration_Dependent.Short;
	    X2 : X_Configuration_Dependent.Short;
	    Y1 : X_Configuration_Dependent.Short;
	    Y2 : X_Configuration_Dependent.Short;
	end record;

    for Xm_Region_Box_Rec use
	record
	    X1 at 0 * Word_Size range 0 .. 15;
	    X2 at 0 * Word_Size range 16 .. 31;
	    Y1 at 1 * Word_Size range 0 .. 15;
	    Y2 at 1 * Word_Size range 16 .. 31;
	end record;

    type Xm_Region_Box is access Xm_Region_Box_Rec;

    type Xm_Region_Rec is
	record
	    Sizes : X_Lib.X_Long_Integer;
	    Num_Rects : X_Lib.X_Long_Integer;
	    Rects : Xm_Region_Box;
	    Extents : Xm_Region_Box_Rec;
	end record;

    for Xm_Region_Rec use
	record
	    Sizes at 0 * Word_Size range 0 .. 31;
	    Num_Rects at 1 * Word_Size range 0 .. 31;
	    Rects at 2 * Word_Size range 0 .. 31;
	    Extents at 3 * Word_Size range 0 .. 63;
	end record;

    Xm_Region_Rec_Size : constant := 5 * 32;

    type Xm_Region is access Xm_Region_Rec;

    type Xm_Font_List_Type is
       (Xmlabel_Fontlist, Xmbutton_Fontlist, Xmtext_Fontlist);
    for Xm_Font_List_Type'Size use Xm.Xm_Enum_Length;
    for Xm_Font_List_Type use
       (Xmlabel_Fontlist => 1, Xmbutton_Fontlist => 2, Xmtext_Fontlist => 3);

    Xmlook_At_Screen : constant := 2 ** 0;
    Xmlook_At_Cmap : constant := 2 ** 1;
    Xmlook_At_Background : constant := 2 ** 2;
    Xmlook_At_Foreground : constant := 2 ** 3;
    Xmlook_At_Top_Shadow : constant := 2 ** 4;
    Xmlook_At_Bottom_Shadow : constant := 2 ** 5;
    Xmlook_At_Select : constant := 2 ** 6;

    Xmbackground : constant X_Lib.X_Character := X_Lib.X_Character (2 ** 0);
    Xmforeground : constant X_Lib.X_Character := X_Lib.X_Character (2 ** 1);
    Xmtop_Shadow : constant X_Lib.X_Character := X_Lib.X_Character (2 ** 2);
    Xmbottom_Shadow : constant X_Lib.X_Character := X_Lib.X_Character (2 ** 3);
    Xmselect : constant X_Lib.X_Character := X_Lib.X_Character (2 ** 4);

    type Xm_Color_Data is
	record
	    Screen : X_Lib.Screen;
	    Color_Map : X_Lib.Colors.Color_Map;
	    Allocated : X_Lib.X_Character;
	    Background : X_Lib_Interface.X_Color_Record;
	    Foreground : X_Lib_Interface.X_Color_Record;
	    Top_Shadow : X_Lib_Interface.X_Color_Record;
	    Bottom_Shadow : X_Lib_Interface.X_Color_Record;
	    Slect : X_Lib_Interface.X_Color_Record;
	end record;
    for Xm_Color_Data use
	record
	    Screen at 0 * Word_Size range 0 .. 31;
	    Color_Map at 1 * Word_Size range 0 .. 31;
	    Allocated at 2 * Word_Size range 0 .. 07;
	    Background at 3 * Word_Size range 0 .. 95;
	    Foreground at 6 * Word_Size range 0 .. 95;
	    Top_Shadow at 9 * Word_Size range 0 .. 95;
	    Bottom_Shadow at 12 * Word_Size range 0 .. 95;
	    Slect at 15 * Word_Size range 0 .. 95;
	end record;

    Xm_Color_Data_Size : constant := 18 * 32;

    type Xm_Color_Data_Ptr is access Xm_Color_Data;

    function To_Navigation_Type is
       new Unchecked_Conversion
	      (X_Configuration_Dependent.Byte, Xm.Xm_Navigation_Type);

    --(ms) Xm_Navigation_Type does not have an enumeration corresponding
    --     to 254, so the following declaration is illegal.
    --Xmnone_Or_Bc : constant Xm.Xm_Navigation_Type := To_Navigation_Type (254);
    Xmtab_Any : constant Xm.Xm_Navigation_Type := To_Navigation_Type (255);

    type Xm_Focus_Moved_Callback_Rec is
	record
	    Reason : Xm.Callback_Reason;
	    Event : X_Lib.Events.Event;
	    Cont : Xm.Xm_Boolean;
	    Old_Focus : Xm.Xt_Widget;
	    New_Focus : Xm.Xt_Widget;
	    Focus_Policy : X_Lib.X_Character;
	    Dummy : X_Lib.X_Character;
	end record;
    for Xm_Focus_Moved_Callback_Rec use
	record
	    Reason at 0 * Word_Size range 0 .. 31;
	    Event at 1 * Word_Size range 0 .. 31;
	    Cont at 2 * Word_Size range 0 .. 7;
	    Old_Focus at 3 * Word_Size range 0 .. 31;
	    New_Focus at 4 * Word_Size range 0 .. 31;
	    Focus_Policy at 5 * Word_Size range 0 .. 7;
	    Dummy at 5 * Word_Size range 24 .. 31;
	end record;
    type Xm_Focus_Moved_Callback is access Xm_Focus_Moved_Callback_Rec;

    type Xm_Focus_Data is access X_Lib.X_Address;

    Xmvpaned_Bit : constant Xm_Bit_Type := Xmpaned_Window_Bit;

    Look_At_Screen : constant := 2 ** 0;
    Look_At_Cmap : constant := 2 ** 1;
    Look_At_Background : constant := 2 ** 2;
    Look_At_Foreground : constant := 2 ** 3;
    Look_At_Top_Shadow : constant := 2 ** 4;
    Look_At_Bottom_Shadow : constant := 2 ** 5;
    Look_At_Select : constant := 2 ** 6;

    Default_Indicator_Dim : constant := 9;

    function Rx (R : in Xt_Rect_Object_Private.Rect_Obj_Rec) return Xt.Position;
    function Ry (R : in Xt_Rect_Object_Private.Rect_Obj_Rec) return Xt.Position;
    function Rwidth (R : in Xt_Rect_Object_Private.Rect_Obj_Rec)
		    return Xt.Dimension;
    function Rheight (R : in Xt_Rect_Object_Private.Rect_Obj_Rec)
		     return Xt.Dimension;
    function Rborder (R : in Xt_Rect_Object_Private.Rect_Obj_Rec)
		     return Xt.Dimension;

    function Gmode (G : in Xt.Xt_Ancillary_Types.Xt_Widget_Geometry)
		   return Xt.Xt_Geometry_Mask;
    function Is_X (G : in Xt.Xt_Ancillary_Types.Xt_Widget_Geometry)
		  return Xt.Xt_Geometry_Mask;
    function Is_Y (G : in Xt.Xt_Ancillary_Types.Xt_Widget_Geometry)
		  return Xt.Xt_Geometry_Mask;
    function Is_Width (G : in Xt.Xt_Ancillary_Types.Xt_Widget_Geometry)
		      return Xt.Xt_Geometry_Mask;
    function Is_Height (G : in Xt.Xt_Ancillary_Types.Xt_Widget_Geometry)
		       return Xt.Xt_Geometry_Mask;
    function Is_Border (G : in Xt.Xt_Ancillary_Types.Xt_Widget_Geometry)
		       return Xt.Xt_Geometry_Mask;
    function Is_Width_Height (G : in Xt.Xt_Ancillary_Types.Xt_Widget_Geometry)
			     return Xt.Xt_Geometry_Mask;

    Maxdimension : constant := 2 ** 31 - 1;

    Dialog_Suffix : constant String := "_popup";
    Dialog_Suffix_Size : constant := 6;

    Xm_3D_Enhance_Pixel : constant := 2;
    Xm_Default_Top_Margin : constant := 0;
    Xm_Default_Bottom_Margin : constant := 0;


    -- ManagerP.h,  Revision: 1.1  Motif Release 1.2

    subtype Xm_Traversal_Children_Proc is X_Lib.X_Address;

--  Structure used for storing accelerator and mnemonic information.
    type Xm_Keyboard_Data is
	record
	    Event_Type : X_Configuration_Dependent.Unsigned_Int;
	    Keysym : X_Lib.Keyboard.Key_Sym;
	    Key : X_Lib.Keyboard.Key_Code; -- 8 bits
	    Modifiers : X_Configuration_Dependent.Unsigned_Int;
	    Component : Xt.Widget;
	    Need_Grab : Xm.Xm_Boolean;
	    Is_Mnemonic : Xm.Xm_Boolean;
	    Dummy : X_Configuration_Dependent.Card16;
	end record;

    type Xm_Keyboard_Data_List is array (Natural range <>) of Xm_Keyboard_Data;
    type Xm_Keyboard_Data_List_Ptr is access Xm_Keyboard_Data_List;
    for Xm_Keyboard_Data use
	record
	    Event_Type at 0 * Word_Size range 0 .. 31;
	    Keysym at 1 * Word_Size range 0 .. 31;
	    Key at 2 * Word_Size range 0 .. 07;
	    Modifiers at 3 * Word_Size range 0 .. 31;
	    Component at 4 * Word_Size range 0 .. 31;
	    Need_Grab at 5 * Word_Size range 0 .. 7;
	    Is_Mnemonic at 5 * Word_Size + 1 range 0 .. 7;
	    Dummy at 5 * Word_Size + 2 range 0 .. 15;
	end record;

    Xm_Keyboard_Data_Size : constant := 6 * 32;
    type Xm_Manager_Class_Ext_Rec is
	record
	    Next_Extension : Xt.Xt_Pointer;
	    Record_Type : X_Lib.Resource_Manager.Xrm_Quark;
	    Version : X_Lib.X_Long_Integer;
	    Record_Size : Xt.Cardinal;
	    Traversal_Children : Xm_Traversal_Children_Proc;
	end record;

    type Xm_Manager_Class_Ext is access Xm_Manager_Class_Ext_Rec;

    Xm_Manager_Class_Ext_Version : constant := 1;

    type Xm_Manager_Class_Part is
	record
	    Translations : X_Lib.String_Pointer;
	    Syn_Resources : Xm_Synthetic_Resource_List;
	    Num_Syn_Resources : X_Lib.X_Integer;
	    Syn_Constraint_Resources : Xm_Synthetic_Resource_List;
	    Num_Syn_Constraint_Resources : X_Lib.X_Integer;
	    Parent_Process : Xm_Parent_Process_Proc;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Manager_Class_Part use
	record
	    Translations at 0 * Word_Size range 0 .. 31;
	    Syn_Resources at 1 * Word_Size range 0 .. 31;
	    Num_Syn_Resources at 2 * Word_Size range 0 .. 31;
	    Syn_Constraint_Resources at 3 * Word_Size range 0 .. 31;
	    Num_Syn_Constraint_Resources at 4 * Word_Size range 0 .. 31;
	    Parent_Process at 5 * Word_Size range 0 .. 31;
	    Extension at 6 * Word_Size range 0 .. 31;
	end record;

    Xm_Manager_Class_Part_Size : constant := 7 * 32;
    Xm_Manager_Class_Rec_Size : constant :=
       Xt_Constraint_Private.Constraint_Class_Rec_Size +
	  Xm_Manager_Class_Part_Size;

    type Xm_Manager_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Constraint_Class : Xt_Constraint_Private.Constraint_Class_Part;
	    Manager_Class : Xm_Manager_Class_Part;
	end record;

    for Xm_Manager_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xt_Composite_Private.Composite_Class_Rec_Size - 1;
	    Constraint_Class at 0
	       range Xt_Composite_Private.Composite_Class_Rec_Size ..
			Xt_Constraint_Private.Constraint_Class_Rec_Size - 1;
	    Manager_Class at 0
	       range Xt_Constraint_Private.Constraint_Class_Rec_Size ..
			Xm_Manager_Class_Rec_Size - 1;
	end record;

    type Xm_Manager_Class_Rec_Ptr is access Xm_Manager_Class_Rec;

--  The Manager instance record
    type Xm_Manager_Part is
	record
	    Foreground : X_Lib.Pixel;
	    Shadow_Thickness : Xt.Dimension;
	    Top_Shadow_Color : X_Lib.Pixel;
	    Top_Shadow_Pixmap : X_Lib.Pixmap;
	    Bottom_Shadow_Color : X_Lib.Pixel;
	    Bottom_Shadow_Pixmap : X_Lib.Pixmap;
	    Highlight_Color : X_Lib.Pixel;
	    Highlight_Pixmap : X_Lib.Pixmap;
	    Help_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    User_Data : Xt.Xt_Pointer;
	    Traversal_On : Xm.Xm_Boolean;
	    Unit_Type : X_Configuration_Dependent.Unsigned_Char;
	    Navigation_Type : Xm.Xm_Navigation_Type;
	    Event_Handler_Added : Xm.Xm_Boolean;
	    Active_Child : Xt.Widget;
	    Highlighted_Widget : Xt.Widget;
	    Accelerator_Widget : Xt.Widget;
	    Has_Focus : Xm.Xm_Boolean;
	    String_Direction : Xm.Xm_String_Direction;
	    Keyboard_List : Xm_Keyboard_Data_List_Ptr;
	    Num_Keyboard_Entries : X_Configuration_Dependent.Short;
	    Size_Keyboard_List : X_Configuration_Dependent.Short;
	    Selected_Gadget : Xm.Gadget;
	    Eligible_For_Multi_Button_Event : Xm.Gadget;
	    Background_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Highlight_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Top_Shadow_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Bottom_Shadow_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Initial_Focus : Xm.Xt_Widget;
	end record;
    for Xm_Manager_Part use
	record
	    Foreground at 0 * Word_Size range 0 .. 31;
	    Shadow_Thickness at 1 * Word_Size range 0 .. 15;
	    Top_Shadow_Color at 2 * Word_Size range 0 .. 31;
	    Top_Shadow_Pixmap at 3 * Word_Size range 0 .. 31;
	    Bottom_Shadow_Color at 4 * Word_Size range 0 .. 31;
	    Bottom_Shadow_Pixmap at 5 * Word_Size range 0 .. 31;
	    Highlight_Color at 6 * Word_Size range 0 .. 31;
	    Highlight_Pixmap at 7 * Word_Size range 0 .. 31;
	    Help_Callback at 8 * Word_Size range 0 .. 31;
	    User_Data at 9 * Word_Size range 0 .. 31;
	    Traversal_On at 10 * Word_Size range 0 .. 7;
	    Unit_Type at 10 * Word_Size + 1 range 0 .. 7;
	    Navigation_Type at 10 * Word_Size + 2 range 0 .. 7;
	    Event_Handler_Added at 10 * Word_Size + 3 range 0 .. 7;
	    Active_Child at 11 * Word_Size range 0 .. 31;
	    Highlighted_Widget at 12 * Word_Size range 0 .. 31;
	    Accelerator_Widget at 13 * Word_Size range 0 .. 31;
	    Has_Focus at 14 * Word_Size range 0 .. 7;
	    String_Direction at 14 * Word_Size + 1 range 0 .. 7;
	    Keyboard_List at 15 * Word_Size range 0 .. 31;
	    Num_Keyboard_Entries at 16 * Word_Size range 0 .. 15;
	    Size_Keyboard_List at 16 * Word_Size + 2 range 0 .. 15;
	    Selected_Gadget at 17 * Word_Size range 0 .. 31;
	    Eligible_For_Multi_Button_Event at 18 * Word_Size range 0 .. 31;
	    Background_Gc at 19 * Word_Size range 0 .. 31;
	    Highlight_Gc at 20 * Word_Size range 0 .. 31;
	    Top_Shadow_Gc at 21 * Word_Size range 0 .. 31;
	    Bottom_Shadow_Gc at 22 * Word_Size range 0 .. 31;
	    Initial_Focus at 23 * Word_Size range 0 .. 31;
	end record;

    Xm_Manager_Part_Size : constant := 24 * 32;
    Xm_Manager_Rec_Size : constant :=
       Xt_Constraint_Private.Constraint_Rec_Size + Xm_Manager_Part_Size;

    type Xm_Manager_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Xt_Constraint_Private.Constraint_Part;
	    Manager : Xm_Manager_Part;
	end record;

    for Xm_Manager_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Constraint at 0
	       range Xt_Composite_Private.Composite_Rec_Size ..
			Xt_Constraint_Private.Constraint_Rec_Size - 1;
	    Manager at 0 range Xt_Constraint_Private.Constraint_Rec_Size ..
				  Xm_Manager_Rec_Size - 1;
	end record;

    type Xm_Manager_Rec_Ptr is access Xm_Manager_Rec;

--  The constraint definition
    type Xm_Manager_Constraint_Part is
	record
	    Unused : X_Lib.X_Address;
	end record;

    Xm_Manager_Constraint_Part_Size : constant := 32;
    Xm_Manager_Constraint_Rec_Size : constant :=
       Xm_Manager_Constraint_Part_Size;

    type Xm_Manager_Constraint_Rec is
	record
	    Manager : Xm_Manager_Constraint_Part;
	end record;
    type Xm_Manager_Constraint_Ptr is access Xm_Manager_Constraint_Rec;

    for Xm_Manager_Constraint_Rec use
	record
	    Manager at 0 range 0 .. Xm_Manager_Constraint_Rec_Size - 1;
	end record;

    Xm_Primitive_Class_Ext_Version : constant := 1;

    type Xm_Primitive_Class_Ext_Rec is
	record
	    Next_Extension : Xt.Xt_Pointer;
	    Record_Type : X_Lib.Resource_Manager.Xrm_Quark;
	    Version : X_Lib.X_Long_Integer;
	    Record_Size : Xt.Cardinal;
	    Widget_Baseline : Xm_Private.Xm_Widget_Baseline_Proc;
	    Widget_Display_Rect : Xm_Private.Xm_Widget_Display_Rect_Proc;
	    Widget_Margins : Xm_Private.Xm_Widget_Margins_Proc;
	end record;

    for Xm_Primitive_Class_Ext_Rec use
	record
	    Next_Extension at 0 * Word_Size range 0 .. 31;
	    Record_Type at 1 * Word_Size range 0 .. 31;
	    Version at 2 * Word_Size range 0 .. 31;
	    Record_Size at 3 * Word_Size range 0 .. 31;
	    Widget_Baseline at 4 * Word_Size range 0 .. 31;
	    Widget_Display_Rect at 5 * Word_Size range 0 .. 31;
	    Widget_Margins at 6 * Word_Size range 0 .. 31;
	end record;

    type Xm_Primitive_Class_Ext is access Xm_Primitive_Class_Ext_Rec;

--
-- Xm_Primitive_Class
--
    type Xm_Primitive_Class_Part is
	record
	    Border_Hightlight : Xt.Xt_Widget_Proc;
	    Border_Unhighlight : Xt.Xt_Widget_Proc;
	    Translations : X_Lib.String_Pointer;
	    Arm_And_Activate : Xt.Xt_Action_Proc;
	    Syn_Resources : Xm_Synthetic_Resource_List;
	    Num_Syn_Resources : X_Lib.X_Integer;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Primitive_Class_Part use
	record
	    Border_Hightlight at 0 * Word_Size range 0 .. 31;
	    Border_Unhighlight at 1 * Word_Size range 0 .. 31;
	    Translations at 2 * Word_Size range 0 .. 31;
	    Arm_And_Activate at 3 * Word_Size range 0 .. 31;
	    Syn_Resources at 4 * Word_Size range 0 .. 31;
	    Num_Syn_Resources at 5 * Word_Size range 0 .. 31;
	    Extension at 6 * Word_Size range 0 .. 31;
	end record;

    Xm_Primitive_Class_Part_Size : constant := 7 * 32;
    Xm_Primitive_Class_Rec_Size : constant :=
       Xt_Core_Private.Core_Class_Part_Size + Xm_Primitive_Class_Part_Size;

    type Xm_Primitive_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Primitive_Class : Xm_Primitive_Class_Part;
	end record;

    for Xm_Primitive_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Primitive_Class at 0 range Xt_Core_Private.Core_Class_Rec_Size ..
					  Xm_Primitive_Class_Rec_Size - 1;
	end record;

    type Xm_Primitive_Class_Rec_Ptr is access Xm_Primitive_Class_Rec;

    type Xm_Primitive_Part is
	record
	    Foreground : X_Lib.Pixel;
	    Shadow_Thickness : Xt.Dimension;
	    Top_Shadow_Color : X_Lib.Pixel;
	    Top_Shadow_Pixmap : X_Lib.Pixmap;
	    Bottom_Shadow_Color : X_Lib.Pixel;
	    Bottom_Shadow_Pixmap : X_Lib.Pixmap;
	    Highlight_Thickness : Xt.Dimension;
	    Highlight_Color : X_Lib.Pixel;
	    Highlight_Pixmap : X_Lib.Pixmap;
	    Help_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    User_Data : Xt.Xt_Pointer;
	    Traversal_On : Xm.Xm_Boolean;
	    Highlight_On_Enter : Xm.Xm_Boolean;
	    Have_Traversal : Xm.Xm_Boolean;
	    Unit_Type : X_Configuration_Dependent.Unsigned_Char;
	    Navigation_Type : Xm.Xm_Navigation_Type;
	    Highlight_Drawn : Xm.Xm_Boolean;
	    Highlighted : Xm.Xm_Boolean;
	    Highlight_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Top_Shadow_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Bottom_Shadow_Gc : X_Lib.Graphic_Output.Graphic_Context;
	end record;

    for Xm_Primitive_Part use
	record
	    Foreground at 0 * Word_Size range 0 .. 31;
	    Shadow_Thickness at 1 * Word_Size range 0 .. 15;
	    Top_Shadow_Color at 2 * Word_Size range 0 .. 31;
	    Top_Shadow_Pixmap at 3 * Word_Size range 0 .. 31;
	    Bottom_Shadow_Color at 4 * Word_Size range 0 .. 31;
	    Bottom_Shadow_Pixmap at 5 * Word_Size range 0 .. 31;
	    Highlight_Thickness at 6 * Word_Size range 0 .. 15;
	    Highlight_Color at 7 * Word_Size range 0 .. 31;
	    Highlight_Pixmap at 8 * Word_Size range 0 .. 31;
	    Help_Callback at 9 * Word_Size range 0 .. 31;
	    User_Data at 10 * Word_Size range 0 .. 31;
	    Traversal_On at 11 * Word_Size range 0 .. 7;
	    Highlight_On_Enter at 11 * Word_Size + 1 range 0 .. 7;
	    Have_Traversal at 11 * Word_Size + 2 range 0 .. 7;
	    Unit_Type at 11 * Word_Size + 3 range 0 .. 7;
	    Navigation_Type at 12 * Word_Size range 0 .. 7;
	    Highlight_Drawn at 12 * Word_Size + 1 range 0 .. 7;
	    Highlighted at 12 * Word_Size + 2 range 0 .. 7;
	    Highlight_Gc at 13 * Word_Size range 0 .. 31;
	    Top_Shadow_Gc at 14 * Word_Size range 0 .. 31;
	    Bottom_Shadow_Gc at 15 * Word_Size range 0 .. 31;
	end record;

    Xm_Primitive_Part_Size : constant := 16 * 32;
    Xm_Primitive_Rec_Size : constant :=
       Xt_Core_Private.Core_Part_Boundary + Xm_Primitive_Part_Size;

    type Xm_Primitive_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Primitive : Xm_Primitive_Part;
	end record;

    for Xm_Primitive_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Primitive at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Xm_Primitive_Rec_Size - 1;
	end record;

    type Xm_Primitive_Rec_Ptr is access Xm_Primitive_Rec;

    Xmno_Event : constant := 16#000#;
    Xmenter_Event : constant := 16#001#;
    Xmleave_Event : constant := 16#002#;
    Xmfocus_In_Event : constant := 16#004#;
    Xmfocus_Out_Event : constant := 16#008#;
    Xmmotion_Event : constant := 16#010#;
    Xmarm_Event : constant := 16#020#;
    Xmactivate_Event : constant := 16#040#;
    Xmhelp_Event : constant := 16#080#;
    Xmkey_Event : constant := 16#100#;
    Xmmulti_Arm_Event : constant := 16#200#;
    Xmmulti_Activate_Event : constant := 16#400#;
    Xmbdrag_Event : constant := 16#800#;
    Xmall_Event : constant := 16#FFF#;


    -- GadgetP.h,  Revision: 1.1  Motif Release 1.2

    Xm_Gadget_Class_Ext_Version : constant := 1;

--
--  Gadget class and instance definitions.  Gadget #defines
--  and internally used exported functions.
--

    type Xm_Gadget_Cache;
    type Xm_Gadget_Cache_Ptr is access Xm_Gadget_Cache;
    type Xm_Gadget_Cache is
	record
	    Next : Xm_Gadget_Cache_Ptr;
	    Prev : Xm_Gadget_Cache_Ptr;
	    Ref_Count : X_Lib.X_Integer;
	end record;

    for Xm_Gadget_Cache use
	record
	    Next at 0 * Word_Size range 0 .. 31;
	    Prev at 1 * Word_Size range 0 .. 31;
	    Ref_Count at 2 * Word_Size range 0 .. 31;
	end record;

    Xm_Gadget_Cache_Size : constant := 3 * 32;

-- A cache entry for each class which desires gadget caching

    type Xm_Cache_Class_Part is
	record
	    Cache_Head : Xm_Gadget_Cache;
	    Cache_Copy : Xm_Cache_Copy_Proc;
	    Cache_Delete : Xm_Gadget_Cache_Proc;
	    Cache_Compare : Xm_Cache_Compare_Proc;
	end record;

    for Xm_Cache_Class_Part use
	record
	    Cache_Head at 0 * Word_Size range 0 .. Xm_Gadget_Cache_Size - 1;
	    Cache_Copy at 3 * Word_Size range 0 .. 31;
	    Cache_Delete at 4 * Word_Size range 0 .. 31;
	    Cache_Compare at 5 * Word_Size range 0 .. 31;
	end record;

    Xm_Cache_Class_Part_Size : constant := 6 * 32;

    type Xm_Cache_Class_Part_Ptr is access Xm_Cache_Class_Part;

    type Xm_Gadget_Cache_Ref is
	record
	    Next : Xm_Gadget_Cache_Ptr;
	    Prev : Xm_Gadget_Cache_Ptr;
	    Ref_Count : X_Lib.X_Integer;
	    Data : X_Lib.X_Integer;
	end record;

    for Xm_Gadget_Cache_Ref use
	record
	    Next at 0 * Word_Size range 0 .. 31;
	    Prev at 1 * Word_Size range 0 .. 31;
	    Ref_Count at 2 * Word_Size range 0 .. 31;
	    Data at 3 * Word_Size range 0 .. 31;
	end record;

    Xm_Gadget_Cache_Ref_Size : constant := 4 * 32;

    type Xm_Gadget_Cache_Ref_Ptr is access Xm_Gadget_Cache_Ref;

    type Xm_Gadget_Class_Ext_Rec is
	record
	    Next_Extension : Xt.Xt_Pointer;
	    Record_Type : X_Lib.Resource_Manager.Xrm_Quark;
	    Version : X_Lib.X_Long_Integer;
	    Record_Size : Xt.Cardinal;
	    Widget_Baseline : Xm_Private.Xm_Widget_Baseline_Proc;
	    Widget_Display_Rect : Xm_Private.Xm_Widget_Display_Rect_Proc;
	end record;

    for Xm_Gadget_Class_Ext_Rec use
	record
	    Next_Extension at 0 * Word_Size range 0 .. 31;
	    Record_Type at 1 * Word_Size range 0 .. 31;
	    Version at 2 * Word_Size range 0 .. 31;
	    Record_Size at 3 * Word_Size range 0 .. 31;
	    Widget_Baseline at 4 * Word_Size range 0 .. 31;
	    Widget_Display_Rect at 5 * Word_Size range 0 .. 31;
	end record;

    type Xm_Gadget_Class_Ext is access Xm_Gadget_Class_Ext_Rec;

    -- Gadget class structure
    type Xm_Gadget_Class_Part is
	record
	    Border_Hightlight : Xt.Xt_Widget_Proc;
	    Border_Unhighlight : Xt.Xt_Widget_Proc;
	    Arm_And_Activate : Xt.Xt_Action_Proc;
	    Input_Dispatch : Xm_Widget_Dispatch_Proc;
	    Visual_Change : Xm_Visual_Change_Proc;
	    Syn_Resources : Xm_Synthetic_Resource_List;
	    Num_Syn_Resources : X_Lib.X_Integer;
	    Cache_Part : Xm_Cache_Class_Part_Ptr;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Gadget_Class_Part use
	record
	    Border_Hightlight at 0 * Word_Size range 0 .. 31;
	    Border_Unhighlight at 1 * Word_Size range 0 .. 31;
	    Arm_And_Activate at 2 * Word_Size range 0 .. 31;
	    Input_Dispatch at 3 * Word_Size range 0 .. 31;
	    Visual_Change at 4 * Word_Size range 0 .. 31;
	    Syn_Resources at 5 * Word_Size range 0 .. 31;
	    Num_Syn_Resources at 6 * Word_Size range 0 .. 31;
	    Cache_Part at 7 * Word_Size range 0 .. 31;
	    Extension at 8 * Word_Size range 0 .. 31;
	end record;

    Xm_Gadget_Class_Part_Size : constant := 9 * 32;
    Xm_Gadget_Class_Rec_Size : constant :=
       Xt_Rect_Object_Private.Rect_Obj_Class_Rec_Size +
	  Xm_Gadget_Class_Part_Size;

    type Xm_Gadget_Class_Rec is
	record
	    Rect_Class : Xt_Rect_Object_Private.Rect_Obj_Class_Part;
	    Gadget_Class : Xm_Gadget_Class_Part;
	end record;

    for Xm_Gadget_Class_Rec use
	record
	    Rect_Class at 0
	       range 0 .. Xt_Rect_Object_Private.Rect_Obj_Class_Rec_Size - 1;
	    Gadget_Class at 0
	       range Xt_Rect_Object_Private.Rect_Obj_Class_Rec_Size ..
			Xm_Gadget_Class_Rec_Size - 1;
	end record;

    type Xm_Gadget_Class_Rec_Ptr is access Xm_Gadget_Class_Rec;

--  The Gadget instance record

    type Xm_Gadget_Part is
	record
	    Shadow_Thickness : Xt.Dimension;
	    Highlight_Thickness : Xt.Dimension;
	    Help_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    User_Data : Xt.Xt_Pointer;
	    Traversal_On : Xm.Xm_Boolean;
	    Highlight_On_Enter : Xm.Xm_Boolean;
	    Have_Traversal : Xm.Xm_Boolean;
	    Unit_Type : X_Configuration_Dependent.Unsigned_Char;
	    Navigation_Type : Xm.Xm_Navigation_Type;
	    Highlight_Drawn : Xm.Xm_Boolean;
	    Highlighted : Xm.Xm_Boolean;
	    Visible : Xm.Xm_Boolean;
	    Event_Mask : X_Lib.X_Mask_Type;
	end record;

    for Xm_Gadget_Part use
	record
	    Shadow_Thickness at 0 * Word_Size range 0 .. 15;
	    Highlight_Thickness at 0 * Word_Size range 16 .. 31;
	    Help_Callback at 1 * Word_Size range 0 .. 31;
	    User_Data at 2 * Word_Size range 0 .. 31;
	    Traversal_On at 3 * Word_Size range 0 .. 7;
	    Highlight_On_Enter at 3 * Word_Size + 1 range 0 .. 7;
	    Have_Traversal at 3 * Word_Size + 2 range 0 .. 7;
	    Unit_Type at 3 * Word_Size + 3 range 0 .. 7;
	    Navigation_Type at 4 * Word_Size range 0 .. 7;
	    Highlight_Drawn at 4 * Word_Size + 1 range 0 .. 7;
	    Highlighted at 4 * Word_Size + 2 range 0 .. 7;
	    Visible at 4 * Word_Size + 3 range 0 .. 7;
	    Event_Mask at 5 * Word_Size range 0 .. 31;
	end record;

    Xm_Gadget_Part_Size : constant := 6 * 32;
    Xm_Gadget_Rec_Size : constant :=
       Xt_Rect_Object_Private.Rect_Obj_Rec_Size + Xm_Gadget_Part_Size;

    type Xm_Gadget_Rec is
	record
	    Object : Xt_Object_Private.Object_Part;
	    The_Rectangle : Xt_Rect_Object_Private.Rect_Obj_Part;
	    The_Gadget : Xm_Gadget_Part;
	end record;

    for Xm_Gadget_Rec use
	record
	    Object at 0 range 0 .. Xt_Object_Private.Object_Part_Size - 1;
	    The_Rectangle at 0
	       range Xt_Object_Private.Object_Part_Size ..
			Xt_Rect_Object_Private.Rect_Obj_Rec_Size - 1;
	    The_Gadget at 0 range Xt_Rect_Object_Private.Rect_Obj_Rec_Size ..
				     Xm_Gadget_Rec_Size - 1;
	end record;

    type Xm_Gadget_Rec_Ptr is access Xm_Gadget_Rec;


    -- BaseClassP.h,  Revision: 1.5,  Motif Release 1.2

    Xm_Base_Class_Ext_Version : constant := 2;

    subtype Xm_Get_Sec_Res_Data_Func is X_Lib.X_Address;

    type Xm_Object_Class_Ext_Rec is
	record
	    Next_Extension : Xt.Xt_Pointer;  
	    Record_Type : X_Lib.Resource_Manager.Xrm_Quark;  
	    Version : X_Lib.X_Long_Integer;
	    Record_Size : Xt.Cardinal;  
	end record;

    for Xm_Object_Class_Ext_Rec use
	record
	    Next_Extension at 0 * Word_Size range 0 .. 31;
	    Record_Type at 1 * Word_Size range 0 .. 31;
	    Version at 2 * Word_Size range 0 .. 31;
	    Record_Size at 3 * Word_Size range 0 .. 31;
	end record;

    type Xm_Object_Class_Ext is access Xm_Object_Class_Ext_Rec;

    type Xm_Generic_Class_Ext_Rec is
	record
	    Next_Extension : Xt.Xt_Pointer;  
	    Record_Type : X_Lib.Resource_Manager.Xrm_Quark;  
	    Version : X_Lib.X_Long_Integer;
	    Record_Size : Xt.Cardinal;  
	end record;

    for Xm_Generic_Class_Ext_Rec use
	record
	    Next_Extension at 0 * Word_Size range 0 .. 31;
	    Record_Type at 1 * Word_Size range 0 .. 31;
	    Version at 2 * Word_Size range 0 .. 31;
	    Record_Size at 3 * Word_Size range 0 .. 31;
	end record;
    type Xm_Generic_Class_Ext is access Xm_Generic_Class_Ext_Rec;

    type Xm_Wrapper_Data_Rec;
    type Xm_Wrapper_Data is access Xm_Wrapper_Data_Rec;

    type Xm_Wrapper_Data_Rec is
	record
	    Next : Xm_Wrapper_Data;
	    Widget_Class : Xt.Widget_Class;
	    Initialize_Leaf : Xt.Xt_Init_Proc;
	    Set_Values_Leaf : Xt.Xt_Set_Values_Func;
	    Get_Values_Leaf : Xt.Xt_Args_Proc;
	    Realize : Xt.Xt_Realize_Proc;
	    Class_Part_Init_Leaf : Xt.Xt_Widget_Class_Proc;
	    Resize : Xt.Xt_Widget_Proc;
	    Geometry_Manager : Xt.Xt_Geometry_Handler;
	end record;

    for Xm_Wrapper_Data_Rec use
	record
	    Next at 0 * Word_Size range 0 .. 31;
	    Widget_Class at 1 * Word_Size range 0 .. 31;
	    Initialize_Leaf at 2 * Word_Size range 0 .. 31;
	    Set_Values_Leaf at 3 * Word_Size range 0 .. 31;
	    Get_Values_Leaf at 4 * Word_Size range 0 .. 31;
	    Realize at 5 * Word_Size range 0 .. 31;
	    Class_Part_Init_Leaf at 6 * Word_Size range 0 .. 31;
	    Resize at 7 * Word_Size range 0 .. 31;
	    Geometry_Manager at 8 * Word_Size range 0 .. 31;
	end record;

    type Xm_Base_Class_Ext_Rec is
	record
	    Next_Extension : Xt.Xt_Pointer;  
	    Record_Type : X_Lib.Resource_Manager.Xrm_Quark;  
	    Version : X_Lib.X_Long_Integer;  
	    Record_Size : Xt.Cardinal;  
	    Initialize_Prehook : Xt.Xt_Init_Proc;
	    Set_Values_Prehook : Xt.Xt_Set_Values_Func;
	    Initialize_Posthook : Xt.Xt_Init_Proc;
	    Set_Values_Posthook : Xt.Xt_Set_Values_Func;
	    Secondary_Object_Class : Xt.Widget_Class;
	    Secondary_Object_Create : Xt.Xt_Init_Proc;
	    Get_Sec_Res_Data : Xm_Get_Sec_Res_Data_Func;
	    Flags : X_Lib.Byte_Array (1 .. 32);
	    Get_Values_Prehook : Xt.Xt_Args_Proc;
	    Get_Values_Posthook : Xt.Xt_Args_Proc;
	    Class_Part_Init_Prehook : Xt.Xt_Widget_Class_Proc;
	    Class_Part_Init_Posthook : Xt.Xt_Widget_Class_Proc;
	    Ext_Resources : Xt.Xt_Ancillary_Types.Xt_Resource_List;
	    Compiled_Ext_Resources : Xt.Xt_Ancillary_Types.Xt_Resource_List;
	    Num_Ext_Resources : Xt.Cardinal;
	    Use_Sub_Resources : Xt.Xt_Ancillary_Types.Xt_Boolean;
	    Widget_Navigable : Xm_Widget_Navigable_Proc;
	    Focus_Change : Xm_Focus_Change_Proc;
	    Wrapper_Data : Xm_Wrapper_Data;
	end record;
    for Xm_Base_Class_Ext_Rec use
	record
	    Next_Extension at 0 * Word_Size range 0 .. 31;
	    Record_Type at 1 * Word_Size range 0 .. 31;
	    Version at 2 * Word_Size range 0 .. 31;
	    Record_Size at 3 * Word_Size range 0 .. 31;
	    Initialize_Prehook at 4 * Word_Size range 0 .. 31;
	    Set_Values_Prehook at 5 * Word_Size range 0 .. 31;
	    Initialize_Posthook at 6 * Word_Size range 0 .. 31;
	    Set_Values_Posthook at 7 * Word_Size range 0 .. 31;
	    Secondary_Object_Class at 8 * Word_Size range 0 .. 31;
	    Secondary_Object_Create at 9 * Word_Size range 0 .. 31;
	    Get_Sec_Res_Data at 10 * Word_Size range 0 .. 31;
	    Flags at 11 * Word_Size range 0 .. 8 * 32 - 1;
	    Get_Values_Prehook at 19 * Word_Size range 0 .. 31;
	    Get_Values_Posthook at 20 * Word_Size range 0 .. 31;
	    Class_Part_Init_Prehook at 21 * Word_Size range 0 .. 31;
	    Class_Part_Init_Posthook at 22 * Word_Size range 0 .. 31;
	    Ext_Resources at 23 * Word_Size range 0 .. 31;
	    Compiled_Ext_Resources at 24 * Word_Size range 0 .. 31;
	    Num_Ext_Resources at 25 * Word_Size range 0 .. 31;
	    Use_Sub_Resources at 26 * Word_Size range 0 .. 7;
	    Widget_Navigable at 27 * Word_Size range 0 .. 31;
	    Focus_Change at 28 * Word_Size range 0 .. 31;
	    Wrapper_Data at 29 * Word_Size range 0 .. 31;
	end record;

    Xm_Base_Class_Ext_Rec_Size : constant := 30 * 32 + 16;
    type Xm_Base_Class_Ext is access Xm_Base_Class_Ext_Rec;

    type Xm_Widget_Ext_Data_Rec is
	record
	    Widget : Xt.Widget;
	    Req_Widget : Xt.Widget;
	    Old_Widget : Xt.Widget;
	end record;

    for Xm_Widget_Ext_Data_Rec use
	record
	    Widget at 0 * Word_Size range 0 .. 31;
	    Req_Widget at 1 * Word_Size range 0 .. 31;
	    Old_Widget at 2 * Word_Size range 0 .. 31;
	end record;

    type Xm_Widget_Ext_Data is access Xm_Widget_Ext_Data_Rec;

    subtype Xm_Qmotif is X_Lib.Resource_Manager.Xrm_Quark;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Primitive_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Primitive_Class (X : in Xt.Widget_Class)
				   return Xm_Primitive_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Primitive_Rec_Ptr) return Xt.Widget;

    function To_Xm_Primitive (X : in Xt.Widget) return Xm_Primitive_Rec_Ptr;

    function To_Widget_Class
		(X : in Xm_Manager_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Manager_Class (X : in Xt.Widget_Class)
				 return Xm_Manager_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Manager_Rec_Ptr) return Xt.Widget;

    function To_Xm_Manager (X : in Xt.Widget) return Xm_Manager_Rec_Ptr;

    function To_Gadget (X : in Xm_Gadget_Rec_Ptr) return Xm.Gadget;

    function To_Xm_Gadget_Rec (X : in Xm.Gadget) return Xm_Gadget_Rec_Ptr;

    function To_Gadget_Class
		(X : in Xm_Gadget_Class_Rec_Ptr) return Xm.Gadget_Class;

    function To_Xm_Gadget_Class_Rec
		(X : in Xm.Gadget_Class) return Xm_Gadget_Class_Rec_Ptr;
end Xm_Private;

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
