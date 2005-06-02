with Xt;                    use Xt;

with Xm.Implementation;     use Xm.Implementation;


package body Xm.Traversal_Management is


   procedure Xm_Add_Tab_Group (Tab_Group : in Widget) is
      procedure XmAddTabGroup (Tab_Group : in Widget);
      pragma Import (C, XmAddTabGroup, "XmAddTabGroup");
   begin
      Check (Tab_Group);
      XmAddTabGroup (Tab_Group);
   end Xm_Add_Tab_Group;


   function Xm_Get_Focus_Widget (The_Widget : in Widget) return Widget is
      function XmGetFocusWidget (The_Widget : in Widget) return Widget;
      pragma Import (C, XmGetFocusWidget, "XmGetFocusWidget");
   begin
      Check (The_Widget);
      return XmGetFocusWidget (The_Widget);
   end Xm_Get_Focus_Widget;


   function Xm_Get_Tab_Group (The_Widget : in Widget) return Widget is
      function XmGetTabGroup (The_Widget : in Widget) return Widget;
      pragma Import (C, XmGetTabGroup, "XmGetTabGroup");
   begin
      Check (The_Widget);
      return XmGetTabGroup (The_Widget);
   end Xm_Get_Tab_Group;


   function Xm_Is_Traversable (The_Widget : in Widget) return Boolean is
      function XmIsTraversable (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XmIsTraversable, "XmIsTraversable");
   begin
      Check (The_Widget);
      return To_Boolean (XmIsTraversable (The_Widget));
   end Xm_Is_Traversable;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Process_Traversal
   --!    <ImplementationNotes> Параметр The_Widget проверяется на нуль
   --! значение в Xm.
   ---------------------------------------------------------------------------
   function Xm_Process_Traversal (The_Widget : in Widget;
                                  Direction  : in Xm_Traversal_Direction)
     return Boolean
   is
      function XmProcessTraversal (The_Widget : in Widget;
                                   Direction  : in Xm_Traversal_Direction)
        return Xt_Boolean;
      pragma Import (C, XmProcessTraversal, "XmProcessTraversal");
   begin
      return To_Boolean (XmProcessTraversal (The_Widget, Direction));
   end Xm_Process_Traversal;


   procedure Xm_Remove_Tab_Group (Tab_Group : in Widget) is
      procedure XmRemoveTabGroup (Tab_Group : in Widget);
      pragma Import (C, XmRemoveTabGroup, "XmRemoveTabGroup");
   begin
      Check (Tab_Group);
      XmRemoveTabGroup (Tab_Group);
   end Xm_Remove_Tab_Group;


end Xm.Traversal_Management;
