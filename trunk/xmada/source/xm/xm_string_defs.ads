------------------------------------------------------------------------------
--
--  Mofit Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rostel.ru)
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
--! <Unit> Xm_String_Defs
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Strings;

with Xt;
with Xt_String_Defs;

package Xm_String_Defs is

   --  Resource name constants

   Xm_N_Accelerator                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Accelerator_Text                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Accelerators                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Activate_Callback                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Adjust_Last                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Adjust_Margin                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Alignment                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Allow_Overlap                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Allow_Resize                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Allow_Shell_Resize               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Ancestor_Sensitive               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Animation_Mask                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Animation_Pixmap                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Animation_Pixmap_Depth           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Animation_Style                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Apply_Callback                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Apply_Label_String               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Argc                             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Argv                             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Arm_Callback                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Arm_Color                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Arm_Pixmap                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Arrow_Direction                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Arrow_Layout                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Arrow_Orientation                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Arrow_Sensitivity                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Arrow_Size                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Arrow_Spacing                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Attachment                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Audible_Warning                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Auto_Drag_Model                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Auto_Show_Cursor_Position        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Auto_Unmanage                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Automatic_Selection              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Back_Page_Background             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Back_Page_Foreground             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Back_Page_Number                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Back_Page_Placement              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Back_Page_Size                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Background                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Background_Pixmap                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Base_Height                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Base_Width                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Binding_Pixmap                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Binding_Type                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Binding_Width                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Bitmap_Conversion_Model          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Blend_Model                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Blink_Rate                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Border_Color                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Border_Pixmap                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Border_Width                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Bottom_Attachment                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Bottom_Offset                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Bottom_Position                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Bottom_Shadow_Color              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Bottom_Shadow_Pixmap             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Bottom_Widget                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Browse_Selection_Callback        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Button_Accelerator_Text          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Button_Accelerators              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Button_Count                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Button_Font_List                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Button_Mnemonic_Char_Sets        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Button_Mnemonics                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Button_Render_Table              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Button_Set                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Button_Type                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Buttons                          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cancel_Button                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cancel_Callback                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cancel_Label_String              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cascade_Pixmap                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cascading_Callback               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Child_Horizontal_Alignment       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Child_Horizontal_Spacing         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Child_Placement                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Child_Type                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Child_Vertical_Alignment         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Children                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Client_Data                      : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Client_Leader                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Clip_Window                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Clone_Command                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Collapsed_State_Pixmap           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Color_Allocation_Proc            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Color_Calculation_Proc           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Colormap                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Columns                          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Combo_Box_Type                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Command                          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Command_Changed_Callback         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Command_Entered_Callback         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Command_Window                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Command_Window_Location          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Connection                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Convert_Callback                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Convert_Proc                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Create_Popup_Child_Proc          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Current_Directory                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Current_Page_Number              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cursor_Background                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cursor_Foreground                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cursor_Position                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cursor_Position_Visible          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Dark_Threshold                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Decimal_Points                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Decrement_Callback               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Action_Callback          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Arrow_Sensitivity        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Button                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Button_Emphasis          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Button_Shadow_Thickness  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Button_Type              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Copy_Cursor_Icon         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Font_List                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Invalid_Cursor_Icon      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Link_Cursor_Icon         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Move_Cursor_Icon         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_None_Cursor_Icon         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Pixmap_Resolution        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Position                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Source_Cursor_Icon       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Valid_Cursor_Icon        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Default_Virtual_Bindings         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Delete_Response                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Depth                            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Destination_Callback             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Destroy_Callback                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Detail                           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Detail_Column_Heading            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Detail_Column_Heading_Count      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Detail_Count                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Detail_Order                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Detail_Order_Count               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Detail_Shadow_Thickness          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Detail_Tab_List                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Dialog_Style                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Dialog_Title                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Dialog_Type                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Die_Callback                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Dir_List_Item_Count              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Dir_List_Items                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Dir_List_Label_String            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Dir_Mask                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Dir_Search_Proc                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Dir_Spec                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Dir_Text_Label_String            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Directory                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Directory_Valid                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Disarm_Callback                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Discard_Command                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Double_Click_Interval            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drag_Callback                    : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Drag_Context_Class               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drag_Drop_Finish_Callback        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drag_Initiator_Protocol_Style    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drag_Motion_Callback             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drag_Operations                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drag_Proc                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drag_Receiver_Protocol_Style     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drag_Start_Callback              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drop_Finish_Callback             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drop_Proc                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drop_Rectangles                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drop_Site_Activity               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drop_Site_Enter_Callback         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drop_Site_Leave_Callback         : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Drop_Site_Manager_Class          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drop_Site_Operations             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drop_Site_Type                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drop_Start_Callback              : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Drop_Transfer_Class              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Drop_Transfers                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Edit_Mode                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Editable                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Enable_Btn1_Transfer             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Enable_Button_Tab                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Enable_Drag_Icon                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Enable_Etched_In_Menu            : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Enable_Multi_Key_Bindings        : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Enable_Thin_Thickness            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Enable_Toggle_Color              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Enable_Toggle_Visual             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Enable_Unselectable_Drag         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Enable_Warp                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_End_Job_Callback                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Entry_Alignment                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Entry_Border                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Entry_Callback                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Entry_Class                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Entry_Parent                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Entry_Vertical_Alignment         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Entry_View_Type                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Environment                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Error_Callback                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Expanded_State_Pixmap            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Export_Targets                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Expose_Callback                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Extended_Selection_Callback      : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Extension_Type                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_File_Filter_Style                : constant Xt.Xt_Resource_Name_String;
   Xm_N_File_List_Item_Count             : constant Xt.Xt_Resource_Name_String;
   Xm_N_File_List_Items                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_File_List_Label_String           : constant Xt.Xt_Resource_Name_String;
   Xm_N_File_Search_Proc                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_File_Type_Mask                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Fill_On_Arm                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Fill_On_Select                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Filter_Label_String              : constant Xt.Xt_Resource_Name_String;
   Xm_N_First_Page_Number                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Focus_Callback                   : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Focus_Moved_Callback             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Font                             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Font_List                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Font_Name                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Font_Type                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Foreground                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Foreground_Threshold             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Fraction_Base                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Frame_Background                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Frame_Child_Type                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Frame_Shadow_Thickness           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Gain_Primary_Callback            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Geometry                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Height                           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Height_Inc                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Help_Callback                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Help_Label_String                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Highlight_Color                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Highlight_On_Enter               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Highlight_Pixmap                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Highlight_Thickness              : constant Xt.Xt_Resource_Name_String;
   Xm_N_History_Item_Count               : constant Xt.Xt_Resource_Name_String;
   Xm_N_History_Items                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_History_Max_Items                : constant Xt.Xt_Resource_Name_String;
   Xm_N_History_Visible_Item_Count       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Horizontal_Font_Unit             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Horizontal_Scroll_Bar            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Horizontal_Spacing               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Hot_X                            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Hot_Y                            : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Icc_Handle                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Icon_Mask                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Icon_Name                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Icon_Name_Encoding               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Icon_Pixmap                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Icon_Window                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Icon_X                           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Icon_Y                           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Iconic                           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Import_Targets                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Include_Status                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Increment                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Increment_Callback               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Increment_Value                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Incremental                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Indeterminate_Insensitive_Pixmap : constant Xt.Xt_Resource_Name_String;
   Xm_N_Indeterminate_Pixmap             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Indicator_On                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Indicator_Size                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Indicator_Type                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Initial_Delay                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Initial_Focus                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Initial_State                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Inner_Margin_Height              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Inner_Margin_Width               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Input                            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Input_Callback                   : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Input_Create                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Input_Method                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Input_Policy                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Insensitive_Stipple_Bitmap       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Insert_Position                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Interact_Callback                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Invalid_Cursor_Foreground        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Invoke_Parse_Proc                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Is_Aligned                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Is_Homogeneous                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Item_Count                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Items                            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Join_Session                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Keyboard_Focus_Policy            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Label_Font_List                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Label_Insensitive_Pixmap         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Label_Pixmap                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Label_Render_Table               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Label_String                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Label_Type                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Large_Cell_Height                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Large_Cell_Width                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Large_Icon_Mask                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Large_Icon_Pixmap                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Last_Page_Number                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Layout_Direction                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Layout_Type                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Left_Attachment                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Left_Offset                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Left_Position                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Left_Widget                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Light_Threshold                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Line_Space                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_List                             : constant Xt.Xt_Resource_Name_String;
   Xm_N_List_Item_Count                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_List_Items                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_List_Label_String                : constant Xt.Xt_Resource_Name_String;
   Xm_N_List_Margin_Height               : constant Xt.Xt_Resource_Name_String;
   Xm_N_List_Margin_Width                : constant Xt.Xt_Resource_Name_String;
   Xm_N_List_Size_Policy                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_List_Spacing                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_List_Updated                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_List_Visible_Item_Count          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Load_Model                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Lose_Primary_Callback            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Losing_Focus_Callback            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Main_Window_Margin_Height        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Main_Window_Margin_Width         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Major_Tab_Spacing                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Map_Callback                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Mapped_When_Managed              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Mapping_Delay                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Margin                           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Margin_Bottom                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Margin_Height                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Margin_Left                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Margin_Right                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Margin_Top                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Margin_Width                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Mask                             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Match_Behavior                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Max_Aspect_X                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Max_Aspect_Y                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Max_Height                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Max_Length                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Max_Width                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Max_X                            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Max_Y                            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Maximum                          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Maximum_Value                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Menu_Accelerator                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Menu_Bar                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Menu_Cursor                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Menu_Help_Widget                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Menu_History                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Menu_Post                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Message_Alignment                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Message_String                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Message_Window                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Min_Aspect_X                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Min_Aspect_Y                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Min_Height                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Min_Width                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Min_X                            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Min_Y                            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Minimize_Buttons                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Minimum                          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Minimum_Value                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Minor_Tab_Spacing                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Mnemonic                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Mnemonic_Char_Set                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Modify_Verify_Callback           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Modify_Verify_Callback_Wcs       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Motif_Version                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Motion_Verify_Callback           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Move_Opaque                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Multi_Click                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Multiple_Selection_Callback      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Must_Match                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Mwm_Decorations                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Mwm_Functions                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Mwm_Input_Mode                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Mwm_Menu                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Navigation_Type                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_No_Font_Callback                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_No_Match_Callback                : constant Xt.Xt_Resource_Name_String;
   Xm_N_No_Match_String                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_No_Rendition_Callback            : constant Xt.Xt_Resource_Name_String;
   Xm_N_No_Resize                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_None_Cursor_Foreground           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Notebook_Child_Type              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Num_Children                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Num_Columns                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Num_Drop_Rectangles              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Num_Drop_Transfers               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Num_Export_Targets               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Num_Import_Targets               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Num_Values                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Offset_X                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Offset_Y                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Ok_Callback                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Ok_Label_String                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Operation_Changed_Callback       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Operation_Cursor_Icon            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Option_Label                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Option_Mnemonic                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Orientation                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Outline_Button_Policy            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Outline_Changed_Callback         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Outline_Column_Width             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Outline_Indentation              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Outline_Line_Style               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Outline_State                    : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Output_Create                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Override_Redirect                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Packing                          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Page_Changed_Callback            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Page_Decrement_Callback          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Page_Increment                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Page_Increment_Callback          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Page_Number                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Page_Setup_Callback              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Pane_Maximum                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Pane_Minimum                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Path_Mode                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Pattern                          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Pattern_Type                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Pdm_Notification_Callback        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Pending_Delete                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Pixmap                           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Popdown_Callback                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Popup_Callback                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Popup_Enabled                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Popup_Handler_Callback           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Position                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Position_Index                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Position_Mode                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Position_Type                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Post_From_Button                 : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Post_From_Count                  : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Post_From_List                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Preedit_Type                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Primary_Ownership                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Processing_Direction             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Program_Path                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Prompt_String                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Push_Button_Enabled              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Qualify_Search_Data_Proc         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Radio_Always_One                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Radio_Behavior                   : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Realize_Callback                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Recompute_Size                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Refigure_Mode                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Render_Table                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Rendition_Background             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Rendition_Foreground             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Repeat_Delay                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Resign_Command                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Resizable                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Resize_Callback                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Resize_Height                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Resize_Policy                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Resize_Width                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Restart_Command                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Restart_Style                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Right_Attachment                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Right_Offset                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Right_Position                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Right_Widget                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row_Column_Type                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Rows                             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Rubber_Positioning               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Sash_Height                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Sash_Indent                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Sash_Shadow_Thickness            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Sash_Width                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Save_Callback                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Save_Complete_Callback           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Save_Under                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scale_Height                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scale_Multiple                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scale_Width                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Screen                           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scroll_Bar_Display_Policy        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scroll_Bar_Placement             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scroll_Horizontal                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scroll_Left_Side                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scroll_Top_Side                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scroll_Vertical                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scrolled_Window_Child_Type       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scrolled_Window_Margin_Height    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scrolled_Window_Margin_Width     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scrolling_Policy                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Select_Color                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Select_Insensitive_Pixmap        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Select_Pixmap                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Select_Threshold                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selected_Item                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selected_Item_Count              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selected_Items                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selected_Object_Count            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selected_Objects                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selected_Position                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selected_Position_Count          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selected_Positions               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selection_Array                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selection_Array_Count            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selection_Callback               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selection_Label_String           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selection_Mode                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selection_Policy                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Selection_Technique              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Sensitive                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Separator_On                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Separator_Type                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Session_Id                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Set                              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Shadow_Thickness                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Shadow_Type                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Shell_Unit_Type                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Show_Arrows                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Show_As_Default                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Show_Separator                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Show_Value                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Shutdown_Command                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Simple_Callback                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Single_Selection_Callback        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Skip_Adjust                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Slider_Mark                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Slider_Size                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Slider_Visual                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Sliding_Mode                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Small_Cell_Height                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Small_Cell_Width                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Small_Icon_Mask                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Small_Icon_Pixmap                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Snap_Back_Multiple               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Source                           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Source_Cursor_Icon               : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Source_Is_External               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Source_Pixmap_Icon               : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Source_Widget                    : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Source_Window                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Spacing                          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Spatial_Include_Model            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Spatial_Resize_Model             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Spatial_Snap_Model               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Spatial_Style                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Spin_Box_Child_Type              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Spot_Location                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Start_Job_Callback               : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Start_Time                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_State_Cursor_Icon                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Strikethru_Type                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_String_Direction                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Sub_Menu_Id                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Substitute                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Symbol_Pixmap                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tab_List                         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tag                              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tear_Off_Menu_Activate_Callback  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tear_Off_Menu_Deactivate_Callback :
                                           constant Xt.Xt_Resource_Name_String;
   Xm_N_Tear_Off_Model                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tear_Off_Title                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Text_Accelerators                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Text_Columns                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Text_Field                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Text_Font_List                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Text_Render_Table                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Text_String                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Text_Translations                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Title                            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Title_Encoding                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Title_String                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_To_Bottom_Callback               : constant Xt.Xt_Resource_Name_String;
   Xm_N_To_Top_Callback                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Toggle_Mode                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Top_Attachment                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Top_Character                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Top_Item_Position                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Top_Level_Enter_Callback         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Top_Level_Leave_Callback         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Top_Offset                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Top_Position                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Top_Shadow_Color                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Top_Shadow_Pixmap                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Top_Widget                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Total_Lines                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Transfer_Proc                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Transfer_Status                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Transient                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Transient_For                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Translations                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Traversal_On                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Traverse_Obscured_Callback       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Trough_Color                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Underline_Type                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Unit_Type                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Unmap_Callback                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Unpost_Behavior                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Unselect_Color                   : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Urgency                          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Use_Async_Geometry               : constant Xt.Xt_Resource_Name_String;
   Xm_N_User_Data                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Valid_Cursor_Foreground          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Value                            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Value_Changed_Callback           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Value_Wcs                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Values                           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Verify_Bell                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Verify_Preedit                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Vertical_Font_Unit               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Vertical_Scroll_Bar              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Vertical_Spacing                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_View_Type                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Visible_Item_Count               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Visible_When_Off                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Visual                           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Visual_Emphasis                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Visual_Policy                    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Wait_For_Wm                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Which_Button                     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Width                            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Width_Inc                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Win_Gravity                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Window_Group                     : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Window_Role                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Wm_Timeout                       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Word_Wrap                        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Work_Window                      : constant Xt.Xt_Resource_Name_String;
--   Xm_N_Wrap                             : constant Xt.Xt_Resource_Name_String;
   Xm_N_X                                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Y                                : constant Xt.Xt_Resource_Name_String;

   --  Resource class constants

   Xm_C_Accelerator                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Accelerator_Text                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Accelerators                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Adjust_Last                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Adjust_Margin                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Alignment                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Allow_Overlap                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Allow_Shell_Resize              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Animation_Mask                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Animation_Pixmap                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Animation_Pixmap_Depth          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Animation_Style                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Apply_Label_String              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Argc                            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Argv                            : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Arm_Callback                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Arm_Color                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Arm_Pixmap                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Arrow_Direction                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Arrow_Layout                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Arrow_Orientation               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Arrow_Sensitivity               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Arrow_Size                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Arrow_Spacing                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Attachment                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Audible_Warning                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Auto_Drag_Model                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Auto_Show_Cursor_Position       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Auto_Unmanage                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Automatic_Selection             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Back_Page_Background            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Back_Page_Foreground            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Back_Page_Number                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Back_Page_Placement             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Back_Page_Size                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Background                      : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Background_Pixmap               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Base_Height                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Base_Width                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Binding_Pixmap                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Binding_Type                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Binding_Width                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Bitmap_Conversion_Model         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Blend_Model                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Blink_Rate                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Boolean                         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Border_Color                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Border_Width                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Bottom_Shadow_Color             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Bottom_Shadow_Pixmap            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Button_Accelerator_Text         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Button_Accelerators             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Button_Count                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Button_Font_List                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Button_Mnemonic_Char_Sets       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Button_Mnemonics                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Button_Render_Table             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Button_Set                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Button_Type                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Buttons                         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Callback                        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cancel_Label_String             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Height                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Width                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Child_Horizontal_Alignment      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Child_Horizontal_Spacing        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Child_Placement                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Child_Type                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Child_Vertical_Alignment        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Client_Data                     : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Client_Leader                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Clip_Window                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Clone_Command                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Collapsed_State_Pixmap          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Color_Allocation_Proc           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Color_Calculation_Proc          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Colormap                        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Columns                         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Combo_Box_Type                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Command_Window                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Command_Window_Location         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Connection                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Convert_Proc                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Create_Popup_Child_Proc         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Current_Directory               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Current_Page_Number             : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Cursor                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cursor_Background               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cursor_Foreground               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cursor_Position                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cursor_Position_Visible         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Dark_Threshold                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Decimal_Points                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Arrow_Sensitivity       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Button_Emphasis         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Button_Shadow_Thickness : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Button_Type             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Copy_Cursor_Icon        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Font_List               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Invalid_Cursor_Icon     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Link_Cursor_Icon        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Move_Cursor_Icon        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_None_Cursor_Icon        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Pixmap_Resolution       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Position                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Source_Cursor_Icon      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Valid_Cursor_Icon       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Default_Virtual_Bindings        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Delete_Response                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Depth                           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Detail                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Detail_Column_Heading           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Detail_Column_Heading_Count     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Detail_Count                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Detail_Order                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Detail_Order_Count              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Detail_Tab_List                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Dialog_Style                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Dialog_Title                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Dialog_Type                     : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Dimension                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Dir_List_Item_Count             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Dir_List_Items                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Dir_List_Label_String           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Dir_Mask                        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Dir_Search_Proc                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Dir_Spec                        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Dir_Text_Label_String           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Directory                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Directory_Valid                 : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Disarm_Callback                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Discard_Command                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Double_Click_Interval           : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Drag_Context_Class              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Drag_Initiator_Protocol_Style   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Drag_Operations                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Drag_Proc                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Drag_Receiver_Protocol_Style    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Drop_Proc                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Drop_Rectangles                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Drop_Site_Activity              : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Drop_Site_Manager_Class         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Drop_Site_Operations            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Drop_Site_Type                  : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Drop_Transfer_Class             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Drop_Transfers                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Edit_Mode                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Editable                        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Enable_Btn1_Transfer            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Enable_Button_Tab               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Enable_Drag_Icon                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Enable_Etched_In_Menu           : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Enable_Multi_Key_Bindings       : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Enable_Thin_Thickness           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Enable_Toggle_Color             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Enable_Toggle_Visual            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Enable_Unselectable_Drag        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Enable_Warp                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Entry_Border                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Entry_Class                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Entry_View_Type                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Environment                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Expanded_State_Pixmap           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Export_Targets                  : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Extension_Type                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_File_Filter_Style               : constant Xt.Xt_Resource_Class_String;
   Xm_C_File_List_Label_String          : constant Xt.Xt_Resource_Class_String;
   Xm_C_File_Search_Proc                : constant Xt.Xt_Resource_Class_String;
   Xm_C_File_Type_Mask                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Fill_On_Arm                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Fill_On_Select                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Filter_Label_String             : constant Xt.Xt_Resource_Class_String;
   Xm_C_First_Page_Number               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Font                            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Font_List                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Font_Name                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Font_Type                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Foreground                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Foreground_Threshold            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Frame_Background                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Frame_Child_Type                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Geometry                        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Height                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Height_Inc                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Help_Label_String               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Highlight_Color                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Highlight_On_Enter              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Highlight_Pixmap                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Highlight_Thickness             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Horizontal_Font_Unit            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Horizontal_Scroll_Bar           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Hot                             : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Icc_Handle                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Icon_Mask                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Icon_Name                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Icon_Name_Encoding              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Icon_Pixmap                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Icon_Window                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Icon_X                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Icon_Y                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Iconic                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Import_Targets                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Increment                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Increment_Value                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Incremental                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Indeterminate_Insensitive_Pixmap :
                                          constant Xt.Xt_Resource_Class_String;
   Xm_C_Indeterminate_Pixmap            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Indicator_On                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Indicator_Size                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Indicator_Type                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Initial_Delay                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Initial_Focus                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Initial_State                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Inner_Margin_Height             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Inner_Margin_Width              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Input                           : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Input_Create                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Input_Method                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Input_Policy                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Insensitive_Stipple_Bitmap      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Insert_Position                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Invalid_Cursor_Foreground       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Is_Aligned                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Is_Homogeneous                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Item_Count                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Items                           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Join_Session                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Keyboard_Focus_Policy           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Label_Font_List                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Label_Insensitive_Pixmap        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Label_Pixmap                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Label_Render_Table              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Label_Type                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Last_Page_Number                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Layout_Direction                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Layout_Type                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Light_Threshold                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Line_Style                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_List                            : constant Xt.Xt_Resource_Class_String;
   Xm_C_List_Label_String               : constant Xt.Xt_Resource_Class_String;
   Xm_C_List_Margin_Height              : constant Xt.Xt_Resource_Class_String;
   Xm_C_List_Margin_Width               : constant Xt.Xt_Resource_Class_String;
   Xm_C_List_Size_Policy                : constant Xt.Xt_Resource_Class_String;
   Xm_C_List_Spacing                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_List_Updated                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Load_Model                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Main_Window_Margin_Height       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Main_Window_Margin_Width        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Major_Tab_Spacing               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Mapped_When_Managed             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Mapping_Delay                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Margin                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Margin_Bottom                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Margin_Height                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Margin_Left                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Margin_Right                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Margin_Top                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Margin_Width                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Match_Behavior                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Max_Aspect_X                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Max_Aspect_Y                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Max_Height                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Max_Items                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Max_Length                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Max_Value                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Max_Width                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Max_X                           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Max_Y                           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Maximum                         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Maximum_Value                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Menu_Bar                        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Menu_Post                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Menu_Widget                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Message_Window                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Min_Aspect_X                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Min_Aspect_Y                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Min_Height                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Min_Width                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Min_X                           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Min_Y                           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Minimize_Buttons                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Minimum                         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Minimum_Value                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Minor_Tab_Spacing               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Mnemonic                        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Mnemonic_Char_Set               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Motif_Version                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Move_Opaque                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Multi_Click                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Must_Match                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Mwm_Decorations                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Mwm_Functions                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Mwm_Input_Mode                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Mwm_Menu                        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Navigation_Type                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_No_Match_String                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_No_Resize                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_None_Cursor_Foreground          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Notebook_Child_Type             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Num_Columns                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Num_Drop_Rectangles             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Num_Drop_Transfers              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Num_Export_Targets              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Num_Import_Targets              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Num_Values                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Offset                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Ok_Label_String                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Operation_Cursor_Icon           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Option_Label                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Option_Mnemonic                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Orientation                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Outline_Button_Policy           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Outline_Column_Width            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Outline_Indentation             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Outline_State                   : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Output_Create                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Override_Redirect               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Packing                         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Page_Increment                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Page_Number                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Pane_Maximum                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Pane_Minimum                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Path_Mode                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Pattern                         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Pending_Delete                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Pixmap                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Popup_Enabled                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Position                        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Position_Index                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Position_Mode                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Position_Type                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Post_From_Button                : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Post_From_Count                 : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Post_From_List                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Preedit_Type                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Primary_Ownership               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Processing_Direction            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Program_Path                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Prompt_String                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Push_Button_Enabled             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Qualify_Search_Data_Proc        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Radio_Always_One                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Radio_Behavior                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Read_Only                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Recompute_Size                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Render_Table                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Rendition_Background            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Rendition_Foreground            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Repeat_Delay                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Resign_Command                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Resizable                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Resize_Height                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Resize_Policy                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Resize_Width                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Restart_Command                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Restart_Style                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Row_Column_Type                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Rows                            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Rubber_Positioning              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Sash_Height                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Sash_Indent                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Sash_Width                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Save_Under                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scale_Height                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scale_Multiple                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scale_Width                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Screen                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scroll                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scroll_Bar_Display_Policy       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scroll_Bar_Placement            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scroll_Side                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scrolled_Window_Child_Type      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scrolled_Window_Margin_Height   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scrolled_Window_Margin_Width    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scrolling_Policy                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Select_Color                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Select_Insensitive_Pixmap       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Select_Pixmap                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Select_Threshold                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selected_Item                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selected_Item_Count             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selected_Items                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selected_Object_Count           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selected_Objects                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selected_Position               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selected_Position_Count         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selected_Positions              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selection_Array                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selection_Array_Count           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selection_Label_String          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selection_Mode                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selection_Policy                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Selection_Technique             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Sensitive                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Separator_On                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Separator_Type                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Session_Id                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Set                             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Shadow_Thickness                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Shadow_Type                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Shell_Unit_Type                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Show_Arrows                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Show_As_Default                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Show_Separator                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Show_Value                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Shutdown_Command                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Slider_Mark                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Slider_Size                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Slider_Visual                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Sliding_Mode                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Snap_Back_Multiple              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Source                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Source_Cursor_Icon              : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Source_Is_External              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Source_Pixmap_Icon              : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Source_Widget                   : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Source_Window                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Spacing                         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Spatial_Include_Model           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Spatial_Resize_Model            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Spatial_Snap_Model              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Spatial_Style                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Spin_Box_Child_Type             : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Start_Time                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_State_Cursor_Icon               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Strikethru_Type                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_String_Direction                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tab_List                        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tag                             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tear_Off_Model                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tear_Off_Title                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Text_Field                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Text_Font_List                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Text_Render_Table               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Text_String                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Title                           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Title_Encoding                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Title_String                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Toggle_Mode                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Top_Character                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Top_Item_Position               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Top_Shadow_Color                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Top_Shadow_Pixmap               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Total_Lines                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Transfer_Proc                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Transfer_Status                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Transient                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Transient_For                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Translations                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Traversal_On                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Trough_Color                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Underline_Type                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Unit_Type                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Unpost_Behavior                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Unselect_Color                  : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Urgency                         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Use_Async_Geometry              : constant Xt.Xt_Resource_Class_String;
   Xm_C_User_Data                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Valid_Cursor_Foreground         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Value                           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Value_Changed_Callback          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Value_Wcs                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Values                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Verify_Bell                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Verify_Preedit                  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Vertical_Alignment              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Vertical_Font_Unit              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Vertical_Scroll_Bar             : constant Xt.Xt_Resource_Class_String;
   Xm_C_View_Type                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Visible_Item_Count              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Visible_When_Off                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Visual                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Visual_Emphasis                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Visual_Policy                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Wait_For_Wm                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Which_Button                    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Widget                          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Width                           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Width_Inc                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Win_Gravity                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Window_Group                    : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Window_Role                     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Wm_Timeout                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Word_Wrap                       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Work_Window                     : constant Xt.Xt_Resource_Class_String;
--   Xm_C_Wrap                            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Xm_String                       : constant Xt.Xt_Resource_Class_String;

   --  Resource type constants

--   Xm_R_Accelerator_Table             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Alignment                     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Arrow_Direction               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Arrow_Layout                  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Arrow_Orientation             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Arrow_Sensitivity             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Atom                          : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Atom_List                     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Attachment                    : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Audible_Warning               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Auto_Drag_Model               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Automatic_Selection           : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Binding_Type                  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Bitmap                        : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Bitmap_Conversion_Model       : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Blend_Model                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Bool                          : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Boolean                       : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Boolean_Dimension             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Bottom_Shadow_Pixmap          : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Button_Font_List              : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Button_Render_Table           : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Callback                      : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Callback_Proc                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Cardinal                      : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Cardinal_List                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Child_Horizontal_Alignment    : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Child_Placement               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Child_Type                    : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Child_Vertical_Alignment      : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Colormap                      : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Combo_Box_Type                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Command_Arg_Array             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Command_Window_Location       : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Cursor                        : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Default_Button_Emphasis       : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Default_Button_Type           : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Delete_Response               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Dialog_Style                  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Dialog_Type                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Dimension                     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Direction                     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Directory_String              : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Drag_Initiator_Protocol_Style : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Drag_Receiver_Protocol_Style  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Drop_Transfers                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Dynamic_Pixmap                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Edit_Mode                     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Enable_Btn1_Transfer          : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Enable_Warp                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Entry_View_Type               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Enum                          : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Environment_Array             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Extension_Type                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_File_Filter_Style             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_File_Type_Mask                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Font_List                     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Font_Struct                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Function                      : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Gravity                       : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Highlight_Pixmap              : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Horizontal_Dimension          : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Horizontal_Int                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Horizontal_Position           : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Icon_Attachment               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Indicator_On                  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Indicator_Type                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Initial_State                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Input_Policy                  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Int                           : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Key_Sym                       : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Keyboard_Focus_Policy         : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Label_Font_List               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Label_Render_Table            : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Label_Type                    : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Large_Icon_Pixmap             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Layout_Type                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Line_Style                    : constant Xt.Xt_Resource_Type_String;
--   Xm_R_List_Size_Policy              : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Match_Behavior                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Menu_Widget                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Multi_Click                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Navigation_Type               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_No_Scaling_Bitmap             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_No_Scaling_Dynamic_Pixmap     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Notebook_Child_Type           : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Orientation                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Outline_Button_Policy         : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Outline_State                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Packing                       : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Path_Mode                     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Pixel                         : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Pixmap                        : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Pointer                       : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Position                      : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Position_Mode                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Position_Type                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Position_Value                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Primary_Ownership             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Proc                          : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Processing_Direction          : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Render_Table                  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Resize_Policy                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Restart_Style                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Row_Column_Type               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Screen                        : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Scroll_Bar_Display_Policy     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Scroll_Bar_Placement          : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Scrolled_Window_Child_Type    : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Scrolling_Policy              : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Select_Color                  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Selection_Mode                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Selection_Policy              : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Selection_Technique           : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Selection_Type                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Separator_Type                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Set                           : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Shadow_Type                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Short                         : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Show_Arrows                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Show_Value                    : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Slider_Mark                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Slider_Visual                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Sliding_Mode                  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Small_Icon_Pixmap             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Smc_Conn                      : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Spatial_Include_Model         : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Spatial_Resize_Model          : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Spatial_Snap_Model            : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Spatial_Style                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Spin_Box_Child_Type           : constant Xt.Xt_Resource_Type_String;
   Xm_R_String                        : constant Xt.Xt_Resource_Type_String;
--   Xm_R_String_Array                  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_String_Direction              : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Tab_List                      : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Tear_Off_Model                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Text_Font_List                : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Text_Position                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Text_Render_Table             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Toggle_Mode                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Top_Item_Position             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Top_Shadow_Pixmap             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Transfer_Status               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Translation_Table             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Unit_Type                     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Unpost_Behavior               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Unsigned_Char                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Value_Wcs                     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Vertical_Alignment            : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Vertical_Dimension            : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Vertical_Int                  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Vertical_Position             : constant Xt.Xt_Resource_Type_String;
--   Xm_R_View_Type                     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Visual                        : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Visual_Emphasis               : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Visual_Policy                 : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Which_Button                  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Widget                        : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Widget_Class                  : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Widget_List                   : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Window                        : constant Xt.Xt_Resource_Type_String;
   Xm_R_Xm_String                     : constant Xt.Xt_Resource_Type_String;
--   Xm_R_Xm_String_Table               : constant Xt.Xt_Resource_Type_String;


private

   Xm_N_Accelerator                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("accelerator");
   Xm_N_Accelerator_Text                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("acceleratorText");
   Xm_N_Accelerators                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Accelerators;
   Xm_N_Activate_Callback                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("activateCallback");
   Xm_N_Adjust_Last                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("adjustLast");
   Xm_N_Adjust_Margin                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("adjustMargin");
   Xm_N_Alignment                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("alignment");
   Xm_N_Allow_Overlap                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("allowOverlap");
   Xm_N_Allow_Resize                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("allowResize");
   Xm_N_Allow_Shell_Resize                : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Allow_Shell_Resize;
   Xm_N_Ancestor_Sensitive                : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Ancestor_Sensitive;
   Xm_N_Animation_Mask                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("animation");
   Xm_N_Animation_Pixmap                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("animationPixmap");
   Xm_N_Animation_Pixmap_Depth            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("animationPixmapDepth");
   Xm_N_Animation_Style                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("animationStyle");
   Xm_N_Apply_Callback                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("applyCallback");
   Xm_N_Apply_Label_String                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("applyLabelString");
   Xm_N_Argc                              : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Argc;
   Xm_N_Argv                              : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Argv;
   Xm_N_Arm_Callback                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("armCallback");
   Xm_N_Arm_Color                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("armColor");
   Xm_N_Arm_Pixmap                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("armPixmap");
   Xm_N_Arrow_Direction                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("arrowDirection");
   Xm_N_Arrow_Layout                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("arrowLayout");
   Xm_N_Arrow_Orientation                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("arrowOrientation");
   Xm_N_Arrow_Sensitivity                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("arrowSensitivity");
   Xm_N_Arrow_Size                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("arrowSize");
   Xm_N_Arrow_Spacing                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("arrowSpacing");
   Xm_N_Attachment                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("attachment");
   Xm_N_Audible_Warning                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("audibleWarning");
   Xm_N_Auto_Drag_Model                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("autoDragModel");
   Xm_N_Auto_Show_Cursor_Position         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("autoShowCursorPosition");
   Xm_N_Auto_Unmanage                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("autoUnmanage");
   Xm_N_Automatic_Selection               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("automaticSelection");
   Xm_N_Back_Page_Background              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("backPageBackground");
   Xm_N_Back_Page_Foreground              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("backPageForeground");
   Xm_N_Back_Page_Number                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("backPageNumber");
   Xm_N_Back_Page_Placement               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("backPagePlacement");
   Xm_N_Back_Page_Size                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("backPageSize");
   Xm_N_Background                        : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Background;
   Xm_N_Background_Pixmap                 : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Background_Pixmap;
   Xm_N_Base_Height                       : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Base_Height;
   Xm_N_Base_Width                        : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Base_Width;
   Xm_N_Binding_Pixmap                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("bindingPixmap");
   Xm_N_Binding_Type                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("bindingType");
   Xm_N_Binding_Width                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("bindingWidth");
   Xm_N_Bitmap_Conversion_Model           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("bitmapConversionModel");
   Xm_N_Blend_Model                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("blendModel");
   Xm_N_Blink_Rate                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("blinkRate");
   Xm_N_Border_Color                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Border_Color;
   Xm_N_Border_Pixmap                     : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Border_Pixmap;
   Xm_N_Border_Width                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Border_Width;
   Xm_N_Bottom_Attachment                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("bottomAttachment");
   Xm_N_Bottom_Offset                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("bottomOffset");
   Xm_N_Bottom_Position                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("bottomPosition");
   Xm_N_Bottom_Shadow_Color               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("bottomShadowColor");
   Xm_N_Bottom_Shadow_Pixmap              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("bottomShadowPixmap");
   Xm_N_Bottom_Widget                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("bottomWidget");
   Xm_N_Browse_Selection_Callback         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("browseSelectionCallback");
   Xm_N_Button_Accelerator_Text           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("buttonAcceleratorText");
   Xm_N_Button_Accelerators               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("buttonAccelerators");
   Xm_N_Button_Count                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("buttonCount");
   Xm_N_Button_Font_List                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("buttonFontList");
   Xm_N_Button_Mnemonic_Char_Sets         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("buttonMnemonicCharSets");
   Xm_N_Button_Mnemonics                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("buttonMnemonics");
   Xm_N_Button_Render_Table               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("buttonRenderTable");
   Xm_N_Button_Set                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("buttonSet");
   Xm_N_Button_Type                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("buttonType");
   Xm_N_Buttons                           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("buttons");
   Xm_N_Cancel_Button                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cancelButton");
   Xm_N_Cancel_Callback                   : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Cancel_Callback;
   Xm_N_Cancel_Label_String               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cancelLabelString");
   Xm_N_Cascade_Pixmap                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cascadePixmap");
   Xm_N_Cascading_Callback                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cascadingCallback");
   Xm_N_Child_Horizontal_Alignment        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("childHorizontalAlignment");
   Xm_N_Child_Horizontal_Spacing          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("childHorizontalSpacing");
   Xm_N_Child_Placement                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("childPlacement");
   Xm_N_Child_Type                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("childType");
   Xm_N_Child_Vertical_Alignment          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("childVerticalAlignment");
   Xm_N_Children                          : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Children;
   Xm_N_Client_Data                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("clientData");
--   Xm_N_Client_Leader                     : constant Xt.Xt_Resource_Name_String
--     := Xt_String_Defs.Xt_N_Client_Leader;
   Xm_N_Clip_Window                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("clipWindow");
   Xm_N_Clone_Command                     : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Clone_Command;
   Xm_N_Collapsed_State_Pixmap            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("collapsedStatePixmap");
   Xm_N_Color_Allocation_Proc             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("colorAllocationProc");
   Xm_N_Color_Calculation_Proc            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("colorCalculationProc");
   Xm_N_Colormap                          : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Colormap;
   Xm_N_Columns                           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("columns");
   Xm_N_Combo_Box_Type                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("comboBoxType");
   Xm_N_Command                           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("command");
   Xm_N_Command_Changed_Callback          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("commandChangedCallback");
   Xm_N_Command_Entered_Callback          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("commandEnteredCallback");
   Xm_N_Command_Window                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("commandWindow");
   Xm_N_Command_Window_Location           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("commandWindowLocation");
   Xm_N_Connection                        : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Connection;
   Xm_N_Convert_Callback                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("convertCallback");
   Xm_N_Convert_Proc                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("convertProc");
   Xm_N_Create_Popup_Child_Proc           : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Create_Popup_Child_Proc;
   Xm_N_Current_Directory                 : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Current_Directory;
   Xm_N_Current_Page_Number               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("currentPageNumber");
   Xm_N_Cursor_Background                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cursorBackground");
   Xm_N_Cursor_Foreground                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cursorForeground");
   Xm_N_Cursor_Position                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cursorPosition");
   Xm_N_Cursor_Position_Visible           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cursorPositionVisible");
   Xm_N_Dark_Threshold                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("darkThreshold");
   Xm_N_Decimal_Points                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("decimalPoints");
   Xm_N_Decrement_Callback                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("decrementCallback");
   Xm_N_Default_Action_Callback           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultActionCallback");
   Xm_N_Default_Arrow_Sensitivity         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultArrowSensitivity");
   Xm_N_Default_Button                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultButton");
   Xm_N_Default_Button_Emphasis           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultButtonEmphasis");
   Xm_N_Default_Button_Shadow_Thickness   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultButtonShadowThickness");
   Xm_N_Default_Button_Type               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultButtonType");
   Xm_N_Default_Copy_Cursor_Icon          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultCopyCursorIcon");
   Xm_N_Default_Font_List                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultFontList");
   Xm_N_Default_Invalid_Cursor_Icon       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultInvalidCursorIcon");
   Xm_N_Default_Link_Cursor_Icon          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultLinkCursorIcon");
   Xm_N_Default_Move_Cursor_Icon          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultMoveCursorIcon");
   Xm_N_Default_None_Cursor_Icon          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultNoneCursorIcon");
   Xm_N_Default_Pixmap_Resolution         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultPixmapResolution");
   Xm_N_Default_Position                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultPosition");
   Xm_N_Default_Source_Cursor_Icon        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultSourceCursorIcon");
   Xm_N_Default_Valid_Cursor_Icon         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultValidCursorIcon");
   Xm_N_Default_Virtual_Bindings          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("defaultVirtualBindings");
   Xm_N_Delete_Response                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("deleteResponse");
   Xm_N_Depth                             : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Depth;
   Xm_N_Destination_Callback              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("destinationCallback");
   Xm_N_Destroy_Callback                  : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Destroy_Callback;
   Xm_N_Detail                            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("detail");
   Xm_N_Detail_Column_Heading             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("detailColumnHeading");
   Xm_N_Detail_Column_Heading_Count       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("detailColumnHeadingCount");
   Xm_N_Detail_Count                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("detailCount");
   Xm_N_Detail_Order                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("detailOrder");
   Xm_N_Detail_Order_Count                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("detailOrderCount");
   Xm_N_Detail_Shadow_Thickness           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("detailShadowThickness");
   Xm_N_Detail_Tab_List                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("detailTabList");
   Xm_N_Dialog_Style                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dialogStyle");
   Xm_N_Dialog_Title                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dialogTitle");
   Xm_N_Dialog_Type                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dialogType");
   Xm_N_Die_Callback                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Die_Callback;
   Xm_N_Dir_List_Item_Count               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dirListItemCount");
   Xm_N_Dir_List_Items                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dirListItems");
   Xm_N_Dir_List_Label_String             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dirListLabelString");
   Xm_N_Dir_Mask                          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dirMask");
   Xm_N_Dir_Search_Proc                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dirSearchProc");
   Xm_N_Dir_Spec                          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dirSpec");
   Xm_N_Dir_Text_Label_String             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dirTextLabelString");
   Xm_N_Directory                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("directory");
   Xm_N_Directory_Valid                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("directoryValid");
   Xm_N_Disarm_Callback                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("disarmCallback");
   Xm_N_Discard_Command                   : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Discard_Command;
   Xm_N_Double_Click_Interval             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("doubleClickInterval");
   Xm_N_Drag_Callback                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dragCallback");
--   Xm_N_Drag_Context_Class                : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("dragContextClass");
   Xm_N_Drag_Drop_Finish_Callback         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dragDropFinishCallback");
   Xm_N_Drag_Initiator_Protocol_Style     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dragInitiatorProtocolStyle");
   Xm_N_Drag_Motion_Callback              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dragMotionCallback");
   Xm_N_Drag_Operations                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dragOperations");
   Xm_N_Drag_Proc                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dragProc");
   Xm_N_Drag_Receiver_Protocol_Style      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dragReceiverProtocolStyle");
   Xm_N_Drag_Start_Callback               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dragStartCallback");
   Xm_N_Drop_Finish_Callback              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dropFinishCallback");
   Xm_N_Drop_Proc                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dropProc");
   Xm_N_Drop_Rectangles                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dropRectangles");
   Xm_N_Drop_Site_Activity                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dropSiteActivity");
   Xm_N_Drop_Site_Enter_Callback          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dropSiteEnterCallback");
   Xm_N_Drop_Site_Leave_Callback          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dropSiteLeaveCallback");
--   Xm_N_Drop_Site_Manager_Class           : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("dropSiteManagerClass");
   Xm_N_Drop_Site_Operations              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dropSiteOperations");
   Xm_N_Drop_Site_Type                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dropSiteType");
   Xm_N_Drop_Start_Callback               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dropStartCallback");
--   Xm_N_Drop_Transfer_Class               : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("dropTransferClass");
   Xm_N_Drop_Transfers                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dropTransfers");
   Xm_N_Edit_Mode                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("editMode");
   Xm_N_Editable                          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("editable");
   Xm_N_Enable_Btn1_Transfer              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("enableBtn1Transfer");
   Xm_N_Enable_Button_Tab                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("enableButtonTab");
   Xm_N_Enable_Drag_Icon                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("enableDragIcon");
   Xm_N_Enable_Etched_In_Menu             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("enableEtchedInMenu");
--   Xm_N_Enable_Multi_Key_Bindings         : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("enableMultiKeyBindings");
--   Xm_N_Enable_Thin_Thickness             : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("enableThinThickness");
   Xm_N_Enable_Toggle_Color               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("enableToggleColor");
   Xm_N_Enable_Toggle_Visual              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("enableToggleVisual");
   Xm_N_Enable_Unselectable_Drag          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("enableUnselectableDrag");
   Xm_N_Enable_Warp                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("enableWarp");
   Xm_N_End_Job_Callback                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("endJobCallback");
   Xm_N_Entry_Alignment                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("entryAlignment");
   Xm_N_Entry_Border                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("entryBorder");
   Xm_N_Entry_Callback                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("entryCallback");
   Xm_N_Entry_Class                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("entryClass");
   Xm_N_Entry_Parent                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("entryParent");
   Xm_N_Entry_Vertical_Alignment          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("entryVerticalAlignment");
   Xm_N_Entry_View_Type                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("entryViewType");
   Xm_N_Environment                       : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Environment;
   Xm_N_Error_Callback                    : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Error_Callback;
   Xm_N_Expanded_State_Pixmap             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("expandedStatePixmap");
   Xm_N_Export_Targets                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("exportTargets");
   Xm_N_Expose_Callback                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("exposeCallback");
   Xm_N_Extended_Selection_Callback       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("extendedSelectionCallback");
--   Xm_N_Extension_Type                    : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("extensionType");
   Xm_N_File_Filter_Style                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("fileFilterStyle");
   Xm_N_File_List_Item_Count              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("fileListItemCount");
   Xm_N_File_List_Items                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("fileListItems");
   Xm_N_File_List_Label_String            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("fileListLabelString");
   Xm_N_File_Search_Proc                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("fileSearchProc");
   Xm_N_File_Type_Mask                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("fileTypeMask");
   Xm_N_Fill_On_Arm                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("fillOnArm");
   Xm_N_Fill_On_Select                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("fillOnSelect");
   Xm_N_Filter_Label_String               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("filterLabelString");
   Xm_N_First_Page_Number                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("firstPageNumber");
   Xm_N_Focus_Callback                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("focusCallback");
--   Xm_N_Focus_Moved_Callback              : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("focusMovedCallback");
   Xm_N_Font                              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("font");
   Xm_N_Font_List                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("fontList");
   Xm_N_Font_Name                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("fontName");
   Xm_N_Font_Type                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("fontType");
   Xm_N_Foreground                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("foreground");
   Xm_N_Foreground_Threshold              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("foregroundThreshold");
   Xm_N_Fraction_Base                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("fractionBase");
   Xm_N_Frame_Background                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("frameBackground");
   Xm_N_Frame_Child_Type                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("frameChildType");
   Xm_N_Frame_Shadow_Thickness            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("frameShadowThickness");
   Xm_N_Gain_Primary_Callback             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("gainPrimaryCallback");
   Xm_N_Geometry                          : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Geometry;
   Xm_N_Height                            : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Height;
   Xm_N_Height_Inc                        : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Height_Inc;
   Xm_N_Help_Callback                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("helpCallback");
   Xm_N_Help_Label_String                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("helpLabelString");
   Xm_N_Highlight_Color                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("highlightColor");
   Xm_N_Highlight_On_Enter                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("highlightOnEnter");
   Xm_N_Highlight_Pixmap                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("highlightPixmap");
   Xm_N_Highlight_Thickness               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("highlightThickness");
   Xm_N_History_Item_Count                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("historyItemCount");
   Xm_N_History_Items                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("historyItems");
   Xm_N_History_Max_Items                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("historyMaxItems");
   Xm_N_History_Visible_Item_Count        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("historyVisibleItemCount");
   Xm_N_Horizontal_Font_Unit              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("horizontalFontUnit");
   Xm_N_Horizontal_Scroll_Bar             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("horizontalScrollBar");
   Xm_N_Horizontal_Spacing                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("horizontalSpacing");
   Xm_N_Hot_X                             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("hotX");
   Xm_N_Hot_Y                             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("hotY");
--   Xm_N_Icc_Handle                        : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("iccHandle");
   Xm_N_Icon_Mask                         : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Icon_Mask;
   Xm_N_Icon_Name                         : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Icon_Name;
   Xm_N_Icon_Name_Encoding                : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Icon_Name_Encoding;
   Xm_N_Icon_Pixmap                       : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Icon_Pixmap;
   Xm_N_Icon_Window                       : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Icon_Window;
   Xm_N_Icon_X                            : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Icon_X;
   Xm_N_Icon_Y                            : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Icon_Y;
   Xm_N_Iconic                            : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Iconic;
   Xm_N_Import_Targets                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("importTargets");
   Xm_N_Include_Status                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("includeStatus");
   Xm_N_Increment                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("increment");
   Xm_N_Increment_Callback                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("incrementCallback");
   Xm_N_Increment_Value                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("incrementValue");
   Xm_N_Incremental                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("incremental");
   Xm_N_Indeterminate_Insensitive_Pixmap  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("indeterminateInsensitivePixmap");
   Xm_N_Indeterminate_Pixmap              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("indeterminatePixmap");
   Xm_N_Indicator_On                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("indicatorOn");
   Xm_N_Indicator_Size                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("indicatorSize");
   Xm_N_Indicator_Type                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("indicatorType");
   Xm_N_Initial_Delay                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("initialDelay");
   Xm_N_Initial_Focus                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("initialFocus");
   Xm_N_Initial_State                     : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Initial_State;
   Xm_N_Inner_Margin_Height               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("innerMarginHeight");
   Xm_N_Inner_Margin_Width                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("innerMarginWidth");
   Xm_N_Input                             : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Input;
   Xm_N_Input_Callback                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("inputCallback");
--   Xm_N_Input_Create                      : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("inputCreate");
   Xm_N_Input_Method                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("inputMethod");
   Xm_N_Input_Policy                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("inputPolicy");
   Xm_N_Insensitive_Stipple_Bitmap        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("insensitiveStippleBitmap");
   Xm_N_Insert_Position                   : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Insert_Position;
   Xm_N_Interact_Callback                 : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Interact_Callback;
   Xm_N_Invalid_Cursor_Foreground         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("invalidCursorForeground");
   Xm_N_Invoke_Parse_Proc                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("invokeParseProc");
   Xm_N_Is_Aligned                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("isAligned");
   Xm_N_Is_Homogeneous                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("isHomogeneous");
   Xm_N_Item_Count                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("itemCount");
   Xm_N_Items                             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("items");
   Xm_N_Join_Session                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Join_Session;
   Xm_N_Keyboard_Focus_Policy             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("keyboardFocusPolicy");
   Xm_N_Label_Font_List                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("labelFontList");
   Xm_N_Label_Insensitive_Pixmap          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("labelInsensitivePixmap");
   Xm_N_Label_Pixmap                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("labelPixmap");
   Xm_N_Label_Render_Table                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("labelRenderTable");
   Xm_N_Label_String                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("labelString");
   Xm_N_Label_Type                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("labelType");
   Xm_N_Large_Cell_Height                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("largeCellHeight");
   Xm_N_Large_Cell_Width                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("largeCellWidth");
   Xm_N_Large_Icon_Mask                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("largeIconMask");
   Xm_N_Large_Icon_Pixmap                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("largeIconPixmap");
   Xm_N_Last_Page_Number                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("lastPageNumber");
   Xm_N_Layout_Direction                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("layoutDirection");
   Xm_N_Layout_Type                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("layoutType");
   Xm_N_Left_Attachment                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("leftAttachment");
   Xm_N_Left_Offset                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("leftOffset");
   Xm_N_Left_Position                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("leftPosition");
   Xm_N_Left_Widget                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("leftWidget");
   Xm_N_Light_Threshold                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("lightThreshold");
   Xm_N_Line_Space                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("lineSpace");
   Xm_N_List                              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("list");
   Xm_N_List_Item_Count                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("listItemCount");
   Xm_N_List_Items                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("listItems");
   Xm_N_List_Label_String                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("listLabelString");
   Xm_N_List_Margin_Height                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("listMarginHeight");
   Xm_N_List_Margin_Width                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("listMarginWidth");
   Xm_N_List_Size_Policy                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("listSizePolicy");
   Xm_N_List_Spacing                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("listSpacing");
   Xm_N_List_Updated                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("listUpdated");
   Xm_N_List_Visible_Item_Count           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("listVisibleItemCount");
   Xm_N_Load_Model                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("loadModel");
   Xm_N_Lose_Primary_Callback             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("losePrimaryCallback");
   Xm_N_Losing_Focus_Callback             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("losingFocusCallback");
   Xm_N_Main_Window_Margin_Height         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mainWindowMarginHeight");
   Xm_N_Main_Window_Margin_Width          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mainWindowMarginWidth");
   Xm_N_Major_Tab_Spacing                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("majorTabSpacing");
   Xm_N_Map_Callback                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mapCallback");
   Xm_N_Mapped_When_Managed               : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Mapped_When_Managed;
   Xm_N_Mapping_Delay                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mappingDelay");
   Xm_N_Margin                            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("margin");
   Xm_N_Margin_Bottom                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("marginBottom");
   Xm_N_Margin_Height                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("marginHeight");
   Xm_N_Margin_Left                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("marginLeft");
   Xm_N_Margin_Right                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("marginRight");
   Xm_N_Margin_Top                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("marginTop");
   Xm_N_Margin_Width                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("marginWidth");
   Xm_N_Mask                              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mask");
   Xm_N_Match_Behavior                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("matchBehavior");
   Xm_N_Max_Aspect_X                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Max_Aspect_X;
   Xm_N_Max_Aspect_Y                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Max_Aspect_Y;
   Xm_N_Max_Height                        : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Max_Height;
   Xm_N_Max_Length                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("maxLength");
   Xm_N_Max_Width                         : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Max_Width;
   Xm_N_Max_X                             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("maxX");
   Xm_N_Max_Y                             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("maxY");
   Xm_N_Maximum                           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("maximum");
   Xm_N_Maximum_Value                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("maximumValue");
   Xm_N_Menu_Accelerator                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("menuAccelerator");
   Xm_N_Menu_Bar                          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("menuBar");
   Xm_N_Menu_Cursor                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("menuCursor");
   Xm_N_Menu_Help_Widget                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("menuHelpWidget");
   Xm_N_Menu_History                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("menuHistory");
   Xm_N_Menu_Post                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("menuPost");
   Xm_N_Message_Alignment                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("messageAlignment");
   Xm_N_Message_String                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("messageString");
   Xm_N_Message_Window                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("messageWindow");
   Xm_N_Min_Aspect_X                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Min_Aspect_X;
   Xm_N_Min_Aspect_Y                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Min_Aspect_Y;
   Xm_N_Min_Height                        : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Min_Height;
   Xm_N_Min_Width                         : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Min_Width;
   Xm_N_Min_X                             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("minX");
   Xm_N_Min_Y                             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("minY");
   Xm_N_Minimize_Buttons                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("minimizeButtons");
   Xm_N_Minimum                           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("minimum");
   Xm_N_Minimum_Value                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("minimumValue");
   Xm_N_Minor_Tab_Spacing                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("minorTabSpacing");
   Xm_N_Mnemonic                          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mnemonic");
   Xm_N_Mnemonic_Char_Set                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mnemonicCharSet");
   Xm_N_Modify_Verify_Callback            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("modifyVerifyCallback");
   Xm_N_Modify_Verify_Callback_Wcs        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("modifyVerifyCallbackWcs");
   Xm_N_Motif_Version                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("motifVersion");
   Xm_N_Motion_Verify_Callback            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("motionVerifyCallback");
   Xm_N_Move_Opaque                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("moveOpaque");
   Xm_N_Multi_Click                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("multiClick");
   Xm_N_Multiple_Selection_Callback       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("multipleSelectionCallback");
   Xm_N_Must_Match                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mustMatch");
   Xm_N_Mwm_Decorations                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mwmDecorations");
   Xm_N_Mwm_Functions                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mwmFunctions");
   Xm_N_Mwm_Input_Mode                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mwmInputMode");
   Xm_N_Mwm_Menu                          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mwmMenu");
   Xm_N_Navigation_Type                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("navigationType");
   Xm_N_No_Font_Callback                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("noFontCallback");
   Xm_N_No_Match_Callback                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("noMatchCallback");
   Xm_N_No_Match_String                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("noMatchString");
   Xm_N_No_Rendition_Callback             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("noRenditionCallback");
   Xm_N_No_Resize                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("noResize");
   Xm_N_None_Cursor_Foreground            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("noneCursorForeground");
   Xm_N_Notebook_Child_Type               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("notebookChildType");
   Xm_N_Num_Children                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Num_Children;
   Xm_N_Num_Columns                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("numColumns");
   Xm_N_Num_Drop_Rectangles               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("numDropRectangles");
   Xm_N_Num_Drop_Transfers                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("numDropTransfers");
   Xm_N_Num_Export_Targets                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("numExportTargets");
   Xm_N_Num_Import_Targets                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("numImportTargets");
   Xm_N_Num_Values                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("numValues");
   Xm_N_Offset_X                          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("offsetX");
   Xm_N_Offset_Y                          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("offsetY");
   Xm_N_Ok_Callback                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("okCallback");
   Xm_N_Ok_Label_String                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("okLabelString");
   Xm_N_Operation_Changed_Callback        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("operationChangedCallback");
   Xm_N_Operation_Cursor_Icon             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("operationCursorIcon");
   Xm_N_Option_Label                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("optionLabel");
   Xm_N_Option_Mnemonic                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("optionMnemonic");
   Xm_N_Orientation                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("orientation");
   Xm_N_Outline_Button_Policy             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("outlineButtonPolicy");
   Xm_N_Outline_Changed_Callback          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("outlineChangedCallback");
   Xm_N_Outline_Column_Width              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("outlineColumnWidth");
   Xm_N_Outline_Indentation               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("outlineIndentation");
   Xm_N_Outline_Line_Style                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("outlineLineStyle");
   Xm_N_Outline_State                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("outlineState");
--   Xm_N_Output_Create                     : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("outputCreate");
   Xm_N_Override_Redirect                 : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Override_Redirect;
   Xm_N_Packing                           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("packing");
   Xm_N_Page_Changed_Callback             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pageChangedCallback");
   Xm_N_Page_Decrement_Callback           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pageDecrementCallback");
   Xm_N_Page_Increment                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pageIncrement");
   Xm_N_Page_Increment_Callback           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pageIncrementCallback");
   Xm_N_Page_Number                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pageNumber");
   Xm_N_Page_Setup_Callback               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pageSetupCallback");
   Xm_N_Pane_Maximum                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("paneMaximum");
   Xm_N_Pane_Minimum                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("paneMinimum");
   Xm_N_Path_Mode                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pathMode");
   Xm_N_Pattern                           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pattern");
   Xm_N_Pattern_Type                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("patternType");
   Xm_N_Pdm_Notification_Callback         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pdmNotificationCallback");
   Xm_N_Pending_Delete                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pendingDelete");
   Xm_N_Pixmap                            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pixmap");
   Xm_N_Popdown_Callback                  : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Popdown_Callback;
   Xm_N_Popup_Callback                    : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Popup_Callback;
   Xm_N_Popup_Enabled                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("popupEnabled");
   Xm_N_Popup_Handler_Callback            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("popupHandlerCallback");
   Xm_N_Position                          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("position");
   Xm_N_Position_Index                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("positionIndex");
   Xm_N_Position_Mode                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("positionMode");
   Xm_N_Position_Type                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("positionType");
   Xm_N_Post_From_Button                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("postFromButton");
--   Xm_N_Post_From_Count                   : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("postFromCount");
--   Xm_N_Post_From_List                    : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("postFromList");
   Xm_N_Preedit_Type                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("preeditType");
   Xm_N_Primary_Ownership                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("primaryOwnership");
   Xm_N_Processing_Direction              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("processingDirection");
   Xm_N_Program_Path                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Program_Path;
   Xm_N_Prompt_String                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("promptString");
   Xm_N_Push_Button_Enabled               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pushButtonEnabled");
   Xm_N_Qualify_Search_Data_Proc          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("qualifySearchDataProc");
   Xm_N_Radio_Always_One                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("radioAlwaysOne");
   Xm_N_Radio_Behavior                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("radioBehavior");
--   Xm_N_Realize_Callback                  : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("realizeCallback");
   Xm_N_Recompute_Size                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("recomputeSize");
   Xm_N_Refigure_Mode                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("refigureMode");
   Xm_N_Render_Table                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("renderTable");
   Xm_N_Rendition_Background              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("renditionBackground");
   Xm_N_Rendition_Foreground              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("renditionForeground");
   Xm_N_Repeat_Delay                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("repeatDelay");
   Xm_N_Resign_Command                    : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Resign_Command;
   Xm_N_Resizable                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("resizable");
   Xm_N_Resize_Callback                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("resizeCallback");
   Xm_N_Resize_Height                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("resizeHeight");
   Xm_N_Resize_Policy                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("resizePolicy");
   Xm_N_Resize_Width                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("resizeWidth");
   Xm_N_Restart_Command                   : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Restart_Command;
   Xm_N_Restart_Style                     : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Restart_Style;
   Xm_N_Right_Attachment                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rightAttachment");
   Xm_N_Right_Offset                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rightOffset");
   Xm_N_Right_Position                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rightPosition");
   Xm_N_Right_Widget                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rightWidget");
   Xm_N_Row_Column_Type                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rowColumnType");
   Xm_N_Rows                              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rows");
   Xm_N_Rubber_Positioning                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rubberPositioning");
   Xm_N_Sash_Height                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("sashHeight");
   Xm_N_Sash_Indent                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("sashIndent");
   Xm_N_Sash_Shadow_Thickness             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("sashShadowThickness");
   Xm_N_Sash_Width                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("sashWidth");
   Xm_N_Save_Callback                     : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Save_Callback;
   Xm_N_Save_Complete_Callback            : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Save_Complete_Callback;
   Xm_N_Save_Under                        : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Save_Under;
   Xm_N_Scale_Height                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scaleHeight");
   Xm_N_Scale_Multiple                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scaleMultiple");
   Xm_N_Scale_Width                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scaleWidth");
   Xm_N_Screen                            : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Screen;
   Xm_N_Scroll_Bar_Display_Policy         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrollBarDisplayPolicy");
   Xm_N_Scroll_Bar_Placement              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrollBarPlacement");
   Xm_N_Scroll_Horizontal                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrollHorizontal");
   Xm_N_Scroll_Left_Side                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrollLeftSide");
   Xm_N_Scroll_Top_Side                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrollTopSide");
   Xm_N_Scroll_Vertical                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrollVertical");
   Xm_N_Scrolled_Window_Child_Type        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrolledWindowChildType");
   Xm_N_Scrolled_Window_Margin_Height     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrolledWindowMarginHeight");
   Xm_N_Scrolled_Window_Margin_Width      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrolledWindowMarginWidth");
   Xm_N_Scrolling_Policy                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrollingPolicy");
   Xm_N_Select_Color                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectColor");
   Xm_N_Select_Insensitive_Pixmap         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectInsensitivePixmap");
   Xm_N_Select_Pixmap                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectPixmap");
   Xm_N_Select_Threshold                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectThreshold");
   Xm_N_Selected_Item                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectedItem");
   Xm_N_Selected_Item_Count               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectedItemCount");
   Xm_N_Selected_Items                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectedItems");
   Xm_N_Selected_Object_Count             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectedObjectCount");
   Xm_N_Selected_Objects                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectedObjects");
   Xm_N_Selected_Position                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectedPosition");
   Xm_N_Selected_Position_Count           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectedPositionCount");
   Xm_N_Selected_Positions                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectedPositions");
   Xm_N_Selection_Array                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectionArray");
   Xm_N_Selection_Array_Count             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectionArrayCount");
   Xm_N_Selection_Callback                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectionCallback");
   Xm_N_Selection_Label_String            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectionLabelString");
   Xm_N_Selection_Mode                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectionMode");
   Xm_N_Selection_Policy                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectionPolicy");
   Xm_N_Selection_Technique               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectionTechnique");
   Xm_N_Sensitive                         : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Sensitive;
   Xm_N_Separator_On                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("separatorOn");
   Xm_N_Separator_Type                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("separatorType");
   Xm_N_Session_Id                        : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Session_Id;
   Xm_N_Set                               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("set");
   Xm_N_Shadow_Thickness                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("shadowThickness");
   Xm_N_Shadow_Type                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("shadowType");
   Xm_N_Shell_Unit_Type                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("shellUnitType");
   Xm_N_Show_Arrows                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("showArrows");
   Xm_N_Show_As_Default                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("showAsDefault");
   Xm_N_Show_Separator                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("showSeparator");
   Xm_N_Show_Value                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("showValue");
   Xm_N_Shutdown_Command                  : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Shutdown_Command;
   Xm_N_Simple_Callback                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("simpleCallback");
   Xm_N_Single_Selection_Callback         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("singleSelectionCallback");
   Xm_N_Skip_Adjust                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("skipAdjust");
   Xm_N_Spot_Location                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("spotLocation");
   Xm_N_Slider_Mark                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("sliderMark");
   Xm_N_Slider_Size                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("sliderSize");
   Xm_N_Slider_Visual                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("sliderVisual");
   Xm_N_Sliding_Mode                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("slidingMode");
   Xm_N_Small_Cell_Height                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("smallCellHeight");
   Xm_N_Small_Cell_Width                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("smallCellWidth");
   Xm_N_Small_Icon_Mask                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("smallIconMask");
   Xm_N_Small_Icon_Pixmap                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("smallIconPixmap");
   Xm_N_Snap_Back_Multiple                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("snapBackMultiple");
   Xm_N_Source                            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("source");
   Xm_N_Source_Cursor_Icon                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("sourceCursorIcon");
--   Xm_N_Source_Is_External                : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("sourceIsExternal");
   Xm_N_Source_Pixmap_Icon                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("sourcePixmapIcon");
--   Xm_N_Source_Widget                     : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("sourceWidget");
--   Xm_N_Source_Window                     : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("sourceWindow");
   Xm_N_Spacing                           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("spacing");
   Xm_N_Spatial_Include_Model             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("spatialIncludeModel");
   Xm_N_Spatial_Resize_Model              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("spatialResizeModel");
   Xm_N_Spatial_Snap_Model                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("spatialSnapModel");
   Xm_N_Spatial_Style                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("spatialStyle");
   Xm_N_Spin_Box_Child_Type               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("spinBoxChildType");
   Xm_N_Start_Job_Callback                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("startJobCallback");
--   Xm_N_Start_Time                        : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("startTime");
   Xm_N_State_Cursor_Icon                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("stateCursorIcon");
   Xm_N_Strikethru_Type                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("strikethruType");
   Xm_N_String_Direction                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("stringDirection");
   Xm_N_Sub_Menu_Id                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("subMenuId");
   Xm_N_Substitute                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("substitute");
   Xm_N_Symbol_Pixmap                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("symbolPixmap");
   Xm_N_Tab_List                          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabList");
   Xm_N_Tag                               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tag");
   Xm_N_Tear_Off_Menu_Activate_Callback   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tearOffMenuActivateCallback");
   Xm_N_Tear_Off_Menu_Deactivate_Callback : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tearOffMenuDeactivateCallback");
   Xm_N_Tear_Off_Model                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tearOffModel");
   Xm_N_Tear_Off_Title                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tearOffTitle");
   Xm_N_Text_Accelerators                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("textAccelerators");
   Xm_N_Text_Columns                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("textColumns");
   Xm_N_Text_Field                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("textField");
   Xm_N_Text_Font_List                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("textFontList");
   Xm_N_Text_Render_Table                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("textRenderTable");
   Xm_N_Text_String                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("textString");
   Xm_N_Text_Translations                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("textTranslations");
   Xm_N_Title                             : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Title;
   Xm_N_Title_Encoding                    : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Title_Encoding;
   Xm_N_Title_String                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("titleString");
   Xm_N_To_Bottom_Callback                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("toBottomCallback");
   Xm_N_To_Top_Callback                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("toTopCallback");
   Xm_N_Toggle_Mode                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("toggleMode");
   Xm_N_Top_Attachment                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("topAttachment");
   Xm_N_Top_Character                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("topCharacter");
   Xm_N_Top_Item_Position                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("topItemPosition");
   Xm_N_Top_Level_Enter_Callback          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("topLevelEnterCallback");
   Xm_N_Top_Level_Leave_Callback          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("topLevelLeaveCallback");
   Xm_N_Top_Offset                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("topOffset");
   Xm_N_Top_Position                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("topPosition");
   Xm_N_Top_Shadow_Color                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("topShadowColor");
   Xm_N_Top_Shadow_Pixmap                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("topShadowPixmap");
   Xm_N_Top_Widget                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("topWidget");
   Xm_N_Total_Lines                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("totalLines");
   Xm_N_Transfer_Proc                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("transferProc");
   Xm_N_Transfer_Status                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("transferStatus");
   Xm_N_Transient                         : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Transient;
   Xm_N_Transient_For                     : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Transient_For;
   Xm_N_Translations                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Translations;
   Xm_N_Traversal_On                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("traversalOn");
   Xm_N_Traverse_Obscured_Callback        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("traverseObscuredCallback");
   Xm_N_Trough_Color                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("troughColor");
   Xm_N_Underline_Type                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("underlineType");
   Xm_N_Unit_Type                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("unitType");
   Xm_N_Unmap_Callback                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("unmapCallback");
   Xm_N_Unpost_Behavior                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("unpostBehavior");
   Xm_N_Unselect_Color                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("unselectColor");
--   Xm_N_Urgency                           : constant Xt.Xt_Resource_Name_String
--     := Xt_String_Defs.Xt_N_Urgency;
   Xm_N_Use_Async_Geometry                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("useAsyncGeometry");
   Xm_N_User_Data                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("userData");
   Xm_N_Valid_Cursor_Foreground           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("validCursorForeground");
   Xm_N_Value                             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("value");
   Xm_N_Value_Changed_Callback            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("valueChangedCallback");
   Xm_N_Value_Wcs                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("valueWcs");
   Xm_N_Values                            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("values");
   Xm_N_Verify_Bell                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("verifyBell");
   Xm_N_Verify_Preedit                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("verifyPreedit");
   Xm_N_Vertical_Font_Unit                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("verticalFontUnit");
   Xm_N_Vertical_Scroll_Bar               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("verticalScrollBar");
   Xm_N_Vertical_Spacing                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("verticalSpacing");
   Xm_N_View_Type                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("viewType");
   Xm_N_Visible_Item_Count                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("visibleItemCount");
   Xm_N_Visible_When_Off                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("visibleWhenOff");
   Xm_N_Visual                            : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Visual;
   Xm_N_Visual_Emphasis                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("visualEmphasis");
   Xm_N_Visual_Policy                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("visualPolicy");
   Xm_N_Wait_For_Wm                       : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Wait_For_Wm;
   Xm_N_Which_Button                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("whichButton");
   Xm_N_Width                             : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Width;
   Xm_N_Width_Inc                         : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Width_Inc;
   Xm_N_Win_Gravity                       : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Win_Gravity;
   Xm_N_Window_Group                      : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Window_Group;
--   Xm_N_Window_Role                       : constant Xt.Xt_Resource_Name_String
--     := Xt_String_Defs.Xt_N_Window_Role;
   Xm_N_Wm_Timeout                        : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Wm_Timeout;
   Xm_N_Word_Wrap                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("wordWrap");
   Xm_N_Work_Window                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("workWindow");
--   Xm_N_Wrap                              : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("wrap");
   Xm_N_X                                 : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_X;
   Xm_N_Y                                 : constant Xt.Xt_Resource_Name_String
     := Xt_String_Defs.Xt_N_Y;

   Xm_C_Accelerator                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Accelerator");
   Xm_C_Accelerator_Text                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AcceleratorText");
   Xm_C_Accelerators                     : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Accelerators;
   Xm_C_Adjust_Last                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AdjustLast");
   Xm_C_Adjust_Margin                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AdjustMargin");
   Xm_C_Alignment                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Alignment");
   Xm_C_Allow_Overlap                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AllowOverlap");
   Xm_C_Allow_Shell_Resize               : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Allow_Shell_Resize;
   Xm_C_Animation_Mask                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AnimationMask");
   Xm_C_Animation_Pixmap                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AnimationPixmap");
   Xm_C_Animation_Pixmap_Depth           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AnimationPixmapDepth");
   Xm_C_Animation_Style                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AnimationStyle");
   Xm_C_Apply_Label_String               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ApplyLabelString");
   Xm_C_Argc                             : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Argc;
   Xm_C_Argv                             : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Argv;
--   Xm_C_Arm_Callback                     : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("ArmCallback");
   Xm_C_Arm_Color                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ArmColor");
   Xm_C_Arm_Pixmap                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ArmPixmap");
   Xm_C_Arrow_Direction                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ArrowDirection");
   Xm_C_Arrow_Layout                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ArrowLayout");
   Xm_C_Arrow_Orientation                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ArrowOrientation");
   Xm_C_Arrow_Sensitivity                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ArrowSensitivity");
   Xm_C_Arrow_Size                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ArrowSize");
   Xm_C_Arrow_Spacing                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ArrowSpacing");
   Xm_C_Attachment                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Attachment");
   Xm_C_Audible_Warning                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AudibleWarning");
   Xm_C_Auto_Drag_Model                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AutoDragModel");
   Xm_C_Auto_Show_Cursor_Position        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AutoShowCursorPosition");
   Xm_C_Auto_Unmanage                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AutoUnmanage");
   Xm_C_Automatic_Selection              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AutomaticSelection");
   Xm_C_Back_Page_Background             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BackPageBackground");
   Xm_C_Back_Page_Foreground             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BackPageForeground");
   Xm_C_Back_Page_Number                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BackPageNumber");
   Xm_C_Back_Page_Placement              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BackPagePlacement");
   Xm_C_Back_Page_Size                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BackPageSize");
   Xm_C_Background                       : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Background;
--   Xm_C_Background_Pixmap                : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("BackgroundPixmap");
   Xm_C_Base_Height                      : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Base_Height;
   Xm_C_Base_Width                       : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Base_Width;
   Xm_C_Binding_Pixmap                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BindingPixmap");
   Xm_C_Binding_Type                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BindingType");
   Xm_C_Binding_Width                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BindingWidth");
   Xm_C_Bitmap_Conversion_Model          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BitmapConversionModel");
   Xm_C_Blend_Model                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BlendModel");
   Xm_C_Blink_Rate                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BlinkRate");
   Xm_C_Boolean                          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Boolean");
   Xm_C_Border_Color                     : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Border_Color;
   Xm_C_Border_Width                     : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Border_Width;
   Xm_C_Bottom_Shadow_Color              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BottomShadowColor");
   Xm_C_Bottom_Shadow_Pixmap             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BottomShadowPixmap");
   Xm_C_Button_Accelerator_Text          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ButtonAcceleratorText");
   Xm_C_Button_Accelerators              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ButtonAccelerators");
   Xm_C_Button_Count                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ButtonCount");
   Xm_C_Button_Font_List                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ButtonFontList");
   Xm_C_Button_Mnemonic_Char_Sets        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ButtonMnemonicCharSets");
   Xm_C_Button_Mnemonics                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ButtonMnemonics");
   Xm_C_Button_Render_Table              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ButtonRenderTable");
   Xm_C_Button_Set                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ButtonSet");
   Xm_C_Button_Type                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ButtonType");
   Xm_C_Buttons                          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Buttons");
   Xm_C_Callback                         : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Callback;
   Xm_C_Cancel_Label_String              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CancelLabelString");
   Xm_C_Cell_Height                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellHeight");
   Xm_C_Cell_Width                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellWidth");
   Xm_C_Child_Horizontal_Alignment       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ChildHorizontalAlignment");
   Xm_C_Child_Horizontal_Spacing         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ChildHorizontalSpacing");
   Xm_C_Child_Placement                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ChildPlacement");
   Xm_C_Child_Type                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ChildType");
   Xm_C_Child_Vertical_Alignment         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ChildVerticalAlignment");
   Xm_C_Client_Data                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ClientData");
--   Xm_C_Client_Leader                    : constant Xt.Xt_Resource_Class_String
--     := Xt_String_Defs.Xt_C_Client_Leader;
   Xm_C_Clip_Window                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ClipWindow");
   Xm_C_Clone_Command                    : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Clone_Command;
   Xm_C_Collapsed_State_Pixmap           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CollapsedStatePixmap");
   Xm_C_Color_Allocation_Proc            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ColorAllocationProc");
   Xm_C_Color_Calculation_Proc           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ColorCalculationProc");
   Xm_C_Colormap                         : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Colormap;
   Xm_C_Columns                          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Columns");
   Xm_C_Combo_Box_Type                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ComboBoxType");
   Xm_C_Command_Window                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CommandWindow");
   Xm_C_Command_Window_Location          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CommandWindowLocation");
   Xm_C_Connection                       : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Connection;
   Xm_C_Convert_Proc                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ConvertProc");
   Xm_C_Create_Popup_Child_Proc          : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Create_Popup_Child_Proc;
   Xm_C_Current_Directory                : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Current_Directory;
   Xm_C_Current_Page_Number              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CurrentPageNumber");
--   Xm_C_Cursor                           : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("Cursor");
   Xm_C_Cursor_Background                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CursorBackground");
   Xm_C_Cursor_Foreground                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CursorForeground");
   Xm_C_Cursor_Position                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CursorPosition");
   Xm_C_Cursor_Position_Visible          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CursorPositionVisible");
   Xm_C_Dark_Threshold                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DarkThreshold");
   Xm_C_Decimal_Points                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DecimalPoints");
   Xm_C_Default_Arrow_Sensitivity        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultArrowSensitivity");
   Xm_C_Default_Button_Emphasis          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultButtonEmphasis");
   Xm_C_Default_Button_Shadow_Thickness  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultButtonShadowThickness");
   Xm_C_Default_Button_Type              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultButtonType");
   Xm_C_Default_Copy_Cursor_Icon         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultCopyCursorIcon");
   Xm_C_Default_Font_List                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultFontList");
   Xm_C_Default_Invalid_Cursor_Icon      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultInvalidCursorIcon");
   Xm_C_Default_Link_Cursor_Icon         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultLinkCursorIcon");
   Xm_C_Default_Move_Cursor_Icon         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultMoveCursorIcon");
   Xm_C_Default_None_Cursor_Icon         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultNoneCursorIcon");
   Xm_C_Default_Pixmap_Resolution        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultPixmapResolution");
   Xm_C_Default_Position                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultPosition");
   Xm_C_Default_Source_Cursor_Icon       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultSourceCursorIcon");
   Xm_C_Default_Valid_Cursor_Icon        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultValidCursorIcon");
   Xm_C_Default_Virtual_Bindings         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DefaultVirtualBindings");
   Xm_C_Delete_Response                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DeleteResponse");
   Xm_C_Depth                            : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Depth;
   Xm_C_Detail                           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Detail");
   Xm_C_Detail_Column_Heading            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DetailColumnHeading");
   Xm_C_Detail_Column_Heading_Count      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DetailColumnHeadingCount");
   Xm_C_Detail_Count                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DetailCount");
   Xm_C_Detail_Order                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DetailOrder");
   Xm_C_Detail_Order_Count               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DetailOrderCount");
   Xm_C_Detail_Tab_List                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DetailTabList");
   Xm_C_Dialog_Style                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DialogStyle");
   Xm_C_Dialog_Title                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DialogTitle");
   Xm_C_Dialog_Type                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DialogType");
--   Xm_C_Dimension                        : constant Xt.Xt_Resource_Class_String
--     := Xt_String_Defs.Xt_C_Dimension;
   Xm_C_Dir_List_Item_Count              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DirListItemCount");
   Xm_C_Dir_List_Items                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DirListItems");
   Xm_C_Dir_List_Label_String            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DirListLabelString");
   Xm_C_Dir_Mask                         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DirMask");
   Xm_C_Dir_Search_Proc                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DirSearchProc");
   Xm_C_Dir_Spec                         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DirSpec");
   Xm_C_Dir_Text_Label_String            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DirTextLabelString");
   Xm_C_Directory                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Directory");
   Xm_C_Directory_Valid                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DirectoryValid");
--   Xm_C_Disarm_Callback                  : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("DisarmCallback");
   Xm_C_Discard_Command                  : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Discard_Command;
   Xm_C_Double_Click_Interval            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DoubleClickInterval");
--   Xm_C_Drag_Context_Class               : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("DragContextClass");
   Xm_C_Drag_Initiator_Protocol_Style    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DragInitiatorProtocolStyle");
   Xm_C_Drag_Operations                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DragOperations");
   Xm_C_Drag_Proc                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DragProc");
   Xm_C_Drag_Receiver_Protocol_Style     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DragReceiverProtocolStyle");
   Xm_C_Drop_Proc                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DropProc");
   Xm_C_Drop_Rectangles                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DropRectangles");
   Xm_C_Drop_Site_Activity               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DropSiteActivity");
--   Xm_C_Drop_Site_Manager_Class          : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("DropSiteManagerClass");
   Xm_C_Drop_Site_Operations             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DropSiteOperations");
   Xm_C_Drop_Site_Type                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DropSiteType");
--   Xm_C_Drop_Transfer_Class              : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("DropTransferClass");
   Xm_C_Drop_Transfers                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DropTransfers");
   Xm_C_Edit_Mode                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("EditMode");
   Xm_C_Editable                         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Editable");
   Xm_C_Enable_Btn1_Transfer             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("EnableBtn1Transfer");
   Xm_C_Enable_Button_Tab                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("EnableButtonTab");
   Xm_C_Enable_Drag_Icon                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("EnableDragIcon");
   Xm_C_Enable_Etched_In_Menu            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("EnableEtchedInMenu");
--   Xm_C_Enable_Multi_Key_Bindings        : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("EnableMultiKeyBindings");
--   Xm_C_Enable_Thin_Thickness            : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("EnableThinThickness");
   Xm_C_Enable_Toggle_Color              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("EnableToggleColor");
   Xm_C_Enable_Toggle_Visual             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("EnableToggleVisual");
   Xm_C_Enable_Unselectable_Drag         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("EnableUnselectableDrag");
   Xm_C_Enable_Warp                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("EnableWarp");
   Xm_C_Entry_Border                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("EntryBorder");
   Xm_C_Entry_Class                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("EntryClass");
   Xm_C_Entry_View_Type                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("EntryViewType");
   Xm_C_Environment                      : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Environment;
   Xm_C_Expanded_State_Pixmap            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ExpandedStatePixmap");
   Xm_C_Export_Targets                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ExportTargets");
--   Xm_C_Extension_Type                   : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("ExtensionType");
   Xm_C_File_Filter_Style                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FileFilterStyle");
   Xm_C_File_List_Label_String           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FileListLabelString");
   Xm_C_File_Search_Proc                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FileSearchProc");
   Xm_C_File_Type_Mask                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FileTypeMask");
   Xm_C_Fill_On_Arm                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FillOnArm");
   Xm_C_Fill_On_Select                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FillOnSelect");
   Xm_C_Filter_Label_String              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FilterLabelString");
   Xm_C_First_Page_Number                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FirstPageNumber");
   Xm_C_Font                             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Font");
   Xm_C_Font_List                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FontList");
   Xm_C_Font_Name                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FontName");
   Xm_C_Font_Type                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FontType");
   Xm_C_Foreground                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Foreground");
   Xm_C_Foreground_Threshold             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ForegroundThreshold");
   Xm_C_Frame_Background                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FrameBackground");
   Xm_C_Frame_Child_Type                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FrameChildType");
   Xm_C_Geometry                         : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Geometry;
   Xm_C_Height                           : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Height;
   Xm_C_Height_Inc                       : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Height_Inc;
   Xm_C_Help_Label_String                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HelpLabelString");
   Xm_C_Highlight_Color                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HighlightColor");
   Xm_C_Highlight_On_Enter               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HighlightOnEnter");
   Xm_C_Highlight_Pixmap                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HighlightPixmap");
   Xm_C_Highlight_Thickness              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HighlightThickness");
   Xm_C_Horizontal_Font_Unit             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HorizontalFontUnit");
   Xm_C_Horizontal_Scroll_Bar            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HorizontalScrollBar");
   Xm_C_Hot                              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Hot");
--   Xm_C_ICC_Handle                       : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("ICCHandle");
   Xm_C_Icon_Mask                        : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Icon_Mask;
   Xm_C_Icon_Name                        : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Icon_Name;
   Xm_C_Icon_Name_Encoding               : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Icon_Name_Encoding;
   Xm_C_Icon_Pixmap                      : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Icon_Pixmap;
   Xm_C_Icon_Window                      : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Icon_Window;
   Xm_C_Icon_X                           : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Icon_X;
   Xm_C_Icon_Y                           : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Icon_Y;
   Xm_C_Iconic                           : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Iconic;
   Xm_C_Import_Targets                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ImportTargets");
   Xm_C_Increment                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Increment");
   Xm_C_Increment_Value                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IncrementValue");
   Xm_C_Incremental                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Incremental");
   Xm_C_Indeterminate_Insensitive_Pixmap : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IndeterminateInsensitivePixmap");
   Xm_C_Indeterminate_Pixmap             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IndeterminatePixmap");
   Xm_C_Indicator_On                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IndicatorOn");
   Xm_C_Indicator_Size                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IndicatorSize");
   Xm_C_Indicator_Type                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IndicatorType");
   Xm_C_Initial_Delay                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InitialDelay");
   Xm_C_Initial_Focus                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InitialFocus");
   Xm_C_Initial_State                    : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Initial_State;
   Xm_C_Inner_Margin_Height              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InnerMarginHeight");
   Xm_C_Inner_Margin_Width               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InnerMarginWidth");
   Xm_C_Input                            : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Input;
--   Xm_C_Input_Create                     : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("InputCreate");
   Xm_C_Input_Method                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InputMethod");
   Xm_C_Input_Policy                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InputPolicy");
   Xm_C_Insensitive_Stipple_Bitmap       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InsensitiveStippleBitmap");
   Xm_C_Insert_Position                  : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Insert_Position;
   Xm_C_Invalid_Cursor_Foreground        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InvalidCursorForeground");
   Xm_C_Is_Aligned                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IsAligned");
   Xm_C_Is_Homogeneous                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IsHomogeneous");
   Xm_C_Item_Count                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ItemCount");
   Xm_C_Items                            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Items");
   Xm_C_Join_Session                     : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Join_Session;
   Xm_C_Keyboard_Focus_Policy            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("KeyboardFocusPolicy");
   Xm_C_Label_Font_List                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LabelFontList");
   Xm_C_Label_Insensitive_Pixmap         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LabelInsensitivePixmap");
   Xm_C_Label_Pixmap                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LabelPixmap");
   Xm_C_Label_Render_Table               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LabelRenderTable");
   Xm_C_Label_Type                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LabelType");
   Xm_C_Last_Page_Number                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LastPageNumber");
   Xm_C_Layout_Direction                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LayoutDirection");
   Xm_C_Layout_Type                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LayoutType");
   Xm_C_Light_Threshold                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LightThreshold");
   Xm_C_Line_Style                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LineStyle");
   Xm_C_List                             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("List");
   Xm_C_List_Label_String                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ListLabelString");
   Xm_C_List_Margin_Height               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ListMarginHeight");
   Xm_C_List_Margin_Width                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ListMarginWidth");
   Xm_C_List_Size_Policy                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ListSizePolicy");
   Xm_C_List_Spacing                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ListSpacing");
   Xm_C_List_Updated                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ListUpdated");
   Xm_C_Load_Model                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LoadModel");
   Xm_C_Main_Window_Margin_Height        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MainWindowMarginHeight");
   Xm_C_Main_Window_Margin_Width         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MainWindowMarginWidth");
   Xm_C_Major_Tab_Spacing                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MajorTabSpacing");
   Xm_C_Mapped_When_Managed              : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Mapped_When_Managed;
   Xm_C_Mapping_Delay                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MappingDelay");
   Xm_C_Margin                           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Margin");
   Xm_C_Margin_Bottom                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MarginBottom");
   Xm_C_Margin_Height                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MarginHeight");
   Xm_C_Margin_Left                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MarginLeft");
   Xm_C_Margin_Right                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MarginRight");
   Xm_C_Margin_Top                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MarginTop");
   Xm_C_Margin_Width                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MarginWidth");
   Xm_C_Match_Behavior                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MatchBehavior");
   Xm_C_Max_Aspect_X                     : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Max_Aspect_X;
   Xm_C_Max_Aspect_Y                     : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Max_Aspect_Y;
   Xm_C_Max_Height                       : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Max_Height;
   Xm_C_Max_Items                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MaxItems");
   Xm_C_Max_Length                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MaxLength");
   Xm_C_Max_Value                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MaxValue");
   Xm_C_Max_Width                        : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Max_Width;
   Xm_C_Max_X                            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MaxX");
   Xm_C_Max_Y                            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MaxY");
   Xm_C_Maximum                          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Maximum");
   Xm_C_Maximum_Value                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MaximumValue");
   Xm_C_Menu_Bar                         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MenuBar");
   Xm_C_Menu_Post                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MenuPost");
   Xm_C_Menu_Widget                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MenuWidget");
   Xm_C_Message_Window                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MessageWindow");
   Xm_C_Min_Aspect_X                     : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Min_Aspect_X;
   Xm_C_Min_Aspect_Y                     : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Min_Aspect_Y;
   Xm_C_Min_Height                       : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Min_Height;
   Xm_C_Min_Width                        : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Min_Width;
   Xm_C_Min_X                            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MinX");
   Xm_C_Min_Y                            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MinY");
   Xm_C_Minimize_Buttons                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MinimizeButtons");
   Xm_C_Minimum                          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Minimum");
   Xm_C_Minimum_Value                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MinimumValue");
   Xm_C_Minor_Tab_Spacing                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MinorTabSpacing");
   Xm_C_Mnemonic                         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Mnemonic");
   Xm_C_Mnemonic_Char_Set                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MnemonicCharSet");
   Xm_C_Motif_Version                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MotifVersion");
   Xm_C_Move_Opaque                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MoveOpaque");
   Xm_C_Multi_Click                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MultiClick");
   Xm_C_Must_Match                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MustMatch");
   Xm_C_Mwm_Decorations                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MwmDecorations");
   Xm_C_Mwm_Functions                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MwmFunctions");
   Xm_C_Mwm_Input_Mode                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MwmInputMode");
   Xm_C_Mwm_Menu                         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MwmMenu");
   Xm_C_Navigation_Type                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("NavigationType");
   Xm_C_No_Match_String                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("NoMatchString");
   Xm_C_No_Resize                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("NoResize");
   Xm_C_None_Cursor_Foreground           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("NoneCursorForeground");
   Xm_C_Notebook_Child_Type              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("NotebookChildType");
   Xm_C_Num_Columns                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("NumColumns");
   Xm_C_Num_Drop_Rectangles              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("NumDropRectangles");
   Xm_C_Num_Drop_Transfers               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("NumDropTransfers");
   Xm_C_Num_Export_Targets               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("NumExportTargets");
   Xm_C_Num_Import_Targets               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("NumImportTargets");
   Xm_C_Num_Values                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("NumValues");
   Xm_C_Offset                           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Offset");
   Xm_C_Ok_Label_String                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("OkLabelString");
   Xm_C_Operation_Cursor_Icon            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("OperationCursorIcon");
   Xm_C_Option_Label                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("OptionLabel");
   Xm_C_Option_Mnemonic                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("OptionMnemonic");
   Xm_C_Orientation                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Orientation");
   Xm_C_Outline_Button_Policy            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("OutlineButtonPolicy");
   Xm_C_Outline_Column_Width             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("OutlineColumnWidth");
   Xm_C_Outline_Indentation              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("OutlineIndentation");
   Xm_C_Outline_State                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("OutlineState");
--   Xm_C_Output_Create                    : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("OutputCreate");
   Xm_C_Override_Redirect                : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Override_Redirect;
   Xm_C_Packing                          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Packing");
   Xm_C_Page_Increment                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PageIncrement");
   Xm_C_Page_Number                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PageNumber");
   Xm_C_Pane_Maximum                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PaneMaximum");
   Xm_C_Pane_Minimum                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PaneMinimum");
   Xm_C_Path_Mode                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PathMode");
   Xm_C_Pattern                          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Pattern");
   Xm_C_Pending_Delete                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PendingDelete");
   Xm_C_Pixmap                           : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Pixmap;
   Xm_C_Popup_Enabled                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PopupEnabled");
   Xm_C_Position                         : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Position;
   Xm_C_Position_Index                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PositionIndex");
   Xm_C_Position_Mode                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PositionMode");
   Xm_C_Position_Type                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PositionType");
   Xm_C_Post_From_Button                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PostFromButton");
--   Xm_C_Post_From_Count                  : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("PostFromCount");
--   Xm_C_Post_From_List                   : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("PostFromList");
   Xm_C_Preedit_Type                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PreeditType");
   Xm_C_Primary_Ownership                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PrimaryOwnership");
   Xm_C_Processing_Direction             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ProcessingDirection");
   Xm_C_Program_Path                     : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Program_Path;
   Xm_C_Prompt_String                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PromptString");
   Xm_C_Push_Button_Enabled              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PushButtonEnabled");
   Xm_C_Qualify_Search_Data_Proc         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("QualifySearchDataProc");
   Xm_C_Radio_Always_One                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RadioAlwaysOne");
   Xm_C_Radio_Behavior                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RadioBehavior");
   Xm_C_Read_Only                        : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Read_Only;
   Xm_C_Recompute_Size                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RecomputeSize");
   Xm_C_Render_Table                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RenderTable");
   Xm_C_Rendition_Background             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RenditionBackground");
   Xm_C_Rendition_Foreground             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RenditionForeground");
   Xm_C_Repeat_Delay                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RepeatDelay");
   Xm_C_Resign_Command                   : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Resign_Command;
   Xm_C_Resizable                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Resizable");
   Xm_C_Resize_Height                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ResizeHeight");
   Xm_C_Resize_Policy                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ResizePolicy");
   Xm_C_Resize_Width                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ResizeWidth");
   Xm_C_Restart_Command                  : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Restart_Command;
   Xm_C_Restart_Style                    : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Restart_Style;
   Xm_C_Row_Column_Type                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RowColumnType");
   Xm_C_Rows                             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Rows");
   Xm_C_Rubber_Positioning               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RubberPositioning");
   Xm_C_Sash_Height                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SashHeight");
   Xm_C_Sash_Indent                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SashIndent");
   Xm_C_Sash_Width                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SashWidth");
   Xm_C_Save_Under                       : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Save_Under;
   Xm_C_Scale_Height                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScaleHeight");
   Xm_C_Scale_Multiple                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScaleMultiple");
   Xm_C_Scale_Width                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScaleWidth");
   Xm_C_Screen                           : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Screen;
   Xm_C_Scroll                           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Scroll");
   Xm_C_Scroll_Bar_Display_Policy        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScrollBarDisplayPolicy");
   Xm_C_Scroll_Bar_Placement             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScrollBarPlacement");
   Xm_C_Scroll_Side                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScrollSide");
   Xm_C_Scrolled_Window_Child_Type       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScrolledWindowChildType");
   Xm_C_Scrolled_Window_Margin_Height    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScrolledWindowMarginHeight");
   Xm_C_Scrolled_Window_Margin_Width     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScrolledWindowMarginWidth");
   Xm_C_Scrolling_Policy                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScrollingPolicy");
   Xm_C_Select_Color                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectColor");
   Xm_C_Select_Insensitive_Pixmap        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectInsensitivePixmap");
   Xm_C_Select_Pixmap                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectPixmap");
   Xm_C_Select_Threshold                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectThreshold");
   Xm_C_Selected_Item                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectedItem");
   Xm_C_Selected_Item_Count              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectedItemCount");
   Xm_C_Selected_Items                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectedItems");
   Xm_C_Selected_Object_Count            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectedObjectCount");
   Xm_C_Selected_Objects                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectedObjects");
   Xm_C_Selected_Position                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectedPosition");
   Xm_C_Selected_Position_Count          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectedPositionCount");
   Xm_C_Selected_Positions               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectedPositions");
   Xm_C_Selection_Array                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectionArray");
   Xm_C_Selection_Array_Count            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectionArrayCount");
   Xm_C_Selection_Label_String           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectionLabelString");
   Xm_C_Selection_Mode                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectionMode");
   Xm_C_Selection_Policy                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectionPolicy");
   Xm_C_Selection_Technique              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectionTechnique");
   Xm_C_Sensitive                        : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Sensitive;
   Xm_C_Separator_On                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SeparatorOn");
   Xm_C_Separator_Type                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SeparatorType");
   Xm_C_Session_Id                       : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Session_Id;
   Xm_C_Set                              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Set");
   Xm_C_Shadow_Thickness                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ShadowThickness");
   Xm_C_Shadow_Type                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ShadowType");
   Xm_C_Shell_Unit_Type                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ShellUnitType");
   Xm_C_Show_Arrows                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ShowArrows");
   Xm_C_Show_As_Default                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ShowAsDefault");
   Xm_C_Show_Separator                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ShowSeparator");
   Xm_C_Show_Value                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ShowValue");
   Xm_C_Shutdown_Command                 : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Shutdown_Command;
   Xm_C_Slider_Mark                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SliderMark");
   Xm_C_Slider_Size                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SliderSize");
   Xm_C_Slider_Visual                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SliderVisual");
   Xm_C_Sliding_Mode                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SlidingMode");
   Xm_C_Snap_Back_Multiple               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SnapBackMultiple");
   Xm_C_Source                           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Source");
   Xm_C_Source_Cursor_Icon               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SourceCursorIcon");
--   Xm_C_Source_Is_External               : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("SourceIsExternal");
   Xm_C_Source_Pixmap_Icon               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SourcePixmapIcon");
--   Xm_C_Source_Widget                    : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("SourceWidget");
--   Xm_C_Source_Window                    : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("SourceWindow");
   Xm_C_Spacing                          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Spacing");
   Xm_C_Spatial_Include_Model            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SpatialIncludeModel");
   Xm_C_Spatial_Resize_Model             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SpatialResizeModel");
   Xm_C_Spatial_Snap_Model               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SpatialSnapModel");
   Xm_C_Spatial_Style                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SpatialStyle");
   Xm_C_Spin_Box_Child_Type              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SpinBoxChildType");
--   Xm_C_Start_Time                       : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("StartTime");
   Xm_C_State_Cursor_Icon                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("StateCursorIcon");
   Xm_C_Strikethru_Type                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("StrikethruType");
   Xm_C_String_Direction                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("StringDirection");
   Xm_C_Tab_List                         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TabList");
   Xm_C_Tag                              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Tag");
   Xm_C_Tear_Off_Model                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TearOffModel");
   Xm_C_Tear_Off_Title                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TearOffTitle");
   Xm_C_Text_Field                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TextField");
   Xm_C_Text_Font_List                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TextFontList");
   Xm_C_Text_Render_Table                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TextRenderTable");
   Xm_C_Text_String                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TextString");
   Xm_C_Title                            : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Title;
   Xm_C_Title_Encoding                   : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Title_Encoding;
   Xm_C_Title_String                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TitleString");
   Xm_C_Toggle_Mode                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ToggleMode");
   Xm_C_Top_Character                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TopCharacter");
   Xm_C_Top_Item_Position                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TopItemPosition");
   Xm_C_Top_Shadow_Color                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TopShadowColor");
   Xm_C_Top_Shadow_Pixmap                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TopShadowPixmap");
   Xm_C_Total_Lines                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TotalLines");
   Xm_C_Transfer_Proc                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TransferProc");
   Xm_C_Transfer_Status                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TransferStatus");
   Xm_C_Transient                        : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Transient;
   Xm_C_Transient_For                    : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Transient_For;
   Xm_C_Translations                     : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Translations;
   Xm_C_Traversal_On                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TraversalOn");
   Xm_C_Trough_Color                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TroughColor");
   Xm_C_Underline_Type                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("UnderlineType");
   Xm_C_Unit_Type                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("UnitType");
   Xm_C_Unpost_Behavior                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("UnpostBehavior");
   Xm_C_Unselect_Color                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("UnselectColor");
--   Xm_C_Urgency                          : constant Xt.Xt_Resource_Class_String
--     := Xt_String_Defs.Xt_C_Urgency;
   Xm_C_Use_Async_Geometry               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("UseAsyncGeometry");
   Xm_C_User_Data                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("UserData");
   Xm_C_Valid_Cursor_Foreground          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ValidCursorForeground");
   Xm_C_Value                            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Value");
   Xm_C_Value_Changed_Callback           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ValueChangedCallback");
   Xm_C_Value_Wcs                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ValueWcs");
   Xm_C_Values                           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Values");
   Xm_C_Verify_Bell                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VerifyBell");
   Xm_C_Verify_Preedit                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VerifyPreedit");
   Xm_C_Vertical_Alignment               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VerticalAlignment");
   Xm_C_Vertical_Font_Unit               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VerticalFontUnit");
   Xm_C_Vertical_Scroll_Bar              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VerticalScrollBar");
   Xm_C_View_Type                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ViewType");
   Xm_C_Visible_Item_Count               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VisibleItemCount");
   Xm_C_Visible_When_Off                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VisibleWhenOff");
   Xm_C_Visual                           : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Visual;
   Xm_C_Visual_Emphasis                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VisualEmphasis");
   Xm_C_Visual_Policy                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VisualPolicy");
   Xm_C_Wait_For_Wm                      : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Wait_For_Wm;
   Xm_C_Which_Button                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("WhichButton");
   Xm_C_Widget                           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Widget");
   Xm_C_Width                            : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Width;
   Xm_C_Width_Inc                        : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Width_Inc;
   Xm_C_Win_Gravity                      : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Win_Gravity;
   Xm_C_Window_Group                     : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Window_Group;
--   Xm_C_Window_Role                      : constant Xt.Xt_Resource_Class_String
--     := Xt_String_Defs.Xt_C_Window_Role;
   Xm_C_Wm_Timeout                       : constant Xt.Xt_Resource_Class_String
     := Xt_String_Defs.Xt_C_Wm_Timeout;
   Xm_C_Word_Wrap                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("WordWrap");
   Xm_C_Work_Window                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("WorkWindow");
--   Xm_C_Wrap                             : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("Wrap");
   Xm_C_Xm_String                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("XmString");

--   Xm_R_Accelerator_Table             : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Accelerator_Table;
--   Xm_R_Alignment                     : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Alignment");
--   Xm_R_Arrow_Direction               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ArrowDirection");
--   Xm_R_Arrow_Layout                  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ArrowLayout");
--   Xm_R_Arrow_Orientation             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ArrowOrientation");
--   Xm_R_Arrow_Sensitivity             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ArrowSensitivity");
--   Xm_R_Atom                          : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Atom;
--   Xm_R_Atom_List                     : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("AtomList");
--   Xm_R_Attachment                    : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Attachment");
--   Xm_R_Audible_Warning               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("AudibleWarning");
--   Xm_R_Auto_Drag_Model               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("AutoDragModel");
--   Xm_R_Automatic_Selection           : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("AutomaticSelection");
--   Xm_R_Binding_Type                  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("BindingType");
--   Xm_R_Bitmap                        : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Bitmap;
--   Xm_R_Bitmap_Conversion_Model       : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("BitmapConversionModel");
--   Xm_R_Blend_Model                   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("BlendModel");
--   Xm_R_Bool                          : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Bool;
--   Xm_R_Boolean                       : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Boolean;
--   Xm_R_Boolean_Dimension             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("BooleanDimension");
--   Xm_R_Bottom_Shadow_Pixmap          : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("BottomShadowPixmap");
--   Xm_R_Button_Font_List              : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ButtonFontList");
--   Xm_R_Button_Render_Table           : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ButtonRenderTable");
--   Xm_R_Callback                      : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Callback;
--   Xm_R_Callback_Proc                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("CallbackProc");
--   Xm_R_Cardinal                      : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Cardinal;
--   Xm_R_Cardinal_List                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("CardinalList");
--   Xm_R_Child_Horizontal_Alignment    : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ChildHorizontalAlignment");
--   Xm_R_Child_Placement               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ChildPlacement");
--   Xm_R_Child_Type                    : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ChildType");
--   Xm_R_Child_Vertical_Alignment      : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ChildVerticalAlignment");
--   Xm_R_Colormap                      : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Colormap;
--   Xm_R_Combo_Box_Type                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ComboBoxType");
--   Xm_R_Command_Arg_Array             : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Command_Arg_Array;
--   Xm_R_Command_Window_Location       : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("CommandWindowLocation");
--   Xm_R_Cursor                        : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Cursor");
--   Xm_R_Default_Button_Emphasis       : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("DefaultButtonEmphasis");
--   Xm_R_Default_Button_Type           : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("DefaultButtonType");
--   Xm_R_Delete_Response               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("DeleteResponse");
--   Xm_R_Dialog_Style                  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("DialogStyle");
--   Xm_R_Dialog_Type                   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("DialogType");
--   Xm_R_Dimension                     : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Dimension;
--   Xm_R_Direction                     : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Direction");
--   Xm_R_Directory_String              : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Directory_String;
--   Xm_R_Drag_Initiator_Protocol_Style : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("DragInitiatorProtocolStyle");
--   Xm_R_Drag_Receiver_Protocol_Style  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("DragReceiverProtocolStyle");
--   Xm_R_Drop_Transfers                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("DropTransfers");
--   Xm_R_Dynamic_Pixmap                : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Dynamic_Pixmap;
--   Xm_R_Edit_Mode                     : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("EditMode");
--   Xm_R_Enable_Btn1_Transfer          : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("EnableBtn1Transfer");
--   Xm_R_Enable_Warp                   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("EnableWarp");
--   Xm_R_Entry_View_Type               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("EntryViewType");
--   Xm_R_Enum                          : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Enum");
--   Xm_R_Environment_Array             : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Environment_Array;
--   Xm_R_Extension_Type                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ExtensionType");
--   Xm_R_File_Filter_Style             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("FileFilterStyle");
--   Xm_R_File_Type_Mask                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("FileTypeMask");
--   Xm_R_Font_List                     : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("FontList");
--   Xm_R_Font_Struct                   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("FontStruct");
--   Xm_R_Function                      : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Function;
--   Xm_R_Gravity                       : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Gravity;
--   Xm_R_Highlight_Pixmap              : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("HighlightPixmap");
--   Xm_R_Horizontal_Dimension          : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Horizontal_Dimension;
--   Xm_R_Horizontal_Int                : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Horizontal_Int;
--   Xm_R_Horizontal_Position           : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Horizontal_Position;
--   Xm_R_Icon_Attachment               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("IconAttachment");
--   Xm_R_Indicator_On                  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("IndicatorOn");
--   Xm_R_Indicator_Type                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("IndicatorType");
--   Xm_R_Initial_State                 : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Initial_State;
--   Xm_R_Input_Policy                  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("InputPolicy");
--   Xm_R_Int                           : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Int;
--   Xm_R_Key_Sym                       : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("KeySym");
--   Xm_R_Keyboard_Focus_Policy         : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("KeyboardFocusPolicy");
--   Xm_R_Label_Font_List               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("LabelFontList");
--   Xm_R_Label_Render_Table            : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("LabelRenderTable");
--   Xm_R_Label_Type                    : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("LabelType");
--   Xm_R_Large_Icon_Pixmap             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("LargeIconPixmap");
--   Xm_R_Layout_Type                   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("LayoutType");
--   Xm_R_Line_Style                    : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("LineStyle");
--   Xm_R_List_Size_Policy              : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ListSizePolicy");
--   Xm_R_Match_Behavior                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("MatchBehavior");
--   Xm_R_Menu_Widget                   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("MenuWidget");
--   Xm_R_Multi_Click                   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("MultiClick");
--   Xm_R_Navigation_Type               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("NavigationType");
--   Xm_R_No_Scaling_Bitmap             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("NoScalingBitmap");
--   Xm_R_No_Scaling_Dynamic_Pixmap     : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("NoScalingDynamicPixmap");
--   Xm_R_Notebook_Child_Type           : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("NotebookChildType");
--   Xm_R_Orientation                   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Orientation");
--   Xm_R_Outline_Button_Policy         : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("OutlineButtonPolicy");
--   Xm_R_Outline_State                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("OutlineState");
--   Xm_R_Packing                       : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Packing");
--   Xm_R_Path_Mode                     : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("PathMode");
--   Xm_R_Pixel                         : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Pixel;
--   Xm_R_Pixmap                        : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Pixmap;
--   Xm_R_Pointer                       : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Pointer");
--   Xm_R_Position                      : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Position;
--   Xm_R_Position_Mode                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("PositionMode");
--   Xm_R_Position_Type                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("PositionType");
--   Xm_R_Position_Value                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("PositionValue");
--   Xm_R_Primary_Ownership             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("PrimaryOwnership");
--   Xm_R_Proc                          : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Proc");
--   Xm_R_Processing_Direction          : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ProcessingDirection");
--   Xm_R_Render_Table                  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("RenderTable");
--   Xm_R_Resize_Policy                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ResizePolicy");
--   Xm_R_Restart_Style                 : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Restart_Style;
--   Xm_R_Row_Column_Type               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("RowColumnType");
--   Xm_R_Screen                        : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Screen;
--   Xm_R_Scroll_Bar_Display_Policy     : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ScrollBarDisplayPolicy");
--   Xm_R_Scroll_Bar_Placement          : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ScrollBarPlacement");
--   Xm_R_Scrolled_Window_Child_Type    : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ScrolledWindowChildType");
--   Xm_R_Scrolling_Policy              : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ScrollingPolicy");
--   Xm_R_Select_Color                  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SelectColor");
--   Xm_R_Selection_Mode                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SelectionMode");
--   Xm_R_Selection_Policy              : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SelectionPolicy");
--   Xm_R_Selection_Technique           : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SelectionTechnique");
--   Xm_R_Selection_Type                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SelectionType");
--   Xm_R_Separator_Type                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SeparatorType");
--   Xm_R_Set                           : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Set");
--   Xm_R_Shadow_Type                   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ShadowType");
--   Xm_R_Short                         : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Short");
--   Xm_R_Show_Arrows                   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ShowArrows");
--   Xm_R_Show_Value                    : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ShowValue");
--   Xm_R_Slider_Mark                   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SliderMark");
--   Xm_R_Slider_Visual                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SliderVisual");
--   Xm_R_Sliding_Mode                  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SlidingMode");
--   Xm_R_Small_Icon_Pixmap             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SmallIconPixmap");
--   Xm_R_Smc_Conn                      : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Smc_Conn;
--   Xm_R_Spatial_Include_Model         : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SpatialIncludeModel");
--   Xm_R_Spatial_Resize_Model          : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SpatialResizeModel");
--   Xm_R_Spatial_Snap_Model            : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SpatialSnapModel");
--   Xm_R_Spatial_Style                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SpatialStyle");
--   Xm_R_Spin_Box_Child_Type           : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SpinBoxChildType");
   Xm_R_String                        : constant Xt.Xt_Resource_Type_String
     := Xt_String_Defs.Xt_R_String;
--   Xm_R_String_Array                  : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_String_Array;
--   Xm_R_String_Direction              : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("StringDirection");
--   Xm_R_Tab_List                      : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("TabList");
--   Xm_R_Tear_Off_Model                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("TearOffModel");
--   Xm_R_Text_Font_List                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("TextFontList");
--   Xm_R_Text_Position                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("TextPosition");
--   Xm_R_Text_Render_Table             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("TextRenderTable");
--   Xm_R_Toggle_Mode                   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ToggleMode");
--   Xm_R_Top_Item_Position             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("TopItemPosition");
--   Xm_R_Top_Shadow_Pixmap             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("TopShadowPixmap");
--   Xm_R_Transfer_Status               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("TransferStatus");
--   Xm_R_Translation_Table             : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Translation_Table;
--   Xm_R_Unit_Type                     : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("UnitType");
--   Xm_R_Unpost_Behavior               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("UnpostBehavior");
--   Xm_R_Unsigned_Char                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("UnsignedChar");
--   Xm_R_Value_Wcs                     : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ValueWcs");
--   Xm_R_Vertical_Alignment            : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("VerticalAlignment");
--   Xm_R_Vertical_Dimension            : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Vertical_Dimension;
--   Xm_R_Vertical_Int                  : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Vertical_Int;
--   Xm_R_Vertical_Position             : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Vertical_Position;
--   Xm_R_View_Type                     : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("ViewType");
--   Xm_R_Visual                        : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Visual;
--   Xm_R_Visual_Emphasis               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("VisualEmphasis");
--   Xm_R_Visual_Policy                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("VisualPolicy");
--   Xm_R_Which_Button                  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("WhichButton");
--   Xm_R_Widget                        : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Widget;
--   Xm_R_Widget_Class                  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("WidgetClass");
--   Xm_R_Widget_List                   : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Widget_List;
--   Xm_R_Window                        : constant Xt.Xt_Resource_Type_String
--     := Xt_String_Defs.Xt_R_Window;
   Xm_R_Xm_String                     : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("XmString");
--   Xm_R_Xm_String_Table               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("XmStringTable");

end Xm_String_Defs;
