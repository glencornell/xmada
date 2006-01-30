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
--! <Unit> Designer.Properties_Editor
--! <Purpose>
--!   Пакет содержит реализацию редактора свойств.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Ancillary_Types;

with Model;

package Designer.Properties_Editor is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <Purpose> Обработка выбора пользователем элемента модели -
   --! отображение страниц редактора свойст элемента.
   --!   Если выбранный элемент ранее не выбирался, то производится создание
   --! его редактора свойств.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <Purpose> Обработка добавления нового элемента.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete_Item
   --!    <Purpose> Обработка удаления элемента.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Delete_Item (Node : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <Purpose> Обработка изменения свойств элемента.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose> Производит начальную инициализацию внутренних структур
   --! и создание виджетов.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialize (Parent   : in Xt.Widget;
                         Arg_List : in Xt.Ancillary_Types.Xt_Arg_List);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <Purpose> Производит освобождение всех использующихся ресурсов и
   --! повторная инициализация внутренних структур.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Reinitialize;

private

   type Node_Properties_Editor (Node : Model.Node_Id) is
     abstract tagged limited null record;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Show
   --!    <Purpose> Отображает страницы редактора свойств соответствующего
   --! элемента модели.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Show (Object : access Node_Properties_Editor) is abstract;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Hide
   --!    <Purpose> Скрывает страницы редактора свойств соответствующего
   --! элемента модели.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Hide (Object : access Node_Properties_Editor) is abstract;

end Designer.Properties_Editor;
