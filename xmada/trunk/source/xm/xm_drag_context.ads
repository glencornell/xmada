with Xt_Core;


package Xm_Drag_Context is

   subtype Xm_Drag_Context_Widget is Xt_Core.Core_Widget;
   subtype Xm_Drag_Context_Object_Class is Xt_Core.Core_Class;

   Xm_Drag_Context_Class : constant Xm_Drag_Context_Object_Class;


private

   pragma Import (C, Xm_Drag_Context_Class, "xmDragContextClass");

end Xm_Drag_Context;
