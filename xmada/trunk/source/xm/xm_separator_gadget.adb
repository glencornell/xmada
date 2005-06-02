with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;


package body Xm_Separator_Gadget is


   function Xm_Create_Managed_Separator_Gadget
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Separator_Gadget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Separator_Gadget (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Separator_Gadget;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Separator_Gadget
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Separator_Gadget
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Separator_Gadget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateSeparatorGadget (Parent    : in Widget;
                                        Name      : in char_array;
                                        Arg_List  : in Xt_Arg_List;
                                        Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateSeparatorGadget, "XmCreateSeparatorGadget");
   begin
      return
        XmCreateSeparatorGadget (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Separator_Gadget;


end Xm_Separator_Gadget;
