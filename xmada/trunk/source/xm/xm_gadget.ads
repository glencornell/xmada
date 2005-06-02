with Xt_Rect_Obj;


package Xm_Gadget is

   subtype Xm_Gadget is Xt_Rect_Obj.Rect_Obj_Widget;
   subtype Xm_Gadget_Object_Class is Xt_Rect_Obj.Rect_Obj_Class;

   Xm_Gadget_Class : constant Xm_Gadget_Object_Class;


private

   pragma Import (C, Xm_Gadget_Class, "xmGadgetClass");

end Xm_Gadget;
