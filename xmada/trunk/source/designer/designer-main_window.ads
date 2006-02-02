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
--! <Unit> Designer.Main_Window
--! <Purpose>
--!   Пакет содержит реализацию главного окна дизайнера.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Exceptions;

with Xt;

with Model;

package Designer.Main_Window is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <Purpose> Обработка выбора пользователем элемента модели -
   --! вызов одноимённых подпрограмм для всех подкомпонентов главного окна.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <Purpose> Обработка добавления элемента модели - вызов одноимённых
   --! подпрограмм всех подкомпонентов главного окна.
   --!   Вызов подпрограммы должен производиться после создания и добавления
   --! соответствующего узла в дерево.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete_Item
   --!    <Purpose> Обработка удаления элемента модели - вызов одноимённых
   --! подпрограмм всех подкомпонентов главного окна.
   --!   Вызов подпрограммы должен производиться до удаления соответствующего
   --! узла из дерева.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Delete_Item (Node : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <Purpose> Обработка обновления свойств модели - вызов одноимённых
   --! подпрограмм всех подкомпонентов главного окна.
   --!   Вызов подпрограммы должен производиться после изменения свойств
   --! соответствующего узла дерева.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Model.Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Put_Line
   --!    <Purpose> Выводит строку текста в окно диагностически сообщений.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Put_Line (Item : in Wide_String);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Put_Exception_In_Callback
   --!    <Purpose> Выводит диагностическое сообщение об обнаружении исключения
   --! в подпрограмме обратного вызова.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Put_Exception_In_Callback
    (Name       : in Wide_String;
     Occurrence : in Ada.Exceptions.Exception_Occurrence);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose> Производит начальную инициализацию внутренних структур
   --! главного окна и создание виджетов.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialize (App_Shell : in Xt.Widget);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <Purpose> Производит освобождение всех использующихся ресурсов и
   --! повторная инициализация внутренних структур.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Reinitialize;

end Designer.Main_Window;
