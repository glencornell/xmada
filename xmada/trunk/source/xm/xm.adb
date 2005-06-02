with Ada.Unchecked_Conversion;
with Interfaces.C;       use Interfaces.C;

with Xt;                 use Xt;
with Xt.Ancillary_Types; use Xt.Ancillary_Types;

with Xm.Implementation;  use Xm.Implementation;


package body Xm is


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
