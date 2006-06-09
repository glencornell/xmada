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
--! <Unit> Model.Tree.E_lists
--! <Purpose>
--!   Пакет содержит подпрограммы для работы с расширенным списками узлов.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision: 407 $ $Author: dibala $
--  $Date: 2006-02-26 14:04:02 +0000 (Вск, 26 Фев 2006) $
------------------------------------------------------------------------------

package Model.Tree.E_lists is

   procedure Append_Elmt (Node : in Node_Id; To : in Elist_Id);

   function Elmt_To_Node (Elmt : in Elmt_Id) return Node_Id;

   function First_Elmt (List : in Elist_Id) return Elmt_Id;

   function Last_Elmt (List : in Elist_Id) return Elmt_Id;

   function Length (List : in Elist_Id) return Natural;

   function New_Elmt_List return Elist_Id;

   function Next_Elmt (Elmt : in Elmt_Id) return Elmt_Id;

   procedure Replace_Elmt (Elmt : in Elmt_Id; New_Node : in Node_Id);

   procedure Remove_Elmt (List : in Elist_Id; Elmt : in Elmt_Id);

end Model.Tree.E_lists;
