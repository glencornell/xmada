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

with Xt, X_Lib, Xaw_Simple;

use Xt, X_Lib, Xaw_Simple;

package Xaw_List is
    Xaw_List_None : constant := -1;

    Xt_C_List : constant String := "List" & Ascii.Nul;
    Xt_C_Spacing : constant String := "Spacing" & Ascii.Nul;
    Xt_C_Columns : constant String := "Columns" & Ascii.Nul;
    Xt_C_Longest : constant String := "Longest" & Ascii.Nul;
    Xt_C_Number_Strings : constant String := "NumberStrings" & Ascii.Nul;

    Xt_N_Cursor : constant String := "cursor" & Ascii.Nul;
    Xt_N_Column_Spacing : constant String := "columnSpacing" & Ascii.Nul;
    Xt_N_Default_Columns : constant String := "defaultColumns" & Ascii.Nul;
    Xt_N_Force_Columns : constant String := "forceColumns" & Ascii.Nul;
    Xt_N_List : constant String := "list" & Ascii.Nul;
    Xt_N_Longest : constant String := "longest" & Ascii.Nul;
    Xt_N_Number_Strings : constant String := "numberStrings" & Ascii.Nul;
    Xt_N_Paste_Buffer : constant String := "pasteBuffer" & Ascii.Nul;
    Xt_N_Row_Spacing : constant String := "rowSpacing" & Ascii.Nul;
    Xt_N_Vertical_List : constant String := "verticalList" & Ascii.Nul;

    subtype List_Widget is Simple_Widget;
    subtype List_Class is Simple_Class;

    type Xaw_List_Return_Struct is
	record
	    Str : Xt_String;
	    Index : X_Integer;
	end record;
    type Xaw_List_Return_Struct_Ptr is access Xaw_List_Return_Struct;

    function List_Widget_Class return List_Class;

    -- XawListChange
    procedure Xaw_List_Change (W : in out Widget;
			       List : in Xt_String_List;
			       Nitems, Longest : in X_Integer;
			       Resize : in Boolean);

    -- XawListHighlight
    procedure Xaw_List_Highlight (W : in Widget; Item : in X_Integer);

    -- XawListUnhighlight
    procedure Xaw_List_Unhighlight (W : in Widget);

    -- XtListShowCurrent
    function Xaw_List_Show_Current (W : in Widget)
				   return Xaw_List_Return_Struct_Ptr;
end Xaw_List;
