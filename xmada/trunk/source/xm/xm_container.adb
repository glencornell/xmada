------------------------------------------------------------------------------
--
--  Motif Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2005  Vadim Godunko (vgodunko@rostel.ru)
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
--! XmAda maintained by TechnoServ A/S (email: vgodunko@rostel.ru)
--!
--! <Unit> Xm_Container
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;

with Xt.Composite_Management;
with Xm.Implementation;

package body Xm_Container is

   use Interfaces.C;
   use Xlib;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;
   use Xm.Implementation;

   function Xm_Container_Copy (The_Widget : in Xm_Container_Widget;
                               Timestamp  : in Time)
     return Boolean
   is
      function XmContainerCopy (The_Widget : in Widget;
                                Timestamp  : in Time)
        return Xt_Boolean;
      pragma Import (C, XmContainerCopy, "XmContainerCopy");
   begin
      Check (The_Widget);

      return To_Boolean (XmContainerCopy (The_Widget, Timestamp));
   end Xm_Container_Copy;


   function Xm_Container_Copy_Link (The_Widget : in Xm_Container_Widget;
                                    Timestamp  : in Time)
     return Boolean
   is
      function XmContainerCopyLink (The_Widget : in Widget;
                                    Timestamp  : in Time)
        return Xt_Boolean;
      pragma Import (C, XmContainerCopyLink, "XmContainerCopyLink");
   begin
      Check (The_Widget);

      return To_Boolean (XmContainerCopyLink (The_Widget, Timestamp));
   end Xm_Container_Copy_Link;


   function Xm_Container_Cut (The_Widget : in Xm_Container_Widget;
                              Timestamp  : in Time)
     return Boolean
   is
      function XmContainerCut (The_Widget : in Widget;
                               Timestamp  : in Time)
        return Xt_Boolean;
      pragma Import (C, XmContainerCut, "XmContainerCut");
   begin
      Check (The_Widget);

      return To_Boolean (XmContainerCut (The_Widget, Timestamp));
   end Xm_Container_Cut;


   function Xm_Container_Paste (The_Widget : in Xm_Container_Widget)
     return Boolean
   is
      function XmContainerPaste (The_Widget : in Widget)
        return Xt_Boolean;
      pragma Import (C, XmContainerPaste, "XmContainerPaste");
   begin
      Check (The_Widget);

      return To_Boolean (XmContainerPaste (The_Widget));
   end Xm_Container_Paste;


   function Xm_Container_Paste_Link (The_Widget : in Xm_Container_Widget)
     return Boolean
   is
      function XmContainerPasteLink (The_Widget : in Widget)
        return Xt_Boolean;
      pragma Import (C, XmContainerPasteLink, "XmContainerPasteLink");
   begin
      Check (The_Widget);

      return To_Boolean (XmContainerPasteLink (The_Widget));
   end Xm_Container_Paste_Link;


   procedure Xm_Container_Relayout (The_Widget : in Xm_Container_Widget) is
      procedure XmContainerRelayout (The_Widget : in Xm_Container_Widget);
      pragma Import (C, XmContainerRelayout, "XmContainerRelayout");
   begin
      Check (The_Widget);
      XmContainerRelayout (The_Widget);
   end Xm_Container_Relayout;


   procedure Xm_Container_Reorder (The_Widget : in Xm_Container_Widget;
                                   Widgets    : in Xt_Widget_List)
   is
      procedure XmContainerReorder (The_Widget   : in Xm_Container_Widget;
                                    Widgets      : in Xt_Widget_List;
                                    Widget_Count : in int);
      pragma Import (C, XmContainerReorder, "XmContainerReorder");
   begin
      Check (The_Widget);
      XmContainerReorder (The_Widget, Widgets, Widgets'Length);
   end Xm_Container_Reorder;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Create_Container
   --!    <ImplementationNotes> Проверку параметра Parent на нуль-значение
   --! проводит Xt.
   ---------------------------------------------------------------------------
   function Xm_Create_Container (Parent   : in Widget;
                                 Name     : in String;
                                 Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
     return Xm_Container_Widget
   is
      function XmCreateContainer (Parent    : in Widget;
                                  Name      : in char_array;
                                  Arg_List  : in Xt_Arg_List;
                                  Arg_Count : in Cardinal)
        return Widget;
      pragma Import (C, XmCreateContainer, "XmCreateContainer");
   begin
      return
        XmCreateContainer (Parent, To_C (Name), Arg_List, Arg_List'Length);
   end Xm_Create_Container;


   function Xm_Create_Managed_Container
    (Parent   : in Widget;
     Name     : in String;
     Arg_List : in Xt_Arg_List := Null_Xt_Arg_List)
       return Xm_Container_Widget
   is
      Return_Widget : Widget;
   begin
      Return_Widget := Xm_Create_Container (Parent, Name, Arg_List);
      Xt_Manage_Child (Return_Widget);
      return Return_Widget;
   end Xm_Create_Managed_Container;


end Xm_Container;
