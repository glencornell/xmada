with Xt;
with Xt.Ancillary_Types;

with Xm;
with Xm_Manager;


package Xm_Notebook is

   subtype Xm_Notebook_Widget is Xm_Manager.Xm_Manager_Widget;
   subtype Xm_Notebook_Class is Xm_Manager.Xm_Manager_Class;

   Xm_Notebook_Widget_Class : constant Xm_Notebook_Class;

   --

   --

   function Xm_Create_Notebook (Parent   : in Xt.Widget;
                                Name     : in String;
                                Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
                                  := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Notebook_Widget;


   function Xm_Create_Managed_Notebook
    (Parent   : in Xt.Widget;
     Name     : in String;
     Arg_List : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Xm_Notebook_Widget;

   --

   procedure Xm_Notebook_Get_Page_Info
    (The_Widget  : in     Xm_Notebook_Widget;
     Page_Number : in     Xm.Xm_Notebook_Page_Number;
     Page_Info   :    out Xm.Xm_Notebook_Page_Info;
     Status      :    out Xm.Xm_Notebook_Page_Status);


private

   pragma Import (C, Xm_Notebook_Widget_Class, "xmNotebookWidgetClass");

end Xm_Notebook;
