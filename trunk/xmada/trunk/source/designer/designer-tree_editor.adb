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
            CC_Project   : Widget;
            CC_Component : Widget;

         when Annotation_Widget_Instance  =>
            WI_Component : Widget;

         when Annotation_Node_Project
           | Annotation_Node_Application  =>
            NP_Project : Widget;

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
   function Get_Project_Widget (Value : in Annotation_Record) return Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Project_Widget
   --!    <Purpose> функция возвращает виджет компонента,
   --! находящегося на component tree.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Get_Component_Widget (Value : in Annotation_Record) return Widget;

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

   end Callbacks;

   Selected_Item       : Node_Id := Null_Node;
   --  Элемент модели, выбранный пользователем в настоящий момент и для
   --  отображены страницы редактора дерева.

   Project_Container   : Widget;
   --  Контейнер, в котором содержится дерево проекта.

   Component_Container : Widget;
   --  Контейнер, в котором содержится дерево компонентов.

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
      if Selected_Item = Node then
         Selected_Item := Null_Node;
      end if;

      case Annotation.Kind is
         when Annotation_Node_Project
           | Annotation_Node_Application =>
             Xt_Destroy_Widget (Get_Project_Widget (Annotation));

         when Annotation_Component_Class =>
            Xt_Destroy_Widget (Get_Project_Widget (Annotation));
            Xt_Destroy_Widget (Get_Component_Widget (Annotation));

         when Annotation_Widget_Instance =>
            Xt_Destroy_Widget (Get_Component_Widget (Annotation));

         when Annotation_Empty =>
            null;
      end case;
   end Delete_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Component_Widget
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Component_Widget (Value : in Annotation_Record)
     return Widget
   is
   begin
      case Value.Kind is
         when Annotation_Component_Class  =>
            return Value.CC_Component;

         when  Annotation_Widget_Instance =>
            return Value.WI_Component;

         when others =>
            raise Constraint_Error;

      end case;
   end Get_Component_Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Project_Widget
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Project_Widget (Value : in Annotation_Record)
     return Widget
   is
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
      Notebook : Widget;
      Button   : Widget;

   begin
      Notebook := Xm_Create_Managed_Notebook (Parent, "notebook", Arg_List);

      --  С ноутбука удаляется элемент PageScroller.

      Button := Xt_Name_To_Widget (Notebook, "PageScroller");
      Xt_Unmanage_Child (Button);

      --  Добавляется вкладка "project tree" содержащая элемент
      --  Container.

      Args (0 .. Arg_List'Length - 1) := Arg_List;
      Xt_Set_Arg (Args (Arg_List'Length), Xm_N_Scrolling_Policy, Xm_Automatic);
      Scrolled :=
        Xm_Create_Managed_Scrolled_Window
         (Notebook, "scrolled", Args (0 .. Arg_List'Length));

      Xt_Set_Arg (Args (0), Xm_N_Layout_Type, Xm_Outline);
      Project_Container :=
        Xm_Create_Managed_Container (Scrolled, "project_tree", Args (0 .. 0));

      Button := Xm_Create_Managed_Push_Button_Gadget (Notebook, "project");

      --  Добавляется вкладка "component tree" содержащая элемент
      --  Container.

      Args (0 .. Arg_List'Length - 1) := Arg_List;
      Xt_Set_Arg (Args (Arg_List'Length), Xm_N_Scrolling_Policy, Xm_Automatic);
      Scrolled :=
        Xm_Create_Managed_Scrolled_Window
         (Notebook, "scrolled", Args (0 .. Arg_List'Length));

      Xt_Set_Arg (Args (0), Xm_N_Layout_Type, Xm_Outline);
      Component_Container :=
        Xm_Create_Managed_Container
         (Scrolled, "component_tree", Args (0 .. 0));

      Button := Xm_Create_Managed_Push_Button_Gadget (Notebook, "component");
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id) is
      Component : Widget;
      Project   : Widget;
      Parent    : Widget;

   begin
      Relocate_Annotation_Table (Node);
      --  Увеличение размеров таблицы (при необходимости).

      case Node_Kind (Node) is
         when Node_Component_Class =>
            Parent    :=
              Get_Project_Widget
                (Annotation_Table.Table (Parent_Node (Node)));
            Project   := Add_Child (Project_Container, Parent, Node);
            Component :=
              Add_Child (Component_Container, Null_Widget, Node);
            Annotation_Table.Set_Item
             (Node, (Kind         => Annotation_Component_Class,
                     CC_Component => Component,
                     CC_Project   => Project));

         when Node_Widget_Instance =>
            Parent    :=
              Get_Component_Widget
                (Annotation_Table.Table (Parent_Node (Node)));
            Component := Add_Child (Component_Container, Parent, Node);
            Annotation_Table.Set_Item
             (Node, (Kind         => Annotation_Widget_Instance,
                     WI_Component => Component));

         when Node_Application     =>
            Parent  :=
              Get_Project_Widget
                (Annotation_Table.Table (Parent_Node (Node)));
            Project :=
              Add_Child (Project_Container, Parent, Node);
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

   begin

     --  Удаление всех виджетов из таблицы.

      for J in Annotation_Table.First .. Annotation_Table.Last loop
         Annotation := Annotation_Table.Table (J);
         case Annotation.Kind is
            when Annotation_Component_Class  =>
               Xt_Destroy_Widget (Get_Component_Widget (Annotation));
               Xt_Destroy_Widget (Get_Project_Widget (Annotation));

            when Annotation_Node_Application
               | Annotation_Node_Project     =>
               Xt_Destroy_Widget (Get_Project_Widget (Annotation));

            when Annotation_Widget_Instance  =>
               Xt_Destroy_Widget (Get_Component_Widget (Annotation));

            when Annotation_Empty            =>
               null;
         end case;
      end loop;

      --  Очистка самой таблицы.

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
   begin
      Selected_Item := Node;
   end Select_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Model.Node_Id) is
   begin
      null;
   end Update_Item;

end Designer.Tree_Editor;
