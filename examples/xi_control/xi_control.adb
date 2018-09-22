with Ada.Text_IO;                  use Ada.Text_IO;
with Interfaces.C;                 use Interfaces.C;
with Interfaces.C.Strings;         use Interfaces.C.Strings;

with Xlib;                         use Xlib;
with Xlib.Atoms;                   use Xlib.Atoms;
with Xlib.Extensions.Input_Device; use Xlib.Extensions.Input_Device;
with Xt;                           use Xt;
with Xt.Ancillary_Types;           use Xt.Ancillary_Types;
with Xt.Composite_Management;      use Xt.Composite_Management;
with Xt.Instance_Management;       use Xt.Instance_Management;
with Xt.Resource_Management;       use Xt.Resource_Management;
with Xt.Utilities;                 use Xt.Utilities;
with Xm;                           use Xm;
with Xm.Render_Tables;             use Xm.Render_Tables;
with Xm.Resource_Management;       use Xm.Resource_Management;
with Xm.Strings;                   use Xm.Strings;
with Xm_List;                      use Xm_List;
with Xm_String_Defs;               use Xm_String_Defs;
with Xm_Text_Field;                use Xm_Text_Field;


package body Xi_Control is


   Current_Pane       : Widget := Null_Widget;


   type String_Constant_Access is access constant String;

   type Device_Type_Mapping_Item is record
      Name : String_Constant_Access;
      Atom : Xlib.Atoms.Atom;
   end record;


   Device_Type_Mapping : array (Positive range <>) of Device_Type_Mapping_Item
     := ((Xi_Keyboard'Access,    0),
         (Xi_Mouse'Access,       0),
         (Xi_Tablet'Access,      0),
         (Xi_Touchscreen'Access, 0),
         (Xi_Touchpad'Access,    0),
         (Xi_Barcode'Access,     0),
         (Xi_Buttonbox'Access,   0),
         (Xi_Knob_Box'Access,    0),
         (Xi_One_Knob'Access,    0),
         (Xi_Nine_Knob'Access,   0),
         (Xi_Trackball'Access,   0),
         (Xi_Quadrature'Access,  0),
         (Xi_Id_Module'Access,   0),
         (Xi_Spaceball'Access,   0),
         (Xi_Dataglove'Access,   0),
         (Xi_Eyetracker'Access,  0),
         (Xi_Cursorkeys'Access,  0),
         (Xi_Footmouse'Access,   0));

   Input_Device_Info  : X_Device_Info_Pointer;
   Input_Device_Count : aliased int;
   Selected_Device    : X_Device_Info;


   function Find_Device (Name : in String) return X_Device_Info;


   procedure Hide_Class_Pane;


   function Is_Current_Keyboard (Device : in X_Device_Info) return Boolean;


   function Is_Current_Pointer (Device : in X_Device_Info) return Boolean;


   function Is_Keyboard (Device : in X_Device_Info) return Boolean;


   function Is_Pointer (Device : in X_Device_Info) return Boolean;


   function Find_Device (Name : in String) return X_Device_Info is
      Devices : constant X_Device_Info_List
        := To_X_Device_Info_List (Input_Device_Info,
                                  Natural (Input_Device_Count));
   begin
      for J in Devices'Range loop
         if Value (Devices (J).Name) = Name then
            return Devices (J);
         end if;
      end loop;

      raise Program_Error;
   end Find_Device;


   procedure Hide_Class_Pane is
   begin
      if Current_Pane /= Null_Widget then
         Xt_Unmanage_Child (Current_Pane);
         Current_Pane := Null_Widget;
      end if;
   end Hide_Class_Pane;


   procedure Initialize_Device_Type_Mapping is
   begin
      -- Loading atoms to identify devices.
      for J in Device_Type_Mapping'Range loop
         declare
            Item : Device_Type_Mapping_Item renames Device_Type_Mapping (J);
         begin
            Item.Atom := X_Intern_Atom (Xt_Display (App_Shell), Item.Name.all);
         end;
      end loop;
   end Initialize_Device_Type_Mapping;


   function Is_Current_Keyboard (Device : in X_Device_Info) return Boolean is
   begin
      return Device.Device_Usage = Is_X_Keyboard;
   end Is_Current_Keyboard;


   function Is_Current_Pointer (Device : in X_Device_Info) return Boolean is
   begin
      return Device.Device_Usage = Is_X_Pointer;
   end Is_Current_Pointer;


   function Is_Keyboard (Device : in X_Device_Info) return Boolean is
      Classes : constant X_Any_Class_Info_Pointer_List
        := To_X_Any_Class_Info_Pointer_List (Device.Input_Class_Info,
                                             Device.Num_Classes);
   begin
      for J in Classes'Range loop
         if Classes (J).Class = Key_Class then
            return True;
         end if;
      end loop;

      return False;
   end Is_Keyboard;


   function Is_Pointer (Device : in X_Device_Info) return Boolean is
      Classes : constant X_Any_Class_Info_Pointer_List
        := To_X_Any_Class_Info_Pointer_List (Device.Input_Class_Info,
                                             Device.Num_Classes);
   begin
      for J in Classes'Range loop
         if Classes (J).Class = Valuator_Class
           and then Classes (J).Num_Axes >= 2
         then
            return True;
         end if;
      end loop;

      return False;
   end Is_Pointer;


   procedure On_Class_Browse_Selection (The_Widget : in Widget;
                                        Closure    : in Xt_Pointer;
                                        Call_Data  : in Xt_Pointer)
   is
      pragma Unreferenced (The_Widget);
      pragma Unreferenced (Closure);

      Data    : constant Xm_List_Callback_Struct_Access
        := To_Callback_Struct_Access (Call_Data);
      Classes : constant X_Any_Class_Info_Pointer_List
        := To_X_Any_Class_Info_Pointer_List (Selected_Device.Input_Class_Info,
                                             Selected_Device.Num_Classes);
      Class   : constant X_Any_Class_Info
        := Classes (Integer (Data.Item_Position) - 1).all;
      Str     : Xm_String;
   begin
      Hide_Class_Pane;

      case Class.Class is
         when Key_Class =>
            Current_Pane := Key_Pane;
            declare
               Min_Image : constant String
                 := unsigned_short'Image (Class.Min_Keycode);
               Max_Image : constant String
                 := unsigned_short'Image (Class.Max_Keycode);
               Num_Image : constant String
                 := unsigned_short'Image (Class.Num_Keys);
            begin
               Xm_Text_Field_Set_String
                (Key_Min_Keycode,
                 Min_Image (Min_Image'First + 1 .. Min_Image'Last));
               Xm_Text_Field_Set_String
                (Key_Max_Keycode,
                 Max_Image (Max_Image'First + 1 .. Max_Image'Last));
               Xm_Text_Field_Set_String
                (Key_Num_Keys,
                 Num_Image (Num_Image'First + 1 .. Num_Image'Last));
            end;

         when Button_Class =>
            Current_Pane := Button_Pane;
            declare
               Num_Image : constant String := short'Image (Class.Num_Buttons);
            begin
               Xm_Text_Field_Set_String
                (Button_Num_Buttons,
                 Num_Image (Num_Image'First + 1 .. Num_Image'Last));
            end;

         when Valuator_Class =>
            Current_Pane := Valuator_Pane;
            declare
               Num_Image    : constant String
                 := unsigned_char'Image (Class.Num_Axes);
               Buf_Image    : constant String
                 := unsigned_long'Image (Class.Motion_Buffer);
               Axes         : constant X_Axis_Info_List
                 := To_X_Axis_Info_List (Class.Axes, Natural (Class.Num_Axes));
               Items        : Xm_String_List (Axes'First .. Axes'Last + 1);
               Render_Table : Xm_Render_Table;
               Rendition    : Xm_Rendition;
               Tab_List     : Xm_Tab_List;
               Argl         : Xt_Arg_List (0 .. 0);
            begin
               Xm_Text_Field_Set_String
                (Valuator_Num_Axes,
                 Num_Image (Num_Image'First + 1 .. Num_Image'Last));

               case Class.Mode is
                  when Absolute =>
                     Xm_Text_Field_Set_String (Valuator_Mode, "Absolute");
                  when Relative =>
                     Xm_Text_Field_Set_String (Valuator_Mode, "Relative");
               end case;

               Xm_Text_Field_Set_String
                (Valuator_Buffer,
                 Buf_Image (Buf_Image'First + 1 .. Buf_Image'Last));

               Xm_List_Deselect_All_Items (Valuator_Axes_List);
               Xm_List_Delete_All_Items (Valuator_Axes_List);
               for J in Axes'Range loop
                  declare
                     Res_Image : constant String
                       := int'Image (Axes (J).Resolution);
                     Min_Image : constant String
                       := int'Image (Axes (J).Min_Value);
                     Max_Image : constant String
                       := int'Image (Axes (J).Max_Value);
                  begin
                     Str :=
                       Xm_String_Generate
                        (Res_Image (Res_Image'First + 1 .. Res_Image'Last));
                     Str :=
                       Xm_String_Concat_And_Free (Str, Xm_String_Tab_Create);
                     Str :=
                       Xm_String_Concat_And_Free
                        (Str,
                         Xm_String_Generate
                          (Min_Image (Min_Image'First + 1 .. Min_Image'Last)));
                     Str :=
                       Xm_String_Concat_And_Free (Str, Xm_String_Tab_Create);
                     Str :=
                       Xm_String_Concat_And_Free
                        (Str,
                         Xm_String_Generate
                          (Max_Image (Max_Image'First + 1 .. Max_Image'Last)));

                     Items (J) := Str;
                  end;
               end loop;
               Xt_Set_Arg (Argl (0),
                           Xm_N_Label_String,
                           Items (Items'Last)'Address);
               Xt_Get_Values (Valuator_Header, Argl (0 .. 0));

               Xm_List_Add_Items (Valuator_Axes_List,
                                  Items (Items'First .. Items'Last - 1));

               Tab_List :=
                 Xm_String_Table_Propose_Tablist (Items,
                                                  Valuator_Axes_List,
                                                  5.0,
                                                  Xm_Relative);
               for J in Items'Range loop
                  Xm_String_Free (Items (J));
               end loop;

               Xt_Set_Arg (Argl (0), Xm_N_Render_Table, Render_Table'Address);
               Xt_Get_Values (Valuator_Axes_List, Argl (0 .. 0));

               Rendition :=
                 Xm_Render_Table_Get_Rendition (Render_Table,
                                                Motif_Default_Locale);
               if Rendition = Null_Xm_Rendition then
                  Rendition :=
                    Xm_Render_Table_Get_Rendition (Render_Table,
                                                   Xm_Fontlist_Default_Tag);
               end if;

               Xt_Set_Arg (Argl (0), Xm_N_Tab_List, Tab_List);
               Xm_Rendition_Update (Rendition, Argl (0 .. 0));
               Xm_Tab_List_Free (Tab_List);

               Render_Table :=
                 Xm_Render_Table_Add_Rendition
                  (Xm_Render_Table_Copy (Render_Table,
                                         Null_Xm_String_Tag_List),
                   Rendition,
                   Xm_Merge_Replace);
               Xm_Rendition_Free (Rendition);

               Xt_Set_Arg (Argl (0), Xm_N_Render_Table, Render_Table);
               Xt_Set_Values (Valuator_Header, Argl (0 .. 0));
               Xt_Set_Values (Valuator_Axes_List, Argl (0 .. 0));
               Xm_Render_Table_Free (Render_Table);
            end;

         when others =>
            raise Program_Error;
      end case;

      Xt_Manage_Child (Current_Pane);
   end On_Class_Browse_Selection;


   procedure On_Device_Browse_Selection (The_Widget : in Widget;
                                         Closure    : in Xt_Pointer;
                                         Call_Data  : in Xt_Pointer)
   is
      pragma Unreferenced (The_Widget);
      pragma Unreferenced (Closure);

      Data     : constant Xm_List_Callback_Struct_Access
        := To_Callback_Struct_Access (Call_Data);
      Name     : constant String := Xm_String_Unparse (Data.Item);
      Device   : constant X_Device_Info := Find_Device (Name);
      Id_Image : constant String := X_Id'Image (Device.Id);
      Str      : Xm_String;
   begin
      Hide_Class_Pane;

      Selected_Device := Device;

      Xm_Text_Field_Set_String
       (Device_X_Id_Field,
        Id_Image (Id_Image'First + 1 .. Id_Image'Last));

      Xm_Text_Field_Set_String (Device_Type_Field, String'(""));
      for J in Device_Type_Mapping'Range loop
         if Device_Type_Mapping (J).Atom = Device.Device_Type then
            Xm_Text_Field_Set_String (Device_Type_Field,
                                      Device_Type_Mapping (J).Name.all);
            exit;
         end if;
      end loop;

      case Device.Device_Usage is
         when Is_X_Pointer =>
            Xm_Text_Field_Set_String (Device_Use_Field,
                                      String'("Current pointer"));
         when Is_X_Keyboard =>
            Xm_Text_Field_Set_String (Device_Use_Field,
                                      String'("Current keyboard"));
         when Is_X_Extension_Device =>
            Xm_Text_Field_Set_String (Device_Use_Field,
                                      String'("Extension device"));
      end case;

      Xm_List_Deselect_All_Items (Class_List);
      Xm_List_Delete_All_Items (Class_List);
      declare
         Classes : constant X_Any_Class_Info_Pointer_List
           := To_X_Any_Class_Info_Pointer_List (Device.Input_Class_Info,
                                                Device.Num_Classes);
      begin
         for J in Classes'Range loop
            case Classes (J).Class is
               when Key_Class =>
                  Str := Xm_String_Generate (String'("Key"));
               when Button_Class =>
                  Str := Xm_String_Generate (String'("Button"));
               when Valuator_Class =>
                  Str := Xm_String_Generate (String'("Valuator"));
               when others =>
                  raise Program_Error;
            end case;
            Xm_List_Add_Item (Class_List, Str);
         end loop;
      end;
      if Device.Num_Classes /= 0 then
         Xm_List_Select_Pos (Class_List, 1);
      end if;

      Xt_Set_Sensitive (Set_Keyboard,
                        Is_Keyboard (Selected_Device)
                          and not Is_Current_Keyboard (Selected_Device));
      Xt_Set_Sensitive (Set_Pointer,
                        Is_Pointer (Selected_Device)
                         and not Is_Current_Pointer (Selected_Device));
   end On_Device_Browse_Selection;


   procedure On_Quit (The_Widget : in Widget;
                      Closure    : in Xt_Pointer;
                      Call_Data  : in Xt_Pointer)
   is
      pragma Unreferenced (Closure);
      pragma Unreferenced (Call_Data);
   begin
      Xt_App_Set_Exit_Flag (Xt_Widget_To_Application_Context (The_Widget));
   end On_Quit;


   procedure On_Set_Core_Pointer (The_Widget : in Widget;
                                  Closure    : in Xt_Pointer;
                                  Call_Data  : in Xt_Pointer)
   is
      Device : X_Device;
   begin
      Device :=
        X_Open_Device (Xt_Display_Of_Object (The_Widget), Selected_Device.Id);
Put_Line ("Try to set core pointer");
null;
   end On_Set_Core_Pointer;


   procedure Reload_Device_List is
   begin
      -- Load the list of input devices.
      Input_Device_Info :=
        X_List_Input_Devices (Xt_Display (App_Shell),
                              Input_Device_Count'Access);
      
      -- Filling in the list of devices.
      Xm_List_Deselect_All_Items (Device_List);
      declare
         Devices : constant X_Device_Info_List
           := To_X_Device_Info_List (Input_Device_Info,
                                     Natural (Input_Device_Count));
         Str     : Xm_String;
      begin
         for J in Devices'Range loop
            Str := Xm_String_Generate (Value (Devices (J).Name));
            Xm_List_Add_Item (Device_List, Str);
            Xm_String_Free (Str);
         end loop;
      end;
      Xm_List_Select_Pos (Device_List, 1);
   end Reload_Device_List;


end Xi_Control;
