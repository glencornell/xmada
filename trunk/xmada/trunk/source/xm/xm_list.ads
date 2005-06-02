with Xt;
with Xt.Ancillary_Types;

with Xm;
with Xm_Primitive;


package Xm_List is

   subtype Xm_List_Widget is Xm_Primitive.Xm_Primitive_Widget;
   subtype Xm_List_Class is Xm_Primitive.Xm_Primitive_Class;

   Xm_List_Widget_Class : constant Xm_List_Class;

   --

   function Xm_Create_List
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_List_Widget;


   function Xm_Create_Scrolled_List
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_List_Widget;


   function Xm_Create_Managed_List
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_List_Widget;


   function Xm_Create_Managed_Scrolled_List
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_List_Widget;

   --

   procedure Xm_List_Add_Item (The_Widget : in Xm_List_Widget;
                               Item       : in Xm.Xm_String;
                               Position   : in Xm.Xm_List_Position_Count := 0);


   procedure Xm_List_Add_Item_Unselected
    (The_Widget : in Xm_List_Widget;
     Item       : in Xm.Xm_String;
     Position   : in Xm.Xm_List_Position_Count := 0);


   procedure Xm_List_Add_Items
    (The_Widget : in Xm_List_Widget;
     Items      : in Xm.Xm_String_List;
     Position   : in Xm.Xm_List_Position_Count := 0);


   procedure Xm_List_Add_Items_Unselected
    (The_Widget : in Xm_List_Widget;
     Items      : in Xm.Xm_String_List;
     Position   : in Xm.Xm_List_Position_Count := 0);


   procedure Xm_List_Delete_All_Items (The_Widget : in Xm_List_Widget);


   procedure Xm_List_Delete_Item (The_Widget : in Xm_List_Widget;
                                  Item       : in Xm.Xm_String);


   procedure Xm_List_Delete_Items (The_Widget : in Xm_List_Widget;
                                   Items      : in Xm.Xm_String_List);


   procedure Xm_List_Delete_Items_Pos
    (The_Widget : in Xm_List_Widget;
     Item_Count : in Xm.Xm_List_Position_Count;
     Position   : in Xm.Xm_List_Position);


   procedure Xm_List_Delete_Pos
    (The_Widget : in Xm_List_Widget;
     Position   : in Xm.Xm_List_Position_Count := 0);


   procedure Xm_List_Delete_Positions
    (The_Widget : in Xm_List_Widget;
     Positions  : in Xm.Xm_List_Position_List);


   procedure Xm_List_Deselect_All_Items (The_Widget : in Xm_List_Widget);


   procedure Xm_List_Deselect_Item (The_Widget : in Xm_List_Widget;
                                    Item       : in Xm.Xm_String);


   procedure Xm_List_Deselect_Pos
    (The_Widget : in Xm_List_Widget;
     Position   : in Xm.Xm_List_Position_Count := 0);


   function Xm_List_Get_Kbd_Item_Pos (The_Widget : in Xm_List_Widget)
     return Xm.Xm_List_Position_Count;


   procedure Xm_List_Get_Match_Pos
    (The_Widget : in     Xm_List_Widget;
     Item       : in     Xm.Xm_String;
     Positions  :    out Xm.Xm_List_Position_List_Access);


   procedure Xm_List_Get_Selected_Pos
    (The_Widget : in     Xm_List_Widget;
     Positions  :    out Xm.Xm_List_Position_List_Access);


   function Xm_List_Item_Exists (The_Widget : in Xm_List_Widget;
                                 Item       : in Xm.Xm_String)
     return Boolean;


   function Xm_List_Item_Pos (The_Widget : in Xm_List_Widget;
                              Item       : in Xm.Xm_String)
     return Xm.Xm_List_Position_Count;


   function Xm_List_Pos_Selected (The_Widget : in Xm_List_Widget;
                                  Position   : in Xm.Xm_List_Position_Count)
     return Boolean;


   procedure Xm_List_Pos_To_Bounds
    (The_Widget : in     Xm_List_Widget;
     Position   : in     Xm.Xm_List_Position_Count;
     X          :    out Xt.Position;
     Y          :    out Xt.Position;
     Width      :    out Xt.Dimension;
     Height     :    out Xt.Dimension;
     Visible    :    out Boolean);


   --  raise Constraint_Error if Old_Items'Lenght /= New_Items'Length.
   procedure Xm_List_Replace_Items (The_Widget : in Xm_List_Widget;
                                    Old_Items  : in Xm.Xm_String_List;
                                    New_Items  : in Xm.Xm_String_List);


   --  raise Constraint_Error if Old_Items'Lenght /= New_Items'Length.
   procedure Xm_List_Replace_Items_Unselected
    (The_Widget : in Xm_List_Widget;
     Old_Items  : in Xm.Xm_String_List;
     New_Items  : in Xm.Xm_String_List);


   procedure Xm_List_Replace_Items_Pos (The_Widget : in Xm_List_Widget;
                                        New_Items  : in Xm.Xm_String_List;
                                        Position   : in Xm.Xm_List_Position);


   procedure Xm_List_Replace_Items_Pos_Unselected
    (The_Widget : in Xm_List_Widget;
     New_Items  : in Xm.Xm_String_List;
     Position   : in Xm.Xm_List_Position);


   --  raise Constraint_Error if Position_List'Lenght /= Item_List'Length.
   procedure Xm_List_Replace_Positions
    (The_Widget    : in Xm_List_Widget;
     Position_List : in Xm.Xm_List_Position_List;
     Item_List     : in Xm.Xm_String_List);


   procedure Xm_List_Select_Item (The_Widget : in Xm_List_Widget;
                                  Item       : in Xm.Xm_String;
                                  Notify     : in Boolean := True);


   procedure Xm_List_Select_Pos (The_Widget : in Xm_List_Widget;
                                 Position   : in Xm.Xm_List_Position;
                                 Notify     : in Boolean := True);


   procedure Xm_List_Set_Add_Mode (The_Widget : in Xm_List_Widget;
                                   State      : in Boolean);


   procedure Xm_List_Set_Item (The_Widget : in Xm_List_Widget;
                               Item       : in Xm.Xm_String);


   procedure Xm_List_Set_Pos (The_Widget : in Xm_List_Widget;
                              Position   : in Xm.Xm_List_Position_Count);


   procedure Xm_List_Set_Bottom_Item (The_Widget : in Xm_List_Widget;
                                      Item       : in Xm.Xm_String);


   procedure Xm_List_Set_Bottom_Pos
    (The_Widget : in Xm_List_Widget;
     Position   : in Xm.Xm_List_Position_Count);


   procedure Xm_List_Set_Horiz_Pos (The_Widget : in Xm_List_Widget;
                                    Position   : in Xt.Position);


   procedure Xm_List_Set_Kbd_Item_Pos
    (The_Widget : in Xm_List_Widget;
     Position   : in Xm.Xm_List_Position_Count);


   procedure Xm_List_Update_Selected_List (The_Widget : in Xm_List_Widget);


   function Xm_List_Y_To_Pos (The_Widget : in Xm_List_Widget;
                              Y          : in Xt.Position)
     return Xm.Xm_List_Position_Count;


   --  Additional functional form.
   function Xm_List_Get_Match_Pos (The_Widget : in Xm_List_Widget;
                                   Item       : in Xm.Xm_String)
     return Xm.Xm_List_Position_List;


   --  Additional functional form.
   function Xm_List_Get_Selected_Pos (The_Widget : in Xm_List_Widget)
     return Xm.Xm_List_Position_List;


private

   pragma Import (C, Xm_List_Widget_Class, "xmListWidgetClass");

end Xm_List;
