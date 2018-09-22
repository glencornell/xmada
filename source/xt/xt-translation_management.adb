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
--! <Unit> Xt.Translation_Management
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Implementation;

package body Xt.Translation_Management is

   use Interfaces.C;
   use Xt.Implementation;

   --  !!! оригинальная реализация делает ещё не ясно что !!!
   procedure Xt_App_Add_Actions (App_Context : in Xt_App_Context;
                                 Actions     : in Xt_Action_List)
   is
      procedure XtAppAddActions (App_Context : in Xt_App_Context;
                                 Actions     : in Xt_Action_List;
                                 Num_Actions : in Cardinal);
      pragma Import (C, XtAppAddActions, "XtAppAddActions");
   begin
      Check (App_Context);
      XtAppAddActions (App_Context, Actions, Actions'Length);
   end Xt_App_Add_Actions;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Override_Translations
   --!    <ImplementationNotes> Проверка параметра Translations производится
   --! Xt.
   ---------------------------------------------------------------------------
   procedure Xt_Override_Translations (The_Widget   : in Widget;
                                       Translations : in Xt_Translations)
   is
      procedure XtOverrideTranslations (The_Widget   : in Widget;
                                        Translations : in Xt_Translations);
      pragma Import (C, XtOverrideTranslations, "XtOverrideTranslations");
   begin
      Check (The_Widget);
      XtOverrideTranslations (The_Widget, Translations);
   end Xt_Override_Translations;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Parse_Translation_Table
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xt_Parse_Translation_Table (Source : in String)
     return Xt_Translations
   is
      C_Source : constant char_array := To_C (Source);

      function XtParseTranslationTable (Source : in char_array)
        return Xt_Translations;
      pragma Import (C, XtParseTranslationTable, "XtParseTranslationTable");
   begin
      return XtParseTranslationTable (C_Source);
   end Xt_Parse_Translation_Table;


end Xt.Translation_Management;
