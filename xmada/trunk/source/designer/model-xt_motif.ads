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
--! <Unit> Model.Xt_Motif
--! <Purpose>
--!   Пакет содержит идентификаторы узлов элементов описания Xt/Motif,
--! используемые в разных пакетах для упрощения прямого доступа к
--! соответствующей информации.
--!
--! <Effects>
--!   Формирование всех идентификаторов узлов производится при начальной
--! инициализации внутренних структур модели. Использование идентификаторов до
--! начальной инициализации приведёт к непредсказуемому эффекту.
--!
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Model.Xt_Motif is

   --  Набор компонентов графического интерфейса пользователя Xt/Motif.

   Xt_Motif_Widget_Set             : Node_Id;

   --  Классы виджетов, используемые различными компонентами.

   Xt_Motif_Shell_Widget_Class     : Node_Id;

   Xt_Motif_Gadget_Widget_Class    : Node_Id;
   Xt_Motif_Manager_Widget_Class   : Node_Id;
   Xt_Motif_Primitive_Widget_Class : Node_Id;

end Model.Xt_Motif;
