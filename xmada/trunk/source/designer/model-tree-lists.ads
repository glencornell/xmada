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
--! <Unit> Model.Tree.Lists
--! <Purpose>
--!   Пакет содержит подпрограммы для работы с простыми списками узлов.
--! Каждый узел может быть членом одного и только одного простого списка
--! узлов.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Model.Tree.Lists is

   function New_List return List_Id;

   function Length (List : in List_Id) return Natural;

   procedure Append (List : in List_Id; Node : in Node_Id);

   procedure Insert_Before (Before : in Node_Id; Node : in Node_Id);

   procedure Remove (Node : in Node_Id);

   function First (List : in List_Id) return Node_Id;

   function Next (Node : in Node_Id) return Node_Id;

   function Parent_Node (List : in List_Id) return Node_Id;

   procedure Set_Parent_Node (List : in List_Id; Value : in Node_Id);

end Model.Tree.Lists;
