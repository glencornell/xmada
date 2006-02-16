------------------------------------------------------------------------------
--
--  Mofit Ada Binding
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
--! <Unit> Xm.Class_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Xm.Class_Management is


   function Xm_Is_Arrow_Button (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Arrow_Button_Gadget (The_Widget : in Xt.Widget)
     return Boolean;

   function Xm_Is_Bulletin_Board (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Cascade_Button (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Cascade_Button_Gadget (The_Widget : in Xt.Widget)
     return Boolean;

   function Xm_Is_Combo_Box (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Command (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Container (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Dialog_Shell (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Display (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Drag_Context (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Drag_Icon_Object_Class (The_Widget : in Xt.Widget)
     return Boolean;

   function Xm_Is_Drawing_Area (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Drawn_Button (The_Widget : in Xt.Widget) return Boolean;

--   function Xm_Is_Drop_Site_Manager (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Drop_Transfer (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_File_Selection_Box (The_Widget : in Xt.Widget)
     return Boolean;

   function Xm_Is_Form (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Frame (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Gadget (The_Widget : in Xt.Widget) return Boolean;

--   function Xm_Is_Grab_Shell (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Icon_Gadget (The_Widget : in Xt.Widget) return Boolean;

--   что это?
--   function Xm_Is_Icon_Header (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Label (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Label_Gadget (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_List (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Main_Window (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Manager (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Menu_Shell (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Message_Box (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Notebook (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Paned_Window (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Primitive (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Print_Shell (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Push_Button (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Push_Button_Gadget (The_Widget : in Xt.Widget)
     return Boolean;

   function Xm_Is_Row_Column (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Scale (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Screen (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Scroll_Bar (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Scrolled_Window (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Selection_Box (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Separator (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Separator_Gadget (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Text (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Text_Field (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Toggle_Button (The_Widget : in Xt.Widget) return Boolean;

   function Xm_Is_Toggle_Button_Gadget (The_Widget : in Xt.Widget)
     return Boolean;

   function Xm_Is_Vendor_Shell (The_Widget : in Xt.Widget) return Boolean;


private

   pragma Inline (Xm_Is_Arrow_Button);
   pragma Inline (Xm_Is_Arrow_Button_Gadget);
   pragma Inline (Xm_Is_Bulletin_Board);
   pragma Inline (Xm_Is_Cascade_Button);
   pragma Inline (Xm_Is_Cascade_Button_Gadget);
   pragma Inline (Xm_Is_Combo_Box);
   pragma Inline (Xm_Is_Command);
   pragma Inline (Xm_Is_Container);
   pragma Inline (Xm_Is_Dialog_Shell);
   pragma Inline (Xm_Is_Display);
   pragma Inline (Xm_Is_Drag_Context);
   pragma Inline (Xm_Is_Drag_Icon_Object_Class);
   pragma Inline (Xm_Is_Drawing_Area);
   pragma Inline (Xm_Is_Drawn_Button);
--   pragma Inline (Xm_Is_Drop_Site_Manager);
   pragma Inline (Xm_Is_Drop_Transfer);
   pragma Inline (Xm_Is_File_Selection_Box);
   pragma Inline (Xm_Is_Form);
   pragma Inline (Xm_Is_Frame);
   pragma Inline (Xm_Is_Gadget);
--   pragma Inline (Xm_Is_Grab_Shell);
   pragma Inline (Xm_Is_Icon_Gadget);
--   что это?
--   pragma Inline (Xm_Is_Icon_Header);
   pragma Inline (Xm_Is_Label);
   pragma Inline (Xm_Is_Label_Gadget);
   pragma Inline (Xm_Is_List);
   pragma Inline (Xm_Is_Main_Window);
   pragma Inline (Xm_Is_Manager);
   pragma Inline (Xm_Is_Menu_Shell);
   pragma Inline (Xm_Is_Message_Box);
   pragma Inline (Xm_Is_Notebook);
   pragma Inline (Xm_Is_Paned_Window);
   pragma Inline (Xm_Is_Primitive);
   pragma Inline (Xm_Is_Print_Shell);
   pragma Inline (Xm_Is_Push_Button);
   pragma Inline (Xm_Is_Push_Button_Gadget);
   pragma Inline (Xm_Is_Row_Column);
   pragma Inline (Xm_Is_Scale);
   pragma Inline (Xm_Is_Screen);
   pragma Inline (Xm_Is_Scroll_Bar);
   pragma Inline (Xm_Is_Scrolled_Window);
   pragma Inline (Xm_Is_Selection_Box);
   pragma Inline (Xm_Is_Separator);
   pragma Inline (Xm_Is_Separator_Gadget);
   pragma Inline (Xm_Is_Text);
   pragma Inline (Xm_Is_Text_Field);
   pragma Inline (Xm_Is_Toggle_Button);
   pragma Inline (Xm_Is_Toggle_Button_Gadget);
   pragma Inline (Xm_Is_Vendor_Shell);

end Xm.Class_Management;
