-- !!! все подпрограммы можно переписать в виде, приведенном в исходной
-- связке. Ещё можно добавить обработку исключение и разблокирование нитей.
with Xt.Implementation;  use Xt.Implementation;


package body Xt.Event_Management is


   procedure Xt_App_Main_Loop (App_Context : in Xt_App_Context) is
      procedure XtAppMainLoop (App_Context : in Xt_App_Context);
      pragma Import (C, XtAppMainLoop, "XtAppMainLoop");
   begin
      Check (App_Context);
      XtAppMainLoop (App_Context);
   end Xt_App_Main_Loop;


   procedure Xt_App_Next_Event (App_Context  : in     Xt_App_Context;
                                Event_Return :    out X_Event) is
      procedure XtAppNextEvent (App_Context  : in     Xt_App_Context;
                                Event_Return :    out X_Event);
      pragma Import (C, XtAppNextEvent, "XtAppNextEvent");
   begin
      Check (App_Context);
      XtAppNextEvent (App_Context, Event_Return);
   end Xt_App_Next_Event;


   function Xt_Dispatch_Event (Event : in X_Event) return Boolean is
      function XtDispatchEvent (Event : in X_Event) return Xt_Boolean;
      pragma Import (C, XtDispatchEvent, "XtDispatchEvent");
   begin
      return XtDispatchEvent (Event) /= Xt_False;
   end Xt_Dispatch_Event;


   procedure Xt_Dispatch_Event (Event : in X_Event) is
      procedure XtDispatchEvent (Event : in X_Event);
      pragma Import (C, XtDispatchEvent, "XtDispatchEvent");
   begin
      XtDispatchEvent (Event);
   end Xt_Dispatch_Event;


end Xt.Event_Management;
