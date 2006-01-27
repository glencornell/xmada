------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006
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
--! <Unit> Designer.Driver
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Event_Management;
with Xt.Initializers;
with Xt_Session_Shell;

with Designer.Main_Window;
with Model.Initialization;

procedure Designer.Driver is

   use Xt;
   use Xt.Event_Management;
   use Xt.Initializers;
   use Xt_Session_Shell;

   App_Context : Xt_App_Context;
   App_Shell   : Widget;

begin
   Model.Initialization.Initialize;

   Xt_Set_Language_Proc;
   Xt_Open_Application (App_Shell, App_Context, "XmAdaDesigner",
                        The_Widget_Class => Session_Shell_Widget_Class);
   Designer.Main_Window.Initialize (App_Shell);

   Xt_App_Main_Loop (App_Context);
end Designer.Driver;
