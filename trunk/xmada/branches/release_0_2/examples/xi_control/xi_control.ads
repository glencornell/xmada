with Xt;


package Xi_Control is


   App_Context        : Xt.Xt_App_Context;
   App_Shell          : Xt.Widget;
   Device_List        : Xt.Widget;
   Device_X_Id_Field  : Xt.Widget;
   Device_Type_Field  : Xt.Widget;
   Device_Use_Field   : Xt.Widget;
   Class_List         : Xt.Widget;
   Key_Pane           : Xt.Widget;
   Key_Min_Keycode    : Xt.Widget;
   Key_Max_Keycode    : Xt.Widget;
   Key_Num_Keys       : Xt.Widget;
   Button_Pane        : Xt.Widget;
   Button_Num_Buttons : Xt.Widget;
   Valuator_Pane      : Xt.Widget;
   Valuator_Num_Axes  : Xt.Widget;
   Valuator_Mode      : Xt.Widget;
   Valuator_Buffer    : Xt.Widget;
   Valuator_Header    : Xt.Widget;
   Valuator_Axes_List : Xt.Widget;

   Set_Keyboard       : Xt.Widget;
   Set_Pointer        : Xt.Widget;


   procedure Initialize_Device_Type_Mapping;


   procedure Reload_Device_List;


   procedure On_Set_Core_Pointer (The_Widget : in Xt.Widget;
                                  Closure    : in Xt.Xt_Pointer;
                                  Call_Data  : in Xt.Xt_Pointer);
   pragma Convention (C, On_Set_Core_Pointer);


   procedure On_Class_Browse_Selection (The_Widget : in Xt.Widget;
                                        Closure    : in Xt.Xt_Pointer;
                                        Call_Data  : in Xt.Xt_Pointer);
   pragma Convention (C, On_Class_Browse_Selection);


   procedure On_Device_Browse_Selection (The_Widget : in Xt.Widget;
                                         Closure    : in Xt.Xt_Pointer;
                                         Call_Data  : in Xt.Xt_Pointer);
   pragma Convention (C, On_Device_Browse_Selection);


   procedure On_Quit (The_Widget : in Xt.Widget;
                      Closure    : in Xt.Xt_Pointer;
                      Call_Data  : in Xt.Xt_Pointer);
   pragma Convention (C, On_Quit);


end Xi_Control;
