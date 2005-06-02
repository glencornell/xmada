with Ada.Unchecked_Deallocation;
with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

with Xt;                   use Xt;
with Xt.Ancillary_Types;   use Xt.Ancillary_Types;
with Xm.Implementation;    use Xm.Implementation;


package body Xm.Render_Tables is

   type Xm_Rendition_Pointer is access all Xm_Rendition;
   pragma Convention (C, Xm_Rendition_Pointer);

   Null_Xm_Rendition_Pointer : constant Xm_Rendition_Pointer := null;

   type Xm_String_Tag_Pointer is access all Xm_String_Tag;
   pragma Convention (C, Xm_String_Tag_Pointer);


   function Xm_Render_Table_Add_Rendition
    (Render_Table : in Xm_Render_Table;
     Rendition    : in Xm_Rendition;
     Merge_Mode   : in Xm_Rendition_Merge_Mode)
       return Xm_Render_Table
   is
      Renditions : constant Xm_Rendition_List (0 .. 0) := (0 => Rendition);
   begin
      return
        Xm_Render_Table_Add_Renditions (Render_Table, Renditions, Merge_Mode);
   end Xm_Render_Table_Add_Rendition;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Render_Table_Add_Renditions
   --!    <ImplementationNotes> Параметры Render_Table и Renditions проверяются
   --! на нуль значение в Xm.
   ---------------------------------------------------------------------------
   function Xm_Render_Table_Add_Renditions
    (Render_Table : in Xm_Render_Table;
     Renditions   : in Xm_Rendition_List;
     Merge_Mode   : in Xm_Rendition_Merge_Mode)
       return Xm_Render_Table
   is
      function XmRenderTableAddRenditions
       (Render_Table    : in Xm_Render_Table;
        Renditions      : in Xm_Rendition_List;
        Rendition_Count : in Cardinal;
        Merge_Mode      : in Xm_Rendition_Merge_Mode)
          return Xm_Render_Table;
      pragma Import (C, XmRenderTableAddRenditions,
                     "XmRenderTableAddRenditions");
   begin
      return XmRenderTableAddRenditions
              (Render_Table, Renditions, Renditions'Length, Merge_Mode);
   end Xm_Render_Table_Add_Renditions;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Render_Table_Copy
   --!    <ImplementationNotes> Параметры Render_Table и Tags проверяются на
   --! нуль значение в Xm.
   ---------------------------------------------------------------------------
   function Xm_Render_Table_Copy (Render_Table : in Xm_Render_Table;
                                  Tags         : in Xm_String_Tag_List)
     return Xm_Render_Table
   is
      function XmRenderTableCopy (Render_Table : in Xm_Render_Table;
                                  Tags         : in Xm_String_Tag_List;
                                  Tag_Count    : in int)
        return Xm_Render_Table;
      pragma Import (C, XmRenderTableCopy, "XmRenderTableCopy");
   begin
      return XmRenderTableCopy (Render_Table, Tags, Tags'Length);
   end Xm_Render_Table_Copy;


   function Xm_Render_Table_Cvt_From_Prop (The_Widget : in Widget;
                                           Property   : in String)
     return Xm_Render_Table
   is
      function XmRenderTableCvtFromProp (The_Widget : in Widget;
                                         Property   : in char_array;
                                         Length     : in unsigned)
        return Xm_Render_Table;
      pragma Import (C, XmRenderTableCvtFromProp, "XmRenderTableCvtFromProp");
   begin
      Check (The_Widget);

      return XmRenderTableCvtFromProp (The_Widget,
                                       To_C (Property),
                                       Property'Length);
   end Xm_Render_Table_Cvt_From_Prop;


   function Xm_Render_Table_Cvt_To_Prop (The_Widget   : in Widget;
                                         Render_Table : in Xm_Render_Table)
     return String
   is
      C_Property : aliased chars_ptr;
      Length     : unsigned;

      function XmRenderTableCvtToProp (The_Widget   : in     Widget;
                                       Render_Table : in     Xm_Render_Table;
                                       Prop_Return  : access chars_ptr)
        return unsigned;
      pragma Import (C, XmRenderTableCvtToProp, "XmRenderTableCvtToProp");

      procedure XtFree (Item : in chars_ptr);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget);
      Check (Render_Table);

      Length :=
        XmRenderTableCvtToProp (The_Widget, Render_Table, C_Property'Access);

      declare
         Return_Value : constant String := Value (C_Property, size_t (Length));
      begin
         XtFree (C_Property);
         return Return_Value;
      end;
   end Xm_Render_Table_Cvt_To_Prop;


   procedure Xm_Render_Table_Cvt_To_Prop
    (The_Widget   : in     Widget;
     Render_Table : in     Xm_Render_Table;
     Property     :    out String_Access)
   is
      C_Property : aliased chars_ptr;
      Length     : unsigned;

      function XmRenderTableCvtToProp (The_Widget   : in     Widget;
                                       Render_Table : in     Xm_Render_Table;
                                       Prop_Return  : access chars_ptr)
        return unsigned;
      pragma Import (C, XmRenderTableCvtToProp, "XmRenderTableCvtToProp");

      procedure XtFree (Item : in chars_ptr);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget);
      Check (Render_Table);

      Length :=
        XmRenderTableCvtToProp (The_Widget, Render_Table, C_Property'Access);

      Property := new String'(Value (C_Property, size_t (Length)));
      XtFree (C_Property);
   end Xm_Render_Table_Cvt_To_Prop;


   procedure Xm_Render_Table_Free (Render_Table : in Xm_Render_Table) is
      procedure XmRenderTableFree (Render_Table : in Xm_Render_Table);
      pragma Import (C, XmRenderTableFree, "XmRenderTableFree");
   begin
      if Render_Table /= Null_Xm_Render_Table then
         XmRenderTableFree (Render_Table);
      end if;
   end Xm_Render_Table_Free;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Render_Table_Get_Rendition
   --!    <ImplementationNotes> Параметр Tag проверяется на нуль-значение
   --! в Xm.
   ---------------------------------------------------------------------------
   function Xm_Render_Table_Get_Rendition (Render_Table : in Xm_Render_Table;
                                           Tag          : in Xm_String_Tag)
     return Xm_Rendition
   is
      function XmRenderTableGetRendition (Render_Table : in Xm_Render_Table;
                                          Tag          : in Xm_String_Tag)
        return Xm_Rendition;
      pragma Import (C, XmRenderTableGetRendition,
                     "XmRenderTableGetRendition");
   begin
      Check (Render_Table);

      return XmRenderTableGetRendition (Render_Table, Tag);
   end Xm_Render_Table_Get_Rendition;


   function Xm_Render_Table_Get_Renditions
    (Render_Table : in Xm_Render_Table;
     Tags         : in Xm_String_Tag_List)
       return Xm_Rendition_List
   is
      C_Return_Value : Xm_Rendition_Pointer;

      function XmRenderTableGetRenditions
       (Render_Table : in Xm_Render_Table;
        Tags         : in Xm_String_Tag_List;
        Tag_Count    : in Cardinal)
          return Xm_Rendition_Pointer;
      pragma Import (C, XmRenderTableGetRenditions,
                     "XmRenderTableGetRenditions");

      function To_Xm_Rendition_List is
        new Generic_To_Element_List (Xm_Rendition,
                                     Xm_Rendition_Pointer,
                                     Xm_Rendition_List);

      procedure XtFree (Item : in Xm_Rendition_Pointer);
      pragma Import (C, XtFree, "XtFree");
   begin
      C_Return_Value :=
        XmRenderTableGetRenditions (Render_Table, Tags, Tags'Length);

      if C_Return_Value = Null_Xm_Rendition_Pointer then
         return Null_Xm_Rendition_List;
      end if;

      declare
         Return_Value : constant Xm_Rendition_List
           := To_Xm_Rendition_List (C_Return_Value, Tags'Length);
      begin
         XtFree (C_Return_Value);
         return Return_Value;
      end;
   end Xm_Render_Table_Get_Renditions;


   procedure Xm_Render_Table_Get_Tags
    (Render_Table : in     Xm_Render_Table;
     Tag_List     :    out Xm_String_Tag_List_Access)
   is
      C_Return_Value : aliased Xm_String_Tag_Pointer;
      Length         : int;

      function XmRenderTableGetTags
       (Render_Table : in     Xm_Render_Table;
        Tag_List     : access Xm_String_Tag_Pointer)
          return int;
      pragma Import (C, XmRenderTableGetTags, "XmRenderTableGetTags");

      procedure XtFree (Item : in Xm_String_Tag_Pointer);
      pragma Import (C, XtFree, "XtFree");

      function To_Xm_String_Tag_List is
        new Generic_To_Element_List (Xm_String_Tag,
                                     Xm_String_Tag_Pointer,
                                     Xm_String_Tag_List);
   begin
      Length := XmRenderTableGetTags (Render_Table, C_Return_Value'Access);

      if Length = 0 then
         Tag_List := null;
      end if;

      Tag_List :=
        new Xm_String_Tag_List'(To_Xm_String_Tag_List (C_Return_Value,
                                                       Natural (Length)));
      XtFree (C_Return_Value);
   end Xm_Render_Table_Get_Tags;


   function Xm_Render_Table_Get_Tags (Render_Table : in Xm_Render_Table)
     return Xm_String_Tag_List
   is
      C_Return_Value : aliased Xm_String_Tag_Pointer;
      Length         : int;

      function XmRenderTableGetTags
       (Render_Table : in     Xm_Render_Table;
        Tag_List     : access Xm_String_Tag_Pointer)
          return int;
      pragma Import (C, XmRenderTableGetTags, "XmRenderTableGetTags");

      procedure XtFree (Item : in Xm_String_Tag_Pointer);
      pragma Import (C, XtFree, "XtFree");

      function To_Xm_String_Tag_List is
        new Generic_To_Element_List (Xm_String_Tag,
                                     Xm_String_Tag_Pointer,
                                     Xm_String_Tag_List);
   begin
      Length := XmRenderTableGetTags (Render_Table, C_Return_Value'Access);

      if Length = 0 then
         return Null_Xm_String_Tag_List;
      end if;

      declare
         Return_Value : constant Xm_String_Tag_List
           := To_Xm_String_Tag_List (C_Return_Value, Natural (Length));
      begin
         XtFree (C_Return_Value);
         return Return_Value;
      end;
   end Xm_Render_Table_Get_Tags;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Render_Table_Remove_Renditions
   --!    <ImplementationNotes> Параметры Render_Table и Tags проверяются на
   --! нуль значение в Xm.
   ---------------------------------------------------------------------------
   function Xm_Render_Table_Remove_Renditions
    (Render_Table : in Xm_Render_Table;
     Tags         : in Xm_String_Tag_List)
       return Xm_Render_Table
   is
      function XmRenderTableRemoveRenditions
       (Render_Table : in Xm_Render_Table;
        Tags         : in Xm_String_Tag_List;
        Tag_Count    : in int)
          return Xm_Render_Table;
      pragma Import (C, XmRenderTableRemoveRenditions,
                     "XmRenderTableRemoveRenditions");
   begin
      return XmRenderTableRemoveRenditions (Render_Table, Tags, Tags'Length);
   end Xm_Render_Table_Remove_Renditions;


   function Xm_Rendition_Create
    (The_Widget : in Widget;
     Tag        : in Xm_String_Tag;
     Arg_List   : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Rendition
   is
      function XmRenditionCreate (The_Widget : in Widget;
                                  Tag        : in Xm_String_Tag;
                                  Arg_List   : in Xt_Arg_List;
                                  Arg_Count  : in Cardinal)
        return Xm_Rendition;
      pragma Import (C, XmRenditionCreate, "XmRenditionCreate");
   begin
      Check (The_Widget);
      return XmRenditionCreate (The_Widget, Tag, Arg_List, Arg_List'Length);
   end Xm_Rendition_Create;


   procedure Xm_Rendition_List_Free (Item : in Xm_Rendition_List) is
   begin
      for J in Item'Range loop
         Xm_Rendition_Free (Item (J));
      end loop;
   end Xm_Rendition_List_Free;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Rendition_Retrieve
   --!    <ImplementationNotes> Параметр Rendition проверяется на нуль значение
   --! в Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Rendition_Retrieve
    (Rendition : in Xm_Rendition;
     Arg_List  : in Xt_Arg_List := Null_Xt_Arg_List)
   is
      procedure XmRenditionRetrieve (Rendition : in Xm_Rendition;
                                     Arg_List  : in Xt_Arg_List;
                                     Arg_Count : in Cardinal);
      pragma Import (C, XmRenditionRetrieve, "XmRenditionRetrieve");
   begin
      XmRenditionRetrieve (Rendition, Arg_List, Arg_List'Length);
   end Xm_Rendition_Retrieve;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Rendition_Update
   --!    <ImplementationNotes> Параметр Rendition проверяется на нуль значение
   --! в Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Rendition_Update
    (Rendition : in Xm_Rendition;
     Arg_List  : in Xt_Arg_List := Null_Xt_Arg_List)
   is
      procedure XmRenditionUpdate (Rendition : in Xm_Rendition;
                                   Arg_List  : in Xt_Arg_List;
                                   Arg_Count : in Cardinal);
      pragma Import (C, XmRenditionUpdate, "XmRenditionUpdate");
   begin
      XmRenditionUpdate (Rendition, Arg_List, Arg_List'Length);
   end Xm_Rendition_Update;


   procedure Xm_String_Tag_List_Access_Free
    (Item : in out Xm_String_Tag_List_Access)
   is
      procedure XtFree (Item : in Xm_String_Tag);
      pragma Import (C, XtFree, "XtFree");

      procedure Free is
        new Ada.Unchecked_Deallocation (Xm_String_Tag_List,
                                        Xm_String_Tag_List_Access);
   begin
      for J in Item'Range loop
         XtFree (Item (J));
      end loop;

      Free (Item);
   end Xm_String_Tag_List_Access_Free;


   procedure Xm_String_Tag_List_Free (Item : in Xm_String_Tag_List) is
      procedure XtFree (Item : in Xm_String_Tag);
      pragma Import (C, XtFree, "XtFree");
   begin
      for J in Item'Range loop
         XtFree (Item (J));
      end loop;
   end Xm_String_Tag_List_Free;


   function Xm_Tab_Create (Value        : in Float;
                           Units        : in Xm_Unit_Type;
                           Offset_Model : in Xm_Offset_Model)
     return Xm_Tab
   is
      function XmTabCreate
       (Value        : in c_float;
        Units        : in Xm_Unit_Type;
        Offset_Model : in Xm_Offset_Model;
        Alignment    : in Xm_Alignment := Xm_Alignment_Beginning;
        Decimal      : in chars_ptr    := Null_Ptr)
          return Xm_Tab;
      pragma Import (C, XmTabCreate, "XmTabCreate");
   begin
      if Value < 0.0 then
         raise Constraint_Error;
      end if;

      return XmTabCreate (c_float (Value), Units, Offset_Model);
   end Xm_Tab_Create;


end Xm.Render_Tables;
