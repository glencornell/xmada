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
--! <Unit> Xm_Icon_Gadget
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Ancillary_Types;

with Xm_Gadget;

package Xm_Icon_Gadget is

   subtype Xm_Icon_Gadget is Xm_Gadget.Xm_Gadget;
   subtype Xm_Icon_Gadget_Object_Class is Xm_Gadget.Xm_Gadget_Object_Class;

   Xm_Icon_Gadget_Class : constant Xm_Icon_Gadget_Object_Class;


   function Xm_Create_Icon_Gadget (Parent   : in Xt.Widget;
                                   Name     : in String;
                                   Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
                                     := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Icon_Gadget;


   function Xm_Create_Managed_Icon_Gadget
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Icon_Gadget;


private

   pragma Import (C, Xm_Icon_Gadget_Class, "xmIconGadgetClass");

end Xm_Icon_Gadget;
