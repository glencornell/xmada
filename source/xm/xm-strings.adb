------------------------------------------------------------------------------
--
--  Motif Ada Binding
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
--! <Unit> Xm.Strings
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;              use Interfaces.C;
with Interfaces.C.Strings;      use Interfaces.C.Strings;
--with Interfaces.C.Wide_Strings; use Interfaces.C.Wide_Strings;
--pragma Warnings (Off, Interfaces.C.Wide_Strings);

package body Xm.Strings is

   use Interfaces.C;
   use Interfaces.C.Strings;
   --use Interfaces.C.Wide_Strings;
   use Xt;
   use Xt.Ancillary_Types;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Parse_Mapping_Create
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Parse_Mapping_Create
    (Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Parse_Mapping
   is
      function XmParseMappingCreate (Arg_List  : in Xt_Arg_List;
                                     Arg_Count : in Cardinal)
        return Xm_Parse_Mapping;
      pragma Import (C, XmParseMappingCreate, "XmParseMappingCreate");
   begin
      return XmParseMappingCreate (Arg_List, Arg_List'Length);
   end Xm_Parse_Mapping_Create;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Parse_Mapping_Get_Values
   --!    <ImplementationNotes> Параметр Parse_Mapping проверяется на нуль
   --! значение внутри Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Parse_Mapping_Get_Values (Parse_Mapping : in Xm_Parse_Mapping;
                                          Arg_List      : in Xt_Arg_List)
   is
      procedure XmParseMappingGetValues (Parse_Mapping : in Xm_Parse_Mapping;
                                         Arg_List      : in Xt_Arg_List;
                                         Arg_Count     : in Cardinal);
      pragma Import (C, XmParseMappingGetValues, "XmParseMappingGetValues");
   begin
      XmParseMappingGetValues (Parse_Mapping, Arg_List, Arg_List'Length);
   end Xm_Parse_Mapping_Get_Values;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Parse_Mapping_Set_Values
   --!    <ImplementationNotes> Параметр Parse_Mapping проверяется на нуль
   --! значение внутри Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Parse_Mapping_Set_Values (Parse_Mapping : in Xm_Parse_Mapping;
                                          Arg_List      : in Xt_Arg_List)
   is
      procedure XmParseMappingSetValues (Parse_Mapping : in Xm_Parse_Mapping;
                                         Arg_List      : in Xt_Arg_List;
                                         Arg_Count     : in Cardinal);
      pragma Import (C, XmParseMappingSetValues, "XmParseMappingSetValues");
   begin
      XmParseMappingSetValues (Parse_Mapping, Arg_List, Arg_List'Length);
   end Xm_Parse_Mapping_Set_Values;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Parse_Table_Free
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Parse_Table_Free (Parse_Table : in Xm_Parse_Table) is
   begin
      for J in Parse_Table'Range loop
        Xm_Parse_Mapping_Free (Parse_Table (J));
      end loop;
   end Xm_Parse_Table_Free;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Byte_Compare
   --!    <ImplementationNotes> Параметры String_1 и String_2 проверяются на
   --! нуль значение внутри Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Byte_Compare (String_1 : in Xm_String;
                                    String_2 : in Xm_String)
     return Boolean
   is
      function XmStringByteCompare (String_1 : in Xm_String;
                                    String_2 : in Xm_String)
        return Xt_Boolean;
      pragma Import (C, XmStringByteCompare, "XmStringByteCompare");
   begin
      return To_Boolean (XmStringByteCompare (String_1, String_2));
   end Xm_String_Byte_Compare;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Compare
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_String_Compare (String_1 : in Xm_String;
                               String_2 : in Xm_String)
     return Boolean
   is
      function XmStringCompare (String_1 : in Xm_String;
                                String_2 : in Xm_String)
        return Xt_Boolean;
      pragma Import (C, XmStringCompare, "XmStringCompare");
   begin
      return To_Boolean (XmStringCompare (String_1, String_2));
   end Xm_String_Compare;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Create
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_String_Create
    (Text : in String;
     Tag  : in Xm_String_Tag := Xm_Fontlist_Default_Tag)
       return Xm_String
   is
      C_Text : constant char_array := To_C (Text);

      function XmStringCreate (Text : in char_array;
                               Tag  : in Xm_String_Tag)
        return Xm_String;
      pragma Import (C, XmStringCreate, "XmStringCreate");
   begin
      return XmStringCreate (C_Text, Tag);
   end Xm_String_Create;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Create_L_To_R
   --!    <ImplementationNotes> Оба аргумента проверяются на нуль-значение
   --! внутри Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Create_L_To_R
    (Text     : in String;
     Char_Set : in Xm_String_Char_Set := Xm_String_Default_Char_Set)
       return Xm_String
   is
      C_Text : constant char_array := To_C (Text);

      function XmStringCreateLToR (Text     : in char_array;
                                   Char_Set : in Xm_String_Char_Set)
        return Xm_String;
      pragma Import (C, XmStringCreateLToR, "XmStringCreateLtoR");
   begin
      return XmStringCreateLToR (C_Text, Char_Set);
   end Xm_String_Create_L_To_R;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Create_Localized
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_String_Create_Localized (Text : in String) return Xm_String is
      C_Text : constant char_array := To_C (Text);

      function XmStringCreateLocalized (Text : in char_array) return Xm_String;
      pragma Import (C, XmStringCreateLocalized, "XmStringCreateLocalized");
   begin
      return XmStringCreateLocalized (C_Text);
   end Xm_String_Create_Localized;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Create_Simple
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_String_Create_Simple (Text : in String) return Xm_String is
      C_Text : constant char_array := To_C (Text);

      function XmStringCreateSimple (Text : in char_array) return Xm_String;
      pragma Import (C, XmStringCreateSimple, "XmStringCreateSimple");
   begin
      return XmStringCreateSimple (C_Text);
   end Xm_String_Create_Simple;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Empty
   --!    <ImplementationNotes> Для параметра The_Xm_String допустимо нуль
   --!  значение.
   ---------------------------------------------------------------------------
   function Xm_String_Empty (The_Xm_String : in Xm_String) return Boolean is
      function XmStringEmpty (The_Xm_String : in Xm_String) return Xt_Boolean;
      pragma Import (C, XmStringEmpty, "XmStringEmpty");
   begin
      return To_Boolean (XmStringEmpty (The_Xm_String));
   end Xm_String_Empty;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Generate
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_String_Generate
    (Text      : in String;
     Tag       : in Xm_String_Tag := Null_Xm_String_Tag;
     Text_Type : in Xm_Text_Type  := Xm_Multibyte_Text;
     Rendition : in Xm_String_Tag := Null_Xm_String_Tag)
       return Xm_String
   is
      C_Text : char_array := To_C (Text);

      function XmStringGenerate (Text      : in char_array;
                                 Tag       : in Xm_String_Tag;
                                 Text_Type : in Xm_Text_Type;
                                 Rendition : in Xm_String_Tag)
        return Xm_String;
      pragma Import (C, XmStringGenerate, "XmStringGenerate");
   begin
      if Text_Type /= Xm_Multibyte_Text and Text_Type /= Xm_Charset_Text then
         raise Invalid_Text_Type_Error;
      end if;

      return XmStringGenerate (C_Text, Tag, Text_Type, Rendition);
   end Xm_String_Generate;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Generate
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   --  function Xm_String_Generate
   --   (Text      : in Wide_String;
   --    Tag       : in Xm_String_Tag := Null_Xm_String_Tag;
   --    Rendition : in Xm_String_Tag := Null_Xm_String_Tag)
   --      return Xm_String
   --  is
   --     C_Text : wchar_array := To_C (Text);

   --     function XmStringGenerate (Text      : in wchar_array;
   --                                Tag       : in Xm_String_Tag;
   --                                Text_Type : in Xm_Text_Type;
   --                                Rendition : in Xm_String_Tag)
   --       return Xm_String;
   --     pragma Import (C, XmStringGenerate, "XmStringGenerate");
   --  begin
   --     return XmStringGenerate (C_Text, Tag, Xm_Widechar_Text, Rendition);
   --  end Xm_String_Generate;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Get_L_To_R
   --!    <ImplementationNotes> Аргументы The_Xm_String и Tag проверяются
   --! на нуль-значение внутри Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Get_L_To_R (The_Xm_String : in Xm_String;
                                  Tag           : in Xm_String_Tag)
     return String
   is
      Text : aliased chars_ptr;

      function XmStringGetLtoR (The_Xm_String : in     Xm_String;
                                Tag           : in     Xm_String_Tag;
                                Text          : access chars_ptr)
        return Xt_Boolean;
      pragma Import (C, XmStringGetLtoR, "XmStringGetLtoR");

      procedure XtFree (X : in chars_ptr);
      pragma Import (C, XtFree, "XtFree");
   begin
      if To_Boolean (XmStringGetLtoR (The_Xm_String, Tag, Text'Access)) then
         declare
            Return_Value : constant String := Value (Text);
         begin
            XtFree (Text);
            return Return_Value;
         end;
      else
         return "";
      end if;
   end Xm_String_Get_L_To_R;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Has_Substring
   --!    <ImplementationNotes> Аргументы The_Xm_String и Substring проверяются
   --! на нуль-значение внутри Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Has_Substring (The_Xm_String : in Xm_String;
                                     Substring     : in Xm_String)
     return Boolean
   is
      function XmStringHasSubstring (The_Xm_String : in Xm_String;
                                     Substring     : in Xm_String)
        return Xt_Boolean;
      pragma Import (C, XmStringHasSubstring, "XmStringHasSubstring");
   begin
      return To_Boolean (XmStringHasSubstring (The_Xm_String, Substring));
   end Xm_String_Has_Substring;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Is_Void
   --!    <ImplementationNotes> Аргумент The_Xm_String проверяются на
   --! нуль-значение внутри Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Is_Void (The_Xm_String : in Xm_String) return Boolean is
      function XmStringIsVoid (The_Xm_String : in Xm_String) return Xt_Boolean;
      pragma Import (C, XmStringIsVoid, "XmStringIsVoid");
   begin
      return To_Boolean (XmStringIsVoid (The_Xm_String));
   end Xm_String_Is_Void;


   function Xm_String_Length (The_Xm_String : in Xm_String) return Natural is
      function XmStringLength (The_Xm_String : in Xm_String) return int;
      pragma Import (C, XmStringLength, "XmStringLength");
   begin
      return Natural (XmStringLength (The_Xm_String));
   end Xm_String_Length;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Line_Count
   --!    <ImplementationNotes> Проверка The_Xm_String на нуль значение
   --!  производится в Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Line_Count (The_Xm_String : in Xm_String)
     return Natural
   is
      function XmStringLineCount (The_Xm_String : in Xm_String) return int;
      pragma Import (C, XmStringLineCount, "XmStringLineCount");
   begin
      return Natural (XmStringLineCount (The_Xm_String));
   end Xm_String_Line_Count;


   function Xm_String_Parse_Text
    (Text        : in String;
     Tag         : in Xm_String_Tag  := Null_Xm_String_Tag;
     Text_Type   : in Xm_Text_Type   := Xm_Multibyte_Text;
     Parse_Table : in Xm_Parse_Table := Null_Xm_Parse_Table;
     Call_Data   : in Xt_Pointer     := Null_Xt_Pointer)
       return Xm_String
   is
      function XmStringParseText (Text        : in char_array;
                                  Text_End    : in chars_ptr;
                                  Tag         : in Xm_String_Tag;
                                  Text_Type   : in Xm_Text_Type;
                                  Parse_Table : in Xm_Parse_Table;
                                  Parse_Count : in Cardinal;
                                  Call_Data   : in Xt_Pointer)
        return Xm_String;
      pragma Import (C, XmStringParseText, "XmStringParseText");
   begin
      if Text_Type /= Xm_Multibyte_Text and Text_Type /= Xm_Charset_Text then
         raise Invalid_Text_Type_Error;
      end if;

      return
        XmStringParseText (To_C (Text),
                           Interfaces.C.Strings.Null_Ptr,
                           Tag,
                           Text_Type,
                           Parse_Table,
                           Parse_Table'Length,
                           Call_Data);
   end Xm_String_Parse_Text;


   --  function Xm_String_Parse_Text
   --   (Text        : in Wide_String;
   --    Tag         : in Xm_String_Tag  := Null_Xm_String_Tag;
   --    Parse_Table : in Xm_Parse_Table := Null_Xm_Parse_Table;
   --    Call_Data   : in Xt_Pointer     := Null_Xt_Pointer)
   --      return Xm_String
   --  is
   --     function XmStringParseText (Text        : in wchar_array;
   --                                 Text_End    : in wchars_ptr;
   --                                 Tag         : in Xm_String_Tag;
   --                                 Text_Type   : in Xm_Text_Type;
   --                                 Parse_Table : in Xm_Parse_Table;
   --                                 Parse_Count : in Cardinal;
   --                                 Call_Data   : in Xt_Pointer)
   --       return Xm_String;
   --     pragma Import (C, XmStringParseText, "XmStringParseText");
   --  begin
   --     return
   --       XmStringParseText (To_C (Text),
   --                          Interfaces.C.Wide_Strings.Null_Ptr,
   --                          Tag,
   --                          Xm_Widechar_Text,
   --                          Parse_Table,
   --                          Parse_Table'Length,
   --                          Call_Data);
   --  end Xm_String_Parse_Text;


   function Xm_String_Tab_Create return Xm_String is
   begin
      return
        Xm_String_Component_Create (Xm_String_Component_Tab,
                                    0,
                                    Null_Xt_Pointer);
   end Xm_String_Tab_Create;


   function Xm_String_Table_Propose_Tablist (Strings      : in Xm_String_List;
                                             The_Widget   : in Widget;
                                             Pad_Value    : in Float;
                                             Offset_Model : in Xm_Offset_Model)
     return Xm_Tab_List
   is
      function XmStringTableProposeTablist (Strings      : in Xm_String_List;
                                            Num_Strings  : in Cardinal;
                                            The_Widget   : in Widget;
                                            Pad_Value    : in c_float;
                                            Offset_Model : in Xm_Offset_Model)
        return Xm_Tab_List;
      pragma Import (C, XmStringTableProposeTablist,
                     "XmStringTableProposeTablist");
   begin
      return XmStringTableProposeTablist (Strings,
                                          Strings'Length,
                                          The_Widget,
                                          c_float (Pad_Value),
                                          Offset_Model);
   end Xm_String_Table_Propose_Tablist;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Unparse
   --!    <ImplementationNotes> Проверка The_Xm_String на нуль значение
   --!  производится в Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Unparse
    (The_Xm_String : in Xm_String;
     Tag           : in Xm_String_Tag  := Null_Xm_String_Tag;
     Tag_Type      : in Xm_Text_Type   := Xm_No_Text;
     Output_Type   : in Xm_Text_Type   := Xm_Multibyte_Text;
     Parse_Table   : in Xm_Parse_Table := Null_Xm_Parse_Table;
     Parse_Model   : in Xm_Parse_Model := Xm_Output_All)
       return String
   is
      Tmp : chars_ptr;

      function XmStringUnparse (The_Xm_String : in Xm_String;
                                Tag           : in Xm_String_Tag;
                                Tag_Type      : in Xm_Text_Type;
                                Output_Type   : in Xm_Text_Type;
                                Parse_Table   : in Xm_Parse_Table;
                                Parse_Count   : in Cardinal;
                                Parse_Model   : in Xm_Parse_Model)
        return chars_ptr;
      pragma Import (C, XmStringUnparse, "XmStringUnparse");

      procedure XtFree (X : in chars_ptr);
      pragma Import (C, XtFree, "XtFree");
   begin
      if Output_Type /= Xm_Multibyte_Text
        and Output_Type /= Xm_Charset_Text
      then
         raise Invalid_Text_Type_Error;
      end if;

      Tmp := XmStringUnparse (The_Xm_String, Tag, Tag_Type, Output_Type,
                              Parse_Table, Parse_Table'Length, Parse_Model);
      declare
         Return_String : constant String := Value (Tmp);
      begin
         XtFree (Tmp);
         return Return_String;
      end;
   end Xm_String_Unparse;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_String_Unparse
   --!    <ImplementationNotes> Проверка The_Xm_String на нуль значение
   --!  производится в Xm.
   ---------------------------------------------------------------------------
   --  function Xm_String_Unparse
   --   (The_Xm_String : in Xm_String;
   --    Tag           : in Xm_String_Tag  := Null_Xm_String_Tag;
   --    Tag_Type      : in Xm_Text_Type   := Xm_No_Text;
   --    Parse_Table   : in Xm_Parse_Table := Null_Xm_Parse_Table;
   --    Parse_Model   : in Xm_Parse_Model := Xm_Output_All)
   --      return Wide_String
   --  is
   --     Tmp : wchars_ptr;

   --     function XmStringUnparse (The_Xm_String : in Xm_String;
   --                               Tag           : in Xm_String_Tag;
   --                               Tag_Type      : in Xm_Text_Type;
   --                               Output_Type   : in Xm_Text_Type;
   --                               Parse_Table   : in Xm_Parse_Table;
   --                               Parse_Count   : in Cardinal;
   --                               Parse_Model   : in Xm_Parse_Model)
   --       return wchars_ptr;
   --     pragma Import (C, XmStringUnparse, "XmStringUnparse");

   --     procedure XtFree (X : in wchars_ptr);
   --     pragma Import (C, XtFree, "XtFree");
   --  begin
   --     Tmp := XmStringUnparse (The_Xm_String, Tag, Tag_Type, Xm_Widechar_Text,
   --                             Parse_Table, Parse_Table'Length, Parse_Model);
   --     declare
   --        Return_String : constant Wide_String := Value (Tmp);
   --     begin
   --        XtFree (Tmp);
   --        return Return_String;
   --     end;
   --  end Xm_String_Unparse;


end Xm.Strings;
