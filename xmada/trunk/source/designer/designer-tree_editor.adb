------------------------------------------------------------------------------
--
--  XmAda Designer
--
------------------------------------------------------------------------------
--! <Copyright>
--!  Copyright (C) 2006
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
with Ada.Characters.Handling;
with GNAT.Table;

with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Instance_Management;
with Xt.Resource_Management;
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

   use Ada.Characters.Handling;
   use Model;
   use Model.Allocations;
   use Model.Queries;
   use Model.Tree;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Instance_Management;
   use Xt.Resource_Management;
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
    (Annotation_Component_Class,
     Annotation_Empty,
     Annotation_Node_Application,
     Annotation_Node_Project,
     Annotation_Widget_Instance);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
   record
      case Kind is
         when Annotation_Component_Class  =>
            CC_Project   : Widget;  --  Иконка в дереве проекта.
            CC_Component : Widget;  --  Иконка в дереве сомпонент.
            CC_Window    : Widget;  --  Окно компонент.
            CC_Button    : Widget;  --  Закладка на ноутбуке.

         when Annotation_Widget_Instance  =>
            WI_Component : Widget;  --  Иконка в дереве компонент.

         when Annotation_Node_Project
           | Annotation_Node_Application  =>
            NP_Project : Widget;    --  Иконка в дереве проекта.

         when Annotation_Empty            =>
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
   --!    <Unit> Get_Component_Class_Widget
   --!    <Purpose>  Возвращает виджет, соответствующий контейнеру, в котором
   --! должен отображаться данный элемент. Если контейнер не найден, то
   --! возвращается значение Null_Widget.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Get_Component_Class (Node : in Node_Id)
     return Annotation_Record;

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
   --!    <Unit> Add_Child
   --!    <Purpose> Добавляет в дерево элемент потомок.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Add_Child (Container : in Widget;
                       Parent    : in Widget;
                       Node      : in Node_Id) return Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Project_Widget
   --!    <Purpose> функция возвращает виджет компонента,
   --! находящегося на project tree.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Get_Project_Widget (Node : in Node_Id) return Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Project_Widget
   --!    <Purpose> функция возвращает виджет компонента,
   --! находящегося на component tree.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Get_Component_Widget (Node : in Node_Id) return Widget;

   package Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Destroy
      --!    <Purpose> Подпрограмма обратного вызова
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Destroy (The_Widget : in Widget;
                            Closure    : in Xt_Pointer;
                            Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_Destroy);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Select
      --!    <Purpose> Подпрограмма обратного вызова при выделении
      --! виджета.
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

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Destroy
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Destroy (The_Widget : in Widget;
                            Closure    : in Xt_Pointer;
                            Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);
         --  Данные переменные не используются.

         Node : Xt_Arg_Val;
         Args : Xt_Arg_List (0 .. 1);

      begin
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args);

         Annotation_Table.Table (Node_Id (Node)) :=
           (Kind => Annotation_Empty);

      exception
         when E : others =>
            null;
      end On_Destroy;

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
         if Data.Selected_Items = null then
            Main_Window.Select_Item (Null_Node);

         else
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
               end if;
            end;
         end if;

      exception
         when E : others =>
            null;
      end On_Select;

   end Callbacks;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Add_Child
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Add_Child (Container : in Widget;
                       Parent    : in Widget;
                       Node      : in Node_Id)
     return Widget
   is
      Str  : Xm_String;
      Args : Xt_Arg_List (0 .. 3);
      Icon : Widget;

   begin
      --  У приложения нет своего имени, но есть имя класса приложения.

      if Node_Kind (Node) = Node_Application then
         Str := Xm_String_Generate (Application_Class_Image (Node));

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

      Xt_Add_Callback
        (Icon, Xm_N_Destroy_Callback, Callbacks.On_Destroy'Access);

      Xm_String_Free (Str);

      return Icon;
   end Add_Child;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Delete_Item (Node : in Model.Node_Id) is
      Annotation : Annotation_Record
        renames Annotation_Table.Table (Node);

   begin
      case Annotation.Kind is
         when Annotation_Node_Project
           | Annotation_Node_Application =>
             Xt_Destroy_Widget (Get_Project_Widget (Node));

         when Annotation_Component_Class =>
            Xt_Destroy_Widget (Annotation.CC_Window);
            Xt_Destroy_Widget (Annotation.CC_Button);
            Xt_Destroy_Widget (Get_Project_Widget (Node));
            Xt_Destroy_Widget (Get_Component_Widget (Node));

         when Annotation_Widget_Instance =>
            Xt_Destroy_Widget (Get_Component_Widget (Node));

         when Annotation_Empty =>
            null;
      end case;
   end Delete_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Component_Class_Widget
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Component_Class (Node : in Node_Id)
     return Annotation_Record
   is
      Aux : Node_Id := Node;

   begin
      while Aux /= Null_Node loop
         if Node_Kind (Aux) = Node_Component_Class then
            return Annotation_Table.Table (Aux);
         end if;

         Aux := Parent_Node (Aux);
      end loop;

      return (Kind => Annotation_Empty);
   end Get_Component_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Component_Widget
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Component_Widget (Node : in Node_Id)
     return Widget
   is
   begin
      if Node = Null_Node then
         return Null_Widget;
      end if;

      declare
         Value : constant Annotation_Record := Annotation_Table.Table (Node);

      begin
         case Value.Kind is
            when Annotation_Component_Class  =>
               return Value.CC_Component;

            when  Annotation_Widget_Instance =>
               return Value.WI_Component;

            when others =>
               raise Constraint_Error;

         end case;
      end;
   end Get_Component_Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Project_Widget
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Project_Widget (Node : in Node_Id)
     return Widget
   is
   begin
      if Node = Null_Node then
         return Null_Widget;
      end if;

      declare
         Value : constant Annotation_Record := Annotation_Table.Table (Node);
      begin
         case Value.Kind is
            when Annotation_Node_Project     =>
               return Value.NP_Project;

            when Annotation_Node_Application =>
               return Value.NP_Project;

            when Annotation_Component_Class  =>
               return Value.CC_Project;

            when others =>
               raise Constraint_Error;

         end case;
      end;
   end Get_Project_Widget;

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
      Notebook := Xm_Create_Managed_Notebook (Parent, "notebook", Arg_List);

      --  С ноутбука удаляется элемент PageScroller.

      Button := Xt_Name_To_Widget (Notebook, "PageScroller");
      Xt_Unmanage_Child (Button);

      --  Добавляется вкладка "project tree" содержащая элемент
      --  Container.

      --  TODO следующую строку удалить.
      Args (0 .. Arg_List'Length - 1) := Arg_List;
      Xt_Set_Arg (Args (Arg_List'Length), Xm_N_Scrolling_Policy, Xm_Automatic);
      Scrolled :=
        Xm_Create_Managed_Scrolled_Window
         (Notebook, "scrolled", Args (0 .. Arg_List'Length));

      Xt_Set_Arg (Args (0), Xm_N_Layout_Type, Xm_Outline);
      Xt_Set_Arg (Args (1), Xm_N_Automatic_Selection, Xm_No_Auto_Select);
      Xt_Set_Arg (Args (2), Xm_N_Selection_Policy, Xm_Single_Select);
      Project_Container :=
        Xm_Create_Managed_Container (Scrolled, "project_tree", Args (0 .. 2));

      Xt_Add_Callback (Project_Container,
                       Xm_N_Default_Action_Callback,
                       Callbacks.On_Select'Access);

      Button := Xm_Create_Managed_Push_Button_Gadget (Notebook, "project");

   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id) is
      function Create_Tab return Annotation_Record;
      function Create_Tab return Annotation_Record is
         Annotation : Annotation_Record (Annotation_Component_Class);
         Args       : Xt_Arg_List (0 .. 2);
         Component  : Widget;

      begin
         --  Добавляется вкладка "component tree" содержащая элемент
         --  Container.

         Xt_Set_Arg (Args (0), Xm_N_Scrolling_Policy, Xm_Automatic);
         Component := Xm_Create_Managed_Scrolled_Window
                       (Notebook, "scrolled", Args (0 .. 0));

         Xt_Set_Arg (Args (0), Xm_N_Layout_Type, Xm_Outline);
         Xt_Set_Arg (Args (1), Xm_N_Automatic_Selection, Xm_No_Auto_Select);
         Annotation.CC_Window :=
           Xm_Create_Managed_Container
            (Component, "component_tree", Args (0 .. 1));

         Xt_Add_Callback (Annotation.CC_Window,
                          Xm_N_Selection_Callback,
                          Callbacks.On_Select'Access);

         --  Добавляем вкладку на ноутбук.
         --  При добавлении вкладка должна быть как Managed, иначе
         --  мотиф не назначит необходимые ей ресурсы.

         Annotation.CC_Button :=
           Xm_Create_Managed_Push_Button_Gadget
            (Notebook, To_String (Name_Image (Node)));
         Xt_Unmanage_Child (Annotation.CC_Button);

         return Annotation;
      end Create_Tab;

      Component  : Widget;
      Project    : Widget;
      Parent     : Widget;

   begin
      Relocate_Annotation_Table (Node);
      --  Увеличение размеров таблицы (при необходимости).

      case Node_Kind (Node) is
         when Node_Component_Class =>
            declare
               Annotation : Annotation_Record := Create_Tab;

            begin
               Parent  := Get_Project_Widget (Parent_Node (Node));
               Annotation.CC_Project :=
                 Add_Child (Project_Container, Parent, Node);

               Annotation.CC_Component :=
                 Add_Child (Annotation.CC_Window, Null_Widget, Node);

               Annotation_Table.Set_Item (Node, Annotation);
            end;

         when Node_Widget_Instance =>
            Parent    := Get_Component_Widget (Parent_Node (Node));
            Component := Add_Child
                          (Get_Component_Class (Node).CC_Window,
                           Parent,
                           Node);
            Annotation_Table.Set_Item
             (Node, (Kind         => Annotation_Widget_Instance,
                     WI_Component => Component));

         when Node_Application     =>
            Parent  := Get_Project_Widget (Parent_Node (Node));
            Project := Add_Child (Project_Container, Parent, Node);
            Annotation_Table.Set_Item
             (Node, (Kind       => Annotation_Node_Application,
                     NP_Project => Project));

         when Node_Project          =>
            Project := Add_Child (Project_Container, Null_Widget, Node);
            Annotation_Table.Set_Item
             (Node, (Kind       => Annotation_Node_Project,
                     NP_Project => Project));

         when others                =>
            null;
      end case;
   end Insert_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Reinitialize is
      Annotation : Annotation_Record;
      Args       : Xt_Arg_List (0 .. 0);

   begin

     --  Удаление всех виджетов из таблицы.

      for J in Annotation_Table.First .. Annotation_Table.Last loop
         Annotation := Annotation_Table.Table (J);
         case Annotation.Kind is
            when Annotation_Component_Class  =>
               Xt_Destroy_Widget (Xt_Parent
                                   (Xt_Parent
                                     (Annotation.CC_Window)));
               Xt_Destroy_Widget (Annotation.CC_Button);
               Xt_Destroy_Widget (Get_Project_Widget (J));

            when Annotation_Node_Application
               | Annotation_Node_Project     =>
               Xt_Destroy_Widget (Get_Project_Widget (J));

            when Annotation_Widget_Instance  =>
               Xt_Destroy_Widget (Get_Component_Widget (J));

            when Annotation_Empty            =>
               null;
         end case;
      end loop;

      --  Очистка самой таблицы.

      Annotation_Table.Free;
      Annotation_Table.Init;

      Xt_Set_Arg (Args (0), Xm_N_Page_Number, Xt_Arg_Val (0));
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
         Annotation_Table.Table (J) := (Kind => Annotation_Empty);
      end loop;
   end Relocate_Annotation_Table;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id) is
      Class  : constant Annotation_Record := Get_Component_Class (Node);
      Args   : Xt_Arg_List (0 .. 2);
      Number : Integer;

   begin
      if Class.Kind = Annotation_Empty then
         return;
      end if;

      --  Получаем номер вклаки, и делаем ее активной.

      Xt_Set_Arg (Args (0), Xm_N_Page_Number, Number'Address);
      Xt_Get_Values (Class.CC_Button, Args (0 .. 0));

      Xt_Set_Arg (Args (0), Xm_N_Current_Page_Number, Xt_Arg_Val (Number));
      Xt_Set_Values (Notebook, Args (0 .. 0));

      Xt_Manage_Child (Class.CC_Button);
      --  Передаем на управление motif вкладку.
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
      if Node = Null_Node then
         return;
      end if;

      --  У приложения нет своего имени, но есть имя класса приложения.

      if Node_Kind (Node) = Node_Application then
         Str := Xm_String_Generate (Application_Class_Image (Node));

      else
         Str := Xm_String_Generate (Name_Image (Node));
      end if;

      --  Задаем имя компонента.

      Xt_Set_Arg (Args (0), Xm_N_Label_String, Str);

      case Annotation_Table.Table (Node).Kind is
         when Annotation_Node_Project
           | Annotation_Node_Application =>
            Xt_Set_Values (Get_Project_Widget (Node), Args);

         when Annotation_Component_Class =>
            Xt_Set_Values (Get_Project_Widget (Node), Args);
            Xt_Set_Values (Get_Component_Widget (Node), Args);

         when Annotation_Widget_Instance =>
            Xt_Set_Values (Get_Component_Widget (Node), Args);

         when Annotation_Empty =>
            null;
      end case;

      Xm_String_Free (Str);
   end Update_Item;

end Designer.Tree_Editor;
