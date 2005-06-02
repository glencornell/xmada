with Xt;
with Xt.Ancillary_Types;

with Xm;
with Xm_Selection_Box;


package Xm_Command is

   subtype Xm_Command_Widget is Xm_Selection_Box.Xm_Selection_Box_Widget;
   subtype Xm_Command_Class is Xm_Selection_Box.Xm_Selection_Box_Class;

   Xm_Command_Widget_Class : constant Xm_Command_Class;

   --

   function Xm_Create_Command (Parent   : in Xt.Widget;
                               Name     : in String;
                               Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
                                 := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Command_Widget;


   function Xm_Create_Managed_Command
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Command_Widget;

   --

   procedure Xm_Command_Append_Value (The_Widget : in Xm_Command_Widget;
                                      Value      : in Xm.Xm_String);


   procedure Xm_Command_Error (The_Widget : in Xm_Command_Widget;
                               Error      : in Xm.Xm_String);


   procedure Xm_Command_Set_Value (The_Widget : in Xm_Command_Widget;
                                   Value      : in Xm.Xm_String);


   function Xm_Command_Get_Child (The_Widget : in Xm_Command_Widget;
                                  Child      : in Xm.Xm_Dialog_Child_Type)
     return Xt.Widget;


private

   pragma Import (C, Xm_Command_Widget_Class, "xmCommandWidgetClass");

end Xm_Command;
