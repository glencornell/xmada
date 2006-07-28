------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2006  Vadim Godunko (vgodunko@rostel.ru)
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
--! <Unit> Xt
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;
with System;

with Xlib.Events;
with Xlib.Resource_Manager;

package Xt is

   Invalid_Widget_Error              : exception;
   Invalid_Widget_Class_Error        : exception;
   Invalid_Widget_Subclass_Error     : exception;
   Invalid_Application_Context_Error : exception;
   Incompatible_Representation_Error : exception;
   Threads_Not_Supported_Error       : exception
     renames Xlib.Threads_Not_Supported_Error;

   type Cardinal is new Interfaces.C.unsigned;

   type Position is new Interfaces.C.short;
   type Dimension is new Interfaces.C.unsigned_short;

   subtype Xt_Pointer is Xlib.X_Pointer;
   Null_Xt_Pointer : Xt_Pointer renames Xlib.Null_X_Pointer;

   type Widget is private;
   Null_Widget : constant Widget;

   type Widget_List is array (Natural range <>) of aliased Widget;

   type Widget_Class is private;
   Null_Widget_Class : constant Widget_Class;

   type Xt_App_Context is private;
   Null_Xt_App_Context : constant Xt_App_Context;

   subtype X_Event is Xlib.Events.Event_Record;

   subtype Xt_String is Xlib.X_String_Pointer;
   subtype Xt_String_List is Xlib.X_String_Pointer_List;
   subtype Xt_String_Pointer is Xlib.X_String_Pointer_Pointer;

   Null_Xt_String         : Xt_String renames Xlib.Null_X_String_Pointer;
   Null_Xt_String_List    : Xt_String_List
     renames Xlib.Null_X_String_Pointer_List;
   Null_Xt_String_Pointer : Xt_String_Pointer
     renames Xlib.Null_X_String_Pointer_Pointer;

   function To_Xt_String_List (Pointer : in Xt_String_Pointer;
                               Length  : in Natural)
     return Xt_String_List renames Xlib.To_X_String_Pointer_List;

   function To_Xt_String_List (Pointer : in Xt_String_Pointer)
     return Xt_String_List renames Xlib.To_X_String_Pointer_List;

   subtype Xt_Resource_Name_String  is Xt_String;
   subtype Xt_Resource_Class_String is Xt_String;
   subtype Xt_Resource_Type_String  is Xt_String;


   type Xt_Boolean is new Interfaces.C.unsigned_char;

   Xt_False : constant Xt_Boolean := 0;

   function "=" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Xt_Boolean;

   function "and" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Xt_Boolean;

   function "or" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Xt_Boolean;

   function "xor" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Xt_Boolean;

   function "not" (Right : in Xt_Boolean) return Xt_Boolean;

   function To_Boolean (Item : in Xt_Boolean) return Boolean;

   function To_Xt_Boolean (Item : in Boolean) return Xt_Boolean;


   type Cardinal_Pointer is access all Cardinal;


   type Xt_Callback_Proc is
     access procedure (The_Widget : in Widget;
                       Closure    : in Xt_Pointer;
                       Call_Data  : in Xt_Pointer);

   Null_Xt_Callback_Proc : constant Xt_Callback_Proc;


   type Xt_Language_Proc is
     access function (Display     : in Xlib.Display;
                      Xnl         : in Xt_String;
                      Client_Data : in Xt_Pointer)
       return Xt_String;

   Null_Xt_Language_Proc : constant Xt_Language_Proc;


   type Xt_Action_Proc is
     access procedure (The_Widget : in Widget;
                       Event      : in X_Event;
                       Params     : in System.Address;
                       Num_Params : in Cardinal);


   type Xt_Type_Converter is
     access function
      (The_Display    : in Xlib.Display;
       Args           : in Xlib.Resource_Manager.Xrm_Value_Pointer;
       Num_Args       : in Cardinal_Pointer;
       From           : in Xlib.Resource_Manager.Xrm_Value_Pointer;
       To             : in Xlib.Resource_Manager.Xrm_Value_Pointer;
       Converter_Data : in Xt_Pointer)
         return Xt_Boolean;


   type Xt_Destructor is
     access procedure
      (App_Context    : in Xt_App_Context;
       To             : in Xlib.Resource_Manager.Xrm_Value_Pointer;
       Converter_Data : in Xt_Pointer;
       Args           : in Xlib.Resource_Manager.Xrm_Value_Pointer;
       Num_Args       : in Cardinal_Pointer);

   Null_Xt_Destructor : constant Xt_Destructor;

   type Xt_Work_Proc_Id is new Interfaces.C.unsigned_long;

   type Xt_Work_Proc is
     access function
      (Closure : in Xt_Pointer)
         return Xt_Boolean;

   type Xt_Cache_Type is new Interfaces.C.int;

   Xt_Cache_None       : constant Xt_Cache_Type := 16#0001#;
   Xt_Cache_All        : constant Xt_Cache_Type := 16#0002#;
   Xt_Cache_By_Display : constant Xt_Cache_Type := 16#0003#;
   Xt_Cache_Ref_Count  : constant Xt_Cache_Type := 16#0100#;


   Xt_Unspecified_Pixmap : constant Xlib.Pixmap := 2;


private

   type Widget_Record is null record;
   pragma Convention (C, Widget_Record);

   type Widget is access Widget_Record;
   Null_Widget : constant Widget := null;
   pragma No_Strict_Aliasing (Widget);

   type Widget_Class_Record is null record;
   pragma Convention (C, Widget_Class_Record);

   type Widget_Class is access Widget_Class_Record;
   Null_Widget_Class : constant Widget_Class := null;

   type Xt_App_Context_Record is null record;
   pragma Convention (C, Xt_App_Context_Record);

   type Xt_App_Context is access Xt_App_Context_Record;

   Null_Xt_App_Context : constant Xt_App_Context := null;


   Default_Xt_True  : constant Xt_Boolean := 1;


   pragma Convention (C, Cardinal_Pointer);
   pragma Convention (C, Xt_Action_Proc);
   pragma Convention (C, Xt_Callback_Proc);
   pragma Convention (C, Xt_Destructor);
   pragma Convention (C, Xt_Language_Proc);
   pragma Convention (C, Xt_Type_Converter);
   pragma Convention (C, Xt_Work_Proc);

   Null_Xt_Callback_Proc : constant Xt_Callback_Proc := null;
   Null_Xt_Destructor    : constant Xt_Destructor    := null;
   Null_Xt_Language_Proc : constant Xt_Language_Proc := null;

   pragma Inline ("=");
   pragma Inline ("and");
   pragma Inline ("not");
   pragma Inline ("or");
   pragma Inline ("xor");
   pragma Inline (To_Boolean);
   pragma Inline (To_Xt_Boolean);

end Xt;
