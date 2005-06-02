with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;

with Xm.Implementation;       use Xm.Implementation;


package body Xm_Row_Column is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Menu_Bar
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Menu_Bar
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Menu_Bar (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Menu_Bar;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Option_Menu
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Option_Menu
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Option_Menu (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Option_Menu;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Radio_Box
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Radio_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Radio_Box (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Radio_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Row_Column
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Row_Column
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Row_Column (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Row_Column;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Simple_Check_Box
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Simple_Check_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Simple_Check_Box (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);

      return Return_Value;
   end Xm_Create_Managed_Simple_Check_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Simple_Menu_Bar
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Simple_Menu_Bar
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Simple_Menu_Bar (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);

      return Return_Value;
   end Xm_Create_Managed_Simple_Menu_Bar;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Simple_Option_Menu
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Simple_Option_Menu
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Simple_Option_Menu (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);

      return Return_Value;
   end Xm_Create_Managed_Simple_Option_Menu;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Simple_Radio_Box
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Simple_Radio_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Simple_Radio_Box (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);

      return Return_Value;
   end Xm_Create_Managed_Simple_Radio_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Managed_Work_Area
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Create_Managed_Work_Area
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Work_Area (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Work_Area;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Menu_Bar
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Menu_Bar (Parent   : in Widget;
                                Name     : in String;
                                Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
     return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateMenuBar (Parent    : in Widget;
                                Name      : in char_array;
                                Arg_List  : in Xt_Arg_List;
                                Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateMenuBar, "XmCreateMenuBar");
   begin
      return XmCreateMenuBar (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Menu_Bar;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Option_Menu
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Option_Menu
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateOptionMenu (Parent    : in Widget;
                                   Name      : in char_array;
                                   Arg_List  : in Xt_Arg_List;
                                   Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateOptionMenu, "XmCreateOptionMenu");
   begin
      return XmCreateOptionMenu (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Option_Menu;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Popup_Menu
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Popup_Menu (Parent   : in Widget;
                                Name     : in String;
                                Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
     return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreatePopupMenu (Parent    : in Widget;
                                  Name      : in char_array;
                                  Arg_List  : in Xt_Arg_List;
                                  Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreatePopupMenu, "XmCreatePopupMenu");
   begin
      return XmCreatePopupMenu (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Popup_Menu;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Pulldown_Menu
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Pulldown_Menu
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreatePulldownMenu (Parent    : in Widget;
                                     Name      : in char_array;
                                     Arg_List  : in Xt_Arg_List;
                                     Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreatePulldownMenu, "XmCreatePulldownMenu");
   begin
      return XmCreatePulldownMenu (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Pulldown_Menu;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Radio_Box
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Radio_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateRadioBox (Parent    : in Widget;
                                 Name      : in char_array;
                                 Arg_List  : in Xt_Arg_List;
                                 Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateRadioBox, "XmCreateRadioBox");
   begin
      return XmCreateRadioBox (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Radio_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Row_Column
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Row_Column
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateRowColumn (Parent    : in Widget;
                                  Name      : in char_array;
                                  Arg_List  : in Xt_Arg_List;
                                  Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateRowColumn, "XmCreateRowColumn");
   begin
      return XmCreateRowColumn (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Row_Column;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Simple_Check_Box
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Simple_Check_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateSimpleCheckBox (Parent    : in Widget;
                                       Name      : in char_array;
                                       Arg_List  : in Xt_Arg_List;
                                       Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateSimpleCheckBox, "XmCreateSimpleCheckBox");
   begin
      return
        XmCreateSimpleCheckBox (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Simple_Check_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Simple_Menu_Bar
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Simple_Menu_Bar
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateSimpleMenuBar (Parent    : in Widget;
                                      Name      : in char_array;
                                      Arg_List  : in Xt_Arg_List;
                                      Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateSimpleMenuBar, "XmCreateSimpleMenuBar");
   begin
      return
        XmCreateSimpleMenuBar (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Simple_Menu_Bar;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Simple_Option_Menu
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Simple_Option_Menu
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateSimpleOptionMenu (Parent    : in Widget;
                                         Name      : in char_array;
                                         Arg_List  : in Xt_Arg_List;
                                         Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateSimpleOptionMenu, "XmCreateSimpleOptionMenu");
   begin
      return
        XmCreateSimpleOptionMenu (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Simple_Option_Menu;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Simple_Popup_Menu
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Simple_Popup_Menu
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateSimplePopupMenu (Parent    : in Widget;
                                        Name      : in char_array;
                                        Arg_List  : in Xt_Arg_List;
                                        Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateSimplePopupMenu, "XmCreateSimplePopupMenu");
   begin
      return
        XmCreateSimplePopupMenu (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Simple_Popup_Menu;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Simple_Pulldown_Menu
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Simple_Pulldown_Menu
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateSimplePulldownMenu (Parent    : in Widget;
                                        Name      : in char_array;
                                        Arg_List  : in Xt_Arg_List;
                                        Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateSimplePulldownMenu,
                     "XmCreateSimplePulldownMenu");
   begin
      return
        XmCreateSimplePulldownMenu (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Simple_Pulldown_Menu;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Simple_Radio_Box
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Simple_Radio_Box
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateSimpleRadioBox (Parent    : in Widget;
                                       Name      : in char_array;
                                       Arg_List  : in Xt_Arg_List;
                                       Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateSimpleRadioBox, "XmCreateSimpleRadioBox");
   begin
      return
        XmCreateSimpleRadioBox (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Simple_Radio_Box;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Work_Area
   --!    <ImplementationNotes> Проверку Null_Widget проводит Xt с выводом
   --!  соответствующего сообщения.
   ---------------------------------------------------------------------------
   function Xm_Create_Work_Area
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Row_Column_Widget
   is
      C_Name : constant char_array := To_C (Name);

      function XmCreateWorkArea (Parent    : in Widget;
                                 Name      : in char_array;
                                 Arg_List  : in Xt_Arg_List;
                                 Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateWorkArea, "XmCreateWorkArea");
   begin
      return XmCreateWorkArea (Parent, C_Name, Arg_List, Arg_List'Length);
   end Xm_Create_Work_Area;


   function Xm_Option_Button_Gadget (Option_Menu : in Xm_Row_Column_Widget)
     return Widget
   is
      function XmOptionButtonGadget (Option_Menu : in Widget) return Widget;
      pragma Import (C, XmOptionButtonGadget, "XmOptionButtonGadget");
   begin
      Check (Option_Menu);
      return XmOptionButtonGadget (Option_Menu);
   end Xm_Option_Button_Gadget;


   function Xm_Option_Label_Gadget (Option_Menu : in Xm_Row_Column_Widget)
     return Widget
   is
      function XmOptionLabelGadget (Option_Menu : in Widget) return Widget;
      pragma Import (C, XmOptionLabelGadget, "XmOptionLabelGadget");
   begin
      Check (Option_Menu);
      return XmOptionLabelGadget (Option_Menu);
   end Xm_Option_Label_Gadget;


end Xm_Row_Column;
