with Xt;                       use Xt;
with Xt.Ancillary_Types;       use Xt.Ancillary_Types;
with Xt.Callbacks;             use Xt.Callbacks;
with Xt.Event_Management;      use Xt.Event_Management;
with Xt.Initializers;          use Xt.Initializers;
with Xt.Instance_Management;   use Xt.Instance_Management;
with Xt.Resource_Management;   use Xt.Resource_Management;
with Xt_Session_Shell;         use Xt_Session_Shell;
with Xm;                       use Xm;
with Xm.Resource_Management;   use Xm.Resource_Management;
with Xm_Cascade_Button_Gadget; use Xm_Cascade_Button_Gadget;
with Xm_Form;                  use Xm_Form;
with Xm_Frame;                 use Xm_Frame;
with Xm_Label_Gadget;          use Xm_Label_Gadget;
with Xm_List;                  use Xm_List;
with Xm_Main_Window;           use Xm_Main_Window;
with Xm_Paned_Window;          use Xm_Paned_Window;
with Xm_Push_Button_Gadget;    use Xm_Push_Button_Gadget;
with Xm_Row_Column;            use Xm_Row_Column;
with Xm_Separator_Gadget;      use Xm_Separator_Gadget;
with Xm_String_Defs;           use Xm_String_Defs;
with Xm_Text_Field;            use Xm_Text_Field;

with Xi_Control;               use Xi_Control;


procedure Xi_Control_Driver is
   Top       : Widget;
   Menu      : Widget;
   Submenu   : Widget;
   Button    : Widget;
   Work      : Widget;
   Form      : Widget;
   Frame     : Widget;
   Label     : Widget;
   Separator : Widget;
   Argl      : Xt_Arg_List (0 .. 7);
begin
   Xt_Set_Language_Proc;

   Xt_Open_Application (App_Shell, App_Context, "AdaXInputDeviceControl",
                        The_Widget_Class => Session_Shell_Widget_Class);

   Top := Xm_Create_Managed_Main_Window (App_Shell, "top");

   Menu := Xm_Create_Managed_Menu_Bar (Top, "main_menu");

   Submenu := Xm_Create_Pulldown_Menu (Menu, "devices_menu");

   Set_Keyboard :=
     Xm_Create_Managed_Push_Button_Gadget (Submenu, "set_keyboard");

   Set_Pointer :=
     Xm_Create_Managed_Push_Button_Gadget (Submenu, "set_pointer");
   Xt_Add_Callback (Set_Pointer,
                    Xm_N_Activate_Callback,
                    On_Set_Core_Pointer'Access);

   Separator := Xm_Create_Managed_Separator_Gadget (Submenu, "sep");

   Button := Xm_Create_Managed_Push_Button_Gadget (Submenu, "exit");
   Xt_Add_Callback (Button, Xm_N_Activate_Callback, On_Quit'Access);

   Xt_Set_Arg (Argl (0), Xm_N_Sub_Menu_Id, Submenu);
   Button :=
     Xm_Create_Managed_Cascade_Button_Gadget (Menu,
                                              "devices",
                                              Argl (0 .. 0));

   Work := Xm_Create_Managed_Paned_Window (Top, "work_area");

   Frame := Xm_Create_Managed_Frame (Work, "device_list_frame");

   Xt_Set_Arg (Argl (0), Xm_N_Frame_Child_Type, Xm_Frame_Title_Child);
   Label :=
     Xm_Create_Managed_Label_Gadget (Frame, "input_devices", Argl (0 .. 0));

   Device_List := Xm_Create_Managed_Scrolled_List (Frame, "device_list");
   Xt_Add_Callback (Device_List,
                    Xm_N_Browse_Selection_Callback,
                    On_Device_Browse_Selection'Access);

   Form := Xm_Create_Managed_Form (Work, "form");

   Xt_Set_Arg (Argl (0), Xm_N_Traversal_On, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Editable, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Cursor_Position_Visible, Xt_False);
   Xt_Set_Arg (Argl (2), Xm_N_Top_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Form);
   Device_X_Id_Field :=
     Xm_Create_Managed_Text_Field (Form, "x_id_field", Argl (0 .. 3));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Device_X_Id_Field);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Widget, Device_X_Id_Field);
   Xt_Set_Arg (Argl (5), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (6), Xm_N_Bottom_Widget, Device_X_Id_Field);
   Label := Xm_Create_Managed_Label_Gadget (Form, "x_id", Argl (0 .. 6));

   Xt_Set_Arg (Argl (0), Xm_N_Traversal_On, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Editable, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Cursor_Position_Visible, Xt_False);
   Xt_Set_Arg (Argl (2), Xm_N_Top_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (3), Xm_N_Top_Widget, Device_X_Id_Field);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Attachment, Xm_Attach_Form);
   Device_Type_Field :=
     Xm_Create_Managed_Text_Field (Form, "type_field", Argl (0 .. 4));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Device_Type_Field);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Widget, Device_Type_Field);
   Xt_Set_Arg (Argl (5), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (6), Xm_N_Bottom_Widget, Device_Type_Field);
   Label := Xm_Create_Managed_Label_Gadget (Form, "type", Argl (0 .. 6));

   Xt_Set_Arg (Argl (0), Xm_N_Traversal_On, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Editable, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Cursor_Position_Visible, Xt_False);
   Xt_Set_Arg (Argl (2), Xm_N_Top_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (3), Xm_N_Top_Widget, Device_Type_Field);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Attachment, Xm_Attach_Form);
   Device_Use_Field :=
     Xm_Create_Managed_Text_Field (Form, "use_field", Argl (0 .. 4));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Device_Use_Field);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Widget, Device_Use_Field);
   Xt_Set_Arg (Argl (5), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (6), Xm_N_Bottom_Widget, Device_Use_Field);
   Label := Xm_Create_Managed_Label_Gadget (Form, "use", Argl (0 .. 6));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Device_Use_Field);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (4), Xm_N_Bottom_Attachment, Xm_Attach_Form);
   Frame := Xm_Create_Managed_Frame (Form, "form", Argl (0 .. 4));

   Xt_Set_Arg (Argl (0), Xm_N_Frame_Child_Type, Xm_Frame_Title_Child);
   Label :=
     Xm_Create_Managed_Label_Gadget (Frame,
                                     "device_classes",
                                     Argl (0 .. 0));

   Class_List := Xm_Create_Managed_Scrolled_List (Frame, "class_list");
   Xt_Add_Callback (Class_List,
                    Xm_N_Browse_Selection_Callback,
                    On_Class_Browse_Selection'Access);

   --  Панель информации о классе Key_Class.

   Key_Pane := Xm_Create_Form (Work, "key_pane");

   Xt_Set_Arg (Argl (0), Xm_N_Traversal_On, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Editable, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Cursor_Position_Visible, Xt_False);
   Xt_Set_Arg (Argl (2), Xm_N_Top_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Form);
   Key_Min_Keycode :=
     Xm_Create_Managed_Text_Field (Key_Pane,
                                   "min_keycode_field",
                                   Argl (0 .. 3));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Key_Min_Keycode);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Widget, Key_Min_Keycode);
   Xt_Set_Arg (Argl (5), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (6), Xm_N_Bottom_Widget, Key_Min_Keycode);
   Label :=
     Xm_Create_Managed_Label_Gadget (Key_Pane,
                                     "min_keycode",
                                     Argl (0 .. 6));

   Xt_Set_Arg (Argl (0), Xm_N_Traversal_On, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Editable, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Cursor_Position_Visible, Xt_False);
   Xt_Set_Arg (Argl (2), Xm_N_Top_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (3), Xm_N_Top_Widget, Key_Min_Keycode);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Attachment, Xm_Attach_Form);
   Key_Max_Keycode :=
     Xm_Create_Managed_Text_Field (Key_Pane,
                                   "max_keycode_field",
                                   Argl (0 .. 4));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Key_Max_Keycode);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Widget, Key_Max_Keycode);
   Xt_Set_Arg (Argl (5), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (6), Xm_N_Bottom_Widget, Key_Max_Keycode);
   Label :=
     Xm_Create_Managed_Label_Gadget (Key_Pane,
                                     "max_keycode",
                                     Argl (0 .. 6));

   Xt_Set_Arg (Argl (0), Xm_N_Traversal_On, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Editable, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Cursor_Position_Visible, Xt_False);
   Xt_Set_Arg (Argl (2), Xm_N_Top_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (3), Xm_N_Top_Widget, Key_Max_Keycode);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Attachment, Xm_Attach_Form);
   Key_Num_Keys :=
     Xm_Create_Managed_Text_Field (Key_Pane,
                                   "num_keys_field",
                                   Argl (0 .. 4));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Key_Num_Keys);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Widget, Key_Num_Keys);
   Xt_Set_Arg (Argl (5), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (6), Xm_N_Bottom_Widget, Key_Num_Keys);
   Label :=
     Xm_Create_Managed_Label_Gadget (Key_Pane, "num_keys", Argl (0 .. 6));

   --  Панель информации о классе Button_Class.

   Button_Pane := Xm_Create_Form (Work, "button_pane");

   Xt_Set_Arg (Argl (0), Xm_N_Traversal_On, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Editable, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Cursor_Position_Visible, Xt_False);
   Xt_Set_Arg (Argl (2), Xm_N_Top_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Form);
   Button_Num_Buttons :=
     Xm_Create_Managed_Text_Field (Button_Pane,
                                   "num_buttons_field",
                                   Argl (0 .. 3));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Button_Num_Buttons);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Widget, Button_Num_Buttons);
   Xt_Set_Arg (Argl (5), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (6), Xm_N_Bottom_Widget, Button_Num_Buttons);
   Label :=
     Xm_Create_Managed_Label_Gadget (Button_Pane,
                                     "num_buttons",
                                     Argl (0 .. 6));

   --  Панель информации о классе Valuator_Class.

   Valuator_Pane := Xm_Create_Form (Work, "valuator_pane");

   Xt_Set_Arg (Argl (0), Xm_N_Traversal_On, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Editable, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Cursor_Position_Visible, Xt_False);
   Xt_Set_Arg (Argl (2), Xm_N_Top_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Form);
   Valuator_Num_Axes :=
     Xm_Create_Managed_Text_Field (Valuator_Pane,
                                   "num_axes_field",
                                   Argl (0 .. 3));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Valuator_Num_Axes);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Widget, Valuator_Num_Axes);
   Xt_Set_Arg (Argl (5), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (6), Xm_N_Bottom_Widget, Valuator_Num_Axes);
   Label :=
     Xm_Create_Managed_Label_Gadget (Valuator_Pane,
                                     "num_axes",
                                     Argl (0 .. 6));

   Xt_Set_Arg (Argl (0), Xm_N_Traversal_On, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Editable, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Cursor_Position_Visible, Xt_False);
   Xt_Set_Arg (Argl (2), Xm_N_Top_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (3), Xm_N_Top_Widget, Valuator_Num_Axes);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Attachment, Xm_Attach_Form);
   Valuator_Mode :=
     Xm_Create_Managed_Text_Field (Valuator_Pane,
                                   "mode_field",
                                   Argl (0 .. 4));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Valuator_Mode);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Widget, Valuator_Mode);
   Xt_Set_Arg (Argl (5), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (6), Xm_N_Bottom_Widget, Valuator_Mode);
   Label :=
     Xm_Create_Managed_Label_Gadget (Valuator_Pane, "mode", Argl (0 .. 6));

   Xt_Set_Arg (Argl (0), Xm_N_Traversal_On, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Editable, Xt_False);
   Xt_Set_Arg (Argl (1), Xm_N_Cursor_Position_Visible, Xt_False);
   Xt_Set_Arg (Argl (2), Xm_N_Top_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (3), Xm_N_Top_Widget, Valuator_Mode);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Attachment, Xm_Attach_Form);
   Valuator_Buffer :=
     Xm_Create_Managed_Text_Field (Valuator_Pane,
                                   "motion_buffer_field",
                                   Argl (0 .. 4));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Valuator_Buffer);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (4), Xm_N_Right_Widget, Valuator_Buffer);
   Xt_Set_Arg (Argl (5), Xm_N_Bottom_Attachment, Xm_Attach_Opposite_Widget);
   Xt_Set_Arg (Argl (6), Xm_N_Bottom_Widget, Valuator_Buffer);
   Label :=
     Xm_Create_Managed_Label_Gadget (Valuator_Pane,
                                     "motion_buffer",
                                     Argl (0 .. 6));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Valuator_Buffer);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (4), Xm_N_Bottom_Attachment, Xm_Attach_Form);
   Frame :=
     Xm_Create_Managed_Frame (Valuator_Pane, "axes_frame", Argl (0 .. 4));

   Xt_Set_Arg (Argl (0), Xm_N_Frame_Child_Type, Xm_Frame_Title_Child);
   Label :=
     Xm_Create_Managed_Label_Gadget (Frame, "axes_info", Argl (0 .. 0));

   Form := Xm_Create_Managed_Form (Frame, "axes_form");

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (1), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (2), Xm_N_Right_Attachment, Xm_Attach_Form);
   Valuator_Header :=
     Xm_Create_Managed_Label_Gadget (Form,
                                     "resolution_min_max",
                                     Argl (0 .. 2));

   Xt_Set_Arg (Argl (0), Xm_N_Top_Attachment, Xm_Attach_Widget);
   Xt_Set_Arg (Argl (1), Xm_N_Top_Widget, Valuator_Header);
   Xt_Set_Arg (Argl (2), Xm_N_Left_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (3), Xm_N_Right_Attachment, Xm_Attach_Form);
   Xt_Set_Arg (Argl (4), Xm_N_Bottom_Attachment, Xm_Attach_Form);
   Valuator_Axes_List :=
     Xm_Create_Managed_Scrolled_List (Form, "axes_list", Argl (0 .. 4));

   Initialize_Device_Type_Mapping;
   Reload_Device_List;

   Xt_Realize_Widget (App_Shell);
   Xt_App_Main_Loop (App_Context);
end Xi_Control_Driver;
