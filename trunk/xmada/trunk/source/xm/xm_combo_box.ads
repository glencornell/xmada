with Xt;
with Xt.Ancillary_Types;

with Xm;
with Xm_Manager;


package Xm_Combo_Box is

   subtype Xm_Combo_Box_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Combo_Box_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Combo_Box_Widget_Class : constant Xm_Combo_Box_Class;

   --

   function Xm_Create_Combo_Box (Parent   : in Xt.Widget;
                                 Name     : in String;
                                 Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
                                   := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Combo_Box_Widget;


   function Xm_Create_Drop_Down_Combo_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget;


   function Xm_Create_Drop_Down_List
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget;


   function Xm_Create_Managed_Combo_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget;


   function Xm_Create_Managed_Drop_Down_Combo_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget;


   function Xm_Create_Managed_Drop_Down_List
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Combo_Box_Widget;

   --

   procedure Xm_Combo_Box_Add_Item (The_Widget : in Xt.Widget;
                                    Item       : in Xm.Xm_String;
                                    Position   : in Natural := 0;
                                    Unique     : in Boolean := True);

   procedure Xm_Combo_Box_Delete_Pos (The_Widget : in Xt.Widget;
                                      Position   : in Natural := 0);

   procedure Xm_Combo_Box_Select_Item (The_Widget : in Xt.Widget;
                                       Item       : in Xm.Xm_String);

   procedure Xm_Combo_Box_Set_Item (The_Widget : in Xt.Widget;
                                    Item       : in Xm.Xm_String);

   procedure Xm_Combo_Box_Update (The_Widget : in Xt.Widget);


private

   pragma Import (C, Xm_Combo_Box_Widget_Class, "xmComboBoxWidgetClass");

end Xm_Combo_Box;
