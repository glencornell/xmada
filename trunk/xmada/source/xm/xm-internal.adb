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
--! <Unit> Xm.Internal
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;

with Xm.Implementation;

package body Xm.Internal is

   use Interfaces.C;
   use Xlib;
   use Xt;
   use Xt.Ancillary_Types;
   use Xm.Implementation;

   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Focus_Moved_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Focus_Moved_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   procedure Xme_Add_Focus_Change_Callback (The_Widget : in Widget;
                                            Callback   : in Xt_Callback_Proc;
                                            Closure    : in Xt_Pointer)
   is
      procedure XmeAddFocusChangeCallback (The_Widget : in Widget;
                                           Callback   : in Xt_Callback_Proc;
                                           Closure    : in Xt_Pointer);
      pragma Import (C, XmeAddFocusChangeCallback,
                     "XmeAddFocusChangeCallback");
   begin
      Check (The_Widget);
      XmeAddFocusChangeCallback (The_Widget, Callback, Closure);
   end Xme_Add_Focus_Change_Callback;


   procedure Xme_Clear_Border (The_Display : in Display;
                               The_Window  : in Window;
                               X           : in Position;
                               Y           : in Position;
                               Width       : in Dimension;
                               Height      : in Dimension;
                               Thickness   : in Dimension)
   is
      procedure XmeClearBorder (The_Display : in Display;
                                The_Window  : in Window;
                                X           : in Position;
                                Y           : in Position;
                                Width       : in Dimension;
                                Height      : in Dimension;
                                Thickness   : in Dimension);
      pragma Import (C, XmeClearBorder, "XmeClearBorder");
   begin
      Check (The_Display);
      XmeClearBorder (The_Display, The_Window, X, Y, Width, Height, Thickness);
   end Xme_Clear_Border;


   function Xme_Clipboard_Sink (The_Widget    : in Widget;
                                Operation     : in Xm_Destination_Operation;
                                Location_Data : in Xt_Pointer)
     return Boolean
   is
      function XmeClipboardSink (The_Widget    : in Widget;
                                 Operation     : in Xm_Destination_Operation;
                                 Location_Data : in Xt_Pointer)
        return Xt_Boolean;
      pragma Import (C, XmeClipboardSink, "XmeClipboardSink");
   begin
      Check (The_Widget);
      if Operation /= Xm_Copy and Operation /= Xm_Link then
         raise Constraint_Error;
      end if;

      return
        To_Boolean (XmeClipboardSink (The_Widget, Operation, Location_Data));
   end Xme_Clipboard_Sink;


   function Xme_Clipboard_Source (The_Widget : in Widget;
                                  Operation  : in Xm_Destination_Operation;
                                  The_Time   : in Time)
     return Boolean
   is
      function XmeClipboardSource (The_Widget : in Widget;
                                   Operation  : in Xm_Destination_Operation;
                                   The_Time   : in Time)
        return Xt_Boolean;
      pragma Import (C, XmeClipboardSource, "XmeClipboardSource");
   begin
      Check (The_Widget);
      if Operation /= Xm_Move
        and Operation /= Xm_Copy
        and Operation /= Xm_Link
      then
         raise Constraint_Error;
      end if;

      return To_Boolean (XmeClipboardSource (The_Widget, Operation, The_Time));
   end Xme_Clipboard_Source;


   procedure Xme_Configure_Object (The_Widget   : in Widget;
                                   X            : in Position;
                                   Y            : in Position;
                                   Width        : in Dimension;
                                   Height       : in Dimension;
                                   Border_Width : in Dimension)
   is
      procedure XmeConfigureObject (The_Widget   : in Widget;
                                    X            : in Position;
                                    Y            : in Position;
                                    Width        : in Dimension;
                                    Height       : in Dimension;
                                    Border_Width : in Dimension);
      pragma Import (C, XmeConfigureObject, "XmeConfigureObject");
   begin
      Check (The_Widget);
      XmeConfigureObject (The_Widget, X, Y, Width, Height, Border_Width);
   end Xme_Configure_Object;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xme_Create_Class_Dialog
   --!    <ImplementationNotes> Параметры The_Widget_Class и Parent проверяются
   --! на нуль значение в Xt.
   ---------------------------------------------------------------------------
   function Xme_Create_Class_Dialog (The_Widget_Class : in Widget_Class;
                                     Parent           : in Widget;
                                     Name             : in String;
                                     Arg_List         : in Xt_Arg_List
                                       := Null_Xt_Arg_List)
     return Widget
   is
      function XmeCreateClassDialog (The_Widget_Class : in Widget_Class;
                                     Parent           : in Widget;
                                     Name             : in char_array;
                                     Arg_List         : in Xt_Arg_List;
                                     Arg_Count        : in Cardinal)
        return Widget;
      pragma Import (C, XmeCreateClassDialog, "XmeCreateClassDialog");
   begin
      return
        XmeCreateClassDialog (The_Widget_Class,
                              Parent,
                              To_C (Name),
                              Arg_List,
                              Arg_List'Length);
   end Xme_Create_Class_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xme_Draw_Arrow
   --!    <ImplementationNotes> Параметр Center_GC может иметь нуль значение.
   ---------------------------------------------------------------------------
   procedure Xme_Draw_Arrow (The_Display      : in Display;
                             The_Drawable     : in Drawable;
                             Top_GC           : in Graphic_Context;
                             Bottom_GC        : in Graphic_Context;
                             Center_GC        : in Graphic_Context;
                             X                : in Position;
                             Y                : in Position;
                             Width            : in Dimension;
                             Height           : in Dimension;
                             Shadow_Thickness : in Dimension;
                             Direction        : in Xm_Arrow_Direction)
   is
      procedure XmeDrawArrow (The_Display      : in Display;
                              The_Drawable     : in Drawable;
                              Top_GC           : in Graphic_Context;
                              Bottom_GC        : in Graphic_Context;
                              Center_GC        : in Graphic_Context;
                              X                : in Position;
                              Y                : in Position;
                              Width            : in Dimension;
                              Height           : in Dimension;
                              Shadow_Thickness : in Dimension;
                              Direction        : in Xm_Arrow_Direction);
      pragma Import (C, XmeDrawArrow, "XmeDrawArrow");
   begin
      Check (The_Display);
      Check (Top_GC);
      Check (Bottom_GC);

      XmeDrawArrow (The_Display,
                    The_Drawable,
                    Top_GC,
                    Bottom_GC,
                    Center_GC,
                    X,
                    Y,
                    Width,
                    Height,
                    Shadow_Thickness,
                    Direction);
   end Xme_Draw_Arrow;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xme_Draw_Circle
   --!    <ImplementationNotes> Параметр Center_GC может иметь нуль значение.
   ---------------------------------------------------------------------------
   procedure Xme_Draw_Circle (The_Display      : in Display;
                              The_Drawable     : in Drawable;
                              Top_GC           : in Graphic_Context;
                              Bottom_GC        : in Graphic_Context;
                              Center_GC        : in Graphic_Context;
                              X                : in Position;
                              Y                : in Position;
                              Width            : in Dimension;
                              Height           : in Dimension;
                              Shadow_Thickness : in Dimension;
                              Margin           : in Dimension)
   is
      procedure XmeDrawCircle (The_Display      : in Display;
                               The_Drawable     : in Drawable;
                               Top_GC           : in Graphic_Context;
                               Bottom_GC        : in Graphic_Context;
                               Center_GC        : in Graphic_Context;
                               X                : in Position;
                               Y                : in Position;
                               Width            : in Dimension;
                               Height           : in Dimension;
                               Shadow_Thickness : in Dimension;
                               Margin           : in Dimension);
      pragma Import (C, XmeDrawCircle, "XmeDrawCircle");
   begin
      Check (The_Display);
      Check (Top_GC);
      Check (Bottom_GC);

      XmeDrawCircle (The_Display,
                     The_Drawable,
                     Top_GC,
                     Bottom_GC,
                     Center_GC,
                     X,
                     Y,
                     Width,
                     Height,
                     Shadow_Thickness,
                     Margin);
   end Xme_Draw_Circle;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xme_Draw_Diamond
   --!    <ImplementationNotes> Параметр Center_GC может иметь нуль значение.
   ---------------------------------------------------------------------------
   procedure Xme_Draw_Diamond (The_Display      : in Display;
                               The_Drawable     : in Drawable;
                               Top_GC           : in Graphic_Context;
                               Bottom_GC        : in Graphic_Context;
                               Center_GC        : in Graphic_Context;
                               X                : in Position;
                               Y                : in Position;
                               Width            : in Dimension;
                               Height           : in Dimension;
                               Shadow_Thickness : in Dimension;
                               Margin           : in Dimension)
   is
      procedure XmeDrawDiamond (The_Display      : in Display;
                                The_Drawable     : in Drawable;
                                Top_GC           : in Graphic_Context;
                                Bottom_GC        : in Graphic_Context;
                                Center_GC        : in Graphic_Context;
                                X                : in Position;
                                Y                : in Position;
                                Width            : in Dimension;
                                Height           : in Dimension;
                                Shadow_Thickness : in Dimension;
                                Margin           : in Dimension);
      pragma Import (C, XmeDrawDiamond, "XmeDrawDiamond");
   begin
      Check (The_Display);
      Check (Top_GC);
      Check (Bottom_GC);

      XmeDrawDiamond (The_Display,
                      The_Drawable,
                      Top_GC,
                      Bottom_GC,
                      Center_GC,
                      X,
                      Y,
                      Width,
                      Height,
                      Shadow_Thickness,
                      Margin);
   end Xme_Draw_Diamond;


   procedure Xme_Draw_Highlight (The_Display         : in Display;
                                 The_Drawable        : in Drawable;
                                 The_Graphic_Context : in Graphic_Context;
                                 X                   : in Position;
                                 Y                   : in Position;
                                 Width               : in Dimension;
                                 Height              : in Dimension;
                                 Highlight_Thickness : in Dimension)
   is
      procedure XmeDrawHighlight (The_Display         : in Display;
                                  The_Drawable        : in Drawable;
                                  The_Graphic_Context : in Graphic_Context;
                                  X                   : in Position;
                                  Y                   : in Position;
                                  Width               : in Dimension;
                                  Height              : in Dimension;
                                  Highlight_Thickness : in Dimension);
      pragma Import (C, XmeDrawHighlight, "XmeDrawHighlight");
   begin
      Check (The_Display);
      Check (The_Graphic_Context);

      XmeDrawHighlight (The_Display,
                        The_Drawable,
                        The_Graphic_Context,
                        X,
                        Y,
                        Width,
                        Height,
                        Highlight_Thickness);
   end Xme_Draw_Highlight;


   procedure Xme_Draw_Indicator (The_Display         : in Display;
                                 The_Drawable        : in Drawable;
                                 The_Graphic_Context : in Graphic_Context;
                                 X                   : in Position;
                                 Y                   : in Position;
                                 Width               : in Dimension;
                                 Height              : in Dimension;
                                 Margin              : in Dimension;
                                 Indicator_Type      : in Xm_Indicator_On)
   is
      procedure XmeDrawIndicator (The_Display         : in Display;
                                  The_Drawable        : in Drawable;
                                  The_Graphic_Context : in Graphic_Context;
                                  X                   : in Position;
                                  Y                   : in Position;
                                  Width               : in Dimension;
                                  Height              : in Dimension;
                                  Margin              : in Dimension;
                                  Indicator_Type      : in Xm_Indicator_On);
      pragma Import (C, XmeDrawIndicator, "XmeDrawIndicator");
   begin
      Check (The_Display);
      Check (The_Graphic_Context);
      if Indicator_Type /= Xm_Indicator_Check
        and Indicator_Type /= Xm_Indicator_Cross
      then
         raise Constraint_Error;
      end if;

      XmeDrawIndicator (The_Display,
                        The_Drawable,
                        The_Graphic_Context,
                        X,
                        Y,
                        Width,
                        Height,
                        Margin,
                        Indicator_Type);
   end Xme_Draw_Indicator;


   procedure Xme_Draw_Separator (The_Display      : in Display;
                                 The_Drawable     : in Drawable;
                                 Top_GC           : in Graphic_Context;
                                 Bottom_GC        : in Graphic_Context;
                                 Separator_GC     : in Graphic_Context;
                                 X                : in Position;
                                 Y                : in Position;
                                 Width            : in Dimension;
                                 Height           : in Dimension;
                                 Shadow_Thickness : in Dimension;
                                 Margin           : in Dimension;
                                 Orientation      : in Xm_Orientation;
                                 Separator_Type   : in Xm_Separator_Type)
   is
      procedure XmeDrawSeparator (The_Display      : in Display;
                                  The_Drawable     : in Drawable;
                                  Top_GC           : in Graphic_Context;
                                  Bottom_GC        : in Graphic_Context;
                                  Separator_GC     : in Graphic_Context;
                                  X                : in Position;
                                  Y                : in Position;
                                  Width            : in Dimension;
                                  Height           : in Dimension;
                                  Shadow_Thickness : in Dimension;
                                  Margin           : in Dimension;
                                  Orientation      : in Xm_Orientation;
                                  Separator_Type   : in Xm_Separator_Type);
      pragma Import (C, XmeDrawSeparator, "XmeDrawSeparator");
   begin
      Check (The_Display);
      Check (Top_GC);
      Check (Bottom_GC);
      Check (Separator_GC);
      if Orientation /= Xm_Horizontal and Orientation /= Xm_Vertical then
         raise Constraint_Error;
      end if;

      XmeDrawSeparator (The_Display,
                        The_Drawable,
                        Top_GC,
                        Bottom_GC,
                        Separator_GC,
                        X,
                        Y,
                        Width,
                        Height,
                        Shadow_Thickness,
                        Margin,
                        Orientation,
                        Separator_Type);
   end Xme_Draw_Separator;


   procedure Xme_Draw_Shadows (The_Display      : in Display;
                               The_Drawable     : in Drawable;
                               Top_GC           : in Graphic_Context;
                               Bottom_GC        : in Graphic_Context;
                               X                : in Position;
                               Y                : in Position;
                               Width            : in Dimension;
                               Height           : in Dimension;
                               Shadow_Thickness : in Dimension;
                               Shadow_Type      : in Xm_Shadow_Type)
   is
      procedure XmeDrawShadows (The_Display      : in Display;
                                The_Drawable     : in Drawable;
                                Top_GC           : in Graphic_Context;
                                Bottom_GC        : in Graphic_Context;
                                X                : in Position;
                                Y                : in Position;
                                Width            : in Dimension;
                                Height           : in Dimension;
                                Shadow_Thickness : in Dimension;
                                Shadow_Type      : in Xm_Shadow_Type);
      pragma Import (C, XmeDrawShadows, "XmeDrawShadows");
   begin
      Check (The_Display);
      Check (Top_GC);
      Check (Bottom_GC);

      XmeDrawShadows (The_Display,
                      The_Drawable,
                      Top_GC,
                      Bottom_GC,
                      X,
                      Y,
                      Width,
                      Height,
                      Shadow_Thickness,
                      Shadow_Type);
   end Xme_Draw_Shadows;


   procedure Xme_Drop_Sink (The_Widget : in Widget;
                            Arg_List   : in Xt_Arg_List := Null_Xt_Arg_List)
   is
      procedure XmeDropSink (The_Widget : in Widget;
                             Arg_List   : in Xt_Arg_List;
                             Arg_Count  : in Cardinal);
      pragma Import (C, XmeDropSink, "XmeDropSink");
   begin
      Check (The_Widget);
      XmeDropSink (The_Widget, Arg_List, Arg_List'Length);
   end Xme_Drop_Sink;


   function Xme_Focus_Is_In_Shell (The_Widget : in Widget) return Boolean is
      function XmeFocusIsInShell (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XmeFocusIsInShell, "XmeFocusIsInShell");
   begin
      Check (The_Widget);
      return To_Boolean (XmeFocusIsInShell (The_Widget));
   end Xme_Focus_Is_In_Shell;


   function Xme_Get_Default_Render_Table
    (The_Widget        : in Widget;
     Render_Table_Type : in Xm_Render_Table_Type)
       return Xm_Render_Table
   is
      function XmeGetDefaultRenderTable
       (The_Widget        : in Widget;
        Render_Table_Type : in Xm_Render_Table_Type)
          return Xm_Render_Table;
      pragma Import (C, XmeGetDefaultRenderTable, "XmeGetDefaultRenderTable");
   begin
      Check (The_Widget);
      return XmeGetDefaultRenderTable (The_Widget, Render_Table_Type);
   end Xme_Get_Default_Render_Table;

   procedure Xme_Set_WM_Shell_Title (Title : in Xm.Xm_String;
                                     Shell : in Xt.Widget)
   is
      procedure XmeSetWMShellTitle (Title : in Xm_String;
                                    Shell : in Xt.Widget);
      pragma Import (C, XmeSetWMShellTitle, "XmeSetWMShellTitle");
   begin
      XmeSetWMShellTitle (Title, Shell);
   end Xme_Set_WM_Shell_Title;

end Xm.Internal;
