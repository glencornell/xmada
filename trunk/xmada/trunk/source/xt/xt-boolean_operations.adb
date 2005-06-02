with Interfaces.C;       use Interfaces.C;


package body Xt.Boolean_Operations is


   Default_Xt_True  : constant Xt_Boolean := 1;


   function "=" (Left : in Boolean; Right : in Boolean) return Xt_Boolean is
   begin
      if Left = Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "=";


   function "=" (Left : in Boolean; Right : in Xt_Boolean) return Boolean is
   begin
      return Left = (unsigned_char (Right) /= unsigned_char (Xt_False));
   end "=";


   function "=" (Left : in Boolean; Right : in Xt_Boolean) return Xt_Boolean is
   begin
      if Left = (unsigned_char (Right) /= unsigned_char (Xt_False)) then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "=";


   function "=" (Left : in Xt_Boolean; Right : in Boolean) return Boolean is
   begin
      return (unsigned_char (Left) /= unsigned_char (Xt_False)) = Right;
   end "=";


   function "=" (Left : in Xt_Boolean; Right : in Boolean) return Xt_Boolean is
   begin
      if (unsigned_char (Left) /= unsigned_char (Xt_False)) = Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "=";


   function "=" (Left : in Xt_Boolean; Right : in Xt_Boolean) return Boolean is
   begin
      return (unsigned_char (Left) /= unsigned_char (Xt_False)) =
             (unsigned_char (Right) /= unsigned_char (Xt_False));
   end "=";


   function "and" (Left : in Boolean; Right : in Boolean) return Xt_Boolean is
   begin
      if Left and Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "and";


   function "and" (Left : in Boolean; Right : in Xt_Boolean) return Boolean is
   begin
      return Left and unsigned_char (Right) /= unsigned_char (Xt_False);
   end "and";


   function "and" (Left : in Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if Left and unsigned_char (Right) /= unsigned_char (Xt_False) then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "and";


   function "and" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean is
   begin
      return unsigned_char (Left) /= unsigned_char (Xt_False) and Right;
   end "and";


   function "and" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean is
   begin
      if unsigned_char (Left) /= unsigned_char (Xt_False) and Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "and";


   function "and" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean is
   begin
      return unsigned_char (Left) /= unsigned_char (Xt_False) and
             unsigned_char (Right) /= unsigned_char (Xt_False);
   end "and";


   function "not" (Right : in Boolean) return Xt_Boolean is
   begin
      if Right then
         return Xt_False;
      else
         return Default_Xt_True;
      end if;
   end "not";


   function "not" (Right : in Xt_Boolean) return Boolean is
   begin
      return unsigned_char (Right) = unsigned_char (Xt_False);
   end "not";


   function "or" (Left : in Boolean; Right : in Boolean) return Xt_Boolean is
   begin
      if Left or Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "or";


   function "or" (Left : in Boolean; Right : in Xt_Boolean) return Boolean is
   begin
      return Left or unsigned_char (Right) /= unsigned_char (Xt_False);
   end "or";


   function "or" (Left : in Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if Left or unsigned_char (Right) /= unsigned_char (Xt_False) then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "or";


   function "or" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean is
   begin
      return unsigned_char (Left) /= unsigned_char (Xt_False) or Right;
   end "or";


   function "or" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean is
   begin
      if unsigned_char (Left) /= unsigned_char (Xt_False) or Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "or";


   function "or" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean is
   begin
      return unsigned_char (Left) /= unsigned_char (Xt_False) or
             unsigned_char (Right) /= unsigned_char (Xt_False);
   end "or";


   function "xor" (Left : in Boolean; Right : in Boolean) return Xt_Boolean is
   begin
      if Left xor Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "xor";


   function "xor" (Left : in Boolean; Right : in Xt_Boolean) return Boolean is
   begin
      return Left xor unsigned_char (Right) /= unsigned_char (Xt_False);
   end "xor";


   function "xor" (Left : in Boolean; Right : in Xt_Boolean)
     return Xt_Boolean is
   begin
      if Left xor unsigned_char (Right) /= unsigned_char (Xt_False) then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "xor";


   function "xor" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean is
   begin
      return unsigned_char (Left) /= unsigned_char (Xt_False) xor Right;
   end "xor";


   function "xor" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean is
   begin
      if unsigned_char (Left) /= unsigned_char (Xt_False) xor Right then
         return Default_Xt_True;
      else
         return Xt_False;
      end if;
   end "xor";


   function "xor" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean is
   begin
      return unsigned_char (Left) /= unsigned_char (Xt_False) xor
             unsigned_char (Right) /= unsigned_char (Xt_False);
   end "xor";


end Xt.Boolean_Operations;
