with Xlib.Atoms;
with Xlib.Implementation;


package Xlib.Extensions.Input_Device is


   type X_Input_Device_Usage_Type is (Is_X_Pointer,
                                      Is_X_Keyboard,
                                      Is_X_Extension_Device);
   pragma Convention (C, X_Input_Device_Usage_Type);
   for X_Input_Device_Usage_Type'Size use Interfaces.C.unsigned_char'Size;

   type X_Input_Device_Class_Type is (Key_Class,
                                      Button_Class,
                                      Valuator_Class,
                                      Feedback_Class,
                                      Proximity_Class,
                                      Focus_Class,
                                      Other_Class);
   pragma Convention (C, X_Input_Device_Class_Type);
   for X_Input_Device_Class_Type'Size use X_Id'Size;


   type X_Input_Device_Valuator_Mode_Type is (Relative,
                                              Absolute);
   pragma Convention (C, X_Input_Device_Valuator_Mode_Type);
   for X_Input_Device_Valuator_Mode_Type'Size
     use Interfaces.C.unsigned_char'Size;


   type X_Input_Class_Info is record
      Input_Class     : Interfaces.C.unsigned_char;
      Event_Type_Base : Interfaces.C.unsigned_char;
   end record;

   type X_Input_Class_Info_Pointer is access all X_Input_Class_Info;

   type X_Device_Record is record
      Device_Id   : X_Id;
      Num_Classes : Interfaces.C.int;
      Classes     : X_Input_Class_Info_Pointer;
   end record;

   type X_Device is access all X_Device_Record;


   type X_Axis_Info is record
      Resolution : Interfaces.C.int;
      Min_Value  : Interfaces.C.int;
      Max_Value  : Interfaces.C.int;
   end record;
   pragma Convention (C, X_Axis_Info);

   type X_Axis_Info_Pointer is access all X_Axis_Info;
   pragma Convention (C, X_Axis_Info_Pointer);

   type X_Axis_Info_List is array (Natural range <>) of aliased X_Axis_Info;


   function To_X_Axis_Info_List is
     new Implementation.Generic_To_Element_List (X_Axis_Info,
                                                 X_Axis_Info_Pointer,
                                                 X_Axis_Info_List);


   type X_Any_Class_Info (Class : X_Input_Device_Class_Type) is record
      Length : Interfaces.C.int;
      case Class is
         when Key_Class =>
            Min_Keycode   : Interfaces.C.unsigned_short;
            Max_Keycode   : Interfaces.C.unsigned_short;
            Num_Keys      : Interfaces.C.unsigned_short;

         when Button_Class =>
            Num_Buttons   : Interfaces.C.short;

         when Valuator_Class =>
            Num_Axes      : Interfaces.C.unsigned_char;
            Mode          : X_Input_Device_Valuator_Mode_Type;
            Motion_Buffer : Interfaces.C.unsigned_long;
            Axes          : X_Axis_Info_Pointer;

         when others =>
            null;
      end case;
   end record;
   pragma Convention (C, X_Any_Class_Info);

   subtype X_Key_Info      is X_Any_Class_Info (Key_Class);
   subtype X_Button_Info   is X_Any_Class_Info (Button_Class);
   subtype X_Valuator_Info is X_Any_Class_Info (Valuator_Class);

   type X_Any_Class_Info_Pointer is access all X_Any_Class_Info;
   pragma Convention (C, X_Any_Class_Info_Pointer);

   type X_Any_Class_Info_Pointer_List is
     array (Natural range <>) of X_Any_Class_Info_Pointer;


   function To_X_Any_Class_Info_Pointer_List
    (Pointer : in X_Any_Class_Info_Pointer;
     Length  : in Interfaces.C.int)
       return X_Any_Class_Info_Pointer_List;


   type X_Device_Info is record
      Id               : X_Id;
      Device_Type      : Atoms.Atom;
      Name             : X_String_Pointer;
      Num_Classes      : Interfaces.C.int;
      Device_Usage     : X_Input_Device_Usage_Type;
      Input_Class_Info : X_Any_Class_Info_Pointer;
   end record;
   pragma Convention (C, X_Device_Info);

   type X_Device_Info_List is array (Natural range <>) of aliased X_Device_Info;
   pragma Convention (C, X_Device_Info_List);

   type X_Device_Info_Pointer is access all X_Device_Info;
   pragma Convention (C, X_Device_Info_Pointer);

   function To_X_Device_Info_List is
     new Implementation.Generic_To_Element_List (X_Device_Info,
                                                 X_Device_Info_Pointer,
                                                 X_Device_Info_List);



   Xi_Keyboard    : aliased constant String := "KEYBOARD";
   Xi_Mouse       : aliased constant String := "MOUSE";
   Xi_Tablet      : aliased constant String := "TABLET";
   Xi_Touchscreen : aliased constant String := "TOUCHSCREEN";
   Xi_Touchpad    : aliased constant String := "TOUCHPAD";
   Xi_Barcode     : aliased constant String := "BARCODE";
   Xi_Buttonbox   : aliased constant String := "BUTTONBOX";
   Xi_Knob_Box    : aliased constant String := "KNOB_BOX";
   Xi_One_Knob    : aliased constant String := "ONE_KNOB";
   Xi_Nine_Knob   : aliased constant String := "NINE_KNOB";
   Xi_Trackball   : aliased constant String := "TRACKBALL";
   Xi_Quadrature  : aliased constant String := "QUADRATURE";
   Xi_Id_Module   : aliased constant String := "ID_MODULE";
   Xi_Spaceball   : aliased constant String := "SPACEBALL";
   Xi_Dataglove   : aliased constant String := "DATAGLOVE";
   Xi_Eyetracker  : aliased constant String := "EYETRACKER";
   Xi_Cursorkeys  : aliased constant String := "CURSORKEYS";
   Xi_Footmouse   : aliased constant String := "FOOTMOUSE";


--   procedure X_Change_Keyboard_Device (The_Display : in Display;
--                                       Device      : in X_Device);

--   procedure X_Change_Pointer_Device



   function X_List_Input_Devices (The_Display : in     Display;
                                  Num_Devices : access Interfaces.C.int)
     return X_Device_Info_Pointer;


   function X_Open_Device (The_Display : in Display;
                           Device_Id   : in X_Id)
     return X_Device;


   procedure X_Close_Device (The_Display : in Display;
                             Device      : in X_Device);


   Invalid_Device_Error : exception;


private

   pragma Linker_Options ("-lXi");

   pragma Convention (C, X_Input_Class_Info);
   pragma Convention (C, X_Input_Class_Info_Pointer);
   pragma Convention (C, X_Device_Record);
   pragma Convention (C, X_Device);

--   pragma Import (C, X_Change_Keyboard_Device, "XChangeKeyboardDevice");

end Xlib.Extensions.Input_Device;
