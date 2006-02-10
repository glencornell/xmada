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
--! <Unit> Model.Widget_Instances_Ordering.
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;

with Model.Tree.Lists;

package body Model.Widget_Instances_Ordering is

   use Model.Tree;
   use Model.Tree.Lists;

   --  Идентификатор виджета в дереве узлов.

   type Widget_Id is new Natural;
   Null_Widget : constant Widget_Id := 0;

   type Widget_Instance is record
      Node   : Node_Id;
   end record;

   type Node_Is_Contained_In_Loop is record
      Widget : Node_Id;
   end record;

   package Loop_In_Graph is
     new GNAT.Table
          (Table_Component_Type => Node_Is_Contained_In_Loop,
           Table_Index_Type     => Natural,
           Table_Low_Bound      => Natural'First + 1,
           Table_Initial        => Allocations.Loop_In_Graph_Table_Initial,
           Table_Increment      => Allocations.Loop_In_Graph_Table_Increment);

   package Widget_Instances is
     new GNAT.Table
          (Table_Component_Type => Widget_Instance,
           Table_Index_Type     => Widget_Id,
           Table_Low_Bound      => Widget_Id'First + 1,
           Table_Initial        => Allocations.Widget_Instances_Table_Initial,
           Table_Increment      =>
             Allocations.Widget_Instances_Table_Increment);

   type Successor_Id is new Natural;
   --  Identification of single successor entry

   No_Successor : constant Successor_Id := 0;
   --  Used to indicate end of list of successors

   --  Successor_Link contains the information for one link
   type Successor_Link is record
      Before : Widget_Id;
      --  Predecessor widget

      After : Widget_Id;
      --  Successor widget

      Next  : Successor_Id;
      --  Next successor on this list
   end record;

   package Links is
     new GNAT.Table
          (Table_Component_Type => Successor_Link,
           Table_Index_Type     => Successor_Id,
           Table_Low_Bound      => Successor_Id'First + 1,
           Table_Initial        => Allocations.Links_Table_Initial,
           Table_Increment      => Allocations.Links_Table_Increment);

   --  A Widget_Node record is built for each active widget

   type Widget_Node_Record is record
      Successors           : Successor_Id;
      --  Pointer to list of links for successor nodes

      Number_Predecessors  : Integer;
      --  Number of predecessors for this widget. Normally non-negative, but
      --  can go negative in the case of widgets chosen by the diagnose error
      --  procedure (when cycles are being removed from the graph).

      Next_No_Predecessors : Widget_Id;
      --  Forward pointer for list of widgets with no predecessors

      Visited              : Boolean;
      --  Used in computing transitive closure for all widgets and
      --  also in locating cycles and paths in the diagnose routines.

      Widget_Position      : Natural;
      --  Initialized to zero. Set non-zero when a widget is chosen and
      --  placed in the right order. The value represents the
      --  ordinal position in the right order.
   end record;

   package Widget_Node is
     new GNAT.Table
          (Table_Component_Type => Widget_Node_Record,
           Table_Index_Type     => Widget_Id,
           Table_Low_Bound      => Widget_Id'First + 1,
           Table_Initial        => Allocations.Widget_Node_Table_Initial,
           Table_Increment      => Allocations.Widget_Node_Table_Increment);

   No_Predecessors : Widget_Id;
   --  Head of list of items with no predecessors

   Number_Left     : Integer;
   --  Number of entries not yet dealt with

   Number_Chosen   : Natural := 0;
   --  Number of widgets chosen in the right order so far

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!   <Unit> Build_Link
   --!   <Purpose>
   --!     Establish a successor link, Before must be treated before After.
   --!   <Exceptions>
   ---------------------------------------------------------------------------
   procedure Build_Link (Before : in Widget_Id; After : in Widget_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!   <Unit> Choose
   --!   <Purpose>
   --!     Chosen is the next entry chosen in the right order. This
   --!     procedure updates all data structures appropriately.
   --!   <Exceptions>
   ---------------------------------------------------------------------------
   procedure Choose (Chosen : in Widget_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!   <Unit> Diagnose_Problem
   --!   <Purpose>
   --!     Called when no right order can be found. Outputs an appropriate
   --!     diagnosis of the problem, and then abandons the building.
   --!   <Exceptions>
   ---------------------------------------------------------------------------
   procedure Diagnose_Problem;

   --------------------------------------------------------------------------
   --! <Subprogram>
   --!   <Unit> Find_Widget_Id
   --!   <Purpose>
   --!   <Exceptions>
   ---------------------------------------------------------------------------
   function Find_Widget_Id (Node : in Node_Id) return Widget_Id;

   --------------------------------------------------------------------------
   --! <Subprogram>
   --!   <Unit> Gather_Dependencies
   --!   <Purpose> Compute dependencies.
   --!   <Exceptions>
   ---------------------------------------------------------------------------
   procedure Gather_Dependencies;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!   <Unit> Initialization
   --!   <Purpose> Building the Links and Widget_Node tables.
   --!   <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialization;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!   <Unit> ReIndexation
   --!   <Purpose> Store the value identifier of Widget.
   --!   <Exceptions>
   ---------------------------------------------------------------------------
   procedure Reindexation (Node : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Build_Link
   --!    <ImplementationNotes>
   --!       Establish a successor link, Before must be treated before After.
   ---------------------------------------------------------------------------
   procedure Build_Link (Before : in Widget_Id; After : in Widget_Id) is
   begin
      Links.Increment_Last;
      Links.Table (Links.Last).Before       := Before;
      Links.Table (Links.Last).Next         :=
        Widget_Node.Table (Before).Successors;
      Links.Table (Links.Last).After        := After;
      Widget_Node.Table (Before).Successors := Links.Last;
      Widget_Node.Table (After).Number_Predecessors :=
        Widget_Node.Table (After).Number_Predecessors + 1;
   end Build_Link;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Choose
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Choose (Chosen : in Widget_Id) is
      Successor : Successor_Id;
      Widget    : Widget_Id;

   begin
      Widget_Instances_Order_Table.Increment_Last;
      Widget_Instances_Order_Table.Table (Widget_Instances_Order_Table.Last) :=
        Widget_Instances.Table (Chosen).Node;

      if No_Predecessors = Chosen then
         No_Predecessors := Widget_Node.Table (Chosen).Next_No_Predecessors;
      end if;

      --  For all successors, decrement the number of predecessors, and
      --  if it becomes zero, then add to no predecessor list.

      Successor := Widget_Node.Table (Chosen).Successors;

      while Successor /= No_Successor loop
         Widget := Links.Table (Successor).After;
         Widget_Node.Table (Widget).Number_Predecessors :=
           Widget_Node.Table (Widget).Number_Predecessors - 1;

         if Widget_Node.Table (Widget).Number_Predecessors = 0 then
            Widget_Node.Table (Widget).Next_No_Predecessors :=
              No_Predecessors;
            No_Predecessors := Widget;
         end if;

         Successor := Links.Table (Successor).Next;
      end loop;

      --  All done, adjust number of widgets left count and set pos

      Number_Left := Number_Left - 1;
      Number_Chosen := Number_Chosen + 1;
      Widget_Node.Table (Chosen).Widget_Position := Number_Chosen;
   end Choose;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Diagnose_Problem
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Diagnose_Problem is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!   <Unit> Find_Path
      --!   <Purpose>
      --!     Recursive routine used to find a path from node Wfrom to node
      --!     Wto. If a path exists, returns True and outputs an appropriate
      --!     set of error messages giving the path. Also calls Choose for
      --!     each of the nodes so that they get removed from the remaining
      --!     set. There is case of call, when Wfrom = Wto for an attempt to
      --!     find a cycle, ML is the minimum acceptable length for a path.
      --!   <Exceptions>
      ------------------------------------------------------------------------
      function Find_Path (Widget_From       : in Widget_Id;
                          Widget_To         : in Widget_Id;
                          Multi_Path_Length : in Natural)
        return Boolean;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Find_Path
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Find_Path (Widget_From       : in Widget_Id;
                          Widget_To         : in Widget_Id;
                          Multi_Path_Length : in Natural)
        return Boolean
      is
         ---------------------------------------------------------------------
         --! <Subprogram>
         --!   <Unit> Find_Link
         --!   <Purpose>
         --!     This is the inner recursive routine, it determines if a path
         --!     exists from W to Wto, and if so returns True and outputs the
         --!     appropriate set of error messages. PL is the path length
         --!   <Exceptions>
         ---------------------------------------------------------------------
         function Find_Link (Widget : in Widget_Id; Path_Length : in Natural)
           return Boolean;

         ---------------------------------------------------------------------
         --! <Subprogram>
         --!    <Unit> Find_Path
         --!    <ImplementationNotes>
         ---------------------------------------------------------------------
         function Find_Link (Widget : in Widget_Id; Path_Length : in Natural)
           return Boolean
         is
            Successor : Successor_Id;

         begin
            --  Recursion ends if we are at terminating node and the path
            --  is sufficiently long, generate error message and return True.

            if Widget = Widget_To
              and then Path_Length >= Multi_Path_Length
            then
               return True;
               --  All done if already visited, otherwise mark as visited

            elsif Widget_Node.Table (Widget).Visited then
               return False;
               --  Otherwise mark as visited and look at all successors

            else
               Widget_Node.Table (Widget).Visited := True;
               Successor := Widget_Node.Table (Widget).Successors;
               Loop_In_Graph.Increment_Last;
               Loop_In_Graph.Table (Loop_In_Graph.Last).Widget :=
                 Widget_Instances.Table (Widget).Node;

               while Successor /= No_Successor loop
                  if Find_Link
                      (Links.Table (Successor).After, Path_Length + 1)
                  then
                     return True;
                  end if;

                  Successor := Links.Table (Successor).Next;
               end loop;

               --  Falling through means this does not lead to a path

               return False;
            end if;
         end Find_Link;

      begin
         --  Initialize all non-chosen nodes to not visisted yet

         for J in Widget_Instances.First .. Widget_Instances.Last loop
            Widget_Node.Table (J).Visited :=
              Widget_Node.Table (J).Widget_Position /= 0;
         end loop;

         --  Now try to find the path

         return Find_Link (Widget_From, 0);
      end Find_Path;

   begin
      for J in Widget_Instances.First .. Widget_Instances.Last loop
         if Widget_Node.Table (J).Widget_Position = 0 then
            if Find_Path (J, J, 1) then
               Loop_In_Graph.Free;
               Widget_Instances.Free;
               Widget_Instances_Order_Table.Free;
               raise Program_Error;
            end if;
         end if;
      end loop;
   end Diagnose_Problem;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Find_Widget_Instances_Order
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Find_Widget_Instances_Order (Root_Node : in Node_Id) is
      Widget     : Widget_Id;
   
   begin

      --  Initialize all structures
      Widget_Instances.Increment_Last;
      Widget_Instances.Table (Widget_Instances.Last).Node   := Root_Node;

      Reindexation (Root_Node);
      Initialization;

      --  Gather dependencies

      Gather_Dependencies;

      --  Initialize the no predecessor list

      No_Predecessors := Null_Widget;

      for J in Widget_Node.First .. Widget_Node.Last loop
         if Widget_Node.Table (J).Number_Predecessors = 0 then
            Widget_Node.Table (J).Next_No_Predecessors := No_Predecessors;
            No_Predecessors := J;
         end if;
      end loop;

      --  OK, now we determine the right order.

      Outer : loop
         --  If there are no nodes with predecessors, then either we are
         --  done, as indicated by Number_Left being set to zero, or we have
         --  a circularity. In the latter case, diagnose the circularity,
         --  removing it from the graph and continue

         if No_Predecessors = Null_Widget then
            exit Outer when Number_Left < 1;
            Diagnose_Problem;
         end if;

         Widget := No_Predecessors;

         --  Loop to choose best entry in No_Predecessors list

         No_Predecessors_Search : loop

         --  This is a candididate to be considered for choice

         if Widget /= Null_Widget
           and then Widget_Node.Table (Widget).Number_Predecessors /= 0
         then
            Widget := Widget_Node.Table (Widget).Next_No_Predecessors;
         end if;

         exit No_Predecessors_Search
           when Widget = Null_Widget
             or else Widget_Node.Table (Widget).Number_Predecessors = 0;
         end loop No_Predecessors_Search;

         --  If no candididate chosen, it means that no widget has
         --  No_Predecessors = 0, but there are widgets left, hence
         --  we have a circular dependency, which we will get
         --  Diagnose_Problem to diagnose it.

         if Widget = Null_Widget then
            exit Outer when Number_Left < 1;
            Diagnose_Problem;

         else
            --  Otherwise choose the best candidate found

            Choose (Widget);
         end if;
      end loop Outer;

      Widget_Instances.Free;
   end Find_Widget_Instances_Order;

   
   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Find_Widget_Id
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Find_Widget_Id (Node : in Node_Id) return Widget_Id
   is
      Widget : Widget_Id;

   begin
      for J in Widget_Instances.First .. Widget_Instances.Last loop
         
         if Node = Widget_Instances.Table (J).Node then
            Widget := J;
         end if;
      end loop;

      return Widget;
   end Find_Widget_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Gather_Dependencies
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Gather_Dependencies is
      Aux     : Node_Id;
      Node    : Node_Id;
      Widget  : Widget_Id;

   begin
      --  Loop through all widgets

      for K in Widget_Instances.First .. Widget_Instances.Last loop
         Node := Widget_Instances.Table(K).Node;

         if Resources (Node) /= Null_List then
            Aux := First (Resources (Node));

            while Aux /= Null_Node loop
               if Node_Kind (Resource_Type (Resource_Specification (Aux)))
                    = Node_Widget_Reference_Resource_Type
               then
                  Widget := Find_Widget_Id (Resource_Value (Aux));
                  Build_Link (Widget, K);
               end if;

               Aux := Next (Aux);
            end loop;
         end if;

         if Constraint_Resources (Node) /= Null_List then
            Aux := First (Constraint_Resources (Node));

            while Aux /= Null_Node loop
               if Node_Kind (Resource_Type (Resource_Specification (Aux)))
                    = Node_Widget_Reference_Resource_Type
               then
                  Widget := Find_Widget_Id (Resource_Value (Aux));
                  Build_Link (Widget, K);
               end if;

               Aux := Next (Aux);
            end loop;
         end if;

         if Children (Node) /= Null_List then
            Aux := First (Children (Node));

            while Aux /= Null_Node loop
               Widget := Find_Widget_Id (Aux);
               Build_Link (K, Widget);
               Aux := Next (Aux);
            end loop;
         end if;
      end loop;
   end Gather_Dependencies;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialization
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialization is
   begin
      Links.Init;
      Number_Left := Integer (Widget_Instances.Last -
                              Widget_Instances.First + 1);

      --  Initialize widget table

      for J in Widget_Instances.First .. Widget_Instances.Last loop
         Widget_Node.Increment_Last;
         Widget_Node.Table (Widget_Node.Last).Successors := No_Successor;
         Widget_Node.Table (Widget_Node.Last).Number_Predecessors  := 0;
         Widget_Node.Table (Widget_Node.Last).Next_No_Predecessors :=
           Null_Widget;
         Widget_Node.Table (Widget_Node.Last).Widget_Position := 0;
      end loop;
   end Initialization;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reindexation
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Reindexation (Node : in Node_Id) is
      Widget : Node_Id;

   begin
      if Children (Node) /= Null_List then
         Widget := First (Children (Node));

         while Widget /= Null_Node loop
            Reindexation (Widget);
            Widget := Next (Widget);
         end loop;
      end if;
   end Reindexation;

end Model.Widget_Instances_Ordering;
