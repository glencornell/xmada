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
--! <Unit> XML_Tools.Elements
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package XML_Tools.Elements is

   function Kind (Element : in Element_Id) return Element_Kinds;

   function Name (Element : in Element_Id) return Name_Id;

   function Attribute (Element : in Element_Id) return Attribute_Id;

   function Child (Element : in Element_Id) return Element_Id;

   function Next (Element : in Element_Id) return Element_Id;

   function Value (Element : in Element_Id) return String_Id;

   procedure Set_Attribute (Element : in Element_Id;
                            Value   : in Attribute_Id);

   function Create_Tag (Parent : in Element_Id;
                        Name   : in Name_Id)
     return Element_Id;

   procedure Create_String (Parent : in Element_Id;
                            Value  : in String_Id);

   procedure Initialize;

end XML_Tools.Elements;
