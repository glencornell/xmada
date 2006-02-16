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
--! <Unit> Model.Queries
--! <Purpose>
--!   Пакет содержит разнообразные вспомогательные подпрограммы для упрощения
--! извлечения данных модели.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Model.Queries is

   function Name_Image (Node : in Node_Id) return Wide_String;

   function Application_Class_Name_Image (Node : in Node_Id)
     return Wide_String;

   function Internal_Name_Image (Node : in Node_Id) return Wide_String;

   function Resource_Name_Image (Node : in Node_Id) return Wide_String;

   function Internal_Resource_Name_Image (Node : in Node_Id)
     return Wide_String;

   function Resource_Class_Name_Image (Node : in Node_Id) return Wide_String;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Enclosing_Component_Class
   --!    <Purpose> Возвращает узел класса компонента, заключающего указанный
   --! узел. Если узел находится вне класса компонента, то возвращает
   --! Null_Node.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Enclosing_Component_Class (Node : in Node_Id) return Node_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Enclosing_Project
   --!    <Purpose> Возвращает узел проекта, заключающего указанный
   --! узел. Если узел находится вне класса компонента, то возвращает
   --! Null_Node.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Enclosing_Project (Node : in Node_Id) return Node_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Primitive
   --!    <Purpose> Возвращает True если указанный класс виджета или класс
   --! указанного экземпляра виджета является подклассом от XmPrimitive.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Is_Primitive (Node : in Node_Id) return Boolean;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Gadget
   --!    <Purpose> Возвращает True если указанный класс виджета или класс
   --! указанного экземпляра виджета является подклассом от XmGadget.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Is_Gadget (Node : in Node_Id) return Boolean;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Manager
   --!    <Purpose> Возвращает True если указанный класс виджета или класс
   --! указанного экземпляра виджета является подклассом от XmManager.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Is_Manager (Node : in Node_Id) return Boolean;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Is_Shell
   --!    <Purpose> Возвращает True если указанный класс виджета или класс
   --! указанного экземпляра виджета является подклассом от Shell.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Is_Shell (Node : in Node_Id) return Boolean;

end Model.Queries;
