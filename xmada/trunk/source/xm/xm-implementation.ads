--  This is an internal unit. Don't use it in applications!
with Xlib;
with Xt;
with Xt.Implementation;


package Xm.Implementation is


   type Xm_Callback_Reason_List is
     array (Natural range <>) of Xm_Callback_Reason;


   procedure Check (The_Display : in Xlib.Display)
     renames Xt.Implementation.Check;


   procedure Check (The_Screen : in Xlib.Screen)
     renames Xt.Implementation.Check;


   procedure Check (The_GC : in Xlib.Graphic_Context)
     renames Xt.Implementation.Check;


   procedure Check (The_Widget : in Xt.Widget)
     renames Xt.Implementation.Check;


   procedure Check (The_Render_Table : in Xm_Render_Table);


   generic function Generic_To_Element_List
     renames Xt.Implementation.Generic_To_Element_List;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Generic_To_Callback_Struct_Access_With_Reason
   --!    <Purpose>
   --!    <Exceptions> Interfaces.C.Strings.Dereference_Error
   ---------------------------------------------------------------------------
   generic
      type Callback_Struct is private;
      type Callback_Struct_Access is access Callback_Struct;
      Reason : Xm_Callback_Reason;
   function Generic_To_Callback_Struct_Access_With_Reason
    (Source : in Xt.Xt_Pointer)
       return Callback_Struct_Access;


   generic
      type Callback_Struct is private;
      type Callback_Struct_Access is access Callback_Struct;
      Reasons : Xm_Callback_Reason_List;
   function Generic_To_Callback_Struct_Access_With_Reason_List
    (Source : in Xt.Xt_Pointer)
       return Callback_Struct_Access;


end Xm.Implementation;
