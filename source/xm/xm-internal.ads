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
--! <Unit> Xm.Internal
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Xm.Internal is

   type Xm_Focus_Moved_Callback_Struct is record
      Reason       : Xm_Callback_Reason;
      Event        : Xlib.Events.Event;
      Cont         : Xt.Xt_Boolean;
      Old_Focus    : Xt.Widget;
      New_Focus    : Xt.Widget;
      Focus_Policy : Xm_Keyboard_Focus_Policy;
      Direction    : Xm_Traversal_Direction;
   end record;

   type Xm_Focus_Moved_Callback_Struct_Access is
     access all Xm_Focus_Moved_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Focus_Moved_Callback_Struct_Access;


   type Xm_Render_Table_Type is (Xm_Label_Render_Table,
                                 Xm_Button_Render_Table,
                                 Xm_Text_Render_Table);

   procedure Xme_Add_Focus_Change_Callback
    (The_Widget : in Xt.Widget;
     Callback   : in Xt.Xt_Callback_Proc;
     Closure    : in Xt.Xt_Pointer);


   procedure Xme_Configure_Object (The_Widget   : in Xt.Widget;
                                   X            : in Xt.Position;
                                   Y            : in Xt.Position;
                                   Width        : in Xt.Dimension;
                                   Height       : in Xt.Dimension;
                                   Border_Width : in Xt.Dimension);


   function Xme_Create_Class_Dialog
    (The_Widget_Class : in Xt.Widget_Class;
     Parent           : in Xt.Widget;
     Name             : in String;
     Arg_List         : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xt.Widget;


   function Xme_Focus_Is_In_Shell (The_Widget : in Xt.Widget) return Boolean;


   function Xme_Get_Default_Render_Table
    (The_Widget        : in Xt.Widget;
     Render_Table_Type : in Xm_Render_Table_Type)
       return Xm_Render_Table;


   --  Drawing functions

   procedure Xme_Clear_Border (The_Display : in Xlib.Display;
                               The_Window  : in Xlib.Window;
                               X           : in Xt.Position;
                               Y           : in Xt.Position;
                               Width       : in Xt.Dimension;
                               Height      : in Xt.Dimension;
                               Thickness   : in Xt.Dimension);


   procedure Xme_Draw_Arrow
    (The_Display      : in Xlib.Display;
     The_Drawable     : in Xlib.Drawable;
     Top_GC           : in Xlib.Graphic_Context;
     Bottom_GC        : in Xlib.Graphic_Context;
     Center_GC        : in Xlib.Graphic_Context;
     X                : in Xt.Position;
     Y                : in Xt.Position;
     Width            : in Xt.Dimension;
     Height           : in Xt.Dimension;
     Shadow_Thickness : in Xt.Dimension;
     Direction        : in Xm_Arrow_Direction);


   procedure Xme_Draw_Circle
    (The_Display      : in Xlib.Display;
     The_Drawable     : in Xlib.Drawable;
     Top_GC           : in Xlib.Graphic_Context;
     Bottom_GC        : in Xlib.Graphic_Context;
     Center_GC        : in Xlib.Graphic_Context;
     X                : in Xt.Position;
     Y                : in Xt.Position;
     Width            : in Xt.Dimension;
     Height           : in Xt.Dimension;
     Shadow_Thickness : in Xt.Dimension;
     Margin           : in Xt.Dimension);


   procedure Xme_Draw_Diamond
    (The_Display      : in Xlib.Display;
     The_Drawable     : in Xlib.Drawable;
     Top_GC           : in Xlib.Graphic_Context;
     Bottom_GC        : in Xlib.Graphic_Context;
     Center_GC        : in Xlib.Graphic_Context;
     X                : in Xt.Position;
     Y                : in Xt.Position;
     Width            : in Xt.Dimension;
     Height           : in Xt.Dimension;
     Shadow_Thickness : in Xt.Dimension;
     Margin           : in Xt.Dimension);


   procedure Xme_Draw_Highlight
    (The_Display         : in Xlib.Display;
     The_Drawable        : in Xlib.Drawable;
     The_Graphic_Context : in Xlib.Graphic_Context;
     X                   : in Xt.Position;
     Y                   : in Xt.Position;
     Width               : in Xt.Dimension;
     Height              : in Xt.Dimension;
     Highlight_Thickness : in Xt.Dimension);


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xme_Draw_Indicator
   --!    <Purpose>
   --!    <Exceptions> Constraint_Error - raised when Indicator not
   --! Xm_Indicator_Check ot Xm_Indicator_Cross.
   ---------------------------------------------------------------------------
   procedure Xme_Draw_Indicator
    (The_Display         : in Xlib.Display;
     The_Drawable        : in Xlib.Drawable;
     The_Graphic_Context : in Xlib.Graphic_Context;
     X                   : in Xt.Position;
     Y                   : in Xt.Position;
     Width               : in Xt.Dimension;
     Height              : in Xt.Dimension;
     Margin              : in Xt.Dimension;
     Indicator_Type      : in Xm_Indicator_On);


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xme_Draw_Separator
   --!    <Purpose>
   --!    <Exceptions> Constraint_Error - raised when Orientation not
   --! Xm_Horizontal ot Xm_Vertical.
   ---------------------------------------------------------------------------
   procedure Xme_Draw_Separator
    (The_Display      : in Xlib.Display;
     The_Drawable     : in Xlib.Drawable;
     Top_GC           : in Xlib.Graphic_Context;
     Bottom_GC        : in Xlib.Graphic_Context;
     Separator_GC     : in Xlib.Graphic_Context;
     X                : in Xt.Position;
     Y                : in Xt.Position;
     Width            : in Xt.Dimension;
     Height           : in Xt.Dimension;
     Shadow_Thickness : in Xt.Dimension;
     Margin           : in Xt.Dimension;
     Orientation      : in Xm_Orientation;
     Separator_Type   : in Xm_Separator_Type);


   procedure Xme_Draw_Shadows
    (The_Display      : in Xlib.Display;
     The_Drawable     : in Xlib.Drawable;
     Top_GC           : in Xlib.Graphic_Context;
     Bottom_GC        : in Xlib.Graphic_Context;
     X                : in Xt.Position;
     Y                : in Xt.Position;
     Width            : in Xt.Dimension;
     Height           : in Xt.Dimension;
     Shadow_Thickness : in Xt.Dimension;
     Shadow_Type      : in Xm_Shadow_Type);


   --  Data transfer functions, DND

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xme_Clipboard_Sink
   --!    <Purpose>
   --!    <Exceptions> Constraint_Error - raised when Operaion not Xm_Copy or
   --! Xm_Link.
   ---------------------------------------------------------------------------
   function Xme_Clipboard_Sink (The_Widget    : in Xt.Widget;
                                Operation     : in Xm_Destination_Operation;
                                Location_Data : in Xt.Xt_Pointer)
     return Boolean;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xme_Clipboard_Source
   --!    <Purpose>
   --!    <Exceptions> Constaint_Error - raised when Operation not Xm_Move,
   --! Xm_Copy or Xm_Link.
   ---------------------------------------------------------------------------
   function Xme_Clipboard_Source (The_Widget : in Xt.Widget;
                                  Operation  : in Xm_Destination_Operation;
                                  The_Time   : in Xlib.Time)
     return Boolean;


   procedure Xme_Drop_Sink (The_Widget : in Xt.Widget;
                            Arg_List   : in Xt.Ancillary_Types.Xt_Arg_List
                              := Xt.Ancillary_Types.Null_Xt_Arg_List);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xme_Set_WM_Shell_Title
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Xme_Set_WM_Shell_Title (Title : in Xm.Xm_String;
                                     Shell : in Xt.Widget);

private

   pragma Convention (C, Xm_Focus_Moved_Callback_Struct);
   pragma No_Strict_Aliasing (Xm_Focus_Moved_Callback_Struct_Access);

   pragma Convention (C, Xm_Render_Table_Type);
   for Xm_Render_Table_Type'Size use Interfaces.C.unsigned_char'Size;
   for Xm_Render_Table_Type use (Xm_Label_Render_Table  => 1,
                                 Xm_Button_Render_Table => 2,
                                 Xm_Text_Render_Table   => 3);

end Xm.Internal;
