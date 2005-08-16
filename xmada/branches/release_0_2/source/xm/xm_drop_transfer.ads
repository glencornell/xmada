------------------------------------------------------------------------------
--
--  Mofit Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rost.ru)
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
--! along with GCC; see the file COPYING. If not, write to the Free
--! Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
--! 02110-1301, USA.
--!
--! As a special exception, if other files instantiate generics from this
--! unit, or you link this unit with other files to produce an executable,
--! this unit does not by itself cause the resulting executable to be
--! covered by the GNU General Public License. This exception does not
--! however invalidate any other reasons why the executable file might be
--! covered by the GNU Public License.
--!
--! <Unit> Xm_Drop_Transfer
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt_Object;

package Xm_Drop_Transfer is

   subtype Xm_Drop_Transfer_Widget is Xt_Object.Object_Widget;
   subtype Xm_Drop_Transfer_Class is Xt_Object.Object_Class;

   Xm_Drop_Transfer_Object_Class : constant Xm_Drop_Transfer_Class;


private

   pragma Import (C, Xm_Drop_Transfer_Object_Class,
                  "xmDropTransferObjectClass");

end Xm_Drop_Transfer;
