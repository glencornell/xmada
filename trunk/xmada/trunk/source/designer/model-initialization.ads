------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006
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
--! along with XmAda; see the file COPYING. If not, write to the Free
--! Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
--! USA.
--!
--! As a special exception, if other files instantiate generics from this
--! unit, or you link this unit with other files to produce an executable,
--! this unit does not by itself cause the resulting executable to be
--! covered by the GNU General Public License. This exception does not
--! however invalidate any other reasons why the executable file might be
--! covered by the GNU Public License.
--!
--! <Unit> Model.Initialization
--! <Purpose>
--!   Пакет содержит подпрограмму начальной инициализации внутренних структур
--! дерева модели и формирования начальных данных о компонентах Xt/Motif.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Model.Initialization is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose> Производит начальную инициализацию внутренних структур.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialize;

private

   --  Типы ресурсов - перечислений.

   Xt_Motif_Alignment_Resource_Type                  : Node_Id;
   Xt_Motif_Arrow_Direction_Resource_Type            : Node_Id;
   Xt_Motif_Arrow_Layout_Resource_Type               : Node_Id;
   Xt_Motif_Arrow_Orientation_Resource_Type          : Node_Id;
   Xt_Motif_Arrow_Sensitivity_Resource_Type          : Node_Id;
   Xt_Motif_Attachment_Resource_Type                 : Node_Id;
--   Xt_Motif_Audible_Warning_Resource_Type            : Node_Id;
   Xt_Motif_Auto_Drag_Model_Resource_Type            : Node_Id;
   Xt_Motif_Automatic_Selection_Resource_Type        : Node_Id;
   Xt_Motif_Binding_Type_Resource_Type               : Node_Id;
   Xt_Motif_Boolean_Resource_Type                    : Node_Id;
   Xt_Motif_Child_Horizontal_Alignment_Resource_Type : Node_Id;
   Xt_Motif_Child_Placement_Resource_Type            : Node_Id;
   Xt_Motif_Frame_Child_Type_Resource_Type           : Node_Id;
   Xt_Motif_Child_Vertical_Alignment_Resource_Type   : Node_Id;
   Xt_Motif_Combo_Box_Type_Resource_Type             : Node_Id;
   Xt_Motif_Command_Window_Location_Resource_Type    : Node_Id;
   Xt_Motif_Default_Button_Type_Resource_Type        : Node_Id;
--   Xt_Motif_Delete_Response_Resource_Type            : Node_Id;
   Xt_Motif_Dialog_Style_Resource_Type               : Node_Id;
   Xt_Motif_Dialog_Type_Resource_Type                : Node_Id;
   Xt_Motif_Edit_Mode_Resource_Type                  : Node_Id;
   Xt_Motif_Toggle_Indicator_On_Resource_Type        : Node_Id;
   Xt_Motif_Indicator_Type_Resource_Type             : Node_Id;
--   Xt_Motif_Input_Policy_Resource_Type               : Node_Id;
--   Xt_Motif_Keyboard_Focus_Policy_Resource_Type      : Node_Id;
   Xt_Motif_Label_Type_Resource_Type                 : Node_Id;
   Xt_Motif_Layout_Type_Resource_Type                : Node_Id;
   Xt_Motif_Container_Line_Style_Resource_Type       : Node_Id;
   Xt_Motif_Match_Behavior_Resource_Type             : Node_Id;
   Xt_Motif_Multi_Click_Resource_Type                : Node_Id;
   Xt_Motif_Navigation_Type_Resource_Type            : Node_Id;
   Xt_Motif_Notebook_Child_Type_Resource_Type        : Node_Id;
   Xt_Motif_Orientation_Resource_Type                : Node_Id;
   Xt_Motif_Outline_Button_Policy_Resource_Type      : Node_Id;
   Xt_Motif_Outline_State_Resource_Type              : Node_Id;
   Xt_Motif_Packing_Resource_Type                    : Node_Id;
   Xt_Motif_Position_Mode_Resource_Type              : Node_Id;
--   Xt_Motif_Position_Type_Resource_Type              : Node_Id;
   Xt_Motif_Primary_Ownership_Resource_Type          : Node_Id;
   Xt_Motif_Processing_Direction_Resource_Type       : Node_Id;
--   Xt_Motif_Resize_Policy_Resource_Type              : Node_Id;
--   Xt_Motif_Row_Column_Type_Resource_Type            : Node_Id;
   Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type  : Node_Id;
--   Xt_Motif_Scroll_Bar_Placement_Resource_Type       : Node_Id;
--   Xt_Motif_Scrolled_Window_Child_Type_Resource_Type : Node_Id;
--   Xt_Motif_Scrolling_Policy_Resource_Type           : Node_Id;
--   Xt_Motif_Selection_Policy_Resource_Type           : Node_Id;
--   Xt_Motif_Selection_Technique_Resource_Type        : Node_Id;
   Xt_Motif_Separator_Type_Resource_Type             : Node_Id;
   Xt_Motif_Shadow_Type_Resource_Type                : Node_Id;
   Xt_Motif_Show_Arrows_Resource_Type                : Node_Id;

   --  Классы виджетов Xt/Motif.

   Xt_Motif_Arrow_Button_Gadget_Widget_Class   : Node_Id;
   Xt_Motif_Arrow_Button_Widget_Class          : Node_Id;
   Xt_Motif_Bulletin_Board_Widget_Class        : Node_Id;
--   Xt_Motif_Bulletin_Board_Dialog_Widget_Class : Node_Id;
   Xt_Motif_Cascade_Button_Gadget_Widget_Class : Node_Id;
   Xt_Motif_Cascade_Button_Widget_Class        : Node_Id;
   Xt_Motif_Combo_Box_Widget_Class             : Node_Id;
   Xt_Motif_Command_Widget_Class               : Node_Id;
   Xt_Motif_Container_Widget_Class             : Node_Id;
--      Xt_Motif_Dialog_Shell_Widget_Class          : Node_Id;
   Xt_Motif_Drawing_Area_Widget_Class          : Node_Id;
   Xt_Motif_Drawn_Button_Widget_Class          : Node_Id;
--   Xt_Motif_Error_Dialog_Widget_Class          : Node_Id;
   Xt_Motif_File_Selection_Box_Widget_Class    : Node_Id;
--   Xt_Motif_File_Selection_Dialog_Widget_Class : Node_Id;
--  in Xt      Xt_Motif_Form_Widget_Class                  : Node_Id;
--   Xt_Motif_Form_Dialog_Widget_Class           : Node_Id;
   Xt_Motif_Form_Widget_Class                  : Node_Id;
   Xt_Motif_Frame_Widget_Class                 : Node_Id;
   Xt_Motif_Icon_Gadget_Widget_Class           : Node_Id;
--   Xt_Motif_Information_Dialog_Widget_Class    : Node_Id;
   Xt_Motif_Label_Gadget_Widget_Class          : Node_Id;
   Xt_Motif_Label_Widget_Class                 : Node_Id;
   Xt_Motif_List_Widget_Class                  : Node_Id;
   Xt_Motif_Main_Window_Widget_Class           : Node_Id;
   Xt_Motif_Message_Box_Widget_Class           : Node_Id;
--   Xt_Motif_Message_Dialog_Widget_Class        : Node_Id;
   Xt_Motif_Notebook_Widget_Class              : Node_Id;
   Xt_Motif_Paned_Window_Widget_Class          : Node_Id;
   Xt_Motif_Push_Button_Gadget_Widget_Class    : Node_Id;
   Xt_Motif_Push_Button_Widget_Class           : Node_Id;
--   Xt_Motif_Question_Dialog_Widget_Class       : Node_Id;
   Xt_Motif_Row_Column_Widget_Class            : Node_Id;
   Xt_Motif_Scale_Widget_Class                 : Node_Id;
   Xt_Motif_Scroll_Bar_Widget_Class            : Node_Id;
--   Xt_Motif_Scrolled_List_Widget_Class         : Node_Id;
--   Xt_Motif_Scrolled_Text_Widget_Class         : Node_Id;
   Xt_Motif_Scrolled_Window_Widget_Class       : Node_Id;
   Xt_Motif_Selection_Box_Widget_Class         : Node_Id;
--   Xt_Motif_Selection_Dialog_Widget_Class      : Node_Id;
   Xt_Motif_Separator_Gadget_Widget_Class      : Node_Id;
   Xt_Motif_Separator_Widget_Class             : Node_Id;
   Xt_Motif_Simple_Spin_Box_Widget_Class       : Node_Id;
   Xt_Motif_Spin_Box_Widget_Class              : Node_Id;
--   Xt_Motif_Template_Dialog_Widget_Class       : Node_Id;
   Xt_Motif_Text_Field_Widget_Class            : Node_Id;
   Xt_Motif_Text_Widget_Class                  : Node_Id;
   Xt_Motif_Toggle_Button_Gadget_Widget_Class  : Node_Id;
   Xt_Motif_Toggle_Button_Widget_Class         : Node_Id;

end Model.Initialization;
