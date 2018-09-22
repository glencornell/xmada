------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rostel.ru)
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
--! XmAda maintained by TechnoServ A/S (email: vgodunko@rostel.ru)
--!
--! <Unit> Xt.Popup_Management
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Implementation;

package body Xt.Popup_Management is

   use Interfaces.C;
   use Xt.Ancillary_Types;
   use Xt.Implementation;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Create_Popup_Shell
   --!    <ImplementationNotes> Параметры Parent и The_Widget_Class
   --! проверяются внутри Xt.
   ---------------------------------------------------------------------------
   function Xt_Create_Popup_Shell
    (Name             : in String;
     The_Widget_Class : in Widget_Class;
     Parent           : in Widget;
     Args             : in Xt_Arg_List := Null_Xt_Arg_List)
       return Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XtCreatePopupShell (Name             : in char_array;
                                   The_Widget_Class : in Widget_Class;
                                   Parent           : in Widget;
                                   Args             : in Xt_Arg_List;
                                   Num_Args         : in Cardinal)
        return Widget;
     pragma Import (C, XtCreatePopupShell, "XtCreatePopupShell");
   begin
      return XtCreatePopupShell (C_Name,
                                 The_Widget_Class,
                                 Parent,
                                 Args,
                                 Args'Length);
   end Xt_Create_Popup_Shell;


   procedure Xt_Popdown (Popup_Shell : in Widget) is
      procedure XtPopdown (Popup_Shell : in Widget);
      pragma Import (C, XtPopdown, "XtPopdown");
   begin
      Check (Popup_Shell);
      XtPopdown (Popup_Shell);
   end Xt_Popdown;


   procedure Xt_Popup (Popup_Shell : in Widget;
                       Grab_Kind   : in Xt_Grab_Kind)
   is
      procedure XtPopup (Popup_Shell : in Widget;
                         Grab_Kind   : in Xt_Grab_Kind);
      pragma Import (C, XtPopup, "XtPopup");
   begin
      Check (Popup_Shell);
      XtPopup (Popup_Shell, Grab_Kind);
   end Xt_Popup;


end Xt.Popup_Management;
