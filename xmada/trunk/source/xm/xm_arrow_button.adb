with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;


package body Xm_Arrow_Button is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Arrow_Button
   --!    <ImplementationNotes> Проверку Null_Widget производит Xt с выдачей
   --!  соответствующего предупреждения.
   ---------------------------------------------------------------------------
   function Xm_Create_Arrow_Button
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Arrow_Button_Widget
   is
      function XmCreateArrowButton (Parent    : in Widget;
                                    Name      : in char_array;
                                    Arg_List  : in Xt_Arg_List;
                                    Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateArrowButton, "XmCreateArrowButton");
   begin
      return
        XmCreateArrowButton (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Arrow_Button;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Arrow_Button
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Arrow_Button
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Arrow_Button_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Arrow_Button (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Arrow_Button;


end Xm_Arrow_Button;
