------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rost.ru)
--!
--! XmAda is free software; you can redistribute it and/or modify it under
--! the terms of the GNU General Public License as published by the Free
--! Software Foundation; either version 2, or (at your option) any later
--! version.
--!
--! XmAda is distributed in the hope that it will be useful, but WITHOUT ANY
--! WARRANTY; without even the implied warranty of MERCHANTABILITY or
--! FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
--! for more details.
--!
--! You should have received a copy of the GNU General Public License
--! along with GCC; see the file COPYING. If not, write to the Free
--! Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
--! 02110-1301, USA.
--!
--! As a special exception, if other files instantiate generics from this
--! unit, or you link this unit with other files to produce an executable,
--! this unit does not by itself cause the resulting executable to be
--! covered by the GNU General Public License. This exception does not
--! however invalidate any other reasons why the executable file might be
--! covered by the GNU Public License.
--!
--! <Unit> Xt.Instance_Management
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xt.Implementation;

package body Xt.Instance_Management is

   use Interfaces.C;
   use Xt.Ancillary_Types;
   use Xt.Implementation;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Create_Managed_Widget
   --!    <ImplementationNotes> Параметры The_Widget_Class и Parent проверяются
   --! на нуль значение внутри Xt.
   ---------------------------------------------------------------------------
   function Xt_Create_Managed_Widget
    (Name             : in String;
     The_Widget_Class : in Widget_Class;
     Parent           : in Widget;
     Args             : in Xt_Arg_List := Null_Xt_Arg_List)
       return Widget
   is
      function XtCreateManagedWidget (Name             : in char_array;
                                      The_Widget_Class : in Widget_Class;
                                      Parent           : in Widget;
                                      Args             : in Xt_Arg_List;
                                      Num_Args         : in Cardinal)
        return Widget;
      pragma Import (C, XtCreateManagedWidget, "XtCreateManagedWidget");
   begin
     return
       XtCreateManagedWidget
        (To_C (Name), The_Widget_Class, Parent, Args, Args'Length);
   end Xt_Create_Managed_Widget;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Create_Widget
   --!    <ImplementationNotes> Параметры The_Widget_Class и Parent проверяются
   --! на нуль значение внутри Xt.
   ---------------------------------------------------------------------------
   function Xt_Create_Widget
    (Name             : in String;
     The_Widget_Class : in Widget_Class;
     Parent           : in Widget;
     Args             : in Xt_Arg_List := Null_Xt_Arg_List)
       return Widget
   is
      function XtCreateWidget (Name             : in char_array;
                               The_Widget_Class : in Widget_Class;
                               Parent           : in Widget;
                               Args             : in Xt_Arg_List;
                               Num_Args         : in Cardinal)
        return Widget;
      pragma Import (C, XtCreateWidget, "XtCreateWidget");
   begin
     return
       XtCreateWidget
        (To_C (Name), The_Widget_Class, Parent, Args, Args'Length);
   end Xt_Create_Widget;


   procedure Xt_Destroy_Widget (W : in Widget) is
      procedure XtDestroyWidget (W : in Widget);
      pragma Import (C, XtDestroyWidget, "XtDestroyWidget");
   begin
      Check (W);
      XtDestroyWidget (W);
   end Xt_Destroy_Widget;


   function Xt_Is_Realized (W : in Widget) return Boolean is
      function XtIsRealized (W : in Widget) return Xt_Boolean;
      pragma Import (C, XtIsRealized, "XtIsRealized");
   begin
      Check (W);
      return To_Boolean (XtIsRealized (W));
   end Xt_Is_Realized;


   procedure Xt_Map_Widget (W : in Widget) is
      procedure XtMapWidget (W : in Widget);
      pragma Import (C, XtMapWidget, "XtMapWidget");
   begin
      Check (W);
      XtMapWidget (W);
   end Xt_Map_Widget;


   function Xt_Parent (W : in Widget) return Widget is
      function XtParent (W : in Widget) return Widget;
      pragma Import (C, XtParent, "XtParent");
   begin
      Check (W);
      return XtParent (W);
   end Xt_Parent;


   procedure Xt_Realize_Widget (W : in Widget) is
      procedure XtRealizeWidget (W : in Widget);
      pragma Import (C, XtRealizeWidget, "XtRealizeWidget");
   begin
      Check (W);
      XtRealizeWidget (W);
   end Xt_Realize_Widget;


   procedure Xt_Set_Mapped_When_Managed (W                : in Widget;
                                         Map_When_Managed : in Boolean)
   is
      procedure XtSetMappedWhenManaged (W                : in Widget;
                                        Map_When_Managed : in Xt_Boolean);
      pragma Import (C, XtSetMappedWhenManaged, "XtSetMappedWhenManaged");
   begin
      Check (W);
      XtSetMappedWhenManaged (W, To_Xt_Boolean (Map_When_Managed));
   end Xt_Set_Mapped_When_Managed;


   procedure Xt_Unmap_Widget (W : in Widget) is
      procedure XtUnmapWidget (W : in Widget);
      pragma Import (C, XtUnmapWidget, "XtUnmapWidget");
   begin
      Check (W);
      XtUnmapWidget (W);
   end Xt_Unmap_Widget;


   procedure Xt_Unrealize_Widget (W : in Widget) is
      procedure XtUnrealizeWidget (W : in Widget);
      pragma Import (C, XtUnrealizeWidget, "XtUnrealizeWidget");
   begin
      Check (W);
      XtUnrealizeWidget (W);
   end Xt_Unrealize_Widget;


end Xt.Instance_Management;
