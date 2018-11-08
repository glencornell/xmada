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
--! <Unit>
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Strings;

with Xt.Composite_Management;

with Xm.Implementation;

package body Xm_Text is

   use Interfaces.C;
   use Interfaces.C.Strings;
   use Xlib;
   use Xm;
   use Xm.Implementation;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;

   function Xm_Create_Managed_Scrolled_Text
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Text_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Scrolled_Text (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Scrolled_Text;


   function Xm_Create_Managed_Text
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Text_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Text (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Text;


   function Xm_Create_Scrolled_Text
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Text_Widget
   is
      function XmCreateScrolledText (Parent    : in Widget;
                                     Name      : in char_array;
                                     Arg_List  : in Xt_Arg_List;
                                     Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateScrolledText, "XmCreateScrolledText");
   begin
      return
        XmCreateScrolledText (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Scrolled_Text;


   function Xm_Create_Text (Parent   : in Xt.Widget;
                            Name     : in String;
                            Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
                              := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Text_Widget
   is
      function XmCreateText (Parent    : in Widget;
                             Name      : in char_array;
                             Arg_List  : in Xt_Arg_List;
                             Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateText, "XmCreateText");
   begin
      return XmCreateText (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Text;


   procedure Xm_Text_Clear_Selection (The_Widget : in Xm_Text_Widget;
                                      The_Time   : in Time)
   is
      procedure XmTextClearSelection (The_Widget : in Widget;
                                      The_Time   : in Time);
      pragma Import (C, XmTextClearSelection, "XmTextClearSelection");
   begin
      Check (The_Widget);
      XmTextClearSelection (The_Widget, The_Time);
   end Xm_Text_Clear_Selection;


   function Xm_Text_Copy (The_Widget : in Xm_Text_Widget;
                          The_Time   : in Time)
     return Boolean
   is
      function XmTextCopy (The_Widget : in Widget;
                           The_Time   : in Time)
        return Xt_Boolean;
      pragma Import (C, XmTextCopy, "XmTextCopy");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextCopy (The_Widget, The_Time));
   end Xm_Text_Copy;


   function Xm_Text_Copy_Link (The_Widget : in Xm_Text_Widget;
                               The_Time   : in Xlib.Time)
     return Boolean
   is
      function XmTextCopyLink (The_Widget : in Widget;
                               The_Time   : in Time)
        return Xt_Boolean;
      pragma Import (C, XmTextCopyLink, "XmTextCopyLink");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextCopyLink (The_Widget, The_Time));
   end Xm_Text_Copy_Link;


   function Xm_Text_Cut (The_Widget : in Xm_Text_Widget;
                         The_Time   : in Xlib.Time)
     return Boolean
   is
      function XmTextCut (The_Widget : in Widget;
                          The_Time   : in Time)
        return Xt_Boolean;
      pragma Import (C, XmTextCut, "XmTextCut");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextCut (The_Widget, The_Time));
   end Xm_Text_Cut;


   procedure Xm_Text_Disable_Redisplay (The_Widget : in Xm_Text_Widget) is
      procedure XmTextDisableRedisplay (The_Widget : in Widget);
      pragma Import (C, XmTextDisableRedisplay, "XmTextDisableRedisplay");
   begin
      Check (The_Widget);
      XmTextDisableRedisplay (The_Widget);
   end Xm_Text_Disable_Redisplay;


   procedure Xm_Text_Enable_Redisplay (The_Widget : in Xm_Text_Widget) is
      procedure XmTextEnableRedisplay (The_Widget : in Widget);
      pragma Import (C, XmTextEnableRedisplay, "XmTextEnableRedisplay");
   begin
      Check (The_Widget);
      XmTextEnableRedisplay (The_Widget);
   end Xm_Text_Enable_Redisplay;


   procedure Xm_Text_Find_String (The_Widget : in     Xm_Text_Widget;
                                  Start      : in     Xm.Xm_Text_Position;
                                  The_String : in     String;
                                  Direction  : in     Xm.Xm_Text_Direction;
                                  Position   :    out Xm.Xm_Text_Position;
                                  Found      :    out Boolean)
   is
      C_Position : aliased Xm_Text_Position;

      function XmTextFindString (The_Widget : in Widget;
                                 Start      : in     Xm_Text_Position;
                                 The_String : in     char_array;
                                 Direction  : in     Xm_Text_Direction;
                                 Position   : access Xm_Text_Position)
        return Xt_Boolean;
      pragma Import (C, XmTextFindString, "XmTextFindString");
   begin
      Check (The_Widget);

      Found := To_Boolean (XmTextFindString (The_Widget,
                                             Start,
                                             To_C (The_String),
                                             Direction,
                                             C_Position'Access));
      if Found then
         Position := C_Position;
      else
         Position := Xm_Text_Position'Last;
      end if;
   end Xm_Text_Find_String;


   --  procedure Xm_Text_Find_String_Wcs (The_Widget : in     Xm_Text_Widget;
   --                                     Start      : in     Xm_Text_Position;
   --                                     The_String : in     Wide_String;
   --                                     Direction  : in     Xm_Text_Direction;
   --                                     Position   :    out Xm_Text_Position;
   --                                     Found      :    out Boolean)
   --  is
   --     C_Position : aliased Xm_Text_Position;

   --     function XmTextFindStringWcs (The_Widget : in Widget;
   --                                   Start      : in     Xm_Text_Position;
   --                                   The_String : in     wchar_array;
   --                                   Direction  : in     Xm_Text_Direction;
   --                                   Position   : access Xm_Text_Position)
   --       return Xt_Boolean;
   --     pragma Import (C, XmTextFindStringWcs, "XmTextFindStringWcs");
   --  begin
   --     Check (The_Widget);

   --     Found := To_Boolean (XmTextFindStringWcs (The_Widget,
   --                                               Start,
   --                                               To_C (The_String),
   --                                               Direction,
   --                                               C_Position'Access));
   --     if Found then
   --        Position := C_Position;
   --     else
   --        Position := Xm_Text_Position'Last;
   --     end if;
   --  end Xm_Text_Find_String_Wcs;


   function Xm_Text_Get_Baseline (The_Widget : in Xm_Text_Widget)
     return Dimension
   is
      function XmTextGetBaseline (The_Widget : in Widget) return int;
      pragma Import (C, XmTextGetBaseline, "XmTextGetBaseline");
   begin
      Check (The_Widget);
      return Dimension (XmTextGetBaseline (The_Widget));
   end Xm_Text_Get_Baseline;


   function Xm_Text_Get_Centerline (The_Widget : in Xm_Text_Widget)
     return Dimension
   is
      function XmTextGetCenterline (The_Widget : in Widget) return int;
      pragma Import (C, XmTextGetCenterline, "XmTextGetCenterline");
   begin
      Check (The_Widget);
      return Dimension (XmTextGetCenterline (The_Widget));
   end Xm_Text_Get_Centerline;


   function Xm_Text_Get_Editable (The_Widget : in Xm_Text_Widget)
     return Boolean
   is
      function XmTextGetEditable (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XmTextGetEditable, "XmTextGetEditable");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextGetEditable (The_Widget));
   end Xm_Text_Get_Editable;


   function Xm_Text_Get_Insertion_Position (The_Widget : in Xm_Text_Widget)
     return Xm_Text_Position
   is
      function XmTextGetInsertionPosition (The_Widget : in Widget)
        return Xm_Text_Position;
      pragma Import (C, XmTextGetInsertionPosition,
                     "XmTextGetInsertionPosition");
   begin
      Check (The_Widget);
      return XmTextGetInsertionPosition (The_Widget);
   end Xm_Text_Get_Insertion_Position;


   function Xm_Text_Get_Last_Position (The_Widget : in Xm_Text_Widget)
     return Xm_Text_Position
   is
      function XmTextGetLastPosition (The_Widget : in Widget)
        return Xm_Text_Position;
      pragma Import (C, XmTextGetLastPosition, "XmTextGetLastPosition");
   begin
      Check (The_Widget);
      return XmTextGetLastPosition (The_Widget);
   end Xm_Text_Get_Last_Position;


   function Xm_Text_Get_Max_Length (The_Widget : in Xm_Text_Widget)
     return Xm_Text_Position
   is
      function XmTextGetMaxLength (The_Widget : in Widget) return int;
      pragma Import (C, XmTextGetMaxLength, "XmTextGetMaxLength");
   begin
      Check (The_Widget);
      return Xm_Text_Position (XmTextGetMaxLength (The_Widget));
   end Xm_Text_Get_Max_Length;


   function Xm_Text_Get_Selection (The_Widget : in Xm_Text_Widget)
     return String
   is
      C_Return_Value : chars_ptr;

      function XmTextGetSelection (The_Widget : in Widget) return chars_ptr;
      pragma Import (C, XmTextGetSelection, "XmTextGetSelection");

      procedure XtFree (Item : in chars_ptr);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget);

      C_Return_Value := XmTextGetSelection (The_Widget);

      if C_Return_Value = Interfaces.C.Strings.Null_Ptr then
         return "";
      end if;

      declare
         Return_Value : constant String := Value (C_Return_Value);
      begin
         XtFree (C_Return_Value);
         return Return_Value;
      end;
   end Xm_Text_Get_Selection;


   procedure Xm_Text_Get_Selection_Position
    (The_Widget    : in     Xm_Text_Widget;
     Left          :    out Xm_Text_Position;
     Right         :    out Xm_Text_Position;
     Own_Selection :    out Boolean)
   is
      L : aliased Xm_Text_Position;
      R : aliased Xm_Text_Position;

     function XmTextGetSelectionPosition (The_Widget : in     Widget;
                                          Left       : access Xm_Text_Position;
                                          Right      : access Xm_Text_Position)
       return Xt_Boolean;
      pragma Import (C, XmTextGetSelectionPosition,
                     "XmTextGetSelectionPosition");
   begin
      Own_Selection :=
        To_Boolean (XmTextGetSelectionPosition (The_Widget,
                                                L'Access,
                                                R'Access));
      if Own_Selection then
         Left  := L;
         Right := R;
      else
         Left  := 0;
         Right := 0;
      end if;
   end Xm_Text_Get_Selection_Position;


   --  function Xm_Text_Get_Selection_Wcs (The_Widget : in Xm_Text_Widget)
   --    return Wide_String
   --  is
   --     type Wchar_Array_Ptr is access all Wchar_Array;
   --     C_Return_Value : Wchar_Array_ptr;

   --     function XmTextGetSelectionWcs (The_Widget : in Widget)
   --       return Wchar_Array_ptr;
   --     pragma Import (C, XmTextGetSelectionWcs, "XmTextGetSelectionWcs");

   --     procedure XtFree (Item : in wchar_array);
   --     pragma Import (C, XtFree, "XtFree");
   --  begin
   --     Check (The_Widget);

   --     C_Return_Value := XmTextGetSelectionWcs (The_Widget);

   --     if C_Return_Value = null then
   --        return "";
   --     end if;

   --     declare
   --        Return_Value : constant Wide_String := To_Ada (C_Return_Value.all);
   --     begin
   --        XtFree (C_Return_Value.all);
   --        return Return_Value;
   --     end;
   --  end Xm_Text_Get_Selection_Wcs;


   function Xm_Text_Get_String (The_Widget : in Xm_Text_Widget)
     return String
   is
      C_Return_Value : chars_ptr;

      function XmTextGetString (The_Widget : in Widget) return chars_ptr;
      pragma Import (C, XmTextGetString, "XmTextGetString");

      procedure XtFree (Pointer : in chars_ptr);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget);
      C_Return_Value := XmTextGetString (The_Widget);
      declare
         Return_Value : constant String := Value (C_Return_Value);
      begin
         XtFree (C_Return_Value);
         return Return_Value;
      end;
   end Xm_Text_Get_String;


   --  function Xm_Text_Get_String_Wcs (The_Widget : in Xm_Text_Widget)
   --    return Wide_String
   --  is
   --     C_Return_Value : wchar_array;

   --     function XmTextGetStringWcs (The_Widget : in Widget) return wchar_array;
   --     pragma Import (C, XmTextGetStringWcs, "XmTextGetStringWcs");

   --     procedure XtFree (Pointer : in wchar_array);
   --     pragma Import (C, XtFree, "XtFree");
   --  begin
   --     Check (The_Widget);
   --     C_Return_Value := XmTextGetStringWcs (The_Widget);
   --     declare
   --        Return_Value : constant Wide_String := Value (C_Return_Value);
   --     begin
   --        XtFree (C_Return_Value);
   --        return Return_Value;
   --     end;
   --  end Xm_Text_Get_String_Wcs;


   procedure Xm_Text_Get_Substring
    (The_Widget : in     Xm_Text_Widget;
     Start      : in     Xm_Text_Position;
     Num_Chars  : in     Natural;
     Buffer     :    out String;
     Last       :    out Natural;
     Status     :    out Xm_Text_Substring_Status)
   is
      pragma Warnings (Off);
      C_Buffer : char_array (0 .. Buffer'Length);
      pragma Warnings (On);

      function XmTextGetSubstring (The_Widget  : in Widget;
                                   Start       : in Xm_Text_Position;
                                   Num_Chars   : in int;
                                   Buffer_Size : in int;
                                   Buffer      : in char_array)
        return Xm_Text_Substring_Status;
      pragma Import (C, XmTextGetSubstring, "XmTextGetSubstring");
   begin
      Check (The_Widget);

      Status := XmTextGetSubstring (The_Widget,
                                    Start,
                                    int (Num_Chars),
                                    C_Buffer'Length,
                                    C_Buffer);
      if Status /= Xm_Copy_Failed then
         declare
            Tmp : constant String := To_Ada (C_Buffer);
         begin
            Last := Buffer'First + Tmp'Length - 1;
            Buffer (Buffer'First .. Last) := Tmp;
         end;
      else
         Last := 0;
      end if;
   end Xm_Text_Get_Substring;


   --  procedure Xm_Text_Get_Substring_Wcs
   --   (The_Widget : in     Xm_Text_Widget;
   --    Start      : in     Xm.Xm_Text_Position;
   --    Num_Chars  : in     Natural;
   --    Buffer     :    out Wide_String;
   --    Last       :    out Natural;
   --    Status     :    out Xm_Text_Substring_Status)
   --  is
   --     pragma Warnings (Off);
   --     C_Buffer : wchar_array (0 .. Buffer'Length);
   --     pragma Warnings (On);

   --     function XmTextGetSubstringWcs (The_Widget  : in Widget;
   --                                     Start       : in Xm_Text_Position;
   --                                     Num_Chars   : in int;
   --                                     Buffer_Size : in int;
   --                                     Buffer      : in wchar_array)
   --       return Xm_Text_Substring_Status;
   --     pragma Import (C, XmTextGetSubstringWcs, "XmTextGetSubstringWcs");
   --  begin
   --     Check (The_Widget);

   --     Status := XmTextGetSubstringWcs (The_Widget,
   --                                      Start,
   --                                      int (Num_Chars),
   --                                      C_Buffer'Length,
   --                                      C_Buffer);
   --     if Status /= Xm_Copy_Failed then
   --        declare
   --           Tmp : constant Wide_String := To_Ada (C_Buffer);
   --        begin
   --           Last := Buffer'First + Tmp'Length - 1;
   --           Buffer (Buffer'First .. Last) := Tmp;
   --        end;
   --     else
   --        Last := 0;
   --     end if;
   --  end Xm_Text_Get_Substring_Wcs;


   function Xm_Text_Get_Top_Character (The_Widget : in Xm_Text_Widget)
     return Xm_Text_Position
   is
      function XmTextGetTopCharacter (The_Widget : in Widget)
        return Xm_Text_Position;
      pragma Import (C, XmTextGetTopCharacter, "XmTextGetTopCharacter");
   begin
      Check (The_Widget);
      return XmTextGetTopCharacter (The_Widget);
   end Xm_Text_Get_Top_Character;


   procedure Xm_Text_Insert (The_Widget : in Xm_Text_Widget;
                             Position   : in Xm_Text_Position;
                             Value      : in String)
   is
      procedure XmTextInsert (The_Widget : in Widget;
                              Position   : in Xm_Text_Position;
                              Value      : in char_array);
      pragma Import (C, XmTextInsert, "XmTextInsert");
   begin
      Check (The_Widget);
      XmTextInsert (The_Widget, Position, To_C (Value));
   end Xm_Text_Insert;


   --  procedure Xm_Text_Insert_Wcs (The_Widget : in Xm_Text_Widget;
   --                                Position   : in Xm_Text_Position;
   --                                Value      : in Wide_String)
   --  is
   --     procedure XmTextInsertWcs (The_Widget : in Widget;
   --                                Position   : in Xm_Text_Position;
   --                                Value      : in wchar_array);
   --     pragma Import (C, XmTextInsertWcs, "XmTextInsertWcs");
   --  begin
   --     Check (The_Widget);
   --     XmTextInsertWcs (The_Widget, Position, To_C (Value));
   --  end Xm_Text_Insert_Wcs;


   function Xm_Text_Paste (The_Widget : in Xm_Text_Widget)
     return Boolean
   is
      function XmTextPaste (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XmTextPaste, "XmTextPaste");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextPaste (The_Widget));
   end Xm_Text_Paste;


   function Xm_Text_Paste_Link (The_Widget : in Xm_Text_Widget)
     return Boolean
   is
      function XmTextPasteLink (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XmTextPasteLink, "XmTextPasteLink");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextPasteLink (The_Widget));
   end Xm_Text_Paste_Link;


   procedure Xm_Text_Pos_To_XY (The_Widget : in     Xm_Text_Widget;
                                Position   : in     Xm_Text_Position;
                                X          :    out Xt.Position;
                                Y          :    out Xt.Position;
                                Visible    :    out Boolean)
   is
      A_X : aliased Xt.Position;
      A_Y : aliased Xt.Position;

      function XmTextPosToXY (The_Widget : in     Widget;
                              Position   : in     Xm_Text_Position;
                              X          : access Xt.Position;
                              Y          : access Xt.Position)
        return Xt_Boolean;
      pragma Import (C, XmTextPosToXY, "XmTextPosToXY");
   begin
      Check (The_Widget);

      Visible := To_Boolean (XmTextPosToXY (The_Widget,
                                            Position,
                                            A_X'Access,
                                            A_Y'Access));
      if Visible then
         X := A_X;
         Y := A_Y;
      end if;
   end Xm_Text_Pos_To_XY;


   function Xm_Text_Remove (The_Widget : in Xm_Text_Widget) return Boolean is
      function XmTextRemove (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XmTextRemove, "XmTextRemove");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextRemove (The_Widget));
   end Xm_Text_Remove;


   procedure Xm_Text_Replace (The_Widget : in Xm_Text_Widget;
                              From_Pos   : in Xm.Xm_Text_Position;
                              To_Pos     : in Xm.Xm_Text_Position;
                              Value      : in String)
   is
      procedure XmTextReplace (The_Widget : in Widget;
                               From_Pos   : in Xm_Text_Position;
                               To_Pos     : in Xm_Text_Position;
                               Value      : in char_array);
      pragma Import (C, XmTextReplace, "XmTextReplace");
   begin
      Check (The_Widget);
      XmTextReplace (The_Widget, From_Pos, To_Pos, To_C (Value));
   end Xm_Text_Replace;


   --  procedure Xm_Text_Replace_Wcs (The_Widget : in Xm_Text_Widget;
   --                                 From_Pos   : in Xm.Xm_Text_Position;
   --                                 To_Pos     : in Xm.Xm_Text_Position;
   --                                 Value      : in Wide_String)
   --  is
   --     procedure XmTextReplaceWcs (The_Widget : in Widget;
   --                                 From_Pos   : in Xm_Text_Position;
   --                                 To_Pos     : in Xm_Text_Position;
   --                                 Value      : in wchar_array);
   --     pragma Import (C, XmTextReplaceWcs, "XmTextReplaceWcs");
   --  begin
   --     Check (The_Widget);
   --     XmTextReplaceWcs (The_Widget, From_Pos, To_Pos, To_C (Value));
   --  end Xm_Text_Replace_Wcs;


   procedure Xm_Text_Scroll (The_Widget : in Xm_Text_Widget;
                             Lines      : in Integer)
   is
      procedure XmTextScroll (The_Widget : in Xm_Text_Widget;
                              Lines      : in int);
      pragma Import (C, XmTextScroll, "XmTextScroll");
   begin
      Check (The_Widget);
      XmTextScroll (The_Widget, int (Lines));
   end Xm_Text_Scroll;


   procedure Xm_Text_Set_Add_Mode (The_Widget : in Xm_Text_Widget;
                                   State      : in Boolean)
   is
      procedure XmTextSetAddMode (The_Widget : in Widget;
                                  State      : in Xt_Boolean);
      pragma Import (C, XmTextSetAddMode, "XmTextSetAddMode");
   begin
      Check (The_Widget);
      XmTextSetAddMode (The_Widget, To_Xt_Boolean (State));
   end Xm_Text_Set_Add_Mode;


   procedure Xm_Text_Set_Editable (The_Widget : in Xm_Text_Widget;
                                   Editable   : in Boolean)
   is
      procedure XmTextSetEditable (The_Widget : in Widget;
                                   Editable   : in Xt_Boolean);
      pragma Import (C, XmTextSetEditable, "XmTextSetEditable");
   begin
      Check (The_Widget);
      XmTextSetEditable (The_Widget, To_Xt_Boolean (Editable));
   end Xm_Text_Set_Editable;


   procedure Xm_Text_Set_Highlight (The_Widget : in Xm_Text_Widget;
                                    Left       : in Xm_Text_Position;
                                    Right      : in Xm_Text_Position;
                                    Mode       : in Xm_Highlight_Mode)
   is
      procedure XmTextSetHighlight (The_Widget : in Xm_Text_Widget;
                                    Left       : in Xm_Text_Position;
                                    Right      : in Xm_Text_Position;
                                    Mode       : in Xm_Highlight_Mode);
      pragma Import (C, XmTextSetHighlight, "XmTextSetHighlight");
   begin
      Check (The_Widget);
      XmTextSetHighlight (The_Widget, Left, Right, Mode);
   end Xm_Text_Set_Highlight;


   procedure Xm_Text_Set_Insertion_Position (The_Widget : in Xm_Text_Widget;
                                             Position   : in Xm_Text_Position)
   is
      procedure XmTextSetInsertionPosition (The_Widget : in Widget;
                                            Position   : in Xm_Text_Position);
      pragma Import (C, XmTextSetInsertionPosition,
                     "XmTextSetInsertionPosition");
   begin
      Check (The_Widget);
      XmTextSetInsertionPosition (The_Widget, Position);
   end Xm_Text_Set_Insertion_Position;


   procedure Xm_Text_Set_Max_Length (The_Widget : in Xm_Text_Widget;
                                     Max_Length : in Xm_Text_Position)
   is
      procedure XmTextSetMaxLength (The_Widget : in Widget;
                                    Max_Length : in int);
      pragma Import (C, XmTextSetMaxLength, "XmTextSetMaxLength");
   begin
      Check (The_Widget);
      XmTextSetMaxLength (The_Widget, int (Max_Length));
   end Xm_Text_Set_Max_Length;


   procedure Xm_Text_Set_Selection (The_Widget : in Xm_Text_Widget;
                                    First      : in Xm_Text_Position;
                                    Last       : in Xm_Text_Position;
                                    The_Time   : in Time)
   is
      procedure XmTextSetSelection (The_Widget : in Widget;
                                    First      : in Xm_Text_Position;
                                    Last       : in Xm_Text_Position;
                                    The_Time   : in Time);
      pragma Import (C, XmTextSetSelection, "XmTextSetSelection");
   begin
      Check (The_Widget);
      XmTextSetSelection (The_Widget, First, Last, The_Time);
   end Xm_Text_Set_Selection;


   procedure Xm_Text_Set_String (The_Widget : in Xm_Text_Widget;
                                 The_String : in String)
   is
      procedure XmTextSetString (The_Widget : in Widget;
                                 The_String : in char_array);
      pragma Import (C, XmTextSetString, "XmTextSetString");
   begin
      Check (The_Widget);
      XmTextSetString (The_Widget, To_C (The_String));
   end Xm_Text_Set_String;


   --  procedure Xm_Text_Set_String_Wcs (The_Widget : in Xm_Text_Widget;
   --                                    The_String : in Wide_String)
   --  is
   --     C_String : constant wchar_array := To_C (The_String);

   --     procedure XmTextSetStringWcs (The_Widget : in Widget;
   --                                   The_String : in wchar_array);
   --     pragma Import (C, XmTextSetStringWcs, "XmTextSetStringWcs");
   --  begin
   --     Check (The_Widget);
   --     XmTextSetStringWcs (The_Widget, C_String);
   --  end Xm_Text_Set_String_Wcs;


   procedure Xm_Text_Set_Top_Character (The_Widget    : in Xm_Text_Widget;
                                        Top_Character : in Xm_Text_Position)
   is
      procedure XmTextSetTopCharacter (The_Widget    : in Xm_Text_Widget;
                                       Top_Character : in Xm_Text_Position);
      pragma Import (C, XmTextSetTopCharacter, "XmTextSetTopCharacter");
   begin
      Check (The_Widget);
      XmTextSetTopCharacter (The_Widget, Top_Character);
   end Xm_Text_Set_Top_Character;


   procedure Xm_Text_Show_Position (The_Widget : in Xm_Text_Widget;
                                    Position   : in Xm_Text_Position)
   is
      procedure XmTextShowPosition (The_Widget : in Widget;
                                    Position   : in Xm_Text_Position);
      pragma Import (C, XmTextShowPosition, "XmTextShowPosition");
   begin
      Check (The_Widget);
      XmTextShowPosition (The_Widget, Position);
   end Xm_Text_Show_Position;


   function Xm_Text_XY_To_Pos (The_Widget : in Xm_Text_Widget;
                               X          : in Position;
                               Y          : in Position)
     return Xm_Text_Position
   is
      function XmTextXYToPos (The_Widget : in Widget;
                              X          : in Position;
                              Y          : in Position)
        return Xm_Text_Position;
      pragma Import (C, XmTextXYToPos, "XmTextXYToPos");
   begin
      Check (The_Widget);
      return XmTextXYToPos (The_Widget, X, Y);
   end Xm_Text_XY_To_Pos;


end Xm_Text;
