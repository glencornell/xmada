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
--! <Unit> Designer.Render_Table_Editor
--! <Purpose>
--!   Пакет содержит реализацию диалога редактирования свойств Render_Table.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model;

with Xt;

package Designer.Render_Table_Editor is

   -------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose> Создает диалог редактирования свойств элементов 
   --! Xm_Render_Table.
   --!    <Exceptions>
   -------------------------------------------------------------------------
   procedure Initialize (Parent : in Xt.Widget);
      
   -------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Open
   --!    <Purpose> Открывает диалог редактирования свойств Render_Table.
   --!    <Exceptions>
   -------------------------------------------------------------------------
   procedure Open (Resource : in Model.Node_Id);

end Designer.Render_Table_Editor;
