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

with Xt, Xt_Shell;

use Xt, Xt_Shell;

package Xaw_Simple_Menu is
    Xt_N_Cursor : constant String := "cursor" & Ascii.Nul;
    Xt_N_Bottom_Margin : constant String := "bottomMargin" & Ascii.Nul;
    Xt_N_Column_Width : constant String := "columnWidth" & Ascii.Nul;
    Xt_N_Label_Class : constant String := "labelClass" & Ascii.Nul;
    Xt_N_Menu_On_Screen : constant String := "menuOnScreen" & Ascii.Nul;
    Xt_N_Popup_On_Entry : constant String := "popupOnEntry" & Ascii.Nul;
    Xt_N_Row_Height : constant String := "rowHeight" & Ascii.Nul;
    Xt_N_Top_Margin : constant String := "topMargin" & Ascii.Nul;

    Xt_C_Column_Width : constant String := "ColumnWidth" & Ascii.Nul;
    Xt_C_Label_Class : constant String := "LabelClass" & Ascii.Nul;
    Xt_C_Menu_On_Screen : constant String := "MenuOnScreen" & Ascii.Nul;
    Xt_C_Popup_On_Entry : constant String := "PopupOnEntry" & Ascii.Nul;
    Xt_C_Row_Height : constant String := "RowHeight" & Ascii.Nul;
    Xt_C_Vertical_Margins : constant String := "VerticalMargins" & Ascii.Nul;

    subtype Simple_Menu_Widget is Override_Shell_Widget;
    subtype Simple_Menu_Class is Override_Shell_Class;

    function Simple_Menu_Widget_Class return Simple_Menu_Class;

    procedure Xaw_Simple_Menu_Add_Global_Actions
		 (App_Con : in out Xt_App_Context);

    function Xaw_Simple_Menu_Get_Active_Entry (W : in Widget) return Widget;

    function Xaw_Simple_Menu_Clear_Active_Entry (W : in Widget) return Widget;
end Xaw_Simple_Menu;
