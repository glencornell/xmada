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

   procedure Create_Enumerated_Resource_Types;

   procedure Create_Widget_Classes;

   --  Типы ресурсов

   Xt_Motif_Alignment_Resource_Type                  : Node_Id;
   Xt_Motif_Arrow_Direction_Resource_Type            : Node_Id;
--   Xt_Motif_Arrow_Layout_Resource_Type               : Node_Id;
--   Xt_Motif_Arrow_Orientation_Resource_Type          : Node_Id;
--   Xt_Motif_Arrow_Sensitivity_Resource_Type          : Node_Id;
--   Xt_Motif_Attachment_Resource_Type                 : Node_Id;
--   Xt_Motif_Audible_Warning_Resource_Type            : Node_Id;
--   Xt_Motif_Auto_Drag_Model_Resource_Type            : Node_Id;
--   Xt_Motif_Automatic_Selection_Resource_Type        : Node_Id;
--   Xt_Motif_Binding_Type_Resource_Type               : Node_Id;
--   Xt_Motif_Child_Horizontal_Alignment_Resource_Type : Node_Id;
--   Xt_Motif_Child_Placement_Resource_Type            : Node_Id;
--   Xt_Motif_Frame_Child_Type_Resource_Type           : Node_Id;
--   Xt_Motif_Child_Vertical_Alignment_Resource_Type   : Node_Id;
--   Xt_Motif_Combo_Box_Type_Resource_Type             : Node_Id;
--   Xt_Motif_Command_Window_Location_Resource_Type    : Node_Id;
--   Xt_Motif_Default_Button_Type_Resource_Type        : Node_Id;
--   Xt_Motif_Delete_Response_Resource_Type            : Node_Id;
--   Xt_Motif_Dialog_Style_Resource_Type               : Node_Id;
--   Xt_Motif_Dialog_Type_Resource_Type                : Node_Id;
--   Xt_Motif_Edit_Mode_Resource_Type                  : Node_Id;
   Xt_Motif_Toggle_Indicator_On_Resource_Type        : Node_Id;
   Xt_Motif_Indicator_Type_Resource_Type             : Node_Id;
--   Xt_Motif_Input_Policy_Resource_Type               : Node_Id;
--   Xt_Motif_Keyboard_Focus_Policy_Resource_Type      : Node_Id;
   Xt_Motif_Label_Type_Resource_Type                 : Node_Id;
--   Xt_Motif_Layout_Type_Resource_Type                : Node_Id;
--   Xt_Motif_Container_Line_Style_Resource_Type       : Node_Id;
--   Xt_Motif_Match_Behavior_Resource_Type             : Node_Id;
--   Xt_Motif_Multi_Click_Resource_Type                : Node_Id;
--   Xt_Motif_Navigation_Type_Resource_Type            : Node_Id;
--   Xt_Motif_Notebook_Child_Type_Resource_Type        : Node_Id;
--   Xt_Motif_Orientation_Resource_Type                : Node_Id;
--   Xt_Motif_Outline_Button_Policy_Resource_Type      : Node_Id;
--   Xt_Motif_Outline_State_Resource_Type              : Node_Id;
--   Xt_Motif_Packing_Resource_Type                    : Node_Id;
--   Xt_Motif_Position_Mode_Resource_Type              : Node_Id;

   Types   : List_Id;
   Classes : List_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Enumerated_Resource_Types
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Enumerated_Resource_Types is
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
      Xt_Motif_Input_Policy_Resource_Type               : Node_Id;
      Xt_Motif_Keyboard_Focus_Policy_Resource_Type      : Node_Id;
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
--      Xt_Motif__Resource_Type : Node_Id;
--      Xt_Motif__Resource_Type : Node_Id;
--      Xt_Motif__Resource_Type : Node_Id;
--      Xt_Motif__Resource_Type : Node_Id;
--      Xt_Motif__Resource_Type : Node_Id;
--      Xt_Motif__Resource_Type : Node_Id;
--      Xt_Motif__Resource_Type : Node_Id;

   begin

      --  Alignment

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_BEGINNING"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_BEGINNING"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_CENTER"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_CENTER"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmARROW_UP"));
         Set_Internal_Name (Value, Enter ("ARROW_UP"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmARROW_DOWN"));
         Set_Internal_Name (Value, Enter ("ARROW_DOWN"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmARROW_LEFT"));
         Set_Internal_Name (Value, Enter ("ARROW_LEFT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_END"));
         Set_Internal_Name (Value, Enter ("ARROWS_END"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_BEGINNING"));
         Set_Internal_Name (Value, Enter ("ARROWS_BEGINNING"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_SPLIT"));
         Set_Internal_Name (Value, Enter ("ARROWS_SPLIT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_FLAT_END"));
         Set_Internal_Name (Value, Enter ("ARROWS_FLAT_END"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_VERTICAL"));
         Set_Internal_Name (Value, Enter ("ARROWS_VERTICAL"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_INSENSITIVE"));
         Set_Internal_Name (Value, Enter ("ARROWS_INSENSITIVE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_INCREMENT_SENSITIVE"));
         Set_Internal_Name (Value, Enter ("ARROWS_INCREMENT_SENSITIVE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_DECREMENT_SENSITIVE"));
         Set_Internal_Name (Value, Enter ("ARROWS_DECREMENT_SENSITIVE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmARROWS_SENSITIVE"));
         Set_Internal_Name (Value, Enter ("ARROWS_SENSITIVE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_NONE"));
         Set_Internal_Name (Value, Enter ("ATTACH_NONE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_FORM"));
         Set_Internal_Name (Value, Enter ("ATTACH_FORM"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_OPPOSITE_FORM"));
         Set_Internal_Name (Value, Enter ("ATTACH_OPPOSITE_FORM"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_WIDGET"));
         Set_Internal_Name (Value, Enter ("ATTACH_WIDGET"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_OPPOSITE_WIDGET"));
         Set_Internal_Name (Value, Enter ("ATTACH_OPPOSITE_WIDGET"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmATTACH_POSITION"));
         Set_Internal_Name (Value, Enter ("ATTACH_POSITION"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNONE"));
         Set_Internal_Name (Value, Enter ("NONE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmAUTO_DRAG_ENABLED"));
         Set_Internal_Name (Value, Enter ("AUTO_DRAG_ENABLED"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNO_AUTO_SELECT"));
         Set_Internal_Name (Value, Enter ("NO_AUTO_SELECT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNONE"));
         Set_Internal_Name (Value, Enter ("NONE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPIXMAP"));
         Set_Internal_Name (Value, Enter ("PIXMAP"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSOLID"));
         Set_Internal_Name (Value, Enter ("SOLID"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSPIRAL"));
         Set_Internal_Name (Value, Enter ("SPIRAL"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_BEGINNING"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_BEGINNING"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_CENTER"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_CENTER"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPLACE_TOP"));
         Set_Internal_Name (Value, Enter ("PLACE_TOP"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPLACE_ABOVE_SELECTION"));
         Set_Internal_Name (Value, Enter ("PLACE_ABOVE_SELECTION"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmFRAME_GENERIC_CHILD"));
         Set_Internal_Name (Value, Enter ("FRAME_GENERIC_CHILD"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmFRAME_WORKAREA_CHILD"));
         Set_Internal_Name (Value, Enter ("FRAME_WORKAREA_CHILD"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_BASELINE_TOP"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_BASELINE_TOP"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_CENTER"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_CENTER"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_BASELINE_BOTTOM"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_BASELINE_BOTTOM"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmALIGNMENT_WIDGET_BOTTOM"));
         Set_Internal_Name (Value, Enter ("ALIGNMENT_WIDGET_BOTTOM"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmCOMBO_BOX"));
         Set_Internal_Name (Value, Enter ("COMBO_BOX"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDROP_DOWN_COMBO_BOX"));
         Set_Internal_Name (Value, Enter ("DROP_DOWN_COMBO_BOX"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmCOMMAND_ABOVE_WORKSPACE"));
         Set_Internal_Name (Value, Enter ("COMMAND_ABOVE_WORKSPACE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_NONE"));
         Set_Internal_Name (Value, Enter ("DIALOG_NONE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_CANCEL_BUTTON"));
         Set_Internal_Name (Value, Enter ("DIALOG_CANCEL_BUTTON"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_OK_BUTTON"));
         Set_Internal_Name (Value, Enter ("DIALOG_OK_BUTTON"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDESTROY"));
         Set_Internal_Name (Value, Enter ("DESTROY"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmUNMAP"));
         Set_Internal_Name (Value, Enter ("UNMAP"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_MODELESS"));
         Set_Internal_Name (Value, Enter ("DIALOG_MODELESS"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_PRIMARY_APPLICATION_MODAL"));
         Set_Internal_Name (Value, Enter ("DIALOG_PRIMARY_APPLICATION_MODAL"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_FULL_APPLICATION_MODAL"));
         Set_Internal_Name (Value, Enter ("DIALOG_FULL_APPLICATION_MODAL"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_TEMPLATE"));
         Set_Internal_Name (Value, Enter ("DIALOG_TEMPLATE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_ERROR"));
         Set_Internal_Name (Value, Enter ("DIALOG_ERROR"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_INFORMATION"));
         Set_Internal_Name (Value, Enter ("DIALOG_INFORMATION"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_MESSAGE"));
         Set_Internal_Name (Value, Enter ("DIALOG_MESSAGE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_QUESTION"));
         Set_Internal_Name (Value, Enter ("DIALOG_QUESTION"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDIALOG_WARNING"));
         Set_Internal_Name (Value, Enter ("DIALOG_WARNING"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSINGLE_LINE_EDIT"));
         Set_Internal_Name (Value, Enter ("SINGLE_LINE_EDIT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_NONE"));
         Set_Internal_Name (Value, Enter ("INDICATOR_NONE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_FILL"));
         Set_Internal_Name (Value, Enter ("INDICATOR_FILL"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_BOX"));
         Set_Internal_Name (Value, Enter ("INDICATOR_BOX"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_CHECK"));
         Set_Internal_Name (Value, Enter ("INDICATOR_CHECK"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_CHECK_BOX"));
         Set_Internal_Name (Value, Enter ("INDICATOR_CHECK_BOX"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmINDICATOR_CROSS"));
         Set_Internal_Name (Value, Enter ("INDICATOR_CROSS"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmN_OF_MANY"));
         Set_Internal_Name (Value, Enter ("N_OF_MANY"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmONE_OF_MANY"));
         Set_Internal_Name (Value, Enter ("ONE_OF_MANY"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmONE_OF_MANY_ROUND"));
         Set_Internal_Name (Value, Enter ("ONE_OF_MANY_ROUND"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPER_SHELL"));
         Set_Internal_Name (Value, Enter ("PER_SHELL"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPER_WIDGET"));
         Set_Internal_Name (Value, Enter ("PER_WIDGET"));
         Append (Values, Value);

--         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmEXPLICIT"));
         Set_Internal_Name (Value, Enter ("EXPLICIT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSTRING"));
         Set_Internal_Name (Value, Enter ("STRING"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmOUTLINE"));
         Set_Internal_Name (Value, Enter ("OUTLINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSPATIAL"));
         Set_Internal_Name (Value, Enter ("SPATIAL"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSINGLE"));
         Set_Internal_Name (Value, Enter ("SINGLE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
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
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNONE"));
         Set_Internal_Name (Value, Enter ("NONE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmQUICK_NAVIGATE"));
         Set_Internal_Name (Value, Enter ("QUICK_NAVIGATE"));
         Append (Values, Value);

         Xt_Motif_Match_Behavior_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Match_Behavior_Resource_Type, Enter ("XmRMatchBehavior"));
         Set_Internal_Name
          (Xt_Motif_Match_Behavior_Resource_Type, Enter ("MatchBehavior"));
         Set_Value_Specifications
          (Xt_Motif_Match_Behavior_Resource_Type, Values);
      end;

      --  MultiClick

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMULTICLICK_DISCARD"));
         Set_Internal_Name (Value, Enter ("MULTICLICK_DISCARD"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMULTICLICK_KEEP"));
         Set_Internal_Name (Value, Enter ("MULTICLICK_KEEP"));
         Append (Values, Value);

         Xt_Motif_Multi_Click_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Multi_Click_Resource_Type, Enter ("XmRMultiClick"));
         Set_Internal_Name
          (Xt_Motif_Multi_Click_Resource_Type, Enter ("MultiClick"));
         Set_Value_Specifications
          (Xt_Motif_Multi_Click_Resource_Type, Values);
      end;

      --  NavigationType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNONE"));
         Set_Internal_Name (Value, Enter ("NONE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmTAB_GROUP"));
         Set_Internal_Name (Value, Enter ("TAB_GROUP"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSTICKY_TAB_GROUP"));
         Set_Internal_Name (Value, Enter ("STICKY_TAB_GROUP"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmEXCLUSIVE_TAB_GROUP"));
         Set_Internal_Name (Value, Enter ("EXCLUSIVE_TAB_GROUP"));
         Append (Values, Value);

         Xt_Motif_Navigation_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Navigation_Type_Resource_Type,
           Enter ("XmRNavigationType"));
         Set_Internal_Name
          (Xt_Motif_Navigation_Type_Resource_Type, Enter ("NavigationType"));
         Set_Value_Specifications
          (Xt_Motif_Navigation_Type_Resource_Type, Values);
      end;

      --  NotebookChildType

      --  В менеджере представлений тип имеет ещё одно значение - XmNONE,
      --  используемое реализацией для сброса в начальное состояние.

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPAGE"));
         Set_Internal_Name (Value, Enter ("PAGE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMAJOR_TAB"));
         Set_Internal_Name (Value, Enter ("MAJOR_TAB"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMINOR_TAB"));
         Set_Internal_Name (Value, Enter ("MINOR_TAB"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSTATUS_AREA"));
         Set_Internal_Name (Value, Enter ("STATUS_AREA"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPAGE_SCROLLER"));
         Set_Internal_Name (Value, Enter ("PAGE_SCROLLER"));
         Append (Values, Value);

         Xt_Motif_Notebook_Child_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Notebook_Child_Type_Resource_Type,
           Enter ("XmRNotebookChildType"));
         Set_Internal_Name
          (Xt_Motif_Notebook_Child_Type_Resource_Type,
           Enter ("NotebookChildType"));
         Set_Value_Specifications
          (Xt_Motif_Notebook_Child_Type_Resource_Type, Values);
      end;

      --  Orientation

      --  Значение XmNO_ORIENTATION используется в RowColumn для указания
      --  динамичкески определяемого значения. Его добавление в список
      --  значений не требуется.

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmVERTICAL"));
         Set_Internal_Name (Value, Enter ("VERTICAL"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmHORIZONTAL"));
         Set_Internal_Name (Value, Enter ("HORIZONTAL"));
         Append (Values, Value);

         Xt_Motif_Orientation_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Orientation_Resource_Type, Enter ("XmROrientation"));
         Set_Internal_Name
          (Xt_Motif_Orientation_Resource_Type, Enter ("Orientation"));
         Set_Value_Specifications
          (Xt_Motif_Orientation_Resource_Type, Values);
      end;

      --  OutlineButtonPolicy

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmOUTLINE_BUTTON_PRESENT"));
         Set_Internal_Name (Value, Enter ("OUTLINE_BUTTON_PRESENT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmOUTLINE_BUTTON_ABSENT"));
         Set_Internal_Name (Value, Enter ("OUTLINE_BUTTON_ABSENT"));
         Append (Values, Value);

         Xt_Motif_Outline_Button_Policy_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Outline_Button_Policy_Resource_Type,
           Enter ("XmROutlineButtonPolicy"));
         Set_Internal_Name
          (Xt_Motif_Outline_Button_Policy_Resource_Type,
           Enter ("OutlineButtonPolicy"));
         Set_Value_Specifications
          (Xt_Motif_Outline_Button_Policy_Resource_Type, Values);
      end;

      --  OutlineState

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmCOLLAPSED"));
         Set_Internal_Name (Value, Enter ("COLLAPSED"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmEXPANDED"));
         Set_Internal_Name (Value, Enter ("EXPANDED"));
         Append (Values, Value);

         Xt_Motif_Outline_State_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Outline_State_Resource_Type, Enter ("XmROutlineState"));
         Set_Internal_Name
          (Xt_Motif_Outline_State_Resource_Type, Enter ("OutlineState"));
         Set_Value_Specifications
          (Xt_Motif_Outline_State_Resource_Type, Values);
      end;

      --  Packing

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPACK_TIGHT"));
         Set_Internal_Name (Value, Enter ("PACK_TIGHT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPACK_COLUMN"));
         Set_Internal_Name (Value, Enter ("PACK_COLUMN"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPACK_NONE"));
         Set_Internal_Name (Value, Enter ("PACK_NONE"));
         Append (Values, Value);

         Xt_Motif_Packing_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Packing_Resource_Type, Enter ("XmRPacking"));
         Set_Internal_Name
          (Xt_Motif_Packing_Resource_Type, Enter ("Packing"));
         Set_Value_Specifications
          (Xt_Motif_Packing_Resource_Type, Values);
      end;

      --  PositionMode

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmZERO_BASED"));
         Set_Internal_Name (Value, Enter ("ZERO_BASED"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmONE_BASED"));
         Set_Internal_Name (Value, Enter ("ONE_BASED"));
         Append (Values, Value);

         Xt_Motif_Position_Mode_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Position_Mode_Resource_Type, Enter ("XmRPositionMode"));
         Set_Internal_Name
          (Xt_Motif_Position_Mode_Resource_Type, Enter ("PositionMode"));
         Set_Value_Specifications
          (Xt_Motif_Position_Mode_Resource_Type, Values);
      end;

      --

--      declare
--         Values : constant List_Id := New_List;
--         Value  : Node_Id;
--
--      begin
--         Value := Create_Enumeration_Value_Specification;
--         Set_Name (Value, Enter (""));
--         Set_Internal_Name (Value, Enter (""));
--         Append (Values, Value);
--
--         Value := Create_Enumeration_Value_Specification;
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
      Append (Types, Xt_Motif_Multi_Click_Resource_Type);
      Append (Types, Xt_Motif_Navigation_Type_Resource_Type);
      Append (Types, Xt_Motif_Notebook_Child_Type_Resource_Type);
      Append (Types, Xt_Motif_Orientation_Resource_Type);
      Append (Types, Xt_Motif_Outline_Button_Policy_Resource_Type);
      Append (Types, Xt_Motif_Outline_State_Resource_Type);
      Append (Types, Xt_Motif_Packing_Resource_Type);
      Append (Types, Xt_Motif_Position_Mode_Resource_Type);
--      Append (Types, );
--      Append (Types, );
--      Append (Types, );
--      Append (Types, );
--      Append (Types, );
--      Append (Types, );
--      Append (Types, );
   end Create_Enumerated_Resource_Types;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget_Classes
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Widget_Classes is
--      Xt_Motif__Widget_Class : Node_Id;
--      Xt_Motif__Widget_Class : Node_Id;
--      Xt_Motif__Widget_Class : Node_Id;
--      Xt_Motif__Widget_Class : Node_Id;
--      Xt_Motif__Widget_Class : Node_Id;
--      Xt_Motif__Widget_Class : Node_Id;
--      Xt_Motif__Widget_Class : Node_Id;

   --  Классы виджетов Xt.

      Xt_Motif_Application_Shell_Widget_Class : Node_Id;
      Xt_Motif_Composite_Widget_Class         : Node_Id;
      Xt_Motif_Constraint_Widget_Class        : Node_Id;
      Xt_Motif_Core_Widget_Class              : Node_Id;
      Xt_Motif_Object_Widget_Class            : Node_Id;
      Xt_Motif_Override_Shell_Widget_Class    : Node_Id;
      Xt_Motif_Rect_Obj_Widget_Class          : Node_Id;
      Xt_Motif_Shell_Widget_Class             : Node_Id;
      Xt_Motif_Session_Shell_Widget_Class     : Node_Id;
      Xt_Motif_Top_Level_Shell_Widget_Class   : Node_Id;
      Xt_Motif_Transient_Shell_Widget_Class   : Node_Id;
      Xt_Motif_Vendor_Shell_Widget_Class      : Node_Id;
      Xt_Motif_WM_Shell_Widget_Class          : Node_Id;

      --  Классы виджетов Motif.

      Xt_Motif_Arrow_Button_Gadget_Widget_Class   : Node_Id;
      Xt_Motif_Arrow_Button_Widget_Class          : Node_Id;
      Xt_Motif_Bulletin_Board_Widget_Class        : Node_Id;
--   Xt_Motif_Bulletin_Board_Dialog_Widget_Class : Node_Id;
      Xt_Motif_Cascade_Button_Gadget_Widget_Class : Node_Id;
      Xt_Motif_Cascade_Button_Widget_Class        : Node_Id;
      Xt_Motif_Combo_Box_Widget_Class             : Node_Id;
      Xt_Motif_Command_Widget_Class               : Node_Id;
      Xt_Motif_Container_Widget_Class             : Node_Id;
      Xt_Motif_Dialog_Shell_Widget_Class          : Node_Id;
      Xt_Motif_Drawing_Area_Widget_Class          : Node_Id;
      Xt_Motif_Drawn_Button_Widget_Class          : Node_Id;
--   Xt_Motif_Error_Dialog_Widget_Class          : Node_Id;
      Xt_Motif_File_Selection_Box_Widget_Class    : Node_Id;
--   Xt_Motif_File_Selection_Dialog_Widget_Class : Node_Id;
      Xt_Motif_Form_Widget_Class                  : Node_Id;
--   Xt_Motif_Form_Dialog_Widget_Class           : Node_Id;
      Xt_Motif_Frame_Widget_Class                 : Node_Id;
      Xt_Motif_Gadget_Widget_Class                : Node_Id;
      Xt_Motif_Icon_Gadget_Widget_Class           : Node_Id;
--   Xt_Motif_Information_Dialog_Widget_Class    : Node_Id;
      Xt_Motif_Label_Gadget_Widget_Class          : Node_Id;
      Xt_Motif_Label_Widget_Class                 : Node_Id;
      Xt_Motif_List_Widget_Class                  : Node_Id;
      Xt_Motif_Main_Window_Widget_Class           : Node_Id;
      Xt_Motif_Manager_Widget_Class               : Node_Id;
      Xt_Motif_Message_Box_Widget_Class           : Node_Id;
--   Xt_Motif_Message_Dialog_Widget_Class        : Node_Id;
      Xt_Motif_Notebook_Widget_Class              : Node_Id;
      Xt_Motif_Paned_Window_Widget_Class          : Node_Id;
      Xt_Motif_Primitive_Widget_Class             : Node_Id;
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
--   Xt_Motif_Warning_Dialog_Widget_Class        : Node_Id;
--   Xt_Motif_Working_Dialog_Widget_Class        : Node_Id;

   begin

      ------------------------------------------------------------------------
      --  Xt Toolkit Intrinsics Core Widget Classes
      ------------------------------------------------------------------------

      --  Object

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Object_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Object_Widget_Class, Enter ("Object"));
      Set_Is_Meta_Class (Xt_Motif_Object_Widget_Class, True);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  RectObj

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Rect_Obj_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Rect_Obj_Widget_Class, Enter ("RectObj"));
      Set_Super_Class (Xt_Motif_Rect_Obj_Widget_Class,
                       Xt_Motif_Object_Widget_Class);
      Set_Is_Meta_Class (Xt_Motif_Rect_Obj_Widget_Class, True);

      --  Core

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Core_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Core_Widget_Class, Enter ("Core"));
      Set_Super_Class (Xt_Motif_Core_Widget_Class,
                       Xt_Motif_Rect_Obj_Widget_Class);
      Set_Is_Meta_Class (Xt_Motif_Core_Widget_Class, True);

      --  Composite

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Composite_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Composite_Widget_Class, Enter ("Composite"));
      Set_Super_Class (Xt_Motif_Composite_Widget_Class,
                       Xt_Motif_Core_Widget_Class);
      Set_Is_Meta_Class (Xt_Motif_Composite_Widget_Class, True);

      --  Constraint

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Constraint_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Constraint_Widget_Class, Enter ("Constraint"));
      Set_Super_Class (Xt_Motif_Constraint_Widget_Class,
                       Xt_Motif_Composite_Widget_Class);
      Set_Is_Meta_Class (Xt_Motif_Constraint_Widget_Class, True);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  Shell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Shell_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Shell_Widget_Class, Enter ("Shell"));
      Set_Super_Class (Xt_Motif_Shell_Widget_Class,
                       Xt_Motif_Composite_Widget_Class);
      Set_Is_Meta_Class (Xt_Motif_Shell_Widget_Class, True);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  OverrideShell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Override_Shell_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Override_Shell_Widget_Class, Enter ("OverrideShell"));
      Set_Super_Class (Xt_Motif_Override_Shell_Widget_Class,
                       Xt_Motif_Shell_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  WMShell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_WM_Shell_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_WM_Shell_Widget_Class, Enter ("WMShell"));
      Set_Super_Class (Xt_Motif_WM_Shell_Widget_Class,
                       Xt_Motif_Shell_Widget_Class);
      Set_Is_Meta_Class (Xt_Motif_WM_Shell_Widget_Class, True);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  VendorShell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Vendor_Shell_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Vendor_Shell_Widget_Class, Enter ("VendorShell"));
      Set_Super_Class (Xt_Motif_Vendor_Shell_Widget_Class,
                       Xt_Motif_WM_Shell_Widget_Class);
      Set_Is_Meta_Class (Xt_Motif_Vendor_Shell_Widget_Class, True);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  TransientShell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Transient_Shell_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Transient_Shell_Widget_Class,
                Enter ("TransientShell"));
      Set_Super_Class (Xt_Motif_Transient_Shell_Widget_Class,
                       Xt_Motif_Vendor_Shell_Widget_Class);
      Set_Is_Meta_Class (Xt_Motif_Transient_Shell_Widget_Class, True);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  TopLevelShell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Top_Level_Shell_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Top_Level_Shell_Widget_Class,
                Enter ("TopLevelShell"));
      Set_Super_Class (Xt_Motif_Top_Level_Shell_Widget_Class,
                       Xt_Motif_Vendor_Shell_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  ApplicationShell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Application_Shell_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Application_Shell_Widget_Class,
                Enter ("ApplicationShell"));
      Set_Super_Class (Xt_Motif_Application_Shell_Widget_Class,
                       Xt_Motif_Top_Level_Shell_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  SessionShell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Session_Shell_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Session_Shell_Widget_Class,
                Enter ("SessionShell"));
      Set_Super_Class (Xt_Motif_Session_Shell_Widget_Class,
                       Xt_Motif_Application_Shell_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      ------------------------------------------------------------------------
      --  Motif Primitives Widget Classes
      ------------------------------------------------------------------------

      --  XmPrimitive

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Primitive_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Primitive_Widget_Class, Enter ("XmPrimitive"));
      Set_Super_Class (Xt_Motif_Primitive_Widget_Class,
                       Xt_Motif_Core_Widget_Class);
      Set_Is_Meta_Class (Xt_Motif_Primitive_Widget_Class, True);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmArrowButton

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Arrow_Button_Widget_Class := Create_Widget_Class;
         Set_Name
          (Xt_Motif_Arrow_Button_Widget_Class, Enter ("XmArrowButton"));
         Set_Super_Class (Xt_Motif_Arrow_Button_Widget_Class,
                          Xt_Motif_Primitive_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowDirection"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowDirection"));
         Set_Resource_Class_Name (Resource, Enter ("XmNArrowDirection"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArrowDirection"));
         Set_Resource_Type (Resource, Xt_Motif_Arrow_Direction_Resource_Type);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Arrow_Button_Widget_Class, Resources);
      end;

      --  XmLabel

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Label_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Label_Widget_Class, Enter ("XmLabel"));
         Set_Super_Class (Xt_Motif_Label_Widget_Class,
                          Xt_Motif_Primitive_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNalignment"));
         Set_Internal_Resource_Name (Resource, Enter ("alignment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAlignment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Alignment"));
         Set_Resource_Type (Resource, Xt_Motif_Alignment_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlabelType"));
         Set_Internal_Resource_Name (Resource, Enter ("labelType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCLabelType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("LabelType"));
         Set_Resource_Type (Resource, Xt_Motif_Label_Type_Resource_Type);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Label_Widget_Class, Resources);
      end;

      --  XmCascadeButton

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Cascade_Button_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Cascade_Button_Widget_Class,
                Enter ("XmCascadeButton"));
      Set_Super_Class (Xt_Motif_Cascade_Button_Widget_Class,
                       Xt_Motif_Label_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmDrawnButton

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Drawn_Button_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Drawn_Button_Widget_Class,
                Enter ("XmDrawnButton"));
      Set_Super_Class (Xt_Motif_Drawn_Button_Widget_Class,
                       Xt_Motif_Label_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmPushButton

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Push_Button_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Push_Button_Widget_Class, Enter ("XmPushButton"));
      Set_Super_Class (Xt_Motif_Push_Button_Widget_Class,
                       Xt_Motif_Label_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmToggleButton

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Toggle_Button_Widget_Class := Create_Widget_Class;
         Set_Name
          (Xt_Motif_Toggle_Button_Widget_Class, Enter ("XmToggleButton"));
         Set_Super_Class (Xt_Motif_Toggle_Button_Widget_Class,
                          Xt_Motif_Label_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorOn"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorOn"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorOn"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorOn"));
         Set_Resource_Type
          (Resource, Xt_Motif_Toggle_Indicator_On_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorType"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorType"));
         Set_Resource_Type (Resource, Xt_Motif_Indicator_Type_Resource_Type);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Toggle_Button_Widget_Class, Resources);
      end;

      --  XmList

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_List_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_List_Widget_Class, Enter ("XmList"));
      Set_Super_Class (Xt_Motif_List_Widget_Class,
                       Xt_Motif_Primitive_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmScrollBar

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Scroll_Bar_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Scroll_Bar_Widget_Class, Enter ("XmScrollBar"));
      Set_Super_Class (Xt_Motif_Scroll_Bar_Widget_Class,
                       Xt_Motif_Primitive_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmSeparator

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Separator_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Separator_Widget_Class, Enter ("XmSeparator"));
      Set_Super_Class (Xt_Motif_Separator_Widget_Class,
                       Xt_Motif_Primitive_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmText

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Text_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Text_Widget_Class, Enter ("XmText"));
      Set_Super_Class (Xt_Motif_Text_Widget_Class,
                       Xt_Motif_Primitive_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmTextField

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Text_Field_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Text_Field_Widget_Class, Enter ("XmTextField"));
      Set_Super_Class (Xt_Motif_Text_Field_Widget_Class,
                       Xt_Motif_Primitive_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      ------------------------------------------------------------------------
      --  Motif Gadgets Widget Classes
      ------------------------------------------------------------------------

      --  XmGadget

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Gadget_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Gadget_Widget_Class, Enter ("XmGadget"));
      Set_Super_Class (Xt_Motif_Gadget_Widget_Class,
                       Xt_Motif_Rect_Obj_Widget_Class);
      Set_Is_Meta_Class (Xt_Motif_Gadget_Widget_Class, True);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmArrowButtonGadget

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Arrow_Button_Gadget_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Arrow_Button_Gadget_Widget_Class,
                   Enter ("XmArrowButtonGadget"));
         Set_Super_Class (Xt_Motif_Arrow_Button_Gadget_Widget_Class,
                          Xt_Motif_Gadget_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowDirection"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowDirection"));
         Set_Resource_Class_Name (Resource, Enter ("XmNArrowDirection"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArrowDirection"));
         Set_Resource_Type (Resource, Xt_Motif_Arrow_Direction_Resource_Type);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Arrow_Button_Gadget_Widget_Class, Resources);
      end;

      --  XmIconGadget

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Icon_Gadget_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Icon_Gadget_Widget_Class,
                   Enter ("XmIconGadget"));
         Set_Super_Class (Xt_Motif_Icon_Gadget_Widget_Class,
                          Xt_Motif_Gadget_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNalignment"));
         Set_Internal_Resource_Name (Resource, Enter ("alignment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAlignment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Alignment"));
         Set_Resource_Type (Resource, Xt_Motif_Alignment_Resource_Type);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Icon_Gadget_Widget_Class, Resources);
      end;

      --  XmLabelGadget

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Label_Gadget_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Label_Gadget_Widget_Class,
                   Enter ("XmLabelGadget"));
         Set_Super_Class (Xt_Motif_Label_Gadget_Widget_Class,
                          Xt_Motif_Gadget_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNalignment"));
         Set_Internal_Resource_Name (Resource, Enter ("alignment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAlignment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Alignment"));
         Set_Resource_Type (Resource, Xt_Motif_Alignment_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlabelType"));
         Set_Internal_Resource_Name (Resource, Enter ("labelType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCLabelType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("LabelType"));
         Set_Resource_Type (Resource, Xt_Motif_Label_Type_Resource_Type);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Label_Gadget_Widget_Class, Resources);
      end;

      --  XmCascadeButtonGadget

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Cascade_Button_Gadget_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Cascade_Button_Gadget_Widget_Class,
                Enter ("XmCascadeButtonGadget"));
      Set_Super_Class (Xt_Motif_Cascade_Button_Gadget_Widget_Class,
                       Xt_Motif_Label_Gadget_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmPushButtonGadget

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Push_Button_Gadget_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Push_Button_Gadget_Widget_Class,
                Enter ("XmPushButtonGadget"));
      Set_Super_Class (Xt_Motif_Push_Button_Gadget_Widget_Class,
                       Xt_Motif_Label_Gadget_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmToggleButtonGadget

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Toggle_Button_Gadget_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Toggle_Button_Gadget_Widget_Class,
                   Enter ("XmToggleButtonGadget"));
         Set_Super_Class (Xt_Motif_Toggle_Button_Gadget_Widget_Class,
                          Xt_Motif_Label_Gadget_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorOn"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorOn"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorOn"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorOn"));
         Set_Resource_Type
          (Resource, Xt_Motif_Toggle_Indicator_On_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorType"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorType"));
         Set_Resource_Type (Resource, Xt_Motif_Indicator_Type_Resource_Type);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Toggle_Button_Gadget_Widget_Class, Resources);
      end;

      --  XmSeparatorGadget

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Separator_Gadget_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Separator_Gadget_Widget_Class,
                Enter ("XmSeparatorGadget"));
      Set_Super_Class (Xt_Motif_Separator_Gadget_Widget_Class,
                       Xt_Motif_Gadget_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      ------------------------------------------------------------------------
      --  Motif Shells Widget Classes
      ------------------------------------------------------------------------

      --  XmDialogShell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Dialog_Shell_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Dialog_Shell_Widget_Class, Enter ("XmDialogShell"));
      Set_Super_Class (Xt_Motif_Dialog_Shell_Widget_Class,
                       Xt_Motif_Transient_Shell_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      ------------------------------------------------------------------------
      --  Motif Managers Widget Classes
      ------------------------------------------------------------------------

      --  XmManager

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Manager_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Manager_Widget_Class, Enter ("XmManager"));
      Set_Super_Class (Xt_Motif_Manager_Widget_Class,
                       Xt_Motif_Constraint_Widget_Class);
      Set_Is_Meta_Class (Xt_Motif_Manager_Widget_Class, True);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmBulletinBoard

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Bulletin_Board_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Bulletin_Board_Widget_Class,
                Enter ("XmBulletinBoard"));
      Set_Super_Class (Xt_Motif_Bulletin_Board_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmForm

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Form_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Form_Widget_Class, Enter ("XmForm"));
      Set_Super_Class (Xt_Motif_Form_Widget_Class,
                       Xt_Motif_Bulletin_Board_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmMessageBox

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Message_Box_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Message_Box_Widget_Class, Enter ("XmMessageBox"));
      Set_Super_Class (Xt_Motif_Message_Box_Widget_Class,
                       Xt_Motif_Bulletin_Board_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmSelectionBox

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Selection_Box_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Selection_Box_Widget_Class, Enter ("XmSelectionBox"));
      Set_Super_Class (Xt_Motif_Selection_Box_Widget_Class,
                       Xt_Motif_Bulletin_Board_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmCommand

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Command_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Command_Widget_Class, Enter ("XmCommand"));
      Set_Super_Class (Xt_Motif_Command_Widget_Class,
                       Xt_Motif_Selection_Box_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmFileSelectionBox

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_File_Selection_Box_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_File_Selection_Box_Widget_Class,
                Enter ("XmFileSelectionBox"));
      Set_Super_Class (Xt_Motif_File_Selection_Box_Widget_Class,
                       Xt_Motif_Selection_Box_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmComboBox

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Combo_Box_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Combo_Box_Widget_Class, Enter ("XmComboBox"));
      Set_Super_Class (Xt_Motif_Combo_Box_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmContainer

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Container_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Container_Widget_Class, Enter ("XmContainer"));
      Set_Super_Class (Xt_Motif_Container_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmDrawingArea

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Drawing_Area_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Drawing_Area_Widget_Class, Enter ("XmDrawingArea"));
      Set_Super_Class (Xt_Motif_Drawing_Area_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmFrame

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Frame_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Frame_Widget_Class, Enter ("XmFrame"));
      Set_Super_Class (Xt_Motif_Frame_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmNotebook

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Notebook_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Notebook_Widget_Class, Enter ("XmNotebook"));
      Set_Super_Class (Xt_Motif_Notebook_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmPanedWindow

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Paned_Window_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Paned_Window_Widget_Class, Enter ("XmPanedWindow"));
      Set_Super_Class (Xt_Motif_Paned_Window_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmRowColumn

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Row_Column_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Row_Column_Widget_Class, Enter ("XmRowColumn"));
      Set_Super_Class (Xt_Motif_Row_Column_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmScale

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Scale_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Scale_Widget_Class, Enter ("XmScale"));
      Set_Super_Class (Xt_Motif_Scale_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmScrolledWindow

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Scrolled_Window_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Scrolled_Window_Widget_Class,
                Enter ("XmScrolledWindow"));
      Set_Super_Class (Xt_Motif_Scrolled_Window_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmMainWindow

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Main_Window_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Main_Window_Widget_Class,
                Enter ("XmMainWindow"));
      Set_Super_Class (Xt_Motif_Main_Window_Widget_Class,
                       Xt_Motif_Scrolled_Window_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmSimpleSpinBox

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Simple_Spin_Box_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Simple_Spin_Box_Widget_Class,
                Enter ("XmSimpleSpinBox"));
      Set_Super_Class (Xt_Motif_Simple_Spin_Box_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      --  XmSpinBox

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
--      begin
      Xt_Motif_Spin_Box_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Spin_Box_Widget_Class, Enter ("XmSpinBox"));
      Set_Super_Class (Xt_Motif_Spin_Box_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--      end;

      ------------------------------------------------------------------------
      --  Motif Specialized Widget Classes
      ------------------------------------------------------------------------

      --  Формирование обобщенного списка классов виджетов.

      --  Классы заносятся в список в алфавитном порядке для устранения
      --  необходимости их сортировке в дизайнере.

      Append (Classes, Xt_Motif_Application_Shell_Widget_Class);
      Append (Classes, Xt_Motif_Composite_Widget_Class);
      Append (Classes, Xt_Motif_Constraint_Widget_Class);
      Append (Classes, Xt_Motif_Core_Widget_Class);
      Append (Classes, Xt_Motif_Object_Widget_Class);
      Append (Classes, Xt_Motif_Override_Shell_Widget_Class);
      Append (Classes, Xt_Motif_Rect_Obj_Widget_Class);
      Append (Classes, Xt_Motif_Session_Shell_Widget_Class);
      Append (Classes, Xt_Motif_Shell_Widget_Class);
      Append (Classes, Xt_Motif_Top_Level_Shell_Widget_Class);
      Append (Classes, Xt_Motif_Transient_Shell_Widget_Class);
      Append (Classes, Xt_Motif_Vendor_Shell_Widget_Class);
      Append (Classes, Xt_Motif_WM_Shell_Widget_Class);

      Append (Classes, Xt_Motif_Arrow_Button_Widget_Class);
      Append (Classes, Xt_Motif_Arrow_Button_Gadget_Widget_Class);
      Append (Classes, Xt_Motif_Bulletin_Board_Widget_Class);
--      Append (Classes, Xt_Motif_Bulletin_Board_Dialog_Widget_Class);
      Append (Classes, Xt_Motif_Cascade_Button_Widget_Class);
      Append (Classes, Xt_Motif_Cascade_Button_Gadget_Widget_Class);
      Append (Classes, Xt_Motif_Combo_Box_Widget_Class);
      Append (Classes, Xt_Motif_Command_Widget_Class);
      Append (Classes, Xt_Motif_Container_Widget_Class);
      Append (Classes, Xt_Motif_Dialog_Shell_Widget_Class);
      Append (Classes, Xt_Motif_Drawing_Area_Widget_Class);
      Append (Classes, Xt_Motif_Drawn_Button_Widget_Class);
--      Append (Classes, Xt_Motif_Error_Dialog_Widget_Class);
      Append (Classes, Xt_Motif_File_Selection_Box_Widget_Class);
--      Append (Classes, Xt_Motif_File_Selection_Dialog_Widget_Class);
      Append (Classes, Xt_Motif_Form_Widget_Class);
--      Append (Classes, Xt_Motif_Form_Dialog_Widget_Class);
      Append (Classes, Xt_Motif_Frame_Widget_Class);
      Append (Classes, Xt_Motif_Icon_Gadget_Widget_Class);
--      Append (Classes, Xt_Motif_Information_Dialog_Widget_Class);
      Append (Classes, Xt_Motif_Gadget_Widget_Class);
      Append (Classes, Xt_Motif_Label_Widget_Class);
      Append (Classes, Xt_Motif_Label_Gadget_Widget_Class);
      Append (Classes, Xt_Motif_List_Widget_Class);
      Append (Classes, Xt_Motif_Main_Window_Widget_Class);
      Append (Classes, Xt_Motif_Manager_Widget_Class);
      Append (Classes, Xt_Motif_Message_Box_Widget_Class);
--      Append (Classes, Xt_Motif_Message_Dialog_Widget_Class);
      Append (Classes, Xt_Motif_Notebook_Widget_Class);
      Append (Classes, Xt_Motif_Paned_Window_Widget_Class);
      Append (Classes, Xt_Motif_Primitive_Widget_Class);
      Append (Classes, Xt_Motif_Push_Button_Widget_Class);
      Append (Classes, Xt_Motif_Push_Button_Gadget_Widget_Class);
--      Append (Classes, Xt_Motif_Question_Dialog_Widget_Class);
      Append (Classes, Xt_Motif_Row_Column_Widget_Class);
      Append (Classes, Xt_Motif_Scale_Widget_Class);
      Append (Classes, Xt_Motif_Scroll_Bar_Widget_Class);
--      Append (Classes, Xt_Motif_Scrolled_List_Widget_Class);
--      Append (Classes, Xt_Motif_Scrolled_Text_Widget_Class);
      Append (Classes, Xt_Motif_Scrolled_Window_Widget_Class);
      Append (Classes, Xt_Motif_Selection_Box_Widget_Class);
--      Append (Classes, Xt_Motif_Selection_Dialog_Widget_Class);
      Append (Classes, Xt_Motif_Separator_Widget_Class);
      Append (Classes, Xt_Motif_Separator_Gadget_Widget_Class);
      Append (Classes, Xt_Motif_Simple_Spin_Box_Widget_Class);
      Append (Classes, Xt_Motif_Spin_Box_Widget_Class);
--      Append (Classes, Xt_Motif_Template_Dialog_Widget_Class);
      Append (Classes, Xt_Motif_Text_Widget_Class);
      Append (Classes, Xt_Motif_Text_Field_Widget_Class);
      Append (Classes, Xt_Motif_Toggle_Button_Widget_Class);
      Append (Classes, Xt_Motif_Toggle_Button_Gadget_Widget_Class);
--      Append (Classes, Xt_Motif_Warning_Dialog_Widget_Class);
--      Append (Classes, Xt_Motif_Working_Dialog_Widget_Class);
--      Append (Classes, );
   end Create_Widget_Classes;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize is
   begin
      Types := New_List;
      Classes := New_List;

      Create_Enumerated_Resource_Types;
      Create_Widget_Classes;

      Xt_Motif_Widget_Set := Create_Widget_Set;
      Set_Resource_Types (Xt_Motif_Widget_Set, Types);
      Set_Widget_Classes (Xt_Motif_Widget_Set, Classes);
   end Initialize;

end Model.Initialization;
