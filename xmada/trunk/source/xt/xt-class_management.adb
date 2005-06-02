with Xt.Implementation; use Xt.Implementation;


package body Xt.Class_Management is


   procedure Xt_Check_Subclass (The_Widget       : in Widget;
                                The_Widget_Class : in Widget_Class;
                                Message          : in String)
   is
      pragma Unreferenced (The_Widget);
      pragma Unreferenced (The_Widget_Class);
      pragma Unreferenced (Message);
   begin
      null;  -- nothing in non-debug mode.
   end Xt_Check_Subclass;


   function Xt_Class (The_Widget : in Widget) return Widget_Class is
      function XtClass (The_Widget : in Widget) return Widget_Class;
      pragma Import (C, XtClass, "XtClass");
   begin
      Check (The_Widget);
      return XtClass (The_Widget);
   end Xt_Class;


   function Xt_Is_Application_Shell (The_Widget : in Widget) return Boolean is
      function XtIsApplicationShell (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsApplicationShell, "XtIsApplicationShell");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsApplicationShell (The_Widget));
   end Xt_Is_Application_Shell;


   function Xt_Is_Composite (The_Widget : in Widget) return Boolean is
      function XtIsComposite (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsComposite, "XtIsComposite");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsComposite (The_Widget));
   end Xt_Is_Composite;


   function Xt_Is_Constraint (The_Widget : in Widget) return Boolean is
      function XtIsConstraint (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsConstraint, "XtIsConstraint");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsConstraint (The_Widget));
   end Xt_Is_Constraint;


   function Xt_Is_Object (The_Widget : in Widget) return Boolean is
      function XtIsObject (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsObject, "XtIsObject");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsObject (The_Widget));
   end Xt_Is_Object;


   function Xt_Is_Override_Shell (The_Widget : in Widget) return Boolean is
      function XtIsOverrideShell (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsOverrideShell, "XtIsOverrideShell");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsOverrideShell (The_Widget));
   end Xt_Is_Override_Shell;


   function Xt_Is_Rect_Obj (The_Widget : in Widget) return Boolean is
      function XtIsRectObj (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsRectObj, "XtIsRectObj");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsRectObj (The_Widget));
   end Xt_Is_Rect_Obj;


   function Xt_Is_Session_Shell (The_Widget : in Widget) return Boolean is
      function XtIsSessionShell (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsSessionShell, "XtIsSessionShell");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsSessionShell (The_Widget));
   end Xt_Is_Session_Shell;


   function Xt_Is_Shell (The_Widget : in Widget) return Boolean is
      function XtIsShell (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsShell, "XtIsShell");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsShell (The_Widget));
   end Xt_Is_Shell;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Is_Subclass
   --!    <ImplementationNotes> Параметр The_Widget_Class проверяется на
   --! нуль-значение в Xt.
   ---------------------------------------------------------------------------
   function Xt_Is_Subclass (The_Widget       : in Widget;
                            The_Widget_Class : in Widget_Class)
     return Boolean
   is
      function XtIsSubclass (The_Widget       : in Widget;
                             The_Widget_Class : in Widget_Class)
        return Xt_Boolean;
      pragma Import (C, XtIsSubclass, "XtIsSubclass");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsSubclass (The_Widget, The_Widget_Class));
   end Xt_Is_Subclass;


   function Xt_Is_Top_Level_Shell (The_Widget : in Widget) return Boolean is
      function XtIsTopLevelShell (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsTopLevelShell, "XtIsTopLevelShell");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsTopLevelShell (The_Widget));
   end Xt_Is_Top_Level_Shell;


   function Xt_Is_Transient_Shell (The_Widget : in Widget) return Boolean is
      function XtIsTransientShell (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsTransientShell, "XtIsTransientShell");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsTransientShell (The_Widget));
   end Xt_Is_Transient_Shell;


   function Xt_Is_Vendor_Shell (The_Widget : in Widget) return Boolean is
      function XtIsVendorShell (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsVendorShell, "XtIsVendorShell");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsVendorShell (The_Widget));
   end Xt_Is_Vendor_Shell;


   function Xt_Is_Widget (The_Widget : in Widget) return Boolean is
      function XtIsWidget (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsWidget, "XtIsWidget");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsWidget (The_Widget));
   end Xt_Is_Widget;


   function Xt_Is_WM_Shell (The_Widget : in Widget) return Boolean is
      function XtIsWMShell (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsWMShell, "XtIsWMShell");
   begin
      Check (The_Widget);
      return To_Boolean (XtIsWMShell (The_Widget));
   end Xt_Is_WM_Shell;


   function Xt_Superclass (The_Widget : in Widget) return Widget_Class is
      function XtSuperclass (The_Widget : in Widget) return Widget_Class;
      pragma Import (C, XtSuperclass, "XtSuperclass");
   begin
      Check (The_Widget);
      return XtSuperclass (The_Widget);
   end Xt_Superclass;


end Xt.Class_Management;
