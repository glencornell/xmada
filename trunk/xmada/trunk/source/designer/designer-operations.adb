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
   --!    <Unit> Notify_Designer_Components
   --!    <Purpose> Извещение компонент дизайнера о добавлении нового проекта
   --! и его составляющих.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Notify_Designer_Components (Project : in Node_Id);

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
      Widget      : Node_Id;
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

      --  XXX  Временно с целью отладки - до завершения работ по чтению из XML.

      Widget := Create_Widget_Instance;
      Set_Name (Widget, Enter ("Form1"));
      Set_Class (Widget, Model.Xt_Motif.Xt_Motif_Form_Widget_Class);

      Set_Root (Component, Widget);

      --  XXX  Временно с целью отладки - до завершения работ по чтению из XML.

      Notify_Designer_Components (Project);
   end New_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Notify_Designer_Components
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Notify_Designer_Components (Project : in Node_Id) is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Process_Application
      --!    <Purpose> Производит извещение компонентов дизайнера о добавлении
      --! в модель приложения и его составляющих.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Process_Application (Node : in Node_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Process_Component_Class
      --!    <Purpose> Производит извещение компонентов дизайнера о добавлении
      --! в модель класса компонента и его составляющих.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Process_Component_Class (Node : in Node_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Process_Widget_Instance
      --!    <Purpose> Производит извещение компонентов дизайнера о добавлении
      --! в модель экземпляра виджета и его составляющих.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Process_Widget_Instance (Node : in Node_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Process_Application
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Process_Application (Node : in Node_Id) is
      begin
         Designer.Main_Window.Insert_Item (Node);

         if Component_Classes (Node) /= Null_List then
            declare
               Aux : Node_Id := First (Component_Classes (Node));

            begin
               while Aux /= Null_Node loop
                  Process_Component_Class (Aux);
                  Aux := Next (Aux);
               end loop;
            end;
         end if;
      end Process_Application;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Process_Component_Class
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Process_Component_Class (Node : in Node_Id) is
      begin
         Designer.Main_Window.Insert_Item (Node);

         if Root (Node) /= Null_Node then
            Process_Widget_Instance (Root (Node));
         end if;
      end Process_Component_Class;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Process_Widget_Instance
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Process_Widget_Instance (Node : in Node_Id) is
      begin
         Designer.Main_Window.Insert_Item (Node);

         if Children (Node) /= Null_List then
            declare
               Aux : Node_Id := First (Children (Node));

            begin
               while Aux /= Null_Node loop
                  Process_Widget_Instance (Aux);
                  Aux := Next (Aux);
               end loop;
            end;
         end if;
      end Process_Widget_Instance;

   begin
      --  Извещение компонентов дизайнера о создании нового проекта.

      Designer.Main_Window.Insert_Item (Project);

      --  Извещение компонентов дизайнера о создании нового приложения.

      if Applications (Project) /= Null_List then
         declare
            Aux : Node_Id := First (Applications (Project));

         begin
            while Aux /= Null_Node loop
               Process_Application (Aux);
               Aux := Next (Aux);
            end loop;
         end;
      end if;
   end Notify_Designer_Components;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Open_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Open_Project (File_Name : in Wide_String) is
   begin
      Initialize;
      Project := Model.Tools.XML_To_Project (File_Name);

      Notify_Designer_Components (Project);
   end Open_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Save_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Save_Project (File_Name : in Wide_String) is
   begin
      Model.Tools.Project_To_XML (Project, File_Name);
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
