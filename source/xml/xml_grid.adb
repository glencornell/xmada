
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

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> XmL_Grid_Row_Column_To_XY
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure XmL_Grid_Row_Column_To_XY
    (The_Widget  : in     XmL_Grid_Widget;
     Row_Type    : in     XmL.Xm_Row_Type;
     Row         : in     Interfaces.C.int;
     Column_Type : in     XmL.Xm_Column_Type;
     Column      : in     Interfaces.C.int;
     Clipped     : in     Boolean;
     Rectangle   :    out Xlib.X_Rectangle;
     Exists      :    out Boolean)
   is

      function XmLGridRowColumnToXY (The_Widget  : in     XmL_Grid_Widget;
                                     Row_Type    : in     XmL.Xm_Row_Type;
                                     Row         : in     Interfaces.C.int;
                                     Column_Type : in     XmL.Xm_Column_Type;
                                     Column      : in     Interfaces.C.int;
                                     Clipped     : in     Xt_Boolean;
                                     Rectangle   : access Xlib.X_Rectangle)
        return Interfaces.C.int;
      pragma Import (C, XmLGridRowColumnToXY, "XmLGridRowColumnToXY");

      C_Rectangle : aliased Xlib.X_Rectangle;

   begin
      Exists :=
        XmLGridRowColumnToXY (The_Widget,
                              Row_Type,
                              Row,
                              Column_Type,
                              Column,
                              To_Xt_Boolean (Clipped),
                              C_Rectangle'Access)
          = 0;

      Rectangle := C_Rectangle;
   end XmL_Grid_Row_Column_To_XY;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> XmL_Grid_XY_To_Row_Column
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure XmL_Grid_XY_To_Row_Column
    (The_Widget  : in     XmL_Grid_Widget;
     X           : in     Xt.Position;
     Y           : in     Xt.Position;
     Row_Type    :    out XmL.Xm_Row_Type;
     Row         :    out Interfaces.C.int;
     Column_Type :    out XmL.Xm_Column_Type;
     Column      :    out Interfaces.C.int;
     Exists      :    out Boolean)
   is

      function XmLGridXYToRowColumn (The_Widget  : in     XmL_Grid_Widget;
                                     X           : in     Interfaces.C.int;
                                     Y           : in     Interfaces.C.int;
                                     Row_Type    : access XmL.Xm_Row_Type;
                                     Row         : access Interfaces.C.int;
                                     Column_Type : access XmL.Xm_Column_Type;
                                     Column      : access Interfaces.C.int)
        return Interfaces.C.int;
      pragma Import (C, XmLGridXYToRowColumn, "XmLGridXYToRowColumn");

      C_Row_Type    : aliased XmL.Xm_Row_Type;
      C_Row         : aliased Interfaces.C.int;
      C_Column_Type : aliased XmL.Xm_Column_Type;
      C_Column      : aliased Interfaces.C.int;

   begin
      Exists :=
        XmLGridXYToRowColumn (The_Widget,
                              Interfaces.C.int (X),
                              Interfaces.C.int (Y),
                              C_Row_Type'Access,
                              C_Row'Access,
                              C_Column_Type'Access,
                              C_Column'Access) = 0;

      Row_Type    := C_Row_Type;
      Row         := C_Row;
      Column_Type := C_Column_Type;
      Column      := C_Column;
   end XmL_Grid_XY_To_Row_Column;

end XmL_Grid;
