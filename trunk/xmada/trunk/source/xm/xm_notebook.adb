with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;

with Xm;                      use Xm;
with Xm.Implementation;       use Xm.Implementation;


package body Xm_Notebook is


   function Xm_Create_Managed_Notebook
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Notebook_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Notebook (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Notebook;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Notebook
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Notebook
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Notebook_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateNotebook (Parent    : in Widget;
                                 Name      : in char_array;
                                 Arg_List  : in Xt_Arg_List;
                                 Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateNotebook, "XmCreateNotebook");
   begin
      return XmCreateNotebook (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Notebook;


   procedure Xm_Notebook_Get_Page_Info
    (The_Widget  : in     Xm_Notebook_Widget;
     Page_Number : in     Xm_Notebook_Page_Number;
     Page_Info   :    out Xm_Notebook_Page_Info;
     Status      :    out Xm_Notebook_Page_Status)
   is
      Info : aliased Xm_Notebook_Page_Info;

      function XmNotebookGetPageInfo
       (The_Widget  : in     Widget;
        Page_Number : in     Xm_Notebook_Page_Number;
        Page_Info   : access Xm_Notebook_Page_Info)
          return Xm_Notebook_Page_Status;
      pragma Import (C, XmNotebookGetPageInfo, "XmNotebookGetPageInfo");
   begin
      Check (The_Widget);

      Status := XmNotebookGetPageInfo (The_Widget, Page_Number, Info'Access);
      Page_Info := Info;
   end Xm_Notebook_Get_Page_Info;


end Xm_Notebook;
