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
--! <Unit>
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt_Application_Shell;
with Xt_Composite;
with Xt_Constraint;
with Xt_Core;
with Xt_Object;
with Xt_Override_Shell;
with Xt_Rect_Obj;
with Xt_Session_Shell;
with Xt_Shell;
with Xt_Top_Level_Shell;
with Xt_Transient_Shell;
with Xt_Vendor_Shell;
with Xt_Wm_Shell;
with Xm_Arrow_Button;
with Xm_Arrow_Button_Gadget;
with Xm_Bulletin_Board;
with Xm_Cascade_Button;
with Xm_Cascade_Button_Gadget;
with Xm_Combo_Box;
with Xm_Command;
with Xm_Container;
with Xm_Dialog_Shell;
with Xm_Drawing_Area;
with Xm_Drawn_Button;
with Xm_File_Selection_Box;
with Xm_Frame;
with Xm_Form;
with Xm_Gadget;
with Xm_Icon_Gadget;
with Xm_Label;
with Xm_Label_Gadget;
with Xm_List;
with Xm_Main_Window;
with Xm_Manager;
with Xm_Message_Box;
with Xm_Notebook;
with Xm_Paned_Window;
with Xm_Primitive;
with Xm_Push_Button;
with Xm_Push_Button_Gadget;
with Xm_Row_Column;
with Xm_Scale;
with Xm_Scroll_Bar;
with Xm_Scrolled_Window;
with Xm_Selection_Box;
with Xm_Separator;
with Xm_Separator_Gadget;
with Xm_Simple_Spin_Box;
with Xm_Spin_Box;
with Xm_Text;
with Xm_Text_Field;
with Xm_Toggle_Button;
with Xm_Toggle_Button_Gadget;

with Model.Tree.Designer;
with Model.Xt_Motif;

package body Model.Initialization.Designer is

   use Model.Tree.Designer;
   use Model.Xt_Motif;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize is
   begin
      Model.Tree.Designer.Initialize;

      --  Установка размера, используемого для представления значения ресурса.

      Set_Representation_Type
       (Xt_Motif_Alignment_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Arrow_Direction_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Arrow_Layout_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Arrow_Orientation_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Arrow_Sensitivity_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Attachment_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Audible_Warning_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Auto_Drag_Model_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Automatic_Selection_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Binding_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Boolean_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Child_Horizontal_Alignment_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Child_Placement_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Frame_Child_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Child_Vertical_Alignment_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Combo_Box_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Command_Window_Location_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Default_Button_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Delete_Response_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Dialog_Style_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Dialog_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Layout_Direction_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Edit_Mode_Resource_Type,
        Representation_Type_C_Int);
      Set_Representation_Type
       (Xt_Motif_Font_Type_Resource_Type,
        Representation_Type_C_Int);
      Set_Representation_Type
       (Xt_Motif_Gravity_Resource_Type,
        Representation_Type_C_Int);
      Set_Representation_Type
       (Xt_Motif_Toggle_Indicator_On_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Indicator_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Initial_State_Resource_Type,
        Representation_Type_C_Int);
      Set_Representation_Type
       (Xt_Motif_Input_Policy_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Keyboard_Focus_Policy_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Label_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Layout_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Load_Model_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Container_Line_Style_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Line_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Match_Behavior_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Multi_Click_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Navigation_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Notebook_Child_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Orientation_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Outline_Button_Policy_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Outline_State_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Packing_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Position_Mode_Resource_Type,
        Representation_Type_C_Unsigned_Char);
--      Set_Representation_Type
--       (Xt_Motif_Position_Type_Resource_Type,
--        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Primary_Ownership_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Processing_Direction_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Resize_Policy_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Row_Column_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Scroll_Bar_Placement_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Scrolled_Window_Child_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Scrolling_Policy_Resource_Type,
        Representation_Type_C_Unsigned_Char);
--      Set_Representation_Type
--       (Xt_Motif_Selection_Policy_Resource_Type,
--        Representation_Type_C_Unsigned_Char);
--      Set_Representation_Type
--       (Xt_Motif_Selection_Technique_Resource_Type,
--        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Separator_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Shadow_Type_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Show_Arrows_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Show_Value_Resource_Type,
        Representation_Type_C_Unsigned_Char);
      Set_Representation_Type
       (Xt_Motif_Slider_Mark_Resource_Type,
        Representation_Type_C_Unsigned_Char);

      --  Установка адресов подпрограмм создания экземпляров виджетов и ссылок
      --  на внутренние структуры для каждого класса виджетов.

      Set_Widget_Class
       (Xt_Motif_Application_Shell_Widget_Class,
        Xt_Application_Shell.Application_Shell_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_Composite_Widget_Class,
        Xt_Composite.Composite_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_Constraint_Widget_Class,
        Xt_Constraint.Constraint_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_Core_Widget_Class,
        Xt_Core.Core_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_Object_Widget_Class,
        Xt_Object.Object_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_Override_Shell_Widget_Class,
        Xt_Override_Shell.Override_Shell_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_Rect_Obj_Widget_Class,
        Xt_Rect_Obj.Rect_Obj_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_Session_Shell_Widget_Class,
        Xt_Session_Shell.Session_Shell_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_Shell_Widget_Class,
        Xt_Shell.Shell_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_Top_Level_Shell_Widget_Class,
        Xt_Top_Level_Shell.Top_Level_Shell_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_Transient_Shell_Widget_Class,
        Xt_Transient_Shell.Transient_Shell_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_Vendor_Shell_Widget_Class,
        Xt_Vendor_Shell.Vendor_Shell_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_WM_Shell_Widget_Class,
        Xt_Wm_Shell.Wm_Shell_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Arrow_Button_Gadget_Widget_Class,
        Xm_Arrow_Button_Gadget.Xm_Create_Arrow_Button_Gadget'Access);
      Set_Widget_Class
       (Xt_Motif_Arrow_Button_Gadget_Widget_Class,
        Xm_Arrow_Button_Gadget.Xm_Arrow_Button_Gadget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Arrow_Button_Widget_Class,
        Xm_Arrow_Button.Xm_Create_Arrow_Button'Access);
      Set_Widget_Class
       (Xt_Motif_Arrow_Button_Widget_Class,
        Xm_Arrow_Button.Xm_Arrow_Button_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Bulletin_Board_Widget_Class,
        Xm_Bulletin_Board.Xm_Create_Bulletin_Board'Access);
      Set_Widget_Class
       (Xt_Motif_Bulletin_Board_Widget_Class,
        Xm_Bulletin_Board.Xm_Bulletin_Board_Widget_Class);

----   Xt_Motif_Bulletin_Board_Dialog_Widget_Class : Node_Id;

      Set_Convenience_Create_Function
       (Xt_Motif_Cascade_Button_Gadget_Widget_Class,
        Xm_Cascade_Button_Gadget.Xm_Create_Cascade_Button_Gadget'Access);
      Set_Widget_Class
       (Xt_Motif_Cascade_Button_Gadget_Widget_Class,
        Xm_Cascade_Button_Gadget.Xm_Cascade_Button_Gadget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Cascade_Button_Widget_Class,
        Xm_Cascade_Button.Xm_Create_Cascade_Button'Access);
      Set_Widget_Class
       (Xt_Motif_Cascade_Button_Widget_Class,
        Xm_Cascade_Button.Xm_Cascade_Button_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Combo_Box_Widget_Class,
        Xm_Combo_Box.Xm_Create_Combo_Box'Access);
      Set_Widget_Class
       (Xt_Motif_Combo_Box_Widget_Class,
        Xm_Combo_Box.Xm_Combo_Box_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Command_Widget_Class,
        Xm_Command.Xm_Create_Command'Access);
      Set_Widget_Class
       (Xt_Motif_Command_Widget_Class,
        Xm_Command.Xm_Command_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Container_Widget_Class,
        Xm_Container.Xm_Create_Container'Access);
      Set_Widget_Class
       (Xt_Motif_Container_Widget_Class,
        Xm_Container.Xm_Container_Widget_Class);

--      Set_Convenience_Create_Function
--       (Xt_Motif_Dialog_Shell_Widget_Class,
      Set_Widget_Class
       (Xt_Motif_Dialog_Shell_Widget_Class,
        Xm_Dialog_Shell.Xm_Dialog_Shell_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Drawing_Area_Widget_Class,
        Xm_Drawing_Area.Xm_Create_Drawing_Area'Access);
      Set_Widget_Class
       (Xt_Motif_Drawing_Area_Widget_Class,
        Xm_Drawing_Area.Xm_Drawing_Area_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Drawn_Button_Widget_Class,
        Xm_Drawn_Button.Xm_Create_Drawn_Button'Access);
      Set_Widget_Class
       (Xt_Motif_Drawn_Button_Widget_Class,
        Xm_Drawn_Button.Xm_Drawn_Button_Widget_Class);

--   Xt_Motif_Error_Dialog_Widget_Class

      Set_Convenience_Create_Function
       (Xt_Motif_File_Selection_Box_Widget_Class,
        Xm_File_Selection_Box.Xm_Create_File_Selection_Box'Access);
      Set_Widget_Class
       (Xt_Motif_File_Selection_Box_Widget_Class,
        Xm_File_Selection_Box.Xm_File_Selection_Box_Widget_Class);

--   Xt_Motif_File_Selection_Dialog_Widget_Class
--   Xt_Motif_Form_Dialog_Widget_Class

      Set_Convenience_Create_Function
       (Xt_Motif_Form_Widget_Class,
        Xm_Form.Xm_Create_Form'Access);
      Set_Widget_Class
       (Xt_Motif_Form_Widget_Class,
        Xm_Form.Xm_Form_Widget_Class);
      Set_Is_Set_Initial_Size (Xt_Motif_Form_Widget_Class, True);

      Set_Convenience_Create_Function
       (Xt_Motif_Frame_Widget_Class,
        Xm_Frame.Xm_Create_Frame'Access);
      Set_Widget_Class
       (Xt_Motif_Frame_Widget_Class,
        Xm_Frame.Xm_Frame_Widget_Class);
      Set_Is_Set_Initial_Size (Xt_Motif_Frame_Widget_Class, True);

      Set_Widget_Class
       (Xt_Motif_Gadget_Widget_Class,
        Xm_Gadget.Xm_Gadget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Icon_Gadget_Widget_Class,
        Xm_Icon_Gadget.Xm_Create_Icon_Gadget'Access);
      Set_Widget_Class
       (Xt_Motif_Icon_Gadget_Widget_Class,
        Xm_Icon_Gadget.Xm_Icon_Gadget_Class);

--   Xt_Motif_Information_Dialog_Widget_Class

      Set_Convenience_Create_Function
       (Xt_Motif_Label_Gadget_Widget_Class,
        Xm_Label_Gadget.Xm_Create_Label_Gadget'Access);
      Set_Widget_Class
       (Xt_Motif_Label_Gadget_Widget_Class,
        Xm_Label_Gadget.Xm_Label_Gadget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Label_Widget_Class,
        Xm_Label.Xm_Create_Label'Access);
      Set_Widget_Class
       (Xt_Motif_Label_Widget_Class,
        Xm_Label.Xm_Label_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_List_Widget_Class,
        Xm_List.Xm_Create_List'Access);
      Set_Widget_Class
       (Xt_Motif_List_Widget_Class,
        Xm_List.Xm_List_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Main_Window_Widget_Class,
        Xm_Main_Window.Xm_Create_Main_Window'Access);
      Set_Widget_Class
       (Xt_Motif_Main_Window_Widget_Class,
        Xm_Main_Window.Xm_Main_Window_Widget_Class);
      Set_Is_Set_Initial_Size (Xt_Motif_Main_Window_Widget_Class, True);

      Set_Widget_Class
       (Xt_Motif_Manager_Widget_Class,
        Xm_Manager.Xm_Manager_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Message_Box_Widget_Class,
        Xm_Message_Box.Xm_Create_Message_Box'Access);
      Set_Widget_Class
       (Xt_Motif_Message_Box_Widget_Class,
        Xm_Message_Box.Xm_Message_Box_Widget_Class);

--   Xt_Motif_Message_Dialog_Widget_Class

      Set_Convenience_Create_Function
       (Xt_Motif_Notebook_Widget_Class,
        Xm_Notebook.Xm_Create_Notebook'Access);
      Set_Widget_Class
       (Xt_Motif_Notebook_Widget_Class,
        Xm_Notebook.Xm_Notebook_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Paned_Window_Widget_Class,
        Xm_Paned_Window.Xm_Create_Paned_Window'Access);
      Set_Widget_Class
       (Xt_Motif_Paned_Window_Widget_Class,
        Xm_Paned_Window.Xm_Paned_Window_Widget_Class);

      Set_Widget_Class
       (Xt_Motif_Primitive_Widget_Class,
        Xm_Primitive.Xm_Primitive_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Push_Button_Gadget_Widget_Class,
        Xm_Push_Button_Gadget.Xm_Create_Push_Button_Gadget'Access);
      Set_Widget_Class
       (Xt_Motif_Push_Button_Gadget_Widget_Class,
        Xm_Push_Button_Gadget.Xm_Push_Button_Gadget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Push_Button_Widget_Class,
        Xm_Push_Button.Xm_Create_Push_Button'Access);
      Set_Widget_Class
       (Xt_Motif_Push_Button_Widget_Class,
        Xm_Push_Button.Xm_Push_Button_Widget_Class);

----   Xt_Motif_Question_Dialog_Widget_Class

      Set_Convenience_Create_Function
       (Xt_Motif_Row_Column_Widget_Class,
        Xm_Row_Column.Xm_Create_Row_Column'Access);
      Set_Widget_Class
       (Xt_Motif_Row_Column_Widget_Class,
        Xm_Row_Column.Xm_Row_Column_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Scale_Widget_Class,
        Xm_Scale.Xm_Create_Scale'Access);
      Set_Widget_Class
       (Xt_Motif_Scale_Widget_Class,
        Xm_Scale.Xm_Scale_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Scroll_Bar_Widget_Class,
        Xm_Scroll_Bar.Xm_Create_Scroll_Bar'Access);
      Set_Widget_Class
       (Xt_Motif_Scroll_Bar_Widget_Class,
        Xm_Scroll_Bar.Xm_Scroll_Bar_Widget_Class);

--   Xt_Motif_Scrolled_List_Widget_Class
--   Xt_Motif_Scrolled_Text_Widget_Class

      Set_Convenience_Create_Function
       (Xt_Motif_Scrolled_Window_Widget_Class,
        Xm_Scrolled_Window.Xm_Create_Scrolled_Window'Access);
      Set_Widget_Class
       (Xt_Motif_Scrolled_Window_Widget_Class,
        Xm_Scrolled_Window.Xm_Scrolled_Window_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Selection_Box_Widget_Class,
        Xm_Selection_Box.Xm_Create_Selection_Box'Access);
      Set_Widget_Class
       (Xt_Motif_Selection_Box_Widget_Class,
        Xm_Selection_Box.Xm_Selection_Box_Widget_Class);

--   Xt_Motif_Selection_Dialog_Widget_Class

      Set_Convenience_Create_Function
       (Xt_Motif_Separator_Gadget_Widget_Class,
        Xm_Separator_Gadget.Xm_Create_Separator_Gadget'Access);
      Set_Widget_Class
       (Xt_Motif_Separator_Gadget_Widget_Class,
        Xm_Separator_Gadget.Xm_Separator_Gadget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Separator_Widget_Class,
        Xm_Separator.Xm_Create_Separator'Access);
      Set_Widget_Class
       (Xt_Motif_Separator_Widget_Class,
        Xm_Separator.Xm_Separator_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Simple_Spin_Box_Widget_Class,
        Xm_Simple_Spin_Box.Xm_Create_Simple_Spin_Box'Access);
      Set_Widget_Class
       (Xt_Motif_Simple_Spin_Box_Widget_Class,
        Xm_Simple_Spin_Box.Xm_Simple_Spin_Box_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Spin_Box_Widget_Class,
        Xm_Spin_Box.Xm_Create_Spin_Box'Access);
      Set_Widget_Class
       (Xt_Motif_Spin_Box_Widget_Class,
        Xm_Spin_Box.Xm_Spin_Box_Widget_Class);

--   Xt_Motif_Template_Dialog_Widget_Class

      Set_Convenience_Create_Function
       (Xt_Motif_Text_Field_Widget_Class,
        Xm_Text_Field.Xm_Create_Text_Field'Access);
      Set_Widget_Class
       (Xt_Motif_Text_Field_Widget_Class,
        Xm_Text_Field.Xm_Text_Field_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Text_Widget_Class,
        Xm_Text.Xm_Create_Text'Access);
      Set_Widget_Class
       (Xt_Motif_Text_Widget_Class,
        Xm_Text.Xm_Text_Widget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Toggle_Button_Gadget_Widget_Class,
        Xm_Toggle_Button_Gadget.Xm_Create_Toggle_Button_Gadget'Access);
      Set_Widget_Class
       (Xt_Motif_Toggle_Button_Gadget_Widget_Class,
        Xm_Toggle_Button_Gadget.Xm_Toggle_Button_Gadget_Class);

      Set_Convenience_Create_Function
       (Xt_Motif_Toggle_Button_Widget_Class,
        Xm_Toggle_Button.Xm_Create_Toggle_Button'Access);
      Set_Widget_Class
       (Xt_Motif_Toggle_Button_Widget_Class,
        Xm_Toggle_Button.Xm_Toggle_Button_Widget_Class);

      if Microline_Initialize_Designer_Hook /= null then
         Microline_Initialize_Designer_Hook.all;
      end if;
   end Initialize;

end Model.Initialization.Designer;
