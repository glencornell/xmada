with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;


package body Xm_Paned_Window is

   function Xm_Create_Managed_Paned_Window
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Paned_Window_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Paned_Window (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Paned_Window;


   function Xm_Create_Paned_Window
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Paned_Window_Widget
   is
      function XmCreatePanedWindow (Parent    : in Widget;
                                    Name      : in char_array;
                                    Arg_List  : in Xt_Arg_List;
                                    Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreatePanedWindow, "XmCreatePanedWindow");
   begin
      return
        XmCreatePanedWindow (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Paned_Window;


end Xm_Paned_Window;
