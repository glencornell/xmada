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
--! <Unit> Xm_Message_Box
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

package body Xm_Message_Box is

   use Interfaces.C;
   use Xm;
   use Xm.Implementation;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Error_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Error_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateErrorDialog (Parent    : in Widget;
                                    Name      : in char_array;
                                    Arg_List  : in Xt_Arg_List;
                                    Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateErrorDialog, "XmCreateErrorDialog");
   begin
      return
        XmCreateErrorDialog (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Error_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Information_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Information_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateInformationDialog (Parent    : in Widget;
                                          Name      : in char_array;
                                          Arg_List  : in Xt_Arg_List;
                                          Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateInformationDialog,
                     "XmCreateInformationDialog");
   begin
      return XmCreateInformationDialog (Parent,
                                        To_C (Name),
                                        Arg_List,
                                        Arg_List'Length);
   end Xm_Create_Information_Dialog;


   function Xm_Create_Managed_Message_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Message_Box (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Message_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Message_Box
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Message_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateMessageBox (Parent    : in Widget;
                                   Name      : in char_array;
                                   Arg_List  : in Xt_Arg_List;
                                   Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateMessageBox, "XmCreateMessageBox");
   begin
      return
        XmCreateMessageBox (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Message_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Message_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Message_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateMessageDialog (Parent    : in Widget;
                                      Name      : in char_array;
                                      Arg_List  : in Xt_Arg_List;
                                      Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateMessageDialog, "XmCreateMessageDialog");
   begin
      return
        XmCreateMessageDialog (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Message_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Question_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Question_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateQuestionDialog (Parent    : in Widget;
                                       Name      : in char_array;
                                       Arg_List  : in Xt_Arg_List;
                                       Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateQuestionDialog, "XmCreateQuestionDialog");
   begin
      return XmCreateQuestionDialog (Parent,
                                     To_C (Name),
                                     Arg_List,
                                     Arg_List'Length);
   end Xm_Create_Question_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Template_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Template_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateTemplateDialog (Parent    : in Widget;
                                       Name      : in char_array;
                                       Arg_List  : in Xt_Arg_List;
                                       Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateTemplateDialog, "XmCreateTemplateDialog");
   begin
      return XmCreateTemplateDialog (Parent,
                                     To_C (Name),
                                     Arg_List,
                                     Arg_List'Length);
   end Xm_Create_Template_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Warning_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Warning_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateWarningDialog (Parent    : in Widget;
                                      Name      : in char_array;
                                      Arg_List  : in Xt_Arg_List;
                                      Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateWarningDialog, "XmCreateWarningDialog");
   begin
      return
        XmCreateWarningDialog (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Warning_Dialog;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Working_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Working_Dialog
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Message_Box_Widget
   is
      function XmCreateWorkingDialog (Parent    : in Widget;
                                      Name      : in char_array;
                                      Arg_List  : in Xt_Arg_List;
                                      Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateWorkingDialog, "XmCreateWorkingDialog");
   begin
      return
        XmCreateWorkingDialog (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Working_Dialog;


   function Xm_Message_Box_Get_Child (The_Widget : in Xm_Message_Box_Widget;
                                      Child      : in Xm_Dialog_Child_Type)
     return Widget
   is
      function XmMessageBoxGetChild (The_Widget : in Widget;
                                     Child      : in Xm_Dialog_Child_Type)
        return Widget;
      pragma Import (C, XmMessageBoxGetChild, "XmMessageBoxGetChild");
   begin
      Check (The_Widget);

      return XmMessageBoxGetChild (The_Widget, Child);
   end Xm_Message_Box_Get_Child;


end Xm_Message_Box;
