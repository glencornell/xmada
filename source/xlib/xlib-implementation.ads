------------------------------------------------------------------------------
--
--  X Library Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2006  Vadim Godunko (vgodunko@rostel.ru)
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
--! <Unit> Xlib.Implementation
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Xlib.Implementation is


   procedure Check (The_Display : in Display);

   procedure Check (The_Screen : in Screen);

   procedure Check (The_GC : in Graphic_Context);

   procedure Check (The_String : in X_String_Pointer);

   generic
      type Element         is private;
      type Element_Pointer is access all Element;
      type Element_List    is array (Natural range <>) of aliased Element;
   function Generic_To_Element_List (Pointer : in Element_Pointer;
                                     Length  : in Natural)
     return Element_List;


   generic
      type Element         is private;
      type Element_Pointer is access all Element;
      type Element_List    is array (Natural range <>) of aliased Element;
      Terminator : Element;
   function Generic_Terminated_To_Element_List (Pointer : in Element_Pointer)
     return Element_List;


private

   pragma Inline (Check);

end Xlib.Implementation;
