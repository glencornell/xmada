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

with X_Configuration_Dependent, X_Lib, Xt, Xt_Composite_Private,
     Xt_Core_Private, Unchecked_Conversion;

use X_Lib, Xt, Xt_Composite_Private, Xt_Core_Private, X_Configuration_Dependent;

package Xt_Constraint_Private is
    use X_Lib.Resource_Manager, Xt.Xt_Ancillary_Types,
	Xt.Xt_Event_Management, Xt.Xt_Translation_Management;

    type Constraint_Part is
	record
	    Empty : Xt_Pointer;  -- No new fields, keep C compiler happy.
	end record;

    Constraint_Part_Size : constant := 32;
    Constraint_Rec_Size : constant := Composite_Rec_Size + Constraint_Part_Size;

    type Constraint_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Composite : Xt_Composite_Private.Composite_Part;
	    Constraint : Constraint_Part;
	end record;

    for Constraint_Rec use
	record
	    Core at 0 range 0 .. Core_Part_Size - 1;
	    Composite at 0 range Core_Part_Boundary .. Composite_Rec_Size - 1;
	    Constraint at 0 range Composite_Rec_Size .. Constraint_Rec_Size - 1;
	end record;

    type Constraint_Rec_Ptr is access Constraint_Rec;
    subtype Constraint_Widget_Rec_Ptr is Constraint_Rec_Ptr;

    type Constraint_Class_Part is
	record
	    Resources : Xt_Resource_List;
	    Num_Resources : Cardinal;   -- Not_Needed by Ada but C wants it.
	    Constraint_Size : Cardinal;
	    Initialize : Xt_Init_Proc;
	    Destroy : Xt_Widget_Proc;
	    Set_Values : Xt_Set_Values_Func;
	    Extension : Xt_Pointer;
	end record;

    for Constraint_Class_Part use
	record
	    Resources at 0 * Word_Size range 0 .. 31;
	    Num_Resources at 1 * Word_Size range 0 .. 31;
	    Constraint_Size at 2 * Word_Size range 0 .. 31;
	    Initialize at 3 * Word_Size range 0 .. 31;
	    Destroy at 4 * Word_Size range 0 .. 31;
	    Set_Values at 5 * Word_Size range 0 .. 31;
	    Extension at 6 * Word_Size range 0 .. 31;
	end record;

    Constraint_Class_Part_Size : constant := 7 * 32;

    type Constraint_Class_Extension_Rec is
	record
	    Next_Extension : Xt_Pointer;
	    Record_Type : Xrm_Quark;
	    Version : Long;
	    Record_Size : Cardinal;
	    Get_Values_Hook : Xt_Args_Proc;
	end record;

    for Constraint_Class_Extension_Rec use
	record
	    Next_Extension at 0 * Word_Size range 0 .. 31;
	    Record_Type at 1 * Word_Size range 0 .. 31;
	    Version at 2 * Word_Size range 0 .. 31;
	    Record_Size at 3 * Word_Size range 0 .. 31;
	    Get_Values_Hook at 4 * Word_Size range 0 .. 31;
	end record;

    Constraint_Class_Extension_Rec_Size : constant := 5 * 32;

    type Constraint_Class_Extension_Ptr is
       access Constraint_Class_Extension_Rec;

    type Constraint_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Composite_Class : Xt_Composite_Private.Composite_Class_Part;
	    Constraint_Class : Constraint_Class_Part;
	end record;

    Constraint_Class_Rec_Size : constant :=
       Composite_Class_Rec_Size + Constraint_Class_Part_Size;

    for Constraint_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Core_Class_Part_Size - 1;
	    Composite_Class at 0
	       range Core_Class_Part_Size .. Composite_Class_Rec_Size - 1;
	    Constraint_Class at 0
	       range Composite_Class_Rec_Size .. Constraint_Class_Rec_Size - 1;
	end record;

    type Constraint_Class_Rec_Ptr is access Constraint_Class_Rec;
    subtype Constraint_Class_Widget_Rec is Constraint_Class_Rec;
    subtype Constraint_Class_Widget_Rec_Ptr is Constraint_Class_Rec_Ptr;

    function To_Widget_Class
		(X : in Constraint_Class_Rec_Ptr) return Widget_Class;

    function To_Constraint_Class (X : in Widget_Class)
				 return Constraint_Class_Rec_Ptr;

    function To_Widget (X : in Constraint_Rec_Ptr) return Widget;

    function To_Constraint (X : in Widget) return Constraint_Rec_Ptr;
end Xt_Constraint_Private;
