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
--! <Unit> Xt.Geometry_Management
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Implementation;

package body Xt.Geometry_Management is

   use Xt.Implementation;

   procedure Xt_Configure_Widget (The_Widget   : in Widget;
                                  X            : in Position;
                                  Y            : in Position;
                                  Width        : in Dimension;
                                  Height       : in Dimension;
                                  Border_Width : in Dimension)
   is
      procedure XtConfigureWidget (The_Widget   : in Widget;
                                   X            : in Position;
                                   Y            : in Position;
                                   Width        : in Dimension;
                                   Height       : in Dimension;
                                   Border_Width : in Dimension);
      pragma Import (C, XtConfigureWidget, "XtConfigureWidget");
   begin
      Check (The_Widget);
      XtConfigureWidget (The_Widget, X, Y, Width, Height, Border_Width);
   end Xt_Configure_Widget;


   procedure Xt_Move_Widget (The_Widget : in Widget;
                             X          : in Position;
                             Y          : in Position) is
      procedure XtMoveWidget (The_Widget : in Widget;
                              X          : in Xt_Position;
                              Y          : in Xt_Position);
      pragma Import (C, XtMoveWidget, "XtMoveWidget");
   begin
      Check (The_Widget);
      XtMoveWidget (The_Widget, Xt_Position (X), Xt_Position (Y));
   end Xt_Move_Widget;


   procedure Xt_Resize_Window (The_Widget : in Widget) is
      procedure XtResizeWindow (The_Widget : in Widget);
      pragma Import (C, XtResizeWindow, "XtResizeWindow");
   begin
      Check (The_Widget);
      XtResizeWindow (The_Widget);
   end Xt_Resize_Window;


end Xt.Geometry_Management;
