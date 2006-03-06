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
--! <Unit> Mode.Initialization.Designer.Microline
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with XmL_Grid;

with Model.Initialization.Microline;
with Model.Tree.Designer;

package body Model.Initialization.Designer.Microline is

   use XmL_Grid;
   use Model.Initialization.Microline;
   use Model.Tree.Designer;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize is
   begin
--      Set_Convenience_Create_Function
--       (Xt_Motif_Folder_Widget_Class,
--        XmL_Folder.XmL_Create_Folder'Access);
--      Set_Convenience_Create_Function
--       (Xt_Motif_Progress_Widget_Class,
--        XmL_Progress.XmL_Create_Progress'Access);
--      Set_Convenience_Create_Function
--       (Xt_Motif_Tree_Widget_Class,
--        XmL_Tree.XmL_Create_Tree'Access);
      Set_Convenience_Create_Function
       (Xt_Motif_Grid_Widget_Class,
        XmL_Grid.XmL_Create_Grid'Access);
   end Initialize;

begin
   Microline_Initialize_Designer_Hook := Initialize'Access;
end Model.Initialization.Designer.Microline;