-- See COPYRIGHT, DISTRIBUTION, and DISCLAIMER notices at end of this file.

with X_Lib;
with Xm;
with Xt;

with UNCHECKED_CONVERSION;

package Uil_Utilities is

    gb_hanzi     : constant Xm.Xm_String_Char_Set :=
        "GB2312.1980-0" & ASCII.NUL;
    gb_hanzi_gr  : constant Xm.Xm_String_Char_Set :=
        "GB2312.1980-1" & ASCII.NUL;
    iso_arabic   : constant Xm.Xm_String_Char_Set :=
        "ISO8859-6" & ASCII.NUL;
    iso_cyrillic : constant Xm.Xm_String_Char_Set :=
        "ISO8859-5" & ASCII.NUL;
    iso_greek    : constant Xm.Xm_String_Char_Set :=
        "ISO8859-7" & ASCII.NUL;
    iso_hebrew   : constant Xm.Xm_String_Char_Set :=
        "ISO8859-8" & ASCII.NUL;
    iso_hebrew_lr: constant Xm.Xm_String_Char_Set :=
        "ISO8859-8" & ASCII.NUL;
    ISO_Latin1   : constant Xm.Xm_String_Char_Set :=
        "ISO8859-1" & ASCII.NUL;
    ISO_Latin2   : constant Xm.Xm_String_Char_Set :=
        "ISO8859-2" & ASCII.NUL;
    ISO_Latin3   : constant Xm.Xm_String_Char_Set :=
        "ISO8859-3" & ASCII.NUL;
    ISO_Latin4   : constant Xm.Xm_String_Char_Set :=
        "ISO8859-4" & ASCII.NUL;
    ISO_Latin5   : constant Xm.Xm_String_Char_Set :=
        "ISO8859-9" & ASCII.NUL;
    jis_kanji    : constant Xm.Xm_String_Char_Set :=
        "JISX0208.1983-0" & ASCII.NUL;
    jis_kanji_gr : constant Xm.Xm_String_Char_Set :=
        "JISX0208.1983-1" & ASCII.NUL;
    jis_katakana : constant Xm.Xm_String_Char_Set :=
        "JISX0201.1976-0" & ASCII.NUL;
    ksc_hangul   : constant Xm.Xm_String_Char_Set :=
        "KSC5601.1987-0" & ASCII.NUL;
    ksc_hangul_gr: constant Xm.Xm_String_Char_Set :=
        "KSC5601.1987-1" & ASCII.NUL;
    ksc_korean   : constant Xm.Xm_String_Char_Set :=
        "KSC_KOREAN" & ASCII.NUL;
    locale_charset : constant Xm.Xm_String_Char_Set :=
        "LOCALE_CHARSET" & ASCII.NUL;

--    function To_Xt_Arg_Val (Ch : in CHARACTER)
--        return Xt.Xt_Ancillary_Types.Xt_Arg_Val;

    function To_Xt_Pointer is new
        UNCHECKED_CONVERSION (Xt.Xt_String, Xt.Xt_Pointer);

    function To_Xt_Pointer is new
        UNCHECKED_CONVERSION (Integer, Xt.Xt_Pointer);

    function To_Xt_Pointer is new
        UNCHECKED_CONVERSION (Xt.Xt_Pointer, Xt.Xt_Pointer);

-- FIND in Xm_.ada
--    function To_Xt_Arg_Val is new
--        UNCHECKED_CONVERSION (Xm.Xm_Unit_Types, Xt.Xt_Ancillary_Types.Xt_Arg_Val);

    function To_Xt_Arg_Val is new
        UNCHECKED_CONVERSION (X_Lib.Pixel, Xt.Xt_Ancillary_Types.Xt_Arg_Val);

    function To_Xt_Arg_Val is new
        UNCHECKED_CONVERSION (Xm.Xm_Font_List, Xt.Xt_Ancillary_Types.Xt_Arg_Val);

    function To_Xt_Arg_Val is new
        UNCHECKED_CONVERSION (Xm.Xm_String, Xt.Xt_Ancillary_Types.Xt_Arg_Val);

    function To_Xt_Arg_Val is new
    	UNCHECKED_CONVERSION (X_Lib.Pixmap, Xt.Xt_Ancillary_Types.Xt_Arg_Val);

    function To_Xt_Arg_Val is new
        UNCHECKED_CONVERSION (Xm.Xm_Tear_Offs, Xt.Xt_Ancillary_Types.Xt_Arg_Val);

    function To_Xt_Arg_Val is new
	UNCHECKED_CONVERSION (Xm.Xm_Frame_Child, Xt.Xt_Ancillary_Types.Xt_Arg_Val);

    function To_Xt_Arg_Val is new
        UNCHECKED_CONVERSION (Xm.Xm_Frame_Alignments, Xt.Xt_Ancillary_Types.Xt_Arg_Val);

    function To_Xt_Arg_Val is new
	UNCHECKED_CONVERSION (Xm.Xm_Audibles, Xt.Xt_Ancillary_Types.Xt_Arg_Val);

    function To_Xt_Arg_Val is new
        UNCHECKED_CONVERSION (Xm.Xm_Delete_Responses, Xt.Xt_Ancillary_Types.Xt_Arg_Val); 

    function To_Xt_Arg_Val is new
	UNCHECKED_CONVERSION (Xm.Xm_Selection_Box, Xt.Xt_Ancillary_Types.Xt_Arg_Val);

    function To_String_Pointer is new
        UNCHECKED_CONVERSION (Xt.Xt_Pointer, X_Lib.String_Pointer );

    function To_Long_Array_Ptr is new
        UNCHECKED_CONVERSION (Xt.Xt_Pointer, X_Lib.Long_Array_Ptr );

    function To_String_List is new
        UNCHECKED_CONVERSION (Xt.Xt_Pointer, X_Lib.String_List );

    type Boolean_Ptr is access Boolean;
    function BX_Convert
        (W        : in Xt.Widget;
         From_Str : in String;
         To_Type  : in String;
---         Success  : in Xt.Xt_Pointer)
         Success  : in Boolean_Ptr)
       return Xt.Xt_Pointer;

--tmp    function Convert_Color
--tmp        (Parent : in Xt.Widget;
--tmp         Color  : in String) return X_Lib.Pixel;

    function Convert_Bitmap
        (Parent : in Xt.Widget;
         Bitmap : in String) return X_Lib.Pixmap;

--tmp    type Font_List_Segment is
--tmp        record
--tmp            Font      : X_Lib.String_Pointer;
--tmp            Charset   : Xm.Xm_String_Char_Set_Ptr;
--tmp        end record;
--tmp
--tmp    function Convert_Font
--tmp        (Font    : in STRING;
--tmp         Charset : in Xm.Xm_String_Char_Set := Xm.Xm_String_Default_Charset)
--tmp        return Font_List_Segment;
--tmp
--tmp    type Font_List_Segments is
--tmp             array (Natural range <>) of Font_List_Segment;
--tmp
--tmp    function Convert_Font_List
--tmp        (Parent   : in Xt.Widget;
--tmp         Fonts    : in Font_List_Segments;
--tmp         Free_Mem : in Boolean := TRUE) return Xm.Xm_Font_List;

    type Compound_String_Segment is
        record
            Value     : X_Lib.String_Pointer;
            Charset   : Xm.Xm_String_Char_Set_Ptr;
            Direction : Xm.Xm_String_Direction;
            Separator : Boolean;
        end record;

    function Convert_String_Segment
        (Value     : in String;
         Charset   : in Xm.Xm_String_Char_Set := Xm.Xm_String_Default_Charset;
         Direction : in Xm.Xm_String_Direction:= Xm.Xm_String_Direction_L_To_R;
         Separator : in Boolean)
        return Compound_String_Segment;

    type Compound_String_Segments is
             array (Natural range <>) of Compound_String_Segment;

    function Convert_Compound_String
        (Segment_Data : in Compound_String_Segments;
         Free_Mem     : in Boolean := TRUE) return Xm.Xm_String;

    function Convert_String
        (Str : in String) return X_Lib.String_Pointer;

    function Convert_Trans_Table
        (Parent   : in Xt.Widget;
         Trans    : in X_Lib.String_Pointer_Array;
         Free_Mem : in Boolean := TRUE) return Xt.Xt_Pointer;

    function Convert_Integer_List
        (Int_List : in X_Lib.Long_Array) return Xt.Xt_Pointer;

    function Convert_String_List
        (Strings  : in X_Lib.String_Pointer_Array) return Xt.Xt_Pointer;

--tmp    function XPM_Pixmap
--tmp        (W           : in Xt.Widget;
--tmp         Pixmap_Data : in X_Lib.String_Pointer_Array) return X_Lib.Pixmap;

end Uil_Utilities;

------ COPYRIGHT AND DISTRIBUTION NOTICE ----------
--
-- (C) Copyright 1992 Systems Engineering Research Corporation
-- All Rights Reserved
--
-- This notice must be included in all copies of this software.
--
-- THIS SOFTWARE AND MANUAL ARE BOTH PROTECTED BY U.S. COPYRIGHT
-- LAW (TITLE 17 UNITED STATES CODE).  UNAUTHORIZED REPRODUCTION
-- AND/OR SALES MAY RESULT IN IMPRISIONMENT OF UP TO ONE YEAR AND
-- FINES OF UP TO $10,000 (17 USC 506).  COPYRIGHT INFRINGERS MAY
-- ALSO BE SUBJECT TO CIVIL LIABILITY.
--
-- THIS PROGRAM IS AN UNPUBLISHED WORK FULLY PROTECTED BY THE
-- UNITED STATES COPYRIGHT LAWS AND IS CONSIDERED A TRADE SECRET
-- BELONGING TO THE COPYRIGHT HOLDER.
--
-- Use of this software is restricted to those individuals and/or
-- organizations who have acquired a license from Systems Engineering
-- Research Corporation for a particular machine or set of machines.
-- No copying, use, or distribution of this software from or to an unlicensed
-- machine is allowed without the prior written consent of Systems
-- Engineering Research Corporation.
--
-- The SOFTWARE and documentation are provided with RESTRICTED RIGHTS.  Use,
-- duplication, or disclosure by the Government is subject to the restrictions
-- as set forth in subparagraph (c)(1)(ii) of The Rights in Technical Data
-- and Computer Software clause at 52.227-7013.  Contractor/manufacturer is
-- Systems Engineering Research Corporation/2348 Leghorn Street, Suite 202/
-- Mountain View, CA 94043 1-800-Ada-SERC.
--
------- DISCLAIMER -------
--
-- This software and its documentation are provided "AS IS" and
-- without any expressed or implied warranties whatsoever.
-- No warranties as to performance, merchantability, or fitness
-- for a particular purpose exist.
--
-- Because of the diversity of conditions and hardware under
-- which this software may be used, no warranty of fitness for
-- a particular purpose is offered.  The user is advised to
-- test the software thoroughly before relying on it.  The user
-- must assume the entire risk and liability of using this
-- software.
--
-- In no event shall Systems Engineering Research Corporation and its
-- personnel be held responsible for any direct, indirect, consequential
-- or inconsequential damages or lost profits.
