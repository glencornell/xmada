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
--! <Unit>
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xm_Arrow_Button;
with Xm_Arrow_Button_Gadget;
with Xm_Bulletin_Board;
with Xm_Cascade_Button;
with Xm_Cascade_Button_Gadget;
with Xm_Combo_Box;
with Xm_Command;
with Xm_Container;
with Xm_Drawing_Area;
with Xm_Drawn_Button;
with Xm_File_Selection_Box;
with Xm_Frame;
with Xm_Form;
with Xm_Icon_Gadget;
with Xm_Label;
with Xm_Label_Gadget;
with Xm_List;
with Xm_Main_Window;
with Xm_Message_Box;
with Xm_Notebook;
with Xm_Paned_Window;
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

      Set_Convenience_Create_Function
       (Xt_Motif_Arrow_Button_Gadget_Widget_Class,
        Xm_Arrow_Button_Gadget.Xm_Create_Arrow_Button_Gadget'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Arrow_Button_Widget_Class,
        Xm_Arrow_Button.Xm_Create_Arrow_Button'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Bulletin_Board_Widget_Class,
        Xm_Bulletin_Board.Xm_Create_Bulletin_Board'Access);
----   Xt_Motif_Bulletin_Board_Dialog_Widget_Class : Node_Id;
      Set_Convenience_Create_Function
       (Xt_Motif_Cascade_Button_Gadget_Widget_Class,
        Xm_Cascade_Button_Gadget.Xm_Create_Cascade_Button_Gadget'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Cascade_Button_Widget_Class,
        Xm_Cascade_Button.Xm_Create_Cascade_Button'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Combo_Box_Widget_Class,
        Xm_Combo_Box.Xm_Create_Combo_Box'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Command_Widget_Class,
        Xm_Command.Xm_Create_Command'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Container_Widget_Class,
        Xm_Container.Xm_Create_Container'Access);
--      Set_Convenience_Create_Function
--       (Xt_Motif_Dialog_Shell_Widget_Class,
      Set_Convenience_Create_Function
       (Xt_Motif_Drawing_Area_Widget_Class,
        Xm_Drawing_Area.Xm_Create_Drawing_Area'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Drawn_Button_Widget_Class,
        Xm_Drawn_Button.Xm_Create_Drawn_Button'Access);
--   Xt_Motif_Error_Dialog_Widget_Class
      Set_Convenience_Create_Function
       (Xt_Motif_File_Selection_Box_Widget_Class,
        Xm_File_Selection_Box.Xm_Create_File_Selection_Box'Access);
--   Xt_Motif_File_Selection_Dialog_Widget_Class
--  in Xt      Xt_Motif_Form_Widget_Class
--   Xt_Motif_Form_Dialog_Widget_Class
      Set_Convenience_Create_Function
       (Xt_Motif_Form_Widget_Class,
        Xm_Form.Xm_Create_Form'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Frame_Widget_Class,
        Xm_Frame.Xm_Create_Frame'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Icon_Gadget_Widget_Class,
        Xm_Icon_Gadget.Xm_Create_Icon_Gadget'Access);
--   Xt_Motif_Information_Dialog_Widget_Class
      Set_Convenience_Create_Function
       (Xt_Motif_Label_Gadget_Widget_Class,
        Xm_Label_Gadget.Xm_Create_Label_Gadget'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Label_Widget_Class,
        Xm_Label.Xm_Create_Label'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_List_Widget_Class,
        Xm_List.Xm_Create_List'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Main_Window_Widget_Class,
        Xm_Main_Window.Xm_Create_Main_Window'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Message_Box_Widget_Class,
        Xm_Message_Box.Xm_Create_Message_Box'Access);
--   Xt_Motif_Message_Dialog_Widget_Class
      Set_Convenience_Create_Function
       (Xt_Motif_Notebook_Widget_Class,
        Xm_Notebook.Xm_Create_Notebook'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Paned_Window_Widget_Class,
        Xm_Paned_Window.Xm_Create_Paned_Window'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Push_Button_Gadget_Widget_Class,
        Xm_Push_Button_Gadget.Xm_Create_Push_Button_Gadget'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Push_Button_Widget_Class,
        Xm_Push_Button.Xm_Create_Push_Button'Access);
----   Xt_Motif_Question_Dialog_Widget_Class
      Set_Convenience_Create_Function
       (Xt_Motif_Row_Column_Widget_Class,
        Xm_Row_Column.Xm_Create_Row_Column'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Scale_Widget_Class,
        Xm_Scale.Xm_Create_Scale'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Scroll_Bar_Widget_Class,
        Xm_Scroll_Bar.Xm_Create_Scroll_Bar'Access);
--   Xt_Motif_Scrolled_List_Widget_Class
--   Xt_Motif_Scrolled_Text_Widget_Class
      Set_Convenience_Create_Function
       (Xt_Motif_Scrolled_Window_Widget_Class,
        Xm_Scrolled_Window.Xm_Create_Scrolled_Window'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Selection_Box_Widget_Class,
        Xm_Selection_Box.Xm_Create_Selection_Box'Access);
--   Xt_Motif_Selection_Dialog_Widget_Class
      Set_Convenience_Create_Function
       (Xt_Motif_Separator_Gadget_Widget_Class,
        Xm_Separator_Gadget.Xm_Create_Separator_Gadget'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Separator_Widget_Class,
        Xm_Separator.Xm_Create_Separator'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Simple_Spin_Box_Widget_Class,
        Xm_Simple_Spin_Box.Xm_Create_Simple_Spin_Box'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Spin_Box_Widget_Class,
        Xm_Spin_Box.Xm_Create_Spin_Box'Access);
--   Xt_Motif_Template_Dialog_Widget_Class
      Set_Convenience_Create_Function
       (Xt_Motif_Text_Field_Widget_Class,
        Xm_Text_Field.Xm_Create_Text_Field'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Text_Widget_Class,
        Xm_Text.Xm_Create_Text'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Toggle_Button_Gadget_Widget_Class,
        Xm_Toggle_Button_Gadget.Xm_Create_Toggle_Button_Gadget'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Toggle_Button_Widget_Class,
        Xm_Toggle_Button.Xm_Create_Toggle_Button'Access);
   end Initialize;

end Model.Initialization.Designer;
