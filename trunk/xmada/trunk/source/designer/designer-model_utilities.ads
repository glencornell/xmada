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
--! <Unit> Designer.Model_Utilities
--! <Purpose>
--!   Пакет содержит разнообразные вспомогательные подпрограммы для упрощения
--! выполнения операций над моделью.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model;

package Designer.Model_Utilities is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Find_Resource_Value
   --!    <Purpose> Производит поиск в указанном списке значения ресурса,
   --! указанного спецификацией ресурса. Возвращает Null_Node если значение
   --! не найдено.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Find_Resource_Value
    (Resources                  : in Model.List_Id;
     The_Resource_Specification : in Model.Node_Id)
       return Model.Node_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Resource_Value_Copy
   --!    <Purpose> Создаёт копию значения ресурса.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Create_Resource_Value_Copy (Node : in Model.Node_Id)
     return Model.Node_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete_Node
   --!    <Purpose> функция удаляет узел из дерева.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Delete_Node (Node : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> New_Name
   --!    <Purpose> Создаёт уникальное имя имеющее указанный префикс и
   --! сгенерированный численный суффикс.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function New_Name (Prefix : in Wide_String) return Model.Name_Id;

end Designer.Model_Utilities;
