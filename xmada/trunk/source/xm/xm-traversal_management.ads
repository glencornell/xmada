
package Xm.Traversal_Management is


   function Xm_Get_Tab_Group (The_Widget : in Xt.Widget) return Xt.Widget;


   function Xm_Get_Focus_Widget (The_Widget : in Xt.Widget) return Xt.Widget;


   function Xm_Is_Traversable (The_Widget : in Xt.Widget) return Boolean;


   function Xm_Process_Traversal (The_Widget : in Xt.Widget;
                                  Direction  : in Xm_Traversal_Direction)
     return Boolean;


   ---------------------------------------------------------------------------
   --  Obsolete and deprecated
   ---------------------------------------------------------------------------

   procedure Xm_Add_Tab_Group (Tab_Group : in Xt.Widget);

   procedure Xm_Remove_Tab_Group (Tab_Group : in Xt.Widget);


end Xm.Traversal_Management;
