with Xt;
with Xt.Ancillary_Types;

with Xm_Manager;


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
--   XmLGridRowColumnToXY
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
--   XmLGridXYToRowColumn

private

   pragma Linker_Options ("-lXmL");

   pragma Import (C, XmL_Grid_Widget_Class, "XmLGridWidgetClass");

END XmL_Grid;
