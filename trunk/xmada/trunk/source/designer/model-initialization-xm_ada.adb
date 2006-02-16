------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006  TechnoServ A/S
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
--! XmAda maintained by TechnoServ A/S (email: vgodunko@rostel.ru)
--!
--! <Unit> Model.Initialization.Xm_Ada
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model.Tree.Xm_Ada;
with Model.Names;
with Model.Xt_Motif;

package body Model.Initialization.Xm_Ada is

   use Model.Tree.Xm_Ada;
   use Model.Xt_Motif;
   use Model.Names;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize is
   begin
      --  Установка имён подпрограмм создания экземпляров виджетов.

      Set_Convenience_Create_Function_Name
       (Xt_Motif_Arrow_Button_Gadget_Widget_Class,
        Enter ("Xm_Arrow_Button_Gadget.Xm_Create_Arrow_Button_Gadget"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Arrow_Button_Widget_Class,
        Enter ("Xm_Arrow_Button.Xm_Create_Arrow_Button"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Bulletin_Board_Widget_Class,
        Enter ("Xm_Bulletin_Board.Xm_Create_Bulletin_Board"));
----   Xt_Motif_Bulletin_Board_Dialog_Widget_Class : Node_Id;
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Cascade_Button_Gadget_Widget_Class,
        Enter ("Xm_Cascade_Button_Gadget.Xm_Create_Cascade_Button_Gadget"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Cascade_Button_Widget_Class,
        Enter ("Xm_Cascade_Button.Xm_Create_Cascade_Button"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Combo_Box_Widget_Class,
        Enter ("Xm_Combo_Box.Xm_Create_Combo_Box"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Command_Widget_Class,
        Enter ("Xm_Command.Xm_Create_Command"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Container_Widget_Class,
        Enter ("Xm_Container.Xm_Create_Container"));
--      Set_Convenience_Create_Function_Name
--       (Xt_Motif_Dialog_Shell_Widget_Class,
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Drawing_Area_Widget_Class,
        Enter ("Xm_Drawing_Area.Xm_Create_Drawing_Area"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Drawn_Button_Widget_Class,
        Enter ("Xm_Drawn_Button.Xm_Create_Drawn_Button"));
--   Xt_Motif_Error_Dialog_Widget_Class
      Set_Convenience_Create_Function_Name
       (Xt_Motif_File_Selection_Box_Widget_Class,
        Enter ("Xm_File_Selection_Box.Xm_Create_File_Selection_Box"));
--   Xt_Motif_File_Selection_Dialog_Widget_Class
--  in Xt      Xt_Motif_Form_Widget_Class
--   Xt_Motif_Form_Dialog_Widget_Class
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Form_Widget_Class,
        Enter ("Xm_Form.Xm_Create_Form"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Frame_Widget_Class,
        Enter ("Xm_Frame.Xm_Create_Frame"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Icon_Gadget_Widget_Class,
        Enter ("Xm_Icon_Gadget.Xm_Create_Icon_Gadget"));
--   Xt_Motif_Information_Dialog_Widget_Class
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Label_Gadget_Widget_Class,
        Enter ("Xm_Label_Gadget.Xm_Create_Label_Gadget"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Label_Widget_Class,
        Enter ("Xm_Label.Xm_Create_Label"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_List_Widget_Class,
        Enter ("Xm_List.Xm_Create_List"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Main_Window_Widget_Class,
        Enter ("Xm_Main_Window.Xm_Create_Main_Window"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Message_Box_Widget_Class,
        Enter ("Xm_Message_Box.Xm_Create_Message_Box"));
--   Xt_Motif_Message_Dialog_Widget_Class
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Notebook_Widget_Class,
        Enter ("Xm_Notebook.Xm_Create_Notebook"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Paned_Window_Widget_Class,
        Enter ("Xm_Paned_Window.Xm_Create_Paned_Window"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Push_Button_Gadget_Widget_Class,
        Enter ("Xm_Push_Button_Gadget.Xm_Create_Push_Button_Gadget"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Push_Button_Widget_Class,
        Enter ("Xm_Push_Button.Xm_Create_Push_Button"));
----   Xt_Motif_Question_Dialog_Widget_Class
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Row_Column_Widget_Class,
        Enter ("Xm_Row_Column.Xm_Create_Row_Column"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Scale_Widget_Class,
        Enter ("Xm_Scale.Xm_Create_Scale"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Scroll_Bar_Widget_Class,
        Enter ("Xm_Scroll_Bar.Xm_Create_Scroll_Bar"));
--   Xt_Motif_Scrolled_List_Widget_Class
--   Xt_Motif_Scrolled_Text_Widget_Class
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Scrolled_Window_Widget_Class,
        Enter ("Xm_Scrolled_Window.Xm_Create_Scrolled_Window"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Selection_Box_Widget_Class,
        Enter ("Xm_Selection_Box.Xm_Create_Selection_Box"));
--   Xt_Motif_Selection_Dialog_Widget_Class
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Separator_Gadget_Widget_Class,
        Enter ("Xm_Separator_Gadget.Xm_Create_Separator_Gadget"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Separator_Widget_Class,
        Enter ("Xm_Separator.Xm_Create_Separator"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Simple_Spin_Box_Widget_Class,
        Enter ("Xm_Simple_Spin_Box.Xm_Create_Simple_Spin_Box"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Spin_Box_Widget_Class,
        Enter ("Xm_Spin_Box.Xm_Create_Spin_Box"));
--   Xt_Motif_Template_Dialog_Widget_Class
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Text_Field_Widget_Class,
        Enter ("Xm_Text_Field.Xm_Create_Text_Field"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Text_Widget_Class,
        Enter ("Xm_Text.Xm_Create_Text"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Toggle_Button_Gadget_Widget_Class,
        Enter ("Xm_Toggle_Button_Gadget.Xm_Create_Toggle_Button_Gadget"));
      Set_Convenience_Create_Function_Name
       (Xt_Motif_Toggle_Button_Widget_Class,
        Enter ("Xm_Toggle_Button.Xm_Create_Toggle_Button"));

      --  Инициализация типов ресурсов

      Set_Type_Identifier
       (Xt_Motif_Alignment_Resource_Type,
        Enter ("Xm.Xm_Alignment"));
      Set_Type_Identifier
       (Xt_Motif_Arrow_Direction_Resource_Type,
        Enter ("Xm.Xm_Arrow_Direction"));
      Set_Type_Identifier
       (Xt_Motif_Arrow_Layout_Resource_Type,
        Enter ("Xm.Xm_Arrow_Layout"));
      Set_Type_Identifier
       (Xt_Motif_Arrow_Orientation_Resource_Type,
        Enter ("Xm.Xm_Arrow_Orientation"));
      Set_Type_Identifier
       (Xt_Motif_Arrow_Sensitivity_Resource_Type,
        Enter ("Xm.Xm_Arrow_Sensitivity "));
      Set_Type_Identifier
       (Xt_Motif_Attachment_Resource_Type,
        Enter ("Xm.Xm_Attachment"));
  --     Set_Type_Identifier
  --     (Xt_Motif_Audible_Warning_Resource_Type ,
  --      Enter ("Xm_Audible_Warning"));
      Set_Type_Identifier
       (Xt_Motif_Auto_Drag_Model_Resource_Type,
        Enter ("Xm.Xm_Auto_Drag_Model"));
      Set_Type_Identifier
       (Xt_Motif_Automatic_Selection_Resource_Type,
        Enter ("Xm.Xm_Automatic_Selection"));
      Set_Type_Identifier
       (Xt_Motif_Binding_Type_Resource_Type,
        Enter ("Xm.Xm_Binding_Type"));
      Set_Type_Identifier
       (Xt_Motif_Child_Horizontal_Alignment_Resource_Type,
        Enter ("Xm.Xm_Child_Horizontal_Alignment"));
      Set_Type_Identifier
       (Xt_Motif_Child_Placement_Resource_Type,
        Enter ("Xm.Xm_Child_Placement"));
      Set_Type_Identifier
       (Xt_Motif_Frame_Child_Type_Resource_Type,
        Enter ("Xm.Xm_Child_Type"));
      Set_Type_Identifier
       (Xt_Motif_Child_Vertical_Alignment_Resource_Type,
        Enter ("Xm.Xm_Child_Vertical_Alignment"));
      Set_Type_Identifier
       (Xt_Motif_Combo_Box_Type_Resource_Type,
        Enter ("Xm.Xm_Combo_Box_Type"));
      Set_Type_Identifier
       (Xt_Motif_Command_Window_Location_Resource_Type,
        Enter ("Xm.Xm_Command_Window_Location"));
      Set_Type_Identifier
       (Xt_Motif_Default_Button_Type_Resource_Type,
        Enter ("Xm.Xm_Default_Button_Type"));
 --     Set_Type_Identifier
 --      (Xt_Motif_Delete_Response_Resource_Type,
 --       Enter ("Xm.Xm_Delete_Response "));
      Set_Type_Identifier
       (Xt_Motif_Dialog_Style_Resource_Type,
        Enter ("Xm.Xm_Delete_Response"));
      Set_Type_Identifier
       (Xt_Motif_Dialog_Type_Resource_Type,
        Enter ("Xm.Xm_Dialog_Type"));
      Set_Type_Identifier
       (Xt_Motif_Edit_Mode_Resource_Type,
        Enter ("Xm.Xm_Edit_Mode"));
      Set_Type_Identifier
       (Xt_Motif_Toggle_Indicator_On_Resource_Type,
        Enter ("Xm.Xm_Indicator_On"));
      Set_Type_Identifier
       (Xt_Motif_Indicator_Type_Resource_Type,
        Enter ("Xm.Xm_Indicator_Type"));
  --    Set_Type_Identifier
  --     (Xt_Motif_Input_Policy_Resource_Type,
  --      Enter ("Xm.Xm_Input_Policy"));
  --    Set_Type_Identifier
  --     (Xt_Motif_Keyboard_Focus_Policy_Resource_Type,
  --      Enter ("Xm.Xm_Keyboard_Focus_Policy"));
      Set_Type_Identifier
       (Xt_Motif_Label_Type_Resource_Type,
        Enter ("Xm.Xm_Label_Type"));
      Set_Type_Identifier
       (Xt_Motif_Layout_Type_Resource_Type,
        Enter ("Xm.Xm_Layout_Type"));
      Set_Type_Identifier
       (Xt_Motif_Container_Line_Style_Resource_Type,
        Enter ("Xm_Line_Style"));
      Set_Type_Identifier
       (Xt_Motif_Match_Behavior_Resource_Type,
        Enter ("Xm.Xm_Match_Behavior"));
      Set_Type_Identifier
       (Xt_Motif_Multi_Click_Resource_Type,
        Enter ("Xm.Xm_Multi_Click"));
      Set_Type_Identifier
       (Xt_Motif_Navigation_Type_Resource_Type,
        Enter ("Xm.Xm_Navigation_Type"));
      Set_Type_Identifier
       (Xt_Motif_Notebook_Child_Type_Resource_Type,
        Enter ("Xm.Xm_Notebook_Child_Type"));
      Set_Type_Identifier
       (Xt_Motif_Orientation_Resource_Type,
        Enter ("Xm.Xm_Orientation"));
      Set_Type_Identifier
       (Xt_Motif_Outline_Button_Policy_Resource_Type,
        Enter ("Xm.Xm_Outline_Button_Policy"));
      Set_Type_Identifier
       (Xt_Motif_Outline_State_Resource_Type,
        Enter ("Xm.Xm_Outline_State"));
      Set_Type_Identifier
       (Xt_Motif_Packing_Resource_Type,
        Enter ("Xm.Xm_Packing"));
      Set_Type_Identifier
       (Xt_Motif_Position_Mode_Resource_Type,
        Enter ("Xm.Xm_Position_Mode"));
   --   Set_Type_Identifier
   --    (Xt_Motif_Position_Type_Resource_Type,
   --     Enter ("Xm.Xm_Position_Type"));
      Set_Type_Identifier
       (Xt_Motif_Primary_Ownership_Resource_Type,
        Enter ("Xm.Xm_Primary_Ownership"));
      Set_Type_Identifier
       (Xt_Motif_Processing_Direction_Resource_Type,
        Enter ("Xm.Xm_Processing_Direction"));
--      Set_Type_Identifier
--       (Xt_Motif_Resize_Policy_Resource_Type,
--        Enter ("Xm.Xm_Resize_Policy"));
--      Set_Type_Identifier
--       (Xt_Motif_Row_Column_Type_Resource_Type,
--        Enter ("Xm.Xm_Row_Column_Type"));
      Set_Type_Identifier
       (Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type,
        Enter ("Xm.Xm_Scroll_Bar_Display_Policy"));
--      Set_Type_Identifier
--       (Xt_Motif_Scroll_Bar_Placement_Resource_Type,
--        Enter ("Xm.Xm_Scroll_Bar_Placement"));
--      Set_Type_Identifier
--       (Xt_Motif_Scrolled_Window_Child_Type_Resource_Type,
--        Enter ("Xm.Xm_Scrolled_Window_Child_Type"));
--      Set_Type_Identifier
--       (Xt_Motif_Scrolling_Policy_Resource_Type,
--        Enter ("Xm.Xm_Scrolling_Policy"));
--      Set_Type_Identifier
--       (Xt_Motif_Selection_Policy_Resource_Type,
--        Enter ("Xm.Xm_Selection_Policy"));
--      Set_Type_Identifier
--       (Xt_Motif_Selection_Technique_Resource_Type,
--        Enter ("Xm.Xm_Selection_Technique"));
      Set_Type_Identifier
       (Xt_Motif_Separator_Type_Resource_Type,
        Enter ("Xm.Xm_Separator_Type"));
      Set_Type_Identifier
       (Xt_Motif_Shadow_Type_Resource_Type,
        Enter ("Xm.Xm_Shadow_Type"));
      Set_Type_Identifier
       (Xt_Motif_Show_Arrows_Resource_Type,
        Enter ("Xm.Xm_Show_Arrows"));
   end Initialize;

end Model.Initialization.Xm_Ada;
