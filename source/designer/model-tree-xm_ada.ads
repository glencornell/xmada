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
package Model.Tree.Xm_Ada is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Argument_Package_Name
   --!    <Purpose> Возвращает  имя пакета, в котором находится функция
   --! установки элементов массива Xt_Arg_List для задаванного типа ресурса.
   --! Параметр Node должен иметь тип Node_XXX_Resource_Type.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Argument_Package_Name (Node : in Node_Id) return Name_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Convenience_Create_Function_Name
   --!    <Purpose> Возвращает имя функции (вместе с именем пакета),
   --! используемой для создания виджета.
   --! Аргумент Node должен иметь тип Node_Widget_Class.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Convenience_Create_Function_Name (Node : in Node_Id)
     return Name_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Convenience_Create_Function_Package_Name
   --!    <Purpose> Возвращает имя пакета, используемого для создания виджета.
   --! Аргумент Node должен иметь тип Node_Widget_Class.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Convenience_Create_Function_Package_Name (Node : in Node_Id)
     return Name_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose> Производит начальную инициализацию внутренних структур.
   --! При повторном вызове осуществляет освобождение используемых ресурсов
   --! и повторную начальную инициализацию внутренних структур.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Literal_Identifier
   --!    <Purpose> Возвращает символьное представление значения для
   --! перечислимых типов.
   --! Аргумент Node должен иметь тип Node_Enumeratuon_Value_Specification.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Literal_Identifier (Node : in Node_Id) return Name_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Class_Name_String
   --!    <Purpose> Возвращает символьное имя класса ресурса для
   --! подстановки в функцию Xt_Set_Arg.
   --! Аргумент Node должет иметь тип Node_Resource_Specification.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Resource_Class_Name_String (Node : in Node_Id)
     return Name_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Name_String
   --!    <Purpose> Возвращает символьное имя ресурса для подстановки в
   --! функцию Xt_Set_Arg.
   --! Аргумент Node должет иметь тип Node_Resource_Specification.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Resource_Name_String (Node : in Node_Id)
     return Name_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Argument_Package_Name
   --!    <Purpose> Устанавливает имя пакета, определяющего функцию установки
   --! задаваемого типа ресурса в качестве аргумента.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Argument_Package_Name (Node : in Node_Id; Name : in Name_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Package_Name
   --!    <Purpose> Устанавливает имя пакета, содержащего задаваемый компонент.
   --! Аргумент Node должен иметь тип Node_Component_Class.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Package_Name (Node : in Node_Id; Name : in String_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Type_Name
   --!    <Purpose> Устанавливает имя типа для хранения виджетов.
   --! Аргумент Node должен иметь тип Node_Component_Class.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Type_Name (Node : in Node_Id; Name : in String_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Purpose> Возвращает имя пакета, содержащего задаваемый компонент.
   --! Аргумент Node должен иметь тип Node_Component_Class.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Package_Name (Node : in Node_Id) return String_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Type_Name
   --!    <Purpose> Возвращает имя типа для хранения виджетов.
   --! Аргумент Node должен иметь тип Node_Component_Class.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Type_Name (Node : in Node_Id) return String_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_In_Record_Name
   --!    <Purpose> Задает имя переменной виджета, которая будет содержаться
   --! в результирующем программном коде.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_In_Record_Name (Node : in Node_Id; Name : in String_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> In_Record_Name
   --!    <Purpose> Возврящает имя переменной виджета,
   --! которая будет содержаться в результирующем программном коде.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function In_Record_Name (Node : in Node_Id) return String_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Use_In_Record
   --!    <Purpose> Задает признак того, нужно ли использовать для
   --! хранения виджета переменную в результирующем программном коде.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Create_In_Record (Node : in Node_Id; Value : in Boolean);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Use_In_Record
   --!    <Purpose> True - создавать в результирующем программном коде
   --! переменную для хранения виджета, False - не создавать.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Create_In_Record (Node : in Node_Id) return Boolean;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Convenience_Create_Function_Name
   --!    <Purpose> Устанавливает имя функции (вместе с именем пакета),
   --! используемой для создания виджета.
   --! Аргумент Node должен иметь тип Node_Widget_Class.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Convenience_Create_Function_Name (Node : in Node_Id;
                                                   Name : in Name_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Convenience_Create_Function_Package_Name
   --!    <Purpose> Устанавливает имя пакета, используемого для создания
   --! виджета.
   --! Аргумент Node должен иметь тип Node_Widget_Class.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Convenience_Create_Function_Package_Name (Node : in Node_Id;
                                                           Name : in Name_Id);

  ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Class_Name_String
   --!    <Purpose> Устанавливает символьное имя класса ресурса для
   --! подстановки в функцию Xt_Set_Arg.
   --! Аргумент Node должет иметь тип Node_Resource_Specification.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Class_Name_String (Node : in Node_Id;
                                             Name : in Name_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Name_String
   --!    <Purpose> Устанавливает символьное имя ресурса для подстановки в
   --! функцию Xt_Set_Arg.
   --! Аргумент Node должет иметь тип Node_Resource_Specification.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Name_String (Node : in Node_Id;
                                       Name : in Name_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Type_Identifier
   --!    <Purpose> Устанавливает символьное представление имени для
   --! перечислимых типов.
   --! Аргумент Node должен иметь тип Node_Enumerated_Resource_Type.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Type_Identifier (Node  : in Node_Id;
                                  Value : in Name_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Literal_Identifier
   --!    <Purpose> Устанавливает символьное представление значения для
   --! перечислимых типов.
   --! Аргумент Node должен иметь тип Node_Enumeratuon_Value_Specification.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Literal_Identifier (Node  : in Node_Id;
                                     Value : in Name_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Type_Identifier
   --!    <Purpose> Возвращает символьное представление имени для
   --! перечислимых типов.
   --! Аргумент Node должен иметь тип Node_Enumerated_Resource_Type
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Type_Identifier (Node : in Node_Id) return Name_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Use_Qualified_Expression
   --!    <Purpose> Возвращает признак символьное представление имени для
   --! перечислимых типов.
   --! Аргумент Node должен иметь тип Node_Enumerated_Resource_Type
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Use_Qualified_Expression (Node : in Node_Id) return Boolean;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Use_Qualified_Expression
   --!    <Purpose> Устанавливает признак символьное представление имени для
   --! перечислимых типов.
   --! Аргумент Node должен иметь тип Node_Enumerated_Resource_Type
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Use_Qualified_Expression (Node : in Node_Id;
                                           Value : in Boolean);


end Model.Tree.Xm_Ada;
