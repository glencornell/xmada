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
--! <Unit> Model.Tree.Designer
--! <Purpose>
--!   Пакет содержит структуры данных для предстваления расширенных атрибутов
--! узлов дерева модели, используемых дизайнером.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;

with Xt.Ancillary_Types;

with Designer.Visual_Editor;

package Model.Tree.Designer is

   --  Тип данных, используемый для представления ссылки на подпрограмму
   --  создания экземпляра класса виджета.

   --  XXX Имеет смысл заменить на подпрограмму с соглашением C для удобства
   --  подключения классов виджетов "на лету".

   type Convenience_Create is
     access function (Parent   : in Xt.Widget;
                      Name     : in String;
                      Arg_List : in Xt.Ancillary_Types.Xt_Arg_List)
                        return Xt.Widget;

   --  Тип данных, используемый для представления значения перечислимого типа.

   type Representation_Types is
    (Representation_Type_Unspecified,
     Representation_Type_C_Unsigned_Char,
     Representation_Type_C_Int);

   function All_Resources (Node : in Node_Id) return List_Id;
   procedure Set_All_Resources (Node : in Node_Id; Value : in List_Id);

   function All_Constraint_Resources (Node : in Node_Id) return List_Id;
   procedure Set_All_Constraint_Resources (Node  : in Node_Id;
                                           Value : in List_Id);

   function Convenience_Create_Function (Node : in Node_Id)
     return Convenience_Create;
   procedure Set_Convenience_Create_Function (Node  : in Node_Id;
                                              Value : in Convenience_Create);

   function Widget_Class (Node : in Node_Id) return Xt.Widget_Class;
   procedure Set_Widget_Class (Node  : in Node_Id;
                               Value : in Xt.Widget_Class);

   function Is_Changed (Node : in Node_Id) return Boolean;
   procedure Set_Is_Changed (Node : in Node_Id; Value : in Boolean);

   function Representation_Type (Node : in Node_Id)
     return Representation_Types;
   procedure Set_Representation_Type (Node  : in Node_Id;
                                      Value : in Representation_Types);

   function Is_Set_Initial_Size (Node : in Node_Id) return Boolean;
   procedure Set_Is_Set_Initial_Size (Node : in Node_Id; Value : in Boolean);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Representation_Value
   --!    <Purpose> Возвращает значение, используемое Xt/Motif для внутреннего
   --! представления указанной спецификации значения перечислимого типа.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Representation_Value (Node : in Node_Id)
     return Interfaces.C.unsigned_char;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Representation_Value
   --!    <Purpose> Устанавливает значение, используемое Xt/Motif для
   --! внутреннего представления указанной спецификации значения перечислимого
   --! типа.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Representation_Value (Node  : in Node_Id;
                                       Value : in Interfaces.C.unsigned_char);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Visual_Editor_Plugin
   --!    <Purpose> Возвращает ссылку на объект расширения визуального
   --! редактора для указанного класса виджетов.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Visual_Editor_Plugin (Node : in Node_Id)
     return Standard.Designer.Visual_Editor.Plugin_Access;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Visual_Editor_Plugin
   --!    <Purpose> Устанавливает ссылку на объект расширения визуального
   --! редактора для указанного класса виджетов.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Visual_Editor_Plugin
    (Node  : in Node_Id;
     Value : in Standard.Designer.Visual_Editor.Plugin_Access);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose> Производит начальную инициализацию внутренних структур.
   --! При повторном вызове осуществляет освобождение используемых ресурсов
   --! и повторную начальную инициализацию внутренних структур.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialize;

end Model.Tree.Designer;
