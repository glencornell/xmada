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
--! <Unit> Model.Tools
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Characters.Handling;
with Ada.Wide_Text_IO;

with XML_Tools.Attributes;
with XML_Tools.Elements;
with XML_Tools.Implementation;
with XML_Tools.Names;
with XML_Tools.Parser;
with XML_Tools.Printer;
with XML_Tools.Strings;

with Model.Names;
with Model.Tree.Constructors;
with Model.Tree.Lists;

with Model.Xt_Motif;

package body Model.Tools is

   use Model;
   use Model.Names;
   use Model.Tree;
   use Model.Tree.Constructors;
   use Model.Tree.Lists;

   Application_Tag     : XML_Tools.Name_Id;
   Component_Class_Tag : XML_Tools.Name_Id;
   Project_Tag         : XML_Tools.Name_Id;
   Widget_Instance_Tag : XML_Tools.Name_Id;
   Class_Name_Attr     : XML_Tools.Name_Id;
   Is_Managed_Attr     : XML_Tools.Name_Id;
   Name_Attr           : XML_Tools.Name_Id;
   No_Value            : XML_Tools.String_Id;
   Yes_Value           : XML_Tools.String_Id;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Error_Message
   --!    <Purpose> Выводит сообщение в Standard_Error.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Error_Message (Message : in Wide_String);

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
   --!    <Unit> Project_To_XML
   --!    <Purpose> Преобразовывает структуру дерева узлов проекта
   --! в XML-структуру.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Project_To_XML (Project : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> XML_To_Project
   --!    <Purpose> Преобразовывает XML-структуру в дерево узлов проекта.
   --! Возвращает Node_Id нового проекта.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function XML_To_Project return Node_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Error_Message
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Error_Message (Message : in Wide_String) is
   begin
      Ada.Wide_Text_IO.Put_Line (Ada.Wide_Text_IO.Standard_Error,
                                 "*** ERROR: " & Message);
   end Error_Message;

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
      Is_Managed_Attr     := XML_Tools.Names.Store ("ismanaged");
      Name_Attr           := XML_Tools.Names.Store ("name");

      No_Value            := XML_Tools.Strings.Store ("no");
      Yes_Value           := XML_Tools.Strings.Store ("yes");
   end Init_XML_Tools;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Project_To_XML
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Project_To_XML (Project : in Node_Id) is
      use XML_Tools;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Application_To_XML
      --!    <Purpose> Преобразует узел Node_Application в
      --! XML-структуру и присоединяет созданный тег к тегу Parent.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Application_To_XML (Application : in Node_Id;
                                    Parent      : in Element_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Component_Class_To_XML
      --!    <Purpose> Преобразует узел Node_Component_Class в
      --! XML-структуру и присоединяет созданный тег к тегу Parent.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Component_Class_To_XML (Component_Class : in Node_Id;
                                        Parent          : in Element_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Widget_Instance_To_XML
      --!    <Purpose> Преобразует узел Node_Widget_Instance в
      --! XML-структуру и присоединяет созданный тег к тегу Parent.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Widget_Instance_To_XML (Widget_Instance : in Node_Id;
                                        Parent          : in Element_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Application_To_XML
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Application_To_XML (Application : in Node_Id;
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
            Component_Class_To_XML (Component_Class, Tag);
            Component_Class := Next (Component_Class);
         end loop;

      end Application_To_XML;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Component_Class_To_XML
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Component_Class_To_XML (Component_Class : in Node_Id;
                                        Parent          : in Element_Id)
      is
         Tag : constant Element_Id
           := Elements.Create_Tag (Parent, Component_Class_Tag);

      begin
         Attributes.Create_Attribute
          (Tag,
           Name_Attr,
           Strings.Store (Model.Names.Image (Name (Component_Class))));

         --  Создаем Widget_Instance.

         declare
            Widget_Instance : constant Node_Id := Root (Component_Class);

         begin
            if Widget_Instance /= Null_Node then
               Widget_Instance_To_XML (Widget_Instance, Tag);
            end if;
         end;
      end Component_Class_To_XML;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Widget_Instance_To_XML
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Widget_Instance_To_XML (Widget_Instance : in Node_Id;
                                        Parent          : in Element_Id)
      is
         Tag : constant Element_Id
           := Elements.Create_Tag (Parent, Widget_Instance_Tag);

      begin
         Attributes.Create_Attribute
          (Tag,
           Name_Attr,
           Strings.Store (Model.Names.Image (Name (Widget_Instance))));

         Attributes.Create_Attribute
          (Tag,
           Class_Name_Attr,
           Strings.Store (Model.Names.Image (Name (Class (Widget_Instance)))));

         if Is_Managed (Widget_Instance) then
            Attributes.Create_Attribute (Tag, Is_Managed_Attr, Yes_Value);

         else
            Attributes.Create_Attribute (Tag, Is_Managed_Attr, No_Value);
         end if;

         --  Создаем дочерние виджеты.

         if Children (Widget_Instance) /= Null_List then
            declare
               Child : Node_Id := First (Children (Widget_Instance));

            begin
               while Child /= Null_Node loop
                  Widget_Instance_To_XML (Child, Tag);

                  Child := Next (Child);
               end loop;
            end;
         end if;

      end Widget_Instance_To_XML;

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
         Application_To_XML (Application, Root);
         Application := Next (Application);
      end loop;

      --  Создаем Imported_Widget_Sets.
      --  XXX

   end Project_To_XML;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Project_To_XML
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Project_To_XML (Project   : in Node_Id;
                             File_Name : in Wide_String)
   is
   begin
      Set_File_Name (Project, Enter (File_Name));
      Model.Tools.Project_To_XML (Project);
      XML_Tools.Printer.Print (Ada.Characters.Handling.To_String (File_Name));
   end Project_To_XML;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> XML_To_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function XML_To_Project return Node_Id is

      use XML_Tools;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> XML_To_Application
      --!    <Purpose> Преобразует XML-структуру в узел Node_Application.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure XML_To_Application (Tag         : in Element_Id;
                                    Application : in Node_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> XML_To_Component_Class
      --!    <Purpose> Преобразует XML-структуру в узел Node_Component_Class.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure XML_To_Component_Class (Tag             : in Element_Id;
                                        Component_Class : in Node_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> XML_To_Widget_Instance
      --!    <Purpose> Преобразует XML-структуру в узел Node_Widget_Instance.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure XML_To_Widget_Instance (Tag             : in Element_Id;
                                        Widget_Instance : in Node_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> XML_To_Application
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure XML_To_Application (Tag         : in Element_Id;
                                    Application : in Node_Id)
      is
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
                  Error_Message ("Unknown attribute name: "
                    & XML_Tools.Names.Image (Attributes.Name (A)));
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
                  declare
                     Component_Class : constant Node_Id
                       := Create_Component_Class;

                  begin
                     Append (Components, Component_Class);
                     XML_To_Component_Class (Child, Component_Class);
                  end;

               else
                  Error_Message ("Unknown element name: "
                    & XML_Tools.Names.Image (Elements.Name (Child)));
                  raise Program_Error;
               end if;

               Child := Elements.Next (Child);
            end loop;
         end;
      end XML_To_Application;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> XML_To_Component_Class
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure XML_To_Component_Class (Tag             : in Element_Id;
                                        Component_Class : in Node_Id)
      is
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
                  Error_Message ("Unknown attribute name: "
                    & XML_Tools.Names.Image (Attributes.Name (A)));
                  raise Program_Error;
               end if;

               A := Attributes.Next (A);
            end loop;
         end;

         --  Обработка дочерних тегов тега Component_Class.

         declare
            Child : Element_Id := Elements.Child (Tag);

         begin
            while Child /= Null_Element_Id loop
               if Elements.Name (Child) = Widget_Instance_Tag then
                  declare
                     Widget_Instance : constant Node_Id
                       := Create_Widget_Instance;

                  begin
                     Set_Root (Component_Class, Widget_Instance);
                     XML_To_Widget_Instance (Child, Widget_Instance);
                  end;

               else
                  Error_Message ("Unknown element name: "
                    & XML_Tools.Names.Image (Elements.Name (Child)));
                  raise Program_Error;
               end if;

               Child := Elements.Next (Child);
            end loop;
         end;
      end XML_To_Component_Class;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> XML_To_Widget_Instance
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure XML_To_Widget_Instance (Tag             : in Element_Id;
                                        Widget_Instance : in Node_Id)
      is
         function Find (Name : in XML_Tools.String_Id) return Node_Id;
         function Get_Project_By_Node (N : in Node_Id) return Node_Id;

         function Find (Name : in XML_Tools.String_Id) return Model.Node_Id is
            Classname  : constant Model.Name_Id
              := Model.Names.Enter (XML_Tools.Strings.Image (Name));
            Project  : constant Node_Id
              := Get_Project_By_Node (Widget_Instance);
            Widget_Set : Node_Id
              := First (Imported_Widget_Sets (Project));

            Widget_Class : Node_Id := Null_Node;

         begin
            while Widget_Set /= Null_Node loop
               Widget_Class := First (Widget_Classes (Widget_Set));

               while Widget_Class /= Null_Node loop
                  exit when Model.Tree.Name (Widget_Class) = Classname;

                  Widget_Class := Next (Widget_Class);
               end loop;

               exit when Widget_Class /= Null_Node;

               Widget_Set := Next (Widget_Set);
            end loop;

            return Widget_Class;
         end Find;

         function Get_Project_By_Node (N : in Node_Id) return Node_Id is
            Res : Node_Id := N;

         begin
            while Node_Kind (Res) /= Node_Project loop
               Res := Parent_Node (Res);
            end loop;

            return Res;
         end Get_Project_By_Node;

      begin
         --  Обработка атрибутов тега Widget_Instance.

         declare
            A : Attribute_Id := Elements.Attribute (Tag);

         begin
            while A /= Null_Attribute_Id loop
               if Attributes.Name (A) = Name_Attr then
                  Set_Name (Widget_Instance,
                            Enter (XML_Tools.Strings.Image
                                    (Attributes.Value (A))));

               elsif Attributes.Name (A) = Class_Name_Attr then
                  Set_Class (Widget_Instance, Find (Attributes.Value (A)));

               elsif Attributes.Name (A) = Is_Managed_Attr then
                  if Attributes.Value (A) = No_Value then
                     Set_Is_Managed (Widget_Instance, False);

                  elsif Attributes.Value (A) = Yes_Value then
                     Set_Is_Managed (Widget_Instance, True);

                  else
                     Error_Message ("Invalid value of the "
                       & "'ismanaged' attribute: "
                       & XML_Tools.Strings.Image (Attributes.Value (A)));
                     raise Program_Error;
                  end if;

               else
                  Error_Message ("Unknown attribute name: "
                    & XML_Tools.Names.Image (Attributes.Name (A)));
                  raise Program_Error;
               end if;

               A := Attributes.Next (A);
            end loop;
         end;

         --  Обработка дочерних тегов тега Widget_Instance.

         declare
            Child    : Element_Id := Elements.Child (Tag);
            Children : constant List_Id := New_List;

         begin
            Set_Children (Widget_Instance, Children);

            while Child /= Null_Element_Id loop
               if Elements.Name (Child) = Widget_Instance_Tag then
                  declare
                     Widget_Instance : constant Node_Id
                       := Create_Widget_Instance;

                  begin
                     Append (Children, Widget_Instance);
                     XML_To_Widget_Instance (Child, Widget_Instance);
                  end;

               else
                  Error_Message ("Unknown element name: "
                    & XML_Tools.Names.Image (Elements.Name (Child)));
                  raise Program_Error;
               end if;

               Child := Elements.Next (Child);
            end loop;
         end;
      end XML_To_Widget_Instance;

      Project              : constant Node_Id := Create_Project;
      Applications         : constant List_Id := New_List;
      Imported_Widget_Sets : constant List_Id := New_List;

      Root : constant Element_Id := 1;

   begin
      Set_Applications (Project, Applications);
      Set_Imported_Widget_Sets (Project, Imported_Widget_Sets);

      Append (Imported_Widget_Sets, Model.Xt_Motif.Xt_Motif_Widget_Set);


      if Elements.Name (Root) /= Project_Tag then
         Error_Message ("The root tag must be <Project> instead "
           & XML_Tools.Names.Image (Elements.Name (Root)));
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
               Error_Message ("Unknown attribute name: "
                 & XML_Tools.Names.Image (Attributes.Name (A)));
               raise Program_Error;
            end if;

            A := Attributes.Next (A);
         end loop;
      end;

      --  Обработка вложенных тегов тега Project.

      declare
         Child : Element_Id := Elements.Child (Root);

      begin
         while Child /= Null_Element_Id loop
            if Elements.Name (Child) = Application_Tag then
               declare
                  Application : constant Node_Id := Create_Application;

               begin
                  Append (Applications, Application);
                  XML_To_Application (Child, Application);
               end;

            else
               Error_Message ("Unknown element name: "
                 & XML_Tools.Names.Image (Elements.Name (Child)));
               raise Program_Error;
            end if;

            Child := Elements.Next (Child);
         end loop;
      end;

      return Project;
   end XML_To_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> XML_To_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function XML_To_Project (File_Name : in Wide_String) return Node_Id is
      Project : Node_Id;

   begin
      Init_XML_Tools;
      XML_Tools.Parser.Parse (Ada.Characters.Handling.To_String (File_Name));
      Project := XML_To_Project;
      Set_File_Name (Project, Enter (File_Name));

      return Project;
   end XML_To_Project;

end Model.Tools;

