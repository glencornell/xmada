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
--! <Unit> Xm_Text_Field
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;
with Interfaces.C.Strings;
--with Interfaces.C.Wide_Strings;

with Xt.Composite_Management;

with Xm.Implementation;

package body Xm_Text_Field is

   use Interfaces.C;
   use Interfaces.C.Strings;
   --use Interfaces.C.Wide_Strings;
   use Xlib;
   use Xm;
   use Xm.Implementation;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;

   function Xm_Create_Managed_Text_Field
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Text_Field_Widget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Text_Field (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Text_Field;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Text_Field
   --!    <ImplementationNotes> Проверка параметра Parent на нуль-значение
   --! осуществляется в Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Text_Field
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Text_Field_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateTextField (Parent    : in Widget;
                                  Name      : in char_array;
                                  Arg_List  : in Xt_Arg_List;
                                  Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateTextField, "XmCreateTextField");
   begin
      return XmCreateTextField (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Text_Field;


   procedure Xm_Text_Field_Clear_Selection
    (The_Widget : in Xm_Text_Field_Widget;
     The_Time   : in Time)
   is
      procedure XmTextFieldClearSelection (The_Widget : in Widget;
                                           The_Time   : in Time);
      pragma Import (C, XmTextFieldClearSelection,
                     "XmTextFieldClearSelection");
   begin
      Check (The_Widget);
      XmTextFieldClearSelection (The_Widget, The_Time);
   end Xm_Text_Field_Clear_Selection;


   function Xm_Text_Field_Copy (The_Widget : in Xm_Text_Field_Widget;
                                The_Time   : in Time)
     return Boolean
   is
      function XmTextFieldCopy (The_Widget : in Widget;
                                The_Time   : in Time)
        return Xt_Boolean;
      pragma Import (C, XmTextFieldCopy, "XmTextFieldCopy");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextFieldCopy (The_Widget, The_Time));
   end Xm_Text_Field_Copy;


   function Xm_Text_Field_Copy_Link (The_Widget : in Xm_Text_Field_Widget;
                                     The_Time   : in Xlib.Time)
     return Boolean
   is
      function XmTextFieldCopyLink (The_Widget : in Widget;
                                    The_Time   : in Time)
        return Xt_Boolean;
      pragma Import (C, XmTextFieldCopyLink, "XmTextFieldCopyLink");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextFieldCopyLink (The_Widget, The_Time));
   end Xm_Text_Field_Copy_Link;


   function Xm_Text_Field_Cut (The_Widget : in Xm_Text_Field_Widget;
                               The_Time   : in Xlib.Time)
     return Boolean
   is
      function XmTextFieldCut (The_Widget : in Widget;
                               The_Time   : in Time)
        return Xt_Boolean;
      pragma Import (C, XmTextFieldCut, "XmTextFieldCut");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextFieldCut (The_Widget, The_Time));
   end Xm_Text_Field_Cut;


   function Xm_Text_Field_Get_Baseline (The_Widget : in Xm_Text_Field_Widget)
     return Dimension
   is
      function XmTextFieldGetBaseline (The_Widget : in Widget) return int;
      pragma Import (C, XmTextFieldGetBaseline, "XmTextFieldGetBaseline");
   begin
      Check (The_Widget);
      return Dimension (XmTextFieldGetBaseline (The_Widget));
   end Xm_Text_Field_Get_Baseline;


   function Xm_Text_Field_Get_Editable (The_Widget : in Xm_Text_Field_Widget)
     return Boolean
   is
      function XmTextFieldGetEditable (The_Widget : in Widget)
        return Xt_Boolean;
      pragma Import (C, XmTextFieldGetEditable, "XmTextFieldGetEditable");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextFieldGetEditable (The_Widget));
   end Xm_Text_Field_Get_Editable;


   function Xm_Text_Field_Get_Insertion_Position
    (The_Widget : in Xm_Text_Field_Widget)
       return Xm_Text_Position
   is
      function XmTextFieldGetInsertionPosition (The_Widget : in Widget)
        return Xm_Text_Position;
      pragma Import (C, XmTextFieldGetInsertionPosition,
                     "XmTextFieldGetInsertionPosition");
   begin
      Check (The_Widget);
      return XmTextFieldGetInsertionPosition (The_Widget);
   end Xm_Text_Field_Get_Insertion_Position;


   function Xm_Text_Field_Get_Last_Position
    (The_Widget : in Xm_Text_Field_Widget)
       return Xm_Text_Position
   is
      function XmTextFieldGetLastPosition (The_Widget : in Widget)
        return Xm_Text_Position;
      pragma Import (C, XmTextFieldGetLastPosition,
                     "XmTextFieldGetLastPosition");
   begin
      Check (The_Widget);
      return XmTextFieldGetLastPosition (The_Widget);
   end Xm_Text_Field_Get_Last_Position;


   function Xm_Text_Field_Get_Max_Length (The_Widget : in Xm_Text_Field_Widget)
     return Xm_Text_Position
   is
      function XmTextFieldGetMaxLength (The_Widget : in Widget)
        return int;
      pragma Import (C, XmTextFieldGetMaxLength, "XmTextFieldGetMaxLength");
   begin
      Check (The_Widget);
      return Xm_Text_Position (XmTextFieldGetMaxLength (The_Widget));
   end Xm_Text_Field_Get_Max_Length;


   function Xm_Text_Field_Get_Selection (The_Widget : in Xm_Text_Field_Widget)
     return String
   is
      C_Return_Value : chars_ptr;

      function XmTextFieldGetSelection (The_Widget : in Widget)
        return chars_ptr;
      pragma Import (C, XmTextFieldGetSelection, "XmTextFieldGetSelection");

      procedure XtFree (Item : in chars_ptr);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget);

      C_Return_Value := XmTextFieldGetSelection (The_Widget);

      if C_Return_Value = Interfaces.C.Strings.Null_Ptr then
         return "";
      end if;

      declare
         Return_Value : constant String := Value (C_Return_Value);
      begin
         XtFree (C_Return_Value);
         return Return_Value;
      end;
   end Xm_Text_Field_Get_Selection;


   procedure Xm_Text_Field_Get_Selection_Position
    (The_Widget    : in     Xm_Text_Field_Widget;
     Left          :    out Xm_Text_Position;
     Right         :    out Xm_Text_Position;
     Own_Selection :    out Boolean)
   is
      L : aliased Xm_Text_Position;
      R : aliased Xm_Text_Position;

      function XmTextFieldGetSelectionPosition
       (The_Widget : in     Widget;
        Left       : access Xm_Text_Position;
        Right      : access Xm_Text_Position)
          return Xt_Boolean;
      pragma Import (C, XmTextFieldGetSelectionPosition,
                     "XmTextFieldGetSelectionPosition");
   begin
      Own_Selection :=
        To_Boolean (XmTextFieldGetSelectionPosition (The_Widget,
                                                     L'Access,
                                                     R'Access));
      if Own_Selection then
         Left  := L;
         Right := R;
      else
         Left  := 0;
         Right := 0;
      end if;
   end Xm_Text_Field_Get_Selection_Position;


   --  function Xm_Text_Field_Get_Selection_Wcs
   --   (The_Widget : in Xm_Text_Field_Widget)
   --      return Wide_String
   --  is
   --     C_Return_Value : wchars_ptr;

   --     function XmTextFieldGetSelectionWcs (The_Widget : in Widget)
   --       return wchars_ptr;
   --     pragma Import (C, XmTextFieldGetSelectionWcs,
   --                    "XmTextFieldGetSelectionWcs");

   --     procedure XtFree (Item : in wchars_ptr);
   --     pragma Import (C, XtFree, "XtFree");
   --  begin
   --     Check (The_Widget);

   --     C_Return_Value := XmTextFieldGetSelectionWcs (The_Widget);

   --     if C_Return_Value = Interfaces.C.Wide_Strings.Null_Ptr then
   --        return "";
   --     end if;

   --     declare
   --        Return_Value : constant Wide_String := Value (C_Return_Value);
   --     begin
   --        XtFree (C_Return_Value);
   --        return Return_Value;
   --     end;
   --  end Xm_Text_Field_Get_Selection_Wcs;


   function Xm_Text_Field_Get_String (The_Widget : in Xm_Text_Field_Widget)
     return String
   is
      C_Return_Value : chars_ptr;

      function XmTextFieldGetString (The_Widget : in Widget)
        return chars_ptr;
      pragma Import (C, XmTextFieldGetString, "XmTextFieldGetString");

      procedure XtFree (Pointer : in chars_ptr);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget);
      C_Return_Value := XmTextFieldGetString (The_Widget);
      declare
         Return_Value : constant String := Value (C_Return_Value);
      begin
         XtFree (C_Return_Value);
         return Return_Value;
      end;
   end Xm_Text_Field_Get_String;


   --  function Xm_Text_Field_Get_String_Wcs (The_Widget : in Xm_Text_Field_Widget)
   --    return Wide_String
   --  is
   --     C_Return_Value : wchars_ptr;

   --     function XmTextFieldGetStringWcs (The_Widget : in Widget)
   --       return wchars_ptr;
   --     pragma Import (C, XmTextFieldGetStringWcs, "XmTextFieldGetStringWcs");

   --     procedure XtFree (Pointer : in wchars_ptr);
   --     pragma Import (C, XtFree, "XtFree");
   --  begin
   --     Check (The_Widget);
   --     C_Return_Value := XmTextFieldGetStringWcs (The_Widget);
   --     declare
   --        Return_Value : constant Wide_String := Value (C_Return_Value);
   --     begin
   --        XtFree (C_Return_Value);
   --        return Return_Value;
   --     end;
   --  end Xm_Text_Field_Get_String_Wcs;


   procedure Xm_Text_Field_Get_Substring
    (The_Widget : in     Xm_Text_Field_Widget;
     Start      : in     Xm_Text_Position;
     Num_Chars  : in     Natural;
     Buffer     :    out String;
     Last       :    out Natural;
     Status     :    out Xm_Text_Substring_Status)
   is
      pragma Warnings (Off);
      C_Buffer : char_array (0 .. Buffer'Length);
      pragma Warnings (On);

      function XmTextFieldGetSubstring (The_Widget  : in Widget;
                                        Start       : in Xm_Text_Position;
                                        Num_Chars   : in int;
                                        Buffer_Size : in int;
                                        Buffer      : in char_array)
        return Xm_Text_Substring_Status;
      pragma Import (C, XmTextFieldGetSubstring, "XmTextFieldGetSubstring");
   begin
      Check (The_Widget);

      Status := XmTextFieldGetSubstring (The_Widget,
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
   end Xm_Text_Field_Get_Substring;


   --  procedure Xm_Text_Field_Get_Substring_Wcs
   --   (The_Widget : in     Xm_Text_Field_Widget;
   --    Start      : in     Xm.Xm_Text_Position;
   --    Num_Chars  : in     Natural;
   --    Buffer     :    out Wide_String;
   --    Last       :    out Natural;
   --    Status     :    out Xm_Text_Substring_Status)
   --  is
   --     pragma Warnings (Off);
   --     C_Buffer : wchar_array (0 .. Buffer'Length);
   --     pragma Warnings (On);

   --     function XmTextFieldGetSubstringWcs (The_Widget  : in Widget;
   --                                          Start       : in Xm_Text_Position;
   --                                          Num_Chars   : in int;
   --                                          Buffer_Size : in int;
   --                                          Buffer      : in wchar_array)
   --       return Xm_Text_Substring_Status;
   --     pragma Import (C, XmTextFieldGetSubstringWcs,
   --                    "XmTextFieldGetSubstringWcs");
   --  begin
   --     Check (The_Widget);

   --     Status := XmTextFieldGetSubstringWcs (The_Widget,
   --                                           Start,
   --                                           int (Num_Chars),
   --                                           C_Buffer'Length,
   --                                           C_Buffer);
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
   --  end Xm_Text_Field_Get_Substring_Wcs;


   procedure Xm_Text_Field_Insert (The_Widget : in Xm_Text_Field_Widget;
                                   Position   : in Xm_Text_Position;
                                   Value      : in String)
   is
      procedure XmTextFieldInsert (The_Widget : in Widget;
                                   Position   : in Xm_Text_Position;
                                   Value      : in char_array);
      pragma Import (C, XmTextFieldInsert, "XmTextFieldInsert");
   begin
      Check (The_Widget);
      XmTextFieldInsert (The_Widget, Position, To_C (Value));
   end Xm_Text_Field_Insert;


   --  procedure Xm_Text_Field_Insert_Wcs (The_Widget : in Xm_Text_Field_Widget;
   --                                      Position   : in Xm_Text_Position;
   --                                      Value      : in Wide_String)
   --  is
   --     procedure XmTextFieldInsertWcs (The_Widget : in Widget;
   --                                     Position   : in Xm_Text_Position;
   --                                     Value      : in wchar_array);
   --     pragma Import (C, XmTextFieldInsertWcs, "XmTextFieldInsertWcs");
   --  begin
   --     Check (The_Widget);
   --     XmTextFieldInsertWcs (The_Widget, Position, To_C (Value));
   --  end Xm_Text_Field_Insert_Wcs;


   function Xm_Text_Field_Paste (The_Widget : in Xm_Text_Field_Widget)
     return Boolean
   is
      function XmTextFieldPaste (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XmTextFieldPaste, "XmTextFieldPaste");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextFieldPaste (The_Widget));
   end Xm_Text_Field_Paste;


   function Xm_Text_Field_Paste_Link (The_Widget : in Xm_Text_Field_Widget)
     return Boolean
   is
      function XmTextFieldPasteLink (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XmTextFieldPasteLink, "XmTextFieldPasteLink");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextFieldPasteLink (The_Widget));
   end Xm_Text_Field_Paste_Link;


   procedure Xm_Text_Field_Pos_To_XY (The_Widget : in     Xm_Text_Field_Widget;
                                      Position   : in     Xm_Text_Position;
                                      X          :    out Xt.Position;
                                      Y          :    out Xt.Position;
                                      Visible    :    out Boolean)
   is
      A_X : aliased Xt.Position;
      A_Y : aliased Xt.Position;

      function XmTextFieldPosToXY (The_Widget : in     Widget;
                                   Position   : in     Xm_Text_Position;
                                   X          : access Xt.Position;
                                   Y          : access Xt.Position)
        return Xt_Boolean;
      pragma Import (C, XmTextFieldPosToXY, "XmTextFieldPosToXY");
   begin
      Check (The_Widget);

      Visible := To_Boolean (XmTextFieldPosToXY (The_Widget,
                                                 Position,
                                                 A_X'Access,
                                                 A_Y'Access));
      if Visible then
         X := A_X;
         Y := A_Y;
      end if;
   end Xm_Text_Field_Pos_To_XY;


   function Xm_Text_Field_Remove (The_Widget : in Xm_Text_Field_Widget)
     return Boolean
   is
      function XmTextFieldRemove (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XmTextFieldRemove, "XmTextFieldRemove");
   begin
      Check (The_Widget);
      return To_Boolean (XmTextFieldRemove (The_Widget));
   end Xm_Text_Field_Remove;


   procedure Xm_Text_Field_Replace (The_Widget : in Xm_Text_Field_Widget;
                                    From_Pos   : in Xm.Xm_Text_Position;
                                    To_Pos     : in Xm.Xm_Text_Position;
                                    Value      : in String)
   is
      procedure XmTextFieldReplace (The_Widget : in Widget;
                                    From_Pos   : in Xm_Text_Position;
                                    To_Pos     : in Xm_Text_Position;
                                    Value      : in char_array);
      pragma Import (C, XmTextFieldReplace, "XmTextFieldReplace");
   begin
      Check (The_Widget);
      XmTextFieldReplace (The_Widget, From_Pos, To_Pos, To_C (Value));
   end Xm_Text_Field_Replace;


   --  procedure Xm_Text_Field_Replace_Wcs (The_Widget : in Xm_Text_Field_Widget;
   --                                       From_Pos   : in Xm.Xm_Text_Position;
   --                                       To_Pos     : in Xm.Xm_Text_Position;
   --                                       Value      : in Wide_String)
   --  is
   --     procedure XmTextFieldReplaceWcs (The_Widget : in Widget;
   --                                      From_Pos   : in Xm_Text_Position;
   --                                      To_Pos     : in Xm_Text_Position;
   --                                      Value      : in wchar_array);
   --     pragma Import (C, XmTextFieldReplaceWcs, "XmTextFieldReplaceWcs");
   --  begin
   --     Check (The_Widget);
   --     XmTextFieldReplaceWcs (The_Widget, From_Pos, To_Pos, To_C (Value));
   --  end Xm_Text_Field_Replace_Wcs;


   procedure Xm_Text_Field_Set_Add_Mode (The_Widget : in Xm_Text_Field_Widget;
                                         State      : in Boolean)
   is
      procedure XmTextFieldSetAddMode (The_Widget : in Widget;
                                       State      : in Xt_Boolean);
      pragma Import (C, XmTextFieldSetAddMode, "XmTextFieldSetAddMode");
   begin
      Check (The_Widget);
      XmTextFieldSetAddMode (The_Widget, To_Xt_Boolean (State));
   end Xm_Text_Field_Set_Add_Mode;


   procedure Xm_Text_Field_Set_Editable (The_Widget : in Xm_Text_Field_Widget;
                                         Editable   : in Boolean)
   is
      procedure XmTextFieldSetEditable (The_Widget : in Widget;
                                        Editable   : in Xt_Boolean);
      pragma Import (C, XmTextFieldSetEditable, "XmTextFieldSetEditable");
   begin
      Check (The_Widget);
      XmTextFieldSetEditable (The_Widget, To_Xt_Boolean (Editable));
   end Xm_Text_Field_Set_Editable;


   procedure Xm_Text_Field_Set_Highlight (The_Widget : in Xm_Text_Field_Widget;
                                          Left       : in Xm_Text_Position;
                                          Right      : in Xm_Text_Position;
                                          Mode       : in Xm_Highlight_Mode)
   is
      procedure XmTextFieldSetHighlight (The_Widget : in Widget;
                                         Left       : in Xm_Text_Position;
                                         Right      : in Xm_Text_Position;
                                         Mode       : in Xm_Highlight_Mode);
      pragma Import (C, XmTextFieldSetHighlight, "XmTextFieldSetHighlight");
   begin
      Check (The_Widget);
      XmTextFieldSetHighlight (The_Widget, Left, Right, Mode);
   end Xm_Text_Field_Set_Highlight;


   procedure Xm_Text_Field_Set_Insertion_Position
    (The_Widget : in Xm_Text_Field_Widget;
     Position   : in Xm_Text_Position)
   is
      procedure XmTextFieldSetInsertionPosition
       (The_Widget : in Widget;
        Position   : in Xm_Text_Position);
      pragma Import (C, XmTextFieldSetInsertionPosition,
                     "XmTextFieldSetInsertionPosition");
   begin
      Check (The_Widget);
      XmTextFieldSetInsertionPosition (The_Widget, Position);
   end Xm_Text_Field_Set_Insertion_Position;


   procedure Xm_Text_Field_Set_Max_Length
    (The_Widget : in Xm_Text_Field_Widget;
     Max_Length : in Xm_Text_Position)
   is
      procedure XmTextFieldSetMaxLength (The_Widget : in Widget;
                                         Max_Length : in int);
      pragma Import (C, XmTextFieldSetMaxLength, "XmTextFieldSetMaxLength");
   begin
      Check (The_Widget);
      XmTextFieldSetMaxLength (The_Widget, int (Max_Length));
   end Xm_Text_Field_Set_Max_Length;


   procedure Xm_Text_Field_Set_Selection (The_Widget : in Xm_Text_Field_Widget;
                                          First      : in Xm_Text_Position;
                                          Last       : in Xm_Text_Position;
                                          The_Time   : in Time)
   is
      procedure XmTextFieldSetSelection (The_Widget : in Widget;
                                         First      : in Xm_Text_Position;
                                         Last       : in Xm_Text_Position;
                                         The_Time   : in Time);
      pragma Import (C, XmTextFieldSetSelection, "XmTextFieldSetSelection");
   begin
      Check (The_Widget);
      XmTextFieldSetSelection (The_Widget, First, Last, The_Time);
   end Xm_Text_Field_Set_Selection;


   procedure Xm_Text_Field_Set_String
    (The_Widget : in Xm_Text_Field_Widget;
     The_String : in String)
   is
      procedure XmTextFieldSetString (The_Widget : in Widget;
                                      The_String : in char_array);
      pragma Import (C, XmTextFieldSetString, "XmTextFieldSetString");
   begin
      Check (The_Widget);
      XmTextFieldSetString (The_Widget, To_C (The_String));
   end Xm_Text_Field_Set_String;


   --  procedure Xm_Text_Field_Set_String_Wcs
   --   (The_Widget : in Xm_Text_Field_Widget;
   --    The_String : in Wide_String)
   --  is
   --     procedure XmTextFieldSetStringWcs (The_Widget : in Widget;
   --                                        The_String : in wchar_array);
   --     pragma Import (C, XmTextFieldSetStringWcs, "XmTextFieldSetStringWcs");
   --  begin
   --     Check (The_Widget);
   --     XmTextFieldSetStringWcs (The_Widget, To_C (The_String));
   --  end Xm_Text_Field_Set_String_Wcs;


   procedure Xm_Text_Field_Show_Position (The_Widget : in Xm_Text_Field_Widget;
                                          Position   : in Xm_Text_Position)
   is
      procedure XmTextFieldShowPosition (The_Widget : in Widget;
                                         Position   : in Xm_Text_Position);
      pragma Import (C, XmTextFieldShowPosition, "XmTextFieldShowPosition");
   begin
      Check (The_Widget);
      XmTextFieldShowPosition (The_Widget, Position);
   end Xm_Text_Field_Show_Position;


   function Xm_Text_Field_XY_To_Pos (The_Widget : in Xm_Text_Field_Widget;
                                     X          : in Position;
                                     Y          : in Position)
     return Xm_Text_Position
   is
      function XmTextFieldXYToPos (The_Widget : in Widget;
                                   X          : in Position;
                                   Y          : in Position)
        return Xm_Text_Position;
      pragma Import (C, XmTextFieldXYToPos, "XmTextFieldXYToPos");
   begin
      Check (The_Widget);
      return XmTextFieldXYToPos (The_Widget, X, Y);
   end Xm_Text_Field_XY_To_Pos;


end Xm_Text_Field;
