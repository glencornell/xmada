-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib, Xt, Xm, Xm_Ext_Object;

package Xm_Protocols is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    Xmcr_Wm_Protocols : constant := 666;

    type Atom_List is array (Natural range <>) of X_Lib.Atoms.Atom;

    subtype Protocol_Object is Xm_Ext_Object.Ext_Object;
    subtype Protocol_Object_Class is Xm_Ext_Object.Ext_Object_Class;

    function Xm_Protocol_Object_Class return Protocol_Object_Class;

    function Xm_Is_Protocol (W : in Xm.Xt_Widget) return Boolean;

    function Xm_Wm_Protocol_Atom (W : Xm.Xt_Widget) return X_Lib.Atoms.Atom;

--    procedure Xm_Add_Protocols (Shell : in Xm.Xt_Widget;
--				Property : in X_Lib.Atoms.Atom;
--				Protocols : in Atom_List);
--
--    procedure Xm_Remove_Protocols (Shell : in Xm.Xt_Widget;
--				   Property : in X_Lib.Atoms.Atom;
--				   Protocols : in Atom_List);
--
--    procedure Xm_Add_Protocol_Callback
--		 (Shell : in Xm.Xt_Widget;
--		  Property : in X_Lib.Atoms.Atom;
--		  Proto_Atom : in X_Lib.Atoms.Atom;
--		  Callback : in Xt.Xt_Callback_Proc;
--		  Closure : in Xt.Xt_Pointer := Xt.Null_Xt_Pointer);
--
--    procedure Xm_Remove_Protocol_Callback
--		 (Shell : in Xm.Xt_Widget;
--		  Property : in X_Lib.Atoms.Atom;
--		  Proto_Atom : in X_Lib.Atoms.Atom;
--		  Callback : in Xt.Xt_Callback_Proc;
--		  Closure : in Xt.Xt_Pointer := Xt.Null_Xt_Pointer);
--
--    procedure Xm_Activate_Protocol (Shell : in Xm.Xt_Widget;
--				    Property : in X_Lib.Atoms.Atom;
--				    Proto_Atom : in X_Lib.Atoms.Atom);
--
--    procedure Xm_Deactivate_Protocol (Shell : in Xm.Xt_Widget;
--				      Property : in X_Lib.Atoms.Atom;
--				      Proto_Atom : in X_Lib.Atoms.Atom);
--
--    procedure Xm_Set_Protocol_Hooks
--		 (Shell : in Xm.Xt_Widget;
--		  Property : in X_Lib.Atoms.Atom;
--		  Proto_Atom : in X_Lib.Atoms.Atom;
--		  Pre_Hook : in Xt.Xt_Callback_Proc;
--		  Pre_Closure : in Xt.Xt_Pointer := Xt.Null_Xt_Pointer;
--		  Post_Hook : in Xt.Xt_Callback_Proc;
--		  Post_Closure : in Xt.Xt_Pointer := Xt.Null_Xt_Pointer);
--
--    procedure Xm_Add_Wm_Protocols
--		 (Shell : in Xm.Xt_Widget; Protocols : in Atom_List);
--
--    procedure Xm_Remove_Wm_Protocols
--		 (Shell : in Xm.Xt_Widget; Protocols : in Atom_List);
--
--    procedure Xm_Add_Wm_Protocol_Callback
--		 (Shell : in Xm.Xt_Widget;
--		  Protocol : in X_Lib.Atoms.Atom;
--		  Callback : in Xt.Xt_Callback_Proc;
--		  Closure : in Xt.Xt_Pointer := Xt.Null_Xt_Pointer);
--
--    procedure Xm_Remove_Wm_Protocol_Callback
--		 (Shell : in Xm.Xt_Widget;
--		  Protocol : in X_Lib.Atoms.Atom;
--		  Callback : in Xt.Xt_Callback_Proc;
--		  Closure : in Xt.Xt_Pointer := Xt.Null_Xt_Pointer);
--
--    procedure Xm_Activate_Wm_Protocol
--		 (Shell : in Xm.Xt_Widget; Protocol : in X_Lib.Atoms.Atom);
--
--    procedure Xm_Deactivate_Wm_Protocol
--		 (Shell : in Xm.Xt_Widget; Protocol : in X_Lib.Atoms.Atom);
--
--    procedure Xm_Set_Wm_Protocol_Hooks
--		 (Shell : in Xm.Xt_Widget;
--		  Protocol : in X_Lib.Atoms.Atom;
--		  Pre_Hook : in Xt.Xt_Callback_Proc;
--		  Pre_Closure : in Xt.Xt_Pointer := Xt.Null_Xt_Pointer;
--		  Post_Hook : in Xt.Xt_Callback_Proc;
--		  Post_Closure : in Xt.Xt_Pointer := Xt.Null_Xt_Pointer);
end Xm_Protocols;

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
