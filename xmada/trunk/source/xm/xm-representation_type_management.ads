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
--! <Unit> Xm.Representation_Type_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;

with Xt;

package Xm.Representation_Type_Management is

   type Xm_Rep_Type_Id is new Interfaces.C.unsigned_short;
   Xm_Rep_Type_Invalid : constant Xm_Rep_Type_Id := 16#1FFF#;

   type unsigned_char_List
     is array (Natural range <>) of aliased Interfaces.C.unsigned_char;
   type unsigned_char_Pointer is access all Interfaces.C.unsigned_char;

   function To_unsigned_char_List (Pointer : in unsigned_char_Pointer;
                                   Length  : in Natural)
     return unsigned_char_List;

   type Xm_Rep_Type_Entry is record
      Rep_Type_Name     : Xt.Xt_String;
      Value_Names       : Xt.Xt_String_Pointer;
      Values            : unsigned_char_pointer;
      Num_Values        : Interfaces.C.unsigned_char;
      Reverse_Installed : Xt.Xt_Boolean;
      Rep_Type_Id       : Xm_Rep_Type_Id;
   end record;
   pragma Convention (C, Xm_Rep_Type_Entry);

   type Xm_Rep_Type_Entry_Pointer is access all Xm_Rep_Type_Entry;

   type Xm_Rep_Type_List is array (Natural range <>) of Xm_Rep_Type_Entry;


   Unknown_Representation_Type_Error : exception;


   procedure Xm_Rep_Type_Add_Reverse (Rep_Type_Id : in Xm_Rep_Type_Id);


   --  raised Unknown_Representation_Type_Error
   function Xm_Rep_Type_Get_Id (Rep_Type : in String) return Xm_Rep_Type_Id;

   --  raised Unknown_Representation_Type_Error
   function Xm_Rep_Type_Get_Record (Rep_Type_Id : in Xm_Rep_Type_Id)
     return Xm_Rep_Type_Entry;

   function Xm_Rep_Type_Get_Name_List
    (Rep_Type_Id          : in Xm_Rep_Type_Id;
     Use_Uppercase_Format : in Boolean)
       return Xt.Xt_String_List;

   function Xm_Rep_Type_Get_Registered return Xm_Rep_Type_List;


   ---------------------------------------------------------------------------
   --  Obsolete and deprecated
   ---------------------------------------------------------------------------

   procedure Xm_Rep_Type_Install_Tear_Off_Model_Converter;


private

   pragma Import (C, Xm_Rep_Type_Add_Reverse, "XmRepTypeAddReverse");
   pragma Import (C, Xm_Rep_Type_Install_Tear_Off_Model_Converter,
                  "XmRepTypeInstallTearOffModelConverter");

end Xm.Representation_Type_Management;
