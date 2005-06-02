with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;
with Xm.Implementation;       use Xm.Implementation;


package body Xm_Toggle_Button_Gadget is


   function Xm_Create_Managed_Toggle_Button_Gadget
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Toggle_Button_Gadget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Toggle_Button_Gadget (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Toggle_Button_Gadget;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Toggle_Button_Gadget
   --!    <ImplementationNotes> Параметр Parent проверяется на нуль значение
   --! в Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Toggle_Button_Gadget
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Toggle_Button_Gadget
   is
      function XmCreateToggleButtonGadget (Parent    : in Widget;
                                           Name      : in char_array;
                                           Arg_List  : in Xt_Arg_List;
                                           Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateToggleButtonGadget,
                     "XmCreateToggleButtonGadget");
   begin
      return XmCreateToggleButtonGadget (Parent,
                                         To_C (Name),
                                         Arg_List,
                                         Arg_List'Length);
   end Xm_Create_Toggle_Button_Gadget;


   function Xm_Toggle_Button_Gadget_Get_State
    (The_Widget : in Xm_Toggle_Button_Gadget)
       return Boolean
   is
      function XmToggleButtonGadgetGetState (The_Widget : in Widget)
        return Xt_Boolean;
      pragma Import (C, XmToggleButtonGadgetGetState,
                     "XmToggleButtonGadgetGetState");
   begin
      Check (The_Widget);
      return To_Boolean (XmToggleButtonGadgetGetState (The_Widget));
   end Xm_Toggle_Button_Gadget_Get_State;


   procedure Xm_Toggle_Button_Gadget_Set_State
    (The_Widget : in Xm_Toggle_Button_Gadget;
     State      : in Boolean;
     Notify     : in Boolean)
   is
      procedure XmToggleButtonGadgetSetState (The_Widget : in Widget;
                                              State      : in Xt_Boolean;
                                              Notify     : in Xt_Boolean);
      pragma Import (C, XmToggleButtonGadgetSetState,
                     "XmToggleButtonGadgetSetState");
   begin
      Check (The_Widget);

      XmToggleButtonGadgetSetState
       (The_Widget, To_Xt_Boolean (State), To_Xt_Boolean (Notify));
   end Xm_Toggle_Button_Gadget_Set_State;


end Xm_Toggle_Button_Gadget;
