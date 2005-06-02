with Xt_Object;

package Xt_Rect_Obj is

   subtype Rect_Obj_Widget is Xt_Object.Object_Widget;
   subtype Rect_Obj_Class is Xt_Object.Object_Class;

   Rect_Obj_Widget_Class : constant Rect_Obj_Class;


private

   pragma Import (C, Rect_Obj_Widget_Class, "rectObjClass");

end Xt_Rect_Obj;
