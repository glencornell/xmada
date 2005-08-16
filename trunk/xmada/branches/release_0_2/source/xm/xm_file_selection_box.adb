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
--! <Unit> Xm_File_Selection_Box
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

package body Xm_File_Selection_Box is

   use Interfaces.C;
   use Xm;
   use Xm.Implementation;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_File_Selection_Box
   --!    <ImplementationNotes> Параметр Parent проверяется на нуль значение
   --! в Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_File_Selection_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_File_Selection_Box_Widget
   is
      function XmCreateFileSelectionBox (Parent    : in Widget;
                                         Name      : in char_array;
                                         Arg_List  : in Xt_Arg_List;
                                         Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateFileSelectionBox, "XmCreateFileSelectionBox");
   begin
      return XmCreateFileSelectionBox (Parent,
                                       To_C (Name),
                                       Arg_List,
                                       Arg_List'Length);
   end Xm_Create_File_Selection_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_File_Selection_Dialog
   --!    <ImplementationNotes> Параметр Parent проверяется на нуль значение
   --! в Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_File_Selection_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_File_Selection_Box_Widget
   is
      function XmCreateFileSelectionDialog (Parent    : in Widget;
                                            Name      : in char_array;
                                            Arg_List  : in Xt_Arg_List;
                                            Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateFileSelectionDialog,
                     "XmCreateFileSelectionDialog");
   begin
      return XmCreateFileSelectionDialog (Parent,
                                          To_C (Name),
                                          Arg_List,
                                          Arg_List'Length);
   end Xm_Create_File_Selection_Dialog;


   function Xm_Create_Managed_File_Selection_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_File_Selection_Box_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_File_Selection_Box (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_File_Selection_Box;


   function Xm_File_Selection_Box_Get_Child
    (The_Widget : in Xm_File_Selection_Box_Widget;
     Child      : in Xm_Dialog_Child_Type)
       return Widget
   is
      function XmFileSelectionBoxGetChild
       (The_Widget : in Widget;
        Child      : in Xm_Dialog_Child_Type)
          return Widget;
      pragma Import (C, XmFileSelectionBoxGetChild,
                     "XmFileSelectionBoxGetChild");
   begin
      Check (The_Widget);

      return XmFileSelectionBoxGetChild (The_Widget, Child);
   end Xm_File_Selection_Box_Get_Child;


   procedure Xm_File_Selection_Do_Search
    (The_Widget : in Xm_File_Selection_Box_Widget;
     Dir_Mask   : in Xm_String)
   is
      procedure XmFileSelectionDoSearch (The_Widget : in Widget;
                                         Dir_Mask   : in Xm_String);
      pragma Import (C, XmFileSelectionDoSearch, "XmFileSelectionDoSearch");
   begin
      Check (The_Widget);

      XmFileSelectionDoSearch (The_Widget, Dir_Mask);
   end Xm_File_Selection_Do_Search;


end Xm_File_Selection_Box;
