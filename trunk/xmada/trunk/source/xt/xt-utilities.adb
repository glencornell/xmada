with Interfaces.C;          use Interfaces.C;
with Interfaces.C.Strings;  use Interfaces.C.Strings;

with Xlib;                  use Xlib;
with Xt.Class_Management;   use Xt.Class_Management;
with Xt.Implementation;     use Xt.Implementation;


package body Xt.Utilities is


   procedure Check_Core_Subclass (Object : in Widget);


   procedure Check_Core_Subclass (Object : in Widget) is
   begin
      if not Xt_Is_Widget (Object) then
         raise Invalid_Widget_Subclass_Error;
      end if;
   end Check_Core_Subclass;


   function Xt_App_Get_Exit_Flag (App_Context : in Xt_App_Context)
     return Boolean
   is
      function XtAppGetExitFlag (App_Context : in Xt_App_Context)
        return Xt_Boolean;
      pragma Import (C, XtAppGetExitFlag, "XtAppGetExitFlag");
   begin
      Check (App_Context);
      return To_Boolean (XtAppGetExitFlag (App_Context));
   end Xt_App_Get_Exit_Flag;


   procedure Xt_App_Lock (App_Context : in Xt_App_Context) is
      procedure XtAppLock (App_Context : in Xt_App_Context);
      pragma Import (C, XtAppLock, "XtAppLock");
   begin
      Check (App_Context);
      Xt_App_Lock (App_Context);
   end Xt_App_Lock;


   procedure Xt_App_Set_Exit_Flag (App_Context : in Xt_App_Context) is
      procedure XtAppSetExitFlag (App_Context : in Xt_App_Context);
      pragma Import (C, XtAppSetExitFlag, "XtAppSetExitFlag");
   begin
      Check (App_Context);
      XtAppSetExitFlag (App_Context);
   end Xt_App_Set_Exit_Flag;


   procedure Xt_App_Unlock (App_Context : in Xt_App_Context) is
      procedure XtAppUnlock (App_Context : in Xt_App_Context);
      pragma Import (C, XtAppUnlock, "XtAppUnlock");
   begin
      Check (App_Context);
      XtAppUnlock (App_Context);
   end Xt_App_Unlock;


   function Xt_Display (Object : in Widget) return Display is
      function XtDisplay (Object : in Widget) return Display;
      pragma Import (C, XtDisplay, "XtDisplay");
   begin
      Check (Object);
      Check_Core_Subclass (Object);

      return XtDisplay (Object);
   end Xt_Display;


   function Xt_Display_Of_Object (Object : in Widget) return Display is
      function XtDisplayOfObject (Object : in Widget) return Display;
      pragma Import (C, XtDisplayOfObject, "XtDisplayOfObject");
   begin
      Check (Object);
      return XtDisplayOfObject (Object);
   end Xt_Display_Of_Object;


   function Xt_Name (Object : in Widget) return String is
      function XtName (Object : in Widget) return chars_ptr;
      pragma Import (C, XtName, "XtName");
   begin
      Check (Object);
      return Value (XtName (Object));
   end Xt_Name;


   function Xt_Name_To_Widget (Reference : in Widget;
                               Name      : in String)
     return Widget
   is
      function XtNameToWidget (Reference : in Widget;
                               Name      : in char_array)
        return Widget;
      pragma Import (C, XtNameToWidget, "XtNameToWidget");
   begin
      Check (Reference);
      return XtNameToWidget (Reference, To_C (Name));
   end Xt_Name_To_Widget;


   function Xt_Screen (Object : in Widget) return Screen is
      function XtScreen (Object : in Widget) return Screen;
      pragma Import (C, XtScreen, "XtScreen");
   begin
      Check (Object);
      return XtScreen (Object);
   end Xt_Screen;


   function Xt_Screen_Of_Object (Object : in Widget) return Screen is
      function XtScreenOfObject (Object : in Widget) return Screen;
      pragma Import (C, XtScreenOfObject, "XtScreenOfObject");
   begin
      Check (Object);
      return XtScreenOfObject (Object);
   end Xt_Screen_Of_Object;


   procedure Xt_Set_Sensitive (The_Widget : in Widget;
                               Sensitive  : in Boolean)
   is
      procedure XtSetSensitive (The_Widget : in Widget;
                                Sensitive  : in Xt_Boolean);
      pragma Import (C, XtSetSensitive, "XtSetSensitive");
   begin
      Check (The_Widget);
      XtSetSensitive (The_Widget, To_Xt_Boolean (Sensitive));
   end Xt_Set_Sensitive;


   function Xt_Widget_To_Application_Context (The_Widget : in Widget)
     return Xt_App_Context
   is
      function XtWidgetToApplicationContext (The_Widget : in Widget)
        return Xt_App_Context;
      pragma Import (C, XtWidgetToApplicationContext,
                     "XtWidgetToApplicationContext");
   begin
      Check (The_Widget);
      return XtWidgetToApplicationContext (The_Widget);
   end Xt_Widget_To_Application_Context;


   function Xt_Window (Object : in Widget) return Window is
      function XtWindow (Object : in Widget) return Window;
      pragma Import (C, XtWindow, "XtWindow");
   begin
      Check (Object);
      return XtWindow (Object);
   end Xt_Window;


   function Xt_Window_Of_Object (Object : in Widget) return Window is
      function XtWindowOfObject (Object : in Widget) return Window;
      pragma Import (C, XtWindowOfObject, "XtWindowOfObject");
   begin
      Check (Object);
      return XtWindowOfObject (Object);
   end Xt_Window_Of_Object;


end Xt.Utilities;
