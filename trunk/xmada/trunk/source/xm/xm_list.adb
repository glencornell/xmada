with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;

with Xm;                      use Xm;
with Xm.Implementation;       use Xm.Implementation;


package body Xm_List is


   Null_Xm_List_Position_List : constant Xm_List_Position_List (1 .. 0)
     := (others => 0);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_List
   --!    <ImplementationNotes> Проверка параметра Parent на нуль значение
   --! проводится в Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_List (Parent   : in Widget;
                            Name     : in String;
                            Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
     return Xm_List_Widget
   is
      function XmCreateList (Parent    : in Widget;
                             Name      : in char_array;
                             Arg_List  : in Xt_Arg_List;
                             Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateList, "XmCreateList");
   begin
      return XmCreateList (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_List;


   function Xm_Create_Managed_List
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_List_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_List (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_List;


   function Xm_Create_Managed_Scrolled_List
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_List_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Scrolled_List (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Scrolled_List;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Scrolled_List
   --!    <ImplementationNotes> Проверка параметра Parent на нуль значение
   --! проводится в Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Scrolled_List
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_List_Widget
   is
      function XmCreateScrolledList (Parent    : in Widget;
                                     Name      : in char_array;
                                     Arg_List  : in Xt_Arg_List;
                                     Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateScrolledList, "XmCreateScrolledList");
   begin
      return
        XmCreateScrolledList (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Scrolled_List;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_List_Add_Item
   --!    <ImplementationNotes> Параметр Item может принимать нуль значение.
   ---------------------------------------------------------------------------
   procedure Xm_List_Add_Item (The_Widget : in Xm_List_Widget;
                               Item       : in Xm_String;
                               Position   : in Xm_List_Position_Count := 0)
   is
      procedure XmListAddItem (The_Widget : in Widget;
                               Item       : in Xm_String;
                               Position   : in Xm_List_Position_Count);
      pragma Import (C, XmListAddItem, "XmListAddItem");
   begin
      Check (The_Widget);
      XmListAddItem (The_Widget, Item, Position);
   end Xm_List_Add_Item;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_List_Add_Item_Unselected
   --!    <ImplementationNotes> Параметр Item может принимать нуль значение.
   ---------------------------------------------------------------------------
   procedure Xm_List_Add_Item_Unselected
    (The_Widget : in Xm_List_Widget;
     Item       : in Xm_String;
     Position   : in Xm_List_Position_Count := 0)
   is
      procedure XmListAddItemUnselected
       (The_Widget : in Widget;
        Item       : in Xm_String;
        Position   : in Xm_List_Position_Count);
      pragma Import (C, XmListAddItemUnselected, "XmListAddItemUnselected");
   begin
      Check (The_Widget);
      XmListAddItemUnselected (The_Widget, Item, Position);
   end Xm_List_Add_Item_Unselected;


   procedure Xm_List_Add_Items (The_Widget : in Xm_List_Widget;
                                Items      : in Xm_String_List;
                                Position   : in Xm_List_Position_Count := 0)
   is
      procedure XmListAddItems (The_Widget : in Widget;
                                Items      : in Xm_String_List;
                                Item_Count : in int;
                                Position   : in Xm_List_Position_Count);
      pragma Import (C, XmListAddItems, "XmListAddItems");
   begin
      Check (The_Widget);
      XmListAddItems (The_Widget, Items, Items'Length, Position);
   end Xm_List_Add_Items;


   procedure Xm_List_Add_Items_Unselected
    (The_Widget : in Xm_List_Widget;
     Items      : in Xm_String_List;
     Position   : in Xm_List_Position_Count := 0)
   is
      procedure XmListAddItemsUnselected
       (The_Widget : in Widget;
        Items      : in Xm_String_List;
        Item_Count : in int;
        Position   : in Xm_List_Position_Count);
      pragma Import (C, XmListAddItemsUnselected, "XmListAddItemsUnselected");
   begin
      Check (The_Widget);
      XmListAddItemsUnselected
       (The_Widget, Items, Items'Length, Position);
   end Xm_List_Add_Items_Unselected;


   procedure Xm_List_Delete_All_Items (The_Widget : in Xm_List_Widget) is
      procedure XmListDeleteAllItems (The_Widget : in Widget);
      pragma Import (C, XmListDeleteAllItems, "XmListDeleteAllItems");
   begin
      Check (The_Widget);
      XmListDeleteAllItems (The_Widget);
   end Xm_List_Delete_All_Items;


   procedure Xm_List_Delete_Item (The_Widget : in Xm_List_Widget;
                                  Item       : in Xm_String)
   is
      procedure XmListDeleteItem (The_Widget : in Widget;
                                  Item       : in Xm_String);
      pragma Import (C, XmListDeleteItem, "XmListDeleteItem");
   begin
      Check (The_Widget);
      XmListDeleteItem (The_Widget, Item);
   end Xm_List_Delete_Item;


   procedure Xm_List_Delete_Items (The_Widget : in Xm_List_Widget;
                                   Items      : in Xm_String_List)

   is
      procedure XmListDeleteItems (The_Widget : in Widget;
                                   Items      : in Xm_String_List;
                                   Item_Count : in int);
      pragma Import (C, XmListDeleteItems, "XmListDeleteItems");
   begin
      Check (The_Widget);
      XmListDeleteItems (The_Widget, Items, Items'Length);
   end Xm_List_Delete_Items;


   procedure Xm_List_Delete_Items_Pos (The_Widget : in Xm_List_Widget;
                                       Item_Count : in Xm_List_Position_Count;
                                       Position   : in Xm_List_Position)
   is
      procedure XmListDeleteItemsPos (The_Widget : in Widget;
                                      Item_Count : in Xm_List_Position_Count;
                                      Position   : in Xm_List_Position);
      pragma Import (C, XmListDeleteItemsPos, "XmListDeleteItemsPos");
   begin
      Check (The_Widget);
      XmListDeleteItemsPos (The_Widget, Item_Count, Position);
   end Xm_List_Delete_Items_Pos;


   procedure Xm_List_Delete_Pos (The_Widget : in Xm_List_Widget;
                                 Position   : in Xm_List_Position_Count := 0)
   is
      procedure XmListDeletePos (The_Widget : in Widget;
                                 Position   : in Xm_List_Position_Count);
      pragma Import (C, XmListDeletePos, "XmListDeletePos");
   begin
      Check (The_Widget);
      XmListDeletePos (The_Widget, Position);
   end Xm_List_Delete_Pos;


   procedure Xm_List_Delete_Positions (The_Widget : in Xm_List_Widget;
                                       Positions  : in Xm_List_Position_List)
   is
      procedure XmListDeletePositions
       (The_Widget     : in Widget;
        Position_List  : in Xm_List_Position_List;
        Position_Count : in int);
      pragma Import (C, XmListDeletePositions, "XmListDeletePositions");
   begin
      Check (The_Widget);
      XmListDeletePositions (The_Widget, Positions, Positions'Length);
   end Xm_List_Delete_Positions;


   procedure Xm_List_Deselect_All_Items (The_Widget : in Xm_List_Widget) is
      procedure XmListDeselectAllItems (The_Widget : in Widget);
      pragma Import (C, XmListDeselectAllItems, "XmListDeselectAllItems");
   begin
      Check (The_Widget);
      XmListDeselectAllItems (The_Widget);
   end Xm_List_Deselect_All_Items;


   procedure Xm_List_Deselect_Item (The_Widget : in Xm_List_Widget;
                                    Item       : in Xm_String)
   is
      procedure XmListDeselectItem (The_Widget : in Widget;
                                    Item       : in Xm_String);
      pragma Import (C, XmListDeselectItem, "XmListDeselectItem");
   begin
      Check (The_Widget);
      XmListDeselectItem (The_Widget, Item);
   end Xm_List_Deselect_Item;


   procedure Xm_List_Deselect_Pos (The_Widget : in Xm_List_Widget;
                                   Position   : in Xm_List_Position_Count := 0)
   is
      procedure XmListDeselectPos (The_Widget : in Widget;
                                   Position   : in Xm_List_Position_Count);
      pragma Import (C, XmListDeselectPos, "XmListDeselectPos");
   begin
      Check (The_Widget);
      XmListDeselectPos (The_Widget, Position);
   end Xm_List_Deselect_Pos;


   function Xm_List_Get_Kbd_Item_Pos (The_Widget : in Xm_List_Widget)
     return Xm_List_Position_Count
   is
      function XmListGetKbdItemPos (The_Widget : in Widget)
        return Xm_List_Position_Count;
      pragma Import (C, XmListGetKbdItemPos, "XmListGetKbdItemPos");
   begin
      Check (The_Widget);
      return XmListGetKbdItemPos (The_Widget);
   end Xm_List_Get_Kbd_Item_Pos;


   procedure Xm_List_Get_Match_Pos
    (The_Widget : in     Xm_List_Widget;
     Item       : in     Xm_String;
     Positions  :    out Xm_List_Position_List_Access)
   is
      List  : aliased Xm_List_Position_Pointer;
      Count : aliased int;

      function XmListGetMatchPos
       (The_Widget     : in     Widget;
        Item           : in     Xm_String;
        Position_List  : access Xm_List_Position_Pointer;
        Position_Count : access int)
          return Xt_Boolean;
      pragma Import (C, XmListGetMatchPos, "XmListGetMatchPos");

      procedure XtFree (Item : in Xm_List_Position_Pointer);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget);

      if To_Boolean (XmListGetMatchPos (The_Widget,
                                        Item,
                                        List'Access,
                                        Count'Access))
      then
         Positions :=
           new Xm_List_Position_List'(To_Xm_List_Position_List
                                       (List, Natural (Count)));
         XtFree (List);
      else
         Positions := null;
      end if;
   end Xm_List_Get_Match_Pos;


   function Xm_List_Get_Match_Pos (The_Widget : in Xm_List_Widget;
                                   Item       : in Xm_String)
     return Xm_List_Position_List
   is
      List  : aliased Xm_List_Position_Pointer;
      Count : aliased int;

      function XmListGetMatchPos
       (The_Widget     : in     Widget;
        Item           : in     Xm_String;
        Position_List  : access Xm_List_Position_Pointer;
        Position_Count : access int)
          return Xt_Boolean;
      pragma Import (C, XmListGetMatchPos, "XmListGetMatchPos");

      procedure XtFree (Item : in Xm_List_Position_Pointer);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget);

      if To_Boolean (XmListGetMatchPos (The_Widget,
                                        Item,
                                        List'Access,
                                        Count'Access))
      then
         declare
            Return_Value : constant Xm_List_Position_List
              := To_Xm_List_Position_List (List, Natural (Count));
         begin
            XtFree (List);
            return Return_Value;
         end;
      else
         return Null_Xm_List_Position_List;
      end if;
   end Xm_List_Get_Match_Pos;


   procedure Xm_List_Get_Selected_Pos
    (The_Widget : in     Xm_List_Widget;
     Positions  :    out Xm_List_Position_List_Access)
   is
      List  : aliased Xm_List_Position_Pointer;
      Count : aliased int;

      function XmListGetSelectedPos
       (The_Widget     : in     Widget;
        Position_List  : access Xm_List_Position_Pointer;
        Position_Count : access int)
          return Xt_Boolean;
      pragma Import (C, XmListGetSelectedPos, "XmListGetSelectedPos");

      procedure XtFree (Item : in Xm_List_Position_Pointer);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget);

      if To_Boolean (XmListGetSelectedPos (The_Widget,
                                           List'Access,
                                           Count'Access))
      then
         Positions :=
           new Xm_List_Position_List'(To_Xm_List_Position_List
                                       (List, Natural (Count)));
         XtFree (List);
      else
         Positions := null;
      end if;
   end Xm_List_Get_Selected_Pos;


   function Xm_List_Get_Selected_Pos (The_Widget : in Xm_List_Widget)
     return Xm_List_Position_List
   is
      List  : aliased Xm_List_Position_Pointer;
      Count : aliased int;

      function XmListGetSelectedPos
       (The_Widget     : in     Widget;
        Position_List  : access Xm_List_Position_Pointer;
        Position_Count : access int)
          return Xt_Boolean;
      pragma Import (C, XmListGetSelectedPos, "XmListGetSelectedPos");

      procedure XtFree (Item : in Xm_List_Position_Pointer);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Widget);

      if To_Boolean (XmListGetSelectedPos (The_Widget,
                                           List'Access,
                                           Count'Access))
      then
         declare
            Return_Value : constant Xm_List_Position_List
              := To_Xm_List_Position_List (List, Natural (Count));
         begin
            XtFree (List);
            return Return_Value;
         end;
      else
         return Null_Xm_List_Position_List;
      end if;
   end Xm_List_Get_Selected_Pos;


   function Xm_List_Item_Exists (The_Widget : in Xm_List_Widget;
                                 Item       : in Xm_String)
     return Boolean
   is
      function XmListItemExists (The_Widget : in Widget;
                                 Item       : in Xm_String)
        return Xt_Boolean;
      pragma Import (C, XmListItemExists, "XmListItemExists");
   begin
      Check (The_Widget);

      return To_Boolean (XmListItemExists (The_Widget, Item));
   end Xm_List_Item_Exists;


   function Xm_List_Item_Pos (The_Widget : in Xm_List_Widget;
                              Item       : in Xm_String)
     return Xm_List_Position_Count
   is
      function XmListItemPos (The_Widget : in Widget;
                              Item       : in Xm_String)
        return Xm_List_Position_Count;
      pragma Import (C, XmListItemPos, "XmListItemPos");
   begin
      Check (The_Widget);

      return XmListItemPos (The_Widget, Item);
   end Xm_List_Item_Pos;


   function Xm_List_Pos_Selected (The_Widget : in Xm_List_Widget;
                                  Position   : in Xm_List_Position_Count)
     return Boolean
   is
      function XmListPosSelected (The_Widget : in Widget;
                                  Position   : in Xm_List_Position_Count)
        return Xt_Boolean;
      pragma Import (C, XmListPosSelected, "XmListPosSelected");
   begin
      Check (The_Widget);

      return To_Boolean (XmListPosSelected (The_Widget, Position));
   end Xm_List_Pos_Selected;


   procedure Xm_List_Pos_To_Bounds (The_Widget : in     Xm_List_Widget;
                                    Position   : in     Xm_List_Position_Count;
                                    X          :    out Xt.Position;
                                    Y          :    out Xt.Position;
                                    Width      :    out Dimension;
                                    Height     :    out Dimension;
                                    Visible    :    out Boolean)
   is
      C_X      : aliased Xt.Position;
      C_Y      : aliased Xt.Position;
      C_Width  : aliased Dimension;
      C_Height : aliased Dimension;

      function XmListPosToBounds (The_Widget : in     Widget;
                                  Position   : in     Xm_List_Position_Count;
                                  X          : access Xt.Position;
                                  Y          : access Xt.Position;
                                  Width      : access Xt.Dimension;
                                  Height     : access Xt.Dimension)
        return Xt_Boolean;
      pragma Import (C, XmListPosToBounds, "XmListPosToBounds");
   begin
      Check (The_Widget);

      Visible := To_Boolean (XmListPosToBounds (The_Widget,
                                                Position,
                                                C_X'Access,
                                                C_Y'Access,
                                                C_Width'Access,
                                                C_Height'Access));
      if Visible then
         X      := C_X;
         Y      := C_Y;
         Width  := C_Width;
         Height := C_Height;
      end if;
   end Xm_List_Pos_To_Bounds;


   procedure Xm_List_Replace_Items (The_Widget : in Xm_List_Widget;
                                    Old_Items  : in Xm_String_List;
                                    New_Items  : in Xm_String_List)
   is
      procedure XmListReplaceItems (The_Widget : in Widget;
                                    Old_Items  : in Xm_String_List;
                                    Item_Count : in int;
                                    New_Items  : in Xm_String_List);
      pragma Import (C, XmListReplaceItems, "XmListReplaceItems");
   begin
      Check (The_Widget);

      if Old_Items'Length /= New_Items'Length then
         raise Constraint_Error;
      end if;

      XmListReplaceItems (The_Widget, Old_Items, Old_Items'Length, New_Items);
   end Xm_List_Replace_Items;


   procedure Xm_List_Replace_Items_Pos (The_Widget : in Xm_List_Widget;
                                        New_Items  : in Xm_String_List;
                                        Position   : in Xm_List_Position)
   is
      procedure XmListReplaceItemsPos (The_Widget : in Widget;
                                       New_Items  : in Xm_String_List;
                                       Item_Count : in int;
                                       Position   : in Xm_List_Position);
      pragma Import (C, XmListReplaceItemsPos, "XmListReplaceItemsPos");
   begin
      Check (The_Widget);
      XmListReplaceItemsPos
       (The_Widget, New_Items, New_Items'Length, Position);
   end Xm_List_Replace_Items_Pos;


   procedure Xm_List_Replace_Items_Pos_Unselected
    (The_Widget : in Xm_List_Widget;
     New_Items  : in Xm_String_List;
     Position   : in Xm_List_Position)
   is
      procedure XmListReplaceItemsPosUnselected
       (The_Widget : in Xm_List_Widget;
        New_Items  : in Xm_String_List;
        Item_Count : in int;
        Position   : in Xm_List_Position);
      pragma Import (C, XmListReplaceItemsPosUnselected,
                     "XmListReplaceItemsPosUnselected");
   begin
      Check (The_Widget);
      XmListReplaceItemsPosUnselected
       (The_Widget, New_Items, New_Items'Length, Position);
   end Xm_List_Replace_Items_Pos_Unselected;


   procedure Xm_List_Replace_Items_Unselected (The_Widget : in Xm_List_Widget;
                                               Old_Items  : in Xm_String_List;
                                               New_Items  : in Xm_String_List)
   is
      procedure XmListReplaceItemsUnselected (The_Widget : in Widget;
                                              Old_Items  : in Xm_String_List;
                                              Item_Count : in int;
                                              New_Items  : in Xm_String_List);
      pragma Import (C, XmListReplaceItemsUnselected,
                     "XmListReplaceItemsUnselected");
   begin
      Check (The_Widget);

      if Old_Items'Length /= New_Items'Length then
         raise Constraint_Error;
      end if;

      XmListReplaceItemsUnselected
       (The_Widget, Old_Items, Old_Items'Length, New_Items);
   end Xm_List_Replace_Items_Unselected;


   procedure Xm_List_Replace_Positions
    (The_Widget    : in Xm_List_Widget;
     Position_List : in Xm_List_Position_List;
     Item_List     : in Xm_String_List)
   is
      procedure XmListReplacePositions
       (The_Widget    : in Widget;
        Position_List : in Xm_List_Position_List;
        Item_List     : in Xm_String_List;
        Item_Count    : in int);
      pragma Import (C, XmListReplacePositions, "XmListReplacePositions");
   begin
      Check (The_Widget);

      if Position_List'Length /= Item_List'Length then
         raise Constraint_Error;
      end if;

      XmListReplacePositions
       (The_Widget, Position_List, Item_List, Item_List'Length);
   end Xm_List_Replace_Positions;


   procedure Xm_List_Select_Item (The_Widget : in Xm_List_Widget;
                                  Item       : in Xm_String;
                                  Notify     : in Boolean := True)
   is
      procedure XmListSelectItem (The_Widget : in Widget;
                                  Item       : in Xm_String;
                                  Notify     : in Xt_Boolean);
      pragma Import (C, XmListSelectItem, "XmListSelectItem");
   begin
      Check (The_Widget);

      XmListSelectItem (The_Widget, Item, To_Xt_Boolean (Notify));
   end Xm_List_Select_Item;


   procedure Xm_List_Select_Pos (The_Widget : in Xm_List_Widget;
                                 Position   : in Xm_List_Position;
                                 Notify     : in Boolean := True)
   is
      procedure XmListSelectPos (The_Widget : in Widget;
                                 Position   : in Xm_List_Position;
                                 Notify     : in Xt_Boolean);
      pragma Import (C, XmListSelectPos, "XmListSelectPos");
   begin
      Check (The_Widget);

      XmListSelectPos (The_Widget, Position, To_Xt_Boolean (Notify));
   end Xm_List_Select_Pos;


   procedure Xm_List_Set_Add_Mode (The_Widget : in Xm_List_Widget;
                                   State      : in Boolean)
   is
      procedure XmListSetAddMode (The_Widget : in Widget;
                                  State      : in Xt_Boolean);
      pragma Import (C, XmListSetAddMode, "XmListSetAddMode");
   begin
      Check (The_Widget);

      XmListSetAddMode (The_Widget, To_Xt_Boolean (State));
   end Xm_List_Set_Add_Mode;


   procedure Xm_List_Set_Bottom_Item (The_Widget : in Xm_List_Widget;
                                      Item       : in Xm_String)
   is
      procedure XmListSetBottomItem (The_Widget : in Widget;
                                     Item       : in Xm_String);
      pragma Import (C, XmListSetBottomItem, "XmListSetBottomItem");
   begin
      Check (The_Widget);

      XmListSetBottomItem (The_Widget, Item);
   end Xm_List_Set_Bottom_Item;


   procedure Xm_List_Set_Bottom_Pos (The_Widget : in Xm_List_Widget;
                                     Position   : in Xm_List_Position_Count)
   is
      procedure XmListSetBottomPos (The_Widget : in Widget;
                                    Position   : in Xm_List_Position_Count);
      pragma Import (C, XmListSetBottomPos, "XmListSetBottomPos");
   begin
      Check (The_Widget);

      XmListSetBottomPos (The_Widget, Position);
   end Xm_List_Set_Bottom_Pos;


   procedure Xm_List_Set_Horiz_Pos (The_Widget : in Xm_List_Widget;
                                    Position   : in Xt.Position)
   is
      procedure XmListSetHorizPos (The_Widget : in Widget;
                                   Position   : in int);
      pragma Import (C, XmListSetHorizPos, "XmListSetHorizPos");
   begin
      Check (The_Widget);

      XmListSetHorizPos (The_Widget, int (Position));
   end Xm_List_Set_Horiz_Pos;


   procedure Xm_List_Set_Item (The_Widget : in Xm_List_Widget;
                               Item       : in Xm.Xm_String)
   is
      procedure XmListSetItem (The_Widget : in Widget;
                               Item       : in Xm_String);
      pragma Import (C, XmListSetItem, "XmListSetItem");
   begin
      Check (The_Widget);

      XmListSetItem (The_Widget, Item);
   end Xm_List_Set_Item;


   procedure Xm_List_Set_Kbd_Item_Pos (The_Widget : in Xm_List_Widget;
                                       Position   : in Xm_List_Position_Count)
   is
      procedure XmListSetKbdItemPos (The_Widget : in Widget;
                                     Position   : in Xm_List_Position_Count);
      pragma Import (C, XmListSetKbdItemPos, "XmListSetKbdItemPos");
   begin
      Check (The_Widget);

      XmListSetKbdItemPos (The_Widget, Position);
   end Xm_List_Set_Kbd_Item_Pos;


   procedure Xm_List_Set_Pos (The_Widget : in Xm_List_Widget;
                              Position   : in Xm_List_Position_Count)
   is
      procedure XmListSetPos (The_Widget : in Widget;
                              Position   : in Xm_List_Position_Count);
      pragma Import (C, XmListSetPos, "XmListSetPos");
   begin
      Check (The_Widget);

      XmListSetPos (The_Widget, Position);
   end Xm_List_Set_Pos;


   procedure Xm_List_Update_Selected_List (The_Widget : in Xm_List_Widget) is
      procedure XmListUpdateSelectedList (The_Widget : in Widget);
      pragma Import (C, XmListUpdateSelectedList, "XmListUpdateSelectedList");
   begin
      Check (The_Widget);

      XmListUpdateSelectedList (The_Widget);
   end Xm_List_Update_Selected_List;


   function Xm_List_Y_To_Pos (The_Widget : in Xm_List_Widget;
                              Y          : in Position)
     return Xm_List_Position_Count
   is
      function XmListYToPos (The_Widget : in Widget;
                             Y          : in Position)
        return Xm_List_Position_Count;
      pragma Import (C, XmListYToPos, "XmListYToPos");
   begin
      Check (The_Widget);

      return XmListYToPos (The_Widget, Y);
   end Xm_List_Y_To_Pos;


end Xm_List;
