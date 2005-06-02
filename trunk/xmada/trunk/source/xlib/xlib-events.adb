with Xlib.Implementation; use Xlib.Implementation;


package body Xlib.Events is


   procedure X_Sync (The_Display : in Display;
                     Discard     : in Boolean := False)
   is
      procedure XSync (The_Display : in Display;
                       Discard     : in Bool);
      pragma Import (C, XSync, "XSync");
   begin
      Check (The_Display);
      XSync (The_Display, Bool (To_X_Boolean (Discard)));
   end X_Sync;


end Xlib.Events;
