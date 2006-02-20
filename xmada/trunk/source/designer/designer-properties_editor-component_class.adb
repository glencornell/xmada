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
--! <Unit>
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Xm;
with Xm.Resource_Management;
with Xm_Form;
with Xm_Label_Gadget;
with Xm_String_Defs;
with Xm_Text_Field;
with Xt.Ancillary_Types;
with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;

with Designer.Main_Window;
with Model.Queries;
with Model.Tree.Xm_Ada;
with Model.Names;
with Model.Strings;

package body Designer.Properties_Editor.Component_Class is

   use Model;
   use Model.Queries;
   use Model.Strings;
   use Model.Tree;
   use Model.Tree.Xm_Ada;
   use Model.Names;
   use Xm;
   use Xm.Resource_Management;
   use Xm_Form;
   use Xm_Label_Gadget;
   use Xm_String_Defs;
   use Xm_Text_Field;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;

   package Callbacks is
      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Class_Name_Changed
      --!    <Purpose> Подпрограмма обратного вызова изменении имени класса.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Class_Name_Changed (The_Widget : in Widget;
                                       Closure    : in Xt_Pointer;
                                       Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Class_Name_Changed);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Package_Name_Activate
      --!    <Purpose> Подпрограмма обратного вызова
      --! при изменении имени пакета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Package_Name_Activate (The_Widget : in Widget;
                                          Closure    : in Xt_Pointer;
                                          Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Package_Name_Activate);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Record_Name_Activate
      --!    <Purpose> Подпрограмма обратного вызова
      --! при изменении имени записи.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Record_Name_Activate (The_Widget : in Widget;
                                         Closure    : in Xt_Pointer;
                                         Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Record_Name_Activate);

   end Callbacks;

   package body Callbacks is
      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Class_Name_Changed
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Class_Name_Changed (The_Widget : in Widget;
                                       Closure    : in Xt_Pointer;
                                       Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Name : Name_Id;
         Node : Node_Id;
         Args : Xt_Arg_List (0 .. 0);

      begin
         --  Получаем значение текущего узла.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         pragma Assert (Node /= Null_Node);

         Name := Enter (Xm_Text_Field_Get_String_Wcs (The_Widget));
         Set_Name (Node, Name);
         Main_Window.Update_Item (Node);

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Class_Name_Changed", E);
      end On_Class_Name_Changed;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Package_Name_Activate
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Package_Name_Activate (The_Widget : in Widget;
                                          Closure    : in Xt_Pointer;
                                          Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Node : Node_Id;
         Args : Xt_Arg_List (0 .. 0);
         Name : constant Wide_String
           := Xm_Text_Field_Get_String_Wcs (The_Widget);
         --  TODO необходимо реализовать проверку
         --  на допустимость идентификатора имени.

      begin
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         pragma Assert (Node /= Null_Node);
         pragma Assert (Node_Kind (Node) = Node_Component_Class);

         Set_Package_Name (Node, Store (Name));

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Package_Name_Activate", E);
      end On_Package_Name_Activate;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Record_Name_Activate
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Record_Name_Activate (The_Widget : in Widget;
                                         Closure    : in Xt_Pointer;
                                         Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Node : Node_Id;
         Args : Xt_Arg_List (0 .. 0);
         Name : constant Wide_String
           := Xm_Text_Field_Get_String_Wcs (The_Widget);
         --  TODO необходимо реализовать проверку
         --  на допустимость идентификатора имени.

      begin
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         pragma Assert (Node /= Null_Node);
         pragma Assert (Node_Kind (Node) = Node_Component_Class);

         Set_Type_Name (Node, Store (Name));

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Record_Name_Activate", E);
      end On_Record_Name_Activate;

   end Callbacks;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create (Parent   : in Widget;
                    Arg_List : in Xt_Arg_List;
                    Node     : in Model.Node_Id)
     return Node_Properties_Editor_Access
   is
      Args      : Xt_Arg_List (0 .. 6);
      Result    : constant Component_Class_Properties_Editor_Access
        := new Component_Class_Properties_Editor (Node);
      Element   : Widget;
      Form      : Widget;
      Label     : Widget;
      Alignment : Alignment_Widget_List (1 .. 3);

   begin
      Result.Form := Xm_Create_Managed_Form (Parent, "subform", Arg_List);

      Form := Xm_Create_Managed_Form (Result.Form, "form");

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (2), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Label  := Xm_Create_Managed_Label_Gadget
                   (Form, "name", Args (0 .. 2));

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Left_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (2), Xm_N_Left_Widget, Label);
      Xt_Set_Arg (Args (3), Xm_N_User_Data, Xt_Arg_Val (Node));
      Element := Xm_Create_Managed_Text_Field
                  (Form, "class_name", Args (0 .. 3));

      Xm_Text_Field_Set_String_Wcs (Element, Name_Image (Node));
      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Class_Name_Changed'Access);
      Xt_Add_Callback (Element,
                       Xm_N_Losing_Focus_Callback,
                       Callbacks.On_Class_Name_Changed'Access);
      Alignment (1).L_Widget := Label;
      Alignment (1).R_Widget := Element;

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Top_Widget, Element);
      Form := Xm_Create_Managed_Form (Result.Form, "form", Args (0 .. 1));

      --  Создание поля "Имя пакета".

      Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (2), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Label := Xm_Create_Managed_Label_Gadget
               (Form, "package_name", Args (0 .. 2));

      Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Left_Widget, Label);
      Xt_Set_Arg (Args (2), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (3), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (4), Xm_N_User_Data, Xt_Arg_Val (Node));
      Element :=
        Xm_Create_Managed_Text_Field (Form,
                                      "package_name_text",
                                      Args (0 .. 4));

      --  Если не задано имя тип, по умолчанию используется имя компонента,
      --  с "s" на конце.

      if Package_Name (Node) = Null_String then
         Xm_Text_Field_Set_String_Wcs (Element, Name_Image (Node) & "s");
         Set_Package_Name (Node, Store (Name_Image (Node) & "s"));
      end if;

      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Package_Name_Activate'Access);
      Xt_Add_Callback (Element,
                       Xm_N_Losing_Focus_Callback,
                       Callbacks.On_Package_Name_Activate'Access);
      Alignment (2).L_Widget := Label;
      Alignment (2).R_Widget := Element;

      --  Поле ввода имени записи.

      Xt_Set_Arg (Args (0), Xm_N_Top_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Top_Widget, Element);
      Form := Xm_Create_Managed_Form (Result.Form, "form", Args (0 .. 1));

      Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (1), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (2), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Label := Xm_Create_Managed_Label_Gadget
               (Form, "record_name", Args (0 .. 2));

      Xt_Set_Arg (Args (0), Xm_N_Left_Attachment, Xm_Attach_Widget);
      Xt_Set_Arg (Args (1), Xm_N_Left_Widget, Label);
      Xt_Set_Arg (Args (2), Xm_N_Right_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (3), Xm_N_Top_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (4), Xm_N_Bottom_Attachment, Xm_Attach_Form);
      Xt_Set_Arg (Args (5), Xm_N_User_Data, Xt_Arg_Val (Node));
      Element :=
      Xm_Create_Managed_Text_Field (Form,
                                    "record_name_text",
                                    Args (0 .. 5));

      --  Если не задано имя типа, то используется по умолчанию
      --  имя компонента.

      if Type_Name (Node) = Null_String then
         Xm_Text_Field_Set_String_Wcs (Element, Name_Image (Node));
         Set_Package_Name (Node, Store (Name_Image (Node)));
      end if;

      Xt_Add_Callback (Element,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Record_Name_Activate'Access);
      Xt_Add_Callback (Element,
                       Xm_N_Losing_Focus_Callback,
                       Callbacks.On_Record_Name_Activate'Access);
      Alignment (3).L_Widget := Label;
      Alignment (3).R_Widget := Element;

      Do_Alignment (Alignment);

      return Node_Properties_Editor_Access (Result);
   end Create;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Finalize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Finalize (Object : in out Component_Class_Properties_Editor) is
      pragma Assert (Object.Form /= Null_Widget);

   begin
     Xt_Destroy_Widget (Object.Form);
   end Finalize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Hide
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Hide (Object : access Component_Class_Properties_Editor) is
      pragma Assert (Object.Form /= Null_Widget);

   begin
      Xt_Unmanage_Child (Object.Form);
   end Hide;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Properties
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Properties (Node : in Node_Id)
   is
   begin
      null;
   end Set_Properties;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Show
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Show (Object : access Component_Class_Properties_Editor) is
      pragma Assert (Object.Form /= Null_Widget);

   begin
      Xt_Manage_Child (Object.Form);
   end Show;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Node_Id)
   is
   begin
      null;
   end Update_Item;

end Designer.Properties_Editor.Component_Class;
