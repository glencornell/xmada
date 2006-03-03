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
--! <Unit> Model.Tree.Constructors
--! <Purpose>
--!   Пакет содержит подпрограммы для создания узлов дерева модели различных
--! видов.
--!
--! <Effects>
--! <Perfomance>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package Model.Tree.Constructors is

   function Create_Application return Node_Id;

   function Create_Colormap_Resource_Value return Node_Id;

   function Create_Component_Class return Node_Id;

   function Create_Enumerated_Resource_Type return Node_Id;

   function Create_Enumeration_Resource_Value return Node_Id;

   function Create_Enumeration_Value_Specification return Node_Id;

   function Create_Integer_Resource_Value return Node_Id;

   function Create_Pixel_Resource_Value return Node_Id;

   function Create_Pixmap_Resource_Value return Node_Id;

   function Create_Predefined_Resource_Type return Node_Id;

   function Create_Project return Node_Id;

   function Create_Resource_Specification return Node_Id;

   function Create_Screen_Resource_Value return Node_Id;

   function Create_Translation_Data_Resource_Value return Node_Id;

   function Create_Widget_Class return Node_Id;

   function Create_Widget_Instance return Node_Id;

   function Create_Widget_Reference_Resource_Type return Node_Id;

   function Create_Widget_Reference_Resource_Value return Node_Id;

   function Create_Widget_Set return Node_Id;

   function Create_Xm_Render_Table_Resource_Type return Node_Id;

   function Create_Xm_Render_Table_Resource_Value return Node_Id;
   
   function Create_Xm_Rendition return Node_Id;

   function Create_Xm_String_Resource_Type return Node_Id;

   function Create_Xm_String_Resource_Value return Node_Id;

end Model.Tree.Constructors;
