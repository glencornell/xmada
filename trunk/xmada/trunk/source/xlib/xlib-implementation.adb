--  !!! This module is GNAT specific. It use unchecked conversion between !!!
--  !!! general access type and address and address arithmetic. !!!
with Ada.Unchecked_Conversion;
with System;                  use System;
with System.Storage_Elements; use System.Storage_Elements;


package body Xlib.Implementation is


   procedure Check (The_Display : in Display) is
   begin
      if The_Display = Null_Display then
         raise Invalid_Display_Error;
      end if;
   end Check;


   procedure Check (The_GC : in Graphic_Context) is
   begin
      if The_GC = Null_Graphic_Context then
         raise Invalid_Graphic_Context_Error;
      end if;
   end Check;


   procedure Check (The_Screen : in Screen) is
   begin
      if The_Screen = Null_Screen then
         raise Invalid_Screen_Error;
      end if;
   end Check;


   function Generic_Terminated_To_Element_List (Pointer : in Element_Pointer)
     return Element_List
   is
      Element_Size : constant Storage_Offset
        := (Element_List'Component_Size + Storage_Unit - 1) / Storage_Unit;
      Aux          : Element_Pointer := Pointer;
      Length       : Natural := 0;

      function To_Address is
        new Ada.Unchecked_Conversion (Element_Pointer, Address);

      function To_Pointer is
        new Ada.Unchecked_Conversion (Address, Element_Pointer);
   begin
      if Pointer = null then
         raise Dereference_Error;
      end if;

      while Aux.all /= Terminator loop
         Length := Length + 1;
         Aux    := To_Pointer (To_Address (Aux) + Element_Size);
      end loop;

      declare
         Return_Value : Element_List (0 .. Length - 1);
      begin
         Aux := Pointer;
         for J in Return_Value'Range loop
            Return_Value (J) := Aux.all;
            Aux              := To_Pointer (To_Address (Aux) + Element_Size);
         end loop;

         return Return_Value;
      end;
   end Generic_Terminated_To_Element_List;


   function Generic_To_Element_List (Pointer : in Element_Pointer;
                                     Length  : in Natural)
     return Element_List
   is
--      pragma Suppress (Index_Check);
--      pragma Suppress (Access_Check);

      Element_Size : constant Storage_Offset
        := (Element_List'Component_Size + Storage_Unit - 1) / Storage_Unit;
      Aux          : Element_Pointer := Pointer;
      Return_Value : Element_List (0 .. Length - 1);

      function To_Address is
        new Ada.Unchecked_Conversion (Element_Pointer, Address);

      function To_Pointer is
        new Ada.Unchecked_Conversion (Address, Element_Pointer);
   begin
      if Pointer = null then
         raise Dereference_Error;
      end if;

      for J in Return_Value'Range loop
         Return_Value (J) := Aux.all;
         Aux              := To_Pointer (To_Address (Aux) + Element_Size);
      end loop;

      return Return_Value;
   end Generic_To_Element_List;


end Xlib.Implementation;
