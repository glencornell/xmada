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
--! <Unit> Xm.Print_Management
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xm.Implementation;

package body Xm.Print_Management is

   use Interfaces.C;
   use Xlib;
   use Xlib.Extensions.Print;
   use Xm.Implementation;
   use Xt;
   use Xt.Ancillary_Types;

   function Xm_Print_Setup (Video_Widget     : in Widget;
                            Print_Screen     : in Screen;
                            Print_Shell_Name : in String;
                            Arg_List         : in Xt_Arg_List
                              := Null_Xt_Arg_List)
     return Widget
   is
      function XmPrintSetup (Video_Widget     : in Widget;
                             Print_Screen     : in Screen;
                             Print_Shell_Name : in char_array;
                             Arg_List         : in Xt_Arg_List;
                             Num_Args         : in Cardinal)
        return Widget;
      pragma Import (C, XmPrintSetup, "XmPrintSetup");
   begin
      Check (Video_Widget);
      Check (Print_Screen);

      return XmPrintSetup (Video_Widget,
                           Print_Screen,
                           To_C (Print_Shell_Name),
                           Arg_List,
                           Arg_List'Length);
   end Xm_Print_Setup;


   function Xm_Print_To_File
    (The_Display : in Display;
     File_Name   : in String;
     Finish_Proc : in Xp_Finish_Proc := null;
     Client_Data : in Xt_Pointer     := Null_Xt_Pointer)
       return Boolean
   is
      function XmPrintToFile (The_Display : in Display;
                              File_Name   : in char_array;
                              Finish_Proc : in Xp_Finish_Proc;
                              Client_Data : in Xt_Pointer)
        return Xt_Enum;
      pragma Import (C, XmPrintToFile, "XmPrintToFile");
   begin
      return To_Boolean (Xt_Boolean (XmPrintToFile (The_Display,
                                                    To_C (File_Name),
                                                    Finish_Proc,
                                                    Client_Data)));
   end Xm_Print_To_File;


   procedure Xm_Redisplay_Widget (The_Widget : in Widget) is
      procedure XmRedisplayWidget (The_Widget : in Widget);
      pragma Import (C, XmRedisplayWidget, "XmRedisplayWidget");
   begin
      Check (The_Widget);

      XmRedisplayWidget (The_Widget);
   end Xm_Redisplay_Widget;


end Xm.Print_Management;
