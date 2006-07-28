-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, Xt;

package Xm_Tear_Off_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Excluded_Parent_Pane_Rec is
	record
	    Pane_List_Size : X_Configuration_Dependent.Short;
	    Pane : Xt.Xt_Ancillary_Types.Xt_Widget_List_Ptr;
	    Num_Panes : X_Configuration_Dependent.Short;
	    Dummy : X_Configuration_Dependent.Short;
	end record;
    for Xm_Excluded_Parent_Pane_Rec use
	record
	    Pane_List_Size at 0 * Word_Size range 0 .. 15;
	    Pane at 1 * Word_Size range 0 .. 31;
	    Num_Panes at 2 * Word_Size range 0 .. 15;
	    Dummy at 2 * Word_Size + 2 range 0 .. 15;
	end record;
end Xm_Tear_Off_Private;

