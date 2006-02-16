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
--! <Unit> Xt.Event_Management
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
-- !!! все подпрограммы можно переписать в виде, приведенном в исходной
-- связке. Ещё можно добавить обработку исключение и разблокирование нитей.
with Xt.Implementation;

package body Xt.Event_Management is

   use Xt.Implementation;

   procedure Xt_App_Main_Loop (App_Context : in Xt_App_Context) is
      procedure XtAppMainLoop (App_Context : in Xt_App_Context);
      pragma Import (C, XtAppMainLoop, "XtAppMainLoop");
   begin
      Check (App_Context);
      XtAppMainLoop (App_Context);
   end Xt_App_Main_Loop;


   procedure Xt_App_Next_Event (App_Context  : in     Xt_App_Context;
                                Event_Return :    out X_Event) is
      procedure XtAppNextEvent (App_Context  : in     Xt_App_Context;
                                Event_Return :    out X_Event);
      pragma Import (C, XtAppNextEvent, "XtAppNextEvent");
   begin
      Check (App_Context);
      XtAppNextEvent (App_Context, Event_Return);
   end Xt_App_Next_Event;


   function Xt_Dispatch_Event (Event : in X_Event) return Boolean is
      function XtDispatchEvent (Event : in X_Event) return Xt_Boolean;
      pragma Import (C, XtDispatchEvent, "XtDispatchEvent");
   begin
      return XtDispatchEvent (Event) /= Xt_False;
   end Xt_Dispatch_Event;


   procedure Xt_Dispatch_Event (Event : in X_Event) is
      procedure XtDispatchEvent (Event : in X_Event);
      pragma Import (C, XtDispatchEvent, "XtDispatchEvent");
   begin
      XtDispatchEvent (Event);
   end Xt_Dispatch_Event;


end Xt.Event_Management;
