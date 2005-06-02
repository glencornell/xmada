with Xt;
with Xt.Ancillary_Types;

with Xm_Manager;


package Xm_Bulletin_Board is

   subtype Xm_Bulletin_Board_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Bulletin_Board_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Bulletin_Board_Widget_Class : constant Xm_Bulletin_Board_Class;

   --

   function Xm_Create_Bulletin_Board
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Bulletin_Board_Widget;


   function Xm_Create_Bulletin_Board_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Bulletin_Board_Widget;


   function Xm_Create_Managed_Bulletin_Board
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Bulletin_Board_Widget;


private

   pragma Import (C, Xm_Bulletin_Board_Widget_Class,
                  "xmBulletinBoardWidgetClass");

end Xm_Bulletin_Board;
