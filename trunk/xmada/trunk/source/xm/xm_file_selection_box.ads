with Xt;
with Xt.Ancillary_Types;

with Xm;
with Xm_Selection_Box;


package Xm_File_Selection_Box is

   subtype Xm_File_Selection_Box_Widget is
     Xm_Selection_Box.Xm_Selection_Box_Widget;
   subtype Xm_File_Selection_Box_Class is
     Xm_Selection_Box.Xm_Selection_Box_Class;

   Xm_File_Selection_Box_Widget_Class : constant Xm_File_Selection_Box_Class;

   --

   function Xm_Create_File_Selection_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_File_Selection_Box_Widget;


   function Xm_Create_File_Selection_Dialog
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_File_Selection_Box_Widget;


   function Xm_Create_Managed_File_Selection_Box
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_File_Selection_Box_Widget;

   --

   procedure Xm_File_Selection_Do_Search
    (The_Widget : in Xm_File_Selection_Box_Widget;
     Dir_Mask   : in Xm.Xm_String);


   ---------------------------------------------------------------------------
   --  Obsolete and deprecated stuff
   ---------------------------------------------------------------------------

   function Xm_File_Selection_Box_Get_Child
    (The_Widget : in Xm_File_Selection_Box_Widget;
     Child      : in Xm.Xm_Dialog_Child_Type)
       return Xt.Widget;


private

   pragma Import (C, Xm_File_Selection_Box_Widget_Class,
                  "xmFileSelectionBoxWidgetClass");

end Xm_File_Selection_Box;
