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
--! <Unit> Xm_Text
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xlib;
with Xt.Ancillary_Types;

with Xm;
with Xm_Primitive;

package Xm_Text is

   subtype Xm_Text_Widget is Xm_Primitive.Xm_Primitive_Widget;
   subtype Xm_Text_Class is Xm_Primitive.Xm_Primitive_Class;

   Xm_Text_Widget_Class : constant Xm_Text_Class;

   --

   function Xm_Create_Text (Parent   : in Xt.Widget;
                            Name     : in String;
                            Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
                              := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Text_Widget;

   function Xm_Create_Scrolled_Text
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Text_Widget;

   function Xm_Create_Managed_Text
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Text_Widget;

   function Xm_Create_Managed_Scrolled_Text
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Text_Widget;

   --

   procedure Xm_Text_Clear_Selection (The_Widget : in Xm_Text_Widget;
                                      The_Time   : in Xlib.Time);


   function Xm_Text_Copy (The_Widget : in Xm_Text_Widget;
                          The_Time   : in Xlib.Time)
     return Boolean;


   function Xm_Text_Copy_Link (The_Widget : in Xm_Text_Widget;
                               The_Time   : in Xlib.Time)
     return Boolean;


   function Xm_Text_Cut (The_Widget : in Xm_Text_Widget;
                         The_Time   : in Xlib.Time)
     return Boolean;


   procedure Xm_Text_Disable_Redisplay (The_Widget : in Xm_Text_Widget);


   procedure Xm_Text_Enable_Redisplay (The_Widget : in Xm_Text_Widget);


   procedure Xm_Text_Find_String (The_Widget : in     Xm_Text_Widget;
                                  Start      : in     Xm.Xm_Text_Position;
                                  The_String : in     String;
                                  Direction  : in     Xm.Xm_Text_Direction;
                                  Position   :    out Xm.Xm_Text_Position;
                                  Found      :    out Boolean);


   --  procedure Xm_Text_Find_String_Wcs (The_Widget : in     Xm_Text_Widget;
   --                                     Start      : in     Xm.Xm_Text_Position;
   --                                     The_String : in     Wide_String;
   --                                     Direction  : in     Xm.Xm_Text_Direction;
   --                                     Position   :    out Xm.Xm_Text_Position;
   --                                     Found      :    out Boolean);


   function Xm_Text_Get_Baseline (The_Widget : in Xm_Text_Widget)
     return Xt.Dimension;


   function Xm_Text_Get_Centerline (The_Widget : in Xm_Text_Widget)
     return Xt.Dimension;


   function Xm_Text_Get_Editable (The_Widget : in Xm_Text_Widget)
     return Boolean;


   function Xm_Text_Get_Insertion_Position (The_Widget : in Xm_Text_Widget)
     return Xm.Xm_Text_Position;


   function Xm_Text_Get_Last_Position (The_Widget : in Xm_Text_Widget)
     return Xm.Xm_Text_Position;


   function Xm_Text_Get_Max_Length (The_Widget : in Xm_Text_Widget)
     return Xm.Xm_Text_Position;


   function Xm_Text_Get_Selection (The_Widget : in Xm_Text_Widget)
     return String;


   procedure Xm_Text_Get_Selection_Position
    (The_Widget    : in     Xm_Text_Widget;
     Left          :    out Xm.Xm_Text_Position;
     Right         :    out Xm.Xm_Text_Position;
     Own_Selection :    out Boolean);


   --  function Xm_Text_Get_Selection_Wcs (The_Widget : in Xm_Text_Widget)
   --    return Wide_String;


   function Xm_Text_Get_String (The_Widget : in Xm_Text_Widget) return String;


   --  function Xm_Text_Get_String_Wcs (The_Widget : in Xm_Text_Widget)
   --    return Wide_String;


   procedure Xm_Text_Get_Substring
    (The_Widget : in     Xm_Text_Widget;
     Start      : in     Xm.Xm_Text_Position;
     Num_Chars  : in     Natural;
     Buffer     :    out String;
     Last       :    out Natural;
     Status     :    out Xm.Xm_Text_Substring_Status);


   --  procedure Xm_Text_Get_Substring_Wcs
   --   (The_Widget : in     Xm_Text_Widget;
   --    Start      : in     Xm.Xm_Text_Position;
   --    Num_Chars  : in     Natural;
   --    Buffer     :    out Wide_String;
   --    Last       :    out Natural;
   --    Status     :    out Xm.Xm_Text_Substring_Status);


   function Xm_Text_Get_Top_Character (The_Widget : in Xm_Text_Widget)
     return Xm.Xm_Text_Position;


   procedure Xm_Text_Insert (The_Widget : in Xm_Text_Widget;
                             Position   : in Xm.Xm_Text_Position;
                             Value      : in String);


   --  procedure Xm_Text_Insert_Wcs (The_Widget : in Xm_Text_Widget;
   --                                Position   : in Xm.Xm_Text_Position;
   --                                Value      : in Wide_String);


   function Xm_Text_Paste (The_Widget : in Xm_Text_Widget)
     return Boolean;


   function Xm_Text_Paste_Link (The_Widget : in Xm_Text_Widget)
     return Boolean;


   procedure Xm_Text_Pos_To_XY (The_Widget : in     Xm_Text_Widget;
                                Position   : in     Xm.Xm_Text_Position;
                                X          :    out Xt.Position;
                                Y          :    out Xt.Position;
                                Visible    :    out Boolean);


   function Xm_Text_Remove (The_Widget : in Xm_Text_Widget) return Boolean;


   procedure Xm_Text_Replace (The_Widget : in Xm_Text_Widget;
                              From_Pos   : in Xm.Xm_Text_Position;
                              To_Pos     : in Xm.Xm_Text_Position;
                              Value      : in String);


   --  procedure Xm_Text_Replace_Wcs (The_Widget : in Xm_Text_Widget;
   --                                 From_Pos   : in Xm.Xm_Text_Position;
   --                                 To_Pos     : in Xm.Xm_Text_Position;
   --                                 Value      : in Wide_String);


   procedure Xm_Text_Scroll (The_Widget : in Xm_Text_Widget;
                             Lines      : in Integer);


   procedure Xm_Text_Set_Add_Mode (The_Widget : in Xm_Text_Widget;
                                   State      : in Boolean);


   procedure Xm_Text_Set_Editable (The_Widget : in Xm_Text_Widget;
                                   Editable   : in Boolean);


   procedure Xm_Text_Set_Highlight (The_Widget : in Xm_Text_Widget;
                                    Left       : in Xm.Xm_Text_Position;
                                    Right      : in Xm.Xm_Text_Position;
                                    Mode       : in Xm.Xm_Highlight_Mode);


   procedure Xm_Text_Set_Insertion_Position
    (The_Widget : in Xm_Text_Widget;
     Position   : in Xm.Xm_Text_Position);


   procedure Xm_Text_Set_Max_Length (The_Widget : in Xm_Text_Widget;
                                     Max_Length : in Xm.Xm_Text_Position);


   procedure Xm_Text_Set_Selection (The_Widget : in Xm_Text_Widget;
                                    First      : in Xm.Xm_Text_Position;
                                    Last       : in Xm.Xm_Text_Position;
                                    The_Time   : in Xlib.Time);


   procedure Xm_Text_Set_String (The_Widget : in Xm_Text_Widget;
                                 The_String : in String);


   --  procedure Xm_Text_Set_String_Wcs (The_Widget : in Xm_Text_Widget;
   --                                    The_String : in Wide_String);


   procedure Xm_Text_Show_Position (The_Widget : in Xm_Text_Widget;
                                    Position   : in Xm.Xm_Text_Position);


   procedure Xm_Text_Set_Top_Character
    (The_Widget    : in Xm_Text_Widget;
     Top_Character : in Xm.Xm_Text_Position);


   function Xm_Text_XY_To_Pos (The_Widget : in Xm_Text_Widget;
                               X          : in Xt.Position;
                               Y          : in Xt.Position)
     return Xm.Xm_Text_Position;


private

   pragma Import (C, Xm_Text_Widget_Class, "xmTextWidgetClass");

end Xm_Text;
