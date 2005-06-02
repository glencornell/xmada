with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;
with Xm;                      use Xm;
with Xm.Implementation;       use Xm.Implementation;


package body Xm_Toggle_Button is


   function Xm_Create_Managed_Toggle_Button
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Toggle_Button_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Toggle_Button (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Toggle_Button;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Toggle_Button
   --!    <ImplementationNotes> Параметр Parent проверяется на нуль значение
   --! в Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Toggle_Button
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Toggle_Button_Widget
   is
      function XmCreateToggleButton (Parent    : in Widget;
                                     Name      : in char_array;
                                     Arg_List  : in Xt_Arg_List;
                                     Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateToggleButton, "XmCreateToggleButton");
   begin
      return
        XmCreateToggleButton (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Toggle_Button;


   function Xm_Toggle_Button_Get_State
    (The_Widget : in Xm_Toggle_Button_Widget)
       return Boolean
   is
      function XmToggleButtonGetState (The_Widget : in Widget)
        return Xt_Boolean;
      pragma Import (C, XmToggleButtonGetState, "XmToggleButtonGetState");
   begin
      Check (The_Widget);
      return To_Boolean (XmToggleButtonGetState (The_Widget));
   end Xm_Toggle_Button_Get_State;


   procedure Xm_Toggle_Button_Set_State
    (The_Widget : in Xm_Toggle_Button_Widget;
     State      : in Boolean;
     Notify     : in Boolean)
   is
      procedure XmToggleButtonSetState (The_Widget : in Widget;
                                        State      : in Xt_Boolean;
                                        Notify     : in Xt_Boolean);
      pragma Import (C, XmToggleButtonSetState, "XmToggleButtonSetState");
   begin
      Check (The_Widget);

      XmToggleButtonSetState
       (The_Widget, To_Xt_Boolean (State), To_Xt_Boolean (Notify));
   end Xm_Toggle_Button_Set_State;


   procedure Xm_Toggle_Button_Set_Value
    (The_Widget : in Xm_Toggle_Button_Widget;
     Value      : in Xm_Toggle_Button_State;
     Notify     : in Boolean)
   is
      procedure XmToggleButtonSetValue (The_Widget : in Widget;
                                        Value      : in Xm_Toggle_Button_State;
                                        Notify     : in Xt_Boolean);
      pragma Import (C, XmToggleButtonSetValue, "XmToggleButtonSetValue");
   begin
      Check (The_Widget);

      XmToggleButtonSetValue (The_Widget, Value, To_Xt_Boolean (Notify));
   end Xm_Toggle_Button_Set_Value;


end Xm_Toggle_Button;
