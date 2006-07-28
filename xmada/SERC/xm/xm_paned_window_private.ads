-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.


with X_Configuration_Dependent, X_Lib, Xt, Xm, Xt_Core_Private,
     Xt_Composite_Private, Xt_Constraint_Private, Xm_Private,
     X_Configuration_Dependent, Unchecked_Conversion;

package Xm_Paned_Window_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Paned_Window_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Paned_Window_Class_Part use
	record
	    Extension at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Paned_Window_Class_Part_Size : constant := 32;
    Xm_Paned_Window_Class_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Class_Rec_Size + Xm_Paned_Window_Class_Part_Size;


    type Xm_Paned_Window_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Constraint_Class : Xt_Constraint_Private.Constraint_Class_Part;
	    Manager_Class : Xm_Private.Xm_Manager_Class_Part;
	    Paned_Window_Class : Xm_Paned_Window_Class_Part;
	end record;

    for Xm_Paned_Window_Class_Rec use
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
			Xm_Private.Xm_Manager_Class_Rec_Size - 1;
	    Paned_Window_Class at 0
	       range Xm_Private.Xm_Manager_Class_Rec_Size ..
			Xm_Paned_Window_Class_Rec_Size - 1;
	end record;

    -- PanedWindow constraint record
    type Xm_Paned_Window_Constraint_Part is
	record
	    Position : X_Configuration_Dependent.Int;
	    Dheight : X_Configuration_Dependent.Int;
	    Dy : Xt.Position;
	    Olddy : Xt.Position;
	    Min : Xt.Dimension;
	    Max : Xt.Dimension;
	    Ispane : Xm.Xm_Boolean;
	    Allow_Resize : Xm.Xm_Boolean;
	    Skip_Adjust : Xm.Xm_Boolean;
	    Sash : Xm.Xt_Widget;
	    Separator : Xm.Xt_Widget;
	    Position_Index : X_Configuration_Dependent.Short;
	    Dummy : X_Configuration_Dependent.Short;
	end record;

    for Xm_Paned_Window_Constraint_Part use
	record
	    Position at 0 * Word_Size range 0 .. 31;
	    Dheight at 1 * Word_Size range 0 .. 31;
	    Dy at 2 * Word_Size range 0 .. 15;
	    Olddy at 2 * Word_Size range 16 .. 31;
	    Min at 3 * Word_Size range 0 .. 15;
	    Max at 3 * Word_Size range 16 .. 31;
	    Ispane at 4 * Word_Size range 0 .. 7;
	    Allow_Resize at 4 * Word_Size + 1 range 0 .. 7;
	    Skip_Adjust at 4 * Word_Size + 2 range 0 .. 7;
	    Sash at 5 * Word_Size range 0 .. 31;
	    Separator at 6 * Word_Size range 0 .. 31;
	    Position_Index at 7 * Word_Size range 0 .. 15;
	    Dummy at 7 * Word_Size + 2 range 0 .. 15;
	end record;

    Xm_Paned_Window_Constraint_Part_Size : constant := 8 * 32;
    Xm_Paned_Window_Constraint_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Constraint_Rec_Size +
	  Xm_Paned_Window_Constraint_Part_Size;
    type Xm_Paned_Window_Constraint_Part_Ptr is
       access Xm_Paned_Window_Constraint_Part;

    type Xm_Manager_Constraint_Rec is
	record
	    Manager : Xm_Private.Xm_Manager_Constraint_Part;
	    Paned_Window : Xm_Paned_Window_Constraint_Part;
	end record;

    for Xm_Manager_Constraint_Rec use
	record
	    Manager at 0
	       range 0 .. Xm_Private.Xm_Manager_Constraint_Rec_Size - 1;
	    Paned_Window at 0 range Xm_Private.Xm_Manager_Constraint_Rec_Size ..
				       Xm_Paned_Window_Constraint_Rec_Size - 1;
	end record;

    type Xm_Manager_Constraint_Rec_Ptr is access Xm_Manager_Constraint_Rec;

    type Xm_Paned_Window_Part is
	record
	    Refiguremode : Xm.Xm_Boolean;
	    Separator_On : Xm.Xm_Boolean;
	    Margin_Width : Xt.Dimension;
	    Margin_Height : Xt.Dimension;
	    Spacing : Xt.Dimension;
	    Sash_Width : Xt.Dimension;
	    Sash_Height : Xt.Dimension;
	    Sash_Shadow_Thickness : Xt.Dimension;
	    Sash_Indent : Xt.Position;
	    Start_Y : X_Configuration_Dependent.Int;
	    Increment_Count : X_Configuration_Dependent.Short;
	    Pane_Count : X_Configuration_Dependent.Short;
	    Num_Slots : X_Configuration_Dependent.Short;
	    Num_Managed_Children : X_Configuration_Dependent.Short;
	    Recursively_Called : Xm.Xm_Boolean;
	    Resize_At_Realize : Xm.Xm_Boolean;
	    Top_Pane : Xm_Manager_Constraint_Rec_Ptr;
	    Bottom_Pane : Xm_Manager_Constraint_Rec_Ptr;
	    Flip_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Managed_Children : Xt.Xt_Ancillary_Types.Widget_List_Ptr;
	end record;

    for Xm_Paned_Window_Part use
	record
	    Refiguremode at 0 * Word_Size range 0 .. 7;
	    Separator_On at 0 * Word_Size + 1 range 0 .. 7;
	    Margin_Width at 0 * Word_Size + 2 range 0 .. 15;
	    Margin_Height at 1 * Word_Size range 0 .. 15;
	    Spacing at 1 * Word_Size + 2 range 0 .. 15;
	    Sash_Width at 2 * Word_Size range 0 .. 15;
	    Sash_Height at 2 * Word_Size + 2 range 0 .. 15;
	    Sash_Shadow_Thickness at 3 * Word_Size range 0 .. 15;
	    Sash_Indent at 3 * Word_Size + 2 range 0 .. 15;
	    Start_Y at 4 * Word_Size range 0 .. 31;
	    Increment_Count at 5 * Word_Size range 0 .. 15;
	    Pane_Count at 5 * Word_Size + 2 range 0 .. 15;
	    Num_Slots at 6 * Word_Size range 0 .. 15;
	    Num_Managed_Children at 6 * Word_Size + 2 range 0 .. 15;
	    Recursively_Called at 7 * Word_Size range 0 .. 7;
	    Resize_At_Realize at 7 * Word_Size + 1 range 0 .. 7;
	    Top_Pane at 8 * Word_Size range 0 .. 31;
	    Bottom_Pane at 9 * Word_Size range 0 .. 31;
	    Flip_Gc at 10 * Word_Size range 0 .. 31;
	    Managed_Children at 11 * Word_Size range 0 .. 31;
	end record;

    Xm_Paned_Window_Part_Size : constant := 12 * 32;
    Xm_Paned_Window_Rec_Size : constant :=
       Xm_Private.Xm_Manager_Rec_Size + Xm_Paned_Window_Part_Size;

    type Xm_Paned_Window_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Xt_Constraint_Private.Constraint_Part;
	    Manager : Xm_Private.Xm_Manager_Part;
	    Paned_Window : Xm_Paned_Window_Part;
	end record;

    for Xm_Paned_Window_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Xt_Composite_Private.Composite_Rec_Size - 1;
	    Constraint at 0
	       range Xt_Composite_Private.Composite_Rec_Size ..
			Xt_Constraint_Private.Constraint_Rec_Size - 1;
	    Manager at 0 range Xt_Constraint_Private.Constraint_Rec_Size ..
				  Xm_Private.Xm_Manager_Rec_Size - 1;
	    Paned_Window at 0 range Xm_Private.Xm_Manager_Rec_Size ..
				       Xm_Paned_Window_Rec_Size - 1;
	end record;

    type Xm_Paned_Window_Rec_Ptr is access Xm_Paned_Window_Rec;
    type Xm_Paned_Window_Class_Rec_Ptr is access Xm_Paned_Window_Class_Rec;

    function To_Widget_Class
		(X : in Xm_Paned_Window_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Paned_Window_Class (X : in Xt.Widget_Class)
				      return Xm_Paned_Window_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Paned_Window_Rec_Ptr) return Xt.Widget;

    function To_Xm_Paned_Window (X : in Xt.Widget)
				return Xm_Paned_Window_Rec_Ptr;
end Xm_Paned_Window_Private;

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
