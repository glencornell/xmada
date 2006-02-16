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
--! <Unit> Model.Tree.Lists
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;

with Model.Allocations;

package body Model.Tree.Lists is

   type List_Record is record
      Parent : Node_Id;
      First  : Node_Id;
      Last   : Node_Id;
   end record;

   package List_Table is
     new GNAT.Table
          (Table_Component_Type => List_Record,
           Table_Index_Type     => List_Id,
           Table_Low_Bound      => List_Id'First + 1,
           Table_Initial        => Allocations.List_Table_Initial,
           Table_Increment      => Allocations.List_Table_Increment);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Append
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Append (List : in List_Id; Node : in Node_Id) is
   begin
      pragma Assert (List in List_Table.First .. List_Table.Last);
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);

      if List_Table.Table (List).First = Null_Node then
         Node_Table.Table (Node).List     := List;
         Node_Table.Table (Node).Previous := Null_Node;
         Node_Table.Table (Node).Next     := Null_Node;

         List_Table.Table (List).First := Node;
         List_Table.Table (List).Last  := Node;

      else
         Node_Table.Table (Node).List     := List;
         Node_Table.Table (Node).Previous := List_Table.Table (List).Last;
         Node_Table.Table (Node).Next     := Null_Node;

         Node_Table.Table (List_Table.Table (List).Last).Next := Node;

         List_Table.Table (List).Last := Node;

      end if;
   end Append;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> First
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function First (List : in List_Id) return Node_Id is
   begin
      pragma Assert (List in List_Table.First .. List_Table.Last);

      return List_Table.Table (List).First;
   end First;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Before
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Before (Before : in Node_Id; Node : in Node_Id) is
      pragma Assert (Before in Node_Table.First .. Node_Table.Last);

      List : constant List_Id := Node_Table.Table (Before).List;

   begin
      if Before = List_Table.Table (List).First then
         Node_Table.Table (List_Table.Table (List).First).Previous := Node;
         Node_Table.Table (Node).Next := List_Table.Table (List).First;
         Node_Table.Table (Node).List := List;

         List_Table.Table (List).First := Node;

      else
         Node_Table.Table (Node_Table.Table (Before).Previous).Next := Node;
         Node_Table.Table (Node).Previous :=
           Node_Table.Table (Before).Previous;
         Node_Table.Table (Node).List := List;
         Node_Table.Table (Node).Next := Before;
         Node_Table.Table (Before).Previous := Node;
      end if;
   end Insert_Before;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Length
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Length (List : in List_Id) return Natural is
      Current : Node_Id := First (List);
      Count   : Natural := 0;

   begin
      while Current /= Null_Node loop
         Current := Next (Current);
         Count := Count + 1;
      end loop;

      return Count;
   end Length;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> New_List
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function New_List return List_Id is
   begin
      List_Table.Append ((Parent => Null_Node,
                          First  => Null_Node,
                          Last   => Null_Node));

      return List_Table.Last;
   end New_List;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Next
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Next (Node : in Node_Id) return Node_Id is
   begin
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);

      return Node_Table.Table (Node).Next;
   end Next;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Parent_Node
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Parent_Node (List : in List_Id) return Node_Id is
   begin
      pragma Assert (List in List_Table.First .. List_Table.Last);

      return List_Table.Table (List).Parent;
   end Parent_Node;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Remove
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Remove (Node : in Node_Id) is
      pragma Assert (Node in Node_Table.First .. Node_Table.Last);
      pragma Assert (Node_Table.Table (Node).List
                       in List_Table.First .. List_Table.Last);

      List : constant List_Id := Node_Table.Table (Node).List;

   begin
      if Node_Table.Table (Node).Previous = Null_Node then
         List_Table.Table (List).First := Node_Table.Table (Node).Next;

      else
         Node_Table.Table (Node_Table.Table (Node).Previous).Next :=
           Node_Table.Table (Node).Next;
      end if;

      if Node_Table.Table (Node).Next = Null_Node then
         List_Table.Table (List).Last := Node_Table.Table (Node).Previous;

      else
         Node_Table.Table (Node_Table.Table (Node).Next).Previous :=
           Node_Table.Table (Node).Previous;
      end if;

      Node_Table.Table (Node).List     := Null_List;
      Node_Table.Table (Node).Previous := Null_Node;
      Node_Table.Table (Node).Next     := Null_Node;
   end Remove;

   --------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Parent_Node
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Parent_Node (List : in List_Id; Value : in Node_Id) is
   begin
      pragma Assert (List in List_Table.First .. List_Table.Last);

       List_Table.Table (List).Parent := Value;
   end Set_Parent_Node;

end Model.Tree.Lists;
