with System;                  use System;
with System.Storage_Elements; use System.Storage_Elements;

with Unchecked_Conversion;

package body Interfaces.C.Wide_Strings is

   sizeof_wchar_t : constant := wchar_t'Size / char'Size;

   function To_wchars_ptr is
      new Unchecked_Conversion (Address, wchars_ptr);

   function To_Address is
      new Unchecked_Conversion (wchars_ptr, Address);

   -----------------------
   -- Local Subprograms --
   -----------------------

   function Peek (From : in wchars_ptr) return wchar_t;
   pragma Inline (Peek);

   procedure Poke (Value : in wchar_t; Into : in wchars_ptr);
   pragma Inline (Poke);
   --  Given a wchars_ptr, modify referenced wide character value

   function "+" (Left : in wchars_ptr; Right : in size_t) return wchars_ptr;
   pragma Inline ("+");
   --  Address arithmetic on wchars_ptr value

   function Position_Of_Wide_Nul (Into : in wchar_array) return size_t;
   --  Returns position of the first wide_nul in Into or Into'Last + 1 if none

   --  We can't use directly System.Memory because the categorization is not
   --  compatible, so we directly import here the malloc and free routines;

   function Memory_Alloc (Size : in size_t) return wchars_ptr;
   pragma Import (C, Memory_Alloc, "__gnat_malloc");

   procedure Memory_Free (Address : in wchars_ptr);
   pragma Import (C, Memory_Free, "__gnat_free");

   ---------
   -- "+" --
   ---------

   function "+" (Left : in wchars_ptr; Right : in size_t) return wchars_ptr is
   begin
      return To_wchars_ptr (To_Address (Left) +
                            Storage_Offset (Right * sizeof_wchar_t));
   end "+";

   ----------
   -- Free --
   ----------

   procedure Free (Item : in out wchars_ptr) is
   begin
      if Item = Null_Ptr then
         return;
      end if;

      Memory_Free (Item);
      Item := Null_Ptr;
   end Free;

   ---------------------
   -- New_Wchar_Array --
   ---------------------

   function New_Wchar_Array (Chars : in wchar_array) return wchars_ptr is
      Index   : size_t;
      Pointer : wchars_ptr;
   begin
      --  Get index of position of wide_nul. If Index > Chars'Last,
      --  wide_nul is absent and must be added explicitly.

      Index := Position_Of_Wide_Nul (Into => Chars);
      Pointer := Memory_Alloc ((Index - Chars'First + 1) * sizeof_wchar_t);

      --  If wide_nul is present, transfer string up to and including it.

      if Index <= Chars'Last then
         Update (Item   => Pointer,
                 Offset => 0,
                 Chars  => Chars (Chars'First .. Index),
                 Check  => False);
      else
         --  If original string has no wide_nul, transfer whole string and add
         --  terminator explicitly.

         Update (Item   => Pointer,
                 Offset => 0,
                 Chars  => Chars,
                 Check  => False);
         Poke (wide_nul,
               into => Pointer + size_t'(Chars'Length));
      end if;

      return Pointer;
   end New_Wchar_Array;

   ---------------------
   -- New_Wide_String --
   ---------------------

   function New_Wide_String (Str : in Wide_String) return wchars_ptr is
   begin
      return New_Wchar_Array (To_C (Str));
   end New_Wide_String;

   ----------
   -- Peek --
   ----------

   function Peek (From : in wchars_ptr) return wchar_t is
   begin
      return From.all;
   end Peek;

   ----------
   -- Poke --
   ----------

   procedure Poke (Value : in wchar_t; Into : in wchars_ptr) is
   begin
      Into.all := Value;
   end Poke;

   --------------------------
   -- Position_Of_Wide_Nul --
   --------------------------

   function Position_Of_Wide_Nul (Into : in wchar_array) return size_t is
   begin
      for J in Into'Range loop
         if Into (J) = wide_nul then
            return J;
         end if;
      end loop;

      return Into'Last + 1;
   end Position_Of_Wide_Nul;

   -------------------
   -- To_Wchars_Ptr --
   -------------------

   function To_Wchars_Ptr
     (Item      : in wchar_array_access;
      Nul_Check : in Boolean := False)
      return wchars_ptr
   is
   begin
      if Item = null then
         return Null_Ptr;
      elsif Nul_Check
        and then Position_Of_Wide_Nul (Into => Item.all) > Item'Last
      then
         raise Terminator_Error;
      else
         return To_wchars_ptr (Item (Item'First)'Address);
      end if;
   end To_Wchars_Ptr;

   ------------
   -- Update --
   ------------

   procedure Update
     (Item   : in wchars_ptr;
      Offset : in size_t;
      Chars  : in wchar_array;
      Check  : in Boolean := True)
   is
      Index : wchars_ptr := Item + Offset;

   begin
      if Check and then Offset + Chars'Length > Wcslen (Item) then
         raise Update_Error;
      end if;

      for J in Chars'Range loop
         Poke (Chars (J), Into => Index);
         Index := Index + size_t'(1);
      end loop;
   end Update;

   procedure Update
     (Item   : in wchars_ptr;
      Offset : in size_t;
      Chars  : in Wide_String;
      Check  : in Boolean := True)
   is
   begin
      Update (Item, Offset, To_C (Chars), Check);
   end Update;

   -----------
   -- Value --
   -----------

   function Value (Item : in wchars_ptr) return wchar_array is
      Result : wchar_array (0 .. Wcslen (Item));

   begin
      if Item = Null_Ptr then
         raise Dereference_Error;
      end if;

      --  Note that the following loop will also copy terminating wide_nul

      for J in Result'Range loop
         Result (J) := Peek (Item + J);
      end loop;

      return Result;
   end Value;

   function Value
     (Item   : in wchars_ptr;
      Length : in size_t)
      return wchar_array
   is
   begin
      if Item = Null_Ptr then
         raise Dereference_Error;
      end if;

      if Length = 0 then
         raise Constraint_Error;
      end if;

      declare
         Result : wchar_array (0 .. Length - 1);

      begin
         for J in Result'Range loop
            Result (J) := Peek (Item + J);

            if Result (J) = wide_nul then
               return Result (0 .. J);
            end if;
         end loop;

         return Result;
      end;
   end Value;

   function Value (Item : in wchars_ptr) return Wide_String is
   begin
      return To_Ada (Value (Item));
   end Value;

   function Value
     (Item   : in wchars_ptr;
      Length : in size_t)
      return Wide_String
   is
   begin
      return To_Ada (Value (Item, Length) & wide_nul);
   end Value;

   ------------
   -- Wcslen --
   ------------

   function Wcslen (Item : in wchars_ptr) return size_t is
      Item_Index : size_t := 0;

   begin
      if Item = null then
         raise Dereference_Error;
      end if;

      loop
         if Peek (Item + Item_Index) = wide_nul then
            return Item_Index;
         end if;

         Item_Index := Item_Index + 1;
      end loop;
   end Wcslen;

end Interfaces.C.Wide_Strings;
