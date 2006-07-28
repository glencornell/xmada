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
--! <Unit> Designer.Visual_Editor
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Characters.Handling;
with Ada.Characters.Latin_1;
with Interfaces.C.Strings;
with System;

with GNAT.Table;

with Xlib.Graphic_Output;
with Xlib.Resource_Manager;
with Xt.Ancillary_Types;
with Xt.Composite_Management;
with Xt.Event_Management;
with Xt.Initializers;
with Xt.Instance_Management;
with Xt.Resource_Management;
with Xt.Translation_Management;
with Xt.Utilities;
with Xm.Resource_Management;
with Xm.Strings;
with Xm_Drawing_Area;
with Xm_Scrolled_Window;
with Xm_String_Defs;

with Designer.Main_Window;
with Designer.Utilities;
with Model.Allocations;
with Model.Names;
with Model.Queries;
with Model.Strings;
with Model.Tree.Designer;
with Model.Tree.Lists;
with Model.Utilities;
with Model.Widget_Instances_Ordering;

package body Designer.Visual_Editor is

   use Designer.Utilities;
   use Model;
   use Model.Names;
   use Model.Queries;
   use Model.Strings;
   use Model.Tree;
   use Model.Tree.Designer;
   use Model.Tree.Lists;
   use Model.Utilities;
   use Xlib.Graphic_Output;
   use Xm;
   use Xm.Resource_Management;
   use Xm.Strings;
   use Xm_Drawing_Area;
   use Xm_Scrolled_Window;
   use Xm_String_Defs;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;
   use Xt.Event_Management;
   use Xt.Initializers;
   use Xt.Instance_Management;
   use Xt.Resource_Management;
   use Xt.Translation_Management;
   use Xt.Utilities;

   type Annotation_Kinds is
    (Annotation_Empty,
     Annotation_Resource_Value,
     Annotation_Widget_Instance);

   type Resource_Value_Kinds is
    (Value_Undefined,
     Value_C_Unsigned_Char,
     Value_C_Short,
     Value_C_Int,
     Value_String,
     Value_Position,
     Value_Dimension,
     Value_Widget_Reference,
     Value_Xm_String);

   type Annotation_Record (Kind       : Annotation_Kinds := Annotation_Empty;
                           Value_Kind : Resource_Value_Kinds
                             := Value_Undefined)
   is
   record
      case Kind is
         when Annotation_Empty =>
            null;

         when Annotation_Widget_Instance =>
            Widget      : Xt.Widget;
            --  Виджет визуального редактора, представляющий узел.

         when Annotation_Resource_Value =>
            Name :  Xt.Xt_Resource_Name_String;

            case Value_Kind is
               when Value_Undefined =>
                  null;

               when Value_C_Unsigned_Char =>
                  C_Unsigned_Char_Value : aliased Interfaces.C.unsigned_char;

               when Value_C_Short =>
                  C_Short_Value : aliased Interfaces.C.short;

               when Value_C_Int =>
                  C_Int_Value : aliased Interfaces.C.int;

               when Value_Position =>
                  Position_Value : aliased Xt.Position;

               when Value_String =>
                  String_Value : aliased Interfaces.C.Strings.chars_ptr;

               when Value_Dimension =>
                  Dimension_Value : aliased Xt.Dimension;

               when Value_Widget_Reference =>
                  Widget_Reference_Value : aliased Xt.Widget;

               when Value_Xm_String =>
                  Xm_String_Value : aliased Xm.Xm_String;
            end case;
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
   --!    <Unit> Create_Component_Class_Widgets
   --!    <Purpose> Создаёт виджеты класса компонента.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Create_Component_Class_Widgets (Node : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Destroy_Component_Class_Widgets
   --!    <Purpose> Уничтожает виджеты класса компонента.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Destroy_Component_Class_Widgets (Node : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget
   --!    <Purpose> Создание виджета на визуальном редакторе.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Create_Widget (Node : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Setup_Reverse_Converters
   --!    <Purpose> Производит установку конверторов обратного преобразования
   --! для всех известных перечислимых типов ресурсов.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Setup_Reverse_Converters (Types : in List_Id);
   --  XXX В последующем эту подпрограмму необходимо вынести в отдельный
   --  пакет, который будет производить всю начальную инициализацию и
   --  проверку соответствия загруженной модели реально поддерживаемым
   --  возможностям используемой библиотеки времени исполнения.

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
   --!    <Unit> Make_Get_Arg_List
   --!    <Purpose> Формирует и возвращает список параметров виджета для
   --! последующего использования его при получении значений ресурсов виджета.
   --! Для пустого списка возвращается пустой спискок параметров виджета.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Make_Get_Arg_List (List : in List_Id) return Xt_Arg_List;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Pump_Values
   --!    <Purpose> Производит обновление значений ресурсов в списке по
   --! данным из таблицы аннотирования.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Pump_Values (List : in List_Id);

   package Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Expose
      --!    <Purpose> Производит отрисовку рамки выбора вокруг виджета,
      --! если виджет является выбранным пользователем элементом модели.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Expose (The_Widget : in Widget;
                           Event      : in X_Event;
                           Params     : in System.Address;
                           Num_Params : in Cardinal);
      pragma Convention (C, On_Expose);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Select
      --!    <Purpose>
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Select (The_Widget : in Widget;
                           Event      : in X_Event;
                           Params     : in System.Address;
                           Num_Params : in Cardinal);
      pragma Convention (C, On_Select);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Work
      --!    <Purpose> Производит создание виджетов редактируемого класса
      --! компонента. Регистрируется при обработке извещения о предстоящем
      --! удалении экземпляра виджета.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      function On_Work (Closure : in Xt_Pointer) return Xt_Boolean;
      pragma Convention (C, On_Work);

   end Callbacks;

   Actions : constant Xt_Action_List
     := ((Interfaces.C.Strings.New_String
           ("XmAdaDesignerVisualEditorOnExpose"),
          Callbacks.On_Expose'Access),
         (Interfaces.C.Strings.New_String
           ("XmAdaDesignerVisualEditorOnSelect"),
          Callbacks.On_Select'Access));

   Edited_Component : Node_Id := Null_Node;
   Selected_Item    : Node_Id := Null_Node;
   Translations     : Xt_Translations;
   Reincarnate      : Node_Id := Null_Node;
   --  Используется для указания класса компонента виджеты которого должна
   --  повторна создать подпрограмма On_Work.

   -----------------
   --  Callbacks  --
   -----------------

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Expose
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Expose (The_Widget : in Widget;
                           Event      : in X_Event;
                           Params     : in System.Address;
                           Num_Params : in Cardinal)
      is
         pragma Unreferenced (Event);
         pragma Unreferenced (Params);
         pragma Unreferenced (Num_Params);

         use type Interfaces.C.short;
         use type Interfaces.C.unsigned_short;

         ---------------------------------------------------------------------
         --! <Subprogram>
         --!    <Unit> Draw_Visual_Editor_Selection
         --!    <Purpose> Производит отрисовку рамки выделения виджета в
         --! стиле визуального редактора.
         --!    <Exceptions>
         ---------------------------------------------------------------------
         procedure Draw_Visual_Editor_Selection
          (The_Display : in Xlib.Display;
           The_Window  : in Xlib.Window;
           GC          : in Xlib.Graphic_Context;
           X           : in Interfaces.C.short;
           Y           : in Interfaces.C.short;
           Width       : in Interfaces.C.unsigned_short;
           Height      : in Interfaces.C.unsigned_short);

         ---------------------------------------------------------------------
         --! <Subprogram>
         --!    <Unit> Draw_Visual_Editor_Selection
         --!    <ImplementationNotes>
         ---------------------------------------------------------------------
         procedure Draw_Visual_Editor_Selection
          (The_Display : in Xlib.Display;
           The_Window  : in Xlib.Window;
           GC          : in Xlib.Graphic_Context;
           X           : in Interfaces.C.short;
           Y           : in Interfaces.C.short;
           Width       : in Interfaces.C.unsigned_short;
           Height      : in Interfaces.C.unsigned_short)
         is
            Maximum_X : constant Interfaces.C.short
              := X + Interfaces.C.short (Width) - 4;
            Maximum_Y : constant Interfaces.C.short
              := Y + Interfaces.C.short (Height) - 4;
            Middle_X  : constant Interfaces.C.short := Maximum_X / 2;
            Middle_Y  : constant Interfaces.C.short := Maximum_Y / 2;

         begin
            X_Draw_Rectangle
             (The_Display, The_Window, GC, X, Y, Width, Height);
            X_Draw_Rectangle
             (The_Display, The_Window, GC,
              X + 1, Y + 1, Width - 2, Height - 2);

            X_Fill_Rectangle
             (The_Display, The_Window, GC, X, Y, 5, 5);
            X_Fill_Rectangle
             (The_Display, The_Window, GC, Middle_X, Y, 5, 5);
            X_Fill_Rectangle
             (The_Display, The_Window, GC, Maximum_X, Y, 5, 5);
            X_Fill_Rectangle
             (The_Display, The_Window, GC, Maximum_X, Middle_Y, 5, 5);
            X_Fill_Rectangle
             (The_Display, The_Window, GC, Maximum_X, Maximum_Y, 5, 5);
            X_Fill_Rectangle
             (The_Display, The_Window, GC, Middle_X, Maximum_Y, 5, 5);
            X_Fill_Rectangle
             (The_Display, The_Window, GC, X, Maximum_Y, 5, 5);
            X_Fill_Rectangle
             (The_Display, The_Window, GC, X, Middle_Y, 5, 5);
         end Draw_Visual_Editor_Selection;

      begin
         if Selected_Item = Null_Node then
            return;
         end if;

         case Node_Kind (Selected_Item) is
            when Node_Project | Node_Application | Node_Component_Class =>
               return;

            when Node_Widget_Instance =>
               if The_Widget
                    /= Annotation_Table.Table (Selected_Item).Widget
               then
                  return;
               end if;

            when others =>
               raise Program_Error;
         end case;

         declare
            Args   : Xt_Arg_List (0 .. 1);
            Width  : Dimension;
            Height : Dimension;
            GC     : Xlib.Graphic_Context;

         begin
            Xt_Set_Arg (Args (0), Xm_N_Width, Width'Address);
            Xt_Set_Arg (Args (1), Xm_N_Height, Height'Address);
            Xt_Get_Values
             (Annotation_Table.Table (Selected_Item).Widget, Args);

            GC :=
              Xt_Get_GC
               (The_Widget, (others => False), (Logical_Operation => GX_Set));

            Draw_Visual_Editor_Selection
             (Xt_Display_Of_Object (The_Widget),
              Xt_Window_Of_Object (The_Widget),
              GC,
              0,
              0,
              Interfaces.C.unsigned_short (Width) - 1,
              Interfaces.C.unsigned_short (Height) - 1);
         end;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback ("On_Expose", E);
      end On_Expose;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Select
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Select (The_Widget : in Widget;
                           Event      : in X_Event;
                           Params     : in System.Address;
                           Num_Params : in Cardinal)
      is
         pragma Unreferenced (Params);
         pragma Unreferenced (Num_Params);

         Node : Xt_Arg_Val;
         Args : Xt_Arg_List (0 .. 0);

      begin
         Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
         Xt_Get_Values (The_Widget, Args (0 .. 0));

         --  Вызов вспомогательного модуля визуального редактора (если
         --  таковой задан для класса виджета).

         if Visual_Editor_Plugin (Class (Node_Id (Node))) /= null then
            On_Select (Visual_Editor_Plugin (Class (Node_Id (Node))),
                       Node_Id (Node),
                       The_Widget,
                       Event);
         end if;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback ("On_Select", E);
      end On_Select;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Work
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      function On_Work (Closure : in Xt_Pointer) return Xt_Boolean is
         pragma Unreferenced (Closure);

      begin
         if Reincarnate /= Null_Node then
            Create_Component_Class_Widgets (Reincarnate);
            Reincarnate := Null_Node;
         end if;

         return not Xt_False;

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback ("On_Work", E);

            return not Xt_False;
      end On_Work;

   end Callbacks;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Corresponding_Enumeration_Resource_Value_Specification
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Corresponding_Enumeration_Resource_Value_Specification
    (Enumeration_Resource_Type : in Node_Id;
     Value                     : in Interfaces.C.unsigned_char)
       return Node_Id
   is
      use type Interfaces.C.unsigned_char;

      Aux : Node_Id
        := First (Value_Specifications (Enumeration_Resource_Type));

   begin
      --  Специальная обработка предопределенного типа Boolean. Тип имеет
      --  значение FALSE если преобразовываемое значение равно нулю и TRUE
      --  в противном случае.

      if Internal_Name_Image (Enumeration_Resource_Type) = "Boolean" then
         --  Предполагается, что первый элемент перечисления есть FALSE, а
         --  второй - TRUE. В случае неравенства преобразуемого значения нулю
         --  (т.е. TRUE) просто берётся следующий элемент в списке спецификаций
         --  значений перечислимого типа.

         if Value /= 0 then
            Aux := Next (Aux);
         end if;

      else
         while Aux /= Null_Node loop
            if Representation_Value (Aux) = Value then
               exit;
            end if;

            Aux := Next (Aux);
         end loop;
      end if;

      if Aux = Null_Node then
         raise Program_Error;
      end if;

      return Aux;
   end Corresponding_Enumeration_Resource_Value_Specification;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Corresponding_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Corresponding_Value
    (Enumeration_Resource_Value_Specification : in Node_Id)
       return Interfaces.C.unsigned_char
   is
      use type Interfaces.C.unsigned;

      C_Image : constant Xlib.X_String
        := Interfaces.C.To_C
            (Ada.Characters.Handling.To_String
              (Internal_Name_Image
                (Enumeration_Resource_Value_Specification)));


   begin
      case Representation_Type
            (Parent_Node (Enumeration_Resource_Value_Specification))
      is
         when Representation_Type_C_Unsigned_Char =>
            declare
               C_Value : Interfaces.C.unsigned_char;
               From    : constant Xlib.Resource_Manager.Xrm_Value
                 := (Xlib.X_String_Pointer'Size / System.Storage_Unit,
                     Xlib.X_Pointer (C_Image'Address));
               To      : constant Xlib.Resource_Manager.Xrm_Value
                 := (C_Value'Size / System.Storage_Unit,
                     Xlib.X_Pointer (C_Value'Address));

            begin
               if not Xt_Convert_And_Store
                       (Drawing_Area,
                        "String",
                        From,
                        Ada.Characters.Handling.To_String
                         (Internal_Name_Image
                           (Parent_Node
                             (Enumeration_Resource_Value_Specification))),
                        To)
               then
                  Main_Window.Put_Line
                   ("Storage size for enumeration type '"
                      & Internal_Name_Image
                         (Parent_Node
                           (Enumeration_Resource_Value_Specification))
                      & "' conversion to small, should be"
                      & " at least"
                      & Interfaces.C.unsigned'Wide_Image
                         (From.Size * System.Storage_Unit)
                      & " bits.");

                  raise Program_Error;
               end if;

               return C_Value;
            end;

         when Representation_Type_C_Int =>
            declare
               C_Value : Interfaces.C.int;
               From    : constant Xlib.Resource_Manager.Xrm_Value
                 := (Xlib.X_String_Pointer'Size / System.Storage_Unit,
                     Xlib.X_Pointer (C_Image'Address));
               To      : constant Xlib.Resource_Manager.Xrm_Value
                 := (C_Value'Size / System.Storage_Unit,
                     Xlib.X_Pointer (C_Value'Address));

            begin
               if not Xt_Convert_And_Store
                       (Drawing_Area,
                        "String",
                        From,
                        Ada.Characters.Handling.To_String
                         (Internal_Name_Image
                           (Parent_Node
                             (Enumeration_Resource_Value_Specification))),
                        To)
               then
                  Main_Window.Put_Line
                   ("Storage size for enumeration type '"
                      & Internal_Name_Image
                         (Parent_Node
                           (Enumeration_Resource_Value_Specification))
                      & "' conversion to small, should be"
                      & " at least"
                      & Interfaces.C.unsigned'Wide_Image
                         (From.Size * System.Storage_Unit)
                      & " bits.");

                  raise Program_Error;
               end if;

               return Interfaces.C.unsigned_char (C_Value);
            end;

         when Representation_Type_Unspecified =>
            Main_Window.Put_Line
             ("Representation size for enumeration type '"
                 & Internal_Name_Image
                    (Parent_Node
                      (Enumeration_Resource_Value_Specification))
                 & "' not defined.");

            return 0;
--            raise Program_Error;
--
--  XXX Закомментировано временно, для обеспечения возможности запуска
--  дизайнера с некорректной моделью.
      end case;
   end Corresponding_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Component_Class_Widgets
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Component_Class_Widgets (Node : in Node_Id) is

      use Model.Widget_Instances_Ordering;

   begin
      if Root (Node) /= Null_Node then
         Find_Widget_Instances_Order (Root (Node));

         for J in Widget_Instances_Order_Table.First
                    .. Widget_Instances_Order_Table.Last
         loop
            Create_Widget (Widget_Instances_Order_Table.Table (J));
         end loop;
      end if;

      Edited_Component := Node;
   end Create_Component_Class_Widgets;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Widget (Node : in Node_Id) is
      Parent : Widget;
      Args   : Xt_Arg_List (0 .. 1);

   begin
      Relocate_Annotation_Table (Node);

      if Node_Kind (Parent_Node (Node)) = Node_Component_Class then
         Parent := Drawing_Area;
      else
         Parent := Annotation_Table.Table (Parent_Node (Node)).Widget;
      end if;

      Xt_Set_Arg (Args (0), Xm_N_Translations, Translations);
      Xt_Set_Arg (Args (1), Xm_N_User_Data, Xt_Arg_Val (Node));
      Annotation_Table.Table (Node).Widget :=
        Convenience_Create_Function (Class (Node))
         (Parent,
          To_Locale_String (Name_Image (Node)),
          Make_Set_Arg_List (Resources (Node),
                             Is_Set_Initial_Size (Class (Node)))
            & Make_Set_Arg_List (Constraint_Resources (Node))
            & Args);

      --  Вызов вспомогательного модуля визуального редактора (если
      --  таковой задан для класса виджета).

      if Visual_Editor_Plugin (Class (Node)) /= null then
         On_Widget_Create (Visual_Editor_Plugin (Class (Node)),
                           Node,
                           Annotation_Table.Table (Node).Widget);
      end if;

      Xt_Manage_Child (Annotation_Table.Table (Node).Widget);
   end Create_Widget;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Delete_Item (Node : in Model.Node_Id) is
   begin
      case Node_Kind (Node) is
         when Node_Project | Node_Application =>
            null;

         when Node_Component_Class =>
            if Node = Edited_Component
              and then Edited_Component /= Null_Node
            then
               Reincarnate := Null_Node;
               Destroy_Component_Class_Widgets (Edited_Component);
            end if;

         when Node_Widget_Instance =>
            if Enclosing_Component_Class (Node) = Edited_Component then
               declare
                  Aux : Xt_Work_Proc_Id;
                  pragma Warnings (Off, Aux);
                  --  Используется для сохранения возвращаемого функцией
                  --  значения.

               begin
                  Reincarnate := Edited_Component;
                  Destroy_Component_Class_Widgets (Edited_Component);
                  Aux :=
                    Xt_App_Add_Work_Proc
                     (Xt_Widget_To_Application_Context (Drawing_Area),
                      Callbacks.On_Work'Access);
               end;
            end if;

         when Node_Widget_Reference_Resource_Value =>
            null;

         when others =>
            raise Program_Error;
      end case;
   end Delete_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Destroy_Component_Class_Widgets
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Destroy_Component_Class_Widgets (Node : in Node_Id) is

      procedure Destroy_Widget (Node : in Node_Id);

      procedure Destroy_Widget (Node : in Node_Id) is
      begin
         if Children (Node) /= Null_List then
            declare
               Aux : Node_Id := First (Children (Node));

            begin
               while Aux /= Null_Node loop
                  Destroy_Widget (Aux);
                  Aux := Next (Aux);
               end loop;
            end;
         end if;

         Xt_Destroy_Widget (Annotation_Table.Table (Node).Widget);
         Annotation_Table.Table (Node).Widget := Null_Widget;
      end Destroy_Widget;

   begin
      if Root (Node) /= Null_Node then
         Destroy_Widget (Root (Node));
      end if;

      Edited_Component := Null_Node;
   end Destroy_Component_Class_Widgets;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Properties
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Get_Properties (Node : in Model.Node_Id) is
   begin
      Xt_Get_Values (Annotation_Table.Table (Node).Widget,
                     Make_Get_Arg_List (All_Resources (Node))
                       & Make_Get_Arg_List (All_Constraint_Resources (Node)));

      Pump_Values (All_Resources (Node));
      Pump_Values (All_Constraint_Resources (Node));
   end Get_Properties;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize (Parent : in Xt.Widget) is
      Scroll : Widget;

   begin
      Xt_App_Add_Actions (Xt_Widget_To_Application_Context (Parent), Actions);
      Translations :=
        Xt_Parse_Translation_Table
         ("<Expose>: XmAdaDesignerVisualEditorOnExpose()"
            & Ada.Characters.Latin_1.LF
            & "<Btn1Down>: XmAdaDesignerVisualEditorOnSelect()"
            & Ada.Characters.Latin_1.LF);

      Scroll       := Xm_Create_Managed_Scrolled_Window (Parent, "scrolled");
      Drawing_Area := Xm_Create_Managed_Drawing_Area (Scroll, "drawing");
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id) is
   begin
      case Node_Kind (Node) is
         when Node_Project =>
            --  Инициализируем все классы виджетов. Это необходимо для
            --  установки классами конверторов перечислимых типов.

            declare
               Set : Node_Id := First (Imported_Widget_Sets (Node));

            begin
               while Set /= Null_Node loop
                  declare
                     Class : Node_Id := First (Widget_Classes (Set));

                  begin
                     while Class /= Null_Node loop
                        if Model.Tree.Designer.Widget_Class (Class)
                             /= Null_Widget_Class
                        then
                           Xt_Initialize_Widget_Class
                            (Model.Tree.Designer.Widget_Class (Class));
                        end if;

                        Class := Next (Class);
                     end loop;
                  end;

                  Set := Next (Set);
               end loop;
            end;

            --  Устанавливаем обратные конверторы типов ресурсов.

            declare
               Set : Node_Id := First (Imported_Widget_Sets (Node));

            begin
               while Set /= Null_Node loop
                  Setup_Reverse_Converters (Resource_Types (Set));
                  Set := Next (Set);
               end loop;
            end;

         when Node_Application =>
            null;

         when Node_Component_Class =>
            null;

         when Node_Widget_Instance =>
            --  Производим формирование списков значений всех ресурсов и
            --  ресурсов ограничений добавленного экземпляра виджета для
            --  обеспечения взаимодействия с редактором свойств.

            declare
               Aux   : Node_Id := First (Resources (Class (Node)));
               List  : List_Id := New_List;

            begin
               --  Формирование списков значений ресурсов.

               while Aux /= Null_Node loop
                  Append (List, Create_Corresponding_Resource_Value (Aux));
                  Aux := Next (Aux);
               end loop;

               Set_All_Resources (Node, List);

               if Node_Kind (Parent_Node (Node)) = Node_Widget_Instance then
                  --  Формирование списка значений ресурсов ограничений -
                  --  список ресурсов извлекается у класса родительского
                  --  виджета.

                  if Constraint_Resources (Class (Parent_Node (Node)))
                       /= Null_List
                  then
                     List := New_List;
                     Aux :=
                       First
                        (Constraint_Resources (Class (Parent_Node (Node))));
                     --  XXX  Простейший случай - нет автоматически
                     --  создаваемого родительского виджета.

                     while Aux /= Null_Node loop
                        Append
                         (List, Create_Corresponding_Resource_Value (Aux));
                        Aux := Next (Aux);
                     end loop;

                     Set_All_Constraint_Resources (Node, List);
                  end if;
               end if;
            end;

            --  Производим создание виджета если класс компонента виджета
            --  совпадает с отображённым.

            if Enclosing_Component_Class (Node) = Edited_Component then
               Create_Widget (Node);
            end if;

         when others =>
            raise Program_Error;
      end case;
   end Insert_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Make_Get_Arg_List
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Make_Get_Arg_List (List : in List_Id) return Xt_Arg_List is
   begin
      if List = Null_List then
         return Xt_Arg_List'(1 .. 0 => (Interfaces.C.Strings.Null_Ptr, 0));
      end if;

      declare
         Aux      : Node_Id := First (List);
         Args     : Xt_Arg_List (0 .. Length (List) - 1);
         Next_Arg : Natural := 0;

      begin
         while Aux /= Null_Node loop
            Relocate_Annotation_Table (Aux);

            case Node_Kind (Resource_Type (Resource_Specification (Aux))) is
               when Node_Predefined_Resource_Type =>
                  case Type_Kind
                        (Resource_Type (Resource_Specification (Aux)))
                  is
                     when Type_C_Short =>
                        Xt_Set_Arg
                         (Args (Next_Arg),
                          Annotation_Table.Table (Aux).Name,
                          Annotation_Table.Table
                           (Aux).C_Short_Value'Address);
                        Next_Arg := Next_Arg + 1;

                     when Type_C_Int =>
                        Xt_Set_Arg
                         (Args (Next_Arg),
                          Annotation_Table.Table (Aux).Name,
                          Annotation_Table.Table
                           (Aux).C_Int_Value'Address);
                        Next_Arg := Next_Arg + 1;

                     when Type_Dimension =>
                        Xt_Set_Arg
                         (Args (Next_Arg),
                          Annotation_Table.Table (Aux).Name,
                          Annotation_Table.Table
                           (Aux).Dimension_Value'Address);
                        Next_Arg := Next_Arg + 1;

                     when Type_Position =>
                        Xt_Set_Arg
                         (Args (Next_Arg),
                          Annotation_Table.Table (Aux).Name,
                          Annotation_Table.Table
                           (Aux).Position_Value'Address);
                        Next_Arg := Next_Arg + 1;

                     when Type_Translation_Data =>
                        null;

                     when Type_Colormap =>
                        null;

                     when Type_Screen =>
                        null;

                     when Type_Pixel =>
                        null;

                     when Type_Pixmap =>
                        null;

                     when others =>
                        raise Program_Error;
                  end case;

               when Node_Enumerated_Resource_Type =>
                  Xt_Set_Arg
                   (Args (Next_Arg),
                    Annotation_Table.Table (Aux).Name,
                    Annotation_Table.Table
                     (Aux).C_Unsigned_Char_Value'Address);
                  Next_Arg := Next_Arg + 1;

               when Node_String_Resource_Type =>
                  Xt_Set_Arg
                   (Args (Next_Arg),
                    Annotation_Table.Table (Aux).Name,
                    Annotation_Table.Table (Aux).String_Value'Address);
                  Next_Arg := Next_Arg + 1;

               when Node_Widget_Reference_Resource_Type =>
                  Xt_Set_Arg
                   (Args (Next_Arg),
                    Annotation_Table.Table (Aux).Name,
                    Annotation_Table.Table
                     (Aux).Widget_Reference_Value'Address);
                  Next_Arg := Next_Arg + 1;

               when Node_Xm_Render_Table_Resource_Type =>
                  null;
                  --  Получение значения таблицы рендеринга в настоящее время
                  --  не поддерживается.

               when Node_Xm_String_Resource_Type =>
                  Xt_Set_Arg
                   (Args (Next_Arg),
                    Annotation_Table.Table (Aux).Name,
                    Annotation_Table.Table (Aux).Xm_String_Value'Address);
                  Next_Arg := Next_Arg + 1;

               when others =>
                  raise Program_Error;
            end case;

            Aux := Next (Aux);
         end loop;

         return Args (0 .. Next_Arg - 1);
      end;
   end Make_Get_Arg_List;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Make_Set_Arg_List
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Make_Set_Arg_List (List             : in List_Id;
                               Set_Initial_Size : in Boolean := False)
     return Xt_Arg_List
   is
   begin
      if List = Null_List then
         if Set_Initial_Size then
            declare
               Args : Xt_Arg_List (0 .. 1);

            begin
               Xt_Set_Arg (Args (0), Xm_N_Width, Xt_Arg_Val (100));
               Xt_Set_Arg (Args (1), Xm_N_Height, Xt_Arg_Val (100));

               return Args;
            end;

         else
            return Null_Xt_Arg_List;
         end if;
      end if;

      declare
         Aux            : Node_Id := First (List);
         Args           : Xt_Arg_List (0 .. Length (List) + 1);
         --  Два дополнительных аргумента предназначены для задания значения
         --  ресурсов width и height если установлен Set_Initial_Size.

         Next_Arg       : Natural := 0;
         Width_Present  : Boolean := False;
         Height_Present : Boolean := False;
         --  Признаки наличия значений ширины и высоты в формируемом списке
         --  аргументов.

         Width_Name     : constant Name_Id := Find ("width");
         Height_Name    : constant Name_Id := Find ("height");
         --  Номера имён ресурсов ширины и высоты.

      begin
         while Aux /= Null_Node loop
            Relocate_Annotation_Table (Aux);

            case Node_Kind (Resource_Type (Resource_Specification (Aux))) is
               when Node_Predefined_Resource_Type =>
                  case Type_Kind
                        (Resource_Type (Resource_Specification (Aux)))
                  is
                     when Type_C_Short =>
                        Xt_Set_Arg
                         (Args (Next_Arg),
                          Annotation_Table.Table (Aux).Name,
                          Xt_Arg_Val (Integer'(Resource_Value (Aux))));

                        Next_Arg := Next_Arg + 1;

                     when Type_C_Int =>
                        Xt_Set_Arg
                         (Args (Next_Arg),
                          Annotation_Table.Table (Aux).Name,
                          Xt_Arg_Val (Integer'(Resource_Value (Aux))));

                        Next_Arg := Next_Arg + 1;

                     when Type_Dimension =>
                        if Internal_Resource_Name
                            (Resource_Specification (Aux)) = Width_Name
                        then
                           Width_Present := True;

                        elsif Internal_Resource_Name
                            (Resource_Specification (Aux)) = Height_Name
                        then
                           Height_Present := True;
                        end if;

                        Xt_Set_Arg
                         (Args (Next_Arg),
                          Annotation_Table.Table (Aux).Name,
                          Xt_Arg_Val (Integer'(Resource_Value (Aux))));

                        Next_Arg := Next_Arg + 1;

                     when Type_Position =>
                        Xt_Set_Arg
                         (Args (Next_Arg),
                          Annotation_Table.Table (Aux).Name,
                          Xt_Arg_Val (Integer'(Resource_Value (Aux))));

                        Next_Arg := Next_Arg + 1;

                     when Type_Translation_Data =>
                        null;

                     when Type_Colormap =>
                        null;

                     when Type_Screen =>
                        null;

                     when Type_Pixel =>
                        null;

                     when Type_Pixmap =>
                        null;

                     when others =>
                        raise Program_Error;
                 end case;

               when Node_Enumerated_Resource_Type =>
                  Xt_Set_Arg
                   (Args (Next_Arg),
                    Annotation_Table.Table (Aux).Name,
                    Xt_Arg_Val
                     (Corresponding_Value (Resource_Value (Aux))));

                  Next_Arg := Next_Arg + 1;

               when Node_String_Resource_Type =>
                  if Resource_Value (Aux) /= Null_String then
                     Xt_Set_Arg
                      (Args (Next_Arg),
                       Annotation_Table.Table (Aux).Name,
                       Interfaces.C.Strings.New_String
                        (To_Locale_String (Image (Resource_Value (Aux)))));

                     Next_Arg := Next_Arg + 1;
                  end if;

               when Node_Widget_Reference_Resource_Type =>
                  if Resource_Value (Aux) = Null_Node then
                     Xt_Set_Arg
                      (Args (Next_Arg),
                       Annotation_Table.Table (Aux).Name,
                       Null_Widget);

                  else
                     Xt_Set_Arg
                      (Args (Next_Arg),
                       Annotation_Table.Table (Aux).Name,
                       Annotation_Table.Table (Resource_Value (Aux)).Widget);
                  end if;

                  Next_Arg := Next_Arg + 1;

               when Node_Xm_Render_Table_Resource_Type =>
                  null;
                  --  XXX  Не реализовано.

               when Node_Xm_String_Resource_Type =>
                  if Resource_Value (Aux) /= Null_String then
                     Xt_Set_Arg
                      (Args (Next_Arg),
                       Annotation_Table.Table (Aux).Name,
                       Xm_String_Generate (Image (Resource_Value (Aux))));

                     Next_Arg := Next_Arg + 1;
                  end if;

               when others =>
                  raise Program_Error;
            end case;

            Aux := Next (Aux);
         end loop;

         --  Если была затребована установка значений ширины и высоты, но
         --  в сформированном списке ресурсов эти значения не были заданы,
         --  то дополняем список ресурсов.

         if Set_Initial_Size then
            if not Width_Present then
               Xt_Set_Arg (Args (Next_Arg), Xm_N_Width, Xt_Arg_Val (100));
               Next_Arg := Next_Arg + 1;
            end if;

            if not Height_Present then
               Xt_Set_Arg (Args (Next_Arg), Xm_N_Height, Xt_Arg_Val (100));
               Next_Arg := Next_Arg + 1;
            end if;
         end if;

         return Args (0 .. Next_Arg - 1);
      end;
   end Make_Set_Arg_List;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Pump_Values
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Pump_Values (List : in List_Id) is
   begin
      if List = Null_List then
         return;
      end if;

      declare
         Aux : Node_Id := First (List);

      begin
         while Aux /= Null_Node loop
            case Node_Kind (Resource_Type (Resource_Specification (Aux))) is
               when Node_Predefined_Resource_Type =>
                  case Type_Kind
                        (Resource_Type (Resource_Specification (Aux)))
                  is
                     when Type_C_Short =>
                        Set_Resource_Value
                         (Aux,
                          Integer
                           (Annotation_Table.Table (Aux).C_Short_Value));

                     when Type_C_Int =>
                        Set_Resource_Value
                         (Aux,
                          Integer
                           (Annotation_Table.Table (Aux).C_Int_Value));

                     when Type_Dimension =>
                        Set_Resource_Value
                         (Aux,
                          Integer
                           (Annotation_Table.Table (Aux).Dimension_Value));

                     when Type_Position =>
                        Set_Resource_Value
                         (Aux,
                          Integer
                           (Annotation_Table.Table (Aux).Position_Value));

                     when Type_Translation_Data =>
                        null;

                     when Type_Colormap =>
                        null;

                     when Type_Screen =>
                        null;

                     when Type_Pixel =>
                        null;

                     when Type_Pixmap =>
                        null;

                     when others =>
                        raise Program_Error;
                 end case;

               when Node_Enumerated_Resource_Type =>
                  Set_Resource_Value
                   (Aux,
                    Corresponding_Enumeration_Resource_Value_Specification
                     (Resource_Type (Resource_Specification (Aux)),
                   Annotation_Table.Table (Aux).C_Unsigned_Char_Value));

               when Node_String_Resource_Type =>
                  declare
                     Str : constant Wide_String
                       := From_Locale_String
                           (Annotation_Table.Table (Aux).String_Value);

                  begin
                     if Resource_Value (Aux) = Null_String
                       or else Image (Resource_Value (Aux)) /= Str
                     then
                        Set_Resource_Value (Aux, Store (Str));
                     end if;

                     Interfaces.C.Strings.Free
                      (Annotation_Table.Table (Aux).String_Value);
                     Annotation_Table.Table (Aux).String_Value :=
                       Interfaces.C.Strings.Null_Ptr;
                  end;

               when Node_Widget_Reference_Resource_Type =>
                  declare
                     Node : Xt_Arg_Val;
                     Args : Xt_Arg_List (0 .. 0);

                  begin
                     if Annotation_Table.Table (Aux).Widget_Reference_Value
                          = Null_Widget
                     then
                        Set_Resource_Value (Aux, Null_Node);

                     else
                        Xt_Set_Arg (Args (0), Xm_N_User_Data, Node'Address);
                        Xt_Get_Values
                         (Annotation_Table.Table (Aux).Widget_Reference_Value,
                          Args);
                        Set_Resource_Value (Aux, Node_Id (Node));
                     end if;
                  end;

               when Node_Xm_Render_Table_Resource_Type =>
                  null;
                  --  Получение значения таблицы рендеринга в настоящее время
                  --  не поддерживается.

               when Node_Xm_String_Resource_Type =>
                  declare
                     Str : constant Wide_String
                       := Xm_String_Unparse
                           (Annotation_Table.Table (Aux).Xm_String_Value);

                  begin
                     if Resource_Value (Aux) = Null_String
                       or else Image (Resource_Value (Aux)) /= Str
                     then
                        Set_Resource_Value (Aux, Store (Str));
                     end if;

                     Xm_String_Free
                      (Annotation_Table.Table (Aux).Xm_String_Value);
                     Annotation_Table.Table (Aux).Xm_String_Value :=
                       Null_Xm_String;
                  end;

               when others =>
                  raise Program_Error;
            end case;

            Set_Is_Changed (Aux, True);

            Aux := Next (Aux);
         end loop;
      end;
   end Pump_Values;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Reinitialize is
   begin
      for J in Annotation_Table.First .. Annotation_Table.Last loop
         case Annotation_Table.Table (J).Kind is
            when Annotation_Empty =>
               null;

            when Annotation_Widget_Instance =>
               if Annotation_Table.Table (J).Widget /= Null_Widget then
                  Xt_Destroy_Widget (Annotation_Table.Table (J).Widget);
               end if;

            when Annotation_Resource_Value =>
               Interfaces.C.Strings.Free (Annotation_Table.Table (J).Name);
         end case;
      end loop;

      Annotation_Table.Init;

      Edited_Component := Null_Node;
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
            when Node_Widget_Instance =>
               Annotation_Table.Table (J) :=
                (Kind        => Annotation_Widget_Instance,
                 Value_Kind  => Value_Undefined,
                 Widget      => Null_Widget);

            when Node_Integer_Resource_Value
              | Node_Widget_Reference_Resource_Value
              | Node_Pixel_Resource_Value
              | Node_Pixmap_Resource_Value
              | Node_Colormap_Resource_Value
              | Node_Screen_Resource_Value
              | Node_Translation_Data_Resource_Value
              | Node_String_Resource_Value
              | Node_Enumeration_Resource_Value
              | Node_Xm_String_Resource_Value
            =>
               case Node_Kind (Resource_Type (Resource_Specification (J))) is
                  when Node_Predefined_Resource_Type =>
                     case Type_Kind
                           (Resource_Type (Resource_Specification (J)))
                     is
                        when Type_C_Short =>
                           Annotation_Table.Table (J) :=
                            (Kind          => Annotation_Resource_Value,
                             Value_Kind    => Value_C_Short,
                             Name          =>
                               Interfaces.C.Strings.New_String
                                (Ada.Characters.Handling.To_String
                                  (Internal_Resource_Name_Image
                                    (Resource_Specification (J)))),
                             C_Short_Value => 0);

                         when Type_C_Int =>
                           Annotation_Table.Table (J) :=
                            (Kind        => Annotation_Resource_Value,
                             Value_Kind  => Value_C_Int,
                             Name        =>
                               Interfaces.C.Strings.New_String
                                (Ada.Characters.Handling.To_String
                                  (Internal_Resource_Name_Image
                                    (Resource_Specification (J)))),
                             C_Int_Value => 0);

                         when Type_Dimension =>
                           Annotation_Table.Table (J) :=
                            (Kind            => Annotation_Resource_Value,
                             Value_Kind      => Value_Dimension,
                             Name            =>
                               Interfaces.C.Strings.New_String
                                (Ada.Characters.Handling.To_String
                                  (Internal_Resource_Name_Image
                                    (Resource_Specification (J)))),
                             Dimension_Value => 0);

                         when Type_Position =>
                           Annotation_Table.Table (J) :=
                            (Kind           => Annotation_Resource_Value,
                             Value_Kind     => Value_Position,
                             Name           =>
                               Interfaces.C.Strings.New_String
                                (Ada.Characters.Handling.To_String
                                  (Internal_Resource_Name_Image
                                    (Resource_Specification (J)))),
                             Position_Value => 0);

                         when Type_Translation_Data =>
                            Annotation_Table.Table (J) :=
                             (Kind        => Annotation_Empty,
                              Value_Kind  => Value_Undefined);

                         when Type_Colormap =>
                            Annotation_Table.Table (J) :=
                             (Kind        => Annotation_Empty,
                              Value_Kind  => Value_Undefined);

                         when Type_Screen =>
                            Annotation_Table.Table (J) :=
                             (Kind        => Annotation_Empty,
                              Value_Kind  => Value_Undefined);

                         when Type_Pixel =>
                            Annotation_Table.Table (J) :=
                             (Kind        => Annotation_Empty,
                              Value_Kind  => Value_Undefined);

                         when Type_Pixmap =>
                            Annotation_Table.Table (J) :=
                             (Kind        => Annotation_Empty,
                              Value_Kind  => Value_Undefined);

                         when others =>
                            raise Program_Error;
                     end case;

                  when Node_Enumerated_Resource_Type =>
                     Annotation_Table.Table (J) :=
                      (Kind                  => Annotation_Resource_Value,
                       Value_Kind            => Value_C_Unsigned_Char,
                       Name                  =>
                         Interfaces.C.Strings.New_String
                          (Ada.Characters.Handling.To_String
                            (Internal_Resource_Name_Image
                              (Resource_Specification (J)))),
                       C_Unsigned_Char_Value => 0);

                  when Node_String_Resource_Type =>
                     Annotation_Table.Table (J) :=
                      (Kind         => Annotation_Resource_Value,
                       Value_Kind   => Value_String,
                       Name         =>
                         Interfaces.C.Strings.New_String
                          (Ada.Characters.Handling.To_String
                            (Internal_Resource_Name_Image
                              (Resource_Specification (J)))),
                       String_Value => Interfaces.C.Strings.Null_Ptr);

                  when Node_Widget_Reference_Resource_Type =>
                     Annotation_Table.Table (J) :=
                      (Kind                   => Annotation_Resource_Value,
                       Value_Kind             => Value_Widget_Reference,
                       Name                   =>
                         Interfaces.C.Strings.New_String
                          (Ada.Characters.Handling.To_String
                            (Internal_Resource_Name_Image
                              (Resource_Specification (J)))),
                       Widget_Reference_Value => Null_Widget);

                  when Node_Xm_String_Resource_Type =>
                     Annotation_Table.Table (J) :=
                      (Kind            => Annotation_Resource_Value,
                       Value_Kind      => Value_Xm_String,
                       Name            =>
                         Interfaces.C.Strings.New_String
                          (Ada.Characters.Handling.To_String
                            (Internal_Resource_Name_Image
                              (Resource_Specification (J)))),
                       Xm_String_Value => Null_Xm_String);

                  when others =>
                     raise Program_Error;
               end case;

            when others =>
               Annotation_Table.Table (J) := (Kind        => Annotation_Empty,
                                              Value_Kind  => Value_Undefined);
         end case;
      end loop;
   end Relocate_Annotation_Table;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id) is
   begin
      if Selected_Item /= Null_Node then
         if Node_Kind (Selected_Item) = Node_Widget_Instance then
            X_Clear_Area
             (Xt_Display_Of_Object
               (Annotation_Table.Table (Selected_Item).Widget),
              Xt_Window_Of_Object
               (Annotation_Table.Table (Selected_Item).Widget),
              0, 0, 0, 0, True);
         end if;
      end if;

      Selected_Item := Node;

      if Selected_Item /= Null_Node then
         case Node_Kind (Selected_Item) is
            when Node_Application =>
               null;

            when Node_Component_Class =>
               if Edited_Component /= Selected_Item then
                  if Edited_Component /= Null_Node then
                     Destroy_Component_Class_Widgets (Edited_Component);
                  end if;

                  Create_Component_Class_Widgets (Selected_Item);
               end if;

               Edited_Component := Selected_Item;

            when Node_Project =>
               null;

            when Node_Widget_Instance =>
               if Enclosing_Component_Class (Selected_Item)
                    /= Edited_Component
               then
                  if Edited_Component /= Null_Node then
                     Destroy_Component_Class_Widgets (Edited_Component);
                  end if;

                  Create_Component_Class_Widgets
                   (Enclosing_Component_Class (Selected_Item));
               end if;

               X_Clear_Area
                (Xt_Display_Of_Object
                  (Annotation_Table.Table (Selected_Item).Widget),
                 Xt_Window_Of_Object
                  (Annotation_Table.Table (Selected_Item).Widget),
                 0, 0, 0, 0, True);

            when others =>
               raise Program_Error;
         end case;
      end if;
   end Select_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Properties
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Properties (Node : in Model.Node_Id) is
   begin
      Xt_Set_Values
       (Annotation_Table.Table (Node).Widget,
        Make_Set_Arg_List (All_Resources (Node))
          & Make_Set_Arg_List (All_Constraint_Resources (Node)));

      Get_Properties (Node);
   end Set_Properties;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Setup_Reverse_Converters
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Setup_Reverse_Converters (Types : in List_Id) is
      Aux : Node_Id;
      Val : Node_Id;

   begin
      if Types = Null_List then
         return;
      end if;

      Aux := First (Types);

      while Aux /= Null_Node loop
         if Node_Kind (Aux) = Node_Enumerated_Resource_Type then
            Val := First (Value_Specifications (Aux));

            while Val /= Null_Node loop
               Set_Representation_Value (Val, Corresponding_Value (Val));

               Val := Next (Val);
            end loop;
         end if;

         Aux := Next (Aux);
      end loop;
   end Setup_Reverse_Converters;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Update_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Update_Item (Node : in Model.Node_Id) is
      pragma Unreferenced (Node);

   begin
      null;
   end Update_Item;

end Designer.Visual_Editor;
