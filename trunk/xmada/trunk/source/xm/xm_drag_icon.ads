with Xt_Object;


package Xm_Drag_Icon is

   subtype Xm_Drag_Icon_Widget is Xt_Object.Object_Widget;
   subtype Xm_Drag_Icon_Class is Xt_Object.Object_Class;

   Xm_Drag_Icon_Object_Class : constant Xm_Drag_Icon_Class;


private

   pragma Import (C, Xm_Drag_Icon_Object_Class, "xmDragIconObjectClass");

end Xm_Drag_Icon;
