with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

with Xlib.Implementation;  use Xlib.Implementation;


package body Xlib is


   Default_X_True : constant X_Boolean := X_Boolean (1);


   function To_Boolean (Item : in X_Boolean) return Boolean is
   begin
      return int (Item) /= int (X_False);
   end To_Boolean;


   function To_X_Boolean (Item : in Boolean) return X_Boolean is
   begin
      if Item then
         return Default_X_True;
      else
         return X_False;
      end if;
   end To_X_Boolean;


   function To_X_String_Pointer_List (Pointer : in X_String_Pointer_Pointer;
                                      Length  : in Natural)
     return X_String_Pointer_List
   is
      function To_List is
        new Generic_To_Element_List (X_String_Pointer,
                                     X_String_Pointer_Pointer,
                                     X_String_Pointer_List);
      pragma Inline (To_List);
   begin
      return To_List (Pointer, Length);
   end To_X_String_Pointer_List;


   function To_X_String_Pointer_List (Pointer : in X_String_Pointer_Pointer)
     return X_String_Pointer_List
   is
      function To_List is
        new Generic_Terminated_To_Element_List (X_String_Pointer,
                                                X_String_Pointer_Pointer,
                                                X_String_Pointer_List,
                                                Null_X_String_Pointer);
      pragma Inline (To_List);
   begin
      return To_List (Pointer);
   end To_X_String_Pointer_List;


   function X_Black_Pixel (The_Display       : in Display;
                           The_Screen_Number : in Screen_Number)
     return Pixel
   is
      function XBlackPixel (The_Display       : in Display;
                            The_Screen_Number : in Screen_Number)
        return Pixel;
      pragma Import (C, XBlackPixel, "XBlackPixel");
   begin
      Check (The_Display);
      return XBlackPixel (The_Display, The_Screen_Number);
   end X_Black_Pixel;


   function X_Black_Pixel_Of_Screen (The_Screen : in Screen) return Pixel is
      function XBlackPixelOfScreen (The_Screen : in Screen) return Pixel;
      pragma Import (C, XBlackPixelOfScreen, "XBlackPixelOfScreen");
   begin
      Check (The_Screen);
      return XBlackPixelOfScreen (The_Screen);
   end X_Black_Pixel_Of_Screen;

   procedure X_Circulate_Subwindows_Down (The_Display : in Display;
                                          The_Window  : in Window)
   is
      procedure XCirculateSubwindowsDown (The_Display : in Display;
                                          The_Window  : in Window);
      pragma Import (C, XCirculateSubwindowsDown, "XCirculateSubwindowsDown");

   begin
      Check (The_Display);
      XCirculateSubwindowsDown (The_Display, The_Window);
   end X_Circulate_Subwindows_Down;

   procedure X_Circulate_Subwindows_Up (The_Display : in Display;
                                        The_Window  : in Window)
   is
      procedure XCirculateSubwindowsUp (The_Display : in Display;
                                        The_Window  : in Window);
      pragma Import (C, XCirculateSubwindowsUp, "XCirculateSubwindowsUp");

   begin
      Check (The_Display);
      XCirculateSubwindowsUp (The_Display, The_Window);
   end X_Circulate_Subwindows_Up;

   procedure X_Close_Display (The_Display : in Display) is
      procedure XCloseDisplay (The_Display : in Display);
      pragma Import (C, XCloseDisplay, "XCloseDisplay");
   begin
      Check (The_Display);
      XCloseDisplay (The_Display);
   end X_Close_Display;


   function X_Default_GC (The_Display       : in Display;
                          The_Screen_Number : in Screen_Number)
     return Graphic_Context
   is
      function XDefaultGC (The_Display       : in Display;
                           The_Screen_Number : in Screen_Number)
        return Graphic_Context;
      pragma Import (C, XDefaultGC, "XDefaultGC");
   begin
      Check (The_Display);
      return XDefaultGC (The_Display, The_Screen_Number);
   end X_Default_GC;


   function X_Default_GC_Of_Screen (The_Screen : in Screen)
     return Graphic_Context
   is
      function XDefaultGCOfScreen (The_Screen : in Screen)
        return Graphic_Context;
      pragma Import (C, XDefaultGCOfScreen, "XDefaultGCOfScreen");
   begin
      Check (The_Screen);
      return XDefaultGCOfScreen (The_Screen);
   end X_Default_GC_Of_Screen;


   function X_Default_Root_Window (The_Display : in Display) return Window is
      function XDefaultRootWindow (The_Display : in Display) return Window;
      pragma Import (C, XDefaultRootWindow, "XDefaultRootWindow");
   begin
      Check (The_Display);
      return XDefaultRootWindow (The_Display);
   end X_Default_Root_Window;


   function X_Default_Screen (The_Display : in Display) return Screen_Number is
      function XDefaultScreen (The_Display : in Display) return Screen_Number;
      pragma Import (C, XDefaultScreen, "XDefaultScreen");
   begin
      Check (The_Display);
      return XDefaultScreen (The_Display);
   end X_Default_Screen;


   function X_Default_Screen_Of_Display (The_Display : in Display)
     return Screen
   is
      function XDefaultScreenOfDisplay (The_Display : in Display)
        return Screen;
      pragma Import (C, XDefaultScreenOfDisplay, "XDefaultScreenOfDisplay");
   begin
      Check (The_Display);
      return XDefaultScreenOfDisplay (The_Display);
   end X_Default_Screen_Of_Display;


   procedure X_Destroy_Subwindows (The_Display : in Display;
                                   The_Window  : in Window)
   is
      procedure XDestroySubwindows (The_Display : in Display;
                                    The_Window  : in Window);
      pragma Import (C, XDestroySubwindows, "XDestroySubwindows");
   begin
      Check (The_Display);
      XDestroySubwindows (The_Display, The_Window);
   end X_Destroy_Subwindows;


   procedure X_Destroy_Window (The_Display : in Display;
                               The_Window  : in Window)
   is
      procedure XDestroyWindow (The_Display : in Display;
                                The_Window  : in Window);
      pragma Import (C, XDestroyWindow, "XDestroyWindow");
   begin
      Check (The_Display);
      XDestroyWindow (The_Display, The_Window);
   end X_Destroy_Window;


   function X_Display_Height (The_Display       : in Display;
                              The_Screen_Number : in Screen_Number)
     return X_Dimension
   is
      function XDisplayHeight (The_Display       : in Display;
                               The_Screen_Number : in Screen_Number)
        return int;
      pragma Import (C, XDisplayHeight, "XDisplayHeight");
   begin
      Check (The_Display);
      return X_Dimension (XDisplayHeight (The_Display, The_Screen_Number));
   end X_Display_Height;


   function X_Display_Of_Screen (The_Screen : in Screen) return Display is
      function XDisplayOfScreen (The_Screen : in Screen) return Display;
      pragma Import (C, XDisplayOfScreen, "XDisplayOfScreen");
   begin
      Check (The_Screen);
      return XDisplayOfScreen (The_Screen);
   end X_Display_Of_Screen;


   function X_Display_Width (The_Display       : in Display;
                             The_Screen_Number : in Screen_Number)
     return X_Dimension
   is
      function XDisplayWidth (The_Display       : in Display;
                              The_Screen_Number : in Screen_Number)
        return int;
      pragma Import (C, XDisplayWidth, "XDisplayWidth");
   begin
      Check (The_Display);
      return X_Dimension (XDisplayWidth (The_Display, The_Screen_Number));
   end X_Display_Width;


   function X_Does_Save_Unders (The_Screen : in Screen) return Boolean is
      function XDoesSaveUnders (The_Screen : in Screen) return X_Boolean;
      pragma Import (C, XDoesSaveUnders, "XDoesSaveUnders");
   begin
      Check (The_Screen);
      return To_Boolean (XDoesSaveUnders (The_Screen));
   end X_Does_Save_Unders;


   function X_Height_Of_Screen (The_Screen : in Screen) return X_Dimension is
      function XHeightOfScreen (The_Screen : in Screen) return int;
      pragma Import (C, XHeightOfScreen, "XHeightOfScreen");
   begin
      Check (The_Screen);
      return X_Dimension (XHeightOfScreen (The_Screen));
   end X_Height_Of_Screen;

   function X_Init_Threads return Boolean is
      function XInitThreads return int;
      pragma Import (C, XInitThreads, "XInitThreads");

   begin
      return XInitThreads /= 0;
   end X_Init_Threads;

   procedure X_Init_Threads is
   begin
      if not X_Init_Threads then
         raise Threads_Not_Supported_Error;
      end if;
   end X_Init_Threads;

   procedure X_Lock_Display (The_Display : in Display) is
      procedure XLockDisplay (The_Display : in Display);
      pragma Import (C, XLockDisplay, "XLockDisplay");
   begin
      Check (The_Display);
      XLockDisplay (The_Display);
   end X_Lock_Display;

   procedure X_Lower_Window (The_Display : in Display;
                             The_Window  : in Window)
   is
      procedure XLowerWindow (The_Display : in Display;
                              The_Window  : in Window);
      pragma Import (C, XLowerWindow, "XLowerWindow");

   begin
      Check (The_Display);
      XLowerWindow (The_Display, The_Window);
   end X_Lower_Window;

   procedure X_Map_Raised (The_Display : in Display;
                           The_Window  : in Window)
   is
      procedure XMapRaised (The_Display : in Display;
                            The_Window  : in Window);
      pragma Import (C, XMapRaised, "XMapRaised");
   begin
      Check (The_Display);
      XMapRaised (The_Display, The_Window);
   end X_Map_Raised;


   procedure X_Map_Subwindows (The_Display : in Display;
                               The_Window  : in Window)
   is
      procedure XMapSubwindows (The_Display : in Display;
                                The_Window  : in Window);
      pragma Import (C, XMapSubwindows, "XMapSubwindows");
   begin
      Check (The_Display);
      XMapSubwindows (The_Display, The_Window);
   end X_Map_Subwindows;


   procedure X_Map_Window (The_Display : in Display;
                           The_Window  : in Window)
   is
      procedure XMapWindow (The_Display : in Display;
                            The_Window  : in Window);
      pragma Import (C, XMapWindow, "XMapWindow");
   begin
      Check (The_Display);
      XMapWindow (The_Display, The_Window);
   end X_Map_Window;


   procedure X_No_Op (The_Display : in Display) is
      procedure XNoOp (The_Display : in Display);
      pragma Import (C, XNoOp, "XNoOp");
   begin
      Check (The_Display);
      XNoOp (The_Display);
   end X_No_Op;


   function X_Open_Display (Name : in String) return Display is
      function XOpenDisplay (Name : in char_array) return Display;
      pragma Import (C, XOpenDisplay, "XOpenDisplay");
   begin
      return XOpenDisplay (To_C (Name));
   end X_Open_Display;

   procedure X_Raise_Window (The_Display : in Display;
                             The_Window  : in Window)
   is
      procedure XRaiseWindow (The_Display : in Display;
                              The_Window  : in Window);
      pragma Import (C, XRaiseWindow, "XRaiseWindow");

   begin
      Check (The_Display);
      XRaiseWindow (The_Display, The_Window);
   end X_Raise_Window;

   function X_Root_Window (The_Display       : in Display;
                           The_Screen_Number : in Screen_Number)
     return Window
   is
      function XRootWindow (The_Display       : in Display;
                            The_Screen_Number : in Screen_Number)
        return Window;
      pragma Import (C, XRootWindow, "XRootWindow");
   begin
      Check (The_Display);
      return XRootWindow (The_Display, The_Screen_Number);
   end X_Root_Window;


   function X_Root_Window_Of_Screen (The_Screen : in Screen) return Window is
      function XRootWindowOfScreen (The_Screen : in Screen) return Window;
      pragma Import (C, XRootWindowOfScreen, "XRootWindowOfScreen");
   begin
      Check (The_Screen);
      return XRootWindowOfScreen (The_Screen);
   end X_Root_Window_Of_Screen;


   function X_Screen_Of_Display (The_Display       : in Display;
                                 The_Screen_Number : in Screen_Number)
     return Screen
   is
      function XScreenOfDisplay (The_Display       : in Display;
                                 The_Screen_Number : in Screen_Number)
        return Screen;
      pragma Import (C, XScreenOfDisplay, "XScreenOfDisplay");
   begin
      Check (The_Display);
      return XScreenOfDisplay (The_Display, The_Screen_Number);
   end X_Screen_Of_Display;


   function X_Server_Vendor (The_Display : in Display) return String is
      function XServerVendor (The_Display : in Display) return chars_ptr;
      pragma Import (C, XServerVendor, "XServerVendor");
   begin
      Check (The_Display);
      return Value (XServerVendor (The_Display));
   end X_Server_Vendor;


   procedure X_Unlock_Display (The_Display : in Display) is
      procedure XUnlockDisplay (The_Display : in Display);
      pragma Import (C, XUnlockDisplay, "XUnlockDisplay");
   begin
      Check (The_Display);
      XUnlockDisplay (The_Display);
   end X_Unlock_Display;


   procedure X_Unmap_Subwindows (The_Display : in Display;
                                 The_Window  : in Window)
   is
      procedure XUnmapSubwindows (The_Display : in Display;
                                  The_Window  : in Window);
      pragma Import (C, XUnmapSubwindows, "XUnmapSubwindows");
   begin
      Check (The_Display);
      XUnmapSubwindows (The_Display, The_Window);
   end X_Unmap_Subwindows;


   procedure X_Unmap_Window (The_Display : in Display;
                             The_Window  : in Window)
   is
      procedure XUnmapWindow (The_Display : in Display;
                              The_Window  : in Window);
      pragma Import (C, XUnmapWindow, "XUnmapWindow");
   begin
      Check (The_Display);
      XUnmapWindow (The_Display, The_Window);
   end X_Unmap_Window;


   function X_White_Pixel (The_Display       : in Display;
                           The_Screen_Number : in Screen_Number)
     return Pixel
   is
      function XWhitePixel (The_Display       : in Display;
                            The_Screen_Number : in Screen_Number)
        return Pixel;
      pragma Import (C, XWhitePixel, "XWhitePixel");
   begin
      Check (The_Display);
      return XWhitePixel (The_Display, The_Screen_Number);
   end X_White_Pixel;


   function X_White_Pixel_Of_Screen (The_Screen : in Screen) return Pixel is
      function XWhitePixelOfScreen (The_Screen : in Screen) return Pixel;
      pragma Import (C, XWhitePixelOfScreen, "XWhitePixelOfScreen");
   begin
      Check (The_Screen);
      return XWhitePixelOfScreen (The_Screen);
   end X_White_Pixel_Of_Screen;


   function X_Width_Of_Screen (The_Screen : in Screen) return X_Dimension is
      function XWidthOfScreen (The_Screen : in Screen) return int;
      pragma Import (C, XWidthOfScreen, "XWidthOfScreen");
   begin
      Check (The_Screen);
      return X_Dimension (XWidthOfScreen (The_Screen));
   end X_Width_Of_Screen;


end Xlib;
