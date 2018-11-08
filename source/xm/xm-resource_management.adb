------------------------------------------------------------------------------
--
--  Motif Ada Binding
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2004-2006  Vadim Godunko (vgodunko@rostel.ru)
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
--! <Unit> Xm.Resource_Management
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
with Ada.Unchecked_Deallocation;

with Xm.Implementation;

package body Xm.Resource_Management is

   use Interfaces.C;
   --use Interfaces.C.Wide_Strings;
   use Xm.Implementation;
   use Xt;
   use Xt.Ancillary_Types;

   type Xm_Secondary_Resource_Data_Pointer is
     access all Xm_Secondary_Resource_Data;
   pragma No_Strict_Aliasing (Xm_Secondary_Resource_Data_Pointer);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> To_Xm_Secondary_Resource_Data_List
   --!    <ImplementationNotes> Проверка нулевой длины необходима, поскольку
   --! RM95 не определяет поведение подпрограммы Interfaces.C.Pointers.Value
   --! при нулевой длине.
   ---------------------------------------------------------------------------
   function To_Xm_Secondary_Resource_Data_List
    (Pointer : in Xm_Secondary_Resource_Data_Pointer;
     Length  : in Natural)
       return Xm_Secondary_Resource_Data_List
   is
      function To_List is
        new Generic_To_Element_List (Xm_Secondary_Resource_Data,
                                     Xm_Secondary_Resource_Data_Pointer,
                                     Xm_Secondary_Resource_Data_List);
      pragma Inline (To_List);
   begin
      return To_List (Pointer, Length);
   end To_Xm_Secondary_Resource_Data_List;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Get_Secondary_Resource_Data
   --!    <ImplementationNotes> Параметр The_Widget_Class проверяется на нуль
   --!  значение в Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Get_Secondary_Resource_Data
    (The_Widget_Class : in     Widget_Class;
     Secondary_Data   :    out Xm_Secondary_Resource_Data_List_Access)
   is

      type Xm_Secondary_Resource_Data_Pointer_Access is
        access all Xm_Secondary_Resource_Data_Pointer;

      C_Secondary_Data   : aliased Xm_Secondary_Resource_Data_Pointer;
      Num_Secondary_Data : Cardinal;

      function XmGetSecondaryResourceData
       (The_Widget_Class : in Widget_Class;
        Secondary_Data   : in Xm_Secondary_Resource_Data_Pointer_Access)
          return Cardinal;
      pragma Import (C, XmGetSecondaryResourceData,
                     "XmGetSecondaryResourceData");

      procedure XtFree (Item : in Xm_Secondary_Resource_Data_Pointer);
      pragma Import (C, XtFree, "XtFree");

   begin
      Num_Secondary_Data :=
        XmGetSecondaryResourceData (The_Widget_Class, C_Secondary_Data'Access);

      if Num_Secondary_Data /= 0 then
         Secondary_Data :=
           new Xm_Secondary_Resource_Data_List'(
                 To_Xm_Secondary_Resource_Data_List
                  (C_Secondary_Data, Natural (Num_Secondary_Data)));
         XtFree (C_Secondary_Data);

      else
         Secondary_Data := null;
      end if;
   end Xm_Get_Secondary_Resource_Data;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit>
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xm_Get_Secondary_Resource_Data
    (The_Widget_Class : in Xt.Widget_Class)
       return Xm_Secondary_Resource_Data_List
   is

      type Xm_Secondary_Resource_Data_Pointer_Access is
        access all Xm_Secondary_Resource_Data_Pointer;

      C_Secondary_Data   : aliased Xm_Secondary_Resource_Data_Pointer;
      Num_Secondary_Data : Cardinal;

      function XmGetSecondaryResourceData
       (The_Widget_Class : in Widget_Class;
        Secondary_Data   : in Xm_Secondary_Resource_Data_Pointer_Access)
          return Cardinal;
      pragma Import (C, XmGetSecondaryResourceData,
                     "XmGetSecondaryResourceData");

      procedure XtFree (Item : in Xm_Secondary_Resource_Data_Pointer);
      pragma Import (C, XtFree, "XtFree");

   begin
      Num_Secondary_Data :=
        XmGetSecondaryResourceData (The_Widget_Class, C_Secondary_Data'Access);

      if Num_Secondary_Data /= 0 then
         declare
            Return_Value : constant Xm_Secondary_Resource_Data_List
              := To_Xm_Secondary_Resource_Data_List
                  (C_Secondary_Data, Natural (Num_Secondary_Data));
         begin
            XtFree (C_Secondary_Data);
            return Return_Value;
         end;

      else
         declare
            Return_Value : Xm_Secondary_Resource_Data_List (1 .. 0);

         begin
            return Return_Value;
         end;
      end if;
   end Xm_Get_Secondary_Resource_Data;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xm_Secondary_Resource_Data_List_Access_Free
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Xm_Secondary_Resource_Data_List_Access_Free
    (Item : in out Xm_Secondary_Resource_Data_List_Access)
   is
      procedure Free is
        new Ada.Unchecked_Deallocation
             (Xm_Secondary_Resource_Data_List,
              Xm_Secondary_Resource_Data_List_Access);

      procedure XtFree (Item : in Xt_Resource_Pointer);
      procedure XtFree (Item : in Xm_Secondary_Resource_Data);
      pragma Import (C, XtFree, "XtFree");
   begin
      if Item /= null then
         for J in Item'Range loop
            XtFree (Item (J).Resources);
            XtFree (Item (J));
         end loop;
      end if;
      Free (Item);
   end Xm_Secondary_Resource_Data_List_Access_Free;


   --  procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
   --                        Name  : in     Xt_Resource_Name_String;
   --                        Value : in     wchars_ptr)
   --  is
   --     function To_Xt_Arg_Val is
   --       new Ada.Unchecked_Conversion (wchars_ptr, Xt_Arg_Val);
   --  begin
   --     Arg := (Name, To_Xt_Arg_Val (Value));
   --  end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Alignment)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Alignment, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Arrow_Direction)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Arrow_Direction, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Arrow_Layout)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Arrow_Layout, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Arrow_Orientation)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Arrow_Orientation, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Arrow_Sensitivity)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Arrow_Sensitivity, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Attachment)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Attachment, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Audible_Warning)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Audible_Warning, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Auto_Drag_Model)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Auto_Drag_Model, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Automatic_Selection)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Automatic_Selection, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Binding_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Binding_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Bitmap_Conversion_Model)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Bitmap_Conversion_Model,
                                      unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;

--
--   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
--                         Name  : in     Xt_Resource_Name_String;
--                         Value : in     Xm_Blend_Model)
--   is
--      function To_unsigned_char is
--        new Ada.Unchecked_Conversion (Xm_Blend_Model, unsigned_char);
--   begin
--      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
--   end Xt_Set_Arg;
--

--   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
--                         Name  : in     Xt_Resource_Name_String;
--                         Value : in     Xm_Child_Horizontal_Alignment)
--   is
--      function To_unsigned_char is
--        new Ada.Unchecked_Conversion (Xm_Child_Horizontal_Alignment,
--                                      unsigned_char);
--   begin
--      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
--   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Child_Placement)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Child_Placement, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Child_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Child_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Child_Vertical_Alignment)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Child_Vertical_Alignment,
                                      unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Combo_Box_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Combo_Box_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Command_Window_Location)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Command_Window_Location,
                                      unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Default_Button_Emphasis)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Default_Button_Emphasis,
                                      unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Default_Button_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Default_Button_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Delete_Response)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Delete_Response, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Dialog_Style)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Dialog_Style, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Dialog_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Dialog_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Direction)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Direction, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


--   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
--                         Name  : in     Xt_Resource_Name_String;
--                         Value : in     Xm_Drag_Initiator_Protocol_Style)
--   is
--      function To_unsigned_char is
--        new Ada.Unchecked_Conversion (Xm_Drag_Initiator_Protocol_Style,
--                                      unsigned_char);
--   begin
--      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
--   end Xt_Set_Arg;
--
--
--   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
--                         Name  : in     Xt_Resource_Name_String;
--                         Value : in     Xm_Drag_Receiver_Protocol_Style)
--   is
--      function To_unsigned_char is
--        new Ada.Unchecked_Conversion (Xm_Drag_Receiver_Protocol_Style,
--                                      unsigned_char);
--   begin
--      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
--   end Xt_Set_Arg;
--

   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Edit_Mode)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Edit_Mode, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Enable_Btn1_Transfer)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Enable_Btn1_Transfer, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Enable_Warp)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Enable_Warp, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Entry_View_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Entry_View_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_File_Filter_Style)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_File_Filter_Style, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;

--
--   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
--                         Name  : in     Xt_Resource_Name_String;
--                         Value : in     Xm_File_Type_Mask)
--   is
--      function To_unsigned_char is
--        new Ada.Unchecked_Conversion (Xm_File_Type_Mask, unsigned_char);
--   begin
--      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
--   end Xt_Set_Arg;
--
--
--   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
--                         Name  : in     Xt_Resource_Name_String;
--                         Value : in     Xm_Icon_Attachment)
--   is
--      function To_unsigned_char is
--        new Ada.Unchecked_Conversion (Xm_Icon_Attachment, unsigned_char);
--   begin
--      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
--   end Xt_Set_Arg;

   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Include_Status)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Include_Status, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;

   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Indicator_On)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Indicator_On, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Indicator_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Indicator_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Input_Policy)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Input_Policy, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Keyboard_Focus_Policy)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Keyboard_Focus_Policy, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Label_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Label_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Layout_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Layout_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Line_Style)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Line_Style, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Match_Behavior)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Match_Behavior, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Multi_Click)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Multi_Click, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Navigation_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Navigation_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Notebook_Child_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Notebook_Child_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Orientation)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Orientation, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Outline_Button_Policy)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Outline_Button_Policy, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Outline_State)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Outline_State, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Packing)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Packing, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Path_Mode)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Path_Mode, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Popup_Enabled)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Popup_Enabled, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Position_Mode)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Position_Mode, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Position_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Position_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Primary_Ownership)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Primary_Ownership, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Processing_Direction)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Processing_Direction, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Render_Table)
   is
      function To_Xt_Arg_Val is
        new Ada.Unchecked_Conversion (Xm_Render_Table, Xt_Arg_Val);
   begin
      Arg := (Name, To_Xt_Arg_Val (Value));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Resize_Policy)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Resize_Policy, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Row_Column_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Row_Column_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Scroll_Bar_Display_Policy)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Scroll_Bar_Display_Policy,
                                      unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Scroll_Bar_Placement)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Scroll_Bar_Placement, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Scrolled_Window_Child_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Scrolled_Window_Child_Type,
                                      unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Scrolling_Policy)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Scrolling_Policy, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Selection_Policy)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Selection_Policy, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Selection_Technique)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Selection_Technique, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Selection_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Selection_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Separator_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Separator_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_String)
   is
      function To_Xt_Arg_Val is
        new Ada.Unchecked_Conversion (Xm_String, Xt_Arg_Val);
   begin
      Arg := (Name, To_Xt_Arg_Val (Value));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Toggle_Button_State)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Toggle_Button_State, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Shadow_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Shadow_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Show_Arrows)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Show_Arrows, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Show_Value)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Show_Value, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Slider_Mark)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Slider_Mark, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Slider_Visual)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Slider_Visual, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Sliding_Mode)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Sliding_Mode, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Spatial_Include_Model)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Spatial_Include_Model, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Spatial_Resize_Model)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Spatial_Resize_Model, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Spatial_Snap_Model)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Spatial_Snap_Model, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Spatial_Style)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Spatial_Style, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Spin_Box_Child_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Spin_Box_Child_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_String_Direction)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_String_Direction, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Tab_List)
   is
      function To_Xt_Arg_Val is
        new Ada.Unchecked_Conversion (Xm_Tab_List, Xt_Arg_Val);
   begin
      Arg := (Name, To_Xt_Arg_Val (Value));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Tear_Off_Model)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Tear_Off_Model, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Text_Type)
   is
      function To_int is
        new Ada.Unchecked_Conversion (Xm_Text_Type, int);
   begin
      Arg := (Name, Xt_Arg_Val (To_int (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Toggle_Mode)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Toggle_Mode, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Unit_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Unit_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Unpost_Behavior)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Unpost_Behavior, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Vertical_Alignment)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Vertical_Alignment, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_View_Type)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_View_Type, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Visual_Emphasis)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Visual_Emphasis, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Visual_Policy)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Visual_Policy, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


   procedure Xt_Set_Arg (Arg   : in out Xt_Arg;
                         Name  : in     Xt_Resource_Name_String;
                         Value : in     Xm_Which_Button)
   is
      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Which_Button, unsigned_char);
   begin
      Arg := (Name, Xt_Arg_Val (To_unsigned_char (Value)));
   end Xt_Set_Arg;


end Xm.Resource_Management;
