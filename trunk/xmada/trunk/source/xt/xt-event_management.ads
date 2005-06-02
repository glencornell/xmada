
package Xt.Event_Management is


   procedure Xt_App_Next_Event (App_Context  : in     Xt_App_Context;
                                Event_Return :    out X_Event);

   function Xt_Dispatch_Event (Event : in X_Event) return Boolean;

   procedure Xt_Dispatch_Event (Event : in X_Event);

   procedure Xt_App_Main_Loop (App_Context : in Xt_App_Context);


private

   pragma Inline (Xt_Dispatch_Event);

end Xt.Event_Management;
