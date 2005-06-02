with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;

with Xm;                      use Xm;
with Xm.Implementation;       use Xm.Implementation;


package body Xm_Selection_Box is


   function Xm_Create_Managed_Selection_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Selection_Box_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Selection_Box (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Selection_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Prompt_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Prompt_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Selection_Box_Widget
   is
      function XmCreatePromptDialog (Parent    : in Widget;
                                     Name      : in char_array;
                                     Arg_List  : in Xt_Arg_List;
                                     Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreatePromptDialog, "XmCreatePromptDialog");
   begin
      return
        XmCreatePromptDialog (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Prompt_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Selection_Box
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Selection_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Selection_Box_Widget
   is
      function XmCreateSelectionBox (Parent    : in Widget;
                                     Name      : in char_array;
                                     Arg_List  : in Xt_Arg_List;
                                     Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateSelectionBox, "XmCreateSelectionBox");
   begin
      return
        XmCreateSelectionBox (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Selection_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Selection_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Selection_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Selection_Box_Widget
   is
      function XmCreateSelectionDialog (Parent    : in Widget;
                                        Name      : in char_array;
                                        Arg_List  : in Xt_Arg_List;
                                        Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateSelectionDialog, "XmCreateSelectionDialog");
   begin
      return XmCreateSelectionDialog (Parent,
                                      To_C (Name),
                                      Arg_List,
                                      Arg_List'Length);
   end Xm_Create_Selection_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Selection_Box_Get_Child
   --!    <ImplementationNotes> Допустимость значения параметра Child
   --! проверяет Xm.
   ---------------------------------------------------------------------------
   function Xm_Selection_Box_Get_Child
    (The_Widget : in Xm_Selection_Box_Widget;
     Child      : in Xm_Child_Type)
       return Widget
   is
      function XmSelectionBoxGetChild (The_Widget : in Widget;
                                       Child      : in Xm_Child_Type)
        return Widget;
      pragma Import (C, XmSelectionBoxGetChild, "XmSelectionBoxGetChild");
   begin
      Check (The_Widget);
      return XmSelectionBoxGetChild (The_Widget, Child);
   end Xm_Selection_Box_Get_Child;


end Xm_Selection_Box;
