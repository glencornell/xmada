------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006
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
--! <Unit> XML_Tools.Attributes
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;

with XML_Tools.Allocation;
with XML_Tools.Elements;

package body XML_Tools.Attributes is

   use XML_Tools.Elements;

   type Attribute_Record is record
      Name  : Name_Id;
      Value : String_Id;
      Next  : Attribute_Id;
   end record;

   package Attributes is
     new GNAT.Table (Table_Component_Type => Attribute_Record,
                     Table_Index_Type     => Attribute_Id,
                     Table_Low_Bound      => Attribute_Id'First,
                     Table_Initial        => Allocation.Attributes_Initial,
                     Table_Increment      => Allocation.Attributes_Increment);

   ----------------------
   -- Create_Attribute --
   ----------------------

   procedure Create_Attribute (Tag   : in Element_Id;
                               Name  : in Name_Id;
                               Value : in String_Id)
   is
      Aux : Attribute_Id := Attribute (Tag);

   begin
      Attributes.Append ((Name  => Name,
                          Value => Value,
                          Next  => Null_Attribute_Id));

      if Aux = Null_Attribute_Id then
         Set_Attribute (Tag, Attributes.Last);

      else
         while Attributes.Table (Aux).Next /= Null_Attribute_Id loop
            Aux := Attributes.Table (Aux).Next;
         end loop;

         Attributes.Table (Aux).Next := Attributes.Last;
      end if;
   end Create_Attribute;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      Attributes.Init;
   end Initialize;

   ----------
   -- Name --
   ----------

   function Name (Attribute : in Attribute_Id) return Name_Id is
   begin
      pragma Assert (Attribute in Attributes.First .. Attributes.Last);

      return Attributes.Table (Attribute).Name;
   end Name;

   ----------
   -- Next --
   ----------

   function Next (Attribute : in Attribute_Id) return Attribute_Id is
   begin
      pragma Assert (Attribute in Attributes.First .. Attributes.Last);

      return Attributes.Table (Attribute).Next;
   end Next;

   -----------
   -- Value --
   -----------

   function Value (Attribute : in Attribute_Id) return String_Id is
   begin
      pragma Assert (Attribute in Attributes.First .. Attributes.Last);

      return Attributes.Table (Attribute).Value;
   end Value;

end XML_Tools.Attributes;
