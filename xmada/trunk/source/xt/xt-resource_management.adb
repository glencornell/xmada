with Ada.Unchecked_Conversion;
with Interfaces.C;          use Interfaces.C;
with Interfaces.C.Strings;  use Interfaces.C.Strings;
with System;                use System;

with Xlib;                  use Xlib;
with Xlib.Resource_Manager; use Xlib.Resource_Manager;
with Xt.Ancillary_Types;    use Xt.Ancillary_Types;
with Xt.Implementation;     use Xt.Implementation;


package body Xt.Resource_Management is


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
