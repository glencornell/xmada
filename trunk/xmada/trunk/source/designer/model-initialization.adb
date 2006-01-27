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
      Append (Types, Xt_Motif_Frame_Child_Type_Resource_Type);
      Append (Types, Xt_Motif_Child_Vertical_Alignment_Resource_Type);
      Append (Types, Xt_Motif_Combo_Box_Type_Resource_Type);
      Append (Types, Xt_Motif_Command_Window_Location_Resource_Type);

--      Append (Types, Xt_Motif__Resource_Type);
--      Append (Types, Xt_Motif__Resource_Type);
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
