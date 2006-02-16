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
      Model.Tree.Xm_Ada.Initialize;

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
   end Initialize;

end Model.Initialization.Xm_Ada;
