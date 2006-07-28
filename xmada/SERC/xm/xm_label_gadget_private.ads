
-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Configuration_Dependent, X_Lib, Xt, Xm,
     Xt_Object_Private, Xt_Rect_Object_Private, Xm_Private,
     Xm_Ext_Object_Private, Unchecked_Conversion;

package Xm_Label_Gadget_Private is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Word_Size : constant := X_Configuration_Dependent.Word_Size;

    type Xm_Label_G_Cache_Obj_Class_Part is
	record
	    Foo : Xt.Xt_Pointer;
	end record;

    for Xm_Label_G_Cache_Obj_Class_Part use
	record
	    Foo at 0 * Word_Size range 0 .. 31;
	end record;

    Xm_Label_G_Cache_Obj_Class_Part_Size : constant := 32;
    Xm_Label_G_Cache_Obj_Class_Rec_Size : constant :=
       Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size +
	  Xm_Label_G_Cache_Obj_Class_Part_Size;

    type Xm_Label_G_Cache_Obj_Class_Rec is
	record
	    Object_Class : Xt_Object_Private.Object_Class_Part;
	    Ext_Class : Xm_Ext_Object_Private.Ext_Object_Class_Part;
	    Label_Class_Cache : Xm_Label_G_Cache_Obj_Class_Part;
	end record;

    for Xm_Label_G_Cache_Obj_Class_Rec use
	record
	    Object_Class at 0
	       range 0 .. Xt_Object_Private.Object_Class_Rec_Size - 1;
	    Ext_Class at 0
	       range Xt_Object_Private.Object_Class_Rec_Size ..
			Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size - 1;
	    Label_Class_Cache at 0
	       range Xm_Ext_Object_Private.Ext_Object_Class_Rec_Size ..
			Xm_Label_G_Cache_Obj_Class_Rec_Size - 1;
	end record;


    type Xm_Label_G_Cache_Obj_Part is
	record
	    Label_Type : X_Configuration_Dependent.Unsigned_Char;
	    Alignment : X_Configuration_Dependent.Unsigned_Char;
	    String_Direction : X_Configuration_Dependent.Unsigned_Char;
	    Margin_Height : Xt.Dimension;
	    Margin_Width : Xt.Dimension;
	    Margin_Left : Xt.Dimension;
	    Margin_Right : Xt.Dimension;
	    Margin_Top : Xt.Dimension;
	    Margin_Bottom : Xt.Dimension;
	    Recompute_Size : Xm.Xm_Boolean;
	    Skip_Callback : Xm.Xm_Boolean;
	    Menu_Type : X_Configuration_Dependent.Unsigned_Char;
	    Dummy : X_Configuration_Dependent.Unsigned_Char;
	end record;

    for Xm_Label_G_Cache_Obj_Part use
	record
	    Label_Type at 0 * Word_Size range 0 .. 7;
	    Alignment at 0 * Word_Size + 1 range 0 .. 7;
	    String_Direction at 0 * Word_Size + 2 range 0 .. 7;
	    Margin_Height at 1 * Word_Size range 0 .. 15;
	    Margin_Width at 1 * Word_Size + 2 range 0 .. 15;
	    Margin_Left at 2 * Word_Size range 0 .. 15;
	    Margin_Right at 2 * Word_Size + 2 range 0 .. 15;
	    Margin_Top at 3 * Word_Size range 0 .. 15;
	    Margin_Bottom at 3 * Word_Size + 2 range 0 .. 15;
	    Recompute_Size at 4 * Word_Size range 0 .. 7;
	    Skip_Callback at 4 * Word_Size + 1 range 0 .. 7;
	    Menu_Type at 4 * Word_Size + 2 range 0 .. 7;
	    Dummy at 4 * Word_Size + 3 range 0 .. 7;
	end record;

    Xm_Label_G_Cache_Obj_Part_Size : constant := 5 * 32;
    Xm_Label_G_Cache_Obj_Rec_Size : constant :=
       Xm_Ext_Object_Private.Ext_Object_Part_Size +
	  Xm_Label_G_Cache_Obj_Part_Size;

    type Xm_Label_G_Cache_Obj_Rec is
	record
	    Ext : Xm_Ext_Object_Private.Ext_Object_Part;
	    Label_Cache : Xm_Label_G_Cache_Obj_Part;
	end record;

    for Xm_Label_G_Cache_Obj_Rec use
	record
	    Ext at 0 range 0 .. Xm_Ext_Object_Private.Ext_Object_Part_Size - 1;
	    Label_Cache at 0 range Xm_Ext_Object_Private.Ext_Object_Part_Size ..
				      Xm_Label_G_Cache_Obj_Rec_Size - 1;
	end record;

    type Xm_Label_G_Cache_Obj_Rec_Ptr is access Xm_Label_G_Cache_Obj_Rec;
    type Xm_Label_G_Cache_Obj_Part_Ptr is access Xm_Label_G_Cache_Obj_Part;
    type Xm_Label_G_Cache_Obj_Class_Rec_Ptr is
       access Xm_Label_G_Cache_Obj_Class_Rec;

    -- The Label Gadget Class and instance records  */

    type Xm_Label_Gadget_Class_Part is
	record
	    Set_Override_Callback : Xt.Xt_Widget_Proc;
	    Menu_Procs : Xm_Private.Xm_Menu_Proc;
	    Extension : Xt.Xt_Pointer;
	end record;

    for Xm_Label_Gadget_Class_Part use
	record
	    Set_Override_Callback at 0 * Word_Size range 0 .. 31;
	    Menu_Procs at 1 * Word_Size range 0 .. 31;
	    Extension at 2 * Word_Size range 0 .. 31;
	end record;

    Xm_Label_Gadget_Class_Part_Size : constant := 3 * 32;
    Xm_Label_Gadget_Class_Rec_Size : constant :=
       Xm_Private.Xm_Gadget_Class_Rec_Size + Xm_Label_Gadget_Class_Part_Size;


    type Xm_Label_Gadget_Class_Rec is
	record
	    Rect_Class : Xt_Rect_Object_Private.Rect_Obj_Class_Part;
	    Gadget_Class : Xm_Private.Xm_Gadget_Class_Part;
	    Label_Class : Xm_Label_Gadget_Class_Part;
	end record;

    for Xm_Label_Gadget_Class_Rec use
	record
	    Rect_Class at 0
	       range 0 .. Xt_Rect_Object_Private.Rect_Obj_Class_Rec_Size - 1;
	    Gadget_Class at 0
	       range Xt_Rect_Object_Private.Rect_Obj_Class_Rec_Size ..
			Xm_Private.Xm_Gadget_Class_Rec_Size - 1;
	    Label_Class at 0 range Xm_Private.Xm_Gadget_Class_Rec_Size ..
				      Xm_Label_Gadget_Class_Rec_Size - 1;
	end record;

    type Xm_Label_Gadget_Part is
	record
	    Label : Xm.Xm_String;
	    Acc_Text : Xm.Xm_String;
	    Mnemonic : X_Lib.Keyboard.Key_Sym;
	    Mnemonic_Charset : Xm.Xm_String_Char_Set_Ptr;
	    Accelerator : Xm.Xm_String;
	    Font : Xm.Xm_Font_List;
	    Pixmap : X_Lib.Pixmap;
	    Pixmap_Insen : X_Lib.Pixmap;
	    Normal_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Insensitive_Gc : X_Lib.Graphic_Output.Graphic_Context;
	    Textrect : X_Lib.Rectangle;
	    Acc_Textrect : X_Lib.Rectangle;
	    Cache : Xm_Label_G_Cache_Obj_Part_Ptr;
	end record;

    for Xm_Label_Gadget_Part use
	record
	    Label at 0 * Word_Size range 0 .. 31;
	    Acc_Text at 1 * Word_Size range 0 .. 31;
	    Mnemonic at 2 * Word_Size range 0 .. 31;
	    Mnemonic_Charset at 3 * Word_Size range 0 .. 31;
	    Accelerator at 4 * Word_Size range 0 .. 31;
	    Font at 5 * Word_Size range 0 .. 31;
	    Pixmap at 6 * Word_Size range 0 .. 31;
	    Pixmap_Insen at 7 * Word_Size range 0 .. 31;
	    Normal_Gc at 8 * Word_Size range 0 .. 31;
	    Insensitive_Gc at 9 * Word_Size range 0 .. 31;
	    Textrect at 10 * Word_Size range 0 .. 63;
	    Acc_Textrect at 12 * Word_Size range 0 .. 63;
	    Cache at 14 * Word_Size range 0 .. 31;
	end record;

    Xm_Label_Gadget_Part_Size : constant := 15 * 32;
    Xm_Label_Gadget_Rec_Size : constant :=
       Xm_Private.Xm_Gadget_Rec_Size + Xm_Label_Gadget_Part_Size;

    type Xm_Label_Gadget_Rec is
	record
	    Object : Xt_Object_Private.Object_Part;
	    Rectangle : Xt_Rect_Object_Private.Rect_Obj_Part;
	    Gadget : Xm_Private.Xm_Gadget_Part;
	    Label : Xm_Label_Gadget_Part;
	end record;

    for Xm_Label_Gadget_Rec use
	record
	    Object at 0 range 0 .. Xt_Object_Private.Object_Rec_Size - 1;
	    Rectangle at 0
	       range Xt_Object_Private.Object_Part_Size ..
			Xt_Rect_Object_Private.Rect_Obj_Rec_Size - 1;
	    Gadget at 0 range Xt_Rect_Object_Private.Rect_Obj_Rec_Size ..
				 Xm_Private.Xm_Gadget_Rec_Size - 1;
	    Label at 0 range Xm_Private.Xm_Gadget_Rec_Size ..
				Xm_Label_Gadget_Rec_Size - 1;
	end record;

    subtype Xm_Inherit_Set_Override_Callback is Xt.Xt_Widget_Proc;
    subtype Xm_Inherit_Resize is Xt.Xt_Widget_Proc;

    Labelg_Acc_Pad : constant := 15;

    type Xm_Label_Gadget_Class_Rec_Ptr is access Xm_Label_Gadget_Class_Rec;
    type Xm_Label_Gadget_Rec_Ptr is access Xm_Label_Gadget_Rec;

    function To_Gadget_Class
		(X : in Xm_Label_Gadget_Class_Rec_Ptr) return Xm.Gadget_Class;

    function To_Xm_Label_Gadget_Class (X : in Xm.Gadget_Class)
				      return Xm_Label_Gadget_Class_Rec_Ptr;

    function To_Gadget (X : in Xm_Label_Gadget_Rec_Ptr) return Xm.Gadget;

    function To_Xm_Label_Gadget (X : in Xm.Gadget)
				return Xm_Label_Gadget_Rec_Ptr;

end Xm_Label_Gadget_Private;

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

