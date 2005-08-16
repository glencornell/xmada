------------------------------------------------------------------------------
--
--  Motif Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rost.ru)
--!
--! XmAda is free software; you can redistribute it and/or modify it under
--! the terms of the GNU General Public License as published by the Free
--! Software Foundation; either version 2, or (at your option) any later
--! version.
--!
--! XmAda is distributed in the hope that it will be useful, but WITHOUT ANY
--! WARRANTY; without even the implied warranty of MERCHANTABILITY or
--! FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
--! for more details.
--!
--! You should have received a copy of the GNU General Public License
--! along with GCC; see the file COPYING. If not, write to the Free
--! Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
--! 02110-1301, USA.
--!
--! As a special exception, if other files instantiate generics from this
--! unit, or you link this unit with other files to produce an executable,
--! this unit does not by itself cause the resulting executable to be
--! covered by the GNU General Public License. This exception does not
--! however invalidate any other reasons why the executable file might be
--! covered by the GNU Public License.
--!
--! <Unit> Xm.Input_Management
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xm.Implementation;

package body Xm.Input_Management is

   use Interfaces.C;
   use Xt;
   use Xt.Ancillary_Types;
   use Xm.Implementation;

   procedure Xm_Im_Close_XIM (The_Widget : in Widget) is
      procedure XmImCloseXIM (The_Widget : in Widget);
      pragma Import (C, XmImCloseXIM, "XmImCloseXIM");
   begin
      Check (The_Widget);

      XmImCloseXIM (The_Widget);
   end Xm_Im_Close_XIM;


   procedure Xm_Im_Register (The_Widget : in Widget) is
      procedure XmImRegister (The_Widget : in Widget;
                              Reserved   : in int);
      pragma Import (C, XmImRegister, "XmImRegister");
   begin
      Check (The_Widget);

      --  XmImRegister(3) recommend always use value 0 for argument Reserved.
      XmImRegister (The_Widget, 0);
   end Xm_Im_Register;


   procedure Xm_Im_Set_Focus_Values
    (The_Widget : in Widget;
     Arg_List   : in Xt_Arg_List := Null_Xt_Arg_List)
   is
      procedure XmImSetFocusValues (The_Widget : in Widget;
                                    Arg_List   : in Xt_Arg_List;
                                    Arg_Count  : in Cardinal);
      pragma Import (C, XmImSetFocusValues, "XmImSetFocusValues");
   begin
      Check (The_Widget);

      XmImSetFocusValues (The_Widget, Arg_List, Arg_List'Length);
   end Xm_Im_Set_Focus_Values;


   procedure Xm_Im_Set_Values
    (The_Widget : in Widget;
     Arg_List   : in Xt_Arg_List := Null_Xt_Arg_List)
   is
      procedure XmImSetValues (The_Widget : in Widget;
                               Arg_List   : in Xt_Arg_List;
                               Arg_Count  : in Cardinal);
      pragma Import (C, XmImSetValues, "XmImSetValues");
   begin
      Check (The_Widget);

      XmImSetValues (The_Widget, Arg_List, Arg_List'Length);
   end Xm_Im_Set_Values;


   procedure Xm_Im_Unregister (The_Widget : in Widget) is
      procedure XmImUnregister (The_Widget : in Widget);
      pragma Import (C, XmImUnregister, "XmImUnregister");
   begin
      Check (The_Widget);

      XmImUnregister (The_Widget);
   end Xm_Im_Unregister;


   procedure Xm_Im_Unset_Focus (The_Widget : in Widget) is
      procedure XmImUnsetFocus (The_Widget : in Widget);
      pragma Import (C, XmImUnsetFocus, "XmImUnsetFocus");
   begin
      Check (The_Widget);

      XmImUnsetFocus (The_Widget);
   end Xm_Im_Unset_Focus;


end Xm.Input_Management;
