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
--! <Unit> Model.Allocations
--! <Purpose>
--!   Пакет содержит значения начального размера и величины приращений для
--! всех таблиц, использующихся в модели.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Model.Allocations is

   --  Таблица простых списков узлов дерева (пакет Model.Tree.Lists).

   List_Table_Initial                     : constant := 100;
   List_Table_Increment                   : constant := 100;

   --  Таблица символов имён (пакет Model.Names).

   Name_Character_Table_Initial           : constant := 100;
   Name_Character_Table_Increment         : constant := 100;

   --  Таблица имён (пакет Model.Names).

   Name_Table_Initial                     : constant := 100;
   Name_Table_Increment                   : constant := 100;

   --  Таблица символов строк (пакет Model.Strings).

   String_Character_Table_Initial         : constant := 100;
   String_Character_Table_Increment       : constant := 100;

   --  Таблица строк (пакет Model.Strings).

   String_Table_Initial                   : constant := 100;
   String_Table_Increment                 : constant := 100;

   --  Таблица узлов дерева модели (пакет Model.Tree).

   Node_Table_Initial                     : constant := 100;
   Node_Table_Increment                   : constant := 100;

   --  Таблица отсортированных в порядке очередности создания экземпляров
   --  виджетов.

   Widget_Instances_Order_Table_Initial   : constant := 100;
   Widget_Instances_Order_Table_Increment : constant := 100;

   Loop_In_Graph_Table_Initial            : constant := 100;
   Loop_In_Graph_Table_Increment          : constant := 100;

   Widget_Instances_Table_Initial         : constant := 100;
   Widget_Instances_Table_Increment       : constant := 100;

   Links_Table_Initial                    : constant := 100;
   Links_Table_Increment                  : constant := 100;

   Widget_Node_Table_Initial              : constant := 100;
   Widget_Node_Table_Increment            : constant := 100;

   --  Таблица отложенных ресурсов.

   Resource_Table_Initial                 : constant := 100;
   Resource_Table_Increment               : constant := 100;

   --  Таблица имён используемых пакетов

   Package_Names_Initial                  : constant := 100;
   Package_Names_Increment                : constant := 100;
end Model.Allocations;
