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
--! <Unit> Designer.Visual_Editor
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Characters.Handling;
with Ada.Unchecked_Deallocation;
with Interfaces.C.Strings;
with System;

with GNAT.Table;

with Xlib.Resource_Manager;
with Xt.Ancillary_Types;
with Xt.Composite_Management;
with Xt.Resource_Management;
with Xm.Representation_Type_Management;
with Xm_Drawing_Area;
with Xm_Scrolled_Window;

with Designer.Main_Window;
with Model.Allocations;
with Model.Names;
with Model.Queries;
with Model.Tree.Designer;
with Model.Tree.Lists;
with Model.Utilities;

package body Designer.Visual_Editor is

   use Model;
   use Model.Names;
   use Model.Queries;
   use Model.Tree;
   use Model.Tree.Designer;
   use Model.Tree.Lists;
   use Model.Utilities;
   use Xm.Representation_Type_Management;
   use Xm_Drawing_Area;
   use Xm_Scrolled_Window;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Composite_Management;
   use Xt.Resource_Management;

   type Resource_Value_Kinds is
    (Value_Undefined,
     Value_C_Unsigned_Char,
     Value_C_Short,
     Value_C_Int,
     Value_Position,
     Value_Dimension);

   type Resource_Value (Kind : Resource_Value_Kinds := Value_Undefined) is
   record
      Name : Xt.Xt_Resource_Name_String;

      case Kind is
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

         when Value_Dimension =>
            Dimension_Value : aliased Xt.Dimension;
      end case;
   end record;

   type Resource_Value_Array is array (Natural range <>) of Resource_Value;

   type Resource_Value_Set (Last : Natural) is record
      Values : Resource_Value_Array (0 .. Last);
      Args   : Xt_Arg_List (0 .. Last);
   end record;

   type Resource_Value_Set_Access is access all Resource_Value_Set;

   type Annotation_Kinds is
    (Annotation_Empty,
     Annotation_Widget_Instance);

   type Annotation_Record (Kind : Annotation_Kinds := Annotation_Empty) is
   record
      case Kind is
         when Annotation_Empty =>
            null;

         when Annotation_Widget_Instance =>
            Widget      : Xt.Widget;
            --  Виджет визуального редактора, представляющий узел.

            Resources   : Resource_Value_Set_Access;
            Constraints : Resource_Value_Set_Access;
            --  Подготовленные массивы для установки/получения значений
            --  ресурсов виджета.
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

   Drawing_Area     : Widget  := Null_Widget;
   Edited_Component : Node_Id := Null_Node;
   Selected_Item    : Node_Id := Null_Node;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Component_Class_Widgets
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Component_Class_Widgets (Node : in Node_Id) is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Create_Widget
      --!    <Purpose> Создание виджета на визуальном редакторе.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure Create_Widget (Node : in Node_Id);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> Create_Widget
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure Create_Widget (Node : in Node_Id) is
         Aux     : Node_Id;
         Current : Natural := 0;
         Parent  : Widget;

      begin
         Relocate_Annotation_Table (Node);

         if Node_Kind (Parent_Node (Node)) = Node_Component_Class then
            Parent := Drawing_Area;

         else
            Parent := Annotation_Table.Table (Parent_Node (Node)).Widget;
         end if;

         --  TODO Необходимо подготовить соответствующий список значений
         --  ресурсов на основании атрибутов Resources и Constraints.

         Annotation_Table.Table (Node).Widget :=
           Convenience_Create_Function (Class (Node))
            (Parent, "form", Null_Xt_Arg_List);

         if All_Resources (Node) /= Null_List then
            Annotation_Table.Table (Node).Resources :=
              new Resource_Value_Set (Length (All_Resources (Node)) - 1);

            Aux := First (All_Resources (Node));

            while Aux /= Null_Node loop
               case Node_Kind (Resource_Type (Resource_Specification (Aux))) is
                  when Node_Predefined_Resource_Type =>
                     case Type_Kind
                           (Resource_Type (Resource_Specification (Aux)))
                     is
                        when Type_C_Short =>
                           Annotation_Table.Table (Node).Resources.Values
                            (Current) :=
                              (Value_C_Short,
                               Interfaces.C.Strings.New_String
                                (Ada.Characters.Handling.To_String
                                  (Internal_Resource_Name_Image
                                    (Resource_Specification (Aux)))),
                               0);

                        when Type_C_Int =>
                           Annotation_Table.Table (Node).Resources.Values
                            (Current) :=
                              (Value_C_Int,
                               Interfaces.C.Strings.New_String
                                (Ada.Characters.Handling.To_String
                                  (Internal_Resource_Name_Image
                                    (Resource_Specification (Aux)))),
                               0);

                        when Type_Dimension =>
                           Annotation_Table.Table (Node).Resources.Values
                            (Current) :=
                              (Value_Dimension,
                               Interfaces.C.Strings.New_String
                                (Ada.Characters.Handling.To_String
                                  (Internal_Resource_Name_Image
                                    (Resource_Specification (Aux)))),
                               0);

                        when Type_Position =>
                           Annotation_Table.Table (Node).Resources.Values
                            (Current) :=
                              (Value_Position,
                               Interfaces.C.Strings.New_String
                                (Ada.Characters.Handling.To_String
                                  (Internal_Resource_Name_Image
                                    (Resource_Specification (Aux)))),
                               0);

                        when Type_Boolean =>
                           Annotation_Table.Table (Node).Resources.Values
                            (Current) :=
                              (Value_C_Int,
                               Interfaces.C.Strings.Null_Ptr,
                               0);

                        when Type_Translation_Data =>
                           Annotation_Table.Table (Node).Resources.Values
                            (Current) :=
                              (Value_C_Int,
                               Interfaces.C.Strings.Null_Ptr,
                               0);

                        when Type_Pixel =>
                           Annotation_Table.Table (Node).Resources.Values
                            (Current) :=
                              (Value_C_Int,
                               Interfaces.C.Strings.Null_Ptr,
                               0);

                        when Type_Pixmap =>
                           Annotation_Table.Table (Node).Resources.Values
                            (Current) :=
                              (Value_C_Int,
                               Interfaces.C.Strings.Null_Ptr,
                               0);

                        when Type_Colormap =>
                           Annotation_Table.Table (Node).Resources.Values
                            (Current) :=
                              (Value_C_Int,
                               Interfaces.C.Strings.Null_Ptr,
                               0);

                        when Type_Screen =>
                           Annotation_Table.Table (Node).Resources.Values
                            (Current) :=
                              (Value_C_Int,
                               Interfaces.C.Strings.Null_Ptr,
                               0);

                        when others =>
                           raise Program_Error;
                     end case;

                  when Node_Enumerated_Resource_Type =>
                     Annotation_Table.Table (Node).Resources.Values
                      (Current) :=
                        (Value_C_Unsigned_Char,
                         Interfaces.C.Strings.New_String
                          (Ada.Characters.Handling.To_String
                            (Internal_Resource_Name_Image
                              (Resource_Specification (Aux)))),
                         0);

                  when Node_Widget_Reference_Resource_Type =>
                     Annotation_Table.Table (Node).Resources.Values
                      (Current) :=
                        (Value_C_Int,
                         Interfaces.C.Strings.Null_Ptr,
                         0);

                  when others =>
                     raise Program_Error;
               end case;

               Aux := Next (Aux);
               Current := Current + 1;
            end loop;
         end if;

         if Children (Node) /= Null_List then
            Aux := First (Children (Node));

            while Aux /= Null_Node loop
               Create_Widget (Aux);
               Aux := Next (Aux);
            end loop;
         end if;

         Xt_Manage_Child (Annotation_Table.Table (Node).Widget);
      end Create_Widget;

   begin
      if Root (Node) /= Null_Node then
         Create_Widget (Root (Node));
      end if;
   end Create_Component_Class_Widgets;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Delete_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Delete_Item (Node : in Model.Node_Id) is
      pragma Unreferenced (Node);

   begin
      null;
   end Delete_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Properties
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Get_Properties (Node : in Model.Node_Id) is
      Current : Natural := 0;
      Aux     : Node_Id;

   begin
      if All_Resources (Node) /= Null_List then
         Aux := First (All_Resources (Node));

         while Aux /= Null_Node loop
            case Node_Kind (Resource_Type (Resource_Specification (Aux))) is
               when Node_Predefined_Resource_Type =>
                  case Type_Kind
                        (Resource_Type (Resource_Specification (Aux)))
                  is
                     when Type_C_Short =>
                        Xt_Set_Arg
                         (Annotation_Table.Table (Node).Resources.Args
                           (Current),
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).Name,
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).C_Short_Value'Address);

                     when Type_C_Int =>
                        Xt_Set_Arg
                         (Annotation_Table.Table (Node).Resources.Args
                           (Current),
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).Name,
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).C_Int_Value'Address);

                     when Type_Dimension =>
                        Xt_Set_Arg
                         (Annotation_Table.Table (Node).Resources.Args
                           (Current),
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).Name,
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).Dimension_Value'Address);

                     when Type_Position =>
                        Xt_Set_Arg
                         (Annotation_Table.Table (Node).Resources.Args
                           (Current),
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).Name,
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).Position_Value'Address);

                     when Type_Translation_Data =>
                        Xt_Set_Arg
                         (Annotation_Table.Table (Node).Resources.Args
                           (Current),
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).Name,
                          Xt_Arg_Val (0));

                     when Type_Boolean =>
                        Xt_Set_Arg
                         (Annotation_Table.Table (Node).Resources.Args
                           (Current),
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).Name,
                          Xt_Arg_Val (0));

                     when Type_Colormap =>
                        Xt_Set_Arg
                         (Annotation_Table.Table (Node).Resources.Args
                           (Current),
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).Name,
                          Xt_Arg_Val (0));

                     when Type_Screen =>
                        Xt_Set_Arg
                         (Annotation_Table.Table (Node).Resources.Args
                           (Current),
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).Name,
                          Xt_Arg_Val (0));

                     when Type_Pixel =>
                        Xt_Set_Arg
                         (Annotation_Table.Table (Node).Resources.Args
                           (Current),
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).Name,
                          Xt_Arg_Val (0));

                     when Type_Pixmap =>
                        Xt_Set_Arg
                         (Annotation_Table.Table (Node).Resources.Args
                           (Current),
                          Annotation_Table.Table (Node).Resources.Values
                           (Current).Name,
                          Xt_Arg_Val (0));

                     when others =>
                        raise Program_Error;
                 end case;

               when Node_Enumerated_Resource_Type =>
                  Xt_Set_Arg
                   (Annotation_Table.Table (Node).Resources.Args
                     (Current),
                    Annotation_Table.Table (Node).Resources.Values
                     (Current).Name,
                    Annotation_Table.Table (Node).Resources.Values
                     (Current).C_Unsigned_Char_Value'Address);

               when Node_Widget_Reference_Resource_Type =>
                  Xt_Set_Arg
                   (Annotation_Table.Table (Node).Resources.Args (Current),
                    Annotation_Table.Table (Node).Resources.Values
                     (Current).Name,
                    Xt_Arg_Val (0));

               when others =>
                  raise Program_Error;
            end case;

            Aux := Next (Aux);
            Current := Current + 1;
         end loop;

         Xt_Get_Values (Annotation_Table.Table (Node).Widget,
                        Annotation_Table.Table (Node).Resources.Args);

         Aux := First (All_Resources (Node));
         Current := 0;

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
                           (Annotation_Table.Table
                             (Node).Resources.Values (Current).C_Short_Value));

                     when Type_C_Int =>
                        Set_Resource_Value
                         (Aux,
                          Integer
                           (Annotation_Table.Table
                             (Node).Resources.Values (Current).C_Int_Value));

                     when Type_Dimension =>
                        Set_Resource_Value
                         (Aux,
                          Integer
                           (Annotation_Table.Table
                             (Node).Resources.Values
                               (Current).Dimension_Value));

                     when Type_Position =>
                        Set_Resource_Value
                         (Aux,
                          Integer
                           (Annotation_Table.Table
                             (Node).Resources.Values
                               (Current).Position_Value));

                     when Type_Translation_Data =>
                        null;

                     when Type_Boolean =>
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
                  declare
                     use Interfaces.C.Strings;
                     use Interfaces.C;
                     use Xlib.Resource_Manager;

                     C_Image : chars_ptr;

                     From    : constant Xrm_Value
                       := (Interfaces.C.unsigned_char'Size
                             / System.Storage_Unit,
                           Xlib.X_Pointer
                            (Annotation_Table.Table
                              (Node).Resources.Values
                                (Current).C_Unsigned_Char_Value'Address));
                     To      : constant Xrm_Value
                       := (C_Image'Size / System.Storage_Unit,
                           Xlib.X_Pointer (C_Image'Address));

                  begin
                     if not Xt_Convert_And_Store
                             (Drawing_Area,
                              Ada.Characters.Handling.To_String
                               (Internal_Name_Image
                                 (Resource_Type
                                   (Resource_Specification (Aux)))),
                              From,
                              "String",
                              To)
                     then
                        raise Program_Error;
                     end if;

                     declare
                        Image : constant Name_Id
                          := Find
                              (Ada.Characters.Handling.To_Wide_String
                                (Ada.Characters.Handling.To_Upper
                                  (Value (C_Image))));
                        Val   : Node_Id
                          := First
                              (Value_Specifications
                                (Resource_Type
                                  (Resource_Specification (Aux))));

                     begin
                        while Val /= Null_Node loop
                           if Internal_Name (Val) = Image then
                              exit;
                           end if;

                           Val := Next (Val);
                        end loop;

                        if Val = Null_Node then
                           raise Program_Error;
                        end if;

                        Set_Resource_Value (Aux, Val);
                     end;
                  end;

               when Node_Widget_Reference_Resource_Type =>
                  null;

               when others =>
                  raise Program_Error;
            end case;

            Set_Is_Changed (Aux, True);

            Aux := Next (Aux);
            Current := Current + 1;
         end loop;
      end if;
   end Get_Properties;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize (Parent : in Xt.Widget) is
      Scroll : Widget;

   begin
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

         when others =>
            raise Program_Error;
      end case;
   end Insert_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Reinitialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Reinitialize is

      procedure Free is
        new Ada.Unchecked_Deallocation
             (Resource_Value_Set, Resource_Value_Set_Access);

   begin
      for J in Annotation_Table.First .. Annotation_Table.Last loop
         case Annotation_Table.Table (J).Kind is
            when Annotation_Empty =>
               null;

            when Annotation_Widget_Instance =>
               if Annotation_Table.Table (J).Resources /= null then
                  for K in Annotation_Table.Table (J).Resources.Values'Range
                  loop
                     Interfaces.C.Strings.Free
                      (Annotation_Table.Table (J).Resources.Values (K).Name);
                  end loop;
               end if;

               if Annotation_Table.Table (J).Constraints /= null then
                  for K in Annotation_Table.Table (J).Constraints.Values'Range
                  loop
                     Interfaces.C.Strings.Free
                      (Annotation_Table.Table (J).Constraints.Values (K).Name);
                  end loop;
               end if;

               Free (Annotation_Table.Table (J).Resources);
               Free (Annotation_Table.Table (J).Constraints);
         end case;
      end loop;

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
         case Node_Kind (J) is
            when Node_Widget_Instance =>
               Annotation_Table.Table (J) :=
                (Kind        => Annotation_Widget_Instance,
                 Widget      => Null_Widget,
                 Resources   => null,
                 Constraints => null);

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
   procedure Select_Item (Node : in Model.Node_Id) is
   begin
      if Selected_Item /= Null_Node then
         null;
      end if;

      Selected_Item := Node;

      if Selected_Item /= Null_Node then
         case Node_Kind (Selected_Item) is
            when Node_Application =>
               null;

            when Node_Component_Class =>
               if Edited_Component /= Selected_Item then
                  Create_Component_Class_Widgets (Selected_Item);
               end if;

               Edited_Component := Selected_Item;

            when Node_Project =>
               null;

            when Node_Widget_Instance =>
               if Enclosing_Component_Class (Selected_Item)
                    /= Edited_Component
               then
                  Create_Component_Class_Widgets
                   (Enclosing_Component_Class (Selected_Item));
               end if;

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
      null;
   end Set_Properties;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Setup_Reverse_Converters
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Setup_Reverse_Converters (Types : in List_Id) is
      Aux : Node_Id := First (Types);
      Id  : Xm_Rep_Type_Id;

   begin
      while Aux /= Null_Node loop
         if Node_Kind (Aux) = Node_Enumerated_Resource_Type then
            begin
               Id :=
                 Xm_Rep_Type_Get_Id
                  (Ada.Characters.Handling.To_String
                    (Internal_Name_Image (Aux)));
               Xm_Rep_Type_Add_Reverse (Id);

               --  XXX Кроме добавления обратных конверторов здесь желательно
               --  проверить соответствие состава литералов. Но это уже после
               --  создания специального модуля проверки соответствия модели
               --  и среды выполнения.

            exception
               when Unknown_Representation_Type_Error =>
                  Designer.Main_Window.Put_Line
                   ("Representation type "
                      & Internal_Name_Image (Aux)
                      & " is unknown");
            end;
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
   begin
      null;
   end Update_Item;

end Designer.Visual_Editor;
