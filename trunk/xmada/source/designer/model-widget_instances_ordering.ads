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
--! <Unit> Model.Widget_Instances_Ordering
--! <Purpose>
--!   This package contains the routines to determine right order of widget
--! instances.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;

with Model.Allocations;

package Model.Widget_Instances_Ordering is

   --  Структура для хранения правильного порядка виджетов

   package Widget_Instances_Order_Table is
     new GNAT.Table
      (Table_Component_Type => Node_Id,
       Table_Index_Type     => Natural,
       Table_Low_Bound      => Natural'First + 1,
       Table_Initial        =>
         Allocations.Widget_Instances_Order_Table_Initial,
       Table_Increment      =>
         Allocations.Widget_Instances_Order_Table_Increment);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!   <Unit> Find_Widget_Instances_Order
   --!   <Purpose>
   --!     На вход подается корневой виджет. На выходе строится структура
   --!     Widget_Instances_Order в которой виджеты расположены в
   --!     правильном порядке
   --!   <Exceptions>
   ---------------------------------------------------------------------------
   procedure Find_Widget_Instances_Order (Root_Node : Node_Id);

end Model.Widget_Instances_Ordering;
