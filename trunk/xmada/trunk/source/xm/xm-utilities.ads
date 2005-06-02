with Xlib;
with Xlib.Atoms;
with Xlib.Colors;
with Xt;


package Xm.Utilities is


   type Pixel_Access is access all Xlib.Pixel;
   Null_Pixel_Access : constant Pixel_Access := null;


   procedure Xm_Update_Display (The_Widget : in Xt.Widget);


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Проверка параметра The_Display проводится Xm.
   ---------------------------------------------------------------------------
   function Xm_Get_Xm_Display (The_Display : in Xlib.Display) return Xt.Widget;


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Проверка параметра The_Screen проводится Xm.
   ---------------------------------------------------------------------------
   function Xm_Get_Xm_Screen (The_Screen : in Xlib.Screen) return Xt.Widget;


   function Xm_Get_Atom_Name (The_Display : in Xlib.Display;
                              The_Atom    : in Xlib.Atoms.Atom)
     return String;


   function Xm_Intern_Atom (The_Display    : in Xlib.Display;
                            Atom_Name      : in String;
                            Only_If_Exists : in Boolean := True)
     return Xlib.Atoms.Atom;


   procedure Xm_Change_Color (The_Widget : in Xt.Widget;
                              Background : in Xlib.Pixel);

   procedure Xm_Get_Colors
    (The_Screen    : in Xlib.Screen;
     The_Colormap  : in Xlib.Colors.Colormap;
     Background    : in Xlib.Pixel;
     Foreground    : in Pixel_Access := Null_Pixel_Access;
     Top_Shadow    : in Pixel_Access := Null_Pixel_Access;
     Bottom_Shadow : in Pixel_Access := Null_Pixel_Access;
     Select_Color  : in Pixel_Access := Null_Pixel_Access);


   function Xm_Is_Motif_WM_Running (The_Widget : in Xt.Widget) return Boolean;


   function Xm_Object_At_Point (The_Widget : in Xt.Widget;
                                X          : in Xt.Position;
                                Y          : in Xt.Position)
     return Xt.Widget;


   function Xm_Direction_Match (Direction_1 : in Xm_Direction;
                                Direction_2 : in Xm_Direction)
     return Boolean;


   function Xm_Direction_Match_Partial (Direction_1    : in Xm_Direction;
                                        Direction_2    : in Xm_Direction;
                                        Direction_Mask : in Xm_Direction_Mask)
     return Boolean;


   function Xm_Direction_To_String_Direction (Direction : in Xm_Direction)
     return Xm_String_Direction;


   function Xm_String_Direction_To_Direction
    (Direction : in Xm_String_Direction)
       return Xm_Direction;


   --! <Exceptions>
   --!   Constraint_Error raised when Orientation is Xm_No_Orientation.
   function Xm_Convert_Units (The_Widget     : in Xt.Widget;
                              Orientation    : in Xm_Orientation;
                              From_Unit_Type : in Xm_Unit_Type;
                              From_Value     : in Integer;
                              To_Unit_Type   : in Xm_Unit_Type)
     return Integer;


   function Xm_Cvt_CT_To_Xm_String (Text : in String) return Xm_String;


   function Xm_Cvt_Xm_String_To_CT (The_Xm_String : in Xm_String)
     return String;


   --  !!! Подумать о переносе конверторов в пакет DND или UTM !!!

   function Xm_Cvt_Byte_Stream_To_Xm_String (Property : in String)
     return Xm_String;


   function Xm_Cvt_Xm_String_To_Byte_Stream (The_Xm_String : in Xm_String)
     return String;


   --  Obsolete. Replaced by XmN[vertical/horizontal]FontUnit resource of
   --  XmScreen.
   procedure Xm_Set_Font_Unit (The_Display     : in Xlib.Display;
                               Font_Unit_Value : in Interfaces.C.int);


   --  Obsolete. Replaced by XmN[vertical/horizontal]FontUnit resource of
   --  XmScreen.
   procedure Xm_Set_Font_Units (The_Display : in Xlib.Display;
                                H_Value     : in Interfaces.C.int;
                                V_Value     : in Interfaces.C.int);


--   --  Obsolete. Replaced by Xm_Tracking_Event.
--   function Xm_Tracking_Locate (The_Widget : in Xt.Widget;
--                                The_Cursor : in Xlib.Cursor;
--                                Confine_To : in Boolean)
--     return Xt.Widget;


private

   pragma Import (C, Xm_Direction_To_String_Direction,
                  "XmDirectionToStringDirection");
   pragma Import (C, Xm_Get_Xm_Display, "XmGetXmDisplay");
   pragma Import (C, Xm_Get_Xm_Screen, "XmGetXmScreen");
   pragma Import (C, Xm_String_Direction_To_Direction,
                  "XmStringDirectionToDirection");

   pragma Inline (Xm_Direction_Match);
   pragma Inline (Xm_Direction_Match_Partial);

end Xm.Utilities;
