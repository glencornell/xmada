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
--! <Unit> Designer.Tree_Editor
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C.Strings;
with System;
with GNAT.Table;

with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;
with Xt.Translation_Management;
with Xt.Utilities;
with Xm.Menu_Management;
with Xm.Resource_Management;
with Xm.Strings;
with Xm_Cascade_Button_Gadget;
with Xm_Container;
with Xm_Icon_Gadget;
with Xm_Message_Box;
with Xm_Notebook;
with Xm_Push_Button;
with Xm_Push_Button_Gadget;
with Xm_Row_Column;
with Xm_Scrolled_Window;
with Xm_Separator_Gadget;
with Xm_String_Defs;

with Designer.Main_Window;
with Designer.Model_Utilities;
with Designer.Operations;
with Designer.Palette;
with Model.Allocations;
with Model.Names;
with Model.Queries;
with Model.Tree.E_Lists;
with Model.Tree.Lists;
with Model.Xt_Motif;

package body Designer.Tree_Editor is

   use Designer.Model_Utilities;
   use Designer.Operations;
   use Designer.Palette;
   use Model;
   use Model.Allocations;
   use Model.Names;
   use Model.Queries;
   use Model.Tree;
   use Model.Tree.E_Lists;
   use Model.Tree.Lists;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;
   use Xt.Translation_Management;
   use Xt.Utilities;
   use Xm;
   use Xm.Menu_Management;
   use Xm.Resource_Management;
   use Xm.Strings;
   use Xm_Cascade_Button_Gadget;
   use Xm_Container;
   use Xm_Icon_Gadget;
   use Xm_Message_Box;
   use Xm_Notebook;
   use Xm_Push_Button;
   use Xm_Push_Button_Gadget;
   use Xm_Row_Column;
   use Xm_Scrolled_Window;
   use Xm_Separator_Gadget;
   use Xm_String_Defs;

   bool_msg_w : Boolean := False;

   --  Для каждого узла создаётся (по запросу) свой собственный редактор
   --  дерева. Уже созданные редакторы свойств сохраняются в таблице
   --  Annotation_Table.

   type Annotation_Kinds is
    (Annotation_Empty,
     Annotation_Component_Class,
     Annotation_Application,
     Annotation_Project,
     Annotation_Widget_Instance);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
   record
      case Kind is
         when Annotation_Component_Class =>
            CC_Project_Tree_Icon   : Widget;
            --  Иконка в дереве проекта.

            CC_Component_Tree_Icon : Widget;
            --  Иконка в дереве класса компонент.

            Component_Container    : Widget;
            --  Контайнер страницы класса компонент.

            Component_Tab          : Widget;
            --  Закладка страницы класса компонент.

            Button                 : Widget;
            --  Кнопка в всплывающем меню.

         when Annotation_Widget_Instance =>
            WI_Component_Tree_Icon : Widget;
            --  Иконка в дереве класса компонент.

         when Annotation_Application     =>
            NA_Project_Tree_Icon   : Widget;
            --  Иконка в дереве проекта.

         when Annotation_Project         =>
            NP_Project_Tree_Icon   : Widget;
            --  Иконка в дереве проекта.

         when Annotation_Empty =>
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

   Actions         : Xt_Action_List (0 .. 0);
   Menu            : Widget;
   Widget_Set_Menu : Widget;
   Project_Node    : Node_Id;
   Project_Tab     : Widget;

   --  Элементы всплывающего меню на вкладке project

   New_Component      : Widget := Null_Widget;
   Delete_Component   : Widget := Null_Widget;
   Delete_Application : Widget := Null_Widget;

   Xm_C_New_Application    : constant := 1;
   Xm_C_New_Component      : constant := 2;
   Xm_C_Delete_Application : constant := 3;
   Xm_C_Delete_Component   : constant := 4;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Component_Container
   --!    <Purpose> Возвращает виджет контейнера класса компонента.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Component_Container (Node : in Node_Id) return Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Component_Tab
   --!    <Purpose> Возвращает виджет закладки страницы класса компонента.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Component_Tab (Node : in Node_Id) return Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Node_Table
   --!    <Purpose> Производит расширение таблицы для обеспечения возможности
   --! её использования для указанного узла. Все добавленные элементы
   --! инициализируются значениями по умолчанию.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table (Node : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Item_Icon
   --!    <Purpose> Создаёт виджет, представляющий указанный элемент дерева
   --! модели на странице редактора дерева.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Create_Item_Icon (Node      : in Node_Id;
                              Container : in Widget;
                              Parent    : in Widget := Null_Widget)
     return Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Project_Tree_Icon
   --!    <Purpose> Возвращает виджет элемента модели, представляющий элемент
   --! на дереве проекта.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Project_Tree_Icon (Node : in Node_Id) return Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Component_Container_Icon
   --!    <Purpose> Возвращает виджет элемента модели, представляющий элемент
   --! на дереве компонента.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Component_Tree_Icon (Node : in Node_Id) return Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Return_Kind_Constraint_Resurse_Node
   --!    <Purpose> Возвращает Node_Id Constraint ресурса
   --! ссылающегося на Node.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Return_Kind_Constraint_Resurse_Node (Node : in Node_Id)
     return EList_Id;

   package Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Activate
      --!    <Purpose> Подпрограмма обратного вызова при выделении виджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Activate (The_Widget : in Widget;
                             Closure    : in Xt_Pointer;
                             Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Activate);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Delete
      --!    <Purpose> Подпрограмма обратного вызова при удалении виджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Delete (The_Widget : in Widget;
                           Event      : in X_Event;
                           Params     : in System.Address;
                           Num_Params : in Cardinal);
      pragma Convention (C, On_Delete);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Delete_Message_Box_Ok
      --!    <Purpose> Ок в окне подтверждения при удалении виджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Delete_Message_Box_Ok (The_Widget : in Widget;
                                          Closure    : in Xt_Pointer;
                                          Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Delete_Message_Box_Ok);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Delete_Message_Box_Cancel
      --!    <Purpose> Cancel в окне подтверждения при удалении виджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Delete_Message_Box_Cancel (The_Widget : in Widget;
                                              Closure    : in Xt_Pointer;
                                              Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Delete_Message_Box_Cancel);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Component
      --!    <Purpose> Подпрограмма обратного вызова при выборе элемента
      --! из всплывающего меню.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Popup_Component (The_Widget : in Widget;
                                    Closure    : in Xt_Pointer;
                                    Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Popup_Component);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Insert_Widget
      --!    <Purpose> Подпрограмма обратного вызова при добавлении виджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Popup_Insert_Widget (The_Widget : in Widget;
                                        Closure    : in Xt_Pointer;
                                        Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Popup_Insert_Widget);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Notebook
      --!    <Purpose> Подпрограмма обратного вызова при выборе элемента
      --! из всплывающего меню.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Popup_Notebook (The_Widget : in Widget;
                                   Closure    : in Xt_Pointer;
                                   Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Popup_Notebook);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Project
      --!    <Purpose> Подпрограмма обратного вызова при выборе элемента
      --! из всплывающего меню.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Popup_Project (The_Widget : in Widget;
                                  Closure    : in Xt_Pointer;
                                  Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Popup_Project);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Project_Activate
      --!    <Purpose> Подпрограмма обратного вызова при активации
      --! элемента меню.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Popup_Project_Activate (The_Widget : in Widget;
                                           Closure    : in Xt_Pointer;
                                           Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Popup_Project_Activate);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Project_Map
      --!    <Purpose> Подпрограмма обратного вызова при отображении
      --! всплывающего меню на вкладке project.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Popup_Project_Map (The_Widget : in Widget;
                                      Closure    : in Xt_Pointer;
                                      Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Popup_Project_Map);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Project_Tab_Mapped
      --!    <Purpose> Подпрограмма обратного вызова
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Popup_Project_Tab_Mapped (The_Widget : in Widget;
                                             Closure    : in Xt_Pointer;
                                             Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Popup_Project_Tab_Mapped);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Select
      --!    <Purpose> Подпрограмма обратного вызова при выделении виджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Select (The_Widget : in Widget;
                           Closure    : in Xt_Pointer;
                           Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Select);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Tab_Close
      --!    <Purpose> Подпрограмма обратного вызова при
      --! закрытии активной вкладки.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Popup_Tab_Close (The_Widget : in Widget;
                                    Closure    : in Xt_Pointer;
                                    Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Popup_Tab_Close);

   end Callbacks;

   Notebook          : Widget;
   --  элемент, на котором находятся все вкладки

   Project_Container : Widget;
   --  Контейнер, в котором содержится дерево проекта.

   Selected_Item     : Node_Id;
   --  Текущий выделенный элемент модели.

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Activate
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Activate (The_Widget : in Widget;
                             Closure    : in Xt_Pointer;
                             Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);

         Data : constant Xm_Container_Select_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);

      begin
         if Data.Selected_Items = null
         or Integer (Data.Selected_Item_Count) /= 1 then
            return;

         else
            declare
               Node     : Xt_Arg_Val;
               Args     : Xt_Arg_List (0 .. 0);
               Number   : Integer;
               Button   : Widget;
               Selected : constant Xt_Widget_List
                 := To_Xt_Widget_List (Data.Selected_Items,
                                       Cardinal (Data.Selected_Item_Count));

            begin
               Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
               Xt_Get_Values (Selected (Selected'First), Args (0 .. 0));

               if Node_Kind (Node_Id (Node)) /= Node_Component_Class then
                  return;
               end if;

               --  Получаем номер вклаки, и делаем ее активной.

               Button :=
                 Component_Tab (Enclosing_Component_Class (Node_Id (Node)));
               Xt_Set_Arg (Args (0), Xm_N_Page_Number, Number'Address);
               Xt_Get_Values (Button, Args (0 .. 0));

               Xt_Set_Arg
                (Args (0), Xm_N_Current_Page_Number, Xt_Arg_Val (Number));
               Xt_Set_Values (Notebook, Args (0 .. 0));
            end;
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback ("On_Activate", E);
      end On_Activate;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Delete_Message_Box_Ok
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Delete_Message_Box_Ok (The_Widget : in Widget;
                                          Closure    : in Xt_Pointer;
                                          Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Node      : Node_Id;
         Node_res  : Elmt_Id;
         Res_EList : Elist_Id;

      begin
         Node := Selected_Item;
         Main_Window.Select_Item (Null_Node);

         if bool_msg_w = True then
            Res_EList  := Return_Kind_Constraint_Resurse_Node (Node);
            bool_msg_w := False;

            if Res_EList /= Null_EList then
               Node_res := First_Elmt (Res_EList);

               while Node_res /= Null_Elmt  loop
                  Delete_Node (Elmt_To_Node (Node_res));
                  Node_res := Next_Elmt (Node_res);
               end loop;
            end if;
         end if;

         Model_Utilities.Delete_Node (Node);
         Xt_Destroy_Widget (The_Widget);

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Delete_Message_Box", E);
      end On_Delete_Message_Box_Ok;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Delete_Message_Box_Cancel
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Delete_Message_Box_Cancel (The_Widget : in Widget;
                                              Closure    : in Xt_Pointer;
                                              Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         bool_msg_w := False;
         Xt_Destroy_Widget (The_Widget);

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Delete_Message_Box_Cancel", E);
      end On_Delete_Message_Box_Cancel;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Delete
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Delete (The_Widget : in Widget;
                           Event      : in X_Event;
                           Params     : in System.Address;
                           Num_Params : in Cardinal)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Event);
         pragma Unreferenced (Params);
         pragma Unreferenced (Num_Params);
         --  Данные переменные не используются.

         Args                 : Xt_Arg_List (0 .. 1);
         msg                  : Xm_String;
         Warning_XmMessageBox : Widget;
         Node_res             : Elmt_Id;
         Res_EList            : Elist_Id;

      begin
         if Selected_Item /= Null_Node then
            Res_EList := Return_Kind_Constraint_Resurse_Node (Selected_Item);

            if Res_EList /= Null_EList then
               Node_res := First_Elmt (Res_EList);
               bool_msg_w := True;

               while Node_res /= Null_Elmt loop
                  msg := Xm_String_Generate (Xm_String_Unparse (msg)
                                              & " "
                                              & Image
                                                 (Resource_Name
                                                   (Resource_Specification
                                                     (Elmt_To_Node
                                                       (Node_res))))
                                              & " - "
                                              & Name_Image
                                                 (Node_Id (Parent_Node
                                                            (Elmt_To_Node
                                                              (Node_res)))));
                  Node_res := Next_Elmt (Node_res);
               end loop;

               msg := Xm_String_Generate ("Warning!!! Widget: "
                                            & Name_Image (Selected_Item)
                                            & " applied on resurses for: "
                                            & Wide_String'(Xm_String_Unparse
                                                            (msg))
                                            & ". Ignore and delete ?");

            else
               msg := Xm_String_Generate ("Delete?  "
                                            & Name_Image (Selected_Item));
            end if;

            -- Добавляем диалог подтверждения удаления
            Xt_Set_Arg (Args (0), Xm_N_Message_String, msg);
            Warning_XmMessageBox := Xm_Create_Message_Dialog
                                     (Main_Window.Get_App_Shell,
                                      "Warning_XmMessageBox",
                                      Args(0 .. 0));
            Xt_Add_Callback
             (Warning_XmMessageBox,
              Xm_N_Ok_Callback,
              Callbacks.On_Delete_Message_Box_Ok'Access);
            Xt_Add_Callback
             (Warning_XmMessageBox,
              Xm_N_Cancel_Callback,
              Callbacks.On_Delete_Message_Box_Cancel'Access);
            Xt_Manage_Child (Warning_XmMessageBox);
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback ("On_Delete", E);
      end On_Delete;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Component
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Popup_Component (The_Widget : in Widget;
                                    Closure    : in Xt_Pointer;
                                    Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Data : constant Xm_Popup_Handler_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);

      begin
         --  ХХХ эта функция не работает из-за глюка в Motif.
         --  но она должна отключать всплывающее меню
         --  если нет выделенного объекта.

         if Selected_Item = Null_Node then
            Data.Post_It := Xt_False;
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Popup_Component", E);
      end On_Popup_Component;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Insert_Widget
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Popup_Insert_Widget (The_Widget : in Widget;
                                        Closure    : in Xt_Pointer;
                                        Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Node   : Node_Id;
         Args   : Xt_Arg_List (0 .. 0);

      begin
         --  Получаем узел класса виджета,
         --  экземпляр которого необходимо создать.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         if Selected_Item /= Null_Node then
            Create_Widget_Instance (Node, Selected_Item);
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Popup_Insert_Widget", E);
      end On_Popup_Insert_Widget;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Notebook
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Popup_Notebook (The_Widget : in Widget;
                                   Closure    : in Xt_Pointer;
                                   Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Node   : Node_Id;
         Number : Integer;
         Args   : Xt_Arg_List (0 .. 0);
         Tab    : Widget;

      begin
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         if Node_Kind (Node) = Node_Project then
            Tab := Project_Tab;

         else
            Tab := Component_Tab (Node);
         end if;

         --  Выделяем выбранный узел.
         --  Получаем номер вклаки, и делаем ее активной.

         Xt_Set_Arg (Args (0), Xm_N_Page_Number, Number'Address);
         Xt_Get_Values (Tab, Args (0 .. 0));

         Xt_Set_Arg
            (Args (0), Xm_N_Current_Page_Number, Xt_Arg_Val (Number));
         Xt_Set_Values (Notebook, Args (0 .. 0));

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Popup_Notebook", E);
      end On_Popup_Notebook;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Project
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Popup_Project (The_Widget : in Widget;
                                  Closure    : in Xt_Pointer;
                                  Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Data : constant Xm_Popup_Handler_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);

      begin
         --  ХХХ эта функция не работает из-за глюка в Motif.
         --  но она должна отключать всплывающее меню
         --  если нет выделенного объекта.

         if Selected_Item = Null_Node then
            Data.Post_It := Xt_False;
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Popup_Project", E);
      end On_Popup_Project;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Project_Activate
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Popup_Project_Activate (The_Widget : in Widget;
                                           Closure    : in Xt_Pointer;
                                           Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         --  Данные переменные не используются.

         Element : Integer := 0;
         Args    : Xt_Arg_List (0 .. 0);
         Data    : constant Xm_Row_Column_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);
         Current : Node_Id;

      begin
         Current := Selected_Item;

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Element'Address);
         Xt_Get_Values (Data.Widget, Args (0 .. 0));

         if Element = Xm_C_New_Application then
            Operations.New_Application (Project_Node);

         else
            if Selected_Item = Null_Node then
               return;
            end if;

            if Element = Xm_C_New_Component then
               if Node_Kind (Selected_Item) = Node_Application then
                  Operations.New_Component (Selected_Item);
               end if;

            elsif Element = Xm_C_Delete_Application then
               if Node_Kind (Selected_Item) = Node_Application then
                  Main_Window.Select_Item (Null_Node);
                  Delete_Node (Current);
               end if;

            elsif Element = Xm_C_Delete_Component then
               if Node_Kind (Selected_Item) = Node_Component_Class then
                  Main_Window.Select_Item (Null_Node);
                  Delete_Node (Current);
               end if;
            end if;
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Popup_Project_Activate", E);
      end On_Popup_Project_Activate;

      -----------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Project_Map
      --!    <ImplementationNotes>
      -----------------------------------------------------------------------
      procedure On_Popup_Project_Map (The_Widget : in Widget;
                                      Closure    : in Xt_Pointer;
                                      Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

      begin
         if Selected_Item = Null_Node then
            Xt_Unmanage_Child (New_Component);
            Xt_Unmanage_Child (Delete_Application);
            Xt_Unmanage_Child (Delete_Component);

            return;
         end if;

         case Node_Kind (Selected_Item) is
            when Node_Application     =>
               Xt_Manage_Child (New_Component);
               Xt_Manage_Child (Delete_Application);
               Xt_Unmanage_Child (Delete_Component);

            when Node_Component_Class =>
               Xt_Unmanage_Child (New_Component);
               Xt_Unmanage_Child (Delete_Application);
               Xt_Manage_Child (Delete_Component);

            when Node_Project         =>
               Xt_Unmanage_Child (New_Component);
               Xt_Unmanage_Child (Delete_Application);
               Xt_Unmanage_Child (Delete_Component);

            when others               =>
               Xt_Unmanage_Child (New_Component);
               Xt_Unmanage_Child (Delete_Application);
               Xt_Unmanage_Child (Delete_Component);
         end case;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Popup_Project_Map", E);
      end On_Popup_Project_Map;

      -----------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Project_Tab_Mapped
      --!    <ImplementationNotes>
      -----------------------------------------------------------------------
      procedure On_Popup_Project_Tab_Mapped (The_Widget : in Widget;
                                             Closure    : in Xt_Pointer;
                                             Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Item : Widget;
         Args : Xt_Arg_List (0 .. 0);
         Node : Node_Id;

      begin
         --  Удаляем предыдущие пункты меню.

         Item := Xt_Name_To_Widget (Menu, "close_menu_item");

         if Item /= Null_Widget then
            Xt_Destroy_Widget (Item);
         end if;

         --  Удаляем сепаратор.

         Item := Xt_Name_To_Widget (Menu, "separator");

         if Item /= Null_Widget then
            Xt_Destroy_Widget (Item);
         end if;

         --  Получаем узел, соответсвующий вкладке.

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         --  Если курсор над вкладкой project то ее закрывать не надо.

         if Node_Kind (Node) = Node_Project then
            return;
         end if;

         --  Добавляем новый сепаратор и пункт закрытия вкладки.

         Item := Xm_Create_Managed_Separator_Gadget (Menu, "separator");

         Xt_Set_Arg (Args (0), Xm_N_User_Data, Xt_Arg_Val (Node));
         Item := Xm_Create_Managed_Push_Button_Gadget
                  (Menu, "close_menu_item", Args (0 .. 0));

         Xt_Add_Callback (Item,
                          Xm_N_Activate_Callback,
                          Callbacks.On_Popup_Tab_Close'Access);

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Popup_Project_Tab_Close", E);
      end On_Popup_Project_Tab_Mapped;

      -----------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Popup_Tab_Close
      --!    <ImplementationNotes>
      -----------------------------------------------------------------------
      procedure On_Popup_Tab_Close (The_Widget : in Widget;
                                    Closure    : in Xt_Pointer;
                                    Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Args   : Xt_Arg_List (0 .. 0);
         Node   : Node_Id;

      begin
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         --  Закрываем открытую вкладку.

         Xt_Unmanage_Child (Component_Tab (Node));
         Xt_Destroy_Widget (Annotation_Table.Table (Node).Button);
         Annotation_Table.Table (Node).Button := Null_Widget;

         --  Делаем активной самую первую вкладку.

         Xt_Set_Arg (Args (0), Xm_N_Current_Page_Number, Xt_Arg_Val (0));
         Xt_Set_Values (Notebook, Args (0 .. 0));

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback
             ("On_Popup_Tab_Close", E);
      end On_Popup_Tab_Close;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Select
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Select (The_Widget : in Widget;
                           Closure    : in Xt_Pointer;
                           Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);

         Data : constant Xm_Container_Select_Callback_Struct_Access
           := To_Callback_Struct_Access (Call_Data);

      begin
         Main_Window.Select_Item (Null_Node);

         if Data.Selected_Items /= null then
            declare
               Node     : Xt_Arg_Val;
               Args     : Xt_Arg_List (0 .. 0);
               Selected : constant Xt_Widget_List
                 := To_Xt_Widget_List (Data.Selected_Items,
                                       Cardinal (Data.Selected_Item_Count));

            begin
               if Selected'Length = 1 then
                  Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
                  Xt_Get_Values (Selected (Selected'First), Args (0 .. 0));
                  Main_Window.Select_Item (Node_Id (Node));

               else
                  raise Program_Error;
               end if;
            end;
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback ("On_Select", E);
      end On_Select;

   end Callbacks;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Component_Container
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Component_Container (Node : in Node_Id) return Widget is
   begin
      pragma Assert (Node in Annotation_Table.First .. Annotation_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Component_Class);

      return Annotation_Table.Table (Node).Component_Container;
   end Component_Container;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Component_Tab
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Component_Tab (Node : in Node_Id) return Widget is
   begin
      pragma Assert (Node in Annotation_Table.First .. Annotation_Table.Last);
      pragma Assert (Node_Kind (Node) = Node_Component_Class);

      return Annotation_Table.Table (Node).Component_Tab;
   end Component_Tab;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Component_Tree_Icon
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Component_Tree_Icon (Node : in Node_Id) return Widget is
   begin
      pragma Assert (Node in Annotation_Table.First .. Annotation_Table.Last);
      pragma Assert
       (Annotation_Table.Table (Node).Kind = Annotation_Component_Class
          or else Annotation_Table.Table (Node).Kind
                    = Annotation_Widget_Instance);

      case Annotation_Table.Table (Node).Kind is
         when Annotation_Component_Class  =>
            return Annotation_Table.Table (Node).CC_Component_Tree_Icon;

         when  Annotation_Widget_Instance =>
            return Annotation_Table.Table (Node).WI_Component_Tree_Icon;

         when others =>
            raise Program_Error;

      end case;
   end Component_Tree_Icon;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Item_Icon
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Item_Icon (Node      : in Node_Id;
                              Container : in Widget;
                              Parent    : in Widget := Null_Widget)
     return Widget
   is
      Str        : Xm_String;
      Args       : Xt_Arg_List (0 .. 3);
      Icon       : Widget;
      Class_Name : Xm_String_List (0 .. 0);

   begin
      --  У приложения нет своего имени, но есть имя класса приложения.

      if Node_Kind (Node) = Node_Application then
         Str := Xm_String_Generate (Application_Class_Name_Image (Node));

      else
         Str := Xm_String_Generate (Name_Image (Node));
      end if;

      Xt_Set_Arg (Args (0), Xm_N_Label_String, Str);
      Xt_Set_Arg (Args (1), Xm_N_Outline_State, Xm_Expanded);
      Xt_Set_Arg (Args (2), Xm_N_User_Data, Xt_Arg_Val (Node));

      --  Если элемент находится в самом верху иерархии, то
      --  его предка устанавливать не надо.

      if Parent /= Null_Widget then
         Xt_Set_Arg (Args (3), Xm_N_Entry_Parent, Parent);
         Icon :=
           Xm_Create_Icon_Gadget (Container, "item", Args (0 .. 3));

      else
         Icon :=
           Xm_Create_Icon_Gadget (Container, "item", Args (0 .. 2));
      end if;

      --  Задаем дополнительную информацию о названии класса виджета.

      if Node_Kind (Node) = Node_Widget_Instance then
         Class_Name (0) := Xm_String_Generate (Name_Image (Class (Node)));
         Xt_Set_Arg (Args (0), Xm_N_Detail_Count, Xt_Arg_Val (1));
         Xt_Set_Arg (Args (1), Xm_N_Detail, Class_Name'Address);
         Xt_Set_Values (Icon, Args (0 .. 1));
         Xm_String_Free (Class_Name (0));
      end if;

      Xt_Manage_Child (Icon);
      --  Функция будет вызвана при уничтожении виджета и предназначена для
      --  очиски элемента таблицы Annotation_Table.

      Xm_String_Free (Str);

      return Icon;
   end Create_Item_Icon;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Delete_Item (Node : in Model.Node_Id) is
   begin
      case Annotation_Table.Table (Node).Kind is
         when Annotation_Project | Annotation_Application =>
            Xt_Unmanage_Child (Project_Tree_Icon (Node));

         when Annotation_Component_Class =>
            Xt_Unmanage_Child (Project_Tree_Icon (Node));
            Xt_Unmanage_Child (Component_Tree_Icon (Node));
            Xt_Unmanage_Child (Component_Container (Node));
            Xt_Unmanage_Child (Component_Tab (Node));
            Xt_Unmanage_Child (Annotation_Table.Table (Node).Button);

         when Annotation_Widget_Instance =>
            Xt_Unmanage_Child (Component_Tree_Icon (Node));

         when Annotation_Empty =>
            null;
      end case;
   end Delete_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize (Parent   : in Xt.Widget;
                         Arg_List : in Xt.Ancillary_Types.Xt_Arg_List)
   is
      Args         : Xt_Arg_List (0 .. Arg_List'Length);
      Scrolled     : Widget;
      Button       : Widget;
      Actions_Menu : Widget;

   begin
      --  Добавляем реакцию на кнопку delete.

      Actions (0) := Xt_Action_Rec'(Interfaces.C.Strings.New_String
                                     ("XmAdaDesignerTreeEditorOnDelete"),
                                    Callbacks.On_Delete'Access);
      Xt_App_Add_Actions (Xt_Widget_To_Application_Context (Parent), Actions);

      Notebook := Xm_Create_Managed_Notebook (Parent, "notebook", Arg_List);

      --  С ноутбука удаляется элемент PageScroller.

      Button := Xt_Name_To_Widget (Notebook, "PageScroller");
      Xt_Unmanage_Child (Button);

      --  Добавляется вкладка "project tree" содержащая элемент
      --  Container.

      Xt_Set_Arg (Args (0), Xm_N_Scrolling_Policy, Xm_Automatic);
      Scrolled :=
        Xm_Create_Managed_Scrolled_Window
         (Notebook, "scrolled", Args (0 .. 0));

      Xt_Set_Arg (Args (0), Xm_N_Layout_Type, Xm_Outline);
      Xt_Set_Arg (Args (1), Xm_N_Automatic_Selection, Xm_No_Auto_Select);
      Xt_Set_Arg (Args (2), Xm_N_Selection_Policy, Xm_Single_Select);
      Project_Container :=
        Xm_Create_Managed_Container (Scrolled, "project_tree", Args (0 .. 2));

      Xt_Add_Callback (Project_Container,
                       Xm_N_Default_Action_Callback,
                       Callbacks.On_Activate'Access);
      Xt_Add_Callback (Project_Container,
                       Xm_N_Selection_Callback,
                       Callbacks.On_Select'Access);
      Xt_Add_Callback (Project_Container,
                       Xm_N_Popup_Handler_Callback,
                       Callbacks.On_Popup_Project'Access);

      Project_Tab := Xm_Create_Managed_Push_Button (Notebook, "project");

      --  Добавляем всплывающее меню, отображающееся на вкладке project.
      --  меню содержит следующие пункты:
      --  - добавить проект
      --  - добавить компонент
      --  - удалить проект
      --  - удалить компонент

      Xt_Set_Arg
       (Args (0), Xm_N_Popup_Enabled, Xm_Popup_Automatic_Recursive);
      Actions_Menu := Xm_Create_Popup_Menu
               (Project_Container, "project_popup_menu", Args (0 .. 0));
      Xt_Add_Callback (Actions_Menu,
                       Xm_N_Entry_Callback,
                       Callbacks.On_Popup_Project_Activate'Access);
      Xt_Add_Callback (Actions_Menu,
                       Xm_N_Map_Callback,
                       Callbacks.On_Popup_Project_Map'Access);

      Xt_Set_Arg
       (Args (0), Xm_N_User_Data, Xt_Arg_Val (Xm_C_New_Application));
      Button := Xm_Create_Managed_Push_Button_Gadget
                 (Actions_Menu, "new_application", Args (0 .. 0));

      Xt_Set_Arg
       (Args (0), Xm_N_User_Data, Xt_Arg_Val (Xm_C_New_Component));
      New_Component := Xm_Create_Managed_Push_Button_Gadget
                        (Actions_Menu, "new_component", Args (0 .. 0));

      Xt_Set_Arg
       (Args (0), Xm_N_User_Data, Xt_Arg_Val (Xm_C_Delete_Component));
      Delete_Component := Xm_Create_Managed_Push_Button_Gadget
                           (Actions_Menu, "delete_component", Args (0 .. 0));

      Xt_Set_Arg
       (Args (0), Xm_N_User_Data, Xt_Arg_Val (Xm_C_Delete_Application));
      Delete_Application :=
        Xm_Create_Managed_Push_Button_Gadget
         (Actions_Menu, "delete_application", Args (0 .. 0));

   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id) is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Add_Motif_Widget_Set
      --!    <Purpose> Добавляет в меню пункты для набора виджетов motif.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Add_Motif_Widget_Set;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Add_Not_Motif_Widget_Set
      --!    <Purpose> Добавляет в меню пункты для набора виджетов motif.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Add_Not_Motif_Widget_Set (Widget_Set : in Node_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Create_Tab
      --!    <Purpose> функция создает вкладку компонента.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Create_Tab (Window : out Widget; Button : out Widget);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Add_Motif_Widget_Set
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Add_Motif_Widget_Set is
         Primitives_Submenu   : Widget;
         Gadgets_Submenu      : Widget;
         Managers_Submenu     : Widget;
         Shells_Submenu       : Widget;
         Item                 : Widget;
         Current_Widget_Class : Node_Id;
         Args                 : Xt_Arg_List (0 .. 1);
         Name                 : Xm_String;

      begin
         --  Создаем подменю для каждого класса виджетов.

         Primitives_Submenu :=
           Xm_Create_Pulldown_Menu (Widget_Set_Menu, "sub_menu");
         Gadgets_Submenu    :=
           Xm_Create_Pulldown_Menu (Widget_Set_Menu, "sub_menu");
         Managers_Submenu   :=
           Xm_Create_Pulldown_Menu (Widget_Set_Menu, "sub_menu");
         Shells_Submenu     :=
           Xm_Create_Pulldown_Menu (Widget_Set_Menu, "sub_menu");

         --  Добавляем созданные подменю в всплывающее меню наборов виджетов.

         Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, Primitives_Submenu);
         Item := Xm_Create_Managed_Cascade_Button_Gadget (Widget_Set_Menu,
                                                          "primitives_submenu",
                                                          Args (0 .. 0));
         Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, Gadgets_Submenu);
         Item := Xm_Create_Managed_Cascade_Button_Gadget (Widget_Set_Menu,
                                                          "gadgets_submenu",
                                                          Args (0 .. 0));
         Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, Managers_Submenu);
         Item := Xm_Create_Managed_Cascade_Button_Gadget (Widget_Set_Menu,
                                                          "managers_submenu",
                                                          Args (0 .. 0));
         Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, Shells_Submenu);
         Item := Xm_Create_Managed_Cascade_Button_Gadget (Widget_Set_Menu,
                                                          "shells_submenu",
                                                          Args (0 .. 0));

         --  Просматриваем все классы виджетов.

         Current_Widget_Class :=
           First (Widget_Classes (Xt_Motif.Xt_Motif_Widget_Set));

         while Current_Widget_Class /= Null_Node loop
            if not Is_Meta_Class (Current_Widget_Class) then

               --  Если виджет на метакласс, то добавляем его в
               --  соответствующее подменю.

               Name := Xm_String_Generate
                        (Name_Image (Current_Widget_Class));
               Xt_Set_Arg (Args (0), Xm_N_Label_String, Name);
               Xt_Set_Arg (Args (1),
                           Xm_N_User_Data,
                           Xt_Arg_Val (Current_Widget_Class));

               Item := Null_Widget;

               if Is_Primitive (Current_Widget_Class) then
                  Item := Primitives_Submenu;

               elsif Is_Gadget (Current_Widget_Class) then
                  Item := Gadgets_Submenu;

               elsif Is_Manager (Current_Widget_Class) then
                  Item := Managers_Submenu;

               elsif Is_Shell (Current_Widget_Class) then
                  Item := Shells_Submenu;
               end if;

               Item := Xm_Create_Managed_Push_Button_Gadget
                        (Item, "item", Args (0 .. 1));
               Xt_Add_Callback (Item,
                                Xm_N_Activate_Callback,
                                Callbacks.On_Popup_Insert_Widget'Access);
               Xm_String_Free (Name);
            end if;

            Current_Widget_Class := Next (Current_Widget_Class);
         end loop;
      end Add_Motif_Widget_Set;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Add_Motif_Widget_Set
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Add_Not_Motif_Widget_Set (Widget_Set : in Node_Id) is
         Other_Submenu        : Widget;
         Item                 : Widget;
         Args                 : Xt_Arg_List (0 .. 1);
         Name                 : Xm_String;
         Current_Widget_Class : Node_Id;

      begin
         Other_Submenu :=
           Xm_Create_Pulldown_Menu (Widget_Set_Menu, "sub_menu");

         --  Добавляем созданные подменю в всплывающее меню наборов виджетов.

         Name := Xm_String_Generate (Name_Image (Widget_Set));

         Xt_Set_Arg (Args (0), Xm_N_Sub_Menu_Id, Other_Submenu);
         Xt_Set_Arg (Args (1), Xm_N_Label_String, Name);

         Item := Xm_Create_Managed_Cascade_Button_Gadget (Widget_Set_Menu,
                                                          "primitives_submenu",
                                                          Args (0 .. 1));
         Xm_String_Free (Name);

         --  Просматриваем все классы виджетов.

         Current_Widget_Class := First (Widget_Classes (Widget_Set));
         while Current_Widget_Class /= Null_Node loop
            if not Is_Meta_Class (Current_Widget_Class) then

               --  Если виджет на метакласс, то добавляем его в
               --  соответствующее подменю.

               Name := Xm_String_Generate
                        (Name_Image (Current_Widget_Class));
               Xt_Set_Arg (Args (0), Xm_N_Label_String, Name);
               Xt_Set_Arg (Args (1),
                           Xm_N_User_Data,
                           Xt_Arg_Val (Current_Widget_Class));

               Item := Xm_Create_Managed_Push_Button_Gadget
                        (Other_Submenu, "item", Args (0 .. 1));
               Xt_Add_Callback (Item,
                                Xm_N_Activate_Callback,
                                Callbacks.On_Popup_Insert_Widget'Access);
               Xm_String_Free (Name);
            end if;

            Current_Widget_Class := Next (Current_Widget_Class);
         end loop;
      end Add_Not_Motif_Widget_Set;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Create_Tab
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Create_Tab (Window : out Widget; Button : out Widget) is
         Args       : Xt_Arg_List (0 .. 2);
         Component  : Widget;
         Name       : Xm_String;

      begin
         --  Добавляется вкладка "component tree" содержащая элемент
         --  Container.

         Xt_Set_Arg (Args (0), Xm_N_Scrolling_Policy, Xm_Automatic);
         Component := Xm_Create_Managed_Scrolled_Window
                       (Notebook, "scrolled", Args (0 .. 0));

         Xt_Set_Arg (Args (0), Xm_N_Layout_Type, Xm_Detail);
         Xt_Set_Arg (Args (1), Xm_N_Automatic_Selection, Xm_No_Auto_Select);
         Xt_Set_Arg (Args (2), Xm_N_Selection_Policy, Xm_Single_Select);
         Window := Xm_Create_Managed_Container
                    (Component, "component_tree", Args (0 .. 2));

         Xt_Add_Callback (Window,
                          Xm_N_Default_Action_Callback,
                          Callbacks.On_Activate'Access);
         Xt_Add_Callback (Window,
                          Xm_N_Selection_Callback,
                          Callbacks.On_Select'Access);
         Xt_Add_Callback (Window,
                          Xm_N_Popup_Handler_Callback,
                          Callbacks.On_Popup_Component'Access);

         Name := Xm_String_Generate (Name_Image (Node));

         --  Добавляем вкладку на ноутбук.
         --  При добавлении вкладка должна быть как Managed, иначе
         --  мотиф не назначит необходимые ей ресурсы.

         Xt_Set_Arg (Args (0), Xm_N_Label_String, Name);
         Xt_Set_Arg (Args (1), Xm_N_User_Data, Xt_Arg_Val (Node));
         Button := Xm_Create_Managed_Push_Button
                    (Notebook, "component", Args (0 .. 1));
         Xm_Add_To_Post_From_List (Designer.Tree_Editor.Menu, Button);
         Xt_Unmanage_Child (Button);

         Xt_Add_Callback (Button,
                          Xm_N_Popup_Handler_Callback,
                          Callbacks.On_Popup_Project_Tab_Mapped'Access);
         Xm_String_Free (Name);

         Xm_Add_To_Post_From_List (Widget_Set_Menu, Window);
         --  Добавляем к контейнеру всплывающее меню.
      end Create_Tab;

      Args                 : Xt_Arg_List (0 .. 1);
      Item                 : Widget;
      Widget_Sets          : Node_Id
        := First (Imported_Widget_Sets (Enclosing_Project (Node)));

   begin
      Relocate_Annotation_Table (Node);
      --  Увеличение размеров таблицы (при необходимости).

      case Node_Kind (Node) is
         when Node_Component_Class =>
            Create_Tab
             (Annotation_Table.Table (Node).Component_Container,
              Annotation_Table.Table (Node).Component_Tab);
            --  XXX Совершенно не корректно!!! Не известно, где фактически
            --  будут сохранены значения!!!
            Annotation_Table.Table (Node).CC_Project_Tree_Icon :=
              Create_Item_Icon
               (Node,
                Project_Container,
                Project_Tree_Icon (Parent_Node (Node)));
            Annotation_Table.Table (Node).CC_Component_Tree_Icon :=
              Create_Item_Icon (Node, Component_Container (Node));

         when Node_Widget_Instance =>
            if not Is_Pseudo_Class (Class (Node)) then
--  XXX            declare
--  XXX               Tab  : constant Widget
--  XXX                 := Component_Tab (Enclosing_Component_Class (Node));
--  XXX               N    : Integer;
--  XXX               Args : Xt_Arg_List (0 .. 0);

--  XXX            begin
               Annotation_Table.Table (Node).WI_Component_Tree_Icon :=
                 Create_Item_Icon
                  (Node,
                   Component_Container (Enclosing_Component_Class (Node)),
                   Component_Tree_Icon (Parent_Node (Node)));

               --  Устанавливаем активной вкладку,
               --  на которую добавили компонент.

--  XXX        Xt_Set_Arg (Args (0), Xm_N_Page_Number, N'Address);
--  XXX        Xt_Get_Values (Tab, Args (0 .. 0));

--  XXX        Xt_Set_Arg (Args (0), Xm_N_Current_Page_Number, Xt_Arg_Val (N));
--  XXX        Xt_Set_Values (Notebook, Args (0 .. 0));
            end if;
         when Node_Application     =>
            Annotation_Table.Table (Node).NA_Project_Tree_Icon :=
              Create_Item_Icon
               (Node,
                Project_Container,
                Project_Tree_Icon (Parent_Node (Node)));

         when Node_Project          =>
            --  Добавляем на вкладку проекта информацию
            --  о узле проекта.

            Xt_Set_Arg (Args (0), Xm_N_User_Data, Xt_Arg_Val (Node));
            Xt_Set_Values (Project_Tab, Args (0 .. 0));

            --  Разрешаем использовать мышь для вызова всплывающего окна.
            --  Создаем само всплывающее меню, в котором будет отображаться
            --  список открытых компонентов и звдем обработчик для всплыва-
            --  ющего меню.

            Xt_Set_Arg
             (Args (0), Xm_N_Popup_Enabled, Xm_Popup_Automatic);
            Designer.Tree_Editor.Menu :=
              Xm_Create_Popup_Menu
               (Project_Container, "popup_menu", Args (0 .. 0));
            --  Добавляем всплывающее меню.

            Xm_Remove_From_Post_From_List (Menu, Project_Container);

            Xt_Add_Callback (Project_Tab,
                             Xm_N_Popup_Handler_Callback,
                             Callbacks.On_Popup_Project_Tab_Mapped'Access);

            --  В всплывающее меню добавляем иконку проекта.

            Xt_Set_Arg
             (Args (0), Xm_N_User_Data, Xt_Arg_Val (Node));
            Item := Xm_Create_Managed_Push_Button_Gadget
                     (Menu, "project_menu_item", Args (0 .. 0));
            Xt_Add_Callback (Item,
                             Xm_N_Activate_Callback,
                             Callbacks.On_Popup_Notebook'Access);

            Xm_Add_To_Post_From_List
             (Designer.Tree_Editor.Menu, Project_Tab);

            Annotation_Table.Table (Node).NP_Project_Tree_Icon :=
              Create_Item_Icon (Node, Project_Container);
            Project_Node := Node;

            Xt_Set_Arg
             (Args (0), Xm_N_Popup_Enabled, Xm_Popup_Automatic_Recursive);
            Widget_Set_Menu := Xm_Create_Popup_Menu (Project_Container,
                                                     "popup_menu",
                                                     Args (0 .. 0));

            while Widget_Sets /= Null_Node loop
               if Widget_Sets = Xt_Motif.Xt_Motif_Widget_Set then
                  Add_Motif_Widget_Set;
               else
                  Add_Not_Motif_Widget_Set (Widget_Sets);
               end if;

               Widget_Sets := Next (Widget_Sets);
            end loop;

         when others                =>
            null;
      end case;
   end Insert_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Project_Tree_Icon
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Project_Tree_Icon (Node : in Node_Id) return Widget is
   begin
      pragma Assert (Node in Annotation_Table.First .. Annotation_Table.Last);
      pragma Assert
       (Annotation_Table.Table (Node).Kind = Annotation_Project
          or else Annotation_Table.Table (Node).Kind = Annotation_Application
          or else Annotation_Table.Table (Node).Kind
                    = Annotation_Component_Class);

      case Annotation_Table.Table (Node).Kind is
         when Annotation_Project =>
            return Annotation_Table.Table (Node).NP_Project_Tree_Icon;

         when Annotation_Application =>
            return Annotation_Table.Table (Node).NA_Project_Tree_Icon;

         when Annotation_Component_Class =>
            return Annotation_Table.Table (Node).CC_Project_Tree_Icon;

         when others =>
            raise Program_Error;
      end case;
   end Project_Tree_Icon;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Reinitialize is
      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Destroy_Widget
      --!    <Purpose> Удаление не пустого виджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Destroy_Widget (Value : in Widget);

      -----------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Destroy_Widget
      --!    <ImplementationNotes>
      -----------------------------------------------------------------------
      procedure Destroy_Widget (Value : in Widget) is
      begin
         if Value /= Null_Widget then
            Xt_Destroy_Widget (Value);
         end if;
      end Destroy_Widget;

      Args : Xt_Arg_List (0 .. 0);

   begin
      --  Убираем выделение с выбранного элемента на вкладке компонент.
      --  XXX Насколько это необходимо делать? Ведь далее производится удаление
      --  всей страницы.

      if Selected_Item /= Null_Node
        and then (Node_Kind (Selected_Item) = Node_Component_Class
                    or else Node_Kind (Selected_Item) = Node_Widget_Instance)
      then
         Xt_Set_Arg (Args (0), Xm_N_Selected_Object_Count, Xt_Arg_Val (0));
         Xt_Set_Values
          (Xt_Parent (Component_Tree_Icon (Selected_Item)), Args (0 .. 0));
         Selected_Item := Null_Node;
      end if;

      --  Удаление всех виджетов из таблицы.

      for J in Annotation_Table.First .. Annotation_Table.Last loop
         case Annotation_Table.Table (J).Kind is
            when Annotation_Application =>
               Destroy_Widget (Project_Tree_Icon (J));

            when Annotation_Project     =>
               Destroy_Widget (Project_Tree_Icon (J));

            when Annotation_Component_Class =>
               Destroy_Widget (Project_Tree_Icon (J));
               Destroy_Widget (Component_Tree_Icon (J));
               Destroy_Widget (Component_Container (J));
               Destroy_Widget (Component_Tab (J));

            when Annotation_Widget_Instance =>
               Destroy_Widget (Component_Tree_Icon (J));

            when Annotation_Empty =>
               null;
         end case;
      end loop;

      --  Очистка самой таблицы.

      Annotation_Table.Free;
      Annotation_Table.Init;

      Xt_Set_Arg (Args (0), Xm_N_Current_Page_Number, Xt_Arg_Val (0));
      Xt_Set_Values (Notebook, Args (0 .. 0));

      if Menu /= Null_Widget then
         Xt_Destroy_Widget (Menu);
      end if;

      if Widget_Set_Menu /= Null_Widget then
         Xt_Destroy_Widget (Widget_Set_Menu);
      end if;
   end Reinitialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Relocate_Annotation_Table
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Relocate_Annotation_Table (Node : in Node_Id) is
      First : constant Node_Id := Annotation_Table.Last + 1;

   begin
      if Annotation_Table.Last >= Node then
         --  Таблица уже имеет достаточный размер и не нуждается в расширении.

         return;
      end if;

      Annotation_Table.Set_Last (Node);

      for J in First .. Node loop
         case Node_Kind (J) is
           when Node_Application     =>
              Annotation_Table.Table (J) :=
               (Kind                 => Annotation_Application,
                NA_Project_Tree_Icon => Null_Widget);

           when Node_Project         =>
              Annotation_Table.Table (J) :=
               (Kind                 => Annotation_Project,
                NP_Project_Tree_Icon => Null_Widget);

           when Node_Component_Class =>
              Annotation_Table.Table (J) :=
               (Kind                   => Annotation_Component_Class,
                CC_Project_Tree_Icon   => Null_Widget,
                CC_Component_Tree_Icon => Null_Widget,
                Component_Container    => Null_Widget,
                Component_Tab          => Null_Widget,
                Button                 => Null_Widget);

           when Node_Widget_Instance =>
               Annotation_Table.Table (J) :=
                (Kind         => Annotation_Widget_Instance,
                 WI_Component_Tree_Icon => Null_Widget);

           when others               =>
              Annotation_Table.Table (J) := (Kind => Annotation_Empty);
         end case;
      end loop;
   end Relocate_Annotation_Table;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Return_Kind_Constraint_Resurse_Node
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Return_Kind_Constraint_Resurse_Node (Node : in Node_Id)
     return EList_Id
   is
      Current_Widget : Node_Id;
      Current        : Node_Id;
      Current_List   : List_Id;
      List           : List_Id;
      List_res       : Node_Id;
      Res_EList      : Elist_Id;

   begin
      Res_EList := New_Elmt_List;
--       Current_Widget
--         := Root (Enclosing_Component_Class (Node));
      Current_Widget := Parent_Node (Node);

      if Current_Widget /= Node
           and Node /= Root (Enclosing_Component_Class (Node))
           and Node /= Enclosing_Component_Class (Node)
      then
         Current_List := Children (Current_Widget);

         if Current_List /= Null_List then
            Current := First (Current_List);

            while Current /= Null_Node loop
               if Current /= Node then
                  List := Constraint_Resources (Current);

                  if List /= Null_List then
                     List_res := First (List);

                     while List_res /= Null_Node loop
                        if Node_Kind (List_res)
                             = Node_Widget_Reference_Resource_Value
                        then
                           if Resource_Value (List_res) = Node then
                              Append_Elmt (List_res, Res_EList);
                           end if;
                        end if;

                        List_res := Next (List_res);
                     end loop;
                  end if;
               end if;

               Current := Next (Current);
            end loop;
         end if;
      end if;

      if First_Elmt (Res_EList) = Null_Elmt then
         return Null_EList;

      else
         return Res_EList;
      end if;
   end Return_Kind_Constraint_Resurse_Node;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id) is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Get_Sensitive_Indication
      --!    <Purpose>
      --!    <Exceptions>
      ------------------------------------------------------------------------
      function Get_Sensitive_Indication (Node : in Node_Id)
        return Boolean;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Get_Sensitive_Indication
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function Get_Sensitive_Indication (Node  : in Node_Id)
        return Boolean
      is
      begin
         if Node = Null_Node then
            return False;
         end if;

         case Node_Kind (Node) is
            when Node_Project | Node_Application =>
               return False;

            when Node_Component_Class =>
               return Root (Node) = Null_Node;

            when Node_Widget_Instance =>
               if Is_Shell (Node)
                    and then Children (Node) /= Null_List
                    and then Length (Children (Node)) = 1
               then
                  return False;

               elsif Is_Primitive (Node) then
                  return False;

               else

                  return True;
               end if;

            when others =>
               return True;

          end case;
      end Get_Sensitive_Indication;

      List      : Xt_Widget_List (0 .. 0);
      Args      : Xt_Arg_List (0 .. 1);
      Sensitive : constant Boolean := Get_Sensitive_Indication (Node);

   begin
      if Widget_Set_Menu /= Null_Widget then
         Xt_Set_Sensitive (Widget_Set_Menu, Sensitive);
      end if;

      if Selected_Item /= Null_Node then
         --  Убираем веделение на странице дерева проекта.

         Xt_Set_Arg (Args (0), Xm_N_Selected_Object_Count, Xt_Arg_Val (0));
         Xt_Set_Values (Project_Container, Args (0 .. 0));

         --  Убираем выделение на странице дерева класса компонента.

         case Node_Kind (Selected_Item) is
            when Node_Component_Class | Node_Widget_Instance =>
               Xt_Set_Values
                (Xt_Parent (Component_Tree_Icon (Selected_Item)),
                 Args (0 .. 0));

            when Node_Project | Node_Application =>
               null;

            when others =>
               raise Program_Error;
         end case;

         Selected_Item := Null_Node;
      end if;

      Selected_Item := Node;

      --  Если компонент выбран, то формируем выделение на соответствующих
      --  страницах.

      if Selected_Item /= Null_Node then
         --  Выделяем элемент на странице дерева класса компонента.

         case Node_Kind (Selected_Item) is
            when Node_Component_Class | Node_Widget_Instance =>
               List (0) := Component_Tree_Icon (Selected_Item);
               Xt_Set_Arg (Args (0), Xm_N_Selected_Objects, List'Address);
               Xt_Set_Arg
                (Args (1), Xm_N_Selected_Object_Count, Xt_Arg_Val (1));
               Xt_Set_Values
                (Component_Container
                  (Enclosing_Component_Class (Selected_Item)),
                 Args (0 .. 1));

               Xt_Manage_Child
                (Component_Tab (Enclosing_Component_Class (Selected_Item)));
               --  Передаем закладку страницы на управление.

               --  Добавляем название компонента в сплывающее меню.

               if Node_Kind (Selected_Item) = Node_Component_Class
                 and then
                  Annotation_Table.Table (Selected_Item).Button = Null_Widget
               then
                  declare
                     Name : constant Xm_String
                       := Xm_String_Generate (Name_Image (Node));

                  begin
                     Xt_Set_Arg (Args (0), Xm_N_Label_String, Name);
                     Xt_Set_Arg
                       (Args (1), Xm_N_User_Data, Xt_Arg_Val (Node));
                     Annotation_Table.Table (Selected_Item).Button :=
                       Xm_Create_Managed_Push_Button_Gadget
                        (Menu, "menu_item", Args (0 .. 1));
                     Xt_Add_Callback
                      (Annotation_Table.Table (Selected_Item).Button,
                       Xm_N_Activate_Callback,
                       Callbacks.On_Popup_Notebook'Access);

                     Xm_String_Free (Name);
                  end;
               end if;

            when Node_Project | Node_Application =>
               null;

            when others =>
               raise Program_Error;
         end case;

         --  Выделяем элемент на странице дерева проекта.

         case Node_Kind (Selected_Item) is
            when Node_Project | Node_Application | Node_Component_Class =>
               List (0) := Project_Tree_Icon (Selected_Item);
               Xt_Set_Arg (Args (0), Xm_N_Selected_Objects, List'Address);
               Xt_Set_Arg
                (Args (1), Xm_N_Selected_Object_Count, Xt_Arg_Val (1));
               Xt_Set_Values (Project_Container, Args (0 .. 1));

            when Node_Widget_Instance =>
               null;

            when others =>
               raise Program_Error;
         end case;
      end if;
   end Select_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Model.Node_Id) is
      Str  : Xm_String;
      Args : Xt_Arg_List (0 .. 0);

   begin
      --  У приложения нет своего имени, но есть имя класса приложения.

      if Node_Kind (Node) = Node_Application then
         Str := Xm_String_Generate (Application_Class_Name_Image (Node));

      else
         Str := Xm_String_Generate (Name_Image (Node));
      end if;

      --  Задаем имя компонента.

      Xt_Set_Arg (Args (0), Xm_N_Label_String, Str);

      case Annotation_Table.Table (Node).Kind is
         when Annotation_Project | Annotation_Application =>
            Xt_Set_Values (Project_Tree_Icon (Node), Args);

         when Annotation_Component_Class =>
            Xt_Set_Values (Project_Tree_Icon (Node), Args);
            Xt_Set_Values (Component_Tree_Icon (Node), Args);

         when Annotation_Widget_Instance =>
            Xt_Set_Values (Component_Tree_Icon (Node), Args);

         when Annotation_Empty =>
            null;
      end case;

      Xm_String_Free (Str);
   end Update_Item;

end Designer.Tree_Editor;
