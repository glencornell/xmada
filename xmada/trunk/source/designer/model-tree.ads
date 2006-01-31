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
--! <Unit> Model.Tree
--! <Purpose>
--!   Пакет содержит объявление видов узлов дерева модели и подпрограмм
--! извлечени и установки значений атрибутов узлов.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;

with Model.Allocations;

package Model.Tree is

   --  Node_Component_Instance
   --
   --  Описание экземпляра компонента.

   --  Node_Predefined_Resource_Type
   --
   --  Описание предопределенного типа ресурсов.

   --  Node_Resource_Value
   --
   --  Описание значения ресурса.
   --
   --  Resource (Node)
   --  Value (Node)

   --  Node_Resource_Class_Value
   --
   --  Описание значения класса ресурса. ???
   --
   --  Resource (Node)
   --  Value (Node)

   --  Node_Integer_Value
   --  Node_String_Value

   type Node_Kinds is
    (Node_Empty,
     --  Специальный вид узла, не содержащий значений.

     Node_Project,
     --  Описание проекта.

     Node_Application,
     --  Описание приложения.

     Node_Component_Class,
     --  Описание класса компонента.

--     Node_Component_Instance,

     Node_Widget_Set,
     --  Описание набора компонентов.

--     Node_Predefined_Resource_Type,

     Node_Enumerated_Resource_Type,
     --  Описание перечислимого типа ресурса.

     Node_Enumeration_Value_Specification,
     --  Описание значения перечислимого типа ресурса.

     Node_Widget_Class,
     --  Описание класса виджетов.

     Node_Resource_Specification,
     --  Описание ресурса класса виджетов.

     Node_Widget_Instance);
     --  Описание экземпляра виджета.

--     Node_Resource_Value,
--     Node_Resource_Class_Value);

   --  Предопределенные типы данных.

   --        integer;
   --        string          { InternalLiteral = char_8; };
   --        boolean         { InternalLiteral = bool; };
   --        pixmap;
   --        float;
   --        font;
   --        translation_table
   --                        { InternalLiteral = trans_table;
   --                          DocName = "translation table";};
   --        widget_ref      { DocName = "widget reference"; };
   --        any;
   --        color;
   --        compound_string { DocName = "compound string"; };
   --        string_table    { DocName = "string table"; };
   --        font_table      { DocName = "font table"; };
   --        icon;
   --        color_table     { DocName = "color table"; };
   --        class_rec_name  { DocName = "class record name"; };
   --        argument;
   --        reason;
   --        identifier;
   --        asciz_table     { DocName = "asciz table"; };
   --        integer_table   { DocName = "integer table"; };
   --        xbitmapfile     { DocName = "X bitmap file"; };
   --        single_float    { DocName = "Single float"; };
   --        keysym;
   --        rgb;
   --        localized_string
   --                        { DocName = "localized string"; };
   --        wide_character  { InternalLiteral = wchar_string;
   --                          DocName = "wide character string"; };
   --        fontset;
   --        horizontal_integer;
   --        vertical_integer;
   --        horizontal_float;

   type Predefined_Resource_Type_Kind is
    (x);

   function Node_Kind (Node : in Node_Id) return Node_Kinds;
   function Parent_Node (Node : in Node_Id) return Node_Id;

   function Resource_Types (Node : in Node_Id) return List_Id;
   procedure Set_Resource_Types (Node : in Node_Id; Value : in List_Id);

   function Value_Specifications (Node : in Node_Id) return List_Id;
   procedure Set_Value_Specifications (Node : in Node_Id; Value : in List_Id);

   function Name (Node : in Node_Id) return Name_Id;
   procedure Set_Name (Node : in Node_Id; Value : in Name_Id);

   function Internal_Name (Node : in Node_Id) return Name_Id;
   procedure Set_Internal_Name (Node : in Node_Id; Value : in Name_Id);

   function Imported_Widget_Sets (Node : in Node_Id) return List_Id;
   procedure Set_Imported_Widget_Sets (Node : in Node_Id; Value : in List_Id);

   function Applications (Node : in Node_Id) return List_Id;
   procedure Set_Applications (Node : in Node_Id; Value : in List_Id);

   function Component_Classes (Node : in Node_Id) return List_Id;
   procedure Set_Component_Classes (Node : in Node_Id; Value : in List_Id);

   function File_Name (Node : in Node_Id) return Name_Id;
   procedure Set_File_Name (Node : in Node_Id; Value : in Name_Id);

   function Application_Class_Name (Node : in Node_Id) return Name_Id;
   procedure Set_Application_Class_Name (Node  : in Node_Id;
                                         Value : in Name_Id);

   function Widget_Classes (Node : in Node_Id) return List_Id;
   procedure Set_Widget_Classes (Node : in Node_Id; Value : in List_Id);

   function Is_Meta_Class (Node : in Node_Id) return Boolean;
   procedure Set_Is_Meta_Class (Node : in Node_Id; Value : in Boolean);

   function Super_Class (Node : in Node_Id) return Node_Id;
   procedure Set_Super_Class (Node : in Node_Id; Value : in Node_Id);

   function Resource_Name (Node : in Node_Id) return Name_Id;
   procedure Set_Resource_Name (Node : in Node_Id; Value : in Name_Id);

   function Internal_Resource_Name (Node : in Node_Id) return Name_Id;
   procedure Set_Internal_Resource_Name (Node  : in Node_Id;
                                         Value : in Name_Id);

   function Resource_Class_Name (Node : in Node_Id) return Name_Id;
   procedure Set_Resource_Class_Name (Node : in Node_Id; Value : in Name_Id);

   function Internal_Resource_Class_Name (Node : in Node_Id) return Name_Id;
   procedure Set_Internal_Resource_Class_Name (Node  : in Node_Id;
                                               Value : in Name_Id);

   function Resource_Type (Node : in Node_Id) return Node_Id;
   procedure Set_Resource_Type (Node : in Node_Id; Value : in Node_Id);

   function Resources (Node : in Node_Id) return List_Id;
   procedure Set_Resources (Node : in Node_Id; Value : in List_Id);

   function Constraint_Resources (Node : in Node_Id) return List_Id;
   procedure Set_Constraint_Resources (Node : in Node_Id; Value : in List_Id);

private

   type Node_Record (Kind : Node_Kinds := Node_Empty) is record
      Parent   : Node_Id;
      List     : List_Id;
      Previous : Node_Id;
      Next     : Node_Id;

      case Kind is
         when Node_Empty =>
            null;

         when Node_Project =>
            P_Name               : Name_Id;
            --  Имя проекта.

            File_Name            : Name_Id;
            --  Имя файла проекта.

            Imported_Widget_Sets : List_Id;
            --  Список импортированных наборов виджетов.

            Applications         : List_Id;
            --  Список приложений, входящих в проект.

         when Node_Application =>
            Application_Class_Name : Name_Id;
            --  Имя класса приложения.

            Component_Classes      : List_Id;
            --  Список классов компонентов, составляющих приложение.

         when Node_Component_Class =>
            CC_Name : Name_Id;
            --  Имя класса компонентов.

            Root    : Node_Id;
            --  Корневой виджет иерархии виджетов класса компонента.

         when Node_Widget_Set =>
            Resource_Types : List_Id;
            --  Типы ресурсов.

            Widget_Classes : List_Id;
            --  Классы виджетов.

         when Node_Enumerated_Resource_Type =>
            --  Data_Type_Name (Name)  -- ??? Связка?

            ERT_Name             : Name_Id;
            --  Имя типа ресурса. Не все типы ресурсов имеют это имя.

            ERT_Internal_Name    : Name_Id;
            --  Внутреннее имя типа ресурса, используемое Xt для преобразований
            --  типов ресурсов.

            Value_Specifications : List_Id;
            --  Список возможных значений.

         when Node_Enumeration_Value_Specification =>
            EVS_Name          : Name_Id;
            --  Имя значения перечислимого типа.

            EVS_Internal_Name : Name_Id;
            --  Имя значения перечислимого типа, используемое Xt для
            --  преобразования во внутреннее значение.

         when Node_Widget_Class =>
            WC_Name                              : Name_Id;
            --  Наименование класса.

            Is_Meta_Class                        : Boolean;
            --  Класс предназначен только для создания иерархии классов.
            --  Создание экземпляров класса не возможно.

            Super_Class                          : Node_Id;
            --  Объявление базового класса.

            WC_Automatically_Created_Parent      : Node_Id;
            --  Автоматически создаваемый родительский виджет.

            WC_Automatically_Created_Children    : List_Id;
            --  Автоматически создаваемые дочерние виджеты.

            Corresponding_Widget_Or_Gadget_Class : Node_Id;
            --  Соответствующая Widget/Gadget класс. Для классов, являющихся
            --  виджетами содержит ссылку на класс гаджет, и наоборот, для
            --  классов, являющихся гаджетами содержит ссылку на виджет класс.

            WC_Resources                         : List_Id;
            --  Описание обычных ресурсов класса.

            WC_Constraint_Resources              : List_Id;
            --  Описание ресурсов ограничений класса.

            WC_Callbacks                         : List_Id;
            --  Описание подпрограмм обратного вызова.

            Controls                             : List_Id; -- Elist
            --  Перечень классов, допустимые для использования в качестве
            --  дочерних.

            --     XXX Возможно, что этот ресурс лучше переписать через traits.
            --  Locked_Resources
            --  --  Значения ресурсов, определяющих данный класс.

         when Node_Resource_Specification =>
            Resource_Name                : Name_Id;
            --  Имя ресурса.

            Internal_Resource_Name       : Name_Id;
            --  Внутреннее имя ресурса, используемое Xt.

            Resource_Class_Name          : Name_Id;
            --  Имя класса ресурсов.

            Internal_Resource_Class_Name : Name_Id;
            --  Внутреннее имя класса ресурсов, используемое Xt.

            Resource_Type                : Node_Id;
            --  Тип значения ресурса.

            --  Related (Node)
            --  Default

         when Node_Widget_Instance =>
            WI_Name                           : Name_Id;
            --  Имя экземпляра виджета.

            Class                             : Node_Id;
            --  Класс экземпляра виджета.

            Is_Managed                        : Boolean;
            --  Признак необходимости взятия на управление сразу после
            --  создания.

            WI_Resources                      : List_Id;
            --  Значения ресурсов виджета.

            WI_Constraint_Resources           : List_Id;
            --  Значения ресурсов ограничений, полученных от класса
            --  родительского виджета.

            WI_Callbacks                      : List_Id;
            --  Подпрограммы обратного вызова.

            WI_Automatically_Created_Parent   : Node_Id;
            --  Автоматически создаваемый родительский виджет.

            WI_Automatically_Created_Children : List_Id;
            --  Автоматически создаваемые дочерние виджеты.

      end case;
   end record;

   package Node_Table is
     new GNAT.Table (Table_Component_Type => Node_Record,
                     Table_Index_Type     => Node_Id,
                     Table_Low_Bound      => Node_Id'First + 1,
                     Table_Initial        => Allocations.Node_Table_Initial,
                     Table_Increment      => Allocations.Node_Table_Increment);

end Model.Tree;
