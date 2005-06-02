with Interfaces.C;          use Interfaces.C;

with Xlib;                  use Xlib;
with Xlib.Extensions.Print; use Xlib.Extensions.Print;
with Xt;                    use Xt;
with Xt.Ancillary_Types;    use Xt.Ancillary_Types;

with Xm.Implementation;     use Xm.Implementation;


package body Xm.Print_Management is


   function Xm_Print_Setup (Video_Widget     : in Widget;
                            Print_Screen     : in Screen;
                            Print_Shell_Name : in String;
                            Arg_List         : in Xt_Arg_List
                              := Null_Xt_Arg_List)
     return Widget
   is
      function XmPrintSetup (Video_Widget     : in Widget;
                             Print_Screen     : in Screen;
                             Print_Shell_Name : in char_array;
                             Arg_List         : in Xt_Arg_List;
                             Num_Args         : in Cardinal)
        return Widget;
      pragma Import (C, XmPrintSetup, "XmPrintSetup");
   begin
      Check (Video_Widget);
      Check (Print_Screen);

      return XmPrintSetup (Video_Widget,
                           Print_Screen,
                           To_C (Print_Shell_Name),
                           Arg_List,
                           Arg_List'Length);
   end Xm_Print_Setup;


   function Xm_Print_To_File
    (The_Display : in Display;
     File_Name   : in String;
     Finish_Proc : in Xp_Finish_Proc := null;
     Client_Data : in Xt_Pointer     := Null_Xt_Pointer)
       return Boolean
   is
      function XmPrintToFile (The_Display : in Display;
                              File_Name   : in char_array;
                              Finish_Proc : in Xp_Finish_Proc;
                              Client_Data : in Xt_Pointer)
        return Xt_Enum;
      pragma Import (C, XmPrintToFile, "XmPrintToFile");
   begin
      return To_Boolean (Xt_Boolean (XmPrintToFile (The_Display,
                                                    To_C (File_Name),
                                                    Finish_Proc,
                                                    Client_Data)));
   end Xm_Print_To_File;


   procedure Xm_Redisplay_Widget (The_Widget : in Widget) is
      procedure XmRedisplayWidget (The_Widget : in Widget);
      pragma Import (C, XmRedisplayWidget, "XmRedisplayWidget");
   begin
      Check (The_Widget);

      XmRedisplayWidget (The_Widget);
   end Xm_Redisplay_Widget;


end Xm.Print_Management;
