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
--! <Unit> Designer.Operations
--! <Purpose>
--!   Пакет содержит реализацию основных операций, выполняемых дизайнером.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model;

package Designer.Operations is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> New_Project
   --!    <Purpose> Производит переинициализацию внутренних структур данных
   --! и создание нового проекта.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure New_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Open_Project
   --!    <Purpose> Производит переинициализацию внутренних структур и загрузку
   --! проекта из указанного файла.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Open_Project (File_Name : in Wide_String);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Save_Project
   --!    <Purpose> Производит сохранение проекта в указанном файле.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Save_Project (File_Name : in Wide_String);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Save_Project
   --!    <Purpose> Производит сохранение проекта в текущем файле.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Save_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Generate_Application_Resource_Files
   --!    <Purpose> Производит генерацию файлов ресурсов приложений проекта.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Generate_Application_Resource_Files;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Generate_Component_Classes_Code
   --!    <Purpose> Производит генерацию кода классов компонентов приложений
   --! проекта.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Generate_Component_Classes_Code;

private

   --  Переменные в приватной части фактически должны находиться в теле пакета,
   --  но вынесены сюда для обеспечения возможности доступа к ним со стороны
   --  дочерних пакетов (в частности, пакетов отладки).

   Project : Model.Node_Id := Model.Null_Node;
   --  Узел дерева модели текущего редактируемого проекта.

end Designer.Operations;
