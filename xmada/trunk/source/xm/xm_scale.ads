with Xt;
with Xt.Ancillary_Types;

with Xm_Manager;


package Xm_Scale is

   subtype Xm_Scale_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Scale_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Scale_Widget_Class : constant Xm_Scale_Class;

   --

   function Xm_Create_Scale
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Scale_Widget;


   function Xm_Create_Managed_Scale
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Scale_Widget;


private

   pragma Import (C, Xm_Scale_Widget_Class, "xmScaleWidgetClass");

end Xm_Scale;
