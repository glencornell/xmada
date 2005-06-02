with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;

with Xm.Implementation;       use Xm.Implementation;


package body Xm_Main_Window is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Main_Window
   --!    <ImplementationNotes> Проверку null_widget проводит Xt с выдачей
   --!  соответствующего предупреждения.
   ---------------------------------------------------------------------------
   function Xm_Create_Main_Window
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Main_Window_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateMainWindow (Parent    : in Widget;
                                   Name      : in char_array;
                                   Arg_List  : in Xt_Arg_List;
                                   Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateMainWindow, "XmCreateMainWindow");
   begin
      return
        XmCreateMainWindow (Parent, C_Name, Arg_List,
                            Cardinal (Arg_List'Length));
   end Xm_Create_Main_Window;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Main_Window
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Main_Window
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Main_Window_Widget
   is
      Aux : Widget;
   begin
      Aux := Xm_Create_Main_Window (Parent, Name, Arg_List);
      Xt_Manage_Child (Aux);
      return Aux;
   end Xm_Create_Managed_Main_Window;


   function Xm_Main_Window_Sep_1 (The_Widget : in Xm_Main_Window_Widget)
     return Widget
   is
      function XmMainWindowSep1 (The_Widget : in Widget) return Widget;
      pragma Import (C, XmMainWindowSep1, "XmMainWindowSep1");
   begin
      Check (The_Widget);
      return XmMainWindowSep1 (The_Widget);
   end Xm_Main_Window_Sep_1;


   function Xm_Main_Window_Sep_2 (The_Widget : in Xm_Main_Window_Widget)
     return Widget
   is
      function XmMainWindowSep2 (The_Widget : in Widget) return Widget;
      pragma Import (C, XmMainWindowSep2, "XmMainWindowSep2");
   begin
      Check (The_Widget);
      return XmMainWindowSep2 (The_Widget);
   end Xm_Main_Window_Sep_2;


   function Xm_Main_Window_Sep_3 (The_Widget : in Xm_Main_Window_Widget)
     return Widget
   is
      function XmMainWindowSep3 (The_Widget : in Widget) return Widget;
      pragma Import (C, XmMainWindowSep3, "XmMainWindowSep3");
   begin
      Check (The_Widget);
      return XmMainWindowSep3 (The_Widget);
   end Xm_Main_Window_Sep_3;


   procedure Xm_Main_Window_Set_Areas
    (The_Widget           : in Xm_Main_Window_Widget;
     Menu_Bar             : in Widget;
     Command_Window       : in Widget;
     Horizontal_Scrollbar : in Widget;
     Vertical_Scrollbar   : in Widget;
     Work_Region          : in Widget)
   is
      procedure XmMainWindowSetAreas (The_Widget           : in Widget;
                                      Menu_Bar             : in Widget;
                                      Command_Window       : in Widget;
                                      Horizontal_Scrollbar : in Widget;
                                      Vertical_Scrollbar   : in Widget;
                                      Work_Region          : in Widget);
      pragma Import (C, XmMainWindowSetAreas, "XmMainWindowSetAreas");
   begin
      Check (The_Widget);

      XmMainWindowSetAreas (The_Widget,
                            Menu_Bar,
                            Command_Window,
                            Horizontal_Scrollbar,
                            Vertical_Scrollbar,
                            Work_Region);
   end Xm_Main_Window_Set_Areas;


end Xm_Main_Window;
