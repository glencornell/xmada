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

with X_Lib, Xt, Xaw_Simple, Xt_Core_Private, X_Configuration_Dependent;

package Xaw_Simple_Private is
    Word_Size : constant := X_Configuration_Dependent.Word_Size;
    type Simple_Class_Part is
	record
	    Change_Sensitive : Xt.Xt_Pointer;
	end record;

    for Simple_Class_Part use
	record
	    Change_Sensitive at 0 * Word_Size range 0 .. 31;
	end record;

    Simple_Class_Part_Size : constant := 32;
    Simple_Class_Rec_Size : constant :=
       Xt_Core_Private.Core_Class_Part_Size + Simple_Class_Part_Size;

    type Simple_Class_Rec is
	record
	    Core_Class : Xt_Core_Private.Core_Class_Part;
	    Simple_Class : Simple_Class_Part;
	end record;

    for Simple_Class_Rec use
	record
	    Core_Class at 0 range 0 .. Xt_Core_Private.Core_Class_Rec_Size - 1;
	    Simple_Class at 0 range Xt_Core_Private.Core_Class_Rec_Size ..
				       Simple_Class_Rec_Size - 1;
	end record;

    type Simple_Part is
	record
	    Cursor : X_Lib.Cursors.Cursor;
	    Insensitive_Border : X_Lib.Pixmap;
	    Cursor_Name : X_Lib.String_Pointer;
	    Pointer_Fg : X_Lib.Pixel;
	end record;

    for Simple_Part use
	record
	    Cursor at 0 * Word_Size range 0 .. 31;
	    Insensitive_Border at 1 * Word_Size range 0 .. 31;
	    Cursor_Name at 2 * Word_Size range 0 .. 31;
	    Pointer_Fg at 3 * Word_Size range 0 .. 31;
	end record;

    Simple_Part_Size : constant := 4 * 32;
    Simple_Rec_Size : constant :=
       Xt_Core_Private.Core_Part_Size + Simple_Part_Size;

    type Simple_Rec is
	record
	    Core : Xt_Core_Private.Core_Part;
	    Simple : Simple_Part;
	end record;

    for Simple_Rec use
	record
	    Core at 0 range 0 .. Xt_Core_Private.Core_Part_Size - 1;
	    Simple at 0
	       range Xt_Core_Private.Core_Part_Size .. Simple_Rec_Size - 1;
	end record;

    type Simple_Class_Rec_Ptr is access Simple_Class_Rec;
    type Simple_Rec_Ptr is access Simple_Rec;

    subtype Xt_Inherit_Change_Sensitive is X_Lib.X_Address;

    -- functions for conversions.

    function To_Widget_Class
		(X : in Simple_Class_Rec_Ptr) return Xt.Widget_Class;

    function To_Simple_Class (X : in Xt.Widget_Class)
			     return Simple_Class_Rec_Ptr;

    function To_Widget (X : in Simple_Rec_Ptr) return Xt.Widget;

    function To_Simple (X : in Xt.Widget) return Simple_Rec_Ptr;
end Xaw_Simple_Private;
