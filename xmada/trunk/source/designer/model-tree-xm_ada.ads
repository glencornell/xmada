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

package Model.Tree.Xm_Ada is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Convenience_Create_Function_Name
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Convenience_Create_Function_Name (Node : in Node_Id)
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
   --!    <Unit> Set_Convenience_Create_Function_Name
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Convenience_Create_Function_Name (Node : in Node_Id;
                                                   Name : in Name_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Name_String
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Resource_Name_String (Node : in Node_Id)
     return Name_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Name_String
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Name_String (Node : in Node_Id;
                                       Name : in Name_Id);

end Model.Tree.Xm_Ada;