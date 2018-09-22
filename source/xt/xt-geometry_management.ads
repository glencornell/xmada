------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
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
--! <Unit> Xt.Geometry_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Xt.Geometry_Management is


   procedure Xt_Move_Widget (The_Widget : in Widget;
                             X          : in Position;
                             Y          : in Position);


   procedure Xt_Configure_Widget (The_Widget   : in Widget;
                                  X            : in Position;
                                  Y            : in Position;
                                  Width        : in Dimension;
                                  Height       : in Dimension;
                                  Border_Width : in Dimension);


   procedure Xt_Resize_Window (The_Widget : in Widget);

   procedure Xt_Translate_Coords (The_Widget : in     Widget;
                                  X          : in     Position;
                                  Y          : in     Position;
                                  Root_X     :    out Position;
                                  Root_Y     :    out Position);

end Xt.Geometry_Management;
