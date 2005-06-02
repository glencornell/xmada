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

package X_Unsigned_Types is
    type Unsigned_Integer is new Integer;
    for Unsigned_Integer'Size use 32;

    -- logical

    function "<" (L, R : in Unsigned_Integer) return Boolean;
    function "<=" (L, R : in Unsigned_Integer) return Boolean;
    function ">" (L, R : in Unsigned_Integer) return Boolean;
    function ">=" (L, R : in Unsigned_Integer) return Boolean;
    function Equal (L, R : in Unsigned_Integer) return Boolean;
    function Not_Equal (L, R : in Unsigned_Integer) return Boolean;

    -- arithmetic

    function "+" (L, R : in Unsigned_Integer) return Unsigned_Integer;
    function "-" (L, R : in Unsigned_Integer) return Unsigned_Integer;
    function "+" (L : in Unsigned_Integer) return Unsigned_Integer;
    function "-" (L : in Unsigned_Integer) return Unsigned_Integer;
    function "*" (L, R : in Unsigned_Integer) return Unsigned_Integer;
    function "/" (L, R : in Unsigned_Integer) return Unsigned_Integer;
    function "mod" (L, R : in Unsigned_Integer) return Unsigned_Integer;
    function "rem" (L, R : in Unsigned_Integer) return Unsigned_Integer;
    function "**" (L, R : in Unsigned_Integer) return Unsigned_Integer;
    function "abs" (L : in Unsigned_Integer) return Unsigned_Integer;
    function Shift_Left (L, R : in Unsigned_Integer) return Unsigned_Integer;
    function Shift_Right (L, R : in Unsigned_Integer) return Unsigned_Integer;

    function "and" (L, R : in Unsigned_Integer) return Unsigned_Integer;
    function "or" (L, R : in Unsigned_Integer) return Unsigned_Integer;
    function "xor" (L, R : in Unsigned_Integer) return Unsigned_Integer;
    function "not" (L : in Unsigned_Integer) return Unsigned_Integer;

    function Logical_And (L, R : in Unsigned_Integer) return Boolean;
    function Logical_Or (L, R : in Unsigned_Integer) return Boolean;
    function Logical_Xor (L, R : in Unsigned_Integer) return Boolean;
    function Logical_Not (L : in Unsigned_Integer) return Boolean;
end X_Unsigned_Types;
