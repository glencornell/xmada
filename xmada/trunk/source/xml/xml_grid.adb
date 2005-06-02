with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;


package body XmL_Grid is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Grid
   --!    <ImplementationNotes> Параметр Parent проверяется на нуль значение
   --! в Xt.
   ---------------------------------------------------------------------------
   function XmL_Create_Grid
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return XmL_Grid_Widget
   is
      function XmLCreateGrid (Parent    : in Widget;
                              Name      : in char_array;
                              Arg_List  : in Xt_Arg_List;
                              Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmLCreateGrid, "XmLCreateGrid");
   begin
      return
        XmLCreateGrid (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end XmL_Create_Grid;

   function XmL_Create_Managed_Grid
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return XmL_Grid_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := XmL_Create_Grid (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end XmL_Create_Managed_Grid;

end XmL_Grid;
