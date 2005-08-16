-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm,
     Xt_Core_Private, Xm_Private, Unchecked_Conversion;

package Xm_Label_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;


    type Xm_Label_Class_Part is
	record
	    Set_Override_Callback : Xt.Xt_Widget_Proc;
	    Menu_Procs : Xt.Xt_Proc;
	    Translations : X_Lib.String_Pointer;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Label_Class_Part use
	record
	    Set_Override_Callback at 0 * Word_Size range 0 .. 31;
	    Menu_Procs at 1 * Word_Size range 0 .. 31;
	    Translations at 2 * Word_Size range 0 .. 31;
	    Extension at 3 * Word_Size range 0 .. 31;
	end record;

    Xm_Label_Class_Part_Size : constant := 4 * 32;
    Xm_Label_Class_Rec_Size : constant :=
       Xm_Private.Xm_Primitive_Class_Rec_Size + Xm_Label_Class_Part_Size;

    type Xm_Label_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Primitive_Class : Xm_Private.Xm_Primitive_Class_Part;
	    Label_Class : Xm_Label_Class_Part;
	end record;

    for Xm_Label_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Primitive_Class at 0
	       range Xt_Core_Private.Core_Class_Rec_Size ..
			Xm_Private.Xm_Primitive_Class_Rec_Size - 1;
	    Label_Class at 0 range Xm_Private.Xm_Primitive_Class_Rec_Size ..
				      Xm_Label_Class_Rec_Size - 1;
	end record;

    subtype Xm_Inherit_Set_Override_Callback is Xt.Xt_Widget_Proc;
    subtype Xm_Inherit_Resize is Xt.Xt_Widget_Proc;
    subtype Xm_Inherit_Realize is Xt.Xt_Widget_Proc;

    Label_Acc_Pad : constant := 15;

    type Xm_Label_Part is
	record
	    Label : Xm.Xm_String;
	    Acc_Text : Xm.Xm_String;
	    Mnemonic : X_Lib.Keyboard.Key_Sym;
	    Mnemonic_Charset : Xm.Xm_String_Char_Set_Ptr;
	    Accelerator : X_Lib.String_Pointer;
	    Label_Type : X_Configuration_Dependent.Unsigned_Char;
	    Alignment : X_Configuration_Dependent.Unsigned_Char;
	    String_Direction : X_Configuration_Dependent.Unsigned_Char;
	    Font : Xm.Xm_Font_List;
	    Margin_Height : Xt.Dimension;
	    Margin_Width : Xt.Dimension;
	    Margin_Left : Xt.Dimension;
	    Margin_Right : Xt.Dimension;
	    Margin_Top : Xt.Dimension;
	    Margin_Bottom : Xt.Dimension;
	    Recompute_Size : Xm.Xm_Boolean;
	    Pixmap : X_Lib.Pixmap;
	    Pixmap_Insen : X_Lib.Pixmap;
	    Normal_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Insensitive_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Textrect : X_Lib.Rectangle;
	    Acc_Textrect : X_Lib.Rectangle;
	    Skipcallback : Xm.Xm_Boolean;
	    Menu_Type : X_Configuration_Dependent.Unsigned_Char;
	    Dummy : X_Configuration_Dependent.Short;
	end record;
    for Xm_Label_Part use
	record
	    Label at 0 * Word_Size range 0 .. 31;
	    Acc_Text at 1 * Word_Size range 0 .. 31;
	    Mnemonic at 2 * Word_Size range 0 .. 31;
	    Mnemonic_Charset at 3 * Word_Size range 0 .. 31;
	    Accelerator at 4 * Word_Size range 0 .. 31;
	    Label_Type at 5 * Word_Size range 0 .. 7;
	    Alignment at 5 * Word_Size + 1 range 0 .. 7;
	    String_Direction at 5 * Word_Size + 2 range 0 .. 7;
	    Font at 6 * Word_Size range 0 .. 31;
	    Margin_Height at 7 * Word_Size range 0 .. 15;
	    Margin_Width at 7 * Word_Size + 2 range 0 .. 15;
	    Margin_Left at 8 * Word_Size range 0 .. 15;
	    Margin_Right at 8 * Word_Size + 2 range 0 .. 15;
	    Margin_Top at 9 * Word_Size range 0 .. 15;
	    Margin_Bottom at 9 * Word_Size + 2 range 0 .. 15;
	    Recompute_Size at 10 * Word_Size range 0 .. 7;
	    Pixmap at 11 * Word_Size range 0 .. 31;
	    Pixmap_Insen at 12 * Word_Size range 0 .. 31;
	    Normal_Gc at 13 * Word_Size range 0 .. 31;
	    Insensitive_Gc at 14 * Word_Size range 0 .. 31;
	    Textrect at 15 * Word_Size range 0 .. 63;
	    Acc_Textrect at 17 * Word_Size range 0 .. 63;
	    Skipcallback at 19 * Word_Size range 0 .. 7;
	    Menu_Type at 19 * Word_Size + 1 range 0 .. 7;
	    Dummy at 19 * Word_Size + 2 range 0 .. 15;
	end record;

    Xm_Label_Part_Size : constant := 20 * 32;
    Xm_Label_Rec_Size : constant :=
       Xm_Private.Xm_Primitive_Rec_Size + Xm_Label_Part_Size;
    type Xm_Label_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Primitive : Xm_Private.Xm_Primitive_Part;
	    Label : Xm_Label_Part;
	end record;

    for Xm_Label_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Primitive at 0 range Xt_Core_Private.Core_Part_Size ..
				    Xm_Private.Xm_Primitive_Rec_Size - 1;
	    Label at 0 range Xm_Private.Xm_Primitive_Rec_Size ..
				Xm_Label_Rec_Size - 1;
	end record;

    type Xm_Label_Class_Rec_Ptr is access Xm_Label_Class_Rec;
    type Xm_Label_Rec_Ptr is access Xm_Label_Rec;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Xm_Label_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Xm_Label_Class (X : in Xt.Widget_Class)
			       return Xm_Label_Class_Rec_Ptr;

    function To_Widget (X : in Xm_Label_Rec_Ptr) return Xt.Widget;

    function To_Xm_Label (X : in Xt.Widget) return Xm_Label_Rec_Ptr;

end Xm_Label_Private;

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
