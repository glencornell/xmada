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
--! <Unit> Model.Tools
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Characters.Handling;
with Ada.Strings.Unbounded;
with Ada.Text_IO;

with XML_Tools.Attributes;
with XML_Tools.Elements;
with XML_Tools.Implementation;
with XML_Tools.Names;
with XML_Tools.Parser;
with XML_Tools.Printer;
with XML_Tools.Strings;

with Model.Names;
with Model.Strings;
with Model.Tree.Constructors;
with Model.Tree.Lists;
with Model.Tree.Xm_Ada;
with Model.Queries;
with Model.Utilities;

with Model.Xt_Motif;

package body Model.Tools is

   use Model;
   use Model.Names;
   use Model.Tree;
   use Model.Tree.Constructors;
   use Model.Tree.Lists;
   use Model.Utilities;

   Application_Tag         : XML_Tools.Name_Id;
   Component_Class_Tag     : XML_Tools.Name_Id;
   Constraint_Resource_Tag : XML_Tools.Name_Id;
   Project_Tag             : XML_Tools.Name_Id;
   Resource_Tag            : XML_Tools.Name_Id;
   Widget_Instance_Tag     : XML_Tools.Name_Id;

   Class_Name_Attr     : XML_Tools.Name_Id;
   Is_Class_Attr       : XML_Tools.Name_Id;
   Is_Explotable_Attr  : XML_Tools.Name_Id;
   Is_Fallback_Attr    : XML_Tools.Name_Id;
   Is_Hardcoded_Attr   : XML_Tools.Name_Id;
   Is_Managed_Attr     : XML_Tools.Name_Id;
   Name_Attr           : XML_Tools.Name_Id;
   Package_Name_Attr   : XML_Tools.Name_Id;
   Type_Name_Attr      : XML_Tools.Name_Id;
   Value_Attr          : XML_Tools.Name_Id;
   Variable_Name_Attr  : XML_Tools.Name_Id;

   No_Value            : XML_Tools.String_Id;
   Yes_Value           : XML_Tools.String_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Error_Message
   --!    <Purpose> Выводит сообщение в Standard_Error.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Error_Message (Message : in String);

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
   procedure Error_Message (Message : in String) is
   begin
      Ada.Text_IO.Put_Line (Ada.Text_IO.Standard_Error,
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

      Application_Tag         := XML_Tools.Names.Store ("Application");
      Component_Class_Tag     := XML_Tools.Names.Store ("ComponentClass");
      Constraint_Resource_Tag := XML_Tools.Names.Store ("ConstraintResource");
      Project_Tag             := XML_Tools.Names.Store ("Project");
      Resource_Tag            := XML_Tools.Names.Store ("Resource");
      Widget_Instance_Tag     := XML_Tools.Names.Store ("WidgetInstance");

      Class_Name_Attr         := XML_Tools.Names.Store ("classname");
      Is_Class_Attr           := XML_Tools.Names.Store ("isClass");
      Is_Explotable_Attr      := XML_Tools.Names.Store ("isExplotable");
      Is_Fallback_Attr        := XML_Tools.Names.Store ("isFallback");
      Is_Hardcoded_Attr       := XML_Tools.Names.Store ("isHardcoded");
      Is_Managed_Attr         := XML_Tools.Names.Store ("isManaged");
      Name_Attr               := XML_Tools.Names.Store ("name");
      Package_Name_Attr       := XML_Tools.Names.Store ("packageName");
      Type_Name_Attr          := XML_Tools.Names.Store ("typeName");
      Value_Attr              := XML_Tools.Names.Store ("value");
      Variable_Name_Attr      := XML_Tools.Names.Store ("variableName");

      No_Value                := XML_Tools.Strings.Store ("no");
      Yes_Value               := XML_Tools.Strings.Store ("yes");
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
      --!    <Unit> Resource_To_XML
      --!    <Purpose> Преобразует узел Node_XXX_Resource_Value в
      --! XML-структуру и присоединяет созданный тег к тегу Parent.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Resource_To_XML (Resource      : in Node_Id;
                                 Parent        : in Element_Id;
                                 Is_Constraint : in Boolean);
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
           XML_Tools.Strings.Store
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
           XML_Tools.Strings.Store
            (Model.Names.Image (Name (Component_Class))));

         if Xm_Ada.Package_Name (Component_Class) /= Null_String then
            Attributes.Create_Attribute
             (Tag,
              Package_Name_Attr,
              XML_Tools.Strings.Store
               (Model.Strings.Image (Xm_Ada.Package_Name (Component_Class))));
         end if;

         if Xm_Ada.Type_Name (Component_Class) /= Null_String then
            Attributes.Create_Attribute
             (Tag,
              Type_Name_Attr,
              XML_Tools.Strings.Store
               (Model.Strings.Image (Xm_Ada.Type_Name (Component_Class))));
         end if;

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
      --!    <Unit> Resource_To_XML
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Resource_To_XML (Resource      : in Node_Id;
                                 Parent        : in Element_Id;
                                 Is_Constraint : in Boolean)
      is
         function Create_Full_Node_Name (N : in Node_Id) return String;

         function Create_Full_Node_Name (N : in Node_Id) return String is
            Res : Ada.Strings.Unbounded.Unbounded_String;
            Aux : Node_Id := N;

         begin
            loop
               if Aux = Null_Node then
                  raise Program_Error;
               end if;

               exit when Node_Kind (Aux) = Node_Component_Class;

               if Ada.Strings.Unbounded.Length (Res) > 0 then
                  Ada.Strings.Unbounded.Insert (Res, 1, ".");
               end if;

               Ada.Strings.Unbounded.Insert
                (Res,
                 1,
                 Model.Names.Image (Name (Aux)));

               Aux := Model.Tree.Parent_Node (Aux);
            end loop;

            return Ada.Strings.Unbounded.To_String (Res);
         end Create_Full_Node_Name;

         Tag                : Element_Id;
         Specification_Name : constant Name_Id
           := Internal_Resource_Name (Resource_Specification (Resource));

      begin
         --  Error_Message (Node_Kinds'Image (Node_Kind (Resource)));

         if Is_Constraint then
            Tag := Elements.Create_Tag (Parent, Constraint_Resource_Tag);

         else
            Tag := Elements.Create_Tag (Parent, Resource_Tag);
         end if;

         Attributes.Create_Attribute
          (Tag,
           Name_Attr,
           XML_Tools.Strings.Store
            (Model.Names.Image (Specification_Name)));

         if Is_Resource_Class_Value (Resource) then
            Attributes.Create_Attribute (Tag, Is_Class_Attr, Yes_Value);

         else
            Attributes.Create_Attribute (Tag, Is_Class_Attr, No_Value);
         end if;

         if Is_Fallback (Resource) then
            Attributes.Create_Attribute (Tag, Is_Fallback_Attr, Yes_Value);
         end if;

         if Is_Hardcoded (Resource) then
            Attributes.Create_Attribute (Tag, Is_Hardcoded_Attr, Yes_Value);
         end if;

         --  Обработка значения ресурса.

         case Node_Kind (Resource) is
            when Node_Enumeration_Resource_Value =>
               declare
                  N : constant Node_Id := Resource_Value (Resource);

               begin
                  if N /= Null_Node then
                     Attributes.Create_Attribute
                      (Tag,
                       Value_Attr,
                       XML_Tools.Strings.Store
                        (Model.Names.Image (Internal_Name (N))));

                  end if;
               end;

            when Node_Integer_Resource_Value =>
               declare
                  Value : constant Integer := Resource_Value (Resource);
                  Str   : constant String := Integer'Image (Value);

               begin
                  Attributes.Create_Attribute
                   (Tag,
                    Value_Attr,
                    XML_Tools.Strings.Store (Str (Str'First + 1 .. Str'Last)));
               end;

            when Node_String_Resource_Value =>
               declare
                  S : constant String_Id := Resource_Value (Resource);

               begin
                  if S /= Null_String then
                     Elements.Create_String
                      (Tag,
                       XML_Tools.Strings.Store (Model.Strings.Image (S)));
                  end if;
               end;

            when Node_Widget_Reference_Resource_Value =>
               declare
                  N : constant Node_Id := Resource_Value (Resource);

               begin
                  if N /= Null_Node then
                     Attributes.Create_Attribute
                      (Tag,
                       Value_Attr,
                       XML_Tools.Strings.Store (Create_Full_Node_Name (N)));
                  end if;
               end;

            when Node_Xm_String_Resource_Value =>
               declare
                  S : constant String_Id := Resource_Value (Resource);

               begin
                  if S /= Null_String then
                     Elements.Create_String
                      (Tag,
                       XML_Tools.Strings.Store (Model.Strings.Image (S)));
                  end if;
               end;

            when others =>
               Error_Message ("Unhandled resource node kind: "
                 & Node_Kinds'Image (Node_Kind (Resource)));
               raise Program_Error;
         end case;

      end Resource_To_XML;

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
           XML_Tools.Strings.Store
            (Model.Names.Image (Name (Widget_Instance))));

         Attributes.Create_Attribute
          (Tag,
           Class_Name_Attr,
           XML_Tools.Strings.Store
            (Model.Names.Image (Name (Class (Widget_Instance)))));

         if not Xm_Ada.Create_In_Record (Widget_Instance) then
            Attributes.Create_Attribute (Tag, Is_Explotable_Attr, No_Value);
         end if;

         if Is_Managed (Widget_Instance) then
            Attributes.Create_Attribute (Tag, Is_Managed_Attr, Yes_Value);
         end if;

         if Xm_Ada.In_Record_Name (Widget_Instance) /= Null_String then
            Attributes.Create_Attribute
             (Tag,
              Variable_Name_Attr,
              XML_Tools.Strings.Store
               (Model.Strings.Image
                 (Xm_Ada.In_Record_Name (Widget_Instance))));
         end if;

         --  Создаем список ресурсов виджета.

         if Resources (Widget_Instance) /= Null_List then
            declare
               Resource : Node_Id := First (Resources (Widget_Instance));

            begin
               while Resource /= Null_Node loop
                  Resource_To_XML (Resource, Tag, False);

                  Resource := Next (Resource);
               end loop;
            end;
         end if;

         --  Создаем список constraint ресурсов виджета.

         if Constraint_Resources (Widget_Instance) /= Null_List then
            declare
               Resource : Node_Id
                 := First (Constraint_Resources (Widget_Instance));

            begin
               while Resource /= Null_Node loop
                  Resource_To_XML (Resource, Tag, True);

                  Resource := Next (Resource);
               end loop;
            end;
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
        XML_Tools.Strings.Store (Model.Names.Image (Name (Project))));

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
                             File_Name : in String)
   is
   begin
      Set_File_Name (Project, Enter (File_Name));
      Model.Tools.Project_To_XML (Project);
      XML_Tools.Printer.Print (File_Name);
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
      --!    <Unit> Process_Resources
      --!    <Purpose> Обходит XML-дерево класса компонента и связывает
      --! ресурсы с экземплярами виджетов.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Process_Resources (Tag  : in Element_Id;
                                   Node : in Node_Id);

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
      --!    <Unit> XML_To_Resource
      --!    <Purpose> Преобразует XML-структуру в узел XXX_Resource_Value.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure XML_To_Resource (Tag           : in Element_Id;
                                 Resource      : in Node_Id);

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
      procedure Process_Resources (Tag  : in Element_Id;
                                   Node : in Node_Id)
      is
         function Find_Specification (Attr          : in Attribute_Id;
                                      Is_Constraint : in Boolean)
           return Node_Id;

         function Find_Specification (Attr          : in Attribute_Id;
                                      Is_Constraint : in Boolean)
           return Node_Id
         is
            Widget_Instance : constant Node_Id := Node;

            A            : Attribute_Id := Attr;
            Res          : Node_Id := Null_Node;

            Widget_Class : Node_Id := Null_Node;

         begin
            --  Поиск атрибута name.

            while A /= Null_Attribute_Id loop
               exit when Attributes.Name (A) = Name_Attr;

               A := Attributes.Next (A);
            end loop;

            if A = Null_Attribute_Id then
               raise Program_Error;
               --  Атрибут name не найден.

            end if;

            --  Поиск соответствующей спецификации ресурса.

            declare
               Name         : constant Name_Id
                 := Model.Names.Enter
                     (XML_Tools.Strings.Image (Attributes.Value (A)));

            begin
               if Is_Constraint then
                  --  Поиск в ограничениях.

                  Widget_Class := Class (Parent_Node (Widget_Instance));

                  if Constraint_Resources (Widget_Class) /= Null_List then
                     Res := First (Constraint_Resources (Widget_Class));

                     while Res /= Null_Node loop
                        exit when Internal_Resource_Name (Res) = Name;

                        Res := Next (Res);
                     end loop;
                  end if;

               else
                  --  Поиск в ресурсах.

                  Widget_Class := Class (Widget_Instance);

                  if Resources (Widget_Class) /= Null_List then
                     Res := First (Resources (Widget_Class));

                     while Res /= Null_Node loop
                        exit when Internal_Resource_Name (Res) = Name;

                        Res := Next (Res);
                     end loop;
                  end if;
               end if;
            end;

            if Res = Null_Node then
               if Is_Constraint then
                  Error_Message ("Can't find specification for the "
                    & "constraint resource: "
                    & Model.Names.Image (Name (Widget_Class))
                    & "/"
                    & XML_Tools.Strings.Image (Attributes.Value (A)));

               else
                  Error_Message ("Can't find specification for the resource: "
                    & Model.Names.Image (Name (Widget_Class))
                    & "/"
                    & XML_Tools.Strings.Image (Attributes.Value (A)));
               end if;

               raise Program_Error;
               --  Спецификация ресурса не найдена.

            end if;

            return Res;
         end Find_Specification;

         T : XML_Tools.Element_Id := Elements.Child (Tag);

      begin
         if Elements.Name (Tag) = Component_Class_Tag then
            --  Component class.

            while T /= Null_Element_Id loop
               if Elements.Name (T) = Widget_Instance_Tag then
                  Process_Resources (T, Root (Node));
               end if;

               T := Elements.Next (T);
            end loop;

         elsif Elements.Name (Tag) = Widget_Instance_Tag then
            --  Widget instance.

            declare
               N : Node_Id := First (Children (Node));

            begin
               while T /= Null_Element_Id loop
                  if Elements.Name (T) = Widget_Instance_Tag then
                     Process_Resources (T, N);
                     N := Next (N);

                  elsif Elements.Name (T) = Resource_Tag then
                     Process_Resources (T, Node);

                  elsif Elements.Name (T) = Constraint_Resource_Tag then
                     Process_Resources (T, Node);

                  end if;

                  T := Elements.Next (T);
               end loop;

               pragma Assert (T = Null_Element_Id and then N = Null_Node);
            end;

         elsif Elements.Name (Tag) = Resource_Tag then
            --  Resource.

            declare
               L             : List_Id := Resources (Node);
               Specification : constant Node_Id
                 := Find_Specification (Elements.Attribute (Tag), False);
               Resource      : constant Node_Id
                 := Create_Corresponding_Resource_Value (Specification);

            begin
               if L = Null_List then
                  L := New_List;
                  Set_Resources (Node, L);
               end if;

               Append (L, Resource);
               XML_To_Resource (Tag, Resource);
            end;

         elsif Elements.Name (Tag) = Constraint_Resource_Tag then
            --  Constraint resource.

            declare
               L             : List_Id := Constraint_Resources (Node);
               Specification : constant Node_Id
                 := Find_Specification (Elements.Attribute (Tag), True);
               Resource      : constant Node_Id
                 := Create_Corresponding_Resource_Value (Specification);

            begin
               if L = Null_List then
                  L := New_List;
                  Set_Constraint_Resources (Node, L);
               end if;

               Append (L, Resource);
               XML_To_Resource (Tag, Resource);
            end;

         else
            Error_Message ("Unhandled tag: "
              & XML_Tools.Names.Image (Elements.Name (Tag)));
            raise Program_Error;
         end if;
      end Process_Resources;

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

               elsif Attributes.Name (A) = Package_Name_Attr then
                  Model.Tree.Xm_Ada.Set_Package_Name
                   (Component_Class,
                    Model.Strings.Store
                     (XML_Tools.Strings.Image (Attributes.Value (A))));

               elsif Attributes.Name (A) = Type_Name_Attr then
                  Model.Tree.Xm_Ada.Set_Type_Name
                   (Component_Class,
                    Model.Strings.Store
                     (XML_Tools.Strings.Image (Attributes.Value (A))));

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

         Process_Resources (Tag, Component_Class);
      end XML_To_Component_Class;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> XML_To_Resource
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure XML_To_Resource (Tag      : in Element_Id;
                                 Resource : in Node_Id)
      is
         function Get_Enumeration_Value_By_Name (Specification : in Node_Id;
                                                 Name : in String)
           return Node_Id;

         function Get_Widget_Instance_By_Name (Name : in String)
           return Node_Id;

         function Get_Enumeration_Value_By_Name (Specification : in Node_Id;
                                                 Name : in String)
           return Node_Id
         is
            Specifications      : constant List_Id
              := Value_Specifications (Resource_Type (Specification));
            Res                 : Node_Id := Null_Node;
            Id                  : constant Model.Name_Id
              := Model.Names.Enter (Name);

         begin
            if Specifications /= Null_List then
               Res := First (Specifications);

               while Res /= Null_Node loop
                  exit when Internal_Name (Res) = Id;

                  Res := Next (Res);
               end loop;
            end if;

            if Res = Null_Node then
               Error_Message ("Can't find enumeration value: " & Name);
               raise Program_Error;
            end if;

            return Res;
         end Get_Enumeration_Value_By_Name;

         function Get_Widget_Instance_By_Name (Name : in String)
           return Node_Id
         is
            Component : constant Node_Id
              := Model.Queries.Enclosing_Component_Class (Resource);
            Res       : Node_Id := Root (Component);
            First     : Natural := Name'First;
            Finish    : Natural := Name'First - 1;
            Pos       : Natural := Name'First - 1;

         begin
            --  Разбиваем полное имя узла на токены.
            --  В качестве разделителя используется символ точка ('.').

            while Pos <= Name'Last + 1 loop
               Pos := Pos + 1;

               if Pos > Name'Last or else Name (Pos) = '.' then
                  --  Ищем узел, имя которого совпадает
                  --  с текущим токеном.

                  Finish := Pos - 1;

                  declare
                     Id     : constant Name_Id
                       := Model.Names.Enter (Name (First .. Finish));

                  begin
                     while Res /= Null_Node loop
                        exit when Model.Tree.Name (Res) = Id;

                        if Res = Root (Component) then
                           --  Если дошли до этого места, то это означает,
                           --  что первый токен содержит ошибку.

                           Res := Null_Node;
                           exit;
                        end if;

                        Res := Next (Res);
                     end loop;

                     if Res = Null_Node then
                        Error_Message ("Can't find widget instance: "
                          & Name (Name'First .. Finish) & " in " & Name);
                        raise Program_Error;
                     end if;
                  end;

                  if Pos < Name'Last then
                     Res := Model.Tree.Lists.First (Children (Res));
                  end if;

                  Pos := Pos + 1;
                  First := Pos;
               end if;
            end loop;

            if Res = Null_Node then
               raise Program_Error;
            end if;

            return Res;
         end Get_Widget_Instance_By_Name;

      begin
         --  Обработка атрибутов тега Resource.

         declare
            A : Attribute_Id := Elements.Attribute (Tag);

         begin
            while A /= Null_Attribute_Id loop
               if Attributes.Name (A) = Name_Attr then
                  null;
                  --  Пропускаем, потому что атрибут уже обработан.

               elsif Attributes.Name (A) = Is_Class_Attr then
                  if Attributes.Value (A) = Yes_Value then
                     Set_Is_Resource_Class_Value (Resource, True);

                  elsif Attributes.Value (A) = No_Value then
                     Set_Is_Resource_Class_Value (Resource, False);

                  else
                     Error_Message ("Unknown value of the 'isclass' attr: "
                       & XML_Tools.Strings.Image (Attributes.Value (A)));
                     raise Program_Error;
                  end if;

               elsif Attributes.Name (A) = Is_Fallback_Attr then
                  if Attributes.Value (A) = Yes_Value then
                     Set_Is_Fallback (Resource, True);

                  elsif Attributes.Value (A) = No_Value then
                     Set_Is_Fallback (Resource, False);

                  else
                     Error_Message ("Unknown value of the 'ishardcoded' attr: "
                       & XML_Tools.Strings.Image (Attributes.Value (A)));
                     raise Program_Error;
                  end if;

               elsif Attributes.Name (A) = Is_Hardcoded_Attr then
                  if Attributes.Value (A) = Yes_Value then
                     Set_Is_Hardcoded (Resource, True);

                  elsif Attributes.Value (A) = No_Value then
                     Set_Is_Hardcoded (Resource, False);

                  else
                     Error_Message ("Unknown value of the 'ishardcoded' attr: "
                       & XML_Tools.Strings.Image (Attributes.Value (A)));
                     raise Program_Error;
                  end if;

               elsif Attributes.Name (A) = Value_Attr then
                  declare
                     Value : constant String
                        := XML_Tools.Strings.Image (Attributes.Value (A));

                  begin
                     case Node_Kind (Resource) is
                        when Node_Enumeration_Resource_Value =>
                           declare
                              N : constant Node_Id
                                := Get_Enumeration_Value_By_Name
                                    (Resource_Specification (Resource), Value);

                           begin
                              Set_Resource_Value (Resource, N);
                           end;

                        when Node_Integer_Resource_Value =>
                           declare
                              Int : constant Integer
                                := Integer'Value (Value);
                           begin
                              Set_Resource_Value (Resource, Int);
                           end;

                        when Node_Widget_Reference_Resource_Value =>
                           declare
                              N : constant Node_Id
                                := Get_Widget_Instance_By_Name (Value);

                           begin
                              Set_Resource_Value (Resource, N);
                           end;

                        when others =>
                           Error_Message ("Unhandled resource value : "
                             & Node_Kinds'Image (Node_Kind (Resource)));
                           raise Program_Error;
                     end case;
                  end;

               else
                  Error_Message ("Unknown attribute name: "
                    & XML_Tools.Names.Image (Attributes.Name (A)));
                  raise Program_Error;
               end if;

               A := Attributes.Next (A);
            end loop;
         end;

         --  Проверка наличия строки внутри тега.

         declare
            Child : constant Element_Id := Elements.Child (Tag);

         begin
            if Child /= Null_Element_Id then
               if Elements.Kind (Child) /= A_String then
                  raise Program_Error;
                  --  Сейчас ресурс может содержать только
                  --  строку текста в качестве дочернего элемента.

               end if;

               if Elements.Value (Child) /= Null_String_Id then
                  declare
                     S : constant String_Id
                       := Model.Strings.Store
                           (XML_Tools.Strings.Image (Elements.Value (Child)));

                  begin
                     Set_Resource_Value (Resource, S);
                  end;

               elsif Node_Kind (Resource) = Node_Xm_String_Resource_Value then
                  Set_Resource_Value (Resource, Model.Strings.Store (""));
               end if;

            elsif Node_Kind (Resource) = Node_Xm_String_Resource_Value then
               Set_Resource_Value (Resource, Model.Strings.Store (""));
            end if;
         end;
      end XML_To_Resource;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> XML_To_Widget_Instance
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure XML_To_Widget_Instance (Tag             : in Element_Id;
                                        Widget_Instance : in Node_Id)
      is
         function Find (Name : in XML_Tools.String_Id) return Node_Id;

         function Find (Name : in XML_Tools.String_Id) return Model.Node_Id is
            Classname  : constant Model.Name_Id
              := Model.Names.Enter (XML_Tools.Strings.Image (Name));
            Project  : constant Node_Id
              := Model.Queries.Enclosing_Project (Widget_Instance);
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

            if Widget_Set = Null_Node then
               Error_Message (XML_Tools.Strings.Image (Name)
                 & " not found.");
               raise Program_Error;
               --  Указанный класс виджета не найден.

            end if;

            return Widget_Class;
         end Find;

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

               elsif Attributes.Name (A) = Is_Explotable_Attr then
                  if Attributes.Value (A) = No_Value then
                     Xm_Ada.Set_Create_In_Record (Widget_Instance, False);

                  elsif Attributes.Value (A) = Yes_Value then
                     Xm_Ada.Set_Create_In_Record (Widget_Instance, True);

                  else
                     Error_Message ("Invalid value of the "
                       & "'ismanaged' attribute: "
                       & XML_Tools.Strings.Image (Attributes.Value (A)));
                     raise Program_Error;
                  end if;

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

               elsif Attributes.Name (A) = Variable_Name_Attr then
                  Xm_Ada.Set_In_Record_Name
                   (Widget_Instance,
                    Model.Strings.Store
                     (XML_Tools.Strings.Image (Attributes.Value (A))));

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
            Child                : Element_Id := Elements.Child (Tag);
            Children             : constant List_Id := New_List;

         begin
            Set_Children (Widget_Instance, Children);

            while Child /= Null_Element_Id loop
               if Elements.Name (Child) = Widget_Instance_Tag then
                  --  WidgetInstance.

                  declare
                     Widget_Instance : constant Node_Id
                       := Create_Widget_Instance;

                  begin
                     Append (Children, Widget_Instance);
                     XML_To_Widget_Instance (Child, Widget_Instance);
                  end;

               elsif Elements.Name (Child) = Constraint_Resource_Tag then
                  --  ConstraintResource.
                  --  Не обрабатываем, потому что ресурсы
                  --  обрабатываются вторым проходом.

                  null;

               elsif Elements.Name (Child) = Resource_Tag then
                  --  Resource.
                  --  Не обрабатываем, потому что ресурсы
                  --  обрабатываются вторым проходом.

                  null;

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

      Root : constant Element_Id := 1;

   begin
      Set_Applications (Project, Applications);
      Set_Imported_Widget_Sets (Project, Xt_Motif.Known_Widget_Sets);

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
   function XML_To_Project (File_Name : in String) return Node_Id is
      Project : Node_Id;

   begin
      Init_XML_Tools;
      XML_Tools.Parser.Parse (File_Name);
      Project := XML_To_Project;
      Set_File_Name (Project, Enter (File_Name));

      return Project;
   end XML_To_Project;

end Model.Tools;

