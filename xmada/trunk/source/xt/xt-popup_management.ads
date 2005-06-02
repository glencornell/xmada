with Xt.Ancillary_Types;


package Xt.Popup_Management is

   type Xt_Grab_Kind is (Xt_Grab_None,
                         Xt_Grab_Nonexclusive,
                         Xt_Grab_Exclusive);
   pragma Convention (C, Xt_Grab_Kind);
   for Xt_Grab_Kind'Size use Interfaces.C.int'Size;


   function Xt_Create_Popup_Shell
    (Name             : in String;
     The_Widget_Class : in Widget_Class;
     Parent           : in Widget;
     Args             : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Widget;


   procedure Xt_Popup (Popup_Shell : in Widget;
                       Grab_Kind   : in Xt_Grab_Kind);

   procedure Xt_Popdown (Popup_Shell : in Widget);


end Xt.Popup_Management;
