with Interfaces.C.Wide_Strings;


package Xm.Resource_Management is


   procedure Xm_Get_Secondary_Resource_Data
    (The_Widget_Class : in     Xt.Widget_Class;
     Secondary_Data   :    out Xm_Secondary_Resource_Data_List_Access);


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Secondary_Resource_Data_List_Access_Free
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Xm_Secondary_Resource_Data_List_Access_Free
    (Item : in out Xm_Secondary_Resource_Data_List_Access);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Interfaces.C.Wide_Strings.wchars_ptr);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Alignment);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Arrow_Direction);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Arrow_Layout);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Arrow_Orientation);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Arrow_Sensitivity);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Attachment);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Audible_Warning);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Auto_Drag_Model);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Automatic_Selection);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Binding_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Bitmap_Conversion_Model);


--   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
--                         Name  : in     Xt.Xt_Resource_Name_String;
--                         Value : in     Xm_Child_Horizontal_Alignment);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Child_Placement);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Child_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Child_Vertical_Alignment);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Combo_Box_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Command_Window_Location);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Default_Button_Emphasis);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Default_Button_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Delete_Response);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Dialog_Style);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Dialog_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Direction);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Edit_Mode);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Enable_Btn1_Transfer);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Enable_Warp);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Entry_View_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_File_Filter_Style);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Indicator_On);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Indicator_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Input_Policy);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Keyboard_Focus_Policy);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Label_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Layout_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Line_Style);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Match_Behavior);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Multi_Click);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Navigation_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Notebook_Child_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Orientation);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Outline_Button_Policy);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Outline_State);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Packing);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Path_Mode);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Popup_Enabled);

   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Position_Mode);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Position_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Primary_Ownership);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Processing_Direction);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Render_Table);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Resize_Policy);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Row_Column_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Scroll_Bar_Display_Policy);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Scroll_Bar_Placement);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Scrolled_Window_Child_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Scrolling_Policy);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Selection_Policy);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Selection_Technique);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Selection_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Separator_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_String);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Toggle_Button_State);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Shadow_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Show_Arrows);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Show_Value);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Slider_Mark);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Slider_Visual);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Sliding_Mode);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Spatial_Include_Model);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Spatial_Resize_Model);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Spatial_Snap_Model);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Spatial_Style);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Spin_Box_Child_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_String_Direction);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Tab_List);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Tear_Off_Model);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Text_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Toggle_Mode);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Unit_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Unpost_Behavior);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Vertical_Alignment);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_View_Type);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Visual_Emphasis);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Visual_Policy);


   procedure Xt_Set_Arg (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
                         Name  : in     Xt.Xt_Resource_Name_String;
                         Value : in     Xm_Which_Button);


private

   pragma Inline (Xt_Set_Arg);

end Xm.Resource_Management;
