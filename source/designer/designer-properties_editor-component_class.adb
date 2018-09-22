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

with Interfaces.C.Wide_Strings;

with Xm;
with Xm.Resource_Management;
with Xm_Form;
with Xm_Label_Gadget;
with Xm_String_Defs;
with Xm_Text_Field;
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

   use Interfaces.C;
   use Interfaces.C.Wide_Strings;

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
      --!    <Unit> Has_Identifier_Error
      --!    <Purpose> Подпрограмма проверки  имени идентификатора на
      --! соответствие стандарту именования идентификаторов
      --!    <Exceptions>
      ------------------------------------------------------------------------
      function Has_Identifier_Error (Str : in Wide_String) return Boolean;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Has_Key_Word_Error
      --!    <Purpose> Подпрограмма проверки соответствия
      --! имени идентификатора ключевому слову.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      function Has_Key_Word_Error (Tmp_Str : in Wide_String) return Boolean;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Has_Underline_Dup
      --!    <Purpose> Подпрограмма проверки на двойное подчеркивание в
      --! имени идентификатора.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      function Has_Underline_Dup (Str : in Wide_String) return Boolean;

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
      --!    <Unit> On_Package_Name_Text_Verify
      --!    <Purpose> Подпрограмма обратного вызова
      --! при изменении текста поле имени пакета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Package_Name_Text_Verify (The_Widget : in Widget;
                                             Closure    : in Xt_Pointer;
                                             Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Package_Name_Text_Verify);

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

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Record_Name_Text_Verify
      --!    <Purpose> Подпрограмма обратного вызова
      --! при изменении текста поле имени записи.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Record_Name_Text_Verify (The_Widget : in Widget;
                                            Closure    : in Xt_Pointer;
                                            Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Record_Name_Text_Verify);

   end Callbacks;

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Has_Identifier_Error
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Has_Identifier_Error (Str : in Wide_String) return Boolean is
         Result : Boolean;

      begin
         case  Str (Str'First) is
            when 'a' .. 'z' | 'A' .. 'Z' =>
               Result := True;

            when others =>
               return False;
         end case;

         case Str (Str'Last) is
            when 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' =>
               Result := True;

            when others =>
               return False;
         end case;

         for J in Str'First + 1 .. Str'Last loop
            case Str (J) is
               when 'A' .. 'Z' | 'a' .. 'z' | '0' .. '9' | '_' =>
                  Result := True;

               when others =>
                  return False;
            end case;
         end loop;

         return Result;
      end Has_Identifier_Error;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Has_Key_Word_Error
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Has_Key_Word_Error (Tmp_Str : in Wide_String) return Boolean is

         ---------------------------------------------------------------------
         --! <Subprogram>
         --!    <Unit> To_Lower
         --!    <Purpose> Подпрограмма перевода символов строки типа
         --! Wide_String в нижний регистр.
         --!    <Exceptions>
         ---------------------------------------------------------------------
         function To_Lower (Str : in Wide_String) return Wide_String;

         ---------------------------------------------------------------------
         --! <Subprogram>
         --!    <Unit> To_Lower
         --!    <ImplementationNotes>
         ---------------------------------------------------------------------
         function To_Lower (Str : in Wide_String) return Wide_String is
            Result : Wide_String (Str'First .. Str'Last);

         begin
            for J in Str'First .. Str'Last loop
               case Str (J) is
                  when 'A' .. 'Z' =>
                     Result (J) :=
                        Wide_Character'Val
                         (Wide_Character'Pos (Str (J)) + 32);

                  when others =>
                     Result (J) := Str (J);
               end case;
            end loop;

            return Result;
         end To_Lower;

         Str : constant Wide_String := To_Lower (Tmp_Str);
      begin
         if Str = "abort"
           or else Str = "abs"
           or else Str = "abstract"
           or else Str = "accept"
           or else Str = "access"
           or else Str = "aliased"
           or else Str = "all"
           or else Str = "and"
           or else Str = "array"
           or else Str = "at"
           or else Str = "begin"
           or else Str = "body"
           or else Str = "case"
           or else Str = "constant"
           or else Str = "declare"
           or else Str = "delay"
           or else Str = "delta"
           or else Str = "digits"
           or else Str = "do"
           or else Str = "else"
           or else Str = "elsif"
           or else Str = "end"
           or else Str = "entry"
           or else Str = "exception"
           or else Str = "exit"
           or else Str = "for"
           or else Str = "function"
           or else Str = "generic"
           or else Str = "goto"
           or else Str = "if"
           or else Str = "in"
           or else Str = "interface"
           or else Str = "is"
           or else Str = "limited"
           or else Str = "loop"
           or else Str = "mod"
           or else Str = "new"
           or else Str = "not"
           or else Str = "null"
           or else Str = "of"
           or else Str = "or"
           or else Str = "others"
           or else Str = "out"
           or else Str = "overriding"
           or else Str = "package"
           or else Str = "pragma"
           or else Str = "private"
           or else Str = "procedure"
           or else Str = "protected"
           or else Str = "raise"
           or else Str = "range"
           or else Str = "record"
           or else Str = "rem"
           or else Str = "renames"
           or else Str = "return"
           or else Str = "requeue"
           or else Str = "reverse"
           or else Str = "select"
           or else Str = "separate"
           or else Str = "subtype"
           or else Str = "synchronized"
           or else Str = "tagged"
           or else Str = "task"
           or else Str = "terminate"
           or else Str = "then"
           or else Str = "type"
           or else Str = "until"
           or else Str = "use"
           or else Str = "when"
           or else Str = "while"
           or else Str = "with"
           or else Str = "xor"
         then
            return True;

         else
            return False;
         end if;
      end Has_Key_Word_Error;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Has_Underline_Dup
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Has_Underline_Dup (Str : in Wide_String) return Boolean is
      begin
         for J in Str'First + 1 .. Str'Last loop
            if Str (J - 1) = '_' and then Str (J) = '_' then
               return True;
            end if;
         end loop;

         return False;
      end Has_Underline_Dup;

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

      begin
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         pragma Assert (Node /= Null_Node);
         pragma Assert (Node_Kind (Node) = Node_Component_Class);

         if Has_Key_Word_Error (Name) then
            Designer.Main_Window.Put_Line
             ("Keyword cannot be used as package name ");
         end if;

         Set_Package_Name (Node, Store (Name));

         exception
            when E : others =>
               Designer.Main_Window.Put_Exception_In_Callback
                ("On_Package_Name_Activate", E);
      end On_Package_Name_Activate;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Package_Name_Text_Verify
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Package_Name_Text_Verify (The_Widget : in Widget;
                                             Closure    : in Xt_Pointer;
                                             Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);

         Node : Node_Id;
         Args : Xt_Arg_List (0 .. 0);

         Verify_Text : constant Xm_Text_Verify_Callback_Struct_Wcs_Access
           := To_Callback_Struct_Access (Call_Data);
         Name        : constant Wide_String
           := Xm_Text_Field_Get_String_Wcs (The_Widget);
         Text_Name   : constant Xm_Text_Block_Wcs
           := Verify_Text.Text;
         Start_Pos   : constant Integer
           := Integer (Verify_Text.Start_Pos);
         End_Pos     : constant Integer
           := Integer (Verify_Text.End_Pos);

      begin
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         pragma Assert (Node /= Null_Node);
         pragma Assert (Node_Kind (Node) = Node_Component_Class);

         if Text_Name.Pointer /= Null_Ptr
           and then Interfaces.C.Wide_Strings.Wcslen (Text_Name.Pointer) /= 0
         then
            declare
               Str : constant Wide_String
                 := Value (Text_Name.Pointer,
                           Interfaces.C.Wide_Strings.Wcslen
                            (Text_Name.Pointer));

               Aux : Wide_String
                      (Name'First
                       .. Name'Last + Str'Length + Start_Pos - End_Pos);

            begin
               Aux (Aux'First .. Start_Pos) := Name (Name'First .. Start_Pos);
               Aux (Start_Pos + 1 .. Start_Pos + Str'Length) := Str;
               Aux (Start_Pos + Str'Length + 1
                      .. Start_Pos + Str'Length + Name'Last - End_Pos)
                 := Name (End_Pos + 1 .. Name'Last);

               Verify_Text.Do_It := To_Xt_Boolean (Has_Identifier_Error (Aux));

               if Has_Underline_Dup (Aux) then
                 Designer.Main_Window.Put_Line
                  ("Package Name can't contain "
                     & "two underline symbols one after another");
               end if;

            end;
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Package_Name_Text_Verify", E);
      end On_Package_Name_Text_Verify;

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

      begin
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         pragma Assert (Node /= Null_Node);
         pragma Assert (Node_Kind (Node) = Node_Component_Class);

         if Has_Key_Word_Error (Name) then
            Designer.Main_Window.Put_Line
             ("Keyword cannot be used as record name ");
         end if;

         Set_Type_Name (Node, Store (Name));

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Record_Name_Activate", E);
      end On_Record_Name_Activate;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Record_Name_Text_Verify
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Record_Name_Text_Verify (The_Widget : in Widget;
                                            Closure    : in Xt_Pointer;
                                            Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);

         Node : Node_Id;
         Args : Xt_Arg_List (0 .. 0);

         Verify_Text : constant Xm_Text_Verify_Callback_Struct_Wcs_Access
           := To_Callback_Struct_Access (Call_Data);
         Name        : constant Wide_String
           := Xm_Text_Field_Get_String_Wcs (The_Widget);
         Text_Name   : constant Xm_Text_Block_Wcs
           := Verify_Text.Text;
         Start_Pos   : constant Integer
           := Integer (Verify_Text.Start_Pos);
         End_Pos     : constant Integer
           := Integer (Verify_Text.End_Pos);

      begin
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         pragma Assert (Node /= Null_Node);
         pragma Assert (Node_Kind (Node) = Node_Component_Class);

         if Text_Name.Pointer /= Null_Ptr
           and then Interfaces.C.Wide_Strings.Wcslen (Text_Name.Pointer) /= 0
         then
            declare
               Str : constant Wide_String
                 := Value (Text_Name.Pointer,
                        Interfaces.C.Wide_Strings.Wcslen (Text_Name.Pointer));
               Aux : Wide_String
                      (Name'First
                         .. Name'Last + Str'Length + Start_Pos - End_Pos);
            begin
               Aux (Aux'First .. Start_Pos) := Name (Name'First .. Start_Pos);
               Aux (Start_Pos + 1 .. Start_Pos + Str'Length) := Str;
               Aux (Start_Pos + Str'Length + 1
                      .. Start_Pos + Str'Length + Name'Last - End_Pos)
                 := Name (End_Pos + 1 .. Name'Last);

               Verify_Text.Do_It := To_Xt_Boolean (Has_Identifier_Error (Aux));

               if Has_Underline_Dup (Aux) then
                  Designer.Main_Window.Put_Line
                   ("Record Name can't contain"
                      & "two underline symbols one after another");
               end if;
            end;
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Package_Name_Activate", E);
      end On_Record_Name_Text_Verify;

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
      Xt_Add_Callback (Element,
                       Xm_N_Modify_Verify_Callback_Wcs,
                       Callbacks.On_Package_Name_Text_Verify'Access);

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
      Xt_Add_Callback (Element,
                       Xm_N_Modify_Verify_Callback_Wcs,
                       Callbacks.On_Record_Name_Text_Verify'Access);
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
