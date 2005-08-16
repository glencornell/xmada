-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib, Xt;

package Xm_Virtural_Keys is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    -- OSF_Keysyms
    Osfxk_Backspace : X_Lib.Keyboard.Key_Sym := 16#1004FF08#;
    Osfxk_Insert : X_Lib.Keyboard.Key_Sym := 16#1004FF63#;
    Osfxk_Delete : X_Lib.Keyboard.Key_Sym := 16#1004FFFF#;
    Osfxk_Copy : X_Lib.Keyboard.Key_Sym := 16#1004FF02#;
    Osfxk_Cut : X_Lib.Keyboard.Key_Sym := 16#1004FF03#;
    Osfxk_Paste : X_Lib.Keyboard.Key_Sym := 16#1004FF04#;

    Osfxk_Addmode : X_Lib.Keyboard.Key_Sym := 16#1004FF31#;
    Osfxk_Primarypaste : X_Lib.Keyboard.Key_Sym := 16#1004FF32#;
    Osfxk_Quickpaste : X_Lib.Keyboard.Key_Sym := 16#1004FF33#;

    Osfxk_Pageleft : X_Lib.Keyboard.Key_Sym := 16#1004FF40#;
    Osfxk_Pageup : X_Lib.Keyboard.Key_Sym := 16#1004FF41#;
    Osfxk_Pagedown : X_Lib.Keyboard.Key_Sym := 16#1004FF42#;
    Osfxk_Pageright : X_Lib.Keyboard.Key_Sym := 16#1004FF43#;

    Osfxk_Endline : X_Lib.Keyboard.Key_Sym := 16#1004FF57#;
    Osfxk_Beginline : X_Lib.Keyboard.Key_Sym := 16#1004FF58#;

    Osfxk_Activate : X_Lib.Keyboard.Key_Sym := 16#1004FF44#;

    Osfxk_Menubar : X_Lib.Keyboard.Key_Sym := 16#1004FF45#;

    Osfxk_Clear : X_Lib.Keyboard.Key_Sym := 16#1004FF0B#;
    Osfxk_Cancel : X_Lib.Keyboard.Key_Sym := 16#1004FF69#;
    Osfxk_Help : X_Lib.Keyboard.Key_Sym := 16#1004FF6A#;
    Osfxk_Menu : X_Lib.Keyboard.Key_Sym := 16#1004FF67#;
    Osfxk_Select : X_Lib.Keyboard.Key_Sym := 16#1004FF60#;
    Osfxk_Undo : X_Lib.Keyboard.Key_Sym := 16#1004FF65#;

    Osfxk_Left : X_Lib.Keyboard.Key_Sym := 16#1004FF51#;
    Osfxk_Up : X_Lib.Keyboard.Key_Sym := 16#1004FF52#;
    Osfxk_Right : X_Lib.Keyboard.Key_Sym := 16#1004FF53#;
    Osfxk_Down : X_Lib.Keyboard.Key_Sym := 16#1004FF54#;

    procedure Xm_Translate_Key (Dpy : in X_Lib.Display;
				Key_Code : in X_Lib.Keyboard.Key_Code;
				Modifiers : in Xt.Modifiers;
				Modifiers_Return : out Xt.Modifiers;
				Key_Sym_Return : out X_Lib.Keyboard.Key_Sym);

end Xm_Virtural_Keys;

------ COPYRIGHT AND DISTRIBUTION NOTICE ----------
--
-- (C) Copyright 1991, 1993 Systems Engineering Research Corporation
-- All Rights Reserved
--
-- This notice must be included in all copies of this software.
--
-- THIS SOFTWARE AND MANUAL ARE BOTH PROTECTED BY U.S. COPYRIGHT
-- LAW (TITLE 17 UNITED STATES CODE).  UNAUTHORIZED REPRODUCTION
-- AND/OR SALES MAY RESULT IN IMPRISIONMENT OF UP TO ONE YEAR AND
-- FINES OF UP TO $10,000 (17 USC 506).  COPYRIGHT INFRINGERS MAY
-- ALSO BE SUBJECT TO CIVIL LIABILITY.
--
-- THIS PROGRAM IS AN UNPUBLISHED WORK FULLY PROTECTED BY THE
-- UNITED STATES COPYRIGHT LAWS AND IS CONSIDERED A TRADE SECRET
-- BELONGING TO THE COPYRIGHT HOLDER.
--
-- Use of this software is restricted to those individuals and/or
-- organizations who have acquired a license from Systems Engineering
-- Research Corporation for a particular machine or set of machines.
-- No copying, use, or distribution of this software from or to an unlicensed
-- machine is allowed without the prior written consent of Systems
-- Engineering Research Corporation.
--
-- The SOFTWARE and documentation are provided with RESTRICTED RIGHTS.  Use,
-- duplication, or disclosure by the Government is subject to the restrictions
-- as set forth in subparagraph (c)(1)(ii) of The Rights in Technical Data
-- and Computer Software clause at 52.227-7013.  Contractor/manufacturer is
-- Systems Engineering Research Corporation/2555 Charleston Road/
-- Mountain View, CA 94043 1-800-Ada-SERC.
--
------- DISCLAIMER -------
--
-- This software and its documentation are provided "AS IS" and
-- without any expressed or implied warranties whatsoever.
-- No warranties as to performance, merchantability, or fitness
-- for a particular purpose exist.
--
-- Because of the diversity of conditions and hardware under
-- which this software may be used, no warranty of fitness for
-- a particular purpose is offered.  The user is advised to
-- test the software thoroughly before relying on it.  The user
-- must assume the entire risk and liability of using this
-- software.
--
-- In no event shall Systems Engineering Research Corporation and its
-- personnel be held responsible for any direct, indirect, consequential
-- or inconsequential damages or lost profits.
