------------------------------------------------------------------------------
--
--  Motif Ada Binding
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
--! <Unit> Xm
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;

with Xm.Implementation;

package body Xm is

   use Interfaces.C;
   use Xm.Implementation;
   use Xt;
   use Xt.Ancillary_Types;

   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Any_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Any_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Arrow_Button_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Arrow_Button_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Combo_Box_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Combo_Box_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Command_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Command_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Container_Outline_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion
             (Xt_Pointer,
              Xm_Container_Outline_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Container_Select_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion
             (Xt_Pointer,
              Xm_Container_Select_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Convert_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Convert_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Destination_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Destination_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Display_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Display_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Drag_Start_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Drag_Start_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Drawing_Area_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Drawing_Area_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Drawn_Button_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Drawn_Button_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_File_Selection_Box_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_File_Selection_Box_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_List_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_List_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Notebook_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Notebook_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Popup_Handler_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Popup_Handler_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Print_Shell_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Print_Shell_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Push_Button_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Push_Button_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Row_Column_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Row_Column_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Scale_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Scale_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Scroll_Bar_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Scroll_Bar_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Selection_Box_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Selection_Box_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Spin_Box_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Spin_Box_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Text_Verify_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Text_Verify_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Text_Verify_Callback_Struct_Wcs_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion
             (Xt_Pointer,
              Xm_Text_Verify_Callback_Struct_Wcs_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Toggle_Button_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion (Xt_Pointer,
                                      Xm_Toggle_Button_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Callback_Struct_Access (Source : in Xt_Pointer)
     return Xm_Traversal_Obscured_Callback_Struct_Access
   is
      function Convert is
        new Ada.Unchecked_Conversion
             (Xt_Pointer,
              Xm_Traversal_Obscured_Callback_Struct_Access);
   begin
      return Convert (Source);
   end To_Callback_Struct_Access;


   function To_Xm_List_Position_List (Pointer : in Xm_List_Position_Pointer;
                                      Length  : in Natural)
     return Xm_List_Position_List
   is
      function Convert is
        new Generic_To_Element_List (Xm_List_Position,
                                     Xm_List_Position_Pointer,
                                     Xm_List_Position_List);
   begin
      return Convert (Pointer, Length);
   end To_Xm_List_Position_List;


--   function To_Xm_Rendition_List (Pointer : in Xm_Rendition_Pointer;
--                                  Length  : in Natural)
--     return Xm_Rendition_List
--   is
--      function Convert is
--        new Generic_To_Element_List (Xm_Rendition,
--                                     Xm_Rendition_Pointer,
--                                     Xm_Rendition_List);
--   begin
--      return Convert (Pointer, Length);
--   end To_Xm_Rendition_List;


   function To_Xm_String_List (Pointer : in Xm_String_Pointer;
                               Length  : in Natural)
     return Xm_String_List
   is
      function Convert is
        new Generic_To_Element_List (Xm_String,
                                     Xm_String_Pointer,
                                     Xm_String_List);
   begin
      return Convert (Pointer, Length);
   end To_Xm_String_List;


--   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
--     return Xm_Text_Verify_Callback_Struct_Access
--   is
--      function To_CSA is
--        new Generic_To_Callback_Struct_Access_With_Reason_List
--             (Xm_Text_Verify_Callback_Struct,
--              Xm_Text_Verify_Callback_Struct_Access,
--              (Xm_CR_Losing_Focus,
--               Xm_CR_Modifying_Text_Value,
--               Xm_CR_Moving_Insert_Cursor));
--      pragma Inline (To_CSA);
--   begin
--      return To_CSA (Source);
--   end To_Callback_Struct_Access;
--
--
end Xm;
