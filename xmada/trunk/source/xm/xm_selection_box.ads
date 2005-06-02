with Xt;
with Xt.Ancillary_Types;

with Xm;
with Xm_Bulletin_Board;


package Xm_Selection_Box is

   subtype Xm_Selection_Box_Widget
     is Xm_Bulletin_Board.Xm_Bulletin_Board_Widget;
   subtype Xm_Selection_Box_Class is Xm_Bulletin_Board.Xm_Bulletin_Board_Class;

   Xm_Selection_Box_Widget_Class : constant Xm_Selection_Box_Class;

   --

   function Xm_Create_Selection_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Selection_Box_Widget;


   function Xm_Create_Selection_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Selection_Box_Widget;


   function Xm_Create_Prompt_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Selection_Box_Widget;


   function Xm_Create_Managed_Selection_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Selection_Box_Widget;


   ---------------------------------------------------------------------------
   --  Obsolete and deprecated stuff
   ---------------------------------------------------------------------------

   --  obsolete, instead use Xt_Name_To_Widget
   function Xm_Selection_Box_Get_Child
    (The_Widget : in Xm_Selection_Box_Widget;
     Child      : in Xm.Xm_Child_Type)
       return Xt.Widget;


private

   pragma Import (C, Xm_Selection_Box_Widget_Class,
                  "xmSelectionBoxWidgetClass");

end Xm_Selection_Box;
