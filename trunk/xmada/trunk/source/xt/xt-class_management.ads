
package Xt.Class_Management is


   function Xt_Class (The_Widget : in Widget) return Widget_Class;

   function Xt_Superclass (The_Widget : in Widget) return Widget_Class;


   function Xt_Is_Subclass (The_Widget       : in Widget;
                            The_Widget_Class : in Widget_Class)
     return Boolean;


   function Xt_Is_Object (The_Widget : in Widget) return Boolean;

   function Xt_Is_Rect_Obj (The_Widget : in Widget) return Boolean;

   function Xt_Is_Widget (The_Widget : in Widget) return Boolean;

   function Xt_Is_Composite (The_Widget : in Widget) return Boolean;

   function Xt_Is_Constraint (The_Widget : in Widget) return Boolean;

   function Xt_Is_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_Override_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_WM_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_Vendor_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_Transient_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_Top_Level_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_Application_Shell (The_Widget : in Widget) return Boolean;

   function Xt_Is_Session_Shell (The_Widget : in Widget) return Boolean;


   procedure Xt_Check_Subclass (The_Widget       : in Widget;
                                The_Widget_Class : in Widget_Class;
                                Message          : in String);


end Xt.Class_Management;
