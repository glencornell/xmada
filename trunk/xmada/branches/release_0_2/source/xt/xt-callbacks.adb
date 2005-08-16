------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
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
--! <Unit> Xt.Callbacks
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Implementation;

package body Xt.Callbacks is

   use Xt.Implementation;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Add_Callback
   --!    <ImplementationNotes> Параметр Callback_Name проверяется на
   --! нуль-значение в Xlib.
   ---------------------------------------------------------------------------
   procedure Xt_Add_Callback
    (The_Widget    : in Widget;
     Callback_Name : in Xt_Resource_Name_String;
     Callback      : in Xt_Callback_Proc;
     Client_Data   : in Xt_Pointer := Null_Xt_Pointer)
   is
      procedure XtAddCallback
       (The_Widget    : in Widget;
        Callback_Name : in Xt_Resource_Name_String;
        Callback      : in Xt_Callback_Proc;
        Client_Data   : in Xt_Pointer);
      pragma Import (C, XtAddCallback, "XtAddCallback");
   begin
      Check (The_Widget);
      XtAddCallback (The_Widget, Callback_Name, Callback, Client_Data);
   end Xt_Add_Callback;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Remove_Callback
   --!    <ImplementationNotes> Параметр Callback_Name проверяется на
   --! нуль-значение в Xlib.
   ---------------------------------------------------------------------------
   procedure Xt_Remove_Callback
    (The_Widget    : in Widget;
     Callback_Name : in Xt_Resource_Name_String;
     Callback      : in Xt_Callback_Proc;
     Client_Data   : in Xt_Pointer := Null_Xt_Pointer)
   is
      procedure XtRemoveCallback
       (The_Widget    : in Widget;
        Callback_Name : in Xt_Resource_Name_String;
        Callback      : in Xt_Callback_Proc;
        Client_Data   : in Xt_Pointer);
      pragma Import (C, XtRemoveCallback, "XtAddCallback");
   begin
      Check (The_Widget);
      XtRemoveCallback (The_Widget, Callback_Name, Callback, Client_Data);
   end Xt_Remove_Callback;


end Xt.Callbacks;
