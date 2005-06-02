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

with Xt, Xaw_Command;

use Xt, Xaw_Command;

package Xaw_Toggle is
    Xt_C_Widget : constant String := "Widget" & Ascii.Nul;
    Xt_C_State : constant String := "State" & Ascii.Nul;
    Xt_C_Radio_Group : constant String := "RadioGroup" & Ascii.Nul;
    Xt_C_Radio_Data : constant String := "RadioData" & Ascii.Nul;

    Xt_N_Radio_Group : constant String := "radioGroup" & Ascii.Nul;
    Xt_N_Radio_Data : constant String := "radioData" & Ascii.Nul;
    Xt_N_State : constant String := "state" & Ascii.Nul;

    subtype Toggle_Widget is Command_Widget;
    subtype Toggle_Class is Command_Class;

    function Toggle_Widget_Class return Toggle_Class;

    procedure Xaw_Toggle_Change_Radio_Group
		 (W : in Widget; Radio_Group : in out Widget);

    function Xaw_Toggle_Get_Current (Radio_Group : in Widget) return Xt_Pointer;

    procedure Xaw_Toggle_Set_Current
		 (Radio_Group : in out Widget; Radio_Data : in Xt_Pointer);

    procedure Xaw_Toggle_Unset_Current (Radio_Group : in out Widget);
end Xaw_Toggle;
