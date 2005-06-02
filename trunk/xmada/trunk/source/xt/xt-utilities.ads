
package Xt.Utilities is


   procedure Xt_Set_Sensitive (The_Widget : in Widget;
                               Sensitive  : in Boolean);


   procedure Xt_App_Set_Exit_Flag (App_Context : in Xt_App_Context);

   function Xt_App_Get_Exit_Flag (App_Context : in Xt_App_Context)
     return Boolean;


   procedure Xt_App_Lock (App_Context : in Xt_App_Context);

   procedure Xt_App_Unlock (App_Context : in Xt_App_Context);

   procedure Xt_Process_Lock;

   procedure Xt_Process_Unlock;


   function Xt_Display (Object : in Widget) return Xlib.Display;

   function Xt_Display_Of_Object (Object : in Widget) return Xlib.Display;

   function Xt_Screen (Object : in Widget) return Xlib.Screen;

   function Xt_Screen_Of_Object (Object : in Widget) return Xlib.Screen;

   function Xt_Window (Object : in Widget) return Xlib.Window;

   function Xt_Window_Of_Object (Object : in Widget) return Xlib.Window;



   function Xt_Name (Object : in Widget) return String;

   function Xt_Name_To_Widget (Reference : in Widget;
                               Name      : in String)
     return Widget;


   function Xt_Widget_To_Application_Context (The_Widget : in Widget)
     return Xt_App_Context;


private

   pragma Import (C, Xt_Process_Lock, "XtProcessLock");
   pragma Import (C, Xt_Process_Unlock, "XtProcessUnlock");

end Xt.Utilities;
