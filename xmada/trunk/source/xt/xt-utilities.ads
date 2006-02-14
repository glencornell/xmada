------------------------------------------------------------------------------
--
--  X Toolkit Intrinsics Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2006  Vadim Godunko (vgodunko@rost.ru)
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
--! <Unit> Xt.Utilities
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xlib.Graphic_Output;

package Xt.Utilities is


   procedure Xt_Set_Sensitive (The_Widget : in Widget;
                               Sensitive  : in Boolean);


   procedure Xt_App_Set_Exit_Flag (App_Context : in Xt_App_Context);

   function Xt_App_Get_Exit_Flag (App_Context : in Xt_App_Context)
     return Boolean;


   procedure Xt_App_Lock (App_Context : in Xt_App_Context);

   procedure Xt_App_Unlock (App_Context : in Xt_App_Context);

   procedure Xt_Process_Lock;

   procedure Xt_Process_Unlock;


   function Xt_Display (Object : in Widget) return Xlib.Display;

   function Xt_Display_Of_Object (Object : in Widget) return Xlib.Display;

   function Xt_Screen (Object : in Widget) return Xlib.Screen;

   function Xt_Screen_Of_Object (Object : in Widget) return Xlib.Screen;

   function Xt_Window (Object : in Widget) return Xlib.Window;

   function Xt_Window_Of_Object (Object : in Widget) return Xlib.Window;



   function Xt_Name (Object : in Widget) return String;

   function Xt_Name_To_Widget (Reference : in Widget;
                               Name      : in String)
     return Widget;


   function Xt_Widget_To_Application_Context (The_Widget : in Widget)
     return Xt_App_Context;


   function Xt_Get_GC (The_Widget : in Xt.Widget;
                       Value_Mask : in Xlib.Graphic_Output.GC_Value_Mask_Type;
                       Values     : in Xlib.Graphic_Output.X_GC_Values)
     return Xlib.Graphic_Context;

   procedure Xt_Release_GC (The_Widget : in Xt.Widget;
                            GC         : in Xlib.Graphic_Context);

private

   pragma Import (C, Xt_Process_Lock, "XtProcessLock");
   pragma Import (C, Xt_Process_Unlock, "XtProcessUnlock");

end Xt.Utilities;
