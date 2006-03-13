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
--! <Unit> Designer.Visual_Editor.Microline
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
with Interfaces.C.Strings;
with System;

with Xlib.Events;
with Xt.Ancillary_Types;
with Xt.Callbacks;
with Xt.Composite_Management;
with Xt.Geometry_Management;
with Xt.Resource_Management;
with Xt.Translation_Management;
with Xt.Utilities;
with Xm.Traversal_Management;
with Xm_String_Defs;
with Xm_Text_Field;
with XmL;
with XmL_Grid;

with Designer.Main_Window;
with Model.Microline;
with Model.Names;
with Model.Strings;
with Model.Tree.Lists;
with Model.Utilities;

package body Designer.Visual_Editor.Microline is

   use Interfaces.C;
   use Model;
   use Model.Microline;
   use Model.Names;
   use Model.Strings;
   use Model.Tree;
   use Model.Tree.Lists;
   use Model.Utilities;
   use Xlib;
   use Xlib.Events;
   use Xm;
   use Xm.Traversal_Management;
   use Xm_String_Defs;
   use Xm_Text_Field;
   use XmL;
   use XmL_Grid;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Callbacks;
   use Xt.Composite_Management;
   use Xt.Geometry_Management;
   use Xt.Resource_Management;
   use Xt.Translation_Management;
   use Xt.Utilities;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Resource_Value
   --!    <Purpose> Возвращает узел значения ресурса с указанным именем для
   --! указанного экземпляра виджета. Возвращает пустой узел если значение
   --! ресурса с указанным именем отсутствует или отсутствует список значений
   --! ресурсов.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Get_Resource_Value (Node : in Node_Id; Name : in Wide_String)
     return Node_Id;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Resource_Specification
   --!    <Purpose> Возвращает узел спецификации ресурса с указанным именем
   --! для указанного класса виджета. Возвращает пустой узел если спецификация
   --! ресурса отсутствует или отсутствует список спецификаций ресурсов.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   function Get_Resource_Specification (Node : in Node_Id;
                                        Name : in Wide_String)
     return Node_Id;

   function Get_Row_Type (Node : in Node_Id) return Xm_Row_Type;

   procedure Set_Row_Type (Node : in Node_Id; Value : in Xm_Row_Type);

   function Get_Row (Node : in Node_Id) return Interfaces.C.int;

   procedure Set_Row (Node : in Node_Id; Value : in Interfaces.C.int);

   function Get_Column_Type (Node : in Node_Id) return Xm_Column_Type;

   procedure Set_Column_Type (Node : in Node_Id; Value : in Xm_Column_Type);

   function Get_Column (Node : in Node_Id) return Interfaces.C.int;

   procedure Set_Column (Node : in Node_Id; Value : in Interfaces.C.int);

   function Get_Cell_String_Image (Node : in Node_Id) return Wide_String;

   procedure Set_Cell_String (Node : in Node_Id; Value : in Wide_String);

   package Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Ok
      --!    <Purpose> Вызывается во всех случаях, когда производится
      --! сохранение введенного значения: при потере фокуса, нажатии ввода.
      --! Производит сохранение введенного значения в модели и удаление
      --! поля ввода.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_OK (The_Widget : in Widget;
                       Closure    : in Xt_Pointer;
                       Call_Data  : in Xt_Pointer);
      pragma Convention (C, On_OK);

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Cancel
      --!    <Purpose> Вызывает при отмене пользователем введенных изменений:
      --! нажатии кнопки Escape. Удаляет поле ввода.
      --!    <Exceptions>
      ------------------------------------------------------------------------
      procedure On_Cancel (The_Widget : in Widget;
                           Event      : in X_Event;
                           Params     : in System.Address;
                           Num_Params : in Cardinal);
      pragma Convention (C, On_Cancel);

   end Callbacks;

   Actions      : constant Xt_Action_List
     := (0 => (Interfaces.C.Strings.New_String
                ("XmAdaDesignerVisualEditorMicrolinePluginOnCancel"),
               Callbacks.On_Cancel'Access));

   Text         : Widget;
   Translations : Xt_Translations;

   --  Глобальные данные для определения текущей редактируемой ячейки.

   Grid_Node    : Node_Id;
   Grid_Widget  : Widget;
   Row_Type     : Xm_Row_Type;
   Column_Type  : Xm_Column_Type;
   Row          : Interfaces.C.int;
   Column       : Interfaces.C.int;

   package body Callbacks is

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_Cancel
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_Cancel (The_Widget : in Widget;
                           Event      : in X_Event;
                           Params     : in System.Address;
                           Num_Params : in Cardinal)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Event);
         pragma Unreferenced (Params);
         pragma Unreferenced (Num_Params);

      begin
         Xt_Unmanage_Child (Text);
      end On_Cancel;

      ------------------------------------------------------------------------
      --! <Subprogram>
      --!    <Unit> On_OK
      --!    <ImplementationNotes>
      ------------------------------------------------------------------------
      procedure On_OK (The_Widget : in Widget;
                       Closure    : in Xt_Pointer;
                       Call_Data  : in Xt_Pointer)
      is
         pragma Unreferenced (The_Widget);
         pragma Unreferenced (Closure);
         pragma Unreferenced (Call_Data);

         Aux : Node_Id := Null_Node;

      begin
         if Children (Grid_Node) /= Null_List then
            Aux := First (Children (Grid_Node));

            while Aux /= Null_Node loop
               exit when Class (Aux) = Microline_Grid_Cell_Class
                 and then Row_Type = Get_Row_Type (Aux)
                 and then Row = Get_Row (Aux)
                 and then Column_Type = Get_Column_Type (Aux)
                 and then Column = Get_Column (Aux);

               Aux := Next (Aux);
            end loop;

         else
            Set_Children (Grid_Node, New_List);
         end if;

         if Aux = Null_Node then
            Aux := Create_Widget_Instance (Microline_Grid_Cell_Class);
            Set_Name (Aux, Enter ("GridCellPseudoClass"));
            Set_Resources (Aux, New_List);

            Set_Row_Type (Aux, Row_Type);
            Set_Row (Aux, Row);
            Set_Column_Type (Aux, Column_Type);
            Set_Column (Aux, Column);

            Append (Children (Grid_Node), Aux);
         end if;

         Set_Cell_String (Aux, Xm_Text_Field_Get_String_Wcs (Text));

         Xt_Unmanage_Child (Text);

         Xt_Set_Values (Grid_Widget, Make_Set_Arg_List (Resources (Aux)));

      exception
         when E : others =>
            Designer.Main_Window.Put_Exception_In_Callback ("On_OK", E);
      end On_OK;

   end Callbacks;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Cell_String_Image
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Cell_String_Image (Node : in Node_Id) return Wide_String is
      Aux : constant Node_Id := Get_Resource_Value (Node, "cellString");

   begin
      if Aux /= Null_Node then
         return Image (String_Id'(Resource_Value (Aux)));

      else
         raise Program_Error;
      end if;
   end Get_Cell_String_Image;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Column
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Column (Node : in Node_Id) return Interfaces.C.int is
      Aux : constant Node_Id := Get_Resource_Value (Node, "column");

   begin
      if Aux /= Null_Node then
         return Interfaces.C.int (Integer'(Resource_Value (Aux)));

      else
         raise Program_Error;
      end if;
   end Get_Column;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Column_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Column_Type (Node : in Node_Id) return Xm_Column_Type is

      function To_Xm_Column_Type is
        new Ada.Unchecked_Conversion (Interfaces.C.unsigned_char,
                                      Xm_Column_Type);

      Aux : constant Node_Id := Get_Resource_Value (Node, "columnType");

   begin
      if Aux /= Null_Node then
         return To_Xm_Column_Type (Corresponding_Value (Resource_Value (Aux)));

      else
         raise Program_Error;
      end if;
   end Get_Column_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Resource_Specification
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Resource_Specification (Node : in Node_Id;
                                        Name : in Wide_String)
     return Node_Id
   is
   begin
      if Resources (Node) /= Null_List then
         declare
            N   : constant Name_Id := Find (Name);
            Aux : Node_Id          := First (Resources (Node));

         begin
            while Aux /= Null_Node loop
               exit when Internal_Resource_Name (Aux) = N;
               Aux := Next (Aux);
            end loop;

            return Aux;
         end;
      end if;

      return Null_Node;
   end Get_Resource_Specification;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Resource_Value (Node : in Node_Id; Name : in Wide_String)
     return Node_Id
   is
   begin
      if Resources (Node) /= Null_List then
         declare
            N   : constant Name_Id := Find (Name);
            Aux : Node_Id          := First (Resources (Node));

         begin
            while Aux /= Null_Node loop
               exit when
                 Internal_Resource_Name (Resource_Specification (Aux)) = N;
               Aux := Next (Aux);
            end loop;

            return Aux;
         end;
      end if;

      return Null_Node;
   end Get_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Row
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Row (Node : in Node_Id) return Interfaces.C.int is
      Aux : constant Node_Id := Get_Resource_Value (Node, "row");

   begin
      if Aux /= Null_Node then
         return Interfaces.C.int (Integer'(Resource_Value (Aux)));

      else
         raise Program_Error;
      end if;
   end Get_Row;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Row_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Get_Row_Type (Node : in Node_Id) return Xm_Row_Type is

      function To_Xm_Row_Type is
        new Ada.Unchecked_Conversion (Interfaces.C.unsigned_char,
                                      Xm_Row_Type);

      Aux : constant Node_Id := Get_Resource_Value (Node, "rowType");

   begin
      if Aux /= Null_Node then
         return To_Xm_Row_Type (Corresponding_Value (Resource_Value (Aux)));

      else
         raise Program_Error;
      end if;
   end Get_Row_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> On_Select
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure On_Select (Object     : access Microline_Plugin;
                        Node       : in     Model.Node_Id;
                        The_Widget : in     Xt.Widget;
                        Event      : in     Xt.X_Event)
   is
      pragma Unreferenced (Object);

      Args        : Xt_Arg_List (0 .. 2);
      Exists      : Boolean;
      Rectangle   : X_Rectangle;
      D_Root_X    : Position;
      D_Root_Y    : Position;
      G_Root_X    : Position;
      G_Root_Y    : Position;

   begin
      if Event.Kind = Button_Press then
         XmL_Grid_XY_To_Row_Column
          (The_Widget,
           Position (Event.Button_X),
           Position (Event.Button_Y),
           Row_Type,
           Row,
           Column_Type,
           Column,
           Exists);

         if Exists then
            Grid_Node   := Node;
            Grid_Widget := The_Widget;

            XmL_Grid_Row_Column_To_XY
             (The_Widget,
              Row_Type,
              Row,
              Column_Type,
              Column,
              True,
              Rectangle,
              Exists);

            if Text = Null_Widget then
               Xt_App_Add_Actions
                (Xt_Widget_To_Application_Context (Drawing_Area), Actions);

               Translations :=
                 Xt_Parse_Translation_Table
                  ("<Key>osfCancel:"
                     & " XmAdaDesignerVisualEditorMicrolinePluginOnCancel()");

               Text := Xm_Create_Text_Field (Drawing_Area, "cell_editor");
               Xt_Add_Callback
                (Text, Xm_N_Activate_Callback, Callbacks.On_OK'Access);
               Xt_Add_Callback
                (Text, Xm_N_Losing_Focus_Callback, Callbacks.On_OK'Access);
               Xt_Override_Translations (Text, Translations);
            end if;

            --  Позиционируем текстовое поле внутри ячейки.

            Xt_Translate_Coords (Drawing_Area, 0, 0, D_Root_X, D_Root_Y);
            Xt_Translate_Coords (The_Widget, 0, 0, G_Root_X, G_Root_Y);

            Xt_Set_Arg
             (Args (0),
              Xm_N_X,
              Xt_Arg_Val (Position (Rectangle.X) + G_Root_X - D_Root_X));
            Xt_Set_Arg
             (Args (1),
              Xm_N_Y,
              Xt_Arg_Val (Position (Rectangle.Y) + G_Root_Y - D_Root_Y));
            Xt_Set_Arg (Args (2), Xm_N_Width, Xt_Arg_Val (Rectangle.Width));
            Xt_Set_Values (Text, Args (0 .. 2));

            --  Отображаем текстовое поле на экране и перемещаем его поверх
            --  остальных окон визуального редактора.

            Xt_Manage_Child (Text);

            X_Raise_Window (Xt_Display_Of_Object (Text),
                            Xt_Window_Of_Object (Text));

            --  Переводим фокус ввода на текстовое поле.

            Exists := Xm_Process_Traversal (Text, Xm_Traverse_Current);

            --  Устанавливаем в текстовом поле строку, используемую в ячейке.

            Xm_Text_Field_Set_String_Wcs (Text, "");

            if Children (Node) /= Null_List then
               declare
                  Child : Node_Id := First (Children (Node));

               begin
                  while Child /= Null_Node loop
                     if Row_Type = Get_Row_Type (Child)
                       and then Row = Get_Row (Child)
                       and then Column_Type = Get_Column_Type (Child)
                       and then Column = Get_Column (Child)
                     then
                        Xm_Text_Field_Set_String_Wcs
                         (Text, Get_Cell_String_Image (Child));
                     end if;

                     Child := Next (Child);
                  end loop;
               end;
            end if;
         end if;
      end if;
   end On_Select;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> On_Widget_Create
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure On_Widget_Create (Object     : access Microline_Plugin;
                               Node       : in     Model.Node_Id;
                               The_Widget : in     Xt.Widget)
   is
      pragma Unreferenced (Object);

   begin
      if Children (Node) /= Null_List then
         declare
            Child : Node_Id := First (Children (Node));

         begin
            while Child /= Null_Node loop
               if Class (Child) = Microline_Grid_Cell_Class then
                  Xt_Set_Values
                   (The_Widget, Make_Set_Arg_List (Resources (Child)));
               end if;

               Child := Next (Child);
            end loop;
         end;
      end if;
   end On_Widget_Create;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Cell_String
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Cell_String (Node : in Node_Id; Value : in Wide_String) is
      Aux : Node_Id := Get_Resource_Value (Node, "cellString");

   begin
      if Aux = Null_Node then
         Aux :=
           Create_Corresponding_Resource_Value
            (Get_Resource_Specification
              (Microline_Grid_Cell_Class, "cellString"));
         Append (Resources (Node), Aux);
      end if;

      Set_Resource_Value (Aux, Store (Value));
   end Set_Cell_String;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Column
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Column (Node : in Node_Id; Value : in Interfaces.C.int) is
      Aux : Node_Id := Get_Resource_Value (Node, "column");

   begin
      if Aux = Null_Node then
         Aux :=
           Create_Corresponding_Resource_Value
            (Get_Resource_Specification
              (Microline_Grid_Cell_Class, "column"));
         Append (Resources (Node), Aux);
      end if;

      Set_Resource_Value (Aux, Integer (Value));
   end Set_Column;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Column_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Column_Type (Node : in Node_Id; Value : in Xm_Column_Type) is

      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Column_Type,
                                      Interfaces.C.unsigned_char);

      Aux : Node_Id := Get_Resource_Value (Node, "columnType");

   begin
      if Aux = Null_Node then
         Aux :=
           Create_Corresponding_Resource_Value
            (Get_Resource_Specification
              (Microline_Grid_Cell_Class, "columnType"));
         Append (Resources (Node), Aux);
      end if;

      Set_Resource_Value
       (Aux,
        Corresponding_Enumeration_Resource_Value_Specification
         (Resource_Type (Resource_Specification (Aux)),
          To_unsigned_char (Value)));
   end Set_Column_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Row
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Row (Node : in Node_Id; Value : in Interfaces.C.int) is
      Aux : Node_Id := Get_Resource_Value (Node, "row");

   begin
      if Aux = Null_Node then
         Aux :=
           Create_Corresponding_Resource_Value
            (Get_Resource_Specification (Microline_Grid_Cell_Class, "row"));
         Append (Resources (Node), Aux);
      end if;

      Set_Resource_Value (Aux, Integer (Value));
   end Set_Row;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Set_Row_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Set_Row_Type (Node : in Node_Id; Value : in Xm_Row_Type) is

      function To_unsigned_char is
        new Ada.Unchecked_Conversion (Xm_Row_Type,
                                      Interfaces.C.unsigned_char);

      Aux : Node_Id := Get_Resource_Value (Node, "rowType");

   begin
      if Aux = Null_Node then
         Aux :=
           Create_Corresponding_Resource_Value
            (Get_Resource_Specification
              (Microline_Grid_Cell_Class, "rowType"));
         Append (Resources (Node), Aux);
      end if;

      Set_Resource_Value
       (Aux,
        Corresponding_Enumeration_Resource_Value_Specification
         (Resource_Type (Resource_Specification (Aux)),
          To_unsigned_char (Value)));
   end Set_Row_Type;

end Designer.Visual_Editor.Microline;
