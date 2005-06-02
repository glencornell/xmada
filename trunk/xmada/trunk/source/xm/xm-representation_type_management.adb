--  !!! This module is GNAT specific. It use unchecked conversion between !!!
--  !!! general access type and address. !!!
with Ada.Unchecked_Conversion;
with Interfaces.C;            use Interfaces.C;
with System;                  use System;
with System.Storage_Elements; use System.Storage_Elements;

with Xt;                      use Xt;

with Xm.Implementation;       use Xm.Implementation;


package body Xm.Representation_Type_Management is


   function To_unsigned_char_List (Pointer : in unsigned_char_Pointer;
                                   Length  : in Natural)
     return unsigned_char_List
   is
      function To_List is
        new Generic_To_Element_List (unsigned_char,
                                     unsigned_char_Pointer,
                                     unsigned_char_List);
      pragma Inline (To_List);
   begin
      return To_List (Pointer, Length);
   end To_unsigned_char_List;


   function Xm_Rep_Type_Get_Id (Rep_Type : in String) return Xm_Rep_Type_Id is
      Return_Value : Xm_Rep_Type_Id;

      function XmRepTypeGetId (Rep_Type : in char_array) return Xm_Rep_Type_Id;
      pragma Import (C, XmRepTYpeGetId, "XmRepTypeGetId");
   begin
      Return_Value := XmRepTypeGetId (To_C (Rep_Type));

      if Return_Value = Xm_Rep_Type_Invalid then
         raise Unknown_Representation_Type_Error;
      end if;

      return Return_Value;
   end Xm_Rep_Type_Get_Id;


   function Xm_Rep_Type_Get_Name_List
    (Rep_Type_Id          : in Xm_Rep_Type_Id;
     Use_Uppercase_Format : in Boolean)
       return Xt_String_List
   is
      use type Xt_String_Pointer;

      function XmRepTypeGetNameList (Rep_Type_Id          : in Xm_Rep_Type_Id;
                                     Use_Uppercase_Format : in Xt_Boolean)
        return Xt_String_Pointer;
      pragma Import (C, XmRepTypeGetNameList, "XmRepTypeGetNameList");

      Aux : constant Xt_String_Pointer
        := XmRepTypeGetNameList (Rep_Type_Id,
                                 To_Xt_Boolean (Use_Uppercase_Format));

      procedure XtFree (Item : in Xt_String_Pointer);
      pragma Import (C, XtFree, "XtFree");
   begin
      if Aux = Null_Xt_String_Pointer then
         raise Unknown_Representation_Type_Error;
      end if;

      declare
         Return_Value : constant Xt_String_List := To_Xt_String_List (Aux);
      begin
         XtFree (Aux);
         return Return_Value;
      end;
   end Xm_Rep_Type_Get_Name_List;


   function Xm_Rep_Type_Get_Record (Rep_Type_Id : in Xm_Rep_Type_Id)
     return Xm_Rep_Type_Entry
   is
      Return_Value : Xm_Rep_Type_Entry;
      Aux          : Xm_Rep_Type_Entry_Pointer;

      function XmRepTypeGetRecord (Rep_Type_Id : in Xm_Rep_Type_Id)
        return Xm_Rep_Type_Entry_Pointer;
      pragma Import (C, XmRepTypeGetRecord, "XmRepTypeGetRecord");

      procedure XtFree (Item : in Xm_Rep_Type_Entry_Pointer);
      pragma Import (C, XtFree, "XtFree");
   begin
      Aux := XmRepTypeGetRecord (Rep_Type_Id);

      if Aux = null then
         raise Unknown_Representation_Type_Error;
      end if;

      Return_Value := Aux.all;
      XtFree (Aux);

      return Return_Value;
   end Xm_Rep_Type_Get_Record;


   function Xm_Rep_Type_Get_Registered return Xm_Rep_Type_List is
      use type Xt_String;

      function XmRepTypeGetRegistered return Xm_Rep_Type_Entry_Pointer;
      pragma Import (C, XmRepTypeGetRegistered, "XmRepTypeGetRegistered");

      Size   : constant Storage_Offset
        := (Xm_Rep_Type_List'Component_Size + Storage_Unit - 1) / Storage_Unit;
      List   : constant Xm_Rep_Type_Entry_Pointer := XmRepTypeGetRegistered;

      Aux    : Xm_Rep_Type_Entry_Pointer := List;
      Length : Natural                   := 0;

      procedure XtFree (Item : in Xm_Rep_Type_Entry_Pointer);
      pragma Import (C, XtFree, "XtFree");

      function To_Address is
        new Ada.Unchecked_Conversion (Xm_Rep_Type_Entry_Pointer, Address);

      function To_Pointer is
        new Ada.Unchecked_Conversion (Address, Xm_Rep_Type_Entry_Pointer);

   begin
      while Aux.Rep_Type_Name /= Null_Xt_String loop
         Length := Length + 1;
         Aux    := To_Pointer (To_Address (Aux) + Size);
      end loop;

      declare
         Return_Value : Xm_Rep_Type_List (0 .. Length - 1);
         Index        : Natural := Return_Value'First;
      begin
         Aux := List;

         while Aux.Rep_Type_Name /= Null_Xt_String loop
            Return_Value (Index) := Aux.all;
            Index                := Index + 1;
            Aux                  := To_Pointer (To_Address (Aux) + Size);
         end loop;

         XtFree (List);
         return Return_Value;
      end;
   end Xm_Rep_Type_Get_Registered;


end Xm.Representation_Type_Management;
