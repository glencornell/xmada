with Xt;
with Xt.Ancillary_Types;

with Xm_Manager;


package Xm_Frame is

   subtype Xm_Frame_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Frame_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Frame_Widget_Class : constant Xm_Frame_Class;

   --

   --

   function Xm_Create_Frame (Parent   : in Xt.Widget;
                             Name     : in String;
                             Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
                               := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Frame_Widget;


   function Xm_Create_Managed_Frame
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Frame_Widget;


private

   pragma Import (C, Xm_Frame_Widget_Class, "xmFrameWidgetClass");

end Xm_Frame;
