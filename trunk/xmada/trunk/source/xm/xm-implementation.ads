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
--! <Unit> Xm.Implementation
--! <Purpose>
--!   This is an internal unit. Don't use it in applications!
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xlib;
with Xt.Implementation;

package Xm.Implementation is


   type Xm_Callback_Reason_List is
     array (Natural range <>) of Xm_Callback_Reason;


   procedure Check (The_Display : in Xlib.Display)
     renames Xt.Implementation.Check;


   procedure Check (The_Screen : in Xlib.Screen)
     renames Xt.Implementation.Check;


   procedure Check (The_GC : in Xlib.Graphic_Context)
     renames Xt.Implementation.Check;


   procedure Check (The_Widget : in Xt.Widget)
     renames Xt.Implementation.Check;


   procedure Check (The_Render_Table : in Xm_Render_Table);


   generic function Generic_To_Element_List
     renames Xt.Implementation.Generic_To_Element_List;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Generic_To_Callback_Struct_Access_With_Reason
   --!    <Purpose>
   --!    <Exceptions> Interfaces.C.Strings.Dereference_Error
   ---------------------------------------------------------------------------
   generic
      type Callback_Struct is private;
      type Callback_Struct_Access is access Callback_Struct;
      Reason : Xm_Callback_Reason;
   function Generic_To_Callback_Struct_Access_With_Reason
    (Source : in Xt.Xt_Pointer)
       return Callback_Struct_Access;


   generic
      type Callback_Struct is private;
      type Callback_Struct_Access is access Callback_Struct;
      Reasons : Xm_Callback_Reason_List;
   function Generic_To_Callback_Struct_Access_With_Reason_List
    (Source : in Xt.Xt_Pointer)
       return Callback_Struct_Access;


end Xm.Implementation;
