with Interfaces.C;       use Interfaces.C;


package body Xt is


   function "=" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if (unsigned_char (Left) /= unsigned_char (Xt_False)) =
         (unsigned_char (Right) /= unsigned_char (Xt_False))
      then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "=";


   function "and" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if unsigned_char (Left) /= unsigned_char (Xt_False) and
         unsigned_char (Right) /= unsigned_char (Xt_False)
      then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "and";


   function "not" (Right : in Xt_Boolean) return Xt_Boolean is
   begin
      if unsigned_char (Right) = unsigned_char (Xt_False) then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "not";


   function "or" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if unsigned_char (Left) /= unsigned_char (Xt_False) or
         unsigned_char (Right) /= unsigned_char (Xt_False)
      then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "or";


   function "xor" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if unsigned_char (Left) /= unsigned_char (Xt_False) xor
         unsigned_char (Right) /= unsigned_char (Xt_False)
      then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "xor";


   function To_Boolean (Item : in Xt_Boolean) return Boolean is
   begin
      return unsigned_char (Item) /= unsigned_char (Xt_False);
   end To_Boolean;


   function To_Xt_Boolean (Item : in Boolean) return Xt_Boolean is
   begin
      if Item then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end To_Xt_Boolean;


end Xt;
