
with Interfaces.C;

with Xlib;
with Xt;
with Xt.Ancillary_Types;
with Xm_Manager;
with XmL;

package XmL_Grid is

   subtype XmL_Grid_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype XmL_Grid_Class is Xm_Manager.Xm_Manager_Class;

   XmL_Grid_Widget_Class : constant XmL_Grid_Class;

   --

   function XmL_Create_Grid
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return XmL_Grid_Widget;

   function XmL_Create_Managed_Grid
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return XmL_Grid_Widget;


   --

--   XmLGridAddColumns
--   XmLGridAddRows
--   XmLGridColumnIsVisible
--   XmLGridDeleteAllColumns
--   XmLGridDeleteAllRows
--   XmLGridDeleteColumns
--   XmLGridDeleteRows
--   XmLGridDeselectAllCells
--   XmLGridDeselectAllColumns
--   XmLGridDeselectAllRows
--   XmLGridDeselectCell
--   XmLGridDeselectColumn
--   XmLGridDeselectRow
--   XmLGridEditBegin
--   XmLGridEditCancel
--   XmLGridEditComplete
--   XmLGridGetColumn
--   XmLGridGetFocus
--   XmLGridGetRow
--   XmLGridGetSelectedCellCount
--   XmLGridGetSelectedCells
--   XmLGridGetSelectedColumnCount
--   XmLGridGetSelectedColumns
--   XmLGridGetSelectedRow
--   XmLGridGetSelectedRowCount
--   XmLGridGetSelectedRows
--   XmLGridMoveColumns
--   XmLGridMoveRows
--   XmLGridRead
--   XmLGridReadPos
--   XmLGridRedrawAll
--   XmLGridRedrawCell
--   XmLGridRedrawColumn
--   XmLGridRedrawRow
--   XmLGridReorderColumns
--   XmLGridReorderRows

   procedure XmL_Grid_Row_Column_To_XY
    (The_Widget  : in     XmL_Grid_Widget;
     Row_Type    : in     XmL.Xm_Row_Type;
     Row         : in     Interfaces.C.int;
     Column_Type : in     XmL.Xm_Column_Type;
     Column      : in     Interfaces.C.int;
     Clipped     : in     Boolean;
     Rectangle   :    out Xlib.X_Rectangle;
     Exists      :    out Boolean);

--   XmLGridRowlsVisible
--   XmLGridSelectAllCells
--   XmLGridSelectAllColumns
--   XmLGridSelectAllRows
--   XmLGridSelectCell
--   XmLGridSelectColumn
--   XmLGridSelectRow
--   XmLGridSetFocus
--   XmLGridSetStrings
--   XmLGridSetStringsPos
--   XmLGridWrite
--   XmLGridWritePos

   procedure XmL_Grid_XY_To_Row_Column
    (The_Widget  : in     XmL_Grid_Widget;
     X           : in     Xt.Position;
     Y           : in     Xt.Position;
     Row_Type    :    out XmL.Xm_Row_Type;
     Row         :    out Interfaces.C.int;
     Column_Type :    out XmL.Xm_Column_Type;
     Column      :    out Interfaces.C.int;
     Exists      :    out Boolean);

private

   pragma Linker_Options ("-lXmL");

   pragma Import (C, XmL_Grid_Widget_Class, "xmlGridWidgetClass");

end XmL_Grid;
