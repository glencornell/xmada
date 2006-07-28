------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
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
--! <Unit> Xt.Initializers
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Strings;

with Xt.Implementation;

package body Xt.Initializers is

   use Interfaces.C;
   use Interfaces.C.Strings;
   use Xlib;
   use Xlib.Resource_Manager;
   use Xt.Ancillary_Types;
   use Xt.Implementation;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_App_Create_Shell
   --!    <ImplementationNotes> Параметр The_Widget_Class проверяется на
   --! нуль-значение в Xt. Параметр Application_Name может быть нуль-значением.
   ---------------------------------------------------------------------------
   function Xt_App_Create_Shell
    (Application_Name  : in String;
     Application_Class : in String;
     The_Widget_Class  : in Widget_Class;
     The_Display       : in Display;
     Args              : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Widget
   is
      C_Application_Name  : chars_ptr           := Null_Ptr;
      C_Application_Class : constant char_array := To_C (Application_Class);
      Return_Value        : Widget;

      function XtAppCreateShell (Application_Name  : in chars_ptr;
                                 Application_Class : in char_array;
                                 The_Widget_Class  : in Widget_Class;
                                 The_Display       : in Display;
                                 Args              : in Xt_Arg_List;
                                 Num_Args          : in Cardinal)
        return Widget;
      pragma Import (C, XtAppCreateShell, "XtAppCreateShell");
   begin
      Check (The_Display);
      if Application_Name /= "" then
         C_Application_Name := New_String (Application_Name);
      end if;
      Return_Value := XtAppCreateShell (C_Application_Name,
                                        C_Application_Class,
                                        The_Widget_Class,
                                        The_Display,
                                        Args,
                                        Args'Length);
      Free (C_Application_Name);
      return Return_Value;
   end Xt_App_Create_Shell;


   procedure Xt_App_Initialize
    (Widget_Return      :    out Widget;
     App_Context_Return :    out Xt_App_Context;
     Application_Class  : in     String;
     Options            : in     Xrm_Option_Desc_List
       := Null_Xrm_Option_Desc_List;
--     Argc_In_Out        : in out Argc_Type;
--     Argv_In_Out        : in out Argv_Type;
     Fallback_Resources : in     Xt_String_List := Null_Xt_String_List;
     Args               : in     Xt_Arg_List    := Null_Xt_Arg_List)
   is
      C_Application_Class : constant char_array := To_C (Application_Class);
      Argc                : constant Cardinal := 0;

      function XtAppInitialize (App_Context_Return : in System.Address;
                                Application_Class  : in char_array;
                                Options            : in Xrm_Option_Desc_List;
                                Num_Options        : in Cardinal;
                                Argc               : in System.Address;
                                Argv               : in System.Address;
                                Fallback_Resources : in Xt_String_Pointer;
                                Args               : in Xt_Arg_List;
                                Num_Args           : in Cardinal)
        return Widget;
      function XtAppInitialize (App_Context_Return : in System.Address;
                                Application_Class  : in char_array;
                                Options            : in Xrm_Option_Desc_List;
                                Num_Options        : in Cardinal;
                                Argc               : in System.Address;
                                Argv               : in System.Address;
                                Fallback_Resources : in Xt_String_List;
                                Args               : in Xt_Arg_List;
                                Num_Args           : in Cardinal)
        return Widget;
      pragma Import (C, XtAppInitialize, "XtAppInitialize");
   begin
      if Fallback_Resources'Length = 0 then
         Widget_Return := XtAppInitialize (App_Context_Return'Address,
                                           C_Application_Class,
                                           Options,
                                           Options'Length,
                                           Argc'Address,
                                           System.Null_Address,
                                           Null_Xt_String_Pointer,
                                           Args,
                                           Args'Length);
      else
         declare
            C_Fallback_Resources : constant Xt_String_List
              := Fallback_Resources & Null_Xt_String;
         begin
            Widget_Return := XtAppInitialize (App_Context_Return'Address,
                                              C_Application_Class,
                                              Options,
                                              Options'Length,
                                              Argc'Address,
                                              System.Null_Address,
                                              C_Fallback_Resources,
                                              Args,
                                              Args'Length);
         end;
      end if;
   end Xt_App_Initialize;


   procedure Xt_App_Set_Fallback_Resources
    (App_Context        : in Xt_App_Context;
     Specification_List : in Xt_String_List)
   is
      First : constant Natural := Specification_List'First;
      Found : Boolean          := False;

      procedure XtAppSetFallbackResources
       (App_Context        : in Xt_App_Context;
        Specification_List : in Xt_String_List);
      procedure XtAppSetFallbackResources
       (App_Context        : in Xt_App_Context;
        Specification_List : in Xt_Pointer);
      pragma Import (C, XtAppSetFallbackResources,
                     "XtAppSetFallbackResources");
   begin
      Check (App_Context);

      if Specification_List'Length = 0
        or else Specification_List (First) = Null_Xt_String
      then
         XtAppSetFallbackResources (App_Context, Null_Xt_Pointer);
      else
         for J in reverse Specification_List'Range loop
            if Specification_List (J) = Null_Xt_String then
               Found := True;
               exit;
            end if;
         end loop;

         if not Found then
            raise Terminator_Error;
         end if;

         XtAppSetFallbackResources (App_Context, Specification_List);
      end if;
   end Xt_App_Set_Fallback_Resources;


   procedure Xt_Close_Display (The_Display : in Display) is
      procedure XtCloseDisplay (The_Display : in Display);
      pragma Import (C, XtCloseDisplay, "XtCloseDisplay");
   begin
      Check (The_Display);
      XtCloseDisplay (The_Display);
   end Xt_Close_Display;


   procedure Xt_Destroy_Application_Context
    (App_Context : in Xt_App_Context)
   is
      procedure XtDestroyApplicationContext (App_Context : in Xt_App_Context);
      pragma Import (C, XtDestroyApplicationContext,
                     "XtDestroyApplicationContext");
   begin
      Check (App_Context);
      XtDestroyApplicationContext (App_Context);
   end Xt_Destroy_Application_Context;


   procedure Xt_Initialize_Widget_Class (The_Widget_Class : in Widget_Class) is
      procedure XtInitializeWidgetClass (The_Widget_Class : in Widget_Class);
      pragma Import (C, XtInitializeWidgetClass, "XtInitializeWidgetClass");
   begin
      Check (The_Widget_Class);
      XtInitializeWidgetClass (The_Widget_Class);
   end Xt_Initialize_Widget_Class;


   procedure Xt_Open_Application
    (Widget_Return      :    out Widget;
     App_Context_Return :    out Xt_App_Context;
     Application_Class  : in     String;
     Options            : in     Xrm_Option_Desc_List
       := Null_Xrm_Option_Desc_List;
--     Argc_In_Out        : in out Argc_Type;
--     Argv_In_Out        : in out Argv_Type;
     Fallback_Resources : in     Xt_String_List := Null_Xt_String_List;
     The_Widget_Class   : in     Widget_Class;
     Args               : in     Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
   is
      C_Application_Class  : constant char_array := To_C (Application_Class);
      Argc                 : constant Cardinal := 0;

      function XtOpenApplication
       (App_Context_Return : in System.Address;
        Application_Class  : in char_array;
        Options            : in Xrm_Option_Desc_List;
        Num_Options        : in Cardinal;
        Argc               : in System.Address;
        Argv               : in System.Address;
        Fallback_Resources : in Xt_String_Pointer;
        The_Widget_Class   : in Widget_Class;
        Args               : in Xt_Arg_List;
        Num_Args           : in Cardinal)
          return Widget;
      function XtOpenApplication
       (App_Context_Return : in System.Address;
        Application_Class  : in char_array;
        Options            : in Xrm_Option_Desc_List;
        Num_Options        : in Cardinal;
        Argc               : in System.Address;
        Argv               : in System.Address;
        Fallback_Resources : in Xt_String_List;
        The_Widget_Class   : in Widget_Class;
        Args               : in Xt_Arg_List;
        Num_Args           : in Cardinal)
          return Widget;
      pragma Import (C, XtOpenApplication, "XtOpenApplication");
   begin
      if Fallback_Resources'Length = 0 then
         Widget_Return := XtOpenApplication (App_Context_Return'Address,
                                             C_Application_Class,
                                             Options,
                                             Options'Length,
                                             Argc'Address,
                                             System.Null_Address,
                                             Null_Xt_String_Pointer,
                                             The_Widget_Class,
                                             Args,
                                             Args'Length);
      else
         declare
            C_Fallback_Resources : constant Xt_String_List
              := Fallback_Resources & Null_Xt_String;
         begin
            Widget_Return := XtOpenApplication (App_Context_Return'Address,
                                                C_Application_Class,
                                                Options,
                                                Options'Length,
                                                Argc'Address,
                                                System.Null_Address,
                                                C_Fallback_Resources,
                                                The_Widget_Class,
                                                Args,
                                                Args'Length);
         end;
      end if;
   end Xt_Open_Application;


   procedure Xt_Open_Display
    (Display_Return    :    out Display;
     App_Context       : in     Xt_App_Context;
     Display_Name      : in     String := "";
     Application_Name  : in     String;
     Application_Class : in     String;
     Options           : in     Xrm_Option_Desc_List
       := Null_Xrm_Option_Desc_List)
--     Argc_In_Out        : in out Argc_Type;
--     Argv_In_Out        : in out Argv_Type;
   is
      C_Display_Name      : chars_ptr := Null_Ptr;
      C_Application_Name  : constant char_array := To_C (Application_Name);
      C_Application_Class : constant char_array := To_C (Application_Class);
      Argc                : constant Cardinal := 0;

      function XtOpenDisplay (App_Context       : in Xt_App_Context;
                              Display_Name      : in chars_ptr;
                              Application_Name  : in char_array;
                              Application_Class : in char_array;
                              Options           : in Xrm_Option_Desc_List;
                              Num_Options       : in Cardinal;
                              Argc              : in System.Address;
                              Argv              : in System.Address)
        return Display;
      pragma Import (C, XtOpenDisplay, "XtOpenDisplay");
   begin
      Check (App_Context);
      if Display_Name /= "" then
         C_Display_Name := New_String (Display_Name);
      end if;
      Display_Return := XtOpenDisplay (App_Context,
                                       C_Display_Name,
                                       C_Application_Name,
                                       C_Application_Class,
                                       Options,
                                       Options'Length,
                                       Argc'Address,
                                       System.Null_Address);
      Free (C_Display_Name);
   end Xt_Open_Display;


   function Xt_Toolkit_Thread_Initialize return Boolean is
      function XtToolkitThreadInitialize return Xt_Boolean;
      pragma Import (C, XtToolkitThreadInitialize,
                     "XtToolkitThreadInitialize");
   begin
      return To_Boolean (XtToolkitThreadInitialize);
   end Xt_Toolkit_Thread_Initialize;


   procedure Xt_Toolkit_Thread_Initialize is
   begin
      if not Xt_Toolkit_Thread_Initialize then
         raise Threads_Not_Supported_Error;
      end if;
   end Xt_Toolkit_Thread_Initialize;


end Xt.Initializers;
