with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;


package body Xm_Push_Button_Gadget is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Push_Button_Gadget
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Push_Button_Gadget
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Push_Button_Gadget
   is
      Aux : Widget;
   begin
      Aux := Xm_Create_Push_Button_Gadget (Parent, Name, Arg_List);
      Xt_Manage_Child (Aux);
      return Aux;
   end Xm_Create_Managed_Push_Button_Gadget;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Push_Button_Gadget
   --!    <ImplementationNotes> Проверку Null_Widget производит Xt с выдачей
   --!  соответствующего предупреждения.
   ---------------------------------------------------------------------------
   function Xm_Create_Push_Button_Gadget
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Push_Button_Gadget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreatePushButtonGadget (Parent    : in Widget;
                                         Name      : in char_array;
                                         Arg_List  : in Xt_Arg_List;
                                         Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreatePushButtonGadget, "XmCreatePushButtonGadget");
   begin
      return
        XmCreatePushButtonGadget
         (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Push_Button_Gadget;


end Xm_Push_Button_Gadget;
