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
--! <Unit> Model.Initialization
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model.Names;
with Model.Queries;
with Model.Strings;
with Model.Tree.Constructors;
with Model.Tree.Lists;
with Model.Xt_Motif;

package body Model.Initialization is

   use Model;
   use Model.Names;
   use Model.Queries;
   use Model.Tree;
   use Model.Tree.Lists;
   use Model.Tree.Constructors;
   use Model.Xt_Motif;

   procedure Create_Predefined_Resource_Types;

   procedure Create_Enumerated_Resource_Types;

   procedure Create_Renditions_Resources;

   procedure Create_Widget_Classes;

   --  Типы ресурсов

   Types   : List_Id;
   Classes : List_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Enumerated_Resource_Types
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Enumerated_Resource_Types is
      Xt_Motif_Keyboard_Focus_Policy_Resource_Type      : Node_Id;
      Xt_Motif_Position_Type_Resource_Type              : Node_Id;
      Xt_Motif_Selection_Policy_Resource_Type           : Node_Id;
      Xt_Motif_Selection_Technique_Resource_Type        : Node_Id;
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

      --  Boolean

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("FALSE"));
         Set_Internal_Name (Value, Enter ("FALSE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("TRUE"));
         Set_Internal_Name (Value, Enter ("TRUE"));
         Append (Values, Value);

         Xt_Motif_Boolean_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Boolean_Resource_Type, Enter ("XtRBoolean"));
         Set_Internal_Name
          (Xt_Motif_Boolean_Resource_Type, Enter ("Boolean"));
         Set_Value_Specifications
          (Xt_Motif_Boolean_Resource_Type, Values);
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

      --  FontType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmFONT_IS_FONT"));
         Set_Internal_Name (Value, Enter ("FONT_IS_FONT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmFONT_IS_FONTSET"));
         Set_Internal_Name (Value, Enter ("FONT_IS_FONTSET"));
         Append (Values, Value);

--         Value := Create_Enumeration_Value_Specification;
--         Set_Name (Value, Enter ("XmAS_IS"));
--         Set_Internal_Name (Value, Enter ("AS_IS"));
--         Append (Values, Value);

         Xt_Motif_Font_Type_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name (Xt_Motif_Font_Type_Resource_Type, Enter ("XmRFontType"));
         Set_Internal_Name
          (Xt_Motif_Font_Type_Resource_Type, Enter ("FontType"));
         Set_Value_Specifications (Xt_Motif_Font_Type_Resource_Type, Values);
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

      --  Gravity

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("FORGET"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("NORTHWEST"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("NORTH"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("NORTHEAST"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("WEST"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("CENTER"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("EAST"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("SOUTHWEST"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("SOUTH"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("SOUTHEAST"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("STATIC"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("UNMAP"));
         Append (Values, Value);

         Xt_Motif_Gravity_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Gravity_Resource_Type, Enter ("XtRGravity"));
         Set_Internal_Name
          (Xt_Motif_Gravity_Resource_Type, Enter ("Gravity"));
         Set_Value_Specifications
          (Xt_Motif_Gravity_Resource_Type, Values);
      end;

      --  StrikethruType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNO_LINE"));
         Set_Internal_Name (Value, Enter ("NO_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSINGLE_LINE"));
         Set_Internal_Name (Value, Enter ("SINGLE_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDOUBLE_LINE"));
         Set_Internal_Name (Value, Enter ("DOUBLE_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSINGLE_DASHED_LINE"));
         Set_Internal_Name (Value, Enter ("SINGLE_DASHED_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDOUBLE_DASHED_LINE"));
         Set_Internal_Name (Value, Enter ("DOUBLE_DASHED_LINE"));
         Append (Values, Value);

--         Value := Create_Enumeration_Value_Specification;
--         Set_Name (Value, Enter ("XmAS_IS"));
--         Set_Internal_Name (Value, Enter ("AS_IS"));
--         Append (Values, Value);

         Xt_Motif_Strikethru_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Strikethru_Type_Resource_Type,
           Enter ("XmRStrikethruType"));
         Set_Internal_Name
          (Xt_Motif_Strikethru_Type_Resource_Type, Enter ("StrikethruType"));
         Set_Value_Specifications
          (Xt_Motif_Strikethru_Type_Resource_Type, Values);
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

      --  InitialState

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("NormalState"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter (""));
         Set_Internal_Name (Value, Enter ("IconicState"));
         Append (Values, Value);

         Xt_Motif_Initial_State_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Initial_State_Resource_Type, Enter ("XtRInitialState"));
         Set_Internal_Name
          (Xt_Motif_Initial_State_Resource_Type, Enter ("InitialState"));
         Set_Value_Specifications
          (Xt_Motif_Initial_State_Resource_Type, Values);
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

      --  LoadModel

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmLOAD_IMMEDIATE"));
         Set_Internal_Name (Value, Enter ("LOAD_IMMEDIATE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmLOAD_DEFERRED"));
         Set_Internal_Name (Value, Enter ("LOAD_DEFERRED"));
         Append (Values, Value);

 --        Value := Create_Enumeration_Value_Specification;
 --        Set_Name (Value, Enter ("XmAS_IS"));
 --        Set_Internal_Name (Value, Enter ("AS_IS"));
 --        Append (Values, Value);

         Xt_Motif_Load_Model_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Load_Model_Resource_Type, Enter ("XmRLoadModel"));
         Set_Internal_Name
          (Xt_Motif_Load_Model_Resource_Type, Enter ("LoadModel"));
         Set_Value_Specifications
          (Xt_Motif_Load_Model_Resource_Type, Values);
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

      --  PositionType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPOSITION_INDEX"));
         Set_Internal_Name (Value, Enter ("POSITION_INDEX"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPOSITION_VALUE"));
         Set_Internal_Name (Value, Enter ("POSITION_VALUE"));
         Append (Values, Value);

         Xt_Motif_Position_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Position_Type_Resource_Type, Enter ("XmRPositionType"));
         Set_Internal_Name
          (Xt_Motif_Position_Type_Resource_Type, Enter ("PositionType"));
         Set_Value_Specifications
          (Xt_Motif_Position_Type_Resource_Type, Values);
      end;

      --  PrimaryOwnership

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmOWN_NEVER"));
         Set_Internal_Name (Value, Enter ("OWN_NEVER"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmOWN_ALWAYS"));
         Set_Internal_Name (Value, Enter ("OWN_ALWAYS"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmOWN_MULTIPLE"));
         Set_Internal_Name (Value, Enter ("OWN_MULTIPLE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmOWN_POSSIBLE_MULTIPLE"));
         Set_Internal_Name (Value, Enter ("OWN_POSSIBLE_MULTIPLE"));
         Append (Values, Value);

         Xt_Motif_Primary_Ownership_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Primary_Ownership_Resource_Type,
           Enter ("XmRPrimaryOwnership"));
         Set_Internal_Name
          (Xt_Motif_Primary_Ownership_Resource_Type,
           Enter ("PrimaryOwnership"));
         Set_Value_Specifications
          (Xt_Motif_Primary_Ownership_Resource_Type, Values);
      end;

      --  ProcessingDirection

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMAX_ON_TOP"));
         Set_Internal_Name (Value, Enter ("MAX_ON_TOP"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMAX_ON_BOTTOM"));
         Set_Internal_Name (Value, Enter ("MAX_ON_BOTTOM"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMAX_ON_LEFT"));
         Set_Internal_Name (Value, Enter ("MAX_ON_LEFT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMAX_ON_RIGHT"));
         Set_Internal_Name (Value, Enter ("MAX_ON_RIGHT"));
         Append (Values, Value);

         Xt_Motif_Processing_Direction_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Processing_Direction_Resource_Type,
           Enter ("XmRProcessingDirection"));
         Set_Internal_Name
          (Xt_Motif_Processing_Direction_Resource_Type,
           Enter ("ProcessingDirection"));
         Set_Value_Specifications
          (Xt_Motif_Processing_Direction_Resource_Type, Values);
      end;

      --  ResizePolicy

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmRESIZE_NONE"));
         Set_Internal_Name (Value, Enter ("RESIZE_NONE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmRESIZE_ANY"));
         Set_Internal_Name (Value, Enter ("RESIZE_ANY"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmRESIZE_GROW"));
         Set_Internal_Name (Value, Enter ("RESIZE_GROW"));
         Append (Values, Value);

         Xt_Motif_Resize_Policy_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Resize_Policy_Resource_Type, Enter ("XmRResizePolicy"));
         Set_Internal_Name
          (Xt_Motif_Resize_Policy_Resource_Type, Enter ("ResizePolicy"));
         Set_Value_Specifications
          (Xt_Motif_Resize_Policy_Resource_Type, Values);
      end;

      --  RowColumnType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmWORK_AREA"));
         Set_Internal_Name (Value, Enter ("WORK_AREA"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMENU_BAR"));
         Set_Internal_Name (Value, Enter ("MENU_BAR"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMENU_PULLDOWN"));
         Set_Internal_Name (Value, Enter ("MENU_PULLDOWN"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMENU_POPUP"));
         Set_Internal_Name (Value, Enter ("MENU_POPUP"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMENU_OPTION"));
         Set_Internal_Name (Value, Enter ("MENU_OPTION"));
         Append (Values, Value);

         Xt_Motif_Row_Column_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Row_Column_Type_Resource_Type, Enter ("XmRRowColumnType"));
         Set_Internal_Name
          (Xt_Motif_Row_Column_Type_Resource_Type, Enter ("RowColumnType"));
         Set_Value_Specifications
          (Xt_Motif_Row_Column_Type_Resource_Type, Values);
      end;

      --  ScrollBarDisplayPolicy

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmAS_NEEDED"));
         Set_Internal_Name (Value, Enter ("AS_NEEDED"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSTATIC"));
         Set_Internal_Name (Value, Enter ("STATIC"));
         Append (Values, Value);

         Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type,
           Enter ("XmRScrollBarDisplayPolicy"));
         Set_Internal_Name
          (Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type,
           Enter ("ScrollBarDisplayPolicy"));
         Set_Value_Specifications
          (Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type, Values);
      end;

      --  ScrollBarPlacement

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmTOP_LEFT"));
         Set_Internal_Name (Value, Enter ("TOP_LEFT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmBOTTOM_LEFT"));
         Set_Internal_Name (Value, Enter ("BOTTOM_LEFT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmTOP_RIGHT"));
         Set_Internal_Name (Value, Enter ("TOP_RIGHT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmBOTTOM_RIGHT"));
         Set_Internal_Name (Value, Enter ("BOTTOM_RIGHT"));
         Append (Values, Value);

         Xt_Motif_Scroll_Bar_Placement_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Scroll_Bar_Placement_Resource_Type,
           Enter ("XmRScrollBarPlacement"));
         Set_Internal_Name
          (Xt_Motif_Scroll_Bar_Placement_Resource_Type,
           Enter ("ScrollBarPlacement"));
         Set_Value_Specifications
          (Xt_Motif_Scroll_Bar_Placement_Resource_Type, Values);
      end;

      --  ScrolledWindowChildType
      --  XXX XmMENU_BAR, XmCOMMAND_WINDOW и XmMESSAGE_WINDOW могут задаваться
      --  только для XmMainWindow.

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmWORK_AREA"));
         Set_Internal_Name (Value, Enter ("WORK_AREA"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMENU_BAR"));
         Set_Internal_Name (Value, Enter ("MENU_BAR"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmHOR_SCROLLBAR"));
         Set_Internal_Name (Value, Enter ("HOR_SCROLLBAR"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmVERT_SCROLLBAR"));
         Set_Internal_Name (Value, Enter ("VERT_SCROLLBAR"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmCOMMAND_WINDOW"));
         Set_Internal_Name (Value, Enter ("COMMAND_WINDOW"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSEPARATOR"));
         Set_Internal_Name (Value, Enter ("SEPARATOR"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMESSAGE_WINDOW"));
         Set_Internal_Name (Value, Enter ("MESSAGE_WINDOW"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSCROLL_HOR"));
         Set_Internal_Name (Value, Enter ("SCROLL_HOR"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSCROLL_VERT"));
         Set_Internal_Name (Value, Enter ("SCROLL_VERT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNO_SCROLL"));
         Set_Internal_Name (Value, Enter ("NO_SCROLL"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmCLIP_WINDOW"));
         Set_Internal_Name (Value, Enter ("CLIP_WINDOW"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmGENERIC_CHILD"));
         Set_Internal_Name (Value, Enter ("GENERIC_CHILD"));
         Append (Values, Value);

         Xt_Motif_Scrolled_Window_Child_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Scrolled_Window_Child_Type_Resource_Type,
           Enter ("XmRScrolledWindowChildType"));
         Set_Internal_Name
          (Xt_Motif_Scrolled_Window_Child_Type_Resource_Type,
           Enter ("ScrolledWindowChildType"));
         Set_Value_Specifications
          (Xt_Motif_Scrolled_Window_Child_Type_Resource_Type, Values);
      end;

      --  ScrollingPolicy

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmAUTOMATIC"));
         Set_Internal_Name (Value, Enter ("AUTOMATIC"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmAPPLICATION_DEFINED"));
         Set_Internal_Name (Value, Enter ("APPLICATION_DEFINED"));
         Append (Values, Value);

         Xt_Motif_Scrolling_Policy_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Scrolling_Policy_Resource_Type,
           Enter ("XmRScrollingPolicy"));
         Set_Internal_Name
          (Xt_Motif_Scrolling_Policy_Resource_Type, Enter ("ScrollingPolicy"));
         Set_Value_Specifications
          (Xt_Motif_Scrolling_Policy_Resource_Type, Values);
      end;

      --  SelectionPolicy

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSINGLE_SELECT"));
         Set_Internal_Name (Value, Enter ("SINGLE_SELECT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMULTIPLE_SELECT"));
         Set_Internal_Name (Value, Enter ("MULTIPLE_SELECT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmEXTENDED_SELECT"));
         Set_Internal_Name (Value, Enter ("EXTENDED_SELECT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmBROWSE_SELECT"));
         Set_Internal_Name (Value, Enter ("EXTENDED_SELECT"));
         Append (Values, Value);

         Xt_Motif_Selection_Policy_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Selection_Policy_Resource_Type,
           Enter ("XmRSelectionPolicy"));
         Set_Internal_Name
          (Xt_Motif_Selection_Policy_Resource_Type, Enter ("SelectionPolicy"));
         Set_Value_Specifications
          (Xt_Motif_Selection_Policy_Resource_Type, Values);
      end;

      --  SelectionTechnique

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMARQUEE"));
         Set_Internal_Name (Value, Enter ("MARQUEE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMARQUEE_EXTEND_START"));
         Set_Internal_Name (Value, Enter ("MARQUEE_EXTEND_START"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMARQUEE_EXTEND_BOTH"));
         Set_Internal_Name (Value, Enter ("MARQUEE_EXTEND_BOTH"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmTOUCH_ONLY"));
         Set_Internal_Name (Value, Enter ("TOUCH_ONLY"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmTOUCH_OVER"));
         Set_Internal_Name (Value, Enter ("TOUCH_OVER"));
         Append (Values, Value);

         Xt_Motif_Selection_Technique_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Selection_Technique_Resource_Type,
           Enter ("XmRSelectionTechnique"));
         Set_Internal_Name
          (Xt_Motif_Selection_Technique_Resource_Type,
           Enter ("SelectionTechnique"));
         Set_Value_Specifications
          (Xt_Motif_Selection_Technique_Resource_Type, Values);
      end;

      --  SeparatorType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNO_LINE"));
         Set_Internal_Name (Value, Enter ("NO_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSINGLE_LINE"));
         Set_Internal_Name (Value, Enter ("SINGLE_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDOUBLE_LINE"));
         Set_Internal_Name (Value, Enter ("DOUBLE_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSINGLE_DASHED_LINE"));
         Set_Internal_Name (Value, Enter ("SINGLE_DASHED_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDOUBLE_DASHED_LINE"));
         Set_Internal_Name (Value, Enter ("DOUBLE_DASHED_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSHADOW_ETCHED_IN"));
         Set_Internal_Name (Value, Enter ("SHADOW_ETCHED_IN"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSHADOW_ETCHED_OUT"));
         Set_Internal_Name (Value, Enter ("SHADOW_ETCHED_OUT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSHADOW_ETCHED_IN_DASH"));
         Set_Internal_Name (Value, Enter ("SHADOW_ETCHED_IN_DASH"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSHADOW_ETCHED_OUT_DASH"));
         Set_Internal_Name (Value, Enter ("SHADOW_ETCHED_OUT_DASH"));
         Append (Values, Value);

         Xt_Motif_Separator_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Separator_Type_Resource_Type, Enter ("XmRSeparatorType"));
         Set_Internal_Name
          (Xt_Motif_Separator_Type_Resource_Type, Enter ("SeparatorType"));
         Set_Value_Specifications
          (Xt_Motif_Separator_Type_Resource_Type, Values);
      end;

      --  ShadowType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSHADOW_IN"));
         Set_Internal_Name (Value, Enter ("SHADOW_IN"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSHADOW_OUT"));
         Set_Internal_Name (Value, Enter ("SHADOW_OUT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSHADOW_ETCHED_IN"));
         Set_Internal_Name (Value, Enter ("SHADOW_ETCHED_IN"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSHADOW_ETCHED_OUT"));
         Set_Internal_Name (Value, Enter ("SHADOW_ETCHED_OUT"));
         Append (Values, Value);

         Xt_Motif_Shadow_Type_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Shadow_Type_Resource_Type, Enter ("XmRShadowType"));
         Set_Internal_Name
          (Xt_Motif_Shadow_Type_Resource_Type, Enter ("ShadowType"));
         Set_Value_Specifications
          (Xt_Motif_Shadow_Type_Resource_Type, Values);
      end;

      --  ShowArrows
      --  XXX Необходимо проверить, что XmNONE и XmEACH_SIDE реально указаны
      --  в Xm.h.

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNONE"));
         Set_Internal_Name (Value, Enter ("NONE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmEACH_SIDE"));
         Set_Internal_Name (Value, Enter ("EACH_SIDE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMAX_SIDE"));
         Set_Internal_Name (Value, Enter ("MAX_SIDE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmMIN_SIDE"));
         Set_Internal_Name (Value, Enter ("MIN_SIDE"));
         Append (Values, Value);

         Xt_Motif_Show_Arrows_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Show_Arrows_Resource_Type, Enter ("XmRShowArrows"));
         Set_Internal_Name
          (Xt_Motif_Show_Arrows_Resource_Type, Enter ("ShowArrows"));
         Set_Value_Specifications
          (Xt_Motif_Show_Arrows_Resource_Type, Values);
      end;

      --  ShowValue

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNONE"));
         Set_Internal_Name (Value, Enter ("NONE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNEAR_SLIDER"));
         Set_Internal_Name (Value, Enter ("NEAR_SLIDER"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNEAR_BORDER"));
         Set_Internal_Name (Value, Enter ("NEAR_BORDER"));
         Append (Values, Value);

         Xt_Motif_Show_Value_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Show_Value_Resource_Type, Enter ("XmRShowValue"));
         Set_Internal_Name
          (Xt_Motif_Show_Value_Resource_Type, Enter ("ShowValue"));
         Set_Value_Specifications
          (Xt_Motif_Show_Value_Resource_Type, Values);
      end;

      --  SliderMark

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNONE"));
         Set_Internal_Name (Value, Enter ("NONE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmETCHED_LINE"));
         Set_Internal_Name (Value, Enter ("ETCHED_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmTHUMB_MARK"));
         Set_Internal_Name (Value, Enter ("THUMB_MARK"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmROUND_MARK"));
         Set_Internal_Name (Value, Enter ("ROUND_MARK"));
         Append (Values, Value);

         Xt_Motif_Slider_Mark_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Slider_Mark_Resource_Type, Enter ("XmRSliderMark"));
         Set_Internal_Name
          (Xt_Motif_Slider_Mark_Resource_Type, Enter ("SliderMark"));
         Set_Value_Specifications
          (Xt_Motif_Slider_Mark_Resource_Type, Values);
      end;

      --  UnderlineType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmNO_LINE"));
         Set_Internal_Name (Value, Enter ("NO_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSINGLE_LINE"));
         Set_Internal_Name (Value, Enter ("SINGLE_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDOUBLE_LINE"));
         Set_Internal_Name (Value, Enter ("DOUBLE_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSINGLE_DASHED_LINE"));
         Set_Internal_Name (Value, Enter ("SINGLE_DASHED_LINE"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmDOUBLE_DASHED_LINE"));
         Set_Internal_Name (Value, Enter ("DOUBLE_DASHED_LINE"));
         Append (Values, Value);

--         Value := Create_Enumeration_Value_Specification;
--         Set_Name (Value, Enter ("XmAS_IS"));
--         Set_Internal_Name (Value, Enter ("AS_IS"));
--         Append (Values, Value);

         Xt_Motif_Underline_Type_Resource_Type :=
           Create_Enumerated_Resource_Type;
         Set_Name
          (Xt_Motif_Underline_Type_Resource_Type,
           Enter ("XmRUnderlineType"));
         Set_Internal_Name
          (Xt_Motif_Underline_Type_Resource_Type, Enter ("UnderlineType"));
         Set_Value_Specifications
          (Xt_Motif_Underline_Type_Resource_Type, Values);
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
      Append (Types, Xt_Motif_Boolean_Resource_Type);
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
      Append (Types, Xt_Motif_Gravity_Resource_Type);
      Append (Types, Xt_Motif_Toggle_Indicator_On_Resource_Type);  --  ???
      Append (Types, Xt_Motif_Indicator_Type_Resource_Type);
      Append (Types, Xt_Motif_Initial_State_Resource_Type);
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
      Append (Types, Xt_Motif_Position_Type_Resource_Type);
      Append (Types, Xt_Motif_Primary_Ownership_Resource_Type);
      Append (Types, Xt_Motif_Processing_Direction_Resource_Type);
      Append (Types, Xt_Motif_Resize_Policy_Resource_Type);
      Append (Types, Xt_Motif_Row_Column_Type_Resource_Type);
      Append (Types, Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type);
      Append (Types, Xt_Motif_Scroll_Bar_Placement_Resource_Type);
      Append (Types, Xt_Motif_Scrolled_Window_Child_Type_Resource_Type);
      Append (Types, Xt_Motif_Scrolling_Policy_Resource_Type);
      Append (Types, Xt_Motif_Selection_Policy_Resource_Type);
      Append (Types, Xt_Motif_Selection_Technique_Resource_Type);
      Append (Types, Xt_Motif_Separator_Type_Resource_Type);
      Append (Types, Xt_Motif_Shadow_Type_Resource_Type);
      Append (Types, Xt_Motif_Show_Arrows_Resource_Type);
      Append (Types, Xt_Motif_Show_Value_Resource_Type);
      Append (Types, Xt_Motif_Slider_Mark_Resource_Type);
--      Append (Types, );
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
   --!    <Unit> Create_Predefined_Resource_Types
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Predefined_Resource_Types is
   begin
      ------------------------------------------------------------------------
      --  X Toolkit Intrinsics Resource Types
      ------------------------------------------------------------------------

      --  Standard C short type

      Xt_Motif_C_Short_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name (Xt_Motif_C_Short_Resource_Type, Enter ("XtRShort"));
      Set_Internal_Name (Xt_Motif_C_Short_Resource_Type, Enter ("Short"));
      Set_Type_Kind (Xt_Motif_C_Short_Resource_Type, Type_C_Short);

      --  Standard C int type

      Xt_Motif_C_Int_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name (Xt_Motif_C_Int_Resource_Type, Enter ("XtRInt"));
      Set_Internal_Name (Xt_Motif_C_Int_Resource_Type, Enter ("Int"));
      Set_Type_Kind (Xt_Motif_C_Int_Resource_Type, Type_C_Int);

      --  Position

      Xt_Motif_Position_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name (Xt_Motif_Position_Resource_Type, Enter ("XtRPosition"));
      Set_Internal_Name (Xt_Motif_Position_Resource_Type, Enter ("Position"));
      Set_Type_Kind (Xt_Motif_Position_Resource_Type, Type_Position);

      --  Dimension

      Xt_Motif_Dimension_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name (Xt_Motif_Dimension_Resource_Type, Enter ("XtRDimension"));
      Set_Internal_Name
       (Xt_Motif_Dimension_Resource_Type, Enter ("Dimension"));
      Set_Type_Kind (Xt_Motif_Dimension_Resource_Type, Type_Dimension);

      --  Pixel

      Xt_Motif_Pixel_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name (Xt_Motif_Pixel_Resource_Type, Enter ("XtRPixel"));
      Set_Internal_Name (Xt_Motif_Pixel_Resource_Type, Enter ("Pixel"));
      Set_Type_Kind (Xt_Motif_Pixel_Resource_Type, Type_Pixel);

      --  Pixmap

      Xt_Motif_Pixmap_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name (Xt_Motif_Pixmap_Resource_Type, Enter ("XtRPixmap"));
      Set_Internal_Name (Xt_Motif_Pixmap_Resource_Type, Enter ("Pixmap"));
      Set_Type_Kind (Xt_Motif_Pixmap_Resource_Type, Type_Pixmap);

      --  Screen

      Xt_Motif_Screen_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name (Xt_Motif_Screen_Resource_Type, Enter ("XtRScreen"));
      Set_Internal_Name (Xt_Motif_Screen_Resource_Type, Enter ("Screen"));
      Set_Type_Kind (Xt_Motif_Screen_Resource_Type, Type_Screen);

      --  Colormap

      Xt_Motif_Colormap_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name (Xt_Motif_Colormap_Resource_Type, Enter ("XtRColormap"));
      Set_Internal_Name (Xt_Motif_Colormap_Resource_Type, Enter ("Colormap"));
      Set_Type_Kind (Xt_Motif_Colormap_Resource_Type, Type_Colormap);

      --  XtAcceleratorTable

      Xt_Motif_Accelerator_Table_Resource_Type :=
        Create_Predefined_Resource_Type;
      Set_Name
       (Xt_Motif_Accelerator_Table_Resource_Type,
        Enter ("XtRAcceleratorTable"));
      Set_Internal_Name
       (Xt_Motif_Accelerator_Table_Resource_Type, Enter ("AcceleratorTable"));
      Set_Type_Kind
       (Xt_Motif_Accelerator_Table_Resource_Type, Type_Translation_Data);

      --  XtTranslationTable

      Xt_Motif_Translation_Table_Resource_Type :=
        Create_Predefined_Resource_Type;
      Set_Name
       (Xt_Motif_Translation_Table_Resource_Type,
        Enter ("XtRTranslationTable"));
      Set_Internal_Name
       (Xt_Motif_Translation_Table_Resource_Type, Enter ("TranslationTable"));
      Set_Type_Kind
       (Xt_Motif_Translation_Table_Resource_Type, Type_Translation_Data);

      --  Widget reference

      Xt_Motif_Widget_Reference_Resource_Type :=
        Create_Widget_Reference_Resource_Type;
      Set_Name (Xt_Motif_Widget_Reference_Resource_Type, Enter ("XmRWidget"));
      Set_Internal_Name
       (Xt_Motif_Widget_Reference_Resource_Type, Enter ("Widget"));

      ------------------------------------------------------------------------
      --  Motif Resource Types
      ------------------------------------------------------------------------

      --  HorizontalDimension

      Xt_Motif_Horizontal_Dimension_Resource_Type :=
        Create_Predefined_Resource_Type;
      Set_Name
       (Xt_Motif_Horizontal_Dimension_Resource_Type,
        Enter ("XmRHorizontalDimension"));
      Set_Internal_Name
       (Xt_Motif_Horizontal_Dimension_Resource_Type,
        Enter ("HorizontalDimension"));
      Set_Type_Kind
       (Xt_Motif_Horizontal_Dimension_Resource_Type, Type_Dimension);

      --  HorizontalInt

      Xt_Motif_Horizontal_Int_Resource_Type :=
        Create_Predefined_Resource_Type;
      Set_Name
       (Xt_Motif_Horizontal_Int_Resource_Type, Enter ("XmRHorizontalInt"));
      Set_Internal_Name
       (Xt_Motif_Horizontal_Int_Resource_Type, Enter ("HorizontalInt"));
      Set_Type_Kind (Xt_Motif_Horizontal_Int_Resource_Type, Type_C_Int);

      --  HorizontalPosition

      Xt_Motif_Horizontal_Position_Resource_Type :=
        Create_Predefined_Resource_Type;
      Set_Name
       (Xt_Motif_Horizontal_Position_Resource_Type,
        Enter ("XmRHorizontalPosition"));
      Set_Internal_Name
       (Xt_Motif_Horizontal_Position_Resource_Type,
        Enter ("HorizontalPosition"));
      Set_Type_Kind
       (Xt_Motif_Horizontal_Position_Resource_Type, Type_Position);

      --  VerticalDimension

      Xt_Motif_Vertical_Dimension_Resource_Type :=
        Create_Predefined_Resource_Type;
      Set_Name
       (Xt_Motif_Vertical_Dimension_Resource_Type,
        Enter ("XmRVerticalDimension"));
      Set_Internal_Name
       (Xt_Motif_Vertical_Dimension_Resource_Type,
        Enter ("VerticalDimension"));
      Set_Type_Kind
       (Xt_Motif_Vertical_Dimension_Resource_Type, Type_Dimension);

      --  VerticalInt

      Xt_Motif_Vertical_Int_Resource_Type :=
        Create_Predefined_Resource_Type;
      Set_Name
       (Xt_Motif_Vertical_Int_Resource_Type, Enter ("XmRVerticalInt"));
      Set_Internal_Name
       (Xt_Motif_Vertical_Int_Resource_Type, Enter ("VerticalInt"));
      Set_Type_Kind (Xt_Motif_Vertical_Int_Resource_Type, Type_C_Int);

      --  VerticalPosition

      Xt_Motif_Vertical_Position_Resource_Type :=
        Create_Predefined_Resource_Type;
      Set_Name
       (Xt_Motif_Vertical_Position_Resource_Type,
        Enter ("XmRVerticalPosition"));
      Set_Internal_Name
       (Xt_Motif_Vertical_Position_Resource_Type, Enter ("VerticalPosition"));
      Set_Type_Kind
       (Xt_Motif_Vertical_Position_Resource_Type, Type_Position);

      --  Select Color

      Xt_Motif_Select_Color_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name (Xt_Motif_Select_Color_Resource_Type, Enter ("XmRSelectColor"));
      Set_Internal_Name
       (Xt_Motif_Select_Color_Resource_Type, Enter ("SelectColor"));
      Set_Type_Kind (Xt_Motif_Select_Color_Resource_Type, Type_Pixel);

      --  Dynamic Pixmap

      Xt_Motif_Dynamic_Pixmap_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name
       (Xt_Motif_Dynamic_Pixmap_Resource_Type, Enter ("XmRDynamicPixmap"));
      Set_Internal_Name
       (Xt_Motif_Dynamic_Pixmap_Resource_Type, Enter ("DynamicPixmap"));
      Set_Type_Kind (Xt_Motif_Dynamic_Pixmap_Resource_Type, Type_Pixmap);

      --  No Scaling Dynamic Pixmap

      Xt_Motif_No_Scaling_Dynamic_Pixmap_Resource_Type :=
        Create_Predefined_Resource_Type;
      Set_Name
       (Xt_Motif_No_Scaling_Dynamic_Pixmap_Resource_Type,
        Enter ("XmRNoScalingDynamicPixmap"));
      Set_Internal_Name
       (Xt_Motif_No_Scaling_Dynamic_Pixmap_Resource_Type,
        Enter ("NoScalingDynamicPixmap"));
      Set_Type_Kind
       (Xt_Motif_No_Scaling_Dynamic_Pixmap_Resource_Type, Type_Pixmap);

      --  Menu Widget reference

      Xt_Motif_Menu_Widget_Reference_Resource_Type :=
        Create_Widget_Reference_Resource_Type;
      Set_Name
       (Xt_Motif_Menu_Widget_Reference_Resource_Type, Enter ("XmRMenuWidget"));
      Set_Internal_Name
       (Xt_Motif_Menu_Widget_Reference_Resource_Type, Enter ("MenuWidget"));

      --  XmString

      Xt_Motif_Xm_String_Resource_Type := Create_Xm_String_Resource_Type;
      Set_Name
       (Xt_Motif_Xm_String_Resource_Type, Enter ("XmRXmString"));
      Set_Internal_Name
       (Xt_Motif_Xm_String_Resource_Type, Enter ("XmString"));

      --  XmRenderTable

      Xt_Motif_Render_Table_Resource_Type :=
        Create_Xm_Render_Table_Resource_Type;
      Set_Name
       (Xt_Motif_Render_Table_Resource_Type, Enter ("XmRRenderTable"));
      Set_Internal_Name
       (Xt_Motif_Render_Table_Resource_Type, Enter ("RenderTable"));

      --  Формирование списка предопределенных типов ресурсов.

--      Append (Types, Xt_Motif__Resource_Type);
      Append (Types, Xt_Motif_Accelerator_Table_Resource_Type);
      Append (Types, Xt_Motif_Dimension_Resource_Type);
      Append (Types, Xt_Motif_Dynamic_Pixmap_Resource_Type);
      Append (Types, Xt_Motif_Horizontal_Dimension_Resource_Type);
      Append (Types, Xt_Motif_Horizontal_Int_Resource_Type);
      Append (Types, Xt_Motif_Horizontal_Position_Resource_Type);
      Append (Types, Xt_Motif_C_Int_Resource_Type);
      Append (Types, Xt_Motif_Menu_Widget_Reference_Resource_Type);
      Append (Types, Xt_Motif_No_Scaling_Dynamic_Pixmap_Resource_Type);
      Append (Types, Xt_Motif_Pixel_Resource_Type);
      Append (Types, Xt_Motif_Pixmap_Resource_Type);
      Append (Types, Xt_Motif_Position_Resource_Type);
      Append (Types, Xt_Motif_Screen_Resource_Type);
      Append (Types, Xt_Motif_C_Short_Resource_Type);
      Append (Types, Xt_Motif_Translation_Table_Resource_Type);
      Append (Types, Xt_Motif_Vertical_Dimension_Resource_Type);
      Append (Types, Xt_Motif_Vertical_Int_Resource_Type);
      Append (Types, Xt_Motif_Vertical_Position_Resource_Type);
      Append (Types, Xt_Motif_Widget_Reference_Resource_Type);
      Append (Types, Xt_Motif_Xm_String_Resource_Type);
      Append (Types, Xt_Motif_Render_Table_Resource_Type);
   end Create_Predefined_Resource_Types;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Renditions_Resources
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Renditions_Resources is
      Resources : constant List_Id := New_List;
      Resource  : Node_Id;

   begin
      Xt_Motif_Rendition_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Object_Widget_Class, Enter ("XmRendition"));
      Set_Is_Pseudo_Class (Xt_Motif_Rendition_Class, True);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNrenditionBackground"));
      Set_Internal_Resource_Name (Resource, Enter ("renditionBackground"));
      Set_Resource_Class_Name (Resource, Enter ("XmCrenditionBackground"));
      Set_Internal_Resource_Class_Name
       (Resource, Enter ("RenditionBackground"));
      Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNfont"));
--      Set_Internal_Resource_Name (Resource, Enter ("font"));
--      Set_Resource_Class_Name (Resource, Enter ("XmCfont"));
--      Set_Internal_Resource_Class_Name
--       (Resource, Enter ("Font"));
--      Set_Resource_Type (Resource, Xt_Motif_Pointer_Resource_Type); --  ?
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);

--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNfontName"));
--      Set_Internal_Resource_Name (Resource, Enter ("fontName"));
--      Set_Resource_Class_Name (Resource, Enter ("XmCfontName"));
--      Set_Internal_Resource_Class_Name
--       (Resource, Enter ("FontName"));
--      Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type); -- ?
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNfontType"));
      Set_Internal_Resource_Name (Resource, Enter ("fontType"));
      Set_Resource_Class_Name (Resource, Enter ("XmCfontType"));
      Set_Internal_Resource_Class_Name 
       (Resource, Enter ("FontType"));
      Set_Resource_Type (Resource, Xt_Motif_Font_Type_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNrenditionForeground"));
      Set_Internal_Resource_Name (Resource, Enter ("renditionForeground"));
      Set_Resource_Class_Name (Resource, Enter ("XmCrenditionForeground"));
      Set_Internal_Resource_Class_Name
       (Resource, Enter ("RenditionForeground"));
      Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNloadModel"));
      Set_Internal_Resource_Name (Resource, Enter ("loadModel"));
      Set_Resource_Class_Name (Resource, Enter ("XmCloadModel"));
      Set_Internal_Resource_Class_Name 
       (Resource, Enter ("LoadModel"));
      Set_Resource_Type (Resource, Xt_Motif_Load_Model_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNstrikethruType"));
      Set_Internal_Resource_Name (Resource, Enter ("strikethruType"));
      Set_Resource_Class_Name (Resource, Enter ("XmCstrikethruType"));
      Set_Internal_Resource_Class_Name 
       (Resource, Enter ("StrikethruType"));
      Set_Resource_Type (Resource, Xt_Motif_Strikethru_Type_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNtabList"));
--      Set_Internal_Resource_Name (Resource, Enter ("tabList"));
--      Set_Resource_Class_Name (Resource, Enter ("XmCtabList"));
--      Set_Internal_Resource_Class_Name
--       (Resource, Enter ("TabList"));
--      Set_Resource_Type (Resource, Xt_Motif_Tab_List_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);

--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNtag"));
--      Set_Internal_Resource_Name (Resource, Enter ("tag"));
--      Set_Resource_Class_Name (Resource, Enter ("XmCtag"));
--      Set_Internal_Resource_Class_Name
--       (Resource, Enter ("Tag"));
--      Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);

--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNunderlineType"));
--      Set_Internal_Resource_Name (Resource, Enter ("underlineType"));
--      Set_Resource_Class_Name (Resource, Enter ("XmCunderlineType"));
--      Set_Internal_Resource_Class_Name
--       (Resource, Enter ("UnderlineType"));
--      Set_Resource_Type (Resource, Xt_Motif_underlineType_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);

      Set_Resources (Xt_Motif_Rendition_Class, Resources);

      Append (Types, Xt_Motif_Rendition_Class);
   end Create_Renditions_Resources;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget_Classes
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Widget_Classes is
--      Xt_Motif__Widget_Class : Node_Id;
--      Xt_Motif__Widget_Class : Node_Id;
--      Xt_Motif__Widget_Class : Node_Id;

      --  Классы виджетов Motif.

--   Xt_Motif_Bulletin_Board_Dialog_Widget_Class : Node_Id;
--   Xt_Motif_Error_Dialog_Widget_Class          : Node_Id;
--   Xt_Motif_File_Selection_Dialog_Widget_Class : Node_Id;
--  in Xt      Xt_Motif_Form_Widget_Class                  : Node_Id;
--   Xt_Motif_Form_Dialog_Widget_Class           : Node_Id;
--   Xt_Motif_Information_Dialog_Widget_Class    : Node_Id;
--   Xt_Motif_Message_Dialog_Widget_Class        : Node_Id;
--   Xt_Motif_Question_Dialog_Widget_Class       : Node_Id;
--   Xt_Motif_Scrolled_List_Widget_Class         : Node_Id;
--   Xt_Motif_Scrolled_Text_Widget_Class         : Node_Id;
--   Xt_Motif_Selection_Dialog_Widget_Class      : Node_Id;
--   Xt_Motif_Template_Dialog_Widget_Class       : Node_Id;
--   Xt_Motif_Warning_Dialog_Widget_Class        : Node_Id;
--   Xt_Motif_Working_Dialog_Widget_Class        : Node_Id;

   begin
      ------------------------------------------------------------------------
      --  Xt Toolkit Intrinsics Core Widget Classes
      ------------------------------------------------------------------------

      --  Object

      Xt_Motif_Object_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Object_Widget_Class, Enter ("Object"));
      Set_Is_Meta_Class (Xt_Motif_Object_Widget_Class, True);

      --  TODO XmNdestroyCallback

      --  RectObj

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Rect_Obj_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Rect_Obj_Widget_Class, Enter ("RectObj"));
         Set_Super_Class (Xt_Motif_Rect_Obj_Widget_Class,
                          Xt_Motif_Object_Widget_Class);
         Set_Is_Meta_Class (Xt_Motif_Rect_Obj_Widget_Class, True);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNancestorSensitive"));
         Set_Internal_Resource_Name (Resource, Enter ("ancestorSensitive"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSensitive"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Sensitive"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNborderWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("borderWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XtCBorderWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BorderWidth"));
         Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNheight"));
         Set_Internal_Resource_Name (Resource, Enter ("height"));
         Set_Resource_Class_Name (Resource, Enter ("XtCHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Height"));
         Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsensitive"));
         Set_Internal_Resource_Name (Resource, Enter ("sensitive"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSensitive"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Sensitive"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNwidth"));
         Set_Internal_Resource_Name (Resource, Enter ("width"));
         Set_Resource_Class_Name (Resource, Enter ("XtCWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Width"));
         Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNx"));
         Set_Internal_Resource_Name (Resource, Enter ("x"));
         Set_Resource_Class_Name (Resource, Enter ("XtCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type (Resource, Xt_Motif_Position_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNy"));
         Set_Internal_Resource_Name (Resource, Enter ("y"));
         Set_Resource_Class_Name (Resource, Enter ("XtCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type (Resource, Xt_Motif_Position_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Rect_Obj_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Rect_Obj_Widget_Class);
      end;

      --  Core

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Core_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Core_Widget_Class, Enter ("Core"));
         Set_Super_Class (Xt_Motif_Core_Widget_Class,
                          Xt_Motif_Rect_Obj_Widget_Class);
         Set_Is_Meta_Class (Xt_Motif_Core_Widget_Class, True);

         --  XmNinitialResourcesPersistent - уже нет в lib/Xt/Core.c

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNaccelerators"));
         Set_Internal_Resource_Name (Resource, Enter ("accelerators"));
         Set_Resource_Class_Name (Resource, Enter ("XtCAccelerators"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Accelerators"));
         Set_Resource_Type
          (Resource, Xt_Motif_Accelerator_Table_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNbackground"));
         Set_Internal_Resource_Name (Resource, Enter ("background"));
         Set_Resource_Class_Name (Resource, Enter ("XtCBackground"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Background"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNbackgroundPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("backgroundPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XtCPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Pixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNborderColor"));
         Set_Internal_Resource_Name (Resource, Enter ("borderColor"));
         Set_Resource_Class_Name (Resource, Enter ("XtCBorderColor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BorderColor"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNborderPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("borderPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XtCPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Pixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNcolormap"));
         Set_Internal_Resource_Name (Resource, Enter ("colormap"));
         Set_Resource_Class_Name (Resource, Enter ("XtCColormap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Colormap"));
         Set_Resource_Type (Resource, Xt_Motif_Colormap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNdepth"));
         Set_Internal_Resource_Name (Resource, Enter ("depth"));
         Set_Resource_Class_Name (Resource, Enter ("XtCDepth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Depth"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNmappedWhenManaged"));
         Set_Internal_Resource_Name (Resource, Enter ("mappedWhenManaged"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMappedWhenManaged"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("MappedWhenManaged"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNscreen"));
         Set_Internal_Resource_Name (Resource, Enter ("screen"));
         Set_Resource_Class_Name (Resource, Enter ("XtCScreen"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Screen"));
         Set_Resource_Type (Resource, Xt_Motif_Screen_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNtranslations"));
         Set_Internal_Resource_Name (Resource, Enter ("translations"));
         Set_Resource_Class_Name (Resource, Enter ("XtCTranslations"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Translations"));
         Set_Resource_Type
          (Resource, Xt_Motif_Translation_Table_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Core_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Core_Widget_Class);
      end;

      --  Composite

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
      begin
         Xt_Motif_Composite_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Composite_Widget_Class, Enter ("Composite"));
         Set_Super_Class (Xt_Motif_Composite_Widget_Class,
                          Xt_Motif_Core_Widget_Class);
         Set_Is_Meta_Class (Xt_Motif_Composite_Widget_Class, True);

         --  TODO XmNchildren
         --  TODO XmNinsertPosition
         --  TODO XmNnumChildren

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);

         Merge_Inherited_Resources (Xt_Motif_Composite_Widget_Class);
      end;

      --  Constraint

      Xt_Motif_Constraint_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Constraint_Widget_Class, Enter ("Constraint"));
      Set_Super_Class (Xt_Motif_Constraint_Widget_Class,
                       Xt_Motif_Composite_Widget_Class);
      Set_Is_Meta_Class (Xt_Motif_Constraint_Widget_Class, True);

      Merge_Inherited_Resources (Xt_Motif_Constraint_Widget_Class);

      --  Shell

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Shell_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Shell_Widget_Class, Enter ("Shell"));
         Set_Super_Class (Xt_Motif_Shell_Widget_Class,
                          Xt_Motif_Composite_Widget_Class);
         Set_Is_Meta_Class (Xt_Motif_Shell_Widget_Class, True);

         --  TODO XmNcreatePopupChildProc
         --  TODO XmNgeometry
         --  TODO XmNvisual

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNallowShellResize"));
         Set_Internal_Resource_Name (Resource, Enter ("allowShellResize"));
         Set_Resource_Class_Name (Resource, Enter ("XtCAllowShellResize"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("AllowShellResize"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNoverrideRedirect"));
         Set_Internal_Resource_Name (Resource, Enter ("overrideRedirect"));
         Set_Resource_Class_Name (Resource, Enter ("XtCOverrideRedirect"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("OverrideRedirect"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNsaveUnder"));
         Set_Internal_Resource_Name (Resource, Enter ("saveUnder"));
         Set_Resource_Class_Name (Resource, Enter ("XtCSaveUnder"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SaveUnder"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         --  TODO XmNpopdownCallback
         --  TODO XmNpopupCallback

         Set_Resources (Xt_Motif_Shell_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Shell_Widget_Class);
      end;

      --  OverrideShell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
      begin
         Xt_Motif_Override_Shell_Widget_Class := Create_Widget_Class;
         Set_Name
          (Xt_Motif_Override_Shell_Widget_Class, Enter ("OverrideShell"));
         Set_Super_Class (Xt_Motif_Override_Shell_Widget_Class,
                          Xt_Motif_Shell_Widget_Class);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);

         Merge_Inherited_Resources (Xt_Motif_Override_Shell_Widget_Class);
      end;

      --  WMShell

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_WM_Shell_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_WM_Shell_Widget_Class, Enter ("WMShell"));
         Set_Super_Class (Xt_Motif_WM_Shell_Widget_Class,
                          Xt_Motif_Shell_Widget_Class);
         Set_Is_Meta_Class (Xt_Motif_WM_Shell_Widget_Class, True);

         --  TODO XmNiconMask
         --  TODO XmNiconPixmap
         --  TODO XmNiconWindow
         --  TODO XmNinput
         --  TODO XmNtitle
         --  TODO XmNtitleEncoding
         --  TODO XmNwindowGroup

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNbaseHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("baseHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XtCBaseHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BaseHeight"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNbaseWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("baseWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XtCBaseWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BaseWidth"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNheightInc"));
         Set_Internal_Resource_Name (Resource, Enter ("heightInc"));
         Set_Resource_Class_Name (Resource, Enter ("XtCHeightInc"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("HeightInc"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter ("XtNiconMask"));
--         Set_Internal_Resource_Name (Resource, Enter ("iconMask"));
--         Set_Resource_Class_Name (Resource, Enter ("XtCIconMask"));
--         Set_Internal_Resource_Class_Name (Resource, Enter ("IconMask"));
--         Set_Resource_Type (Resource, Xt_Motif_Bitmap_Resource_Type);
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter ("XmNiconPixmap"));
--         Set_Internal_Resource_Name (Resource, Enter ("iconPixmap"));
--         Set_Resource_Class_Name (Resource, Enter ("XtCIconPixmap"));
--         Set_Internal_Resource_Class_Name (Resource, Enter ("IconPixmap"));
--         Set_Resource_Type (Resource, Xt_Motif_Bitmap_Resource_Type);
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter ("XtNiconWindow"));
--         Set_Internal_Resource_Name (Resource, Enter ("iconWindow"));
--         Set_Resource_Class_Name (Resource, Enter ("XtCIconWindow"));
--         Set_Internal_Resource_Class_Name (Resource, Enter ("IconWindow"));
--         Set_Resource_Type (Resource, Xt_Motif_Window_Resource_Type);
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNiconX"));
         Set_Internal_Resource_Name (Resource, Enter ("iconX"));
         Set_Resource_Class_Name (Resource, Enter ("XtCIconX"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IconX"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNiconY"));
         Set_Internal_Resource_Name (Resource, Enter ("iconY"));
         Set_Resource_Class_Name (Resource, Enter ("XtCIconY"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IconY"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNinitialState"));
         Set_Internal_Resource_Name (Resource, Enter ("initialState"));
         Set_Resource_Class_Name (Resource, Enter ("XtCInitialState"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("InitialState"));
         Set_Resource_Type (Resource, Xt_Motif_Initial_State_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNmaxAspectX"));
         Set_Internal_Resource_Name (Resource, Enter ("maxAspectX"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMaxAspectX"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaxAspectX"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNmaxAspectY"));
         Set_Internal_Resource_Name (Resource, Enter ("maxAspectY"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMaxAspectY"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaxAspectY"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNmaxHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("maxHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMaxHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaxHeight"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNmaxWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("maxWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMaxWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaxWidth"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNminAspectX"));
         Set_Internal_Resource_Name (Resource, Enter ("minAspectX"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMinAspectX"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MinAspectX"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNminAspectY"));
         Set_Internal_Resource_Name (Resource, Enter ("minAspectY"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMinAspectY"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MinAspectY"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNminHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("minHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMinHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MinHeight"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNminWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("minWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMinWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MinWidth"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNtransient"));
         Set_Internal_Resource_Name (Resource, Enter ("transient"));
         Set_Resource_Class_Name (Resource, Enter ("XtCTransient"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Transient"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNwaitForWm"));
         Set_Internal_Resource_Name (Resource, Enter ("waitforwm"));
         Set_Resource_Class_Name (Resource, Enter ("XtCWaitForWm"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Waitforwm"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNwidthInc"));
         Set_Internal_Resource_Name (Resource, Enter ("widthInc"));
         Set_Resource_Class_Name (Resource, Enter ("XtCWidthInc"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("WidthInc"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNwinGravity"));
         Set_Internal_Resource_Name (Resource, Enter ("winGravity"));
         Set_Resource_Class_Name (Resource, Enter ("XtCWinGravity"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("WinGravity"));
         Set_Resource_Type (Resource, Xt_Motif_Gravity_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNwmTimeout"));
         Set_Internal_Resource_Name (Resource, Enter ("wmTimeout"));
         Set_Resource_Class_Name (Resource, Enter ("XtCWmTimeout"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("WmTimeout"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_WM_Shell_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_WM_Shell_Widget_Class);
      end;

      --  VendorShell

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Vendor_Shell_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Vendor_Shell_Widget_Class, Enter ("VendorShell"));
         Set_Super_Class (Xt_Motif_Vendor_Shell_Widget_Class,
                          Xt_Motif_WM_Shell_Widget_Class);
         Set_Is_Meta_Class (Xt_Motif_Vendor_Shell_Widget_Class, True);

         --  TODO XmNbuttonFontList
         --  TODO XmNbuttonRenderTable
         --  TODO XmNdefaultFontList
         --  TODO XmNinputMethod
         --  TODO XmNinputPolicy
         --  TODO XmNkeyboardFocusPolicy
         --  TODO XmNlabelFontList
         --  TODO XmNlabelRenderTable
         --  TODO XmNlayoutDirection
         --  TODO XmNmwmDecorations
         --  TODO XmNmwmFunctions
         --  TODO XmNmwmInputMode
         --  TODO XmNmwmMenu
         --  TODO XmNpreeditType
         --  TODO XmNverifyPreedit
         --  TODO XmNshellUnitType
         --  TODO XmNtextFontList
         --  TODO XmNtextRenderTable
         --  TODO XmNunitType
         --  TODO XmNuseAsyncGeometry

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNaudibleWarning"));
         Set_Internal_Resource_Name (Resource, Enter ("audibleWarning"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAudibleWarning"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("AudibleWarning"));
         Set_Resource_Type (Resource, Xt_Motif_Audible_Warning_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNbaseHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("baseHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XtCBaseHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BaseHeight"));
         Set_Resource_Type (Resource, Xt_Motif_Vertical_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNbaseWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("baseWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XtCBaseWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BaseWidth"));
         Set_Resource_Type (Resource, Xt_Motif_Horizontal_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNborderWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("borderWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBorderWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BorderWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter ("XmNbuttonRenderTable"));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter ("XmCButtonRenderTable"));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, Xt_Motif_Button_Render_Table_Resource_Type);
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdeleteResponse"));
         Set_Internal_Resource_Name (Resource, Enter ("deleteResponse"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDeleteResponse"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("DeleteResponse"));
         Set_Resource_Type (Resource, Xt_Motif_Delete_Response_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNheight"));
         Set_Internal_Resource_Name (Resource, Enter ("height"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNheightInc"));
         Set_Internal_Resource_Name (Resource, Enter ("heightInc"));
         Set_Resource_Class_Name (Resource, Enter ("XtCHeightInc"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("HeightInc"));
         Set_Resource_Type (Resource, Xt_Motif_Vertical_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNiconPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("iconPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XtCIconPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IconPixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNiconX"));
         Set_Internal_Resource_Name (Resource, Enter ("iconX"));
         Set_Resource_Class_Name (Resource, Enter ("XtCIconX"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IconX"));
         Set_Resource_Type (Resource, Xt_Motif_Horizontal_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNiconY"));
         Set_Internal_Resource_Name (Resource, Enter ("iconY"));
         Set_Resource_Class_Name (Resource, Enter ("XtCIconY"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IconY"));
         Set_Resource_Type (Resource, Xt_Motif_Vertical_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNinputPolicy"));
         Set_Internal_Resource_Name (Resource, Enter ("inputPolicy"));
         Set_Resource_Class_Name (Resource, Enter ("XmCInputPolicy"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("InputPolicy"));
         Set_Resource_Type (Resource, Xt_Motif_Input_Policy_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNmaxAspectX"));
         Set_Internal_Resource_Name (Resource, Enter ("maxAspectX"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMaxAspectX"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaxAspectX"));
         Set_Resource_Type (Resource, Xt_Motif_Horizontal_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNmaxAspectY"));
         Set_Internal_Resource_Name (Resource, Enter ("maxAspectY"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMaxAspectY"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaxAspectY"));
         Set_Resource_Type (Resource, Xt_Motif_Vertical_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNmaxHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("maxHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMaxHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaxHeight"));
         Set_Resource_Type (Resource, Xt_Motif_Vertical_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNmaxWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("maxWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMaxWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaxWidth"));
         Set_Resource_Type (Resource, Xt_Motif_Horizontal_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNminAspectX"));
         Set_Internal_Resource_Name (Resource, Enter ("minAspectX"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMinAspectX"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MinAspectX"));
         Set_Resource_Type (Resource, Xt_Motif_Horizontal_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNminAspectY"));
         Set_Internal_Resource_Name (Resource, Enter ("minAspectY"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMinAspectY"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MinAspectY"));
         Set_Resource_Type (Resource, Xt_Motif_Vertical_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNminHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("minHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMinHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MinHeight"));
         Set_Resource_Type (Resource, Xt_Motif_Vertical_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNminWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("minWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMinWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MinWidth"));
         Set_Resource_Type (Resource, Xt_Motif_Horizontal_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNwidth"));
         Set_Internal_Resource_Name (Resource, Enter ("width"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNwidthInc"));
         Set_Internal_Resource_Name (Resource, Enter ("widthInc"));
         Set_Resource_Class_Name (Resource, Enter ("XtCWidthInc"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("WidthInc"));
         Set_Resource_Type (Resource, Xt_Motif_Horizontal_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNx"));
         Set_Internal_Resource_Name (Resource, Enter ("x"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Position_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNy"));
         Set_Internal_Resource_Name (Resource, Enter ("y"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Position_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Vendor_Shell_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Vendor_Shell_Widget_Class);
      end;

      --  TransientShell

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Transient_Shell_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Transient_Shell_Widget_Class,
                   Enter ("TransientShell"));
         Set_Super_Class (Xt_Motif_Transient_Shell_Widget_Class,
                          Xt_Motif_Vendor_Shell_Widget_Class);
         Set_Is_Meta_Class (Xt_Motif_Transient_Shell_Widget_Class, True);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNtransientFor"));
         Set_Internal_Resource_Name (Resource, Enter ("transientFor"));
         Set_Resource_Class_Name (Resource, Enter ("XtCTransientFor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("TransientFor"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
--         Set_Widget_Reference_Constraints (Resource, );
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Transient_Shell_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Transient_Shell_Widget_Class);
      end;

      --  TopLevelShell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
      begin
         Xt_Motif_Top_Level_Shell_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Top_Level_Shell_Widget_Class,
                   Enter ("TopLevelShell"));
         Set_Super_Class (Xt_Motif_Top_Level_Shell_Widget_Class,
                          Xt_Motif_Vendor_Shell_Widget_Class);

         --  TODO XmNiconic
         --  TODO XmNiconName
         --  TODO XmNiconNameEncoding

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);

         Merge_Inherited_Resources (Xt_Motif_Top_Level_Shell_Widget_Class);
      end;

      --  ApplicationShell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
      begin
         Xt_Motif_Application_Shell_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Application_Shell_Widget_Class,
                   Enter ("ApplicationShell"));
         Set_Super_Class (Xt_Motif_Application_Shell_Widget_Class,
                          Xt_Motif_Top_Level_Shell_Widget_Class);

         --  TODO XmNargc
         --  TODO XmNargv

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);
--
--         Set_Resources (Xt_Motif_Application_Shell_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Application_Shell_Widget_Class);
      end;

      --  SessionShell

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
      begin
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
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);

         Merge_Inherited_Resources (Xt_Motif_Session_Shell_Widget_Class);
      end;

      ------------------------------------------------------------------------
      --  Motif Primitives Widget Classes
      ------------------------------------------------------------------------

      --  XmPrimitive

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Primitive_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Primitive_Widget_Class, Enter ("XmPrimitive"));
         Set_Super_Class (Xt_Motif_Primitive_Widget_Class,
                          Xt_Motif_Core_Widget_Class);
         Set_Is_Meta_Class (Xt_Motif_Primitive_Widget_Class, True);

         --  TODO XmNlayoutDirection
         --  TODO XmNunitType
         --  TODO XmNuserData

         --  TODO XmNconvertCallback
         --  TODO XmNhelpCallback
         --  TODO XmNpopupHandlerCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNborderWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("borderWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBorderWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BorderWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbottomShadowColor"));
         Set_Internal_Resource_Name (Resource, Enter ("bottomShadowColor"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBottomShadowColor"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("BottomShadowColor"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbottomShadowPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("bottomShadowPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBottomShadowPixmap"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("BottomShadowPixmap"));
         Set_Resource_Type
          (Resource, Xt_Motif_No_Scaling_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNforeground"));
         Set_Internal_Resource_Name (Resource, Enter ("foreground"));
         Set_Resource_Class_Name (Resource, Enter ("XmCForeground"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Foreground"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNheight"));
         Set_Internal_Resource_Name (Resource, Enter ("height"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightColor"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightColor"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightColor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("HighlightColor"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightOnEnter"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightOnEnter"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightOnEnter"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightOnEnter"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightPixmap"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightPixmap"));
         Set_Resource_Type
          (Resource, Xt_Motif_No_Scaling_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNnavigationType"));
         Set_Internal_Resource_Name (Resource, Enter ("navigationType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCNavigationType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("NavigationType"));
         Set_Resource_Type (Resource, Xt_Motif_Navigation_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNshadowThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("shadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtopShadowColor"));
         Set_Internal_Resource_Name (Resource, Enter ("topShadowColor"));
         Set_Resource_Class_Name (Resource, Enter ("XmCTopShadowColor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("TopShadowColor"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtopShadowPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("topShadowPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCTopShadowPixmap"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("TopShadowPixmap"));
         Set_Resource_Type
          (Resource, Xt_Motif_No_Scaling_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtraversalOn"));
         Set_Internal_Resource_Name (Resource, Enter ("traversalOn"));
         Set_Resource_Class_Name (Resource, Enter ("XmCTraversalOn"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("TraversalOn"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNwidth"));
         Set_Internal_Resource_Name (Resource, Enter ("width"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNx"));
         Set_Internal_Resource_Name (Resource, Enter ("x"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Position_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNy"));
         Set_Internal_Resource_Name (Resource, Enter ("y"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Position_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Primitive_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Primitive_Widget_Class);
      end;

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

         --  TODO XmNactivateCallback
         --  TODO XmNarmCallback
         --  TODO XmNdisarmCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowDirection"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowDirection"));
         Set_Resource_Class_Name (Resource, Enter ("XmNArrowDirection"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArrowDirection"));
         Set_Resource_Type (Resource, Xt_Motif_Arrow_Direction_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdetailShadowThickness"));
         Set_Internal_Resource_Name
          (Resource, Enter ("detailShadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmultiClick"));
         Set_Internal_Resource_Name (Resource, Enter ("multiClick"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMultiClick"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MultiClick"));
         Set_Resource_Type (Resource, Xt_Motif_Multi_Click_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Arrow_Button_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Arrow_Button_Widget_Class);
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

         --  TODO XmNaccelerator
         --  TODO XmNfontList
         --  TODO XmNmnemonic
         --  TODO XmNmnemonicCharSet
         --  TODO XmNstringDirection

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNacceleratorText"));
         Set_Internal_Resource_Name (Resource, Enter ("acceleratorText"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAcceleratorText"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("AcceleratorText"));
         Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNalignment"));
         Set_Internal_Resource_Name (Resource, Enter ("alignment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAlignment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Alignment"));
         Set_Resource_Type (Resource, Xt_Motif_Alignment_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlabelInsensitivePixmap"));
         Set_Internal_Resource_Name
          (Resource, Enter ("labelInsensitivePixmap"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCLabelInsensitivePixmap"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("LabelInsensitivePixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlabelPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("labelPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCLabelPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("LabelPixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlabelString"));
         Set_Internal_Resource_Name (Resource, Enter ("labelString"));
         Set_Resource_Class_Name (Resource, Enter ("XmCXmString"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("XmString"));
         Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlabelType"));
         Set_Internal_Resource_Name (Resource, Enter ("labelType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCLabelType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("LabelType"));
         Set_Resource_Type (Resource, Xt_Motif_Label_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginBottom"));
         Set_Internal_Resource_Name (Resource, Enter ("marginBottom"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginBottom"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginBottom"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginLeft"));
         Set_Internal_Resource_Name (Resource, Enter ("marginLeft"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginLeft"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginLeft"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginRight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginRight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginRight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginRight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginTop"));
         Set_Internal_Resource_Name (Resource, Enter ("marginTop"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginTop"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginTop"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrecomputeSize"));
         Set_Internal_Resource_Name (Resource, Enter ("recomputeSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRecomputeSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RecomputeSize"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrenderTable"));
         Set_Internal_Resource_Name (Resource, Enter ("renderTable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRenderTable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RenderTable"));
         Set_Resource_Type (Resource, Xt_Motif_Render_Table_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Label_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Label_Widget_Class);
      end;

      --  XmCascadeButton

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Cascade_Button_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Cascade_Button_Widget_Class,
                   Enter ("XmCascadeButton"));
         Set_Super_Class (Xt_Motif_Cascade_Button_Widget_Class,
                          Xt_Motif_Label_Widget_Class);

         --  TODO XmNactivateCallback
         --  TODO XmNcascadingCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcascadePixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("cascadePixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Pixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmappingDelay"));
         Set_Internal_Resource_Name (Resource, Enter ("mappingDelay"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMappingDelay"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MappingDelay"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsubMenuId"));
         Set_Internal_Resource_Name (Resource, Enter ("subMenuId"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMenuWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MenuWidget"));
         Set_Resource_Type
          (Resource, Xt_Motif_Menu_Widget_Reference_Resource_Type);
--         Set_Widget_Reference_Constraints (Resource, );
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Cascade_Button_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Cascade_Button_Widget_Class);
      end;

      --  XmDrawnButton

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Drawn_Button_Widget_Class := Create_Widget_Class;
         Set_Name
          (Xt_Motif_Drawn_Button_Widget_Class, Enter ("XmDrawnButton"));
         Set_Super_Class (Xt_Motif_Drawn_Button_Widget_Class,
                          Xt_Motif_Label_Widget_Class);

         --  TODO XmNactivateCallback
         --  TODO XmNarmCallback
         --  TODO XmNdisarmCallback
         --  TODO XmNexposeCallback
         --  TODO XmNresizeCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmultiClick"));
         Set_Internal_Resource_Name (Resource, Enter ("multiClick"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMultiClick"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MultiClick"));
         Set_Resource_Type (Resource, Xt_Motif_Multi_Click_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpushButtonEnabled"));
         Set_Internal_Resource_Name (Resource, Enter ("pushButtonEnabled"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPushButtonEnabled"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("PushButtonEnabled"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNshadowType"));
         Set_Internal_Resource_Name (Resource, Enter ("shadowType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ShadowType"));
         Set_Resource_Type (Resource, Xt_Motif_Shadow_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Drawn_Button_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Drawn_Button_Widget_Class);
      end;

      --  XmPushButton

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Push_Button_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Push_Button_Widget_Class, Enter ("XmPushButton"));
         Set_Super_Class (Xt_Motif_Push_Button_Widget_Class,
                          Xt_Motif_Label_Widget_Class);

         --  TODO XmNshowAsDefault

         --  TODO XmNactivateCallback
         --  TODO XmNarmCallback
         --  TODO XmNdisarmCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarmColor"));
         Set_Internal_Resource_Name (Resource, Enter ("armColor"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArmColor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArmColor"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarmPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("armPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArmPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArmPixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name
          (Resource, Enter ("XmNdefaultButtonShadowThickness"));
         Set_Internal_Resource_Name
          (Resource, Enter ("defaultButtonShadowThickness"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCDefaultButtonShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("DefaultButtonShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNfillOnArm"));
         Set_Internal_Resource_Name (Resource, Enter ("fillOnArm"));
         Set_Resource_Class_Name (Resource, Enter ("XmCFillOnArm"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("FillOnArm"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmultiClick"));
         Set_Internal_Resource_Name (Resource, Enter ("multiClick"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMultiClick"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MultiClick"));
         Set_Resource_Type (Resource, Xt_Motif_Multi_Click_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Push_Button_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Push_Button_Widget_Class);
      end;

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

         --  TODO XmNset
         --  TODO XmNtoggleMode

         --  TODO XmNarmCallback
         --  TODO XmNdisarmCallback
         --  TODO XmNvalueChangedCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdetailShadowThickness"));
         Set_Internal_Resource_Name
          (Resource, Enter ("detailShadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNfillOnSelect"));
         Set_Internal_Resource_Name (Resource, Enter ("fillOnSelect"));
         Set_Resource_Class_Name (Resource, Enter ("XmCFillOnSelect"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("FillOnSelect"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindeterminatePixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("indeterminatePixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndeterminatePixmap"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("IndeterminatePixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorOn"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorOn"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorOn"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorOn"));
         Set_Resource_Type
          (Resource, Xt_Motif_Toggle_Indicator_On_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorSize"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorSize"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorType"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorType"));
         Set_Resource_Type (Resource, Xt_Motif_Indicator_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNselectColor"));
         Set_Internal_Resource_Name (Resource, Enter ("selectColor"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSelectColor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SelectColor"));
         Set_Resource_Type (Resource, Xt_Motif_Select_Color_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNselectInsensitivePixmap"));
         Set_Internal_Resource_Name
          (Resource, Enter ("selectInsensitivePixmap"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCSelectInsensitivePixmap"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("SelectInsensitivePixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNselectPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("selectPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSelectPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SelectPixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter ("XmNtoggleMode"));
--         Set_Internal_Resource_Name (Resource, Enter ("toggleMode"));
--         Set_Resource_Class_Name (Resource, Enter ("XmCToggleMode"));
--         Set_Internal_Resource_Class_Name (Resource, Enter ("ToggleMode"));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNunselectColor"));
         Set_Internal_Resource_Name (Resource, Enter ("unselectColor"));
         Set_Resource_Class_Name (Resource, Enter ("XmCUnselectColor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("UnselectColor"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNvisibleWhenOff"));
         Set_Internal_Resource_Name (Resource, Enter ("visibleWhenOff"));
         Set_Resource_Class_Name (Resource, Enter ("XmCVisibleWhenOff"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("VisibleWhenOff"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Toggle_Button_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Toggle_Button_Widget_Class);
      end;

      --  XmList

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_List_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_List_Widget_Class, Enter ("XmList"));
         Set_Super_Class (Xt_Motif_List_Widget_Class,
                          Xt_Motif_Primitive_Widget_Class);

         --  TODO XmNfontList
         --  TODO XmNitemCount
         --  TODO XmNitems
         --  TODO XmNlistSizePolicy
         --  TODO XmNselectedItemCount
         --  TODO XmNselectedItems
         --  TODO XmNselectedPositionCount
         --  TODO XmNselectedPositions
         --  TODO XmNselectionMode
         --  TODO XmNselectionPolicy
         --  TODO XmNstringDirection
         --  TODO XmNtopItemPosition
         --  TODO XmNvisibleItemCount

         --  TODO XmNbrowseSelectionCallback
         --  TODO XmNdefaultActionCallback
         --  TODO XmNdestinationCallback
         --  TODO XmNextendedSelectionCallback
         --  TODO XmNmultipleSelectionCallback
         --  TODO XmNsingleSelectionCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNautomaticSelection"));
         Set_Internal_Resource_Name (Resource, Enter ("automaticSelection"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAutomaticSelection"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("AutomaticSelection"));
         Set_Resource_Type
          (Resource, Xt_Motif_Automatic_Selection_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdoubleClickInterval"));
         Set_Internal_Resource_Name (Resource, Enter ("doubleClickInterval"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDoubleClickInterval"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("DoubleClickInterval"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlistMarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("listMarginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCListMarginHeight"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ListMarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlistMarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("listMarginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCListMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ListMarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter ("XmNlistSizePolicy"));
--         Set_Internal_Resource_Name (Resource, Enter ("listSizePolicy"));
--         Set_Resource_Class_Name (Resource, Enter ("XmCListSizePolicy"));
--         Set_Internal_Resource_Class_Name (Resource, Enter ("ListSizePolicy"));
--         Set_Resource_Type (Resource, Xt_Motif_List_Size_Policy_Resource_Type);
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlistSpacing"));
         Set_Internal_Resource_Name (Resource, Enter ("listSpacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCListSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ListSpacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmatchBehavior"));
         Set_Internal_Resource_Name (Resource, Enter ("matchBehavior"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMatchBehavior"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MatchBehavior"));
         Set_Resource_Type (Resource, Xt_Motif_Match_Behavior_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNprimaryOwnership"));
         Set_Internal_Resource_Name (Resource, Enter ("primaryOwnership"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPrimaryOwnership"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("PrimaryOwnership"));
         Set_Resource_Type
          (Resource, Xt_Motif_Primary_Ownership_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrenderTable"));
         Set_Internal_Resource_Name (Resource, Enter ("renderTable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRenderTable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RenderTable"));
         Set_Resource_Type (Resource, Xt_Motif_Render_Table_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscrollBarDisplayPolicy"));
         Set_Internal_Resource_Name
          (Resource, Enter ("scrollBarDisplayPolicy"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCScrollBarDisplayPolicy"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ScrollBarDisplayPolicy"));
         Set_Resource_Type
          (Resource, Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNselectColor"));
         Set_Internal_Resource_Name (Resource, Enter ("selectColor"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSelectColor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SelectColor"));
         Set_Resource_Type (Resource, Xt_Motif_Select_Color_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);


--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter ("XmNselectionMode"));
--         Set_Internal_Resource_Name (Resource, Enter ("selectionMode"));
--         Set_Resource_Class_Name (Resource, Enter ("XmCSelectionMode"));
--         Set_Internal_Resource_Class_Name (Resource, Enter ("SelectionMode"));
--         Set_Resource_Type (Resource, Xt_Motif_Selection_Mode_Resource_Type);
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_List_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_List_Widget_Class);
      end;

      --  XmScrollBar

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Scroll_Bar_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Scroll_Bar_Widget_Class, Enter ("XmScrollBar"));
         Set_Super_Class (Xt_Motif_Scroll_Bar_Widget_Class,
                          Xt_Motif_Primitive_Widget_Class);

         --  TODO XmNsliderVisual
         --  TODO XmNslidingMode
         --  TODO XmNsnapBackMultiple

         --  TODO XmNdecrementCallback
         --  TODO XmNdragCallback
         --  TODO XmNincrementCallback
         --  TODO XmNpageDecrementCallback
         --  TODO XmNpageIncrementCallback
         --  TODO XmNtoBottomCallback
         --  TODO XmNtoTopCallback
         --  TODO XmNvalueChangedCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNeditable"));
         Set_Internal_Resource_Name (Resource, Enter ("editable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCEditable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Editable"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNincrement"));
         Set_Internal_Resource_Name (Resource, Enter ("increment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIncrement"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Increment"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNinitialDelay"));
         Set_Internal_Resource_Name (Resource, Enter ("initialDelay"));
         Set_Resource_Class_Name (Resource, Enter ("XmCInitialDelay"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("InitialDelay"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmaximum"));
         Set_Internal_Resource_Name (Resource, Enter ("maximum"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMaximum"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Maximum"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNminimum"));
         Set_Internal_Resource_Name (Resource, Enter ("minimum"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMinimum"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Minimum"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpageIncrement"));
         Set_Internal_Resource_Name (Resource, Enter ("pageIncrement"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPageIncrement"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PageIncrement"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNprocessingDirection"));
         Set_Internal_Resource_Name (Resource, Enter ("processingDirection"));
         Set_Resource_Class_Name (Resource, Enter ("XmCProcessingDirection"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ProcessingDirection"));
         Set_Resource_Type
          (Resource, Xt_Motif_Processing_Direction_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrepeatDelay"));
         Set_Internal_Resource_Name (Resource, Enter ("repeatDelay"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRepeatDelay"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RepeatDelay"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNshowArrows"));
         Set_Internal_Resource_Name (Resource, Enter ("showArrows"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShowArrows"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ShowArrows"));
         Set_Resource_Type (Resource, Xt_Motif_Show_Arrows_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsliderMark"));
         Set_Internal_Resource_Name (Resource, Enter ("sliderMark"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSliderMark"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SliderMark"));
         Set_Resource_Type (Resource, Xt_Motif_Slider_Mark_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsliderSize"));
         Set_Internal_Resource_Name (Resource, Enter ("sliderSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSliderSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SliderSize"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtroughColor"));
         Set_Internal_Resource_Name (Resource, Enter ("troughColor"));
         Set_Resource_Class_Name (Resource, Enter ("XmCTroughColor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("TroughColor"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNvalue"));
         Set_Internal_Resource_Name (Resource, Enter ("value"));
         Set_Resource_Class_Name (Resource, Enter ("XmCValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Value"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Scroll_Bar_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Scroll_Bar_Widget_Class);
      end;

      --  XmSeparator

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Separator_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Separator_Widget_Class, Enter ("XmSeparator"));
         Set_Super_Class (Xt_Motif_Separator_Widget_Class,
                          Xt_Motif_Primitive_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmargin"));
         Set_Internal_Resource_Name (Resource, Enter ("margin"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMargin"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Margin"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNseparatorType"));
         Set_Internal_Resource_Name (Resource, Enter ("separatorType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSeparatorType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SeparatorType"));
         Set_Resource_Type (Resource, Xt_Motif_Separator_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Separator_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Separator_Widget_Class);
      end;

      --  XmText

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Text_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Text_Widget_Class, Enter ("XmText"));
         Set_Super_Class (Xt_Motif_Text_Widget_Class,
                          Xt_Motif_Primitive_Widget_Class);

         --  TODO XmNcursorPosition
         --  TODO XmNtotalLines
         --  TODO XmNsource
         --  TODO XmNtopCharacter
         --  TODO XmNvalue
         --  TODO XmNvalueWcs * cannot be set in resource file

         --  TODO XmNselectionArray
         --  TODO XmNselectionArrayCount

         --  TODO XmNfontList

         --  TODO XmNactivateCallback
         --  TODO XmNdestinationCallback
         --  TODO XmNfocusCallback
         --  TODO XmNgainPrimaryCallback
         --  TODO XmNlosePrimaryCallback
         --  TODO XmNlosingFocusCallback
         --  TODO XmNmodifyVerifyCallback
         --  TODO XmNmodifyVerifyCallbackWcs
         --  TODO XmNmotionVerifyCallback
         --  TODO XmNvalueChangedCallback

         --  Нижеследующие ресурсы долько для XmScrolledText:

         --  TODO XmNscrollHorizontal
         --  TODO XmNscrollLeftSide
         --  TODO XmNscrollTopSide
         --  TODO XmNscrollVertical

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNautoShowCursorPosition"));
         Set_Internal_Resource_Name
          (Resource, Enter ("autoShowCursorPosition"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCAutoShowCursorPosition"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("AutoShowCursorPosition"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNblinkRate"));
         Set_Internal_Resource_Name (Resource, Enter ("blinkRate"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBlinkRate"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BlinkRate"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcolumns"));
         Set_Internal_Resource_Name (Resource, Enter ("columns"));
         Set_Resource_Class_Name (Resource, Enter ("XmCColumns"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Columns"));
         Set_Resource_Type (Resource, Xt_Motif_C_Short_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, Xt_Motif_Text_Position_Resource_Type);
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcursorPositionVisible"));
         Set_Internal_Resource_Name
          (Resource, Enter ("cursorPositionVisible"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCCursorPositionVisible"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("CursorPositionVisible"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNeditable"));
         Set_Internal_Resource_Name (Resource, Enter ("editable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCEditable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Editable"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNeditMode"));
         Set_Internal_Resource_Name (Resource, Enter ("editMode"));
         Set_Resource_Class_Name (Resource, Enter ("XmCEditMode"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("EditMode"));
         Set_Resource_Type (Resource, Xt_Motif_Edit_Mode_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmaxLength"));
         Set_Internal_Resource_Name (Resource, Enter ("maxLength"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMaxLength"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaxLength"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpendingDelete"));
         Set_Internal_Resource_Name (Resource, Enter ("pendingDelete"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPendingDelete"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PendingDelete"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrenderTable"));
         Set_Internal_Resource_Name (Resource, Enter ("renderTable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRenderTable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RenderTable"));
         Set_Resource_Type (Resource, Xt_Motif_Render_Table_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNresizeHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("resizeHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCResizeHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ResizeHeight"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNresizeWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("resizeWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCResizeWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ResizeWidth"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrows"));
         Set_Internal_Resource_Name (Resource, Enter ("rows"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRows"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Rows"));
         Set_Resource_Type (Resource, Xt_Motif_C_Short_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNselectThreshold"));
         Set_Internal_Resource_Name (Resource, Enter ("selectThreshold"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSelectThreshold"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("SelectThreshold"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtotalLines"));
         Set_Internal_Resource_Name (Resource, Enter ("totalLines"));
         Set_Resource_Class_Name (Resource, Enter ("XmCTotalLines"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("TotalLines"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNverifyBell"));
         Set_Internal_Resource_Name (Resource, Enter ("verifyBell"));
         Set_Resource_Class_Name (Resource, Enter ("XmCVerifyBell"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("VerifyBell"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNwordWrap"));
         Set_Internal_Resource_Name (Resource, Enter ("wordWrap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWordWrap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("WordWrap"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Text_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Text_Widget_Class);
      end;

      --  XmTextField

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Text_Field_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Text_Field_Widget_Class, Enter ("XmTextField"));
         Set_Super_Class (Xt_Motif_Text_Field_Widget_Class,
                          Xt_Motif_Primitive_Widget_Class);

         --  TODO XmNcursorPosition
         --  TODO XmNfontList
         --  TODO XmNselectionArray
         --  TODO XmNselectionArrayCount
         --  TODO XmNvalue
         --  TODO XmNvalueWcs ! cannot be set in resource file

         --  TODO XmNactivateCallback
         --  TODO XmNdestinationCallback
         --  TODO XmNfocusCallback
         --  TODO XmNgainPrimaryCallback
         --  TODO XmNlosePrimaryCallback
         --  TODO XmNlosingFocusCallback
         --  TODO XmNmodifyVerifyCallback
         --  TODO XmNmodifyVerifyCallbackWcs
         --  TODO XmNmotionVerifyCallback
         --  TODO XmNvalueChangedCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNblinkRate"));
         Set_Internal_Resource_Name (Resource, Enter ("blinkRate"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBlinkRate"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BlinkRate"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcolumns"));
         Set_Internal_Resource_Name (Resource, Enter ("columns"));
         Set_Resource_Class_Name (Resource, Enter ("XmCColumns"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Columns"));
         Set_Resource_Type (Resource, Xt_Motif_C_Short_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcursorPositionVisible"));
         Set_Internal_Resource_Name
          (Resource, Enter ("cursorPositionVisible"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCCursorPositionVisible"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("CursorPositionVisible"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNeditable"));
         Set_Internal_Resource_Name (Resource, Enter ("editable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCEditable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Editable"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmaxLength"));
         Set_Internal_Resource_Name (Resource, Enter ("maxLength"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMaxLength"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaxLength"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpendingDelete"));
         Set_Internal_Resource_Name (Resource, Enter ("pendingDelete"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPendingDelete"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PendingDelete"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrenderTable"));
         Set_Internal_Resource_Name (Resource, Enter ("renderTable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRenderTable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RenderTable"));
         Set_Resource_Type (Resource, Xt_Motif_Render_Table_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNresizeWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("resizeWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCResizeWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ResizeWidth"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNselectThreshold"));
         Set_Internal_Resource_Name (Resource, Enter ("selectThreshold"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSelectThreshold"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("SelectThreshold"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNverifyBell"));
         Set_Internal_Resource_Name (Resource, Enter ("verifyBell"));
         Set_Resource_Class_Name (Resource, Enter ("XmCVerifyBell"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("VerifyBell"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Text_Field_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Text_Field_Widget_Class);
      end;

      ------------------------------------------------------------------------
      --  Motif Gadgets Widget Classes
      ------------------------------------------------------------------------

      --  XmGadget

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Gadget_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Gadget_Widget_Class, Enter ("XmGadget"));
         Set_Super_Class (Xt_Motif_Gadget_Widget_Class,
                          Xt_Motif_Rect_Obj_Widget_Class);
         Set_Is_Meta_Class (Xt_Motif_Gadget_Widget_Class, True);

         --  TODO XmNbackground          --  Отсутствует в реализации.
         --  TODO XmNbackgroundPixmap    --  Отсутствует в реализации.
         --  TODO XmNbottomShadowColor   --  Отсутствует в реализации. ?
         --  TODO XmNbottomShadowPixmap  --  Отсутствует в реализации.
         --  TODO XmNforeground          --  Отсутствует в реализации.
         --  TODO XmNhighlightColor      --  Отсутствует в реализации. ?
         --  TODO XmNhighlightPixmap     --  Отсутствует в реализации.
         --  TODO XmNlayoutDirection
         --  TODO XmNtopShadowColor      --  Отсутствует в реализации. ?
         --  TODO XmNtopShadowPixmap     --  Отсутствует в реализации.
         --  TODO XmNunitType
         --  TODO XmNuserData

         --  TODO XmNhelpCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNborderWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("borderWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBorderWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BorderWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNheight"));
         Set_Internal_Resource_Name (Resource, Enter ("height"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightOnEnter"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightOnEnter"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightOnEnter"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightOnEnter"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNnavigationType"));
         Set_Internal_Resource_Name (Resource, Enter ("navigationType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCNavigationType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("NavigationType"));
         Set_Resource_Type (Resource, Xt_Motif_Navigation_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNshadowThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("shadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtraversalOn"));
         Set_Internal_Resource_Name (Resource, Enter ("traversalOn"));
         Set_Resource_Class_Name (Resource, Enter ("XmCTraversalOn"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("TraversalOn"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNwidth"));
         Set_Internal_Resource_Name (Resource, Enter ("width"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNx"));
         Set_Internal_Resource_Name (Resource, Enter ("x"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Position_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNy"));
         Set_Internal_Resource_Name (Resource, Enter ("y"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Position_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Gadget_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Gadget_Widget_Class);
      end;

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

         --  TODO XmNactivateCallback
         --  TODO XmNarmCallback
         --  TODO XmNdisarmCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowDirection"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowDirection"));
         Set_Resource_Class_Name (Resource, Enter ("XmNArrowDirection"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArrowDirection"));
         Set_Resource_Type (Resource, Xt_Motif_Arrow_Direction_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdetailShadowThickness"));
         Set_Internal_Resource_Name
          (Resource, Enter ("detailShadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmultiClick"));
         Set_Internal_Resource_Name (Resource, Enter ("multiClick"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMultiClick"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MultiClick"));
         Set_Resource_Type (Resource, Xt_Motif_Multi_Click_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Arrow_Button_Gadget_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Arrow_Button_Gadget_Widget_Class);
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

         --  TODO XmNdetail
         --  TODO XmNdetailCount
         --  TODO XmNfontList
         --  TODO XmNlargeIconMask
         --  TODO XmNlargeIconPixmap
         --  TODO XmNsmallIconMask
         --  TODO XmNsmallIconPixmap
         --  TODO XmNviewType
         --  TODO XmNvisualEmphasis

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNalignment"));
         Set_Internal_Resource_Name (Resource, Enter ("alignment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAlignment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Alignment"));
         Set_Resource_Type (Resource, Xt_Motif_Alignment_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlabelString"));
         Set_Internal_Resource_Name (Resource, Enter ("labelString"));
         Set_Resource_Class_Name (Resource, Enter ("XmCXmString"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("XmString"));
         Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrenderTable"));
         Set_Internal_Resource_Name (Resource, Enter ("renderTable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRenderTable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RenderTable"));
         Set_Resource_Type (Resource, Xt_Motif_Render_Table_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Icon_Gadget_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Icon_Gadget_Widget_Class);
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

         --  TODO XmNaccelerator
         --  TODO XmNfontList
         --  TODO XmNlabelInsensitivePixmap
         --  TODO XmNmnemonic
         --  TODO XmNmnemonicCharSet
         --  TODO XmNstringDirection

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNacceleratorText"));
         Set_Internal_Resource_Name (Resource, Enter ("acceleratorText"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAcceleratorText"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("AcceleratorText"));
         Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNalignment"));
         Set_Internal_Resource_Name (Resource, Enter ("alignment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAlignment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Alignment"));
         Set_Resource_Type (Resource, Xt_Motif_Alignment_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlabelPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("labelPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCLabelPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("LabelPixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlabelString"));
         Set_Internal_Resource_Name (Resource, Enter ("labelString"));
         Set_Resource_Class_Name (Resource, Enter ("XmCXmString"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("XmString"));
         Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlabelType"));
         Set_Internal_Resource_Name (Resource, Enter ("labelType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCLabelType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("LabelType"));
         Set_Resource_Type (Resource, Xt_Motif_Label_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginBottom"));
         Set_Internal_Resource_Name (Resource, Enter ("marginBottom"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginBottom"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginBottom"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginLeft"));
         Set_Internal_Resource_Name (Resource, Enter ("marginLeft"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginLeft"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginLeft"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginRight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginRight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginRight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginRight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginTop"));
         Set_Internal_Resource_Name (Resource, Enter ("marginTop"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginTop"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginTop"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrecomputeSize"));
         Set_Internal_Resource_Name (Resource, Enter ("recomputeSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRecomputeSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RecomputeSize"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrenderTable"));
         Set_Internal_Resource_Name (Resource, Enter ("renderTable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRenderTable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RenderTable"));
         Set_Resource_Type (Resource, Xt_Motif_Render_Table_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Label_Gadget_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Label_Gadget_Widget_Class);
      end;

      --  XmCascadeButtonGadget

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Cascade_Button_Gadget_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Cascade_Button_Gadget_Widget_Class,
                   Enter ("XmCascadeButtonGadget"));
         Set_Super_Class (Xt_Motif_Cascade_Button_Gadget_Widget_Class,
                          Xt_Motif_Label_Gadget_Widget_Class);

         --  TODO XmNactivateCallback
         --  TODO XmNcascadingCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcascadePixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("cascadePixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Pixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);


         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmappingDelay"));
         Set_Internal_Resource_Name (Resource, Enter ("mappingDelay"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMappingDelay"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MappingDelay"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsubMenuId"));
         Set_Internal_Resource_Name (Resource, Enter ("subMenuId"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMenuWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MenuWidget"));
         Set_Resource_Type
          (Resource, Xt_Motif_Menu_Widget_Reference_Resource_Type);
--         Set_Widget_Reference_Constraints (Resource, );
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources
          (Xt_Motif_Cascade_Button_Gadget_Widget_Class, Resources);

         Merge_Inherited_Resources
          (Xt_Motif_Cascade_Button_Gadget_Widget_Class);
      end;

      --  XmPushButtonGadget

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Push_Button_Gadget_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Push_Button_Gadget_Widget_Class,
                   Enter ("XmPushButtonGadget"));
         Set_Super_Class (Xt_Motif_Push_Button_Gadget_Widget_Class,
                          Xt_Motif_Label_Gadget_Widget_Class);

         --  TODO XmNshowAsDefault

         --  TODO XmNactivateCallback
         --  TODO XmNarmCallback
         --  TODO XmNdisarmCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarmColor"));
         Set_Internal_Resource_Name (Resource, Enter ("armColor"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArmColor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArmColor"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarmPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("armPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArmPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArmPixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name
          (Resource, Enter ("XmNdefaultButtonShadowThickness"));
         Set_Internal_Resource_Name
          (Resource, Enter ("defaultButtonShadowThickness"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCDefaultButtonShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("DefaultButtonShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNfillOnArm"));
         Set_Internal_Resource_Name (Resource, Enter ("fillOnArm"));
         Set_Resource_Class_Name (Resource, Enter ("XmCFillOnArm"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("FillOnArm"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmultiClick"));
         Set_Internal_Resource_Name (Resource, Enter ("multiClick"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMultiClick"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MultiClick"));
         Set_Resource_Type (Resource, Xt_Motif_Multi_Click_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Push_Button_Gadget_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Push_Button_Gadget_Widget_Class);
      end;

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

         --  TODO XmNfillOnSelect
         --  TODO XmNindeterminatePixmap
         --  TODO XmNselectColor
         --  TODO XmNselectInsensitivePixmap
         --  TODO XmNselectPixmap
         --  TODO XmNset
         --  TODO XmNtoggleMode
         --  TODO XmNunselectColor
         --  TODO XmNvisibleWhenOff

         --  TODO XmNarmCallback
         --  TODO XmNdisarmCallback
         --  TODO XmNvalueChangedCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdetailShadowThickness"));
         Set_Internal_Resource_Name
          (Resource, Enter ("detailShadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorOn"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorOn"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorOn"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorOn"));
         Set_Resource_Type
          (Resource, Xt_Motif_Toggle_Indicator_On_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorSize"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorSize"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorType"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorType"));
         Set_Resource_Type (Resource, Xt_Motif_Indicator_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Toggle_Button_Gadget_Widget_Class, Resources);

         Merge_Inherited_Resources
          (Xt_Motif_Toggle_Button_Gadget_Widget_Class);
      end;

      --  XmSeparatorGadget

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Separator_Gadget_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Separator_Gadget_Widget_Class,
                   Enter ("XmSeparatorGadget"));
         Set_Super_Class (Xt_Motif_Separator_Gadget_Widget_Class,
                          Xt_Motif_Gadget_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmargin"));
         Set_Internal_Resource_Name (Resource, Enter ("margin"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMargin"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Margin"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNseparatorType"));
         Set_Internal_Resource_Name (Resource, Enter ("separatorType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSeparatorType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SeparatorType"));
         Set_Resource_Type (Resource, Xt_Motif_Separator_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Separator_Gadget_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Separator_Gadget_Widget_Class);
      end;

      ------------------------------------------------------------------------
      --  Motif Shells Widget Classes
      ------------------------------------------------------------------------

      --  XmDialogShell

      Xt_Motif_Dialog_Shell_Widget_Class := Create_Widget_Class;
      Set_Name (Xt_Motif_Dialog_Shell_Widget_Class, Enter ("XmDialogShell"));
      Set_Super_Class (Xt_Motif_Dialog_Shell_Widget_Class,
                       Xt_Motif_Transient_Shell_Widget_Class);

      Merge_Inherited_Resources (Xt_Motif_Dialog_Shell_Widget_Class);

      ------------------------------------------------------------------------
      --  Motif Managers Widget Classes
      ------------------------------------------------------------------------

      --  XmManager

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Manager_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Manager_Widget_Class, Enter ("XmManager"));
         Set_Super_Class (Xt_Motif_Manager_Widget_Class,
                          Xt_Motif_Constraint_Widget_Class);
         Set_Is_Meta_Class (Xt_Motif_Manager_Widget_Class, True);

         --  TODO XmNlayoutDirection
         --  TODO XmNstringDirection
         --  TODO XmNunitType
         --  TODO XmNuserData

         --  TODO XmNhelpCallback
         --  TODO XmNpopupHandlerCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNborderWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("borderWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBorderWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BorderWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbottomShadowColor"));
         Set_Internal_Resource_Name (Resource, Enter ("bottomShadowColor"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBottomShadowColor"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("BottomShadowColor"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbottomShadowPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("bottomShadowPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBottomShadowPixmap"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("BottomShadowPixmap"));
         Set_Resource_Type
          (Resource, Xt_Motif_No_Scaling_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNforeground"));
         Set_Internal_Resource_Name (Resource, Enter ("foreground"));
         Set_Resource_Class_Name (Resource, Enter ("XmCForeground"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Foreground"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNheight"));
         Set_Internal_Resource_Name (Resource, Enter ("height"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightColor"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightColor"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightColor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("HighlightColor"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightPixmap"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightPixmap"));
         Set_Resource_Type
          (Resource, Xt_Motif_No_Scaling_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNinitialFocus"));
         Set_Internal_Resource_Name (Resource, Enter ("initialFocus"));
         Set_Resource_Class_Name (Resource, Enter ("XmCInitialFocus"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("InitialFocus"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNnavigationType"));
         Set_Internal_Resource_Name (Resource, Enter ("navigationType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCNavigationType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("NavigationType"));
         Set_Resource_Type (Resource, Xt_Motif_Navigation_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNshadowThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("shadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtopShadowColor"));
         Set_Internal_Resource_Name (Resource, Enter ("topShadowColor"));
         Set_Resource_Class_Name (Resource, Enter ("XmCTopShadowColor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("TopShadowColor"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtopShadowPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("topShadowPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCTopShadowPixmap"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("TopShadowPixmap"));
         Set_Resource_Type
          (Resource, Xt_Motif_No_Scaling_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtraversalOn"));
         Set_Internal_Resource_Name (Resource, Enter ("traversalOn"));
         Set_Resource_Class_Name (Resource, Enter ("XmCTraversalOn"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("TraversalOn"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNwidth"));
         Set_Internal_Resource_Name (Resource, Enter ("width"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNx"));
         Set_Internal_Resource_Name (Resource, Enter ("x"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Position_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNy"));
         Set_Internal_Resource_Name (Resource, Enter ("y"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Position_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Manager_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Manager_Widget_Class);
      end;

      --  XmBulletinBoard

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Bulletin_Board_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Bulletin_Board_Widget_Class,
                   Enter ("XmBulletinBoard"));
         Set_Super_Class (Xt_Motif_Bulletin_Board_Widget_Class,
                          Xt_Motif_Manager_Widget_Class);

         --  TODO XmNbuttonFontList
         --  TODO XmNbuttonRenderTable
         --  TODO XmNdefaultPosition
         --  TODO XmNlabelFontList
         --  TODO XmNlabelRenderTable
         --  TODO XmNtextFontList
         --  TODO XmNtextRenderTable

         --  TODO XmNfocusCallback
         --  TODO XmNmapCallback
         --  TODO XmNunmapCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNallowOverlap"));
         Set_Internal_Resource_Name (Resource, Enter ("allowOverlap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAllowOverlap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("AllowOverlap"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNautoUnmanage"));
         Set_Internal_Resource_Name (Resource, Enter ("autoUnmanage"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAutoUnmanage"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("AutoUnmanage"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcancelButton"));
         Set_Internal_Resource_Name (Resource, Enter ("cancelButton"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Child);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdefaultButton"));
         Set_Internal_Resource_Name (Resource, Enter ("defaultButton"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Child);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdialogStyle"));
         Set_Internal_Resource_Name (Resource, Enter ("dialogStyle"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDialogStyle"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("DialogStyle"));
         Set_Resource_Type (Resource, Xt_Motif_Dialog_Style_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdialogTitle"));
         Set_Internal_Resource_Name (Resource, Enter ("dialogTitle"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDialogTitle"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("DialogTitle"));
         Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNnoResize"));
         Set_Internal_Resource_Name (Resource, Enter ("noResize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCNoResize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("NoResize"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNresizePolicy"));
         Set_Internal_Resource_Name (Resource, Enter ("resizePolicy"));
         Set_Resource_Class_Name (Resource, Enter ("XmCResizePolicy"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ResizePolicy"));
         Set_Resource_Type (Resource, Xt_Motif_Resize_Policy_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNshadowType"));
         Set_Internal_Resource_Name (Resource, Enter ("shadowType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ShadowType"));
         Set_Resource_Type (Resource, Xt_Motif_Shadow_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtextTranslations"));
         Set_Internal_Resource_Name (Resource, Enter ("textTranslations"));
         Set_Resource_Class_Name (Resource, Enter ("XmCTranslations"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Translations"));
         Set_Resource_Type
          (Resource, Xt_Motif_Translation_Table_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Bulletin_Board_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Bulletin_Board_Widget_Class);
      end;

      --  XmForm

      declare
         Resources   : constant List_Id := New_List;
         Constraints : constant List_Id := New_List;
         Resource    : Node_Id;

      begin
         Xt_Motif_Form_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Form_Widget_Class, Enter ("XmForm"));
         Set_Super_Class (Xt_Motif_Form_Widget_Class,
                          Xt_Motif_Bulletin_Board_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNfractionBase"));
         Set_Internal_Resource_Name (Resource, Enter ("fractionBase"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMaxValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaxValue"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhorizontalSpacing"));
         Set_Internal_Resource_Name (Resource, Enter ("horizontalSpacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrubberPositioning"));
         Set_Internal_Resource_Name (Resource, Enter ("rubberPositioning"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRubberPositioning"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("RubberPositioning"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNverticalSpacing"));
         Set_Internal_Resource_Name (Resource, Enter ("verticalSpacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbottomAttachment"));
         Set_Internal_Resource_Name (Resource, Enter ("bottomAttachment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAttachment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Attachment"));
         Set_Resource_Type (Resource, Xt_Motif_Attachment_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbottomOffset"));
         Set_Internal_Resource_Name (Resource, Enter ("bottomOffset"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOffset"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Offset"));
         Set_Resource_Type (Resource, Xt_Motif_Vertical_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbottomPosition"));
         Set_Internal_Resource_Name (Resource, Enter ("bottomPosition"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbottomWidget"));
         Set_Internal_Resource_Name (Resource, Enter ("bottomWidget"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Parents_Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNleftAttachment"));
         Set_Internal_Resource_Name (Resource, Enter ("leftAttachment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAttachment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Attachment"));
         Set_Resource_Type (Resource, Xt_Motif_Attachment_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNleftOffset"));
         Set_Internal_Resource_Name (Resource, Enter ("leftOffset"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOffset"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Offset"));
         Set_Resource_Type (Resource, Xt_Motif_Horizontal_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNleftPosition"));
         Set_Internal_Resource_Name (Resource, Enter ("leftPosition"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNleftWidget"));
         Set_Internal_Resource_Name (Resource, Enter ("leftWidget"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Parents_Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNresizable"));
         Set_Internal_Resource_Name (Resource, Enter ("resizable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBoolean"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Boolean"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrightAttachment"));
         Set_Internal_Resource_Name (Resource, Enter ("rightAttachment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAttachment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Attachment"));
         Set_Resource_Type (Resource, Xt_Motif_Attachment_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrightOffset"));
         Set_Internal_Resource_Name (Resource, Enter ("rightOffset"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOffset"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Offset"));
         Set_Resource_Type (Resource, Xt_Motif_Horizontal_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrightPosition"));
         Set_Internal_Resource_Name (Resource, Enter ("rightPosition"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrightWidget"));
         Set_Internal_Resource_Name (Resource, Enter ("rightWidget"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Parents_Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtopAttachment"));
         Set_Internal_Resource_Name (Resource, Enter ("topAttachment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAttachment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Attachment"));
         Set_Resource_Type (Resource, Xt_Motif_Attachment_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtopOffset"));
         Set_Internal_Resource_Name (Resource, Enter ("topOffset"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOffset"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Offset"));
         Set_Resource_Type (Resource, Xt_Motif_Vertical_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtopPosition"));
         Set_Internal_Resource_Name (Resource, Enter ("topPosition"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtopWidget"));
         Set_Internal_Resource_Name (Resource, Enter ("topWidget"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Parents_Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Form_Widget_Class, Resources);
         Set_Constraint_Resources (Xt_Motif_Form_Widget_Class, Constraints);

         Merge_Inherited_Resources (Xt_Motif_Form_Widget_Class);
      end;

      --  XmMessageBox

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Message_Box_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Message_Box_Widget_Class, Enter ("XmMessageBox"));
         Set_Super_Class (Xt_Motif_Message_Box_Widget_Class,
                          Xt_Motif_Bulletin_Board_Widget_Class);

         --  TODO XmNcancelCallback
         --  TODO XmNokCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcancelLabelString"));
         Set_Internal_Resource_Name (Resource, Enter ("cancelLabelString"));
         Set_Resource_Class_Name (Resource, Enter ("XmCXmString"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("XmString"));
         Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdefaultButtonType"));
         Set_Internal_Resource_Name (Resource, Enter ("defaultButtonType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDefaultButtonType"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("DefaultButtonType"));
         Set_Resource_Type
          (Resource, Xt_Motif_Default_Button_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdialogType"));
         Set_Internal_Resource_Name (Resource, Enter ("dialogType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDialogType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("DialogType"));
         Set_Resource_Type (Resource, Xt_Motif_Dialog_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhelpLabelString"));
         Set_Internal_Resource_Name (Resource, Enter ("helpLabelString"));
         Set_Resource_Class_Name (Resource, Enter ("XmCXmString"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("XmString"));
         Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmessageAlignment"));
         Set_Internal_Resource_Name (Resource, Enter ("messageAlignment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAlignment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Alignment"));
         Set_Resource_Type (Resource, Xt_Motif_Alignment_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmessageString"));
         Set_Internal_Resource_Name (Resource, Enter ("messageString"));
         Set_Resource_Class_Name (Resource, Enter ("XmCXmString"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("XmString"));
         Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNminimizeButtons"));
         Set_Internal_Resource_Name (Resource, Enter ("minimizeButtons"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMinimizeButtons"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("MinimizeButtons"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNokLabelString"));
         Set_Internal_Resource_Name (Resource, Enter ("okLabelString"));
         Set_Resource_Class_Name (Resource, Enter ("XmCXmString"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("XmString"));
         Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsymbolPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("symbolPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Pixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Dynamic_Pixmap_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Message_Box_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Message_Box_Widget_Class);
      end;

      --  XmSelectionBox

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Selection_Box_Widget_Class := Create_Widget_Class;
         Set_Name
          (Xt_Motif_Selection_Box_Widget_Class, Enter ("XmSelectionBox"));
         Set_Super_Class (Xt_Motif_Selection_Box_Widget_Class,
                          Xt_Motif_Bulletin_Board_Widget_Class);

         --  TODO XmNapplyLabelString
         --  TODO XmNcancelLabelString
         --  TODO XmNdialogType
         --  TODO XmNhelpLabelString
         --  TODO XmNlistItemCount
         --  TODO XmNlistItems
         --  TODO XmNlistLabelString
         --  TODO XmNlistVisibleItemCount
         --  TODO XmNminimizeButtons
         --  TODO XmNmustMatch
         --  TODO XmNokLabelString
         --  TODO XmNselectionLabelString
         --  TODO XmNtextAccelerators
         --  TODO XmNtextColumns
         --  TODO XmNtextString

         --  TODO XmNapplyCallback
         --  TODO XmNcancelCallback
         --  TODO XmNnoMatchCallback
         --  TODO XmNokCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNchildPlacement"));
         Set_Internal_Resource_Name (Resource, Enter ("childPlacement"));
         Set_Resource_Class_Name (Resource, Enter ("XmCChildPlacement"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ChildPlacement"));
         Set_Resource_Type (Resource, Xt_Motif_Child_Placement_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Selection_Box_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Selection_Box_Widget_Class);
      end;

      --  XmCommand

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
      begin
         Xt_Motif_Command_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Command_Widget_Class, Enter ("XmCommand"));
         Set_Super_Class (Xt_Motif_Command_Widget_Class,
                          Xt_Motif_Selection_Box_Widget_Class);

         --  TODO XmNcommand
         --  TODO XmNhistoryItems
         --  TODO XmNhistoryItemCount
         --  TODO XmNhistoryMaxItems
         --  TODO XmNhistoryVisibleItemCount
         --  TODO XmNpromptString

         --  TODO XmNcommandChangedCallback
         --  TODO XmNcommandEnteredCallback

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);
--
--         Set_Resources (Xt_Motif_Command_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Command_Widget_Class);
      end;

      --  XmFileSelectionBox

--      declare
--         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;
--
      begin
         Xt_Motif_File_Selection_Box_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_File_Selection_Box_Widget_Class,
                   Enter ("XmFileSelectionBox"));
         Set_Super_Class (Xt_Motif_File_Selection_Box_Widget_Class,
                          Xt_Motif_Selection_Box_Widget_Class);

         --  TODO XmNdirectory
         --  TODO XmNdirectoryValid
         --  TODO XmNdirListItems
         --  TODO XmNdirListItemCount
         --  TODO XmNdirListLabelString
         --  TODO XmNdirMask
         --  TODO XmNdirSearchProc
         --  TODO XmNdirSpec
         --  TODO XmNdirTextLabelString
         --  TODO XmNfileFilterStyle
         --  TODO XmNfileListItems
         --  TODO XmNfileListItemCount
         --  TODO XmNfileListLabelString
         --  TODO XmNfileSearchProc
         --  TODO XmNfileTypeMask
         --  TODO XmNfilterLabelString
         --  TODO XmNlistUpdated
         --  TODO XmNnoMatchString
         --  TODO XmNpathMode
         --  TODO XmNpattern
         --  TODO XmNqualifySearchDataProc

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);

         Merge_Inherited_Resources (Xt_Motif_File_Selection_Box_Widget_Class);
      end;

      --  XmComboBox

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Combo_Box_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Combo_Box_Widget_Class, Enter ("XmComboBox"));
         Set_Super_Class (Xt_Motif_Combo_Box_Widget_Class,
                          Xt_Motif_Manager_Widget_Class);

         --  TODO XmNcolumns
         --  TODO XmNfontList
         --  TODO XmNitemCount
         --  TODO XmNitems
         --  TODO XmNlist
         --  TODO XmNselectedItem
         --  TODO XmNselectedPosition
         --  TODO XmNtextField
         --  TODO XmNvisibleItemCount

         --  TODO XmNselectionCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowSize"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArrowSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArrowSize"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowSpacing"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowSpacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArrowSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArrowSpacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcomboBoxType"));
         Set_Internal_Resource_Name (Resource, Enter ("comboBoxType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCComboBoxType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ComboBoxType"));
         Set_Resource_Type (Resource, Xt_Motif_Combo_Box_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmatchBehavior"));
         Set_Internal_Resource_Name (Resource, Enter ("matchBehavior"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMatchBehavior"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MatchBehavior"));
         Set_Resource_Type (Resource, Xt_Motif_Match_Behavior_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpositionMode"));
         Set_Internal_Resource_Name (Resource, Enter ("positionMode"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPositionMode"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PositionMode"));
         Set_Resource_Type (Resource, Xt_Motif_Position_Mode_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrenderTable"));
         Set_Internal_Resource_Name (Resource, Enter ("renderTable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRenderTable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RenderTable"));
         Set_Resource_Type (Resource, Xt_Motif_Render_Table_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Combo_Box_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Combo_Box_Widget_Class);
      end;

      --  XmContainer

      declare
         Resources   : constant List_Id := New_List;
         Constraints : constant List_Id := New_List;
         Resource    : Node_Id;

      begin
         Xt_Motif_Container_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Container_Widget_Class, Enter ("XmContainer"));
         Set_Super_Class (Xt_Motif_Container_Widget_Class,
                          Xt_Motif_Manager_Widget_Class);

         --  TODO XmNcollapsedStatePixmap
         --  TODO XmNdetailColumnHeading
         --  TODO XmNdetailColumnHeadingCount
         --  TODO XmNdetailOrder
         --  TODO XmNdetailOrderCount
         --  TODO XmNdetailTabList
         --  TODO XmNentryViewType
         --  TODO XmNexpandedStatePixmap
         --  TODO XmNfontList
         --  TODO XmNprimaryOwnership
         --  TODO XmNselectColor
         --  TODO XmNselectedObjects
         --  TODO XmNselectedObjectCount
         --  TODO XmNselectionPolicy
         --  TODO XmNselectionTechnique
         --  TODO XmNspatialIncludeModel
         --  TODO XmNspatialResizeModel
         --  TODO XmNspatialSnapModel
         --  TODO XmNspatialStyle

         --  TODO XmNconvertCallback
         --  TODO XmNdefaultActionCallback
         --  TODO XmNdestinationCallback
         --  TODO XmNoutlineChangedCallback
         --  TODO XmNselectionCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNautomaticSelection"));
         Set_Internal_Resource_Name (Resource, Enter ("automaticSelection"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAutomaticSelection"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("AutomaticSelection"));
         Set_Resource_Type
          (Resource, Xt_Motif_Automatic_Selection_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlargeCellHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("largeCellHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCCellHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("CellHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlargeCellWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("largeCellWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCCellWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("CellWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlayoutType"));
         Set_Internal_Resource_Name (Resource, Enter ("layoutType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCLayoutType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("LayoutType"));
         Set_Resource_Type (Resource, Xt_Motif_Layout_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNoutlineButtonPolicy"));
         Set_Internal_Resource_Name (Resource, Enter ("outlineButtonPolicy"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOutlineButtonPolicy"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("OutlineButtonPolicy"));
         Set_Resource_Type
          (Resource, Xt_Motif_Outline_Button_Policy_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNoutlineColumnWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("outlineColumnWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOutlineColumnWidth"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("OutlineColumnWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNoutlineIndentation"));
         Set_Internal_Resource_Name (Resource, Enter ("outlineIndentation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOutlineIndentation"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("OutlineIndentation"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNoutlineLineStyle"));
         Set_Internal_Resource_Name (Resource, Enter ("outlineLineStyle"));
         Set_Resource_Class_Name (Resource, Enter ("XmCLineStyle"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("LineStyle"));
         Set_Resource_Type
          (Resource, Xt_Motif_Container_Line_Style_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrenderTable"));
         Set_Internal_Resource_Name (Resource, Enter ("renderTable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRenderTable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RenderTable"));
         Set_Resource_Type (Resource, Xt_Motif_Render_Table_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsmallCellHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("smallCellHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCCellHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("CellHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsmallCellWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("smallCellWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCCellWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("CellWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNentryParent"));
         Set_Internal_Resource_Name (Resource, Enter ("entryParent"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Parents_Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNoutlineState"));
         Set_Internal_Resource_Name (Resource, Enter ("outlineState"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOutlineState"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("OutlineState"));
         Set_Resource_Type (Resource, Xt_Motif_Outline_State_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpositionIndex"));
         Set_Internal_Resource_Name (Resource, Enter ("positionIndex"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPositionIndex"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PositionIndex"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Container_Widget_Class, Resources);
         Set_Constraint_Resources
          (Xt_Motif_Container_Widget_Class, Constraints);

         Merge_Inherited_Resources (Xt_Motif_Container_Widget_Class);
      end;

      --  XmDrawingArea

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Drawing_Area_Widget_Class := Create_Widget_Class;
         Set_Name
          (Xt_Motif_Drawing_Area_Widget_Class, Enter ("XmDrawingArea"));
         Set_Super_Class (Xt_Motif_Drawing_Area_Widget_Class,
                          Xt_Motif_Manager_Widget_Class);

         --  TODO XmNconvertCallback
         --  TODO XmNdestinationCallback
         --  TODO XmNexposeCallback
         --  TODO XmNinputCallback
         --  TODO XmNresizeCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNresizePolicy"));
         Set_Internal_Resource_Name (Resource, Enter ("resizePolicy"));
         Set_Resource_Class_Name (Resource, Enter ("XmCResizePolicy"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ResizePolicy"));
         Set_Resource_Type (Resource, Xt_Motif_Resize_Policy_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Drawing_Area_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Drawing_Area_Widget_Class);
      end;

      --  XmFrame

      --  Ресурс XmNchildType дублируется XmNframeChildType и сохранён для
      --  обеспечения обратной совместимости. Используется новое имя ресурса.

      declare
         Resources   : constant List_Id := New_List;
         Constraints : constant List_Id := New_List;
         Resource    : Node_Id;

      begin
         Xt_Motif_Frame_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Frame_Widget_Class, Enter ("XmFrame"));
         Set_Super_Class (Xt_Motif_Frame_Widget_Class,
                          Xt_Motif_Manager_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNshadowType"));
         Set_Internal_Resource_Name (Resource, Enter ("shadowType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ShadowType"));
         Set_Resource_Type (Resource, Xt_Motif_Shadow_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNchildHorizontalAlignment"));
         Set_Internal_Resource_Name
          (Resource, Enter ("childHorizontalAlignment"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCChildHorizontalAlignment"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ChildHorizontalAlignment"));
         Set_Resource_Type
          (Resource, Xt_Motif_Child_Horizontal_Alignment_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNchildHorizontalSpacing"));
         Set_Internal_Resource_Name
          (Resource, Enter ("childHorizontalSpacing"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCChildHorizontalSpacing"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ChildHorizontalSpacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNchildVerticalAlignment"));
         Set_Internal_Resource_Name
          (Resource, Enter ("childVerticalAlignment"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCChildVerticalAlignment"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ChildVerticalAlignment"));
         Set_Resource_Type
          (Resource, Xt_Motif_Child_Vertical_Alignment_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNframeChildType"));
         Set_Internal_Resource_Name (Resource, Enter ("frameChildType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCFrameChildType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("FrameChildType"));
         Set_Resource_Type (Resource, Xt_Motif_Frame_Child_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Frame_Widget_Class, Resources);
         Set_Constraint_Resources (Xt_Motif_Frame_Widget_Class, Constraints);

         Merge_Inherited_Resources (Xt_Motif_Frame_Widget_Class);
      end;

      --  XmNotebook

      declare
         Resources   : constant List_Id := New_List;
         Constraints : constant List_Id := New_List;
         Resource    : Node_Id;

      begin
         Xt_Motif_Notebook_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Notebook_Widget_Class, Enter ("XmNotebook"));
         Set_Super_Class (Xt_Motif_Notebook_Widget_Class,
                          Xt_Motif_Manager_Widget_Class);

         --  TODO XmNbackPageBackground
         --  TODO XmNbackPageForeground
         --  TODO XmNbackPageNumber
         --  TODO XmNbackPagePlacement
         --  TODO XmNbindingPixmap
         --  TODO XmNframeBackground

         --  TODO XmNpageChangedCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbackPageSize"));
         Set_Internal_Resource_Name (Resource, Enter ("backPageSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBackPageSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BackPageSize"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbindingType"));
         Set_Internal_Resource_Name (Resource, Enter ("bindingType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBindingType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BindingType"));
         Set_Resource_Type (Resource, Xt_Motif_Binding_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbindingWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("bindingWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBindingWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BindingWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcurrentPageNumber"));
         Set_Internal_Resource_Name (Resource, Enter ("currentPageNumber"));
         Set_Resource_Class_Name (Resource, Enter ("XmCCurrentPageNumber"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("CurrentPageNumber"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNfirstPageNumber"));
         Set_Internal_Resource_Name (Resource, Enter ("firstPageNumber"));
         Set_Resource_Class_Name (Resource, Enter ("XmCFirstPageNumber"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("FirstPageNumber"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNframeShadowThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("frameShadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNinnerMarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("innerMarginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCInnerMarginHeight"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("InnerMarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNinnerMarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("innerMarginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCInnerMarginWidth"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("InnerMarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlastPageNumber"));
         Set_Internal_Resource_Name (Resource, Enter ("lastPageNumber"));
         Set_Resource_Class_Name (Resource, Enter ("XmCLastPageNumber"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("LastPageNumber"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmajorTabSpacing"));
         Set_Internal_Resource_Name (Resource, Enter ("majorTabSpacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMajorTabSpacing"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("MajorTabSpacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNminorTabSpacing"));
         Set_Internal_Resource_Name (Resource, Enter ("minorTabSpacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMinorTabSpacing"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("MinorTabSpacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNnotebookChildType"));
         Set_Internal_Resource_Name (Resource, Enter ("notebookChildType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCNotebookChildType"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("NotebookChildType"));
         Set_Resource_Type
          (Resource, Xt_Motif_Notebook_Child_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpageNumber"));
         Set_Internal_Resource_Name (Resource, Enter ("pageNumber"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPageNumber"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PageNumber"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNresizable"));
         Set_Internal_Resource_Name (Resource, Enter ("resizable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCResizable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Resizable"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Notebook_Widget_Class, Resources);
         Set_Constraint_Resources
          (Xt_Motif_Notebook_Widget_Class, Constraints);

         Merge_Inherited_Resources (Xt_Motif_Notebook_Widget_Class);
      end;

      --  XmPanedWindow

      declare
         Resources   : constant List_Id := New_List;
         Constraints : constant List_Id := New_List;
         Resource    : Node_Id;

      begin
         Xt_Motif_Paned_Window_Widget_Class := Create_Widget_Class;
         Set_Name
          (Xt_Motif_Paned_Window_Widget_Class, Enter ("XmPanedWindow"));
         Set_Super_Class (Xt_Motif_Paned_Window_Widget_Class,
                          Xt_Motif_Manager_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrefigureMode"));
         Set_Internal_Resource_Name (Resource, Enter ("refigureMode"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBoolean"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Boolean"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsashHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("sashHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSashHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SashHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsashIndent"));
         Set_Internal_Resource_Name (Resource, Enter ("sashIndent"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSashIndent"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SashIndent"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Position_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsashShadowThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("sashShadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsashWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("sashWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSashWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SashWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNseparatorOn"));
         Set_Internal_Resource_Name (Resource, Enter ("separatorOn"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSeparatorOn"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SeparatorOn"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNallowResize"));
         Set_Internal_Resource_Name (Resource, Enter ("allowResize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBoolean"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Boolean"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpaneMaximum"));
         Set_Internal_Resource_Name (Resource, Enter ("paneMaximum"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPaneMaximum"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PaneMaximum"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpaneMinimum"));
         Set_Internal_Resource_Name (Resource, Enter ("paneMinimum"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPaneMinimum"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PaneMinimum"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpositionIndex"));
         Set_Internal_Resource_Name (Resource, Enter ("positionIndex"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPositionIndex"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PositionIndex"));
         Set_Resource_Type (Resource, Xt_Motif_C_Short_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNskipAdjust"));
         Set_Internal_Resource_Name (Resource, Enter ("skipAdjust"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBoolean"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Boolean"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Paned_Window_Widget_Class, Resources);
         Set_Constraint_Resources
          (Xt_Motif_Paned_Window_Widget_Class, Constraints);

         Merge_Inherited_Resources (Xt_Motif_Paned_Window_Widget_Class);
      end;

      --  XmRowColumn

      declare
         Resources   : constant List_Id := New_List;
         Constraints : constant List_Id := New_List;
         Resource    : Node_Id;

      begin
         Xt_Motif_Row_Column_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Row_Column_Widget_Class, Enter ("XmRowColumn"));
         Set_Super_Class (Xt_Motif_Row_Column_Widget_Class,
                          Xt_Motif_Manager_Widget_Class);

         --  TODO XmNentryClass
         --  TODO XmNentryVerticalAlignment
         --  TODO XmNlabelString
         --  TODO XmNmenuAccelerator
         --  TODO XmNmenuPost
         --  TODO XmNmnemonic
         --  TODO XmNmnemonicCharSet
         --  TODO XmNnumColumns
         --  TODO XmNpopupEnabled
         --  TODO XmNradioAlwaysOne
         --  TODO XmNradioBehavior
         --  TODO XmNtearOffModel
         --  TODO XmNtearOffTitle
         --  TODO XmNwhichButton

         --  TODO XmNentryCallback
         --  TODO XmNmapCallback
         --  TODO XmNtearOffMenuActivateCallback
         --  TODO XmNtearOffMenuDeactivateCallback
         --  TODO XmNunmapCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNadjustLast"));
         Set_Internal_Resource_Name (Resource, Enter ("adjustLast"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAdjustLast"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("AdjustLast"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNadjustMargin"));
         Set_Internal_Resource_Name (Resource, Enter ("adjustMargin"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAdjustMargin"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("AdjustMargin"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNentryAlignment"));
         Set_Internal_Resource_Name (Resource, Enter ("entryAlignment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAlignment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Alignment"));
         Set_Resource_Type (Resource, Xt_Motif_Alignment_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNentryBorder"));
         Set_Internal_Resource_Name (Resource, Enter ("entryBorder"));
         Set_Resource_Class_Name (Resource, Enter ("XmCEntryBorder"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("EntryBorder"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNisAligned"));
         Set_Internal_Resource_Name (Resource, Enter ("isAligned"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIsAligned"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IsAligned"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNisHomogeneous"));
         Set_Internal_Resource_Name (Resource, Enter ("isHomogeneous"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIsHomogeneous"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IsHomogeneous"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmenuHelpWidget"));
         Set_Internal_Resource_Name (Resource, Enter ("menuHelpWidget"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMenuWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MenuWidget"));
         Set_Resource_Type
          (Resource, Xt_Motif_Menu_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmenuHistory"));
         Set_Internal_Resource_Name (Resource, Enter ("menuHistory"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMenuWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MenuWidget"));
         Set_Resource_Type
          (Resource, Xt_Motif_Menu_Widget_Reference_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpacking"));
         Set_Internal_Resource_Name (Resource, Enter ("packing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPacking"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Packing"));
         Set_Resource_Type (Resource, Xt_Motif_Packing_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNresizeHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("resizeHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCResizeHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ResizeHeight"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNresizeWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("resizeWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCResizeWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ResizeWidth"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrowColumnType"));
         Set_Internal_Resource_Name (Resource, Enter ("rowColumnType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRowColumnType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RowColumnType"));
         Set_Resource_Type (Resource, Xt_Motif_Row_Column_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsubMenuId"));
         Set_Internal_Resource_Name (Resource, Enter ("subMenuId"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMenuWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MenuWidget"));
         Set_Resource_Type
          (Resource, Xt_Motif_Menu_Widget_Reference_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpositionIndex"));
         Set_Internal_Resource_Name (Resource, Enter ("positionIndex"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPositionIndex"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PositionIndex"));
         Set_Resource_Type (Resource, Xt_Motif_C_Short_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Row_Column_Widget_Class, Resources);
         Set_Constraint_Resources
          (Xt_Motif_Row_Column_Widget_Class, Constraints);

         Merge_Inherited_Resources (Xt_Motif_Row_Column_Widget_Class);
      end;

      --  XmScale

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Scale_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Scale_Widget_Class, Enter ("XmScale"));
         Set_Super_Class (Xt_Motif_Scale_Widget_Class,
                          Xt_Motif_Manager_Widget_Class);

         --  TODO XmNdecimalPoints
         --  TODO XmNeditable
         --  TODO XmNfontList
         --  TODO XmNprocessingDirection
         --  TODO XmNshowArrows
         --  TODO XmNshowValue
         --  TODO XmNsliderVisual
         --  TODO XmNslidingMode
         --  TODO XmNtitleString

         --  TODO XmNconvertCallback
         --  TODO XmNdragCallback
         --  TODO XmNvalueChangedCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightOnEnter"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightOnEnter"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightOnEnter"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightOnEnter"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmaximum"));
         Set_Internal_Resource_Name (Resource, Enter ("maximum"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMaximum"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Maximum"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNminimum"));
         Set_Internal_Resource_Name (Resource, Enter ("minimum"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMinimum"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Minimum"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrenderTable"));
         Set_Internal_Resource_Name (Resource, Enter ("renderTable"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRenderTable"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RenderTable"));
         Set_Resource_Type (Resource, Xt_Motif_Render_Table_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscaleHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("scaleHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCScaleHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ScaleHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscaleMultiple"));
         Set_Internal_Resource_Name (Resource, Enter ("scaleMultiple"));
         Set_Resource_Class_Name (Resource, Enter ("XmCScaleMultiple"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ScaleMultiple"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscaleWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("scaleWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCScaleWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ScaleWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNshowValue"));
         Set_Internal_Resource_Name (Resource, Enter ("showValue"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShowValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ShowValue"));
         Set_Resource_Type (Resource, Xt_Motif_Show_Value_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsliderMark"));
         Set_Internal_Resource_Name (Resource, Enter ("sliderMark"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSliderMark"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SliderMark"));
         Set_Resource_Type (Resource, Xt_Motif_Slider_Mark_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNvalue"));
         Set_Internal_Resource_Name (Resource, Enter ("value"));
         Set_Resource_Class_Name (Resource, Enter ("XmCValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Value"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Scale_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Scale_Widget_Class);
      end;

      --  XmScrolledWindow

      declare
         Resources   : constant List_Id := New_List;
         Constraints : constant List_Id := New_List;
         Resource    : Node_Id;

      begin
         Xt_Motif_Scrolled_Window_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Scrolled_Window_Widget_Class,
                   Enter ("XmScrolledWindow"));
         Set_Super_Class (Xt_Motif_Scrolled_Window_Widget_Class,
                          Xt_Motif_Manager_Widget_Class);

         --  TODO XmNvisualPolicy

         --  TODO XmNtraverseObscuredCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNautoDragModel"));
         Set_Internal_Resource_Name (Resource, Enter ("autoDragModel"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAutoDragModel"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("AutoDragModel"));
         Set_Resource_Type (Resource, Xt_Motif_Auto_Drag_Model_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNclipWindow"));
         Set_Internal_Resource_Name (Resource, Enter ("clipWindow"));
         Set_Resource_Class_Name (Resource, Enter ("XmCClipWindow"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ClipWindow"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhorizontalScrollBar"));
         Set_Internal_Resource_Name (Resource, Enter ("horizontalScrollBar"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHorizontalScrollBar"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HorizontalScrollBar"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscrollBarDisplayPolicy"));
         Set_Internal_Resource_Name
          (Resource, Enter ("scrollBarDisplayPolicy"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCScrollBarDisplayPolicy"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ScrollBarDisplayPolicy"));
         Set_Resource_Type
          (Resource, Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscrollBarPlacement"));
         Set_Internal_Resource_Name (Resource, Enter ("scrollBarPlacement"));
         Set_Resource_Class_Name (Resource, Enter ("XmCScrollBarPlacement"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ScrollBarPlacement"));
         Set_Resource_Type
          (Resource, Xt_Motif_Scroll_Bar_Placement_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscrolledWindowMarginHeight"));
         Set_Internal_Resource_Name
          (Resource, Enter ("scrolledWindowMarginHeight"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCScrolledWindowMarginHeight"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ScrolledWindowMarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscrolledWindowMarginWidth"));
         Set_Internal_Resource_Name
          (Resource, Enter ("scrolledWindowMarginWidth"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCScrolledWindowMarginWidth"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ScrolledWindowMarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscrollingPolicy"));
         Set_Internal_Resource_Name (Resource, Enter ("scrollingPolicy"));
         Set_Resource_Class_Name (Resource, Enter ("XmCScrollingPolicy"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ScrollingPolicy"));
         Set_Resource_Type (Resource, Xt_Motif_Scrolling_Policy_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNverticalScrollBar"));
         Set_Internal_Resource_Name (Resource, Enter ("verticalScrollBar"));
         Set_Resource_Class_Name (Resource, Enter ("XmCVerticalScrollBar"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("VerticalScrollBar"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNworkWindow"));
         Set_Internal_Resource_Name (Resource, Enter ("workWindow"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWorkWindow"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("WorkWindow"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscrolledWindowChildType"));
         Set_Internal_Resource_Name
          (Resource, Enter ("scrolledWindowChildType"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCScrolledWindowChildType"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ScrolledWindowChildType"));
         Set_Resource_Type
          (Resource, Xt_Motif_Scrolled_Window_Child_Type_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Scrolled_Window_Widget_Class, Resources);
         Set_Constraint_Resources
          (Xt_Motif_Scrolled_Window_Widget_Class, Constraints);

         Merge_Inherited_Resources (Xt_Motif_Scrolled_Window_Widget_Class);
      end;

      --  XmMainWindow

      declare
         Resources : constant List_Id := New_List;
         Resource  : Node_Id;

      begin
         Xt_Motif_Main_Window_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Main_Window_Widget_Class,
                   Enter ("XmMainWindow"));
         Set_Super_Class (Xt_Motif_Main_Window_Widget_Class,
                          Xt_Motif_Scrolled_Window_Widget_Class);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcommandWindow"));
         Set_Internal_Resource_Name (Resource, Enter ("commandWindow"));
         Set_Resource_Class_Name (Resource, Enter ("XmCCommandWindow"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("CommandWindow"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcommandWindowLocation"));
         Set_Internal_Resource_Name
          (Resource, Enter ("commandWindowLocation"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCCommandWindowLocation"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("CommandWindowLocation"));
         Set_Resource_Type
          (Resource, Xt_Motif_Command_Window_Location_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmainWindowMarginHeight"));
         Set_Internal_Resource_Name
          (Resource, Enter ("mainWindowMarginHeight"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCMainWindowMarginHeight"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("MainWindowMarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmainWindowMarginWidth"));
         Set_Internal_Resource_Name
          (Resource, Enter ("mainWindowMarginWidth"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCMainWindowMarginWidth"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("MainWindowMarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmenuBar"));
         Set_Internal_Resource_Name (Resource, Enter ("menuBar"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMenuBar"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MenuBar"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmessageWindow"));
         Set_Internal_Resource_Name (Resource, Enter ("messageWindow"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMessageWindow"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MessageWindow"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Set_Widget_Reference_Constraints (Resource, Child);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNshowSeparator"));
         Set_Internal_Resource_Name (Resource, Enter ("showSeparator"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShowSeparator"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ShowSeparator"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Main_Window_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Main_Window_Widget_Class);
      end;

      --  XmSimpleSpinBox

      --  Очень сомнительно, что это действительно класс. Более правдоподобно,
      --  что это субкласс от XmSpinBox со специфическим дочерним виджетом.

      declare
         Resources : constant List_Id := New_List;
--         Resource  : Node_Id;

      begin
         Xt_Motif_Simple_Spin_Box_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Simple_Spin_Box_Widget_Class,
                   Enter ("XmSimpleSpinBox"));
         Set_Super_Class (Xt_Motif_Simple_Spin_Box_Widget_Class,
                          Xt_Motif_Manager_Widget_Class);

         --  TODO XmNarrowLayout
         --  TODO XmNarrowSensitivity
         --  TODO XmNcolumns
         --  TODO XmNdecimalPoints
         --  TODO XmNeditable
         --  TODO XmNincrementValue
         --  TODO XmNinitialDelay
         --  TODO XmNmaximumValue
         --  TODO XmNminimumValue
         --  TODO XmNnumValues
         --  TODO XmNposition
         --  TODO XmNrepeatDelay
         --  TODO XmNspinBoxChildType
         --  TODO XmNtextField
         --  TODO XmNvalues

         --  TODO XmNmodifyVerifyCallback
         --  TODO XmNvalueChangedCallback

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Simple_Spin_Box_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Simple_Spin_Box_Widget_Class);
      end;

      --  XmSpinBox

      declare
         Resources   : constant List_Id := New_List;
         Constraints : constant List_Id := New_List;
         Resource    : Node_Id;

      begin
         Xt_Motif_Spin_Box_Widget_Class := Create_Widget_Class;
         Set_Name (Xt_Motif_Spin_Box_Widget_Class, Enter ("XmSpinBox"));
         Set_Super_Class (Xt_Motif_Spin_Box_Widget_Class,
                          Xt_Motif_Manager_Widget_Class);

         --  TODO XmNnumValues
         --  TODO XmNposition
         --  TODO XmNpositionType
         --  TODO XmNspinBoxChildType
         --  TODO XmNvalues

         --  TODO XmNmodifyVerifyCallback
         --  TODO XmNvalueChangedCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowLayout"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowLayout"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArrowLayout"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArrowLayout"));
         Set_Resource_Type (Resource, Xt_Motif_Arrow_Layout_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowOrientation"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowOrientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArrowOrientation"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ArrowOrientation"));
         Set_Resource_Type
          (Resource, Xt_Motif_Arrow_Orientation_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowSize"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArrowSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArrowSize"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdefaultArrowSensitivity"));
         Set_Internal_Resource_Name
          (Resource, Enter ("defaultArrowSensitivity"));
         Set_Resource_Class_Name
          (Resource, Enter ("XmCDefaultArrowSensitivity"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("DefaultArrowSensitivity"));
         Set_Resource_Type
          (Resource, Xt_Motif_Arrow_Sensitivity_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdetailShadowThickness"));
         Set_Internal_Resource_Name
          (Resource, Enter ("detailShadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNinitialDelay"));
         Set_Internal_Resource_Name (Resource, Enter ("initialDelay"));
         Set_Resource_Class_Name (Resource, Enter ("XmCInitialDelay"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("InitialDelay"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrepeatDelay"));
         Set_Internal_Resource_Name (Resource, Enter ("repeatDelay"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRepeatDelay"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RepeatDelay"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowSensitivity"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowSensitivity"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArrowSensitivity"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ArrowSensitivity"));
         Set_Resource_Type
          (Resource, Xt_Motif_Arrow_Sensitivity_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdecimalPoints"));
         Set_Internal_Resource_Name (Resource, Enter ("decimalPoints"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDecimalPoints"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("DecimalPoints"));
         Set_Resource_Type (Resource, Xt_Motif_C_Short_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNincrementValue"));
         Set_Internal_Resource_Name (Resource, Enter ("incrementValue"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIncrementValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IncrementValue"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmaximumValue"));
         Set_Internal_Resource_Name (Resource, Enter ("maximumValue"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMaximumValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaximumValue"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNminimumValue"));
         Set_Internal_Resource_Name (Resource, Enter ("minimumValue"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMinimumValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MinimumValue"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Set_Can_Be_Set_At_Creation_Time (Resource, True);
         Set_Can_Be_Set_By_Set_Values (Resource, True);
         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
         Append (Constraints, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Constraints, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Set_Can_Be_Set_At_Creation_Time (Resource, True);
--         Set_Can_Be_Set_By_Set_Values (Resource, True);
--         Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Spin_Box_Widget_Class, Resources);
         Set_Constraint_Resources
          (Xt_Motif_Spin_Box_Widget_Class, Constraints);

         Merge_Inherited_Resources (Xt_Motif_Spin_Box_Widget_Class);
      end;

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
 --     Append (Classes, Xt_Motif_Rendition_Class);
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
      Model.Names.Initialize;
      Model.Strings.Initialize;
      Model.Tree.Initialize;

      Types := New_List;
      Classes := New_List;

      Create_Predefined_Resource_Types;
      Create_Enumerated_Resource_Types;
      Create_Widget_Classes;
      Create_Renditions_Resources;

      Xt_Motif_Widget_Set := Create_Widget_Set;
      Set_Name (Xt_Motif_Widget_Set, Enter ("Xt/Motif"));

      Set_Resource_Types (Xt_Motif_Widget_Set, Types);
      Set_Widget_Classes (Xt_Motif_Widget_Set, Classes);

      Known_Widget_Sets := New_List;
      Append (Known_Widget_Sets, Xt_Motif_Widget_Set);

      --  Инициализация компонентов Microline.

      if Microline_Initialize_Hook /= null then
         Microline_Initialize_Hook.all;
      end if;
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Merge_Inherited_Resources
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Merge_Inherited_Resources (Class : in Node_Id) is
      Super : constant Node_Id := Super_Class (Class);

   begin
      --  Наличие унаследованных ресурсов возможно только при наличии
      --  суперкласса.

      if Super /= Null_Node then
         --  Если список ресурсов суперкласса пуст, то наследовать нечего.

         if Resources (Super) /= Null_List then
            --  Если класс не имеет собственных ресурсов (а суперкласс - имеет)
            --  то создаём пустой список ресурсов для класса. Это необходимо
            --  предусловие для подпрограммы дополнения списка ресурсов.

            if Resources (Class) = Null_List then
               Set_Resources (Class, New_List);
            end if;

            --  Наконец производим собственно слияние ресурсов.

            Merge_Inherited_Resources (Resources (Class), Resources (Super));
         end if;

         --  Если список ресурсов суперкласса пуст, то наследовать нечего.

         if Constraint_Resources (Super) /= Null_List then
            --  Если класс не имеет собственных ресурсов (а суперкласс - имеет)
            --  то создаём пустой список ресурсов для класса. Это необходимо
            --  предусловие для подпрограммы дополнения списка ресурсов.

            if Constraint_Resources (Class) = Null_List then
               Set_Constraint_Resources (Class, New_List);
            end if;

            --  Наконец производим собственно слияние ресурсов.

            Merge_Inherited_Resources
             (Constraint_Resources (Class), Constraint_Resources (Super));
         end if;
      end if;
   end Merge_Inherited_Resources;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Merge_Inherited_Resources
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Merge_Inherited_Resources (Own_Resources         : in List_Id;
                                        Super_Class_Resources : in List_Id)
   is
      pragma Assert (Own_Resources /= Null_List);
      pragma Assert (Super_Class_Resources /= Null_List);

      Own   : Node_Id := First (Own_Resources);
      Super : Node_Id := First (Super_Class_Resources);
      Copy  : Node_Id;

   begin
      --  Производим дополнение списка собственных ресурсов ресурсами
      --  из списка суперкласса. Дополнение выполняется с соблюдением
      --  алфивитного порядка внутренних имён ресурсов.

      --  Примечание: имена ресурсов имеют специфические для набора виджетов
      --  префиксы, однако фактически используются имена без префиксов. Для
      --  обнаружения одноимённых ресурсов с разными префиксами и используются
      --  внутренние имена.

      while Own /= Null_Node and then Super /= Null_Node loop
         if Internal_Resource_Name_Image (Own)
              < Internal_Resource_Name_Image (Super)
         then
            Own := Next (Own);

         elsif Internal_Resource_Name_Image (Own)
                 = Internal_Resource_Name_Image (Super)
         then
--            Set_Override (Own, Super);
            Own := Next (Own);
            Super := Next (Super);

         else
            Copy := Create_Resource_Specification;
            Set_Resource_Name (Copy, Resource_Name (Super));
            Set_Internal_Resource_Name (Copy, Internal_Resource_Name (Super));
            Set_Resource_Class_Name (Copy, Resource_Class_Name (Super));
            Set_Internal_Resource_Class_Name
             (Copy, Internal_Resource_Class_Name (Super));
            Set_Resource_Type (Copy, Resource_Type (Super));
            Set_Can_Be_Set_At_Creation_Time
             (Copy, Can_Be_Set_At_Creation_Time (Super));
            Set_Can_Be_Set_By_Set_Values
             (Copy, Can_Be_Set_By_Set_Values (Super));
            Set_Can_Be_Retrieved_By_Get_Values
             (Copy, Can_Be_Retrieved_By_Get_Values (Super));
--            Set_Inherit (Copy, Super)

            Insert_Before (Own, Copy);

            Super := Next (Super);
         end if;
      end loop;

      --  Если после слияния некоторые из ресурсов суперкласса не были
      --  включены с спосок собственных ресурсов, до дополняем последний ими.

      while Super /= Null_Node loop
         Copy := Create_Resource_Specification;
         Set_Resource_Name (Copy, Resource_Name (Super));
         Set_Internal_Resource_Name (Copy, Internal_Resource_Name (Super));
         Set_Resource_Class_Name (Copy, Resource_Class_Name (Super));
         Set_Internal_Resource_Class_Name
          (Copy, Internal_Resource_Class_Name (Super));
         Set_Resource_Type (Copy, Resource_Type (Super));
         Set_Can_Be_Set_At_Creation_Time
          (Copy, Can_Be_Set_At_Creation_Time (Super));
         Set_Can_Be_Set_By_Set_Values
          (Copy, Can_Be_Set_By_Set_Values (Super));
         Set_Can_Be_Retrieved_By_Get_Values
          (Copy, Can_Be_Retrieved_By_Get_Values (Super));
--         Set_Inherit (Copy, Super)

         Append (Own_Resources, Copy);

         Super := Next (Super);
      end loop;
   end Merge_Inherited_Resources;

end Model.Initialization;
