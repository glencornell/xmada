------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006  TechnoServ A/S
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
--! along with XmAda; see the file COPYING. If not, write to the Free
--! Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
--! USA.
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
--! <Unit> Designer.Properties_Editor.Renditions_Editor
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Wide_Strings;
with GNAT.Table;

with Xt.Ancillary_Types;
with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;
with Xt.Utilities;

with Xm.Menu_Management;
with Xm.Resource_Management;
with Xm.Strings;
with Xm_Cascade_Button_Gadget;
with Xm_Drawing_Area;
with Xm_Form;
with Xm_Label_Gadget;
with Xm_Message_Box;
with Xm_Notebook;
with Xm_Push_Button_Gadget;
with Xm_Row_Column;
with Xm_String_Defs;
with Xm_Text_Field;
with Xm_Toggle_Button_Gadget;

with Designer.Main_Window;
with Designer.Model_Utilities;
with Designer.Visual_Editor;
with Model.Allocations;
with Model.Names;
with Model.Queries;
with Model.Strings;
with Model.Tree.Constructors;
with Model.Tree.Designer;
with Model.Tree.Lists;
with Model.Tree.Xm_Ada;
with Model.Xt_Motif;

package body Designer.Properties_Editor.Renditions_Editor is

   use Designer.Model_Utilities;
   use Designer.Visual_Editor;
   use Interfaces.C;
   use Interfaces.C.Wide_Strings;
   use Model;
   use Model.Names;
   use Model.Queries;
   use Model.Strings;
   use Model.Tree;
   use Model.Tree.Constructors;
   use Model.Tree.Designer;
   use Model.Tree.Lists;
   use Model.Tree.Xm_Ada;
   use Model.Xt_Motif;
   use Xm;
   use Xm.Menu_Management;
   use Xm_Push_Button_Gadget;
   use Xm.Resource_Management;
   use Xm.Strings;
   use Xm_Cascade_Button_Gadget;
   use Xm_Drawing_Area;
   use Xm_Form;
   use Xm_Label_Gadget;
   use Xm_Message_Box;
   use Xm_Notebook;
   use Xm_Row_Column;
   use Xm_String_Defs;
   use Xm_Text_Field;
   use Xm_Toggle_Button_Gadget;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;
   use Xt.Utilities;

   Renditions_Editor          : Widget;
   Notebook                   : Widget;
   Page                       : Widget  := Null_Widget;
   Selected_Item              : Node_Id := Null_Node;
   Current_Resource_Node      : Node_Id := Null_Node;
   Xm_C_Unset                 : constant := 0;
   Xm_C_Set                   : constant := 1;
   Tag_Resource_Specification : Node_Id := Null_Node;

   type Annotation_Kinds is
    (Annotation_Empty,
     Annotation_Colormap_Resource_Value,
     Annotation_Enumeration_Resource_Value,
     Annotation_Enumeration_Value_Specification,
     Annotation_Integer_Resource_Value,
     Annotation_Pixel_Resource_Value,
     Annotation_Pixmap_Resource_Value,
     Annotation_Screen_Resource_Value,
     Annotation_Translation_Data_Resource_Value,
     Annotation_Xm_String_Resource_Value,
     Annotation_Resource_Specification);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
     record
        case Kind is
           when Annotation_Colormap_Resource_Value
           | Annotation_Enumeration_Resource_Value
           | Annotation_Integer_Resource_Value
           | Annotation_Pixel_Resource_Value
           | Annotation_Pixmap_Resource_Value
           | Annotation_Screen_Resource_Value
           | Annotation_Translation_Data_Resource_Value
           | Annotation_Xm_String_Resource_Value
           | Annotation_Resource_Specification             =>
              Value  : Widget;  --  Значение ресурса.
              Button : Widget;  --  Вызов редактора.

           when Annotation_Enumeration_Value_Specification =>
              Menu_Item : Widget;
              --  Кнопка выпадающего меню, используемого в меню опций значения
              --  ресурса.

           when Annotation_Empty                           =>
              null;
        end case;
     end record;

   package Annotation_Table is
     new GNAT.Table
          (Table_Component_Type => Annotation_Record,
           Table_Index_Type     => Node_Id,
           Table_Low_Bound      => Node_Id'First + 1,
           Table_Initial        => Model.Allocations.Node_Table_Initial,
           Table_Increment      => Model.Allocations.Node_Table_Increment);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Annotation_Table
   --!    <Purpose> Производит расширение таблицы для обеспечения возможности
   --! её использования для указанного узла. Все добавленные элементы
   --! инициализируются значениями по умолчанию.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table (Node : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <Purpose>
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Update_Item (Rendition : in Node_Id);

   package Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Cancel
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! "Закрыть".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Cancel (The_Widget : in Widget;
                           Closure    : in Xt_Pointer;
                           Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Cancel);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Create_In_Record_Changed
      --!    <Purpose> Подпрограмма обратного вызова при изменении состояния
      --! флага "create_in_record".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Create_In_Record_Changed (The_Widget : in Widget;
                                             Closure    : in Xt_Pointer;
                                             Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Create_In_Record_Changed);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_In_Record_Name_Activate
      --!    <Purpose> Подпрограмма обратного вызова при активации поля
      --! ввода имени переменной.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_In_Record_Name_Activate (The_Widget : in Widget;
                                            Closure    : in Xt_Pointer;
                                            Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_In_Record_Name_Activate);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Menu_Entry
      --!    <Purpose> Подпрограмма обратного вызова
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Menu_Entry (The_Widget : in Widget;
                               Closure    : in Xt_Pointer;
                               Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Menu_Entry);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Apply
      --!    <Purpose> Подпрограмма обратного вызова при активации кнопки
      --! "Apply".
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Apply (The_Widget : in Widget;
                          Closure    : in Xt_Pointer;
                          Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Apply);

       ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Page_Changed
      --!    <Purpose>
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Page_Changed (The_Widget : in Widget;
                                 Closure    : in Xt_Pointer;
                                 Call_Data  : in Xt_Pointer);
       pragma Convention (C, On_Page_Changed);

   end Callbacks;

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Apply
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Apply (The_Widget : in Widget;
                          Closure    : in Xt_Pointer;
                          Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         pragma Unreferenced (The_Widget);
         --  Параметры требуются для соответствия профилю подпрограмм обратного
         --  вызова Xt, но в них нет фактической необходимости.

         Rendition_Node : constant Node_Id := Parent_Node (Current_Resource_Node);

      begin
         Xt_Unmanage_Child (Renditions_Editor);
         Xt_Manage_Child (Get_Properties_Editor (Selected_Item));
         Designer.Main_Window.Update_Item (Rendition_Node);
      end On_Apply;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Cancel
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Cancel (The_Widget : in Widget;
                           Closure    : in Xt_Pointer;
                           Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Параметры требуются для соответствия профилю подпрограмм обратного
         --  вызова Xt, но в них нет фактической необходимости.

      begin
         Xt_Unmanage_Child (Renditions_Editor);
         Xt_Manage_Child (Get_Properties_Editor (Selected_Item));
      end On_Cancel;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Create_In_Record_Changed
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Create_In_Record_Changed (The_Widget : in Widget;
                                             Closure    : in Xt_Pointer;
                                             Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         --  Параметр требуется для соответствия профилю подпрограмм обратного
         --  вызова Xt, но в нём нет фактической необходимости.

         Node_New            : Node_Id;
         Button_Data         : constant Xm_Toggle_Button_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);

         Args                : Xt_Arg_List (0 .. 0);
         Page_Notebook_Info  : Xm_Notebook_Page_Info;
         Page_Number         : Xm_Notebook_Page_Number;
         Status              : Xm_Notebook_Page_Status;
         Rendition           : Node_Id := Null_Node;
         Rendition_Resources : List_Id := New_List;
         Rendition_Resource  : Node_Id := Null_Node;

      begin
         --  Получаем выбранную кнопку.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node_New'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         Xt_Set_Arg (Args (0),
                     Xm_N_Current_Page_Number,
                     Page_Number'Address);
         Xt_Get_Values (Notebook, Args (0 .. 0));

         Xm_Notebook_Get_Page_Info (Notebook,
                                    Page_Number,
                                    Page_Notebook_Info,
                                    Status);

         if Page_Notebook_Info.Major_Tab_Widget /= Null_Widget then
            Xt_Set_Arg (Args (0), Xm_N_User_Data, Rendition'Address);
            Xt_Get_Values (Page_Notebook_Info.Major_Tab_Widget, Args (0 .. 0));

         elsif Page_Notebook_Info.Minor_Tab_Widget /= Null_Widget then
            Xt_Set_Arg (Args (0), Xm_N_User_Data, Rendition'Address);
            Xt_Get_Values (Page_Notebook_Info.Minor_Tab_Widget, Args (0 .. 0));
         end if;

         if Rendition /= Null_Node then
            Rendition_Resources := Resources (Rendition);
            Rendition_Resource  :=
              Find_Resource_Value (Rendition_Resources, Node_New);
         end if;

         if Button_Data.Set = Xm_C_Set then

            case Node_Kind (Resource_Type (Node_New)) is
               when Node_Enumerated_Resource_Type =>
                  if Rendition_Resource = Null_Node then
                     Rendition_Resource := Create_Enumeration_Resource_Value;
                     Append (Rendition_Resources, Rendition_Resource);
                     Set_Resource_Specification
                      (Rendition_Resource, Node_New);
                   end if;

                when Node_Xm_String_Resource_Type =>
                   if Rendition_Resource = Null_Node then
                      Rendition_Resource := Create_String_Resource_Value;
                      Set_Resource_Specification
                       (Rendition_Resource, Node_New);
                      Append (Rendition_Resources, Rendition_Resource);
                   end if;

                when others =>
                   null;

              end case;

           elsif Button_Data.Set = Xm_C_Unset
             and Rendition_Resource /= Null_Node then
              Remove (Rendition_Resource);
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Create_In_Record_Changed", E);
      end On_Create_In_Record_Changed;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_In_Record_Name_Activate
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_In_Record_Name_Activate (The_Widget : in Widget;
                                            Closure    : in Xt_Pointer;
                                            Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Параметры требуются для соответствия профилю подпрограмм обратного
         --  вызова Xt, но в них нет фактической необходимости.

         Args                : Xt_Arg_List (0 .. 0);
         Node                : Node_Id;
         Page_Notebook_Info  : Xm_Notebook_Page_Info;
         Status              : Xm_Notebook_Page_Status;
         Rendition           : Node_Id := Null_Node;
         Page_Number         : Xm_Notebook_Page_Number;
         Name                : constant Wide_String
           := Xm_Text_Field_Get_String_Wcs (The_Widget);

         Rendition_Resources : List_Id;
         Rendition_Resource  : Node_Id;

      begin
         --  Извлекаем узел ресурса.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         Xt_Set_Arg (Args (0),
                     Xm_N_Current_Page_Number,
                     Page_Number'Address);
         Xt_Get_Values (Notebook, Args (0 .. 0));

         Xm_Notebook_Get_Page_Info (Notebook,
                                    Page_Number,
                                    Page_Notebook_Info,
                                    Status);

         if Page_Notebook_Info.Major_Tab_Widget /= Null_Widget then
            Xt_Set_Arg (Args (0), Xm_N_User_Data, Rendition'Address);
            Xt_Get_Values (Page_Notebook_Info.Major_Tab_Widget, Args (0 .. 0));

         elsif Page_Notebook_Info.Minor_Tab_Widget /= Null_Widget then
            Xt_Set_Arg (Args (0), Xm_N_User_Data, Rendition'Address);
            Xt_Get_Values (Page_Notebook_Info.Minor_Tab_Widget, Args (0 .. 0));
         end if;

         --  Сохранение нового имени.

         if Rendition /= Null_Node then
            Rendition_Resources := Resources (Rendition);
            Rendition_Resource  :=
              Find_Resource_Value (Rendition_Resources,
                                   Tag_Resource_Specification);
            Set_Resource_Value (Rendition_Resource, Store (Name));
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_In_Record_Name_Activate", E);
      end On_In_Record_Name_Activate;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Menu_Entry
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Menu_Entry (The_Widget : in Widget;
                               Closure    : in Xt_Pointer;
                               Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);

         Args                : Xt_Arg_List (0 .. 0);
         Menu                : Node_Id;
         Node                : Node_Id;
         Data                : constant Xm_Row_Column_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);

         Page_Info           : constant Xm_Notebook_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);

         Page_Notebook_Info  : Xm_Notebook_Page_Info;
         Status              : Xm_Notebook_Page_Status;
         Rendition           : Node_Id := Null_Node;
         Rendition_Resources : List_Id;
         Rendition_Resource  : Node_Id;

      begin
         --  Получаем выбранный элемент меню.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Menu'Address);
         Xt_Get_Values (Data.Widget, Args (0 .. 0));

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (Xm_Get_Posted_From_Widget (The_Widget), Args (0 .. 0));

         Xt_Set_Arg (Args (0),
                     Xm_N_Page_Number,
                     Xt_Arg_Val (Page_Info.Page_Number));
         Xt_Get_Values (Page, Args (0 .. 0));

         Xm_Notebook_Get_Page_Info (Notebook,
                                    Page_Info.Page_Number,
                                    Page_Notebook_Info,
                                    Status);

         if Page_Notebook_Info.Major_Tab_Widget /= Null_Widget then
            Xt_Set_Arg (Args (0), Xm_N_User_Data, Rendition'Address);
            Xt_Get_Values (Page_Notebook_Info.Major_Tab_Widget, Args (0 .. 0));

         elsif Page_Notebook_Info.Minor_Tab_Widget /= Null_Widget then
            Xt_Set_Arg (Args (0), Xm_N_User_Data, Rendition'Address);
            Xt_Get_Values (Page_Notebook_Info.Minor_Tab_Widget, Args (0 .. 0));
         end if;

         if Rendition /= Null_Node then
            Rendition_Resources := Resources (Rendition);

            Rendition_Resource :=
              Find_Resource_Value (Rendition_Resources, Node);

            if Rendition_Resource /= Null_Node then
               if Resource_Value (Rendition_Resource) /= Menu then
                  Set_Resource_Value (Rendition_Resource, Menu);
               end if;

            else
               Rendition_Resource := Create_Enumeration_Resource_Value;
               Set_Resource_Specification (Rendition_Resource, Node);
               Set_Resource_Value (Rendition_Resource,
                                   Menu);
               Append (Rendition_Resources, Rendition_Resource);
            end if;
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Menu_Entry", E);
      end On_Menu_Entry;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Page_Changed
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Page_Changed (The_Widget : in Widget;
                                 Closure    : in Xt_Pointer;
                                 Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);

         Page_Info          : constant Xm_Notebook_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);

         Args               : Xt_Arg_List (0 .. 0);
         Page_Notebook_Info : Xm_Notebook_Page_Info;
         Status             : Xm_Notebook_Page_Status;
         Rendition          : Node_Id := Null_Node;

      begin
         if Page = Null_Widget then
            return;
         end if;

         Xt_Set_Arg (Args (0),
                     Xm_N_Page_Number,
                     Xt_Arg_Val (Page_Info.Page_Number));
         Xt_Set_Values (Page, Args (0 .. 0));

         Xm_Notebook_Get_Page_Info (Notebook,
                                    Page_Info.Page_Number,
                                    Page_Notebook_Info,
                                    Status);

         if Page_Notebook_Info.Major_Tab_Widget /= Null_Widget then
            Xt_Set_Arg (Args (0), Xm_N_User_Data, Rendition'Address);
            Xt_Get_Values (Page_Notebook_Info.Major_Tab_Widget, Args (0 .. 0));

         elsif Page_Notebook_Info.Minor_Tab_Widget /= Null_Widget then
            Xt_Set_Arg (Args (0), Xm_N_User_Data, Rendition'Address);
            Xt_Get_Values (Page_Notebook_Info.Minor_Tab_Widget, Args (0 .. 0));
         end if;

         Update_Item (Rendition);
      end On_Page_Changed;

   end Callbacks;

   ------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Add
   --!    <ImplementationNotes>
   ------------------------------------------------------------------------
   procedure Add is
      New_Rendition       : Node_Id;
      Rendition_List      : List_Id;
      Name                : constant String_Id
        := Store (Image (Designer.Model_Utilities.New_Name ("Rendition")));

      Page_Number         : Xm_Notebook_Page_Number;
      Args                : Xt_Arg_List (0 .. 1);
      Label               : Widget;
      Tag_Name            : constant Node_Id
        := Create_Xm_String_Resource_Value;

      Rendition_Resources : constant List_Id := New_List;
      Str                 : constant Xm_String
        := Xm_String_Generate (Image (Name));

   begin
      New_Rendition := Create_Xm_Rendition;
      Set_Resource_Value (Tag_Name, Name);
      Append (Rendition_Resources, Tag_Name);

      pragma Assert (Tag_Resource_Specification /= Null_Node);

      Set_Resource_Specification (Tag_Name, Tag_Resource_Specification);
      Set_Resources (New_Rendition, Rendition_Resources);

      if Resource_Value (Current_Resource_Node) = Null_List then
         Rendition_List := New_List;
         Set_Resource_Value (Current_Resource_Node, Rendition_List);

      else
         Rendition_List := Resource_Value (Current_Resource_Node);
      end if;

      Append (Rendition_List, New_Rendition);

      Xt_Set_Arg (Args (0), Xm_N_User_Data, Xt_Arg_Val (New_Rendition));
      Xt_Set_Arg (Args (1), Xm_N_Label_String, Str);
      Label := Xm_Create_Managed_Push_Button_Gadget
       (Notebook, "page1", Args (0 .. 1));

      Xt_Set_Arg (Args (0), Xm_N_Page_Number, Page_Number'Address);
      Xt_Get_Values (Label, Args (0 .. 0));

      Xt_Set_Arg (Args (0),
                  Xm_N_Current_Page_Number,
                  Xt_Arg_Val (Page_Number));
      Xt_Set_Values (Notebook, Args (0 .. 0));

      Xm_String_Free (Str);
      Xt_Manage_Child (Page);
      Update_Item (New_Rendition);
   end Add;

   ------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete
   --!    <ImplementationNotes>
   ------------------------------------------------------------------------
   procedure Delete is
      Args        : Xt_Arg_List (0 .. 2);
      Page_Info   : Xm_Notebook_Page_Info;
      Status      : Xm_Notebook_Page_Status;
      Rendition   : Node_Id := Null_Node;
      Page_Number : Xm_Notebook_Page_Number;
      Last_Page   : Xm_Notebook_Page_Number;
      First_Page  : Xm_Notebook_Page_Number;

   begin
      --  Удаление страницы блокнота для соответствующего Rendition.

      Xt_Set_Arg (Args (0),
                  Xm_N_Current_Page_Number,
                  Page_Number'Address);
      Xt_Set_Arg (Args (1), Xm_N_First_Page_Number, First_Page'Address);
      Xt_Set_Arg (Args (2), Xm_N_Last_Page_Number, Last_Page'Address);
      Xt_Get_Values (Notebook, Args (0 .. 2));

      Xm_Notebook_Get_Page_Info (Notebook,
                                 Page_Number,
                                 Page_Info,
                                 Status);

      if Page_Info.Major_Tab_Widget /= Null_Widget then
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Rendition'Address);
         Xt_Get_Values (Page_Info.Major_Tab_Widget, Args (0 .. 0));
         Xt_Destroy_Widget (Page_Info.Major_Tab_Widget);

      elsif Page_Info.Minor_Tab_Widget /= Null_Widget then
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Rendition'Address);
         Xt_Get_Values (Page_Info.Major_Tab_Widget, Args (0 .. 0));
         Xt_Destroy_Widget (Page_Info.Minor_Tab_Widget);
      end if;

      if Last_Page /= First_Page then
         if First_Page = Page_Number then
            Xt_Set_Arg (Args (0),
                        Xm_N_Current_Page_Number,
                        Xt_Arg_Val (Last_Page));
         else
            Xt_Set_Arg (Args (0),
                        Xm_N_Current_Page_Number,
                        Xt_Arg_Val (First_Page));
         end if;

         Xt_Set_Values (Notebook, Args (0 .. 0));
      end if;

      Remove (Rendition);

   exception
      when E : others =>
         Designer.Main_Window.Put_Exception_In_Callback ("On_Delete", E);
   end Delete;

   -------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   -------------------------------------------------------------------------
   procedure Initialize (Parent   : in Widget;
                         Arg_List : in Xt_Arg_List)
   is
      Args        : Xt_Arg_List (0 .. 7);
      Button      : Widget;
      Form        : Widget;
      Message_Box : Widget;
      Title       : Widget;

   begin
      Renditions_Editor :=
        Xm_Create_Managed_Form (Parent, "subform", Arg_List);

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (2), Xm_N_Right_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (3), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Message_Box := Xm_Create_Managed_Message_Box
                      (Renditions_Editor, "message_box", Args (0 .. 3));
      Xt_Unmanage_Child (Xt_Name_To_Widget (Message_Box, "Help"));

      Xt_Add_Callback
       (Message_Box, Xm_N_Ok_Callback, Callbacks.On_Apply'Access);
      Xt_Add_Callback
       (Message_Box, Xm_N_Cancel_Callback, Callbacks.On_Cancel'Access);

      --  Создание блокнота свойств Xm_Rendition.

      Form := Xm_Create_Managed_Form (Message_Box, "top");

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (2), Xm_N_Right_Attachment, Xm_Attach_Form);
      Title :=
        Xm_Create_Managed_Label_Gadget (Form, "title", Args (0 .. 2));

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Top_Widget, Title);
      Xt_Set_Arg (Args (2), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (3), Xm_N_Right_Attachment, Xm_Attach_Form);
      Notebook :=
        Xm_Create_Managed_Notebook (Form, "notebook", Args (0 .. 3));

      Xt_Add_Callback (Notebook,
                       Xm_N_Page_Changed_Callback,
                       Callbacks.On_Page_Changed'Access);
      Button := Xt_Name_To_Widget (Notebook, "PageScroller");

      Xt_Unmanage_Child (Button);
      Xt_Unmanage_Child (Renditions_Editor);
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id)
   is
      Args             : Xt_Arg_List (0 .. 5);
      Current_Resource : Node_Id;
      Current_Value    : Node_Id;
      Str              : Xm_String;
      Pulldown_Menu    : Widget;
      Form             : Widget;

   begin
      Relocate_Annotation_Table (Node);

      if Node_Kind (Node) = Node_Project then

         --  Задание ресурсов для узла Node_Xm_Rendition.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Xt_Arg_Val (Node));
         Page := Xm_Create_Row_Column
          (Notebook, "rendition_page", Args (0 .. 0));

         Current_Resource := First (Resources (Xt_Motif_Rendition_Class));

         while Current_Resource /= Null_Node loop
            Form := Xm_Create_Managed_Form (Page, "notebook_form");

            Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Form);
            Xt_Set_Arg (Args (1), Xm_N_Bottom_Attachment, Xm_Attach_Form);
            Xt_Set_Arg (Args (2), Xm_N_Top_Attachment, Xm_Attach_Form);
            Xt_Set_Arg (Args (3),
                        Xm_N_User_Data,
                        Xt_Arg_Val (Current_Resource));

            Relocate_Annotation_Table (Current_Resource);

            pragma Assert
             (Annotation_Table.Table (Current_Resource).Button = Null_Widget);

            Annotation_Table.Table (Current_Resource).Button :=
              Xm_Create_Managed_Toggle_Button_Gadget
               (Form, "toggle_button", Args (0 .. 3));

            Xt_Add_Callback
             (Annotation_Table.Table (Current_Resource).Button,
              Xm_N_Value_Changed_Callback,
              Callbacks.On_Create_In_Record_Changed'Access);

            Str :=
              Xm_String_Generate
               (Internal_Resource_Name_Image (Current_Resource));

            Xt_Set_Arg (Args (0), Xm_N_Label_String, Str);
            Xt_Set_Values (Annotation_Table.Table (Current_Resource).Button,
                           Args (0 .. 0));
            Xm_String_Free (Str);

            case Node_Kind (Resource_Type (Current_Resource)) is

               when Node_Enumerated_Resource_Type =>

                  --  Создаем меню.

                  Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Widget);
                  Xt_Set_Arg (Args (1),
                              Xm_N_Left_Widget,
                              Annotation_Table.Table (Current_Resource).Button);
                  Xt_Set_Arg (Args (2), Xm_N_Right_Attachment, Xm_Attach_Form);

                  pragma Assert
                   (Annotation_Table.Table (Current_Resource).Value
                     = Null_Widget);

                  Annotation_Table.Table (Current_Resource).Value :=
                    Xm_Create_Option_Menu
                     (Form, "resource_menu", Args (0 .. 2));

                  Pulldown_Menu :=
                    Xm_Create_Pulldown_Menu
                     (Page, "resource_values");

                  Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, Pulldown_Menu);
                  Xt_Set_Arg (Args (1),
                              Xm_N_User_Data,
                              Xt_Arg_Val (Current_Resource));
                  Xt_Set_Values
                   (Annotation_Table.Table (Current_Resource).Value,
                    Args (0 .. 1));

                  Xt_Add_Callback (Pulldown_Menu,
                                   Xm_N_Entry_Callback,
                                   Callbacks.On_Menu_Entry'Access);

                  Current_Value := First (Value_Specifications
                                           (Resource_Type (Current_Resource)));

                  while Current_Value /= Null_Node loop
                     Xt_Set_Arg
                      (Args (0), Xm_N_User_Data, Xt_Arg_Val (Current_Resource));
                     Xt_Set_Values
                      (Annotation_Table.Table (Current_Resource).Value,
                       Args (0 .. 0));

                     Str := Xm_String_Generate
                             (Internal_Name_Image (Current_Value));
                     Xt_Set_Arg (Args (0), Xm_N_Label_String, Str);
                     Xt_Set_Arg (Args (1),
                                 Xm_N_User_Data,
                                 Xt_Arg_Val (Current_Value));

                     Relocate_Annotation_Table (Current_Value);
                     Annotation_Table.Table (Current_Value).Menu_Item
                       := Xm_Create_Managed_Push_Button_Gadget
                           (Pulldown_Menu, "resource_value", Args (0 .. 1));

                     Xm_String_Free (Str);
                     Current_Value := Next (Current_Value);
                  end loop;

                  Xt_Manage_Child
                   (Annotation_Table.Table (Current_Resource).Value);

               when Node_Predefined_Resource_Type =>
                  null;

               when Node_Xm_String_Resource_Type =>
                  Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Widget);
                  Xt_Set_Arg (Args (1),
                              Xm_N_Left_Widget,
                              Annotation_Table.Table (Current_Resource).Button);
                  Xt_Set_Arg (Args (2),
                              Xm_N_User_Data,
                              Xt_Arg_Val (Current_Resource));

                  Xm_Toggle_Button_Gadget_Set_State
                   (Annotation_Table.Table (Current_Resource).Button,
                    True,
                    False);
                  Xt_Set_Sensitive
                   (Annotation_Table.Table (Current_Resource).Button, False);
                  Annotation_Table.Table (Current_Resource).Value
                    := Xm_Create_Managed_Text_Field
                        (Form, "resource_name", Args (0 .. 2));

                  Xt_Add_Callback
                   (Annotation_Table.Table (Current_Resource).Value,
                    Xm_N_Losing_Focus_Callback,
                    Callbacks.On_In_Record_Name_Activate'Access);

                  if
                   Internal_Resource_Name_Image (Current_Resource) = "tag" then
                     Tag_Resource_Specification := Current_Resource;
                  end if;

               when others =>
                  null;
            end case;

            Current_Resource := Next (Current_Resource);
         end loop;
      end if;
   end Insert_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Open
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Open (Resource : in Model.Node_Id)
   is
      Args              : Xt_Arg_List (0 .. 1);
      Label             : Widget := Null_Widget;
      Current_Rendition : Node_Id;
      Rendition_List    : List_Id;
      Page_Info         : Xm_Notebook_Page_Info;
      First_Page        : Xm_Notebook_Page_Number;
      Last_Page         : Xm_Notebook_Page_Number;
      Status            : Xm_Notebook_Page_Status;
      Str               : Xm_String;
      Resource_Name     : Node_Id;
      Page_Number       : Xm_Notebook_Page_Number;

   begin
      pragma
        Assert (Node_Kind (Resource) = Node_Xm_Render_Table_Resource_Value);

      --  Создание копии значения

      Current_Resource_Node := Resource;

      Xt_Set_Arg (Args (0), Xm_N_First_Page_Number, First_Page'Address);
      Xt_Set_Arg (Args (1), Xm_N_Last_Page_Number, Last_Page'Address);
      Xt_Get_Values (Notebook, Args (0 .. 1));

      for J in First_Page .. Last_Page loop
         Xm_Notebook_Get_Page_Info (Notebook, J, Page_Info, Status);

         if Page_Info.Major_Tab_Widget /= Null_Widget then
            Xt_Destroy_Widget (Page_Info.Major_Tab_Widget);
         end if;

         if Page_Info.Minor_Tab_Widget /= Null_Widget then
            Xt_Destroy_Widget (Page_Info.Minor_Tab_Widget);
         end if;
      end loop;

      Rendition_List := Resource_Value (Current_Resource_Node);
      if Rendition_List /= Null_List then
         Current_Rendition := First (Rendition_List);

         while Current_Rendition /= Null_Node loop

            Xt_Set_Arg (Args (0),
                        Xm_N_User_Data, Xt_Arg_Val (Current_Rendition));
            Label := Xm_Create_Managed_Push_Button_Gadget
             (Notebook, "page1", Args (0 .. 0));

            if Resources (Current_Rendition) /= Null_List then
               Resource_Name := First (Resources (Current_Rendition));

               while Resource_Name /= Null_Node loop
                  if Resource_Specification (Resource_Name)
                    = Tag_Resource_Specification
                  then
                     Str := Xm_String_Generate
                      (Image (Resource_Value (Resource_Name)));
                     Xt_Set_Arg (Args (0), Xm_N_Label_String, Str);
                     Xt_Set_Values (Label, Args (0 .. 0));
                  end if;

                  Resource_Name := Next (Resource_Name);
               end loop;
            end if;

            Current_Rendition := Next (Current_Rendition);
         end loop;
      end if;

      if Label /= Null_Widget then
         Xt_Set_Arg (Args (0), Xm_N_Last_Page_Number, Page_Number'Address);
         Xt_Get_Values (Notebook, Args (0 .. 0));

         Xt_Set_Arg (Args (0),
                     Xm_N_Current_Page_Number,
                     Xt_Arg_Val (Page_Number));
         Xt_Set_Values (Notebook, Args (0 .. 0));
      end if;

      Xt_Manage_Child (Renditions_Editor);
   end Open;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Reinitialize is
   begin
      --  Удаление виджетов элементов меню.

      if Page /= Null_Widget then
         Xt_Destroy_Widget (Page);
      end if;

      Annotation_Table.Free;
      Annotation_Table.Init;
   end Reinitialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Annotation_Table
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table (Node : in Node_Id) is
      First : constant Node_Id := Annotation_Table.Last + 1;

   begin
      --  Таблица уже имеет достаточный размер и не нуждается в расширении.

      if Annotation_Table.Last >= Node then
         return;
      end if;

      Annotation_Table.Set_Last (Node);

      for J in First .. Node loop
         case Node_Kind (J) is
            when Node_Colormap_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind   => Annotation_Colormap_Resource_Value,
                 Value  => Null_Widget,
                 Button => Null_Widget);

            when Node_Enumeration_Value_Specification =>
               Annotation_Table.Table (J) :=
                (Kind      => Annotation_Enumeration_Value_Specification,
                 Menu_Item => Null_Widget);

            when Node_Enumeration_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind   => Annotation_Enumeration_Resource_Value,
                 Value  => Null_Widget,
                 Button => Null_Widget);


            when Node_Integer_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind   => Annotation_Integer_Resource_Value,
                 Value  => Null_Widget,
                 Button => Null_Widget);

            when Node_Pixel_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind   => Annotation_Pixel_Resource_Value,
                 Value  => Null_Widget,
                 Button => Null_Widget);

            when Node_Pixmap_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind   => Annotation_Pixmap_Resource_Value,
                 Value  => Null_Widget,
                 Button => Null_Widget);

            when Node_Resource_Specification =>
               Annotation_Table.Table (J) :=
                (Kind   => Annotation_Resource_Specification,
                 Value  => Null_Widget,
                 Button => Null_Widget);

           when Node_Screen_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind   => Annotation_Screen_Resource_Value,
                 Value  => Null_Widget,
                 Button => Null_Widget);

            when Node_Translation_Data_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind   => Annotation_Translation_Data_Resource_Value,
                 Value  => Null_Widget,
                 Button => Null_Widget);

            when Node_Xm_String_Resource_Value =>
               Annotation_Table.Table (J) :=
                (Kind   => Annotation_Xm_String_Resource_Value,
                 Value  => Null_Widget,
                 Button => Null_Widget);

            when others =>
               Annotation_Table.Table (J) := (Kind => Annotation_Empty);
         end case;
      end loop;
   end Relocate_Annotation_Table;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Node_Id) is
   begin
      Selected_Item := Node;
   end Select_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Rendition : in Node_Id)
   is
      Args               : Xt_Arg_List (0 .. 0);
      Current_Resource   : Node_Id;
      Rendition_Resource : Node_Id;
      Res_List           : List_Id;

   begin
      if Rendition = Null_Node then
         return;
      end if;

      Res_List := Resources (Rendition);

      if Res_List /= Null_List then
           Current_Resource := First (Resources (Xt_Motif_Rendition_Class));

           while Current_Resource /= Null_Node loop
              Rendition_Resource :=
                Find_Resource_Value (Res_List, Current_Resource);

              if Rendition_Resource /= Null_Node then
                 Xm_Toggle_Button_Gadget_Set_State
                  (Annotation_Table.Table (Current_Resource).Button,
                   True,
                   False);

                  case Node_Kind (Resource_Type (Current_Resource)) is
                     when Node_Enumerated_Resource_Type =>
                        if Annotation_Table.Table
                         (Resource_Value
                          (Rendition_Resource)).Menu_Item /= Null_Widget then

                           Xt_Set_Arg (Args (0),
                                       Xm_N_Menu_History,
                                       Annotation_Table.Table
                                        (Resource_Value
                                         (Rendition_Resource)).Menu_Item);
                           Xt_Set_Values
                           (Annotation_Table.Table (Current_Resource).Value,
                            Args (0 .. 0));

                        end if;

                     when Node_Xm_String_Resource_Type =>
                        Xm_Text_Field_Set_String_Wcs
                          (Annotation_Table.Table (Current_Resource).Value,
                           Image (Resource_Value (Rendition_Resource)));

                     when others =>
                        null;
                  end case;

               else
                  Xm_Toggle_Button_Gadget_Set_State
                   (Annotation_Table.Table (Current_Resource).Button,
                    False,
                    False);
               end if;

              Current_Resource := Next (Current_Resource);
           end loop;
       end if;
   end Update_Item;

end Designer.Properties_Editor.Renditions_Editor;
