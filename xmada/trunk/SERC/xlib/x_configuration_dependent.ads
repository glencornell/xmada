-- AdaXlibXt: Ada bindings to the X Window System, developed by SERC
-- Copyright (C) 1991, 1992, 1993  Free Software Foundation
--
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Library General Public
-- License as published by the Free Software Foundation; either
-- version 2 of the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Library General Public License for more details.
--
-- You should have received a copy of the GNU Library General Public
-- License along with this library; if not, write to the Free
-- Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

with System, X_Unsigned_Types;

package X_Configuration_Dependent is
    type Int8 is range -2 ** 7 .. (2 ** 7) - 1;
    for Int8'Size use 8;

    type Int16 is range -2 ** 15 .. (2 ** 15) - 1;
    for Int16'Size use 16;

    type Int32 is range -2 ** 31 .. (2 ** 31) - 1;
    for Int32'Size use 32;

    type Card8 is range 0 .. (2 ** 8) - 1;
    for Card8'Size use 8;

    type Card16 is range 0 .. (2 ** 16) - 1;
    for Card16'Size use 16;

    type Card32 is new X_Unsigned_Types.Unsigned_Integer;
    for Card32'Size use 32;

    subtype Char is Int8;

    subtype Natural8 is Int8 range 0 .. (2 ** 7) - 1;

    subtype Positive8 is Int8 range 1 .. (2 ** 7) - 1;

    subtype Short is Int16;

    subtype Natural16 is Int16 range 0 .. (2 ** 15) - 1;

    subtype Positive16 is Int16 range 1 .. (2 ** 15) - 1;

    subtype Long is Int32;

    subtype Natural32 is Int32 range 0 .. (2 ** 31) - 1;

    subtype Positive32 is Int32 range 1 .. (2 ** 31) - 1;

    subtype Unsigned_Long is Card32;

    subtype Int is Long;

    subtype Unsigned_Int is Card32;

    subtype Unsigned_Short is Card16;

    subtype Unsigned_Char is Card8;
    subtype Byte is Card8;

    subtype Bool is Int;

    subtype Flt is Float;
    type Serc_Float is digits 15;
    subtype Long_Flt is Serc_Float;
    subtype Double is Serc_Float;
    Word_Size : constant := Long'Size / 8;
    Bits_Per_Word : constant := 32;

    -- These variables all stem from Xmu/CvtStdSel.c where they are
    -- used by the C pre-processor to make decisions about the host OS

    Unix : constant Boolean := True;
    Dnetconn : constant Boolean := False;
    Sun3 : constant Boolean := False;
    Sun4 : constant Boolean := True;
    Hp300 : constant Boolean := False;
    Hp700 : constant Boolean := False;
    Rs6000 : constant Boolean := False;
    Sgi : constant Boolean := False;
    I386 : constant Boolean := False;
    Sysv : constant Boolean := True;
    Os_Name : constant String := "SunOS 5.x";
    X_Os_File : constant String := "";
    Motd_File : constant String := "/etc/motd";

    -- Null_Byte returns a one byte value of the compiler's
    -- null access type.

    Null_Byte : constant Byte := 0;

    -- Zero_Address returns a zero system.address which may
    -- be different than the compiler's null access type.
    Zero_Address : constant System.Address := System.Null_Address;
end X_Configuration_Dependent;

