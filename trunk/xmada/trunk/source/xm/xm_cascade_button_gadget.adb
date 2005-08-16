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
--! <Unit>
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

package body Xm_Cascade_Button_Gadget is

   use Interfaces.C;
   use Xm.Implementation;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;

   procedure Xm_Cascade_Button_Gadget_Highlight (The_Widget : in Widget;
                                                 Highlight  : in Boolean)
   is
      procedure XmCascadeButtonGadgetHighlight (The_Widget : in Widget;
                                                Highlight  : in Xt_Boolean);
      pragma Import (C, XmCascadeButtonGadgetHighlight,
                     "XmCascadeButtonGadgetHighlight");
   begin
      Check (The_Widget);
      XmCascadeButtonGadgetHighlight (The_Widget, To_Xt_Boolean (Highlight));
   end Xm_Cascade_Button_Gadget_Highlight;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Cascade_Button_Gadget
   --!    <ImplementationNotes> Проверку Null_Widget производит Xt с выдачей
   --!  соответствующего предупреждения.
   ---------------------------------------------------------------------------
   function Xm_Create_Cascade_Button_Gadget
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Cascade_Button_Gadget
   is
      function XmCreateCascadeButtonGadget (Parent    : in Widget;
                                            Name      : in char_array;
                                            Arg_List  : in Xt_Arg_List;
                                            Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateCascadeButtonGadget,
                     "XmCreateCascadeButtonGadget");
   begin
      return
        XmCreateCascadeButtonGadget
         (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Cascade_Button_Gadget;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Cascade_Button_Gadget
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Cascade_Button_Gadget
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Cascade_Button_Gadget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Cascade_Button_Gadget (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Cascade_Button_Gadget;


end Xm_Cascade_Button_Gadget;
