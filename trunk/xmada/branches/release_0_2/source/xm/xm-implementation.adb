------------------------------------------------------------------------------
--
--  Motif Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rost.ru)
--!
--! XmAda is free software; you can redistribute it and/or modify it under
--! the terms of the GNU General Public License as published by the Free
--! Software Foundation; either version 2, or (at your option) any later
--! version.
--!
--! XmAda is distributed in the hope that it will be useful, but WITHOUT ANY
--! WARRANTY; without even the implied warranty of MERCHANTABILITY or
--! FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
--! for more details.
--!
--! You should have received a copy of the GNU General Public License
--! along with GCC; see the file COPYING. If not, write to the Free
--! Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
--! 02110-1301, USA.
--!
--! As a special exception, if other files instantiate generics from this
--! unit, or you link this unit with other files to produce an executable,
--! this unit does not by itself cause the resulting executable to be
--! covered by the GNU General Public License. This exception does not
--! however invalidate any other reasons why the executable file might be
--! covered by the GNU Public License.
--!
--! <Unit> Xm.Implementation
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
with System;

package body Xm.Implementation is

   use type System.Address;
   use type Interfaces.C.int;
   use type Xt.Xt_Pointer;
   use Xt;

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
