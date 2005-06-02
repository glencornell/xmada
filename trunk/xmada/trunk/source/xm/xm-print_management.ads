with Xlib.Extensions.Print;
with Xt;


package Xm.Print_Management is


   procedure Xm_Redisplay_Widget (The_Widget : in Xt.Widget);


   function Xm_Print_Setup
    (Video_Widget     : in Xt.Widget;
     Print_Screen     : in Xlib.Screen;
     Print_Shell_Name : in String;
     Arg_List         : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xt.Widget;


   function Xm_Print_To_File
    (The_Display : in Xlib.Display;
     File_Name   : in String;
     Finish_Proc : in Xlib.Extensions.Print.Xp_Finish_Proc := null;
     Client_Data : in Xt.Xt_Pointer
       := Xt.Null_Xt_Pointer)
       return Boolean;


end Xm.Print_Management;
