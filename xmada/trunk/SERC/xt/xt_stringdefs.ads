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

package Xt_Stringdefs is
    -- Resource name constants:

    Xt_N_Argc : constant String := "argc" & Ascii.Nul;
    Xt_N_Argv : constant String := "argv" & Ascii.Nul;
    Xt_N_Accelerators : constant String := "accelerators" & Ascii.Nul;
    Xt_N_Allow_Horiz : constant String := "allowHoriz" & Ascii.Nul;
    Xt_N_Allow_Vert : constant String := "allowVert" & Ascii.Nul;
    Xt_N_Allow_Shell_Resize : constant String := "allowShellResize" & Ascii.Nul;
    Xt_N_Ancestor_Sensitive : constant String :=
       "ancestorSensitive" & Ascii.Nul;
    Xt_N_Background : constant String := "background" & Ascii.Nul;
    Xt_N_Background_Pixmap : constant String := "backgroundPixmap" & Ascii.Nul;
    Xt_N_Base_Height : constant String := "baseHeight" & Ascii.Nul;
    Xt_N_Base_Width : constant String := "baseWidth" & Ascii.Nul;
    Xt_N_Bitmap : constant String := "bitmap" & Ascii.Nul;
    Xt_N_Border_Color : constant String := "borderColor" & Ascii.Nul;
    Xt_N_Border : constant String := "borderColor" & Ascii.Nul;
    Xt_N_Border_Pixmap : constant String := "borderPixmap" & Ascii.Nul;
    Xt_N_Border_Width : constant String := "borderWidth" & Ascii.Nul;
    Xt_N_Callback : constant String := "callback" & Ascii.Nul;
    Xt_N_Children : constant String := "children" & Ascii.Nul;
    Xt_N_Colormap : constant String := "colormap" & Ascii.Nul;
    Xt_N_Create_Popup_Child_Proc : constant String :=
       "createPopupChildProc" & Ascii.Nul;
    Xt_N_Depth : constant String := "depth" & Ascii.Nul;
    Xt_N_Destroy_Callback : constant String := "destroyCallback" & Ascii.Nul;
    Xt_N_Edit_Type : constant String := "editType" & Ascii.Nul;
    Xt_N_File : constant String := "file" & Ascii.Nul;
    Xt_N_Font : constant String := "font" & Ascii.Nul;
    Xt_N_Force_Bars : constant String := "forceBars" & Ascii.Nul;
    Xt_N_Foreground : constant String := "foreground" & Ascii.Nul;
    Xt_N_Function : constant String := "function" & Ascii.Nul;
    Xt_N_Geometry : constant String := "geometry" & Ascii.Nul;
    Xt_N_Height : constant String := "height" & Ascii.Nul;
    Xt_N_Height_Inc : constant String := "heightInc" & Ascii.Nul;
    Xt_N_Highlight : constant String := "highlight" & Ascii.Nul;
    Xt_N_H_Space : constant String := "hSpace" & Ascii.Nul;
    Xt_N_Icon_Name : constant String := "iconName" & Ascii.Nul;
    Xt_N_Icon_Name_Encoding : constant String := "iconNameEncoding" & Ascii.Nul;
    Xt_N_Icon_Mask : constant String := "iconMask" & Ascii.Nul;
    Xt_N_Icon_Pixmap : constant String := "iconPixmap" & Ascii.Nul;
    Xt_N_Icon_Window : constant String := "iconWindow" & Ascii.Nul;
    Xt_N_Icon_X : constant String := "iconX" & Ascii.Nul;
    Xt_N_Icon_Y : constant String := "iconY" & Ascii.Nul;
    Xt_N_Iconic : constant String := "iconic" & Ascii.Nul;
    Xt_N_Index : constant String := "index" & Ascii.Nul;
    Xt_N_Initial_Resources_Persistent : constant String :=
       "initialResourcesPersistent" & Ascii.Nul;
    Xt_N_Initial_State : constant String := "initialState" & Ascii.Nul;
    Xt_N_Input : constant String := "input" & Ascii.Nul;
    Xt_N_Inner_Height : constant String := "innerHeight" & Ascii.Nul;
    Xt_N_Inner_Width : constant String := "innerWidth" & Ascii.Nul;
    Xt_N_Inner_Window : constant String := "innerWindow" & Ascii.Nul;
    Xt_N_Insert_Position : constant String := "insertPosition" & Ascii.Nul;
    Xt_N_Internal_Height : constant String := "internalHeight" & Ascii.Nul;
    Xt_N_Internal_Width : constant String := "internalWidth" & Ascii.Nul;
    Xt_N_Jump_Proc : constant String := "jumpProc" & Ascii.Nul;
    Xt_N_Justify : constant String := "justify" & Ascii.Nul;
    Xt_N_Knob_Height : constant String := "knobHeight" & Ascii.Nul;
    Xt_N_Knob_Indent : constant String := "knobIndent" & Ascii.Nul;
    Xt_N_Knob_Pixel : constant String := "knobPixel" & Ascii.Nul;
    Xt_N_Knob_Width : constant String := "knobWidth" & Ascii.Nul;
    Xt_N_Label : constant String := "label" & Ascii.Nul;
    Xt_N_Length : constant String := "length" & Ascii.Nul;
    Xt_N_Lower_Right : constant String := "lowerRight" & Ascii.Nul;
    Xt_N_Mapped_When_Managed : constant String :=
       "mappedWhenManaged" & Ascii.Nul;
    Xt_N_Max_Aspect_X : constant String := "maxAspectX" & Ascii.Nul;
    Xt_N_Max_Aspect_Y : constant String := "maxAspectY" & Ascii.Nul;
    Xt_N_Max_Height : constant String := "maxHeight" & Ascii.Nul;
    Xt_N_Max_Width : constant String := "maxWidth" & Ascii.Nul;
    Xt_N_Menu_Entry : constant String := "menuEntry" & Ascii.Nul;
    Xt_N_Min_Aspect_X : constant String := "minAspectX" & Ascii.Nul;
    Xt_N_Min_Aspect_Y : constant String := "minAspectY" & Ascii.Nul;
    Xt_N_Min_Height : constant String := "minHeight" & Ascii.Nul;
    Xt_N_Min_Width : constant String := "minWidth" & Ascii.Nul;
    Xt_N_Name : constant String := "name" & Ascii.Nul;
    Xt_N_Notify : constant String := "notify" & Ascii.Nul;
    Xt_N_Num_Children : constant String := "numChildren" & Ascii.Nul;
    Xt_N_Orientation : constant String := "orientation" & Ascii.Nul;
    Xt_N_Override_Redirect : constant String := "overrideRedirect" & Ascii.Nul;
    Xt_N_Parameter : constant String := "parameter" & Ascii.Nul;
    Xt_N_Pixmap : constant String := "pixmap" & Ascii.Nul;
    Xt_N_Popup_Callback : constant String := "popupCallback" & Ascii.Nul;
    Xt_N_Popdown_Callback : constant String := "popdownCallback" & Ascii.Nul;
    Xt_N_Resize : constant String := "resize" & Ascii.Nul;
    Xt_N_Reverse_Video : constant String := "reverseVideo" & Ascii.Nul;
    Xt_N_Save_Under : constant String := "saveUnder" & Ascii.Nul;
    Xt_N_Screen : constant String := "screen" & Ascii.Nul;
    Xt_N_Scroll_Proc : constant String := "scrollProc" & Ascii.Nul;
    Xt_N_Scroll_D_Cursor : constant String := "scrollDCursor" & Ascii.Nul;
    Xt_N_Scroll_H_Cursor : constant String := "scrollHCursor" & Ascii.Nul;
    Xt_N_Scroll_L_Cursor : constant String := "scrollLCursor" & Ascii.Nul;
    Xt_N_Scroll_R_Cursor : constant String := "scrollRCursor" & Ascii.Nul;
    Xt_N_Scroll_U_Cursor : constant String := "scrollUCursor" & Ascii.Nul;
    Xt_N_Scroll_V_Cursor : constant String := "scrollVCursor" & Ascii.Nul;
    Xt_N_Selection : constant String := "selection" & Ascii.Nul;
    Xt_N_Selection_Array : constant String := "selectionArray" & Ascii.Nul;
    Xt_N_Sensitive : constant String := "sensitive" & Ascii.Nul;
    Xt_N_Shown : constant String := "shown" & Ascii.Nul;
    Xt_N_Space : constant String := "space" & Ascii.Nul;
    Xt_N_String : constant String := "string" & Ascii.Nul;
    Xt_N_Text_Options : constant String := "textOptions" & Ascii.Nul;
    Xt_N_Text_Sink : constant String := "textSink" & Ascii.Nul;
    Xt_N_Text_Source : constant String := "textSource" & Ascii.Nul;
    Xt_N_Thickness : constant String := "thickness" & Ascii.Nul;
    Xt_N_Thumb : constant String := "thumb" & Ascii.Nul;
    Xt_N_Thumb_Proc : constant String := "thumbProc" & Ascii.Nul;
    Xt_N_Title : constant String := "title" & Ascii.Nul;
    Xt_N_Title_Encoding : constant String := "titleEncoding" & Ascii.Nul;
    Xt_N_Top : constant String := "top" & Ascii.Nul;
    Xt_N_Transient : constant String := "transient" & Ascii.Nul;
    Xt_N_Transient_For : constant String := "transientFor" & Ascii.Nul;
    Xt_N_Translations : constant String := "translations" & Ascii.Nul;
    Xt_N_Unrealize_Callback : constant String :=
       "unrealizeCallback" & Ascii.Nul;
    Xt_N_Update : constant String := "update" & Ascii.Nul;
    Xt_N_Use_Bottom : constant String := "useBottom" & Ascii.Nul;
    Xt_N_Use_Right : constant String := "useRight" & Ascii.Nul;
    Xt_N_Value : constant String := "value" & Ascii.Nul;
    Xt_N_Visual : constant String := "visual" & Ascii.Nul;
    Xt_N_V_Space : constant String := "vSpace" & Ascii.Nul;
    Xt_N_Wait_For_Wm : constant String := "waitforwm" & Ascii.Nul;
    Xt_N_Width : constant String := "width" & Ascii.Nul;
    Xt_N_Width_Inc : constant String := "widthInc" & Ascii.Nul;
    Xt_N_Win_Gravity : constant String := "winGravity" & Ascii.Nul;
    Xt_N_Window : constant String := "window" & Ascii.Nul;
    Xt_N_Window_Group : constant String := "windowGroup" & Ascii.Nul;
    Xt_N_Wm_Timeout : constant String := "wmTimeout" & Ascii.Nul;
    Xt_N_X : constant String := "x" & Ascii.Nul;
    Xt_N_Y : constant String := "y" & Ascii.Nul;

    -- Resource class constants:

    Xt_C_Allow_Shell_Resize : constant String := "AllowShellResize" & Ascii.Nul;
    Xt_C_Accelerators : constant String := "Accelerators" & Ascii.Nul;
    Xt_C_Argc : constant String := "Argc" & Ascii.Nul;
    Xt_C_Argv : constant String := "Argv" & Ascii.Nul;
    Xt_C_Background : constant String := "Background" & Ascii.Nul;
    Xt_C_Base_Height : constant String := "BaseHeight" & Ascii.Nul;
    Xt_C_Base_Width : constant String := "BaseWidth" & Ascii.Nul;
    Xt_C_Bitmap : constant String := "Bitmap" & Ascii.Nul;
    Xt_C_Boolean : constant String := "Boolean" & Ascii.Nul;
    Xt_C_Border_Color : constant String := "BorderColor" & Ascii.Nul;
    Xt_C_Border_Width : constant String := "BorderWidth" & Ascii.Nul;
    Xt_C_Callback : constant String := "Callback" & Ascii.Nul;
    Xt_C_Colormap : constant String := "Colormap" & Ascii.Nul;
    Xt_C_Color : constant String := "Color" & Ascii.Nul;
    Xt_C_Create_Popup_Child_Proc : constant String :=
       "CreatePopupChildProc" & Ascii.Nul;
    Xt_C_Cursor : constant String := "Cursor" & Ascii.Nul;
    Xt_C_Depth : constant String := "Depth" & Ascii.Nul;
    Xt_C_Edit_Type : constant String := "EditType" & Ascii.Nul;
    Xt_C_Event_Bindings : constant String := "EventBindings" & Ascii.Nul;
    Xt_C_File : constant String := "File" & Ascii.Nul;
    Xt_C_Font : constant String := "Font" & Ascii.Nul;
    Xt_C_Foreground : constant String := "Foreground" & Ascii.Nul;
    Xt_C_Fraction : constant String := "Fraction" & Ascii.Nul;
    Xt_C_Function : constant String := "Function" & Ascii.Nul;
    Xt_C_Geometry : constant String := "Geometry" & Ascii.Nul;
    Xt_C_Height : constant String := "Height" & Ascii.Nul;
    Xt_C_Height_Inc : constant String := "HeightInc" & Ascii.Nul;
    Xt_C_H_Space : constant String := "HSpace" & Ascii.Nul;
    Xt_C_Icon_Name : constant String := "IconName" & Ascii.Nul;
    Xt_C_Icon_Name_Encoding : constant String := "IconNameEncoding" & Ascii.Nul;
    Xt_C_Icon_Mask : constant String := "IconMask" & Ascii.Nul;
    Xt_C_Icon_Pixmap : constant String := "IconPixmap" & Ascii.Nul;
    Xt_C_Icon_Window : constant String := "IconWindow" & Ascii.Nul;
    Xt_C_Icon_X : constant String := "IconX" & Ascii.Nul;
    Xt_C_Icon_Y : constant String := "IconY" & Ascii.Nul;
    Xt_C_Iconic : constant String := "Iconic" & Ascii.Nul;
    Xt_C_Index : constant String := "Index" & Ascii.Nul;
    Xt_C_Initial_Resources_Persistent : constant String :=
       "InitialResourcesPersistent" & Ascii.Nul;
    Xt_C_Initial_State : constant String := "InitialState" & Ascii.Nul;
    Xt_C_Input : constant String := "Input" & Ascii.Nul;
    Xt_C_Insert_Position : constant String := "InsertPosition" & Ascii.Nul;
    Xt_C_Interval : constant String := "Interval" & Ascii.Nul;
    Xt_C_Justify : constant String := "Justify" & Ascii.Nul;
    Xt_C_Knob_Indent : constant String := "KnobIndent" & Ascii.Nul;
    Xt_C_Knob_Pixel : constant String := "KnobPixel" & Ascii.Nul;
    Xt_C_Label : constant String := "Label" & Ascii.Nul;
    Xt_C_Length : constant String := "Length" & Ascii.Nul;
    Xt_C_Mapped_When_Managed : constant String :=
       "MappedWhenManaged" & Ascii.Nul;
    Xt_C_Margin : constant String := "Margin" & Ascii.Nul;
    Xt_C_Max_Aspect_X : constant String := "MaxAspectX" & Ascii.Nul;
    Xt_C_Max_Aspect_Y : constant String := "MaxAspectY" & Ascii.Nul;
    Xt_C_Max_Height : constant String := "MaxHeight" & Ascii.Nul;
    Xt_C_Max_Width : constant String := "MaxWidth" & Ascii.Nul;
    Xt_C_Menu_Entry : constant String := "MenuEntry" & Ascii.Nul;
    Xt_C_Min_Aspect_X : constant String := "MinAspectX" & Ascii.Nul;
    Xt_C_Min_Aspect_Y : constant String := "MinAspectY" & Ascii.Nul;
    Xt_C_Min_Height : constant String := "MinHeight" & Ascii.Nul;
    Xt_C_Min_Width : constant String := "MinWidth" & Ascii.Nul;
    Xt_C_Notify : constant String := "Notify" & Ascii.Nul;
    Xt_C_Orientation : constant String := "Orientation" & Ascii.Nul;
    Xt_C_Override_Redirect : constant String := "OverrideRedirect" & Ascii.Nul;
    Xt_C_Parameter : constant String := "Parameter" & Ascii.Nul;
    Xt_C_Pixmap : constant String := "Pixmap" & Ascii.Nul;
    Xt_C_Position : constant String := "Position" & Ascii.Nul;
    Xt_C_Read_Only : constant String := "ReadOnly" & Ascii.Nul;
    Xt_C_Resize : constant String := "Resize" & Ascii.Nul;
    Xt_C_Reverse_Video : constant String := "ReverseVideo" & Ascii.Nul;
    Xt_C_Save_Under : constant String := "SaveUnder" & Ascii.Nul;
    Xt_C_Screen : constant String := "Screen" & Ascii.Nul;
    Xt_C_Scroll_Proc : constant String := "ScrollProc" & Ascii.Nul;
    Xt_C_Scroll_D_Cursor : constant String := "ScrollDCursor" & Ascii.Nul;
    Xt_C_Scroll_H_Cursor : constant String := "ScrollHCursor" & Ascii.Nul;
    Xt_C_Scroll_L_Cursor : constant String := "ScrollLCursor" & Ascii.Nul;
    Xt_C_Scroll_R_Cursor : constant String := "ScrollRCursor" & Ascii.Nul;
    Xt_C_Scroll_U_Cursor : constant String := "ScrollUCursor" & Ascii.Nul;
    Xt_C_Scroll_V_Cursor : constant String := "ScrollVCursor" & Ascii.Nul;
    Xt_C_Selection : constant String := "Selection" & Ascii.Nul;
    Xt_C_Sensitive : constant String := "Sensitive" & Ascii.Nul;
    Xt_C_Selection_Array : constant String := "SelectionArray" & Ascii.Nul;
    Xt_C_Space : constant String := "Space" & Ascii.Nul;
    Xt_C_String : constant String := "String" & Ascii.Nul;
    Xt_C_Text_Options : constant String := "TextOptions" & Ascii.Nul;
    Xt_C_Text_Position : constant String := "TextPosition" & Ascii.Nul;
    Xt_C_Text_Sink : constant String := "TextSink" & Ascii.Nul;
    Xt_C_Text_Source : constant String := "TextSource" & Ascii.Nul;
    Xt_C_Thickness : constant String := "Thickness" & Ascii.Nul;
    Xt_C_Thumb : constant String := "Thumb" & Ascii.Nul;
    Xt_C_Title : constant String := "Title" & Ascii.Nul;
    Xt_C_Title_Encoding : constant String := "TitleEncoding" & Ascii.Nul;
    Xt_C_Transient : constant String := "Transient" & Ascii.Nul;
    Xt_C_Transient_For : constant String := "TransientFor" & Ascii.Nul;
    Xt_C_Translations : constant String := "Translations" & Ascii.Nul;
    Xt_C_Value : constant String := "Value" & Ascii.Nul;
    Xt_C_Visual : constant String := "Visual" & Ascii.Nul;
    Xt_C_V_Space : constant String := "VSpace" & Ascii.Nul;
    Xt_C_Wait_For_Wm : constant String := "Waitforwm" & Ascii.Nul;
    Xt_C_Width : constant String := "Width" & Ascii.Nul;
    Xt_C_Width_Inc : constant String := "WidthInc" & Ascii.Nul;
    Xt_C_Win_Gravity : constant String := "WinGravity" & Ascii.Nul;
    Xt_C_Window : constant String := "Window" & Ascii.Nul;
    Xt_C_Window_Group : constant String := "WindowGroup" & Ascii.Nul;
    Xt_C_Wm_Timeout : constant String := "WmTimeout" & Ascii.Nul;
    Xt_C_X : constant String := "X" & Ascii.Nul;
    Xt_C_Y : constant String := "Y" & Ascii.Nul;

    -- Resource type constants:

    Xt_R_Accelerator_Table : constant String := "AcceleratorTable" & Ascii.Nul;
    Xt_R_Atom : constant String := "Atom" & Ascii.Nul;
    Xt_R_Bitmap : constant String := "Bitmap" & Ascii.Nul;
    Xt_R_Bool : constant String := "Bool" & Ascii.Nul;
    Xt_R_Boolean : constant String := "Boolean" & Ascii.Nul;
    Xt_R_Callback : constant String := "Callback" & Ascii.Nul;
    Xt_R_Call_Proc : constant String := "CallProc" & Ascii.Nul;
    Xt_R_Cardinal : constant String := "Cardinal" & Ascii.Nul;
    Xt_R_Color : constant String := "Color" & Ascii.Nul;
    Xt_R_Colormap : constant String := "Colormap" & Ascii.Nul;
    Xt_R_Cursor : constant String := "Cursor" & Ascii.Nul;
    Xt_R_Dimension : constant String := "Dimension" & Ascii.Nul;
    Xt_R_Display : constant String := "Display" & Ascii.Nul;
    Xt_R_Edit_Mode : constant String := "EditMode" & Ascii.Nul;
    Xt_R_Enum : constant String := "Enum" & Ascii.Nul;
    Xt_R_File : constant String := "File" & Ascii.Nul;
    Xt_R_Float : constant String := "Float" & Ascii.Nul;
    Xt_R_Font : constant String := "Font" & Ascii.Nul;
    Xt_R_Font_Struct : constant String := "FontStruct" & Ascii.Nul;
    Xt_R_Function : constant String := "Function" & Ascii.Nul;
    Xt_R_Geometry : constant String := "Geometry" & Ascii.Nul;
    Xt_R_Immediate : constant String := "Immediate" & Ascii.Nul;
    Xt_R_Initial_State : constant String := "InitialState" & Ascii.Nul;
    Xt_R_Int : constant String := "Int" & Ascii.Nul;
    Xt_R_Justify : constant String := "Justify" & Ascii.Nul;
    Xt_R_Long_Boolean : constant String := "Bool" & Ascii.Nul;
    Xt_R_Object : constant String := "Object" & Ascii.Nul;
    Xt_R_Orientation : constant String := "Orientation" & Ascii.Nul;
    Xt_R_Pixel : constant String := "Pixel" & Ascii.Nul;
    Xt_R_Pixmap : constant String := "Pixmap" & Ascii.Nul;
    Xt_R_Pointer : constant String := "Pointer" & Ascii.Nul;
    Xt_R_Position : constant String := "Position" & Ascii.Nul;
    Xt_R_Screen : constant String := "Screen" & Ascii.Nul;
    Xt_R_Short : constant String := "Short" & Ascii.Nul;
    Xt_R_String : constant String := "String" & Ascii.Nul;
    Xt_R_String_Array : constant String := "StringArray" & Ascii.Nul;
    Xt_R_String_Table : constant String := "StringTable" & Ascii.Nul;
    Xt_R_Unsigned_Char : constant String := "UnsignedChar" & Ascii.Nul;
    Xt_R_Translation_Table : constant String := "TranslationTable" & Ascii.Nul;
    Xt_R_Visual : constant String := "Visual" & Ascii.Nul;
    Xt_R_Widget : constant String := "Widget" & Ascii.Nul;
    Xt_R_Widget_Class : constant String := "WidgetClass" & Ascii.Nul;
    Xt_R_Widget_List : constant String := "WidgetList" & Ascii.Nul;
    Xt_R_Window : constant String := "Window" & Ascii.Nul;

    -- Boolean enumeration constants:

    Xt_E_Off : constant String := "off" & Ascii.Nul;
    Xt_E_False : constant String := "false" & Ascii.Nul;
    Xt_E_No : constant String := "no" & Ascii.Nul;
    Xt_E_On : constant String := "on" & Ascii.Nul;
    Xt_E_True : constant String := "true" & Ascii.Nul;
    Xt_E_Yes : constant String := "yes" & Ascii.Nul;

    -- Orientation enumeration constants:

    Xt_E_Vertical : constant String := "vertical" & Ascii.Nul;
    Xt_E_Horizontal : constant String := "horizontal" & Ascii.Nul;

    -- Text edit enumeration constants:

    Xt_E_Text_Read : constant String := "read" & Ascii.Nul;
    Xt_E_Text_Append : constant String := "append" & Ascii.Nul;
    Xt_E_Text_Edit : constant String := "edit" & Ascii.Nul;

    -- Color enumeration constants:

    Xt_E_Xt_Default_Background : constant String :=
       "xtdefaultbackground" & Ascii.Nul;
    Xt_E_Xt_Default_Foreground : constant String :=
       "xtdefaultforeground" & Ascii.Nul;

    -- Font constants:

    Xt_E_Xt_Default_Font : constant String := "xtdefaultfont" & Ascii.Nul;

    Xt_N_Font_Set : constant String := "fontSet" & Ascii.Nul;
    Xt_R_Font_Set : constant String := "FontSet" & Ascii.Nul;
    Xt_C_Font_Set : constant String := "FontSet" & Ascii.Nul;
end Xt_Stringdefs;

--package body Xt_StringDefs is end Xt_StringDefs;
