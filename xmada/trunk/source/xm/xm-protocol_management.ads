------------------------------------------------------------------------------
--
--  Mofit Ada Binding
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
--! <Unit> Xm.Protocol_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xlib.Atoms;
with Xt;

package Xm.Protocol_Management is


   procedure Xm_Add_Protocols (Shell     : in Xt.Widget;
                               Property  : in Xlib.Atoms.Atom;
                               Protocols : in Xlib.Atoms.Atom_List);


   procedure Xm_Activate_Protocol (Shell    : in Xt.Widget;
                                   Property : in Xlib.Atoms.Atom;
                                   Protocol : in Xlib.Atoms.Atom);


   procedure Xm_Deactivate_Protocol (Shell    : in Xt.Widget;
                                     Property : in Xlib.Atoms.Atom;
                                     Protocol : in Xlib.Atoms.Atom);


   procedure Xm_Remove_Protocols (Shell     : in Xt.Widget;
                                  Property  : in Xlib.Atoms.Atom;
                                  Protocols : in Xlib.Atoms.Atom_List);


   procedure Xm_Add_WM_Protocols (Shell     : in Xt.Widget;
                                  Protocols : in Xlib.Atoms.Atom_List);


   procedure Xm_Activate_WM_Protocol (Shell    : in Xt.Widget;
                                      Protocol : in Xlib.Atoms.Atom);


   procedure Xm_Deactivate_WM_Protocol (Shell    : in Xt.Widget;
                                        Protocol : in Xlib.Atoms.Atom);


   procedure Xm_Remove_WM_Protocols (Shell     : in Xt.Widget;
                                     Protocols : in Xlib.Atoms.Atom_List);


   procedure Xm_Add_Protocol_Callback (Shell    : in Xt.Widget;
                                       Property : in Xlib.Atoms.Atom;
                                       Protocol : in Xlib.Atoms.Atom;
                                       Callback : in Xt.Xt_Callback_Proc;
                                       Closure  : in Xt.Xt_Pointer
                                         := Xt.Null_Xt_Pointer);


   procedure Xm_Remove_Protocol_Callback (Shell    : in Xt.Widget;
                                          Property : in Xlib.Atoms.Atom;
                                          Protocol : in Xlib.Atoms.Atom;
                                          Callback : in Xt.Xt_Callback_Proc;
                                          Closure  : in Xt.Xt_Pointer
                                            := Xt.Null_Xt_Pointer);


   procedure Xm_Add_WM_Protocol_Callback (Shell    : in Xt.Widget;
                                          Protocol : in Xlib.Atoms.Atom;
                                          Callback : in Xt.Xt_Callback_Proc;
                                          Closure  : in Xt.Xt_Pointer
                                            := Xt.Null_Xt_Pointer);


   procedure Xm_Remove_WM_Protocol_Callback (Shell    : in Xt.Widget;
                                             Protocol : in Xlib.Atoms.Atom;
                                             Callback : in Xt.Xt_Callback_Proc;
                                             Closure  : in Xt.Xt_Pointer
                                               := Xt.Null_Xt_Pointer);


   procedure Xm_Set_Protocol_Hooks (Shell        : in Xt.Widget;
                                    Property     : in Xlib.Atoms.Atom;
                                    Protocol     : in Xlib.Atoms.Atom;
                                    Pre_Hook     : in Xt.Xt_Callback_Proc
                                      := Xt.Null_Xt_Callback_Proc;
                                    Pre_Closure  : in Xt.Xt_Pointer
                                      := Xt.Null_Xt_Pointer;
                                    Post_Hook    : in Xt.Xt_Callback_Proc
                                      := Xt.Null_Xt_Callback_Proc;
                                    Post_Closure : in Xt.Xt_Pointer
                                      := Xt.Null_Xt_Pointer);


   procedure Xm_Set_WM_Protocol_Hooks (Shell        : in Xt.Widget;
                                       Protocol     : in Xlib.Atoms.Atom;
                                       Pre_Hook     : in Xt.Xt_Callback_Proc
                                         := Xt.Null_Xt_Callback_Proc;
                                       Pre_Closure  : in Xt.Xt_Pointer
                                         := Xt.Null_Xt_Pointer;
                                       Post_Hook    : in Xt.Xt_Callback_Proc
                                         := Xt.Null_Xt_Callback_Proc;
                                       Post_Closure : in Xt.Xt_Pointer
                                         := Xt.Null_Xt_Pointer);


   --  Additional subprograms.

   procedure Xm_Add_WM_Delete_Window_Callback
    (Shell    : in Xt.Widget;
     Callback : in Xt.Xt_Callback_Proc;
     Closure  : in Xt.Xt_Pointer := Xt.Null_Xt_Pointer);


   procedure Xm_Remove_WM_Delete_Window_Callback
    (Shell    : in Xt.Widget;
     Callback : in Xt.Xt_Callback_Proc;
     Closure  : in Xt.Xt_Pointer := Xt.Null_Xt_Pointer);


end Xm.Protocol_Management;
