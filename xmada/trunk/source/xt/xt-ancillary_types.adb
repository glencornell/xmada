with Ada.Unchecked_Conversion;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;


package body Xt.Ancillary_Types is


   Dereference_Error : exception
     renames Interfaces.C.Strings.Dereference_Error;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> To_Xt_Resource_List
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function To_Xt_Resource_List (Pointer : in Xt_Resource_Pointer;
                                 Length  : in Cardinal)
     return Xt_Resource_List is
   begin
      if Pointer = null then
         raise Dereference_Error;
      elsif Length <= 0 then
         return Null_Xt_Resource_List;
      else
         declare
            subtype A is Xt_Resource_List (0 .. Integer (Length) - 1);
            type PA is access all A;
            function To_PA is
              new Ada.Unchecked_Conversion (Xt_Resource_Pointer, PA);
         begin
            return To_PA (Pointer).all;
         end;
      end if;
   end To_Xt_Resource_List;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> To_Xt_Widget_List
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function To_Xt_Widget_List (Pointer : in Xt_Widget_Pointer;
                               Length  : in Cardinal)
     return Xt_Widget_List is
   begin
      if Pointer = null then
         raise Dereference_Error;
      elsif Length <= 0 then
         return Null_Xt_Widget_List;
      else
         declare
            subtype A is Xt_Widget_List (0 .. Integer (Length) - 1);
            type PA is access all A;
            function To_PA is
              new Ada.Unchecked_Conversion (Xt_Widget_Pointer, PA);
         begin
            return To_PA (Pointer).all;
         end;
      end if;
   end To_Xt_Widget_List;


end Xt.Ancillary_Types;
