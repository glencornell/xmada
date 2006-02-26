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
with Model.Names;
with Model.Tree;
with Model.Tree.Lists;
with Model.Tree.Xm_Ada;
with Model.Xt_Motif;

with Ada.Characters.Handling;
with Ada.Strings.Wide_Unbounded;

package body Model.Initialization.Xm_Ada is

   use Model.Tree.Lists;
   use Model.Names;
   use Model.Tree;
   use Model.Tree.Xm_Ada;
   use Model.Xt_Motif;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Enumeration_Resource_Values
   --!    <Purpose> Производит задание значений для перечислимого типа
   --! ресурсов.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Enumeration_Resource_Value (Node          : in Node_Id;
                                             Value_Image   : in Name_Id; 
                                             Value         : in Name_Id;
                                             Use_Qualified : in Boolean);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Names
   --!    <Purpose> Производит задание типов ресурсов для соответсвующих
   --! классов узла Node_Widget_Set.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Names (Node : in Node_Id);

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

      --  Инициализация имен пакетов создаваемых классов виджетов

      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Arrow_Button_Gadget_Widget_Class,
        Enter ("Xm_Arrow_Button_Gadget"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Arrow_Button_Widget_Class,
        Enter ("Xm_Arrow_Button"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Bulletin_Board_Widget_Class,
        Enter ("Xm_Bulletin_Board"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Cascade_Button_Gadget_Widget_Class,
        Enter ("Xm_Cascade_Button_Gadget"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Cascade_Button_Widget_Class,
        Enter ("Xm_Cascade_Button"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Combo_Box_Widget_Class,
        Enter ("Xm_Combo_Box"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Command_Widget_Class,
        Enter ("Xm_Command"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Container_Widget_Class,
        Enter ("Xm_Container"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Drawing_Area_Widget_Class,
        Enter ("Xm_Drawing_Area"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Drawn_Button_Widget_Class,
        Enter ("Xm_Drawn_Button"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_File_Selection_Box_Widget_Class,
        Enter ("Xm_File_Selection_Box"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Form_Widget_Class,
        Enter ("Xm_Form"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Frame_Widget_Class,
        Enter ("Xm_Frame"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Icon_Gadget_Widget_Class,
        Enter ("Xm_Icon_Gadget"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Label_Gadget_Widget_Class,
        Enter ("Xm_Label_Gadget"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Label_Widget_Class,
        Enter ("Xm_Label"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_List_Widget_Class,
        Enter ("Xm_List"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Main_Window_Widget_Class,
        Enter ("Xm_Main_Window"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Message_Box_Widget_Class,
        Enter ("Xm_Message_Box"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Notebook_Widget_Class,
        Enter ("Xm_Notebook"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Paned_Window_Widget_Class,
        Enter ("Xm_Paned_Window"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Push_Button_Gadget_Widget_Class,
        Enter ("Xm_Push_Button_Gadget"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Push_Button_Widget_Class,
        Enter ("Xm_Push_Button"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Row_Column_Widget_Class,
        Enter ("Xm_Row_Column"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Scale_Widget_Class,
        Enter ("Xm_Scale"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Scroll_Bar_Widget_Class,
        Enter ("Xm_Scroll_Bar"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Scrolled_Window_Widget_Class,
        Enter ("Xm_Scrolled_Window"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Selection_Box_Widget_Class,
        Enter ("Xm_Selection_Box"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Separator_Gadget_Widget_Class,
        Enter ("Xm_Separator_Gadget"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Separator_Widget_Class,
        Enter ("Xm_Separator"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Simple_Spin_Box_Widget_Class,
        Enter ("Xm_Simple_Spin_Box"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Spin_Box_Widget_Class,
        Enter ("Xm_Spin_Box"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Text_Field_Widget_Class,
        Enter ("Xm_Text_Field"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Text_Widget_Class,
        Enter ("Xm_Text"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Toggle_Button_Gadget_Widget_Class,
        Enter ("Xm_Toggle_Button_Gadget"));
      Set_Convenience_Create_Function_Package_Name
       (Xt_Motif_Toggle_Button_Widget_Class,
        Enter ("Xm_Toggle_Button"));

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
        Enter ("Xm.Xm_Dialog_Style"));
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

      --  Инициализация значений типов ресурсов

      Set_Enumeration_Resource_Value
       (Xt_Motif_Alignment_Resource_Type,
        Enter ("ALIGNMENT_BEGINNING"),
        Enter ("Xm.Xm_Alignment_Beginning"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Alignment_Resource_Type,
        Enter ("ALIGNMENT_CENTER"),
        Enter ("Xm.Xm_Alignment_Center"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Alignment_Resource_Type,
        Enter ("ALIGNMENT_END"),
        Enter ("Xm.Xm_Alignment_End"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Direction_Resource_Type,
        Enter ("ARROW_UP"),
        Enter ("Xm.Xm_Arrow_Up"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Direction_Resource_Type,
        Enter ("ARROW_DOWN"),
        Enter ("Xm.Xm_Arrow_Down"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Direction_Resource_Type,
        Enter ("ARROW_LEFT"),
        Enter ("Xm.Xm_Arrow_Left"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Direction_Resource_Type,
        Enter ("ARROW_RIGHT"),
        Enter ("Xm.Xm_Arrow_Right"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Layout_Resource_Type,
        Enter ("ARROWS_END"),
        Enter ("Xm.Xm_Arrows_End"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Layout_Resource_Type,
        Enter ("ARROWS_BEGINNING"),
        Enter ("Xm.Xm_Arrows_Beginning"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Layout_Resource_Type,
        Enter ("ARROWS_SPLIT"),
        Enter ("Xm.Xm_Arrows_Split"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Layout_Resource_Type,
        Enter ("ARROWS_FLAT_END"),
        Enter ("Xm.Xm_Arrows_Flat_End"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Layout_Resource_Type,
        Enter ("ARROWS_FLAT_BEGINNING"),
        Enter ("Xm.Xm_Arrows_Flat_Beginning"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Orientation_Resource_Type,
        Enter ("ARROWS_VERTICAL"),
        Enter ("Xm.Xm_Arrows_Vertical"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Orientation_Resource_Type,
        Enter ("ARROWS_HORIZONTAL"),
        Enter ("Xm.Xm_Arrows_Horizontal"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Sensitivity_Resource_Type,
        Enter ("ARROWS_INSENSITIVE"),
        Enter ("Xm.Xm_Arrows_Insensitive"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Sensitivity_Resource_Type,
        Enter ("ARROWS_INCREMENT_SENSITIVE"),
        Enter ("Xm.Xm_Arrows_Increment_Sensitive"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Sensitivity_Resource_Type,
        Enter ("ARROWS_DECREMENT_SENSITIVE"),
        Enter ("Xm.Xm_Arrows_Decrement_Sensitive"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Sensitivity_Resource_Type,
        Enter ("ARROWS_SENSITIVE"),
        Enter ("Xm.Xm_Arrows_Sensitive"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Arrow_Sensitivity_Resource_Type,
        Enter ("ARROWS_DEFAULT_SENSITIVITY"),
        Enter ("Xm.Xm_Arrows_Default_Sensitivity"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Attachment_Resource_Type,
        Enter ("ATTACH_NONE"),
        Enter ("Xm.Xm_Attach_None"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Attachment_Resource_Type,
        Enter ("ATTACH_FORM"),
        Enter ("Xm.Xm_Attach_Form"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Attachment_Resource_Type,
        Enter ("ATTACH_OPPOSITE_FORM"),
        Enter ("Xm.Xm_Attach_Opposite_Form"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Attachment_Resource_Type,
        Enter ("ATTACH_WIDGET"),
        Enter ("Xm.Xm_Attach_Widget"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Attachment_Resource_Type,
        Enter ("ATTACH_OPPOSITE_WIDGET"),
        Enter ("Xm.Xm_Attach_Opposite_Widget"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Attachment_Resource_Type,
        Enter ("ATTACH_POSITION"),
        Enter ("Xm.Xm_Attach_Position"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Attachment_Resource_Type,
        Enter ("ATTACH_SELF"),
        Enter ("Xm.Xm_Attach_Self"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Auto_Drag_Model_Resource_Type,
        Enter ("ATTACH_SELF"),
        Enter ("Xm.Xm_Attach_Self"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Auto_Drag_Model_Resource_Type,
        Enter ("AUTO_DRAG_ENABLED"),
        Enter ("Xm.Xm_Auto_Drag_Enabled"), 
      False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Auto_Drag_Model_Resource_Type,
        Enter ("AUTO_DRAG_DISABLED)"),
        Enter ("Xm.Xm_Auto_Drag_Disabled)"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Automatic_Selection_Resource_Type,
        Enter ("NO_AUTO_SELECT"),
        Enter ("Xm.Xm_No_Auto_Select"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Automatic_Selection_Resource_Type,
        Enter ("AUTO_SELECT"),
        Enter ("Xm.Xm_Auto_Select"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Binding_Type_Resource_Type,
        Enter ("NONE"),
        Enter ("Xm.Xm_None"), 
        True);
     Set_Enumeration_Resource_Value
       (Xt_Motif_Binding_Type_Resource_Type,
        Enter ("PIXMAP"),
        Enter ("Xm.Xm_Pixmap"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Binding_Type_Resource_Type,
        Enter ("SOLID"),
        Enter ("Xm.Xm_Solid"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Binding_Type_Resource_Type,
        Enter ("SPIRAL"),
        Enter ("Xm.Xm_Spiral"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Binding_Type_Resource_Type,
        Enter ("PIXMAP_OVERLAP_ONLY"),
        Enter ("Xm.Xm_Pixmap_Overlap_Only"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Child_Horizontal_Alignment_Resource_Type,
        Enter ("ALIGNMENT_BEGINNING"),
        Enter ("Xm.Xm_Alignment_Beginning"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Child_Horizontal_Alignment_Resource_Type,
        Enter ("ALIGNMENT_CENTER"),
        Enter ("Xm.Xm_Alignment_Center"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Child_Horizontal_Alignment_Resource_Type,
        Enter ("ALIGNMENT_END"),
        Enter ("Xm.Xm_Alignment_End"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Child_Placement_Resource_Type,
        Enter ("PLACE_TOP"),
        Enter ("Xm.Xm_Place_Top"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Child_Placement_Resource_Type,
        Enter ("PLACE_ABOVE_SELECTION"),
        Enter ("Xm.Xm_Place_Above_Selection"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Child_Placement_Resource_Type,
        Enter ("PLACE_BELOW_SELECTION"),
        Enter ("Xm.Xm_Place_Below_Selection"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Frame_Child_Type_Resource_Type,
        Enter ("FRAME_GENERIC_CHILD"),
        Enter ("Xm.Xm_Frame_Generic_Child"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Frame_Child_Type_Resource_Type,
        Enter ("FRAME_WORKAREA_CHILD"),
        Enter ("Xm.Xm_Frame_Workarea_Child"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Frame_Child_Type_Resource_Type,
        Enter ("FRAME_TITLE_CHILD"),
        Enter ("Xm.Xm_Frame_Title_Child"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Child_Vertical_Alignment_Resource_Type,
        Enter ("ALIGNMENT_BASELINE_TOP"),
        Enter ("Xm.Xm_Alignment_Baseline_Top"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Child_Vertical_Alignment_Resource_Type,
        Enter ("ALIGNMENT_CENTER"),
        Enter ("Xm.Xm_Alignment_Center"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Child_Vertical_Alignment_Resource_Type,
        Enter ("ALIGNMENT_BASELINE_BOTTOM"),
        Enter ("Xm.Xm_Alignment_Baseline_Bottom"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Child_Vertical_Alignment_Resource_Type,
        Enter ("ALIGNMENT_WIDGET_TOP"),
        Enter ("Xm.Xm_Alignment_Widget_Top"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Child_Vertical_Alignment_Resource_Type,
        Enter ("ALIGNMENT_WIDGET_BOTTOM"),
        Enter ("Xm.Xm_Alignment_Widget_Bottom"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Combo_Box_Type_Resource_Type,
        Enter ("COMBO_BOX"),
        Enter ("Xm.Xm_Combo_Box"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Combo_Box_Type_Resource_Type,
        Enter ("DROP_DOWN_COMBO_BOX"),
        Enter ("Xm.Xm_Drop_Down_Combo_Box"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Combo_Box_Type_Resource_Type,
        Enter ("DROP_DOWN_LIST"),
        Enter ("Xm.Xm_Drop_Down_List"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Command_Window_Location_Resource_Type,
        Enter ("COMMAND_ABOVE_WORKSPACE"),
        Enter ("Xm.Xm_Command_Above_Workspace"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Command_Window_Location_Resource_Type,
        Enter ("COMMAND_BELOW_WORKSPACE"),
        Enter ("Xm.Xm_Command_Below_Workspace"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Default_Button_Type_Resource_Type,
        Enter ("DIALOG_NONE"),
        Enter ("Xm.Xm_Dialog_None"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Default_Button_Type_Resource_Type,
        Enter ("DIALOG_CANCEL_BUTTON"),
        Enter ("Xm.Xm_Dialog_Cancel_Button"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Default_Button_Type_Resource_Type,
        Enter ("DIALOG_OK_BUTTON"),
        Enter ("Xm.Xm_Dialog_Ok_Button"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Default_Button_Type_Resource_Type,
        Enter ("DIALOG_HELP_BUTTON"),
        Enter ("Xm.Xm_Dialog_Help_Button"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Dialog_Style_Resource_Type,
        Enter ("DIALOG_MODELESS"),
        Enter ("Xm.Xm_Dialog_Modeless"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Dialog_Style_Resource_Type,
        Enter ("DIALOG_PRIMARY_APPLICATION_MODAL"),
        Enter ("Xm.Xm_Dialog_Primary_Application_Modal"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Dialog_Style_Resource_Type,
        Enter ("DIALOG_FULL_APPLICATION_MODAL"),
        Enter ("Xm.Xm_Dialog_Full_Application_Modal"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Dialog_Style_Resource_Type,
        Enter ("DIALOG_SYSTEM_MODAL"),
        Enter ("Xm.Xm_Dialog_System_Modal"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Dialog_Type_Resource_Type,
        Enter ("DIALOG_TEMPLATE"),
        Enter ("Xm.Xm_Dialog_Template"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Dialog_Type_Resource_Type,
        Enter ("DIALOG_ERROR"),
        Enter ("Xm.Xm_Dialog_Error"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Dialog_Type_Resource_Type,
        Enter ("DIALOG_INFORMATION"),
        Enter ("Xm.Xm_Dialog_Information"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Dialog_Type_Resource_Type,
        Enter ("DIALOG_MESSAGE"),
        Enter ("Xm.Xm_Dialog_Message"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Dialog_Type_Resource_Type,
        Enter ("DIALOG_QUESTION"),
        Enter ("Xm.Xm_Dialog_Question"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Dialog_Type_Resource_Type,
        Enter ("DIALOG_WARNING"),
        Enter ("Xm.Xm_Dialog_Warning"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Dialog_Type_Resource_Type,
        Enter ("DIALOG_WORKING"),
        Enter ("Xm.Xm_Dialog_Working"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Edit_Mode_Resource_Type,
        Enter ("MULTI_LINE_EDIT"),
        Enter ("Xm.Xm_Multi_Line_Edit"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Edit_Mode_Resource_Type,
        Enter ("SINGLE_LINE_EDIT"),
        Enter ("Xm.Xm_Single_Line_Edit"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Toggle_Indicator_On_Resource_Type,
        Enter ("INDICATOR_NONE"),
        Enter ("Xm.Xm_Indicator_None"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Toggle_Indicator_On_Resource_Type,
        Enter ("INDICATOR_FILL"),
        Enter ("Xm.Xm_Indicator_Fill"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Toggle_Indicator_On_Resource_Type,
        Enter ("INDICATOR_CHECK"),
        Enter ("Xm.Xm_Indicator_Check"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Toggle_Indicator_On_Resource_Type,
        Enter ("INDICATOR_CHECK_BOX"),
        Enter ("Xm.Xm_Indicator_Check_Box"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Toggle_Indicator_On_Resource_Type,
        Enter ("INDICATOR_CROSS"),
        Enter ("Xm.Xm_Indicator_Cross"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Toggle_Indicator_On_Resource_Type,
        Enter ("INDICATOR_CROSS_BOX"),
        Enter ("Xm.Xm_Indicator_Cross_Box"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Toggle_Indicator_On_Resource_Type,
        Enter ("INDICATOR_BOX"),
        Enter ("Xm.Xm_Indicator_Box"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Indicator_Type_Resource_Type,
        Enter ("N_OF_MANY"),
        Enter ("Xm.Xm_N_Of_Many"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Indicator_Type_Resource_Type,
        Enter ("ONE_OF_MANY"),
        Enter ("Xm.Xm_One_Of_Many"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Indicator_Type_Resource_Type,
        Enter ("ONE_OF_MANY_ROUND"),
        Enter ("Xm.Xm_One_Of_Many_Round"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Indicator_Type_Resource_Type,
        Enter ("ONE_OF_MANY_DIAMOND"),
        Enter ("Xm.Xm_One_Of_Many_Diamond"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Label_Type_Resource_Type,
        Enter ("PIXMAP"),
        Enter ("Xm.Xm_Pixmap"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Label_Type_Resource_Type,
        Enter ("LABEL_STRING"),
        Enter ("Xm.Xm_Label_String"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Layout_Type_Resource_Type,
        Enter ("OUTLINE"),
        Enter ("Xm.Xm_Outline"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Layout_Type_Resource_Type,
        Enter ("SPATIAL"),
        Enter ("Xm.Xm_Spatial"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Layout_Type_Resource_Type,
        Enter ("DETAIL"),
        Enter ("Xm.Xm_Detail"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Container_Line_Style_Resource_Type,
        Enter ("NO_LINE"),
        Enter ("Xm.Xm_No_Line"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Container_Line_Style_Resource_Type,
        Enter ("SINGLE"),
        Enter ("Xm.Xm_Single"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Match_Behavior_Resource_Type,
        Enter ("NONE"),
        Enter ("Xm.Xm_None"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Match_Behavior_Resource_Type,
        Enter ("QUICK_NAVIGATE"),
        Enter ("Xm.Xm_Quick_Navigate"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Match_Behavior_Resource_Type,
        Enter ("INVALID_MATCH_BEHAVIOR"),
        Enter ("Xm.Xm_Invalid_Match_Behavior"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Multi_Click_Resource_Type,
        Enter ("MULTICLICK_DISCARD"),
        Enter ("Xm.Xm_Multiclick_Discard"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Multi_Click_Resource_Type,
        Enter ("MULTICLICK_KEEP"),
        Enter ("Xm.Xm_Multiclick_Keep"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Navigation_Type_Resource_Type,
        Enter ("NONE"),
        Enter ("Xm.Xm_None"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Navigation_Type_Resource_Type,
        Enter ("TAB_GROUP"),
        Enter ("Xm.Xm_Tab_Group"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Navigation_Type_Resource_Type,
        Enter ("STICKY_TAB_GROUP"),
        Enter ("Xm.Xm_Sticky_Tab_Group"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Navigation_Type_Resource_Type,
        Enter ("EXCLUSIVE_TAB_GROUP"),
        Enter ("Xm.Xm_Exclusive_Tab_Group"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Notebook_Child_Type_Resource_Type,
        Enter ("NONE"),
        Enter ("Xm.Xm_None"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Notebook_Child_Type_Resource_Type,
        Enter ("PAGE"),
        Enter ("Xm.Xm_Page"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Notebook_Child_Type_Resource_Type,
        Enter ("MAJOR_TAB"),
        Enter ("Xm.Xm_Major_Tab"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Notebook_Child_Type_Resource_Type,
        Enter ("MINOR_TAB"),
        Enter ("Xm.Xm_Minor_Tab"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Notebook_Child_Type_Resource_Type,
        Enter ("STATUS_AREA"),
        Enter ("Xm.Xm_Status_Area"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Notebook_Child_Type_Resource_Type,
        Enter ("PAGE_SCROLLER"),
        Enter ("Xm.Xm_Page_Scroller"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Orientation_Resource_Type,
        Enter ("NO_ORIENTATION"),
        Enter ("Xm.Xm_No_Orientation"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Orientation_Resource_Type,
        Enter ("VERTICAL"),
        Enter ("Xm.Xm_Vertical"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Orientation_Resource_Type,
        Enter ("HORIZONTAL"),
        Enter ("Xm.Xm_Horizontal"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Outline_Button_Policy_Resource_Type,
        Enter ("OUTLINE_BUTTON_PRESENT"),
        Enter ("Xm.Xm_Outline_Button_Present"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Outline_Button_Policy_Resource_Type,
        Enter ("OUTLINE_BUTTON_ABSENT"),
        Enter ("Xm.Xm_Outline_Button_Absent"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Outline_State_Resource_Type,
        Enter ("COLLAPSED"),
        Enter ("Xm.Xm_Collapsed"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Outline_State_Resource_Type,
        Enter ("EXPANDED"),
        Enter ("Xm.Xm_Expanded"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Packing_Resource_Type,
        Enter ("NO_PACKING"),
        Enter ("Xm.Xm_No_Packing"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Packing_Resource_Type,
        Enter ("PACK_TIGHT"),
        Enter ("Xm.Xm_Pack_Tight"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Packing_Resource_Type,
        Enter ("PACK_COLUMN"),
        Enter ("Xm.Xm_Pack_Column"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Packing_Resource_Type,
        Enter ("PACK_NONE"),
        Enter ("Xm.Xm_Pack_None"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Position_Mode_Resource_Type,
        Enter ("POSITION_INDEX"),
        Enter ("Xm.Xm_Position_Index"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Position_Mode_Resource_Type,
        Enter ("POSITION_VALUE"),
        Enter ("Xm.Xm_Position_Value"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Primary_Ownership_Resource_Type,
        Enter ("OWN_NEVER"),
        Enter ("Xm.Xm_Own_Never"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Primary_Ownership_Resource_Type,
        Enter ("OWN_ALWAYS"),
        Enter ("Xm.Xm_Own_Always"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Primary_Ownership_Resource_Type,
        Enter ("OWN_MULTIPLE"),
        Enter ("Xm.Xm_Own_Multiple"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Primary_Ownership_Resource_Type,
        Enter ("OWN_POSSIBLE_MULTIPLE"),
        Enter ("Xm.Xm_Own_Possible_Multiple"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Processing_Direction_Resource_Type,
        Enter ("MAX_ON_TOP"),
        Enter ("Xm.Xm_Max_On_Top"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Processing_Direction_Resource_Type,
        Enter ("MAX_ON_BOTTOM"),
        Enter ("Xm.Xm_Max_On_Bottom"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Processing_Direction_Resource_Type,
        Enter ("MAX_ON_LEFT"),
        Enter ("Xm.Xm_Max_On_Left"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Processing_Direction_Resource_Type,
        Enter ("MAX_ON_RIGHT"),
        Enter ("Xm.Xm_Max_On_Right"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type,
        Enter ("STATIC"),
        Enter ("Xm.Xm_Static"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type,
        Enter ("AS_NEEDED"),
        Enter ("Xm.Xm_As_Needed"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Separator_Type_Resource_Type,
        Enter ("NO_LINE"),
        Enter ("Xm.Xm_No_Line"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Separator_Type_Resource_Type,
        Enter ("SINGLE_LINE"),
        Enter ("Xm.Xm_Single_Line"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Separator_Type_Resource_Type,
        Enter ("DOUBLE_LINE"),
        Enter ("Xm.Xm_Double_Line"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Separator_Type_Resource_Type,
        Enter ("SINGLE_DASHED_LINE"),
        Enter ("Xm.Xm_Single_Dashed_Line"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Separator_Type_Resource_Type,
        Enter ("DOUBLE_DASHED_LINE"),
        Enter ("Xm.Xm_Double_Dashed_Line"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Separator_Type_Resource_Type,
        Enter ("SHADOW_ETCHED_IN"),
        Enter ("Xm.Xm_Shadow_Etched_In"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Separator_Type_Resource_Type,
        Enter ("SHADOW_ETCHED_OUT"),
        Enter ("Xm.Xm_Shadow_Etched_Out"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Separator_Type_Resource_Type,
        Enter ("SHADOW_ETCHED_IN_DASH"),
        Enter ("Xm.Xm_Shadow_Etched_In_Dash"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Separator_Type_Resource_Type,
        Enter ("SHADOW_ETCHED_OUT_DASH"),
        Enter ("Xm.Xm_Shadow_Etched_Out_Dash"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Shadow_Type_Resource_Type,
        Enter ("SHADOW_ETCHED_IN"),
        Enter ("Xm.Xm_Shadow_Etched_In"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Shadow_Type_Resource_Type,
        Enter ("SHADOW_ETCHED_OUT"),
        Enter ("Xm.Xm_Shadow_Etched_Out"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Shadow_Type_Resource_Type,
        Enter ("SHADOW_IN"),
        Enter ("Xm.Xm_Shadow_In"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Shadow_Type_Resource_Type,
        Enter ("SHADOW_OUT"),
        Enter ("Xm.Xm_Shadow_Out"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Show_Arrows_Resource_Type,
        Enter ("NONE"),
        Enter ("Xm.Xm_None"), 
        True);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Show_Arrows_Resource_Type,
        Enter ("EACH_SIDE"),
        Enter ("Xm.Xm_Each_Side"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Show_Arrows_Resource_Type,
        Enter ("MAX_SIDE"),
        Enter ("Xm.Xm_Max_Side"), 
        False);
      Set_Enumeration_Resource_Value
       (Xt_Motif_Show_Arrows_Resource_Type,
        Enter ("MIN_SIDE"),
        Enter ("Xm.Xm_Min_Side"), 
        False);

      --  Инициализация пакетов, содержащих функции задания ресурсов.
      
      Set_Argument_Package_Name
       (Xt_Motif_Alignment_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Arrow_Direction_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Arrow_Layout_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Arrow_Orientation_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Arrow_Sensitivity_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Attachment_Resource_Type,
        Enter ("Xm.Resource_Management"));
  --     Set_Argument_Package_Name
  --     (Xt_Motif_Audible_Warning_Resource_Type ,
  --      Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Auto_Drag_Model_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Automatic_Selection_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Binding_Type_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Child_Horizontal_Alignment_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Child_Placement_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Frame_Child_Type_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Child_Vertical_Alignment_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Combo_Box_Type_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Command_Window_Location_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Default_Button_Type_Resource_Type,
        Enter ("Xm.Resource_Management"));
 --     Set_Argument_Package_Name
 --      (Xt_Motif_Delete_Response_Resource_Type,
 --       Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Dialog_Style_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Dialog_Type_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Edit_Mode_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Toggle_Indicator_On_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Indicator_Type_Resource_Type,
        Enter ("Xm.Resource_Management"));
  --    Set_Argument_Package_Name
  --     (Xt_Motif_Input_Policy_Resource_Type,
  --     Enter ("Xm.Resource_Management"));
  --    Set_Argument_Package_Name
  --     (Xt_Motif_Keyboard_Focus_Policy_Resource_Type,
  --      Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Label_Type_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Layout_Type_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Container_Line_Style_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Match_Behavior_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Multi_Click_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Navigation_Type_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Notebook_Child_Type_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Orientation_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Outline_Button_Policy_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Outline_State_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Packing_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Position_Mode_Resource_Type,
        Enter ("Xm.Resource_Management"));
   --   Set_Argument_Package_Name
   --    (Xt_Motif_Position_Type_Resource_Type,
   --     Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Primary_Ownership_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Processing_Direction_Resource_Type,
        Enter ("Xm.Resource_Management"));
--      Set_Argument_Package_Name
--       (Xt_Motif_Resize_Policy_Resource_Type,
--        Enter ("Xm.Resource_Management"));
--      Set_Argument_Package_Name
--       (Xt_Motif_Row_Column_Type_Resource_Type,
--        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type,
        Enter ("Xm.Resource_Management"));
--      Set_Argument_Package_Name
--       (Xt_Motif_Scroll_Bar_Placement_Resource_Type,
--        Enter ("Xm.Resource_Management"));
--     Set_Argument_Package_Name
--       (Xt_Motif_Scrolled_Window_Child_Type_Resource_Type,
--        Enter ("Xm.Resource_Management"));
--      Set_Argument_Package_Name
--       (Xt_Motif_Scrolling_Policy_Resource_Type,
--        Enter ("Xm.Resource_Management"));
--      Set_Argument_Package_Name
--       (Xt_Motif_Selection_Policy_Resource_Type,
--        Enter ("Xm.Resource_Management"));
--      Set_Argument_Package_Name
--       (Xt_Motif_Selection_Technique_Resource_Type,
--        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Separator_Type_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Shadow_Type_Resource_Type,
        Enter ("Xm.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Show_Arrows_Resource_Type,
        Enter ("Xm.Resource_Management"));

      Set_Argument_Package_Name
       (Xt_Motif_Accelerator_Table_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_C_Int_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_C_Short_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Colormap_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Dimension_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Dynamic_Pixmap_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Horizontal_Dimension_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Horizontal_Int_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Horizontal_Position_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Menu_Widget_Reference_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_No_Scaling_Dynamic_Pixmap_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Pixel_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Pixmap_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Position_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Screen_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Select_Color_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Translation_Table_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Vertical_Dimension_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Vertical_Int_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Vertical_Position_Resource_Type,
        Enter ("Xt.Resource_Management"));
      Set_Argument_Package_Name
       (Xt_Motif_Widget_Reference_Resource_Type,
        Enter ("Xt.Resource_Management"));
 --     Set_Argument_Package_Name
 --      (Xt_Motif_Xm_String_Resource_Type,
 --       Enter ("Xt.Resource_Management"));

      Set_Resource_Names (Model.Xt_Motif.Xt_Motif_Widget_Set);
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Enumeration_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Enumeration_Resource_Value (Node          : in Node_Id;
                                             Value_Image   : in Name_Id; 
                                             Value         : in Name_Id;
                                             Use_Qualified : in Boolean)
   is
      Aux : Node_Id;
   begin
      pragma Assert (Node_Kind (Node) = Node_Enumerated_Resource_Type);

      Aux := First (Value_Specifications (Node));

      while Aux /= Null_Node loop
         if Internal_Name (Aux) = Value_Image then
            Set_Literal_Identifier (Aux, Value);
            Set_Use_Qualified_Expression (Aux, Use_Qualified);
         end if;

         Aux := Next (Aux);
      end loop;

   end Set_Enumeration_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Names
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Names (Node : in Node_Id)
   is
      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Create_Resource_Name
      --!    <Purpose>
      --!    <Exceptions>
      ------------------------------------------------------------------------
      function Create_Resource_Name (Label_String : in Wide_String)
        return Wide_String;

       ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Set_Resource_Name
      --!    <Purpose>
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Set_Resource_Name (Res_List : in List_Id); 
 
      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Create_Resource_Name
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Create_Resource_Name (Label_String : in Wide_String)
        return Wide_String 
      is 
         Created_String      : constant Wide_String
           :=  Label_String (Label_String'First .. Label_String'First + 1) 
                             & "_String_Defs."
                             & Label_String 
                              (Label_String'First .. Label_String'First + 1) 
                             & "_"
                             & Label_String (Label_String'First + 2)
                             & "_"
                             & Ada.Characters.Handling.To_Wide_Character 
                              (Ada.Characters.Handling.To_Upper 
                               (Ada.Characters.Handling.To_Character
                                (Label_String (Label_String'First + 3))));

      begin
         if Label_String'Length > 4 then

            declare
               Suffix              : 
                 Ada.Strings.Wide_Unbounded.Unbounded_Wide_String 
                  := Ada.Strings.Wide_Unbounded.To_Unbounded_Wide_String 
                   (Label_String 
                    (Label_String'First + 4 .. Label_String'Last));
                Current_Char_Number : Integer := 1;

            begin
               while Current_Char_Number 
                 /= Ada.Strings.Wide_Unbounded.Length (Suffix) loop
                  if Ada.Characters.Handling.Is_Upper 
                   (Ada.Characters.Handling.To_Character 
                    (Ada.Strings.Wide_Unbounded.Element 
                     (Suffix, Current_Char_Number))) 
                  then
                     Ada.Strings.Wide_Unbounded.Insert 
                      (Suffix, Current_Char_Number, "_");
                     Current_Char_Number := Current_Char_Number + 1;
                  end if;

                  Current_Char_Number := Current_Char_Number + 1;
               end loop;

               return Created_String 
                 & Ada.Strings.Wide_Unbounded.To_Wide_String (Suffix);
            end;
         end if;

         return Created_String;
      end Create_Resource_Name;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Set_Resource_Name 
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Set_Resource_Name (Res_List : in List_Id) 
      is
         Current_Resource : Node_Id;
      begin
         if Res_List = Null_List then
            return;
         end if;

         Current_Resource := First (Res_List);

         while Current_Resource /= Null_Node loop

            declare
               Resource_Label_String : constant Wide_String
                 := Create_Resource_Name
                  (Model.Names.Image
                   (Resource_Name
                    (Current_Resource)));

               Class_Label_String : constant Wide_String
                 := Create_Resource_Name
                  (Model.Names.Image
                   (Resource_Class_Name
                    (Current_Resource)));

            begin
               Set_Resource_Name_String
                (Current_Resource,
                 Model.Names.Enter (Resource_Label_String));
               Set_Resource_Class_Name_String
                (Current_Resource,
                 Model.Names.Enter (Class_Label_String));
            end;

         Current_Resource := Next (Current_Resource);
         end loop;
      end Set_Resource_Name;

      Current_Class : Node_Id;

   begin
      pragma Assert (Node_Kind (Node) = Node_Widget_Set);

      if Widget_Classes (Node) /= Null_List then
         Current_Class := First (Widget_Classes (Node));

         while Current_Class /= Null_Node loop
            Set_Resource_Name (Resources (Current_Class));
            Set_Resource_Name (Constraint_Resources (Current_Class));
            Current_Class := Next (Current_Class);
         end loop;
      end if;

   end Set_Resource_Names;

end Model.Initialization.Xm_Ada;
