with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;


package body Xm_Scale is


   function Xm_Create_Managed_Scale
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Scale_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Scale (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Scale;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Scale
   --!    <ImplementationNotes> Параметр Parent проверяется на нуль значение
   --! в Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Scale (Parent   : in Widget;
                             Name     : in String;
                             Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
     return Xm_Scale_Widget
   is
      function XmCreateScale (Parent    : in Widget;
                              Name      : in char_array;
                              Arg_List  : in Xt_Arg_List;
                              Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateScale, "XmCreateScale");
   begin
      return XmCreateScale (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Scale;


end Xm_Scale;
