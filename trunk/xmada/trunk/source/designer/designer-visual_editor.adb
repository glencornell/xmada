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

with Xm.Representation_Type_Management;
with Xm_Drawing_Area;
with Xm_Scrolled_Window;

with Designer.Main_Window;
with Model.Queries;
with Model.Tree.Lists;

package body Designer.Visual_Editor is

   use Model;
   use Model.Queries;
   use Model.Tree;
   use Model.Tree.Lists;
   use Xm.Representation_Type_Management;
   use Xm_Drawing_Area;
   use Xm_Scrolled_Window;
   use Xt;

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
   --!    <Unit> Delete_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Delete_Item (Node : in Model.Node_Id) is
   begin
      null;
   end Delete_Item;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Get_Properties
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Get_Properties (Node : in Model.Node_Id) is
   begin
      null;
   end Get_Properties;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize (Parent : in Xt.Widget) is
      Scroll : Widget;
      Draw   : Widget;

   begin
      Scroll := Xm_Create_Managed_Scrolled_Window (Parent, "scrolled");
      Draw   := Xm_Create_Managed_Drawing_Area (Scroll, "drawing");
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
            null;

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
   begin
      null;
   end Reinitialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Select_Item
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Select_Item (Node : in Model.Node_Id) is
   begin
      null;
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
