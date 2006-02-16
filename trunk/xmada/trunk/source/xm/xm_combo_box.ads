------------------------------------------------------------------------------
--
--  Mofit Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rostel.ru)
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
--! XmAda maintained by TechnoServ A/S (email: vgodunko@rostel.ru)
--!
--! <Unit> Xm_Combo_Box
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Ancillary_Types;

with Xm;
with Xm_Manager;

package Xm_Combo_Box is

   subtype Xm_Combo_Box_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Combo_Box_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Combo_Box_Widget_Class : constant Xm_Combo_Box_Class;

   --

   function Xm_Create_Combo_Box (Parent   : in Xt.Widget;
                                 Name     : in String;
                                 Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
                                   := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Combo_Box_Widget;


   function Xm_Create_Drop_Down_Combo_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget;


   function Xm_Create_Drop_Down_List
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget;


   function Xm_Create_Managed_Combo_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget;


   function Xm_Create_Managed_Drop_Down_Combo_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget;


   function Xm_Create_Managed_Drop_Down_List
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget;

   --

   procedure Xm_Combo_Box_Add_Item (The_Widget : in Xt.Widget;
                                    Item       : in Xm.Xm_String;
                                    Position   : in Natural := 0;
                                    Unique     : in Boolean := True);

   procedure Xm_Combo_Box_Delete_Pos (The_Widget : in Xt.Widget;
                                      Position   : in Natural := 0);

   procedure Xm_Combo_Box_Select_Item (The_Widget : in Xt.Widget;
                                       Item       : in Xm.Xm_String);

   procedure Xm_Combo_Box_Set_Item (The_Widget : in Xt.Widget;
                                    Item       : in Xm.Xm_String);

   procedure Xm_Combo_Box_Update (The_Widget : in Xt.Widget);


private

   pragma Import (C, Xm_Combo_Box_Widget_Class, "xmComboBoxWidgetClass");

end Xm_Combo_Box;
