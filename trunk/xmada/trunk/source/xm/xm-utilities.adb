with Interfaces.C;          use Interfaces.C;
with Interfaces.C.Strings;  use Interfaces.C.Strings;

with Xlib;                  use Xlib;
with Xlib.Atoms;            use Xlib.Atoms;
with Xlib.Colors;           use Xlib.Colors;
with Xt;                    use Xt;

with Xm.Implementation;     use Xm.Implementation;


package body Xm.Utilities is


   procedure Xm_Change_Color (The_Widget : in Widget;
                              Background : in Pixel)
   is
      procedure XmChangeColor (The_Widget : in Widget;
                               Background : in Pixel);
      pragma Import (C, XmChangeColor, "XmChangeColor");
   begin
      Check (The_Widget);
      XmChangeColor (The_Widget, Background);
   end Xm_Change_Color;


   function Xm_Convert_Units (The_Widget     : in Widget;
                              Orientation    : in Xm_Orientation;
                              From_Unit_Type : in Xm_Unit_Type;
                              From_Value     : in Integer;
                              To_Unit_Type   : in Xm_Unit_Type)
     return Integer
   is
      function XmConvertUnits (The_Widget     : in Widget;
                               Orientation    : in Xm_Orientation;
                               From_Unit_Type : in Xm_Unit_Type;
                               From_Value     : in int;
                               To_Unit_Type   : in Xm_Unit_Type)
         return int;
      pragma Import (C, XmConvertUnits, "XmConvertUnits");
   begin
      Check (The_Widget);
      if Orientation /= Xm_Horizontal and Orientation /= Xm_Vertical then
         raise Constraint_Error;
      end if;

      return Integer (XmConvertUnits (The_Widget,
                                      Orientation,
                                      From_Unit_Type,
                                      int (From_Value),
                                      To_Unit_Type));
   end Xm_Convert_Units;


   function Xm_Cvt_Byte_Stream_To_Xm_String (Property : in String)
     return Xm_String
   is
      function XmCvtByteStreamToXmString (Property : in char_array)
        return Xm_String;
      pragma Import (C, XmCvtByteStreamToXmString,
                     "XmCvtByteStreamToXmString");
   begin
      return XmCvtByteStreamToXmString (To_C (Property));
   end Xm_Cvt_Byte_Stream_To_Xm_String;


   function Xm_Cvt_CT_To_Xm_String (Text : in String) return Xm_String is
      function XmCvtCTToXmString (Text : in char_array) return Xm_String;
      pragma Import (C, XmCvtCTToXmString, "XmCvtCTToXmString");
   begin
      return XmCvtCTToXmString (To_C (Text));
   end Xm_Cvt_CT_To_Xm_String;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Cvt_Xm_String_To_Byte_Stream
   --!    <ImplementationNotes> проверка The_Xm_String на нуль значение
   --! осуществляется в Xm.
   ---------------------------------------------------------------------------
   function Xm_Cvt_Xm_String_To_Byte_Stream (The_Xm_String : in Xm_String)
     return String
   is
      Property : aliased chars_ptr := Null_Ptr;
      Length   : unsigned;

      function XmCvtXmStringToByteStream (The_Xm_String : in     Xm_String;
                                          Prop_Return   : access chars_ptr)
        return unsigned;
      pragma Import (C, XmCvtXmStringToByteStream,
                     "XmCvtXmStringToByteStream");

      procedure XtFree (X : in chars_ptr);
      pragma Import (C, XtFree, "XtFree");
   begin
      Length := XmCvtXmStringToByteStream (The_Xm_String, Property'Access);

      if Length = 0 then
         return "";
      else
         declare
            Return_Value : constant String
              := Value (Property, size_t (Length));
         begin
            XtFree (Property);
            return Return_Value;
         end;
      end if;
   end Xm_Cvt_Xm_String_To_Byte_Stream;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Cvt_Xm_String_To_CT
   --!    <ImplementationNotes> проверка The_Xm_String на нуль значение
   --! осуществляется в Xm.
   ---------------------------------------------------------------------------
   function Xm_Cvt_Xm_String_To_CT (The_Xm_String : in Xm_String)
     return String
   is
      C : chars_ptr;

      function XmCvtXmStringToCT (The_Xm_String : in Xm_String)
        return chars_ptr;
      pragma Import (C, XmCvtXmStringToCT, "XmCvtXmStringToCT");

      procedure XtFree (X : in chars_ptr);
      pragma Import (C, XtFree, "XtFree");
   begin
      C := XmCvtXmStringToCT (The_Xm_String);

      if C = Null_Ptr then
         return "";
      else
         declare
            Return_Value : constant String := Value (C);
         begin
            XtFree (C);
            return Return_Value;
         end;
      end if;
   end Xm_Cvt_Xm_String_To_CT;


   function Xm_Direction_Match (Direction_1 : in Xm_Direction;
                                Direction_2 : in Xm_Direction)
     return Boolean
   is
      function XmDirectionMatch (Direction_1 : in Xm_Direction;
                                 Direction_2 : in Xm_Direction)
        return Xt_Boolean;
      pragma Import (C, XmDirectionMatch, "XmDirectionMatch");
   begin
      return To_Boolean (XmDirectionMatch (Direction_1, Direction_2));
   end Xm_Direction_Match;


   function Xm_Direction_Match_Partial (Direction_1    : in Xm_Direction;
                                        Direction_2    : in Xm_Direction;
                                        Direction_Mask : in Xm_Direction_Mask)
     return Boolean
   is
      function XmDirectionMatchPartial (Direction_1    : in Xm_Direction;
                                        Direction_2    : in Xm_Direction;
                                        Direction_Mask : in Xm_Direction_Mask)
        return Xt_Boolean;
      pragma Import (C, XmDirectionMatchPartial, "XmDirectionMatchPartial");
   begin
      return
        To_Boolean
         (XmDirectionMatchPartial (Direction_1, Direction_2, Direction_Mask));
   end Xm_Direction_Match_Partial;


   function Xm_Get_Atom_Name (The_Display : in Display;
                              The_Atom    : in Atom)
     return String
   is
      C_Return : chars_ptr;

      function XmGetAtomName (The_Display : in Display;
                              The_Atom    : in Atom)
        return chars_ptr;
      pragma Import (C, XmGetAtomName, "XmGetAtomName");

      procedure XtFree (Item : in chars_ptr);
      pragma Import (C, XtFree, "XtFree");
   begin
      Check (The_Display);
      C_Return := XmGetAtomName (The_Display, The_Atom);

      if C_Return = Null_Ptr then
         return "";
      end if;

      declare
         Return_String : constant String := Value (C_Return);
      begin
         XtFree (C_Return);
         return Return_String;
      end;
   end Xm_Get_Atom_Name;


   procedure Xm_Get_Colors
    (The_Screen    : in Screen;
     The_Colormap  : in Colormap;
     Background    : in Pixel;
     Foreground    : in Pixel_Access := Null_Pixel_Access;
     Top_Shadow    : in Pixel_Access := Null_Pixel_Access;
     Bottom_Shadow : in Pixel_Access := Null_Pixel_Access;
     Select_Color  : in Pixel_Access := Null_Pixel_Access)
   is
      procedure XmGetColors (The_Screen    : in Screen;
                             The_Colormap  : in Colormap;
                             Background    : in Pixel;
                             Foreground    : in Pixel_Access;
                             Top_Shadow    : in Pixel_Access;
                             Bottom_Shadow : in Pixel_Access;
                             Select_Color  : in Pixel_Access);
      pragma Import (C, XmGetColors, "XmGetColors");
   begin
      Check (The_Screen);
      XmGetColors (The_Screen, The_Colormap, Background, Foreground,
                   Top_Shadow, Bottom_Shadow, Select_Color);
   end Xm_Get_Colors;


   function Xm_Intern_Atom (The_Display    : in Display;
                            Atom_Name      : in String;
                            Only_If_Exists : in Boolean := True)
     return Atom
   is
      C_Atom_Name : constant char_array := To_C (Atom_Name);

      function XmInternAtom (The_Display    : in Display;
                             Atom_Name      : in char_array;
                             Only_If_Exists : in Xt_Boolean)
        return Atom;
      pragma Import (C, XmInternAtom, "XmInternAtom");
   begin
      Check (The_Display);
      return XmInternAtom (The_Display, C_Atom_Name,
                           To_Xt_Boolean (Only_If_Exists));
   end Xm_Intern_Atom;


   function Xm_Is_Motif_WM_Running (The_Widget : in Widget) return Boolean is
      function XmIsMotifWMRunning (The_Widget : in Widget) return Xt_Boolean;
      pragma Import (C, XmIsMotifWMRunning, "XmIsMotifWMRunning");
   begin
      Check (The_Widget);
      return To_Boolean (XmIsMotifWMRunning (The_Widget));
   end Xm_Is_Motif_WM_Running;


   function Xm_Object_At_Point (The_Widget : in Widget;
                                X          : in Position;
                                Y          : in Position)
     return Widget
   is
      function XmObjectAtPoint (The_Widget : in Widget;
                                X          : in Position;
                                Y          : in Position)
        return Widget;
      pragma Import (C, XmObjectAtPoint, "XmObjectAtPoint");
   begin
      Check (The_Widget);
      return XmObjectAtPoint (The_Widget, X, Y);
   end Xm_Object_At_Point;


   procedure Xm_Set_Font_Unit (The_Display     : in Xlib.Display;
                               Font_Unit_Value : in int)
   is
      procedure XmSetFontUnit (The_Display     : in Xlib.Display;
                               Font_Unit_Value : in int);
      pragma Import (C, XmSetFontUnit, "XmSetFontUnit");
   begin
      Check (The_Display);
      XmSetFontUnit (The_Display, Font_Unit_Value);
   end Xm_Set_Font_Unit;


   procedure Xm_Set_Font_Units (The_Display : in Xlib.Display;
                                H_Value     : in int;
                                V_Value     : in int)
   is
      procedure XmSetFontUnits (The_Display : in Xlib.Display;
                                H_Value     : in int;
                                V_Value     : in int);
      pragma Import (C, XmSetFontUnits, "XmSetFontUnits");
   begin
      Check (The_Display);
      XmSetFontUnits (The_Display, H_Value, V_Value);
   end Xm_Set_Font_Units;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Update_Display
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Update_Display (The_Widget : in Widget) is
      procedure XmUpdateDisplay (The_Widget : in Widget);
      pragma Import (C, XmUpdateDisplay, "XmUpdateDisplay");
   begin
      Check (The_Widget);
      XmUpdateDisplay (The_Widget);
   end Xm_Update_Display;


end Xm.Utilities;
