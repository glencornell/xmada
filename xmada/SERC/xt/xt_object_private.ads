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

with X_Configuration_Dependent, X_Lib, Xt, Unchecked_Conversion;

use X_Lib, Xt, X_Configuration_Dependent;

package Xt_Object_Private is
    use X_Lib.Resource_Manager, Xt.Xt_Ancillary_Types,
	Xt.Xt_Event_Management, Xt.Xt_Translation_Management;

    type Object_Part is
	record
	    Self : Widget;
	    Widgetclass : Widget_Class;
	    Parent : Widget;
	    The_Xrm_Name : Xrm_Name;
	    Being_Destroyed : Xt_Boolean;
	    Destroy_Callbacks : Xt_Callbacks.Xt_Callback_Struct_Ptr;
	    Constraints : Xt_Pointer;
	end record;
    for Object_Part use
	record
	    Self at 0 * Word_Size range 0 .. 31;
	    Widgetclass at 1 * Word_Size range 0 .. 31;
	    Parent at 2 * Word_Size range 0 .. 31;
	    The_Xrm_Name at 3 * Word_Size range 0 .. 31;
	    Being_Destroyed at 4 * Word_Size range 0 .. 7;
	    Destroy_Callbacks at 5 * Word_Size range 0 .. 31;
	    Constraints at 6 * Word_Size range 0 .. 31;
	end record;

    Object_Part_Size : constant := 7 * 32;
    Object_Rec_Size : constant := 7 * 32;


    type Object_Rec is
	record
	    Object : Object_Part;
	end record;

    type Object_Rec_Ptr is access Object_Rec;

    subtype Object_Widget_Rec is Object_Rec;
    subtype Object_Widget_Rec_Ptr is Object_Rec_Ptr;

    type Object_Class_Part is
	record
	    Superclass : Widget_Class;
	    Class_Name : Xt_String;
	    Widget_Size : Cardinal;
	    Class_Initialize : Xt_Proc;
	    Class_Part_Initialize : Xt_Widget_Class_Proc;
	    Class_Inited : Xt_Enum;
	    Initialize : Xt_Init_Proc;
	    Initialize_Hook : Xt_Args_Proc;
	    Obj1 : Xt_Proc;
	    Obj2 : Xt_Proc;
	    Obj3 : Cardinal;
	    Resources : Xt_Resource_List;
	    Num_Resources : Cardinal;
	    The_Xrm_Class : Xrm_Class;
	    Obj4 : Xt_Boolean;
	    Obj5 : Xt_Boolean;
	    Obj6 : Xt_Boolean;
	    Obj7 : Xt_Boolean;
	    Destroy : Xt_Widget_Proc;
	    Obj8 : Xt_Proc;
	    Obj9 : Xt_Proc;
	    Set_Values : Xt_Set_Values_Func;
	    Set_Values_Hook : Xt_Args_Func;
	    Obj10 : Xt_Proc;
	    Get_Values_Hook : Xt_Args_Proc;
	    Obj11 : Xt_Proc;
	    Version : Xt_Version_Type;
	    Callback_Private : Xt_Pointer;
	    Obj12 : Xt_String;
	    Obj13 : Xt_Proc;
	    Obj14 : Xt_Proc;
	    Extension : Xt_Pointer;
	end record;
    for Object_Class_Part use
	record
	    Superclass at 0 * Word_Size range 0 .. 31;
	    Class_Name at 1 * Word_Size range 0 .. 31;
	    Widget_Size at 2 * Word_Size range 0 .. 31;
	    Class_Initialize at 3 * Word_Size range 0 .. 31;
	    Class_Part_Initialize at 4 * Word_Size range 0 .. 31;
	    Class_Inited at 5 * Word_Size range 0 .. 7;
	    Initialize at 6 * Word_Size range 0 .. 31;
	    Initialize_Hook at 7 * Word_Size range 0 .. 31;
	    Obj1 at 8 * Word_Size range 0 .. 31;
	    Obj2 at 9 * Word_Size range 0 .. 31;
	    Obj3 at 10 * Word_Size range 0 .. 31;
	    Resources at 11 * Word_Size range 0 .. 31;
	    Num_Resources at 12 * Word_Size range 0 .. 31;
	    The_Xrm_Class at 13 * Word_Size range 0 .. 31;
	    Obj4 at 14 * Word_Size + 0 range 0 .. 7;
	    Obj5 at 14 * Word_Size + 1 range 0 .. 7;
	    Obj6 at 14 * Word_Size + 2 range 0 .. 7;
	    Obj7 at 14 * Word_Size + 3 range 0 .. 7;
	    Destroy at 15 * Word_Size range 0 .. 31;
	    Obj8 at 16 * Word_Size range 0 .. 31;
	    Obj9 at 17 * Word_Size range 0 .. 31;
	    Set_Values at 18 * Word_Size range 0 .. 31;
	    Set_Values_Hook at 19 * Word_Size range 0 .. 31;
	    Obj10 at 20 * Word_Size range 0 .. 31;
	    Get_Values_Hook at 21 * Word_Size range 0 .. 31;
	    Obj11 at 22 * Word_Size range 0 .. 31;
	    Version at 23 * Word_Size range 0 .. 31;
	    Callback_Private at 24 * Word_Size range 0 .. 31;
	    Obj12 at 25 * Word_Size range 0 .. 31;
	    Obj13 at 26 * Word_Size range 0 .. 31;
	    Obj14 at 27 * Word_Size range 0 .. 31;
	    Extension at 28 * Word_Size range 0 .. 31;
	end record;

    Object_Class_Size : constant := 29 * 32;
    Object_Class_Rec_Size : constant := 29 * 32;

    type Object_Class_Rec is
	record
	    Object_Class : Object_Class_Part;
	end record;

    type Object_Class_Rec_Ptr is access Object_Class_Rec;

    subtype Object_Class_Widget_Rec_Ptr is Object_Class_Rec_Ptr;
    subtype Object_Class_Widget_Rec is Object_Class_Rec;

    function To_Widget_Class (X : in Object_Class_Rec_Ptr) return Widget_Class;

    function To_Object_Class (X : in Widget_Class) return Object_Class_Rec_Ptr;

    function To_Widget (X : in Object_Rec_Ptr) return Widget;

    function To_Object (X : in Widget) return Object_Rec_Ptr;
end Xt_Object_Private;
