
package Xt.Composite_Management is


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Проверку параметра Child на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   procedure Xt_Manage_Child (Child : in Widget);


   procedure Xt_Manage_Children (Children : in Widget_List);


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Проверку параметра Child на нуль-значение
   --! производит Xt.
   ---------------------------------------------------------------------------
   procedure Xt_Unmanage_Child (Child : in Widget);


   procedure Xt_Unmanage_Children (Children : in Widget_List);


   function Xt_Is_Managed (W : in Widget) return Boolean;


private

   pragma Import (C, Xt_Manage_Child, "XtManageChild");
   pragma Import (C, Xt_Unmanage_Child, "XtUnmanageChild");

end Xt.Composite_Management;
