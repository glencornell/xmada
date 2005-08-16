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

with X_Lib;

package X_Key_Syms is
    Xk_No_Symbol : constant X_Lib.Keyboard.Key_Sym := 0;
    --
    -- TTY Functions, choosen to map to ASCII, for convenience of programming.
    --

    Xk_Backspace : constant X_Lib.Keyboard.Key_Sym := 16#FF08#;
    Xk_Tab : constant X_Lib.Keyboard.Key_Sym := 16#FF09#;
    Xk_Clear : constant X_Lib.Keyboard.Key_Sym := 16#FF0B#;
    Xk_Linefeed : constant X_Lib.Keyboard.Key_Sym := 16#FF0A#;
    Xk_Return : constant X_Lib.Keyboard.Key_Sym := 16#FF0D#;
    Xk_Pause : constant X_Lib.Keyboard.Key_Sym := 16#FF13#;
    Xk_Escape : constant X_Lib.Keyboard.Key_Sym := 16#FF1B#;
    Xk_Delete : constant X_Lib.Keyboard.Key_Sym := 16#FFFF#;

    --
    -- International & Multi-key character composition
    --
    Xk_Compose : constant X_Lib.Keyboard.Key_Sym := 16#FF20#;
    Xk_Kanji : constant X_Lib.Keyboard.Key_Sym := 16#FF21#;

    --
    -- Cursor Control & Motion
    --
    Xk_Home : constant X_Lib.Keyboard.Key_Sym := 16#FF50#;
    Xk_Left : constant X_Lib.Keyboard.Key_Sym := 16#FF51#;
    Xk_Up : constant X_Lib.Keyboard.Key_Sym := 16#FF52#;
    Xk_Right : constant X_Lib.Keyboard.Key_Sym := 16#FF53#;
    Xk_Down : constant X_Lib.Keyboard.Key_Sym := 16#FF54#;
    Xk_Prior : constant X_Lib.Keyboard.Key_Sym := 16#FF55#;
    Xk_Next : constant X_Lib.Keyboard.Key_Sym := 16#FF56#;
    Xk_End : constant X_Lib.Keyboard.Key_Sym := 16#FF57#;
    Xk_Begin : constant X_Lib.Keyboard.Key_Sym := 16#FF58#;

    --
    -- Misc Functions
    --
    Xk_Select : constant X_Lib.Keyboard.Key_Sym := 16#FF60#;
    Xk_Print : constant X_Lib.Keyboard.Key_Sym := 16#FF61#;
    Xk_Execute : constant X_Lib.Keyboard.Key_Sym := 16#FF62#;
    Xk_Insert : constant X_Lib.Keyboard.Key_Sym := 16#FF63#;
    Xk_Undo : constant X_Lib.Keyboard.Key_Sym := 16#FF65#;
    Xk_Redo : constant X_Lib.Keyboard.Key_Sym := 16#FF66#;
    Xk_Menu : constant X_Lib.Keyboard.Key_Sym := 16#FF67#;
    Xk_Find : constant X_Lib.Keyboard.Key_Sym := 16#FF68#;
    Xk_Cancel : constant X_Lib.Keyboard.Key_Sym := 16#FF69#;
    Xk_Help : constant X_Lib.Keyboard.Key_Sym := 16#FF6A#;
    Xk_Break : constant X_Lib.Keyboard.Key_Sym := 16#FF6B#;
    Xk_Mode_Switch : constant X_Lib.Keyboard.Key_Sym := 16#FF7E#;
    Xk_Script_Switch : constant X_Lib.Keyboard.Key_Sym := 16#FF7E#;
    Xk_Num_Lock : constant X_Lib.Keyboard.Key_Sym := 16#FF7F#;

    --
    -- Keypad Functions, keypad numbers chosen to map to ascii
    --
    Xk_Kp_Space : constant X_Lib.Keyboard.Key_Sym := 16#FF80#;
    Xk_Kp_Tab : constant X_Lib.Keyboard.Key_Sym := 16#FF89#;
    Xk_Kp_Enter : constant X_Lib.Keyboard.Key_Sym := 16#FF8D#;
    Xk_Kp_F1 : constant X_Lib.Keyboard.Key_Sym := 16#FF91#;
    Xk_Kp_F2 : constant X_Lib.Keyboard.Key_Sym := 16#FF92#;
    Xk_Kp_F3 : constant X_Lib.Keyboard.Key_Sym := 16#FF93#;
    Xk_Kp_F4 : constant X_Lib.Keyboard.Key_Sym := 16#FF94#;
    Xk_Kp_Equal : constant X_Lib.Keyboard.Key_Sym := 16#FFBD#;
    Xk_Kp_Multiply : constant X_Lib.Keyboard.Key_Sym := 16#FFAA#;
    Xk_Kp_Add : constant X_Lib.Keyboard.Key_Sym := 16#FFAB#;
    Xk_Kp_Separator : constant X_Lib.Keyboard.Key_Sym := 16#FFAC#;
    Xk_Kp_Subtract : constant X_Lib.Keyboard.Key_Sym := 16#FFAD#;
    Xk_Kp_Decimal : constant X_Lib.Keyboard.Key_Sym := 16#FFAE#;
    Xk_Kp_Divide : constant X_Lib.Keyboard.Key_Sym := 16#FFAF#;
    Xk_Kp_0 : constant X_Lib.Keyboard.Key_Sym := 16#FFB0#;
    Xk_Kp_1 : constant X_Lib.Keyboard.Key_Sym := 16#FFB1#;
    Xk_Kp_2 : constant X_Lib.Keyboard.Key_Sym := 16#FFB2#;
    Xk_Kp_3 : constant X_Lib.Keyboard.Key_Sym := 16#FFB3#;
    Xk_Kp_4 : constant X_Lib.Keyboard.Key_Sym := 16#FFB4#;
    Xk_Kp_5 : constant X_Lib.Keyboard.Key_Sym := 16#FFB5#;
    Xk_Kp_6 : constant X_Lib.Keyboard.Key_Sym := 16#FFB6#;
    Xk_Kp_7 : constant X_Lib.Keyboard.Key_Sym := 16#FFB7#;
    Xk_Kp_8 : constant X_Lib.Keyboard.Key_Sym := 16#FFB8#;
    Xk_Kp_9 : constant X_Lib.Keyboard.Key_Sym := 16#FFB9#;

    --
    -- Auxilliary Functions; note the duplicate definitions for left and
    -- right function keys. The maximum number of function keys for any
    -- keyboard is 35.
    --
    Xk_F1 : constant X_Lib.Keyboard.Key_Sym := 16#FFBE#;
    Xk_F2 : constant X_Lib.Keyboard.Key_Sym := 16#FFBF#;
    Xk_F3 : constant X_Lib.Keyboard.Key_Sym := 16#FFC0#;
    Xk_F4 : constant X_Lib.Keyboard.Key_Sym := 16#FFC1#;
    Xk_F5 : constant X_Lib.Keyboard.Key_Sym := 16#FFC2#;
    Xk_F6 : constant X_Lib.Keyboard.Key_Sym := 16#FFC3#;
    Xk_F7 : constant X_Lib.Keyboard.Key_Sym := 16#FFC4#;
    Xk_F8 : constant X_Lib.Keyboard.Key_Sym := 16#FFC5#;
    Xk_F9 : constant X_Lib.Keyboard.Key_Sym := 16#FFC6#;
    Xk_F10 : constant X_Lib.Keyboard.Key_Sym := 16#FFC7#;
    Xk_F11 : constant X_Lib.Keyboard.Key_Sym := 16#FFC8#;
    Xk_F12 : constant X_Lib.Keyboard.Key_Sym := 16#FFC9#;
    Xk_F13 : constant X_Lib.Keyboard.Key_Sym := 16#FFCA#;
    Xk_F14 : constant X_Lib.Keyboard.Key_Sym := 16#FFCB#;
    Xk_F15 : constant X_Lib.Keyboard.Key_Sym := 16#FFCC#;
    Xk_F16 : constant X_Lib.Keyboard.Key_Sym := 16#FFCD#;
    Xk_F17 : constant X_Lib.Keyboard.Key_Sym := 16#FFCE#;
    Xk_F18 : constant X_Lib.Keyboard.Key_Sym := 16#FFCF#;
    Xk_F19 : constant X_Lib.Keyboard.Key_Sym := 16#FFD0#;
    Xk_F20 : constant X_Lib.Keyboard.Key_Sym := 16#FFD1#;
    Xk_F21 : constant X_Lib.Keyboard.Key_Sym := 16#FFD2#;
    Xk_F22 : constant X_Lib.Keyboard.Key_Sym := 16#FFD3#;
    Xk_F23 : constant X_Lib.Keyboard.Key_Sym := 16#FFD4#;
    Xk_F24 : constant X_Lib.Keyboard.Key_Sym := 16#FFD5#;
    Xk_F25 : constant X_Lib.Keyboard.Key_Sym := 16#FFD6#;
    Xk_F26 : constant X_Lib.Keyboard.Key_Sym := 16#FFD7#;
    Xk_F27 : constant X_Lib.Keyboard.Key_Sym := 16#FFD8#;
    Xk_F28 : constant X_Lib.Keyboard.Key_Sym := 16#FFD9#;
    Xk_F29 : constant X_Lib.Keyboard.Key_Sym := 16#FFDA#;
    Xk_F30 : constant X_Lib.Keyboard.Key_Sym := 16#FFDB#;
    Xk_F31 : constant X_Lib.Keyboard.Key_Sym := 16#FFDC#;
    Xk_F32 : constant X_Lib.Keyboard.Key_Sym := 16#FFDD#;
    Xk_F33 : constant X_Lib.Keyboard.Key_Sym := 16#FFDE#;
    Xk_F34 : constant X_Lib.Keyboard.Key_Sym := 16#FFDF#;
    Xk_F35 : constant X_Lib.Keyboard.Key_Sym := 16#FFE0#;

    --
    -- Sun and a few other manufacturers have function key groups on the
    -- left and/or right sides of the keyboard. These map to the above
    -- function keys.
    --
    Xk_L1 : constant X_Lib.Keyboard.Key_Sym := Xk_F11;
    Xk_L2 : constant X_Lib.Keyboard.Key_Sym := Xk_F12;
    Xk_L3 : constant X_Lib.Keyboard.Key_Sym := Xk_F13;
    Xk_L4 : constant X_Lib.Keyboard.Key_Sym := Xk_F14;
    Xk_L5 : constant X_Lib.Keyboard.Key_Sym := Xk_F15;
    Xk_L6 : constant X_Lib.Keyboard.Key_Sym := Xk_F16;
    Xk_L7 : constant X_Lib.Keyboard.Key_Sym := Xk_F17;
    Xk_L8 : constant X_Lib.Keyboard.Key_Sym := Xk_F18;
    Xk_L9 : constant X_Lib.Keyboard.Key_Sym := Xk_F19;
    Xk_L10 : constant X_Lib.Keyboard.Key_Sym := Xk_F20;

    Xk_R1 : constant X_Lib.Keyboard.Key_Sym := Xk_F21;
    Xk_R2 : constant X_Lib.Keyboard.Key_Sym := Xk_F22;
    Xk_R3 : constant X_Lib.Keyboard.Key_Sym := Xk_F23;
    Xk_R4 : constant X_Lib.Keyboard.Key_Sym := Xk_F24;
    Xk_R5 : constant X_Lib.Keyboard.Key_Sym := Xk_F25;
    Xk_R6 : constant X_Lib.Keyboard.Key_Sym := Xk_F26;
    Xk_R7 : constant X_Lib.Keyboard.Key_Sym := Xk_F27;
    Xk_R8 : constant X_Lib.Keyboard.Key_Sym := Xk_F28;
    Xk_R9 : constant X_Lib.Keyboard.Key_Sym := Xk_F29;
    Xk_R10 : constant X_Lib.Keyboard.Key_Sym := Xk_F30;
    Xk_R11 : constant X_Lib.Keyboard.Key_Sym := Xk_F31;
    Xk_R12 : constant X_Lib.Keyboard.Key_Sym := Xk_F32;
    Xk_R13 : constant X_Lib.Keyboard.Key_Sym := Xk_F33;
    Xk_R14 : constant X_Lib.Keyboard.Key_Sym := Xk_F34;
    Xk_R15 : constant X_Lib.Keyboard.Key_Sym := Xk_F35;

    --
    -- Modifiers
    --
    Xk_Shift_L : constant X_Lib.Keyboard.Key_Sym := 16#FFE1#;
    Xk_Shift_R : constant X_Lib.Keyboard.Key_Sym := 16#FFE2#;
    Xk_Control_L : constant X_Lib.Keyboard.Key_Sym := 16#FFE3#;
    Xk_Control_R : constant X_Lib.Keyboard.Key_Sym := 16#FFE4#;
    Xk_Caps_Lock : constant X_Lib.Keyboard.Key_Sym := 16#FFE5#;
    Xk_Shift_Lock : constant X_Lib.Keyboard.Key_Sym := 16#FFE6#;

    Xk_Meta_L : constant X_Lib.Keyboard.Key_Sym := 16#FFE7#;
    Xk_Meta_R : constant X_Lib.Keyboard.Key_Sym := 16#FFE8#;
    Xk_Alt_L : constant X_Lib.Keyboard.Key_Sym := 16#FFE9#;
    Xk_Alt_R : constant X_Lib.Keyboard.Key_Sym := 16#FFEA#;
    Xk_Super_L : constant X_Lib.Keyboard.Key_Sym := 16#FFEB#;
    Xk_Super_R : constant X_Lib.Keyboard.Key_Sym := 16#FFEC#;
    Xk_Hyper_L : constant X_Lib.Keyboard.Key_Sym := 16#FFED#;
    Xk_Hyper_R : constant X_Lib.Keyboard.Key_Sym := 16#FFEE#;

    --
    -- Latin 1
    -- Byte 3 = 0
    --
    Xk_Space : constant X_Lib.Keyboard.Key_Sym := 16#020#;
    Xk_Exclam : constant X_Lib.Keyboard.Key_Sym := 16#021#;
    Xk_Quote_Dbl : constant X_Lib.Keyboard.Key_Sym := 16#022#;
    Xk_Number_Sign : constant X_Lib.Keyboard.Key_Sym := 16#023#;
    Xk_Dollar : constant X_Lib.Keyboard.Key_Sym := 16#024#;
    Xk_Percent : constant X_Lib.Keyboard.Key_Sym := 16#025#;
    Xk_Ampersand : constant X_Lib.Keyboard.Key_Sym := 16#026#;
    Xk_Quote_Right : constant X_Lib.Keyboard.Key_Sym := 16#027#;
    Xk_Paren_Left : constant X_Lib.Keyboard.Key_Sym := 16#028#;
    Xk_Paren_Right : constant X_Lib.Keyboard.Key_Sym := 16#029#;
    Xk_Asterisk : constant X_Lib.Keyboard.Key_Sym := 16#02A#;
    Xk_Plus : constant X_Lib.Keyboard.Key_Sym := 16#02B#;
    Xk_Comma : constant X_Lib.Keyboard.Key_Sym := 16#02C#;
    Xk_Minus : constant X_Lib.Keyboard.Key_Sym := 16#02D#;
    Xk_Period : constant X_Lib.Keyboard.Key_Sym := 16#02E#;
    Xk_Slash : constant X_Lib.Keyboard.Key_Sym := 16#02F#;
    Xk_0 : constant X_Lib.Keyboard.Key_Sym := 16#030#;
    Xk_1 : constant X_Lib.Keyboard.Key_Sym := 16#031#;
    Xk_2 : constant X_Lib.Keyboard.Key_Sym := 16#032#;
    Xk_3 : constant X_Lib.Keyboard.Key_Sym := 16#033#;
    Xk_4 : constant X_Lib.Keyboard.Key_Sym := 16#034#;
    Xk_5 : constant X_Lib.Keyboard.Key_Sym := 16#035#;
    Xk_6 : constant X_Lib.Keyboard.Key_Sym := 16#036#;
    Xk_7 : constant X_Lib.Keyboard.Key_Sym := 16#037#;
    Xk_8 : constant X_Lib.Keyboard.Key_Sym := 16#038#;
    Xk_9 : constant X_Lib.Keyboard.Key_Sym := 16#039#;
    Xk_Colon : constant X_Lib.Keyboard.Key_Sym := 16#03A#;
    Xk_Semicolon : constant X_Lib.Keyboard.Key_Sym := 16#03B#;
    Xk_Less : constant X_Lib.Keyboard.Key_Sym := 16#03C#;
    Xk_Equal : constant X_Lib.Keyboard.Key_Sym := 16#03D#;
    Xk_Greater : constant X_Lib.Keyboard.Key_Sym := 16#03E#;
    Xk_Question : constant X_Lib.Keyboard.Key_Sym := 16#03F#;
    Xk_At : constant X_Lib.Keyboard.Key_Sym := 16#040#;
    Xk_A : constant X_Lib.Keyboard.Key_Sym := 16#041#;
    Xk_B : constant X_Lib.Keyboard.Key_Sym := 16#042#;
    Xk_C : constant X_Lib.Keyboard.Key_Sym := 16#043#;
    Xk_D : constant X_Lib.Keyboard.Key_Sym := 16#044#;
    Xk_E : constant X_Lib.Keyboard.Key_Sym := 16#045#;
    Xk_F : constant X_Lib.Keyboard.Key_Sym := 16#046#;
    Xk_G : constant X_Lib.Keyboard.Key_Sym := 16#047#;
    Xk_H : constant X_Lib.Keyboard.Key_Sym := 16#048#;
    Xk_I : constant X_Lib.Keyboard.Key_Sym := 16#049#;
    Xk_J : constant X_Lib.Keyboard.Key_Sym := 16#04A#;
    Xk_K : constant X_Lib.Keyboard.Key_Sym := 16#04B#;
    Xk_L : constant X_Lib.Keyboard.Key_Sym := 16#04C#;
    Xk_M : constant X_Lib.Keyboard.Key_Sym := 16#04D#;
    Xk_N : constant X_Lib.Keyboard.Key_Sym := 16#04E#;
    Xk_O : constant X_Lib.Keyboard.Key_Sym := 16#04F#;
    Xk_P : constant X_Lib.Keyboard.Key_Sym := 16#050#;
    Xk_Q : constant X_Lib.Keyboard.Key_Sym := 16#051#;
    Xk_R : constant X_Lib.Keyboard.Key_Sym := 16#052#;
    Xk_S : constant X_Lib.Keyboard.Key_Sym := 16#053#;
    Xk_T : constant X_Lib.Keyboard.Key_Sym := 16#054#;
    Xk_U : constant X_Lib.Keyboard.Key_Sym := 16#055#;
    Xk_V : constant X_Lib.Keyboard.Key_Sym := 16#056#;
    Xk_W : constant X_Lib.Keyboard.Key_Sym := 16#057#;
    Xk_X : constant X_Lib.Keyboard.Key_Sym := 16#058#;
    Xk_Y : constant X_Lib.Keyboard.Key_Sym := 16#059#;
    Xk_Z : constant X_Lib.Keyboard.Key_Sym := 16#05A#;
    Xk_Bracket_Left : constant X_Lib.Keyboard.Key_Sym := 16#05B#;
    Xk_Back_Slash : constant X_Lib.Keyboard.Key_Sym := 16#05C#;
    Xk_Bracket_Right : constant X_Lib.Keyboard.Key_Sym := 16#05D#;
    Xk_Ascii_Circum : constant X_Lib.Keyboard.Key_Sym := 16#05E#;
    Xk_Underscore : constant X_Lib.Keyboard.Key_Sym := 16#05F#;
    Xk_Quote_Left : constant X_Lib.Keyboard.Key_Sym := 16#060#;
    Xk_Lc_A : constant X_Lib.Keyboard.Key_Sym := 16#061#;
    Xk_Lc_B : constant X_Lib.Keyboard.Key_Sym := 16#062#;
    Xk_Lc_C : constant X_Lib.Keyboard.Key_Sym := 16#063#;
    Xk_Lc_D : constant X_Lib.Keyboard.Key_Sym := 16#064#;
    Xk_Lc_E : constant X_Lib.Keyboard.Key_Sym := 16#065#;
    Xk_Lc_F : constant X_Lib.Keyboard.Key_Sym := 16#066#;
    Xk_Lc_G : constant X_Lib.Keyboard.Key_Sym := 16#067#;
    Xk_Lc_H : constant X_Lib.Keyboard.Key_Sym := 16#068#;
    Xk_Lc_I : constant X_Lib.Keyboard.Key_Sym := 16#069#;
    Xk_Lc_J : constant X_Lib.Keyboard.Key_Sym := 16#06A#;
    Xk_Lc_K : constant X_Lib.Keyboard.Key_Sym := 16#06B#;
    Xk_Lc_L : constant X_Lib.Keyboard.Key_Sym := 16#06C#;
    Xk_Lc_M : constant X_Lib.Keyboard.Key_Sym := 16#06D#;
    Xk_Lc_N : constant X_Lib.Keyboard.Key_Sym := 16#06E#;
    Xk_Lc_O : constant X_Lib.Keyboard.Key_Sym := 16#06F#;
    Xk_Lc_P : constant X_Lib.Keyboard.Key_Sym := 16#070#;
    Xk_Lc_Q : constant X_Lib.Keyboard.Key_Sym := 16#071#;
    Xk_Lc_R : constant X_Lib.Keyboard.Key_Sym := 16#072#;
    Xk_Lc_S : constant X_Lib.Keyboard.Key_Sym := 16#073#;
    Xk_Lc_T : constant X_Lib.Keyboard.Key_Sym := 16#074#;
    Xk_Lc_U : constant X_Lib.Keyboard.Key_Sym := 16#075#;
    Xk_Lc_V : constant X_Lib.Keyboard.Key_Sym := 16#076#;
    Xk_Lc_W : constant X_Lib.Keyboard.Key_Sym := 16#077#;
    Xk_Lc_X : constant X_Lib.Keyboard.Key_Sym := 16#078#;
    Xk_Lc_Y : constant X_Lib.Keyboard.Key_Sym := 16#079#;
    Xk_Lc_Z : constant X_Lib.Keyboard.Key_Sym := 16#07A#;
    Xk_Brace_Left : constant X_Lib.Keyboard.Key_Sym := 16#07B#;
    Xk_Bar : constant X_Lib.Keyboard.Key_Sym := 16#07C#;
    Xk_Brace_Right : constant X_Lib.Keyboard.Key_Sym := 16#07D#;
    Xk_Ascii_Tilde : constant X_Lib.Keyboard.Key_Sym := 16#07E#;
    Xk_No_Break_Space : constant X_Lib.Keyboard.Key_Sym := 16#0A0#;
    Xk_Exclam_Down : constant X_Lib.Keyboard.Key_Sym := 16#0A1#;
    Xk_Cent : constant X_Lib.Keyboard.Key_Sym := 16#0A2#;
    Xk_Sterling : constant X_Lib.Keyboard.Key_Sym := 16#0A3#;
    Xk_Currency : constant X_Lib.Keyboard.Key_Sym := 16#0A4#;
    Xk_Yen : constant X_Lib.Keyboard.Key_Sym := 16#0A5#;
    Xk_Broken_Bar : constant X_Lib.Keyboard.Key_Sym := 16#0A6#;
    Xk_Section : constant X_Lib.Keyboard.Key_Sym := 16#0A7#;
    Xk_Diaeresis : constant X_Lib.Keyboard.Key_Sym := 16#0A8#;
    Xk_Copyright : constant X_Lib.Keyboard.Key_Sym := 16#0A9#;
    Xk_Ord_Feminine : constant X_Lib.Keyboard.Key_Sym := 16#0AA#;
    Xk_Guillemot_Left : constant X_Lib.Keyboard.Key_Sym := 16#0AB#;
    Xk_Logical_Not : constant X_Lib.Keyboard.Key_Sym := 16#0AC#;
    Xk_Hyphen : constant X_Lib.Keyboard.Key_Sym := 16#0AD#;
    Xk_Registered : constant X_Lib.Keyboard.Key_Sym := 16#0AE#;
    Xk_Macron : constant X_Lib.Keyboard.Key_Sym := 16#0AF#;
    Xk_Degree : constant X_Lib.Keyboard.Key_Sym := 16#0B0#;
    Xk_Plus_Minus : constant X_Lib.Keyboard.Key_Sym := 16#0B1#;
    Xk_Two_Superior : constant X_Lib.Keyboard.Key_Sym := 16#0B2#;
    Xk_Three_Superior : constant X_Lib.Keyboard.Key_Sym := 16#0B3#;
    Xk_Acute : constant X_Lib.Keyboard.Key_Sym := 16#0B4#;
    Xk_Mu : constant X_Lib.Keyboard.Key_Sym := 16#0B5#;
    Xk_Paragraph : constant X_Lib.Keyboard.Key_Sym := 16#0B6#;
    Xk_Period_Centered : constant X_Lib.Keyboard.Key_Sym := 16#0B7#;
    Xk_Cedilla : constant X_Lib.Keyboard.Key_Sym := 16#0B8#;
    Xk_One_Superior : constant X_Lib.Keyboard.Key_Sym := 16#0B9#;
    Xk_Masculine : constant X_Lib.Keyboard.Key_Sym := 16#0BA#;
    Xk_Guillemot_Right : constant X_Lib.Keyboard.Key_Sym := 16#0BB#;
    Xk_One_Quarter : constant X_Lib.Keyboard.Key_Sym := 16#0BC#;
    Xk_One_Half : constant X_Lib.Keyboard.Key_Sym := 16#0BD#;
    Xk_Three_Quarters : constant X_Lib.Keyboard.Key_Sym := 16#0BE#;
    Xk_Question_Down : constant X_Lib.Keyboard.Key_Sym := 16#0BF#;
    Xk_Agrave : constant X_Lib.Keyboard.Key_Sym := 16#0C0#;
    Xk_Aacute : constant X_Lib.Keyboard.Key_Sym := 16#0C1#;
    Xk_Acircumflex : constant X_Lib.Keyboard.Key_Sym := 16#0C2#;
    Xk_Atilde : constant X_Lib.Keyboard.Key_Sym := 16#0C3#;
    Xk_Adiaeresis : constant X_Lib.Keyboard.Key_Sym := 16#0C4#;
    Xk_Aring : constant X_Lib.Keyboard.Key_Sym := 16#0C5#;
    Xk_Ae : constant X_Lib.Keyboard.Key_Sym := 16#0C6#;
    Xk_Ccedilla : constant X_Lib.Keyboard.Key_Sym := 16#0C7#;
    Xk_Egrave : constant X_Lib.Keyboard.Key_Sym := 16#0C8#;
    Xk_Eacute : constant X_Lib.Keyboard.Key_Sym := 16#0C9#;
    Xk_Ecircumflex : constant X_Lib.Keyboard.Key_Sym := 16#0CA#;
    Xk_Ediaeresis : constant X_Lib.Keyboard.Key_Sym := 16#0CB#;
    Xk_Igrave : constant X_Lib.Keyboard.Key_Sym := 16#0CC#;
    Xk_Iacute : constant X_Lib.Keyboard.Key_Sym := 16#0CD#;
    Xk_Icircumflex : constant X_Lib.Keyboard.Key_Sym := 16#0CE#;
    Xk_Idiaeresis : constant X_Lib.Keyboard.Key_Sym := 16#0CF#;
    Xk_Eth : constant X_Lib.Keyboard.Key_Sym := 16#0D0#;
    Xk_Ntilde : constant X_Lib.Keyboard.Key_Sym := 16#0D1#;
    Xk_Ograve : constant X_Lib.Keyboard.Key_Sym := 16#0D2#;
    Xk_Oacute : constant X_Lib.Keyboard.Key_Sym := 16#0D3#;
    Xk_Ocircumflex : constant X_Lib.Keyboard.Key_Sym := 16#0D4#;
    Xk_Otilde : constant X_Lib.Keyboard.Key_Sym := 16#0D5#;
    Xk_Odiaeresis : constant X_Lib.Keyboard.Key_Sym := 16#0D6#;
    Xk_Multiply : constant X_Lib.Keyboard.Key_Sym := 16#0D7#;
    Xk_Ooblique : constant X_Lib.Keyboard.Key_Sym := 16#0D8#;
    Xk_Ugrave : constant X_Lib.Keyboard.Key_Sym := 16#0D9#;
    Xk_Uacute : constant X_Lib.Keyboard.Key_Sym := 16#0DA#;
    Xk_Ucircumflex : constant X_Lib.Keyboard.Key_Sym := 16#0DB#;
    Xk_Udiaeresis : constant X_Lib.Keyboard.Key_Sym := 16#0DC#;
    Xk_Yacute : constant X_Lib.Keyboard.Key_Sym := 16#0DD#;
    Xk_Thorn_1 : constant X_Lib.Keyboard.Key_Sym := 16#0DE#;
    Xk_German_Dbl_S : constant X_Lib.Keyboard.Key_Sym := 16#0DF#;
    Xk_A_Grave : constant X_Lib.Keyboard.Key_Sym := 16#0E0#;
    Xk_A_Acute : constant X_Lib.Keyboard.Key_Sym := 16#0E1#;
    Xk_A_Circumflex : constant X_Lib.Keyboard.Key_Sym := 16#0E2#;
    Xk_Wtilde : constant X_Lib.Keyboard.Key_Sym := 16#0E3#;
    Xk_A_Diaeresis : constant X_Lib.Keyboard.Key_Sym := 16#0E4#;
    Xk_A_Ring : constant X_Lib.Keyboard.Key_Sym := 16#0E5#;
    Xk_A_E : constant X_Lib.Keyboard.Key_Sym := 16#0E6#;
    Xk_C_Cedilla : constant X_Lib.Keyboard.Key_Sym := 16#0E7#;
    Xk_E_Grave : constant X_Lib.Keyboard.Key_Sym := 16#0E8#;
    Xk_E_Acute : constant X_Lib.Keyboard.Key_Sym := 16#0E9#;
    Xk_E_Circumflex : constant X_Lib.Keyboard.Key_Sym := 16#0EA#;
    Xk_E_Diaeresis : constant X_Lib.Keyboard.Key_Sym := 16#0EB#;
    Xk_I_Grave : constant X_Lib.Keyboard.Key_Sym := 16#0EC#;
    Xk_I_Acute : constant X_Lib.Keyboard.Key_Sym := 16#0ED#;
    Xk_I_Circumflex : constant X_Lib.Keyboard.Key_Sym := 16#0EE#;
    Xk_I_Diaeresis : constant X_Lib.Keyboard.Key_Sym := 16#0EF#;
    Xk_E_Th : constant X_Lib.Keyboard.Key_Sym := 16#0F0#;
    Xk_N_Tilde : constant X_Lib.Keyboard.Key_Sym := 16#0F1#;
    Xk_O_Grave : constant X_Lib.Keyboard.Key_Sym := 16#0F2#;
    Xk_O_Acute : constant X_Lib.Keyboard.Key_Sym := 16#0F3#;
    Xk_O_Circumflex : constant X_Lib.Keyboard.Key_Sym := 16#0F4#;
    Xk_O_Tilde : constant X_Lib.Keyboard.Key_Sym := 16#0F5#;
    Xk_O_Diaeresis : constant X_Lib.Keyboard.Key_Sym := 16#0F6#;
    Xk_Division : constant X_Lib.Keyboard.Key_Sym := 16#0F7#;
    Xk_O_Slash : constant X_Lib.Keyboard.Key_Sym := 16#0F8#;
    Xk_U_Grave : constant X_Lib.Keyboard.Key_Sym := 16#0F9#;
    Xk_U_Acute : constant X_Lib.Keyboard.Key_Sym := 16#0FA#;
    Xk_U_Circumflex : constant X_Lib.Keyboard.Key_Sym := 16#0FB#;
    Xk_U_Diaeresis : constant X_Lib.Keyboard.Key_Sym := 16#0FC#;
    Xk_Y_Acute : constant X_Lib.Keyboard.Key_Sym := 16#0FD#;
    Xk_Thorn_2 : constant X_Lib.Keyboard.Key_Sym := 16#0FE#;
    Xk_Y_Diaeresis : constant X_Lib.Keyboard.Key_Sym := 16#0FF#;

    --
    -- Latin 2
    -- Byte 3 = 1
    --
    Xk_Aogonek : constant X_Lib.Keyboard.Key_Sym := 16#1A1#;
    Xk_Breve : constant X_Lib.Keyboard.Key_Sym := 16#1A2#;
    Xk_Lstroke : constant X_Lib.Keyboard.Key_Sym := 16#1A3#;
    Xk_Lcaron : constant X_Lib.Keyboard.Key_Sym := 16#1A5#;
    Xk_Sacute : constant X_Lib.Keyboard.Key_Sym := 16#1A6#;
    Xk_Scaron : constant X_Lib.Keyboard.Key_Sym := 16#1A9#;
    Xk_Scedilla : constant X_Lib.Keyboard.Key_Sym := 16#1AA#;
    Xk_Tcaron : constant X_Lib.Keyboard.Key_Sym := 16#1AB#;
    Xk_Zacute : constant X_Lib.Keyboard.Key_Sym := 16#1AC#;
    Xk_Zcaron : constant X_Lib.Keyboard.Key_Sym := 16#1AE#;
    Xk_Zabovedot : constant X_Lib.Keyboard.Key_Sym := 16#1AF#;
    Xk_A_Ogonek : constant X_Lib.Keyboard.Key_Sym := 16#1B1#;
    Xk_Ogonek : constant X_Lib.Keyboard.Key_Sym := 16#1B2#;
    Xk_L_Stroke : constant X_Lib.Keyboard.Key_Sym := 16#1B3#;
    Xk_L_Caron : constant X_Lib.Keyboard.Key_Sym := 16#1B5#;
    Xk_S_Acute : constant X_Lib.Keyboard.Key_Sym := 16#1B6#;
    Xk_Caron : constant X_Lib.Keyboard.Key_Sym := 16#1B7#;
    Xk_S_Caron : constant X_Lib.Keyboard.Key_Sym := 16#1B9#;
    Xk_S_Cedilla : constant X_Lib.Keyboard.Key_Sym := 16#1BA#;
    Xk_T_Caron : constant X_Lib.Keyboard.Key_Sym := 16#1BB#;
    Xk_Z_Acute : constant X_Lib.Keyboard.Key_Sym := 16#1BC#;
    Xk_Double_Acute : constant X_Lib.Keyboard.Key_Sym := 16#1BD#;
    Xk_Z_Caron : constant X_Lib.Keyboard.Key_Sym := 16#1BE#;
    Xk_Z_Abovedot : constant X_Lib.Keyboard.Key_Sym := 16#1BF#;
    Xk_Racute : constant X_Lib.Keyboard.Key_Sym := 16#1C0#;
    Xk_Abreve : constant X_Lib.Keyboard.Key_Sym := 16#1C3#;
    Xk_Cacute : constant X_Lib.Keyboard.Key_Sym := 16#1C6#;
    Xk_Ccaron : constant X_Lib.Keyboard.Key_Sym := 16#1C8#;
    Xk_Eogonek : constant X_Lib.Keyboard.Key_Sym := 16#1CA#;
    Xk_Ecaron : constant X_Lib.Keyboard.Key_Sym := 16#1CC#;
    Xk_Dcaron : constant X_Lib.Keyboard.Key_Sym := 16#1CF#;
    Xk_Nacute : constant X_Lib.Keyboard.Key_Sym := 16#1D1#;
    Xk_Ncaron : constant X_Lib.Keyboard.Key_Sym := 16#1D2#;
    Xk_Odoubleacute : constant X_Lib.Keyboard.Key_Sym := 16#1D5#;
    Xk_Rcaron : constant X_Lib.Keyboard.Key_Sym := 16#1D8#;
    Xk_Uring : constant X_Lib.Keyboard.Key_Sym := 16#1D9#;
    Xk_Udoubleacute : constant X_Lib.Keyboard.Key_Sym := 16#1DA#;
    Xk_Tcedilla : constant X_Lib.Keyboard.Key_Sym := 16#1DE#;
    Xk_R_Acute : constant X_Lib.Keyboard.Key_Sym := 16#1E0#;
    Xk_A_Breve : constant X_Lib.Keyboard.Key_Sym := 16#1E3#;
    Xk_C_Acute : constant X_Lib.Keyboard.Key_Sym := 16#1E6#;
    Xk_C_Caron : constant X_Lib.Keyboard.Key_Sym := 16#1E8#;
    Xk_E_Ogonek : constant X_Lib.Keyboard.Key_Sym := 16#1EA#;
    Xk_E_Caron : constant X_Lib.Keyboard.Key_Sym := 16#1EC#;
    Xk_D_Caron : constant X_Lib.Keyboard.Key_Sym := 16#1EF#;
    Xk_N_Acute : constant X_Lib.Keyboard.Key_Sym := 16#1F1#;
    Xk_N_Caron : constant X_Lib.Keyboard.Key_Sym := 16#1F2#;
    Xk_R_Caron : constant X_Lib.Keyboard.Key_Sym := 16#1F8#;
    Xk_U_Ring : constant X_Lib.Keyboard.Key_Sym := 16#1F9#;
    Xk_T_Cedilla : constant X_Lib.Keyboard.Key_Sym := 16#1FE#;
    Xk_Above_Dot : constant X_Lib.Keyboard.Key_Sym := 16#1FF#;

    --
    -- Latin 3
    -- Byte 3 = 2
    --
    Xk_Hstroke : constant X_Lib.Keyboard.Key_Sym := 16#2A1#;
    Xk_Hcircumflex : constant X_Lib.Keyboard.Key_Sym := 16#2A6#;
    Xk_Iabovedot : constant X_Lib.Keyboard.Key_Sym := 16#2A9#;
    Xk_Gbreve : constant X_Lib.Keyboard.Key_Sym := 16#2AB#;
    Xk_Jcircumflex : constant X_Lib.Keyboard.Key_Sym := 16#2AC#;
    Xk_H_Circumflex : constant X_Lib.Keyboard.Key_Sym := 16#2B1#;
    Xk_Hslash : constant X_Lib.Keyboard.Key_Sym := 16#2B6#;
    Xk_Idotless : constant X_Lib.Keyboard.Key_Sym := 16#2B9#;
    Xk_G_Breve : constant X_Lib.Keyboard.Key_Sym := 16#2BB#;
    Xk_J_Circumflex : constant X_Lib.Keyboard.Key_Sym := 16#2BC#;
    Xk_Cabovedot : constant X_Lib.Keyboard.Key_Sym := 16#2C5#;
    Xk_Ccircumflex : constant X_Lib.Keyboard.Key_Sym := 16#2C6#;
    Xk_Gabovedot : constant X_Lib.Keyboard.Key_Sym := 16#2D5#;
    Xk_Gcircumflex : constant X_Lib.Keyboard.Key_Sym := 16#2D8#;
    Xk_Ubreve : constant X_Lib.Keyboard.Key_Sym := 16#2DD#;
    Xk_Wcircumflex : constant X_Lib.Keyboard.Key_Sym := 16#2DE#;
    Xk_Sgernamsharp : constant X_Lib.Keyboard.Key_Sym := 16#2DF#;
    Xk_C_Abovedot : constant X_Lib.Keyboard.Key_Sym := 16#2E5#;
    Xk_C_Circumflex : constant X_Lib.Keyboard.Key_Sym := 16#2E6#;
    Xk_G_Abovedot : constant X_Lib.Keyboard.Key_Sym := 16#2F5#;
    Xk_G_Circumflex : constant X_Lib.Keyboard.Key_Sym := 16#2F8#;
    Xk_U_Breve : constant X_Lib.Keyboard.Key_Sym := 16#2FD#;
    Xk_Scircumflex : constant X_Lib.Keyboard.Key_Sym := 16#2FE#;

    --
    -- Latin 4
    -- Byte 3 = 3
    --
    Xk_Kappa : constant X_Lib.Keyboard.Key_Sym := 16#3A2#;
    Xk_Rcedilla : constant X_Lib.Keyboard.Key_Sym := 16#3A3#;
    Xk_Itilde : constant X_Lib.Keyboard.Key_Sym := 16#3A5#;
    Xk_Lcedilla : constant X_Lib.Keyboard.Key_Sym := 16#3A6#;
    Xk_Emacron : constant X_Lib.Keyboard.Key_Sym := 16#3AA#;
    Xk_Gcedilla : constant X_Lib.Keyboard.Key_Sym := 16#3AB#;
    Xk_Tslash : constant X_Lib.Keyboard.Key_Sym := 16#3AC#;
    Xk_R_Cedilla : constant X_Lib.Keyboard.Key_Sym := 16#3B3#;
    Xk_I_Tilde : constant X_Lib.Keyboard.Key_Sym := 16#3B5#;
    Xk_L_Cedilla : constant X_Lib.Keyboard.Key_Sym := 16#3B6#;
    Xk_E_Macron : constant X_Lib.Keyboard.Key_Sym := 16#3BA#;
    Xk_Gacute : constant X_Lib.Keyboard.Key_Sym := 16#3BB#;
    Xk_T_Slash : constant X_Lib.Keyboard.Key_Sym := 16#3BC#;
    Xk_Eng : constant X_Lib.Keyboard.Key_Sym := 16#3BD#;
    Xk_E_Ng : constant X_Lib.Keyboard.Key_Sym := 16#3BF#;
    Xk_Amacron : constant X_Lib.Keyboard.Key_Sym := 16#3C0#;
    Xk_Iogonek : constant X_Lib.Keyboard.Key_Sym := 16#3C7#;
    Xk_Eabovedot : constant X_Lib.Keyboard.Key_Sym := 16#3CC#;
    Xk_Imacron : constant X_Lib.Keyboard.Key_Sym := 16#3CF#;
    Xk_Ncedilla : constant X_Lib.Keyboard.Key_Sym := 16#3D1#;
    Xk_Omacron : constant X_Lib.Keyboard.Key_Sym := 16#3D2#;
    Xk_Kcedilla : constant X_Lib.Keyboard.Key_Sym := 16#3D3#;
    Xk_Uogonek : constant X_Lib.Keyboard.Key_Sym := 16#3D9#;
    Xk_Utilde : constant X_Lib.Keyboard.Key_Sym := 16#3DD#;
    Xk_Umacron : constant X_Lib.Keyboard.Key_Sym := 16#3DE#;
    Xk_A_Macron : constant X_Lib.Keyboard.Key_Sym := 16#3E0#;
    Xk_I_Ogonek : constant X_Lib.Keyboard.Key_Sym := 16#3E7#;
    Xk_E_Abovedot : constant X_Lib.Keyboard.Key_Sym := 16#3EC#;
    Xk_I_Macron : constant X_Lib.Keyboard.Key_Sym := 16#3EF#;
    Xk_N_Cedilla : constant X_Lib.Keyboard.Key_Sym := 16#3F1#;
    Xk_O_Macron : constant X_Lib.Keyboard.Key_Sym := 16#3F2#;
    Xk_K_Cedilla : constant X_Lib.Keyboard.Key_Sym := 16#3F3#;
    Xk_U_Ogonek : constant X_Lib.Keyboard.Key_Sym := 16#3F9#;
    Xk_U_Tilde : constant X_Lib.Keyboard.Key_Sym := 16#3FD#;
    Xk_U_Macron : constant X_Lib.Keyboard.Key_Sym := 16#3FE#;

    --
    -- Katakana
    -- Byte 3 = 4
    --
    Xk_Overline : constant X_Lib.Keyboard.Key_Sym := 16#47E#;
    Xk_Kana_Fullstop : constant X_Lib.Keyboard.Key_Sym := 16#4A1#;
    Xk_Kana_Opening_Bracket : constant X_Lib.Keyboard.Key_Sym := 16#4A2#;
    Xk_Kana_Closing_Bracket : constant X_Lib.Keyboard.Key_Sym := 16#4A3#;
    Xk_Kana_Comma : constant X_Lib.Keyboard.Key_Sym := 16#4A4#;
    Xk_Kana_Middle_Dot : constant X_Lib.Keyboard.Key_Sym := 16#4A5#;
    Xk_Katakana_Wo : constant X_Lib.Keyboard.Key_Sym := 16#4A6#;
    Xk_Katakana_A : constant X_Lib.Keyboard.Key_Sym := 16#4A7#;
    Xk_Katakana_I : constant X_Lib.Keyboard.Key_Sym := 16#4A8#;
    Xk_Katakana_U : constant X_Lib.Keyboard.Key_Sym := 16#4A9#;
    Xk_Katakana_E : constant X_Lib.Keyboard.Key_Sym := 16#4AA#;
    Xk_Katakana_O : constant X_Lib.Keyboard.Key_Sym := 16#4AB#;
    Xk_Ya : constant X_Lib.Keyboard.Key_Sym := 16#4AC#;
    Xk_Yu : constant X_Lib.Keyboard.Key_Sym := 16#4AD#;
    Xk_Yo : constant X_Lib.Keyboard.Key_Sym := 16#4AE#;
    Xk_Tu : constant X_Lib.Keyboard.Key_Sym := 16#4AF#;
    Xk_Prolonged_Sound : constant X_Lib.Keyboard.Key_Sym := 16#4B0#;
    Xk_Uc_A : constant X_Lib.Keyboard.Key_Sym := 16#4B1#;
    Xk_Uc_I : constant X_Lib.Keyboard.Key_Sym := 16#4B2#;
    Xk_Uc_U : constant X_Lib.Keyboard.Key_Sym := 16#4B3#;
    Xk_Uc_E : constant X_Lib.Keyboard.Key_Sym := 16#4B4#;
    Xk_Uc_O : constant X_Lib.Keyboard.Key_Sym := 16#4B5#;
    Xk_Kana_Ka : constant X_Lib.Keyboard.Key_Sym := 16#4B6#;
    Xk_Kana_Ki : constant X_Lib.Keyboard.Key_Sym := 16#4B7#;
    Xk_Kana_Ku : constant X_Lib.Keyboard.Key_Sym := 16#4B8#;
    Xk_Kana_Ke : constant X_Lib.Keyboard.Key_Sym := 16#4B9#;
    Xk_Kana_Ko : constant X_Lib.Keyboard.Key_Sym := 16#4BA#;
    Xk_Kana_Sa : constant X_Lib.Keyboard.Key_Sym := 16#4BB#;
    Xk_Kana_Shi : constant X_Lib.Keyboard.Key_Sym := 16#4BC#;
    Xk_Kana_Su : constant X_Lib.Keyboard.Key_Sym := 16#4BD#;
    Xk_Kana_Se : constant X_Lib.Keyboard.Key_Sym := 16#4BE#;
    Xk_Kana_So : constant X_Lib.Keyboard.Key_Sym := 16#4BF#;
    Xk_Kana_Ta : constant X_Lib.Keyboard.Key_Sym := 16#4C0#;
    Xk_Kana_Ti : constant X_Lib.Keyboard.Key_Sym := 16#4C1#;
    Xk_Kana_Tu : constant X_Lib.Keyboard.Key_Sym := 16#4C2#;
    Xk_Kana_Te : constant X_Lib.Keyboard.Key_Sym := 16#4C3#;
    Xk_Kana_To : constant X_Lib.Keyboard.Key_Sym := 16#4C4#;
    Xk_Kana_Na : constant X_Lib.Keyboard.Key_Sym := 16#4C5#;
    Xk_Kana_Ni : constant X_Lib.Keyboard.Key_Sym := 16#4C6#;
    Xk_Kana_Nu : constant X_Lib.Keyboard.Key_Sym := 16#4C7#;
    Xk_Kana_Ne : constant X_Lib.Keyboard.Key_Sym := 16#4C8#;
    Xk_Kana_No : constant X_Lib.Keyboard.Key_Sym := 16#4C9#;
    Xk_Kana_Ha : constant X_Lib.Keyboard.Key_Sym := 16#4CA#;
    Xk_Kana_Hi : constant X_Lib.Keyboard.Key_Sym := 16#4CB#;
    Xk_Kana_Hu : constant X_Lib.Keyboard.Key_Sym := 16#4CC#;
    Xk_Kana_He : constant X_Lib.Keyboard.Key_Sym := 16#4CD#;
    Xk_Kana_Ho : constant X_Lib.Keyboard.Key_Sym := 16#4CE#;
    Xk_Kana_Ma : constant X_Lib.Keyboard.Key_Sym := 16#4CF#;
    Xk_Kana_Mi : constant X_Lib.Keyboard.Key_Sym := 16#4D0#;
    Xk_Kana_Mu : constant X_Lib.Keyboard.Key_Sym := 16#4D1#;
    Xk_Kana_Me : constant X_Lib.Keyboard.Key_Sym := 16#4D2#;
    Xk_Kana_Mo : constant X_Lib.Keyboard.Key_Sym := 16#4D3#;
    Xk_Kana_Ya : constant X_Lib.Keyboard.Key_Sym := 16#4D4#;
    Xk_Kana_Yu : constant X_Lib.Keyboard.Key_Sym := 16#4D5#;
    Xk_Kana_Yo : constant X_Lib.Keyboard.Key_Sym := 16#4D6#;
    Xk_Kana_Ra : constant X_Lib.Keyboard.Key_Sym := 16#4D7#;
    Xk_Kana_Ri : constant X_Lib.Keyboard.Key_Sym := 16#4D8#;
    Xk_Kana_Ru : constant X_Lib.Keyboard.Key_Sym := 16#4D9#;
    Xk_Kana_Re : constant X_Lib.Keyboard.Key_Sym := 16#4DA#;
    Xk_Kana_Ro : constant X_Lib.Keyboard.Key_Sym := 16#4DB#;
    Xk_Kana_Wa : constant X_Lib.Keyboard.Key_Sym := 16#4DC#;
    Xk_Kana_N : constant X_Lib.Keyboard.Key_Sym := 16#4DD#;
    Xk_Voiced_Sound : constant X_Lib.Keyboard.Key_Sym := 16#4DE#;
    Xk_Semivoiced_Sound : constant X_Lib.Keyboard.Key_Sym := 16#4DF#;

    Xk_Kana_Switch : constant X_Lib.Keyboard.Key_Sym := Xk_Mode_Switch;

    --
    -- Arabic
    -- Byte 3 = 5
    --
    Xk_Arabic_Comma : constant X_Lib.Keyboard.Key_Sym := 16#5AC#;
    Xk_Arabic_Semicolon : constant X_Lib.Keyboard.Key_Sym := 16#5BB#;
    Xk_Arabic_Question_Mark : constant X_Lib.Keyboard.Key_Sym := 16#5BF#;
    Xk_Arabic_Hamza : constant X_Lib.Keyboard.Key_Sym := 16#5C1#;
    Xk_Arabic_Madda_On_Alef : constant X_Lib.Keyboard.Key_Sym := 16#5C2#;
    Xk_Arabic_Hamza_On_Alef : constant X_Lib.Keyboard.Key_Sym := 16#5C3#;
    Xk_Arabic_Hamza_On_Waw : constant X_Lib.Keyboard.Key_Sym := 16#5C4#;
    Xk_Arabic_Hamza_Under_Alef : constant X_Lib.Keyboard.Key_Sym := 16#5C5#;
    Xk_Arabic_Hamza_On_Yeh : constant X_Lib.Keyboard.Key_Sym := 16#5C6#;
    Xk_Arabic_Alef : constant X_Lib.Keyboard.Key_Sym := 16#5C7#;
    Xk_Arabic_Beh : constant X_Lib.Keyboard.Key_Sym := 16#5C8#;
    Xk_Arabic_Tehmarbuta : constant X_Lib.Keyboard.Key_Sym := 16#5C9#;
    Xk_Arabic_Teh : constant X_Lib.Keyboard.Key_Sym := 16#5CA#;
    Xk_Arabic_Theh : constant X_Lib.Keyboard.Key_Sym := 16#5CB#;
    Xk_Arabic_Jeem : constant X_Lib.Keyboard.Key_Sym := 16#5CC#;
    Xk_Arabic_Hah : constant X_Lib.Keyboard.Key_Sym := 16#5CD#;
    Xk_Arabic_Khah : constant X_Lib.Keyboard.Key_Sym := 16#5CE#;
    Xk_Arabic_Dal : constant X_Lib.Keyboard.Key_Sym := 16#5CF#;
    Xk_Arabic_Thal : constant X_Lib.Keyboard.Key_Sym := 16#5D0#;
    Xk_Arabic_Ra : constant X_Lib.Keyboard.Key_Sym := 16#5D1#;
    Xk_Arabic_Zain : constant X_Lib.Keyboard.Key_Sym := 16#5D2#;
    Xk_Arabic_Seen : constant X_Lib.Keyboard.Key_Sym := 16#5D3#;
    Xk_Arabic_Sheen : constant X_Lib.Keyboard.Key_Sym := 16#5D4#;
    Xk_Arabic_Sad : constant X_Lib.Keyboard.Key_Sym := 16#5D5#;
    Xk_Arabic_Dad : constant X_Lib.Keyboard.Key_Sym := 16#5D6#;
    Xk_Arabic_Tah : constant X_Lib.Keyboard.Key_Sym := 16#5D7#;
    Xk_Arabic_Zah : constant X_Lib.Keyboard.Key_Sym := 16#5D8#;
    Xk_Arabic_Ain : constant X_Lib.Keyboard.Key_Sym := 16#5D9#;
    Xk_Arabic_Ghain : constant X_Lib.Keyboard.Key_Sym := 16#5DA#;
    Xk_Arabic_Tatweel : constant X_Lib.Keyboard.Key_Sym := 16#5E0#;
    Xk_Arabic_Feh : constant X_Lib.Keyboard.Key_Sym := 16#5E1#;
    Xk_Arabic_Qaf : constant X_Lib.Keyboard.Key_Sym := 16#5E2#;
    Xk_Arabic_Kaf : constant X_Lib.Keyboard.Key_Sym := 16#5E3#;
    Xk_Arabic_Lam : constant X_Lib.Keyboard.Key_Sym := 16#5E4#;
    Xk_Arabic_Meem : constant X_Lib.Keyboard.Key_Sym := 16#5E5#;
    Xk_Arabic_Noon : constant X_Lib.Keyboard.Key_Sym := 16#5E6#;
    Xk_Arabic_Heh : constant X_Lib.Keyboard.Key_Sym := 16#5E7#;
    Xk_Arabic_Waw : constant X_Lib.Keyboard.Key_Sym := 16#5E8#;
    Xk_Arabic_Alef_Maksura : constant X_Lib.Keyboard.Key_Sym := 16#5E9#;
    Xk_Arabic_Yeh : constant X_Lib.Keyboard.Key_Sym := 16#5EA#;
    Xk_Arabic_Fatha_Tan : constant X_Lib.Keyboard.Key_Sym := 16#5EB#;
    Xk_Arabic_Damma_Tan : constant X_Lib.Keyboard.Key_Sym := 16#5EC#;
    Xk_Arabic_Kasra_Tan : constant X_Lib.Keyboard.Key_Sym := 16#5ED#;
    Xk_Arabic_Fatha : constant X_Lib.Keyboard.Key_Sym := 16#5EE#;
    Xk_Arabic_Damma : constant X_Lib.Keyboard.Key_Sym := 16#5EF#;
    Xk_Arabic_Kasra : constant X_Lib.Keyboard.Key_Sym := 16#5F0#;
    Xk_Arabic_Shadda : constant X_Lib.Keyboard.Key_Sym := 16#5F1#;
    Xk_Arabic_Sukun : constant X_Lib.Keyboard.Key_Sym := 16#5F2#;

    Xk_Arabic_Switch : constant X_Lib.Keyboard.Key_Sym := Xk_Mode_Switch;

    -- Cyrillic
    -- Byte 3 = 6
    --
    Xk_Serbian_Dje : constant X_Lib.Keyboard.Key_Sym := 16#6A1#;
    Xk_Macedonia_Gje : constant X_Lib.Keyboard.Key_Sym := 16#6A2#;
    Xk_Cyrillic_Io : constant X_Lib.Keyboard.Key_Sym := 16#6A3#;
    Xk_Ukranian_Je : constant X_Lib.Keyboard.Key_Sym := 16#6A4#;
    Xk_Macedonia_Dse : constant X_Lib.Keyboard.Key_Sym := 16#6A5#;
    Xk_Ukranian_I : constant X_Lib.Keyboard.Key_Sym := 16#6A6#;
    Xk_Ukranian_Yi : constant X_Lib.Keyboard.Key_Sym := 16#6A7#;
    Xk_Serbian_Je : constant X_Lib.Keyboard.Key_Sym := 16#6A8#;
    Xk_Serbian_Lje : constant X_Lib.Keyboard.Key_Sym := 16#6A9#;
    Xk_Serbian_Nje : constant X_Lib.Keyboard.Key_Sym := 16#6AA#;
    Xk_Serbian_Tshe : constant X_Lib.Keyboard.Key_Sym := 16#6AB#;
    Xk_Macedonia_Kje : constant X_Lib.Keyboard.Key_Sym := 16#6AC#;
    Xk_Byelorussian_Shortu : constant X_Lib.Keyboard.Key_Sym := 16#6AE#;
    Xk_Serbian_Dze : constant X_Lib.Keyboard.Key_Sym := 16#6AF#;
    Xk_Numerosign : constant X_Lib.Keyboard.Key_Sym := 16#6B0#;
    Xk_Serbian_Uc_Dje : constant X_Lib.Keyboard.Key_Sym := 16#6B1#;
    Xk_Macedonia_Uc_Gje : constant X_Lib.Keyboard.Key_Sym := 16#6B2#;
    Xk_Cyrillic_Uc_Io : constant X_Lib.Keyboard.Key_Sym := 16#6B3#;
    Xk_Ukranian_Uc_Je : constant X_Lib.Keyboard.Key_Sym := 16#6B4#;
    Xk_Macedonia_Uc_Dse : constant X_Lib.Keyboard.Key_Sym := 16#6B5#;
    Xk_Ukranian_Uc_I : constant X_Lib.Keyboard.Key_Sym := 16#6B6#;
    Xk_Ukranian_Uc_Yi : constant X_Lib.Keyboard.Key_Sym := 16#6B7#;
    Xk_Serbian_Uc_Je : constant X_Lib.Keyboard.Key_Sym := 16#6B8#;
    Xk_Serbian_Uc_Lje : constant X_Lib.Keyboard.Key_Sym := 16#6B9#;
    Xk_Serbian_Uc_Nje : constant X_Lib.Keyboard.Key_Sym := 16#6BA#;
    Xk_Serbian_Uc_Tshe : constant X_Lib.Keyboard.Key_Sym := 16#6BB#;
    Xk_Macedonia_Uc_Kje : constant X_Lib.Keyboard.Key_Sym := 16#6BC#;
    Xk_Byelorussian_Uc_Shortu : constant X_Lib.Keyboard.Key_Sym := 16#6BE#;
    Xk_Serbian_Uc_Dze : constant X_Lib.Keyboard.Key_Sym := 16#6BF#;
    Xk_Cyrillic_Yu : constant X_Lib.Keyboard.Key_Sym := 16#6C0#;
    Xk_Cyrillic_A : constant X_Lib.Keyboard.Key_Sym := 16#6C1#;
    Xk_Cyrillic_Be : constant X_Lib.Keyboard.Key_Sym := 16#6C2#;
    Xk_Cyrillic_Tse : constant X_Lib.Keyboard.Key_Sym := 16#6C3#;
    Xk_Cyrillic_De : constant X_Lib.Keyboard.Key_Sym := 16#6C4#;
    Xk_Cyrillic_Ie : constant X_Lib.Keyboard.Key_Sym := 16#6C5#;
    Xk_Cyrillic_Ef : constant X_Lib.Keyboard.Key_Sym := 16#6C6#;
    Xk_Cyrillic_Ghe : constant X_Lib.Keyboard.Key_Sym := 16#6C7#;
    Xk_Cyrillic_Ha : constant X_Lib.Keyboard.Key_Sym := 16#6C8#;
    Xk_Cyrillic_I : constant X_Lib.Keyboard.Key_Sym := 16#6C9#;
    Xk_Cyrillic_Shorti : constant X_Lib.Keyboard.Key_Sym := 16#6CA#;
    Xk_Cyrillic_Ka : constant X_Lib.Keyboard.Key_Sym := 16#6CB#;
    Xk_Cyrillic_El : constant X_Lib.Keyboard.Key_Sym := 16#6CC#;
    Xk_Cyrillic_Em : constant X_Lib.Keyboard.Key_Sym := 16#6CD#;
    Xk_Cyrillic_En : constant X_Lib.Keyboard.Key_Sym := 16#6CE#;
    Xk_Cyrillic_O : constant X_Lib.Keyboard.Key_Sym := 16#6CF#;
    Xk_Cyrillic_Pe : constant X_Lib.Keyboard.Key_Sym := 16#6D0#;
    Xk_Cyrillic_Ya : constant X_Lib.Keyboard.Key_Sym := 16#6D1#;
    Xk_Cyrillic_Er : constant X_Lib.Keyboard.Key_Sym := 16#6D2#;
    Xk_Cyrillic_Es : constant X_Lib.Keyboard.Key_Sym := 16#6D3#;
    Xk_Cyrillic_Te : constant X_Lib.Keyboard.Key_Sym := 16#6D4#;
    Xk_Cyrillic_U : constant X_Lib.Keyboard.Key_Sym := 16#6D5#;
    Xk_Cyrillic_Zhe : constant X_Lib.Keyboard.Key_Sym := 16#6D6#;
    Xk_Cyrillic_Ve : constant X_Lib.Keyboard.Key_Sym := 16#6D7#;
    Xk_Cyrillic_Softsign : constant X_Lib.Keyboard.Key_Sym := 16#6D8#;
    Xk_Cyrillic_Yeru : constant X_Lib.Keyboard.Key_Sym := 16#6D9#;
    Xk_Cyrillic_Ze : constant X_Lib.Keyboard.Key_Sym := 16#6DA#;
    Xk_Cyrillic_Sha : constant X_Lib.Keyboard.Key_Sym := 16#6DB#;
    Xk_Cyrillic_E : constant X_Lib.Keyboard.Key_Sym := 16#6DC#;
    Xk_Cyrillic_Shcha : constant X_Lib.Keyboard.Key_Sym := 16#6DD#;
    Xk_Cyrillic_Che : constant X_Lib.Keyboard.Key_Sym := 16#6DE#;
    Xk_Cyrillic_Hardsign : constant X_Lib.Keyboard.Key_Sym := 16#6DF#;
    Xk_Cyrillic_Uc_Yu : constant X_Lib.Keyboard.Key_Sym := 16#6E0#;
    Xk_Cyrillic_Uc_A : constant X_Lib.Keyboard.Key_Sym := 16#6E1#;
    Xk_Cyrillic_Uc_Be : constant X_Lib.Keyboard.Key_Sym := 16#6E2#;
    Xk_Cyrillic_Uc_Tse : constant X_Lib.Keyboard.Key_Sym := 16#6E3#;
    Xk_Cyrillic_Uc_De : constant X_Lib.Keyboard.Key_Sym := 16#6E4#;
    Xk_Cyrillic_Uc_Ie : constant X_Lib.Keyboard.Key_Sym := 16#6E5#;
    Xk_Cyrillic_Uc_Ef : constant X_Lib.Keyboard.Key_Sym := 16#6E6#;
    Xk_Cyrillic_Uc_Ghe : constant X_Lib.Keyboard.Key_Sym := 16#6E7#;
    Xk_Cyrillic_Uc_Ha : constant X_Lib.Keyboard.Key_Sym := 16#6E8#;
    Xk_Cyrillic_Uc_I : constant X_Lib.Keyboard.Key_Sym := 16#6E9#;
    Xk_Cyrillic_Uc_Shorti : constant X_Lib.Keyboard.Key_Sym := 16#6EA#;
    Xk_Cyrillic_Uc_Ka : constant X_Lib.Keyboard.Key_Sym := 16#6EB#;
    Xk_Cyrillic_Uc_El : constant X_Lib.Keyboard.Key_Sym := 16#6EC#;
    Xk_Cyrillic_Uc_Em : constant X_Lib.Keyboard.Key_Sym := 16#6ED#;
    Xk_Cyrillic_Uc_En : constant X_Lib.Keyboard.Key_Sym := 16#6EE#;
    Xk_Cyrillic_Uc_O : constant X_Lib.Keyboard.Key_Sym := 16#6EF#;
    Xk_Cyrillic_Uc_Pe : constant X_Lib.Keyboard.Key_Sym := 16#6F0#;
    Xk_Cyrillic_Uc_Ya : constant X_Lib.Keyboard.Key_Sym := 16#6F1#;
    Xk_Cyrillic_Uc_Er : constant X_Lib.Keyboard.Key_Sym := 16#6F2#;
    Xk_Cyrillic_Uc_Es : constant X_Lib.Keyboard.Key_Sym := 16#6F3#;
    Xk_Cyrillic_Uc_Te : constant X_Lib.Keyboard.Key_Sym := 16#6F4#;
    Xk_Cyrillic_Uc_U : constant X_Lib.Keyboard.Key_Sym := 16#6F5#;
    Xk_Cyrillic_Uc_Zhe : constant X_Lib.Keyboard.Key_Sym := 16#6F6#;
    Xk_Cyrillic_Uc_Ve : constant X_Lib.Keyboard.Key_Sym := 16#6F7#;
    Xk_Cyrillic_Uc_Softsign : constant X_Lib.Keyboard.Key_Sym := 16#6F8#;
    Xk_Cyrillic_Uc_Yeru : constant X_Lib.Keyboard.Key_Sym := 16#6F9#;
    Xk_Cyrillic_Uc_Ze : constant X_Lib.Keyboard.Key_Sym := 16#6FA#;
    Xk_Cyrillic_Uc_Sha : constant X_Lib.Keyboard.Key_Sym := 16#6FB#;
    Xk_Cyrillic_Uc_E : constant X_Lib.Keyboard.Key_Sym := 16#6FC#;
    Xk_Cyrillic_Uc_Shcha : constant X_Lib.Keyboard.Key_Sym := 16#6FD#;
    Xk_Cyrillic_Uc_Che : constant X_Lib.Keyboard.Key_Sym := 16#6FE#;
    Xk_Cyrillic_Uc_Hardsign : constant X_Lib.Keyboard.Key_Sym := 16#6FF#;

    -- Greek
    -- Byte 3 = 7
    --
    Xk_Greek_Uc_Alpha_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7A1#;
    Xk_Greek_Uc_Epsilon_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7A2#;
    Xk_Greek_Uc_Eta_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7A3#;
    Xk_Greek_Uc_Iota_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7A4#;
    Xk_Greek_Uc_Iota_Diaeresis : constant X_Lib.Keyboard.Key_Sym := 16#7A5#;
    Xk_Greek_Uc_Iota_Accent_Diaeresis :
       constant X_Lib.Keyboard.Key_Sym := 16#7A6#;
    Xk_Greek_Uc_Omicron_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7A7#;
    Xk_Greek_Uc_Upsilon_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7A8#;
    Xk_Greek_Uc_Upsilon_Dieresis : constant X_Lib.Keyboard.Key_Sym := 16#7A9#;
    Xk_Greek_Uc_Upsilon_Accent_Dieresis :
       constant X_Lib.Keyboard.Key_Sym := 16#7AA#;
    Xk_Greek_Uc_Omega_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7AB#;

    Xk_Greek_Alpha_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7B1#;
    Xk_Greek_Epsilon_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7B2#;
    Xk_Greek_Eta_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7B3#;
    Xk_Greek_Iota_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7B4#;
    Xk_Greek_Iota_Dieresis : constant X_Lib.Keyboard.Key_Sym := 16#7B5#;
    Xk_Greek_Iota_Accent_Dieresis : constant X_Lib.Keyboard.Key_Sym := 16#7B6#;
    Xk_Greek_Omicron_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7B7#;
    Xk_Greek_Upsilon_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7B8#;
    Xk_Greek_Upsilon_Dieresis : constant X_Lib.Keyboard.Key_Sym := 16#7B9#;
    Xk_Greek_Upsilon_Accent_Dieresis :
       constant X_Lib.Keyboard.Key_Sym := 16#7BA#;
    Xk_Greek_Omega_Accent : constant X_Lib.Keyboard.Key_Sym := 16#7BB#;

    Xk_Greek_Uc_Alpha : constant X_Lib.Keyboard.Key_Sym := 16#7C1#;
    Xk_Greek_Uc_Beta : constant X_Lib.Keyboard.Key_Sym := 16#7C2#;
    Xk_Greek_Uc_Gamma : constant X_Lib.Keyboard.Key_Sym := 16#7C3#;
    Xk_Greek_Uc_Delta : constant X_Lib.Keyboard.Key_Sym := 16#7C4#;
    Xk_Greek_Uc_Epsilon : constant X_Lib.Keyboard.Key_Sym := 16#7C5#;
    Xk_Greek_Uc_Zeta : constant X_Lib.Keyboard.Key_Sym := 16#7C6#;
    Xk_Greek_Uc_Eta : constant X_Lib.Keyboard.Key_Sym := 16#7C7#;
    Xk_Greek_Uc_Theta : constant X_Lib.Keyboard.Key_Sym := 16#7C8#;
    Xk_Greek_Uc_Iota : constant X_Lib.Keyboard.Key_Sym := 16#7C9#;
    Xk_Greek_Uc_Kappa : constant X_Lib.Keyboard.Key_Sym := 16#7CA#;
    Xk_Greek_Uc_Lambda : constant X_Lib.Keyboard.Key_Sym := 16#7CB#;
    Xk_Greek_Uc_Mu : constant X_Lib.Keyboard.Key_Sym := 16#7CC#;
    Xk_Greek_Uc_Nu : constant X_Lib.Keyboard.Key_Sym := 16#7CD#;
    Xk_Greek_Uc_Xi : constant X_Lib.Keyboard.Key_Sym := 16#7CE#;
    Xk_Greek_Uc_Omicron : constant X_Lib.Keyboard.Key_Sym := 16#7CF#;
    Xk_Greek_Uc_Pi : constant X_Lib.Keyboard.Key_Sym := 16#7D0#;
    Xk_Greek_Uc_Rho : constant X_Lib.Keyboard.Key_Sym := 16#7D1#;
    Xk_Greek_Uc_Sigma : constant X_Lib.Keyboard.Key_Sym := 16#7D2#;
    Xk_Greek_Uc_Tau : constant X_Lib.Keyboard.Key_Sym := 16#7D4#;
    Xk_Greek_Uc_Upsilon : constant X_Lib.Keyboard.Key_Sym := 16#7D5#;
    Xk_Greek_Uc_Phi : constant X_Lib.Keyboard.Key_Sym := 16#7D6#;
    Xk_Greek_Uc_Chi : constant X_Lib.Keyboard.Key_Sym := 16#7D7#;
    Xk_Greek_Uc_Psi : constant X_Lib.Keyboard.Key_Sym := 16#7D8#;
    Xk_Greek_Uc_Omega : constant X_Lib.Keyboard.Key_Sym := 16#7D9#;

    Xk_Greek_Alpha : constant X_Lib.Keyboard.Key_Sym := 16#7E1#;
    Xk_Greek_Beta : constant X_Lib.Keyboard.Key_Sym := 16#7E2#;
    Xk_Greek_Gamma : constant X_Lib.Keyboard.Key_Sym := 16#7E3#;
    Xk_Greek_Delta : constant X_Lib.Keyboard.Key_Sym := 16#7E4#;
    Xk_Greek_Epsilon : constant X_Lib.Keyboard.Key_Sym := 16#7E5#;
    Xk_Greek_Zeta : constant X_Lib.Keyboard.Key_Sym := 16#7E6#;
    Xk_Greek_Eta : constant X_Lib.Keyboard.Key_Sym := 16#7E7#;
    Xk_Greek_Theta : constant X_Lib.Keyboard.Key_Sym := 16#7E8#;
    Xk_Greek_Iota : constant X_Lib.Keyboard.Key_Sym := 16#7E9#;
    Xk_Greek_Kappa : constant X_Lib.Keyboard.Key_Sym := 16#7EA#;
    Xk_Greek_Lambda : constant X_Lib.Keyboard.Key_Sym := 16#7EB#;
    Xk_Greek_Mu : constant X_Lib.Keyboard.Key_Sym := 16#7EC#;
    Xk_Greek_Nu : constant X_Lib.Keyboard.Key_Sym := 16#7ED#;
    Xk_Greek_Xi : constant X_Lib.Keyboard.Key_Sym := 16#7EE#;
    Xk_Greek_Omicron : constant X_Lib.Keyboard.Key_Sym := 16#7EF#;
    Xk_Greek_Pi : constant X_Lib.Keyboard.Key_Sym := 16#7F0#;
    Xk_Greek_Rho : constant X_Lib.Keyboard.Key_Sym := 16#7F1#;
    Xk_Greek_Sigma : constant X_Lib.Keyboard.Key_Sym := 16#7F2#;
    Xk_Greek_Final_Small_Sigma : constant X_Lib.Keyboard.Key_Sym := 16#7F3#;
    Xk_Greek_Tau : constant X_Lib.Keyboard.Key_Sym := 16#7F4#;
    Xk_Greek_Upsilon : constant X_Lib.Keyboard.Key_Sym := 16#7F5#;
    Xk_Greek_Phi : constant X_Lib.Keyboard.Key_Sym := 16#7F6#;
    Xk_Greek_Chi : constant X_Lib.Keyboard.Key_Sym := 16#7F7#;
    Xk_Greek_Psi : constant X_Lib.Keyboard.Key_Sym := 16#7F8#;
    Xk_Greek_Omega : constant X_Lib.Keyboard.Key_Sym := 16#7F9#;

    Xk_Greek_Switch : constant X_Lib.Keyboard.Key_Sym := Xk_Mode_Switch;

    -- Technical
    -- Byte 3 = 8
    --
    Xk_Left_Radical : constant X_Lib.Keyboard.Key_Sym := 16#8A1#;
    Xk_Top_Left_Radical : constant X_Lib.Keyboard.Key_Sym := 16#8A2#;
    Xk_Horiz_Connector : constant X_Lib.Keyboard.Key_Sym := 16#8A3#;
    Xk_Top_Integral : constant X_Lib.Keyboard.Key_Sym := 16#8A4#;
    Xk_Bot_Integral : constant X_Lib.Keyboard.Key_Sym := 16#8A5#;
    Xk_Vert_Connector : constant X_Lib.Keyboard.Key_Sym := 16#8A6#;
    Xk_Top_Left_Sq_Bracket : constant X_Lib.Keyboard.Key_Sym := 16#8A7#;
    Xk_Bot_Left_Sq_Bracket : constant X_Lib.Keyboard.Key_Sym := 16#8A8#;
    Xk_Top_Right_Sq_Bracket : constant X_Lib.Keyboard.Key_Sym := 16#8A9#;
    Xk_Bot_Right_Sq_Bracket : constant X_Lib.Keyboard.Key_Sym := 16#8AA#;
    Xk_Top_Left_Parens : constant X_Lib.Keyboard.Key_Sym := 16#8AB#;
    Xk_Bot_Left_Parens : constant X_Lib.Keyboard.Key_Sym := 16#8AC#;
    Xk_Top_Right_Parens : constant X_Lib.Keyboard.Key_Sym := 16#8AD#;
    Xk_Bot_Right_Parens : constant X_Lib.Keyboard.Key_Sym := 16#8AE#;
    Xk_Left_Middle_Curly_Brace : constant X_Lib.Keyboard.Key_Sym := 16#8AF#;
    Xk_Right_Middle_Curly_Brace : constant X_Lib.Keyboard.Key_Sym := 16#8B0#;
    Xk_Top_Left_Summation : constant X_Lib.Keyboard.Key_Sym := 16#8B1#;
    Xk_Bot_Left_Summation : constant X_Lib.Keyboard.Key_Sym := 16#8B2#;
    Xk_Top_Vert_Summation_Connector :
       constant X_Lib.Keyboard.Key_Sym := 16#8B3#;
    Xk_Bot_Vert_Summation_Connector :
       constant X_Lib.Keyboard.Key_Sym := 16#8B4#;
    Xk_Top_Right_Summation : constant X_Lib.Keyboard.Key_Sym := 16#8B5#;
    Xk_Bot_Right_Summation : constant X_Lib.Keyboard.Key_Sym := 16#8B6#;
    Xk_Right_Middle_Summation : constant X_Lib.Keyboard.Key_Sym := 16#8B7#;
    Xk_Less_Than_Equal : constant X_Lib.Keyboard.Key_Sym := 16#8BC#;
    Xk_Not_Equal : constant X_Lib.Keyboard.Key_Sym := 16#8BD#;
    Xk_Greater_Than_Equal : constant X_Lib.Keyboard.Key_Sym := 16#8BE#;
    Xk_Integral : constant X_Lib.Keyboard.Key_Sym := 16#8BF#;
    Xk_Therefore : constant X_Lib.Keyboard.Key_Sym := 16#8C0#;
    Xk_Variation : constant X_Lib.Keyboard.Key_Sym := 16#8C1#;
    Xk_Infinity : constant X_Lib.Keyboard.Key_Sym := 16#8C2#;
    Xk_Nabla : constant X_Lib.Keyboard.Key_Sym := 16#8C5#;
    Xk_Approximate : constant X_Lib.Keyboard.Key_Sym := 16#8C8#;
    Xk_Similar_Equal : constant X_Lib.Keyboard.Key_Sym := 16#8C9#;
    Xk_If_Only_If : constant X_Lib.Keyboard.Key_Sym := 16#8CD#;
    Xk_Implies : constant X_Lib.Keyboard.Key_Sym := 16#8CE#;
    Xk_Identical : constant X_Lib.Keyboard.Key_Sym := 16#8CF#;
    Xk_Radical : constant X_Lib.Keyboard.Key_Sym := 16#8D6#;
    Xk_Included_In : constant X_Lib.Keyboard.Key_Sym := 16#8DA#;
    Xk_Includes : constant X_Lib.Keyboard.Key_Sym := 16#8DB#;
    Xk_Intersection : constant X_Lib.Keyboard.Key_Sym := 16#8DC#;
    Xk_Union : constant X_Lib.Keyboard.Key_Sym := 16#8DD#;
    Xk_Logical_And : constant X_Lib.Keyboard.Key_Sym := 16#8DE#;
    Xk_Logical_Or : constant X_Lib.Keyboard.Key_Sym := 16#8DF#;
    Xk_Partial_Derivative : constant X_Lib.Keyboard.Key_Sym := 16#8EF#;
    Xk_Function : constant X_Lib.Keyboard.Key_Sym := 16#8F6#;
    Xk_Left_Arrow : constant X_Lib.Keyboard.Key_Sym := 16#8FB#;
    Xk_Up_Arrow : constant X_Lib.Keyboard.Key_Sym := 16#8FC#;
    Xk_Right_Arrow : constant X_Lib.Keyboard.Key_Sym := 16#8FD#;
    Xk_Down_Arrow : constant X_Lib.Keyboard.Key_Sym := 16#8FE#;

    --  Special
    --  Byte 3 = 9
    --
    Xk_Blank : constant X_Lib.Keyboard.Key_Sym := 16#9DF#;
    Xk_Solid_Diamond : constant X_Lib.Keyboard.Key_Sym := 16#9E0#;
    Xk_Checker_Board : constant X_Lib.Keyboard.Key_Sym := 16#9E1#;
    Xk_Ht : constant X_Lib.Keyboard.Key_Sym := 16#9E2#;
    Xk_Ff : constant X_Lib.Keyboard.Key_Sym := 16#9E3#;
    Xk_Cr : constant X_Lib.Keyboard.Key_Sym := 16#9E4#;
    Xk_Lf : constant X_Lib.Keyboard.Key_Sym := 16#9E5#;
    Xk_Nl : constant X_Lib.Keyboard.Key_Sym := 16#9E8#;
    Xk_Vt : constant X_Lib.Keyboard.Key_Sym := 16#9E9#;
    Xk_Low_Right_Corner : constant X_Lib.Keyboard.Key_Sym := 16#9EA#;
    Xk_Up_Right_Corner : constant X_Lib.Keyboard.Key_Sym := 16#9EB#;
    Xk_Up_Left_Corner : constant X_Lib.Keyboard.Key_Sym := 16#9EC#;
    Xk_Low_Left_Corner : constant X_Lib.Keyboard.Key_Sym := 16#9ED#;
    Xk_Crossing_Lines : constant X_Lib.Keyboard.Key_Sym := 16#9EE#;
    Xk_Horiz_Line_Scan_1 : constant X_Lib.Keyboard.Key_Sym := 16#9EF#;
    Xk_Horiz_Line_Scan_3 : constant X_Lib.Keyboard.Key_Sym := 16#9F0#;
    Xk_Horiz_Line_Scan_5 : constant X_Lib.Keyboard.Key_Sym := 16#9F1#;
    Xk_Horiz_Line_Scan_7 : constant X_Lib.Keyboard.Key_Sym := 16#9F2#;
    Xk_Horiz_Line_Scan_9 : constant X_Lib.Keyboard.Key_Sym := 16#9F3#;
    Xk_Left_T : constant X_Lib.Keyboard.Key_Sym := 16#9F4#;
    Xk_Right_T : constant X_Lib.Keyboard.Key_Sym := 16#9F5#;
    Xk_Bot_T : constant X_Lib.Keyboard.Key_Sym := 16#9F6#;
    Xk_Top_T : constant X_Lib.Keyboard.Key_Sym := 16#9F7#;
    Xk_Vert_Bar : constant X_Lib.Keyboard.Key_Sym := 16#9F8#;

    --  Publishing
    --  Byte 3 = a
    --
    Xk_Em_Space : constant X_Lib.Keyboard.Key_Sym := 16#AA1#;
    Xk_En_Space : constant X_Lib.Keyboard.Key_Sym := 16#AA2#;
    Xk_Em_3_Space : constant X_Lib.Keyboard.Key_Sym := 16#AA3#;
    Xk_Em_4_Space : constant X_Lib.Keyboard.Key_Sym := 16#AA4#;
    Xk_Digit_Space : constant X_Lib.Keyboard.Key_Sym := 16#AA5#;
    Xk_Punct_Space : constant X_Lib.Keyboard.Key_Sym := 16#AA6#;
    Xk_Thin_Space : constant X_Lib.Keyboard.Key_Sym := 16#AA7#;
    Xk_Hair_Space : constant X_Lib.Keyboard.Key_Sym := 16#AA8#;
    Xk_Em_Dash : constant X_Lib.Keyboard.Key_Sym := 16#AA9#;
    Xk_En_Dash : constant X_Lib.Keyboard.Key_Sym := 16#AAA#;
    Xk_Sign_If_Blank : constant X_Lib.Keyboard.Key_Sym := 16#AAC#;
    Xk_Ellipsis : constant X_Lib.Keyboard.Key_Sym := 16#AAE#;
    Xk_Doub_Baseline_Dot : constant X_Lib.Keyboard.Key_Sym := 16#AAF#;
    Xk_One_Third : constant X_Lib.Keyboard.Key_Sym := 16#AB0#;
    Xk_Two_Thirds : constant X_Lib.Keyboard.Key_Sym := 16#AB1#;
    Xk_One_Fifth : constant X_Lib.Keyboard.Key_Sym := 16#AB2#;
    Xk_Two_Fifths : constant X_Lib.Keyboard.Key_Sym := 16#AB3#;
    Xk_Three_Fifths : constant X_Lib.Keyboard.Key_Sym := 16#AB4#;
    Xk_Four_Fifths : constant X_Lib.Keyboard.Key_Sym := 16#AB5#;
    Xk_One_Sixth : constant X_Lib.Keyboard.Key_Sym := 16#AB6#;
    Xk_Five_Sixths : constant X_Lib.Keyboard.Key_Sym := 16#AB7#;
    Xk_Care_Of : constant X_Lib.Keyboard.Key_Sym := 16#AB8#;
    Xk_Fig_Dash : constant X_Lib.Keyboard.Key_Sym := 16#ABB#;
    Xk_Left_Angle_Bracket : constant X_Lib.Keyboard.Key_Sym := 16#ABC#;
    Xk_Decimal_Point : constant X_Lib.Keyboard.Key_Sym := 16#ABD#;
    Xk_Right_Angle_Bracket : constant X_Lib.Keyboard.Key_Sym := 16#ABE#;
    Xk_Marker : constant X_Lib.Keyboard.Key_Sym := 16#ABF#;
    Xk_One_Eighth : constant X_Lib.Keyboard.Key_Sym := 16#AC3#;
    Xk_Three_Eighths : constant X_Lib.Keyboard.Key_Sym := 16#AC4#;
    Xk_Five_Eighths : constant X_Lib.Keyboard.Key_Sym := 16#AC5#;
    Xk_Seven_Eighths : constant X_Lib.Keyboard.Key_Sym := 16#AC6#;
    Xk_Trade_Mark : constant X_Lib.Keyboard.Key_Sym := 16#AC9#;
    Xk_Signature_Mark : constant X_Lib.Keyboard.Key_Sym := 16#ACA#;
    Xk_Trademark_In_Circle : constant X_Lib.Keyboard.Key_Sym := 16#ACB#;
    Xk_Left_Open_Triangle : constant X_Lib.Keyboard.Key_Sym := 16#ACC#;
    Xk_Right_Open_Triangle : constant X_Lib.Keyboard.Key_Sym := 16#ACD#;
    Xk_Em_Open_Circle : constant X_Lib.Keyboard.Key_Sym := 16#ACE#;
    Xk_Em_Open_Rectangle : constant X_Lib.Keyboard.Key_Sym := 16#ACF#;
    Xk_Left_Single_Quotemark : constant X_Lib.Keyboard.Key_Sym := 16#AD0#;
    Xk_Right_Single_Quotemark : constant X_Lib.Keyboard.Key_Sym := 16#AD1#;
    Xk_Left_Double_Quotemark : constant X_Lib.Keyboard.Key_Sym := 16#AD2#;
    Xk_Right_Double_Quotemark : constant X_Lib.Keyboard.Key_Sym := 16#AD3#;
    Xk_Prescription : constant X_Lib.Keyboard.Key_Sym := 16#AD4#;
    Xk_Minutes : constant X_Lib.Keyboard.Key_Sym := 16#AD6#;
    Xk_Seconds : constant X_Lib.Keyboard.Key_Sym := 16#AD7#;
    Xk_Latin_Cross : constant X_Lib.Keyboard.Key_Sym := 16#AD9#;
    Xk_Hexagram : constant X_Lib.Keyboard.Key_Sym := 16#ADA#;
    Xk_Filled_Rect_Bullet : constant X_Lib.Keyboard.Key_Sym := 16#ADB#;
    Xk_Filled_Left_Tri_Bullet : constant X_Lib.Keyboard.Key_Sym := 16#ADC#;
    Xk_Filled_Right_Tri_Bullet : constant X_Lib.Keyboard.Key_Sym := 16#ADD#;
    Xk_Em_Filled_Circle : constant X_Lib.Keyboard.Key_Sym := 16#ADE#;
    Xk_Em_Filled_Rect : constant X_Lib.Keyboard.Key_Sym := 16#ADF#;
    Xk_En_Open_Circ_Bullet : constant X_Lib.Keyboard.Key_Sym := 16#AE0#;
    Xk_En_Open_Square_Bullet : constant X_Lib.Keyboard.Key_Sym := 16#AE1#;
    Xk_Open_Rect_Bullet : constant X_Lib.Keyboard.Key_Sym := 16#AE2#;
    Xk_Open_Tri_Bullet_Up : constant X_Lib.Keyboard.Key_Sym := 16#AE3#;
    Xk_Open_Tri_Bullet_Down : constant X_Lib.Keyboard.Key_Sym := 16#AE4#;
    Xk_Open_Star : constant X_Lib.Keyboard.Key_Sym := 16#AE5#;
    Xk_En_Filled_Circ_Bullet : constant X_Lib.Keyboard.Key_Sym := 16#AE6#;
    Xk_En_Filled_Sq_Bullet : constant X_Lib.Keyboard.Key_Sym := 16#AE7#;
    Xk_Filled_Tri_Bullet_Up : constant X_Lib.Keyboard.Key_Sym := 16#AE8#;
    Xk_Filled_Tri_Bullet_Down : constant X_Lib.Keyboard.Key_Sym := 16#AE9#;
    Xk_Left_Pointer : constant X_Lib.Keyboard.Key_Sym := 16#AEA#;
    Xk_Right_Pointer : constant X_Lib.Keyboard.Key_Sym := 16#AEB#;
    Xk_Club : constant X_Lib.Keyboard.Key_Sym := 16#AEC#;
    Xk_Diamond : constant X_Lib.Keyboard.Key_Sym := 16#AED#;
    Xk_Heart : constant X_Lib.Keyboard.Key_Sym := 16#AEE#;
    Xk_Maltese_Cross : constant X_Lib.Keyboard.Key_Sym := 16#AF0#;
    Xk_Dagger : constant X_Lib.Keyboard.Key_Sym := 16#AF1#;
    Xk_Double_Dagger : constant X_Lib.Keyboard.Key_Sym := 16#AF2#;
    Xk_Checkmark : constant X_Lib.Keyboard.Key_Sym := 16#AF3#;
    Xk_Ballot_Cross : constant X_Lib.Keyboard.Key_Sym := 16#AF4#;
    Xk_Musical_Sharp : constant X_Lib.Keyboard.Key_Sym := 16#AF5#;
    Xk_Musical_Flat : constant X_Lib.Keyboard.Key_Sym := 16#AF6#;
    Xk_Male_Symbol : constant X_Lib.Keyboard.Key_Sym := 16#AF7#;
    Xk_Female_Symbol : constant X_Lib.Keyboard.Key_Sym := 16#AF8#;
    Xk_Telephone : constant X_Lib.Keyboard.Key_Sym := 16#AF9#;
    Xk_Telephone_Recorder : constant X_Lib.Keyboard.Key_Sym := 16#AFA#;
    Xk_Phonograph_Copyright : constant X_Lib.Keyboard.Key_Sym := 16#AFB#;
    Xk_Caret : constant X_Lib.Keyboard.Key_Sym := 16#AFC#;
    Xk_Single_Low_Quote_Mark : constant X_Lib.Keyboard.Key_Sym := 16#AFD#;
    Xk_Double_Low_Quote_Mark : constant X_Lib.Keyboard.Key_Sym := 16#AFE#;
    Xk_Cursor : constant X_Lib.Keyboard.Key_Sym := 16#AFF#;

    --  APL
    --  Byte 3 = b
    --
    Xk_Left_Caret : constant X_Lib.Keyboard.Key_Sym := 16#BA3#;
    Xk_Right_Caret : constant X_Lib.Keyboard.Key_Sym := 16#BA6#;
    Xk_Down_Caret : constant X_Lib.Keyboard.Key_Sym := 16#BA8#;
    Xk_Up_Caret : constant X_Lib.Keyboard.Key_Sym := 16#BA9#;
    Xk_Over_Bar : constant X_Lib.Keyboard.Key_Sym := 16#BC0#;
    Xk_Down_Tack : constant X_Lib.Keyboard.Key_Sym := 16#BC2#;
    Xk_Up_Shoe : constant X_Lib.Keyboard.Key_Sym := 16#BC3#;
    Xk_Down_Stile : constant X_Lib.Keyboard.Key_Sym := 16#BC4#;
    Xk_Under_Bar : constant X_Lib.Keyboard.Key_Sym := 16#BC6#;
    Xk_Jot : constant X_Lib.Keyboard.Key_Sym := 16#BCA#;
    Xk_Quad : constant X_Lib.Keyboard.Key_Sym := 16#BCC#;
    Xk_Up_Tack : constant X_Lib.Keyboard.Key_Sym := 16#BCE#;
    Xk_Circle : constant X_Lib.Keyboard.Key_Sym := 16#BCF#;
    Xk_Up_Stile : constant X_Lib.Keyboard.Key_Sym := 16#BD3#;
    Xk_Down_Shoe : constant X_Lib.Keyboard.Key_Sym := 16#BD6#;
    Xk_Right_Shoe : constant X_Lib.Keyboard.Key_Sym := 16#BD8#;
    Xk_Left_Shoe : constant X_Lib.Keyboard.Key_Sym := 16#BDA#;
    Xk_Left_Tack : constant X_Lib.Keyboard.Key_Sym := 16#BDC#;
    Xk_Right_Tack : constant X_Lib.Keyboard.Key_Sym := 16#BFC#;

    -- Hebrew
    -- Byte 3 = c
    --
    Xk_Hebrew_Aleph : constant X_Lib.Keyboard.Key_Sym := 16#CE0#;
    Xk_Hebrew_Beth : constant X_Lib.Keyboard.Key_Sym := 16#CE1#;
    Xk_Hebrew_Gimmel : constant X_Lib.Keyboard.Key_Sym := 16#CE2#;
    Xk_Hebrew_Daleth : constant X_Lib.Keyboard.Key_Sym := 16#CE3#;
    Xk_Hebrew_He : constant X_Lib.Keyboard.Key_Sym := 16#CE4#;
    Xk_Hebrew_Waw : constant X_Lib.Keyboard.Key_Sym := 16#CE5#;
    Xk_Hebrew_Zayin : constant X_Lib.Keyboard.Key_Sym := 16#CE6#;
    Xk_Hebrew_Het : constant X_Lib.Keyboard.Key_Sym := 16#CE7#;
    Xk_Hebrew_Teth : constant X_Lib.Keyboard.Key_Sym := 16#CE8#;
    Xk_Hebrew_Yod : constant X_Lib.Keyboard.Key_Sym := 16#CE9#;
    Xk_Hebrew_Final_Kaph : constant X_Lib.Keyboard.Key_Sym := 16#CEA#;
    Xk_Hebrew_Kaph : constant X_Lib.Keyboard.Key_Sym := 16#CEB#;
    Xk_Hebrew_Lamed : constant X_Lib.Keyboard.Key_Sym := 16#CEC#;
    Xk_Hebrew_Final_Mem : constant X_Lib.Keyboard.Key_Sym := 16#CED#;
    Xk_Hebrew_Mem : constant X_Lib.Keyboard.Key_Sym := 16#CEE#;
    Xk_Hebrew_Final_Nun : constant X_Lib.Keyboard.Key_Sym := 16#CEF#;
    Xk_Hebrew_Nun : constant X_Lib.Keyboard.Key_Sym := 16#CF0#;
    Xk_Hebrew_Samekh : constant X_Lib.Keyboard.Key_Sym := 16#CF1#;
    Xk_Hebrew_Ayin : constant X_Lib.Keyboard.Key_Sym := 16#CF2#;
    Xk_Hebrew_Final_Pe : constant X_Lib.Keyboard.Key_Sym := 16#CF3#;
    Xk_Hebrew_Pe : constant X_Lib.Keyboard.Key_Sym := 16#CF4#;
    Xk_Hebrew_Final_Zadi : constant X_Lib.Keyboard.Key_Sym := 16#CF5#;
    Xk_Hebrew_Zadi : constant X_Lib.Keyboard.Key_Sym := 16#CF6#;
    Xk_Hebrew_Kuf : constant X_Lib.Keyboard.Key_Sym := 16#CF7#;
    Xk_Hebrew_Resh : constant X_Lib.Keyboard.Key_Sym := 16#CF8#;
    Xk_Hebrew_Shin : constant X_Lib.Keyboard.Key_Sym := 16#CF9#;
    Xk_Hebrew_Taf : constant X_Lib.Keyboard.Key_Sym := 16#CFA#;

    Xk_Hebrew_Switch : constant X_Lib.Keyboard.Key_Sym := Xk_Mode_Switch;
end X_Key_Syms;
