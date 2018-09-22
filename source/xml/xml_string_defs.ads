with Interfaces.C.Strings;

with Xt;


package XmL_String_Defs is

   --  Resource name constants

   Xm_N_Accept_Resize            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Active_Tab               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Add_Callback             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Allow_Column_Hide        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Allow_Column_Resize      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Allow_Drag_Selected      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Allow_Drop               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Allow_Row_Hide           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Allow_Row_Resize         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Auto_Select              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Blank_Background         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Blank_Background_Pixmap  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Bottom_Fixed_Count       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Bottom_Fixed_Margin      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Alignment           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Background          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Bottom_Border_Color : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Bottom_Border_Type  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Column_Span         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Defaults            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Draw_Callback       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Drop_Callback       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Editable            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Focus_Callback      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Foreground          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Font_List           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Left_Border_Color   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Left_Border_Type    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Margin_Bottom       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Margin_Left         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Margin_Right        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Margin_Top          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Paste_Callback      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Pixmap              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Pixmap_Mask         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Right_Border_Color  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Right_Border_Type   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Row_Span            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_String              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Toggle_Set          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Top_Border_Color    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Top_Border_Type     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_Type                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Cell_User_Data           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Collapse_Callback        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Column                   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Column_Hidden            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Column_Ptr               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Column_Range_End         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Column_Range_Start       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Column_Resizable         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Column_Size_Policy       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Column_Step              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Column_Type              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Column_User_Data         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Column_Width             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Complete_Value           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Connecting_Line_Color    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Corner_Dimension         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Corner_Style             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Debug_Level              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Delete_Callback          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Deselect_Callback        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Edit_Callback            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Edit_Translations        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Enter_Cell_Callback      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Enter_Grid_Callback      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Expand_Callback          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Footer_Columns           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Footer_Rows              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Global_Pixmap_Height     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Global_Pixmap_Width      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Heading_Columns          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Heading_Rows             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Hidden_Columns           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Hidden_Rows              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Hide_Unhide_Buttons      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Highlight_Row_Mode       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Horizontal_Size_Policy   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Hsb_Display_Policy       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Icon_Spacing             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Ignore_Pixmaps           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Immediate_Draw           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Inactive_Background      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Inactive_Foreground      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Layout_Frozen            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Leave_Cell_Callback      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Leave_Grid_Callback      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Left_Fixed_Count         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Left_Fixed_Margin        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Level_Spacing            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Meter_Style              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Min_Column_Width         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Num_Boxes                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Pixmap_Margin            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Plus_Minus_Color         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Right_Fixed_Count        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Right_Fixed_Margin       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Rotate_When_Left_Right   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row                      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row_Expands              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row_Height               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row_Is_Expanded          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row_Level                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row_Ptr                  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row_Range_End            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row_Range_Start          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row_Size_Policy          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row_Step                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row_Type                 : constant Xt.Xt_Resource_Name_String;
   Xm_N_Row_User_Data            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scroll_Bar_Margin        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scroll_Callback          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scroll_Column            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Scroll_Row               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Select_Callback          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Select_Foreground        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Select_Background        : constant Xt.Xt_Resource_Name_String;
   Xm_N_Shadow_Regions           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Simple_Headings          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Simple_Widths            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Single_Click_Activation  : constant Xt.Xt_Resource_Name_String;
   Xm_N_Show_Percentage          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Show_Time                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tab_Bar_Height           : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tab_Count                : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tab_Free_Pixmaps         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tab_Inactive_Pixmap      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tab_Managed_Name         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tab_Managed_Widget       : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tab_Pixmap               : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tab_Placement            : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tab_Translations         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tab_Widget_Class         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tab_Widget_List          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Tabs_Per_Row             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Text_Widget              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Toggle_Bottom_Color      : constant Xt.Xt_Resource_Name_String;
   Xm_N_Toggle_Size              : constant Xt.Xt_Resource_Name_String;
   Xm_N_Toggle_Top_Color         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Top_Fixed_Count          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Top_Fixed_Margin         : constant Xt.Xt_Resource_Name_String;
   Xm_N_Traverse_Translations    : constant Xt.Xt_Resource_Name_String;
   Xm_N_Use_Average_Font_Width   : constant Xt.Xt_Resource_Name_String;
   Xm_N_Use_Text_Widget          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Vertical_Size_Policy     : constant Xt.Xt_Resource_Name_String;
   Xm_N_Visible_Columns          : constant Xt.Xt_Resource_Name_String;
   Xm_N_Visible_Rows             : constant Xt.Xt_Resource_Name_String;
   Xm_N_Vsb_Display_Policy       : constant Xt.Xt_Resource_Name_String;

   --  Resource class constants

   Xm_C_Accept_Resize            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Active_Tab               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Allow_Column_Hide        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Allow_Column_Resize      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Allow_Drag_Selected      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Allow_Drop               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Allow_Row_Hide           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Allow_Row_Resize         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Auto_Select              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Blank_Background         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Blank_Background_Pixmap  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Bottom_Fixed_Count       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Bottom_Fixed_Margin      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Alignment           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Background          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Bottom_Border_Color : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Bottom_Border_Type  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Column_Span         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Defaults            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Editable            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Foreground          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Font_List           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Left_Border_Color   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Left_Border_Type    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Margin_Bottom       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Margin_Left         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Margin_Right        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Margin_Top          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Pixmap              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Pixmap_Mask         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Right_Border_Color  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Right_Border_Type   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Row_Span            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Toggle_Set          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Top_Border_Color    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Top_Border_Type     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Cell_Type                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Column                   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Column_Range_End         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Column_Range_Start       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Column_Resizable         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Column_Size_Policy       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Column_Hidden            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Column_Step              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Column_Type              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Column_Width             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Complete_Value           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Connecting_Line_Color    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Corner_Dimension         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Corner_Style             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Debug_Level              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Folder_Resize_Policy     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Footer_Columns           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Footer_Rows              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Global_Pixmap_Height     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Global_Pixmap_Width      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Grid_Selection_Policy    : constant Xt.Xt_Resource_Class_String;
   Xm_C_Heading_Columns          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Heading_Rows             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Hidden_Columns           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Hidden_Rows              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Hide_Unhide_Buttons      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Highlight_Row_Mode       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Horizontal_Size_Policy   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Hsb_Display_Policy       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Icon_Spacing             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Ignore_Pixmaps           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Immediate_Draw           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Inactive_Background      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Inactive_Foreground      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Layout_Frozen            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Left_Fixed_Count         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Left_Fixed_Margin        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Level_Spacing            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Meter_Style              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Min_Column_Width         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Num_Boxes                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Pixmap_Margin            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Plus_Minus_Color         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Right_Fixed_Count        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Right_Fixed_Margin       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Rotate_When_Left_Right   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Row                      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Row_Expands              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Row_Height               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Row_Is_Expanded          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Row_Level                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Row_Range_End            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Row_Range_Start          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Row_Size_Policy          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Row_Step                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Row_Type                 : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scroll_Bar_Margin        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scroll_Column            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Scroll_Row               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Simple_Headings          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Simple_Widths            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Single_Click_Activation  : constant Xt.Xt_Resource_Class_String;
   Xm_C_Select_Foreground        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Select_Background        : constant Xt.Xt_Resource_Class_String;
   Xm_C_Shadow_Regions           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Show_Percentage          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Show_Time                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tab_Bar_Height           : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tab_Count                : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tab_Free_Pixmaps         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tab_Inactive_Pixmap      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tab_Managed_Name         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tab_Managed_Widget       : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tab_Pixmap               : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tab_Placement            : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tab_Widget_Class         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Tabs_Per_Row             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Text_Widget              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Toggle_Bottom_Color      : constant Xt.Xt_Resource_Class_String;
   Xm_C_Toggle_Size              : constant Xt.Xt_Resource_Class_String;
   Xm_C_Toggle_Top_Color         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Top_Fixed_Count          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Top_Fixed_Margin         : constant Xt.Xt_Resource_Class_String;
   Xm_C_Use_Average_Font_Width   : constant Xt.Xt_Resource_Class_String;
   Xm_C_Use_Text_Widget          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Vertical_Size_Policy     : constant Xt.Xt_Resource_Class_String;
   Xm_C_Visible_Columns          : constant Xt.Xt_Resource_Class_String;
   Xm_C_Visible_Rows             : constant Xt.Xt_Resource_Class_String;
   Xm_C_Vsb_Display_Policy       : constant Xt.Xt_Resource_Class_String;

   --  Resource type constants

   Xm_R_Cell_Alignment        : constant Xt.Xt_Resource_Type_String;
   Xm_R_Cell_Border_Type      : constant Xt.Xt_Resource_Type_String;
   Xm_R_Cell_Type             : constant Xt.Xt_Resource_Type_String;
   Xm_R_Column_Type           : constant Xt.Xt_Resource_Type_String;
   Xm_R_Corner_Style          : constant Xt.Xt_Resource_Type_String;
   Xm_R_Folder_Resize_Policy  : constant Xt.Xt_Resource_Type_String;
   Xm_R_Grid_Selection_Policy : constant Xt.Xt_Resource_Type_String;
   Xm_R_Grid_Size_Policy      : constant Xt.Xt_Resource_Type_String;
   Xm_R_Meter_Style           : constant Xt.Xt_Resource_Type_String;
   Xm_R_Row_Type              : constant Xt.Xt_Resource_Type_String;
   Xm_R_Tab_Placement         : constant Xt.Xt_Resource_Type_String;


private

   Xm_N_Accept_Resize            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("acceptResize");
   Xm_N_Active_Tab               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("activeTab");
   Xm_N_Add_Callback             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("addCallback");
   Xm_N_Auto_Select              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("autoSelect");
   Xm_N_Allow_Column_Hide        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("allowColumnHide");
   Xm_N_Allow_Column_Resize      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("allowColumnResize");
   Xm_N_Allow_Drag_Selected      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("allowDragSelected");
   Xm_N_Allow_Drop               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("allowDrop");
   Xm_N_Allow_Row_Hide           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("allowRowHide");
   Xm_N_Allow_Row_Resize         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("allowRowResize");
   Xm_N_Blank_Background         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("blankBackground");
   Xm_N_Blank_Background_Pixmap  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("blankBackgroundPixmap");
   Xm_N_Bottom_Fixed_Count       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("bottomFixedCount");
   Xm_N_Bottom_Fixed_Margin      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("bottomFixedMargin");
   Xm_N_Cell_Alignment           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellAlignment");
   Xm_N_Cell_Background          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellBackground");
   Xm_N_Cell_Bottom_Border_Color : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellBottomBorderColor");
   Xm_N_Cell_Bottom_Border_Type  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellBottomBorderType");
   Xm_N_Cell_Column_Span         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellColumnSpan");
   Xm_N_Cell_Defaults            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellDefaults");
   Xm_N_Cell_Draw_Callback       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellDrawCallback");
   Xm_N_Cell_Drop_Callback       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellDropCallback");
   Xm_N_Cell_Editable            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellEditable");
   Xm_N_Cell_Focus_Callback      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellFocusCallback");
   Xm_N_Cell_Foreground          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellForeground");
   Xm_N_Cell_Font_List           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellFontList");
   Xm_N_Cell_Left_Border_Color   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellLeftBorderColor");
   Xm_N_Cell_Left_Border_Type    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellLeftBorderType");
   Xm_N_Cell_Margin_Bottom       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellMarginBottom");
   Xm_N_Cell_Margin_Left         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellMarginLeft");
   Xm_N_Cell_Margin_Right        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellMarginRight");
   Xm_N_Cell_Margin_Top          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellMarginTop");
   Xm_N_Cell_Paste_Callback      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellPasteCallback");
   Xm_N_Cell_Pixmap              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellPixmap");
   Xm_N_Cell_Pixmap_Mask         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellPixmapMask");
   Xm_N_Cell_Right_Border_Color  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellRightBorderColor");
   Xm_N_Cell_Right_Border_Type   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellRightBorderType");
   Xm_N_Cell_Row_Span            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellRowSpan");
   Xm_N_Cell_String              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellString");
   Xm_N_Cell_Toggle_Set          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellToggleSet");
   Xm_N_Cell_Top_Border_Color    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellTopBorderColor");
   Xm_N_Cell_Top_Border_Type     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellTopBorderType");
   Xm_N_Cell_Type                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellType");
   Xm_N_Cell_User_Data           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cellUserData");
   Xm_N_Collapse_Callback        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("collapseCallback");
   Xm_N_Column                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("column");
   Xm_N_Column_Hidden            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("columnHidden");
   Xm_N_Column_Ptr               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("columnPtr");
   Xm_N_Column_Range_End         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("columnRangeEnd");
   Xm_N_Column_Range_Start       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("columnRangeStart");
   Xm_N_Column_Resizable         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("columnResizable");
   Xm_N_Column_Size_Policy       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("columnSizePolicy");
   Xm_N_Column_Step              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("columnStep");
   Xm_N_Column_Type              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("columnType");
   Xm_N_Column_User_Data         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("columnUserData");
   Xm_N_Column_Width             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("columnWidth");
   Xm_N_Complete_Value           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("completeValue");
   Xm_N_Connecting_Line_Color    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("connectingLineColor");
   Xm_N_Corner_Dimension         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cornerDimension");
   Xm_N_Corner_Style             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cornerStyle");
   Xm_N_Debug_Level              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("debugLevel");
   Xm_N_Delete_Callback          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("deleteCallback");
   Xm_N_Deselect_Callback        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("deselectCallback");
   Xm_N_Edit_Callback            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("editCallback");
   Xm_N_Edit_Translations        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("editTranslations");
   Xm_N_Enter_Cell_Callback      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("enterCellCallback");
   Xm_N_Enter_Grid_Callback      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("enterGridCallback");
   Xm_N_Expand_Callback          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("expandCallback");
   Xm_N_Footer_Columns           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("footerColumns");
   Xm_N_Footer_Rows              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("footerRows");
   Xm_N_Global_Pixmap_Height     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("globalPixmapHeight");
   Xm_N_Global_Pixmap_Width      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("globalPixmapWidth");
   Xm_N_Heading_Columns          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("headingColumns");
   Xm_N_Heading_Rows             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("headingRows");
   Xm_N_Hidden_Columns           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("hiddenColumns");
   Xm_N_Hidden_Rows              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("hiddenRows");
   Xm_N_Hide_Unhide_Buttons      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("hideUnhideButtons");
   Xm_N_Highlight_Row_Mode       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("highlightRowMode");
   Xm_N_Horizontal_Size_Policy   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("horizontalSizePolicy");
   Xm_N_Hsb_Display_Policy       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("hsbDisplayPolicy");
   Xm_N_Icon_Spacing             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("iconSpacing");
   Xm_N_Ignore_Pixmaps           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("ignorePixmaps");
   Xm_N_Immediate_Draw           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("immediateDraw");
   Xm_N_Inactive_Background      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("inactiveBackground");
   Xm_N_Inactive_Foreground      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("inactiveForeground");
   Xm_N_Layout_Frozen            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("layoutFrozen");
   Xm_N_Leave_Cell_Callback      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("leaveCellCallback");
   Xm_N_Leave_Grid_Callback      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("leaveGridCallback");
   Xm_N_Left_Fixed_Count         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("leftFixedCount");
   Xm_N_Left_Fixed_Margin        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("leftFixedMargin");
   Xm_N_Level_Spacing            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("levelSpacing");
   Xm_N_Meter_Style              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("meterStyle");
   Xm_N_Min_Column_Width         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("minColumnWidth");
   Xm_N_Num_Boxes                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("numBoxes");
   Xm_N_Pixmap_Margin            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("pixmapMargin");
   Xm_N_Plus_Minus_Color         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("plusMinusColor");
   Xm_N_Right_Fixed_Count        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rightFixedCount");
   Xm_N_Right_Fixed_Margin       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rightFixedMargin");
   Xm_N_Rotate_When_Left_Right   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rotateWhenLeftRight");
   Xm_N_Row                      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("row");
   Xm_N_Row_Expands              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rowExpands");
   Xm_N_Row_Height               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rowHeight");
   Xm_N_Row_Is_Expanded          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rowIsExpanded");
   Xm_N_Row_Level                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rowLevel");
   Xm_N_Row_Ptr                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rowPtr");
   Xm_N_Row_Range_End            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rowRangeEnd");
   Xm_N_Row_Range_Start          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rowRangeStart");
   Xm_N_Row_Size_Policy          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rowSizePolicy");
   Xm_N_Row_Step                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rowStep");
   Xm_N_Row_Type                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rowType");
   Xm_N_Row_User_Data            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("rowUserData");
   Xm_N_Scroll_Bar_Margin        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrollBarMargin");
   Xm_N_Scroll_Callback          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrollCallback");
   Xm_N_Scroll_Column            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrollColumn");
   Xm_N_Scroll_Row               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("scrollRow");
   Xm_N_Select_Callback          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectCallback");
   Xm_N_Select_Foreground        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectForeground");
   Xm_N_Select_Background        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("selectBackground");
   Xm_N_Shadow_Regions           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("shadowRegions");
   Xm_N_Simple_Headings          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("simpleHeadings");
   Xm_N_Simple_Widths            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("simpleWidths");
   Xm_N_Single_Click_Activation  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("singleClickActivation");
   Xm_N_Show_Percentage          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("showPercentage");
   Xm_N_Show_Time                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("showTime");
   Xm_N_Tab_Bar_Height           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabBarHeight");
   Xm_N_Tab_Count                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabCount");
   Xm_N_Tab_Free_Pixmaps         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabFreePixmaps");
   Xm_N_Tab_Inactive_Pixmap      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabInactivePixmap");
   Xm_N_Tab_Managed_Name         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabManagedName");
   Xm_N_Tab_Managed_Widget       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabManagedWidget");
   Xm_N_Tab_Pixmap               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabPixmap");
   Xm_N_Tab_Placement            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabPlacement");
   Xm_N_Tab_Translations         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabTranslations");
   Xm_N_Tab_Widget_Class         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabWidgetClass");
   Xm_N_Tab_Widget_List          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabWidgetList");
   Xm_N_Tabs_Per_Row             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("tabsPerRow");
   Xm_N_Text_Widget              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("textWidget");
   Xm_N_Toggle_Bottom_Color      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("toggleBottomColor");
   Xm_N_Toggle_Size              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("toggleSize");
   Xm_N_Toggle_Top_Color         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("toggleTopColor");
   Xm_N_Top_Fixed_Count          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("topFixedCount");
   Xm_N_Top_Fixed_Margin         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("topFixedMargin");
   Xm_N_Traverse_Translations    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("traverseTranslations");
   Xm_N_Use_Average_Font_Width   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("useAverageFontWidth");
   Xm_N_Use_Text_Widget          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("useTextWidget");
   Xm_N_Vertical_Size_Policy     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("verticalSizePolicy");
   Xm_N_Visible_Columns          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("visibleColumns");
   Xm_N_Visible_Rows             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("visibleRows");
   Xm_N_Vsb_Display_Policy       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("vsbDisplayPolicy");

   Xm_C_Accept_Resize            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AcceptResize");
   Xm_C_Active_Tab               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ActiveTab");
   Xm_C_Allow_Column_Hide        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AllowColumnHide");
   Xm_C_Allow_Column_Resize      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AllowColumnResize");
   Xm_C_Allow_Drag_Selected      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AllowDragSelected");
   Xm_C_Allow_Drop               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AllowDrop");
   Xm_C_Allow_Row_Hide           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AllowRowHide");
   Xm_C_Allow_Row_Resize         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AllowRowResize");
   Xm_C_Auto_Select              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AutoSelect");
   Xm_C_Blank_Background         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BlankBackground");
   Xm_C_Blank_Background_Pixmap  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BlankBackgroundPixmap");
   Xm_C_Bottom_Fixed_Count       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BottomFixedCount");
   Xm_C_Bottom_Fixed_Margin      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BottomFixedMargin");
   Xm_C_Cell_Alignment           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellAlignment");
   Xm_C_Cell_Background          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellBackground");
   Xm_C_Cell_Bottom_Border_Color : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellBottomBorderColor");
   Xm_C_Cell_Bottom_Border_Type  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellBottomBorderType");
   Xm_C_Cell_Column_Span         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellColumnSpan");
   Xm_C_Cell_Defaults            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellDefaults");
   Xm_C_Cell_Editable            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellEditable");
   Xm_C_Cell_Foreground          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellForeground");
   Xm_C_Cell_Font_List           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellFontList");
   Xm_C_Cell_Left_Border_Color   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellLeftBorderColor");
   Xm_C_Cell_Left_Border_Type    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellLeftBorderType");
   Xm_C_Cell_Margin_Bottom       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellMarginBottom");
   Xm_C_Cell_Margin_Left         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellMarginLeft");
   Xm_C_Cell_Margin_Right        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellMarginRight");
   Xm_C_Cell_Margin_Top          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellMarginTop");
   Xm_C_Cell_Pixmap              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellPixmap");
   Xm_C_Cell_Pixmap_Mask         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellPixmapMask");
   Xm_C_Cell_Right_Border_Color  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellRightBorderColor");
   Xm_C_Cell_Right_Border_Type   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellRightBorderType");
   Xm_C_Cell_Row_Span            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellRowSpan");
   Xm_C_Cell_Toggle_Set          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellToggleSet");
   Xm_C_Cell_Top_Border_Color    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellTopBorderColor");
   Xm_C_Cell_Top_Border_Type     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellTopBorderType");
   Xm_C_Cell_Type                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CellType");
   Xm_C_Column                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Column");
   Xm_C_Column_Range_End         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ColumnRangeEnd");
   Xm_C_Column_Range_Start       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ColumnRangeStart");
   Xm_C_Column_Resizable         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ColumnResizable");
   Xm_C_Column_Size_Policy       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ColumnSizePolicy");
   Xm_C_Column_Hidden            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ColumnHidden");
   Xm_C_Column_Step              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ColumnStep");
   Xm_C_Column_Type              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ColumnType");
   Xm_C_Column_Width             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ColumnWidth");
   Xm_C_Complete_Value           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CompleteValue");
   Xm_C_Connecting_Line_Color    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ConnectingLineColor");
   Xm_C_Corner_Dimension         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CornerDimension");
   Xm_C_Corner_Style             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CornerStyle");
   Xm_C_Debug_Level              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DebugLevel");
   Xm_C_Folder_Resize_Policy     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FolderResizePolicy");
   Xm_C_Footer_Columns           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FooterColumns");
   Xm_C_Footer_Rows              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("FooterRows");
   Xm_C_Global_Pixmap_Height     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("GlobalPixmapHeight");
   Xm_C_Global_Pixmap_Width      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("GlobalPixmapWidth");
   Xm_C_Grid_Selection_Policy    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("GridSelectionPolicy");
   Xm_C_Heading_Columns          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HeadingColumns");
   Xm_C_Heading_Rows             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HeadingRows");
   Xm_C_Hidden_Columns           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HiddenColumns");
   Xm_C_Hidden_Rows              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HiddenRows");
   Xm_C_Hide_Unhide_Buttons      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HideUnhideButtons");
   Xm_C_Highlight_Row_Mode       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HighlightRowMode");
   Xm_C_Horizontal_Size_Policy   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HorizontalSizePolicy");
   Xm_C_Hsb_Display_Policy       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HsbDisplayPolicy");
   Xm_C_Icon_Spacing             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IconSpacing");
   Xm_C_Ignore_Pixmaps           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IgnorePixmaps");
   Xm_C_Immediate_Draw           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ImmediateDraw");
   Xm_C_Inactive_Background      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InactiveBackground");
   Xm_C_Inactive_Foreground      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InactiveForeground");
   Xm_C_Layout_Frozen            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LayoutFrozen");
   Xm_C_Left_Fixed_Count         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LeftFixedCount");
   Xm_C_Left_Fixed_Margin        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LeftFixedMargin");
   Xm_C_Level_Spacing            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("LevelSpacing");
   Xm_C_Meter_Style              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MeterStyle");
   Xm_C_Min_Column_Width         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MinColumnWidth");
   Xm_C_Num_Boxes                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("NumBoxes");
   Xm_C_Pixmap_Margin            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PixmapMargin");
   Xm_C_Plus_Minus_Color         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("PlusMinusColor");
   Xm_C_Right_Fixed_Count        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RightFixedCount");
   Xm_C_Right_Fixed_Margin       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RightFixedMargin");
   Xm_C_Rotate_When_Left_Right   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RotateWhenLeftRight");
   Xm_C_Row                      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Row");
   Xm_C_Row_Expands              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RowExpands");
   Xm_C_Row_Height               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RowHeight");
   Xm_C_Row_Is_Expanded          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RowIsExpanded");
   Xm_C_Row_Level                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RowLevel");
   Xm_C_Row_Range_End            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RowRangeEnd");
   Xm_C_Row_Range_Start          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RowRangeStart");
   Xm_C_Row_Size_Policy          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RowSizePolicy");
   Xm_C_Row_Step                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RowStep");
   Xm_C_Row_Type                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RowType");
   Xm_C_Scroll_Bar_Margin        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScrollBarMargin");
   Xm_C_Scroll_Column            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScrollColumn");
   Xm_C_Scroll_Row               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ScrollRow");
   Xm_C_Simple_Headings          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SimpleHeadings");
   Xm_C_Simple_Widths            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SimpleWidths");
   Xm_C_Single_Click_Activation  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SingleClickActivation");
   Xm_C_Select_Foreground        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectForeground");
   Xm_C_Select_Background        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SelectBackground");
   Xm_C_Shadow_Regions           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ShadowRegions");
   Xm_C_Show_Percentage          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ShowPercentage");
   Xm_C_Show_Time                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ShowTime");
   Xm_C_Tab_Bar_Height           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TabBarHeight");
   Xm_C_Tab_Count                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TabCount");
   Xm_C_Tab_Free_Pixmaps         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TabFreePixmaps");
   Xm_C_Tab_Inactive_Pixmap      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TabInactivePixmap");
   Xm_C_Tab_Managed_Name         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TabManagedName");
   Xm_C_Tab_Managed_Widget       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TabManagedWidget");
   Xm_C_Tab_Pixmap               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TabPixmap");
   Xm_C_Tab_Placement            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TabPlacement");
   Xm_C_Tab_Widget_Class         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TabWidgetClass");
   Xm_C_Tabs_Per_Row             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TabsPerRow");
   Xm_C_Text_Widget              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TextWidget");
   Xm_C_Toggle_Bottom_Color      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ToggleBottomColor");
   Xm_C_Toggle_Size              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ToggleSize");
   Xm_C_Toggle_Top_Color         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ToggleTopColor");
   Xm_C_Top_Fixed_Count          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TopFixedCount");
   Xm_C_Top_Fixed_Margin         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TopFixedMargin");
   Xm_C_Use_Average_Font_Width   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("UseAverageFontWidth");
   Xm_C_Use_Text_Widget          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("UseTextWidget");
   Xm_C_Vertical_Size_Policy     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VerticalSizePolicy");
   Xm_C_Visible_Columns          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VisibleColumns");
   Xm_C_Visible_Rows             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VisibleRows");
   Xm_C_Vsb_Display_Policy       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("VsbDisplayPolicy");

   Xm_R_Cell_Alignment        : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("CellAlignment");
   Xm_R_Cell_Border_Type      : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("CellBorderType");
   Xm_R_Cell_Type             : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("CellType");
   Xm_R_Column_Type           : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("ColumnType");
   Xm_R_Corner_Style          : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("CornerStyle");
   Xm_R_Folder_Resize_Policy  : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("FolderResizePolicy");
   Xm_R_Grid_Selection_Policy : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("GridSelectionPolicy");
   Xm_R_Grid_Size_Policy      : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("GridSizePolicy");
   Xm_R_Meter_Style           : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("MeterStyle");
   Xm_R_Row_Type              : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("RowType");
   Xm_R_Tab_Placement         : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("TabPlacement");

end XmL_String_Defs;
