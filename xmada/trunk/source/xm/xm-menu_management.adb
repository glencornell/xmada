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
--! <Unit> Xm.Menu_Management
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xm.Implementation;

package body Xm.Menu_Management is

   use Xlib;
   use Xlib.Cursors;
   use Xlib.Events;
   use Xm.Implementation;
   use Xt;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Add_To_Post_From_List
   --!    <ImplementationNotes> Параметр Post_From_Widget проверяется на нуль
   --! значение в Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Add_To_Post_From_List (Menu             : in Widget;
                                       Post_From_Widget : in Widget)
   is
      procedure XmAddToPostFromList (Menu             : in Widget;
                                     Post_From_Widget : in Widget);
      pragma Import (C, XmAddToPostFromList, "XmAddToPostFromList");
   begin
      Check (Menu);
      XmAddToPostFromList (Menu, Post_From_Widget);
   end Xm_Add_To_Post_From_List;


   function Xm_Get_Menu_Cursor (The_Display : in Display) return Cursor is
      function XmGetMenuCursor (The_Display : in Display) return Cursor;
      pragma Import (C, XmGetMenuCursor, "XmGetMenuCursor");
   begin
      Check (The_Display);
      return XmGetMenuCursor (The_Display);
   end Xm_Get_Menu_Cursor;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Get_Posted_From_Widget
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Get_Posted_From_Widget (Menu : in Widget) return Widget is
      function XmGetPostedFromWidget (Menu : in Widget) return Widget;
      pragma Import (C, XmGetPostedFromWidget, "XmGetPostedFromWidget");
   begin
      Check (Menu);
      return XmGetPostedFromWidget (Menu);
   end Xm_Get_Posted_From_Widget;


   function Xm_Get_Tear_Off_Control (Menu : in Widget) return Widget is
      function XmGetTearOffControl (Menu : in Widget) return Widget;
      pragma Import (C, XmGetTearOffControl, "XmGetTearOffControl");
   begin
      Check (Menu);
      return XmGetTearOffControl (Menu);
   end Xm_Get_Tear_Off_Control;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Menu_Position
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Menu_Position (Menu  : in Widget;
                               Event : in X_Button_Pressed_Event_Record)
   is
      procedure XmMenuPosition (Menu  : in Widget;
                                Event : in X_Button_Pressed_Event_Record);
      pragma Import (C, XmMenuPosition, "XmMenuPosition");
   begin
      Check (Menu);
      XmMenuPosition (Menu, Event);
   end Xm_Menu_Position;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Remove_From_Post_From_List
   --!    <ImplementationNotes> Параметр Post_From_Widget проверяется на нуль
   --! значение в Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Remove_From_Post_From_List (Menu             : in Widget;
                                            Post_From_Widget : in Widget)
   is
      procedure XmRemoveFromPostFromList (Menu             : in Widget;
                                          Post_From_Widget : in Widget);
      pragma Import (C, XmRemoveFromPostFromList, "XmAddToPostFromList");
   begin
      Check (Menu);
      XmRemoveFromPostFromList (Menu, Post_From_Widget);
   end Xm_Remove_From_Post_From_List;


   procedure Xm_Set_Menu_Cursor (The_Display : in Display;
                                 The_Cursor  : in Cursor)
   is
      procedure XmSetMenuCursor (The_Display : in Display;
                                 The_Cursor  : in Cursor);
      pragma Import (C, XmSetMenuCursor, "XmSetMenuCursor");
   begin
      Check (The_Display);
      XmSetMenuCursor (The_Display, The_Cursor);
   end Xm_Set_Menu_Cursor;


end Xm.Menu_Management;
