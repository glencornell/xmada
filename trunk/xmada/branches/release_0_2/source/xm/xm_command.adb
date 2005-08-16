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
--! <Unit> Xm_Command
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;

with Xt.Composite_Management;

with Xm.Implementation;

package body Xm_Command is

   use Interfaces.C;
   use Xm;
   use Xm.Implementation;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Command_Append_Value
   --!    <ImplementationNotes> Проверку параметра Value на нуль значение
   --! проводит Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Command_Append_Value (The_Widget : in Xm_Command_Widget;
                                      Value      : in Xm_String)
   is
      procedure XmCommandAppendValue (The_Widget : in Widget;
                                      Value      : in Xm_String);
      pragma Import (C, XmCommandAppendValue, "XmCommandAppendValue");
   begin
      Check (The_Widget);
      XmCommandAppendValue (The_Widget, Value);
   end Xm_Command_Append_Value;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Command_Error
   --!    <ImplementationNotes> Проверку параметра Error на нуль значение
   --! проводит Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Command_Error (The_Widget : in Xm_Command_Widget;
                               Error      : in Xm_String)
   is
      procedure XmCommandError (The_Widget : in Widget;
                                Error      : in Xm_String);
      pragma Import (C, XmCommandError, "XmCommandError");
   begin
      Check (The_Widget);
      XmCommandError (The_Widget, Error);
   end Xm_Command_Error;


   function Xm_Command_Get_Child (The_Widget : in Xm_Command_Widget;
                                  Child      : in Xm_Dialog_Child_Type)
     return Widget
   is
      function XmCommandGetChild (The_Widget : in Widget;
                                  Child      : in Xm_Dialog_Child_Type)
        return Widget;
      pragma Import (C, XmCommandGetChild, "XmCommandGetChild");
   begin
      Check (The_Widget);
      return XmCommandGetChild (The_Widget, Child);
   end Xm_Command_Get_Child;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Command_Set_Value
   --!    <ImplementationNotes> Проверку параметра Value на нуль значение
   --! проводит Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Command_Set_Value (The_Widget : in Xm_Command_Widget;
                                   Value      : in Xm_String)
   is
      procedure XmCommandSetValue (The_Widget : in Widget;
                                   Value      : in Xm_String);
      pragma Import (C, XmCommandSetValue, "XmCommandSetValue");
   begin
      Check (The_Widget);
      XmCommandSetValue (The_Widget, Value);
   end Xm_Command_Set_Value;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Command
   --!    <ImplementationNotes> Проверку параметра Parent на нуль значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Command (Parent   : in Widget;
                               Name     : in String;
                               Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
     return Xm_Command_Widget
   is
      function XmCreateCommand (Parent    : in Widget;
                                Name      : in char_array;
                                Arg_List  : in Xt_Arg_List;
                                Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateCommand, "XmCreateCommand");
   begin
      return XmCreateCommand (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Command;


   function Xm_Create_Managed_Command
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Command_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Command (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Command;


end Xm_Command;
