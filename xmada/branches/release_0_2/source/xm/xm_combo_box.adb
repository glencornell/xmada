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
--! <Unit> Xm_Combo_Box
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

package body Xm_Combo_Box is

   use Interfaces.C;
   use Xm;
   use Xm.Implementation;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Combo_Box_Add_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Combo_Box_Add_Item (The_Widget : in Widget;
                                    Item       : in Xm_String;
                                    Position   : in Natural := 0;
                                    Unique     : in Boolean := True)
   is
      procedure XmComboBoxAddItem (The_Widget : in Widget;
                                   Item       : in Xm_String;
                                   Position   : in int;
                                   Unique     : in Xt_Boolean);
      pragma Import (C, XmComboBoxAddItem, "XmComboBoxAddItem");
   begin
      Check (The_Widget);

      XmComboBoxAddItem
       (The_Widget, Item, int (Position), To_Xt_Boolean (Unique));
   end Xm_Combo_Box_Add_Item;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Combo_Box_Delete_Pos
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Combo_Box_Delete_Pos (The_Widget : in Widget;
                                      Position   : in Natural := 0)
   is
      procedure XmComboBoxDeletePos (The_Widget : in Widget;
                                     Position   : in int);
      pragma Import (C, XmComboBoxDeletePos, "XmComboBoxDeletePos");
   begin
      Check (The_Widget);
      XmComboBoxDeletePos (The_Widget, int (Position));
   end Xm_Combo_Box_Delete_Pos;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Combo_Box_Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Combo_Box_Select_Item (The_Widget : in Widget;
                                       Item       : in Xm_String)
   is
      procedure XmComboBoxSelectItem (The_Widget : in Widget;
                                      Item       : in Xm_String);
      pragma Import (C, XmComboBoxSelectItem, "XmComboBoxSelectItem");
   begin
      Check (The_Widget);
      XmComboBoxSelectItem (The_Widget, Item);
   end Xm_Combo_Box_Select_Item;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Combo_Box_Set_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Combo_Box_Set_Item (The_Widget : in Widget;
                                    Item       : in Xm_String)
   is
      procedure XmComboBoxSetItem (The_Widget : in Widget;
                                   Item       : in Xm_String);
      pragma Import (C, XmComboBoxSetItem, "XmComboBoxSetItem");
   begin
      Check (The_Widget);
      XmComboBoxSetItem (The_Widget, Item);
   end Xm_Combo_Box_Set_Item;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Combo_Box_Update
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Combo_Box_Update (The_Widget : in Widget) is
      procedure XmComboBoxUpdate (The_Widget : in Widget);
      pragma Import (C, XmComboBoxUpdate, "XmComboBoxUpdate");
   begin
      Check (The_Widget);
      XmComboBoxUpdate (The_Widget);
   end Xm_Combo_Box_Update;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Combo_Box
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Combo_Box (Parent   : in Widget;
                                 Name     : in String;
                                 Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
     return Xm_Combo_Box_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateComboBox (Parent    : in Widget;
                                 Name      : in char_array;
                                 Arg_List  : in Xt_Arg_List;
                                 Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateComboBox, "XmCreateComboBox");
   begin
      return XmCreateComboBox (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Combo_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Drop_Down_Combo_Box
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Drop_Down_Combo_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateDropDownComboBox (Parent    : in Widget;
                                         Name      : in char_array;
                                         Arg_List  : in Xt_Arg_List;
                                         Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateDropDownComboBox, "XmCreateDropDownComboBox");
   begin
      return
        XmCreateDropDownComboBox (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Drop_Down_Combo_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Drop_Down_List
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Drop_Down_List
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateDropDownList (Parent    : in Widget;
                                     Name      : in char_array;
                                     Arg_List  : in Xt_Arg_List;
                                     Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateDropDownList, "XmCreateDropDownList");
   begin
      return XmCreateDropDownList (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Drop_Down_List;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Combo_Box
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Combo_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Combo_Box (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Combo_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Drop_Down_Combo_Box
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Drop_Down_Combo_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Drop_Down_Combo_Box (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Drop_Down_Combo_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Drop_Down_List
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Drop_Down_List
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Drop_Down_List (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Drop_Down_List;


end Xm_Combo_Box;
