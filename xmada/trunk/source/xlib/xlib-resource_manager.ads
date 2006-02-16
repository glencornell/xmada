------------------------------------------------------------------------------
--
--  X Library Ada Binding
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
--! <Unit> Xlib.Resource_Manager
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;
with Interfaces.C.Strings;

package Xlib.Resource_Manager is


   type Xrm_Value is record
      Size    : Interfaces.C.unsigned;
      Address : X_Pointer;
   end record;

   type Xrm_Value_Pointer is access all Xrm_Value;


   type Xrm_Option_Kind is
    (Xrm_Option_No_Arg,
     Xrm_Option_Is_Arg,
     Xrm_Option_Sticky_Arg,
     Xrm_Option_Sep_Arg,
     Xrm_Option_Res_Arg,
     Xrm_Option_Skip_Arg,
     Xrm_Option_Skip_Line,
     Xrm_Option_Skip_N_Args);


   type Xrm_Option_Desc_Rec is record
      Option        : Interfaces.C.Strings.chars_ptr;
      Resource_Name : Interfaces.C.Strings.chars_ptr;
      Arg_Kind      : Xrm_Option_Kind;
      Value         : X_Pointer;
   end record;


   type Xrm_Option_Desc_List is
     array (Natural range <>) of Xrm_Option_Desc_Rec;
   Null_Xrm_Option_Desc_List : constant Xrm_Option_Desc_List;


   type Xrm_Database is private;


private

   pragma Convention (C, Xrm_Option_Desc_Rec);

   for Xrm_Option_Kind'Size use Interfaces.C.int'Size;
   pragma Convention (C, Xrm_Option_Kind);

   pragma Convention (C, Xrm_Value);

   pragma Convention (C, Xrm_Value_Pointer);


   Null_Xrm_Option_Desc_List : constant Xrm_Option_Desc_List (1 .. 0)
     := (others => (Interfaces.C.Strings.Null_Ptr,
                    Interfaces.C.Strings.Null_Ptr,
                    Xrm_Option_No_Arg,
                    Null_X_Pointer));

   type Xrm_Database_Record is null record;
   pragma Convention (C, Xrm_Database_Record);

   type Xrm_Database is access all Xrm_Database_Record;
   pragma Convention (C, Xrm_Database);

end Xlib.Resource_Manager;
