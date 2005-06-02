
package Xlib.Implementation is


   procedure Check (The_Display : in Display);

   procedure Check (The_Screen : in Screen);

   procedure Check (The_GC : in Graphic_Context);


   generic
      type Element         is private;
      type Element_Pointer is access all Element;
      type Element_List    is array (Natural range <>) of aliased Element;
   function Generic_To_Element_List (Pointer : in Element_Pointer;
                                     Length  : in Natural)
     return Element_List;


   generic
      type Element         is private;
      type Element_Pointer is access all Element;
      type Element_List    is array (Natural range <>) of aliased Element;
      Terminator : Element;
   function Generic_Terminated_To_Element_List (Pointer : in Element_Pointer)
     return Element_List;


private

   pragma Inline (Check);

end Xlib.Implementation;
