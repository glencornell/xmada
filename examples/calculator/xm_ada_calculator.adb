with Xt.Event_Management;
with Xt.Initializers;
with Xt.Instance_Management;
with Xt_Application_Shell;

with Main_Windows;

procedure Xm_Ada_Calculator is
   App_Context : Xt.Xt_App_Context;
   App_Shell   : Xt.Widget;
   Top         : Main_Windows.Main_Window_Access;

begin
   Xt.Initializers.Xt_Set_Language_Proc;
   Xt.Initializers.Xt_Open_Application
    (App_Shell, App_Context, "XmAdaCalculator",
     The_Widget_Class => Xt_Application_Shell.Application_Shell_Widget_Class);

   Top := Main_Windows.Constructors.Create (App_Shell);

   Xt.Instance_Management.Xt_Realize_Widget (App_Shell);
   Xt.Event_Management.Xt_App_Main_Loop (App_Context);
end Xm_Ada_Calculator;
