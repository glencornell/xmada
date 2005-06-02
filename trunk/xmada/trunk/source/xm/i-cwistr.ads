with Interfaces.C.Strings;


package Interfaces.C.Wide_Strings is
pragma Preelaborate (Wide_Strings);

   type wchar_array_access is access all wchar_array;

   type wchars_ptr is private;

   type wchars_ptr_array is array (size_t range <>) of wchars_ptr;

   Null_Ptr : constant wchars_ptr;

   function To_Wchars_Ptr
     (Item      : in wchar_array_access;
      Nul_Check : in Boolean := False)
      return      wchars_ptr;

   function New_Wchar_Array (Chars : in wchar_array) return wchars_ptr;

   function New_Wide_String (Str : in Wide_String) return wchars_ptr;

   procedure Free (Item : in out wchars_ptr);

   Dereference_Error : exception
     renames Interfaces.C.Strings.Dereference_Error;

   function Value (Item : in wchars_ptr) return wchar_array;

   function Value
     (Item   : in wchars_ptr;
      Length : in size_t)
      return   wchar_array;

   function Value (Item : in wchars_ptr) return Wide_String;

   function Value
     (Item   : in wchars_ptr;
      Length : in size_t)
      return   Wide_String;

   function Wcslen (Item : in wchars_ptr) return size_t;

   procedure Update
     (Item   : in wchars_ptr;
      Offset : in size_t;
      Chars  : in wchar_array;
      Check  : in Boolean := True);

   procedure Update
     (Item   : in wchars_ptr;
      Offset : in size_t;
      Chars  : in Wide_String;
      Check  : in Boolean := True);

   Update_Error : exception renames Interfaces.C.Strings.Update_Error;

private
   type wchars_ptr is access all wchar_t;

   Null_Ptr : constant wchars_ptr := null;
end Interfaces.C.Wide_Strings;
