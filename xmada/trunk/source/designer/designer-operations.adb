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

   procedure Init_XML_Tools;

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
   procedure New_Project is
      Application : Node_Id;
      Component   : Node_Id;
      List        : List_Id;

   begin
      --  Освобождение всех используемых внутренних структур компонентов
      --  дизайнера и их повторная инициализация.

      Designer.Main_Window.Reinitialize;

      --  Повторное построение базовых элементов модели и аннотирование их
      --  дополнительной информацией для дизайнера.

      Model.Initialization.Initialize;
      Model.Initialization.Designer.Initialize;

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
      use XML_Tools;

      Root : constant Element_Id := 1;
      L    : List_Id;
      A    : Attribute_Id;
      E    : Element_Id;

      Application : Node_Id;

   begin
      Init_XML_Tools;

      Parser.Parse (Ada.Characters.Handling.To_String (File_Name));

      --  Создание узла представления проекта и установка необходимых
      --  атрибутов узла.

      if Elements.Name (Root) /= Project_Tag then
         raise Program_Error;
      end if;

      Project := Create_Project;

      A := Elements.Attribute (Root);

      while A /= Null_Attribute_Id loop
         if Attributes.Name (A) = Name_Attr then
            Set_Name (Project,
                      Enter (XML_Tools.Strings.Image (Attributes.Value (A))));

         elsif Attributes.Name (A) = File_Name_Attr then
            Set_File_Name
             (Project,
              Enter (XML_Tools.Strings.Image (Attributes.Value (A))));

         else
            raise Program_Error;

         end if;

         A := Attributes.Next (A);
      end loop;

--    L := New_List;
--    Append (L, Xt_Motif_Widget_Set);
--    Set_Imported_Widget_Sets (Project, L);

      Designer.Main_Window.Insert_Item (Project);
      --  Извещение компонентов дизайнера о создании нового проекта.

      --  Создание списка приложений.

      L := New_List;
      Set_Applications (Project, L);

      E := Elements.Child (Root);

      while E /= Null_Element_Id loop
         if Elements.Name (E) = Application_Tag then
            --  Создание узла приложения и добавление его в состав проекта.

            Application := Create_Application;
            Append (L, Application);

            A := Elements.Attribute (E);

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

            Designer.Main_Window.Insert_Item (Application);
            --  Извещение компонентов дизайнера о создании нового приложения.

            declare
               L : List_Id := New_List;
               E2 : Element_Id := Elements.Child (E);

               Component : Node_Id;

            begin
               --  Создание списка компонентов приложения.

               Set_Component_Classes (Application, L);


               while E2 /= Null_Element_Id loop
                  if Elements.Name (E2) = Component_Class_Tag then
                     --  Создание узла компонента и добавление
                     --  его в состав приложения.

                     Component := Create_Component_Class;
                     Append (L, Component);

                     A := Elements.Attribute (E2);

                     while A /= Null_Attribute_Id loop
                        if Attributes.Name (A) = Name_Attr then
                           Set_Name
                            (Component,
                             Enter (XML_Tools.Strings.Image
                                     (Attributes.Value (A))));

                        else
                           raise Program_Error;
                        end if;

                        A := Attributes.Next (A);
                     end loop;

                     Designer.Main_Window.Insert_Item (Component);
                     --  Извещение компонентов дизайнера
                     --  о создании нового компонента.

                     Designer.Main_Window.Select_Item (Component);
                     --  Извещение компонентов дизайнера
                     --  о выборе нового компонента.

                  else
                     raise Program_Error;
                  end if;

                  E2 := Elements.Next (E2);
               end loop;
            end;

         else
            raise Program_Error;
         end if;

         E := Elements.Next (E);
      end loop;
   end Open_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Save_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Save_Project (File_Name : in Wide_String) is
      use XML_Tools;

      Root        : Element_Id;
      Application : Node_Id;

   begin
      Set_File_Name (Project, Enter (File_Name));
      --  Запоминаем имя файла проекта.

      Init_XML_Tools;

      --  Создаем Project.

      Root := Elements.Create_Tag (0, Project_Tag);

      Attributes.Create_Attribute
       (Root,
        Name_Attr,
        Strings.Store (Model.Names.Image (Name (Project))));

      Attributes.Create_Attribute
       (Root,
        File_Name_Attr,
        Strings.Store (Model.Names.Image (Model.Tree.File_Name (Project))));

      --  Создаем Applications.

      Application := First (Applications (Project));

      while Application /= Null_Node loop
         declare
            App : constant Element_Id
              := Elements.Create_Tag (Root, Application_Tag);

            Component : Node_Id;

         begin
            Attributes.Create_Attribute
             (App,
              Class_Name_Attr,
              Strings.Store
               (Model.Names.Image (Application_Class_Name (Application))));

            --  Создаем Component_Classes.

            Component := First (Component_Classes (Application));

            while Component /= Null_Node loop
               declare
                  E : constant Element_Id
                    := Elements.Create_Tag (App, Component_Class_Tag);

               begin
                  Attributes.Create_Attribute
                   (E,
                    Name_Attr,
                    Strings.Store
                     (Model.Names.Image (Name (Component))));

                  --  Создаем Widget_Instance.
                  --  XXX

               end;

               Component := Next (Component);
            end loop;

            Application := Next (Application);
         end;
      end loop;

      --  Создаем Imported_Widget_Sets.
      --  XXX

      Printer.Print
       (Ada.Characters.Handling.To_String
         (Model.Names.Image (Model.Tree.File_Name (Project))));
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
