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
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;

with XML_Tools.Allocation;

package body XML_Tools.Elements is

   type Element_Record (Kind : Element_Kinds := A_Tag) is record
      Next   : Element_Id;
      Parent : Element_Id;

      case Kind is
         when A_Tag =>
            Name      : Name_Id;
            Attribute : Attribute_Id;
            Child     : Element_Id;

         when A_String =>
            Value     : String_Id;
      end case;
   end record;

   package Elements is
     new GNAT.Table (Table_Component_Type => Element_Record,
                     Table_Index_Type     => Element_Id,
                     Table_Low_Bound      => Element_Id'First + 1,
                     Table_Initial        => Allocation.Elements_Initial,
                     Table_Increment      => Allocation.Elements_Increment);

   ---------------
   -- Attribute --
   ---------------

   function Attribute (Element : in Element_Id) return Attribute_Id is
   begin
      pragma Assert (Element in Elements.First .. Elements.Last);
      pragma Assert (Elements.Table (Element).Kind = A_Tag);

      return Elements.Table (Element).Attribute;
   end Attribute;

   -----------
   -- Child --
   -----------

   function Child (Element : in Element_Id) return Element_Id is
   begin
      pragma Assert (Element in Elements.First .. Elements.Last);
      pragma Assert (Elements.Table (Element).Kind = A_Tag);

      return Elements.Table (Element).Child;
   end Child;

   -------------------
   -- Create_String --
   -------------------

   procedure Create_String (Parent : in Element_Id;
                            Value  : in String_Id)
   is
   begin
      pragma Assert (Parent in Elements.First .. Elements.Last);
      pragma Assert (Elements.Table (Parent).Kind = A_Tag);

      if Elements.Table (Parent).Child = Null_Element_Id then
         Elements.Append
          ((Kind   => A_String,
            Parent => Parent,
            Value  => Value,
            Next   => Null_Element_Id));

         Elements.Table (Parent).Child := Elements.Last;

      else
         raise Program_Error;
      end if;
   end Create_String;

   ----------------
   -- Create_Tag --
   ----------------

   function Create_Tag (Parent : in Element_Id;
                        Name   : in Name_Id)
     return Element_Id
   is
   begin
      pragma Assert (Parent in Null_Element_Id .. Elements.Last);
      pragma Assert (Parent = Null_Element_Id
                       or else Elements.Table (Parent).Kind = A_Tag);

      Elements.Append
       ((Kind      => A_Tag,
         Parent    => Parent,
         Name      => Name,
         Attribute => Null_Attribute_Id,
         Child     => Null_Element_Id,
         Next      => Null_Element_Id));

      if Parent = Null_Element_Id then
         null;

      elsif Elements.Table (Parent).Child = Null_Element_Id then
         Elements.Table (Parent).Child := Elements.Last;

      else
         declare
            Aux : Element_Id := Elements.Table (Parent).Child;

         begin
            while Elements.Table (Aux).Next /= Null_Element_Id loop
               Aux := Elements.Table (Aux).Next;
            end loop;

            Elements.Table (Aux).Next := Elements.Last;
         end;
      end if;

      return Elements.Last;
   end Create_Tag;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      Elements.Init;
   end Initialize;

   ----------
   -- Kind --
   ----------

   function Kind (Element : in Element_Id) return Element_Kinds is
   begin
      pragma Assert (Element in Elements.First .. Elements.Last);

      return Elements.Table (Element).Kind;
   end Kind;

   ----------
   -- Name --
   ----------

   function Name (Element : in Element_Id) return Name_Id is
   begin
      pragma Assert (Element in Elements.First .. Elements.Last);
      pragma Assert (Elements.Table (Element).Kind = A_Tag);

      return Elements.Table (Element).Name;
   end Name;

   ----------
   -- Next --
   ----------

   function Next (Element : in Element_Id) return Element_Id is
   begin
      pragma Assert (Element in Elements.First .. Elements.Last);

      return Elements.Table (Element).Next;
   end Next;

   -------------------
   -- Set_Attribute --
   -------------------

   procedure Set_Attribute (Element : in Element_Id;
                            Value   : in Attribute_Id)
   is
   begin
      pragma Assert (Element in Elements.First .. Elements.Last);
      pragma Assert (Elements.Table (Element).Kind = A_Tag);

      Elements.Table (Element).Attribute := Value;
   end Set_Attribute;

   -----------
   -- Value --
   -----------

   function Value (Element : in Element_Id) return String_Id is
   begin
      pragma Assert (Element in Elements.First .. Elements.Last);
      pragma Assert (Elements.Table (Element).Kind = A_String);

      return Elements.Table (Element).Value;
   end Value;

end XML_Tools.Elements;
