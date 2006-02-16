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
--! <Unit> Designer.Properties_Editor.Widget_Instance
--! <Purpose>
--!   Пакет содержит реализацию редактора свойств экземпляра виджета.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt;

with Model;

private package Designer.Properties_Editor.Widget_Instance is

   type Widget_Instance_Properties_Editor is
     new Node_Properties_Editor with private;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create
   --!    <Purpose> Создает реализацию редактора свойств.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Create (Parent   : in Xt.Widget;
                    Arg_List : in Xt.Ancillary_Types.Xt_Arg_List;
                    Node     : in Model.Node_Id)
     return Node_Properties_Editor_Access;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <Purpose> Обработка добавления нового элемента.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <Purpose> Производит освобождение всех использующихся ресурсов и
   --! повторную инициализацию внутренних структур.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Reinitialize;

private

   type Widget_Instance_Properties_Editor is
     new Node_Properties_Editor with
   record
      Name       : Xt.Widget;  --  Имя виджета.
      Is_Managed : Xt.Widget;  --  Признак взятия на управление после создания.
      Form       : Xt.Widget;  --  Форма, на которой располагаются свойства.
   end record;

   type Widget_Instance_Properties_Editor_Access is
     access all Widget_Instance_Properties_Editor'Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Show
   --!    <Purpose> Отображает страницы редактора свойств экземпляра виджета.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Show (Object : access Widget_Instance_Properties_Editor);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Hide
   --!    <Purpose> Скрывает страницы редактора свойств экземпляра виджета.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Hide (Object : access Widget_Instance_Properties_Editor);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <Purpose> Производит перерисовку злементов редактора свойств.
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
   --!    <Unit> Finalize
   --!    <Purpose> Уничтожение экземпляра редактора свойств.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Finalize (Object : in out Widget_Instance_Properties_Editor);

end Designer.Properties_Editor.Widget_Instance;
