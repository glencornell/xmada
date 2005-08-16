------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
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
--! <Unit> Xt.Translation_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Xt.Translation_Management is

   type Xt_Translations is private;


   type Xt_Action_Rec is record
      Action_Name : Xt_String;
      Action_Proc : Xt_Action_Proc;
   end record;
   pragma Convention (C, Xt_Action_Rec);

   type Xt_Action_List is array (Natural range <>) of Xt_Action_Rec;


   procedure Xt_App_Add_Actions (App_Context : in Xt_App_Context;
                                 Actions     : in Xt_Action_List);


   function Xt_Parse_Translation_Table (Source : in String)
     return Xt_Translations;


   procedure Xt_Override_Translations (The_Widget   : in Widget;
                                       Translations : in Xt_Translations);


private

   type Xt_Translations_Record is null record;
   pragma Convention (C, Xt_Translations_Record);

   type Xt_Translations is access Xt_Translations_Record;

end Xt.Translation_Management;
