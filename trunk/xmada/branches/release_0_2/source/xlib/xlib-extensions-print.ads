------------------------------------------------------------------------------
--
--  X Library Ada Binding
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
--! <Unit> Xlib.Extensions.Print
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Strings;

package Xlib.Extensions.Print is

   type Xp_Context is private;

   type Xp_Get_Doc_Status is (Finished,
                              Second_Consumer,
                              Error);

   type Xp_Save_Data is (Spool, Get_Data);

   type Xp_Finish_Proc is
     access procedure (The_Display : in Display;
                       The_Context : in Xp_Context;
                       Status      : in Xp_Get_Doc_Status;
                       Client_Data : in X_Pointer);


   type Xp_Hinter_Proc is
     access function return Interfaces.C.Strings.chars_ptr;


   function Xp_Create_Context (The_Display  : in Display;
                               Printer_Name : in String)
     return Xp_Context;

   procedure Xp_Set_Context (The_Display : in Display;
                             The_Context : in Xp_Context);


--  Xp_Get_Context
--  Xp_Destroy_Context


   function Xp_Get_Screen_Of_Context (The_Display : in Display;
                                      The_Context : in Xp_Context)
     return Screen;


--  Xp_Get_Page_Dimensions


   procedure Xp_Start_Job (The_Display : in Display;
                           Save_Data   : in Xp_Save_Data);


   procedure Xp_End_Job (The_Display : in Display);


   procedure Xp_Cancel_Job (The_Display : in Display;
                            Discard     : in Boolean);


--  Xp_Start_Doc
--  Xp_End_Doc
--  Xp_Cancel_Doc


   procedure Xp_Set_Locale_Hinter (Hinter      : in Xp_Hinter_Proc;
                                   Description : in String);


private

   pragma Linker_Options ("-lXp");

   type Xp_Context is new X_Id;


   pragma Convention (C, Xp_Finish_Proc);

   pragma Convention (C, Xp_Get_Doc_Status);
   for Xp_Get_Doc_Status'Size use Interfaces.C.unsigned_char'Size;

   pragma Convention (C, Xp_Hinter_Proc);

   pragma Convention (C, Xp_Save_Data);
   for Xp_Save_Data use (Spool => 1, Get_Data => 2);
   for Xp_Save_Data'Size use Interfaces.C.unsigned_char'Size;

end Xlib.Extensions.Print;
