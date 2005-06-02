with Interfaces.C;        use Interfaces.C;

with Xlib.Implementation; use Xlib.Implementation;


package body Xlib.Extensions.Print is


   procedure Xp_Cancel_Job (The_Display : in Display;
                            Discard     : in Boolean)
   is
      procedure XpCancelJob (The_Display : in Display;
                             Discard     : in Bool);
      pragma Import (C, XpCancelJob, "XpCancelJob");
   begin
      Check (The_Display);
      XpCancelJob (The_Display, Bool (To_X_Boolean (Discard)));
   end Xp_Cancel_Job;


   function Xp_Create_Context (The_Display  : in Display;
                               Printer_Name : in String)
     return Xp_Context
   is
      function XpCreateContext (The_Display  : in Display;
                                Printer_Name : in char_array)
        return Xp_Context;
      pragma Import (C, XpCreateContext, "XpCreateContext");
   begin
      Check (The_Display);
      return XpCreateContext (The_Display, To_C (Printer_Name));
   end Xp_Create_Context;


   procedure Xp_End_Job (The_Display : in Display) is
      procedure XpEndJob (The_Display : in Display);
      pragma Import (C, XpEndJob, "XpEndJob");
   begin
      Check (The_Display);
      XpEndJob (The_Display);
   end Xp_End_Job;


   function Xp_Get_Screen_Of_Context (The_Display : in Display;
                                      The_Context : in Xp_Context)
     return Screen
   is
      function XpGetScreenOfContext (The_Display : in Display;
                                     The_Context : in Xp_Context)
        return Screen;
      pragma Import (C, XpGetScreenOfContext, "XpGetScreenOfContext");
   begin
      Check (The_Display);
      return XpGetScreenOfContext (The_Display, The_Context);
   end Xp_Get_Screen_Of_Context;


   procedure Xp_Set_Context (The_Display : in Display;
                             The_Context : in Xp_Context)
   is
      procedure XpSetContext (The_Display : in Display;
                              The_Context : in Xp_Context);
      pragma Import (C, XpSetContext, "XpSetContext");
   begin
      Check (The_Display);
      XpSetContext (The_Display, The_Context);
   end Xp_Set_Context;


   procedure Xp_Set_Locale_Hinter (Hinter      : in Xp_Hinter_Proc;
                                   Description : in String)
   is
      procedure XpSetLocaleHinter (Hinter      : in Xp_Hinter_Proc;
                                   Description : in char_array);
      pragma Import (C, XpSetLocaleHinter, "XpSetLocaleHinter");
   begin
      XpSetLocaleHinter (Hinter, To_C (Description));
   end Xp_Set_Locale_Hinter;


   procedure Xp_Start_Job (The_Display : in Display;
                           Save_Data   : in Xp_Save_Data)
   is
      procedure XpStartJob (The_Display : in Display;
                            Save_Data   : in Xp_Save_Data);
      pragma Import (C, XpStartJob, "XpStartJob");
   begin
      Check (The_Display);
      XpStartJob (The_Display, Save_Data);
   end Xp_Start_Job;


end Xlib.Extensions.Print;
