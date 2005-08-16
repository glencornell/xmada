------------------------------------------------------------------------------
--
--  X Library Ada Binding
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
--! <Unit> Xlib.Extensions.Print
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xlib.Implementation;

package body Xlib.Extensions.Print is

   use Interfaces.C;
   use Xlib.Implementation;

   procedure Xp_Cancel_Job (The_Display : in Display;
                            Discard     : in Boolean)
   is
      procedure XpCancelJob (The_Display : in Display;
                             Discard     : in Bool);
      pragma Import (C, XpCancelJob, "XpCancelJob");
   begin
      Check (The_Display);
      XpCancelJob (The_Display, Bool (To_X_Boolean (Discard)));
   end Xp_Cancel_Job;


   function Xp_Create_Context (The_Display  : in Display;
                               Printer_Name : in String)
     return Xp_Context
   is
      function XpCreateContext (The_Display  : in Display;
                                Printer_Name : in char_array)
        return Xp_Context;
      pragma Import (C, XpCreateContext, "XpCreateContext");
   begin
      Check (The_Display);
      return XpCreateContext (The_Display, To_C (Printer_Name));
   end Xp_Create_Context;


   procedure Xp_End_Job (The_Display : in Display) is
      procedure XpEndJob (The_Display : in Display);
      pragma Import (C, XpEndJob, "XpEndJob");
   begin
      Check (The_Display);
      XpEndJob (The_Display);
   end Xp_End_Job;


   function Xp_Get_Screen_Of_Context (The_Display : in Display;
                                      The_Context : in Xp_Context)
     return Screen
   is
      function XpGetScreenOfContext (The_Display : in Display;
                                     The_Context : in Xp_Context)
        return Screen;
      pragma Import (C, XpGetScreenOfContext, "XpGetScreenOfContext");
   begin
      Check (The_Display);
      return XpGetScreenOfContext (The_Display, The_Context);
   end Xp_Get_Screen_Of_Context;


   procedure Xp_Set_Context (The_Display : in Display;
                             The_Context : in Xp_Context)
   is
      procedure XpSetContext (The_Display : in Display;
                              The_Context : in Xp_Context);
      pragma Import (C, XpSetContext, "XpSetContext");
   begin
      Check (The_Display);
      XpSetContext (The_Display, The_Context);
   end Xp_Set_Context;


   procedure Xp_Set_Locale_Hinter (Hinter      : in Xp_Hinter_Proc;
                                   Description : in String)
   is
      procedure XpSetLocaleHinter (Hinter      : in Xp_Hinter_Proc;
                                   Description : in char_array);
      pragma Import (C, XpSetLocaleHinter, "XpSetLocaleHinter");
   begin
      XpSetLocaleHinter (Hinter, To_C (Description));
   end Xp_Set_Locale_Hinter;


   procedure Xp_Start_Job (The_Display : in Display;
                           Save_Data   : in Xp_Save_Data)
   is
      procedure XpStartJob (The_Display : in Display;
                            Save_Data   : in Xp_Save_Data);
      pragma Import (C, XpStartJob, "XpStartJob");
   begin
      Check (The_Display);
      XpStartJob (The_Display, Save_Data);
   end Xp_Start_Job;


end Xlib.Extensions.Print;
