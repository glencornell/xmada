------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rost.ru)
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
--! <Unit> Xt_String_Defs
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Strings;

with Xt;

package Xt_String_Defs is

   --  Resource name constants

   Xt_N_Accelerators                 : constant Xt.Xt_Resource_Name_String;
   Xt_N_Allow_Shell_Resize           : constant Xt.Xt_Resource_Name_String;
   Xt_N_Ancestor_Sensitive           : constant Xt.Xt_Resource_Name_String;
   Xt_N_Argc                         : constant Xt.Xt_Resource_Name_String;
   Xt_N_Argv                         : constant Xt.Xt_Resource_Name_String;
   Xt_N_Background                   : constant Xt.Xt_Resource_Name_String;
   Xt_N_Background_Pixmap            : constant Xt.Xt_Resource_Name_String;
   Xt_N_Base_Height                  : constant Xt.Xt_Resource_Name_String;
   Xt_N_Base_Width                   : constant Xt.Xt_Resource_Name_String;
   Xt_N_Border_Color                 : constant Xt.Xt_Resource_Name_String;
   Xt_N_Border_Pixmap                : constant Xt.Xt_Resource_Name_String;
   Xt_N_Border_Width                 : constant Xt.Xt_Resource_Name_String;
   Xt_N_Cancel_Callback              : constant Xt.Xt_Resource_Name_String;
   Xt_N_Children                     : constant Xt.Xt_Resource_Name_String;
--   Xt_N_Client_Leader                : constant Xt.Xt_Resource_Name_String;
   Xt_N_Clone_Command                : constant Xt.Xt_Resource_Name_String;
   Xt_N_Colormap                     : constant Xt.Xt_Resource_Name_String;
   Xt_N_Connection                   : constant Xt.Xt_Resource_Name_String;
   Xt_N_Create_Popup_Child_Proc      : constant Xt.Xt_Resource_Name_String;
   Xt_N_Current_Directory            : constant Xt.Xt_Resource_Name_String;
   Xt_N_Depth                        : constant Xt.Xt_Resource_Name_String;
   Xt_N_Destroy_Callback             : constant Xt.Xt_Resource_Name_String;
   Xt_N_Die_Callback                 : constant Xt.Xt_Resource_Name_String;
   Xt_N_Discard_Command              : constant Xt.Xt_Resource_Name_String;
   Xt_N_Environment                  : constant Xt.Xt_Resource_Name_String;
   Xt_N_Error_Callback               : constant Xt.Xt_Resource_Name_String;
   Xt_N_Geometry                     : constant Xt.Xt_Resource_Name_String;
   Xt_N_Height                       : constant Xt.Xt_Resource_Name_String;
   Xt_N_Height_Inc                   : constant Xt.Xt_Resource_Name_String;
   Xt_N_Icon_Mask                    : constant Xt.Xt_Resource_Name_String;
   Xt_N_Icon_Name                    : constant Xt.Xt_Resource_Name_String;
   Xt_N_Icon_Name_Encoding           : constant Xt.Xt_Resource_Name_String;
   Xt_N_Icon_Pixmap                  : constant Xt.Xt_Resource_Name_String;
   Xt_N_Icon_Window                  : constant Xt.Xt_Resource_Name_String;
   Xt_N_Icon_X                       : constant Xt.Xt_Resource_Name_String;
   Xt_N_Icon_Y                       : constant Xt.Xt_Resource_Name_String;
   Xt_N_Iconic                       : constant Xt.Xt_Resource_Name_String;
   Xt_N_Initial_Resources_Persistent : constant Xt.Xt_Resource_Name_String;
   Xt_N_Initial_State                : constant Xt.Xt_Resource_Name_String;
   Xt_N_Input                        : constant Xt.Xt_Resource_Name_String;
   Xt_N_Insert_Position              : constant Xt.Xt_Resource_Name_String;
   Xt_N_Interact_Callback            : constant Xt.Xt_Resource_Name_String;
   Xt_N_Join_Session                 : constant Xt.Xt_Resource_Name_String;
   Xt_N_Mapped_When_Managed          : constant Xt.Xt_Resource_Name_String;
   Xt_N_Max_Aspect_X                 : constant Xt.Xt_Resource_Name_String;
   Xt_N_Max_Aspect_Y                 : constant Xt.Xt_Resource_Name_String;
   Xt_N_Max_Height                   : constant Xt.Xt_Resource_Name_String;
   Xt_N_Max_Width                    : constant Xt.Xt_Resource_Name_String;
   Xt_N_Min_Aspect_X                 : constant Xt.Xt_Resource_Name_String;
   Xt_N_Min_Aspect_Y                 : constant Xt.Xt_Resource_Name_String;
   Xt_N_Min_Height                   : constant Xt.Xt_Resource_Name_String;
   Xt_N_Min_Width                    : constant Xt.Xt_Resource_Name_String;
   Xt_N_Num_Children                 : constant Xt.Xt_Resource_Name_String;
   Xt_N_Override_Redirect            : constant Xt.Xt_Resource_Name_String;
   Xt_N_Popdown_Callback             : constant Xt.Xt_Resource_Name_String;
   Xt_N_Popup_Callback               : constant Xt.Xt_Resource_Name_String;
   Xt_N_Program_Path                 : constant Xt.Xt_Resource_Name_String;
   Xt_N_Resign_Command               : constant Xt.Xt_Resource_Name_String;
   Xt_N_Restart_Command              : constant Xt.Xt_Resource_Name_String;
   Xt_N_Restart_Style                : constant Xt.Xt_Resource_Name_String;
   Xt_N_Save_Callback                : constant Xt.Xt_Resource_Name_String;
   Xt_N_Save_Complete_Callback       : constant Xt.Xt_Resource_Name_String;
   Xt_N_Save_Under                   : constant Xt.Xt_Resource_Name_String;
   Xt_N_Screen                       : constant Xt.Xt_Resource_Name_String;
   Xt_N_Sensitive                    : constant Xt.Xt_Resource_Name_String;
   Xt_N_Session_Id                   : constant Xt.Xt_Resource_Name_String;
   Xt_N_Shutdown_Command             : constant Xt.Xt_Resource_Name_String;
   Xt_N_Title                        : constant Xt.Xt_Resource_Name_String;
   Xt_N_Title_Encoding               : constant Xt.Xt_Resource_Name_String;
   Xt_N_Transient                    : constant Xt.Xt_Resource_Name_String;
   Xt_N_Transient_For                : constant Xt.Xt_Resource_Name_String;
   Xt_N_Translations                 : constant Xt.Xt_Resource_Name_String;
--   Xt_N_Urgency                      : constant Xt.Xt_Resource_Name_String;
   Xt_N_Visual                       : constant Xt.Xt_Resource_Name_String;
   Xt_N_Wait_For_Wm                  : constant Xt.Xt_Resource_Name_String;
   Xt_N_Width                        : constant Xt.Xt_Resource_Name_String;
   Xt_N_Width_Inc                    : constant Xt.Xt_Resource_Name_String;
   Xt_N_Win_Gravity                  : constant Xt.Xt_Resource_Name_String;
   Xt_N_Window_Group                 : constant Xt.Xt_Resource_Name_String;
--   Xt_N_Window_Role                  : constant Xt.Xt_Resource_Name_String;
   Xt_N_Wm_Timeout                   : constant Xt.Xt_Resource_Name_String;
   Xt_N_X                            : constant Xt.Xt_Resource_Name_String;
   Xt_N_Y                            : constant Xt.Xt_Resource_Name_String;

   --  Resource class constants

   Xt_C_Accelerators                 : constant Xt.Xt_Resource_Class_String;
   Xt_C_Allow_Shell_Resize           : constant Xt.Xt_Resource_Class_String;
   Xt_C_Argc                         : constant Xt.Xt_Resource_Class_String;
   Xt_C_Argv                         : constant Xt.Xt_Resource_Class_String;
   Xt_C_Background                   : constant Xt.Xt_Resource_Class_String;
   Xt_C_Base_Height                  : constant Xt.Xt_Resource_Class_String;
   Xt_C_Base_Width                   : constant Xt.Xt_Resource_Class_String;
   Xt_C_Border_Color                 : constant Xt.Xt_Resource_Class_String;
   Xt_C_Border_Width                 : constant Xt.Xt_Resource_Class_String;
   Xt_C_Callback                     : constant Xt.Xt_Resource_Class_String;
--   Xt_C_Client_Leader                : constant Xt.Xt_Resource_Class_String;
   Xt_C_Clone_Command                : constant Xt.Xt_Resource_Class_String;
   Xt_C_Colormap                     : constant Xt.Xt_Resource_Class_String;
   Xt_C_Connection                   : constant Xt.Xt_Resource_Class_String;
   Xt_C_Create_Popup_Child_Proc      : constant Xt.Xt_Resource_Class_String;
   Xt_C_Current_Directory            : constant Xt.Xt_Resource_Class_String;
   Xt_C_Depth                        : constant Xt.Xt_Resource_Class_String;
--   Xt_C_Dimension                    : constant Xt.Xt_Resource_Class_String;
   Xt_C_Discard_Command              : constant Xt.Xt_Resource_Class_String;
   Xt_C_Environment                  : constant Xt.Xt_Resource_Class_String;
   Xt_C_Geometry                     : constant Xt.Xt_Resource_Class_String;
   Xt_C_Height                       : constant Xt.Xt_Resource_Class_String;
   Xt_C_Height_Inc                   : constant Xt.Xt_Resource_Class_String;
   Xt_C_Icon_Mask                    : constant Xt.Xt_Resource_Class_String;
   Xt_C_Icon_Name                    : constant Xt.Xt_Resource_Class_String;
   Xt_C_Icon_Name_Encoding           : constant Xt.Xt_Resource_Class_String;
   Xt_C_Icon_Pixmap                  : constant Xt.Xt_Resource_Class_String;
   Xt_C_Icon_Window                  : constant Xt.Xt_Resource_Class_String;
   Xt_C_Icon_X                       : constant Xt.Xt_Resource_Class_String;
   Xt_C_Icon_Y                       : constant Xt.Xt_Resource_Class_String;
   Xt_C_Iconic                       : constant Xt.Xt_Resource_Class_String;
   Xt_C_Initial_Resources_Persistent : constant Xt.Xt_Resource_Class_String;
   Xt_C_Initial_State                : constant Xt.Xt_Resource_Class_String;
   Xt_C_Input                        : constant Xt.Xt_Resource_Class_String;
   Xt_C_Insert_Position              : constant Xt.Xt_Resource_Class_String;
   Xt_C_Join_Session                 : constant Xt.Xt_Resource_Class_String;
   Xt_C_Mapped_When_Managed          : constant Xt.Xt_Resource_Class_String;
   Xt_C_Max_Aspect_X                 : constant Xt.Xt_Resource_Class_String;
   Xt_C_Max_Aspect_Y                 : constant Xt.Xt_Resource_Class_String;
   Xt_C_Max_Height                   : constant Xt.Xt_Resource_Class_String;
   Xt_C_Max_Width                    : constant Xt.Xt_Resource_Class_String;
   Xt_C_Min_Aspect_X                 : constant Xt.Xt_Resource_Class_String;
   Xt_C_Min_Aspect_Y                 : constant Xt.Xt_Resource_Class_String;
   Xt_C_Min_Height                   : constant Xt.Xt_Resource_Class_String;
   Xt_C_Min_Width                    : constant Xt.Xt_Resource_Class_String;
   Xt_C_Override_Redirect            : constant Xt.Xt_Resource_Class_String;
   Xt_C_Pixmap                       : constant Xt.Xt_Resource_Class_String;
   Xt_C_Position                     : constant Xt.Xt_Resource_Class_String;
   Xt_C_Program_Path                 : constant Xt.Xt_Resource_Class_String;
   Xt_C_Read_Only                    : constant Xt.Xt_Resource_Class_String;
   Xt_C_Resign_Command               : constant Xt.Xt_Resource_Class_String;
   Xt_C_Restart_Command              : constant Xt.Xt_Resource_Class_String;
   Xt_C_Restart_Style                : constant Xt.Xt_Resource_Class_String;
   Xt_C_Save_Under                   : constant Xt.Xt_Resource_Class_String;
   Xt_C_Screen                       : constant Xt.Xt_Resource_Class_String;
   Xt_C_Sensitive                    : constant Xt.Xt_Resource_Class_String;
   Xt_C_Session_Id                   : constant Xt.Xt_Resource_Class_String;
   Xt_C_Shutdown_Command             : constant Xt.Xt_Resource_Class_String;
   Xt_C_Title                        : constant Xt.Xt_Resource_Class_String;
   Xt_C_Title_Encoding               : constant Xt.Xt_Resource_Class_String;
   Xt_C_Transient                    : constant Xt.Xt_Resource_Class_String;
   Xt_C_Transient_For                : constant Xt.Xt_Resource_Class_String;
   Xt_C_Translations                 : constant Xt.Xt_Resource_Class_String;
--   Xt_C_Urgency                      : constant Xt.Xt_Resource_Class_String;
   Xt_C_Visual                       : constant Xt.Xt_Resource_Class_String;
   Xt_C_Wait_For_Wm                  : constant Xt.Xt_Resource_Class_String;
   Xt_C_Width                        : constant Xt.Xt_Resource_Class_String;
   Xt_C_Width_Inc                    : constant Xt.Xt_Resource_Class_String;
   Xt_C_Win_Gravity                  : constant Xt.Xt_Resource_Class_String;
   Xt_C_Window_Group                 : constant Xt.Xt_Resource_Class_String;
--   Xt_C_Window_Role                  : constant Xt.Xt_Resource_Class_String;
   Xt_C_Wm_Timeout                   : constant Xt.Xt_Resource_Class_String;

   --  Resource type constants

--   Xt_R_Accelerator_Table    : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Atom                 : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Bitmap               : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Bool                 : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Boolean              : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Callback             : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Cardinal             : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Colormap             : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Command_Arg_Array    : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Dimension            : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Directory_String     : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Dynamic_Pixmap       : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Environment_Array    : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Function             : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Gravity              : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Horizontal_Dimension : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Horizontal_Int       : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Horizontal_Position  : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Initial_State        : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Int                  : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Pixel                : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Pixmap               : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Position             : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Restart_Style        : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Screen               : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Smc_Conn             : constant Xt.Xt_Resource_Type_String;
   Xt_R_String               : constant Xt.Xt_Resource_Type_String;
--   Xt_R_String_Array         : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Translation_Table    : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Vertical_Dimension   : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Vertical_Int         : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Vertical_Position    : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Visual               : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Widget               : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Widget_List          : constant Xt.Xt_Resource_Type_String;
--   Xt_R_Window               : constant Xt.Xt_Resource_Type_String;


   --  Enumeration constants

   Xt_E_Off   : constant Interfaces.C.Strings.chars_ptr;
   Xt_E_False : constant Interfaces.C.Strings.chars_ptr;
   Xt_E_No    : constant Interfaces.C.Strings.chars_ptr;
   Xt_E_On    : constant Interfaces.C.Strings.chars_ptr;
   Xt_E_True  : constant Interfaces.C.Strings.chars_ptr;
   Xt_E_Yes   : constant Interfaces.C.Strings.chars_ptr;


private

   Xt_N_Accelerators                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("accelerators");
   Xt_N_Allow_Shell_Resize           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("allowShellResize");
   Xt_N_Ancestor_Sensitive           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("ancestorSensitive");
   Xt_N_Argc                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("argc");
   Xt_N_Argv                         : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("argv");
   Xt_N_Background                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("background");
   Xt_N_Background_Pixmap            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("backgroundPixmap");
   Xt_N_Base_Height                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("baseHeight");
   Xt_N_Base_Width                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("baseWidth");
   Xt_N_Border_Color                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("borderColor");
   Xt_N_Border_Pixmap                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("borderPixmap");
   Xt_N_Border_Width                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("borderWidth");
   Xt_N_Cancel_Callback              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cancelCallback");
   Xt_N_Children                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("children");
--   Xt_N_Client_Leader                : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("clientLeader");
   Xt_N_Clone_Command                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("cloneCommand");
   Xt_N_Colormap                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("colormap");
   Xt_N_Connection                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("connection");
   Xt_N_Create_Popup_Child_Proc      : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("createPopupChildProc");
   Xt_N_Current_Directory            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("currentDirectory");
   Xt_N_Depth                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("depth");
   Xt_N_Destroy_Callback             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("destroyCallback");
   Xt_N_Die_Callback                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("dieCallback");
   Xt_N_Discard_Command              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("discardCommand");
   Xt_N_Environment                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("environment");
   Xt_N_Error_Callback               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("errorCallback");
   Xt_N_Geometry                     : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("geometry");
   Xt_N_Height                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("height");
   Xt_N_Height_Inc                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("heightInc");
   Xt_N_Icon_Mask                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("iconMask");
   Xt_N_Icon_Name                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("iconName");
   Xt_N_Icon_Name_Encoding           : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("iconNameEncoding");
   Xt_N_Icon_Pixmap                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("iconPixmap");
   Xt_N_Icon_Window                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("iconWindow");
   Xt_N_Icon_X                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("iconX");
   Xt_N_Icon_Y                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("iconY");
   Xt_N_Iconic                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("iconic");
   Xt_N_Initial_Resources_Persistent : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("initialResourcesPersistent");
   Xt_N_Initial_State                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("initialState");
   Xt_N_Input                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("input");
   Xt_N_Insert_Position              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("insertPosition");
   Xt_N_Interact_Callback            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("interactCallback");
   Xt_N_Join_Session                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("joinSession");
   Xt_N_Mapped_When_Managed          : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("mappedWhenManaged");
   Xt_N_Max_Aspect_X                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("maxAspectX");
   Xt_N_Max_Aspect_Y                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("maxAspectY");
   Xt_N_Max_Height                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("maxHeight");
   Xt_N_Max_Width                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("maxWidth");
   Xt_N_Min_Aspect_X                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("minAspectX");
   Xt_N_Min_Aspect_Y                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("minAspectY");
   Xt_N_Min_Height                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("minHeight");
   Xt_N_Min_Width                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("minWidth");
   Xt_N_Num_Children                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("numChildren");
   Xt_N_Override_Redirect            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("overrideRedirect");
   Xt_N_Popdown_Callback             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("popdownCallback");
   Xt_N_Popup_Callback               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("popupCallback");
   Xt_N_Program_Path                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("programPath");
   Xt_N_Resign_Command               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("resignCommand");
   Xt_N_Restart_Command              : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("restartCommand");
   Xt_N_Restart_Style                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("restartStyle");
   Xt_N_Save_Callback                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("saveCallback");
   Xt_N_Save_Complete_Callback       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("saveCompleteCallback");
   Xt_N_Save_Under                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("saveUnder");
   Xt_N_Screen                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("screen");
   Xt_N_Sensitive                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("sensitive");
   Xt_N_Session_Id                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("sessionID");
   Xt_N_Shutdown_Command             : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("shutdownCommand");
   Xt_N_Title                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("title");
   Xt_N_Title_Encoding               : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("titleEncoding");
   Xt_N_Transient                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("transient");
   Xt_N_Transient_For                : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("transientFor");
   Xt_N_Translations                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("translations");
--   Xt_N_Urgency                      : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("urgency");
   Xt_N_Visual                       : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("visual");
   Xt_N_Wait_For_Wm                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("waitforwm");
   Xt_N_Width                        : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("width");
   Xt_N_Width_Inc                    : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("widthInc");
   Xt_N_Win_Gravity                  : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("winGravity");
   Xt_N_Window_Group                 : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("windowGroup");
--   Xt_N_Window_Role                  : constant Xt.Xt_Resource_Name_String
--     := Interfaces.C.Strings.New_String ("windowRole");
   Xt_N_Wm_Timeout                   : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("wmTimeout");
   Xt_N_X                            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("x");
   Xt_N_Y                            : constant Xt.Xt_Resource_Name_String
     := Interfaces.C.Strings.New_String ("y");

   Xt_C_Accelerators                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Accelerators");
   Xt_C_Allow_Shell_Resize           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("AllowShellResize");
   Xt_C_Argc                         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Argc");
   Xt_C_Argv                         : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Argv");
   Xt_C_Background                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Background");
   Xt_C_Base_Height                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BaseHeight");
   Xt_C_Base_Width                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BaseWidth");
   Xt_C_Border_Color                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BorderColor");
   Xt_C_Border_Width                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("BorderWidth");
   Xt_C_Callback                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Callback");
--   Xt_C_Client_Leader                : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("ClientLeader");
   Xt_C_Clone_Command                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CloneCommand");
   Xt_C_Colormap                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Colormap");
   Xt_C_Connection                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Connection");
   Xt_C_Create_Popup_Child_Proc      : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CreatePopupChildProc");
   Xt_C_Current_Directory            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("CurrentDirectory");
   Xt_C_Depth                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Depth");
--   Xt_C_Dimension                    : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("Dimension");
   Xt_C_Discard_Command              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("DiscardCommand");
   Xt_C_Environment                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Environment");
   Xt_C_Geometry                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Geometry");
   Xt_C_Height                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Height");
   Xt_C_Height_Inc                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("HeightInc");
   Xt_C_Icon_Mask                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IconMask");
   Xt_C_Icon_Name                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IconName");
   Xt_C_Icon_Name_Encoding           : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IconNameEncoding");
   Xt_C_Icon_Pixmap                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IconPixmap");
   Xt_C_Icon_Window                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IconWindow");
   Xt_C_Icon_X                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IconX");
   Xt_C_Icon_Y                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("IconY");
   Xt_C_Iconic                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Iconic");
   Xt_C_Initial_Resources_Persistent : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InitialResourcesPersistent");
   Xt_C_Initial_State                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InitialState");
   Xt_C_Input                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Input");
   Xt_C_Insert_Position              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("InsertPosition");
   Xt_C_Join_Session                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("JoinSession");
   Xt_C_Mapped_When_Managed          : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MappedWhenManaged");
   Xt_C_Max_Aspect_X                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MaxAspectX");
   Xt_C_Max_Aspect_Y                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MaxAspectY");
   Xt_C_Max_Height                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MaxHeight");
   Xt_C_Max_Width                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MaxWidth");
   Xt_C_Min_Aspect_X                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MinAspectX");
   Xt_C_Min_Aspect_Y                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MinAspectY");
   Xt_C_Min_Height                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MinHeight");
   Xt_C_Min_Width                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("MinWidth");
   Xt_C_Override_Redirect            : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("OverrideRedirect");
   Xt_C_Pixmap                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Pixmap");
   Xt_C_Position                     : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Position");
   Xt_C_Program_Path                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ProgramPath");
   Xt_C_Read_Only                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ReadOnly");
   Xt_C_Resign_Command               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ResignCommand");
   Xt_C_Restart_Command              : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RestartCommand");
   Xt_C_Restart_Style                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("RestartStyle");
   Xt_C_Save_Under                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SaveUnder");
   Xt_C_Screen                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Screen");
   Xt_C_Sensitive                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Sensitive");
   Xt_C_Session_Id                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("SessionID");
   Xt_C_Shutdown_Command             : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("ShutdownCommand");
   Xt_C_Title                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Title");
   Xt_C_Title_Encoding               : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TitleEncoding");
   Xt_C_Transient                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Transient");
   Xt_C_Transient_For                : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("TransientFor");
   Xt_C_Translations                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Translations");
--   Xt_C_Urgency                      : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("Urgency");
   Xt_C_Visual                       : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Visual");
   Xt_C_Wait_For_Wm                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Waitforwm");
   Xt_C_Width                        : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("Width");
   Xt_C_Width_Inc                    : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("WidthInc");
   Xt_C_Win_Gravity                  : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("WinGravity");
   Xt_C_Window_Group                 : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("WindowGroup");
--   Xt_C_Window_Role                  : constant Xt.Xt_Resource_Class_String
--     := Interfaces.C.Strings.New_String ("WindowRole");
   Xt_C_Wm_Timeout                   : constant Xt.Xt_Resource_Class_String
     := Interfaces.C.Strings.New_String ("WmTimeout");

--   Xt_R_Accelerator_Table    : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("AcceleratorTable");
--   Xt_R_Atom                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Atom");
--   Xt_R_Bitmap               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Bitmap");
--   Xt_R_Bool                 : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Bool");
--   Xt_R_Boolean              : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Boolean");
--   Xt_R_Callback             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Callback");
--   Xt_R_Cardinal             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Cardinal");
--   Xt_R_Colormap             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Colormap");
--   Xt_R_Command_Arg_Array    : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("CommandArgArray");
--   Xt_R_Dimension            : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Dimension");
--   Xt_R_Directory_String     : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("DirectoryString");
--   Xt_R_Dynamic_Pixmap       : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("DynamicPixmap");
--   Xt_R_Environment_Array    : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("EnvironmentArray");
--   Xt_R_Function             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Function");
--   Xt_R_Gravity              : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Gravity");
--   Xt_R_Horizontal_Dimension : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("HorizontalDimension");
--   Xt_R_Horizontal_Int       : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("HorizontalInt");
--   Xt_R_Horizontal_Position  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("HorizontalPosition");
--   Xt_R_Initial_State        : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("InitialState");
--   Xt_R_Int                  : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Int");
--   Xt_R_Pixel                : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Pixel");
--   Xt_R_Pixmap               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Pixmap");
--   Xt_R_Position             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Position");
--   Xt_R_Restart_Style        : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("RestartStyle");
--   Xt_R_Screen               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Screen");
--   Xt_R_Smc_Conn             : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("SmcConn");
   Xt_R_String               : constant Xt.Xt_Resource_Type_String
     := Interfaces.C.Strings.New_String ("String");
--   Xt_R_String_Array         : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("StringArray");
--   Xt_R_Translation_Table    : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("TranslationTable");
--   Xt_R_Vertical_Dimension   : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("VerticalDimension");
--   Xt_R_Vertical_Int         : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("VerticalInt");
--   Xt_R_Vertical_Position    : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("VerticalPosition");
--   Xt_R_Visual               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Visual");
--   Xt_R_Widget               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Widget");
--   Xt_R_Widget_List          : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("WidgetList");
--   Xt_R_Window               : constant Xt.Xt_Resource_Type_String
--     := Interfaces.C.Strings.New_String ("Window");

   Xt_E_Off   : constant Interfaces.C.Strings.chars_ptr
     := Interfaces.C.Strings.New_String ("off");
   Xt_E_False : constant Interfaces.C.Strings.chars_ptr
     := Interfaces.C.Strings.New_String ("false");
   Xt_E_No    : constant Interfaces.C.Strings.chars_ptr
     := Interfaces.C.Strings.New_String ("no");
   Xt_E_On    : constant Interfaces.C.Strings.chars_ptr
     := Interfaces.C.Strings.New_String ("on");
   Xt_E_True  : constant Interfaces.C.Strings.chars_ptr
     := Interfaces.C.Strings.New_String ("true");
   Xt_E_Yes   : constant Interfaces.C.Strings.chars_ptr
     := Interfaces.C.Strings.New_String ("yes");

end Xt_String_Defs;
