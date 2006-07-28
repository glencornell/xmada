-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, Xt, Xt_Core_Private, X_Lib, Xm,
     Xm_Desktop_Private, Xm_Drag_Icon_Private, Unchecked_Conversion;

package Xm_Screen_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Screen_Class_Part is
	record
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Screen_Class_Part use
	record
	    Extension at 0 range 0 .. 31;
	end record;

    Desktop_Class_Rec_Upper_Bound : constant :=
       Xt_Core_Private.Core_Class_Part_Size +
	  Xm_Desktop_Private.Xm_Desktop_Class_Part_Size;

    Xm_Screen_Class_Part_Size : constant := 32;
    Xm_Screen_Class_Rec_Size : constant :=
       Desktop_Class_Rec_Upper_Bound + Xm_Screen_Class_Part_Size;

    type Xm_Screen_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Desktop_Class : Xm_Desktop_Private.Xm_Desktop_Class_Part;
	    Screen_Class : Xm_Screen_Class_Part;
	end record;

    for Xm_Screen_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Part_Size - 1;
	    Desktop_Class at 0 range Xt_Core_Private.Core_Class_Part_Size ..
					Desktop_Class_Rec_Upper_Bound - 1;
	    Screen_Class at 0 range Desktop_Class_Rec_Upper_Bound ..
				       Xm_Screen_Class_Rec_Size - 1;
	end record;

    type Xm_Drag_Cursor_Rec;
    type Xm_Drag_Cursor_Cache is access Xm_Drag_Cursor_Rec;

    type Xm_Drag_Cursor_Rec is
	record
	    Next : Xm_Drag_Cursor_Cache;
	    Cursor : X_Lib.Cursors.Cursor;
	    State_Icon : Xm_Drag_Icon_Private.Xm_Drag_Icon_Object_Rec_Ptr;
	    Op_Icon : Xm_Drag_Icon_Private.Xm_Drag_Icon_Object_Rec_Ptr;
	    Source_Icon : Xm_Drag_Icon_Private.Xm_Drag_Icon_Object_Rec_Ptr;
	end record;

    for Xm_Drag_Cursor_Rec use
	record
	    Next at 0 * Word_Size range 0 .. 31;
	    Cursor at 1 * Word_Size range 0 .. 31;
	    State_Icon at 2 * Word_Size range 0 .. 31;
	    Op_Icon at 3 * Word_Size range 0 .. 31;
	    Source_Icon at 4 * Word_Size range 0 .. 31;
	end record;

    type Xm_Scratch_Pixmap_Rec;
    type Xm_Scratch_Pixmap is access Xm_Scratch_Pixmap_Rec;

    type Xm_Scratch_Pixmap_Rec is
	record
	    Next : Xm_Scratch_Pixmap;
	    Pixmap : X_Lib.Pixmap;
	    Depth : Xt.Cardinal;
	    Width : Xt.Dimension;
	    Height : Xt.Dimension;
	    In_Use : Xm.Xm_Boolean;
	    Dummy : X_Lib.X_Character;
	end record;

    for Xm_Scratch_Pixmap_Rec use
	record
	    Next at 0 * Word_Size range 0 .. 31;
	    Pixmap at 1 * Word_Size range 0 .. 31;
	    Depth at 2 * Word_Size range 0 .. 31;
	    Width at 3 * Word_Size range 0 .. 15;
	    Height at 3 * Word_Size + 2 range 0 .. 15;
	    In_Use at 4 * Word_Size range 0 .. 7;
	    Dummy at 4 * Word_Size + 3 range 0 .. 7;
	end record;

    type Xm_Screen_Part is
	record
	    Mwm_Present : Xm.Xm_Boolean;
	    Num_Reparented : Xt.Short_Cardinal;
	    Dark_Threshold : X_Lib.X_Integer;
	    Foreground_Threshold : X_Lib.X_Integer;
	    Light_Threshold : X_Lib.X_Integer;
	    Default_None_Cursor_Icon : Xm_Drag_Icon_Private.
					  Xm_Drag_Icon_Object_Rec_Ptr;
	    Default_Valid_Cursor_Icon : Xm_Drag_Icon_Private.
					   Xm_Drag_Icon_Object_Rec_Ptr;
	    Default_Invalid_Cursor_Icon :
	       Xm_Drag_Icon_Private.Xm_Drag_Icon_Object_Rec_Ptr;
	    Default_Move_Cursor_Icon : Xm_Drag_Icon_Private.
					  Xm_Drag_Icon_Object_Rec_Ptr;
	    Default_Copy_Cursor_Icon : Xm_Drag_Icon_Private.
					  Xm_Drag_Icon_Object_Rec_Ptr;
	    Default_Link_Cursor_Icon : Xm_Drag_Icon_Private.
					  Xm_Drag_Icon_Object_Rec_Ptr;
	    Default_Source_Cursor_Icon :
	       Xm_Drag_Icon_Private.Xm_Drag_Icon_Object_Rec_Ptr;
	    Null_Cursor : X_Lib.Cursors.Cursor;
	    Cursor_Cache : Xm_Drag_Cursor_Cache;
	    Max_Cursor_Width : Xt.Cardinal;
	    Max_Cursor_Height : Xt.Cardinal;
	    Menu_Curso : X_Lib.Cursors.Cursor;
	    Unpost_Behavior : X_Lib.X_Character;
	    Font_Struct : X_Lib.Fonts.Font_Record_Pointer;
	    H_Unit : X_Lib.X_Integer;
	    V_Unit : X_Lib.X_Integer;
	    Scratch_Pixmaps : Xm_Scratch_Pixmap;
	    Move_Opaque : X_Lib.X_Character;
	    Xm_State_Cursor_Icon : Xm_Drag_Icon_Private.
				      Xm_Drag_Icon_Object_Rec_Ptr;
	    Xm_Move_Cursor_Icon : Xm_Drag_Icon_Private.
				     Xm_Drag_Icon_Object_Rec_Ptr;
	    Xm_Copy_Cursor_Icon : Xm_Drag_Icon_Private.
				     Xm_Drag_Icon_Object_Rec_Ptr;
	    Xm_Link_Cursor_Icon : Xm_Drag_Icon_Private.
				     Xm_Drag_Icon_Object_Rec_Ptr;
	    Xm_Source_Cursor_Icon : Xm_Drag_Icon_Private.
				       Xm_Drag_Icon_Object_Rec_Ptr;
	    Image_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Image_Gc_Depth : X_Lib.X_Integer;
	    Image_Foreground : X_Lib.Pixel;
	    Image_Background : X_Lib.Pixel;
	    Screen_Info : Xt.Xt_Pointer;
	end record;

    Desktop_Rec_Upper_Bound : constant :=
       Xt_Core_Private.Core_Class_Part_Size +
	  Xm_Desktop_Private.Xm_Desktop_Class_Part_Size;

    for Xm_Screen_Part use
	record
	    Mwm_Present at 0 * Word_Size range 0 .. 7;
	    Num_Reparented at 0 * Word_Size + 2 range 0 .. 15;
	    Dark_Threshold at 1 * Word_Size range 0 .. 31;
	    Foreground_Threshold at 2 * Word_Size range 0 .. 31;
	    Light_Threshold at 3 * Word_Size range 0 .. 31;
	    Default_None_Cursor_Icon at 4 * Word_Size range 0 .. 31;
	    Default_Valid_Cursor_Icon at 5 * Word_Size range 0 .. 31;
	    Default_Invalid_Cursor_Icon at 6 * Word_Size range 0 .. 31;
	    Default_Move_Cursor_Icon at 7 * Word_Size range 0 .. 31;
	    Default_Copy_Cursor_Icon at 8 * Word_Size range 0 .. 31;
	    Default_Link_Cursor_Icon at 9 * Word_Size range 0 .. 31;
	    Default_Source_Cursor_Icon at 10 * Word_Size range 0 .. 31;
	    Null_Cursor at 11 * Word_Size range 0 .. 31;
	    Cursor_Cache at 12 * Word_Size range 0 .. 31;
	    Max_Cursor_Width at 13 * Word_Size range 0 .. 31;
	    Max_Cursor_Height at 14 * Word_Size range 0 .. 31;
	    Menu_Curso at 15 * Word_Size range 0 .. 31;
	    Unpost_Behavior at 16 * Word_Size range 0 .. 7;
	    Font_Struct at 17 * Word_Size range 0 .. 31;
	    H_Unit at 18 * Word_Size range 0 .. 31;
	    V_Unit at 19 * Word_Size range 0 .. 31;
	    Scratch_Pixmaps at 20 * Word_Size range 0 .. 31;
	    Move_Opaque at 21 * Word_Size range 0 .. 7;
	    Xm_State_Cursor_Icon at 22 * Word_Size range 0 .. 31;
	    Xm_Move_Cursor_Icon at 23 * Word_Size range 0 .. 31;
	    Xm_Copy_Cursor_Icon at 24 * Word_Size range 0 .. 31;
	    Xm_Link_Cursor_Icon at 25 * Word_Size range 0 .. 31;
	    Xm_Source_Cursor_Icon at 26 * Word_Size range 0 .. 31;
	    Image_Gc at 27 * Word_Size range 0 .. 31;
	    Image_Gc_Depth at 28 * Word_Size range 0 .. 31;
	    Image_Foreground at 29 * Word_Size range 0 .. 31;
	    Image_Background at 30 * Word_Size range 0 .. 31;
	    Screen_Info at 31 * Word_Size range 0 .. 31;
	end record;

    Xm_Screen_Part_Size : constant := 32 * 32;
    Xm_Screen_Rec_Size : constant :=
       Desktop_Rec_Upper_Bound + Xm_Screen_Part_Size;

    type Xm_Screen_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Desktop : Xm_Desktop_Private.Xm_Desktop_Part;
	    Screen : Xm_Screen_Part;
	end record;

    for Xm_Screen_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Desktop at 0 range Xt_Core_Private.Core_Part_Size ..
				  Desktop_Rec_Upper_Bound - 1;
	    Screen at 0 range Desktop_Rec_Upper_Bound .. Xm_Screen_Rec_Size - 1;
	end record;

    type Xm_Screen_Class_Rec_Ptr is access Xm_Screen_Class_Rec;
    type Xm_Screen_Rec_Ptr is access Xm_Screen_Rec;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Screen_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Screen_Class (X : in Xt.Widget_Class)
				return Xm_Screen_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Screen_Rec_Ptr) return Xt.Widget;

    function To_Xm_Screen (X : in Xt.Widget) return Xm_Screen_Rec_Ptr;

end Xm_Screen_Private;

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
