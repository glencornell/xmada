------------------------------------------------------------------------------
--
--  Mofit Ada Binding
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
--! <Unit> Xm.Clipboard_Management
--! <Purpose>
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with System.Storage_Elements;

with Xlib;

package Xm.Clipboard_Management is


--   procedure Xm_Clipboard_Start_Copy
--    (The_Display : in     Xlib.Display;
--     The_Window  : in     Xlib.Window;
--     Clip_Label  : in     Xm_String;
--     Timestamp   : in     Xlib.Time;
--     The_Widget  : in     Xt.Widget;
--     Callback    : in     Xm_Cut_Paste_Proc;
--     Item_Id     :    out Xm_Clipboard_Item_Id;
--     Status      :    out Xm_Clipboard_Status);


   function Xm_Clipboard_Cancel_Copy (The_Display : in Xlib.Display;
                                      The_Window  : in Xlib.Window;
                                      Item_Id     : in Xm_Clipboard_Item_Id)
     return Xm_Clipboard_Status;


   function Xm_Clipboard_End_Copy (The_Display : in Xlib.Display;
                                   The_Window  : in Xlib.Window;
                                   Item_Id     : in Xm_Clipboard_Item_Id)
     return Xm_Clipboard_Status;


   function Xm_Clipboard_End_Retrieve (The_Display : in Xlib.Display;
                                       The_Window  : in Xlib.Window)
     return Xm_Clipboard_Status;


--   generic
--      type Element_Type is private; ???
   procedure Xm_Clipboard_Copy
    (The_Display : in     Xlib.Display;
     The_Window  : in     Xlib.Window;
     Item_Id     : in     Xm_Clipboard_Item_Id;
     Format_Name : in     String;
     Buffer      : in     System.Storage_Elements.Storage_Array;
     Private_Id  : in     Xm_Clipboard_Private_Id;
     Status      :    out Xm_Clipboard_Status);


   procedure Xm_Clipboard_Copy
    (The_Display : in     Xlib.Display;
     The_Window  : in     Xlib.Window;
     Item_Id     : in     Xm_Clipboard_Item_Id;
     Format_Name : in     String;
     Private_Id  : in     Xm_Clipboard_Private_Id;
     Data_Id     :    out Xm_Clipboard_Data_Id;
     Status      :    out Xm_Clipboard_Status);


   procedure Xm_Clipboard_Copy_By_Name
    (The_Display : in     Xlib.Display;
     The_Window  : in     Xlib.Window;
     Data_Id     : in     Xm_Clipboard_Data_Id;
     Buffer      : in     System.Storage_Elements.Storage_Array;
     Private_Id  : in     Xm_Clipboard_Private_Id;
     Status      :    out Xm_Clipboard_Status);


   procedure Xm_Clipboard_Inquire_Count
    (The_Display            : in     Xlib.Display;
     The_Window             : in     Xlib.Window;
     Count                  :    out Natural;
     Max_Format_Name_Length :    out Natural;
     Status                 :    out Xm_Clipboard_Status);


   procedure Xm_Clipboard_Inquire_Format
    (The_Display        : in     Xlib.Display;
     The_Window         : in     Xlib.Window;
     Index              : in     Natural;
     Format_Name_Buffer :    out String;
     Last               :    out Natural;
     Status             :    out Xm_Clipboard_Status);


   procedure Xm_Clipboard_Inquire_Length
    (The_Display : in     Xlib.Display;
     The_Window  : in     Xlib.Window;
     Format_Name : in     String;
     Length      :    out Natural;
     Status      :    out Xm_Clipboard_Status);


   function Xm_Clipboard_Lock (The_Display : in Xlib.Display;
                               The_Window  : in Xlib.Window)
     return Xm_Clipboard_Status;


   function Xm_Clipboard_Unlock (The_Display      : in Xlib.Display;
                                 The_Window       : in Xlib.Window;
                                 Remove_All_Locks : in Boolean)
     return Xm_Clipboard_Status;


end Xm.Clipboard_Management;
