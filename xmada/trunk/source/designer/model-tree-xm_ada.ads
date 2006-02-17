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
   --!    <Unit> Literal_Identifier
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Literal_Identifier (Node : in Node_Id) return Name_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Resource_Class_Name_String
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Resource_Class_Name_String (Node : in Node_Id)
     return Name_Id;

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
   --!    <Unit> Set_Package_Name
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Package_Name (Node : in Node_Id; Name : in String_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Type_Name
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Type_Name (Node : in Node_Id; Name : in String_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Package_Name
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Package_Name (Node : in Node_Id) return String_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Type_Name
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Type_Name (Node : in Node_Id) return String_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_In_Record_Name
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_In_Record_Name (Node : in Node_Id; Name : in String_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> In_Record_Name
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function In_Record_Name (Node : in Node_Id) return String_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Use_In_Record
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Create_In_Record (Node : in Node_Id; Value : in Boolean);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Use_In_Record
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Create_In_Record (Node : in Node_Id) return Boolean;

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
   --!    <Unit> Set_Resource_Class_Name_String
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Class_Name_String (Node : in Node_Id;
                                             Name : in Name_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Resource_Name_String
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Resource_Name_String (Node : in Node_Id;
                                       Name : in Name_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Type_Identifier
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Type_Identifier (Node  : in Node_Id;
                                  Value : in Name_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Literal_Identifier
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Literal_Identifier (Node  : in Node_Id;
                                     Value : in Name_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Type_Identifier
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Type_Identifier (Node : in Node_Id) return Name_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Use_Qualified_Expression
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Use_Qualified_Expression (Node : in Node_Id) return Boolean;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Use_Qualified_Expression
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Set_Use_Qualified_Expression (Node : in Node_Id;
                                           Value : in Boolean);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Argument_Package_Name
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Argument_Package_Name (Node : in Node_Id) return Name_Id;

end Model.Tree.Xm_Ada;
