with Xlib;
with Xt;
with Xt.Ancillary_Types;

with Xm_Manager;


package Xm_Container is

   subtype Xm_Container_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Container_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Container_Widget_Class : constant Xm_Container_Class;

   --

   function Xm_Create_Container
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Container_Widget;


   function Xm_Create_Managed_Container
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Container_Widget;

   --

   procedure Xm_Container_Relayout (The_Widget : in Xm_Container_Widget);


   procedure Xm_Container_Reorder
    (The_Widget : in Xm_Container_Widget;
     Widgets    : in Xt.Ancillary_Types.Xt_Widget_List);


   function Xm_Container_Copy (The_Widget : in Xm_Container_Widget;
                               Timestamp  : in Xlib.Time)
     return Boolean;


   function Xm_Container_Copy_Link (The_Widget : in Xm_Container_Widget;
                                    Timestamp  : in Xlib.Time)
     return Boolean;


   function Xm_Container_Cut (The_Widget : in Xm_Container_Widget;
                              Timestamp  : in Xlib.Time)
     return Boolean;


   function Xm_Container_Paste (The_Widget : in Xm_Container_Widget)
     return Boolean;


   function Xm_Container_Paste_Link (The_Widget : in Xm_Container_Widget)
     return Boolean;


private

   pragma Import (C, Xm_Container_Widget_Class, "xmContainerWidgetClass");

end Xm_Container;
