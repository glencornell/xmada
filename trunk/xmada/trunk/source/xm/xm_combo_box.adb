with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;

with Xm;                      use Xm;
with Xm.Implementation;       use Xm.Implementation;


package body Xm_Combo_Box is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Combo_Box_Add_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Combo_Box_Add_Item (The_Widget : in Widget;
                                    Item       : in Xm_String;
                                    Position   : in Natural := 0;
                                    Unique     : in Boolean := True)
   is
      procedure XmComboBoxAddItem (The_Widget : in Widget;
                                   Item       : in Xm_String;
                                   Position   : in int;
                                   Unique     : in Xt_Boolean);
      pragma Import (C, XmComboBoxAddItem, "XmComboBoxAddItem");
   begin
      Check (The_Widget);

      XmComboBoxAddItem
       (The_Widget, Item, int (Position), To_Xt_Boolean (Unique));
   end Xm_Combo_Box_Add_Item;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Combo_Box_Delete_Pos
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Combo_Box_Delete_Pos (The_Widget : in Widget;
                                      Position   : in Natural := 0)
   is
      procedure XmComboBoxDeletePos (The_Widget : in Widget;
                                     Position   : in int);
      pragma Import (C, XmComboBoxDeletePos, "XmComboBoxDeletePos");
   begin
      Check (The_Widget);
      XmComboBoxDeletePos (The_Widget, int (Position));
   end Xm_Combo_Box_Delete_Pos;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Combo_Box_Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Combo_Box_Select_Item (The_Widget : in Widget;
                                       Item       : in Xm_String)
   is
      procedure XmComboBoxSelectItem (The_Widget : in Widget;
                                      Item       : in Xm_String);
      pragma Import (C, XmComboBoxSelectItem, "XmComboBoxSelectItem");
   begin
      Check (The_Widget);
      XmComboBoxSelectItem (The_Widget, Item);
   end Xm_Combo_Box_Select_Item;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Combo_Box_Set_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Combo_Box_Set_Item (The_Widget : in Widget;
                                    Item       : in Xm_String)
   is
      procedure XmComboBoxSetItem (The_Widget : in Widget;
                                   Item       : in Xm_String);
      pragma Import (C, XmComboBoxSetItem, "XmComboBoxSetItem");
   begin
      Check (The_Widget);
      XmComboBoxSetItem (The_Widget, Item);
   end Xm_Combo_Box_Set_Item;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Combo_Box_Update
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Combo_Box_Update (The_Widget : in Widget) is
      procedure XmComboBoxUpdate (The_Widget : in Widget);
      pragma Import (C, XmComboBoxUpdate, "XmComboBoxUpdate");
   begin
      Check (The_Widget);
      XmComboBoxUpdate (The_Widget);
   end Xm_Combo_Box_Update;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Combo_Box
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Combo_Box (Parent   : in Widget;
                                 Name     : in String;
                                 Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
     return Xm_Combo_Box_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateComboBox (Parent    : in Widget;
                                 Name      : in char_array;
                                 Arg_List  : in Xt_Arg_List;
                                 Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateComboBox, "XmCreateComboBox");
   begin
      return XmCreateComboBox (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Combo_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Drop_Down_Combo_Box
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Drop_Down_Combo_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateDropDownComboBox (Parent    : in Widget;
                                         Name      : in char_array;
                                         Arg_List  : in Xt_Arg_List;
                                         Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateDropDownComboBox, "XmCreateDropDownComboBox");
   begin
      return
        XmCreateDropDownComboBox (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Drop_Down_Combo_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Drop_Down_List
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Drop_Down_List
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateDropDownList (Parent    : in Widget;
                                     Name      : in char_array;
                                     Arg_List  : in Xt_Arg_List;
                                     Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateDropDownList, "XmCreateDropDownList");
   begin
      return XmCreateDropDownList (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Drop_Down_List;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Combo_Box
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Combo_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Combo_Box (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Combo_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Drop_Down_Combo_Box
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Drop_Down_Combo_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Drop_Down_Combo_Box (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Drop_Down_Combo_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Drop_Down_List
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Drop_Down_List
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Drop_Down_List (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Drop_Down_List;


end Xm_Combo_Box;
