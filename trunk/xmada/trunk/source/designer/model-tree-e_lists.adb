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
--! XmAda maintained by TechnoServ A/S (email: vgodunko@rostel.ru)
--!
--! <Unit> Model.Tree.E_Lists
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision: 407 $ $Author: dibala $
--  $Date: 2006-02-26 14:04:02 +0000 (Вск, 26 Фев 2006) $
------------------------------------------------------------------------------
with GNAT.Table;

with Model.Allocations;

package body Model.Tree.E_Lists is

   type Elist_Header is record
      First : Elmt_Id;
      Last  : Elmt_Id;
   end record;

   package Elists is new GNAT.Table (
     Table_Component_Type => Elist_Header,
     Table_Index_Type     => Elist_Id,
     Table_Low_Bound      => Elist_Id'First + 1,
     Table_Initial        => Allocations.EList_Table_Initial,
     Table_Increment      => Allocations.EList_Table_Increment);

   type Elmt_Item is record
      Node : Node_Id;
      Next : Elmt_Id;
   end record;

   package Elmts is new GNAT.Table (
     Table_Component_Type => Elmt_Item,
     Table_Index_Type     => Elmt_Id,
     Table_Low_Bound      => Elmt_Id'First + 1,
     Table_Initial        => Allocations.Elmts_Table_Initial,
     Table_Increment      => Allocations.Elmts_Table_Increment);

   ------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Append_Elmt
   --!    <ImplementationNotes>
   ------------------------------------------------------------------------
   procedure Append_Elmt (Node : in Node_Id; To : in Elist_Id) is
      L : constant Elmt_Id := Elists.Table (To).Last;

   begin
      Elmts.Increment_Last;
      Elmts.Table (Elmts.Last).Node := Node;
      Elmts.Table (Elmts.Last).Next := Null_Elmt;

      if L = Null_Elmt then
         Elists.Table (To).First := Elmts.Last;

      else
         Elmts.Table (L).Next := Elmts.Last;
      end if;

      Elists.Table (To).Last  := Elmts.Last;
   end Append_Elmt;

   ------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Elmt_To_Node
   --!    <ImplementationNotes>
   ------------------------------------------------------------------------
   function Elmt_To_Node (Elmt : in Elmt_Id) return Node_Id is
   begin
      if Elmt = Null_Elmt then
         return Null_Node;

      else
         return Elmts.Table (Elmt).Node;
      end if;
   end Elmt_To_Node;

   ------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> First_Elmt
   --!    <ImplementationNotes>
   ------------------------------------------------------------------------
   function First_Elmt (List : in Elist_Id) return Elmt_Id is
   begin
      pragma Assert (List > Null_Elist);

      return Elists.Table (List).First;
   end First_Elmt;

   ------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Last_Elmt
   --!    <ImplementationNotes>
   ------------------------------------------------------------------------
   function Last_Elmt (List : in Elist_Id) return Elmt_Id is
   begin
      return Elists.Table (List).Last;
   end Last_Elmt;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Length
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Length (List : in Elist_Id) return Natural is
      Current : Elmt_Id := First_Elmt (List);
      Count   : Natural := 0;

   begin
      while Current /= Null_Elmt loop
         Current := Next_Elmt (Current);
         Count := Count + 1;
      end loop;

      return Count;
   end Length;

   ------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> New_Elmt_List
   --!    <ImplementationNotes>
   ------------------------------------------------------------------------
   function New_Elmt_List return Elist_Id is
   begin
      Elists.Increment_Last;
      Elists.Table (Elists.Last).First := Null_Elmt;
      Elists.Table (Elists.Last).Last  := Null_Elmt;

      return Elists.Last;
   end New_Elmt_List;

   ------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Next_Elmt
   --!    <ImplementationNotes>
   ------------------------------------------------------------------------
   function Next_Elmt (Elmt : in Elmt_Id) return Elmt_Id is
   begin
      return Elmts.Table (Elmt).Next;
   end Next_Elmt;

   ------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Remove_Elmt
   --!    <ImplementationNotes>
   ------------------------------------------------------------------------
   procedure Remove_Elmt (List : in Elist_Id; Elmt : in Elmt_Id) is
      Nxt : Elmt_Id;
      Prv : Elmt_Id;

   begin
      Nxt := Elists.Table (List).First;

      --  Case of removing only element in the list

      if Nxt = Elists.Table (List).Last then

         pragma Assert (Nxt = Elmt);

         Elists.Table (List).First := Null_Elmt;
         Elists.Table (List).Last  := Null_Elmt;

      --  Case of removing the first element in the list

      elsif Nxt = Elmt then
         Elists.Table (List).First := Elmt_Id (Elmts.Table (Nxt).Next);

      --  Case of removing second or later element in the list

      else
         loop
            Prv := Nxt;
            Nxt := Elmt_Id (Elmts.Table (Prv).Next);
            exit when Nxt = Elmt
              or else Elmts.Table (Nxt).Next = Null_Elmt;
         end loop;

         pragma Assert (Nxt = Elmt);

         Elmts.Table (Prv).Next := Elmts.Table (Nxt).Next;

         if Elmts.Table (Prv).Next =  Null_Elmt then
            Elists.Table (List).Last := Prv;
         end if;
      end if;
   end Remove_Elmt;

   ------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Replace_Elmt
   --!    <ImplementationNotes>
   ------------------------------------------------------------------------
   procedure Replace_Elmt (Elmt : in Elmt_Id; New_Node : in Node_Id) is
   begin
      Elmts.Table (Elmt).Node := New_Node;
   end Replace_Elmt;

end Model.Tree.E_Lists;
