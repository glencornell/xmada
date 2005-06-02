-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib, Xt_Stringdefs;

package Xm_String_Defs is
    Copyright_Notice : constant String :=
       "(C) Copyright 1991, 1993 Systems Engineering Research Corporation.  " &
	  "All Rights Reserved.";

    -- resource for Mrm
    Mrm_N_Create_Callback : constant String := "createCallback" & Ascii.Nul;

    -- Xm resources
--    Xm_N_Accelerator : constant String := "accelerator" & Ascii.Nul;
--    Xm_N_Accelerator_Text : constant String := "acceleratorText" & Ascii.Nul;
--    Xm_N_Accelerators : constant String := "accelerators" & Ascii.Nul;
--    Xm_N_Activate_Callback : constant String := "activateCallback" & Ascii.Nul;
--    Xm_N_Adjust_Last : constant String := "adjustLast" & Ascii.Nul;
--    Xm_N_Adjust_Margin : constant String := "adjustMargin" & Ascii.Nul;
--    Xm_N_Alignment : constant String := "alignment" & Ascii.Nul;
--    Xm_N_Allow_Overlap : constant String := "allowOverlap" & Ascii.Nul;
--    Xm_N_Allow_Resize : constant String := "allowResize" & Ascii.Nul;
--    Xm_N_Allow_Shell_Resize : constant String := "allowShellResize" & Ascii.Nul;
--    Xm_N_Ancestor_Sensitive : constant String :=
--       "ancestorSensitive" & Ascii.Nul;
--    Xm_N_Animation_Mask : constant String := "animationMask" & Ascii.Nul;
--    Xm_N_Animation_Pixmap : constant String := "animationPixmap" & Ascii.Nul;
--    Xm_N_Animation_Pixmap_Depth : constant String :=
--       "animationPixmapDepth" & Ascii.Nul;
--    Xm_N_Animation_Style : constant String := "animationStyle" & Ascii.Nul;
--    Xm_N_Apply_Callback : constant String := "applyCallback" & Ascii.Nul;
--    Xm_N_Apply_Label_String : constant String := "applyLabelString" & Ascii.Nul;
--    Xm_N_Argc : constant String := "argc" & Ascii.Nul;
--    Xm_N_Argv : constant String := "argv" & Ascii.Nul;
--    Xm_N_Arm_Callback : constant String := "armCallback" & Ascii.Nul;
--    Xm_N_Arm_Color : constant String := "armColor" & Ascii.Nul;
--    Xm_N_Arm_Pixmap : constant String := "armPixmap" & Ascii.Nul;
--    Xm_N_Arrow_Direction : constant String := "arrowDirection" & Ascii.Nul;
--    Xm_N_Attachment : constant String := "attachment" & Ascii.Nul;
--    Xm_N_Audible_Warning : constant String := "audibleWarning" & Ascii.Nul;
--
--    Xm_N_Auto_Show_Cursor_Position : constant String :=
--       "autoShowCursorPosition" & Ascii.Nul;
--    Xm_N_Auto_Unmanage : constant String := "autoUnmanage" & Ascii.Nul;
--    Xm_N_Automatic_Selection : constant String :=
--       "automaticSelection" & Ascii.Nul;
    Xm_N_Availability : constant String := "availability" & Ascii.Nul;
--
--    Xm_N_Background : constant String := "background" & Ascii.Nul;
--    Xm_N_Background_Pixmap : constant String := "backgroundPixmap" & Ascii.Nul;
--
--    Xm_N_Base_Height : constant String := Xt_Stringdefs.Xt_N_Base_Height;
--    Xm_N_Base_Width : constant String := Xt_Stringdefs.Xt_N_Base_Width;
--
    Xm_N_Bitmap : constant String := "bitmap" & Ascii.Nul;
--    Xm_N_Blend_Model : constant String := "blendModel" & Ascii.Nul;
--    Xm_N_Blink_Rate : constant String := "blinkRate" & Ascii.Nul;
    Xm_N_Border : constant String := "borderColor" & Ascii.Nul;
--    Xm_N_Border_Color : constant String := "borderColor" & Ascii.Nul;
--    Xm_N_Border_Pixmap : constant String := "borderPixmap" & Ascii.Nul;
--    Xm_N_Border_Width : constant String := "borderWidth" & Ascii.Nul;
--
--    Xm_N_Bottom_Attachment : constant String := "bottomAttachment" & Ascii.Nul;
--    Xm_N_Bottom_Offset : constant String := "bottomOffset" & Ascii.Nul;
--    Xm_N_Bottom_Position : constant String := "bottomPosition" & Ascii.Nul;
--    Xm_N_Bottom_Shadow_Color : constant String :=
--       "bottomShadowColor" & Ascii.Nul;
--    Xm_N_Bottom_Shadow_Pixmap : constant String :=
--       "bottomShadowPixmap" & Ascii.Nul;
--    Xm_N_Bottom_Widget : constant String := "bottomWidget" & Ascii.Nul;
--    Xm_N_Browse_Selection_Callback : constant String :=
--       "browseSelectionCallback" & Ascii.Nul;
--    Xm_N_Button_Accelerator_Text : constant String :=
--       "buttonAcceleratorText" & Ascii.Nul;
--    Xm_N_Button_Accelerators : constant String :=
--       "buttonAccelerators" & Ascii.Nul;
--    Xm_N_Button_Count : constant String := "buttonCount" & Ascii.Nul;
--    Xm_N_Button_Font_List : constant String := "buttonFontList" & Ascii.Nul;
--    Xm_N_Button_Mnemonic_Char_Sets : constant String :=
--       "buttonMnemonicCharSets" & Ascii.Nul;
--    Xm_N_Button_Mnemonics : constant String := "buttonMnemonics" & Ascii.Nul;
--    Xm_N_Button_Set : constant String := "buttonSet" & Ascii.Nul;
--    Xm_N_Button_Type : constant String := "buttonType" & Ascii.Nul;
--    Xm_N_Buttons : constant String := "buttons" & Ascii.Nul;
    Xm_N_Callback : constant String := Xt_Stringdefs.Xt_N_Callback;
--    Xm_N_Cancel_Button : constant String := "cancelButton" & Ascii.Nul;
--    Xm_N_Cancel_Callback : constant String := "cancelCallback" & Ascii.Nul;
--    Xm_N_Cancel_Label_String : constant String :=
--       "cancelLabelString" & Ascii.Nul;
--    Xm_N_Cascade_Pixmap : constant String := "cascadePixmap" & Ascii.Nul;
--    Xm_N_Cascading_Callback : constant String :=
--       "cascadingCallback" & Ascii.Nul;
--    Xm_N_Child_Horizontal_Alignment : constant String :=
--       "childHorizontalAlignment" & Ascii.Nul;
--    Xm_N_Child_Horizontal_Spacing : constant String :=
--       "childHorizontalSpacing" & Ascii.Nul;
--    Xm_N_Child_Placement : constant String := "childPlacement" & Ascii.Nul;
    Xm_N_Child_Position : constant String := "childPosition" & Ascii.Nul;
--    Xm_N_Child_Type : constant String := "childType" & Ascii.Nul;
--    Xm_N_Child_Vertical_Alignment : constant String :=
--       "childVerticalAlignment" & Ascii.Nul;
--    Xm_N_Children : constant String := "children" & Ascii.Nul;
--    Xm_N_Client_Data : constant String := "clientData" & Ascii.Nul;
--    Xm_N_Clip_Window : constant String := "clipWindow" & Ascii.Nul;
--    Xm_N_Colormap : constant String := "colormap" & Ascii.Nul;
--    Xm_N_Columns : constant String := "columns" & Ascii.Nul;
--    Xm_N_Command : constant String := "command" & Ascii.Nul;
--    Xm_N_Command_Entered_Callback : constant String :=
--       "commandEnteredCallback" & Ascii.Nul;
--    Xm_N_Command_Changed_Callback : constant String :=
--       "commandChangedCallback" & Ascii.Nul;
--    Xm_N_Command_Window : constant String := "commandWindow" & Ascii.Nul;
--    Xm_N_Command_Window_Location : constant String :=
--       "commandWindowLocation" & Ascii.Nul;
--    Xm_N_Convert_Proc : constant String := "convertProc" & Ascii.Nul;
--    Xm_N_Create_Popup_Child_Proc : constant String :=
--       "createPopupChildProc" & Ascii.Nul;
--    Xm_N_Cursor_Background : constant String := "cursorBackground" & Ascii.Nul;
--    Xm_N_Cursor_Foreground : constant String := "cursorForeground" & Ascii.Nul;
--    Xm_N_Cursor_Position : constant String := "cursorPosition" & Ascii.Nul;
--    Xm_N_Cursor_Position_Visible : constant String :=
--       "cursorPositionVisible" & Ascii.Nul;
--    Xm_N_Dark_Threshold : constant String := "darkThreshold" & Ascii.Nul;
--    Xm_N_Decimal_Points : constant String := "decimalPoints" & Ascii.Nul;
--    Xm_N_Decrement_Callback : constant String :=
--       "decrementCallback" & Ascii.Nul;
--    Xm_N_Default_Action_Callback : constant String :=
--       "defaultActionCallback" & Ascii.Nul;
--    Xm_N_Default_Button : constant String := "defaultButton" & Ascii.Nul;
--    Xm_N_Default_Button_Shadow_Thickness : constant String :=
--       "defaultButtonShadowThickness" & Ascii.Nul;
--    Xm_N_Default_Button_Type : constant String :=
--       "defaultButtonType" & Ascii.Nul;
--    Xm_N_Default_Font_List : constant String := "defaultFontList" & Ascii.Nul;
--    Xm_N_Default_None_Cursor_Icon : constant String :=
--       "defaultNoneCursorIcon" & Ascii.Nul;
--    Xm_N_Default_Position : constant String := "defaultPosition" & Ascii.Nul;
--    Xm_N_Default_Valid_Cursor_Icon : constant String :=
--       "defaultValidCursorIcon" & Ascii.Nul;
--    Xm_N_Default_Invalid_Cursor_Icon : constant String :=
--       "defaultInvalidCursorIcon" & Ascii.Nul;
--    Xm_N_Default_Move_Cursor_Icon : constant String :=
--       "defaultMoveCursorIcon" & Ascii.Nul;
--    Xm_N_Default_Copy_Cursor_Icon : constant String :=
--       "defaultCopyCursorIcon" & Ascii.Nul;
--    Xm_N_Default_Link_Cursor_Icon : constant String :=
--       "defaultLinkCursorIcon" & Ascii.Nul;
--    Xm_N_Default_Source_Cursor_Icon : constant String :=
--       "defaultSourceCursorIcon" & Ascii.Nul;
--    Xm_N_Delete_Response : constant String := "deleteResponse" & Ascii.Nul;
--    Xm_N_Depth : constant String := "depth" & Ascii.Nul;
    Xm_N_Desktop_Parent : constant String := "desktopParent" & Ascii.Nul;
--    Xm_N_Destroy_Callback : constant String := "destroyCallback" & Ascii.Nul;
--    Xm_N_Dialog_Style : constant String := "dialogStyle" & Ascii.Nul;
--    Xm_N_Dialog_Title : constant String := "dialogTitle" & Ascii.Nul;
--    Xm_N_Dialog_Type : constant String := "dialogType" & Ascii.Nul;
--    Xm_N_Dir_List_Item_Count : constant String :=
--       "dirListItemCount" & Ascii.Nul;
--    Xm_N_Dir_List_Items : constant String := "dirListItems" & Ascii.Nul;
--    Xm_N_Dir_List_Label_String : constant String :=
--       "dirListLabelString" & Ascii.Nul;
--    Xm_N_Dir_Mask : constant String := "dirMask" & Ascii.Nul;
--    Xm_N_Dir_Search_Proc : constant String := "dirSearchProc" & Ascii.Nul;
--    Xm_N_Dir_Spec : constant String := "dirSpec" & Ascii.Nul;
--    Xm_N_Directory : constant String := "directory" & Ascii.Nul;
--    Xm_N_Directory_Valid : constant String := "directoryValid" & Ascii.Nul;
--    Xm_N_Disarm_Callback : constant String := "disarmCallback" & Ascii.Nul;
--    Xm_N_Double_Click_Interval : constant String :=
--       "doubleClickInterval" & Ascii.Nul;
--    Xm_N_Drag_Callback : constant String := "dragCallback" & Ascii.Nul;
    Xm_N_Drag_Context_Class : constant String := "dragContextClass" & Ascii.Nul;
--    Xm_N_Drag_Drop_Finish_Callback : constant String :=
--       "dragDropFinishCallback" & Ascii.Nul;
    Xm_N_Drag_Icon_Class : constant String := "dragIconClass" & Ascii.Nul;
--    Xm_N_Drag_Initiator_Protocol_Style : constant String :=
--       "dragInitiatorProtocolStyle" & Ascii.Nul;
--    Xm_N_Drag_Motion_Callback : constant String :=
--       "dragMotionCallback" & Ascii.Nul;
--    Xm_N_Drag_Operations : constant String := "dragOperations" & Ascii.Nul;
    Xm_N_Drag_Over_Mode : constant String := "dragOverMode" & Ascii.Nul;
--    Xm_N_Drag_Proc : constant String := "dragProc" & Ascii.Nul;
--    Xm_N_Drag_Receiver_Protocol_Style : constant String :=
--       "dragReceiverProtocolStyle" & Ascii.Nul;
--    Xm_N_Drop_Finish_Callback : constant String :=
--       "dropFinishCallback" & Ascii.Nul;
--    Xm_N_Drop_Proc : constant String := "dropProc" & Ascii.Nul;
--    Xm_N_Drop_Rectangles : constant String := "dropRectangles" & Ascii.Nul;
--    Xm_N_Drop_Site_Activity : constant String := "dropSiteActivity" & Ascii.Nul;
--    Xm_N_Drop_Site_Enter_Callback : constant String :=
--       "dropSiteEnterCallback" & Ascii.Nul;
--    Xm_N_Drop_Site_Leave_Callback : constant String :=
--       "dropSiteLeaveCallback" & Ascii.Nul;
    Xm_N_Drop_Site_Manager_Class : constant String :=
       "dropSiteManagerClass" & Ascii.Nul;
--    Xm_N_Drop_Site_Operations : constant String :=
--       "dropSiteOperations" & Ascii.Nul;
--    Xm_N_Drop_Site_Type : constant String := "dropSiteType" & Ascii.Nul;
--    Xm_N_Drop_Start_Callback : constant String :=
--       "dropStartCallback" & Ascii.Nul;
    Xm_N_Drop_Transfer_Class : constant String :=
       "dropTransferClass" & Ascii.Nul;
--    Xm_N_Drop_Transfers : constant String := "dropTransfers" & Ascii.Nul;
--    Xm_N_Edit_Mode : constant String := "editMode" & Ascii.Nul;
    Xm_N_Edit_Type : constant String := "editType" & Ascii.Nul;
--    Xm_N_Editable : constant String := "editable" & Ascii.Nul;
--    Xm_N_Entry_Alignment : constant String := "entryAlignment" & Ascii.Nul;
--    Xm_N_Entry_Border : constant String := "entryBorder" & Ascii.Nul;
--    Xm_N_Entry_Callback : constant String := "entryCallback" & Ascii.Nul;
--    Xm_N_Entry_Class : constant String := "entryClass" & Ascii.Nul;
--    Xm_N_Entry_Vertical_Alignment : constant String :=
--       "entryVerticalAlignment" & Ascii.Nul;
--    Xm_N_Export_Targets : constant String := "exportTargets" & Ascii.Nul;
--    Xm_N_Expose_Callback : constant String := "exposeCallback" & Ascii.Nul;
--    Xm_N_Extended_Selection_Callback : constant String :=
--       "extendedSelectionCallback" & Ascii.Nul;
    Xm_N_Extension_Type : constant String := "extensionType" & Ascii.Nul;
    Xm_N_File : constant String := "file" & Ascii.Nul;
--    Xm_N_File_List_Item_Count : constant String :=
--       "fileListItemCount" & Ascii.Nul;
--    Xm_N_File_List_Items : constant String := "fileListItems" & Ascii.Nul;
--    Xm_N_File_List_Label_String : constant String :=
--       "fileListLabelString" & Ascii.Nul;
--    Xm_N_File_Search_Proc : constant String := "fileSearchProc" & Ascii.Nul;
--    Xm_N_File_Type_Mask : constant String := "fileTypeMask" & Ascii.Nul;
--    Xm_N_Fill_On_Arm : constant String := "fillOnArm" & Ascii.Nul;
--    Xm_N_Fill_On_Select : constant String := "fillOnSelect" & Ascii.Nul;
--    Xm_N_Filter_Label_String : constant String :=
--       "filterLabelString" & Ascii.Nul;
--    Xm_N_Focus_Callback : constant String := "focusCallback" & Ascii.Nul;
    Xm_N_Focus_Moved_Callback : constant String :=
       "focusMovedCallback" & Ascii.Nul;
    Xm_N_Focus_Policy_Changed : constant String :=
       "focusPolicyChanged" & Ascii.Nul;
--    Xm_N_Font : constant String := "font" & Ascii.Nul;
--    Xm_N_Font_List : constant String := "fontList" & Ascii.Nul;
    Xm_N_Font_Set : constant String := Xt_Stringdefs.Xt_N_Font_Set;
    Xm_N_Force_Bars : constant String := "forceBars" & Ascii.Nul;
--    Xm_N_Foreground : constant String := "foreground" & Ascii.Nul;
--    Xm_N_Foreground_Threshold : constant String :=
--       "foregroundThreshold" & Ascii.Nul;
--    Xm_N_Fraction_Base : constant String := "fractionBase" & Ascii.Nul;
    Xm_N_Function : constant String := "function" & Ascii.Nul;
--    Xm_N_Gain_Primary_Callback : constant String :=
--       "gainPrimaryCallback" & Ascii.Nul;
--    Xm_N_Geometry : constant String := "geometry" & Ascii.Nul;
--    Xm_N_Height : constant String := "height" & Ascii.Nul;
--    Xm_N_Height_Inc : constant String := "heightInc" & Ascii.Nul;
--    Xm_N_Help_Callback : constant String := "helpCallback" & Ascii.Nul;
--    Xm_N_Help_Label_String : constant String := "helpLabelString" & Ascii.Nul;
    Xm_N_Highlight : constant String := "highlight" & Ascii.Nul;
--    Xm_N_Highlight_Color : constant String := "highlightColor" & Ascii.Nul;
--    Xm_N_Highlight_On_Enter : constant String := "highlightOnEnter" & Ascii.Nul;
--    Xm_N_Highlight_Pixmap : constant String := "highlightPixmap" & Ascii.Nul;
--    Xm_N_Highlight_Thickness : constant String :=
--       "highlightThickness" & Ascii.Nul;
--    Xm_N_History_Item_Count : constant String := "historyItemCount" & Ascii.Nul;
--    Xm_N_History_Items : constant String := "historyItems" & Ascii.Nul;
--    Xm_N_History_Max_Items : constant String := "historyMaxItems" & Ascii.Nul;
--    Xm_N_History_Visible_Item_Count : constant String :=
--       "historyVisibleItemCount" & Ascii.Nul;
--    Xm_N_Horizontal_Font_Unit : constant String :=
--       "horizontalFontUnit" & Ascii.Nul;
--    Xm_N_Horizontal_Scroll_Bar : constant String :=
--       "horizontalScrollBar" & Ascii.Nul;
--    Xm_N_Horizontal_Spacing : constant String :=
--       "horizontalSpacing" & Ascii.Nul;
--    Xm_N_Hot_X : constant String := "hotX" & Ascii.Nul;
--    Xm_N_Hot_Y : constant String := "hotY" & Ascii.Nul;
    Xm_N_Icc_Handle : constant String := "iccHandle" & Ascii.Nul;
--    Xm_N_Icon_Mask : constant String := "iconMask" & Ascii.Nul;
--    Xm_N_Icon_Name : constant String := "iconName" & Ascii.Nul;
--    Xm_N_Icon_Name_Encoding : constant String :=
--       Xt_Stringdefs.Xt_N_Icon_Name_Encoding;
--    Xm_N_Icon_Pixmap : constant String := "iconPixmap" & Ascii.Nul;
--    Xm_N_Icon_Window : constant String := "iconWindow" & Ascii.Nul;
--    Xm_N_Icon_X : constant String := "iconX" & Ascii.Nul;
--    Xm_N_Icon_Y : constant String := "iconY" & Ascii.Nul;
--    Xm_N_Iconic : constant String := "iconic" & Ascii.Nul;
--    Xm_N_Import_Targets : constant String := "importTargets" & Ascii.Nul;
--    Xm_N_Increment : constant String := "increment" & Ascii.Nul;
--    Xm_N_Increment_Callback : constant String :=
--       "incrementCallback" & Ascii.Nul;
--    Xm_N_Incremental : constant String := "incremental" & Ascii.Nul;
    Xm_N_Index : constant String := "index" & Ascii.Nul;
--    Xm_N_Indicator_On : constant String := "indicatorOn" & Ascii.Nul;
--    Xm_N_Indicator_Size : constant String := "indicatorSize" & Ascii.Nul;
--    Xm_N_Indicator_Type : constant String := "indicatorType" & Ascii.Nul;
--    Xm_N_Initial_Delay : constant String := "initialDelay" & Ascii.Nul;
--    Xm_N_Initial_Focus : constant String := "initialFocus" & Ascii.Nul;
    Xm_N_Initial_Resources_Persistent : constant String :=
       "initialResourcesPersistent" & Ascii.Nul;
--    Xm_N_Initial_State : constant String := "initialState" & Ascii.Nul;
    Xm_N_Inner_Height : constant String := "innerHeight" & Ascii.Nul;
    Xm_N_Inner_Width : constant String := "innerWidth" & Ascii.Nul;
    Xm_N_Inner_Window : constant String := "innerWindow" & Ascii.Nul;
--    Xm_N_Input : constant String := "input" & Ascii.Nul;
--    Xm_N_Input_Callback : constant String := "inputCallback" & Ascii.Nul;
    Xm_N_Input_Create : constant String := "inputCreate" & Ascii.Nul;
--    Xm_N_Input_Method : constant String := "inputMethod" & Ascii.Nul;
--    Xm_N_Insert_Position : constant String := "insertPosition" & Ascii.Nul;
    Xm_N_Internal_Height : constant String := "internalHeight" & Ascii.Nul;
    Xm_N_Internal_Width : constant String := "internalWidth" & Ascii.Nul;
--    Xm_N_Invalid_Cursor_Foreground : constant String :=
--       "invalidCursorForeground" & Ascii.Nul;
--    Xm_N_Is_Aligned : constant String := "isAligned" & Ascii.Nul;
--    Xm_N_Is_Homogeneous : constant String := "isHomogeneous" & Ascii.Nul;
--    Xm_N_Item_Count : constant String := "itemCount" & Ascii.Nul;
--    Xm_N_Items : constant String := "items" & Ascii.Nul;
    Xm_N_Jump_Proc : constant String := "jumpProc" & Ascii.Nul;
    Xm_N_Justify : constant String := "justify" & Ascii.Nul;
--    Xm_N_Keyboard_Focus_Policy : constant String :=
--       "keyboardFocusPolicy" & Ascii.Nul;
--    Xm_N_Label_Font_List : constant String := "labelFontList" & Ascii.Nul;
--    Xm_N_Label_Insensitive_Pixmap : constant String :=
--       "labelInsensitivePixmap" & Ascii.Nul;
--    Xm_N_Label_Pixmap : constant String := "labelPixmap" & Ascii.Nul;
--    Xm_N_Label_String : constant String := "labelString" & Ascii.Nul;
--    Xm_N_Label_Type : constant String := "labelType" & Ascii.Nul;
--    Xm_N_Left_Attachment : constant String := "leftAttachment" & Ascii.Nul;
--    Xm_N_Left_Offset : constant String := "leftOffset" & Ascii.Nul;
--    Xm_N_Left_Position : constant String := "leftPosition" & Ascii.Nul;
--    Xm_N_Left_Widget : constant String := "leftWidget" & Ascii.Nul;
    Xm_N_Length : constant String := "length" & Ascii.Nul;
--    Xm_N_Light_Threshold : constant String := "lightThreshold" & Ascii.Nul;
--    Xm_N_Line_Space : constant String := X_Lib.X_N_Line_Space;
--    Xm_N_List_Item_Count : constant String := "listItemCount" & Ascii.Nul;
--    Xm_N_List_Items : constant String := "listItems" & Ascii.Nul;
--    Xm_N_List_Label_String : constant String := "listLabelString" & Ascii.Nul;
--    Xm_N_List_Margin_Height : constant String := "listMarginHeight" & Ascii.Nul;
--    Xm_N_List_Margin_Width : constant String := "listMarginWidth" & Ascii.Nul;
--    Xm_N_List_Size_Policy : constant String := "listSizePolicy" & Ascii.Nul;
--    Xm_N_List_Spacing : constant String := "listSpacing" & Ascii.Nul;
--    Xm_N_List_Updated : constant String := "listUpdated" & Ascii.Nul;
--    Xm_N_List_Visible_Item_Count : constant String :=
--       "listVisibleItemCount" & Ascii.Nul;
    Xm_N_Logical_Parent : constant String := "logicalParent" & Ascii.Nul;
--    Xm_N_Lose_Primary_Callback : constant String :=
--       "losePrimaryCallback" & Ascii.Nul;
--    Xm_N_Losing_Focus_Callback : constant String :=
--       "losingFocusCallback" & Ascii.Nul;
    Xm_N_Lower_Right : constant String := "lowerRight" & Ascii.Nul;
--    Xm_N_Main_Window_Margin_Height : constant String :=
--       "mainWindowMarginHeight" & Ascii.Nul;
--    Xm_N_Main_Window_Margin_Width : constant String :=
--       "mainWindowMarginWidth" & Ascii.Nul;
--    Xm_N_Map_Callback : constant String := "mapCallback" & Ascii.Nul;
--    Xm_N_Mapped_When_Managed : constant String :=
--       "mappedWhenManaged" & Ascii.Nul;
--    Xm_N_Mapping_Delay : constant String := "mappingDelay" & Ascii.Nul;
--    Xm_N_Margin : constant String := "margin" & Ascii.Nul;
--    Xm_N_Margin_Bottom : constant String := "marginBottom" & Ascii.Nul;
--    Xm_N_Margin_Height : constant String := "marginHeight" & Ascii.Nul;
--    Xm_N_Margin_Left : constant String := "marginLeft" & Ascii.Nul;
--    Xm_N_Margin_Right : constant String := "marginRight" & Ascii.Nul;
--    Xm_N_Margin_Top : constant String := "marginTop" & Ascii.Nul;
--    Xm_N_Margin_Width : constant String := "marginWidth" & Ascii.Nul;
--    Xm_N_Mask : constant String := "mask" & Ascii.Nul;
--    Xm_N_Max_Aspect_X : constant String := "maxAspectX" & Ascii.Nul;
--    Xm_N_Max_Aspect_Y : constant String := "maxAspectY" & Ascii.Nul;
--    Xm_N_Max_Height : constant String := "maxHeight" & Ascii.Nul;
--    Xm_N_Max_Length : constant String := "maxLength" & Ascii.Nul;
--    Xm_N_Max_Width : constant String := "maxWidth" & Ascii.Nul;
--    Xm_N_Maximum : constant String := "maximum" & Ascii.Nul;
--    Xm_N_Menu_Accelerator : constant String := "menuAccelerator" & Ascii.Nul;
--    Xm_N_Menu_Bar : constant String := "menuBar" & Ascii.Nul;
--    Xm_N_Menu_Cursor : constant String := "menuCursor" & Ascii.Nul;
    Xm_N_Menu_Entry : constant String := "menuEntry" & Ascii.Nul;
--    Xm_N_Menu_Help_Widget : constant String := "menuHelpWidget" & Ascii.Nul;
--    Xm_N_Menu_History : constant String := "menuHistory" & Ascii.Nul;
--    Xm_N_Menu_Post : constant String := "menuPost" & Ascii.Nul;
--    Xm_N_Message_Alignment : constant String := "messageAlignment" & Ascii.Nul;
    Xm_N_Message_Proc : constant String := "messageProc" & Ascii.Nul;
--    Xm_N_Message_String : constant String := "messageString" & Ascii.Nul;
--    Xm_N_Message_Window : constant String := "messageWindow" & Ascii.Nul;
--    Xm_N_Min_Aspect_X : constant String := "minAspectX" & Ascii.Nul;
--    Xm_N_Min_Aspect_Y : constant String := "minAspectY" & Ascii.Nul;
--    Xm_N_Min_Height : constant String := "minHeight" & Ascii.Nul;
--    Xm_N_Min_Width : constant String := "minWidth" & Ascii.Nul;
--    Xm_N_Minimize_Buttons : constant String := "minimizeButtons" & Ascii.Nul;
--    Xm_N_Minimum : constant String := "minimum" & Ascii.Nul;
--    Xm_N_Mnemonic : constant String := "mnemonic" & Ascii.Nul;
--    Xm_N_Mnemonic_Char_Set : constant String := "mnemonicCharSet" & Ascii.Nul;
--    Xm_N_Modify_Verify_Callback : constant String :=
--       "modifyVerifyCallback" & Ascii.Nul;
--    Xm_N_Modify_Verify_Callback_Wcs : constant String :=
--       "modifyVerifyCallbackWcs" & Ascii.Nul;
--    Xm_N_Motion_Verify_Callback : constant String :=
--       "motionVerifyCallback" & Ascii.Nul;
--    Xm_N_Move_Opaque : constant String := "moveOpaque" & Ascii.Nul;
--    Xm_N_Multi_Click : constant String := "multiClick" & Ascii.Nul;
--    Xm_N_Multiple_Selection_Callback : constant String :=
--       "multipleSelectionCallback" & Ascii.Nul;
--    Xm_N_Must_Match : constant String := "mustMatch" & Ascii.Nul;
--    Xm_N_Mwm_Decorations : constant String := "mwmDecorations" & Ascii.Nul;
--    Xm_N_Mwm_Functions : constant String := "mwmFunctions" & Ascii.Nul;
--    Xm_N_Mwm_Inputmode : constant String := "mwmInputMode" & Ascii.Nul;
--    Xm_N_Mwm_Menu : constant String := "mwmMenu" & Ascii.Nul;
    Xm_N_Mwm_Messages : constant String := "mwmMessages" & Ascii.Nul;
    Xm_N_Name : constant String := "name" & Ascii.Nul;
--    Xm_N_Navigation_Type : constant String := "navigationType" & Ascii.Nul;
    Xm_N_Needs_Motion : constant String := "needsMotion" & Ascii.Nul;
--    Xm_N_No_Match_Callback : constant String := "noMatchCallback" & Ascii.Nul;
--    Xm_N_No_Match_String : constant String := "noMatchString" & Ascii.Nul;
--    Xm_N_No_Resize : constant String := "noResize" & Ascii.Nul;
--    Xm_N_None_Cursor_Foreground : constant String :=
--       "noneCursorForeground" & Ascii.Nul;
    Xm_N_Notify : constant String := "notify" & Ascii.Nul;
    Xm_N_Notify_Proc : constant String := "notifyProc" & Ascii.Nul;
--    Xm_N_Num_Children : constant String := "numChildren" & Ascii.Nul;
--    Xm_N_Num_Columns : constant String := "numColumns" & Ascii.Nul;
--    Xm_N_Num_Drop_Rectangles : constant String :=
--       "numDropRectangles" & Ascii.Nul;
--    Xm_N_Num_Drop_Transfers : constant String := "numDropTransfers" & Ascii.Nul;
--    Xm_N_Num_Export_Targets : constant String := "numExportTargets" & Ascii.Nul;
--    Xm_N_Num_Import_Targets : constant String := "numImportTargets" & Ascii.Nul;
    Xm_N_Num_Rectangles : constant String := "numRectangles" & Ascii.Nul;
--    Xm_N_Offset_X : constant String := "offsetX" & Ascii.Nul;
--    Xm_N_Offset_Y : constant String := "offsetY" & Ascii.Nul;
--    Xm_N_Ok_Callback : constant String := "okCallback" & Ascii.Nul;
--    Xm_N_Ok_Label_String : constant String := "okLabelString" & Ascii.Nul;
--    Xm_N_Operation_Changed_Callback : constant String :=
--       "operationChangedCallback" & Ascii.Nul;
--    Xm_N_Operation_Cursor_Icon : constant String :=
--       "operationCursorIcon" & Ascii.Nul;
--    Xm_N_Option_Label : constant String := "optionLabel" & Ascii.Nul;
--    Xm_N_Option_Mnemonic : constant String := "optionMnemonic" & Ascii.Nul;
--    Xm_N_Orientation : constant String := "orientation" & Ascii.Nul;
    Xm_N_Output_Create : constant String := "outputCreate" & Ascii.Nul;
--    Xm_N_Override_Redirect : constant String := "overrideRedirect" & Ascii.Nul;
--    Xm_N_Packing : constant String := "packing" & Ascii.Nul;
--    Xm_N_Page_Decrement_Callback : constant String :=
--       "pageDecrementCallback" & Ascii.Nul;
--    Xm_N_Page_Increment : constant String := "pageIncrement" & Ascii.Nul;
--    Xm_N_Page_Increment_Callback : constant String :=
--       "pageIncrementCallback" & Ascii.Nul;
--    Xm_N_Pane_Maximum : constant String := "paneMaximum" & Ascii.Nul;
--    Xm_N_Pane_Minimum : constant String := "paneMinimum" & Ascii.Nul;
    Xm_N_Parameter : constant String := "parameter" & Ascii.Nul;
--    Xm_N_Pattern : constant String := "pattern" & Ascii.Nul;
--    Xm_N_Pending_Delete : constant String := "pendingDelete" & Ascii.Nul;
--    Xm_N_Pixmap : constant String := Xt_Stringdefs.Xt_N_Pixmap;
--    Xm_N_Popdown_Callback : constant String := "popdownCallback" & Ascii.Nul;
--    Xm_N_Popup_Callback : constant String := "popupCallback" & Ascii.Nul;
--    Xm_N_Popup_Enabled : constant String := "popupEnabled" & Ascii.Nul;
--    Xm_N_Position_Index : constant String := "positionIndex" & Ascii.Nul;
--    Xm_N_Post_From_Button : constant String := "postFromButton" & Ascii.Nul;
    Xm_N_Post_From_Count : constant String := "postFromCount" & Ascii.Nul;
    Xm_N_Post_From_List : constant String := "postFromList" & Ascii.Nul;
--    Xm_N_Preedit_Type : constant String := "preeditType" & Ascii.Nul;
--    Xm_N_Processing_Direction : constant String :=
--       "processingDirection" & Ascii.Nul;
--    Xm_N_Prompt_String : constant String := "promptString" & Ascii.Nul;
    Xm_N_Protocol_Callback : constant String := "protocolCallback" & Ascii.Nul;
--    Xm_N_Push_Button_Enabled : constant String :=
--       "pushButtonEnabled" & Ascii.Nul;
--    Xm_N_Qualify_Search_Data_Proc : constant String :=
--       "qualifySearchDataProc" & Ascii.Nul;
--    Xm_N_Radio_Always_One : constant String := "radioAlwaysOne" & Ascii.Nul;
--    Xm_N_Radio_Behavior : constant String := "radioBehavior" & Ascii.Nul;
    Xm_N_Realize_Callback : constant String := "realizeCallback" & Ascii.Nul;
--    Xm_N_Recompute_Size : constant String := "recomputeSize" & Ascii.Nul;
    Xm_N_Rectangles : constant String := "rectangles" & Ascii.Nul;
--    Xm_N_Refigure_Mode : constant String := "refigureMode" & Ascii.Nul;
--    Xm_N_Repeat_Delay : constant String := "repeatDelay" & Ascii.Nul;
--    Xm_N_Resizable : constant String := "resizable" & Ascii.Nul;
    Xm_N_Resize : constant String := "resize" & Ascii.Nul;
--    Xm_N_Resize_Callback : constant String := "resizeCallback" & Ascii.Nul;
--    Xm_N_Resize_Height : constant String := "resizeHeight" & Ascii.Nul;
--    Xm_N_Resize_Policy : constant String := "resizePolicy" & Ascii.Nul;
--    Xm_N_Resize_Width : constant String := "resizeWidth" & Ascii.Nul;
    Xm_N_Reverse_Video : constant String := "reverseVideo" & Ascii.Nul;
--    Xm_N_Right_Attachment : constant String := "rightAttachment" & Ascii.Nul;
--    Xm_N_Right_Offset : constant String := "rightOffset" & Ascii.Nul;
--    Xm_N_Right_Position : constant String := "rightPosition" & Ascii.Nul;
--    Xm_N_Right_Widget : constant String := "rightWidget" & Ascii.Nul;
--    Xm_N_Row_Column_Type : constant String := "rowColumnType" & Ascii.Nul;
--    Xm_N_Rows : constant String := "rows" & Ascii.Nul;
--    Xm_N_Rubber_Positioning : constant String :=
--       "rubberPositioning" & Ascii.Nul;
--    Xm_N_Sash_Height : constant String := "sashHeight" & Ascii.Nul;
--    Xm_N_Sash_Indent : constant String := "sashIndent" & Ascii.Nul;
--    Xm_N_Sash_Shadow_Thickness : constant String :=
--       "sashShadowThickness" & Ascii.Nul;
--    Xm_N_Sash_Width : constant String := "sashWidth" & Ascii.Nul;
--    Xm_N_Save_Under : constant String := "saveUnder" & Ascii.Nul;
--    Xm_N_Scale_Height : constant String := "scaleHeight" & Ascii.Nul;
--    Xm_N_Scale_Multiple : constant String := "scaleMultiple" & Ascii.Nul;
--    Xm_N_Scale_Width : constant String := "scaleWidth" & Ascii.Nul;
--    Xm_N_Screen : constant String := "screen" & Ascii.Nul;
--    Xm_N_Scroll_Bar_Display_Policy : constant String :=
--       "scrollBarDisplayPolicy" & Ascii.Nul;
--    Xm_N_Scroll_Bar_Placement : constant String :=
--       "scrollBarPlacement" & Ascii.Nul;
    Xm_N_Scroll_D_Cursor : constant String := "scrollDCursor" & Ascii.Nul;
    Xm_N_Scroll_H_Cursor : constant String := "scrollHCursor" & Ascii.Nul;
--    Xm_N_Scroll_Horizontal : constant String := "scrollHorizontal" & Ascii.Nul;
    Xm_N_Scroll_L_Cursor : constant String := "scrollLCursor" & Ascii.Nul;
--    Xm_N_Scroll_Left_Side : constant String := "scrollLeftSide" & Ascii.Nul;
    Xm_N_Scroll_Proc : constant String := "scrollProc" & Ascii.Nul;
    Xm_N_Scroll_R_Cursor : constant String := "scrollRCursor" & Ascii.Nul;
--    Xm_N_Scroll_Top_Side : constant String := "scrollTopSide" & Ascii.Nul;
    Xm_N_Scroll_U_Cursor : constant String := "scrollUCursor" & Ascii.Nul;
    Xm_N_Scroll_V_Cursor : constant String := "scrollVCursor" & Ascii.Nul;
--    Xm_N_Scroll_Vertical : constant String := "scrollVertical" & Ascii.Nul;
--    Xm_N_Scrolled_Window_Margin_Height : constant String :=
--       "scrolledWindowMarginHeight" & Ascii.Nul;
--    Xm_N_Scrolled_Window_Margin_Width : constant String :=
--       "scrolledWindowMarginWidth" & Ascii.Nul;
--    Xm_N_Scrolling_Policy : constant String := "scrollingPolicy" & Ascii.Nul;
--    Xm_N_Select_Color : constant String := "selectColor" & Ascii.Nul;
--    Xm_N_Select_Insensitive_Pixmap : constant String :=
--       "selectInsensitivePixmap" & Ascii.Nul;
--    Xm_N_Select_Pixmap : constant String := "selectPixmap" & Ascii.Nul;
--    Xm_N_Select_Threshold : constant String := "selectThreshold" & Ascii.Nul;
--    Xm_N_Selected_Item_Count : constant String :=
--       "selectedItemCount" & Ascii.Nul;
--    Xm_N_Selected_Items : constant String := "selectedItems" & Ascii.Nul;
    Xm_N_Selection : constant String := "selection" & Ascii.Nul;
--    Xm_N_Selection_Array : constant String := "selectionArray" & Ascii.Nul;
--    Xm_N_Selection_Array_Count : constant String :=
--       "selectionArrayCount" & Ascii.Nul;
--    Xm_N_Selection_Label_String : constant String :=
--       "selectionLabelString" & Ascii.Nul;
--    Xm_N_Selection_Policy : constant String := "selectionPolicy" & Ascii.Nul;
--    Xm_N_Sensitive : constant String := "sensitive" & Ascii.Nul;
--    Xm_N_Separator_On : constant String := "separatorOn" & Ascii.Nul;
--    Xm_N_Separator_Type : constant String := "separatorType" & Ascii.Nul;
--    Xm_N_Set : constant String := "set" & Ascii.Nul;
    Xm_N_Shadow : constant String := "shadow" & Ascii.Nul;
--    Xm_N_Shadow_Thickness : constant String := "shadowThickness" & Ascii.Nul;
--    Xm_N_Shadow_Type : constant String := "shadowType" & Ascii.Nul;
--    Xm_N_Shell_Unit_Type : constant String := "shellUnitType" & Ascii.Nul;
--    Xm_N_Show_Arrows : constant String := "showArrows" & Ascii.Nul;
--    Xm_N_Show_As_Default : constant String := "showAsDefault" & Ascii.Nul;
--    Xm_N_Show_Separator : constant String := "showSeparator" & Ascii.Nul;
--    Xm_N_Show_Value : constant String := "showValue" & Ascii.Nul;
    Xm_N_Shown : constant String := "shown" & Ascii.Nul;
--    Xm_N_Simple_Callback : constant String := "simpleCallback" & Ascii.Nul;
--    Xm_N_Single_Selection_Callback : constant String :=
--       "singleSelectionCallback" & Ascii.Nul;
    Xm_N_Size_Policy : constant String := "sizePolicy" & Ascii.Nul;
--    Xm_N_Skip_Adjust : constant String := "skipAdjust" & Ascii.Nul;
--    Xm_N_Slider_Size : constant String := "sliderSize" & Ascii.Nul;
--    Xm_N_Sliding_Mode : constant String := "slidingMode" & Ascii.Nul;
--    Xm_N_Source : constant String := "source" & Ascii.Nul;
--    Xm_N_Source_Cursor_Icon : constant String := "sourceCursorIcon" & Ascii.Nul;
    Xm_N_Source_Is_External : constant String := "sourceIsExternal" & Ascii.Nul;
--    Xm_N_Source_Pixmap_Icon : constant String := "sourcePixmapIcon" & Ascii.Nul;
    Xm_N_Source_Widget : constant String := "sourceWidget" & Ascii.Nul;
    Xm_N_Source_Window : constant String := "sourceWindow" & Ascii.Nul;
    Xm_N_Space : constant String := "space" & Ascii.Nul;
--    Xm_N_Spacing : constant String := "spacing" & Ascii.Nul;
--    Xm_N_Spot_Location : constant String := X_Lib.X_N_Spot_Location;
    Xm_N_Start_Time : constant String := "startTime" & Ascii.Nul;
--    Xm_N_State_Cursor_Icon : constant String := "stateCursorIcon" & Ascii.Nul;
    Xm_N_String : constant String := "string" & Ascii.Nul;
--    Xm_N_String_Direction : constant String := "stringDirection" & Ascii.Nul;
--    Xm_N_Sub_Menu_Id : constant String := "subMenuId" & Ascii.Nul;
--    Xm_N_Symbol_Pixmap : constant String := "symbolPixmap" & Ascii.Nul;
--    Xm_N_Tear_Off_Menu_Activate_Callback : constant String :=
--       "tearOffMenuActivateCallback" & Ascii.Nul;
--    Xm_N_Tear_Off_Menu_Deactivate_Callback : constant String :=
--       "tearOffMenuDeactivateCallback" & Ascii.Nul;
--    Xm_N_Tear_Off_Model : constant String := "tearOffModel" & Ascii.Nul;
--    Xm_N_Text_Accelerators : constant String := "textAccelerators" & Ascii.Nul;
--    Xm_N_Text_Columns : constant String := "textColumns" & Ascii.Nul;
--    Xm_N_Text_Font_List : constant String := "textFontList" & Ascii.Nul;
    Xm_N_Text_Options : constant String := "textOptions" & Ascii.Nul;
    Xm_N_Text_Sink : constant String := "textSink" & Ascii.Nul;
    Xm_N_Text_Source : constant String := "textSource" & Ascii.Nul;
--    Xm_N_Text_String : constant String := "textString" & Ascii.Nul;
--    Xm_N_Text_Translations : constant String := "textTranslations" & Ascii.Nul;
    Xm_N_Text_Value : constant String := "textValue" & Ascii.Nul;
    Xm_N_Thickness : constant String := "thickness" & Ascii.Nul;
    Xm_N_Thumb : constant String := "thumb" & Ascii.Nul;
    Xm_N_Thumb_Proc : constant String := "thumbProc" & Ascii.Nul;
--    Xm_N_Title : constant String := "title" & Ascii.Nul;
--    Xm_N_Title_Encoding : constant String := Xt_Stringdefs.Xt_N_Title_Encoding;
--    Xm_N_Title_String : constant String := "titleString" & Ascii.Nul;
--    Xm_N_To_Bottom_Callback : constant String := "toBottomCallback" & Ascii.Nul;
    Xm_N_To_Position_Callback : constant String :=
       "toPositionCallback" & Ascii.Nul;
--    Xm_N_To_Top_Callback : constant String := "toTopCallback" & Ascii.Nul;
    Xm_N_Top : constant String := "top" & Ascii.Nul;
--    Xm_N_Top_Attachment : constant String := "topAttachment" & Ascii.Nul;
--    Xm_N_Top_Character : constant String := "topCharacter" & Ascii.Nul;
--    Xm_N_Top_Item_Position : constant String := "topItemPosition" & Ascii.Nul;
--    Xm_N_Top_Level_Enter_Callback : constant String :=
--       "topLevelEnterCallback" & Ascii.Nul;
--    Xm_N_Top_Level_Leave_Callback : constant String :=
--       "topLevelLeaveCallback" & Ascii.Nul;
--    Xm_N_Top_Offset : constant String := "topOffset" & Ascii.Nul;
--    Xm_N_Top_Position : constant String := "topPosition" & Ascii.Nul;
--    Xm_N_Top_Shadow_Color : constant String := "topShadowColor" & Ascii.Nul;
--    Xm_N_Top_Shadow_Pixmap : constant String := "topShadowPixmap" & Ascii.Nul;
--    Xm_N_Top_Widget : constant String := "topWidget" & Ascii.Nul;
--    Xm_N_Transfer_Proc : constant String := "transferProc" & Ascii.Nul;
--    Xm_N_Transfer_Status : constant String := "transferStatus" & Ascii.Nul;
--    Xm_N_Transient : constant String := "transient" & Ascii.Nul;
--    Xm_N_Transient_For : constant String := Xt_Stringdefs.Xt_N_Transient_For;
--    Xm_N_Translations : constant String := "translations" & Ascii.Nul;
    Xm_N_Traversal_Callback : constant String :=
       "traversalCallback" & Ascii.Nul;
--    Xm_N_Traversal_On : constant String := "traversalOn" & Ascii.Nul;
    Xm_N_Traversal_Type : constant String := "traversalType" & Ascii.Nul;
--    Xm_N_Traverse_Obscured_Callback : constant String :=
--       "traverseObscuredCallback" & Ascii.Nul;
    Xm_N_Tree_Update_Proc : constant String := "treeUpdateProc" & Ascii.Nul;
--    Xm_N_Trough_Color : constant String := "troughColor" & Ascii.Nul;
--    Xm_N_Unit_Type : constant String := "unitType" & Ascii.Nul;
--    Xm_N_Unmap_Callback : constant String := "unmapCallback" & Ascii.Nul;
--    Xm_N_Unpost_Behavior : constant String := "unpostBehavior" & Ascii.Nul;
--    Xm_N_Unselect_Pixmap : constant String := "unselectPixmap" & Ascii.Nul;
    Xm_N_Update : constant String := "update" & Ascii.Nul;
    Xm_N_Update_Slider_Size : constant String := "updateSliderSize" & Ascii.Nul;
--    Xm_N_Use_Async_Geometry : constant String := "useAsyncGeometry" & Ascii.Nul;
    Xm_N_Use_Bottom : constant String := "useBottom" & Ascii.Nul;
    Xm_N_Use_Right : constant String := "useRight" & Ascii.Nul;
--    Xm_N_User_Data : constant String := "userData" & Ascii.Nul;
--    Xm_N_Valid_Cursor_Foreground : constant String :=
--       "validCursorForeground" & Ascii.Nul;
--    Xm_N_Value : constant String := "value" & Ascii.Nul;
--    Xm_N_Value_Changed_Callback : constant String :=
--       "valueChangedCallback" & Ascii.Nul;
--    Xm_N_Value_Wcs : constant String := "valueWcs" & Ascii.Nul;
--    Xm_N_Verify_Bell : constant String := "verifyBell" & Ascii.Nul;
--    Xm_N_Vertical_Font_Unit : constant String := "verticalFontUnit" & Ascii.Nul;
--    Xm_N_Vertical_Scroll_Bar : constant String :=
--       "verticalScrollBar" & Ascii.Nul;
--    Xm_N_Vertical_Spacing : constant String := "verticalSpacing" & Ascii.Nul;
--    Xm_N_Visible_Item_Count : constant String := "visibleItemCount" & Ascii.Nul;
--    Xm_N_Visible_When_Off : constant String := "visibleWhenOff" & Ascii.Nul;
--    Xm_N_Visual : constant String := Xt_Stringdefs.Xt_N_Visual;
--    Xm_N_Visual_Policy : constant String := "visualPolicy" & Ascii.Nul;
--    Xm_N_Wait_For_Wm : constant String := "waitforwm" & Ascii.Nul;
--    Xm_N_Which_Button : constant String := "whichButton" & Ascii.Nul;
--    Xm_N_Width : constant String := "width" & Ascii.Nul;
--    Xm_N_Width_Inc : constant String := "widthInc" & Ascii.Nul;
--    Xm_N_Win_Gravity : constant String := Xt_Stringdefs.Xt_N_Win_Gravity;
    Xm_N_Window : constant String := "window" & Ascii.Nul;
--    Xm_N_Window_Group : constant String := "windowGroup" & Ascii.Nul;
--    Xm_N_Wm_Timeout : constant String := "wmTimeout" & Ascii.Nul;
--    Xm_N_Word_Wrap : constant String := "wordWrap" & Ascii.Nul;
--    Xm_N_Work_Window : constant String := "workWindow" & Ascii.Nul;
--    Xm_N_X : constant String := "x" & Ascii.Nul;
--    Xm_N_Y : constant String := "y" & Ascii.Nul;

--Class types

    Xm_C_Accelerator : constant String := "Accelerator" & Ascii.Nul;
    Xm_C_Accelerator_Text : constant String := "AcceleratorText" & Ascii.Nul;
    Xm_C_Accelerators : constant String := "Accelerators" & Ascii.Nul;
    Xm_C_Adjust_Last : constant String := "AdjustLast" & Ascii.Nul;
    Xm_C_Adjust_Margin : constant String := "AdjustMargin" & Ascii.Nul;
    Xm_C_Alignment : constant String := "Alignment" & Ascii.Nul;
    Xm_C_Allow_Overlap : constant String := "AllowOverlap" & Ascii.Nul;
    Xm_C_Allow_Shell_Resize : constant String := "AllowShellResize" & Ascii.Nul;
    Xm_C_Animation_Mask : constant String := "AnimationMask" & Ascii.Nul;
    Xm_C_Animation_Pixmap : constant String := "AnimationPixmap" & Ascii.Nul;
    Xm_C_Animation_Pixmap_Depth : constant String :=
       "AnimationPixmapDepth" & Ascii.Nul;
    Xm_C_Animation_Style : constant String := "AnimationStyle" & Ascii.Nul;
    Xm_C_Apply_Label_String : constant String := "ApplyLabelString" & Ascii.Nul;
    Xm_C_Argc : constant String := "Argc" & Ascii.Nul;
    Xm_C_Argv : constant String := "Argv" & Ascii.Nul;
    Xm_C_Arm_Callback : constant String := "ArmCallback" & Ascii.Nul;
    Xm_C_Arm_Color : constant String := "ArmColor" & Ascii.Nul;
    Xm_C_Arm_Pixmap : constant String := "ArmPixmap" & Ascii.Nul;
    Xm_C_Arrow_Direction : constant String := "ArrowDirection" & Ascii.Nul;
    Xm_C_Attachment : constant String := "Attachment" & Ascii.Nul;
    Xm_C_Audible_Warning : constant String := "AudibleWarning" & Ascii.Nul;
    Xm_C_Auto_Show_Cursor_Position : constant String :=
       "AutoShowCursorPosition" & Ascii.Nul;
    Xm_C_Auto_Unmanage : constant String := "AutoUnmanage" & Ascii.Nul;
    Xm_C_Automatic_Selection : constant String :=
       "AutomaticSelection" & Ascii.Nul;
    Xm_C_Availability : constant String := "Availability" & Ascii.Nul;
    Xm_C_Background : constant String := "Background" & Ascii.Nul;
    Xm_C_Background_Pixmap : constant String := "BackgroundPixmap" & Ascii.Nul;
    Xm_C_Base_Height : constant String := Xt_Stringdefs.Xt_C_Base_Height;
    Xm_C_Base_Width : constant String := Xt_Stringdefs.Xt_C_Base_Width;
    Xm_C_Bitmap : constant String := "Bitmap" & Ascii.Nul;
    Xm_C_Blend_Model : constant String := "BlendModel" & Ascii.Nul;
    Xm_C_Blink_Rate : constant String := "BlinkRate" & Ascii.Nul;
    Xm_C_Boolean : constant String := "Boolean" & Ascii.Nul;
    Xm_C_Border_Color : constant String := "BorderColor" & Ascii.Nul;
    Xm_C_Border_Width : constant String := "BorderWidth" & Ascii.Nul;
    Xm_C_Bottom_Shadow_Color : constant String :=
       "BottomShadowColor" & Ascii.Nul;
    Xm_C_Bottom_Shadow_Pixmap : constant String :=
       "BottomShadowPixmap" & Ascii.Nul;
    Xm_C_Button_Accelerator_Text : constant String :=
       "ButtonAcceleratorText" & Ascii.Nul;
    Xm_C_Button_Accelerators : constant String :=
       "ButtonAccelerators" & Ascii.Nul;
    Xm_C_Button_Count : constant String := "ButtonCount" & Ascii.Nul;
    Xm_C_Button_Font_List : constant String := "ButtonFontList" & Ascii.Nul;
    Xm_C_Button_Mnemonic_Char_Sets : constant String :=
       "ButtonMnemonicCharSets" & Ascii.Nul;
    Xm_C_Button_Mnemonics : constant String := "ButtonMnemonics" & Ascii.Nul;
    Xm_C_Button_Set : constant String := "ButtonSet" & Ascii.Nul;
    Xm_C_Button_Type : constant String := "ButtonType" & Ascii.Nul;
    Xm_C_Buttons : constant String := "Buttons" & Ascii.Nul;
    Xm_C_Callback : constant String := "Callback" & Ascii.Nul;
    Xm_C_Cancel_Label_String : constant String :=
       "CancelLabelString" & Ascii.Nul;
    Xm_C_Child_Horizontal_Alignment : constant String :=
       "ChildHorizontalAlignment" & Ascii.Nul;
    Xm_C_Child_Horizontal_Spacing : constant String :=
       "ChildHorizontalSpacing" & Ascii.Nul;
    Xm_C_Child_Placement : constant String := "ChildPlacement" & Ascii.Nul;
    Xm_C_Child_Type : constant String := "ChildType" & Ascii.Nul;
    Xm_C_Child_Vertical_Alignment : constant String :=
       "ChildVerticalAlignment" & Ascii.Nul;
    Xm_C_Children : constant String := "Children" & Ascii.Nul;
    Xm_C_Client_Data : constant String := "ClientData" & Ascii.Nul;
    Xm_C_Clip_Window : constant String := "ClipWindow" & Ascii.Nul;
    Xm_C_Color : constant String := "Color" & Ascii.Nul;
    Xm_C_Colormap : constant String := "Colormap" & Ascii.Nul;
    Xm_C_Columns : constant String := "Columns" & Ascii.Nul;
    Xm_C_Command_Window : constant String := "CommandWindow" & Ascii.Nul;
    Xm_C_Command_Window_Location : constant String :=
       "CommandWindowLocation" & Ascii.Nul;
    Xm_C_Convert_Proc : constant String := "ConvertProc" & Ascii.Nul;
    Xm_C_Create_Popup_Child_Proc : constant String :=
       "CreatePopupChildProc" & Ascii.Nul;
    Xm_C_Cursor : constant String := "Cursor" & Ascii.Nul;
    Xm_C_Cursor_Background : constant String := "CursorBackground" & Ascii.Nul;
    Xm_C_Cursor_Foreground : constant String := "CursorForeground" & Ascii.Nul;
    Xm_C_Cursor_Position : constant String := "CursorPosition" & Ascii.Nul;
    Xm_C_Cursor_Position_Visible : constant String :=
       "CursorPositionVisible" & Ascii.Nul;
    Xm_C_Dark_Threshold : constant String := "DarkThreshold" & Ascii.Nul;
    Xm_C_Decimal_Points : constant String := "DecimalPoints" & Ascii.Nul;
    Xm_C_Default_Button_Shadow_Thickness : constant String :=
       "DefaultButtonShadowThickness" & Ascii.Nul;
    Xm_C_Default_Button_Type : constant String :=
       "DefaultButtonType" & Ascii.Nul;
    Xm_C_Default_Font_List : constant String := "DefaultFontList" & Ascii.Nul;
    Xm_C_Default_None_Cursor_Icon : constant String :=
       "DefaultNoneCursorIcon" & Ascii.Nul;
    Xm_C_Default_Position : constant String := "DefaultPosition" & Ascii.Nul;
    Xm_C_Default_Valid_Cursor_Icon : constant String :=
       "DefaultValidCursorIcon" & Ascii.Nul;
    Xm_C_Default_Invalid_Cursor_Icon : constant String :=
       "DefaultInvalidCursorIcon" & Ascii.Nul;
    Xm_C_Default_Move_Cursor_Icon : constant String :=
       "DefaultMoveCursorIcon" & Ascii.Nul;
    Xm_C_Default_Copy_Cursor_Icon : constant String :=
       "DefaultCopyCursorIcon" & Ascii.Nul;
    Xm_C_Default_Link_Cursor_Icon : constant String :=
       "DefaultLinkCursorIcon" & Ascii.Nul;
    Xm_C_Default_Source_Cursor_Icon : constant String :=
       "DefaultSourceCursorIcon" & Ascii.Nul;
    Xm_C_Delete_Response : constant String := "DeleteResponse" & Ascii.Nul;
    Xm_C_Depth : constant String := "Depth" & Ascii.Nul;
    Xm_C_Desktop_Parent : constant String := "DesktopParent" & Ascii.Nul;
    Xm_C_Dialog_Style : constant String := "DialogStyle" & Ascii.Nul;
    Xm_C_Dialog_Title : constant String := "DialogTitle" & Ascii.Nul;
    Xm_C_Dialog_Type : constant String := "DialogType" & Ascii.Nul;
    Xm_C_Dimension : constant String := "Dimension" & Ascii.Nul;
    Xm_C_Dir_List_Item_Count : constant String :=
       "DirListItemCount" & Ascii.Nul;
    Xm_C_Dir_List_Items : constant String := "DirListItems" & Ascii.Nul;
    Xm_C_Dir_List_Label_String : constant String :=
       "DirListLabelString" & Ascii.Nul;
    Xm_C_Dir_Mask : constant String := "DirMask" & Ascii.Nul;
    Xm_C_Dir_Search_Proc : constant String := "DirSearchProc" & Ascii.Nul;
    Xm_C_Dir_Spec : constant String := "DirSpec" & Ascii.Nul;
    Xm_C_Directory : constant String := "Directory" & Ascii.Nul;
    Xm_C_Directory_Valid : constant String := "DirectoryValid" & Ascii.Nul;
    Xm_C_Disarm_Callback : constant String := "DisarmCallback" & Ascii.Nul;
    Xm_C_Double_Click_Interval : constant String :=
       "DoubleClickInterval" & Ascii.Nul;
    Xm_C_Drag_Context_Class : constant String := "DragContextClass" & Ascii.Nul;
    Xm_C_Drag_Drop_Finish_Callback : constant String :=
       "DragDropFinishCallback" & Ascii.Nul;
    Xm_C_Drag_Icon_Class : constant String := "DragIconClass" & Ascii.Nul;
    Xm_C_Drag_Initiator_Protocol_Style : constant String :=
       "DragInitiatorProtocolStyle" & Ascii.Nul;
    Xm_C_Drag_Motion_Callback : constant String :=
       "DragMotionCallback" & Ascii.Nul;
    Xm_C_Drag_Operations : constant String := "DragOperations" & Ascii.Nul;
    Xm_C_Drag_Over_Mode : constant String := "DragOverMode" & Ascii.Nul;
    Xm_C_Drag_Proc : constant String := "DragProc" & Ascii.Nul;
    Xm_C_Drag_Receiver_Protocol_Style : constant String :=
       "DragReceiverProtocolStyle" & Ascii.Nul;
    Xm_C_Drop_Proc : constant String := "DropProc" & Ascii.Nul;
    Xm_C_Drop_Rectangles : constant String := "DropRectangles" & Ascii.Nul;
    Xm_C_Drop_Site_Activity : constant String := "DropSiteActivity" & Ascii.Nul;
    Xm_C_Drop_Site_Enter_Callback : constant String :=
       "DropSiteEnterCallback" & Ascii.Nul;
    Xm_C_Drop_Site_Leave_Callback : constant String :=
       "DropSiteLeaveCallback" & Ascii.Nul;
    Xm_C_Drop_Site_Manager_Class : constant String :=
       "DropSiteManagerClass" & Ascii.Nul;
    Xm_C_Drop_Site_Operations : constant String :=
       "DropSiteOperations" & Ascii.Nul;
    Xm_C_Drop_Site_Type : constant String := "DropSiteType" & Ascii.Nul;
    Xm_C_Drop_Start_Callback : constant String :=
       "DropStartCallback" & Ascii.Nul;
    Xm_C_Drop_Transfer_Class : constant String :=
       "DropTransferClass" & Ascii.Nul;
    Xm_C_Drop_Transfers : constant String := "DropTransfers" & Ascii.Nul;
    Xm_C_Edit_Mode : constant String := "EditMode" & Ascii.Nul;
    Xm_C_Edit_Type : constant String := "EditType" & Ascii.Nul;
    Xm_C_Editable : constant String := "Editable" & Ascii.Nul;
    Xm_C_Entry_Border : constant String := "EntryBorder" & Ascii.Nul;
    Xm_C_Entry_Class : constant String := "EntryClass" & Ascii.Nul;
    Xm_C_Event_Bindings : constant String := "EventBindings" & Ascii.Nul;
    Xm_C_Export_Targets : constant String := "ExportTargets" & Ascii.Nul;
    Xm_C_Expose_Callback : constant String := "ExposeCallback" & Ascii.Nul;
    Xm_C_File : constant String := "File" & Ascii.Nul;
    Xm_C_File_List_Item_Count : constant String :=
       "FileListItemCount" & Ascii.Nul;
    Xm_C_File_List_Items : constant String := "FileListItems" & Ascii.Nul;
    Xm_C_File_List_Label_String : constant String :=
       "FileListLabelString" & Ascii.Nul;
    Xm_C_File_Search_Proc : constant String := "FileSearchProc" & Ascii.Nul;
    Xm_C_File_Type_Mask : constant String := "FileTypeMask" & Ascii.Nul;
    Xm_C_Fill_On_Arm : constant String := "FillOnArm" & Ascii.Nul;
    Xm_C_Fill_On_Select : constant String := "FillOnSelect" & Ascii.Nul;
    Xm_C_Filter_Label_String : constant String :=
       "FilterLabelString" & Ascii.Nul;
    Xm_C_Font : constant String := "Font" & Ascii.Nul;
    Xm_C_Font_List : constant String := "FontList" & Ascii.Nul;
    Xm_C_Font_Set : constant String := Xt_Stringdefs.Xt_C_Font_Set;
    Xm_C_Foreground : constant String := "Foreground" & Ascii.Nul;
    Xm_C_Foreground_Threshold : constant String :=
       "ForegroundThreshold" & Ascii.Nul;
    Xm_C_Fraction : constant String := "Fraction" & Ascii.Nul;
    Xm_C_Function : constant String := "Function" & Ascii.Nul;
    Xm_C_Geometry : constant String := "Geometry" & Ascii.Nul;
    Xm_C_H_Space : constant String := "HSpace" & Ascii.Nul;
    Xm_C_Height : constant String := "Height" & Ascii.Nul;
    Xm_C_Height_Inc : constant String := "HeightInc" & Ascii.Nul;
    Xm_C_Help_Label_String : constant String := "HelpLabelString" & Ascii.Nul;
    Xm_C_Highlight_Color : constant String := "HighlightColor" & Ascii.Nul;
    Xm_C_Highlight_On_Enter : constant String := "HighlightOnEnter" & Ascii.Nul;
    Xm_C_Highlight_Pixmap : constant String := "HighlightPixmap" & Ascii.Nul;
    Xm_C_Highlight_Thickness : constant String :=
       "HighlightThickness" & Ascii.Nul;
    Xm_C_Horizontal_Font_Unit : constant String :=
       "HorizontalFontUnit" & Ascii.Nul;
    Xm_C_Horizontal_Scroll_Bar : constant String :=
       "HorizontalScrollBar" & Ascii.Nul;
    Xm_C_Hot : constant String := "Hot" & Ascii.Nul;
    Xm_C_Icc_Handle : constant String := "ICCHandle" & Ascii.Nul;
    Xm_C_Icon_Mask : constant String := "IconMask" & Ascii.Nul;
    Xm_C_Icon_Name : constant String := "IconName" & Ascii.Nul;
    Xm_C_Icon_Name_Encoding : constant String :=
       Xt_Stringdefs.Xt_C_Icon_Name_Encoding;
    Xm_C_Icon_Pixmap : constant String := "IconPixmap" & Ascii.Nul;
    Xm_C_Icon_Window : constant String := "IconWindow" & Ascii.Nul;
    Xm_C_Icon_X : constant String := "IconX" & Ascii.Nul;
    Xm_C_Icon_Y : constant String := "IconY" & Ascii.Nul;
    Xm_C_Iconic : constant String := "Iconic" & Ascii.Nul;
    Xm_C_Import_Targets : constant String := "ImportTargets" & Ascii.Nul;
    Xm_C_Increment : constant String := "Increment" & Ascii.Nul;
    Xm_C_Incremental : constant String := "Incremental" & Ascii.Nul;
    Xm_C_Index : constant String := "Index" & Ascii.Nul;
    Xm_C_Indicator_On : constant String := "IndicatorOn" & Ascii.Nul;
    Xm_C_Indicator_Size : constant String := "IndicatorSize" & Ascii.Nul;
    Xm_C_Indicator_Type : constant String := "IndicatorType" & Ascii.Nul;
    Xm_C_Initial_Delay : constant String := "InitialDelay" & Ascii.Nul;
    Xm_C_Initial_Focus : constant String := "InitialFocus" & Ascii.Nul;
    Xm_C_Initial_Resources_Persistent : constant String :=
       "InitialResourcesPersistent" & Ascii.Nul;
    Xm_C_Insert_Position : constant String := "InsertPosition" & Ascii.Nul;
    Xm_C_Initial_State : constant String := "InitialState" & Ascii.Nul;
    Xm_C_Input : constant String := "Input" & Ascii.Nul;
    Xm_C_Input_Create : constant String := "InputCreate" & Ascii.Nul;
    Xm_C_Input_Method : constant String := "InputMethod" & Ascii.Nul;
    Xm_C_Interval : constant String := "Interval" & Ascii.Nul;
    Xm_C_Invalid_Cursor_Foreground : constant String :=
       "InvalidCursorForeground" & Ascii.Nul;
    Xm_C_Is_Aligned : constant String := "IsAligned" & Ascii.Nul;
    Xm_C_Is_Homogeneous : constant String := "IsHomogeneous" & Ascii.Nul;
    Xm_C_Item_Count : constant String := "ItemCount" & Ascii.Nul;
    Xm_C_Items : constant String := "Items" & Ascii.Nul;
    Xm_C_Justify : constant String := "Justify" & Ascii.Nul;
    Xm_C_Keyboard_Focus_Policy : constant String :=
       "KeyboardFocusPolicy" & Ascii.Nul;
    Xm_C_Label : constant String := "Label" & Ascii.Nul;
    Xm_C_Label_Font_List : constant String := "LabelFontList" & Ascii.Nul;
    Xm_C_Label_Insensitive_Pixmap : constant String :=
       "LabelInsensitivePixmap" & Ascii.Nul;
    Xm_C_Label_Pixmap : constant String := "LabelPixmap" & Ascii.Nul;
    Xm_C_Label_String : constant String := "LabelString" & Ascii.Nul;
    Xm_C_Label_Type : constant String := "LabelType" & Ascii.Nul;
    Xm_C_Length : constant String := "Length" & Ascii.Nul;
    Xm_C_Light_Threshold : constant String := "LightThreshold" & Ascii.Nul;
    Xm_C_List_Label_String : constant String := "ListLabelString" & Ascii.Nul;
    Xm_C_List_Margin_Height : constant String := "ListMarginHeight" & Ascii.Nul;
    Xm_C_List_Margin_Width : constant String := "ListMarginWidth" & Ascii.Nul;
    Xm_C_List_Size_Policy : constant String := "ListSizePolicy" & Ascii.Nul;
    Xm_C_List_Spacing : constant String := "ListSpacing" & Ascii.Nul;
    Xm_C_List_Updated : constant String := "ListUpdated" & Ascii.Nul;
    Xm_C_Logical_Parent : constant String := "LogicalParent" & Ascii.Nul;
    Xm_C_Main_Window_Margin_Height : constant String :=
       "MainWindowMarginHeight" & Ascii.Nul;
    Xm_C_Main_Window_Margin_Width : constant String :=
       "MainWindowMarginWidth" & Ascii.Nul;
    Xm_C_Mapped_When_Managed : constant String :=
       "MappedWhenManaged" & Ascii.Nul;
    Xm_C_Mapping_Delay : constant String := "MappingDelay" & Ascii.Nul;
    Xm_C_Margin : constant String := "Margin" & Ascii.Nul;
    Xm_C_Margin_Bottom : constant String := "MarginBottom" & Ascii.Nul;
    Xm_C_Margin_Height : constant String := "MarginHeight" & Ascii.Nul;
    Xm_C_Margin_Left : constant String := "MarginLeft" & Ascii.Nul;
    Xm_C_Margin_Right : constant String := "MarginRight" & Ascii.Nul;
    Xm_C_Margin_Top : constant String := "MarginTop" & Ascii.Nul;
    Xm_C_Margin_Width : constant String := "MarginWidth" & Ascii.Nul;
    Xm_C_Mask : constant String := "Mask" & Ascii.Nul;
    Xm_C_Max_Aspect_X : constant String := "MaxAspectX" & Ascii.Nul;
    Xm_C_Max_Aspect_Y : constant String := "MaxAspectY" & Ascii.Nul;
    Xm_C_Max_Height : constant String := "MaxHeight" & Ascii.Nul;
    Xm_C_Max_Items : constant String := "MaxItems" & Ascii.Nul;
    Xm_C_Max_Length : constant String := "MaxLength" & Ascii.Nul;
    Xm_C_Max_Value : constant String := "MaxValue" & Ascii.Nul;
    Xm_C_Max_Width : constant String := "MaxWidth" & Ascii.Nul;
    Xm_C_Maximum : constant String := "Maximum" & Ascii.Nul;
    Xm_C_Menu_Bar : constant String := "MenuBar" & Ascii.Nul;
    Xm_C_Menu_Entry : constant String := "MenuEntry" & Ascii.Nul;
    Xm_C_Menu_Post : constant String := "MenuPost" & Ascii.Nul;
    Xm_C_Menu_Widget : constant String := "MenuWidget" & Ascii.Nul;
    Xm_C_Message_Proc : constant String := "MessageProc" & Ascii.Nul;
    Xm_C_Message_Window : constant String := "MessageWindow" & Ascii.Nul;
    Xm_C_Min_Aspect_X : constant String := "MinAspectX" & Ascii.Nul;
    Xm_C_Min_Aspect_Y : constant String := "MinAspectY" & Ascii.Nul;
    Xm_C_Min_Height : constant String := "MinHeight" & Ascii.Nul;
    Xm_C_Min_Width : constant String := "MinWidth" & Ascii.Nul;
    Xm_C_Minimize_Buttons : constant String := "MinimizeButtons" & Ascii.Nul;
    Xm_C_Minimum : constant String := "Minimum" & Ascii.Nul;
    Xm_C_Mnemonic : constant String := "Mnemonic" & Ascii.Nul;
    Xm_C_Mnemonic_Char_Set : constant String := "MnemonicCharSet" & Ascii.Nul;
    Xm_C_Move_Opaque : constant String := "MoveOpaque" & Ascii.Nul;
    Xm_C_Multi_Click : constant String := "MultiClick" & Ascii.Nul;
    Xm_C_Must_Match : constant String := "MustMatch" & Ascii.Nul;
    Xm_C_Mwm_Decorations : constant String := "MwmDecorations" & Ascii.Nul;
    Xm_C_Mwm_Functions : constant String := "MwmFunctions" & Ascii.Nul;
    Xm_C_Mwm_Input_Mode : constant String := "MwmInputMode" & Ascii.Nul;
    Xm_C_Mwm_Menu : constant String := "MwmMenu" & Ascii.Nul;
    Xm_C_Mwm_Messages : constant String := "MwmMessages" & Ascii.Nul;
    Xm_C_Navigation_Type : constant String := "NavigationType" & Ascii.Nul;
    Xm_C_Needs_Motion : constant String := "NeedsMotion" & Ascii.Nul;
    Xm_C_No_Match_String : constant String := "NoMatchString" & Ascii.Nul;
    Xm_C_No_Resize : constant String := "NoResize" & Ascii.Nul;
    Xm_C_None_Cursor_Foreground : constant String :=
       "NoneCursorForeground" & Ascii.Nul;
    Xm_C_Notify : constant String := "Notify" & Ascii.Nul;
    Xm_C_Notify_Proc : constant String := "NotifyProc" & Ascii.Nul;
    Xm_C_Num_Children : constant String := "NumChildren" & Ascii.Nul;
    Xm_C_Num_Columns : constant String := "NumColumns" & Ascii.Nul;
    Xm_C_Num_Drop_Rectangles : constant String :=
       "NumDropRectangles" & Ascii.Nul;
    Xm_C_Num_Drop_Transfers : constant String := "NumDropTransfers" & Ascii.Nul;
    Xm_C_Num_Export_Targets : constant String := "NumExportTargets" & Ascii.Nul;
    Xm_C_Num_Import_Targets : constant String := "NumImportTargets" & Ascii.Nul;
    Xm_C_Offset : constant String := "Offset" & Ascii.Nul;
    Xm_C_Ok_Label_String : constant String := "OkLabelString" & Ascii.Nul;
    Xm_C_Operation_Changed_Callback : constant String :=
       "OperationChangedCallback" & Ascii.Nul;
    Xm_C_Operation_Cursor_Icon : constant String :=
       "OperationCursorIcon" & Ascii.Nul;
    Xm_C_Option_Label : constant String := "OptionLabel" & Ascii.Nul;
    Xm_C_Option_Mnemonic : constant String := "OptionMnemonic" & Ascii.Nul;
    Xm_C_Orientation : constant String := "Orientation" & Ascii.Nul;
    Xm_C_Output_Create : constant String := "OutputCreate" & Ascii.Nul;
    Xm_C_Override_Redirect : constant String := "OverrideRedirect" & Ascii.Nul;
    Xm_C_Packing : constant String := "Packing" & Ascii.Nul;
    Xm_C_Page_Increment : constant String := "PageIncrement" & Ascii.Nul;
    Xm_C_Pane_Maximum : constant String := "PaneMaximum" & Ascii.Nul;
    Xm_C_Pane_Minimum : constant String := "PaneMinimum" & Ascii.Nul;
    Xm_C_Parameter : constant String := "Parameter" & Ascii.Nul;
    Xm_C_Pattern : constant String := "Pattern" & Ascii.Nul;
    Xm_C_Pending_Delete : constant String := "PendingDelete" & Ascii.Nul;
    Xm_C_Pixmap : constant String := "Pixmap" & Ascii.Nul;
    Xm_C_Popup_Enabled : constant String := "PopupEnabled" & Ascii.Nul;
    Xm_C_Position : constant String := "Position" & Ascii.Nul;
    Xm_C_Position_Index : constant String := "PositionIndex" & Ascii.Nul;
    Xm_C_Post_From_Button : constant String := "PostFromButton" & Ascii.Nul;
    Xm_C_Post_From_Count : constant String := "PostFromCount" & Ascii.Nul;
    Xm_C_Post_From_List : constant String := "PostFromList" & Ascii.Nul;
    Xm_C_Preedit_Type : constant String := "PreeditType" & Ascii.Nul;
    Xm_C_Processing_Direction : constant String :=
       "ProcessingDirection" & Ascii.Nul;
    Xm_C_Prompt_String : constant String := "PromptString" & Ascii.Nul;
    Xm_C_Protocol_Callback : constant String := "ProtocolCallback" & Ascii.Nul;
    Xm_C_Push_Button_Enabled : constant String :=
       "PushButtonEnabled" & Ascii.Nul;
    Xm_C_Qualify_Search_Data_Proc : constant String :=
       "QualifySearchDataProc" & Ascii.Nul;
    Xm_C_Radio_Always_One : constant String := "RadioAlwaysOne" & Ascii.Nul;
    Xm_C_Radio_Behavior : constant String := "RadioBehavior" & Ascii.Nul;
    Xm_C_Read_Only : constant String := Xt_Stringdefs.Xt_C_Read_Only;
    Xm_C_Recompute_Size : constant String := "RecomputeSize" & Ascii.Nul;
    Xm_C_Rectangles : constant String := "Rectangles" & Ascii.Nul;
    Xm_C_Repeat_Delay : constant String := "RepeatDelay" & Ascii.Nul;
    Xm_C_Resize : constant String := "Resize" & Ascii.Nul;
    Xm_C_Resize_Callback : constant String := "ResizeCallback" & Ascii.Nul;
    Xm_C_Resize_Height : constant String := "ResizeHeight" & Ascii.Nul;
    Xm_C_Resize_Policy : constant String := "ResizePolicy" & Ascii.Nul;
    Xm_C_Resize_Width : constant String := "ResizeWidth" & Ascii.Nul;
    Xm_C_Reverse_Video : constant String := "ReverseVideo" & Ascii.Nul;
    Xm_C_Row_Column_Type : constant String := "RowColumnType" & Ascii.Nul;
    Xm_C_Rows : constant String := "Rows" & Ascii.Nul;
    Xm_C_Rubber_Positioning : constant String :=
       "RubberPositioning" & Ascii.Nul;
    Xm_C_Sash_Height : constant String := "SashHeight" & Ascii.Nul;
    Xm_C_Sash_Indent : constant String := "SashIndent" & Ascii.Nul;
    Xm_C_Sash_Width : constant String := "SashWidth" & Ascii.Nul;
    Xm_C_Save_Under : constant String := "SaveUnder" & Ascii.Nul;
    Xm_C_Scale_Height : constant String := "ScaleHeight" & Ascii.Nul;
    Xm_C_Scale_Multiple : constant String := "ScaleMultiple" & Ascii.Nul;
    Xm_C_Scale_Width : constant String := "ScaleWidth" & Ascii.Nul;
    Xm_C_Screen : constant String := "Screen" & Ascii.Nul;
    Xm_C_Scroll : constant String := "Scroll" & Ascii.Nul;
    Xm_C_Scroll_Bar_Display_Policy : constant String :=
       "ScrollBarDisplayPolicy" & Ascii.Nul;
    Xm_C_Scroll_Bar_Placement : constant String :=
       "ScrollBarPlacement" & Ascii.Nul;
    Xm_C_Scroll_D_Cursor : constant String := "ScrollDCursor" & Ascii.Nul;
    Xm_C_Scroll_H_Cursor : constant String := "ScrollHCursor" & Ascii.Nul;
    Xm_C_Scroll_L_Cursor : constant String := "ScrollLCursor" & Ascii.Nul;
    Xm_C_Scroll_Proc : constant String := "ScrollProc" & Ascii.Nul;
    Xm_C_Scroll_R_Cursor : constant String := "ScrollRCursor" & Ascii.Nul;
    Xm_C_Scroll_Side : constant String := "ScrollSide" & Ascii.Nul;
    Xm_C_Scroll_U_Cursor : constant String := "ScrollUCursor" & Ascii.Nul;
    Xm_C_Scroll_V_Cursor : constant String := "ScrollVCursor" & Ascii.Nul;
    Xm_C_Scrolled_Window_Margin_Height : constant String :=
       "ScrolledWindowMarginHeight" & Ascii.Nul;
    Xm_C_Scrolled_Window_Margin_Width : constant String :=
       "ScrolledWindowMarginWidth" & Ascii.Nul;
    Xm_C_Scrolling_Policy : constant String := "ScrollingPolicy" & Ascii.Nul;
    Xm_C_Select_Color : constant String := "SelectColor" & Ascii.Nul;
    Xm_C_Select_Insensitive_Pixmap : constant String :=
       "SelectInsensitivePixmap" & Ascii.Nul;
    Xm_C_Select_Pixmap : constant String := "SelectPixmap" & Ascii.Nul;
    Xm_C_Select_Threshold : constant String := "SelectThreshold" & Ascii.Nul;
    Xm_C_Selected_Item_Count : constant String :=
       "SelectedItemCount" & Ascii.Nul;
    Xm_C_Selected_Items : constant String := "SelectedItems" & Ascii.Nul;
    Xm_C_Selection : constant String := "Selection" & Ascii.Nul;
    Xm_C_Selection_Array : constant String := "SelectionArray" & Ascii.Nul;
    Xm_C_Selection_Array_Count : constant String :=
       "SelectionArrayCount" & Ascii.Nul;
    Xm_C_Selection_Label_String : constant String :=
       "SelectionLabelString" & Ascii.Nul;
    Xm_C_Selection_Policy : constant String := "SelectionPolicy" & Ascii.Nul;
    Xm_C_Sensitive : constant String := "Sensitive" & Ascii.Nul;
    Xm_C_Separator_On : constant String := "SeparatorOn" & Ascii.Nul;
    Xm_C_Separator_Type : constant String := "SeparatorType" & Ascii.Nul;
    Xm_C_Set : constant String := "Set" & Ascii.Nul;
    Xm_C_Shadow_Thickness : constant String := "ShadowThickness" & Ascii.Nul;
    Xm_C_Shadow_Type : constant String := "ShadowType" & Ascii.Nul;
    Xm_C_Shell_Unit_Type : constant String := "ShellUnitType" & Ascii.Nul;
    Xm_C_Show_Arrows : constant String := "ShowArrows" & Ascii.Nul;
    Xm_C_Show_As_Default : constant String := "ShowAsDefault" & Ascii.Nul;
    Xm_C_Show_Separator : constant String := "ShowSeparator" & Ascii.Nul;
    Xm_C_Show_Value : constant String := "ShowValue" & Ascii.Nul;
    Xm_C_Simple_Check_Box : constant String := "SimpleCheckBox" & Ascii.Nul;
    Xm_C_Simple_Menu_Bar : constant String := "SimpleMenuBar" & Ascii.Nul;
    Xm_C_Simple_Option_Menu : constant String := "SimpleOptionMenu" & Ascii.Nul;
    Xm_C_Simple_Popup_Menu : constant String := "SimplePopupMenu" & Ascii.Nul;
    Xm_C_Simple_Pulldown_Menu : constant String :=
       "SimplePulldownMenu" & Ascii.Nul;
    Xm_C_Simple_Radio_Box : constant String := "SimpleRadioBox" & Ascii.Nul;
    Xm_C_Size_Policy : constant String := "SizePolicy" & Ascii.Nul;
    Xm_C_Slider_Size : constant String := "SliderSize" & Ascii.Nul;
    Xm_C_Source : constant String := "Source" & Ascii.Nul;
    Xm_C_Source_Cursor_Icon : constant String := "SourceCursorIcon" & Ascii.Nul;
    Xm_C_Source_Is_External : constant String := "SourceIsExternal" & Ascii.Nul;
    Xm_C_Source_Pixmap_Icon : constant String := "SourcePixmapIcon" & Ascii.Nul;
    Xm_C_Source_Widget : constant String := "SourceWidget" & Ascii.Nul;
    Xm_C_Source_Window : constant String := "SourceWindow" & Ascii.Nul;
    Xm_C_Space : constant String := "Space" & Ascii.Nul;
    Xm_C_Spacing : constant String := "Spacing" & Ascii.Nul;
    Xm_C_String : constant String := "String" & Ascii.Nul;
    Xm_C_Start_Time : constant String := "StartTime" & Ascii.Nul;
    Xm_C_State_Cursor_Icon : constant String := "StateCursorIcon" & Ascii.Nul;
    Xm_C_String_Direction : constant String := "StringDirection" & Ascii.Nul;
    Xm_C_Tear_Off_Model : constant String := "TearOffModel" & Ascii.Nul;
    Xm_C_Text_Font_List : constant String := "TextFontList" & Ascii.Nul;
    Xm_C_Text_Options : constant String := "TextOptions" & Ascii.Nul;
    Xm_C_Text_Position : constant String := "TextPosition" & Ascii.Nul;
    Xm_C_Text_Sink : constant String := "TextSink" & Ascii.Nul;
    Xm_C_Text_Source : constant String := "TextSource" & Ascii.Nul;
    Xm_C_Text_String : constant String := "TextString" & Ascii.Nul;
    Xm_C_Text_Value : constant String := "TextValue" & Ascii.Nul;
    Xm_C_Thickness : constant String := "Thickness" & Ascii.Nul;
    Xm_C_Thumb : constant String := "Thumb" & Ascii.Nul;
    Xm_C_Title : constant String := "Title" & Ascii.Nul;
    Xm_C_Title_Encoding : constant String := Xt_Stringdefs.Xt_C_Title_Encoding;
    Xm_C_Title_String : constant String := "TitleString" & Ascii.Nul;
    Xm_C_Top_Character : constant String := "TopCharacter" & Ascii.Nul;
    Xm_C_Top_Item_Position : constant String := "TopItemPosition" & Ascii.Nul;
    Xm_C_Top_Level_Enter_Callback : constant String :=
       "TopLevelEnterCallback" & Ascii.Nul;
    Xm_C_Top_Level_Leave_Callback : constant String :=
       "TopLevelLeaveCallback" & Ascii.Nul;
    Xm_C_Top_Shadow_Color : constant String := "TopShadowColor" & Ascii.Nul;
    Xm_C_Top_Shadow_Pixmap : constant String := "TopShadowPixmap" & Ascii.Nul;
    Xm_C_Transfer_Proc : constant String := "TransferProc" & Ascii.Nul;
    Xm_C_Transfer_Status : constant String := "TransferStatus" & Ascii.Nul;
    Xm_C_Transient : constant String := "Transient" & Ascii.Nul;
    Xm_C_Transient_For : constant String := Xt_Stringdefs.Xt_C_Transient_For;
    Xm_C_Translations : constant String := "Translations" & Ascii.Nul;
    Xm_C_Traversal_On : constant String := "TraversalOn" & Ascii.Nul;
    Xm_C_Traversal_Type : constant String := "TraversalType" & Ascii.Nul;
    Xm_C_Tree_Update_Proc : constant String := "TreeUpdateProc" & Ascii.Nul;
    Xm_C_Trough_Color : constant String := "TroughColor" & Ascii.Nul;
    Xm_C_Unit_Type : constant String := "UnitType" & Ascii.Nul;
    Xm_C_Unpost_Behavior : constant String := "UnpostBehavior" & Ascii.Nul;
    Xm_C_Unselect_Pixmap : constant String := "UnselectPixmap" & Ascii.Nul;
    Xm_C_Update_Slider_Size : constant String := "UpdateSliderSize" & Ascii.Nul;
    Xm_C_Use_Async_Geometry : constant String := "UseAsyncGeometry" & Ascii.Nul;
    Xm_C_User_Data : constant String := "UserData" & Ascii.Nul;
    Xm_C_V_Space : constant String := "VSpace" & Ascii.Nul;
    Xm_C_Valid_Cursor_Foreground : constant String :=
       "ValidCursorForeground" & Ascii.Nul;
    Xm_C_Value : constant String := "Value" & Ascii.Nul;
    Xm_C_Value_Changed_Callback : constant String :=
       "ValueChangedCallback" & Ascii.Nul;
    Xm_C_Value_Wcs : constant String := "ValueWcs" & Ascii.Nul;
    Xm_C_Verify_Bell : constant String := "VerifyBell" & Ascii.Nul;
    Xm_C_Vertical_Alignment : constant String :=
       "VerticalAlignment" & Ascii.Nul;
    Xm_C_Vertical_Font_Unit : constant String := "VerticalFontUnit" & Ascii.Nul;
    Xm_C_Vertical_Scroll_Bar : constant String :=
       "VerticalScrollBar" & Ascii.Nul;
    Xm_C_Visible_Item_Count : constant String := "VisibleItemCount" & Ascii.Nul;
    Xm_C_Visible_When_Off : constant String := "VisibleWhenOff" & Ascii.Nul;
    Xm_C_Visual : constant String := Xt_Stringdefs.Xt_C_Visual;
    Xm_C_Visual_Policy : constant String := "VisualPolicy" & Ascii.Nul;
    Xm_C_Wait_For_Wm : constant String := "Waitforwm" & Ascii.Nul;
    Xm_C_Which_Button : constant String := "WhichButton" & Ascii.Nul;
    Xm_C_Widget : constant String := "Widget" & Ascii.Nul;
    Xm_C_Width : constant String := "Width" & Ascii.Nul;
    Xm_C_Width_Inc : constant String := "WidthInc" & Ascii.Nul;
    Xm_C_Win_Gravity : constant String := Xt_Stringdefs.Xt_C_Win_Gravity;
    Xm_C_Window : constant String := "Window" & Ascii.Nul;
    Xm_C_Window_Group : constant String := "WindowGroup" & Ascii.Nul;
    Xm_C_Wm_Timeout : constant String := "WmTimeout" & Ascii.Nul;
    Xm_C_Word_Wrap : constant String := "WordWrap" & Ascii.Nul;
    Xm_C_Work_Window : constant String := "WorkWindow" & Ascii.Nul;
    Xm_C_X : constant String := "X" & Ascii.Nul;
    Xm_C_Xm_String : constant String := "XmString" & Ascii.Nul;
    Xm_C_Y : constant String := "Y" & Ascii.Nul;
    Xmfontlist_Default_Tag : constant String :=
       "FONTLIST_DEFAULT_TAG_STRING" & Ascii.Nul;
    Xmfontlist_Default_Tag_String : constant String :=
       "XmFONTLIST_DEFAULT_TAG_STRING" & Ascii.Nul;

--Representation types

    Xm_R_Accelerator_Table : constant String := "AcceleratorTable" & Ascii.Nul;
    Xm_R_Alignment : constant String := "Alignment" & Ascii.Nul;
    Xm_R_Animation_Mask : constant String := "AnimationMask" & Ascii.Nul;
    Xm_R_Animation_Pixmap : constant String := "AnimationPixmap" & Ascii.Nul;
    Xm_R_Animation_Style : constant String := "AnimationStyle" & Ascii.Nul;
    Xm_R_Arrow_Direction : constant String := "ArrowDirection" & Ascii.Nul;
    Xm_R_Atom : constant String := Xt_Stringdefs.Xt_R_Atom;
    Xm_R_Atom_List : constant String := "AtomList" & Ascii.Nul;
    Xm_R_Attachment : constant String := "Attachment" & Ascii.Nul;
    Xm_R_Audible_Warning : constant String := "AudibleWarning" & Ascii.Nul;
    Xm_R_Availability : constant String := "Availability" & Ascii.Nul;
    Xm_R_Background_Pixmap : constant String :=
       "XmBackgroundPixmap" & Ascii.Nul;
    Xm_R_Bitmap : constant String := Xt_Stringdefs.Xt_R_Bitmap;
    Xm_R_Blend_Model : constant String := "BlendModel" & Ascii.Nul;
    Xm_R_Bool : constant String := "Bool" & Ascii.Nul;
    Xm_R_Boolean : constant String := "Boolean" & Ascii.Nul;
    Xm_R_Button_Type : constant String := "ButtonType" & Ascii.Nul;
    Xm_R_Boolean_Dimension : constant String := "BooleanDimension" & Ascii.Nul;
    Xm_R_Call_Proc : constant String := "CallProc" & Ascii.Nul;
    Xm_R_Callback : constant String := "Callback" & Ascii.Nul;
    Xm_R_Callback_Proc : constant String := "CallbackProc" & Ascii.Nul;
    Xm_R_Cardinal : constant String := Xt_Stringdefs.Xt_R_Cardinal;
    Xm_R_Char : constant String := "Char" & Ascii.Nul;
    Xm_R_Char_Set_Table : constant String := "CharSetTable" & Ascii.Nul;
    Xm_R_Child_Horizontal_Alignment : constant String :=
       "ChildHorizontalAlignment" & Ascii.Nul;
    Xm_R_Child_Placement : constant String := "ChildPlacement" & Ascii.Nul;
    Xm_R_Child_Type : constant String := "ChildType" & Ascii.Nul;
    Xm_R_Child_Vertical_Alignment : constant String :=
       "ChildVerticalAlignment" & Ascii.Nul;
    Xm_R_Color : constant String := "Color" & Ascii.Nul;
    Xm_R_Colormap : constant String := Xt_Stringdefs.Xt_R_Colormap;
    Xm_R_Command_Window_Location : constant String :=
       "CommandWindowLocation" & Ascii.Nul;
    Xm_R_Compound_Text : constant String := "CompoundText" & Ascii.Nul;
    Xm_R_Cursor : constant String := "Cursor" & Ascii.Nul;
    Xm_R_Default_Button_Type : constant String :=
       "DefaultButtonType" & Ascii.Nul;
    Xm_R_Delete_Response : constant String := "DeleteResponse" & Ascii.Nul;
    Xm_R_Dialog_Style : constant String := "DialogStyle" & Ascii.Nul;
    Xm_R_Dialog_Type : constant String := "DialogType" & Ascii.Nul;
    Xm_R_Dimension : constant String := "Dimension" & Ascii.Nul;
    Xm_R_Display : constant String := "Display" & Ascii.Nul;
    Xm_R_Double_Click_Interval : constant String :=
       "DoubleClickInterval" & Ascii.Nul;
    Xm_R_Drag_Initiator_Protocol_Style : constant String :=
       "DragInitiatorProtocolStyle" & Ascii.Nul;
    Xm_R_Drag_Receiver_Protocol_Style : constant String :=
       "DragReceiverProtocolStyle" & Ascii.Nul;
    Xm_R_Drop_Site_Activity : constant String := "DropSiteActivity" & Ascii.Nul;
    Xm_R_Drop_Site_Operations : constant String :=
       "DropSiteOperations" & Ascii.Nul;
    Xm_R_Drop_Site_Type : constant String := "DropSiteType" & Ascii.Nul;
    Xm_R_Drop_Transfers : constant String := "DropTransfers" & Ascii.Nul;
    Xm_R_Edit_Mode : constant String := "EditMode" & Ascii.Nul;
    Xm_R_Enum : constant String := Xt_Stringdefs.Xt_R_Enum;
    Xm_R_Extension_Type : constant String := "ExtensionType" & Ascii.Nul;
    Xm_R_File : constant String := "File" & Ascii.Nul;
    Xm_R_File_Type_Mask : constant String := "FileTypeMask" & Ascii.Nul;
    Xm_R_Float : constant String := Xt_Stringdefs.Xt_R_Float;
    Xm_R_Font : constant String := "Font" & Ascii.Nul;
    Xm_R_Font_List : constant String := "FontList" & Ascii.Nul;
    Xm_R_Font_Set : constant String := Xt_Stringdefs.Xt_R_Font_Set;
    Xm_R_Font_Struct : constant String := "FontStruct" & Ascii.Nul;
    Xm_R_Function : constant String := "Function" & Ascii.Nul;
    Xm_R_Gadget_Pixmap : constant String := "GadgetPixmap" & Ascii.Nul;
    Xm_R_Geometry : constant String := "Geometry" & Ascii.Nul;
    Xm_R_Horizontal_Dimension : constant String :=
       "HorizontalDimension" & Ascii.Nul;
    Xm_R_Horizontal_Int : constant String := "HorizontalInt" & Ascii.Nul;
    Xm_R_Horizontal_Position : constant String :=
       "HorizontalPosition" & Ascii.Nul;
    Xm_R_Icon_Attachment : constant String := "IconAttachment" & Ascii.Nul;
    Xm_R_Immediate : constant String := "Immediate" & Ascii.Nul;
    Xm_R_Import_Targets : constant String := "ImportTargets" & Ascii.Nul;
    Xm_R_Indicator_Type : constant String := "IndicatorType" & Ascii.Nul;
    Xm_R_Initial_State : constant String := Xt_Stringdefs.Xt_R_Initial_State;
    Xm_R_Int : constant String := "Int" & Ascii.Nul;
    Xm_R_Items : constant String := "Items" & Ascii.Nul;
    Xm_R_Item_Count : constant String := "ItemCount" & Ascii.Nul;
    Xm_R_Justify : constant String := "Justify" & Ascii.Nul;
    Xm_R_Key_Sym : constant String := "KeySym" & Ascii.Nul;
    Xm_R_Key_Sym_Table : constant String := "KeySymTable" & Ascii.Nul;
    Xm_R_Label_Type : constant String := "LabelType" & Ascii.Nul;
    Xm_R_List_Margin_Height : constant String := "ListMarginHeight" & Ascii.Nul;
    Xm_R_List_Margin_Width : constant String := "ListMarginWidth" & Ascii.Nul;
    Xm_R_List_Size_Policy : constant String := "ListSizePolicy" & Ascii.Nul;
    Xm_R_List_Spacing : constant String := "ListSpacing" & Ascii.Nul;
    Xm_R_Long_Boolean : constant String := Xm_R_Bool;
    Xm_R_Man_Bottom_Shadow_Pixmap : constant String :=
       "ManBottomShadowPixmap" & Ascii.Nul;
    Xm_R_Man_Foreground_Pixmap : constant String :=
       "ManForegroundPixmap" & Ascii.Nul;
    Xm_R_Man_Highlight_Pixmap : constant String :=
       "ManHighlightPixmap" & Ascii.Nul;
    Xm_R_Man_Top_Shadow_Pixmap : constant String :=
       "ManTopShadowPixmap" & Ascii.Nul;
    Xm_R_Menu_Widget : constant String := "MenuWidget" & Ascii.Nul;
    Xm_R_Mnemonic : constant String := "Mnemonic" & Ascii.Nul;
    Xm_R_Multi_Click : constant String := "MultiClick" & Ascii.Nul;
    Xm_R_Navigation_Type : constant String := "NavigationType" & Ascii.Nul;
    Xm_R_Orientation : constant String := "Orientation" & Ascii.Nul;
    Xm_R_Object : constant String := Xt_Stringdefs.Xt_R_Object;
    Xm_R_Packing : constant String := "Packing" & Ascii.Nul;
    Xm_R_Pixel : constant String := "Pixel" & Ascii.Nul;
    Xm_R_Pixmap : constant String := "Pixmap" & Ascii.Nul;
    Xm_R_Pointer : constant String := "Pointer" & Ascii.Nul;
    Xm_R_Position : constant String := "Position" & Ascii.Nul;
    Xm_R_Prim_Bottom_Shadow_Pixmap : constant String :=
       "BottomShadowPixmap" & Ascii.Nul;
    Xm_R_Prim_Foreground_Pixmap : constant String :=
       "PrimForegroundPixmap" & Ascii.Nul;
    Xm_R_Prim_Highlight_Pixmap : constant String :=
       "HighlightPixmap" & Ascii.Nul;
    Xm_R_Prim_Top_Shadow_Pixmap : constant String :=
       "TopShadowPixmap" & Ascii.Nul;
    Xm_R_Proc : constant String := "Proc" & Ascii.Nul;
    Xm_R_Processing_Direction : constant String :=
       "ProcessingDirection" & Ascii.Nul;
    Xm_R_Rectangle_List : constant String := "RectangleList" & Ascii.Nul;
    Xm_R_Resize_Policy : constant String := "ResizePolicy" & Ascii.Nul;
    Xm_R_Row_Column_Type : constant String := "RowColumnType" & Ascii.Nul;
    Xm_R_Screen : constant String := Xt_Stringdefs.Xt_R_Screen;
    Xm_R_Scroll_Bar_Display_Policy : constant String :=
       "ScrollBarDisplayPolicy" & Ascii.Nul;
    Xm_R_Scroll_Bar_Placement : constant String :=
       "ScrollBarPlacement" & Ascii.Nul;
    Xm_R_Scrolling_Policy : constant String := "ScrollingPolicy" & Ascii.Nul;
    Xm_R_Selected_Item_Count : constant String :=
       "SelectedItemCount" & Ascii.Nul;
    Xm_R_Selected_Items : constant String := "SelectedItems" & Ascii.Nul;
    Xm_R_Selection_Policy : constant String := "SelectionPolicy" & Ascii.Nul;
    Xm_R_Selection_Type : constant String := "SelectionType" & Ascii.Nul;
    Xm_R_Separator_Type : constant String := "SeparatorType" & Ascii.Nul;
    Xm_R_Shadow_Type : constant String := "ShadowType" & Ascii.Nul;
    Xm_R_Shell_Horiz_Dim : constant String := "ShellHorizDim" & Ascii.Nul;
    Xm_R_Shell_Horiz_Pos : constant String := "ShellHorizPos" & Ascii.Nul;
    Xm_R_Shell_Unit_Type : constant String := "ShellUnitType" & Ascii.Nul;
    Xm_R_Shell_Vert_Dim : constant String := "ShellVertDim" & Ascii.Nul;
    Xm_R_Shell_Vert_Pos : constant String := "ShellVertPos" & Ascii.Nul;
    Xm_R_Keyboard_Focus_Policy : constant String :=
       "KeyboardFocusPolicy" & Ascii.Nul;
    Xm_R_Short : constant String := "Short" & Ascii.Nul;
    Xm_R_Size_Policy : constant String := "SizePolicy" & Ascii.Nul;
    Xm_R_String : constant String := "String" & Ascii.Nul;
    Xm_R_String_Array : constant String := Xt_Stringdefs.Xt_R_String_Array;
    Xm_R_Xm_String_Char_Set : constant String := "XmStringCharSet" & Ascii.Nul;
    Xm_R_String_Direction : constant String := "StringDirection" & Ascii.Nul;
    Xm_R_String_Table : constant String := "StringTable" & Ascii.Nul;
    Xm_R_Tear_Off_Model : constant String := "TearOffModel" & Ascii.Nul;
    Xm_R_Text_Position : constant String := "TextPosition" & Ascii.Nul;
    Xm_R_Transfer_Status : constant String := "TransferStatus" & Ascii.Nul;
    Xm_R_Translation_Table : constant String :=
       Xt_Stringdefs.Xt_R_Translation_Table;
    Xm_R_Traversal_Type : constant String := "TraversalType" & Ascii.Nul;
    Xm_R_Unit_Type : constant String := "UnitType" & Ascii.Nul;
    Xm_R_Unpost_Behavior : constant String := "UnpostBehavior" & Ascii.Nul;
    Xm_R_Unsigned_Char : constant String := "UnsignedChar" & Ascii.Nul;
    Xm_R_Vertical_Alignment : constant String :=
       "VerticalAlignment" & Ascii.Nul;
    Xm_R_Vertical_Dimension : constant String :=
       "VerticalDimension" & Ascii.Nul;
    Xm_R_Vertical_Int : constant String := "VerticalInt" & Ascii.Nul;
    Xm_R_Vertical_Position : constant String := "VerticalPosition" & Ascii.Nul;
    Xm_R_Virtual_Binding : constant String := "VirtualBinding" & Ascii.Nul;
    Xm_R_Visible_Item_Count : constant String := "VisibleItemCount" & Ascii.Nul;
    Xm_R_Visual : constant String := Xt_Stringdefs.Xt_R_Visual;
    Xm_R_Visual_Policy : constant String := "VisualPolicy" & Ascii.Nul;
    Xm_R_Value_Wcs : constant String := "ValueWcs" & Ascii.Nul;
    Xm_R_Which_Button : constant String := "WhichButton" & Ascii.Nul;
    Xm_R_Widget : constant String := "Widget" & Ascii.Nul;
    Xm_R_Widget_Class : constant String := "WidgetClass" & Ascii.Nul;
    Xm_R_Widget_List : constant String := "WidgetList" & Ascii.Nul;
    Xm_R_Window : constant String := "Window" & Ascii.Nul;
    Xm_R_Xm_Background_Pixmap : constant String :=
       "XmBackgroundPixmap" & Ascii.Nul;
    Xm_R_Xm_String : constant String := "XmString" & Ascii.Nul;
    Xm_R_Xm_String_Table : constant String := "XmStringTable" & Ascii.Nul;
    Xm_R_String_Char_Set : constant String := "XmStringCharSet" & Ascii.Nul;
    Xm_String_Default_Charset : constant String := "EMPTY_STRING" & Ascii.Nul;
    Xm_String_Iso8859_1 : constant String := "ISO8859-1" & Ascii.Nul;

    Xm_Va_Cascade_Button : constant String := "cascadeButton" & Ascii.Nul;
    Xm_Va_Check_Button : constant String := "checkButton" & Ascii.Nul;
    Xm_Va_Double_Separator : constant String := "doubleSeparator" & Ascii.Nul;
    Xm_Va_Push_Button : constant String := "pushButton" & Ascii.Nul;
    Xm_Va_Radio_Button : constant String := "radioButton" & Ascii.Nul;
    Xm_Va_Separator : constant String := "separator" & Ascii.Nul;
    Xm_Va_Single_Separator : constant String := "singleSeparator" & Ascii.Nul;
    Xm_Va_Title : constant String := Xt_Stringdefs.Xt_N_Title;
    Xm_Va_Toggle_Button : constant String := "checkButton" & Ascii.Nul;
    Xm_Vosf_Activate : constant String := "osfActivate" & Ascii.Nul;
    Xm_Vosf_Add_Mode : constant String := "osfAddMode" & Ascii.Nul;
    Xm_Vosf_Back_Space : constant String := "osfBackSpace" & Ascii.Nul;
    Xm_Vosf_Begin_Line : constant String := "osfBeginLine" & Ascii.Nul;
    Xm_Vosf_Cancel : constant String := "osfCancel" & Ascii.Nul;
    Xm_Vosf_Clear : constant String := "osfClear" & Ascii.Nul;
    Xm_Vosf_Copy : constant String := "osfCopy" & Ascii.Nul;
    Xm_Vosf_Cut : constant String := "osfCut" & Ascii.Nul;
    Xm_Vosf_Delete : constant String := "osfDelete" & Ascii.Nul;
    Xm_Vosf_Down : constant String := "osfDown" & Ascii.Nul;
    Xm_Vosf_End_Line : constant String := "osfEndLine" & Ascii.Nul;
    Xm_Vosf_Help : constant String := "osfHelp" & Ascii.Nul;
    Xm_Vosf_Insert : constant String := "osfInsert" & Ascii.Nul;
    Xm_Vosf_Left : constant String := "osfLeft" & Ascii.Nul;
    Xm_Vosf_Menu : constant String := "osfMenu" & Ascii.Nul;
    Xm_Vosf_Menu_Bar : constant String := "osfMenuBar" & Ascii.Nul;
    Xm_Vosf_Page_Down : constant String := "osfPageDown" & Ascii.Nul;
    Xm_Vosf_Page_Left : constant String := "osfPageLeft" & Ascii.Nul;
    Xm_Vosf_Page_Right : constant String := "osfPageRight" & Ascii.Nul;
    Xm_Vosf_Page_Up : constant String := "osfPageUp" & Ascii.Nul;
    Xm_Vosf_Paste : constant String := "osfPaste" & Ascii.Nul;
    Xm_Vosf_Primary_Paste : constant String := "osfPrimaryPaste" & Ascii.Nul;
    Xm_Vosf_Quick_Paste : constant String := "osfQuickPaste" & Ascii.Nul;
    Xm_Vosf_Right : constant String := "osfRight" & Ascii.Nul;
    Xm_Vosf_Select : constant String := "osfSelect" & Ascii.Nul;
    Xm_Vosf_Undo : constant String := "osfUndo" & Ascii.Nul;
    Xm_Vosf_Up : constant String := "osfUp" & Ascii.Nul;

    Xt_C_Keyboard_Focus_Policy : constant String :=
       "KeyboardFocusPolicy" & Ascii.Nul;
    Xt_C_Shell_Unit_Type : constant String := "ShellUnitType" & Ascii.Nul;
    Xt_N_Keyboard_Focus_Policy : constant String :=
       "keyboardFocusPolicy" & Ascii.Nul;
    Xt_N_Shell_Unit_Type : constant String := "shellUnitType" & Ascii.Nul;
    Xt_R_Keyboard_Focus_Policy : constant String :=
       "KeyboardFocusPolicy" & Ascii.Nul;

end Xm_String_Defs;

--package body Xm_String_Defs is end Xm_String_Defs;

------ COPYRIGHT AND DISTRIBUTION NOTICE ----------
--
-- (C) Copyright 1991, 1993 Systems Engineering Research Corporation
-- All Rights Reserved
--
-- This notice must be included in all copies of this software.
--
-- THIS SOFTWARE AND MANUAL ARE BOTH PROTECTED BY U.S. COPYRIGHT
-- LAW (TITLE 17 UNITED STATES CODE).  UNAUTHORIZED REPRODUCTION
-- AND/OR SALES MAY RESULT IN IMPRISIONMENT OF UP TO ONE YEAR AND
-- FINES OF UP TO $10,000 (17 USC 506).  COPYRIGHT INFRINGERS MAY
-- ALSO BE SUBJECT TO CIVIL LIABILITY.
--
-- THIS PROGRAM IS AN UNPUBLISHED WORK FULLY PROTECTED BY THE
-- UNITED STATES COPYRIGHT LAWS AND IS CONSIDERED A TRADE SECRET
-- BELONGING TO THE COPYRIGHT HOLDER.
--
-- Use of this software is restricted to those individuals and/or
-- organizations who have acquired a license from Systems Engineering
-- Research Corporation for a particular machine or set of machines.
-- No copying, use, or distribution of this software from or to an unlicensed
-- machine is allowed without the prior written consent of Systems
-- Engineering Research Corporation.
--
-- The SOFTWARE and documentation are provided with RESTRICTED RIGHTS.  Use,
-- duplication, or disclosure by the Government is subject to the restrictions
-- as set forth in subparagraph (c)(1)(ii) of The Rights in Technical Data
-- and Computer Software clause at 52.227-7013.  Contractor/manufacturer is
-- Systems Engineering Research Corporation/2555 Charleston Road/
-- Mountain View, CA 94043 1-800-Ada-SERC.
--
------- DISCLAIMER -------
--
-- This software and its documentation are provided "AS IS" and
-- without any expressed or implied warranties whatsoever.
-- No warranties as to performance, merchantability, or fitness
-- for a particular purpose exist.
--
-- Because of the diversity of conditions and hardware under
-- which this software may be used, no warranty of fitness for
-- a particular purpose is offered.  The user is advised to
-- test the software thoroughly before relying on it.  The user
-- must assume the entire risk and liability of using this
-- software.
--
-- In no event shall Systems Engineering Research Corporation and its
-- personnel be held responsible for any direct, indirect, consequential
-- or inconsequential damages or lost profits.
