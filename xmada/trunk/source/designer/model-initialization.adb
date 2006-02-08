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
with Model.Queries;
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

   procedure Create_Widget_Classes;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Merge_Inherited_Resources
   --!    <Purpose> Производит дополнение списков ресурсов и ресурсов
   --! ограничений класса отсутствующими ресурсами суперкласса.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Merge_Inherited_Resources (Class : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Merge_Inherited_Resources
   --!    <Purpose> Производит дополнение первого списка отсутствующими
   --! ресурсами из второго списка.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Merge_Inherited_Resources (Own_Resources         : in List_Id;
                                        Super_Class_Resources : in List_Id);

   --  Типы ресурсов

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
--   Xt_Motif_Edit_Mode_Resource_Type                  : Node_Id;
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

   Xt_Motif_Accelerators_Resource_Type               : Node_Id;
   Xt_Motif_Boolean_Resource_Type                    : Node_Id;
   Xt_Motif_C_Int_Resource_Type                      : Node_Id;
   Xt_Motif_C_Short_Resource_Type                    : Node_Id;
   Xt_Motif_Colormap_Resource_Type                   : Node_Id;
   Xt_Motif_Dimension_Resource_Type                  : Node_Id;
   Xt_Motif_Horizontal_Dimension_Resource_Type       : Node_Id;
   Xt_Motif_Horizontal_Position_Resource_Type        : Node_Id;
   Xt_Motif_Menu_Widget_Reference_Resource_Type      : Node_Id;
   Xt_Motif_Pixel_Resource_Type                      : Node_Id;
   Xt_Motif_Pixmap_Resource_Type                     : Node_Id;
   Xt_Motif_Position_Resource_Type                   : Node_Id;
   Xt_Motif_Screen_Resource_Type                     : Node_Id;
   Xt_Motif_Translations_Resource_Type               : Node_Id;
   Xt_Motif_Vertical_Dimension_Resource_Type         : Node_Id;
   Xt_Motif_Vertical_Position_Resource_Type          : Node_Id;
   Xt_Motif_Widget_Reference_Resource_Type           : Node_Id;

   Types   : List_Id;
   Classes : List_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Enumerated_Resource_Types
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Enumerated_Resource_Types is
      Xt_Motif_Audible_Warning_Resource_Type            : Node_Id;
      Xt_Motif_Delete_Response_Resource_Type            : Node_Id;
      Xt_Motif_Edit_Mode_Resource_Type                  : Node_Id;
      Xt_Motif_Input_Policy_Resource_Type               : Node_Id;
      Xt_Motif_Keyboard_Focus_Policy_Resource_Type      : Node_Id;
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

      --  Boolean

      Xt_Motif_Boolean_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name (Xt_Motif_Boolean_Resource_Type, Enter ("XtRBoolean"));
      Set_Internal_Name (Xt_Motif_Boolean_Resource_Type, Enter ("Boolean"));
      Set_Type_Kind (Xt_Motif_Boolean_Resource_Type, Type_Boolean);

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

      --  XtAccelerators

      Xt_Motif_Accelerators_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name
       (Xt_Motif_Accelerators_Resource_Type, Enter ("XtRAccelerators"));
      Set_Internal_Name
       (Xt_Motif_Accelerators_Resource_Type, Enter ("Accelerators"));
      Set_Type_Kind
       (Xt_Motif_Accelerators_Resource_Type, Type_Translation_Data);

      --  XtTranslations

      Xt_Motif_Translations_Resource_Type := Create_Predefined_Resource_Type;
      Set_Name
       (Xt_Motif_Translations_Resource_Type, Enter ("XtRTranslations"));
      Set_Internal_Name
       (Xt_Motif_Translations_Resource_Type, Enter ("Translations"));
      Set_Type_Kind
       (Xt_Motif_Translations_Resource_Type, Type_Translation_Data);

      --  Widget reference

      Xt_Motif_Widget_Reference_Resource_Type :=
        Create_Widget_Reference_Resource_Type;
      Set_Name (Xt_Motif_Widget_Reference_Resource_Type, Enter ("XmRWidget"));
      Set_Internal_Name
       (Xt_Motif_Widget_Reference_Resource_Type, Enter ("Widget"));

--      Xt_Motif__Resource_Type := Create_Predefined_Resource_Type;
--      Set_Name (Xt_Motif__Resource_Type, Enter ("XtR"));
--      Set_Internal_Name (Xt_Motif__Resource_Type, Enter (""));
--      Set_Type_Kind (Xt_Motif__Resource_Type, Type_);

      ------------------------------------------------------------------------
      --  Motif Resource Types
      ------------------------------------------------------------------------

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

      --  Menu Widget reference

      Xt_Motif_Menu_Widget_Reference_Resource_Type :=
        Create_Widget_Reference_Resource_Type;
      Set_Name
       (Xt_Motif_Menu_Widget_Reference_Resource_Type, Enter ("XmRMenuWidget"));
      Set_Internal_Name
       (Xt_Motif_Menu_Widget_Reference_Resource_Type, Enter ("MenuWidget"));

      --  Формирование списка предопределенных типов ресурсов.

--      Append (Types, Xt_Motif__Resource_Type);
      Append (Types, Xt_Motif_Accelerators_Resource_Type);
      Append (Types, Xt_Motif_Boolean_Resource_Type);
      Append (Types, Xt_Motif_Dimension_Resource_Type);
      Append (Types, Xt_Motif_Horizontal_Dimension_Resource_Type);
      Append (Types, Xt_Motif_Horizontal_Position_Resource_Type);
      Append (Types, Xt_Motif_C_Int_Resource_Type);
      Append (Types, Xt_Motif_Menu_Widget_Reference_Resource_Type);
      Append (Types, Xt_Motif_Pixel_Resource_Type);
      Append (Types, Xt_Motif_Pixmap_Resource_Type);
      Append (Types, Xt_Motif_Position_Resource_Type);
      Append (Types, Xt_Motif_Screen_Resource_Type);
      Append (Types, Xt_Motif_C_Short_Resource_Type);
      Append (Types, Xt_Motif_Translations_Resource_Type);
      Append (Types, Xt_Motif_Vertical_Dimension_Resource_Type);
      Append (Types, Xt_Motif_Vertical_Position_Resource_Type);
      Append (Types, Xt_Motif_Widget_Reference_Resource_Type);
   end Create_Predefined_Resource_Types;

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

--   Xt_Motif_Bulletin_Board_Dialog_Widget_Class : Node_Id;
      Xt_Motif_Dialog_Shell_Widget_Class          : Node_Id;
--   Xt_Motif_Error_Dialog_Widget_Class          : Node_Id;
--   Xt_Motif_File_Selection_Dialog_Widget_Class : Node_Id;
--  in Xt      Xt_Motif_Form_Widget_Class                  : Node_Id;
--   Xt_Motif_Form_Dialog_Widget_Class           : Node_Id;
      Xt_Motif_Gadget_Widget_Class                : Node_Id;
--   Xt_Motif_Information_Dialog_Widget_Class    : Node_Id;
      Xt_Motif_Manager_Widget_Class               : Node_Id;
--   Xt_Motif_Message_Dialog_Widget_Class        : Node_Id;
      Xt_Motif_Primitive_Widget_Class             : Node_Id;
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNborderWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("borderWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XtCBorderWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BorderWidth"));
         Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNheight"));
         Set_Internal_Resource_Name (Resource, Enter ("height"));
         Set_Resource_Class_Name (Resource, Enter ("XtCHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Height"));
         Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsensitive"));
         Set_Internal_Resource_Name (Resource, Enter ("sensitive"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSensitive"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Sensitive"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNwidth"));
         Set_Internal_Resource_Name (Resource, Enter ("width"));
         Set_Resource_Class_Name (Resource, Enter ("XtCWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Width"));
         Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNx"));
         Set_Internal_Resource_Name (Resource, Enter ("x"));
         Set_Resource_Class_Name (Resource, Enter ("XtCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type (Resource, Xt_Motif_Position_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNy"));
         Set_Internal_Resource_Name (Resource, Enter ("y"));
         Set_Resource_Class_Name (Resource, Enter ("XtCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type (Resource, Xt_Motif_Position_Resource_Type);
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
         --  TODO XmNtranslations

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNaccelerators"));
         Set_Internal_Resource_Name (Resource, Enter ("accelerators"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAccelerators"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Accelerators"));
         Set_Resource_Type (Resource, Xt_Motif_Accelerators_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbackground"));
         Set_Internal_Resource_Name (Resource, Enter ("background"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBackground"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Background"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbackgroundPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("backgroundPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Pixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Pixmap_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNborderColor"));
         Set_Internal_Resource_Name (Resource, Enter ("borderColor"));
         Set_Resource_Class_Name (Resource, Enter ("XtCBorderColor"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BorderColor"));
         Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNborderPixmap"));
         Set_Internal_Resource_Name (Resource, Enter ("borderPixmap"));
         Set_Resource_Class_Name (Resource, Enter ("XtCPixmap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Pixmap"));
         Set_Resource_Type (Resource, Xt_Motif_Pixmap_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNcolormap"));
         Set_Internal_Resource_Name (Resource, Enter ("colormap"));
         Set_Resource_Class_Name (Resource, Enter ("XtCColormap"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Colormap"));
         Set_Resource_Type (Resource, Xt_Motif_Colormap_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNdepth"));
         Set_Internal_Resource_Name (Resource, Enter ("depth"));
         Set_Resource_Class_Name (Resource, Enter ("XtCDepth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Depth"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNmappedWhenManaged"));
         Set_Internal_Resource_Name (Resource, Enter ("mappedWhenManaged"));
         Set_Resource_Class_Name (Resource, Enter ("XtCMappedWhenManaged"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("MappedWhenManaged"));
         Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNscreen"));
         Set_Internal_Resource_Name (Resource, Enter ("screen"));
         Set_Resource_Class_Name (Resource, Enter ("XtCScreen"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Screen"));
         Set_Resource_Type (Resource, Xt_Motif_Screen_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XtNtranslations"));
         Set_Internal_Resource_Name (Resource, Enter ("translations"));
         Set_Resource_Class_Name (Resource, Enter ("XtCTranslations"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Translations"));
         Set_Resource_Type (Resource, Xt_Motif_Translations_Resource_Type);
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

         --  TODO XmNallowShellResize
         --  TODO XmNcreatePopupChildProc
         --  TODO XmNgeometry
         --  TODO XmNoverrideRedirect
         --  TODO XmNpopdownCallback
         --  TODO XmNpopupCallback
         --  TODO XmNsaveUnder
         --  TODO XmNvisual

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--
--         Merge_Inherited_Resources ();
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
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNbaseHeight
         --  TODO XmNbaseWidth
         --  TODO XmNheightInc
         --  TODO XmNiconMask
         --  TODO XmNiconPixmap
         --  TODO XmNiconWindow
         --  TODO XmNiconX
         --  TODO XmNiconY
         --  TODO XmNinitialState
         --  TODO XmNinput
         --  TODO XmNmaxAspectX
         --  TODO XmNmaxAspectY
         --  TODO XmNmaxHeight
         --  TODO XmNmaxWidth
         --  TODO XmNminAspectX
         --  TODO XmNminAspectY
         --  TODO XmNminHeight
         --  TODO XmNminWidth
         --  TODO XmNtitle
         --  TODO XmNtitleEncoding
         --  TODO XmNtransient
         --  TODO XmNwaitForWm
         --  TODO XmNwidthInc
         --  TODO XmNwindowGroup
         --  TODO XmNwinGravity
         --  TODO XmNwmTimeout

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNaudibleWarning
         --  TODO XmNbuttonFontList
         --  TODO XmNbuttonRenderTable
         --  TODO XmNdefaultFontList
         --  TODO XmNdeleteResponse
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

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--
--         Merge_Inherited_Resources ();
--      end;

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
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Transient_Shell_Widget_Class, Resources);

         Merge_Inherited_Resources (Xt_Motif_Transient_Shell_Widget_Class);
      end;

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

         --  TODO XmNiconic
         --  TODO XmNiconName
         --  TODO XmNiconNameEncoding

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNargc
         --  TODO XmNargv

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--
--         Merge_Inherited_Resources ();
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
--
--         Merge_Inherited_Resources ();
--      end;

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

         --  TODO XmNbottomShadowColor
         --  TODO XmNbottomShadowPixmap
         --  TODO XmNforeground
         --  TODO XmNhighlightColor
         --  TODO XmNhighlightOnEnter
         --  TODO XmNhighlightPixmap
         --  TODO XmNlayoutDirection
         --  TODO XmNtopShadowColor
         --  TODO XmNtopShadowPixmap
         --  TODO XmNtraversalOn
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNheight"));
         Set_Internal_Resource_Name (Resource, Enter ("height"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNnavigationType"));
         Set_Internal_Resource_Name (Resource, Enter ("navigationType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCNavigationType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("NavigationType"));
         Set_Resource_Type (Resource, Xt_Motif_Navigation_Type_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNshadowThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("shadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNwidth"));
         Set_Internal_Resource_Name (Resource, Enter ("width"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNx"));
         Set_Internal_Resource_Name (Resource, Enter ("x"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Position_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNy"));
         Set_Internal_Resource_Name (Resource, Enter ("y"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Position_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Primitive_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmultiClick"));
         Set_Internal_Resource_Name (Resource, Enter ("multiClick"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMultiClick"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MultiClick"));
         Set_Resource_Type (Resource, Xt_Motif_Multi_Click_Resource_Type);
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
         --  TODO XmNacceleratorText
         --  TODO XmNfontList
         --  TODO XmNlabelInsensitivePixmap
         --  TODO XmNlabelPixmap
         --  TODO XmNlabelString
         --  TODO XmNmnemonic
         --  TODO XmNmnemonicCharSet
         --  TODO XmNrecomputeSize
         --  TODO XmNrenderTable
         --  TODO XmNstringDirection

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

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginBottom"));
         Set_Internal_Resource_Name (Resource, Enter ("marginBottom"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginBottom"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginBottom"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginLeft"));
         Set_Internal_Resource_Name (Resource, Enter ("marginLeft"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginLeft"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginLeft"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginRight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginRight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginRight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginRight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginTop"));
         Set_Internal_Resource_Name (Resource, Enter ("marginTop"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginTop"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginTop"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Label_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNcascadePixmap

         --  TODO XmNactivateCallback
         --  TODO XmNcascadingCallback

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmappingDelay"));
         Set_Internal_Resource_Name (Resource, Enter ("mappingDelay"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMappingDelay"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MappingDelay"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsubMenuId"));
         Set_Internal_Resource_Name (Resource, Enter ("subMenuId"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMenuWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MenuWidget"));
         Set_Resource_Type
          (Resource, Xt_Motif_Menu_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Cascade_Button_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNpushButtonEnabled
         --  TODO XmNshadowType

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
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Drawn_Button_Widget_Class, Resources);

--          Merge_Inherited_Resources ();
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

         --  TODO XmNarmColor
         --  TODO XmNarmPixmap
         --  TODO XmNfillOnArm
         --  TODO XmNshowAsDefault

         --  TODO XmNactivateCallback
         --  TODO XmNarmCallback
         --  TODO XmNdisarmCallback

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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmultiClick"));
         Set_Internal_Resource_Name (Resource, Enter ("multiClick"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMultiClick"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MultiClick"));
         Set_Resource_Type (Resource, Xt_Motif_Multi_Click_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Push_Button_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorOn"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorOn"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorOn"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorOn"));
         Set_Resource_Type
          (Resource, Xt_Motif_Toggle_Indicator_On_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorSize"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorSize"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorType"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorType"));
         Set_Resource_Type (Resource, Xt_Motif_Indicator_Type_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Toggle_Button_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNautomaticSelection
         --  TODO XmNfontList
         --  TODO XmNitemCount
         --  TODO XmNitems
         --  TODO XmNlistSizePolicy
         --  TODO XmNprimaryOwnership
         --  TODO XmNrenderTable
         --  TODO XmNscrollBarDisplayPolicy
         --  TODO XmNselectColor
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
         Set_Resource_Name (Resource, Enter ("XmNdoubleClickInterval"));
         Set_Internal_Resource_Name (Resource, Enter ("doubleClickInterval"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDoubleClickInterval"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("DoubleClickInterval"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlistMarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("listMarginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCListMarginHeight"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ListMarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlistMarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("listMarginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCListMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ListMarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlistSpacing"));
         Set_Internal_Resource_Name (Resource, Enter ("listSpacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCListSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ListSpacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmatchBehavior"));
         Set_Internal_Resource_Name (Resource, Enter ("matchBehavior"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMatchBehavior"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MatchBehavior"));
         Set_Resource_Type (Resource, Xt_Motif_Match_Behavior_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_List_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNeditable
         --  TODO XmNprocessingDirection
         --  TODO XmNshowArrows
         --  TODO XmNsliderMark
         --  TODO XmNsliderVisual
         --  TODO XmNslidingMode
         --  TODO XmNsnapBackMultiple
         --  TODO XmNtroughColor

         --  TODO XmNdecrementCallback
         --  TODO XmNdragCallback
         --  TODO XmNincrementCallback
         --  TODO XmNpageDecrementCallback
         --  TODO XmNpageIncrementCallback
         --  TODO XmNtoBottomCallback
         --  TODO XmNtoTopCallback
         --  TODO XmNvalueChangedCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNincrement"));
         Set_Internal_Resource_Name (Resource, Enter ("increment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIncrement"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Increment"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNinitialDelay"));
         Set_Internal_Resource_Name (Resource, Enter ("initialDelay"));
         Set_Resource_Class_Name (Resource, Enter ("XmCInitialDelay"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("InitialDelay"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmaximum"));
         Set_Internal_Resource_Name (Resource, Enter ("maximum"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMaximum"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Maximum"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNminimum"));
         Set_Internal_Resource_Name (Resource, Enter ("minimum"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMinimum"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Minimum"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpageIncrement"));
         Set_Internal_Resource_Name (Resource, Enter ("pageIncrement"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPageIncrement"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PageIncrement"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrepeatDelay"));
         Set_Internal_Resource_Name (Resource, Enter ("repeatDelay"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRepeatDelay"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RepeatDelay"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsliderSize"));
         Set_Internal_Resource_Name (Resource, Enter ("sliderSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSliderSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SliderSize"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNvalue"));
         Set_Internal_Resource_Name (Resource, Enter ("value"));
         Set_Resource_Class_Name (Resource, Enter ("XmCValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Value"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Scroll_Bar_Widget_Class, Resources);

--         Merge_Inherited_Resources ();
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

         --  TODO XmNseparatorType

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmargin"));
         Set_Internal_Resource_Name (Resource, Enter ("margin"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMargin"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Margin"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Separator_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNautoShowCursorPosition
         --  TODO XmNcursorPosition
         --  TODO XmNcursorPositionVisible
         --  TODO XmNeditable
         --  TODO XmNeditMode
         --  TODO XmNmaxLength
         --  TODO XmtotalLines
         --  TODO XmNsource
         --  TODO XmNtopCharacter
         --  TODO XmNvalue
         --  TODO XmNvalueWcs * cannot be set in resource file
         --  TODO XmNverifyBell

         --  TODO XmNpendingDelete
         --  TODO XmNselectionArray
         --  TODO XmNselectionArrayCount
         --  TODO XmNselectThreshold

         --  TODO XmNcolumns
         --  TODO XmNcursorPositionVisible
         --  TODO XmNfontList
         --  TODO XmNrenderTable
         --  TODO XmNresizeHeight
         --  TODO XmNresizeWidth
         --  TODO XmNrows
         --  TODO XmNwordWrap

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
         Set_Resource_Name (Resource, Enter ("XmNblinkRate"));
         Set_Internal_Resource_Name (Resource, Enter ("blinkRate"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBlinkRate"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BlinkRate"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Text_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNcolumns
         --  TODO XmNcursorPosition
         --  TODO XmNcursorPositionVisible
         --  TODO XmNeditable
         --  TODO XmNfontList
         --  TODO XmNmaxLength
         --  TODO XmNpendingDelete
         --  TODO XmNrenderTable
         --  TODO XmNresizeWidth
         --  TODO XmNselectionArray
         --  TODO XmNselectionArrayCount
         --  TODO XmNselectThreshold
         --  TODO XmNvalue
         --  TODO XmNvalueWcs ! cannot be set in resource file
         --  TODO XmNverifyBell

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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Text_Field_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNbackground
         --  TODO XmNbackgroundPixmap
         --  TODO XmNbottomShadowColor
         --  TODO XmNbottomShadowPixmap
         --  TODO XmNhelpCallback
         --  TODO XmNforeground
         --  TODO XmNhighlightColor
         --  TODO XmNhighlightOnEnter
         --  TODO XmNhighlightPixmap
         --  TODO XmNlayoutDirection
         --  TODO XmNtopShadowColor
         --  TODO XmNtopShadowPixmap
         --  TODO XmNtraversalOn
         --  TODO XmNunitType
         --  TODO XmNuserData

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNborderWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("borderWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBorderWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BorderWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNheight"));
         Set_Internal_Resource_Name (Resource, Enter ("height"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNnavigationType"));
         Set_Internal_Resource_Name (Resource, Enter ("navigationType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCNavigationType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("NavigationType"));
         Set_Resource_Type (Resource, Xt_Motif_Navigation_Type_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNshadowThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("shadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNwidth"));
         Set_Internal_Resource_Name (Resource, Enter ("width"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNx"));
         Set_Internal_Resource_Name (Resource, Enter ("x"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Position_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNy"));
         Set_Internal_Resource_Name (Resource, Enter ("y"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Position_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Gadget_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmultiClick"));
         Set_Internal_Resource_Name (Resource, Enter ("multiClick"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMultiClick"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MultiClick"));
         Set_Resource_Type (Resource, Xt_Motif_Multi_Click_Resource_Type);
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
         --  TODO XmNlabelString
         --  TODO XmNlargeIconMask
         --  TODO XmNlargeIconPixmap
         --  TODO XmNrenderTable
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Icon_Gadget_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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
         --  TODO XmNacceleratorText
         --  TODO XmNfontList
         --  TODO XmNlabelInsensitivePixmap
         --  TODO XmNlabelPixmap
         --  TODO XmNlabelString
         --  TODO XmNmnemonic
         --  TODO XmNmnemonicCharSet
         --  TODO XmNrecomputeSize
         --  TODO XmNrenderTable
         --  TODO XmNstringDirection

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

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginBottom"));
         Set_Internal_Resource_Name (Resource, Enter ("marginBottom"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginBottom"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginBottom"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginLeft"));
         Set_Internal_Resource_Name (Resource, Enter ("marginLeft"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginLeft"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginLeft"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginRight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginRight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginRight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginRight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginTop"));
         Set_Internal_Resource_Name (Resource, Enter ("marginTop"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginTop"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginTop"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Label_Gadget_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNcascadePixmap

         --  TODO XmNactivateCallback
         --  TODO XmNcascadingCallback

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmappingDelay"));
         Set_Internal_Resource_Name (Resource, Enter ("mappingDelay"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMappingDelay"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MappingDelay"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsubMenuId"));
         Set_Internal_Resource_Name (Resource, Enter ("subMenuId"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMenuWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MenuWidget"));
         Set_Resource_Type
          (Resource, Xt_Motif_Menu_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources
          (Xt_Motif_Cascade_Button_Gadget_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNarmColor
         --  TODO XmNarmPixmap
         --  TODO XmNfillOnArm
         --  TODO XmNshowAsDefault

         --  TODO XmNactivateCallback
         --  TODO XmNarmCallback
         --  TODO XmNdisarmCallback

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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmultiClick"));
         Set_Internal_Resource_Name (Resource, Enter ("multiClick"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMultiClick"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MultiClick"));
         Set_Resource_Type (Resource, Xt_Motif_Multi_Click_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Push_Button_Gadget_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorOn"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorOn"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorOn"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorOn"));
         Set_Resource_Type
          (Resource, Xt_Motif_Toggle_Indicator_On_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorSize"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorSize"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNindicatorType"));
         Set_Internal_Resource_Name (Resource, Enter ("indicatorType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIndicatorType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IndicatorType"));
         Set_Resource_Type (Resource, Xt_Motif_Indicator_Type_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Toggle_Button_Gadget_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNseparatorType

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmargin"));
         Set_Internal_Resource_Name (Resource, Enter ("margin"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMargin"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Margin"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Separator_Gadget_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNbottomShadowColor
         --  TODO XmNbottomShadowPixmap
         --  TODO XmNforeground
         --  TODO XmNhighlightColor
         --  TODO XmNhighlightPixmap
         --  TODO XmNlayoutDirection
         --  TODO XmNstringDirection
         --  TODO XmNtopShadowColor
         --  TODO XmNtopShadowPixmap
         --  TODO XmNtraversalOn
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNheight"));
         Set_Internal_Resource_Name (Resource, Enter ("height"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNinitialFocus"));
         Set_Internal_Resource_Name (Resource, Enter ("initialFocus"));
         Set_Resource_Class_Name (Resource, Enter ("XmCInitialFocus"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("InitialFocus"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNnavigationType"));
         Set_Internal_Resource_Name (Resource, Enter ("navigationType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCNavigationType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("NavigationType"));
         Set_Resource_Type (Resource, Xt_Motif_Navigation_Type_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNshadowThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("shadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNwidth"));
         Set_Internal_Resource_Name (Resource, Enter ("width"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDimension"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Dimension"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNx"));
         Set_Internal_Resource_Name (Resource, Enter ("x"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Position_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNy"));
         Set_Internal_Resource_Name (Resource, Enter ("y"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Position_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
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

         --  TODO XmNallowOverlap
         --  TODO XmNautoUnmanage
         --  TODO XmNbuttonFontList
         --  TODO XmNbuttonRenderTable
         --  TODO XmNdefaultPosition
         --  TODO XmNdialogTitle
         --  TODO XmNlabelFontList
         --  TODO XmNlabelRenderTable
         --  TODO XmNnoResize
         --  TODO XmNresizePolicy
         --  TODO XmNshadowType
         --  TODO XmNtextFontList
         --  TODO XmNtextRenderTable
         --  TODO XmNtextTranslations

         --  TODO XmNfocusCallback
         --  TODO XmNmapCallback
         --  TODO XmNunmapCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcancelButton"));
         Set_Internal_Resource_Name (Resource, Enter ("cancelButton"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdefaultButton"));
         Set_Internal_Resource_Name (Resource, Enter ("defaultButton"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdialogStyle"));
         Set_Internal_Resource_Name (Resource, Enter ("dialogStyle"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDialogStyle"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("DialogStyle"));
         Set_Resource_Type (Resource, Xt_Motif_Dialog_Style_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
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

         --  TODO XmNrubberPositioning

         --  TODO XmNbottomOffset
         --  TODO XmNbottomPosition
         --  TODO XmNleftOffset
         --  TODO XmNleftPosition
         --  TODO XmNresizable
         --  TODO XmNrightOffset
         --  TODO XmNrightPosition
         --  TODO XmNtopOffset
         --  TODO XmNtopPosition

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNfractionBase"));
         Set_Internal_Resource_Name (Resource, Enter ("fractionBase"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMaxValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaxValue"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhorizontalSpacing"));
         Set_Internal_Resource_Name (Resource, Enter ("horizontalSpacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNverticalSpacing"));
         Set_Internal_Resource_Name (Resource, Enter ("verticalSpacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbottomAttachment"));
         Set_Internal_Resource_Name (Resource, Enter ("bottomAttachment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAttachment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Attachment"));
         Set_Resource_Type (Resource, Xt_Motif_Attachment_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbottomPosition"));
         Set_Internal_Resource_Name (Resource, Enter ("bottomPosition"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbottomWidget"));
         Set_Internal_Resource_Name (Resource, Enter ("bottomWidget"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNleftAttachment"));
         Set_Internal_Resource_Name (Resource, Enter ("leftAttachment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAttachment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Attachment"));
         Set_Resource_Type (Resource, Xt_Motif_Attachment_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNleftPosition"));
         Set_Internal_Resource_Name (Resource, Enter ("leftPosition"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNleftWidget"));
         Set_Internal_Resource_Name (Resource, Enter ("leftWidget"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrightAttachment"));
         Set_Internal_Resource_Name (Resource, Enter ("rightAttachment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAttachment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Attachment"));
         Set_Resource_Type (Resource, Xt_Motif_Attachment_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrightPosition"));
         Set_Internal_Resource_Name (Resource, Enter ("rightPosition"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrightWidget"));
         Set_Internal_Resource_Name (Resource, Enter ("rightWidget"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtopAttachment"));
         Set_Internal_Resource_Name (Resource, Enter ("topAttachment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAttachment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Attachment"));
         Set_Resource_Type (Resource, Xt_Motif_Attachment_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtopPosition"));
         Set_Internal_Resource_Name (Resource, Enter ("topPosition"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPosition"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Position"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNtopWidget"));
         Set_Internal_Resource_Name (Resource, Enter ("topWidget"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Constraints, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Constraints, Resource);

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

         --  TODO XmNcancelLabelString
         --  TODO XmNhelpLabelString
         --  TODO XmNmessageString
         --  TODO XmNminimizeButtons
         --  TODO XmNokLabelString
         --  TODO XmNsymbolPixmap

         --  TODO XmNcancelCallback
         --  TODO XmNokCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdefaultButtonType"));
         Set_Internal_Resource_Name (Resource, Enter ("defaultButtonType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDefaultButtonType"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("DefaultButtonType"));
         Set_Resource_Type
          (Resource, Xt_Motif_Default_Button_Type_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNdialogType"));
         Set_Internal_Resource_Name (Resource, Enter ("dialogType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCDialogType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("DialogType"));
         Set_Resource_Type (Resource, Xt_Motif_Dialog_Type_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmessageAlignment"));
         Set_Internal_Resource_Name (Resource, Enter ("messageAlignment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAlignment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Alignment"));
         Set_Resource_Type (Resource, Xt_Motif_Alignment_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Message_Box_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Selection_Box_Widget_Class, Resources);

--         Merge_Inherited_Resources ();
      end;

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
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--
--         Merge_Inherited_Resources ();
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
--         Append (Resources, Resource);
--
--         Set_Resources (, Resources);
--
--         Merge_Inherited_Resources ();
--      end;

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
         --  TODO XmNrenderTable
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowSpacing"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowSpacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArrowSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArrowSpacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcomboBoxType"));
         Set_Internal_Resource_Name (Resource, Enter ("comboBoxType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCComboBoxType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ComboBoxType"));
         Set_Resource_Type (Resource, Xt_Motif_Combo_Box_Type_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmatchBehavior"));
         Set_Internal_Resource_Name (Resource, Enter ("matchBehavior"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMatchBehavior"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MatchBehavior"));
         Set_Resource_Type (Resource, Xt_Motif_Match_Behavior_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpositionMode"));
         Set_Internal_Resource_Name (Resource, Enter ("positionMode"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPositionMode"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PositionMode"));
         Set_Resource_Type (Resource, Xt_Motif_Position_Mode_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Combo_Box_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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
         --  TODO XmNrenderTable
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlargeCellHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("largeCellHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCCellHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("CellHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlargeCellWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("largeCellWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCCellWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("CellWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlayoutType"));
         Set_Internal_Resource_Name (Resource, Enter ("layoutType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCLayoutType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("LayoutType"));
         Set_Resource_Type (Resource, Xt_Motif_Layout_Type_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNoutlineButtonPolicy"));
         Set_Internal_Resource_Name (Resource, Enter ("outlineButtonPolicy"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOutlineButtonPolicy"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("OutlineButtonPolicy"));
         Set_Resource_Type
          (Resource, Xt_Motif_Outline_Button_Policy_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNoutlineColumnWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("outlineColumnWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOutlineColumnWidth"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("OutlineColumnWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNoutlineIndentation"));
         Set_Internal_Resource_Name (Resource, Enter ("outlineIndentation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOutlineIndentation"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("OutlineIndentation"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNoutlineLineStyle"));
         Set_Internal_Resource_Name (Resource, Enter ("outlineLineStyle"));
         Set_Resource_Class_Name (Resource, Enter ("XmCLineStyle"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("LineStyle"));
         Set_Resource_Type
          (Resource, Xt_Motif_Container_Line_Style_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsmallCellHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("smallCellHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCCellHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("CellHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsmallCellWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("smallCellWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCCellWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("CellWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNentryParent"));
         Set_Internal_Resource_Name (Resource, Enter ("entryParent"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Widget"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNoutlineState"));
         Set_Internal_Resource_Name (Resource, Enter ("outlineState"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOutlineState"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("OutlineState"));
         Set_Resource_Type (Resource, Xt_Motif_Outline_State_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpositionIndex"));
         Set_Internal_Resource_Name (Resource, Enter ("positionIndex"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPositionIndex"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PositionIndex"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Container_Widget_Class, Resources);
         Set_Constraint_Resources
          (Xt_Motif_Container_Widget_Class, Constraints);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNresizePolicy

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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Drawing_Area_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNshadowType

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

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
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNframeChildType"));
         Set_Internal_Resource_Name (Resource, Enter ("frameChildType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCFrameChildType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("FrameChildType"));
         Set_Resource_Type (Resource, Xt_Motif_Frame_Child_Type_Resource_Type);
         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Frame_Widget_Class, Resources);
         Set_Constraint_Resources (Xt_Motif_Frame_Widget_Class, Constraints);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNresizable

         --  TODO XmNpageChangedCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbackPageSize"));
         Set_Internal_Resource_Name (Resource, Enter ("backPageSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBackPageSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BackPageSize"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbindingType"));
         Set_Internal_Resource_Name (Resource, Enter ("bindingType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBindingType"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BindingType"));
         Set_Resource_Type (Resource, Xt_Motif_Binding_Type_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNbindingWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("bindingWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCBindingWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("BindingWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcurrentPageNumber"));
         Set_Internal_Resource_Name (Resource, Enter ("currentPageNumber"));
         Set_Resource_Class_Name (Resource, Enter ("XmCCurrentPageNumber"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("CurrentPageNumber"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNfirstPageNumber"));
         Set_Internal_Resource_Name (Resource, Enter ("firstPageNumber"));
         Set_Resource_Class_Name (Resource, Enter ("XmCFirstPageNumber"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("FirstPageNumber"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNframeShadowThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("frameShadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNinnerMarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("innerMarginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCInnerMarginHeight"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("InnerMarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNinnerMarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("innerMarginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCInnerMarginWidth"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("InnerMarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNlastPageNumber"));
         Set_Internal_Resource_Name (Resource, Enter ("lastPageNumber"));
         Set_Resource_Class_Name (Resource, Enter ("XmCLastPageNumber"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("LastPageNumber"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmajorTabSpacing"));
         Set_Internal_Resource_Name (Resource, Enter ("majorTabSpacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMajorTabSpacing"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("MajorTabSpacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNminorTabSpacing"));
         Set_Internal_Resource_Name (Resource, Enter ("minorTabSpacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMinorTabSpacing"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("MinorTabSpacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNnotebookChildType"));
         Set_Internal_Resource_Name (Resource, Enter ("notebookChildType"));
         Set_Resource_Class_Name (Resource, Enter ("XmCNotebookChildType"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("NotebookChildType"));
         Set_Resource_Type
          (Resource, Xt_Motif_Notebook_Child_Type_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpageNumber"));
         Set_Internal_Resource_Name (Resource, Enter ("pageNumber"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPageNumber"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PageNumber"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Constraints, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Notebook_Widget_Class, Resources);
         Set_Constraint_Resources
          (Xt_Motif_Notebook_Widget_Class, Constraints);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNrefigureMode
         --  TODO XmNseparatorOn

         --  TODO XmNallowResize
         --  TODO XmNpositionIndex
         --  TODO XmNskipAdjust

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsashHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("sashHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSashHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SashHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsashIndent"));
         Set_Internal_Resource_Name (Resource, Enter ("sashIndent"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSashIndent"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SashIndent"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Position_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsashShadowThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("sashShadowThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCShadowThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ShadowThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsashWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("sashWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSashWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("SashWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpaneMaximum"));
         Set_Internal_Resource_Name (Resource, Enter ("paneMaximum"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPaneMaximum"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PaneMaximum"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpaneMinimum"));
         Set_Internal_Resource_Name (Resource, Enter ("paneMinimum"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPaneMinimum"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("PaneMinimum"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Constraints, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Paned_Window_Widget_Class, Resources);
         Set_Constraint_Resources
          (Xt_Motif_Paned_Window_Widget_Class, Constraints);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNadjustLast
         --  TODO XmNadjustMargin
         --  TODO XmNentryClass
         --  TODO XmNentryVerticalAlignment
         --  TODO XmNisAligned
         --  TODO XmNisHomogeneous
         --  TODO XmNlabelString
         --  TODO XmNmenuAccelerator
         --  TODO XmNmenuPost
         --  TODO XmNmnemonic
         --  TODO XmNmnemonicCharSet
         --  TODO XmNnumColumns
         --  TODO XmNpopupEnabled
         --  TODO XmNradioAlwaysOne
         --  TODO XmNradioBehavior
         --  TODO XmNresizeHeight
         --  TODO XmNresizeWidth
         --  TODO XmNrowColumnType
         --  TODO XmNtearOffModel
         --  TODO XmNtearOffTitle
         --  TODO XmNwhichButton

         --  TODO XmNpositionIndex

         --  TODO XmNentryCallback
         --  TODO XmNmapCallback
         --  TODO XmNtearOffMenuActivateCallback
         --  TODO XmNtearOffMenuDeactivateCallback
         --  TODO XmNunmapCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNentryAlignment"));
         Set_Internal_Resource_Name (Resource, Enter ("entryAlignment"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAlignment"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Alignment"));
         Set_Resource_Type (Resource, Xt_Motif_Alignment_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNentryBorder"));
         Set_Internal_Resource_Name (Resource, Enter ("entryBorder"));
         Set_Resource_Class_Name (Resource, Enter ("XmCEntryBorder"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("EntryBorder"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmenuHelpWidget"));
         Set_Internal_Resource_Name (Resource, Enter ("menuHelpWidget"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMenuWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MenuWidget"));
         Set_Resource_Type
          (Resource, Xt_Motif_Menu_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmenuHistory"));
         Set_Internal_Resource_Name (Resource, Enter ("menuHistory"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMenuWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MenuWidget"));
         Set_Resource_Type
          (Resource, Xt_Motif_Menu_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNpacking"));
         Set_Internal_Resource_Name (Resource, Enter ("packing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCPacking"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Packing"));
         Set_Resource_Type (Resource, Xt_Motif_Packing_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNsubMenuId"));
         Set_Internal_Resource_Name (Resource, Enter ("subMenuId"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMenuWidget"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MenuWidget"));
         Set_Resource_Type
          (Resource, Xt_Motif_Menu_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Row_Column_Widget_Class, Resources);
         Set_Constraint_Resources
          (Xt_Motif_Row_Column_Widget_Class, Constraints);
--
--         Merge_Inherited_Resources ();
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
         --  TODO XmNhighlightOnEnter
         --  TODO XmNprocessingDirection
         --  TODO XmNrenderTable
         --  TODO XmNshowArrows
         --  TODO XmNshowValue
         --  TODO XmNsliderMark
         --  TODO XmNsliderVisual
         --  TODO XmNslidingMode
         --  TODO XmNtitleString

         --  TODO XmNconvertCallback
         --  TODO XmNdragCallback
         --  TODO XmNvalueChangedCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhighlightThickness"));
         Set_Internal_Resource_Name (Resource, Enter ("highlightThickness"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHighlightThickness"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HighlightThickness"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmaximum"));
         Set_Internal_Resource_Name (Resource, Enter ("maximum"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMaximum"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Maximum"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNminimum"));
         Set_Internal_Resource_Name (Resource, Enter ("minimum"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMinimum"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Minimum"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNorientation"));
         Set_Internal_Resource_Name (Resource, Enter ("orientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCOrientation"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Orientation"));
         Set_Resource_Type (Resource, Xt_Motif_Orientation_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscaleHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("scaleHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCScaleHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ScaleHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscaleMultiple"));
         Set_Internal_Resource_Name (Resource, Enter ("scaleMultiple"));
         Set_Resource_Class_Name (Resource, Enter ("XmCScaleMultiple"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ScaleMultiple"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNscaleWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("scaleWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCScaleWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ScaleWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNvalue"));
         Set_Internal_Resource_Name (Resource, Enter ("value"));
         Set_Resource_Class_Name (Resource, Enter ("XmCValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Value"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Scale_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNscrollBarDisplayPolicy
         --  TODO XmNscrollBarPlacement
         --  TODO XmNscrollingPolicy
         --  TODO XmNvisualPolicy

         --  TODO XmNscrolledWindowChildType

         --  TODO XmNtraverseObscuredCallback

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNautoDragModel"));
         Set_Internal_Resource_Name (Resource, Enter ("autoDragModel"));
         Set_Resource_Class_Name (Resource, Enter ("XmCAutoDragModel"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("AutoDragModel"));
         Set_Resource_Type (Resource, Xt_Motif_Auto_Drag_Model_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNclipWindow"));
         Set_Internal_Resource_Name (Resource, Enter ("clipWindow"));
         Set_Resource_Class_Name (Resource, Enter ("XmCClipWindow"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ClipWindow"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNhorizontalScrollBar"));
         Set_Internal_Resource_Name (Resource, Enter ("horizontalScrollBar"));
         Set_Resource_Class_Name (Resource, Enter ("XmCHorizontalScrollBar"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("HorizontalScrollBar"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNverticalScrollBar"));
         Set_Internal_Resource_Name (Resource, Enter ("verticalScrollBar"));
         Set_Resource_Class_Name (Resource, Enter ("XmCVerticalScrollBar"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("VerticalScrollBar"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNworkWindow"));
         Set_Internal_Resource_Name (Resource, Enter ("workWindow"));
         Set_Resource_Class_Name (Resource, Enter ("XmCWorkWindow"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("WorkWindow"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Scrolled_Window_Widget_Class, Resources);
         Set_Constraint_Resources
          (Xt_Motif_Scrolled_Window_Widget_Class, Constraints);
--
--         Merge_Inherited_Resources ();
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

         --  TODO XmNshowSeparator

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNcommandWindow"));
         Set_Internal_Resource_Name (Resource, Enter ("commandWindow"));
         Set_Resource_Class_Name (Resource, Enter ("XmCCommandWindow"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("CommandWindow"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmenuBar"));
         Set_Internal_Resource_Name (Resource, Enter ("menuBar"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMenuBar"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MenuBar"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmessageWindow"));
         Set_Internal_Resource_Name (Resource, Enter ("messageWindow"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMessageWindow"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MessageWindow"));
         Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
         Append (Resources, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Main_Window_Widget_Class, Resources);
--
--         Merge_Inherited_Resources ();
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
--         Append (Resources, Resource);

         Set_Resources (Xt_Motif_Simple_Spin_Box_Widget_Class, Resources);

--         Merge_Inherited_Resources ();
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

         --  TODO XmNdecimalPoints
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowOrientation"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowOrientation"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArrowOrientation"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ArrowOrientation"));
         Set_Resource_Type
          (Resource, Xt_Motif_Arrow_Orientation_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowSize"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowSize"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArrowSize"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("ArrowSize"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
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
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNinitialDelay"));
         Set_Internal_Resource_Name (Resource, Enter ("initialDelay"));
         Set_Resource_Class_Name (Resource, Enter ("XmCInitialDelay"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("InitialDelay"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
         Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginHeight"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginHeight"));
         Set_Resource_Type
          (Resource, Xt_Motif_Vertical_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
         Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMarginWidth"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MarginWidth"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNrepeatDelay"));
         Set_Internal_Resource_Name (Resource, Enter ("repeatDelay"));
         Set_Resource_Class_Name (Resource, Enter ("XmCRepeatDelay"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("RepeatDelay"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNspacing"));
         Set_Internal_Resource_Name (Resource, Enter ("spacing"));
         Set_Resource_Class_Name (Resource, Enter ("XmCSpacing"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("Spacing"));
         Set_Resource_Type
          (Resource, Xt_Motif_Horizontal_Dimension_Resource_Type);
         Append (Resources, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNarrowSensitivity"));
         Set_Internal_Resource_Name (Resource, Enter ("arrowSensitivity"));
         Set_Resource_Class_Name (Resource, Enter ("XmCArrowSensitivity"));
         Set_Internal_Resource_Class_Name
          (Resource, Enter ("ArrowSensitivity"));
         Set_Resource_Type
          (Resource, Xt_Motif_Arrow_Sensitivity_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNincrementValue"));
         Set_Internal_Resource_Name (Resource, Enter ("incrementValue"));
         Set_Resource_Class_Name (Resource, Enter ("XmCIncrementValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("IncrementValue"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNmaximumValue"));
         Set_Internal_Resource_Name (Resource, Enter ("maximumValue"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMaximumValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MaximumValue"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Constraints, Resource);

         Resource := Create_Resource_Specification;
         Set_Resource_Name (Resource, Enter ("XmNminimumValue"));
         Set_Internal_Resource_Name (Resource, Enter ("minimumValue"));
         Set_Resource_Class_Name (Resource, Enter ("XmCMinimumValue"));
         Set_Internal_Resource_Class_Name (Resource, Enter ("MinimumValue"));
         Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
         Append (Constraints, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Constraints, Resource);

--         Resource := Create_Resource_Specification;
--         Set_Resource_Name (Resource, Enter (""));
--         Set_Internal_Resource_Name (Resource, Enter (""));
--         Set_Resource_Class_Name (Resource, Enter (""));
--         Set_Internal_Resource_Class_Name (Resource, Enter (""));
--         Set_Resource_Type (Resource, );
--         Append (Constraints, Resource);

         Set_Resources (Xt_Motif_Spin_Box_Widget_Class, Resources);
         Set_Constraint_Resources
          (Xt_Motif_Spin_Box_Widget_Class, Constraints);

--         Merge_Inherited_Resources ();
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

      Create_Predefined_Resource_Types;
      Create_Enumerated_Resource_Types;
      Create_Widget_Classes;

      Xt_Motif_Widget_Set := Create_Widget_Set;
      Set_Resource_Types (Xt_Motif_Widget_Set, Types);
      Set_Widget_Classes (Xt_Motif_Widget_Set, Classes);
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
--         Set_Inherit (Copy, Super)

         Append (Own_Resources, Copy);

         Super := Next (Super);
      end loop;
   end Merge_Inherited_Resources;

end Model.Initialization;
