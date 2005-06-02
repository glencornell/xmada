with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;


package body Xm_Frame is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Frame
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Frame (Parent   : in Widget;
                             Name     : in String;
                             Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
     return Xm_Frame_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateFrame (Parent    : in Widget;
                              Name      : in char_array;
                              Arg_List  : in Xt_Arg_List;
                              Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateFrame, "XmCreateFrame");
   begin
      return XmCreateFrame (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Frame;


   function Xm_Create_Managed_Frame
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Frame_Widget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Frame (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Frame;


end Xm_Frame;
