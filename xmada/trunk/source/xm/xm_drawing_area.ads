with Xt;
with Xt.Ancillary_Types;

with Xm_Manager;


package Xm_Drawing_Area is

   subtype Xm_Drawing_Area_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Drawing_Area_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Drawing_Area_Widget_Class : constant Xm_Drawing_Area_Class;

   --

   function Xm_Create_Drawing_Area
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Drawing_Area_Widget;


   function Xm_Create_Managed_Drawing_Area
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Drawing_Area_Widget;


private

   pragma Import (C, Xm_Drawing_Area_Widget_Class, "xmDrawingAreaWidgetClass");

end Xm_Drawing_Area;
