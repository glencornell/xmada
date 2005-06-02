with Interfaces.C;            use Interfaces.C;

with Xt;                      use Xt;
with Xt.Ancillary_Types;      use Xt.Ancillary_Types;
with Xt.Composite_Management; use Xt.Composite_Management;


package body Xm_Bulletin_Board is


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Bulletin_Board
   --!    <ImplementationNotes> Проверку параметра Parent на нуль значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Bulletin_Board
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Bulletin_Board_Widget
   is
      function XmCreateBulletinBoard (Parent    : in Widget;
                                      Name      : in char_array;
                                      Arg_List  : in Xt_Arg_List;
                                      Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateBulletinBoard, "XmCreateBulletinBoard");
   begin
      return
        XmCreateBulletinBoard (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Bulletin_Board;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Bulletin_Board_Dialog
   --!    <ImplementationNotes> Проверку параметра Parent на нуль значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Bulletin_Board_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Bulletin_Board_Widget
   is
      function XmCreateBulletinBoardDialog (Parent    : in Widget;
                                            Name      : in char_array;
                                            Arg_List  : in Xt_Arg_List;
                                            Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateBulletinBoardDialog,
                     "XmCreateBulletinBoardDialog");
   begin
      return
        XmCreateBulletinBoardDialog (Parent, To_C (Name), Arg_List,
                                     Arg_List'Length);
   end Xm_Create_Bulletin_Board_Dialog;


   function Xm_Create_Managed_Bulletin_Board
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Bulletin_Board_Widget
   is
      Return_Value : Widget;
   begin
      Return_Value := Xm_Create_Bulletin_Board (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Value);
      return Return_Value;
   end Xm_Create_Managed_Bulletin_Board;


end Xm_Bulletin_Board;
