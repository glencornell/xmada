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
--! <Unit> Xm_Separator_Gadget
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;

with Xt.Composite_Management;

package body Xm_Separator_Gadget is

   use Interfaces.C;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;

   function Xm_Create_Managed_Separator_Gadget
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Separator_Gadget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Separator_Gadget (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Separator_Gadget;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Separator_Gadget
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Separator_Gadget
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Separator_Gadget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateSeparatorGadget (Parent    : in Widget;
                                        Name      : in char_array;
                                        Arg_List  : in Xt_Arg_List;
                                        Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateSeparatorGadget, "XmCreateSeparatorGadget");
   begin
      return
        XmCreateSeparatorGadget (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Separator_Gadget;


end Xm_Separator_Gadget;
