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
     Xt_Object_Private, Unchecked_Conversion;

use X_Lib, Xt, Xt_Object_Private, X_Configuration_Dependent;

package Xt_Rect_Object_Private is
    use X_Lib.Resource_Manager, Xt.Xt_Ancillary_Types,
	Xt.Xt_Event_Management, Xt.Xt_Translation_Management;

    type Rect_Obj_Part is
	record
	    X : Position;
	    Y : Position;
	    Width : Dimension;
	    Height : Dimension;
	    Border_Width : Dimension;
	    Managed : Xt_Boolean;
	    Sensitive : Xt_Boolean;
	    Ancestor_Sensitive : Xt_Boolean;
	    Dummy : Card8;
	end record;

    for Rect_Obj_Part use
	record
	    X at 0 * Word_Size range 0 .. 15;
	    Y at 0 * Word_Size + 2 range 0 .. 15;
	    Width at 1 * Word_Size range 0 .. 15;
	    Height at 1 * Word_Size + 2 range 0 .. 15;
	    Border_Width at 2 * Word_Size range 0 .. 15;
	    Managed at 2 * Word_Size + 2 range 0 .. 7;
	    Sensitive at 2 * Word_Size + 3 range 0 .. 7;
	    Ancestor_Sensitive at 3 * Word_Size range 0 .. 7;
	    Dummy at 3 * Word_Size + 3 range 0 .. 7;
	end record;

    -- 1 can not handle 3 part arithmatic.
    Rect_Obj_Part_Size : constant := 8 * 16;
    Rect_Obj_Rec_Size : constant := Object_Part_Size + Rect_Obj_Part_Size;
    type Rect_Obj_Rec is
	record
	    Object_Part : Xt_Object_Private.Object_Part;
	    Rect_Object_Part : Rect_Obj_Part;
	end record;

    for Rect_Obj_Rec use
	record
	    Object_Part at 0 range 0 .. Object_Part_Size - 1;
	    Rect_Object_Part at 0
	       range Object_Part_Size .. Rect_Obj_Rec_Size - 1;
	end record;

    type Rect_Obj_Rec_Ptr is access Rect_Obj_Rec;

    subtype Rect_Obj_Widget_Rec_Ptr is Rect_Obj_Rec_Ptr;
    subtype Rect_Obj_Widget_Rec is Rect_Obj_Rec;

    type Rect_Obj_Class_Part is
	record
	    Superclass : Widget_Class;
	    Class_Name : Xt_String;
	    Widget_Size : Cardinal;
	    Class_Initialize : Xt_Proc;
	    Class_Part_Initialize : Xt_Widget_Class_Proc;
	    Class_Inited : Xt_Enum;
	    Initialize : Xt_Init_Proc;
	    Initialize_Hook : Xt_Args_Proc;
	    Rect1 : Xt_Proc;
	    Rect2 : Xt_Proc;
	    Rect3 : Cardinal;
	    Resources : Xt_Resource_List;
	    Num_Resources : Cardinal;
	    The_Xrm_Class : Xrm_Class;
	    Rect4 : Xt_Boolean;
	    Rect5 : Xt_Boolean;
	    Rect6 : Xt_Boolean;
	    Rect7 : Xt_Boolean;
	    Destroy : Xt_Widget_Proc;
	    Resize : Xt_Widget_Proc;
	    Expose : Xt_Expose_Proc;
	    Set_Values : Xt_Set_Values_Func;
	    Set_Values_Hook : Xt_Args_Func;
	    Set_Values_Almost : Xt_Almost_Proc;
	    Get_Values_Hook : Xt_Args_Proc;
	    Rect9 : Xt_Proc;
	    Version : Xt_Version_Type;
	    Callback_Private : Xt_Pointer;
	    Rect10 : Xt_String;
	    Query_Geometry : Xt_Geometry_Handler;
	    Rect11 : Xt_Proc;
	    Extension : Xt_Pointer;
	end record;

    for Rect_Obj_Class_Part use
	record
	    Superclass at 0 * Word_Size range 0 .. 31;
	    Class_Name at 1 * Word_Size range 0 .. 31;
	    Widget_Size at 2 * Word_Size range 0 .. 31;
	    Class_Initialize at 3 * Word_Size range 0 .. 31;
	    Class_Part_Initialize at 4 * Word_Size range 0 .. 31;
	    Class_Inited at 5 * Word_Size range 0 .. 7;
	    Initialize at 6 * Word_Size range 0 .. 31;
	    Initialize_Hook at 7 * Word_Size range 0 .. 31;
	    Rect1 at 8 * Word_Size range 0 .. 31;
	    Rect2 at 9 * Word_Size range 0 .. 31;
	    Rect3 at 10 * Word_Size range 0 .. 31;
	    Resources at 11 * Word_Size range 0 .. 31;
	    Num_Resources at 12 * Word_Size range 0 .. 31;
	    The_Xrm_Class at 13 * Word_Size range 0 .. 31;
	    Rect4 at 14 * Word_Size + 0 range 0 .. 7;
	    Rect5 at 14 * Word_Size + 1 range 0 .. 7;
	    Rect6 at 14 * Word_Size + 2 range 0 .. 7;
	    Rect7 at 14 * Word_Size + 3 range 0 .. 7;
	    Destroy at 15 * Word_Size range 0 .. 31;
	    Resize at 16 * Word_Size range 0 .. 31;
	    Expose at 17 * Word_Size range 0 .. 31;
	    Set_Values at 18 * Word_Size range 0 .. 31;
	    Set_Values_Hook at 19 * Word_Size range 0 .. 31;
	    Set_Values_Almost at 20 * Word_Size range 0 .. 31;
	    Get_Values_Hook at 21 * Word_Size range 0 .. 31;
	    Rect9 at 22 * Word_Size range 0 .. 31;
	    Version at 23 * Word_Size range 0 .. 31;
	    Callback_Private at 24 * Word_Size range 0 .. 31;
	    Rect10 at 25 * Word_Size range 0 .. 31;
	    Query_Geometry at 26 * Word_Size range 0 .. 31;
	    Rect11 at 27 * Word_Size range 0 .. 31;
	    Extension at 28 * Word_Size range 0 .. 31;
	end record;

    Rect_Obj_Class_Size : constant := 29 * 32;
    Rect_Obj_Class_Rec_Size : constant := Rect_Obj_Class_Size;

    type Rect_Obj_Class_Rec is
	record
	    Rect_Class : Rect_Obj_Class_Part;
	end record;

    for Rect_Obj_Class_Rec use
	record
	    Rect_Class at 0 range 0 .. Rect_Obj_Class_Size - 1;
	end record;

    type Rect_Obj_Class_Rec_Ptr is access Rect_Obj_Class_Rec;

    subtype Rect_Obj_Class_Widget_Rec_Ptr is Rect_Obj_Class_Rec_Ptr;
    subtype Rect_Obj_Class_Widget_Rec is Rect_Obj_Class_Rec;

    function To_Widget_Class
		(X : in Rect_Obj_Class_Rec_Ptr) return Widget_Class;

    function To_Rect_Obj_Class (X : in Widget_Class)
			       return Rect_Obj_Class_Rec_Ptr;

    function To_Widget (X : in Rect_Obj_Rec_Ptr) return Widget;

    function To_Rect_Obj (X : in Widget) return Rect_Obj_Rec_Ptr;
end Xt_Rect_Object_Private;
