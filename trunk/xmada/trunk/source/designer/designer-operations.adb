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
--! <Unit> Designer.Operations
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Designer.Main_Window;
with Model.Initialization.Designer;
with Model.Names;
with Model.Tools;
with Model.Tree.Constructors;
with Model.Tree.Lists;
with Model.Xt_Motif;

package body Designer.Operations is

   use Model;
   use Model.Names;
   use Model.Tree;
   use Model.Tree.Constructors;
   use Model.Tree.Lists;
   use Model.Xt_Motif;

   Project : Node_Id := Null_Node;
   --  Узел дерева модели текущего редактируемого проекта.

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose> Инициализирует проект.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Notify_Main_Window
   --!    <Purpose> Уведомление главного окна о созданных узлах.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Notify_Main_Window (Project : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize is
   begin
      --  Освобождение всех используемых внутренних структур компонентов
      --  дизайнера и их повторная инициализация.

      Designer.Main_Window.Reinitialize;

      --  Повторное построение базовых элементов модели и аннотирование их
      --  дополнительной информацией для дизайнера.

      Model.Initialization.Initialize;
      Model.Initialization.Designer.Initialize;

   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> New_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure New_Project is
      Application : Node_Id;
      Component   : Node_Id;
      List        : List_Id;

   begin
      Initialize;

      --  Создание узла представления проекта и установка необходимых
      --  атрибутов узла.

      Project := Create_Project;
      Set_Name (Project, Enter ("Untitled"));
      Set_File_Name (Project, Enter ("untitled.xad"));

      List := New_List;
      Append (List, Xt_Motif_Widget_Set);
      Set_Imported_Widget_Sets (Project, List);

      --  Создание узла приложения и добавление его в состав проекта.

      Application := Create_Application;
      Set_Application_Class_Name (Application, Enter ("Application1"));

      List := New_List;
      Append (List, Application);
      Set_Applications (Project, List);

      --  Создание компонента приложения и добавление его в состав приложения.

      Component := Create_Component_Class;
      Set_Name (Component, Enter ("Component1"));

      List := New_List;
      Append (List, Component);
      Set_Component_Classes (Application, List);

      Notify_Main_Window (Project);
   end New_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Notify_Main_Window
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Notify_Main_Window (Project : in Node_Id) is
   begin
      --  Извещение компонентов дизайнера о создании нового проекта.

      Designer.Main_Window.Insert_Item (Project);

      --  Извещение компонентов дизайнера о создании нового приложения.

      declare
         Application : Node_Id := First (Applications (Project));

      begin
         while Application /= Null_Node loop
            Designer.Main_Window.Insert_Item (Application);

            --  Извещение компонентов дизайнера о создании
            --  нового класса компонента.

            declare
               Component_Class : Node_Id
                 := First (Component_Classes (Application));

            begin
               while Component_Class /= Null_Node loop
                  Designer.Main_Window.Insert_Item (Component_Class);

                  Component_Class := Next (Component_Class);
               end loop;
            end;

            Application := Next (Application);
         end loop;
      end;

   end Notify_Main_Window;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Open_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Open_Project (File_Name : in Wide_String) is
   begin
      Initialize;
      Project := Model.Tools.Xml_To_Project (File_Name);

      Notify_Main_Window (Project);
   end Open_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Save_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Save_Project (File_Name : in Wide_String) is
   begin
      Model.Tools.Project_To_Xml (Project, File_Name);
   end Save_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Save_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Save_Project is
   begin
      Save_Project (Image (File_Name (Project)));
   end Save_Project;

end Designer.Operations;
