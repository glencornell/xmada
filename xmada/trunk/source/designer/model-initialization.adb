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
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model.Names;
with Model.Tree.Constructors;
with Model.Tree.Lists;
with Model.Xt_Motif;

package body Model.Initialization is

   use Model;
   use Model.Names;
   use Model.Tree;
   use Model.Tree.Lists;
   use Model.Tree.Constructors;
   use Model.Xt_Motif;

   Xt_Motif_Alignment_Resource_Type                  : Node_Id;
   Xt_Motif_Arrow_Direction_Resource_Type            : Node_Id;
   Xt_Motif_Arrow_Layout_Resource_Type               : Node_Id;
   Xt_Motif_Arrow_Orientation_Resource_Type          : Node_Id;
   Xt_Motif_Arrow_Sensitivity_Resource_Type          : Node_Id;
   Xt_Motif_Attachment_Resource_Type                 : Node_Id;
   Xt_Motif_Audible_Warning_Resource_Type            : Node_Id;
   Xt_Motif_Auto_Drag_Model_Resource_Type            : Node_Id;
   Xt_Motif_Automatic_Selection_Resource_Type        : Node_Id;
   Xt_Motif_Binding_Type_Resource_Type               : Node_Id;
   Xt_Motif_Child_Horizontal_Alignment_Resource_Type : Node_Id;
   Xt_Motif_Child_Placement_Resource_Type            : Node_Id;
   Xt_Motif_Frame_Child_Type_Resource_Type           : Node_Id;
   Xt_Motif_Child_Vertical_Alignment_Resource_Type   : Node_Id;
   Xt_Motif_Combo_Box_Type_Resource_Type             : Node_Id;
   Xt_Motif_Command_Window_Location_Resource_Type    : Node_Id;
   Xt_Motif_Default_Button_Type_Resource_Type        : Node_Id;
   Xt_Motif_Delete_Response_Resource_Type            : Node_Id;
   Xt_Motif_Dialog_Style_Resource_Type               : Node_Id;
   Xt_Motif_Dialog_Type_Resource_Type                : Node_Id;
   Xt_Motif_Edit_Mode_Resource_Type                  : Node_Id;
   Xt_Motif_Toggle_Indicator_On_Resource_Type        : Node_Id;
   Xt_Motif_Indicator_Type_Resource_Type             : Node_Id;
   Xt_Motif_Input_Policy_Resource_Type               : Node_Id;
   Xt_Motif_Keyboard_Focus_Policy_Resource_Type      : Node_Id;
   Xt_Motif_Label_Type_Resource_Type                 : Node_Id;
   Xt_Motif_Layout_Type_Resource_Type                : Node_Id;
   Xt_Motif_Container_Line_Style_Resource_Type       : Node_Id;
   Xt_Motif_Match_Behavior_Resource_Type             : Node_Id;
--   Xt_Motif__Resource_Type : Node_Id;
--   Xt_Motif__Resource_Type : Node_Id;
--   Xt_Motif__Resource_Type : Node_Id;
--   Xt_Motif__Resource_Type : Node_Id;
--   Xt_Motif__Resource_Type : Node_Id;
--   Xt_Motif__Resource_Type : Node_Id;
--   Xt_Motif__Resource_Type : Node_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize is
      Types  : List_Id;

   begin

      --  Alignment

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_BEGINNING"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_BEGINNING"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_CENTER"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_CENTER"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_END"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_END"));
         Append (Values, Value);

         Xt_Motif_Alignment_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name (Xt_Motif_Alignment_Resource_Type, Enter ("XmRAlignment"));
         Set_Internal_Name
          (Xt_Motif_Alignment_Resource_Type, Enter ("Alignment"));
         Set_Value_Specifications (Xt_Motif_Alignment_Resource_Type, Values);
      end;

      --  ArrowDirection

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROW_UP"));
         Set_Internal_Name (Value, Enter ("ARROW_UP"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROW_DOWN"));
         Set_Internal_Name (Value, Enter ("ARROW_DOWN"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROW_LEFT"));
         Set_Internal_Name (Value, Enter ("ARROW_LEFT"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROW_RIGHT"));
         Set_Internal_Name (Value, Enter ("ARROW_RIGHT"));
         Append (Values, Value);

         Xt_Motif_Arrow_Direction_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Arrow_Direction_Resource_Type,
           Enter ("XmRArrowDirection"));
         Set_Internal_Name
          (Xt_Motif_Arrow_Direction_Resource_Type, Enter ("ArrowDirection"));
         Set_Value_Specifications
          (Xt_Motif_Arrow_Direction_Resource_Type, Values);
      end;

      --  ArrowLayout

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_END"));
         Set_Internal_Name (Value, Enter ("ARROWS_END"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_BEGINNING"));
         Set_Internal_Name (Value, Enter ("ARROWS_BEGINNING"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_SPLIT"));
         Set_Internal_Name (Value, Enter ("ARROWS_SPLIT"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_FLAT_END"));
         Set_Internal_Name (Value, Enter ("ARROWS_FLAT_END"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_FLAT_BEGINNING"));
         Set_Internal_Name (Value, Enter ("ARROWS_FLAT_BEGINNING"));
         Append (Values, Value);

         Xt_Motif_Arrow_Layout_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Arrow_Layout_Resource_Type, Enter ("XmRArrowLayout"));
         Set_Internal_Name
          (Xt_Motif_Arrow_Layout_Resource_Type, Enter ("ArrowLayout"));
         Set_Value_Specifications
          (Xt_Motif_Arrow_Layout_Resource_Type, Values);
      end;

      --  ArrowOrientation

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_VERTICAL"));
         Set_Internal_Name (Value, Enter ("ARROWS_VERTICAL"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_HORIZONTAL"));
         Set_Internal_Name (Value, Enter ("ARROWS_HORIZONTAL"));
         Append (Values, Value);

         Xt_Motif_Arrow_Orientation_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Arrow_Orientation_Resource_Type,
           Enter ("XmRArrowOrientation"));
         Set_Internal_Name
          (Xt_Motif_Arrow_Orientation_Resource_Type,
           Enter ("ArrowOrientation"));
         Set_Value_Specifications
          (Xt_Motif_Arrow_Orientation_Resource_Type, Values);
      end;

      --  ArrowSensitivity

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_INSENSITIVE"));
         Set_Internal_Name (Value, Enter ("ARROWS_INSENSITIVE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_INCREMENT_SENSITIVE"));
         Set_Internal_Name (Value, Enter ("ARROWS_INCREMENT_SENSITIVE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_DECREMENT_SENSITIVE"));
         Set_Internal_Name (Value, Enter ("ARROWS_DECREMENT_SENSITIVE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_SENSITIVE"));
         Set_Internal_Name (Value, Enter ("ARROWS_SENSITIVE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_DEFAULT_SENSITIVITY"));
         Set_Internal_Name (Value, Enter ("ARROWS_DEFAULT_SENSITIVITY"));
         Append (Values, Value);

         Xt_Motif_Arrow_Sensitivity_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Arrow_Sensitivity_Resource_Type,
           Enter ("XmRArrowSensitivity"));
         Set_Internal_Name
          (Xt_Motif_Arrow_Sensitivity_Resource_Type,
           Enter ("ArrowSensitivity"));
         Set_Value_Specifications
          (Xt_Motif_Arrow_Sensitivity_Resource_Type, Values);
      end;

      --  Attachment

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_NONE"));
         Set_Internal_Name (Value, Enter ("ATTACH_NONE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_FORM"));
         Set_Internal_Name (Value, Enter ("ATTACH_FORM"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_OPPOSITE_FORM"));
         Set_Internal_Name (Value, Enter ("ATTACH_OPPOSITE_FORM"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_WIDGET"));
         Set_Internal_Name (Value, Enter ("ATTACH_WIDGET"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_OPPOSITE_WIDGET"));
         Set_Internal_Name (Value, Enter ("ATTACH_OPPOSITE_WIDGET"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_POSITION"));
         Set_Internal_Name (Value, Enter ("ATTACH_POSITION"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_SELF"));
         Set_Internal_Name (Value, Enter ("ATTACH_SELF"));
         Append (Values, Value);

         Xt_Motif_Attachment_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Attachment_Resource_Type, Enter ("XmRAttachment"));
         Set_Internal_Name
          (Xt_Motif_Attachment_Resource_Type, Enter ("Attachment"));
         Set_Value_Specifications
          (Xt_Motif_Attachment_Resource_Type, Values);
      end;

      --  AudibleWarning

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmNONE"));
         Set_Internal_Name (Value, Enter ("NONE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmBELL"));
         Set_Internal_Name (Value, Enter ("BELL"));
         Append (Values, Value);

         Xt_Motif_Audible_Warning_Resource_Type :=
          Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Audible_Warning_Resource_Type,
           Enter ("XmRAudibleWarning"));
         Set_Internal_Name
          (Xt_Motif_Audible_Warning_Resource_Type, Enter ("AudibleWarning"));
         Set_Value_Specifications
          (Xt_Motif_Audible_Warning_Resource_Type, Values);
      end;

      --  AutoDragModel

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmAUTO_DRAG_ENABLED"));
         Set_Internal_Name (Value, Enter ("AUTO_DRAG_ENABLED"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmAUTO_DRAG_DISABLED"));
         Set_Internal_Name (Value, Enter ("AUTO_DRAG_DISABLED"));
         Append (Values, Value);

         Xt_Motif_Auto_Drag_Model_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Auto_Drag_Model_Resource_Type, Enter ("XmRAutoDragModel"));
         Set_Internal_Name
          (Xt_Motif_Auto_Drag_Model_Resource_Type, Enter ("AutoDragModel"));
         Set_Value_Specifications
          (Xt_Motif_Auto_Drag_Model_Resource_Type, Values);
      end;

      --  AutomaticSelection

      --  Тип имеет альтернативные имена для значений:
      --  XmNO_AUTO_SELECT : FALSE, OFF, NO, "0"
      --  XmAUTO_SELECT : TRUE, ON, YES, "1"

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmNO_AUTO_SELECT"));
         Set_Internal_Name (Value, Enter ("NO_AUTO_SELECT"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmAUTO_SELECT"));
         Set_Internal_Name (Value, Enter ("AUTO_SELECT"));
         Append (Values, Value);

         Xt_Motif_Automatic_Selection_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Automatic_Selection_Resource_Type,
           Enter ("XmRAutomaticSelection"));
         Set_Internal_Name
          (Xt_Motif_Automatic_Selection_Resource_Type,
           Enter ("AutomaticSelection"));
         Set_Value_Specifications
          (Xt_Motif_Automatic_Selection_Resource_Type, Values);
      end;

      --  BindingType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmNONE"));
         Set_Internal_Name (Value, Enter ("NONE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmPIXMAP"));
         Set_Internal_Name (Value, Enter ("PIXMAP"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmSOLID"));
         Set_Internal_Name (Value, Enter ("SOLID"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmSPIRAL"));
         Set_Internal_Name (Value, Enter ("SPIRAL"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmPIXMAP_OVERLAP_ONLY"));
         Set_Internal_Name (Value, Enter ("PIXMAP_OVERLAP_ONLY"));
         Append (Values, Value);

         Xt_Motif_Binding_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Binding_Type_Resource_Type, Enter ("XmRBindingType"));
         Set_Internal_Name
          (Xt_Motif_Binding_Type_Resource_Type, Enter ("BindingType"));
         Set_Value_Specifications
          (Xt_Motif_Binding_Type_Resource_Type, Values);
      end;

      --  ChildHorizontalAlignment

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_BEGINNING"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_BEGINNING"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_CENTER"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_CENTER"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_END"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_END"));
         Append (Values, Value);

         Xt_Motif_Child_Horizontal_Alignment_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Child_Horizontal_Alignment_Resource_Type,
           Enter ("XmRChildHorizontalAlignment"));
         Set_Internal_Name
          (Xt_Motif_Child_Horizontal_Alignment_Resource_Type,
           Enter ("ChildHorizontalAlignment"));
         Set_Value_Specifications
           (Xt_Motif_Child_Horizontal_Alignment_Resource_Type, Values);
      end;

      --  ChildPlacement

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmPLACE_TOP"));
         Set_Internal_Name (Value, Enter ("PLACE_TOP"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmPLACE_ABOVE_SELECTION"));
         Set_Internal_Name (Value, Enter ("PLACE_ABOVE_SELECTION"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmPLACE_BELOW_SELECTION"));
         Set_Internal_Name (Value, Enter ("PLACE_BELOW_SELECTION"));
         Append (Values, Value);

         Xt_Motif_Child_Placement_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Child_Placement_Resource_Type,
           Enter ("XmRChildPlacement"));
         Set_Internal_Name
          (Xt_Motif_Child_Placement_Resource_Type, Enter ("ChildPlacement"));
         Set_Value_Specifications
          (Xt_Motif_Child_Placement_Resource_Type, Values);
      end;

      --  FrameChildType

      --  Фактическое наименование - ChildType - обксловлено исторически
      --  сложившимся наименованием.

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmFRAME_GENERIC_CHILD"));
         Set_Internal_Name (Value, Enter ("FRAME_GENERIC_CHILD"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmFRAME_WORKAREA_CHILD"));
         Set_Internal_Name (Value, Enter ("FRAME_WORKAREA_CHILD"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmFRAME_TITLE_CHILD"));
         Set_Internal_Name (Value, Enter ("FRAME_TITLE_CHILD"));
         Append (Values, Value);

         Xt_Motif_Frame_Child_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Frame_Child_Type_Resource_Type, Enter ("XmRChildType"));
         Set_Internal_Name
          (Xt_Motif_Frame_Child_Type_Resource_Type, Enter ("ChildType"));
         Set_Value_Specifications
          (Xt_Motif_Frame_Child_Type_Resource_Type, Values);
      end;

      --  ChildVerticalAlignment

      --  Тип имеет альтернативные имена для значений:
      --  XmALIGNMENT_WIDGET_BOTTOM: XmALIGNMENT_CHILD_TOP
      --  XmALIGNMENT_WIDGET_TOP: XmALIGNMENT_CHILD_BOTTOM
      --
      --  Эти имена были введены в версии 2.0 для более точного указания
      --  значения. XXX Возможно имеет смысл использовать эти новые имена?

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_BASELINE_TOP"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_BASELINE_TOP"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_CENTER"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_CENTER"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_BASELINE_BOTTOM"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_BASELINE_BOTTOM"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_WIDGET_BOTTOM"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_WIDGET_BOTTOM"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_WIDGET_TOP"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_WIDGET_TOP"));
         Append (Values, Value);

         Xt_Motif_Child_Vertical_Alignment_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Child_Vertical_Alignment_Resource_Type,
           Enter ("XmRChildVerticalAlignment"));
         Set_Internal_Name
          (Xt_Motif_Child_Vertical_Alignment_Resource_Type,
           Enter ("ChildVerticalAlignment"));
         Set_Value_Specifications
          (Xt_Motif_Child_Vertical_Alignment_Resource_Type, Values);
      end;

      --  ComboBoxType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmCOMBO_BOX"));
         Set_Internal_Name (Value, Enter ("COMBO_BOX"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDROP_DOWN_COMBO_BOX"));
         Set_Internal_Name (Value, Enter ("DROP_DOWN_COMBO_BOX"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDROP_DOWN_LIST"));
         Set_Internal_Name (Value, Enter ("DROP_DOWN_LIST"));
         Append (Values, Value);

         Xt_Motif_Combo_Box_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Combo_Box_Type_Resource_Type, Enter ("XmRComboBoxType"));
         Set_Internal_Name
          (Xt_Motif_Combo_Box_Type_Resource_Type, Enter ("ComboBoxType"));
         Set_Value_Specifications
          (Xt_Motif_Combo_Box_Type_Resource_Type, Values);
      end;

      --  CommandWindowLocation

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmCOMMAND_ABOVE_WORKSPACE"));
         Set_Internal_Name (Value, Enter ("COMMAND_ABOVE_WORKSPACE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmCOMMAND_BELOW_WORKSPACE"));
         Set_Internal_Name (Value, Enter ("COMMAND_BELOW_WORKSPACE"));
         Append (Values, Value);

         Xt_Motif_Command_Window_Location_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Command_Window_Location_Resource_Type,
           Enter ("XmRCommandWindowLocation"));
         Set_Internal_Name
          (Xt_Motif_Command_Window_Location_Resource_Type,
           Enter ("CommandWindowLocation"));
         Set_Value_Specifications
          (Xt_Motif_Command_Window_Location_Resource_Type, Values);
      end;

      --  DefaultButtonType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_NONE"));
         Set_Internal_Name (Value, Enter ("DIALOG_NONE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_CANCEL_BUTTON"));
         Set_Internal_Name (Value, Enter ("DIALOG_CANCEL_BUTTON"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_OK_BUTTON"));
         Set_Internal_Name (Value, Enter ("DIALOG_OK_BUTTON"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_HELP_BUTTON"));
         Set_Internal_Name (Value, Enter ("DIALOG_HELP_BUTTON"));
         Append (Values, Value);

         Xt_Motif_Default_Button_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Default_Button_Type_Resource_Type,
           Enter ("XmRDefaultButtonType"));
         Set_Internal_Name
          (Xt_Motif_Default_Button_Type_Resource_Type,
           Enter ("DefaultButtonType"));
         Set_Value_Specifications
          (Xt_Motif_Default_Button_Type_Resource_Type, Values);
      end;

      --  DeleteResponse

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDESTROY"));
         Set_Internal_Name (Value, Enter ("DESTROY"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmUNMAP"));
         Set_Internal_Name (Value, Enter ("UNMAP"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDO_NOTHING"));
         Set_Internal_Name (Value, Enter ("DO_NOTHING"));
         Append (Values, Value);

         Xt_Motif_Delete_Response_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Delete_Response_Resource_Type,
           Enter ("XmRDeleteResponse"));
         Set_Internal_Name
          (Xt_Motif_Delete_Response_Resource_Type, Enter ("DeleteResponse"));
         Set_Value_Specifications
          (Xt_Motif_Delete_Response_Resource_Type, Values);
      end;

      --  DialogStyle

      --  Тип имеет альтернативные имена для:
      --  XmDIALOG_PRIMARY_APPLICATION_MODAL: XmDIALOG_APPLICATION_MODAL
      --    (для обратной совместимости)
      --  XmDIALOG_MODELESS: XmDIALOG_WORK_AREA
      --    (используется если родитель виджета - не XmDialogShell)

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_MODELESS"));
         Set_Internal_Name (Value, Enter ("DIALOG_MODELESS"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_PRIMARY_APPLICATION_MODAL"));
         Set_Internal_Name (Value, Enter ("DIALOG_PRIMARY_APPLICATION_MODAL"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_FULL_APPLICATION_MODAL"));
         Set_Internal_Name (Value, Enter ("DIALOG_FULL_APPLICATION_MODAL"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_SYSTEM_MODAL"));
         Set_Internal_Name (Value, Enter ("DIALOG_SYSTEM_MODAL"));
         Append (Values, Value);

         Xt_Motif_Dialog_Style_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Dialog_Style_Resource_Type, Enter ("XmRDialogStyle"));
         Set_Internal_Name
          (Xt_Motif_Dialog_Style_Resource_Type, Enter ("DialogStyle"));
         Set_Value_Specifications
          (Xt_Motif_Dialog_Style_Resource_Type, Values);
      end;

      --  DialogType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_TEMPLATE"));
         Set_Internal_Name (Value, Enter ("DIALOG_TEMPLATE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_ERROR"));
         Set_Internal_Name (Value, Enter ("DIALOG_ERROR"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_INFORMATION"));
         Set_Internal_Name (Value, Enter ("DIALOG_INFORMATION"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_MESSAGE"));
         Set_Internal_Name (Value, Enter ("DIALOG_MESSAGE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_QUESTION"));
         Set_Internal_Name (Value, Enter ("DIALOG_QUESTION"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_WARNING"));
         Set_Internal_Name (Value, Enter ("DIALOG_WARNING"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_WORKING"));
         Set_Internal_Name (Value, Enter ("DIALOG_WORKING"));
         Append (Values, Value);

         Xt_Motif_Dialog_Type_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Dialog_Type_Resource_Type, Enter ("XmRDialogType"));
         Set_Internal_Name
          (Xt_Motif_Dialog_Type_Resource_Type, Enter ("DialogType"));
         Set_Value_Specifications
          (Xt_Motif_Dialog_Type_Resource_Type, Values);
      end;

      --  EditMode

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmSINGLE_LINE_EDIT"));
         Set_Internal_Name (Value, Enter ("SINGLE_LINE_EDIT"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmMULTI_LINE_EDIT"));
         Set_Internal_Name (Value, Enter ("MULTI_LINE_EDIT"));
         Append (Values, Value);

         Xt_Motif_Edit_Mode_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Edit_Mode_Resource_Type, Enter ("XmREditMode"));
         Set_Internal_Name
          (Xt_Motif_Edit_Mode_Resource_Type, Enter ("EditMode"));
         Set_Value_Specifications
          (Xt_Motif_Edit_Mode_Resource_Type, Values);
      end;

      --  ToggleIndicatorOn

      --  Тип имеет альтернативные имена для:
      --  XmINDICATOR_NONE: OFF, FALSE, NO
      --  XmINDICATOR_FILL: ON, TRUE, YES

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_NONE"));
         Set_Internal_Name (Value, Enter ("INDICATOR_NONE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_FILL"));
         Set_Internal_Name (Value, Enter ("INDICATOR_FILL"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_BOX"));
         Set_Internal_Name (Value, Enter ("INDICATOR_BOX"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_CHECK"));
         Set_Internal_Name (Value, Enter ("INDICATOR_CHECK"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_CHECK_BOX"));
         Set_Internal_Name (Value, Enter ("INDICATOR_CHECK_BOX"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_CROSS"));
         Set_Internal_Name (Value, Enter ("INDICATOR_CROSS"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_CROSS_BOX"));
         Set_Internal_Name (Value, Enter ("INDICATOR_CROSS_BOX"));
         Append (Values, Value);

         Xt_Motif_Toggle_Indicator_On_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Toggle_Indicator_On_Resource_Type,
           Enter ("XmRIndicatorOn"));
         Set_Internal_Name
          (Xt_Motif_Toggle_Indicator_On_Resource_Type, Enter ("IndicatorOn"));
         Set_Value_Specifications
          (Xt_Motif_Toggle_Indicator_On_Resource_Type, Values);
      end;

      --  IndicatorType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmN_OF_MANY"));
         Set_Internal_Name (Value, Enter ("N_OF_MANY"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmONE_OF_MANY"));
         Set_Internal_Name (Value, Enter ("ONE_OF_MANY"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmONE_OF_MANY_ROUND"));
         Set_Internal_Name (Value, Enter ("ONE_OF_MANY_ROUND"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmONE_OF_MANY_DIAMOND"));
         Set_Internal_Name (Value, Enter ("ONE_OF_MANY_DIAMOND"));
         Append (Values, Value);

         Xt_Motif_Indicator_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Indicator_Type_Resource_Type, Enter ("XmRIndicatorType"));
         Set_Internal_Name
          (Xt_Motif_Indicator_Type_Resource_Type, Enter ("IndicatorType"));
         Set_Value_Specifications
          (Xt_Motif_Indicator_Type_Resource_Type, Values);
      end;

      --  InputPolicy

      --  XXX Значение XmINHERIT_POLICY не определено в RepresentationType.

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmPER_SHELL"));
         Set_Internal_Name (Value, Enter ("PER_SHELL"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmPER_WIDGET"));
         Set_Internal_Name (Value, Enter ("PER_WIDGET"));
         Append (Values, Value);

--         Value := Create_Enumerated_Resource_Type_Value_Specification;
--         Set_Name (Value, Enter ("XmINHERIT_POLICY"));
--         Set_Internal_Name (Value, Enter (""));  --  XXX ???
--         Append (Values, Value);

         Xt_Motif_Input_Policy_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Input_Policy_Resource_Type, Enter ("XmRInputPolicy"));
         Set_Internal_Name
          (Xt_Motif_Input_Policy_Resource_Type, Enter ("InputPolicy"));
         Set_Value_Specifications
          (Xt_Motif_Input_Policy_Resource_Type, Values);
      end;

      --  KeyboardFocusPolicy

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmEXPLICIT"));
         Set_Internal_Name (Value, Enter ("EXPLICIT"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmPOINTER"));
         Set_Internal_Name (Value, Enter ("POINTER"));
         Append (Values, Value);

         Xt_Motif_Keyboard_Focus_Policy_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Keyboard_Focus_Policy_Resource_Type,
           Enter ("XmRKeyboardFocusPolicy"));
         Set_Internal_Name
          (Xt_Motif_Keyboard_Focus_Policy_Resource_Type,
           Enter ("KeyboardFocusPolicy"));
         Set_Value_Specifications
          (Xt_Motif_Keyboard_Focus_Policy_Resource_Type, Values);
      end;

      --  LabelType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmSTRING"));
         Set_Internal_Name (Value, Enter ("STRING"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmPIXMAP"));
         Set_Internal_Name (Value, Enter ("PIXMAP"));
         Append (Values, Value);

         Xt_Motif_Label_Type_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Label_Type_Resource_Type, Enter ("XmRLabelType"));
         Set_Internal_Name
          (Xt_Motif_Label_Type_Resource_Type, Enter ("LabelType"));
         Set_Value_Specifications
          (Xt_Motif_Label_Type_Resource_Type, Values);
      end;

      --  LayoutType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmOUTLINE"));
         Set_Internal_Name (Value, Enter ("OUTLINE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmSPATIAL"));
         Set_Internal_Name (Value, Enter ("SPATIAL"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmDETAIL"));
         Set_Internal_Name (Value, Enter ("DETAIL"));
         Append (Values, Value);

         Xt_Motif_Layout_Type_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Layout_Type_Resource_Type, Enter ("XmRLayoutType"));
         Set_Internal_Name
          (Xt_Motif_Layout_Type_Resource_Type, Enter ("LayoutType"));
         Set_Value_Specifications
          (Xt_Motif_Layout_Type_Resource_Type, Values);
      end;

      --  ContainerLineStyle

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmSINGLE"));
         Set_Internal_Name (Value, Enter ("SINGLE"));
         Append (Values, Value);

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmNO_LINE"));
         Set_Internal_Name (Value, Enter ("NO_LINE"));
         Append (Values, Value);

         Xt_Motif_Container_Line_Style_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Container_Line_Style_Resource_Type,
           Enter ("XmRLineStyle"));
         Set_Internal_Name
          (Xt_Motif_Container_Line_Style_Resource_Type, Enter ("LineStyle"));
         Set_Value_Specifications
          (Xt_Motif_Container_Line_Style_Resource_Type, Values);
      end;

      --  MatchBehavior

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmQUICK_NAVIGATE"));
         Set_Internal_Name (Value, Enter ("QUICK_NAVIGATE"));
         Append (Values, Value);

         --  Этого значения нет в RepType.c!

         Value := Create_Enumerated_Resource_Type_Value_Specification;
         Set_Name (Value, Enter ("XmINVALID_MATCH_BEHAVIOR"));
         Set_Internal_Name (Value, Enter ("INVALID_MATCH_BEHAVIOR"));
         Append (Values, Value);

         Xt_Motif_Match_Behavior_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Match_Behavior_Resource_Type, Enter (""));
         Set_Internal_Name
          (Xt_Motif_Match_Behavior_Resource_Type, Enter (""));
         Set_Value_Specifications
          (Xt_Motif_Match_Behavior_Resource_Type, Values);
      end;

--      declare
--         Values : constant List_Id := New_List;
--         Value  : Node_Id;
--
--      begin
--         Value := Create_Enumerated_Resource_Type_Value_Specification;
--         Set_Name (Value, Enter (""));
--         Set_Internal_Name (Value, Enter (""));
--         Append (Values, Value);
--
--         Value := Create_Enumerated_Resource_Type_Value_Specification;
--         Set_Name (Value, Enter (""));
--         Set_Internal_Name (Value, Enter (""));
--         Append (Values, Value);
--
--          := Create_Enumerated_Resource_Type;
--         Set_Name
--          (, Enter (""));
--         Set_Internal_Name
--          (, Enter (""));
--         Set_Value_Specifications
--          (, Values);
--      end;

      --  Формирование списка всех типов ресурсов.

      Types := New_List;

      Append (Types, Xt_Motif_Alignment_Resource_Type);
      Append (Types, Xt_Motif_Arrow_Direction_Resource_Type);
      Append (Types, Xt_Motif_Arrow_Layout_Resource_Type);
      Append (Types, Xt_Motif_Arrow_Orientation_Resource_Type);
      Append (Types, Xt_Motif_Arrow_Sensitivity_Resource_Type);
      Append (Types, Xt_Motif_Attachment_Resource_Type);
      Append (Types, Xt_Motif_Audible_Warning_Resource_Type);
      Append (Types, Xt_Motif_Auto_Drag_Model_Resource_Type);
      Append (Types, Xt_Motif_Automatic_Selection_Resource_Type);
      Append (Types, Xt_Motif_Binding_Type_Resource_Type);
      Append (Types, Xt_Motif_Child_Horizontal_Alignment_Resource_Type);
      Append (Types, Xt_Motif_Child_Placement_Resource_Type);
      Append (Types, Xt_Motif_Frame_Child_Type_Resource_Type);  --  ???
      Append (Types, Xt_Motif_Child_Vertical_Alignment_Resource_Type);
      Append (Types, Xt_Motif_Combo_Box_Type_Resource_Type);
      Append (Types, Xt_Motif_Command_Window_Location_Resource_Type);
      Append (Types, Xt_Motif_Default_Button_Type_Resource_Type);
      Append (Types, Xt_Motif_Delete_Response_Resource_Type);
      Append (Types, Xt_Motif_Dialog_Style_Resource_Type);
      Append (Types, Xt_Motif_Dialog_Type_Resource_Type);
      Append (Types, Xt_Motif_Edit_Mode_Resource_Type);
      Append (Types, Xt_Motif_Toggle_Indicator_On_Resource_Type);  --  ???
      Append (Types, Xt_Motif_Indicator_Type_Resource_Type);
      Append (Types, Xt_Motif_Input_Policy_Resource_Type);
      Append (Types, Xt_Motif_Keyboard_Focus_Policy_Resource_Type);
      Append (Types, Xt_Motif_Label_Type_Resource_Type);
      Append (Types, Xt_Motif_Layout_Type_Resource_Type);
      Append (Types, Xt_Motif_Container_Line_Style_Resource_Type);  --  ???
      Append (Types, Xt_Motif_Match_Behavior_Resource_Type);
--      Append (Types, );
--      Append (Types, );
--      Append (Types, );
--      Append (Types, );
--      Append (Types, );
--      Append (Types, );
--      Append (Types, );

      Xt_Motif_Widget_Set := Create_Widget_Set;
      Set_Resource_Types (Xt_Motif_Widget_Set, Types);
   end Initialize;

end Model.Initialization;
