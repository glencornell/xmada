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

-- Note to Users!
-- In several places where a unconstrained list is needed in this
-- (and other private widgets) a pointer is used. The pointer points
-- at the first element of the unconstrained list. That bypasses the
-- dope vector that may be at the begining of the array. This is done
-- to match C language information. 
-- if My_List'LENGTH >0 then
--    C_Expects_Pointer_To_List := My_List(My_List'FIRST)'ADDRESS ;
--    C_Expects_List_Length     := My_List'LENGTH;
-- else
--    C_Expects_Pointer_To_List := Null_List_Address;
--    C_Expects_List_Length     := 0;
-- end if;

with X_Configuration_Dependent, X_Lib, Xt, Unchecked_Conversion;

use X_Lib, Xt, X_Configuration_Dependent;

package Xt_Core_Private is
    use X_Lib.Resource_Manager, Xt.Xt_Ancillary_Types,
	Xt.Xt_Event_Management, Xt.Xt_Translation_Management;

    type Core_Part is
	record
	    Self : Widget;
	    Widgetclass : Widget_Class;
	    Parent : Widget;
	    The_Xrm_Name : Xrm_Name;
	    Being_Destroyed : Xt_Boolean;
	    Destroy_Callbacks : Xt_Pointer; -- Xt_Callbacks.Xt_Callback_List_Ptr;
	    Constraints : Xt_Pointer;
	    X : Position;
	    Y : Position;
	    Width : Dimension;
	    Height : Dimension;
	    Border_Width : Dimension;
	    Managed : Xt_Boolean;
	    Sensitive : Xt_Boolean;
	    Ancestor_Sensitive : Xt_Boolean;
	    Event_Table : Xt_Event_Table;
	    Tm : Xt_Tm_Rec;
	    Accelerators : Xt_Translations;
	    Border_Pixel : Pixel;
	    Border_Pixmap : Pixmap;
	    Popup_List : Widget_List_Ptr;
	    Num_Popups : Cardinal;  -- For C compatibility only.
	    Name : Xt_String;
	    My_Screen : Screen;
	    My_Colormap : Colors.Color_Map;
	    My_Window : Window;
	    Depth : Cardinal;
	    Background_Pixel : Pixel;
	    Background_Pixmap : Pixmap;
	    Visible : Xt_Boolean;
	    Mapped_When_Managed : Xt_Boolean;
	    Pad1 : Short;  -- Make it come out even.
	end record;

    for Core_Part use
	record
	    Self at 0 * Word_Size range 0 .. 31;
	    Widgetclass at 1 * Word_Size range 0 .. 31;
	    Parent at 2 * Word_Size range 0 .. 31;
	    The_Xrm_Name at 3 * Word_Size range 0 .. 31;
	    Being_Destroyed at 4 * Word_Size range 0 .. 7;
	    Destroy_Callbacks at 5 * Word_Size range 0 .. 31;
	    Constraints at 6 * Word_Size range 0 .. 31;
	    X at 7 * Word_Size range 0 .. 15;
	    Y at 7 * Word_Size + 2 range 0 .. 15;
	    Width at 8 * Word_Size range 0 .. 15;
	    Height at 8 * Word_Size + 2 range 0 .. 15;
	    Border_Width at 9 * Word_Size range 0 .. 15;
	    Managed at 9 * Word_Size + 2 range 0 .. 7;
	    Sensitive at 9 * Word_Size + 3 range 0 .. 7;
	    Ancestor_Sensitive at 10 * Word_Size range 0 .. 7;
	    Event_Table at 11 * Word_Size range 0 .. 31;
	    Tm at 12 * Word_Size range 0 .. 127;
	    Accelerators at 16 * Word_Size range 0 .. 31;
	    Border_Pixel at 17 * Word_Size range 0 .. 31;
	    Border_Pixmap at 18 * Word_Size range 0 .. 31;
	    Popup_List at 19 * Word_Size range 0 .. 31;
	    Num_Popups at 20 * Word_Size range 0 .. 31;
	    Name at 21 * Word_Size range 0 .. 31;
	    My_Screen at 22 * Word_Size range 0 .. 31;
	    My_Colormap at 23 * Word_Size range 0 .. 31;
	    My_Window at 24 * Word_Size range 0 .. 31;
	    Depth at 25 * Word_Size range 0 .. 31;
	    Background_Pixel at 26 * Word_Size range 0 .. 31;
	    Background_Pixmap at 27 * Word_Size range 0 .. 31;
	    Visible at 28 * Word_Size range 0 .. 7;
	    Mapped_When_Managed at 28 * Word_Size + 1 range 0 .. 7;
	    Pad1 at 28 * Word_Size + 2 range 0 .. 15;
	end record;

    Core_Part_Size : constant := 29 * 32;
    Core_Rec_Size : constant := Core_Part_Size;
    Core_Part_Boundary : constant := Core_Part_Size;


    type Core_Rec is
	record
	    Core : Core_Part;
	end record;
    subtype Widget_Rec is Core_Rec;

    for Core_Rec use
	record
	    Core at 0 range 0 .. Core_Rec_Size - 1;
	end record;

    type Core_Rec_Ptr is access Core_Rec;
    subtype Widget_Rec_Ptr is Core_Rec_Ptr;


    type Core_Class_Part is
	record
	    Superclass : Widget_Class;
	    Class_Name : Xt_String;
	    Widget_Size : Cardinal;
	    Class_Initialize : Xt_Proc;
	    Class_Part_Initialize : Xt_Widget_Class_Proc;
	    Class_Inited : Xt_Enum;
	    Initialize : Xt_Init_Proc;
	    Initialize_Hook : Xt_Args_Proc;
	    Realize : Xt_Realize_Proc;
	    Actions : Xt_Pointer; --  xt_action_list
	    Num_Actions : Cardinal; -- For C 
	    Resources : Xt_Pointer;-- Xt_Resource_List_Ptr;
	    Num_Resources : Cardinal; -- For C 
	    The_Xrm_Class : Xrm_Class;
	    Compress_Motion : Xt_Boolean;
	    Compress_Exposure : Xt_Enum;
	    Compress_Enterleave : Xt_Boolean;
	    Visible_Interest : Xt_Boolean;
	    Destroy : Xt_Widget_Proc;
	    Resize : Xt_Widget_Proc;
	    Expose : Xt_Expose_Proc;
	    Set_Values : Xt_Set_Values_Func;
	    Set_Values_Hook : Xt_Args_Func;
	    Set_Values_Almost : Xt_Almost_Proc;
	    Get_Values_Hook : Xt_Args_Proc;
	    Accept_Focus : Xt_Accept_Focus_Proc;
	    Version : Xt_Version_Type;
	    Callback_Private : Xt_Pointer;
	    Tm_Table : Xt_Pointer; -- Xt_String;
	    Query_Geometry : Xt_Geometry_Handler;
	    Display_Accelerator : Xt_String_Proc;
	    Extension : Xt_Pointer;
	end record;

    for Core_Class_Part use
	record
	    Superclass at 0 * Word_Size range 0 .. 31;
	    Class_Name at 1 * Word_Size range 0 .. 31;
	    Widget_Size at 2 * Word_Size range 0 .. 31;
	    Class_Initialize at 3 * Word_Size range 0 .. 31;
	    Class_Part_Initialize at 4 * Word_Size range 0 .. 31;
	    Class_Inited at 5 * Word_Size range 0 .. 7;
	    Initialize at 6 * Word_Size range 0 .. 31;
	    Initialize_Hook at 7 * Word_Size range 0 .. 31;
	    Realize at 8 * Word_Size range 0 .. 31;
	    Actions at 9 * Word_Size range 0 .. 31;
	    Num_Actions at 10 * Word_Size range 0 .. 31;
	    Resources at 11 * Word_Size range 0 .. 31;
	    Num_Resources at 12 * Word_Size range 0 .. 31;
	    The_Xrm_Class at 13 * Word_Size range 0 .. 31;
	    Compress_Motion at 14 * Word_Size range 0 .. 7;
	    Compress_Exposure at 14 * Word_Size + 1 range 0 .. 7;
	    Compress_Enterleave at 14 * Word_Size + 2 range 0 .. 7;
	    Visible_Interest at 14 * Word_Size + 3 range 0 .. 7;
	    Destroy at 15 * Word_Size range 0 .. 31;
	    Resize at 16 * Word_Size range 0 .. 31;
	    Expose at 17 * Word_Size range 0 .. 31;
	    Set_Values at 18 * Word_Size range 0 .. 31;
	    Set_Values_Hook at 19 * Word_Size range 0 .. 31;
	    Set_Values_Almost at 20 * Word_Size range 0 .. 31;
	    Get_Values_Hook at 21 * Word_Size range 0 .. 31;
	    Accept_Focus at 22 * Word_Size range 0 .. 31;
	    Version at 23 * Word_Size range 0 .. 31;
	    Callback_Private at 24 * Word_Size range 0 .. 31;
	    Tm_Table at 25 * Word_Size range 0 .. 31;
	    Query_Geometry at 26 * Word_Size range 0 .. 31;
	    Display_Accelerator at 27 * Word_Size range 0 .. 31;
	    Extension at 28 * Word_Size range 0 .. 31;
	end record;

    Core_Class_Part_Size : constant := 29 * 32;
    Core_Class_Rec_Size : constant := 29 * 32;


    type Core_Class_Rec is
	record
	    Core_Class : Core_Class_Part;
	end record;

    for Core_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Core_Class_Rec_Size - 1;
	end record;

    subtype Widget_Class_Rec is Core_Class_Rec;

    type Core_Class_Rec_Ptr is access Core_Class_Rec;
    subtype Widget_Class_Rec_Ptr is Core_Class_Rec_Ptr;

    function To_Widget_Class (X : in Core_Class_Rec_Ptr) return Widget_Class;

    function To_Core_Class (X : in Widget_Class) return Core_Class_Rec_Ptr;

    function To_Widget (X : in Core_Rec_Ptr) return Widget;

    function To_Core (X : in Widget) return Core_Rec_Ptr;

-- The following are functions that return symbols that may be
-- used to define inheritance.

    function Xt_Inherit_Translations return Xt_String;
    function Xt_Inherit_Resize return Xt_Widget_Proc;
    function Xt_Inherit_Set_Values_Almost return Xt_Almost_Proc;
    function Xt_Inherit_Query_Geometry return Xt_Geometry_Handler;
    function Xt_Inherit_Realize return Xt_Realize_Proc;
    function Xt_Inherit_Expose return Xt_Expose_Proc;
    function Xt_Inherit_Accept_Focus return Xt_Accept_Focus_Proc;
end Xt_Core_Private;
