-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with Xt, X_Lib, X_Configuration_Dependent, Xm, Xm_Private, Xt_Core_Private,
     Unchecked_Conversion, Xm_Scroll_Bar_Private, Xm_Scrolled_Window_Private;

package Xm_List_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_List_Drag_Convert_Struct is
	record
	    W : Xm.Xt_Widget;
	    Strings : Xm.Xm_String;
	    Num_Strings : X_Lib.X_Integer;
	end record;

    for Xm_List_Drag_Convert_Struct use
	record
	    W at 0 * Word_Size range 0 .. 31;
	    Strings at 1 * Word_Size range 0 .. 31;
	    Num_Strings at 2 * Word_Size range 0 .. 31;
	end record;

    type Xm_List_Class_Part is
	record
	    Foo : X_Configuration_Dependent.Int;
	end record;

    for Xm_List_Class_Part use
	record
	    Foo at 0 range 0 .. 31;
	end record;

    Xm_List_Class_Part_Size : constant := 32;
    Xm_List_Class_Rec_Size : constant :=
       Xm_Private.Xm_Primitive_Class_Rec_Size + Xm_List_Class_Part_Size;


    type Xm_List_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Primitive_Class : Xm_Private.Xm_Primitive_Class_Part;
	    List_Class : Xm_List_Class_Part;
	end record;

    for Xm_List_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Primitive_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xm_Private.Xm_Primitive_Class_Rec_Size - 1;
	    List_Class at 0 range Xm_Private.Xm_Primitive_Class_Rec_Size ..
				     Xm_List_Class_Rec_Size - 1;
	end record;

    type Element is
	record
	    Name : Xm.Xm_String;
	    Height : Xt.Dimension;
	    Width : Xt.Dimension;
	    Cumheight : Xt.Dimension;
	    Selected : Xm.Xm_Boolean;
	    Last_Selected : Xm.Xm_Boolean;
	    Lasttimedrawn : Xm.Xm_Boolean;
	    Numlines : X_Configuration_Dependent.Unsigned_Short;
	    Length : X_Configuration_Dependent.Int;
	end record;

    for Element use
	record
	    Name at 0 * Word_Size range 0 .. 31;
	    Height at 1 * Word_Size range 0 .. 15;
	    Width at 1 * Word_Size + 2 range 0 .. 15;
	    Cumheight at 2 * Word_Size range 0 .. 15;
	    Selected at 2 * Word_Size + 2 range 0 .. 7;
	    Last_Selected at 2 * Word_Size + 3 range 0 .. 7;
	    Lasttimedrawn at 3 * Word_Size range 0 .. 7;
	    Numlines at 3 * Word_Size + 2 range 0 .. 15;
	    Length at 4 * Word_Size range 0 .. 31;
	end record;

    Element_Size : constant := 5 * 32;
    type Element_Ptr is access Element;

    type Xm_List_Part is
	record
	    Spacing : Xt.Dimension;
	    Item_Spacing : X_Configuration_Dependent.Short;
	    Margin_Width : Xt.Dimension;
	    Margin_Height : Xt.Dimension;
	    Font : Xm.Xm_Font_List;
	    Items : Xm.Xm_String;
	    Item_Count : X_Configuration_Dependent.Int;
	    Selected_Items : Xm.Xm_String;
	    Selected_Indices : X_Configuration_Dependent.Int;
	    Selected_Item_Count : X_Configuration_Dependent.Int;
	    Visible_Item_Count : X_Configuration_Dependent.Int;
	    Last_Set_Viz_Count : X_Configuration_Dependent.Int;
	    Selection_Policy : X_Configuration_Dependent.Unsigned_Char;
	    Scroll_Bar_Display_Policy : X_Configuration_Dependent.Unsigned_Char;
	    Size_Policy : X_Configuration_Dependent.Unsigned_Char;
	    Str_Dir : Xm.Xm_String_Direction;
	    Auto_Select : Xm.Xm_Boolean;
	    Did_Selection : Xm.Xm_Boolean;
	    From_Set_Sb : Xm.Xm_Boolean;
	    From_Set_New_Size : Xm.Xm_Boolean;
	    Add_Mode : Xm.Xm_Boolean;
	    Leave_Dir : X_Configuration_Dependent.Unsigned_Char;
	    Highlight_Thickness : X_Configuration_Dependent.Unsigned_Char;
	    Click_Interval : X_Configuration_Dependent.Int;
	    Drag_Id : Xt.Xt_Interval_Id;
	    Single_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Multiple_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Extend_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Browse_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Default_Callback : Xt.Xt_Callbacks.Xt_Callback_List_Ptr;
	    Normal_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Inverse_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Highlight_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Dash_Tile : X_Lib.Pixmap;
	    Internal_List : Element_Ptr;
	    Last_Item : X_Configuration_Dependent.Int;
	    Font_Height : X_Configuration_Dependent.Int;
	    Top_Position : X_Configuration_Dependent.Int;
	    Event : X_Configuration_Dependent.Char;
	    Last_Hl_Item : X_Configuration_Dependent.Int;
	    Start_Item : X_Configuration_Dependent.Int;
	    Old_Start_Item : X_Configuration_Dependent.Int;
	    End_Item : X_Configuration_Dependent.Int;
	    Old_End_Item : X_Configuration_Dependent.Int;
	    Base_X : Xt.Position;
	    Base_Y : Xt.Position;
	    Mouse_Moved : Xm.Xm_Boolean;
	    Append_In_Progress : Xm.Xm_Boolean;
	    Traversing : Xm.Xm_Boolean;
	    Kbd_Selection : Xm.Xm_Boolean;
	    Down_Count : X_Configuration_Dependent.Short;
	    Down_Time : X_Lib.Time;
	    Current_Kbd_Item : X_Configuration_Dependent.Int;
	    Selection_Type : X_Configuration_Dependent.Unsigned_Char;
	    Insensitive_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    V_Min : X_Configuration_Dependent.Int;
	    V_Max : X_Configuration_Dependent.Int;
	    V_Origin : X_Configuration_Dependent.Int;
	    V_Extent : X_Configuration_Dependent.Int;
	    H_Min : X_Configuration_Dependent.Int;
	    H_Max : X_Configuration_Dependent.Int;
	    H_Origin : X_Configuration_Dependent.Int;
	    H_Extent : X_Configuration_Dependent.Int;
	    Max_Width : Xt.Dimension;
	    Char_Width : Xt.Dimension;
	    X_Origin : Xt.Position;
	    H_Scroll_Bar : Xm_Scroll_Bar_Private.Xm_Scroll_Bar_Rec_Ptr;
	    V_Scroll_Bar : Xm_Scroll_Bar_Private.Xm_Scroll_Bar_Rec_Ptr;
	    Mom : Xm_Scrolled_Window_Private.Xm_Scrolled_Window_Rec_Ptr;
	    Max_Item_Height : Xt.Dimension;
	    Dummy : Xt.Dimension;
	end record;

    for Xm_List_Part use
	record
	    Spacing at 0 * Word_Size range 0 .. 15;
	    Item_Spacing at 0 * Word_Size + 2 range 0 .. 15;
	    Margin_Width at 1 * Word_Size range 0 .. 15;
	    Margin_Height at 1 * Word_Size + 2 range 0 .. 15;
	    Font at 2 * Word_Size range 0 .. 31;
	    Items at 3 * Word_Size range 0 .. 31;
	    Item_Count at 4 * Word_Size range 0 .. 31;
	    Selected_Items at 5 * Word_Size range 0 .. 31;
	    Selected_Indices at 6 * Word_Size range 0 .. 31;
	    Selected_Item_Count at 7 * Word_Size range 0 .. 31;
	    Visible_Item_Count at 8 * Word_Size range 0 .. 31;
	    Last_Set_Viz_Count at 9 * Word_Size range 0 .. 31;
	    Selection_Policy at 10 * Word_Size range 0 .. 7;
	    Scroll_Bar_Display_Policy at 10 * Word_Size + 1 range 0 .. 7;
	    Size_Policy at 10 * Word_Size + 2 range 0 .. 7;
	    Str_Dir at 10 * Word_Size + 3 range 0 .. 7;
	    Auto_Select at 11 * Word_Size range 0 .. 7;
	    Did_Selection at 11 * Word_Size + 1 range 0 .. 7;
	    From_Set_Sb at 11 * Word_Size + 2 range 0 .. 7;
	    From_Set_New_Size at 11 * Word_Size + 3 range 0 .. 7;
	    Add_Mode at 12 * Word_Size range 0 .. 7;
	    Leave_Dir at 12 * Word_Size + 1 range 0 .. 7;
	    Highlight_Thickness at 12 * Word_Size + 2 range 0 .. 7;
	    Click_Interval at 13 * Word_Size range 0 .. 31;
	    Drag_Id at 14 * Word_Size range 0 .. 31;
	    Single_Callback at 15 * Word_Size range 0 .. 31;
	    Multiple_Callback at 16 * Word_Size range 0 .. 31;
	    Extend_Callback at 17 * Word_Size range 0 .. 31;
	    Browse_Callback at 18 * Word_Size range 0 .. 31;
	    Default_Callback at 19 * Word_Size range 0 .. 31;
	    Normal_Gc at 20 * Word_Size range 0 .. 31;
	    Inverse_Gc at 21 * Word_Size range 0 .. 31;
	    Highlight_Gc at 22 * Word_Size range 0 .. 31;
	    Dash_Tile at 23 * Word_Size range 0 .. 31;
	    Internal_List at 24 * Word_Size range 0 .. 31;
	    Last_Item at 25 * Word_Size range 0 .. 31;
	    Font_Height at 26 * Word_Size range 0 .. 31;
	    Top_Position at 27 * Word_Size range 0 .. 31;
	    Event at 28 * Word_Size range 0 .. 7;
	    Last_Hl_Item at 29 * Word_Size range 0 .. 31;
	    Start_Item at 30 * Word_Size range 0 .. 31;
	    Old_Start_Item at 31 * Word_Size range 0 .. 31;
	    End_Item at 32 * Word_Size range 0 .. 31;
	    Old_End_Item at 33 * Word_Size range 0 .. 31;
	    Base_X at 34 * Word_Size range 0 .. 15;
	    Base_Y at 34 * Word_Size + 2 range 0 .. 15;
	    Mouse_Moved at 35 * Word_Size range 0 .. 7;
	    Append_In_Progress at 35 * Word_Size + 1 range 0 .. 7;
	    Traversing at 35 * Word_Size + 2 range 0 .. 7;
	    Kbd_Selection at 35 * Word_Size + 3 range 0 .. 7;
	    Down_Count at 36 * Word_Size range 0 .. 15;
	    Down_Time at 37 * Word_Size range 0 .. 31;
	    Current_Kbd_Item at 38 * Word_Size range 0 .. 31;
	    Selection_Type at 39 * Word_Size range 0 .. 7;
	    Insensitive_Gc at 40 * Word_Size range 0 .. 31;
	    V_Min at 41 * Word_Size range 0 .. 31;
	    V_Max at 42 * Word_Size range 0 .. 31;
	    V_Origin at 43 * Word_Size range 0 .. 31;
	    V_Extent at 44 * Word_Size range 0 .. 31;
	    H_Min at 45 * Word_Size range 0 .. 31;
	    H_Max at 46 * Word_Size range 0 .. 31;
	    H_Origin at 47 * Word_Size range 0 .. 31;
	    H_Extent at 48 * Word_Size range 0 .. 31;
	    Max_Width at 49 * Word_Size range 0 .. 15;
	    Char_Width at 49 * Word_Size + 2 range 0 .. 15;
	    X_Origin at 50 * Word_Size range 0 .. 15;
	    H_Scroll_Bar at 51 * Word_Size range 0 .. 31;
	    V_Scroll_Bar at 52 * Word_Size range 0 .. 31;
	    Mom at 53 * Word_Size range 0 .. 31;
	    Max_Item_Height at 54 * Word_Size range 0 .. 15;
	    Dummy at 54 * Word_Size + 2 range 0 .. 15;
	end record;

    Xm_List_Part_Size : constant := 32 * 55;
    Xm_List_Rec_Size : constant :=
       Xm_Private.Xm_Primitive_Rec_Size + Xm_List_Part_Size;

    type Xm_List_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Primitive : Xm_Private.Xm_Primitive_Part;
	    List : Xm_List_Part;
	end record;

    for Xm_List_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Primitive at 0 range Xt_Core_Private.Core_Part_Size ..
				    Xm_Private.Xm_Primitive_Rec_Size - 1;
	    List at 0 range Xm_Private.Xm_Primitive_Rec_Size ..
			       Xm_List_Rec_Size - 1;
	end record;

    type Xm_List_Class_Rec_Ptr is access Xm_List_Class_Rec;
    type Xm_List_Rec_Ptr is access Xm_List_Rec;

    function To_Widget_Class
		(X : in Xm_List_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_List_Class (X : in Xt.Widget_Class)
			      return Xm_List_Class_Rec_Ptr;

    function To_Widget (X : in Xm_List_Rec_Ptr) return Xt.Widget;

    function To_Xm_List (X : in Xt.Widget) return Xm_List_Rec_Ptr;

end Xm_List_Private;

------ Copyright AND DISTRIBUTION NOTICE ----------
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
