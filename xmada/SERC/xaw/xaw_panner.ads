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

with Xt, Xaw_Simple;

use Xt, Xaw_Simple;

package Xaw_Panner is
    Xt_N_Allow_Off : constant String := "allowOff" & Ascii.Nul;
    Xt_C_Allow_Off : constant String := "AllowOff" & Ascii.Nul;
    Xt_N_Background_Stipple : constant String :=
       "backgroundStipple" & Ascii.Nul;
    Xt_C_Background_Stipple : constant String :=
       "BackgroundStipple" & Ascii.Nul;
    Xt_N_Default_Scale : constant String := "defaultScale" & Ascii.Nul;
    Xt_C_Default_Scale : constant String := "DefaultScale" & Ascii.Nul;
    Xt_N_Canvas_Width : constant String := "canvasWidth" & Ascii.Nul;
    Xt_C_Canvas_Width : constant String := "CanvasWidth" & Ascii.Nul;
    Xt_N_Canvas_Height : constant String := "canvasHeight" & Ascii.Nul;
    Xt_C_Canvas_Height : constant String := "CanvasHeight" & Ascii.Nul;
    Xt_N_Internal_Space : constant String := "internalSpace" & Ascii.Nul;
    Xt_C_Internal_Space : constant String := "InternalSpace" & Ascii.Nul;
    Xt_N_Line_Width : constant String := "lineWidth" & Ascii.Nul;
    Xt_C_Line_Width : constant String := "LineWidth" & Ascii.Nul;
    Xt_N_Rubber_Band : constant String := "rubberBand" & Ascii.Nul;
    Xt_C_Rubber_Band : constant String := "RubberBand" & Ascii.Nul;
    Xt_N_Shadow_Thickness : constant String := "shadowThickness" & Ascii.Nul;
    Xt_C_Shadow_Thickness : constant String := "ShadowThickness" & Ascii.Nul;
    Xt_N_Shadow_Color : constant String := "shadowColor" & Ascii.Nul;
    Xt_C_Shadow_Color : constant String := "ShadowColor" & Ascii.Nul;
    Xt_N_Slider_X : constant String := "sliderX" & Ascii.Nul;
    Xt_C_Slider_X : constant String := "SliderX" & Ascii.Nul;
    Xt_N_Slider_Y : constant String := "sliderY" & Ascii.Nul;
    Xt_C_Slider_Y : constant String := "SliderY" & Ascii.Nul;
    Xt_N_Slider_Width : constant String := "sliderWidth" & Ascii.Nul;
    Xt_C_Slider_Width : constant String := "SliderWidth" & Ascii.Nul;
    Xt_N_Slider_Height : constant String := "sliderHeight" & Ascii.Nul;
    Xt_C_Slider_Height : constant String := "SliderHeight" & Ascii.Nul;

    subtype Panner_Widget is Simple_Widget;
    subtype Panner_Class is Simple_Class;

    function Panner_Widget_Class return Panner_Class;
end Xaw_Panner;
