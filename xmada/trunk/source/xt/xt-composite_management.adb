with Xt.Implementation; use Xt.Implementation;


package body Xt.Composite_Management is


   function Xt_Is_Managed (W : in Widget) return Boolean is
      function XtIsManaged (W : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsManaged, "XtIsManaged");
   begin
      Check (W);
      return To_Boolean (XtIsManaged (W));
   end Xt_Is_Managed;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Manage_Children
   --!    <ImplementationNotes> Элементы списка проверяются на нуль-значение
   --! в Xt.
   ---------------------------------------------------------------------------
   procedure Xt_Manage_Children (Children : in Widget_List) is
      procedure XtManageChildren (Children     : in Widget_List;
                                  Num_Children : in Cardinal);
      pragma Import (C, XtManageChildren, "XtManageChildren");
   begin
      XtManageChildren (Children, Children'Length);
   end Xt_Manage_Children;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Unmanage_Children
   --!    <ImplementationNotes> Элементы списка проверяются на нуль-значение
   --! в Xt.
   ---------------------------------------------------------------------------
   procedure Xt_Unmanage_Children (Children : in Widget_List) is
      procedure XtUnmanageChildren (Children     : in Widget_List;
                                    Num_Children : in Cardinal);
      pragma Import (C, XtUnmanageChildren, "XtUnmanageChildren");
   begin
      XtUnmanageChildren (Children, Children'Length);
   end Xt_Unmanage_Children;


end Xt.Composite_Management;
