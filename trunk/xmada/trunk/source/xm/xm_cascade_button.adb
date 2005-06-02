with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;

with Xm.Implementation;       use Xm.Implementation;


package body Xm_Cascade_Button is


   procedure Xm_Cascade_Button_Highlight (The_Widget : in Widget;
                                          Highlight  : in Boolean)
   is
      procedure XmCascadeButtonHighlight (The_Widget : in Widget;
                                          Highlight  : in Xt_Boolean);
      pragma Import (C, XmCascadeButtonHighlight, "XmCascadeButtonHighlight");
   begin
      Check (The_Widget);
      XmCascadeButtonHighlight (The_Widget, To_Xt_Boolean (Highlight));
   end Xm_Cascade_Button_Highlight;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Cascade_Button
   --!    <ImplementationNotes> Проверку Null_Widget производит Xt с выдачей
   --!  соответствующего предупреждения.
   ---------------------------------------------------------------------------
   function Xm_Create_Cascade_Button
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Cascade_Button_Widget
   is
      function XmCreateCascadeButton (Parent    : in Widget;
                                      Name      : in char_array;
                                      Arg_List  : in Xt_Arg_List;
                                      Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateCascadeButton, "XmCreateCascadeButton");
   begin
      return
        XmCreateCascadeButton (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Cascade_Button;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Cascade_Button
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Cascade_Button
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Cascade_Button_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Cascade_Button (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Cascade_Button;


end Xm_Cascade_Button;
