with Xlib;              use Xlib;
with Xlib.Atoms;        use Xlib.Atoms;
with Xt;                use Xt;
with Xt.Utilities;      use Xt.Utilities;

with Xm.Implementation; use Xm.Implementation;


package body Xm.Protocol_Management is


   procedure Xm_Activate_Protocol (Shell    : in Widget;
                                   Property : in Atom;
                                   Protocol : in Atom)
   is
      procedure XmActivateProtocol (Shell    : in Widget;
                                    Property : in Atom;
                                    Protocol : in Atom);
      pragma Import (C, XmActivateProtocol, "XmActivateProtocol");
   begin
      Check (Shell);
      XmActivateProtocol (Shell, Property, Protocol);
   end Xm_Activate_Protocol;


   procedure Xm_Activate_WM_Protocol (Shell    : in Widget;
                                      Protocol : in Atom)
   is
   begin
      Check (Shell);
      Xm_Activate_Protocol (Shell,
                            X_Intern_Atom
                             (Xt_Display (Shell), "WM_PROTOCOLS", False),
                            Protocol);
   end Xm_Activate_WM_Protocol;


   procedure Xm_Add_Protocol_Callback
    (Shell    : in Widget;
     Property : in Atom;
     Protocol : in Atom;
     Callback : in Xt_Callback_Proc;
     Closure  : in Xt_Pointer := Null_Xt_Pointer)
   is
      procedure XmAddProtocolCallback (Shell    : in Widget;
                                       Property : in Atom;
                                       Protocol : in Atom;
                                       Callback : in Xt_Callback_Proc;
                                       Closure  : in Xt_Pointer);
      pragma Import (C, XmAddProtocolCallback, "XmAddProtocolCallback");
   begin
      Check (Shell);
      XmAddProtocolCallback (Shell, Property, Protocol, Callback, Closure);
   end Xm_Add_Protocol_Callback;


   procedure Xm_Add_Protocols (Shell     : in Widget;
                               Property  : in Atom;
                               Protocols : in Atom_List)
   is
      procedure XmAddProtocols (Shell         : in Widget;
                                Property      : in Atom;
                                Protocols     : in Atom_List;
                                Num_Protocols : in Cardinal);
      pragma Import (C, XmAddProtocols, "XmAddProtocols");
   begin
      Check (Shell);
      XmAddProtocols (Shell, Property, Protocols, Protocols'Length);
   end Xm_Add_Protocols;


   procedure Xm_Add_WM_Delete_Window_Callback
    (Shell    : in Widget;
     Callback : in Xt_Callback_Proc;
     Closure  : in Xt_Pointer := Null_Xt_Pointer)
   is
      The_Display : constant Display := Xt_Display (Shell);
   begin
      Check (Shell);
      Xm_Add_Protocol_Callback (Shell,
                                X_Intern_Atom (The_Display,
                                               "WM_PROTOCOLS",
                                               False),
                                X_Intern_Atom (The_Display,
                                               "WM_DELETE_WINDOW",
                                               False),
                                Callback,
                                Closure);
   end Xm_Add_WM_Delete_Window_Callback;


   procedure Xm_Add_WM_Protocol_Callback
    (Shell    : in Widget;
     Protocol : in Atom;
     Callback : in Xt_Callback_Proc;
     Closure  : in Xt_Pointer := Null_Xt_Pointer)
   is
   begin
      Check (Shell);
      Xm_Add_Protocol_Callback (Shell,
                                X_Intern_Atom
                                 (Xt_Display (Shell), "WM_PROTOCOLS", False),
                                Protocol,
                                Callback,
                                Closure);
   end Xm_Add_WM_Protocol_Callback;


   procedure Xm_Add_WM_Protocols (Shell     : in Widget;
                                  Protocols : in Atom_List)
   is
   begin
      Check (Shell);
      Xm_Add_Protocols (Shell,
                        X_Intern_Atom
                         (Xt_Display (Shell), "WM_PROTOCOLS", False),
                        Protocols);
   end Xm_Add_WM_Protocols;


   procedure Xm_Deactivate_Protocol (Shell    : in Widget;
                                     Property : in Atom;
                                     Protocol : in Atom)
   is
      procedure XmDeactivateProtocol (Shell    : in Widget;
                                      Property : in Atom;
                                      Protocol : in Atom);
      pragma Import (C, XmDeactivateProtocol, "XmDeactivateProtocol");
   begin
      Check (Shell);
      XmDeactivateProtocol (Shell, Property, Protocol);
   end Xm_Deactivate_Protocol;


   procedure Xm_Deactivate_WM_Protocol (Shell    : in Widget;
                                        Protocol : in Atom)
   is
   begin
      Check (Shell);
      Xm_Deactivate_Protocol (Shell,
                              X_Intern_Atom
                               (Xt_Display (Shell), "WM_PROTOCOLS", False),
                              Protocol);
   end Xm_Deactivate_WM_Protocol;


   procedure Xm_Remove_Protocol_Callback
    (Shell    : in Widget;
     Property : in Atom;
     Protocol : in Atom;
     Callback : in Xt_Callback_Proc;
     Closure  : in Xt_Pointer := Null_Xt_Pointer)
   is
      procedure XmRemoveProtocolCallback (Shell    : in Widget;
                                       Property : in Atom;
                                       Protocol : in Atom;
                                       Callback : in Xt_Callback_Proc;
                                       Closure  : in Xt_Pointer);
      pragma Import (C, XmRemoveProtocolCallback, "XmRemoveProtocolCallback");
   begin
      Check (Shell);
      XmRemoveProtocolCallback (Shell, Property, Protocol, Callback, Closure);
   end Xm_Remove_Protocol_Callback;


   procedure Xm_Remove_Protocols (Shell     : in Widget;
                                  Property  : in Atom;
                                  Protocols : in Atom_List)
   is
      procedure XmRemoveProtocols (Shell         : in Widget;
                                   Property      : in Atom;
                                   Protocols     : in Atom_List;
                                   Num_Protocols : in Cardinal);
      pragma Import (C, XmRemoveProtocols, "XmRemoveProtocols");
   begin
      Check (Shell);
      XmRemoveProtocols (Shell, Property, Protocols, Protocols'Length);
   end Xm_Remove_Protocols;


   procedure Xm_Remove_WM_Delete_Window_Callback
    (Shell    : in Widget;
     Callback : in Xt_Callback_Proc;
     Closure  : in Xt_Pointer := Null_Xt_Pointer)
   is
      The_Display : constant Display := Xt_Display (Shell);
   begin
      Check (Shell);
      Xm_Remove_Protocol_Callback (Shell,
                                X_Intern_Atom (The_Display,
                                               "WM_PROTOCOLS",
                                               False),
                                X_Intern_Atom (The_Display,
                                               "WM_DELETE_WINDOW",
                                               False),
                                Callback,
                                Closure);
   end Xm_Remove_WM_Delete_Window_Callback;


   procedure Xm_Remove_WM_Protocol_Callback
    (Shell    : in Widget;
     Protocol : in Atom;
     Callback : in Xt_Callback_Proc;
     Closure  : in Xt_Pointer := Null_Xt_Pointer)
   is
   begin
      Check (Shell);
      Xm_Remove_Protocol_Callback (Shell,
                                X_Intern_Atom
                                 (Xt_Display (Shell), "WM_PROTOCOLS", False),
                                Protocol,
                                Callback,
                                Closure);
   end Xm_Remove_WM_Protocol_Callback;


   procedure Xm_Remove_WM_Protocols (Shell     : in Widget;
                                     Protocols : in Atom_List)
   is
   begin
      Check (Shell);
      Xm_Remove_Protocols (Shell,
                           X_Intern_Atom
                            (Xt_Display (Shell), "WM_PROTOCOLS", False),
                           Protocols);
   end Xm_Remove_WM_Protocols;


   procedure Xm_Set_Protocol_Hooks
    (Shell        : in Widget;
     Property     : in Atom;
     Protocol     : in Atom;
     Pre_Hook     : in Xt_Callback_Proc := Null_Xt_Callback_Proc;
     Pre_Closure  : in Xt_Pointer       := Null_Xt_Pointer;
     Post_Hook    : in Xt_Callback_Proc := Null_Xt_Callback_Proc;
     Post_Closure : in Xt_Pointer       := Null_Xt_Pointer)
   is
      procedure XmSetProtocolHooks (Shell        : in Widget;
                                    Property     : in Atom;
                                    Protocol     : in Atom;
                                    Pre_Hook     : in Xt_Callback_Proc;
                                    Pre_Closure  : in Xt_Pointer;
                                    Post_Hook    : in Xt_Callback_Proc;
                                    Post_Closure : in Xt_Pointer);
      pragma Import (C, XmSetProtocolHooks, "XmSetProtocolHooks");
   begin
      Check (Shell);
      XmSetProtocolHooks (Shell, Property, Protocol, Pre_Hook, Pre_Closure,
                          Post_Hook, Post_Closure);
   end Xm_Set_Protocol_Hooks;


   procedure Xm_Set_WM_Protocol_Hooks
    (Shell        : in Widget;
     Protocol     : in Atom;
     Pre_Hook     : in Xt_Callback_Proc := Null_Xt_Callback_Proc;
     Pre_Closure  : in Xt_Pointer       := Null_Xt_Pointer;
     Post_Hook    : in Xt_Callback_Proc := Null_Xt_Callback_Proc;
     Post_Closure : in Xt_Pointer       := Null_Xt_Pointer)
   is
   begin
      Check (Shell);
      Xm_Set_Protocol_Hooks (Shell,
                             X_Intern_Atom
                              (Xt_Display (Shell), "WM_PROTOCOLS", False),
                             Protocol, Pre_Hook, Pre_Closure,
                             Post_Hook, Post_Closure);
   end Xm_Set_WM_Protocol_Hooks;


end Xm.Protocol_Management;
