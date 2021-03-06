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
   Project_Extention    : constant String := ".xad";
   Default_Project_Name : constant String := "untitled";
   -- Расширение файлов по умолчанию.
   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_App_Shell
   --!    <Purpose> Возвращает значение App_Shell.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Get_App_Shell return Xt.Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Child_Save_As_Dialog
   --!    <Purpose> Вызов диалога сохранения проекта.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Child_Save_As_Dialog;

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
   --!    <Unit> Warning_On_Exit_XmMessageBox_Dialog
   --!    <Purpose> Выводит диалог подтверждения сохранения проекта при выходе.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Warning_On_Exit_XmMessageBox_Dialog;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Warning_On_New_Project_XmMessageBox_Dialog
   --!    <Purpose> Выводит диалог подтверждения сохранения проекта.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Warning_On_New_Project_XmMessageBox_Dialog;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Warning_On_Open_Project_XmMessageBox_Dialog
   --!    <Purpose> Выводит диалог подтверждения сохранения проекта.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Warning_On_Open_Project_XmMessageBox_Dialog;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Put_Line
   --!    <Purpose> Выводит строку текста в окно диагностически сообщений.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Put_Line (Item : in String);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Put_Exception_In_Callback
   --!    <Purpose> Выводит диагностическое сообщение об обнаружении исключения
   --! в подпрограмме обратного вызова.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Put_Exception_In_Callback
    (Name       : in String;
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
   --!    <Unit> XmAdaDesigner_title
   --!    <Purpose> Выводит заголовок главного окна дизайнера.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure XmAdaDesigner_title (File_Name : in String);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <Purpose> Производит освобождение всех использующихся ресурсов и
   --! повторная инициализация внутренних структур.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Reinitialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Show_Renditions_Menu
   --!    <Purpose> Производит отображение подменю Renditions.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Show_Rendition_Menu;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Hide_Renditions_Menu
   --!    <Purpose> Производит скрытие подменю Renditions.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Hide_Rendition_Menu;

private

   --  Интерфейс для подключения внешней подпрограммы выделения из исключения
   --  информации о стеке обратного вызова и преобразования этой информации
   --  в символьный вид. Переопределяется на этапе предисполнения тела пакета
   --  Designer.Main_Window.Traceback, если последний был включён в программу
   --  при сборке.

   type Symbolic_Traceback is
     access function (X : in Ada.Exceptions.Exception_Occurrence)
       return String;

   Symbolic_Traceback_Hook : Symbolic_Traceback := null;

end Designer.Main_Window;
