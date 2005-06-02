with Ada.Unchecked_Conversion;
with System;

with Xt; use Xt;


package body Xm.Implementation is

   use type System.Address;
   use type Interfaces.C.int;
   use type Xt.Xt_Pointer;


   type Xm_Any_Callback_Struct_Access is access Xm_Any_Callback_Struct;


   function To_Callback_Struct_Access is
     new Ada.Unchecked_Conversion (Xt_Pointer, Xm_Any_Callback_Struct_Access);


   procedure Check (The_Render_Table : in Xm_Render_Table) is
   begin
      if The_Render_Table = Null_Xm_Render_Table then
         raise Invalid_Render_Table_Error;
      end if;
   end Check;


   function Generic_To_Callback_Struct_Access_With_Reason
    (Source : in Xt_Pointer)
       return Callback_Struct_Access
   is
      function To_CSA is
        new Ada.Unchecked_Conversion (Xt_Pointer, Callback_Struct_Access);
   begin
      if Source = Null_Xt_Pointer then
         raise Dereference_Error;
      end if;

      declare
         Any : constant Xm_Any_Callback_Struct_Access
           := To_Callback_Struct_Access (Source);
      begin
         if Reason = Any.Reason then
            return To_CSA (Source);
         end if;
      end;

      raise Invalid_Callback_Reason_Error;
   end Generic_To_Callback_Struct_Access_With_Reason;


   function Generic_To_Callback_Struct_Access_With_Reason_List
    (Source : in Xt_Pointer)
       return Callback_Struct_Access
   is
      function To_CSA is
        new Ada.Unchecked_Conversion (Xt_Pointer, Callback_Struct_Access);
   begin
      if Source = Null_Xt_Pointer then
         raise Dereference_Error;
      end if;

      declare
         Any : constant Xm_Any_Callback_Struct_Access
           := To_Callback_Struct_Access (Source);
      begin
         for J in Reasons'Range loop
            if Reasons (J) = Any.Reason then
               return To_CSA (Source);
            end if;
         end loop;
      end;

      raise Invalid_Callback_Reason_Error;
   end Generic_To_Callback_Struct_Access_With_Reason_List;


end Xm.Implementation;
