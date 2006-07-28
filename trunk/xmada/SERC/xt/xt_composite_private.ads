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

with X_Configuration_Dependent, X_Lib, Xt,
     Xt_Core_Private, Unchecked_Conversion;

use X_Configuration_Dependent, X_Lib, Xt, Xt_Core_Private;

package Xt_Composite_Private is
    use X_Lib.Resource_Manager, Xt.Xt_Ancillary_Types,
	Xt.Xt_Event_Management, Xt.Xt_Translation_Management;

    type Composite_Part is
	record
	    Children : Widget_List_Ptr;
	    Num_Children : Cardinal;
	    Num_Slots : Cardinal;
	    Insert_Position : Xt_Order_Proc;
	end record;

    for Composite_Part use
	record
	    Children at 0 * Word_Size range 0 .. 31;
	    Num_Children at 1 * Word_Size range 0 .. 31;
	    Num_Slots at 2 * Word_Size range 0 .. 31;
	    Insert_Position at 3 * Word_Size range 0 .. 31;
	end record;

    Composite_Part_Size : constant := 128;
    Composite_Rec_Size : constant := Composite_Part_Size + Core_Part_Boundary;

    type Composite_Rec is
	record
	    Core : Core_Part;
	    Composite : Composite_Part;
	end record;

    for Composite_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Composite at 0 range Xt_Core_Private.Core_Part_Boundary ..
				    Composite_Rec_Size - 1;
	end record;

    type Composite_Rec_Ptr is access Composite_Rec;

    subtype Composite_Widget_Rec is Composite_Rec;
    subtype Composite_Widget_Rec_Ptr is Composite_Rec_Ptr;

    type Composite_Class_Part is
	record
	    Geometry_Handler : Xt_Geometry_Handler;
	    Change_Managed : Xt_Widget_Proc;
	    Insert_Child : Xt_Widget_Proc;
	    Delete_Child : Xt_Widget_Proc;
	    Extension : Xt_Pointer;
	end record;

    for Composite_Class_Part use
	record
	    Geometry_Handler at 0 * Word_Size range 0 .. 31;
	    Change_Managed at 1 * Word_Size range 0 .. 31;
	    Insert_Child at 2 * Word_Size range 0 .. 31;
	    Delete_Child at 3 * Word_Size range 0 .. 31;
	    Extension at 4 * Word_Size range 0 .. 31;
	end record;

    Composite_Class_Part_Size : constant := 5 * 32;

    type Composite_Class_Extension_Rec is
	record
	    Next_Extension : Xt_Pointer;
	    Record_Type : Xrm_Quark;
	    Version : Long;
	    Record_Size : Cardinal;
	    Accepts_Objects : Xt_Boolean;
	    Dummy1 : Card8;
	    Dummy2 : Card16;
	end record;

    for Composite_Class_Extension_Rec use
	record
	    Next_Extension at 0 * Word_Size range 0 .. 31;
	    Record_Type at 1 * Word_Size range 0 .. 31;
	    Version at 2 * Word_Size range 0 .. 31;
	    Record_Size at 3 * Word_Size range 0 .. 31;
	    Accepts_Objects at 4 * Word_Size range 0 .. 7;
	    Dummy1 at 4 * Word_Size range 8 .. 15;
	    Dummy2 at 4 * Word_Size range 16 .. 31;
	end record;
    -- 1 cant handle three numbers.
    Composite_Class_Extension_Rec_Size : constant := 9 * 16;
    Composite_Class_Extension_Rec_Boundary : constant := 5 * 32;

    type Composite_Class_Extension_Ptr is access Composite_Class_Extension_Rec;

    type Composite_Class_Rec is
	record
	    Core_Class : Core_Class_Part;
	    Composite_Class : Composite_Class_Part;
	end record;

    Composite_Class_Rec_Size : constant :=
       Core_Class_Part_Size + Composite_Class_Part_Size;

    for Composite_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Core_Class_Part_Size - 1;
	    Composite_Class at 0
	       range Core_Class_Part_Size .. Composite_Class_Rec_Size - 1;
	end record;

    type Composite_Class_Rec_Ptr is access Composite_Class_Rec;

    subtype Composite_Class_Widget_Rec is Composite_Class_Rec;
    subtype Composite_Class_Widget_Rec_Ptr is Composite_Class_Rec_Ptr;

    function To_Widget_Class
		(X : in Composite_Class_Rec_Ptr) return Widget_Class;

    function To_Composite_Class (X : in Widget_Class)
				return Composite_Class_Rec_Ptr;

    function To_Widget (X : in Composite_Rec_Ptr) return Widget;

    function To_Composite (X : in Widget) return Composite_Rec_Ptr;
end Xt_Composite_Private;
