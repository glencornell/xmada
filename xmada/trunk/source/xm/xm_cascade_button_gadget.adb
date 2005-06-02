with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;

with Xm.Implementation;       use Xm.Implementation;


package body Xm_Cascade_Button_Gadget is


   procedure Xm_Cascade_Button_Gadget_Highlight (The_Widget : in Widget;
                                                 Highlight  : in Boolean)
   is
      procedure XmCascadeButtonGadgetHighlight (The_Widget : in Widget;
                                                Highlight  : in Xt_Boolean);
      pragma Import (C, XmCascadeButtonGadgetHighlight,
                     "XmCascadeButtonGadgetHighlight");
   begin
      Check (The_Widget);
      XmCascadeButtonGadgetHighlight (The_Widget, To_Xt_Boolean (Highlight));
   end Xm_Cascade_Button_Gadget_Highlight;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Cascade_Button_Gadget
   --!    <ImplementationNotes> Проверку Null_Widget производит Xt с выдачей
   --!  соответствующего предупреждения.
   ---------------------------------------------------------------------------
   function Xm_Create_Cascade_Button_Gadget
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Cascade_Button_Gadget
   is
      function XmCreateCascadeButtonGadget (Parent    : in Widget;
                                            Name      : in char_array;
                                            Arg_List  : in Xt_Arg_List;
                                            Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateCascadeButtonGadget,
                     "XmCreateCascadeButtonGadget");
   begin
      return
        XmCreateCascadeButtonGadget
         (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Cascade_Button_Gadget;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Cascade_Button_Gadget
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Cascade_Button_Gadget
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Cascade_Button_Gadget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Cascade_Button_Gadget (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Cascade_Button_Gadget;


end Xm_Cascade_Button_Gadget;
