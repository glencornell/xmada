-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm, Xm_Text, Unchecked_Conversion;

package Xm_Text_String_Source_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Text_Status is (Edit_Done, Edit_Error, Edit_Reject);
    for Xm_Text_Status'Size use 32;

    type Xm_Text_Scan_Direction is (Xmsd_Left, Xmsd_Right);
    for Xm_Text_Scan_Direction'Size use 32;

    type Xm_Source_Data_Rec is
	record
	    Source : Xm_Text.Xm_Text_Source;
	    Widgets : Xm_Text.Text_Widget;
	    Left : Xm.Xm_Text_Position;
	    Right : Xm.Xm_Text_Position;
	    Ptr : Xm.Xm_String;
	    Value : Xm.Xm_String;
	    Gap_Start : Xm.Xm_String;
	    Gap_End : Xm.Xm_String;
	    Pswc_Nwln : Xm.Xm_String;
	    Length : X_Configuration_Dependent.Int;
	    Maxlength : X_Configuration_Dependent.Int;
	    Old_Length : X_Configuration_Dependent.Int;
	    Num_Widgets : X_Configuration_Dependent.Int;
	    Max_Allowed : X_Configuration_Dependent.Int;
	    Prim_Time : X_Lib.Time;
	    Has_Selection : Xm.Xm_Boolean;
	    Editable : Xm.Xm_Boolean;
	    Dummy : Xm.Xm_Boolean;
	end record;

    for Xm_Source_Data_Rec use
	record
	    Source at 0 * Word_Size range 0 .. 31;
	    Widgets at 1 * Word_Size range 0 .. 31;
	    Left at 2 * Word_Size range 0 .. 31;
	    Right at 3 * Word_Size range 0 .. 31;
	    Ptr at 4 * Word_Size range 0 .. 31;
	    Value at 5 * Word_Size range 0 .. 31;
	    Gap_Start at 6 * Word_Size range 0 .. 31;
	    Gap_End at 7 * Word_Size range 0 .. 31;
	    Pswc_Nwln at 8 * Word_Size range 0 .. 31;
	    Length at 9 * Word_Size range 0 .. 31;
	    Maxlength at 10 * Word_Size range 0 .. 31;
	    Old_Length at 11 * Word_Size range 0 .. 31;
	    Num_Widgets at 12 * Word_Size range 0 .. 31;
	    Max_Allowed at 13 * Word_Size range 0 .. 31;
	    Prim_Time at 14 * Word_Size range 0 .. 31;
	    Has_Selection at 15 * Word_Size range 0 .. 7;
	    Editable at 15 * Word_Size + 1 range 0 .. 7;
	    Dummy at 15 * Word_Size + 3 range 0 .. 7;
	end record;

    Xm_Source_Data_Rec_Size : constant := 16 * 32;
    type Xm_Source_Data_Rec_Ptr is access Xm_Source_Data_Rec;
    subtype Xm_Source_Data_Ptr is Xm_Source_Data_Rec_Ptr;

    subtype Add_Widget_Proc is X_Lib.X_Address;
    subtype Count_Lines_Proc is X_Lib.X_Address;
    subtype Remove_Widget_Proc is X_Lib.X_Address;
    subtype Read_Proc is X_Lib.X_Address;
    subtype Replace_Proc is X_Lib.X_Address;
    subtype Scan_Proc is X_Lib.X_Address;
    subtype Get_Selection_Proc is X_Lib.X_Address;
    subtype Set_Selection_Proc is X_Lib.X_Address;


    type Xm_Text_Source_Rec is
	record
	    Data : Xm_Source_Data_Rec_Ptr;
	    Add_Widget : Add_Widget_Proc;
	    Count_Lines : Count_Lines_Proc;
	    Removewidget : Remove_Widget_Proc;
	    Read_Source : Read_Proc;
	    Replace : Replace_Proc;
	    Scan : Scan_Proc;
	    Get_Selection : Get_Selection_Proc;
	    Set_Selection : Set_Selection_Proc;
	end record;


    for Xm_Text_Source_Rec use
	record
	    Data at 0 * Word_Size range 0 .. 31;
	    Add_Widget at 1 * Word_Size range 0 .. 31;
	    Count_Lines at 2 * Word_Size range 0 .. 31;
	    Removewidget at 3 * Word_Size range 0 .. 31;
	    Read_Source at 4 * Word_Size range 0 .. 31;
	    Replace at 5 * Word_Size range 0 .. 31;
	    Scan at 6 * Word_Size range 0 .. 31;
	    Get_Selection at 7 * Word_Size range 0 .. 31;
	    Set_Selection at 8 * Word_Size range 0 .. 31;
	end record;

    Xm_Text_Source_Rec_Size : constant := 9 * 32;
    type Xm_Text_Source_Rec_Ptr is access Xm_Text_Source_Rec;

end Xm_Text_String_Source_Private;
