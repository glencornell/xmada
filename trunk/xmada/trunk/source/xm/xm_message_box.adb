with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;

with Xm;                      use Xm;
with Xm.Implementation;       use Xm.Implementation;


package body Xm_Message_Box is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Error_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Error_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateErrorDialog (Parent    : in Widget;
                                    Name      : in char_array;
                                    Arg_List  : in Xt_Arg_List;
                                    Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateErrorDialog, "XmCreateErrorDialog");
   begin
      return
        XmCreateErrorDialog (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Error_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Information_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Information_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateInformationDialog (Parent    : in Widget;
                                          Name      : in char_array;
                                          Arg_List  : in Xt_Arg_List;
                                          Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateInformationDialog,
                     "XmCreateInformationDialog");
   begin
      return XmCreateInformationDialog (Parent,
                                        To_C (Name),
                                        Arg_List,
                                        Arg_List'Length);
   end Xm_Create_Information_Dialog;


   function Xm_Create_Managed_Message_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Message_Box (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Message_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Message_Box
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Message_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateMessageBox (Parent    : in Widget;
                                   Name      : in char_array;
                                   Arg_List  : in Xt_Arg_List;
                                   Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateMessageBox, "XmCreateMessageBox");
   begin
      return
        XmCreateMessageBox (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Message_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Message_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Message_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateMessageDialog (Parent    : in Widget;
                                      Name      : in char_array;
                                      Arg_List  : in Xt_Arg_List;
                                      Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateMessageDialog, "XmCreateMessageDialog");
   begin
      return
        XmCreateMessageDialog (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Message_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Question_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Question_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateQuestionDialog (Parent    : in Widget;
                                       Name      : in char_array;
                                       Arg_List  : in Xt_Arg_List;
                                       Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateQuestionDialog, "XmCreateQuestionDialog");
   begin
      return XmCreateQuestionDialog (Parent,
                                     To_C (Name),
                                     Arg_List,
                                     Arg_List'Length);
   end Xm_Create_Question_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Template_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Template_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateTemplateDialog (Parent    : in Widget;
                                       Name      : in char_array;
                                       Arg_List  : in Xt_Arg_List;
                                       Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateTemplateDialog, "XmCreateTemplateDialog");
   begin
      return XmCreateTemplateDialog (Parent,
                                     To_C (Name),
                                     Arg_List,
                                     Arg_List'Length);
   end Xm_Create_Template_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Warning_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Warning_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateWarningDialog (Parent    : in Widget;
                                      Name      : in char_array;
                                      Arg_List  : in Xt_Arg_List;
                                      Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateWarningDialog, "XmCreateWarningDialog");
   begin
      return
        XmCreateWarningDialog (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Warning_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Working_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Working_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateWorkingDialog (Parent    : in Widget;
                                      Name      : in char_array;
                                      Arg_List  : in Xt_Arg_List;
                                      Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateWorkingDialog, "XmCreateWorkingDialog");
   begin
      return
        XmCreateWorkingDialog (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Working_Dialog;


   function Xm_Message_Box_Get_Child (The_Widget : in Xm_Message_Box_Widget;
                                      Child      : in Xm_Dialog_Child_Type)
     return Widget
   is
      function XmMessageBoxGetChild (The_Widget : in Widget;
                                     Child      : in Xm_Dialog_Child_Type)
        return Widget;
      pragma Import (C, XmMessageBoxGetChild, "XmMessageBoxGetChild");
   begin
      Check (The_Widget);

      return XmMessageBoxGetChild (The_Widget, Child);
   end Xm_Message_Box_Get_Child;


end Xm_Message_Box;
