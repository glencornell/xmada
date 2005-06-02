with Xt;
with Xt.Ancillary_Types;

with Xm_Bulletin_Board;


package Xm_Form is

   subtype Xm_Form_Widget is Xm_Bulletin_Board.Xm_Bulletin_Board_Widget;
   subtype Xm_Form_Class is Xm_Bulletin_Board.Xm_Bulletin_Board_Class;

   Xm_Form_Widget_Class : constant Xm_Form_Class;

   --

   --

   function Xm_Create_Form (Parent   : in Xt.Widget;
                            Name     : in String;
                            Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
                              := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Form_Widget;


   function Xm_Create_Managed_Form
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Form_Widget;


   function Xm_Create_Form_Dialog (Parent   : in Xt.Widget;
                                   Name     : in String;
                                   Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
                                     := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Form_Widget;


private

   pragma Import (C, Xm_Form_Widget_Class, "xmFormWidgetClass");

end Xm_Form;
