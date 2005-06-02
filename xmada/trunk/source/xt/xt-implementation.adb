
package body Xt.Implementation is


   procedure Check (App_Context : in Xt_App_Context) is
   begin
      if App_Context = Null_Xt_App_Context then
         raise Invalid_Application_Context_Error;
      end if;
   end Check;


   procedure Check (The_Widget : in Widget) is
   begin
      if The_Widget = Null_Widget then
         raise Invalid_Widget_Error;
      end if;
   end Check;


   procedure Check (The_Widget_Class : in Widget_Class) is
   begin
      if The_Widget_Class = Null_Widget_Class then
         raise Invalid_Widget_Class_Error;
      end if;
   end Check;


end Xt.Implementation;
