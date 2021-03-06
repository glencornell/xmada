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
--! <Unit> Xt.Resource_Management
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
with Interfaces.C.Strings;

with Xt.Implementation;

package body Xt.Resource_Management is

   use Interfaces.C;
   use Interfaces.C.Strings;
   use System;
   use Xlib;
   use Xlib.Resource_Manager;
   use Xt.Ancillary_Types;
   use Xt.Implementation;

   type Xt_Convert_Arg_Pointer is access all Xt_Convert_Arg;
   pragma Convention (C, Xt_Convert_Arg_Pointer);


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Generic_Xt_Set_Arg
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Generic_Xt_Set_Arg (Arg   : in out Xt_Arg;
                                 Name  : in     Xt_Resource_Name_String;
                                 Value : in     T)
   is
      function To_Xt_Arg_Val is new Ada.Unchecked_Conversion (T, Xt_Arg_Val);
   begin
      if T'Size /= Xt_Arg_Val'Size or T'Alignment /= Xt_Arg_Val'Alignment then
         raise Incompatible_Representation_Error;
      end if;

      Xt_Set_Arg (Arg, Name, To_Xt_Arg_Val (Value));
   end Generic_Xt_Set_Arg;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_App_Set_Type_Converter
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_App_Set_Type_Converter
    (App_Context    : in Xt_App_Context;
     From_Type      : in Xt_Resource_Type_String;
     To_Type        : in Xt_Resource_Type_String;
     Converter      : in Xt_Type_Converter;
     Converter_Args : in Xt_Convert_Arg_List := Null_Xt_Convert_Arg_List;
     Cache_Type     : in Xt_Cache_Type;
     Destructor     : in Xt_Destructor       := Null_Xt_Destructor)
   is
      procedure XtAppSetTypeConverter (App_Context    : in Xt_App_Context;
                                       From_Type      : in chars_ptr;
                                       To_Type        : in chars_ptr;
                                       Converter      : in Xt_Type_Converter;
                                       Converter_Args : in Xt_Convert_Arg_List;
                                       Num_Args       : in Cardinal;
                                       Cache_Type     : in Xt_Cache_Type;
                                       Destructor     : in Xt_Destructor);

      procedure XtAppSetTypeConverter
       (App_Context    : in Xt_App_Context;
        From_Type      : in chars_ptr;
        To_Type        : in chars_ptr;
        Converter      : in Xt_Type_Converter;
        Converter_Args : in Xt_Convert_Arg_Pointer;
        Num_Args       : in Cardinal;
        Cache_Type     : in Xt_Cache_Type;
        Destructor     : in Xt_Destructor);

      pragma Import (C, XtAppSetTypeConverter, "XtAppSetTypeConverter");
   begin
      Check (App_Context);

      if Converter_Args'Length /= 0 then
         XtAppSetTypeConverter (App_Context,
                                From_Type,
                                To_Type,
                                Converter,
                                Converter_Args,
                                Converter_Args'Length,
                                Cache_Type,
                                Destructor);
      else
         XtAppSetTypeConverter (App_Context,
                                From_Type,
                                To_Type,
                                Converter,
                                null,
                                0,
                                Cache_Type,
                                Destructor);
      end if;
   end Xt_App_Set_Type_Converter;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Convert_And_Store
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xt_Convert_And_Store
    (The_Widget : in Widget;
     From_Type  : in Xt_Resource_Type_String;
     From       : in Xlib.Resource_Manager.Xrm_Value;
     To_Type    : in Xt_Resource_Type_String;
     To         : in Xlib.Resource_Manager.Xrm_Value)
       return Boolean
   is
      function XtConvertAndStore
       (The_Widget : in Widget;
        From_Type  : in Xt_Resource_Type_String;
        From       : in Xlib.Resource_Manager.Xrm_Value;
        To_Type    : in Xt_Resource_Type_String;
        To         : in Xlib.Resource_Manager.Xrm_Value)
          return Xt_Boolean;
      pragma Import (C, XtConvertAndStore, "XtConvertAndStore");

   begin
      Check (The_Widget);
      Check (From_Type);
      Check (To_Type);

      return
        To_Boolean
         (XtConvertAndStore (The_Widget, From_Type, From, To_Type, To));
   end Xt_Convert_And_Store;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Convert_And_Store
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xt_Convert_And_Store
    (The_Widget : in Widget;
     From_Type  : in String;
     From       : in Xlib.Resource_Manager.Xrm_Value;
     To_Type    : in String;
     To         : in Xlib.Resource_Manager.Xrm_Value)
       return Boolean
   is
      function XtConvertAndStore
       (The_Widget : in Widget;
        From_Type  : in Interfaces.C.char_array;
        From       : in Xlib.Resource_Manager.Xrm_Value;
        To_Type    : in Interfaces.C.char_array;
        To         : in Xlib.Resource_Manager.Xrm_Value)
          return Xt_Boolean;
      pragma Import (C, XtConvertAndStore, "XtConvertAndStore");

      C_From_Type : constant char_array := To_C (From_Type);
      C_To_Type   : constant char_array := To_C (To_Type);

   begin
      Check (The_Widget);

      return
        To_Boolean
         (XtConvertAndStore (The_Widget, C_From_Type, From, C_To_Type, To));
   end Xt_Convert_And_Store;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Display_String_Conversion_Warning
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_Display_String_Conversion_Warning
    (The_Display : in Display;
     From_Value  : in String;
     To_Type     : in Xt_Resource_Type_String)
   is
      procedure XtDisplayStringConversionWarning
       (The_Display : in Display;
        From_Value  : in char_array;
        To_Type     : in chars_ptr);
      pragma Import (C, XtDisplayStringConversionWarning,
                     "XtDisplayStringConversionWarning");
   begin
      Check (The_Display);

      XtDisplayStringConversionWarning (The_Display,
                                        To_C (From_Value),
                                        To_Type);
   end Xt_Display_String_Conversion_Warning;


   function Xt_Get_Constraint_Resource_List
    (The_Widget_Class : in Widget_Class)
       return Xt_Resource_List
   is
      C_Resources   : Xt_Resource_Pointer;
      Num_Resources : Cardinal;

      procedure XtGetConstraintResourceList
       (The_Widget_Class     : in     Widget_Class;
        Resource_Return      :    out Xt_Resource_Pointer;
        Num_Resources_Return :    out Cardinal);
      pragma Import (C, XtGetConstraintResourceList,
                     "XtGetConstraintResourceList");

      procedure XtFree (Item : in Xt_Resource_Pointer);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget_Class);
      XtGetConstraintResourceList
       (The_Widget_Class, C_Resources, Num_Resources);

      if Num_Resources /= 0 then
         declare
            Return_Value : constant Xt_Resource_List
              := To_Xt_Resource_List (C_Resources, Num_Resources);
         begin
            XtFree (C_Resources);
            return Return_Value;
         end;
      else
         declare
            Return_Value : Xt_Resource_List (1 .. 0);
         begin
            XtFree (C_Resources);
            return Return_Value;
         end;
      end if;

   end Xt_Get_Constraint_Resource_List;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Get_Constraint_Resource_List
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_Get_Constraint_Resource_List
    (The_Widget_Class : in     Widget_Class;
     Resources_Return :    out Xt_Resource_List_Access)
   is
      C_Resources   : Xt_Resource_Pointer;
      Num_Resources : Cardinal;

      procedure XtGetConstraintResourceList
       (The_Widget_Class     : in     Widget_Class;
        Resource_Return      :    out Xt_Resource_Pointer;
        Num_Resources_Return :    out Cardinal);
      pragma Import (C, XtGetConstraintResourceList,
                     "XtGetConstraintResourceList");

      procedure XtFree (Item : in Xt_Resource_Pointer);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget_Class);
      XtGetConstraintResourceList
       (The_Widget_Class, C_Resources, Num_Resources);

      if Num_Resources /= 0 then
         Resources_Return :=
           new Xt_Resource_List'(To_Xt_Resource_List (C_Resources,
                                                      Num_Resources));
      else
         Resources_Return := null;
      end if;

      XtFree (C_Resources);
   end Xt_Get_Constraint_Resource_List;


   function Xt_Get_Resource_List (The_Widget_Class : in Widget_Class)
     return Xt_Resource_List
   is
      C_Resources   : Xt_Resource_Pointer;
      Num_Resources : Cardinal;

      procedure XtGetResourceList
       (The_Widget_Class     : in     Widget_Class;
        Resource_Return      :    out Xt_Resource_Pointer;
        Num_Resources_Return :    out Cardinal);
      pragma Import (C, XtGetResourceList, "XtGetResourceList");

      procedure XtFree (Item : in Xt_Resource_Pointer);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget_Class);
      XtGetResourceList (The_Widget_Class, C_Resources, Num_Resources);

      if Num_Resources /= 0 then
         declare
            Return_Value : constant Xt_Resource_List
              := To_Xt_Resource_List (C_Resources, Num_Resources);
         begin
            XtFree (C_Resources);
            return Return_Value;
         end;
      else
         declare
            Return_Value : Xt_Resource_List (1 .. 0);
         begin
            XtFree (C_Resources);
            return Return_Value;
         end;
      end if;
   end Xt_Get_Resource_List;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Get_Resource_List
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_Get_Resource_List
    (The_Widget_Class : in     Widget_Class;
     Resources_Return :    out Xt_Resource_List_Access)
   is
      C_Resources   : Xt_Resource_Pointer;
      Num_Resources : Cardinal;

      procedure XtGetResourceList
       (The_Widget_Class     : in     Widget_Class;
        Resource_Return      :    out Xt_Resource_Pointer;
        Num_Resources_Return :    out Cardinal);
      pragma Import (C, XtGetResourceList, "XtGetResourceList");

      procedure XtFree (Item : in Xt_Resource_Pointer);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget_Class);
      XtGetResourceList (The_Widget_Class, C_Resources, Num_Resources);

      if Num_Resources /= 0 then
         Resources_Return :=
           new Xt_Resource_List'(To_Xt_Resource_List (C_Resources,
                                                      Num_Resources));
      else
         Resources_Return := null;
      end if;

      XtFree (C_Resources);
   end Xt_Get_Resource_List;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Get_Values
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_Get_Values (W    : in Widget;
                            Args : in Xt_Arg_List)
   is
      procedure XtGetValues (W        : in Widget;
                             Args     : in Xt_Arg_List;
                             Nul_Args : in Cardinal);
      procedure XtGetValues (W        : in Widget;
                             Args     : in Address;
                             Nul_Args : in Cardinal);
      pragma Import (C, XtGetValues, "XtGetValues");
   begin
      Check (W);
      if Args'Length /= 0 then
         XtGetValues (W, Args, Args'Length);
      else
         XtGetValues (W, Null_Address, 0);
      end if;
   end Xt_Get_Values;


   function Xt_Screen_Database (The_Screen : in Screen) return Xrm_Database is
      function XtScreenDatabase (The_Screen : in Screen) return Xrm_Database;
      pragma Import (C, XtScreenDatabase, "XtScreenDatabase");
   begin
      Check (The_Screen);
      return XtScreenDatabase (The_Screen);
   end Xt_Screen_Database;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Set_Arg
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Address)
   is
      function To_Xt_Arg_Val is
        new Ada.Unchecked_Conversion (Address, Xt_Arg_Val);
   begin
      Arg := (Name, To_Xt_Arg_Val (Value));
   end Xt_Set_Arg;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Set_Arg
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Widget)
   is
      function To_Xt_Arg_Val is
        new Ada.Unchecked_Conversion (Widget, Xt_Arg_Val);
   begin
      Arg := (Name, To_Xt_Arg_Val (Value));
   end Xt_Set_Arg;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Set_Arg
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xt_Boolean) is
   begin
      Arg := (Name, Xt_Arg_Val (Value));
   end Xt_Set_Arg;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Set_Arg
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xt_Arg_Val) is
   begin
      Arg := (Name, Value);
   end Xt_Set_Arg;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Set_Arg
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xt_String)
   is
      function To_Xt_Arg_Val is
        new Ada.Unchecked_Conversion (Xt_String, Xt_Arg_Val);
   begin
      Arg := (Name, To_Xt_Arg_Val (Value));
   end Xt_Set_Arg;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Set_Arg
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_Set_Arg
    (Arg   : in out Xt.Ancillary_Types.Xt_Arg;
     Name  : in     Xt.Xt_Resource_Name_String;
     Value : in     Xt.Translation_Management.Xt_Translations)
   is
      function To_Xt_Arg_Val is
        new Ada.Unchecked_Conversion
             (Xt.Translation_Management.Xt_Translations, Xt_Arg_Val);

   begin
      Arg := (Name, To_Xt_Arg_Val (Value));
   end Xt_Set_Arg;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Set_Type_Converter
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_Set_Type_Converter
    (From_Type      : in Xt_Resource_Type_String;
     To_Type        : in Xt_Resource_Type_String;
     Converter      : in Xt_Type_Converter;
     Converter_Args : in Xt_Convert_Arg_List := Null_Xt_Convert_Arg_List;
     Cache_Type     : in Xt_Cache_Type;
     Destructor     : in Xt_Destructor       := Null_Xt_Destructor)
   is
      procedure XtSetTypeConverter (From_Type      : in chars_ptr;
                                    To_Type        : in chars_ptr;
                                    Converter      : in Xt_Type_Converter;
                                    Converter_Args : in Xt_Convert_Arg_List;
                                    Num_Args       : in Cardinal;
                                    Cache_Type     : in Xt_Cache_Type;
                                    Destructor     : in Xt_Destructor);

      procedure XtSetTypeConverter (From_Type      : in chars_ptr;
                                    To_Type        : in chars_ptr;
                                    Converter      : in Xt_Type_Converter;
                                    Converter_Args : in Xt_Convert_Arg_Pointer;
                                    Num_Args       : in Cardinal;
                                    Cache_Type     : in Xt_Cache_Type;
                                    Destructor     : in Xt_Destructor);

      pragma Import (C, XtSetTypeConverter, "XtSetTypeConverter");
   begin
      if Converter_Args'Length /= 0 then
         XtSetTypeConverter (From_Type,
                             To_Type,
                             Converter,
                             Converter_Args,
                             Converter_Args'Length,
                             Cache_Type,
                             Destructor);
      else
         XtSetTypeConverter (From_Type,
                             To_Type,
                             Converter,
                             null,
                             0,
                             Cache_Type,
                             Destructor);
      end if;
   end Xt_Set_Type_Converter;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Set_Values
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xt_Set_Values (W    : in Widget;
                            Args : in Xt_Arg_List)
   is
      procedure XtSetValues (W        : in Widget;
                             Args     : in Xt_Arg_List;
                             Nul_Args : in Cardinal);
      procedure XtSetValues (W        : in Widget;
                             Args     : in Address;
                             Nul_Args : in Cardinal);
      pragma Import (C, XtSetValues, "XtSetValues");
   begin
      Check (W);
      if Args'Length /= 0 then
         XtSetValues (W, Args, Args'Length);
      else
         XtSetValues (W, Null_Address, 0);
      end if;
   end Xt_Set_Values;


end Xt.Resource_Management;
