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

package Xaw_Repeater is
    Xt_N_Decay : constant String := "decay" & Ascii.Nul;
    Xt_C_Decay : constant String := "Decay" & Ascii.Nul;
    Xt_N_Initial_Delay : constant String := "initialDelay" & Ascii.Nul;
    Xt_C_Delay : constant String := "Delay" & Ascii.Nul;
    Xt_N_Minimum_Delay : constant String := "minimumDelay" & Ascii.Nul;
    Xt_C_Minimum_Delay : constant String := "MinimumDelay" & Ascii.Nul;
    Xt_N_Repeat_Delay : constant String := "repeatDelay" & Ascii.Nul;
    Xt_N_Flash : constant String := "flash" & Ascii.Nul;
    Xt_N_Start_Callback : constant String := "startCallback" & Ascii.Nul;
    Xt_C_Start_Callback : constant String := "StartCallback" & Ascii.Nul;
    Xt_N_Stop_Callback : constant String := "stopCallback" & Ascii.Nul;
    Xt_C_Stop_Callback : constant String := "StopCallback" & Ascii.Nul;

    subtype Repeater_Widget is Command_Widget;
    subtype Repeater_Class is Command_Class;

    function Repeater_Widget_Class return Repeater_Class;
end Xaw_Repeater;
