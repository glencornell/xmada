------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006  TechnoServ A/S
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
--! along with XmAda; see the file COPYING. If not, write to the Free
--! Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
--! USA.
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
--! <Unit> Designer.Driver
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Command_Line;
with Ada.Characters.Handling;

with Xt.Event_Management;
with Xt.Initializers;
with Xt_Session_Shell;

with Designer.Operations;
with Designer.Main_Window;

procedure Designer.Driver is

   use Ada.Command_Line;
   use Xt;
   use Xt.Event_Management;
   use Xt.Initializers;
   use Xt_Session_Shell;

   App_Context : Xt_App_Context;
   App_Shell   : Widget;

begin
   Xt_Set_Language_Proc;
   Xt_Open_Application (App_Shell, App_Context, "XmAdaDesigner",
                        The_Widget_Class => Session_Shell_Widget_Class);
   Designer.Main_Window.Initialize (App_Shell);

   --  Если в командной строке указано имя файла проекта, то открываем этот
   --  файл. В противном случае создаём новый проект.

   if Argument_Count = 0 then
      Designer.Operations.New_Project;

   else
      Designer.Operations.Open_Project
       (Ada.Characters.Handling.To_Wide_String (Argument (1)));
   end if;

   Xt_App_Main_Loop (App_Context);

exception
   when others =>
      --  При обнаружении любых необработанных исключений производим попытку
      --  сохранения текущей модели в специальном файле.

      begin
         Designer.Operations.Save_Project ("autosave.xmada");

      exception
         when others =>
            null;
      end;

      raise;
end Designer.Driver;
