with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;


package body Xm_Form is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Form
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Form (Parent   : in Widget;
                            Name     : in String;
                            Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
     return Xm_Form_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateForm (Parent    : in Widget;
                             Name      : in char_array;
                             Arg_List  : in Xt_Arg_List;
                             Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateForm, "XmCreateForm");
   begin
      return XmCreateForm (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Form;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Form_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Form_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Form_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateFormDialog (Parent    : in Widget;
                                   Name      : in char_array;
                                   Arg_List  : in Xt_Arg_List;
                                   Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateFormDialog, "XmCreateFormDialog");
   begin
      return XmCreateFormDialog (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Form_Dialog;


   function Xm_Create_Managed_Form
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Form_Widget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Form (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Form;


end Xm_Form;
