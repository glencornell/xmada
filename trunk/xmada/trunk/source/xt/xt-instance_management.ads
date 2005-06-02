with Xt.Ancillary_Types;


package Xt.Instance_Management is


   function Xt_Create_Widget
    (Name             : in String;
     The_Widget_Class : in Widget_Class;
     Parent           : in Widget;
     Args             : in Ancillary_Types.Xt_Arg_List
       := Ancillary_Types.Null_Xt_Arg_List)
       return Widget;


   function Xt_Create_Managed_Widget
    (Name             : in String;
     The_Widget_Class : in Widget_Class;
     Parent           : in Widget;
     Args             : in Ancillary_Types.Xt_Arg_List
       := Ancillary_Types.Null_Xt_Arg_List)
       return Widget;


   procedure Xt_Destroy_Widget (W : in Widget);


   procedure Xt_Realize_Widget (W : in Widget);

   procedure Xt_Unrealize_Widget (W : in Widget);

   function Xt_Is_Realized (W : in Widget) return Boolean;


   procedure Xt_Map_Widget (W : in Widget);

   procedure Xt_Unmap_Widget (W : in Widget);

   procedure Xt_Set_Mapped_When_Managed (W                : in Widget;
                                         Map_When_Managed : in Boolean);


   function Xt_Parent (W : in Widget) return Widget;


end Xt.Instance_Management;
