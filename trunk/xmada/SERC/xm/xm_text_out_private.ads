-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm, Xm_Private, Unchecked_Conversion;

package Xm_Text_Out_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Line_Table_Extra_Rec is
	record
	    Width : Xt.Dimension;
	    Wrapped_By_Char : Xm.Xm_Boolean;
	    Dummy : Xm.Xm_Boolean;
	end record;

    for Line_Table_Extra_Rec use
	record
	    Width at 0 * Word_Size range 0 .. 15;
	    Wrapped_By_Char at 0 * Word_Size + 2 range 0 .. 7;
	    Dummy at 0 * Word_Size + 3 range 0 .. 7;
	end record;

    Line_Table_Extra_Rec_Size : constant := 32;
    type Line_Table_Extra_Rec_Ptr is access Line_Table_Extra_Rec;

    subtype Line_Num is X_Configuration_Dependent.Unsigned_Int;
    type On_Or_Off is (On, Off);
    for On_Or_Off'Size use 32;

    Online : constant := 30000;

    type Output_Data_Rec is
	record
	    Font_List : Xm.Xm_Font_List;
	    Blink_Rate : X_Configuration_Dependent.Unsigned_Int;
	    Word_Wrap : Xm.Xm_Boolean;
	    Cursor_Position_Visible : Xm.Xm_Boolean;
	    Auto_Show_Insert_Point : Xm.Xm_Boolean;
	    Has_Focus : Xm.Xm_Boolean;
	    Has_Rect : Xm.Xm_Boolean;
	    Handling_Exposures : Xm.Xm_Boolean;
	    Expose_V_Scroll : Xm.Xm_Boolean;
	    Expose_H_Scroll : Xm.Xm_Boolean;
	    Resize_Width : Xm.Xm_Boolean;
	    Resize_Height : Xm.Xm_Boolean;
	    Scroll_Vertical : Xm.Xm_Boolean;
	    Scroll_Horizontal : Xm.Xm_Boolean;
	    Scroll_Leftside : Xm.Xm_Boolean;
	    Scroll_Topside : Xm.Xm_Boolean;
	    Ignore_V_Bar : Xm.Xm_Boolean;
	    Ignore_H_Bar : Xm.Xm_Boolean;
	    Cursor_On : X_Configuration_Dependent.Short;
	    Refresh_Ibeam_Off : Xm.Xm_Boolean;
	    Suspend_H_Offset : Xm.Xm_Boolean;
	    Use_Font_Set : Xm.Xm_Boolean;
	    Have_Inverted_Image_Gc : Xm.Xm_Boolean;
	    Blink_State : On_Or_Off;
	    Insert_X : Xt.Position;
	    Insert_Y : Xt.Position;
	    Number_Lines : X_Configuration_Dependent.Int;
	    Left_Margin : X_Configuration_Dependent.Int;
	    Right_Margin : X_Configuration_Dependent.Int;
	    Top_Margin : X_Configuration_Dependent.Int;
	    Bottom_Margin : X_Configuration_Dependent.Int;
	    Scroll_Width : X_Configuration_Dependent.Int;
	    V_Slider_Size : X_Configuration_Dependent.Int;
	    H_Offset : X_Configuration_Dependent.Int;
	    Average_Char_Width : X_Configuration_Dependent.Int;
	    Tab_Width : X_Configuration_Dependent.Int;
	    Columns : X_Configuration_Dependent.Short;
	    Rows : X_Configuration_Dependent.Short;
	    Line_Height : Xt.Dimension;
	    Min_Width : Xt.Dimension;
	    Min_Height : Xt.Dimension;
	    Prev_W : Xt.Dimension;
	    Prev_H : Xt.Dimension;
	    Cursor_Width : Xt.Dimension;
	    Cursor_Height : Xt.Dimension;
	    Font_Ascent : Xt.Dimension;
	    Font_Descent : Xt.Dimension;
	    Timer_Id : Xt.Xt_Interval_Id;
	    Cursor : X_Lib.Pixmap;
	    Add_Mode_Cursor : X_Lib.Pixmap;
	    Ibeam_Off : X_Lib.Pixmap;
	    Stipple_Tile : X_Lib.Pixmap;
	    Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Image_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    V_Bar : Xm.Xt_Widget;
	    H_Bar : Xm.Xt_Widget;
	    Font : X_Lib.Fonts.Font_Record_Pointer;
	    Save_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Columns_Set : X_Configuration_Dependent.Short;
	    Rows_Set : X_Configuration_Dependent.Short;
	end record;

    for Output_Data_Rec use
	record
	    Font_List at 0 * Word_Size range 0 .. 31;
	    Blink_Rate at 1 * Word_Size range 0 .. 31;
	    Word_Wrap at 2 * Word_Size range 0 .. 7;
	    Cursor_Position_Visible at 2 * Word_Size + 1 range 0 .. 7;
	    Auto_Show_Insert_Point at 2 * Word_Size + 2 range 0 .. 7;
	    Has_Focus at 2 * Word_Size + 3 range 0 .. 7;
	    Has_Rect at 3 * Word_Size range 0 .. 7;
	    Handling_Exposures at 3 * Word_Size + 1 range 0 .. 7;
	    Expose_V_Scroll at 3 * Word_Size + 2 range 0 .. 7;
	    Expose_H_Scroll at 3 * Word_Size + 3 range 0 .. 7;
	    Resize_Width at 4 * Word_Size range 0 .. 7;
	    Resize_Height at 4 * Word_Size + 1 range 0 .. 7;
	    Scroll_Vertical at 4 * Word_Size + 2 range 0 .. 7;
	    Scroll_Horizontal at 4 * Word_Size + 3 range 0 .. 7;
	    Scroll_Leftside at 5 * Word_Size range 0 .. 7;
	    Scroll_Topside at 5 * Word_Size + 1 range 0 .. 7;
	    Ignore_V_Bar at 5 * Word_Size + 2 range 0 .. 7;
	    Ignore_H_Bar at 5 * Word_Size + 3 range 0 .. 7;
	    Cursor_On at 6 * Word_Size range 0 .. 15;
	    Refresh_Ibeam_Off at 6 * Word_Size + 2 range 0 .. 7;
	    Suspend_H_Offset at 6 * Word_Size + 3 range 0 .. 7;
	    Use_Font_Set at 7 * Word_Size range 0 .. 7;
	    Have_Inverted_Image_Gc at 7 * Word_Size + 1 range 0 .. 7;
	    Blink_State at 8 * Word_Size range 0 .. 31;
	    Insert_X at 9 * Word_Size range 0 .. 15;
	    Insert_Y at 9 * Word_Size + 2 range 0 .. 15;
	    Number_Lines at 10 * Word_Size range 0 .. 31;
	    Left_Margin at 11 * Word_Size range 0 .. 31;
	    Right_Margin at 12 * Word_Size range 0 .. 31;
	    Top_Margin at 13 * Word_Size range 0 .. 31;
	    Bottom_Margin at 14 * Word_Size range 0 .. 31;
	    Scroll_Width at 15 * Word_Size range 0 .. 31;
	    V_Slider_Size at 16 * Word_Size range 0 .. 31;
	    H_Offset at 17 * Word_Size range 0 .. 31;
	    Average_Char_Width at 18 * Word_Size range 0 .. 31;
	    Tab_Width at 19 * Word_Size range 0 .. 31;
	    Columns at 20 * Word_Size range 0 .. 15;
	    Rows at 20 * Word_Size + 2 range 0 .. 15;
	    Line_Height at 21 * Word_Size range 0 .. 15;
	    Min_Width at 21 * Word_Size + 2 range 0 .. 15;
	    Min_Height at 22 * Word_Size range 0 .. 15;
	    Prev_W at 22 * Word_Size + 2 range 0 .. 15;
	    Prev_H at 23 * Word_Size range 0 .. 15;
	    Cursor_Width at 23 * Word_Size + 2 range 0 .. 15;
	    Cursor_Height at 24 * Word_Size range 0 .. 15;
	    Font_Ascent at 24 * Word_Size + 2 range 0 .. 15;
	    Font_Descent at 25 * Word_Size range 0 .. 15;
	    Timer_Id at 26 * Word_Size range 0 .. 31;
	    Cursor at 27 * Word_Size range 0 .. 31;
	    Add_Mode_Cursor at 28 * Word_Size range 0 .. 31;
	    Ibeam_Off at 29 * Word_Size range 0 .. 31;
	    Stipple_Tile at 30 * Word_Size range 0 .. 31;
	    Gc at 31 * Word_Size range 0 .. 31;
	    Image_Gc at 32 * Word_Size range 0 .. 31;
	    V_Bar at 33 * Word_Size range 0 .. 31;
	    H_Bar at 34 * Word_Size range 0 .. 31;
	    Font at 36 * Word_Size range 0 .. 31;
	    Save_Gc at 37 * Word_Size range 0 .. 31;
	    Columns_Set at 38 * Word_Size range 0 .. 15;
	    Rows_Set at 38 * Word_Size + 2 range 0 .. 15;
	end record;

    Output_Data_Rec_Size : constant := 39 * 32;

    type Output_Data_Rec_Ptr is access Output_Data_Rec;
    subtype Output_Data_Ptr is Output_Data_Rec_Ptr;

    subtype Xy_To_Pos_Proc is X_Lib.X_Address;
    subtype Pos_To_Xy_Proc is X_Lib.X_Address;
    subtype Measure_Line_Proc is X_Lib.X_Address;
    subtype Draw_Proc is X_Lib.X_Address;
    subtype Draw_Insertion_Point_Proc is X_Lib.X_Address;
    subtype Make_Position_Visible_Proc is X_Lib.X_Address;
    subtype Move_Lines_Proc is X_Lib.X_Address;
    subtype Invalidate_Proc is X_Lib.X_Address;
    subtype Get_Preferred_Size_Proc is X_Lib.X_Address;
    subtype Get_Values_Proc is X_Lib.X_Address;
    subtype Set_Values_Proc is X_Lib.X_Address;
    subtype Output_Create_Proc is X_Lib.X_Address;

    type Output_Rec is
	record
	    Data : Output_Data_Rec_Ptr;
	    Xy_To_Pos : Xy_To_Pos_Proc;
	    Pos_To_Xy : Pos_To_Xy_Proc;
	    Measure_Line : Measure_Line_Proc;
	    Draw : Draw_Proc;
	    Draw_Insertion_Point : Draw_Insertion_Point_Proc;
	    Make_Position_Visible : Make_Position_Visible_Proc;
	    Move_Lines : Move_Lines_Proc;
	    Invalidate : Invalidate_Proc;
	    Get_Preferred_Size : Get_Preferred_Size_Proc;
	    Get_Values : Get_Values_Proc;
	    Set_Values : Set_Values_Proc;
	    Realize : Xm_Private.Xm_Realize_Out_Proc;
	    Destroy : Xt.Xt_Widget_Proc;
	    Resize : Xm_Private.Xm_Resize_Flag_Proc;
	    Expose : Xt.Xt_Expose_Proc;
	end record;

    for Output_Rec use
	record
	    Data at 0 * Word_Size range 0 .. 31;
	    Xy_To_Pos at 1 * Word_Size range 0 .. 31;
	    Pos_To_Xy at 2 * Word_Size range 0 .. 31;
	    Measure_Line at 3 * Word_Size range 0 .. 31;
	    Draw at 4 * Word_Size range 0 .. 31;
	    Draw_Insertion_Point at 5 * Word_Size range 0 .. 31;
	    Make_Position_Visible at 6 * Word_Size range 0 .. 31;
	    Move_Lines at 7 * Word_Size range 0 .. 31;
	    Invalidate at 8 * Word_Size range 0 .. 31;
	    Get_Preferred_Size at 9 * Word_Size range 0 .. 31;
	    Get_Values at 10 * Word_Size range 0 .. 31;
	    Set_Values at 11 * Word_Size range 0 .. 31;
	    Realize at 12 * Word_Size range 0 .. 31;
	    Destroy at 13 * Word_Size range 0 .. 31;
	    Resize at 14 * Word_Size range 0 .. 31;
	    Expose at 15 * Word_Size range 0 .. 31;
	end record;

    Output_Rec_Size : constant := 16 * 32;
    type Output_Rec_Ptr is access Output_Rec;

end Xm_Text_Out_Private;
