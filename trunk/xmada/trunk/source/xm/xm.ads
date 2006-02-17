------------------------------------------------------------------------------
--
--  Mofit Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2006  Vadim Godunko (vgodunko@rostel.ru)
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
--! along with GCC; see the file COPYING. If not, write to the Free
--! Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
--! 02110-1301, USA.
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
--! <Unit> Xm
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Strings;
with Interfaces.C.Wide_Strings;

with Xlib.Atoms;
with Xlib.Events;
with Xlib.Extensions.Print;
with Xt.Ancillary_Types;

package Xm is

   Dereference_Error             : exception
     renames Interfaces.C.Strings.Dereference_Error;
   Invalid_Render_Table_Error    : exception;
   Invalid_Callback_Reason_Error : exception;


   type Xm_String is private;
   type Xm_String_List is array (Natural range <>) of aliased Xm_String;
   type Xm_String_Pointer is access all Xm_String;

   Null_Xm_String          : constant Xm_String;

   function To_Xm_String_List (Pointer : in Xm_String_Pointer;
                               Length  : in Natural)
     return Xm_String_List;


   subtype Xm_String_Char_Set is Interfaces.C.Strings.chars_ptr;
   subtype Xm_String_Tag      is Interfaces.C.Strings.chars_ptr;
   type Xm_String_Tag_List is
     array (Natural range <>) of aliased Xm_String_Tag;
   type Xm_String_Tag_List_Access is access all Xm_String_Tag_List;

   Xm_String_Default_Char_Set : constant Xm_String_Char_Set;
   Xm_Fontlist_Default_Tag    : constant Xm_String_Tag;
   Motif_Default_Locale       : constant Xm_String_Tag;

   Null_Xm_String_Tag      : constant Xm_String_Tag;
   Null_Xm_String_Tag_List : constant Xm_String_Tag_List;

   type Xm_String_Component_Type is mod 125;

   Xm_String_Component_Unknown         : constant Xm_String_Component_Type;
   Xm_String_Component_Charset         : constant Xm_String_Component_Type;
   Xm_String_Component_Text            : constant Xm_String_Component_Type;
   Xm_String_Component_Direction       : constant Xm_String_Component_Type;
   Xm_String_Component_Separator       : constant Xm_String_Component_Type;
   Xm_String_Component_Locale_Text     : constant Xm_String_Component_Type;
   Xm_String_Component_Locale          : constant Xm_String_Component_Type;
   Xm_String_Component_Widechar_Text   : constant Xm_String_Component_Type;
   Xm_String_Component_Layout_Push     : constant Xm_String_Component_Type;
   Xm_String_Component_Layout_Pop      : constant Xm_String_Component_Type;
   Xm_String_Component_Rendition_Begin : constant Xm_String_Component_Type;
   Xm_String_Component_Rendition_End   : constant Xm_String_Component_Type;
   Xm_String_Component_Tab             : constant Xm_String_Component_Type;

   type Xm_Tab is private;

   type Xm_Tab_List is private;

   type Xm_Offset_Model is (Xm_Absolute, Xm_Relative);

   type Xm_Parse_Mapping is private;
   type Xm_Parse_Table is array (Natural range <>) of aliased Xm_Parse_Mapping;

   Null_Xm_Parse_Mapping : constant Xm_Parse_Mapping;
   Null_Xm_Parse_Table   : constant Xm_Parse_Table;

   type Xm_String_Context is private;

   type Xm_Rendition is private;
   type Xm_Rendition_List is array (Natural range <>) of aliased Xm_Rendition;

   Null_Xm_Rendition      : constant Xm_Rendition;
   Null_Xm_Rendition_List : constant Xm_Rendition_List;

--   function To_Xm_Rendition_List (Pointer : in Xm_Rendition_Pointer;
--                                  Length  : in Natural)
--     return Xm_Rendition_List;


   type Xm_Render_Table is private;

   Null_Xm_Render_Table : constant Xm_Render_Table;

   type Xm_Merge_Mode is (Xm_Skip,
                          Xm_Merge_Replace,
                          Xm_Merge_Old,
                          Xm_Merge_New,
                          Xm_Duplicate);

   type Xm_Text_Type is (Xm_Charset_Text,
                         Xm_Multibyte_Text,
                         Xm_Widechar_Text,
                         Xm_No_Text);

   type Xm_Text_Direction is (Xm_Text_Forward,
                              Xm_Text_Backward);

   subtype Xm_Text_Position is Interfaces.C.long;
   subtype Xm_Text_Format is Xlib.Atoms.Atom;

   type Xm_Text_Block_Record is record
      Pointer : Xt.Xt_Pointer;
      Length  : Interfaces.C.int;
      Format  : Xm_Text_Format;
   end record;

   type Xm_Text_Block is access all Xm_Text_Block_Record;

   type Xm_Text_Block_Wcs_Record is record
      Pointer : Interfaces.C.Wide_Strings.wchars_ptr;
      Length  : Interfaces.C.int;
   end record;

   type Xm_Text_Block_Wcs is access all Xm_Text_Block_Wcs_Record;

   type Xm_Highlight_Mode is (Xm_Highlight_Normal,
                              Xm_Highlight_Selected,
                              Xm_Highlight_Secondary_Selected,
                              Xm_See_Detail);

   type Xm_Parse_Model is (Xm_Output_All,
                           Xm_Output_Between,
                           Xm_Output_Beginning,
                           Xm_Output_End,
                           Xm_Output_Both);

   type Xm_Text_Substring_Status is (Xm_Copy_Failed,
                                     Xm_Copy_Succeeded,
                                     Xm_Copy_Truncated);

   Xm_Unspecified_Pixmap : constant Xlib.Pixmap := Xt.Xt_Unspecified_Pixmap;


   type Xm_Resource_Base_Proc is access
     function (The_Widget : in Xt.Widget;
               The_Data   : in Xt.Xt_Pointer)
       return Xt.Xt_Pointer;


   type Xm_Secondary_Resource_Data_Record is record
      Base_Proc     : Xm_Resource_Base_Proc;
      Client_Data   : Xt.Xt_Pointer;
      Name          : Xt.Xt_String;
      Res_Class     : Xt.Xt_String;
      Resources     : Xt.Ancillary_Types.Xt_Resource_Pointer;
      Num_Resources : Xt.Cardinal;
   end record;

   type Xm_Secondary_Resource_Data is
     access all Xm_Secondary_Resource_Data_Record;

   type Xm_Secondary_Resource_Data_List is
     array (Natural range <>) of aliased Xm_Secondary_Resource_Data;

   type Xm_Secondary_Resource_Data_List_Access is
     access all Xm_Secondary_Resource_Data_List;


   --

   type Xm_Alignment is (Xm_Alignment_Beginning,
                         Xm_Alignment_Center,
                         Xm_Alignment_End);

   type Xm_Arrow_Direction is (Xm_Arrow_Up,
                               Xm_Arrow_Down,
                               Xm_Arrow_Left,
                               Xm_Arrow_Right);

   type Xm_Arrow_Layout is (Xm_Arrows_End,
                            Xm_Arrows_Beginning,
                            Xm_Arrows_Split,
                            Xm_Arrows_Flat_End,
                            Xm_Arrows_Flat_Beginning);

   type Xm_Arrow_Orientation is (Xm_Arrows_Vertical,
                                 Xm_Arrows_Horizontal);

   --  На самом деле расположение подобрано так, что бы можно было использовать
   --  как битовые маски. Как это отразить ???
   type Xm_Arrow_Sensitivity is (Xm_Arrows_Insensitive,
                                 Xm_Arrows_Increment_Sensitive,
                                 Xm_Arrows_Decrement_Sensitive,
                                 Xm_Arrows_Sensitive,
                                 Xm_Arrows_Default_Sensitivity);

   type Xm_Attachment is (Xm_Attach_None,
                          Xm_Attach_Form,
                          Xm_Attach_Opposite_Form,
                          Xm_Attach_Widget,
                          Xm_Attach_Opposite_Widget,
                          Xm_Attach_Position,
                          Xm_Attach_Self);

   type Xm_Audible_Warning is (Xm_None,
                               Xm_Bell);

   type Xm_Auto_Drag_Model is (Xm_Auto_Drag_Enabled,
                               Xm_Auto_Drag_Disabled);

   type Xm_Automatic_Selection is (Xm_No_Auto_Select,
                                   Xm_Auto_Select);

   type Xm_Auto_Selection_Type is (Xm_Auto_Unset,
                                   Xm_Auto_Begin,
                                   Xm_Auto_Motion,
                                   Xm_Auto_Cancel,
                                   Xm_Auto_No_Change,
                                   Xm_Auto_Change);

   type Xm_Binding_Type is (Xm_None,
                            Xm_Pixmap,
                            Xm_Solid,
                            Xm_Spiral,
                            Xm_Pixmap_Overlap_Only);

   type Xm_Bitmap_Conversion_Model is (Xm_Match_Depth,
                                       Xm_Dynamic_Depth);

--   type Xm_Child_Horizontal_Alignment is (Xm_Alignment_Beginning,
--                                          Xm_Alignment_Center,
--                                          Xm_Alignment_End);
   subtype Xm_Child_Horizontal_Alignment is Xm_Alignment;

   type Xm_Child_Placement is (Xm_Place_Top,
                               Xm_Place_Above_Selection,
                               Xm_Place_Below_Selection);

   --  ??? Возможно лучше назвать Frame_Child_Type ???
   type Xm_Child_Type is (Xm_Frame_Generic_Child,
                          Xm_Frame_Workarea_Child,
                          Xm_Frame_Title_Child);

   type Xm_Child_Vertical_Alignment is (Xm_Alignment_Baseline_Top,
                                        Xm_Alignment_Center,
                                        Xm_Alignment_Baseline_Bottom,
                                        Xm_Alignment_Widget_Top,
                                        Xm_Alignment_Widget_Bottom);
   --  Может это вынести в deprecated ???
   Xm_Alignment_Child_Top    : constant Xm_Child_Vertical_Alignment;
   Xm_Alignment_Child_Bottom : constant Xm_Child_Vertical_Alignment;


   type Xm_Combo_Box_Type is (Xm_Combo_Box,
                              Xm_Drop_Down_Combo_Box,
                              Xm_Drop_Down_List);

   type Xm_Command_Window_Location is (Xm_Command_Above_Workspace,
                                       Xm_Command_Below_Workspace);

   type Xm_Convert_Status is (Xm_Convert_Default,
                              Xm_Convert_More,
                              Xm_Convert_Merge,
                              Xm_Convert_Refuse,
                              Xm_Convert_Done);

   type Xm_Default_Button_Emphasis is (Xm_External_Highlight,
                                       Xm_Internal_Highlight);

   type Xm_Default_Button_Type is (Xm_Dialog_None,
                                   Xm_Dialog_Cancel_Button,
                                   Xm_Dialog_Ok_Button,
                                   Xm_Dialog_Help_Button);

   type Xm_Delete_Response is (Xm_Destroy,
                               Xm_Unmap,
                               Xm_Do_Nothing);

   type Xm_Destination_Operation is (Xm_Move,
                                     Xm_Copy,
                                     Xm_Link,
                                     Xm_Other);

   type Xm_Dialog_Style is (Xm_Dialog_Modeless,
                            Xm_Dialog_Primary_Application_Modal,
                            Xm_Dialog_Full_Application_Modal,
                            Xm_Dialog_System_Modal);
   --  deprecated
   Xm_Dialog_Application_Modal : constant Xm_Dialog_Style;


   type Xm_Dialog_Type is (Xm_Dialog_Template,
                           Xm_Dialog_Error,
                           Xm_Dialog_Information,
                           Xm_Dialog_Message,
                           Xm_Dialog_Question,
                           Xm_Dialog_Warning,
                           Xm_Dialog_Working);

   --  Предстоит тщательно подумать!!! Возможно имеет смысл ввести некоторые
   --  стандартные операции для работы с масками и направлениями!!!
   type Xm_Direction is private;

   Xm_Right_To_Left_Top_To_Bottom : constant Xm_Direction;
   Xm_Left_To_Right_Top_To_Bottom : constant Xm_Direction;
   Xm_Right_To_Left_Bottom_To_Top : constant Xm_Direction;
   Xm_Left_To_Right_Bottom_To_Top : constant Xm_Direction;
   Xm_Top_To_Bottom_Right_To_Left : constant Xm_Direction;
   Xm_Top_To_Bottom_Left_To_Right : constant Xm_Direction;
   Xm_Bottom_To_Top_Right_To_Left : constant Xm_Direction;
   Xm_Bottom_To_Top_Left_To_Right : constant Xm_Direction;
   Xm_Top_To_Bottom               : constant Xm_Direction;
   Xm_Bottom_To_Top               : constant Xm_Direction;
   Xm_Right_To_Left               : constant Xm_Direction;
   Xm_Left_To_Right               : constant Xm_Direction;
   Xm_Default_Direction           : constant Xm_Direction;

   subtype Xm_Direction_Mask is Xm_Direction;

   Xm_Right_To_Left_Mask    : constant Xm_Direction_Mask;
   Xm_Left_To_Right_Mask    : constant Xm_Direction_Mask;
   Xm_Top_To_Bottom_Mask    : constant Xm_Direction_Mask;
   Xm_Bottom_To_Top_Mask    : constant Xm_Direction_Mask;
   Xm_Precedence_Horiz_Mask : constant Xm_Direction_Mask;
   Xm_Precedence_Vert_Mask  : constant Xm_Direction_Mask;

   Xm_Horizontal_Mask       : constant Xm_Direction_Mask;
   Xm_Vertical_Mask         : constant Xm_Direction_Mask;
   Xm_Precedence_Mask       : constant Xm_Direction_Mask;


   type Xm_Edit_Mode is (Xm_Multi_Line_Edit,
                         Xm_Single_Line_Edit);

   type Xm_Enable_Btn1_Transfer is (Xm_Off,
                                    Xm_Button2_Adjust,
                                    Xm_Button2_Transfer);

   type Xm_Enable_Warp is (Xm_Enable_Warp_On,
                           Xm_Enable_Warp_Off);

   type Xm_Entry_View_Type is (Xm_Large_Icon,
                               Xm_Small_Icon,
                               Xm_Any_Icon);

   type Xm_File_Filter_Style is (Xm_Filter_None,
                                 Xm_Filter_Hidden_Files);

   type Xm_Include_Status is (Xm_Insert,
                              Xm_Terminate,
                              Xm_Invoke);

   --  На самом деле определены ещё и составляющие из которых формируются
   --  значения. Необходимо разобраться. Возможно они необходимы как маски ???
   type Xm_Indicator_On is (Xm_Indicator_None,
                            Xm_Indicator_Fill,
                            Xm_Indicator_Check,
                            Xm_Indicator_Check_Box,
                            Xm_Indicator_Cross,
                            Xm_Indicator_Cross_Box,
                            Xm_Indicator_Box);

   type Xm_Indicator_Type is (Xm_N_Of_Many,
                              Xm_One_Of_Many,
                              Xm_One_Of_Many_Round,
                              Xm_One_Of_Many_Diamond);

   type Xm_Input_Policy is (Xm_Per_Shell,
                            Xm_Per_Widget,
                            Xm_Inherit_Policy);

   type Xm_Keyboard_Focus_Policy is (Xm_Explicit,
                                     Xm_Pointer);

   type Xm_Label_Type is (Xm_Pixmap,
                          Xm_Label_String);

   type Xm_Layout_Type is (Xm_Outline,
                           Xm_Spatial,
                           Xm_Detail);

   type Xm_Line_Style is (Xm_No_Line,
                          Xm_Single);

   type Xm_List_Selection_Type is (Xm_Initial,
                                   Xm_Addition,
                                   Xm_Modification);

   type Xm_Match_Behavior is (Xm_None,
                              Xm_Quick_Navigate,
                              Xm_Invalid_Match_Behavior);

   type Xm_Multi_Click is (Xm_Multiclick_Discard,
                           Xm_Multiclick_Keep);

   type Xm_Navigation_Type is (Xm_None,
                               Xm_Tab_Group,
                               Xm_Sticky_Tab_Group,
                               Xm_Exclusive_Tab_Group);

   type Xm_Notebook_Child_Type is (Xm_None,
                                   Xm_Page,
                                   Xm_Major_Tab,
                                   Xm_Minor_Tab,
                                   Xm_Status_Area,
                                   Xm_Page_Scroller);

   type Xm_Orientation is (Xm_No_Orientation,
                           Xm_Vertical,
                           Xm_Horizontal);

   type Xm_Outline_Button_Policy is (Xm_Outline_Button_Present,
                                     Xm_Outline_Button_Absent);

   type Xm_Outline_State is (Xm_Collapsed,
                             Xm_Expanded);

   type Xm_Packing is (Xm_No_Packing,
                       Xm_Pack_Tight,
                       Xm_Pack_Column,
                       Xm_Pack_None);

   type Xm_Path_Mode is (Xm_Path_Mode_Full,
                         Xm_Path_Mode_Relative);

   type Xm_Popup_Enabled is (Xm_Popup_Disabled,
                             Xm_Popup_Keyboard,
                             Xm_Popup_Automatic,
                             Xm_Popup_Automatic_Recursive);

   type Xm_Position_Mode is (Xm_Zero_Based,
                             Xm_One_Based);

   type Xm_Position_Type is (Xm_Position_Index,
                             Xm_Position_Value);

   type Xm_Primary_Ownership is (Xm_Own_Never,
                                 Xm_Own_Always,
                                 Xm_Own_Multiple,
                                 Xm_Own_Possible_Multiple);

   type Xm_Processing_Direction is (Xm_Max_On_Top,
                                    Xm_Max_On_Bottom,
                                    Xm_Max_On_Left,
                                    Xm_Max_On_Right);

   type Xm_Resize_Policy is (Xm_Resize_None,
                             Xm_Resize_Grow,
                             Xm_Resize_Any);

   type Xm_Row_Column_Type is (Xm_Work_Area,
                               Xm_Menu_Bar,
                               Xm_Menu_Pulldown,
                               Xm_Menu_Popup,
                               Xm_Menu_Option);

   type Xm_Scroll_Bar_Display_Policy is (Xm_Static,
                                         Xm_As_Needed);

   --  В оригинале опеределяется через битовые маски. Необходимо-ли это ???
   type Xm_Scroll_Bar_Placement is (Xm_Bottom_Right,
                                    Xm_Top_Right,
                                    Xm_Bottom_Left,
                                    Xm_Top_Left);

   type Xm_Scrolled_Window_Child_Type is (Xm_Work_Area,
                                          Xm_Menu_Bar,
                                          Xm_Hor_Scrollbar,
                                          Xm_Vert_Scrollbar,
                                          Xm_Command_Window,
                                          Xm_Separator,
                                          Xm_Message_Window,
                                          Xm_Scroll_Hor,
                                          Xm_Scroll_Vert,
                                          Xm_No_Scroll,
                                          Xm_Clip_Window,
                                          Xm_Generic_Child);

   type Xm_Scrolling_Policy is (Xm_Automatic,
                                Xm_Application_Defined);

   type Xm_Selection_Policy is (Xm_Single_Select,
                                Xm_Multiple_Select,
                                Xm_Extended_Select,
                                Xm_Browse_Select);

   type Xm_Selection_Technique is (Xm_Marquee,
                                   Xm_Marquee_Extend_Start,
                                   Xm_Marquee_Extend_Both,
                                   Xm_Touch_Only,
                                   Xm_Touch_Over);

   type Xm_Selection_Type is (Xm_Dialog_Work_Area,
                              Xm_Dialog_Prompt,
                              Xm_Dialog_Selection,
                              Xm_Dialog_Command,
                              Xm_Dialog_File_Selection);

   type Xm_Separator_Type is (Xm_No_Line,
                              Xm_Single_Line,
                              Xm_Double_Line,
                              Xm_Single_Dashed_Line,
                              Xm_Double_Dashed_Line,
                              Xm_Shadow_Etched_In,
                              Xm_Shadow_Etched_Out,
                              Xm_Shadow_Etched_In_Dash,
                              Xm_Shadow_Etched_Out_Dash);

   type Xm_Toggle_Button_State is (Xm_Unset,
                                   Xm_Set,
                                   Xm_Indeterminate);

   type Xm_Shadow_Type is (Xm_Shadow_Etched_In,
                           Xm_Shadow_Etched_Out,
                           Xm_Shadow_In,
                           Xm_Shadow_Out);

   type Xm_Show_Arrows is (Xm_None,
                           Xm_Each_Side,
                           Xm_Max_Side,
                           Xm_Min_Side);

   type Xm_Show_Value is (Xm_None,
                          Xm_Near_Slider,
                          Xm_Near_Border);

   type Xm_Slider_Mark is (Xm_None,
                           Xm_Etched_Line,
                           Xm_Thumb_Mark,
                           Xm_Round_Mark);

   type Xm_Slider_Visual is (Xm_Background,
                             Xm_Foreground,
                             Xm_Trough_Color,
                             Xm_Shadowed_Background);

   type Xm_Sliding_Mode is (Xm_Slider,
                            Xm_Thermometer);

   type Xm_Spatial_Include_Model is (Xm_Append,
                                     Xm_Closest,
                                     Xm_First_Fit);

   type Xm_Spatial_Resize_Model is (Xm_Grow_Minor,
                                    Xm_Grow_Major,
                                    Xm_Grow_Balanced);

   type Xm_Spatial_Snap_Model is (Xm_None,
                                  Xm_Snap_To_Grid,
                                  Xm_Center);

   type Xm_Spatial_Style is (Xm_None,
                             Xm_Grid,
                             Xm_Cells);

   --  И хотя Xm.h говорит, что может быть ещё и XmPIXMAP, это не так.
   type Xm_Spin_Box_Child_Type is (Xm_String_Child,
                                   Xm_Numeric);

   type Xm_String_Direction is (Xm_String_Direction_L_To_R,
                                Xm_String_Direction_R_To_L,
                                Xm_String_Direction_Unset,
                                Xm_String_Direction_Default);

   type Xm_Tear_Off_Model is (Xm_Tear_Off_Enabled,
                              Xm_Tear_Off_Disabled);

   type Xm_Toggle_Mode is (Xm_Toggle_Boolean,
                           Xm_Toggle_Indeterminate);

   type Xm_Traversal_Direction is (Xm_Traverse_Current,
                                   Xm_Traverse_Next,
                                   Xm_Traverse_Prev,
                                   Xm_Traverse_Home,
                                   Xm_Traverse_Next_Tab_Group,
                                   Xm_Traverse_Prev_Tab_Group,
                                   Xm_Traverse_Up,
                                   Xm_Traverse_Down,
                                   Xm_Traverse_Left,
                                   Xm_Traverse_Right,
                                   Xm_Traverse_Globally_Forward,
                                   Xm_Traverse_Globally_Backward);

   type Xm_Unit_Type is (Xm_Pixels,
                         Xm_100th_Millimeters,
                         Xm_1000th_Inches,
                         Xm_100th_Points,
                         Xm_100th_Font_Units,
                         Xm_Inches,
                         Xm_Centimeters,
                         Xm_Millimeters,
                         Xm_Points,
                         Xm_Font_Units);

   type Xm_Unpost_Behavior is (Xm_Unpost,
                               Xm_Unpost_And_Replay);

   type Xm_Vertical_Alignment is (Xm_Alignment_Baseline_Top,
                                  Xm_Alignment_Center,
                                  Xm_Alignment_Baseline_Bottom,
                                  Xm_Alignment_Contents_Top,
                                  Xm_Alignment_Contents_Bottom);

   type Xm_View_Type is (Xm_Large_Icon,
                         Xm_Small_Icon);

   type Xm_Visual_Emphasis is (Xm_Selected,
                               Xm_Not_Selected);

   type Xm_Visual_Policy is (Xm_Variable,
                             Xm_Constant,
                             Xm_Resize_If_Possible);

   type Xm_Which_Button is (Xm_Button1,
                            Xm_Button2,
                            Xm_Button3,
                            Xm_Button4,
                            Xm_Button5);

   --

   type Xm_Clipboard_Status is (Xm_Clipboard_Fail,
                                Xm_Clipboard_Success,
                                Xm_Clipboard_Truncate,
                                Xm_Clipboard_Locked,
                                Xm_Clipboard_Bad_Format,
                                Xm_Clipboard_No_Data);

   subtype Xm_Clipboard_Item_Id is Interfaces.C.long;
   subtype Xm_Clipboard_Data_Id is Interfaces.C.long;
   subtype Xm_Clipboard_Private_Id is Interfaces.C.long;

   --

   subtype Xm_Notebook_Page_Number is Interfaces.C.int;
   Xm_Unspecified_Page_Number : constant Xm_Notebook_Page_Number;

   type Xm_Notebook_Page_Status is (Xm_Page_Found,
                                    Xm_Page_Invalid,
                                    Xm_Page_Empty,
                                    Xm_Page_Duplicated);

   type Xm_Notebook_Page_Info is record
      Page_Number        : Xm_Notebook_Page_Number;
      Page_Widget        : Xt.Widget;
      Status_Area_Widget : Xt.Widget;
      Major_Tab_Widget   : Xt.Widget;
      Minor_Tab_Widget   : Xt.Widget;
   end record;

   type Xm_Spin_Box_Validation_Status is (Xm_Valid_Value,
                                          Xm_Current_Value,
                                          Xm_Maximum_Value,
                                          Xm_Minimum_Value,
                                          Xm_Increment_Value);

   subtype Xm_Spin_Box_Position is Interfaces.C.int;

   type Xm_List_Position_Count is
     new Interfaces.C.int range 0 .. Interfaces.C.int'Last;
   subtype Xm_List_Position is Xm_List_Position_Count
     range 1 .. Xm_List_Position_Count'Last;

   type Xm_List_Position_List is
     array (Natural range <>) of aliased Xm_List_Position;
   type Xm_List_Position_List_Access is access all Xm_List_Position_List;
   type Xm_List_Position_Pointer is access all Xm_List_Position;

   function To_Xm_List_Position_List (Pointer : in Xm_List_Position_Pointer;
                                      Length  : in Natural)
     return Xm_List_Position_List;


   --  callbacks data types

   subtype Xm_Callback_Reason is Interfaces.C.int;

   Xm_CR_None                    : constant Xm_Callback_Reason;
   Xm_CR_Help                    : constant Xm_Callback_Reason;
   Xm_CR_Value_Changed           : constant Xm_Callback_Reason;
   Xm_CR_Increment               : constant Xm_Callback_Reason;
   Xm_CR_Decrement               : constant Xm_Callback_Reason;
   Xm_CR_Page_Increment          : constant Xm_Callback_Reason;
   Xm_CR_Page_Decrement          : constant Xm_Callback_Reason;
   Xm_CR_To_Top                  : constant Xm_Callback_Reason;
   Xm_CR_To_Bottom               : constant Xm_Callback_Reason;
   Xm_CR_Drag                    : constant Xm_Callback_Reason;
   Xm_CR_Activate                : constant Xm_Callback_Reason;
   Xm_CR_Arm                     : constant Xm_Callback_Reason;
   Xm_CR_Disarm                  : constant Xm_Callback_Reason;
   Xm_CR_Map                     : constant Xm_Callback_Reason;
   Xm_CR_Unmap                   : constant Xm_Callback_Reason;
   Xm_CR_Focus                   : constant Xm_Callback_Reason;
   Xm_CR_Losing_Focus            : constant Xm_Callback_Reason;
   Xm_CR_Modifying_Text_Value    : constant Xm_Callback_Reason;
   Xm_CR_Moving_Insert_Cursor    : constant Xm_Callback_Reason;
--   Xm_CR_Execute              : constant Xm_Callback_Reason;
   Xm_CR_Single_Select           : constant Xm_Callback_Reason;
   Xm_CR_Multiple_Select         : constant Xm_Callback_Reason;
   Xm_CR_Extended_Select         : constant Xm_Callback_Reason;
   Xm_CR_Browse_Select           : constant Xm_Callback_Reason;
   Xm_CR_Default_Action          : constant Xm_Callback_Reason;
--   Xm_CR_Clipboard_Data_Request : constant Xm_Callback_Reason;
--   Xm_CR_Clipboard_Data_Delete  : constant Xm_Callback_Reason;
   Xm_CR_Cascading               : constant Xm_Callback_Reason;
   Xm_CR_Ok                      : constant Xm_Callback_Reason;
   Xm_CR_Cancel                  : constant Xm_Callback_Reason;
   Xm_CR_Apply                   : constant Xm_Callback_Reason;
   Xm_CR_No_Match                : constant Xm_Callback_Reason;
   Xm_CR_Command_Entered         : constant Xm_Callback_Reason;
   Xm_CR_Command_Changed         : constant Xm_Callback_Reason;
   Xm_CR_Expose                  : constant Xm_Callback_Reason;
   Xm_CR_Resize                  : constant Xm_Callback_Reason;
   Xm_CR_Input                   : constant Xm_Callback_Reason;
   Xm_CR_Gain_Primary            : constant Xm_Callback_Reason;
   Xm_CR_Lose_Primary            : constant Xm_Callback_Reason;
--   Xm_CR_Create                  : constant Xm_Callback_Reason;
   Xm_CR_Tear_Off_Activate       : constant Xm_Callback_Reason;
   Xm_CR_Tear_Off_Deactivate     : constant Xm_Callback_Reason;
   Xm_CR_Obscured_Traversal      : constant Xm_Callback_Reason;
--   Xm_CR_Focus_Moved             : constant Xm_Callback_Reason;
   Xm_CR_Repost                  : constant Xm_Callback_Reason;
   Xm_CR_Collapsed               : constant Xm_Callback_Reason;
   Xm_CR_Expanded                : constant Xm_Callback_Reason;
   Xm_CR_Select                  : constant Xm_Callback_Reason;
   Xm_CR_Drag_Start              : constant Xm_Callback_Reason;
   Xm_CR_No_Font                 : constant Xm_Callback_Reason;
   Xm_CR_No_Rendition            : constant Xm_Callback_Reason;
   Xm_CR_Post                    : constant Xm_Callback_Reason;
   Xm_CR_Spin_Next               : constant Xm_Callback_Reason;
   Xm_CR_Spin_Prior              : constant Xm_Callback_Reason;
   Xm_CR_Spin_First              : constant Xm_Callback_Reason;
   Xm_CR_Spin_Last               : constant Xm_Callback_Reason;
   Xm_CR_Page_Scroller_Increment : constant Xm_Callback_Reason;
   Xm_CR_Page_Scroller_Decrement : constant Xm_Callback_Reason;
   Xm_CR_Major_Tab               : constant Xm_Callback_Reason;
   Xm_CR_Minor_Tab               : constant Xm_Callback_Reason;
   Xm_CR_Start_Job               : constant Xm_Callback_Reason;
   Xm_CR_End_Job                 : constant Xm_Callback_Reason;
   Xm_CR_Page_Setup              : constant Xm_Callback_Reason;
   Xm_CR_PDM_None                : constant Xm_Callback_Reason;
   Xm_CR_PDM_Up                  : constant Xm_Callback_Reason;
   Xm_CR_PDM_Start_Error         : constant Xm_Callback_Reason;
   Xm_CR_PDM_Start_VXAuth        : constant Xm_Callback_Reason;
   Xm_CR_PDM_Start_PXAuth        : constant Xm_Callback_Reason;
   Xm_CR_PDM_Ok                  : constant Xm_Callback_Reason;
   Xm_CR_PDM_Cancel              : constant Xm_Callback_Reason;
   Xm_CR_PDM_Exit_Error          : constant Xm_Callback_Reason;


   type Xm_Any_Callback_Struct is record
      Reason : Xm_Callback_Reason;
      Event  : Xlib.Events.Event;
   end record;

   type Xm_Any_Callback_Struct_Access is access all Xm_Any_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Any_Callback_Struct_Access;


   type Xm_Arrow_Button_Callback_Struct is record
      Reason      : Xm_Callback_Reason;
      Event       : Xlib.Events.Event;
      Click_Count : Interfaces.C.int;
   end record;

   type Xm_Arrow_Button_Callback_Struct_Access is
     access all Xm_Arrow_Button_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Arrow_Button_Callback_Struct_Access;


   type Xm_Combo_Box_Callback_Struct is record
      Reason        : Xm_Callback_Reason;
      Event         : Xlib.Events.Event;
      Item_Or_Text  : Xm_String;
      Item_Position : Interfaces.C.int;
   end record;

   type Xm_Combo_Box_Callback_Struct_Access is
     access all Xm_Combo_Box_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Combo_Box_Callback_Struct_Access;


   type Xm_Command_Callback_Struct is record
      Reason   : Xm_Callback_Reason;
      Event    : Xlib.Events.Event;
      Value    : Xm_String;
      Obsolete : Interfaces.C.int;
   end record;

   type Xm_Command_Callback_Struct_Access is
     access all Xm_Command_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Command_Callback_Struct_Access;


   type Xm_Container_Outline_Callback_Struct is record
      Reason            : Xm.Xm_Callback_Reason;
      Event             : Xlib.Events.Event;
      Item              : Xt.Widget;
      New_Outline_State : Xm_Outline_State;       --  in/out
   end record;

   type Xm_Container_Outline_Callback_Struct_Access is
     access Xm_Container_Outline_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Container_Outline_Callback_Struct_Access;


   type Xm_Container_Select_Callback_Struct is record
      Reason              : Xm.Xm_Callback_Reason;
      Event               : Xlib.Events.Event;
      Selected_Items      : Xt.Ancillary_Types.Xt_Widget_Pointer;
      Selected_Item_Count : Interfaces.C.int;
      Auto_Selection_Type : Xm_Auto_Selection_Type;
   end record;

   type Xm_Container_Select_Callback_Struct_Access is
     access Xm_Container_Select_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Container_Select_Callback_Struct_Access;


   type Xm_Converting_Flag is new Interfaces.C.int;

   Xm_Converting_None     : constant Xm_Converting_Flag := 0;
   Xm_Converting_Same     : constant Xm_Converting_Flag := 1;
   Xm_Converting_Transact : constant Xm_Converting_Flag := 2;
   Xm_Converting_Partial  : constant Xm_Converting_Flag := 4;

   type Xm_Convert_Callback_Struct is record
      Reason        : Xm.Xm_Callback_Reason;
      Event         : Xlib.Events.Event;
      Selection     : Xlib.Atoms.Atom;
      Target        : Xlib.Atoms.Atom;
      Source_Data   : Xt.Xt_Pointer;
      Location_Data : Xt.Xt_Pointer;
      Flags         : Xm_Converting_Flag;
      Parm          : Xt.Xt_Pointer;
      Parm_Format   : Interfaces.C.int;
      Parm_Length   : Interfaces.C.unsigned_long;
      Parm_Type     : Xlib.Atoms.Atom;
      Status        : Xm_Convert_Status;           --  in/out
      Value         : Xt.Xt_Pointer;               --  in/out
      Value_Type    : Xlib.Atoms.Atom;             --  in/out
      Value_Format  : Interfaces.C.int;            --  in/out
      Value_Length  : Interfaces.C.unsigned_long;  --  in/out
   end record;

   type Xm_Convert_Callback_Struct_Access is access Xm_Convert_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Convert_Callback_Struct_Access;


   type Xm_Destination_Callback_Struct is record
      Reason           : Xm.Xm_Callback_Reason;
      Event            : Xlib.Events.Event;
      Selection        : Xlib.Atoms.Atom;
      Operation        : Xm_Destination_Operation;
      Flags            : Xm_Converting_Flag;
      Transfer_Id      : Xt.Xt_Pointer;
      Destination_Data : Xt.Xt_Pointer;
      Location_Data    : Xt.Xt_Pointer;
      Time             : Xlib.Time;
   end record;

   type Xm_Destination_Callback_Struct_Access is
     access Xm_Destination_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Destination_Callback_Struct_Access;


   type Xm_Drag_Start_Callback_Struct is record
      Reason     : Xm.Xm_Callback_Reason;
      Event      : Xlib.Events.Event;
      Time_Stamp : Xt.Widget;
      Do_It      : Xt.Xt_Boolean;
   end record;

   type Xm_Drag_Start_Callback_Struct_Access is
     access all Xm_Drag_Start_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Drag_Start_Callback_Struct_Access;


   type Xm_Display_Callback_Struct is record
      Reason       : Xm_Callback_Reason;
      Event        : Xlib.Events.Event;
      Rendition    : Xm_Rendition;
      Font_Name    : Interfaces.C.Strings.chars_ptr;
      Render_Table : Xm_Render_Table;
      Tag          : Xm_String_Tag;
   end record;

   type Xm_Display_Callback_Struct_Access is
     access all Xm_Display_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Display_Callback_Struct_Access;


   type Xm_Drawing_Area_Callback_Struct is record
      Reason : Xm_Callback_Reason;
      Event  : Xlib.Events.Event;
      Window : Xlib.Window;
   end record;

   type Xm_Drawing_Area_Callback_Struct_Access is
     access all Xm_Drawing_Area_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Drawing_Area_Callback_Struct_Access;


   type Xm_Drawn_Button_Callback_Struct is record
      Reason      : Xm_Callback_Reason;
      Event       : Xlib.Events.Event;
      Window      : Xlib.Window;
      Click_Count : Interfaces.C.int;
   end record;

   type Xm_Drawn_Button_Callback_Struct_Access is
     access all Xm_Drawn_Button_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Drawn_Button_Callback_Struct_Access;


   type Xm_File_Selection_Box_Callback_Struct is record
      Reason     : Xm_Callback_Reason;
      Event      : Xlib.Events.Event;
      Value      : Xm_String;
      Obsolete_1 : Interfaces.C.int;
      Mask       : Xm_String;
      Obsolete_2 : Interfaces.C.int;
      Dir        : Xm_String;
      Obsolete_3 : Interfaces.C.int;
      Pattern    : Xm_String;
      Obsolete_4 : Interfaces.C.int;
   end record;

   type Xm_File_Selection_Box_Callback_Struct_Access is
     access all Xm_File_Selection_Box_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_File_Selection_Box_Callback_Struct_Access;


   type Xm_List_Callback_Struct is record
      Reason                  : Xm_Callback_Reason;
      Event                   : Xlib.Events.Event;
      Item                    : Xm_String;
      Obsolete_1              : Interfaces.C.int;
      Item_Position           : Xm_List_Position;
      Selected_Items          : Xm_String_Pointer;
      Selected_Item_Count     : Interfaces.C.int;
      Selected_Item_Positions : Xm_List_Position_Pointer;
      Selection_Type          : Xm_List_Selection_Type;
      Auto_Selection_Type     : Xm_Auto_Selection_Type;
   end record;

   type Xm_List_Callback_Struct_Access is access all Xm_List_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_List_Callback_Struct_Access;


   type Xm_Notebook_Callback_Struct is record
      Reason           : Xm_Callback_Reason;
      Event            : Xlib.Events.Event;
      Page_Number      : Xm_Notebook_Page_Number;
      Page_Widget      : Xt.Widget;
      Prev_Page_Number : Xm_Notebook_Page_Number;
      Prev_Page_Widget : Xt.Widget;
   end record;

   type Xm_Notebook_Callback_Struct_Access is
     access all Xm_Notebook_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Notebook_Callback_Struct_Access;


   type Xm_Popup_Handler_Callback_Struct is record
      Reason       : Xm_Callback_Reason;
      Event        : Xlib.Events.Event;
      Menu_To_Post : Xt.Widget;
      Post_It      : Xt.Xt_Boolean;  --  in/out
      Target       : Xt.Widget;
   end record;

   type Xm_Popup_Handler_Callback_Struct_Access is
     access Xm_Popup_Handler_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Popup_Handler_Callback_Struct_Access;


   type Xm_Print_Shell_Callback_Struct is record
      Reason        : Xm_Callback_Reason;
      Event         : Xlib.Events.Event;
      Print_Context : Xlib.Extensions.Print.Xp_Context;
      Last_Page     : Xt.Xt_Boolean;     --  in/out
      Detail        : Xt.Xt_Pointer;
   end record;

   type Xm_Print_Shell_Callback_Struct_Access is
     access all Xm_Print_Shell_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Print_Shell_Callback_Struct_Access;


   type Xm_Push_Button_Callback_Struct is record
      Reason      : Xm_Callback_Reason;
      Event       : Xlib.Events.Event;
      Click_Count : Interfaces.C.int;
   end record;

   type Xm_Push_Button_Callback_Struct_Access is
     access all Xm_Push_Button_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Push_Button_Callback_Struct_Access;


   type Xm_Row_Column_Callback_Struct is record
      Reason          : Xm_Callback_Reason;
      Event           : Xlib.Events.Event;
      Widget          : Xt.Widget;
      Data            : Xt.Xt_Pointer;
      Callback_Struct : Xt.Xt_Pointer;
   end record;

   type Xm_Row_Column_Callback_Struct_Access is
     access all Xm_Row_Column_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Row_Column_Callback_Struct_Access;


   type Xm_Scale_Callback_Struct is record
      Reason : Xm_Callback_Reason;
      Event  : Xlib.Events.Event;
      Value  : Interfaces.C.int;
   end record;

   type Xm_Scale_Callback_Struct_Access is access all Xm_Scale_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Scale_Callback_Struct_Access;


   type Xm_Scroll_Bar_Callback_Struct is record
      Reason : Xm_Callback_Reason;
      Event  : Xlib.Events.Event;
      Value  : Interfaces.C.int;
      Pixel  : Interfaces.C.int;
   end record;

   type Xm_Scroll_Bar_Callback_Struct_Access is
     access all Xm_Scroll_Bar_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Scroll_Bar_Callback_Struct_Access;


   type Xm_Selection_Box_Callback_Struct is record
      Reason   : Xm_Callback_Reason;
      Event    : Xlib.Events.Event;
      Value    : Xm_String;
      Obsolete : Interfaces.C.int;
   end record;

   type Xm_Selection_Box_Callback_Struct_Access is
     access all Xm_Selection_Box_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Selection_Box_Callback_Struct_Access;


   type Xm_Spin_Box_Callback_Struct is record
      Reason           : Xm_Callback_Reason;
      Event            : Xlib.Events.Event;
      Widget           : Xt.Widget;
      Do_It            : Xt.Xt_Boolean;  --  in/out
      Position         : Interfaces.C.int;
      Value            : Xm_String;
      Crossed_Boundary : Xt.Xt_Boolean;
   end record;

   type Xm_Spin_Box_Callback_Struct_Access is
     access all Xm_Spin_Box_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Spin_Box_Callback_Struct_Access;

   subtype Xm_Simple_Spin_Box_Callback_Struct is Xm_Spin_Box_Callback_Struct;
   subtype Xm_Simple_Spin_Box_Callback_Struct_Access
     is Xm_Spin_Box_Callback_Struct_Access;


   type Xm_Text_Verify_Callback_Struct is record
      Reason       : Xm_Callback_Reason;
      Event        : Xlib.Events.Event;
      Do_It        : Xt.Xt_Boolean;  --  in/out
      Curr_Insert  : Xm_Text_Position;
      New_Insert   : Xm_Text_Position;
      Start_Pos    : Xm_Text_Position;
      End_Pos      : Xm_Text_Position;
      Text         : Xm_Text_Block;
   end record;

   type Xm_Text_Verify_Callback_Struct_Access is
     access all Xm_Text_Verify_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Text_Verify_Callback_Struct_Access;


   type Xm_Text_Verify_Callback_Struct_Wcs is record
      Reason       : Xm_Callback_Reason;
      Event        : Xlib.Events.Event;
      Do_It        : Xt.Xt_Boolean;  --  in/out
      Curr_Insert  : Xm_Text_Position;
      New_Insert   : Xm_Text_Position;
      Start_Pos    : Xm_Text_Position;
      End_Pos      : Xm_Text_Position;
      Text         : Xm_Text_Block_Wcs;
   end record;

   type Xm_Text_Verify_Callback_Struct_Wcs_Access is
     access all Xm_Text_Verify_Callback_Struct_Wcs;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Text_Verify_Callback_Struct_Wcs_Access;


   type Xm_Toggle_Button_Callback_Struct is record
      Reason : Xm_Callback_Reason;
      Event  : Xlib.Events.Event;
      Set    : Interfaces.C.int;
--  Должно быть как указано ниже, но тут возникает потребность в указании
--  правил расположения, что снизит переносимость.
--      Set    : Xm_Toggle_Button_State;
   end record;

   type Xm_Toggle_Button_Callback_Struct_Access is access all Xm_Toggle_Button_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Toggle_Button_Callback_Struct_Access;


   type Xm_Traversal_Obscured_Callback_Struct is record
      Reason                : Xm_Callback_Reason;
      Event                 : Xlib.Events.Event;
      Traversal_Destination : Xt.Widget;
      Direction             : Xm_Traversal_Direction;
   end record;

   type Xm_Traversal_Obscured_Callback_Struct_Access is
     access all Xm_Traversal_Obscured_Callback_Struct;

   function To_Callback_Struct_Access (Source : in Xt.Xt_Pointer)
     return Xm_Traversal_Obscured_Callback_Struct_Access;


   ---------------------------------------------------------------------------
   --  Obsolete and Depracated
   ---------------------------------------------------------------------------

   type Xm_Dialog_Child_Type is (Xm_Dialog_None,
                                 Xm_Dialog_Apply_Button,
                                 Xm_Dialog_Cancel_Button,
                                 Xm_Dialog_Default_Button,
                                 Xm_Dialog_Ok_Button,
                                 Xm_Dialog_Filter_Label,
                                 Xm_Dialog_Filter_Text,
                                 Xm_Dialog_Help_Button,
                                 Xm_Dialog_List,
                                 Xm_Dialog_List_Label,
                                 Xm_Dialog_Message_Label,
                                 Xm_Dialog_Selection_Label,
                                 Xm_Dialog_Symbol_Label,
                                 Xm_Dialog_Text,
                                 Xm_Dialog_Separator,
                                 Xm_Dialog_Dir_List,
                                 Xm_Dialog_Dir_List_Label);
   Xm_Dialog_History_List    : constant Xm_Dialog_Child_Type;
   Xm_Dialog_Prompt_Label    : constant Xm_Dialog_Child_Type;
   Xm_Dialog_Value_Text      : constant Xm_Dialog_Child_Type;
   Xm_Dialog_Command_Text    : constant Xm_Dialog_Child_Type;
   Xm_Dialog_File_List       : constant Xm_Dialog_Child_Type;
   Xm_Dialog_File_List_Label : constant Xm_Dialog_Child_Type;


private

   pragma Linker_Options ("-lXm");
   pragma Linker_Options ("-lXt");


   type Xm_String_Record is null record;
   pragma Convention (C, Xm_String_Record);

   type Xm_String is access all Xm_String_Record;
   pragma Convention (C, Xm_String);

   Xm_String_Default_Char_Set : constant Xm_String_Char_Set
     := Interfaces.C.Strings.New_String ("");
   Null_Xm_String             : constant Xm_String := null;
   Null_Xm_String_Tag         : constant Xm_String_Tag
     := Interfaces.C.Strings.Null_Ptr;
   Null_Xm_String_Tag_List    : constant Xm_String_Tag_List (1 .. 0)
     := (others => Null_Xm_String_Tag);
   Xm_Fontlist_Default_Tag    : constant Xm_String_Tag
     := Interfaces.C.Strings.New_String ("FONTLIST_DEFAULT_TAG_STRING");
   Motif_Default_Locale       : constant Xm_String_Tag
     := Interfaces.C.Strings.New_String ("_MOTIF_DEFAULT_LOCALE");

   type Xm_Tab_Record is null record;
   pragma Convention (C, Xm_Tab_Record);

   type Xm_Tab is access all Xm_Tab_Record;
   pragma Convention (C, Xm_Tab);

   type Xm_Tab_List_Record is null record;
   pragma Convention (C, Xm_Tab_List_Record);

   type Xm_Tab_List is access all Xm_Tab_List_Record;
   pragma Convention (C, Xm_Tab_List);

   type Xm_Parse_Mapping_Record is null record;
   pragma Convention (C, Xm_Parse_Mapping_Record);

   type Xm_Parse_Mapping is access all Xm_Parse_Mapping_Record;
   pragma Convention (C, Xm_Parse_Mapping);

   Null_Xm_Parse_Mapping : constant Xm_Parse_Mapping := null;
   Null_Xm_Parse_Table   : constant Xm_Parse_Table (1 .. 0)
     := (others => Null_Xm_Parse_Mapping);

   type Xm_String_Context_Record is null record;
   pragma Convention (C, Xm_String_Context_Record);

   type Xm_String_Context is access all Xm_String_Context_Record;
   pragma Convention (C, Xm_String_Context);

   type Xm_Rendition_Record is null record;
   pragma Convention (C, Xm_Rendition_Record);

   type Xm_Rendition is access all Xm_Rendition_Record;
   pragma Convention (C, Xm_Rendition);

--   pragma Convention (C, Xm_Rendition_Pointer);

   Null_Xm_Rendition      : constant Xm_Rendition := null;
   Null_Xm_Rendition_List : constant Xm_Rendition_List (1 .. 0)
     := (others => Null_Xm_Rendition);

   type Xm_Render_Table_Record is null record;
   pragma Convention (C, Xm_Render_Table_Record);

   type Xm_Render_Table is access all Xm_Render_Table_Record;
   pragma Convention (C, Xm_Render_Table);

   Null_Xm_Render_Table : constant Xm_Render_Table := null;

   pragma Convention (C, Xm_Alignment);
   for Xm_Alignment'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Any_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Any_Callback_Struct_Access);

   pragma Convention (C, Xm_Arrow_Button_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Arrow_Button_Callback_Struct_Access);

   pragma Convention (C, Xm_Arrow_Direction);
   for Xm_Arrow_Direction'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Arrow_Layout);
   for Xm_Arrow_Layout'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Arrow_Orientation);
   for Xm_Arrow_Orientation'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Arrow_Sensitivity);
   for Xm_Arrow_Sensitivity'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Attachment);
   for Xm_Attachment'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Audible_Warning);
   for Xm_Audible_Warning'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Auto_Drag_Model);
   for Xm_Auto_Drag_Model'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Automatic_Selection);
   for Xm_Automatic_Selection'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Auto_Selection_Type);
   for Xm_Auto_Selection_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Binding_Type);
   for Xm_Binding_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Bitmap_Conversion_Model);
   for Xm_Bitmap_Conversion_Model'Size use Interfaces.C.unsigned_char'Size;

--   pragma Convention (C, Xm_Child_Horizontal_Alignment);
--   for Xm_Child_Horizontal_Alignment'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Child_Placement);
   for Xm_Child_Placement'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Child_Type);
   for Xm_Child_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Child_Vertical_Alignment);
   for Xm_Child_Vertical_Alignment'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Combo_Box_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Combo_Box_Callback_Struct_Access);

   pragma Convention (C, Xm_Combo_Box_Type);
   for Xm_Combo_Box_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Command_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Command_Callback_Struct_Access);

   pragma Convention (C, Xm_Command_Window_Location);
   for Xm_Command_Window_Location'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Container_Outline_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Container_Outline_Callback_Struct_Access);

   pragma Convention (C, Xm_Container_Select_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Container_Select_Callback_Struct_Access);

   pragma Convention (C, Xm_Convert_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Convert_Callback_Struct_Access);

   pragma Convention (C, Xm_Convert_Status);
   for Xm_Convert_Status'Size use Interfaces.C.int'Size;

   pragma Convention (C, Xm_Clipboard_Status);

   pragma Convention (C, Xm_Default_Button_Emphasis);
   for Xm_Default_Button_Emphasis'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Default_Button_Type);
   for Xm_Default_Button_Type'Size use Interfaces.C.unsigned_char'Size;
   for Xm_Default_Button_Type use (Xm_Dialog_None          => 0,
                                   Xm_Dialog_Cancel_Button => 2,
                                   Xm_Dialog_Ok_Button     => 4,
                                   Xm_Dialog_Help_Button   => 7);

   pragma Convention (C, Xm_Delete_Response);
   for Xm_Delete_Response'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Destination_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Destination_Callback_Struct_Access);

   pragma Convention (C, Xm_Destination_Operation);
   for Xm_Destination_Operation'Size use Xt.Ancillary_Types.Xt_Enum'Size;
   for Xm_Destination_Operation use (Xm_Move  => 0,
                                     Xm_Copy  => 1,
                                     Xm_Link  => 2,
                                     Xm_Other => 4);

   pragma Convention (C, Xm_Dialog_Child_Type);
   for Xm_Dialog_Child_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Dialog_Style);
   for Xm_Dialog_Style'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Dialog_Type);
   for Xm_Dialog_Type'Size use Interfaces.C.unsigned_char'Size;

   type Xm_Direction is new Interfaces.C.unsigned_char;
   pragma Convention (C, Xm_Direction);

   pragma Convention (C, Xm_Display_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Display_Callback_Struct_Access);

   pragma Convention (C, Xm_Drag_Start_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Drag_Start_Callback_Struct_Access);

   pragma Convention (C, Xm_Drawing_Area_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Drawing_Area_Callback_Struct_Access);

   pragma Convention (C, Xm_Drawn_Button_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Drawn_Button_Callback_Struct_Access);

   pragma Convention (C, Xm_Edit_Mode);
   for Xm_Edit_Mode'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Enable_Btn1_Transfer);
   for Xm_Enable_Btn1_Transfer'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Enable_Warp);
   for Xm_Enable_Warp'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Entry_View_Type);
   for Xm_Entry_View_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_File_Filter_Style);
   for Xm_File_Filter_Style'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_File_Selection_Box_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_File_Selection_Box_Callback_Struct_Access);

   pragma Convention (C, Xm_Highlight_Mode);

   pragma Convention (C, Xm_Include_Status);
   for Xm_Include_Status'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Indicator_On);
   for Xm_Indicator_On'Size use Interfaces.C.unsigned_char'Size;
   for Xm_Indicator_On use (Xm_Indicator_None      => 0,
                            Xm_Indicator_Fill      => 1,
                            Xm_Indicator_Check     => 16,
                            Xm_Indicator_Check_Box => 17,
                            Xm_Indicator_Cross     => 32,
                            Xm_Indicator_Cross_Box => 33,
                            Xm_Indicator_Box       => 255);

   pragma Convention (C, Xm_Indicator_Type);
   for Xm_Indicator_Type'Size use Interfaces.C.unsigned_char'Size;
   for Xm_Indicator_Type use (Xm_N_Of_Many           => 1,
                              Xm_One_Of_Many         => 2,
                              Xm_One_Of_Many_Round   => 3,
                              Xm_One_Of_Many_Diamond => 4);

   pragma Convention (C, Xm_Input_Policy);
   for Xm_Input_Policy'Size use Interfaces.C.unsigned_char'Size;
   for Xm_Input_Policy use (Xm_Per_Shell      => 0,
                            Xm_Per_Widget     => 1,
                            Xm_Inherit_Policy => 255);

   pragma Convention (C, Xm_Keyboard_Focus_Policy);
   for Xm_Keyboard_Focus_Policy'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Label_Type);
   for Xm_Label_Type'Size use Interfaces.C.unsigned_char'Size;
   for Xm_Label_Type use (Xm_Pixmap => 1,
                          Xm_Label_String => 2);

   pragma Convention (C, Xm_Layout_Type);
   for Xm_Layout_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Line_Style);
   for Xm_Line_Style'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_List_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_List_Callback_Struct_Access);

   pragma No_Strict_Aliasing (Xm_List_Position_Pointer);

   pragma Convention (C, Xm_List_Selection_Type);
   for Xm_List_Selection_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Match_Behavior);
   for Xm_Match_Behavior'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Merge_Mode);

   pragma Convention (C, Xm_Multi_Click);
   for Xm_Multi_Click'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Navigation_Type);
   for Xm_Navigation_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Notebook_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Notebook_Callback_Struct_Access);

   pragma Convention (C, Xm_Notebook_Child_Type);
   for Xm_Notebook_Child_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Notebook_Page_Info);

   pragma Convention (C, Xm_Notebook_Page_Status);

   pragma Convention (C, Xm_Offset_Model);

   pragma Convention (C, Xm_Orientation);
   for Xm_Orientation'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Outline_Button_Policy);
   for Xm_Outline_Button_Policy'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Outline_State);
   for Xm_Outline_State'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Packing);
   for Xm_Packing'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Parse_Model);

   pragma Convention (C, Xm_Path_Mode);
   for Xm_Path_Mode'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Popup_Enabled);
   for Xm_Popup_Enabled'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Popup_Handler_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Popup_Handler_Callback_Struct_Access);

   pragma Convention (C, Xm_Position_Mode);
   for Xm_Position_Mode'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Position_Type);
   for Xm_Position_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Primary_Ownership);
   for Xm_Primary_Ownership'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Print_Shell_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Print_Shell_Callback_Struct_Access);

   pragma Convention (C, Xm_Processing_Direction);
   for Xm_Processing_Direction'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Push_Button_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Push_Button_Callback_Struct_Access);

   pragma Convention (C, Xm_Resize_Policy);
   for Xm_Resize_Policy'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Row_Column_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Row_Column_Callback_Struct_Access);

   pragma Convention (C, Xm_Row_Column_Type);
   for Xm_Row_Column_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Scale_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Scale_Callback_Struct_Access);

   pragma Convention (C, Xm_Scroll_Bar_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Scroll_Bar_Callback_Struct_Access);

   pragma Convention (C, Xm_Scroll_Bar_Display_Policy);
   for Xm_Scroll_Bar_Display_Policy'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Scroll_Bar_Placement);
   for Xm_Scroll_Bar_Placement'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Scrolled_Window_Child_Type);
   for Xm_Scrolled_Window_Child_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Scrolling_Policy);
   for Xm_Scrolling_Policy'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Secondary_Resource_Data_Record);

   pragma Convention (C, Xm_Selection_Box_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Selection_Box_Callback_Struct_Access);

   pragma Convention (C, Xm_Selection_Policy);
   for Xm_Selection_Policy'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Selection_Technique);
   for Xm_Selection_Technique'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Selection_Type);
   for Xm_Selection_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Separator_Type);
   for Xm_Separator_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma No_Strict_Aliasing (Xm_String_Pointer);

   pragma Convention (C, Xm_Toggle_Button_State);
   for Xm_Toggle_Button_State'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Traversal_Obscured_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Traversal_Obscured_Callback_Struct_Access);

   pragma Convention (C, Xm_Shadow_Type);
   for Xm_Shadow_Type'Size use Interfaces.C.unsigned_char'Size;
   for Xm_Shadow_Type use (Xm_Shadow_Etched_In  => 5,
                           Xm_Shadow_Etched_Out => 6,
                           Xm_Shadow_In         => 7,
                           Xm_Shadow_Out        => 8);

   pragma Convention (C, Xm_Show_Arrows);
   for Xm_Show_Arrows'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Show_Value);
   for Xm_Show_Value'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Slider_Mark);
   for Xm_Slider_Mark'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Slider_Visual);
   for Xm_Slider_Visual'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Sliding_Mode);
   for Xm_Sliding_Mode'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Spatial_Include_Model);
   for Xm_Spatial_Include_Model'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Spatial_Resize_Model);
   for Xm_Spatial_Resize_Model'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Spatial_Snap_Model);
   for Xm_Spatial_Snap_Model'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Spatial_Style);
   for Xm_Spatial_Style'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Spin_Box_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Spin_Box_Callback_Struct_Access);

   pragma Convention (C, Xm_Spin_Box_Child_Type);
   for Xm_Spin_Box_Child_Type'Size use Interfaces.C.unsigned_char'Size;
   for Xm_Spin_Box_Child_Type use (Xm_String_Child  => 2,
                                   Xm_Numeric       => 3);

   pragma Convention (C, Xm_Spin_Box_Validation_Status);
   for Xm_Spin_Box_Validation_Status'Size use Interfaces.C.int'Size;

   pragma Convention (C, Xm_String_Component_Type);
   for Xm_String_Component_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_String_Direction);
   for Xm_String_Direction'Size use Interfaces.C.unsigned_char'Size;
   for Xm_String_Direction use (Xm_String_Direction_L_To_R  => 0,
                                Xm_String_Direction_R_To_L  => 1,
                                Xm_String_Direction_Unset   => 3,
                                Xm_String_Direction_Default => 255);

   pragma Convention (C, Xm_Tear_Off_Model);
   for Xm_Tear_Off_Model'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Text_Block);

   pragma Convention (C, Xm_Text_Block_Record);

   pragma Convention (C, Xm_Text_Block_Wcs);

   pragma Convention (C, Xm_Text_Block_Wcs_Record);

   pragma Convention (C, Xm_Text_Direction);

   pragma Convention (C, Xm_Text_Substring_Status);

   pragma Convention (C, Xm_Text_Type);
   for Xm_Text_Type'Size use Interfaces.C.int'Size;

   pragma Convention (C, Xm_Text_Verify_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Text_Verify_Callback_Struct_Access);

   pragma Convention (C, Xm_Text_Verify_Callback_Struct_Wcs);

   pragma No_Strict_Aliasing (Xm_Text_Verify_Callback_Struct_Wcs_Access);

   pragma Convention (C, Xm_Toggle_Button_Callback_Struct);

   pragma No_Strict_Aliasing (Xm_Toggle_Button_Callback_Struct_Access);

   pragma Convention (C, Xm_Toggle_Mode);
   for Xm_Toggle_Mode'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Traversal_Direction);

   pragma Convention (C, Xm_Unit_Type);
   for Xm_Unit_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Unpost_Behavior);
   for Xm_Unpost_Behavior'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Vertical_Alignment);
   for Xm_Vertical_Alignment'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_View_Type);
   for Xm_View_Type'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Visual_Emphasis);
   for Xm_Visual_Emphasis'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Visual_Policy);
   for Xm_Visual_Policy'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xm_Which_Button);
   for Xm_Which_Button'Size use Interfaces.C.unsigned_char'Size;
   for Xm_Which_Button use (Xm_Button1 => 1,
                            Xm_Button2 => 2,
                            Xm_Button3 => 3,
                            Xm_Button4 => 4,
                            Xm_Button5 => 5);


   Xm_String_Component_Unknown       : constant Xm_String_Component_Type := 0;
   Xm_String_Component_Charset       : constant Xm_String_Component_Type := 1;
   Xm_String_Component_Text          : constant Xm_String_Component_Type := 2;
   Xm_String_Component_Direction     : constant Xm_String_Component_Type := 3;
   Xm_String_Component_Separator     : constant Xm_String_Component_Type := 4;
   Xm_String_Component_Locale_Text   : constant Xm_String_Component_Type := 5;
   Xm_String_Component_Locale        : constant Xm_String_Component_Type := 6;
   Xm_String_Component_Widechar_Text : constant Xm_String_Component_Type := 7;
   Xm_String_Component_Layout_Push   : constant Xm_String_Component_Type := 8;
   Xm_String_Component_Layout_Pop    : constant Xm_String_Component_Type := 9;
   Xm_String_Component_Rendition_Begin :
                                       constant Xm_String_Component_Type := 10;
   Xm_String_Component_Rendition_End : constant Xm_String_Component_Type := 11;
   Xm_String_Component_Tab           : constant Xm_String_Component_Type := 12;

   Xm_Alignment_Child_Top      : constant Xm_Child_Vertical_Alignment
     := Xm_Alignment_Widget_Top;
   Xm_Alignment_Child_Bottom   : constant Xm_Child_Vertical_Alignment
     := Xm_Alignment_Widget_Bottom;
   Xm_Dialog_Application_Modal : constant Xm_Dialog_Style
     := Xm_Dialog_Primary_Application_Modal;
   Xm_Dialog_History_List      : constant Xm_Dialog_Child_Type
      := Xm_Dialog_List;
   Xm_Dialog_Prompt_Label      : constant Xm_Dialog_Child_Type
     := Xm_Dialog_Selection_Label;
   Xm_Dialog_Value_Text        : constant Xm_Dialog_Child_Type
     := Xm_Dialog_Text;
   Xm_Dialog_Command_Text      : constant Xm_Dialog_Child_Type
     := Xm_Dialog_Text;
   Xm_Dialog_File_List         : constant Xm_Dialog_Child_Type
     := Xm_Dialog_List;
   Xm_Dialog_File_List_Label   : constant Xm_Dialog_Child_Type
     := Xm_Dialog_List_Label;

   Xm_Right_To_Left_Mask          : constant Xm_Direction_Mask := 16#01#;
   Xm_Left_To_Right_Mask          : constant Xm_Direction_Mask := 16#02#;
   Xm_Horizontal_Mask             : constant Xm_Direction_Mask := 16#03#;
   Xm_Top_To_Bottom_Mask          : constant Xm_Direction_Mask := 16#04#;
   Xm_Bottom_To_Top_Mask          : constant Xm_Direction_Mask := 16#08#;
   Xm_Vertical_Mask               : constant Xm_Direction_Mask := 16#0C#;
   Xm_Direction_Ignored           : constant Xm_Direction_Mask := 16#30#;
   Xm_Precedence_Horiz_Mask       : constant Xm_Direction_Mask := 16#40#;
   Xm_Precedence_Vert_Mask        : constant Xm_Direction_Mask := 16#80#;
   Xm_Precedence_Mask             : constant Xm_Direction_Mask := 16#C0#;

   Xm_Right_To_Left_Top_To_Bottom : constant Xm_Direction
     := Xm_Right_To_Left_Mask or Xm_Top_To_Bottom_Mask
          or Xm_Precedence_Horiz_Mask;
   Xm_Left_To_Right_Top_To_Bottom : constant Xm_Direction
     := Xm_Left_To_Right_Mask or Xm_Top_To_Bottom_Mask
          or Xm_Precedence_Horiz_Mask;
   Xm_Right_To_Left_Bottom_To_Top : constant Xm_Direction
     := Xm_Right_To_Left_Mask or Xm_Bottom_To_Top_Mask
          or Xm_Precedence_Horiz_Mask;
   Xm_Left_To_Right_Bottom_To_Top : constant Xm_Direction
     :=  Xm_Left_To_Right_Mask or Xm_Bottom_To_Top_Mask
          or Xm_Precedence_Horiz_Mask;
   Xm_Top_To_Bottom_Right_To_Left : constant Xm_Direction
     := Xm_Right_To_Left_Mask or Xm_Top_To_Bottom_Mask
          or Xm_Precedence_Vert_Mask;
   Xm_Top_To_Bottom_Left_To_Right : constant Xm_Direction
     := Xm_Left_To_Right_Mask or Xm_Top_To_Bottom_Mask
          or Xm_Precedence_Vert_Mask;
   Xm_Bottom_To_Top_Right_To_Left : constant Xm_Direction
     := Xm_Right_To_Left_Mask or Xm_Bottom_To_Top_Mask
          or Xm_Precedence_Vert_Mask;
   Xm_Bottom_To_Top_Left_To_Right : constant Xm_Direction
     := Xm_Left_To_Right_Mask or Xm_Bottom_To_Top_Mask
          or Xm_Precedence_Vert_Mask;

   Xm_Top_To_Bottom               : constant Xm_Direction
     := Xm_Top_To_Bottom_Mask or Xm_Horizontal_Mask or Xm_Precedence_Mask;
   Xm_Bottom_To_Top               : constant Xm_Direction
     := Xm_Bottom_To_Top_Mask or Xm_Horizontal_Mask or Xm_Precedence_Mask;
   Xm_Right_To_Left               : constant Xm_Direction
     := Xm_Right_To_Left_Mask or Xm_Vertical_Mask or Xm_Precedence_Mask;
   Xm_Left_To_Right               : constant Xm_Direction
     := Xm_Left_To_Right_Mask or Xm_Vertical_Mask or Xm_Precedence_Mask;
   Xm_Default_Direction           : constant Xm_Direction := 16#FF#;

   Xm_Unspecified_Page_Number : constant Xm_Notebook_Page_Number
     := Interfaces.C."-" (32768);

   Xm_CR_None                    : constant Xm_Callback_Reason := 0;
   Xm_CR_Help                    : constant Xm_Callback_Reason := 1;
   Xm_CR_Value_Changed           : constant Xm_Callback_Reason := 2;
   Xm_CR_Increment               : constant Xm_Callback_Reason := 3;
   Xm_CR_Decrement               : constant Xm_Callback_Reason := 4;
   Xm_CR_Page_Increment          : constant Xm_Callback_Reason := 5;
   Xm_CR_Page_Decrement          : constant Xm_Callback_Reason := 6;
   Xm_CR_To_Top                  : constant Xm_Callback_Reason := 7;
   Xm_CR_To_Bottom               : constant Xm_Callback_Reason := 8;
   Xm_CR_Drag                    : constant Xm_Callback_Reason := 9;
   Xm_CR_Activate                : constant Xm_Callback_Reason := 10;
   Xm_CR_Arm                     : constant Xm_Callback_Reason := 11;
   Xm_CR_Disarm                  : constant Xm_Callback_Reason := 12;
   Xm_CR_Map                     : constant Xm_Callback_Reason := 16;
   Xm_CR_Unmap                   : constant Xm_Callback_Reason := 17;
   Xm_CR_Focus                   : constant Xm_Callback_Reason := 18;
   Xm_CR_Losing_Focus            : constant Xm_Callback_Reason := 19;
   Xm_CR_Modifying_Text_Value    : constant Xm_Callback_Reason := 20;
   Xm_CR_Moving_Insert_Cursor    : constant Xm_Callback_Reason := 21;
--   Xm_CR_Execute              : constant Xm_Callback_Reason := 22;
   Xm_CR_Single_Select           : constant Xm_Callback_Reason := 23;
   Xm_CR_Multiple_Select         : constant Xm_Callback_Reason := 24;
   Xm_CR_Extended_Select         : constant Xm_Callback_Reason := 25;
   Xm_CR_Browse_Select           : constant Xm_Callback_Reason := 26;
   Xm_CR_Default_Action          : constant Xm_Callback_Reason := 27;
--   Xm_CR_Clipboard_Data_Request : constant Xm_Callback_Reason := 28;
--   Xm_CR_Clipboard_Data_Delete  : constant Xm_Callback_Reason := 29;
   Xm_CR_Cascading               : constant Xm_Callback_Reason := 30;
   Xm_CR_Ok                      : constant Xm_Callback_Reason := 31;
   Xm_CR_Cancel                  : constant Xm_Callback_Reason := 32;
   Xm_CR_Apply                   : constant Xm_Callback_Reason := 34;
   Xm_CR_No_Match                : constant Xm_Callback_Reason := 35;
   Xm_CR_Command_Entered         : constant Xm_Callback_Reason := 36;
   Xm_CR_Command_Changed         : constant Xm_Callback_Reason := 37;
   Xm_CR_Expose                  : constant Xm_Callback_Reason := 38;
   Xm_CR_Resize                  : constant Xm_Callback_Reason := 39;
   Xm_CR_Input                   : constant Xm_Callback_Reason := 40;
   Xm_CR_Gain_Primary            : constant Xm_Callback_Reason := 41;
   Xm_CR_Lose_Primary            : constant Xm_Callback_Reason := 42;
--   Xm_CR_Create                  : constant Xm_Callback_Reason := 43;
   Xm_CR_Tear_Off_Activate       : constant Xm_Callback_Reason := 44;
   Xm_CR_Tear_Off_Deactivate     : constant Xm_Callback_Reason := 45;
   Xm_CR_Obscured_Traversal      : constant Xm_Callback_Reason := 46;
--   Xm_CR_Focus_Moved             : constant Xm_Callback_Reason := 47;
   Xm_CR_Repost                  : constant Xm_Callback_Reason := 54;
   Xm_CR_Collapsed               : constant Xm_Callback_Reason := 55;
   Xm_CR_Expanded                : constant Xm_Callback_Reason := 56;
   Xm_CR_Select                  : constant Xm_Callback_Reason := 57;
   Xm_CR_Drag_Start              : constant Xm_Callback_Reason := 58;
   Xm_CR_No_Font                 : constant Xm_Callback_Reason := 59;
   Xm_CR_No_Rendition            : constant Xm_Callback_Reason := 60;
   Xm_CR_Post                    : constant Xm_Callback_Reason := 61;
   Xm_CR_Spin_Next               : constant Xm_Callback_Reason := 62;
   Xm_CR_Spin_Prior              : constant Xm_Callback_Reason := 63;
   Xm_CR_Spin_First              : constant Xm_Callback_Reason := 64;
   Xm_CR_Spin_Last               : constant Xm_Callback_Reason := 65;
   Xm_CR_Page_Scroller_Increment : constant Xm_Callback_Reason := 66;
   Xm_CR_Page_Scroller_Decrement : constant Xm_Callback_Reason := 67;
   Xm_CR_Major_Tab               : constant Xm_Callback_Reason := 68;
   Xm_CR_Minor_Tab               : constant Xm_Callback_Reason := 69;
   Xm_CR_Start_Job               : constant Xm_Callback_Reason := 70;
   Xm_CR_End_Job                 : constant Xm_Callback_Reason := 71;
   Xm_CR_Page_Setup              : constant Xm_Callback_Reason := 72;
   Xm_CR_PDM_None                : constant Xm_Callback_Reason := 73;
   Xm_CR_PDM_Up                  : constant Xm_Callback_Reason := 74;
   Xm_CR_PDM_Start_Error         : constant Xm_Callback_Reason := 75;
   Xm_CR_PDM_Start_VXAuth        : constant Xm_Callback_Reason := 76;
   Xm_CR_PDM_Start_PXAuth        : constant Xm_Callback_Reason := 77;
   Xm_CR_PDM_Ok                  : constant Xm_Callback_Reason := 78;
   Xm_CR_PDM_Cancel              : constant Xm_Callback_Reason := 79;
   Xm_CR_PDM_Exit_Error          : constant Xm_Callback_Reason := 80;

end Xm;
