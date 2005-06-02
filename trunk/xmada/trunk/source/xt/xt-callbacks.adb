with Xt.Implementation;      use Xt.Implementation;


package body Xt.Callbacks is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Add_Callback
   --!    <ImplementationNotes> Параметр Callback_Name проверяется на
   --! нуль-значение в Xlib.
   ---------------------------------------------------------------------------
   procedure Xt_Add_Callback
    (The_Widget    : in Widget;
     Callback_Name : in Xt_Resource_Name_String;
     Callback      : in Xt_Callback_Proc;
     Client_Data   : in Xt_Pointer := Null_Xt_Pointer)
   is
      procedure XtAddCallback
       (The_Widget    : in Widget;
        Callback_Name : in Xt_Resource_Name_String;
        Callback      : in Xt_Callback_Proc;
        Client_Data   : in Xt_Pointer);
      pragma Import (C, XtAddCallback, "XtAddCallback");
   begin
      Check (The_Widget);
      XtAddCallback (The_Widget, Callback_Name, Callback, Client_Data);
   end Xt_Add_Callback;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Remove_Callback
   --!    <ImplementationNotes> Параметр Callback_Name проверяется на
   --! нуль-значение в Xlib.
   ---------------------------------------------------------------------------
   procedure Xt_Remove_Callback
    (The_Widget    : in Widget;
     Callback_Name : in Xt_Resource_Name_String;
     Callback      : in Xt_Callback_Proc;
     Client_Data   : in Xt_Pointer := Null_Xt_Pointer)
   is
      procedure XtRemoveCallback
       (The_Widget    : in Widget;
        Callback_Name : in Xt_Resource_Name_String;
        Callback      : in Xt_Callback_Proc;
        Client_Data   : in Xt_Pointer);
      pragma Import (C, XtRemoveCallback, "XtAddCallback");
   begin
      Check (The_Widget);
      XtRemoveCallback (The_Widget, Callback_Name, Callback, Client_Data);
   end Xt_Remove_Callback;


end Xt.Callbacks;
