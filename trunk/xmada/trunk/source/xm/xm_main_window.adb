------------------------------------------------------------------------------
--
--  Motif Ada Binding
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
--! <Unit> Xm_Main_Window
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;            use Interfaces.C;

with Xt.Composite_Management; use Xt.Composite_Management;

with Xm.Implementation;       use Xm.Implementation;

package body Xm_Main_Window is

   use Interfaces.C;
   use Xm.Implementation;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Main_Window
   --!    <ImplementationNotes> Проверку null_widget проводит Xt с выдачей
   --!  соответствующего предупреждения.
   ---------------------------------------------------------------------------
   function Xm_Create_Main_Window
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Main_Window_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateMainWindow (Parent    : in Widget;
                                   Name      : in char_array;
                                   Arg_List  : in Xt_Arg_List;
                                   Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateMainWindow, "XmCreateMainWindow");
   begin
      return
        XmCreateMainWindow (Parent, C_Name, Arg_List,
                            Cardinal (Arg_List'Length));
   end Xm_Create_Main_Window;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Main_Window
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Main_Window
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Main_Window_Widget
   is
      Aux : Widget;
   begin
      Aux := Xm_Create_Main_Window (Parent, Name, Arg_List);
      Xt_Manage_Child (Aux);
      return Aux;
   end Xm_Create_Managed_Main_Window;


   function Xm_Main_Window_Sep_1 (The_Widget : in Xm_Main_Window_Widget)
     return Widget
   is
      function XmMainWindowSep1 (The_Widget : in Widget) return Widget;
      pragma Import (C, XmMainWindowSep1, "XmMainWindowSep1");
   begin
      Check (The_Widget);
      return XmMainWindowSep1 (The_Widget);
   end Xm_Main_Window_Sep_1;


   function Xm_Main_Window_Sep_2 (The_Widget : in Xm_Main_Window_Widget)
     return Widget
   is
      function XmMainWindowSep2 (The_Widget : in Widget) return Widget;
      pragma Import (C, XmMainWindowSep2, "XmMainWindowSep2");
   begin
      Check (The_Widget);
      return XmMainWindowSep2 (The_Widget);
   end Xm_Main_Window_Sep_2;


   function Xm_Main_Window_Sep_3 (The_Widget : in Xm_Main_Window_Widget)
     return Widget
   is
      function XmMainWindowSep3 (The_Widget : in Widget) return Widget;
      pragma Import (C, XmMainWindowSep3, "XmMainWindowSep3");
   begin
      Check (The_Widget);
      return XmMainWindowSep3 (The_Widget);
   end Xm_Main_Window_Sep_3;


   procedure Xm_Main_Window_Set_Areas
    (The_Widget           : in Xm_Main_Window_Widget;
     Menu_Bar             : in Widget;
     Command_Window       : in Widget;
     Horizontal_Scrollbar : in Widget;
     Vertical_Scrollbar   : in Widget;
     Work_Region          : in Widget)
   is
      procedure XmMainWindowSetAreas (The_Widget           : in Widget;
                                      Menu_Bar             : in Widget;
                                      Command_Window       : in Widget;
                                      Horizontal_Scrollbar : in Widget;
                                      Vertical_Scrollbar   : in Widget;
                                      Work_Region          : in Widget);
      pragma Import (C, XmMainWindowSetAreas, "XmMainWindowSetAreas");
   begin
      Check (The_Widget);

      XmMainWindowSetAreas (The_Widget,
                            Menu_Bar,
                            Command_Window,
                            Horizontal_Scrollbar,
                            Vertical_Scrollbar,
                            Work_Region);
   end Xm_Main_Window_Set_Areas;


end Xm_Main_Window;
