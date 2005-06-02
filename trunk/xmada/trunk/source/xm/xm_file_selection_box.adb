with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;

with Xm;                      use Xm;
with Xm.Implementation;       use Xm.Implementation;


package body Xm_File_Selection_Box is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_File_Selection_Box
   --!    <ImplementationNotes> Параметр Parent проверяется на нуль значение
   --! в Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_File_Selection_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_File_Selection_Box_Widget
   is
      function XmCreateFileSelectionBox (Parent    : in Widget;
                                         Name      : in char_array;
                                         Arg_List  : in Xt_Arg_List;
                                         Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateFileSelectionBox, "XmCreateFileSelectionBox");
   begin
      return XmCreateFileSelectionBox (Parent,
                                       To_C (Name),
                                       Arg_List,
                                       Arg_List'Length);
   end Xm_Create_File_Selection_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_File_Selection_Dialog
   --!    <ImplementationNotes> Параметр Parent проверяется на нуль значение
   --! в Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_File_Selection_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_File_Selection_Box_Widget
   is
      function XmCreateFileSelectionDialog (Parent    : in Widget;
                                            Name      : in char_array;
                                            Arg_List  : in Xt_Arg_List;
                                            Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateFileSelectionDialog,
                     "XmCreateFileSelectionDialog");
   begin
      return XmCreateFileSelectionDialog (Parent,
                                          To_C (Name),
                                          Arg_List,
                                          Arg_List'Length);
   end Xm_Create_File_Selection_Dialog;


   function Xm_Create_Managed_File_Selection_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_File_Selection_Box_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_File_Selection_Box (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_File_Selection_Box;


   function Xm_File_Selection_Box_Get_Child
    (The_Widget : in Xm_File_Selection_Box_Widget;
     Child      : in Xm_Dialog_Child_Type)
       return Widget
   is
      function XmFileSelectionBoxGetChild
       (The_Widget : in Widget;
        Child      : in Xm_Dialog_Child_Type)
          return Widget;
      pragma Import (C, XmFileSelectionBoxGetChild,
                     "XmFileSelectionBoxGetChild");
   begin
      Check (The_Widget);

      return XmFileSelectionBoxGetChild (The_Widget, Child);
   end Xm_File_Selection_Box_Get_Child;


   procedure Xm_File_Selection_Do_Search
    (The_Widget : in Xm_File_Selection_Box_Widget;
     Dir_Mask   : in Xm_String)
   is
      procedure XmFileSelectionDoSearch (The_Widget : in Widget;
                                         Dir_Mask   : in Xm_String);
      pragma Import (C, XmFileSelectionDoSearch, "XmFileSelectionDoSearch");
   begin
      Check (The_Widget);

      XmFileSelectionDoSearch (The_Widget, Dir_Mask);
   end Xm_File_Selection_Do_Search;


end Xm_File_Selection_Box;
