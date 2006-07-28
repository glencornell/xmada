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
--! <Unit> Designer.Visual_Editor
--! <Purpose>
--!   Пакет содержит реализацию визуального редактора.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;

with Xt.Ancillary_Types;

with Model;

package Designer.Visual_Editor is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <Purpose> Обработка выбора пользователем элемента модели -
   --! выделение соответствующего визуального элемента.
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
   --!    <Purpose> Производит установку новых значений свойств узла для
   --! соответствующего визуального элемента. В процессе установки значения
   --! некоторых свойств могут быть переопределены визуальным элементом.
   --! В этом случае производится обновление значений соответствующих
   --! свойств.
   --!   Подпрограмма предназначена для выдачи запросов редактором свойств
   --! экземпляра виджета на изменение значений свойств виджета.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Properties (Node : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Properties
   --!    <Purpose> Производит чтение значений свойств визуального элемента
   --! и обновление значений свойств элемента дерева.
   --!   Подпрограмма предназначена для чтения значений свойств виджета
   --! редактором свойств экземпляра виджета.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Get_Properties (Node : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose> Производит инициализацию внутренних структур и создание
   --! виджетов.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialize (Parent : in Xt.Widget);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <Purpose> Производит освобождение всех использующихся ресурсов и
   --! повторную инициализацию внутренних структур.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Reinitialize;

   --  Тип для описания plugin-а визуального редактора, позволяющего выполнять
   --  дополнительные действия над экземпляром класса виджета.

   type Abstract_Plugin is abstract tagged limited private;

   type Plugin_Access is access all Abstract_Plugin'Class;

   procedure On_Select (Object     : access Abstract_Plugin;
                        Node       : in     Model.Node_Id;
                        The_Widget : in     Xt.Widget;
                        Event      : in     Xt.X_Event)
     is abstract;

   procedure On_Widget_Create (Object     : access Abstract_Plugin;
                               Node       : in     Model.Node_Id;
                               The_Widget : in     Xt.Widget)
     is abstract;

private

   type Abstract_Plugin is abstract tagged limited null record;

   Drawing_Area : Xt.Widget := Xt.Null_Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Make_Set_Arg_List
   --!    <Purpose> Формирует и возвращает список параметров виджета для
   --! последующего использования при создании виджета или установки значения.
   --! Для пустого списка возвращает пустой список параметров виджета.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Make_Set_Arg_List (List             : in Model.List_Id;
                               Set_Initial_Size : in Boolean := False)
     return Xt.Ancillary_Types.Xt_Arg_List;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Corresponding_Value
   --!    <Purpose> Возвращает внутреннее значение перечислимого типа для
   --! указанной спецификации значения перечислимого типа.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Corresponding_Value
    (Enumeration_Resource_Value_Specification : in Model.Node_Id)
       return Interfaces.C.unsigned_char;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Corresponding_Enumeration_Resource_Value_Specification
   --!    <Purpose> Возвращает узел спецификации значения указанного
   --! перечислимого типа для указанного внутреннего значения перечислимого
   --! типа Xt/Motif.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Corresponding_Enumeration_Resource_Value_Specification
    (Enumeration_Resource_Type : in Model.Node_Id;
     Value                     : in Interfaces.C.unsigned_char)
       return Model.Node_Id;

end Designer.Visual_Editor;
