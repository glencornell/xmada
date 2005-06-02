
package Xt.Boolean_Operations is


   function "=" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean;

   function "=" (Left : in Boolean;    Right : in Xt_Boolean)
     return Xt_Boolean;

   function "=" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean;

   function "=" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean;

   function "=" (Left : in Boolean;    Right : in Xt_Boolean)
     return Boolean;

   function "=" (Left : in Boolean;    Right : in Boolean)
     return Xt_Boolean;


   function "and" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean;

   function "and" (Left : in Boolean;    Right : in Xt_Boolean)
     return Xt_Boolean;

   function "and" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean;

   function "and" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean;

   function "and" (Left : in Boolean;    Right : in Xt_Boolean)
     return Boolean;

   function "and" (Left : in Boolean;    Right : in Boolean)
     return Xt_Boolean;


   function "or" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean;

   function "or" (Left : in Boolean;    Right : in Xt_Boolean)
     return Xt_Boolean;

   function "or" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean;

   function "or" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean;

   function "or" (Left : in Boolean;    Right : in Xt_Boolean)
     return Boolean;

   function "or" (Left : in Boolean;    Right : in Boolean)
     return Xt_Boolean;


   function "xor" (Left : in Xt_Boolean; Right : in Boolean)
     return Xt_Boolean;

   function "xor" (Left : in Boolean;    Right : in Xt_Boolean)
     return Xt_Boolean;

   function "xor" (Left : in Xt_Boolean; Right : in Xt_Boolean)
     return Boolean;

   function "xor" (Left : in Xt_Boolean; Right : in Boolean)
     return Boolean;

   function "xor" (Left : in Boolean;    Right : in Xt_Boolean)
     return Boolean;

   function "xor" (Left : in Boolean;    Right : in Boolean)
     return Xt_Boolean;


   function "not" (Right : in Boolean) return Xt_Boolean;

   function "not" (Right : in Xt_Boolean) return Boolean;


private

   pragma Inline ("=");
   pragma Inline ("and");
   pragma Inline ("not");
   pragma Inline ("or");
   pragma Inline ("xor");

end Xt.Boolean_Operations;
