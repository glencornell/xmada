------------------------------------------------------------------------------
--
--  Motif Ada Binding
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
--! <Unit> Xm_Form
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;

with Xt.Composite_Management;

package body Xm_Form is

   use Interfaces.C;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Form
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Form (Parent   : in Widget;
                            Name     : in String;
                            Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
     return Xm_Form_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateForm (Parent    : in Widget;
                             Name      : in char_array;
                             Arg_List  : in Xt_Arg_List;
                             Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateForm, "XmCreateForm");
   begin
      return XmCreateForm (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Form;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Form_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Form_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Form_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateFormDialog (Parent    : in Widget;
                                   Name      : in char_array;
                                   Arg_List  : in Xt_Arg_List;
                                   Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateFormDialog, "XmCreateFormDialog");
   begin
      return XmCreateFormDialog (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Form_Dialog;


   function Xm_Create_Managed_Form
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Form_Widget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Form (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Form;


end Xm_Form;
