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
with Xm.Resource_Management;
with Xm.Strings;
with Xm_Container;
with Xm_Icon_Gadget;
with Xm_Notebook;
with Xm_Push_Button_Gadget;
with Xm_Scrolled_Window;
with Xm_String_Defs;

with Designer.Main_Window;
with Model.Allocations;
with Model.Queries;
with Model.Tree;

package body Designer.Tree_Editor is

   use Model;
   use Model.Allocations;
   use Model.Queries;
   use Model.Tree;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;
   use Xt.Translation_Management;
   use Xt.Utilities;
   use Xm;
   use Xm.Resource_Management;
   use Xm.Strings;
   use Xm_Container;
   use Xm_Icon_Gadget;
   use Xm_Notebook;
   use Xm_Push_Button_Gadget;
   use Xm_Scrolled_Window;
   use Xm_String_Defs;
   use Xt;
   use Xt.Ancillary_Types;

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

         when Annotation_Widget_Instance =>
            WI_Component_Tree_Icon : Widget;
            --  Иконка в дереве класса компонент.

         when Annotation_Project | Annotation_Application =>
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

   Actions : Xt_Action_List (0 .. 0);

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
      --!    <Unit> On_Select
      --!    <Purpose> Подпрограмма обратного вызова при выделении виджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Select (The_Widget : in Widget;
                           Closure    : in Xt_Pointer;
                           Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Select);

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
         or Integer (Data .Selected_Item_Count) /= 1 then
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
      --!    <Unit> On_Delete
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Delete (The_Widget : in Widget;
                           Event      : in X_Event;
                           Params     : in System.Address;
                           Num_Params : in Cardinal)
      is
         pragma Unreferenced (Event);
         pragma Unreferenced (Params);
         pragma Unreferenced (Num_Params);
         --  Данные переменные не используются.

         Count : Integer;
         Node  : Node_Id;
         Args  : Xt_Arg_List (0 .. 0);

      begin
         --  Получаем количество выделенных елементов.

         Xt_Set_Arg (Args (0), Xm_N_Selected_Object_Count, Count'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         if Count /= 1 then
            raise Program_Error;
         end if;

         --  Убираем выделение с элемента и удаляем его.

         if Selected_Item /= Null_Node then
            Node := Selected_Item;
            Main_Window.Select_Item (Null_Node);
            Main_Window.Delete_Item (Node);
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback ("On_Delete", E);
      end On_Delete;

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
      Str  : Xm_String;
      Args : Xt_Arg_List (0 .. 3);
      Icon : Widget;

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
           Xm_Create_Managed_Icon_Gadget (Container, "item", Args (0 .. 3));

      else
         Icon :=
           Xm_Create_Managed_Icon_Gadget (Container, "item", Args (0 .. 2));
      end if;

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
      Args     : Xt_Arg_List (0 .. Arg_List'Length);
      Scrolled : Widget;
      Button   : Widget;

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

      Button := Xm_Create_Managed_Push_Button_Gadget (Notebook, "project");

   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id) is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Create_Tab
      --!    <Purpose> функция создает вкладку компонента.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Create_Tab (Window : out Widget; Button : out Widget);

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

         Xt_Set_Arg (Args (0), Xm_N_Layout_Type, Xm_Outline);
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

         Name := Xm_String_Generate (Name_Image (Node));

         --  Добавляем вкладку на ноутбук.
         --  При добавлении вкладка должна быть как Managed, иначе
         --  мотиф не назначит необходимые ей ресурсы.

         Xt_Set_Arg (Args (0), Xm_N_Label_String, Name);
         Button := Xm_Create_Managed_Push_Button_Gadget
                    (Notebook, "component", Args (0 .. 0));
         Xt_Unmanage_Child (Button);

         Xm_String_Free (Name);
      end Create_Tab;

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
--  XXX            declare
--  XXX               Tab  : constant Widget
--  XXX                 := Component_Tab (Enclosing_Component_Class (Node));
--  XXX               N    : Integer;
--  XXX               Args : Xt_Arg_List (0 .. 0);

            begin
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
            end;
         when Node_Application     =>
            Annotation_Table.Table (Node).NP_Project_Tree_Icon :=
              Create_Item_Icon
               (Node,
                Project_Container,
                Project_Tree_Icon (Parent_Node (Node)));

         when Node_Project          =>
            Annotation_Table.Table (Node).NP_Project_Tree_Icon :=
              Create_Item_Icon (Node, Project_Container);

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
            return Annotation_Table.Table (Node).NP_Project_Tree_Icon;

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

      -------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Destroy_Widget
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
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
            when Annotation_Project | Annotation_Application =>
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
                NP_Project_Tree_Icon => Null_Widget);

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
                Component_Tab          => Null_Widget);

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
   --!    <Unit> Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id) is
      List : Xt_Widget_List (0 .. 0);
      Args : Xt_Arg_List (0 .. 1);

   begin
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
