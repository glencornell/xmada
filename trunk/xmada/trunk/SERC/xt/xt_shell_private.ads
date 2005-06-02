-- AdaXlibXt: Ada bindings to the X Window System, developed by SERC
-- Copyright (C) 1991, 1992, 1993  Free Software Foundation
--
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Library General Public
-- License as published by the Free Software Foundation; either
-- version 2 of the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Library General Public License for more details.
--
-- You should have received a copy of the GNU Library General Public
-- License along with this library; if not, write to the Free
-- Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

with X_Configuration_Dependent, X_Lib, Xt, Xt_Core_Private,
     Xt_Composite_Private, X_Lib_Interface, Unchecked_Conversion;

use X_Configuration_Dependent, X_Lib, Xt, Xt_Core_Private, Xt_Composite_Private;

package Xt_Shell_Private is
    use X_Lib.Resource_Manager, Xt.Xt_Ancillary_Types, Xt.Xt_Event_Management,
	Xt.Xt_Callbacks, Xt.Xt_Popup_Management, Xt.Xt_Translation_Management;

    type Shell_Part is
	record
	    Geometry : Xt_String;
	    Create_Child_Popup_Proc : Xt_Create_Popup_Child_Proc;
	    Grab_Kind : Xt_Grab_Kind;
	    Spring_Loaded : Xt_Boolean;
	    Popped_Up : Xt_Boolean;
	    Allow_Shell_Resize : Xt_Boolean;
	    Client_Specified : Xt_Boolean;
	    Save_Under : Xt_Boolean;
	    Override_Redirect : Xt_Boolean;
	    Popup_Callback : Xt_Callback_Struct_Ptr;
	    Popdown_Callback : Xt_Callback_Struct_Ptr;
	    The_Visual : X_Lib.Visual;
	end record;

    for Shell_Part use
	record
	    Geometry at 0 * Word_Size range 0 .. 31;
	    Create_Child_Popup_Proc at 1 * Word_Size range 0 .. 31;
	    Grab_Kind at 2 * Word_Size range 0 .. 31;
	    Spring_Loaded at 3 * Word_Size range 0 .. 7;
	    Popped_Up at 3 * Word_Size + 1 range 0 .. 7;
	    Allow_Shell_Resize at 3 * Word_Size + 2 range 0 .. 7;
	    Client_Specified at 3 * Word_Size + 3 range 0 .. 7;
	    Save_Under at 4 * Word_Size range 0 .. 7;
	    Override_Redirect at 4 * Word_Size + 1 range 0 .. 7;
	    Popup_Callback at 5 * Word_Size range 0 .. 31;
	    Popdown_Callback at 6 * Word_Size range 0 .. 31;
	    The_Visual at 7 * Word_Size range 0 .. 31;
	end record;

    Shell_Part_Size : constant := 8 * 32;
    Shell_Rec_Size : constant := Composite_Rec_Size + Shell_Part_Size;


    type Shell_Rec is
	record
	    Core : Core_Part;
	    Composite : Composite_Part;
	    Shell : Shell_Part;
	end record;

    for Shell_Rec use
	record
	    Core at 0 range 0 .. Core_Part_Size - 1;
	    Composite at 0 range Core_Part_Boundary .. Composite_Rec_Size - 1;
	    Shell at 0 range Composite_Rec_Size .. Shell_Rec_Size - 1;
	end record;

    type Shell_Rec_Ptr is access Shell_Rec;
    subtype Shell_Widget_Rec_Ptr is Shell_Rec_Ptr;
    subtype Shell_Widget_Rec is Shell_Rec;

    type Override_Shell_Part is
	record
	    Frabjous : Int; -- dummy place holder
	end record;

    for Override_Shell_Part use
	record
	    Frabjous at 0 range 0 .. 31;
	end record;

    Override_Shell_Part_Size : constant := 32;
    Override_Shell_Rec_Size : constant :=
       Shell_Rec_Size + Override_Shell_Part_Size;

    type Override_Shell_Rec is
	record
	    Core : Core_Part;
	    Composite : Composite_Part;
	    Shell : Shell_Part;
	    Override_Shell : Override_Shell_Part;
	end record;

    for Override_Shell_Rec use
	record
	    Core at 0 range 0 .. Core_Part_Size - 1;
	    Composite at 0 range Core_Part_Boundary .. Composite_Rec_Size - 1;
	    Shell at 0 range Composite_Rec_Size .. Shell_Rec_Size - 1;
	    Override_Shell at 0
	       range Shell_Rec_Size .. Override_Shell_Rec_Size - 1;
	end record;

    type Override_Shell_Rec_Ptr is access Override_Shell_Rec;
    subtype Override_Shell_Widget_Rec_Ptr is Override_Shell_Rec_Ptr;
    subtype Override_Shell_Widget_Rec is Override_Shell_Rec;

    type Old_X_Size_Hints is
	record
	    Flags : Long;
	    X : Int;
	    Y : Int;
	    Width : Int;
	    Height : Int;
	    Min_Width : Int;
	    Min_Height : Int;
	    Max_Width : Int;
	    Max_Height : Int;
	    Width_Inc : Int;
	    Height_Inc : Int;
	    Min_Aspect_X : Int;
	    Min_Aspect_Y : Int;
	    Max_Aspect_X : Int;
	    Max_Aspect_Y : Int;
	end record;

    for Old_X_Size_Hints use
	record
	    Flags at 0 * Word_Size range 0 .. 31;
	    X at 1 * Word_Size range 0 .. 31;
	    Y at 2 * Word_Size range 0 .. 31;
	    Width at 3 * Word_Size range 0 .. 31;
	    Height at 4 * Word_Size range 0 .. 31;
	    Min_Width at 5 * Word_Size range 0 .. 31;
	    Min_Height at 6 * Word_Size range 0 .. 31;
	    Max_Width at 7 * Word_Size range 0 .. 31;
	    Max_Height at 8 * Word_Size range 0 .. 31;
	    Width_Inc at 9 * Word_Size range 0 .. 31;
	    Height_Inc at 10 * Word_Size range 0 .. 31;
	    Min_Aspect_X at 11 * Word_Size range 0 .. 31;
	    Min_Aspect_Y at 12 * Word_Size range 0 .. 31;
	    Max_Aspect_X at 13 * Word_Size range 0 .. 31;
	    Max_Aspect_Y at 14 * Word_Size range 0 .. 31;
	end record;

    Old_X_Size_Hints_Size : constant := 15 * 32;
    -- old means pre-release X11R4

    X_Wm_Hints_Size : constant := 9 * 32;  -- From X_Lib_Interface definition.

    type Wm_Shell_Part is
	record
	    Title : Xt_String;
	    Wm_Timeout : Int;
	    Wait_For_Wm : Xt_Boolean;
	    Transient : Xt_Boolean;
	    Wm_Configure_Denied : Atoms.Atom;
	    Wm_Moved : Atoms.Atom;
	    Size_Hints : Old_X_Size_Hints;
	    Wm_Hints : X_Lib_Interface.X_Wm_Hint_Record;
	    Base_Width : Int;
	    Base_Height : Int;
	    Win_Gravity : Int;
	    Title_Encoding : Atoms.Atom;
	end record;

    for Wm_Shell_Part use
	record
	    Title at 0 * Word_Size range 0 .. 31;
	    Wm_Timeout at 1 * Word_Size range 0 .. 31;
	    Wait_For_Wm at 2 * Word_Size range 0 .. 7;
	    Transient at 2 * Word_Size + 1 range 0 .. 7;
	    Wm_Configure_Denied at 3 * Word_Size range 0 .. 31;
	    Wm_Moved at 4 * Word_Size range 0 .. 31;
	    Size_Hints at 5 * Word_Size range 0 .. Old_X_Size_Hints_Size - 1;
	    Wm_Hints at 20 * Word_Size range 0 .. X_Wm_Hints_Size - 1;
	    Base_Width at 29 * Word_Size range 0 .. 31;
	    Base_Height at 30 * Word_Size range 0 .. 31;
	    Win_Gravity at 31 * Word_Size range 0 .. 31;
	    Title_Encoding at 32 * Word_Size range 0 .. 31;
	end record;

    Wm_Shell_Part_Size : constant := 33 * 32;
    Wm_Shell_Rec_Size : constant := Shell_Rec_Size + Wm_Shell_Part_Size;

    type Wm_Shell_Rec is
	record
	    Core : Core_Part;
	    Composite : Composite_Part;
	    Shell : Shell_Part;
	    Wm_Shell : Wm_Shell_Part;
	end record;

    for Wm_Shell_Rec use
	record
	    Core at 0 range 0 .. Core_Part_Size - 1;
	    Composite at 0 range Core_Part_Boundary .. Composite_Rec_Size - 1;
	    Shell at 0 range Composite_Rec_Size .. Shell_Rec_Size - 1;
	    Wm_Shell at 0 range Shell_Rec_Size .. Wm_Shell_Rec_Size - 1;
	end record;

    type Wm_Shell_Rec_Ptr is access Wm_Shell_Rec;
    subtype Wm_Shell_Widget_Rec_Ptr is Wm_Shell_Rec_Ptr;
    subtype Wm_Shell_Widget_Rec is Wm_Shell_Rec;

    type Vendor_Shell_Part is
	record
	    Vendor_Specific : Int;
	end record;

    for Vendor_Shell_Part use
	record
	    Vendor_Specific at 0 range 0 .. 31;
	end record;

    Vendor_Shell_Part_Size : constant := 32;
    Vendor_Shell_Rec_Size : constant :=
       Wm_Shell_Rec_Size + Vendor_Shell_Part_Size;

    type Vendor_Shell_Rec is
	record
	    Core : Core_Part;
	    Composite : Composite_Part;
	    Shell : Shell_Part;
	    Wm_Shell : Wm_Shell_Part;
	    Vendor_Shell : Vendor_Shell_Part;
	end record;

    for Vendor_Shell_Rec use
	record
	    Core at 0 range 0 .. Core_Part_Size - 1;
	    Composite at 0 range Core_Part_Boundary .. Composite_Rec_Size - 1;
	    Shell at 0 range Composite_Rec_Size .. Shell_Rec_Size - 1;
	    Wm_Shell at 0 range Shell_Rec_Size .. Wm_Shell_Rec_Size - 1;
	    Vendor_Shell at 0
	       range Wm_Shell_Rec_Size .. Vendor_Shell_Rec_Size - 1;
	end record;

    type Vendor_Shell_Rec_Ptr is access Vendor_Shell_Rec;
    subtype Vendor_Shell_Widget_Rec_Ptr is Vendor_Shell_Rec_Ptr;
    subtype Vendor_Shell_Widget_Rec is Vendor_Shell_Rec;

    type Transient_Shell_Part is
	record
	    Transient_For : Widget;
	end record;

    for Transient_Shell_Part use
	record
	    Transient_For at 0 range 0 .. 31;
	end record;
    Transient_Shell_Part_Size : constant := 32;

    Transient_Shell_Rec_Size : constant :=
       Vendor_Shell_Rec_Size + Transient_Shell_Part_Size;
    type Transient_Shell_Rec is
	record
	    Core : Core_Part;
	    Composite : Composite_Part;
	    Shell : Shell_Part;
	    Wm_Shell : Wm_Shell_Part;
	    Vendor_Shell : Vendor_Shell_Part;
	    Transient_Shell : Transient_Shell_Part;
	end record;

    for Transient_Shell_Rec use
	record
	    Core at 0 range 0 .. Core_Part_Size - 1;
	    Composite at 0 range Core_Part_Boundary .. Composite_Rec_Size - 1;
	    Shell at 0 range Composite_Rec_Size .. Shell_Rec_Size - 1;
	    Wm_Shell at 0 range Shell_Rec_Size .. Wm_Shell_Rec_Size - 1;
	    Vendor_Shell at 0
	       range Wm_Shell_Rec_Size .. Vendor_Shell_Rec_Size - 1;
	    Transient_Shell at 0
	       range Vendor_Shell_Rec_Size .. Transient_Shell_Rec_Size - 1;
	end record;

    type Transient_Shell_Rec_Ptr is access Transient_Shell_Rec;
    subtype Transient_Shell_Widget_Rec_Ptr is Transient_Shell_Rec_Ptr;
    subtype Transient_Shell_Widget_Rec is Transient_Shell_Rec;

    type Top_Level_Shell_Part is
	record
	    Icon_Name : Xt_String;
	    Iconic : Xt_Boolean;
	    Icon_Name_Encoding : Atoms.Atom;
	end record;
    for Top_Level_Shell_Part use
	record
	    Icon_Name at 0 * Word_Size range 0 .. 31;
	    Iconic at 1 * Word_Size range 0 .. 7;
	    Icon_Name_Encoding at 2 * Word_Size range 0 .. 31;
	end record;

    Top_Level_Shell_Part_Size : constant := 3 * 32;
    Top_Level_Shell_Rec_Size : constant :=
       Vendor_Shell_Rec_Size + Top_Level_Shell_Part_Size;


    type Top_Level_Shell_Rec is
	record
	    Core : Core_Part;
	    Composite : Composite_Part;
	    Shell : Shell_Part;
	    Wm_Shell : Wm_Shell_Part;
	    Vendor_Shell : Vendor_Shell_Part;
	    Top_Level_Shell : Top_Level_Shell_Part;
	end record;

    for Top_Level_Shell_Rec use
	record
	    Core at 0 range 0 .. Core_Part_Size - 1;
	    Composite at 0 range Core_Part_Boundary .. Composite_Rec_Size - 1;
	    Shell at 0 range Composite_Rec_Size .. Shell_Rec_Size - 1;
	    Wm_Shell at 0 range Shell_Rec_Size .. Wm_Shell_Rec_Size - 1;
	    Vendor_Shell at 0
	       range Wm_Shell_Rec_Size .. Vendor_Shell_Rec_Size - 1;
	    Top_Level_Shell at 0
	       range Vendor_Shell_Rec_Size .. Top_Level_Shell_Rec_Size - 1;
	end record;

    type Top_Level_Shell_Rec_Ptr is access Top_Level_Shell_Rec;
    subtype Top_Level_Shell_Widget_Rec_Ptr is Top_Level_Shell_Rec_Ptr;
    subtype Top_Level_Shell_Widget_Rec is Top_Level_Shell_Rec;


    type Application_Shell_Part is
	record
	    Class : Xt_String;
	    The_Xrm_Class : Xrm_Class;
	    Argc : Int;
	    Argv : Argv_Type;
	end record;

    for Application_Shell_Part use
	record
	    Class at 0 * Word_Size range 0 .. 31;
	    The_Xrm_Class at 1 * Word_Size range 0 .. 31;
	    Argc at 2 * Word_Size range 0 .. 31;
	    Argv at 3 * Word_Size range 0 .. 31;
	end record;

    Application_Shell_Part_Size : constant := 4 * 32;
    Application_Shell_Rec_Size : constant :=
       Top_Level_Shell_Rec_Size + Application_Shell_Part_Size;

    type Application_Shell_Rec is
	record
	    Core : Core_Part;
	    Composite : Composite_Part;
	    Shell : Shell_Part;
	    Wm_Shell : Wm_Shell_Part;
	    Vendor_Shell : Vendor_Shell_Part;
	    Top_Level_Shell : Top_Level_Shell_Part;
	    Application_Shell : Application_Shell_Part;
	end record;

    for Application_Shell_Rec use
	record
	    Core at 0 range 0 .. Core_Part_Size - 1;
	    Composite at 0 range Core_Part_Boundary .. Composite_Rec_Size - 1;
	    Shell at 0 range Composite_Rec_Size .. Shell_Rec_Size - 1;
	    Wm_Shell at 0 range Shell_Rec_Size .. Wm_Shell_Rec_Size - 1;
	    Vendor_Shell at 0
	       range Wm_Shell_Rec_Size .. Vendor_Shell_Rec_Size - 1;
	    Top_Level_Shell at 0
	       range Vendor_Shell_Rec_Size .. Top_Level_Shell_Rec_Size - 1;
	    Application_Shell at 0
	       range Top_Level_Shell_Rec_Size .. Application_Shell_Rec_Size - 1;
	end record;

    type Application_Shell_Rec_Ptr is access Application_Shell_Rec;
    subtype Application_Shell_Widget_Rec_Ptr is Application_Shell_Rec_Ptr;
    subtype Application_Shell_Widget_Rec is Application_Shell_Rec;

    function To_Widget (X : in Shell_Rec_Ptr) return Widget;

    function To_Shell (X : in Widget) return Shell_Rec_Ptr;

    function To_Widget (X : in Override_Shell_Rec_Ptr) return Widget;

    function To_Override_Shell (X : in Widget) return Override_Shell_Rec_Ptr;

    function To_Widget (X : in Wm_Shell_Rec_Ptr) return Widget;

    function To_Wm_Shell (X : in Widget) return Wm_Shell_Rec_Ptr;

    function To_Widget (X : in Vendor_Shell_Rec_Ptr) return Widget;

    function To_Vendor_Shell (X : in Widget) return Vendor_Shell_Rec_Ptr;

    function To_Widget (X : in Transient_Shell_Rec_Ptr) return Widget;

    function To_Transient_Shell (X : in Widget) return Transient_Shell_Rec_Ptr;

    function To_Widget (X : in Top_Level_Shell_Rec_Ptr) return Widget;

    function To_Top_Level_Shell (X : in Widget) return Top_Level_Shell_Rec_Ptr;

    function To_Widget (X : in Application_Shell_Rec_Ptr) return Widget;

    function To_Application_Shell (X : in Widget)
				  return Application_Shell_Rec_Ptr;

    type Shell_Class_Part is
	record
	    Extension : Xt_Pointer;
	end record;

    for Shell_Class_Part use
	record
	    Extension at 0 range 0 .. 31;
	end record;

    Shell_Class_Part_Size : constant := 32;
    Shell_Class_Rec_Size : constant :=
       Composite_Class_Rec_Size + Shell_Class_Part_Size;
    type Shell_Class_Rec is
	record
	    Core_Class : Core_Class_Part;
	    Composite_Class : Composite_Class_Part;
	    Shell_Class : Shell_Class_Part;
	end record;

    for Shell_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Core_Class_Rec_Size .. Composite_Class_Rec_Size - 1;
	    Shell_Class at 0
	       range Composite_Class_Rec_Size .. Shell_Class_Rec_Size - 1;
	end record;

    type Shell_Class_Ptr is access Shell_Class_Rec;

    type Override_Shell_Class_Part is
	record
	    Extension : Xt_Pointer;
	end record;

    for Override_Shell_Class_Part use
	record
	    Extension at 0 range 0 .. 31;
	end record;

    Override_Shell_Class_Part_Size : constant := 32;
    Override_Shell_Class_Rec_Size : constant :=
       Shell_Class_Rec_Size + Override_Shell_Class_Part_Size;

    type Override_Shell_Class_Rec is
	record
	    Core_Class : Core_Class_Part;
	    Composite_Class : Composite_Class_Part;
	    Shell_Class : Shell_Class_Part;
	    Override_Shell_Class : Override_Shell_Class_Part;
	end record;

    for Override_Shell_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Core_Class_Rec_Size .. Composite_Class_Rec_Size - 1;
	    Shell_Class at 0
	       range Composite_Class_Rec_Size .. Shell_Class_Rec_Size - 1;
	    Override_Shell_Class at 0
	       range Shell_Class_Rec_Size .. Override_Shell_Class_Rec_Size - 1;
	end record;

    type Override_Shell_Class_Ptr is access Override_Shell_Class_Rec;

    type Wm_Shell_Class_Part is
	record
	    Extension : Xt_Pointer;
	end record;

    for Wm_Shell_Class_Part use
	record
	    Extension at 0 range 0 .. 31;
	end record;

    Wm_Shell_Class_Part_Size : constant := 32;
    Wm_Shell_Class_Rec_Size : constant :=
       Shell_Class_Rec_Size + Wm_Shell_Class_Part_Size;

    type Wm_Shell_Class_Rec is
	record
	    Core_Class : Core_Class_Part;
	    Composite_Class : Composite_Class_Part;
	    Shell_Class : Shell_Class_Part;
	    Wm_Shell_Class : Wm_Shell_Class_Part;
	end record;

    for Wm_Shell_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Core_Class_Rec_Size .. Composite_Class_Rec_Size - 1;
	    Shell_Class at 0
	       range Composite_Class_Rec_Size .. Shell_Class_Rec_Size - 1;
	    Wm_Shell_Class at 0
	       range Shell_Class_Rec_Size .. Wm_Shell_Class_Rec_Size - 1;
	end record;

    type Wm_Shell_Class_Ptr is access Wm_Shell_Class_Rec;

    type Vendor_Shell_Class_Part is
	record
	    Extension : Xt_Pointer;
	end record;

    for Vendor_Shell_Class_Part use
	record
	    Extension at 0 range 0 .. 31;
	end record;

    Vendor_Shell_Class_Part_Size : constant := 32;
    Vendor_Shell_Class_Rec_Size : constant :=
       Wm_Shell_Class_Rec_Size + Vendor_Shell_Class_Part_Size;

    type Vendor_Shell_Class_Rec is
	record
	    Core_Class : Core_Class_Part;
	    Composite_Class : Composite_Class_Part;
	    Shell_Class : Shell_Class_Part;
	    Wm_Shell_Class : Wm_Shell_Class_Part;
	    Vendor_Shell_Class : Vendor_Shell_Class_Part;
	end record;

    for Vendor_Shell_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Core_Class_Rec_Size .. Composite_Class_Rec_Size - 1;
	    Shell_Class at 0
	       range Composite_Class_Rec_Size .. Shell_Class_Rec_Size - 1;
	    Wm_Shell_Class at 0
	       range Shell_Class_Rec_Size .. Wm_Shell_Class_Rec_Size - 1;
	    Vendor_Shell_Class at 0
	       range Wm_Shell_Class_Rec_Size .. Vendor_Shell_Class_Rec_Size - 1;
	end record;

    type Vendor_Shell_Class_Ptr is access Vendor_Shell_Class_Rec;

    type Transient_Shell_Class_Part is
	record
	    Extension : Xt_Pointer;
	end record;

    for Transient_Shell_Class_Part use
	record
	    Extension at 0 range 0 .. 31;
	end record;

    Transient_Shell_Class_Part_Size : constant := 32;
    Transient_Shell_Class_Rec_Size : constant :=
       Vendor_Shell_Class_Rec_Size + Transient_Shell_Class_Part_Size;

    type Transient_Shell_Class_Rec is
	record
	    Core_Class : Core_Class_Part;
	    Composite_Class : Composite_Class_Part;
	    Shell_Class : Shell_Class_Part;
	    Wm_Shell_Class : Wm_Shell_Class_Part;
	    Vendor_Shell_Class : Vendor_Shell_Class_Part;
	    Transient_Shell_Class : Transient_Shell_Class_Part;
	end record;

    for Transient_Shell_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Core_Class_Rec_Size .. Composite_Class_Rec_Size - 1;
	    Shell_Class at 0
	       range Composite_Class_Rec_Size .. Shell_Class_Rec_Size - 1;
	    Wm_Shell_Class at 0
	       range Shell_Class_Rec_Size .. Wm_Shell_Class_Rec_Size - 1;
	    Vendor_Shell_Class at 0
	       range Wm_Shell_Class_Rec_Size .. Vendor_Shell_Class_Rec_Size - 1;
	    Transient_Shell_Class at 0
	       range Vendor_Shell_Class_Rec_Size ..
			Transient_Shell_Class_Rec_Size - 1;
	end record;

    type Transient_Shell_Class_Ptr is access Transient_Shell_Class_Rec;

    type Top_Level_Shell_Class_Part is
	record
	    Extension : Xt_Pointer;
	end record;

    for Top_Level_Shell_Class_Part use
	record
	    Extension at 0 range 0 .. 31;
	end record;

    Top_Level_Shell_Class_Part_Size : constant := 32;
    Top_Level_Shell_Class_Rec_Size : constant :=
       Vendor_Shell_Class_Rec_Size + Top_Level_Shell_Class_Part_Size;

    type Top_Level_Shell_Class_Rec is
	record
	    Core_Class : Core_Class_Part;
	    Composite_Class : Composite_Class_Part;
	    Shell_Class : Shell_Class_Part;
	    Wm_Shell_Class : Wm_Shell_Class_Part;
	    Vendor_Shell_Class : Vendor_Shell_Class_Part;
	    Top_Level_Shell_Class : Top_Level_Shell_Class_Part;
	end record;

    for Top_Level_Shell_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Core_Class_Rec_Size .. Composite_Class_Rec_Size - 1;
	    Shell_Class at 0
	       range Composite_Class_Rec_Size .. Shell_Class_Rec_Size - 1;
	    Wm_Shell_Class at 0
	       range Shell_Class_Rec_Size .. Wm_Shell_Class_Rec_Size - 1;
	    Vendor_Shell_Class at 0
	       range Wm_Shell_Class_Rec_Size .. Vendor_Shell_Class_Rec_Size - 1;
	    Top_Level_Shell_Class at 0
	       range Vendor_Shell_Class_Rec_Size ..
			Top_Level_Shell_Class_Rec_Size - 1;
	end record;

    type Top_Level_Shell_Class_Ptr is access Top_Level_Shell_Class_Rec;

    type Application_Shell_Class_Part is
	record
	    Extension : Xt_Pointer;
	end record;

    for Application_Shell_Class_Part use
	record
	    Extension at 0 range 0 .. 31;
	end record;

    Application_Shell_Class_Part_Size : constant := 32;
    Application_Shell_Class_Rec_Size : constant :=
       Top_Level_Shell_Class_Rec_Size + Application_Shell_Class_Part_Size;

    type Application_Shell_Class_Rec is
	record
	    Core_Class : Core_Class_Part;
	    Composite_Class : Composite_Class_Part;
	    Shell_Class : Shell_Class_Part;
	    Wm_Shell_Class : Wm_Shell_Class_Part;
	    Vendor_Shell_Class : Vendor_Shell_Class_Part;
	    Top_Level_Shell_Class : Top_Level_Shell_Class_Part;
	    Application_Shell_Class : Application_Shell_Class_Part;
	end record;

    for Application_Shell_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Core_Class_Rec_Size - 1;
	    Composite_Class at 0
	       range Core_Class_Rec_Size .. Composite_Class_Rec_Size - 1;
	    Shell_Class at 0
	       range Composite_Class_Rec_Size .. Shell_Class_Rec_Size - 1;
	    Wm_Shell_Class at 0
	       range Shell_Class_Rec_Size .. Wm_Shell_Class_Rec_Size - 1;
	    Vendor_Shell_Class at 0
	       range Wm_Shell_Class_Rec_Size .. Vendor_Shell_Class_Rec_Size - 1;
	    Top_Level_Shell_Class at 0
	       range Vendor_Shell_Class_Rec_Size ..
			Top_Level_Shell_Class_Rec_Size - 1;
	    Application_Shell_Class at 0
	       range Top_Level_Shell_Class_Rec_Size ..
			Application_Shell_Class_Rec_Size - 1;
	end record;

    type Application_Shell_Class_Ptr is access Application_Shell_Class_Rec;

    function To_Widget_Class (X : in Shell_Class_Ptr) return Widget_Class;

    function To_Shell_Class (X : in Widget_Class) return Shell_Class_Ptr;

    function To_Widget_Class
		(X : in Override_Shell_Class_Ptr) return Widget_Class;

    function To_Override_Shell_Class
		(X : in Widget_Class) return Override_Shell_Class_Ptr;

    function To_Widget_Class (X : in Wm_Shell_Class_Ptr) return Widget_Class;

    function To_Wm_Shell_Class (X : in Widget_Class) return Wm_Shell_Class_Ptr;

    function To_Widget_Class
		(X : in Vendor_Shell_Class_Ptr) return Widget_Class;

    function To_Vendor_Shell_Class
		(X : in Widget_Class) return Vendor_Shell_Class_Ptr;

    function To_Widget_Class
		(X : in Transient_Shell_Class_Ptr) return Widget_Class;

    function To_Transient_Shell_Class
		(X : in Widget_Class) return Transient_Shell_Class_Ptr;

    function To_Widget_Class
		(X : in Top_Level_Shell_Class_Ptr) return Widget_Class;

    function To_Top_Level_Shell_Class
		(X : in Widget_Class) return Top_Level_Shell_Class_Ptr;

    function To_Widget_Class
		(X : in Application_Shell_Class_Ptr) return Widget_Class;

    function To_Application_Shell_Class
		(X : in Widget_Class) return Application_Shell_Class_Ptr;
end Xt_Shell_Private;
