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
--! <Unit> Designer.Properties_Editor
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with GNAT.Table;

with Xm_Notebook;

with Designer.Properties_Editor.Component_Class;
with Designer.Properties_Editor.Widget_Instance;
with Model.Allocations;
with Model.Tree;

package body Designer.Properties_Editor is

   use Model;
   use Model.Tree;
   use Xt;
   use Xm_Notebook;

   type Node_Properties_Editor_Access is
     access all Node_Properties_Editor'Class;

   --  Для каждого узла создаётся (по запросу) свой собственный редактор
   --  свойств. Уже созданные редакторы свойств сохраняются в таблице
   --  Annotation_Table.

   package Annotation_Table is
     new GNAT.Table
          (Table_Component_Type => Node_Properties_Editor_Access,
           Table_Index_Type     => Node_Id,
           Table_Low_Bound      => Node_Id'First + 1,
           Table_Initial        => Model.Allocations.Node_Table_Initial,
           Table_Increment      => Model.Allocations.Node_Table_Increment);

   Selected_Item : Node_Id := Null_Node;
   --  Элемент модели, выбранный пользователем в настоящий момент и для
   --  отображены страницы редактора свойств.

   Notebook : Widget;

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
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Initialize (Parent   : in Xt.Widget;
                         Arg_List : in Xt.Ancillary_Types.Xt_Arg_List)
   is
   begin
      Notebook := Xm_Create_Managed_Notebook (Parent, "notebook", Arg_List);
   end Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Insert_Item
   --!    <ImplementationNotes> В связи с тем, что все компоненты редактора
   --! свойств создаются "по требованию" при добавлении новго элемента
   --! производить каких-либо действий не требуется.
   ---------------------------------------------------------------------------
   procedure Insert_Item (Node : in Model.Node_Id) is
      pragma Unreferenced (Node);

   begin
      null;
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

      --  Прототип реализации.

--      if Selected_Item /= Null_Node then
--         Hide (Annotation_Table.Table (Selected_Item));
--      end if;
--
--      Selected_Item := Node;
--
--      if Selected_Item /= Null_Node then
--         if Annotation_Table.Table (Selected_Item) = null then
--            --  Создание страниц редактора свойств.
--
--            case Node_Kind (Selected_Item) is
--               when Node_Component_Class =>
--                  null;
--
--               when Node_Widget_Instance =>
--                  null;
--
--               when others =>
--                  raise Program_Error;
--            end case;
--         end if;
--
--         Show (Annotation_Table.Table (Selected_Item));
--      end if;
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

end Designer.Properties_Editor;
