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

     Node_Predefined_Resource_Type,
     --  Описание предопределённого типа ресурса.

     Node_Enumerated_Resource_Type,
     --  Описание перечислимого типа ресурса.

     Node_Xm_String_Resource_Type,
     --  Описание типа ресурса со значением композитной строки.

     Node_Enumeration_Value_Specification,
     --  Описание значения перечислимого типа ресурса.

     Node_Widget_Class,
     --  Описание класса виджетов.

     Node_Resource_Specification,
     --  Описание ресурса класса виджетов.

     Node_Widget_Instance,
     --  Описание экземпляра виджета.

     Node_Xm_Rendition, 
     --  Описание элемента таблицы представлений Render_Table.

     Node_Integer_Resource_Value,
     --  Значение ресурса, содержащего любую целочисленную величину.

     Node_Widget_Reference_Resource_Type,
     --  Тип ресурсов, представляющий ссылку на экземпляр виджета.

     Node_Widget_Reference_Resource_Value,
     --  Значение ресурса, содержащего ссылку на экземпляр виджета.

     Node_Pixel_Resource_Value,
     --  Значение ресурса, содержащего цвет пикселя.

     Node_Pixmap_Resource_Value,
     --  Значение ресурса, содержащего пиксельный образ.

     Node_Colormap_Resource_Value,
     --  Значение ресурса, содержащего цветовую палитру.

     Node_Screen_Resource_Value,
     --  Значение ресурса, содержащего ссылку на описание экрана.

     Node_Translation_Data_Resource_Value,
     --  Значение ресурса, содержащего таблицу трансляции.
   
     Node_Xm_Render_Table_Resource_Value,
     --  Значение ресурса, содержащего список элементов таблицы представлений
     --  Render_Table.
 
     Node_Xm_String_Resource_Value,
     --  Значение ресурса, содержащего композитную строку.

     Node_Enumeration_Resource_Value);
     --  Значение ресурса, содержащего ссылку на величину перечислимого типа.

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
    (Type_Unspecified,
     --  Тип не определён. Используется только как начальное значение.

     Type_C_Short,
     --  Тип short языка C.

     Type_C_Int,
     --  Тип int языка C.

     Type_Position,
     --  Тип Position - координата Xt.

     Type_Dimension,
     --  Тип Dimension - размер Xt.

     Type_Pixel,
     --  Тип Pixel - "цвет" пиксела.

     Type_Pixmap,
     --  Тип Pixmap - графическое изображение.

     Type_Screen,
     --  Тип Screen - ссылка на описание экрана.

     Type_Colormap,
     --  Тип Colormap - палитра цветов.

     Type_Translation_Data);
     --  Типы XtTranslations и XtAccelerators - список трансляции событий на
     --  подпрограммы действий.

--     Type_Widget_Reference);
     --  Ссылка на экземпляр виджета.

   type Widget_Reference_Constraint is
    (Unspecified,
     --  Не определено.

     Child,
     --  Дочерний виджет.

     Parents_Child);
     --  Дочерний виджет родительского виджета.

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

   function Type_Kind (Node : in Node_Id) return Predefined_Resource_Type_Kind;
   procedure Set_Type_Kind (Node  : in Node_Id;
                            Value : in Predefined_Resource_Type_Kind);

   function Resource_Specification (Node : in Node_Id) return Node_Id;
   procedure Set_Resource_Specification (Node  : in Node_Id;
                                         Value : in Node_Id);

   function Is_Resource_Class_Value (Node : in Node_Id) return Boolean;
   procedure Set_Is_Resource_Class_Value (Node  : in Node_Id;
                                          Value : in Boolean);

   function Resource_Value (Node : in Node_Id) return Node_Id;
   procedure Set_Resource_Value (Node : in Node_Id; Value : in Node_Id);

   function Resource_Value (Node : in Node_Id) return List_Id;
   procedure Set_Resource_Value (Node : in Node_Id; Value : in List_Id);

   function Resource_Value (Node : in Node_Id) return String_Id;
   procedure Set_Resource_Value (Node : in Node_Id; Value : in String_Id);

   function Resource_Value (Node : in Node_Id) return Integer;
   procedure Set_Resource_Value (Node : in Node_Id; Value : in Integer);

   function Is_Hardcoded (Node : in Node_Id) return Boolean;
   procedure Set_Is_Hardcoded (Node : in Node_Id; Value : in Boolean);

   function Is_Fallback (Node : in Node_Id) return Boolean;
   procedure Set_Is_Fallback (Node : in Node_Id; Value : in Boolean);

   function Root (Node : in Node_Id) return Node_Id;
   procedure Set_Root (Node : in Node_Id; Value : in Node_Id);

   function Class (Node : in Node_Id) return Node_Id;
   procedure Set_Class (Node : in Node_Id; Value : in Node_Id);

   function Children (Node : in Node_Id) return List_Id;
   procedure Set_Children (Node : in Node_Id; Value : in List_Id);

   function Is_Managed (Node : in Node_Id) return Boolean;
   procedure Set_Is_Managed (Node : in Node_Id; Value : in Boolean);

   function Can_Be_Set_At_Creation_Time (Node : in Node_Id) return Boolean;
   procedure Set_Can_Be_Set_At_Creation_Time (Node  : in Node_Id;
                                              Value : in Boolean);

   function Can_Be_Set_By_Set_Values (Node : in Node_Id) return Boolean;
   procedure Set_Can_Be_Set_By_Set_Values (Node  : in Node_Id;
                                           Value : in Boolean);

   function Can_Be_Retrieved_By_Get_Values (Node : in Node_Id) return Boolean;
   procedure Set_Can_Be_Retrieved_By_Get_Values (Node  : in Node_Id;
                                                 Value : in Boolean);

   function Cannot_Be_Set_In_Resource_File (Node : in Node_Id) return Boolean;
   procedure Set_Cannot_Be_Set_In_Resource_File (Node  : in Node_Id;
                                                 Value : in Boolean);

   function Widget_Reference_Constraints (Node : in Node_Id)
     return Widget_Reference_Constraint;
   procedure Set_Widget_Reference_Constraints
    (Node  : in Node_Id;
     Value : in Widget_Reference_Constraint);

   function Automatically_Created_Parent (Node : in Node_Id) return Node_Id;
   procedure Set_Automatically_Created_Parent (Node  : in Node_Id;
                                               Value : in Node_Id);

   function Automatically_Created_Children (Node : in Node_Id) return List_Id;
   procedure Set_Automatically_Created_Children (Node  : in Node_Id;
                                                 Value : in List_Id);

   function Is_Postponed (Node : in Node_Id) return Boolean;
   procedure Set_Is_Postponed (Node : in Node_Id; Value : in Boolean);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose> Производит начальную инициализацию внутренних структур.
   --! При повторном вызове осуществляет освобождение используемых ресурсов
   --! и повторную начальную инициализацию внутренних структур.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialize;

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

         when Node_Predefined_Resource_Type =>
            PRT_Name          : Name_Id;
            --  Имя типа ресурса. Не все типы ресурсов имеют это имя.

            PRT_Internal_Name : Name_Id;
            --  Внутреннее имя типа ресурса, используемое Xt для преобразований
            --  типов ресурсов.

            Type_Kind         : Predefined_Resource_Type_Kind;
            --  Вид предопределённого типа ресурсов.

         when Node_Enumeration_Value_Specification =>
            EVS_Name                 : Name_Id;
            --  Имя значения перечислимого типа.

            EVS_Internal_Name        : Name_Id;
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
            Resource_Name                  : Name_Id;
            --  Имя ресурса.

            Internal_Resource_Name         : Name_Id;
            --  Внутреннее имя ресурса, используемое Xt.

            Resource_Class_Name            : Name_Id;
            --  Имя класса ресурсов.

            Internal_Resource_Class_Name   : Name_Id;
            --  Внутреннее имя класса ресурсов, используемое Xt.

            Resource_Type                  : Node_Id;
            --  Тип значения ресурса.

            Can_Be_Set_At_Creation_Time    : Boolean;
            --  Значение ресурса может быть задано при создании виджета.

            Can_Be_Set_By_Set_Values       : Boolean;
            --  Значение ресурса может быть изменено с использованием
            --  XtSetValues.

            Can_Be_Retrieved_By_Get_Values : Boolean;
            --  Значение ресурса может быть извлечено с использованием
            --  XtGetValues.

            Cannot_Be_Set_In_Resource_File : Boolean;
            --  Значение ресурса не может быть заданно в файле ресурсов.

            Widget_Reference_Constraints   : Widget_Reference_Constraint;
            --  Ограничения на используемый в качестве значения экземпляр
            --  виджета. Действителен только если Node_Kind (Resource_Type)
            --  равен Node_Widget_Reference_Resource_Type.

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

            Children                          : List_Id;
            --  Список дочерних экземпляров виджетов.

            WI_Automatically_Created_Parent   : Node_Id;
            --  Автоматически создаваемый родительский виджет.

            WI_Automatically_Created_Children : List_Id;
            --  Автоматически создаваемые дочерние виджеты.

            --  TODO Список обратных связей (кто зависит от этого виджета).

         when Node_Xm_Rendition =>
            XR_Name      : Name_Id;
            --  Имя узла.

            XR_Resources : List_Id;
            --  Описание обычных ресурсов класса.

         when Node_Enumerated_Resource_Type =>
            --  Data_Type_Name (Name)  -- ??? Связка?

            ERT_Name             : Name_Id;
            --  Имя типа ресурса. Не все типы ресурсов имеют это имя.

            ERT_Internal_Name    : Name_Id;
            --  Внутреннее имя типа ресурса, используемое Xt для преобразований
            --  типов ресурсов.

            Value_Specifications : List_Id;
            --  Список возможных значений.

         when Node_Enumeration_Resource_Value =>
            ERV_Resource_Specification  : Node_Id;
            --  Ссылка на спецификацию ресурса.

            ERV_Is_Resource_Class_Value : Boolean;
            --  Признак значения класса ресурса (а не ресурса).

            ERV_Resource_Value          : Node_Id;
            --  Ссылка на спецификацию значения перечислимого типа,
            --  используемого в качестве значения ресурса.

            ERV_Is_Hardcoded            : Boolean;
            --  Признак необходимости жесткой фиксации значения ресурса
            --  в генерируемом коде программы. В противном случае значение
            --  ресурса по возможности будет сохраняться в файле ресурсов.

            ERV_Is_Fallback             : Boolean;
            --  Признак необходимости занесения значения ресурса в список
            --  ресурсов отката приложения.

            ERV_Is_Postponed            : Boolean;
            --  Признак отложенного ресурса.

         when Node_Integer_Resource_Value =>
            IRV_Resource_Specification  : Node_Id;
            --  Ссылка на спецификацию ресурса.

            IRV_Is_Resource_Class_Value : Boolean;
            --  Признак значения класса ресурса (а не ресурса).

            IRV_Resource_Value          : Integer;
            --  Целочисленное значение ресурса.

            IRV_Is_Hardcoded            : Boolean;
            --  Признак необходимости жесткой фиксации значения ресурса
            --  в генерируемом коде программы. В противном случае значение
            --  ресурса по возможности будет сохраняться в файле ресурсов.

            IRV_Is_Fallback             : Boolean;
            --  Признак необходимости занесения значения ресурса в список
            --  ресурсов отката приложения.

            IRV_Is_Postponed            : Boolean;
            --  Признак отложенного ресурса.

         when Node_Pixel_Resource_Value =>
            PRV_Resource_Specification  : Node_Id;
            --  Ссылка на спецификацию ресурса.

            PRV_Is_Resource_Class_Value : Boolean;
            --  Признак значения класса ресурса (а не ресурса).

--             PRV_Resource_Value          : ;
            --  Ссылка на спецификацию значения перечислимого типа,
            --  используемого в качестве значения ресурса.

            PRV_Is_Hardcoded            : Boolean;
            --  Признак необходимости жесткой фиксации значения ресурса
            --  в генерируемом коде программы. В противном случае значение
            --  ресурса по возможности будет сохраняться в файле ресурсов.

            PRV_Is_Fallback             : Boolean;
            --  Признак необходимости занесения значения ресурса в список
            --  ресурсов отката приложения.

            PRV_Is_Postponed            : Boolean;
            --  Признак отложенного ресурса.

         when Node_Pixmap_Resource_Value =>
            PMRV_Resource_Specification  : Node_Id;
            --  Ссылка на спецификацию ресурса.

            PMRV_Is_Resource_Class_Value : Boolean;
            --  Признак значения класса ресурса (а не ресурса).

--             PMRV_Resource_Value          : ;
            --  Ссылка на спецификацию значения перечислимого типа,
            --  используемого в качестве значения ресурса.

            PMRV_Is_Hardcoded            : Boolean;
            --  Признак необходимости жесткой фиксации значения ресурса
            --  в генерируемом коде программы. В противном случае значение
            --  ресурса по возможности будет сохраняться в файле ресурсов.

            PMRV_Is_Fallback             : Boolean;
            --  Признак необходимости занесения значения ресурса в список
            --  ресурсов отката приложения.

            PMRV_Is_Postponed            : Boolean;
            --  Признак отложенного ресурса.

         when Node_Colormap_Resource_Value =>
            CRV_Resource_Specification  : Node_Id;
            --  Ссылка на спецификацию ресурса.

            CRV_Is_Resource_Class_Value : Boolean;
            --  Признак значения класса ресурса (а не ресурса).

--             CRV_Resource_Value          : ;
            --  Ссылка на спецификацию значения перечислимого типа,
            --  используемого в качестве значения ресурса.

            CRV_Is_Hardcoded            : Boolean;
            --  Признак необходимости жесткой фиксации значения ресурса
            --  в генерируемом коде программы. В противном случае значение
            --  ресурса по возможности будет сохраняться в файле ресурсов.

            CRV_Is_Fallback             : Boolean;
            --  Признак необходимости занесения значения ресурса в список
            --  ресурсов отката приложения.

            CRV_Is_Postponed            : Boolean;
            --  Признак отложенного ресурса.

         when Node_Translation_Data_Resource_Value =>
            TRV_Resource_Specification  : Node_Id;
            --  Ссылка на спецификацию ресурса.

            TRV_Is_Resource_Class_Value : Boolean;
            --  Признак значения класса ресурса (а не ресурса).

--             TRV_Resource_Value          : ;
            --  Ссылка на спецификацию значения перечислимого типа,
            --  используемого в качестве значения ресурса.

            TRV_Is_Hardcoded            : Boolean;
            --  Признак необходимости жесткой фиксации значения ресурса
            --  в генерируемом коде программы. В противном случае значение
            --  ресурса по возможности будет сохраняться в файле ресурсов.

            TRV_Is_Fallback             : Boolean;
            --  Признак необходимости занесения значения ресурса в список
            --  ресурсов отката приложения.

            TRV_Is_Postponed            : Boolean;
            --  Признак отложенного ресурса.

         when Node_Screen_Resource_Value =>
            SRV_Resource_Specification  : Node_Id;
            --  Ссылка на спецификацию ресурса.

            SRV_Is_Resource_Class_Value : Boolean;
            --  Признак значения класса ресурса (а не ресурса).

--             SRV_Resource_Value          : ;
            --  Ссылка на спецификацию значения перечислимого типа,
            --  используемого в качестве значения ресурса.

            SRV_Is_Hardcoded            : Boolean;
            --  Признак необходимости жесткой фиксации значения ресурса
            --  в генерируемом коде программы. В противном случае значение
            --  ресурса по возможности будет сохраняться в файле ресурсов.

            SRV_Is_Fallback             : Boolean;
            --  Признак необходимости занесения значения ресурса в список
            --  ресурсов отката приложения.

            SRV_Is_Postponed            : Boolean;
            --  Признак отложенного ресурса.

         when Node_Widget_Reference_Resource_Type =>
            WRRT_Name          : Name_Id;
            --  Имя типа ресурса. Не все типы ресурсов имеют это имя.

            WRRT_Internal_Name : Name_Id;
            --  Внутреннее имя типа ресурса, используемое Xt для преобразований
            --  типов ресурсов.

         when Node_Widget_Reference_Resource_Value =>
            WRRV_Resource_Specification  : Node_Id;
            --  Ссылка на спецификацию ресурса.

            WRRV_Is_Resource_Class_Value : Boolean;
            --  Признак значения класса ресурса (а не ресурса).

            WRRV_Resource_Value          : Node_Id;
            --  Ссылка на экземпляр виджета, используемого в качестве
            --  значения ресурса.

            WRRV_Is_Hardcoded            : Boolean;
            --  Признак необходимости жесткой фиксации значения ресурса
            --  в генерируемом коде программы. В противном случае значение
            --  ресурса по возможности будет сохраняться в файле ресурсов.

            WRRV_Is_Fallback             : Boolean;
            --  Признак необходимости занесения значения ресурса в список
            --  ресурсов отката приложения.

            WRRV_Is_Postponed            : Boolean;
            --  Признак отложенного ресурса.

         when Node_Xm_String_Resource_Type =>
            XSRT_Name             : Name_Id;
            --  Имя типа ресурса. Не все типы ресурсов имеют это имя.

            XSRT_Internal_Name    : Name_Id;
            --  Внутреннее имя типа ресурса, используемое Xt для преобразований
            --  типов ресурсов.

         when Node_Xm_Render_Table_Resource_Value =>
            XRTRV_Is_Resource_Class_Value : Boolean;
            --  Признак значения класса ресурса (а не ресурса).

            XRTRV_Resource_Value          : List_Id;
            --  Целочисленное значение ресурса.

            XRTRV_Is_Hardcoded            : Boolean;
            --  Признак необходимости жесткой фиксации значения ресурса
            --  в генерируемом коде программы. В противном случае значение
            --  ресурса по возможности будет сохраняться в файле ресурсов.

            XRTRV_Is_Fallback             : Boolean;
            --  Признак необходимости занесения значения ресурса в список
            --  ресурсов отката приложения.

            XRTRV_Is_Postponed            : Boolean;
            --  Признак отложенного ресурса.

         when Node_Xm_String_Resource_Value =>
            XSRV_Resource_Specification  : Node_Id;
            --  Ссылка на спецификацию ресурса.

            XSRV_Is_Resource_Class_Value : Boolean;
            --  Признак значения класса ресурса (а не ресурса).

            XSRV_Resource_Value          : String_Id;
            --  Ссылка на экземпляр виджета, используемого в качестве
            --  значения ресурса.

            XSRV_Is_Hardcoded            : Boolean;
            --  Признак необходимости жесткой фиксации значения ресурса
            --  в генерируемом коде программы. В противном случае значение
            --  ресурса по возможности будет сохраняться в файле ресурсов.

            XSRV_Is_Fallback             : Boolean;
            --  Признак необходимости занесения значения ресурса в список
            --  ресурсов отката приложения.

            XSRV_Is_Postponed            : Boolean;
            --  Признак отложенного ресурса.

      end case;
   end record;

   package Node_Table is
     new GNAT.Table (Table_Component_Type => Node_Record,
                     Table_Index_Type     => Node_Id,
                     Table_Low_Bound      => Node_Id'First + 1,
                     Table_Initial        => Allocations.Node_Table_Initial,
                     Table_Increment      => Allocations.Node_Table_Increment);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Parent_Node
   --!    <Purpose> Устанавливает значение родительского узла.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Parent_Node (Node : in Node_Id; Value : in Node_Id);

end Model.Tree;
