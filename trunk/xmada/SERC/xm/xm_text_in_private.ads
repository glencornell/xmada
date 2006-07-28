-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm, Xm_Text,
     Xm_Text_String_Source_Private, Unchecked_Conversion;

package Xm_Text_In_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Selection_Hint is
	record
	    X : X_Configuration_Dependent.Int;
	    Y : X_Configuration_Dependent.Int;
	end record;

    for Selection_Hint use
	record
	    X at 0 * Word_Size range 0 .. 31;
	    Y at 1 * Word_Size range 0 .. 31;
	end record;
    Selection_Hint_Size : constant := 2 * 32;
    type Selection_Hint_Ptr is access Selection_Hint;

    type Input_Data_Rec is
	record
	    Widget : Xm_Text.Text_Widget;
	    Sarray : Xm.Xm_Text_Scan_Type_Ptr;
	    S_Array_Count : X_Configuration_Dependent.Int;
	    New_Sel_Length : X_Configuration_Dependent.Int;
	    Threshold : X_Configuration_Dependent.Int;
	    Sel_1_Hint : Selection_Hint;
	    Sel_2_Hint : Selection_Hint;
	    Select_Id : Xt.Xt_Interval_Id;
	    S_Type : Xm.Xm_Text_Scan_Type;
	    Extend_Dir : Xm_Text_String_Source_Private.Xm_Text_Scan_Direction;
	    Sel_2_Extend_Dir : Xm_Text_String_Source_Private.
				  Xm_Text_Scan_Direction;
	    Orig_Left : Xm.Xm_Text_Position;
	    Orig_Right : Xm.Xm_Text_Position;
	    Sel_2_Orig_Left : Xm.Xm_Text_Position;
	    Sel_2_Orig_Right : Xm.Xm_Text_Position;
	    Stuff_Pos : Xm.Xm_Text_Position;
	    Sel_2_Left : Xm.Xm_Text_Position;
	    Sel_2_Right : Xm.Xm_Text_Position;
	    Anchor : Xm.Xm_Text_Position;
	    Select_Pos_X : Xt.Position;
	    Select_Pos_Y : Xt.Position;
	    Pending_Delete : Xm.Xm_Boolean;
	    Syncing : Xm.Xm_Boolean;
	    Extending : Xm.Xm_Boolean;
	    Sel_2_Extending : Xm.Xm_Boolean;
	    Has_Sel_2 : Xm.Xm_Boolean;
	    Has_Destination : Xm.Xm_Boolean;
	    Selection_Move : Xm.Xm_Boolean;
	    Cancel : Xm.Xm_Boolean;
	    Overstrike : Xm.Xm_Boolean;
	    Sel_Start : Xm.Xm_Boolean;
	    Dest_Time : X_Lib.Time;
	    Sec_Time : X_Lib.Time;
	    Last_Time : X_Lib.Time;
	end record;

    for Input_Data_Rec use
	record
	    Widget at 0 * Word_Size range 0 .. 31;
	    Sarray at 1 * Word_Size range 0 .. 31;
	    S_Array_Count at 2 * Word_Size range 0 .. 31;
	    New_Sel_Length at 3 * Word_Size range 0 .. 31;
	    Threshold at 4 * Word_Size range 0 .. 31;
	    Sel_1_Hint at 5 * Word_Size range 0 .. 63;
	    Sel_2_Hint at 7 * Word_Size range 0 .. 63;
	    Select_Id at 9 * Word_Size range 0 .. 31;
	    S_Type at 10 * Word_Size range 0 .. 31;
	    Extend_Dir at 11 * Word_Size range 0 .. 31;
	    Sel_2_Extend_Dir at 12 * Word_Size range 0 .. 31;
	    Orig_Left at 13 * Word_Size range 0 .. 31;
	    Orig_Right at 14 * Word_Size range 0 .. 31;
	    Sel_2_Orig_Left at 15 * Word_Size range 0 .. 31;
	    Sel_2_Orig_Right at 16 * Word_Size range 0 .. 31;
	    Stuff_Pos at 17 * Word_Size range 0 .. 31;
	    Sel_2_Left at 18 * Word_Size range 0 .. 31;
	    Sel_2_Right at 19 * Word_Size range 0 .. 31;
	    Anchor at 20 * Word_Size range 0 .. 31;
	    Select_Pos_X at 21 * Word_Size range 0 .. 15;
	    Select_Pos_Y at 21 * Word_Size + 2 range 0 .. 15;
	    Pending_Delete at 22 * Word_Size range 0 .. 7;
	    Syncing at 22 * Word_Size + 1 range 0 .. 7;
	    Extending at 22 * Word_Size + 2 range 0 .. 7;
	    Sel_2_Extending at 22 * Word_Size + 3 range 0 .. 7;
	    Has_Sel_2 at 23 * Word_Size range 0 .. 7;
	    Has_Destination at 23 * Word_Size + 1 range 0 .. 7;
	    Selection_Move at 23 * Word_Size + 2 range 0 .. 7;
	    Cancel at 23 * Word_Size + 3 range 0 .. 7;
	    Overstrike at 24 * Word_Size range 0 .. 7;
	    Sel_Start at 24 * Word_Size + 1 range 0 .. 7;
	    Dest_Time at 25 * Word_Size range 0 .. 31;
	    Sec_Time at 26 * Word_Size range 0 .. 31;
	    Last_Time at 27 * Word_Size range 0 .. 31;
	end record;

    Input_Data_Rec_Size : constant := 32 * 28;

    type Input_Data_Rec_Ptr is access Input_Data_Rec;
    subtype Input_Data_Ptr is Input_Data_Rec_Ptr;

    subtype Input_Invalidate_Proc is X_Lib.X_Address;
    subtype Input_Create_Proc is X_Lib.X_Address;
    subtype Input_Get_Values_Proc is X_Lib.X_Address;
    subtype Input_Set_Values_Proc is X_Lib.X_Address;
    subtype Input_Get_Sec_Res_Proc is X_Lib.X_Address;

    type Input_Rec is
	record
	    Data : Input_Data_Rec_Ptr;
	    Invalidate : Input_Invalidate_Proc;
	    Get_Values : Input_Get_Values_Proc;  
	    Set_Values : Input_Set_Values_Proc;  
	    Destroy : Xt.Xt_Widget_Proc;  
	    Get_Sec_Res_Data : Input_Get_Sec_Res_Proc;
	end record;

    for Input_Rec use
	record
	    Data at 0 * Word_Size range 0 .. 31;
	    Invalidate at 1 * Word_Size range 0 .. 31;
	    Get_Values at 2 * Word_Size range 0 .. 31;
	    Set_Values at 3 * Word_Size range 0 .. 31;
	    Destroy at 4 * Word_Size range 0 .. 31;
	    Get_Sec_Res_Data at 5 * Word_Size range 0 .. 31;
	end record;

    Input_Rec_Size : constant := 32 * 6;
    type Input_Rec_Ptr is access Input_Rec;

end Xm_Text_In_Private;
