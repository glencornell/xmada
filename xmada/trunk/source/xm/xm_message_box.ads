with Xt;
with Xt.Ancillary_Types;

with Xm;
with Xm_Bulletin_Board;


package Xm_Message_Box is

   subtype Xm_Message_Box_Widget is Xm_Bulletin_Board.Xm_Bulletin_Board_Widget;
   subtype Xm_Message_Box_Class is Xm_Bulletin_Board.Xm_Bulletin_Board_Class;

   Xm_Message_Box_Widget_Class : constant Xm_Message_Box_Class;

   --

   function Xm_Create_Message_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Message_Box_Widget;


   function Xm_Create_Message_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Message_Box_Widget;


   function Xm_Create_Error_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Message_Box_Widget;


   function Xm_Create_Information_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Message_Box_Widget;


   function Xm_Create_Question_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Message_Box_Widget;


   function Xm_Create_Template_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Message_Box_Widget;


   function Xm_Create_Warning_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Message_Box_Widget;


   function Xm_Create_Working_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Message_Box_Widget;


   function Xm_Create_Managed_Message_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Message_Box_Widget;


   ---------------------------------------------------------------------------
   --  Obsolete and deprecated stuff
   ---------------------------------------------------------------------------

   function Xm_Message_Box_Get_Child (The_Widget : in Xm_Message_Box_Widget;
                                      Child      : in Xm.Xm_Dialog_Child_Type)
     return Xt.Widget;


private

   pragma Import (C, Xm_Message_Box_Widget_Class, "xmMessageBoxWidgetClass");

end Xm_Message_Box;
