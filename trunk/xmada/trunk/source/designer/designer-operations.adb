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
with Ada.Characters.Handling;
with Designer.Main_Window;
with Model.Initialization.Designer;
with Model.Names;
with Model.Tree.Constructors;
with Model.Tree.Lists;
with Model.Xt_Motif;
with XML_Tools.Attributes;
with XML_Tools.Elements;
with XML_Tools.Implementation;
with XML_Tools.Names;
with XML_Tools.Parser;
with XML_Tools.Printer;
with XML_Tools.Strings;

package body Designer.Operations is

   use Model;
   use Model.Names;
   use Model.Tree;
   use Model.Tree.Constructors;
   use Model.Tree.Lists;
   use Model.Xt_Motif;

   Project : Node_Id := Null_Node;
   --  Узел дерева модели текущего редактируемого проекта.

   Application_Tag     : XML_Tools.Name_Id;
   Component_Class_Tag : XML_Tools.Name_Id;
   Project_Tag         : XML_Tools.Name_Id;
   Widget_Instance_Tag : XML_Tools.Name_Id;
   Class_Name_Attr     : XML_Tools.Name_Id;
   File_Name_Attr      : XML_Tools.Name_Id;
   Name_Attr           : XML_Tools.Name_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Init_XML_Tools
   --!    <Purpose> Инициализирует модули пакета XML_Tools
   --! и создает таблицу имен используемых тегов и атрибутов.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Init_XML_Tools;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose> Инициализирует проект.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Project_To_Xml
   --!    <Purpose> Преобразовывает структуру дерева узлов проекта
   --! в XML-структуру.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Project_To_Xml (Project : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xml_To_Project
   --!    <Purpose> Преобразовывает XML-структуру в дерево узлов проекта.
   --! Возвращает Node_Id нового проекта.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Xml_To_Project return Node_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Init_XML_Tools
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Init_XML_Tools is
   begin
      XML_Tools.Implementation.Initialize;

      Application_Tag     := XML_Tools.Names.Store ("Application");
      Component_Class_Tag := XML_Tools.Names.Store ("ComponentClass");
      Project_Tag         := XML_Tools.Names.Store ("Project");
      Widget_Instance_Tag := XML_Tools.Names.Store ("WidgetInstance");

      Class_Name_Attr     := XML_Tools.Names.Store ("classname");
      File_Name_Attr      := XML_Tools.Names.Store ("filename");
      Name_Attr           := XML_Tools.Names.Store ("name");
   end Init_XML_Tools;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> New_Project
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

      --  Извещение компонентов дизайнера о создании нового проекта.

      Designer.Main_Window.Insert_Item (Project);

      --  Создание узла приложения и добавление его в состав проекта.

      Application := Create_Application;
      Set_Application_Class_Name (Application, Enter ("Application1"));

      List := New_List;
      Append (List, Application);
      Set_Applications (Project, List);

      --  Извещение компонентов дизайнера о создании нового приложения.

      Designer.Main_Window.Insert_Item (Application);

      --  Создание компонента приложения и добавление его в состав приложения.

      Component := Create_Component_Class;
      Set_Name (Component, Enter ("Component1"));

      List := New_List;
      Append (List, Component);
      Set_Component_Classes (Application, List);

      --  Извещение компонентов дизайнера о создании нового компонента.

      Designer.Main_Window.Insert_Item (Component);

      --  Извещение компонентов дизайнера о выборе нового компонента.

      Designer.Main_Window.Select_Item (Component);
   end New_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Open_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Open_Project (File_Name : in Wide_String) is
   begin
      Initialize;
      Init_XML_Tools;
      XML_Tools.Parser.Parse (Ada.Characters.Handling.To_String (File_Name));
      Project := Xml_To_Project;
   end Open_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Project_To_Xml
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Project_To_Xml (Project : in Node_Id) is
      use XML_Tools;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Application_To_Xml
      --!    <Purpose> Преобразует узел Node_Application в
      --! XML-структуру и присоединяет созданный тег к тегу Parent.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Application_To_Xml (Application : in Node_Id;
                                    Parent      : in Element_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Component_Class_To_Xml
      --!    <Purpose> Преобразует узел Node_Component_Class в
      --! XML-структуру и присоединяет созданный тег к тегу Parent.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Component_Class_To_Xml (Component_Class : in Node_Id;
                                        Parent          : in Element_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Application_To_Xml
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Application_To_Xml (Application : in Node_Id;
                                    Parent      : in Element_Id)
      is
         Tag             : constant Element_Id
           := Elements.Create_Tag (Parent, Application_Tag);
         Component_Class : Node_Id;

      begin
         --  Присоединяем атрибуты Application.

         Attributes.Create_Attribute
          (Tag,
           Class_Name_Attr,
           Strings.Store
            (Model.Names.Image (Application_Class_Name (Application))));

         --  Создаем Component_Classes.

         Component_Class := First (Component_Classes (Application));

         while Component_Class /= Null_Node loop
            Component_Class_To_Xml (Component_Class, Tag);
            Component_Class := Next (Component_Class);
         end loop;

      end Application_To_Xml;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Component_Class_To_Xml
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Component_Class_To_Xml (Component_Class : in Node_Id;
                                        Parent          : in Element_Id)
      is
         Tag : constant Element_Id
           := Elements.Create_Tag (Parent, Component_Class_Tag);
      begin
         Attributes.Create_Attribute
          (Tag,
           Name_Attr,
           Strings.Store
            (Model.Names.Image (Name (Component_Class))));

         --  Создаем Widget_Instance.
         --  XXX

      end Component_Class_To_Xml;

      Root        : Element_Id;
      Application : Node_Id;

   begin
      Init_XML_Tools;

      --  Создаем Project.

      Root := Elements.Create_Tag (0, Project_Tag);

      Attributes.Create_Attribute
       (Root,
        Name_Attr,
        Strings.Store (Model.Names.Image (Name (Project))));

      --  Создаем Applications.

      Application := First (Applications (Project));

      while Application /= Null_Node loop
         Application_To_Xml (Application, Root);
         Application := Next (Application);
      end loop;

      --  Создаем Imported_Widget_Sets.
      --  XXX

   end Project_To_Xml;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Save_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Save_Project (File_Name : in Wide_String) is
   begin
      Set_File_Name (Project, Enter (File_Name));
      Project_To_Xml (Project);
      XML_Tools.Printer.Print (Ada.Characters.Handling.To_String (File_Name));
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

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xml_To_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xml_To_Project return Node_Id is
      use XML_Tools;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Xml_To_Application
      --!    <Purpose> Преобразует XML-структуру в узел Node_Application.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      function Xml_To_Application (Tag : in Element_Id) return Node_Id;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Xml_To_Application
      --!    <Purpose> Преобразует XML-структуру в узел Node_Component_Class.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      function Xml_To_Component_Class (Tag : in Element_Id) return Node_Id;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Xml_To_Application
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Xml_To_Application (Tag : in Element_Id) return Node_Id is
         Application : constant Node_Id := Create_Application;
         Components  : constant List_Id := New_List;

      begin
         Set_Component_Classes (Application, Components);

         --  Обработка атрибутов тега Application.

         declare
            A : Attribute_Id := Elements.Attribute (Tag);

         begin
            while A /= Null_Attribute_Id loop
               if Attributes.Name (A) = Class_Name_Attr then
                  Set_Application_Class_Name
                   (Application,
                    Enter (XML_Tools.Strings.Image (Attributes.Value (A))));

               else
                  raise Program_Error;
               end if;

               A := Attributes.Next (A);
            end loop;
         end;

         --  Обработка дочерних тегов тега Application.

         declare
            Child : Element_Id := Elements.Child (Tag);

         begin
            while Child /= Null_Element_Id loop
               if Elements.Name (Child) = Component_Class_Tag then
                  Append (Components, Xml_To_Component_Class (Child));

               else
                  raise Program_Error;
               end if;

               Child := Elements.Next (Child);
            end loop;
         end;

         return Application;
      end Xml_To_Application;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Xml_To_Component_Class
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Xml_To_Component_Class (Tag : in Element_Id) return Node_Id is
         Component_Class : constant Node_Id := Create_Component_Class;

      begin
         --  Обработка атрибутов тега Component_Class.

         declare
            A : Attribute_Id := Elements.Attribute (Tag);

         begin
            while A /= Null_Attribute_Id loop
               if Attributes.Name (A) = Name_Attr then
                  Set_Name (Component_Class,
                            Enter (XML_Tools.Strings.Image
                                    (Attributes.Value (A))));

               else
                  raise Program_Error;
               end if;

               A := Attributes.Next (A);
            end loop;
         end;

         --  XXX Designer.Main_Window.Insert_Item (Component);
         --  Извещение компонентов дизайнера
         --  о создании нового компонента.

         --  XXX Designer.Main_Window.Select_Item (Component);
         --  Извещение компонентов дизайнера
         --  о выборе нового компонента.

         return Component_Class;
      end Xml_To_Component_Class;

      Project              : constant Node_Id := Create_Project;
      Applications         : constant List_Id := New_List;
      Imported_Widget_Sets : constant List_Id := New_List;

      Root : constant Element_Id := 1;

   begin
      Set_Applications (Project, Applications);
      Set_Imported_Widget_Sets (Project, Imported_Widget_Sets);

      if Elements.Name (Root) /= Project_Tag then
         raise Program_Error;
      end if;

      --  Обработка атрибутов тега Project.

      declare
         A : Attribute_Id := Elements.Attribute (Root);

      begin
         while A /= Null_Attribute_Id loop
            if Attributes.Name (A) = Name_Attr then
               Set_Name (Project,
                         Enter (XML_Tools.Strings.Image
                                 (Attributes.Value (A))));

            else
               raise Program_Error;
            end if;

            A := Attributes.Next (A);
         end loop;
      end;

--    Append (Imported_Widget_Sets, Xt_Motif_Widget_Set);

      --  Обработка вложенных тегов тега Project.

      declare
         Child : Element_Id := Elements.Child (Root);

      begin
         while Child /= Null_Element_Id loop
            if Elements.Name (Child) = Application_Tag then
               Append (Applications, Xml_To_Application (Child));

               --  XXX Designer.Main_Window.Insert_Item (Application);
               --  Извещение компонентов дизайнера
               --  о создании нового приложения.

            else
               raise Program_Error;
            end if;

            Child := Elements.Next (Child);
         end loop;
      end;

      Designer.Main_Window.Insert_Item (Project);
      --  Извещение компонентов дизайнера о создании нового проекта.

      return Project;
   end Xml_To_Project;

end Designer.Operations;
