with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;


package body Xm_Scroll_Bar is


   function Xm_Create_Managed_Scroll_Bar
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Scroll_Bar_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Scroll_Bar (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Scroll_Bar;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Scroll_Bar
   --!    <ImplementationNotes> Параметр Parent проверяется на нуль значение
   --! в Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Scroll_Bar (Parent   : in Widget;
                             Name     : in String;
                             Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
     return Xm_Scroll_Bar_Widget
   is
      function XmCreateScrollBar (Parent    : in Widget;
                                  Name      : in char_array;
                                  Arg_List  : in Xt_Arg_List;
                                  Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateScrollBar, "XmCreateScrollBar");
   begin
      return
        XmCreateScrollBar (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Scroll_Bar;


end Xm_Scroll_Bar;
