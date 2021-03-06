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
with Ada.Finalization;

with Xt.Ancillary_Types;

with Model;

package Designer.Properties_Editor is
   Properties_Args   : Xt.Ancillary_Types.Xt_Arg_List (0 .. 4);
   Properties_Parent : Xt.Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Add
   --!    <Purpose> Производит вызов Add для rendition
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Add;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete
   --!    <Purpose> Производит вызов Delete для rendition
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Delete;

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
   --!    <Unit> Set_Properties
   --!    <Purpose> Производит установку новых значений свойств элемента.
   --!   Вызывается визуальным редактором при изменении значений
   --! геометрических свойств элемента.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Properties (Node : in Model.Node_Id);

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
   --! повторную инициализацию внутренних структур.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Reinitialize;

private
   type Alignment_Widgets is record
     L_Widget : Xt.Widget;
     R_Widget : Xt.Widget;
   end record;

   type Alignment_Widget_List is array (Positive range <>)
     of Alignment_Widgets;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Do_Alignment
   --!    <Purpose> функция производит "выравнивание" виджетов в столбце.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Do_Alignment (List : in Alignment_Widget_List);

   type Node_Properties_Editor (Node : Model.Node_Id) is
     abstract new Ada.Finalization.Limited_Controlled with
   record
      Form       : Xt.Widget;  --  Форма, на которой располагаются свойства.
   end record;

   type Node_Properties_Editor_Access is
     access all Node_Properties_Editor'Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Properties_Editor_Access
   --!    <Purpose> Возвращает ссылку на редактор свойств соответствующего
   --! элемента модели.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Get_Properties_Editor_Access (Node : Model.Node_Id)
     return Node_Properties_Editor_Access;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Properties_Editor
   --!    <Purpose> Возвращает Widget редактора свойств соответствующего
   --! элемента модели.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Get_Properties_Editor (Node : Model.Node_Id)
     return Xt.Widget;

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
