------------------------------------------------------------------------------
--
--  Mofit Ada Binding
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
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt;

package Xm.Strings is


   function Xm_String_Create
    (Text : in String;
     Tag  : in Xm_String_Tag := Xm_Fontlist_Default_Tag)
       return Xm_String;


   function Xm_String_Create_Localized (Text : in String) return Xm_String;


   function Xm_String_Generate
    (Text      : in Wide_String;
     Tag       : in Xm_String_Tag := Null_Xm_String_Tag;
     Rendition : in Xm_String_Tag := Null_Xm_String_Tag)
       return Xm_String;


   --  Raise Invalid_Text_Type if Text_Type not Xm_Charset_Text or
   --  Xm_Multibyte_Text.
   function Xm_String_Generate
    (Text      : in String;
     Tag       : in Xm_String_Tag := Null_Xm_String_Tag;
     Text_Type : in Xm_Text_Type  := Xm_Multibyte_Text;
     Rendition : in Xm_String_Tag := Null_Xm_String_Tag)
       return Xm_String;


   function Xm_String_Direction_Create (Direction : in Xm_String_Direction)
     return Xm_String;


   function Xm_String_Separator_Create return Xm_String;


   function Xm_String_Component_Create
    (Component_Type : in Xm_String_Component_Type;
     Length         : in Interfaces.C.unsigned;
     Value          : in Xt.Xt_Pointer)
       return Xm_String;


   function Xm_String_Compare (String_1 : in Xm_String;
                               String_2 : in Xm_String)
     return Boolean;


   function Xm_String_Has_Substring (The_Xm_String : in Xm_String;
                                     Substring     : in Xm_String)
     return Boolean;


   function Xm_String_Empty (The_Xm_String : in Xm_String) return Boolean;


   function Xm_String_Is_Void (The_Xm_String : in Xm_String) return Boolean;


   function Xm_String_Line_Count (The_Xm_String : in Xm_String) return Natural;


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Параметр The_Xm_String проверяется на
   --! нуль-значение внутри Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Copy (The_Xm_String : in Xm_String) return Xm_String;


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Параметры String_1 и String_2 проверяется на
   --! нуль-значение внутри Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Concat (String_1 : in Xm_String;
                              String_2 : in Xm_String)
     return Xm_String;


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Параметры String_1 и String_2 проверяется на
   --! нуль-значение внутри Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Concat_And_Free (String_1 : in Xm_String;
                                       String_2 : in Xm_String)
     return Xm_String;


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Параметр The_Xm_String проверяется на
   --! нуль-значение внутри Xm.
   ---------------------------------------------------------------------------
   procedure Xm_String_Free (The_Xm_String : in Xm_String);


   --  Raise Invalid_Text_Type if Text_Type not Xm_Charset_Text or
   --  Xm_Multibyte_Text.
   function Xm_String_Parse_Text
    (Text        : in String;
     Tag         : in Xm_String_Tag  := Null_Xm_String_Tag;
     Text_Type   : in Xm_Text_Type   := Xm_Multibyte_Text;
     Parse_Table : in Xm_Parse_Table := Null_Xm_Parse_Table;
     Call_Data   : in Xt.Xt_Pointer  := Xt.Null_Xt_Pointer)
       return Xm_String;


   function Xm_String_Parse_Text
    (Text        : in Wide_String;
     Tag         : in Xm_String_Tag  := Null_Xm_String_Tag;
     Parse_Table : in Xm_Parse_Table := Null_Xm_Parse_Table;
     Call_Data   : in Xt.Xt_Pointer  := Xt.Null_Xt_Pointer)
       return Xm_String;


   function Xm_String_Unparse
    (The_Xm_String : in Xm_String;
     Tag           : in Xm_String_Tag  := Null_Xm_String_Tag;
     Tag_Type      : in Xm_Text_Type   := Xm_No_Text;
     Output_Type   : in Xm_Text_Type   := Xm_Multibyte_Text;
     Parse_Table   : in Xm_Parse_Table := Null_Xm_Parse_Table;
     Parse_Model   : in Xm_Parse_Model := Xm_Output_All)
       return String;


   function Xm_String_Unparse
    (The_Xm_String : in Xm_String;
     Tag           : in Xm_String_Tag  := Null_Xm_String_Tag;
     Tag_Type      : in Xm_Text_Type   := Xm_No_Text;
     Parse_Table   : in Xm_Parse_Table := Null_Xm_Parse_Table;
     Parse_Model   : in Xm_Parse_Model := Xm_Output_All)
       return Wide_String;


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Параметр The_Xm_String проверяется на
   --! нуль-значение внутри Xm. Параметр Context инициализируется в
   --! нуль-значение, поэтому возвращаемое логическое значение просто
   --! игнорируется.
   ---------------------------------------------------------------------------
   procedure Xm_String_Init_Context (Context       : in out Xm_String_Context;
                                     The_Xm_String : in     Xm_String);


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Параметр Context проверяется на нуль-значение
   --! внутри Xm.
   ---------------------------------------------------------------------------
   procedure Xm_String_Free_Context (Context : in Xm_String_Context);


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Параметры Render_Table и The_Xm_String
   --! проверяются на нуль-значение внутри Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Baseline (Render_Table  : in Xm_Render_Table;
                                The_Xm_String : in Xm_String)
     return Xt.Dimension;


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Параметры Render_Table и The_Xm_String
   --! проверяются на нуль-значение внутри Xm.
   ---------------------------------------------------------------------------
   procedure Xm_String_Extent (Render_Table  : in     Xm_Render_Table;
                               The_Xm_String : in     Xm_String;
                               Width         :    out Xt.Dimension;
                               Height        :    out Xt.Dimension);


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Параметры Render_Table и The_Xm_String
   --! проверяются на нуль-значение внутри Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Height (Render_Table  : in Xm_Render_Table;
                              The_Xm_String : in Xm_String)
     return Xt.Dimension;


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Параметры Render_Table и The_Xm_String
   --! проверяются на нуль-значение внутри Xm.
   ---------------------------------------------------------------------------
   function Xm_String_Width (Render_Table  : in Xm_Render_Table;
                             The_Xm_String : in Xm_String)
     return Xt.Dimension;


   function Xm_Parse_Mapping_Create
    (Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Parse_Mapping;


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Параметр Parse_Mapping проверяется на
   --! нуль-значение внутри Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Parse_Mapping_Free (Parse_Mapping : in Xm_Parse_Mapping);


   procedure Xm_Parse_Mapping_Get_Values
    (Parse_Mapping : in Xm_Parse_Mapping;
     Arg_List      : in Xt.Ancillary_Types.Xt_Arg_List);


   procedure Xm_Parse_Mapping_Set_Values
    (Parse_Mapping : in Xm_Parse_Mapping;
     Arg_List      : in Xt.Ancillary_Types.Xt_Arg_List);


   procedure Xm_Parse_Table_Free (Parse_Table : in Xm_Parse_Table);


   --  Add-ons

   function Xm_String_Tab_Create return Xm_String;


   function Xm_String_Table_Propose_Tablist (Strings      : in Xm_String_List;
                                             The_Widget   : in Xt.Widget;
                                             Pad_Value    : in Float;
                                             Offset_Model : in Xm_Offset_Model)
     return Xm_Tab_List;


   ---------------------------------------------------------------------------
   --  Obsolete and deprecated stuff
   ---------------------------------------------------------------------------

   --  Obsolete, replaced by Xm_String_Generate.
   function Xm_String_Create_L_To_R
    (Text     : in String;
     Char_Set : in Xm_String_Char_Set := Xm_String_Default_Char_Set)
       return Xm_String;


   function Xm_String_Create_Simple (Text : in String) return Xm_String;


   function Xm_String_Byte_Compare (String_1 : in Xm_String;
                                    String_2 : in Xm_String)
     return Boolean;


   --  Obsolete, replaced by Xm_String_Unparse.
   function Xm_String_Get_L_To_R (The_Xm_String : in Xm_String;
                                  Tag           : in Xm_String_Tag)
     return String;


   --  Obsolete, replaced by Xm_String_Byte_Stream_Length.
   function Xm_String_Length (The_Xm_String : in Xm_String) return Natural;


   Invalid_Text_Type_Error : exception;


private

   pragma Import (C, Xm_Parse_Mapping_Free, "XmParseMappingFree");
   pragma Import (C, Xm_String_Baseline, "XmStringBaseline");
   pragma Import (C, Xm_String_Component_Create, "XmStringComponentCreate");
   pragma Import (C, Xm_String_Concat, "XmStringConcat");
   pragma Import (C, Xm_String_Concat_And_Free, "XmStringConcatAndFree");
   pragma Import (C, Xm_String_Copy, "XmStringCopy");
   pragma Import (C, Xm_String_Direction_Create, "XmStringDirectionCreate");
   pragma Import (C, Xm_String_Extent, "XmStringExtent");
   pragma Import (C, Xm_String_Free, "XmStringFree");
   pragma Import (C, Xm_String_Free_Context, "XmStringFreeContext");
   pragma Import (C, Xm_String_Height, "XmStringHeight");
   pragma Import (C, Xm_String_Init_Context, "XmStringInitContext");
   pragma Import (C, Xm_String_Separator_Create, "XmStringSeparatorCreate");
   pragma Import (C, Xm_String_Width, "XmStringWidth");

   pragma Inline (Xm_String_Byte_Compare);
   pragma Inline (Xm_String_Compare);
   pragma Inline (Xm_String_Empty);
   pragma Inline (Xm_String_Has_Substring);
   pragma Inline (Xm_String_Is_Void);

end Xm.Strings;
