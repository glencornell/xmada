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
--! <Unit> Xm_Command
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Ancillary_Types;

with Xm;
with Xm_Selection_Box;

package Xm_Command is

   subtype Xm_Command_Widget is Xm_Selection_Box.Xm_Selection_Box_Widget;
   subtype Xm_Command_Class is Xm_Selection_Box.Xm_Selection_Box_Class;

   Xm_Command_Widget_Class : constant Xm_Command_Class;

   --

   function Xm_Create_Command (Parent   : in Xt.Widget;
                               Name     : in String;
                               Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
                                 := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Command_Widget;


   function Xm_Create_Managed_Command
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Command_Widget;

   --

   procedure Xm_Command_Append_Value (The_Widget : in Xm_Command_Widget;
                                      Value      : in Xm.Xm_String);


   procedure Xm_Command_Error (The_Widget : in Xm_Command_Widget;
                               Error      : in Xm.Xm_String);


   procedure Xm_Command_Set_Value (The_Widget : in Xm_Command_Widget;
                                   Value      : in Xm.Xm_String);


   function Xm_Command_Get_Child (The_Widget : in Xm_Command_Widget;
                                  Child      : in Xm.Xm_Dialog_Child_Type)
     return Xt.Widget;


private

   pragma Import (C, Xm_Command_Widget_Class, "xmCommandWidgetClass");

end Xm_Command;
