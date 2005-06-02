with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;


package body Xm_Drawing_Area is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Drawing_Area
   --!    <ImplementationNotes> Проверку параметра Parent осуществляет Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Drawing_Area
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Drawing_Area_Widget
   is
      function XmCreateDrawingArea (Parent     : in Widget;
                                    Name       : in char_array;
                                    Arg_List   : in Xt_Arg_List;
                                    Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateDrawingArea, "XmCreateDrawingArea");
   begin
      return
        XmCreateDrawingArea (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Drawing_Area;


   function Xm_Create_Managed_Drawing_Area
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Drawing_Area_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Drawing_Area (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Drawing_Area;


end Xm_Drawing_Area;
