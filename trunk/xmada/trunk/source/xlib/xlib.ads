------------------------------------------------------------------------------
--
--  X Library Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rostel.ru)
--!
--! XmAda is free software; you can redistribute it and/or modify it under
--! the terms of the GNU General Public License as published by the Free
--! Software Foundation; either version 2, or (at your option) any later
--! version.
--!
--! XmAda is distributed in the hope that it will be useful, but WITHOUT ANY
--! WARRANTY; without even the implied warranty of MERCHANTABILITY or
--! FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
--! for more details.
--!
--! You should have received a copy of the GNU General Public License
--! along with GCC; see the file COPYING. If not, write to the Free
--! Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
--! 02110-1301, USA.
--!
--! As a special exception, if other files instantiate generics from this
--! unit, or you link this unit with other files to produce an executable,
--! this unit does not by itself cause the resulting executable to be
--! covered by the GNU General Public License. This exception does not
--! however invalidate any other reasons why the executable file might be
--! covered by the GNU Public License.
--!
--! XmAda maintained by TechnoServ A/S (email: vgodunko@rostel.ru)
--!
--! <Unit> Xlib
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Strings;
with System;

package Xlib is

   Dereference_Error           : exception
     renames Interfaces.C.Strings.Dereference_Error;
   Threads_Not_Supported_Error : exception;

   type Bool is new Interfaces.C.int;

   type X_Id is new Interfaces.C.unsigned_long;
   subtype Drawable is X_Id;
   subtype Window   is X_Id;
   subtype Pixmap   is X_Id;

   Null_Drawable : constant Drawable := 0;
   Null_Window   : constant Window   := Null_Drawable;
   Null_Pixmap   : constant Pixmap   := Null_Drawable;

   type Screen is private;
   Null_Screen : constant Screen;

   type Display is private;
   Null_Display : constant Display;

   type X_Pointer is new System.Address;
   Null_X_Pointer : constant X_Pointer := X_Pointer (System.Null_Address);

   subtype X_String           is Interfaces.C.char_array;
   subtype X_String_Pointer   is Interfaces.C.Strings.chars_ptr;
   Null_X_String_Pointer : X_String_Pointer
     renames Interfaces.C.Strings.Null_Ptr;

   type X_String_Pointer_List is
     array (Natural range <>) of aliased X_String_Pointer;
   Null_X_String_Pointer_List : constant X_String_Pointer_List;

   type X_String_Pointer_Pointer is access all X_String_Pointer;
   Null_X_String_Pointer_Pointer : constant X_String_Pointer_Pointer;

   function To_X_String_Pointer_List (Pointer : in X_String_Pointer_Pointer;
                                      Length  : in Natural)
     return X_String_Pointer_List;

   function To_X_String_Pointer_List (Pointer : in X_String_Pointer_Pointer)
     return X_String_Pointer_List;

   type Time is new Interfaces.C.unsigned_long;

   type Pixel is new Interfaces.C.unsigned_long;
--   !!!  Временно перенесено в Xm.Utilities. Если больше нигде не потребуется,
--   то необходимо отсюда удалить  !!!
--   type Pixel_Access is access all Pixel;
--   Null_Pixel_Access : constant Pixel_Access := null;


   type Screen_Number is new Interfaces.C.int;


   subtype X_Angle is Interfaces.C.short;
   subtype X_Dimension is Interfaces.C.unsigned_short;
   subtype X_Position is Interfaces.C.short;


   type X_Segment is record
      X_1 : X_Position;
      Y_1 : X_Position;
      X_2 : X_Position;
      Y_2 : X_Position;
   end record;

   type X_Segment_List is array (Natural range <>) of aliased X_Segment;


   type X_Point is record
      X : X_Position;
      Y : X_Position;
   end record;

   type X_Point_List is array (Natural range <>) of aliased X_Point;


   type X_Rectangle is record
      X      : X_Position;
      Y      : X_Position;
      Width  : X_Dimension;
      Height : X_Dimension;
   end record;

   type X_Rectangle_List is array (Natural range <>) of aliased X_Rectangle;


   type X_Arc is record
      X       : X_Position;
      Y       : X_Position;
      Width   : X_Dimension;
      Height  : X_Dimension;
      Angle_1 : X_Angle;
      Angle_2 : X_Angle;
   end record;

   type X_Arc_List is array (Natural range <>) of aliased X_Arc;


   type Graphic_Context is private;
   Null_Graphic_Context : constant Graphic_Context;


   type X_Boolean is private;
   X_False : constant X_Boolean;

   function To_Boolean (Item : in X_Boolean) return Boolean;

   function To_X_Boolean (Item : in Boolean) return X_Boolean;


   Invalid_Display_Error         : exception;
   Invalid_Screen_Error          : exception;
   Invalid_Graphic_Context_Error : exception;

   function X_Open_Display (Name : in String) return Display;


   function X_Black_Pixel (The_Display       : in Display;
                           The_Screen_Number : in Screen_Number)
     return Pixel;


   function X_White_Pixel (The_Display       : in Display;
                           The_Screen_Number : in Screen_Number)
     return Pixel;


   function X_Default_GC (The_Display       : in Display;
                          The_Screen_Number : in Screen_Number)
     return Graphic_Context;


   function X_Default_Root_Window (The_Display : in Display) return Window;


   function X_Default_Screen_Of_Display (The_Display : in Display)
     return Screen;


   function X_Screen_Of_Display (The_Display       : in Display;
                                 The_Screen_Number : in Screen_Number)
     return Screen;


   function X_Default_Screen (The_Display : in Display) return Screen_Number;


   function X_Root_Window (The_Display       : in Display;
                           The_Screen_Number : in Screen_Number)
     return Window;


   function X_Server_Vendor (The_Display : in Display) return String;


   function X_Display_Height (The_Display       : in Display;
                              The_Screen_Number : in Screen_Number)
     return X_Dimension;


   function X_Display_Width (The_Display       : in Display;
                             The_Screen_Number : in Screen_Number)
     return X_Dimension;


   function X_Black_Pixel_Of_Screen (The_Screen : in Screen) return Pixel;


   function X_White_Pixel_Of_Screen (The_Screen : in Screen) return Pixel;


   function X_Default_GC_Of_Screen (The_Screen : in Screen)
     return Graphic_Context;


   function X_Does_Save_Unders (The_Screen : in Screen) return Boolean;


   function X_Display_Of_Screen (The_Screen : in Screen) return Display;


   function X_Width_Of_Screen (The_Screen : in Screen) return X_Dimension;


   function X_Height_Of_Screen (The_Screen : in Screen) return X_Dimension;


   function X_Root_Window_Of_Screen (The_Screen : in Screen) return Window;


   procedure X_No_Op (The_Display : in Display);


   procedure X_Close_Display (The_Display : in Display);


   function X_Init_Threads return Boolean;


   procedure X_Lock_Display (The_Display : in Display);


   procedure X_Unlock_Display (The_Display : in Display);


   procedure X_Destroy_Window (The_Display : in Display;
                               The_Window  : in Window);


   procedure X_Destroy_Subwindows (The_Display : in Display;
                                   The_Window  : in Window);


   procedure X_Map_Window (The_Display : in Display;
                           The_Window  : in Window);


   procedure X_Map_Raised (The_Display : in Display;
                           The_Window  : in Window);


   procedure X_Map_Subwindows (The_Display : in Display;
                               The_Window  : in Window);


   procedure X_Unmap_Window (The_Display : in Display;
                             The_Window  : in Window);


   procedure X_Unmap_Subwindows (The_Display : in Display;
                                 The_Window  : in Window);

   procedure X_Raise_Window (The_Display : in Display;
                             The_Window  : in Window);

   procedure X_Lower_Window (The_Display : in Display;
                             The_Window  : in Window);

--   procedure X_Circulate_Subwindows

   procedure X_Circulate_Subwindows_Up (The_Display : in Display;
                                        The_Window  : in Window);

   procedure X_Circulate_Subwindows_Down (The_Display : in Display;
                                          The_Window  : in Window);

   --  Additional procedural form. Raise Threads_Not_Supported if
   --  initialization failed.
   procedure X_Init_Threads;

private

   pragma Linker_Options ("-lX11");

   type Screen_Record is null record;
   pragma Convention (C, Screen_Record);

   type Screen is access Screen_Record;
   Null_Screen : constant Screen := null;


   type Display_Record is null record;
   pragma Convention (C, Display_Record);

   type Display is access Display_Record;
   Null_Display : constant Display := null;

   pragma Convention (C, X_Arc);
   pragma Convention (C, X_Arc_List);
   pragma Convention (C, X_Point);
   pragma Convention (C, X_Point_List);
   pragma Convention (C, X_Rectangle);
   pragma Convention (C, X_Rectangle_List);
   pragma Convention (C, X_Segment);
   pragma Convention (C, X_Segment_List);
   pragma Convention (C, X_String_Pointer_List);
   pragma Convention (C, X_String_Pointer_Pointer);

   Null_X_String_Pointer_List    : constant X_String_Pointer_List (1 .. 0)
     := (others => Null_X_String_Pointer);
   Null_X_String_Pointer_Pointer : constant X_String_Pointer_Pointer
     := null;


   type Graphic_Context_Record is null record;
   pragma Convention (C, Graphic_Context_Record);

   type Graphic_Context is access Graphic_Context_Record;
   pragma Convention (C, Graphic_Context);
   Null_Graphic_Context : constant Graphic_Context := null;


   type X_Boolean is new Interfaces.C.int;
   X_False : constant X_Boolean := X_Boolean (0);
   X_True  : constant X_Boolean := X_Boolean (1);

   function "=" (Left, Right : in X_Boolean) return Boolean is abstract;
   function "<" (Left, Right : in X_Boolean) return Boolean is abstract;
   function ">" (Left, Right : in X_Boolean) return Boolean is abstract;
   function "<=" (Left, Right : in X_Boolean) return Boolean is abstract;
   function ">=" (Left, Right : in X_Boolean) return Boolean is abstract;

end Xlib;
