with Xlib.Atoms;
with Xt;


package Xm.Protocol_Management is


   procedure Xm_Add_Protocols (Shell     : in Xt.Widget;
                               Property  : in Xlib.Atoms.Atom;
                               Protocols : in Xlib.Atoms.Atom_List);


   procedure Xm_Activate_Protocol (Shell    : in Xt.Widget;
                                   Property : in Xlib.Atoms.Atom;
                                   Protocol : in Xlib.Atoms.Atom);


   procedure Xm_Deactivate_Protocol (Shell    : in Xt.Widget;
                                     Property : in Xlib.Atoms.Atom;
                                     Protocol : in Xlib.Atoms.Atom);


   procedure Xm_Remove_Protocols (Shell     : in Xt.Widget;
                                  Property  : in Xlib.Atoms.Atom;
                                  Protocols : in Xlib.Atoms.Atom_List);


   procedure Xm_Add_WM_Protocols (Shell     : in Xt.Widget;
                                  Protocols : in Xlib.Atoms.Atom_List);


   procedure Xm_Activate_WM_Protocol (Shell    : in Xt.Widget;
                                      Protocol : in Xlib.Atoms.Atom);


   procedure Xm_Deactivate_WM_Protocol (Shell    : in Xt.Widget;
                                        Protocol : in Xlib.Atoms.Atom);


   procedure Xm_Remove_WM_Protocols (Shell     : in Xt.Widget;
                                     Protocols : in Xlib.Atoms.Atom_List);


   procedure Xm_Add_Protocol_Callback (Shell    : in Xt.Widget;
                                       Property : in Xlib.Atoms.Atom;
                                       Protocol : in Xlib.Atoms.Atom;
                                       Callback : in Xt.Xt_Callback_Proc;
                                       Closure  : in Xt.Xt_Pointer
                                         := Xt.Null_Xt_Pointer);


   procedure Xm_Remove_Protocol_Callback (Shell    : in Xt.Widget;
                                          Property : in Xlib.Atoms.Atom;
                                          Protocol : in Xlib.Atoms.Atom;
                                          Callback : in Xt.Xt_Callback_Proc;
                                          Closure  : in Xt.Xt_Pointer
                                            := Xt.Null_Xt_Pointer);


   procedure Xm_Add_WM_Protocol_Callback (Shell    : in Xt.Widget;
                                          Protocol : in Xlib.Atoms.Atom;
                                          Callback : in Xt.Xt_Callback_Proc;
                                          Closure  : in Xt.Xt_Pointer
                                            := Xt.Null_Xt_Pointer);


   procedure Xm_Remove_WM_Protocol_Callback (Shell    : in Xt.Widget;
                                             Protocol : in Xlib.Atoms.Atom;
                                             Callback : in Xt.Xt_Callback_Proc;
                                             Closure  : in Xt.Xt_Pointer
                                               := Xt.Null_Xt_Pointer);


   procedure Xm_Set_Protocol_Hooks (Shell        : in Xt.Widget;
                                    Property     : in Xlib.Atoms.Atom;
                                    Protocol     : in Xlib.Atoms.Atom;
                                    Pre_Hook     : in Xt.Xt_Callback_Proc
                                      := Xt.Null_Xt_Callback_Proc;
                                    Pre_Closure  : in Xt.Xt_Pointer
                                      := Xt.Null_Xt_Pointer;
                                    Post_Hook    : in Xt.Xt_Callback_Proc
                                      := Xt.Null_Xt_Callback_Proc;
                                    Post_Closure : in Xt.Xt_Pointer
                                      := Xt.Null_Xt_Pointer);


   procedure Xm_Set_WM_Protocol_Hooks (Shell        : in Xt.Widget;
                                       Protocol     : in Xlib.Atoms.Atom;
                                       Pre_Hook     : in Xt.Xt_Callback_Proc
                                         := Xt.Null_Xt_Callback_Proc;
                                       Pre_Closure  : in Xt.Xt_Pointer
                                         := Xt.Null_Xt_Pointer;
                                       Post_Hook    : in Xt.Xt_Callback_Proc
                                         := Xt.Null_Xt_Callback_Proc;
                                       Post_Closure : in Xt.Xt_Pointer
                                         := Xt.Null_Xt_Pointer);


   --  Additional subprograms.

   procedure Xm_Add_WM_Delete_Window_Callback
    (Shell    : in Xt.Widget;
     Callback : in Xt.Xt_Callback_Proc;
     Closure  : in Xt.Xt_Pointer := Xt.Null_Xt_Pointer);


   procedure Xm_Remove_WM_Delete_Window_Callback
    (Shell    : in Xt.Widget;
     Callback : in Xt.Xt_Callback_Proc;
     Closure  : in Xt.Xt_Pointer := Xt.Null_Xt_Pointer);


end Xm.Protocol_Management;
