------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rostel.ru)
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
--! XmAda maintained by TechnoServ A/S (email: vgodunko@rostel.ru)
--!
--! <Unit> Xt.Ancillary_Types
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;

package body Xt.Ancillary_Types is

   use Interfaces.C;

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
