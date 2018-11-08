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
--! <Unit> Model.Initialization.Microline
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Model.Microline;
with Model.Names;
with Model.Tree.Constructors;
with Model.Tree.Lists;
with Model.Xt_Motif;

package body Model.Initialization.Microline is

   use Model;
   use Model.Microline;
   use Model.Names;
   use Model.Tree;
   use Model.Tree.Lists;
   use Model.Tree.Constructors;
   use Model.Xt_Motif;

   procedure Create_Predefined_Resource_Types;

   procedure Create_Enumerated_Resource_Types;

   procedure Create_Widget_Set;

   procedure Folder_Widget_Class;

   procedure Progress_Widget_Class;

   procedure Grid_Widget_Class;

   procedure Tree_Widget_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <Purpose> Производит начальную инициализацию внутренних структур.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Initialize;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Enumerated_Resource_Types
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Enumerated_Resource_Types is
   begin
      null;
   end Create_Enumerated_Resource_Types;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Predefined_Resource_Types
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Create_Predefined_Resource_Types is
   begin
      --  CellType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmICON_CELL"));
         Set_Internal_Name (Value, Enter ("ICON_CELL"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmSTRING_CELL"));
         Set_Internal_Name (Value, Enter ("STRING_CELL"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmPIXMAP_CELL"));
         Set_Internal_Name (Value, Enter ("PIXMAP_CELL"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmTOGGLE_CELL"));
         Set_Internal_Name (Value, Enter ("TOGGLE_CELL"));
         Append (Values, Value);

         Microline_Cell_Type_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Microline_Cell_Type_Resource_Type, Enter ("XmRCellType"));
         Set_Internal_Name
          (Microline_Cell_Type_Resource_Type, Enter ("CellType"));
         Set_Value_Specifications
          (Microline_Cell_Type_Resource_Type, Values);
      end;

      --  ColumnType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmHEADING"));
         Set_Internal_Name (Value, Enter ("HEADING"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmCONTENT"));
         Set_Internal_Name (Value, Enter ("CONTENT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmFOOTER"));
         Set_Internal_Name (Value, Enter ("FOOTER"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmALL_TYPES"));
         Set_Internal_Name (Value, Enter ("ALL_TYPES"));
         Append (Values, Value);

         Microline_Column_Type_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Microline_Column_Type_Resource_Type, Enter ("XmRColumnType"));
         Set_Internal_Name
          (Microline_Column_Type_Resource_Type, Enter ("ColumnType"));
         Set_Value_Specifications
          (Microline_Column_Type_Resource_Type, Values);
      end;

      --  RowType

      declare
         Values : constant List_Id := New_List;
         Value  : Node_Id;

      begin
         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmHEADING"));
         Set_Internal_Name (Value, Enter ("HEADING"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmCONTENT"));
         Set_Internal_Name (Value, Enter ("CONTENT"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmFOOTER"));
         Set_Internal_Name (Value, Enter ("FOOTER"));
         Append (Values, Value);

         Value := Create_Enumeration_Value_Specification;
         Set_Name (Value, Enter ("XmALL_TYPES"));
         Set_Internal_Name (Value, Enter ("ALL_TYPES"));
         Append (Values, Value);

         Microline_Row_Type_Resource_Type := Create_Enumerated_Resource_Type;
         Set_Name
          (Microline_Row_Type_Resource_Type, Enter ("XmRRowType"));
         Set_Internal_Name
          (Microline_Row_Type_Resource_Type, Enter ("RowType"));
         Set_Value_Specifications
          (Microline_Row_Type_Resource_Type, Values);
      end;

      --

--      declare
--         Values : constant List_Id := New_List;
--         Value  : Node_Id;
--
--      begin
--         Value := Create_Enumeration_Value_Specification;
--         Set_Name (Value, Enter (""));
--         Set_Internal_Name (Value, Enter (""));
--         Append (Values, Value);
--
--         Value := Create_Enumeration_Value_Specification;
--         Set_Name (Value, Enter (""));
--         Set_Internal_Name (Value, Enter (""));
--         Append (Values, Value);
--
--          := Create_Enumerated_Resource_Type;
--         Set_Name
--          (, Enter (""));
--         Set_Internal_Name
--          (, Enter (""));
--         Set_Value_Specifications
--          (, Values);
--      end;
   end Create_Predefined_Resource_Types;

   --------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget_Set
   --!    <ImplementationNotes>
   --------------------------------------------------------------------------
   procedure Create_Widget_Set is
      Set     : Node_Id;
      Types   : constant List_Id := New_List;
      Classes : constant List_Id := New_List;

   begin
      Append (Classes, Microline_Folder_Widget_Class);
      Append (Classes, Microline_Progress_Widget_Class);
      Append (Classes, Microline_Grid_Widget_Class);
      Append (Classes, Microline_Tree_Widget_Class);
      Append (Classes, Microline_Grid_Cell_Class);

      Append (Types, Microline_Cell_Type_Resource_Type);
      Append (Types, Microline_Column_Type_Resource_Type);
      Append (Types, Microline_Row_Type_Resource_Type);

      Set := Create_Widget_Set;
      Set_Name (Set, Enter ("Microline"));

      Set_Resource_Types (Set, Types);
      Set_Widget_Classes (Set, Classes);

      Append (Known_Widget_Sets, Set);
   end Create_Widget_Set;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Folder_Widget_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Folder_Widget_Class is
      Resources   : constant List_Id := New_List;
--      Constraints : constant List_Id := New_List;
--      Resource    : Node_Id;

   begin
      Microline_Folder_Widget_Class := Create_Widget_Class;
      Set_Name (Microline_Folder_Widget_Class, Enter ("XmLFolder"));
      Set_Super_Class (Microline_Folder_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

    --  All resources.

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNtabWidgetClass"));
----       Set_Internal_Resource_Name (Resource, Enter ("tabWidgetClass"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCTabWidgetClass"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("TabWidgetClass"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Widget_Class_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNactivateCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("activateCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNactiveTab"));
--      Set_Internal_Resource_Name (Resource, Enter ("activeTab"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCActiveTab"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("ActiveTab"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--  --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
--  --  Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNautoSelect"));
--      Set_Internal_Resource_Name (Resource, Enter ("autoSelect"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCAutoSelect"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("AutoSelect"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNblankBackground"));
--      Set_Internal_Resource_Name (Resource, Enter ("blankBackground"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCBlankBackground"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("BlankBackground"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNblankBackgroundPixmap"));
----       Set_Internal_Resource_Name (Resource, Enter ("blankBackgroundPixmap"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCBlankBackgroundPixmap"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("BlankBackgroundPixmap"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Man_Foreground_Pixmap_Resource_Type);
----       Set_Can_Be_Set_At_Creation_Time (Resource, True);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcornerDimension"));
--      Set_Internal_Resource_Name (Resource, Enter ("cornerDimension"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCornerDimension"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CornerDimension"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcornerStyle"));
----       Set_Internal_Resource_Name (Resource, Enter ("cornerStyle"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCornerStyle"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("CornerStyle"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Corner_Style_Resource_Type);
----       Set_Can_Be_Set_At_Creation_Time (Resource, True);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNfontList"));
----       Set_Internal_Resource_Name (Resource, Enter ("fontList"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCFontList"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("FontList"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Font_List_Resource_Type);
----       Set_Can_Be_Set_At_Creation_Time (Resource, True);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNhighlightThickness"));
--      Set_Internal_Resource_Name (Resource, Enter ("highlightThickness"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCHighlightThickness"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("HighlightThickness"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNinactiveBackground"));
--      Set_Internal_Resource_Name (Resource, Enter ("inactiveBackground"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCInactiveBackground"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("InactiveBackground"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNinactiveForeground"));
--      Set_Internal_Resource_Name (Resource, Enter ("inactiveForeground"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCInactiveForeground"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("InactiveForeground"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNmarginHeight"));
--      Set_Internal_Resource_Name (Resource, Enter ("marginHeight"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCMarginHeight"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("MarginHeight"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNmarginWidth"));
--      Set_Internal_Resource_Name (Resource, Enter ("marginWidth"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCMarginWidth"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("MarginWidth"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNpixmapMargin"));
--      Set_Internal_Resource_Name (Resource, Enter ("pixmapMargin"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCPixmapMargin"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("PixmapMargin"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNresizePolicy"));
----       Set_Internal_Resource_Name (Resource, Enter ("resizePolicy"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCFolderResizePolicy"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("FolderResizePolicy"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Folder_Resize_Policy_Resource_Type);
----       Set_Can_Be_Set_At_Creation_Time (Resource, True);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNrotateWhenLeftRight"));
--      Set_Internal_Resource_Name (Resource, Enter ("rotateWhenLeftRight"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCRotateWhenLeftRight"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("RotateWhenLeftRight"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNspacing"));
--      Set_Internal_Resource_Name (Resource, Enter ("spacing"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCSpacing"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("Spacing"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNtabBarHeight"));
--      Set_Internal_Resource_Name (Resource, Enter ("tabBarHeight"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCTabBarHeight"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("TabBarHeight"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--  --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
--  --  Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNtabCount"));
--      Set_Internal_Resource_Name (Resource, Enter ("tabCount"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCTabCount"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("TabCount"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--  --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
--  --  Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNtabPlacement"));
----       Set_Internal_Resource_Name (Resource, Enter ("tabPlacement"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCTabPlacement"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("TabPlacement"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Tab_Placement_Resource_Type);
----       Set_Can_Be_Set_At_Creation_Time (Resource, True);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNtabsPerRow"));
--      Set_Internal_Resource_Name (Resource, Enter ("tabsPerRow"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCTabsPerRow"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("TabsPerRow"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNtabWidgetList"));
----       Set_Internal_Resource_Name (Resource, Enter ("tabWidgetList"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCReadOnly"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("ReadOnly"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Pointer_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNtabTranslations"));
--      Set_Internal_Resource_Name (Resource, Enter ("tabTranslations"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCTranslations"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("Translations"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Translation_Table_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--  --  Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNdebugLevel"));
--      Set_Internal_Resource_Name (Resource, Enter ("debugLevel"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCDebugLevel"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("DebugLevel"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--    --  Constraint resources.
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNtabFreePixmaps"));
--      Set_Internal_Resource_Name (Resource, Enter ("tabFreePixmaps"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCTabFreePixmaps"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("TabFreePixmaps"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Constraints, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNtabInactivePixmap"));
----       Set_Internal_Resource_Name (Resource, Enter ("tabInactivePixmap"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCTabInactivePixmap"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("TabInactivePixmap"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Prim_Foreground_Pixmap_Resource_Type);
----       Set_Can_Be_Set_At_Creation_Time (Resource, True);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Constraints, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNtabManagedName"));
----       Set_Internal_Resource_Name (Resource, Enter ("tabManagedName"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCTabManagedName"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("TabManagedName"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_String_Resource_Type);
----       Set_Can_Be_Set_At_Creation_Time (Resource, True);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Constraints, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNtabManagedWidget"));
--      Set_Internal_Resource_Name (Resource, Enter ("tabManagedWidget"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCTabManagedWidget"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("TabManagedWidget"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Widget_Reference_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Constraints, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNtabPixmap"));
----       Set_Internal_Resource_Name (Resource, Enter ("tabPixmap"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCTabPixmap"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("TabPixmap"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Prim_Foreground_Pixmap_Resource_Type);
----       Set_Can_Be_Set_At_Creation_Time (Resource, True);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Constraints, Resource);

      Set_Resources (Microline_Folder_Widget_Class, Resources);
      Merge_Inherited_Resources (Microline_Folder_Widget_Class);
   end Folder_Widget_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Grid_Widget_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Grid_Widget_Class is
      Resources : List_Id := New_List;
      Resource  : Node_Id;

   begin
      Microline_Grid_Widget_Class := Create_Widget_Class;
      Set_Name (Microline_Grid_Widget_Class, Enter ("XmLGrid"));
      Set_Super_Class (Microline_Grid_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

      --  All resources.

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNactivateCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("activateCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
----
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNaddCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("addCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNallowColumnHide"));
      Set_Internal_Resource_Name (Resource, Enter ("allowColumnHide"));
      Set_Resource_Class_Name (Resource, Enter ("XmCAllowColumnHide"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("AllowColumnHide"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNallowColumnResize"));
      Set_Internal_Resource_Name (Resource, Enter ("allowColumnResize"));
      Set_Resource_Class_Name (Resource, Enter ("XmCAllowColumnResize"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("AllowColumnResize"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNallowDragSelected"));
      Set_Internal_Resource_Name (Resource, Enter ("allowDragSelected"));
      Set_Resource_Class_Name (Resource, Enter ("XmCAllowDragSelected"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("AllowDragSelected"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNallowDrop"));
      Set_Internal_Resource_Name (Resource, Enter ("allowDrop"));
      Set_Resource_Class_Name (Resource, Enter ("XmCAllowDrop"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("AllowDrop"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNallowRowHide"));
      Set_Internal_Resource_Name (Resource, Enter ("allowRowHide"));
      Set_Resource_Class_Name (Resource, Enter ("XmCAllowRowHide"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("AllowRowHide"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNallowRowResize"));
      Set_Internal_Resource_Name (Resource, Enter ("allowRowResize"));
      Set_Resource_Class_Name (Resource, Enter ("XmCAllowRowResize"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("AllowRowResize"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNautoSelect"));
      Set_Internal_Resource_Name (Resource, Enter ("autoSelect"));
      Set_Resource_Class_Name (Resource, Enter ("XmCAutoSelect"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("AutoSelect"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNblankBackground"));
      Set_Internal_Resource_Name (Resource, Enter ("blankBackground"));
      Set_Resource_Class_Name (Resource, Enter ("XmCBlankBackground"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("BlankBackground"));
      Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNbottomFixedCount"));
      Set_Internal_Resource_Name (Resource, Enter ("bottomFixedCount"));
      Set_Resource_Class_Name (Resource, Enter ("XmCBottomFixedCount"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("BottomFixedCount"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNbottomFixedMargin"));
      Set_Internal_Resource_Name (Resource, Enter ("bottomFixedMargin"));
      Set_Resource_Class_Name (Resource, Enter ("XmCBottomFixedMargin"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("BottomFixedMargin"));
      Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellDrawCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellDrawCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
----
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellDropCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellDropCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
----
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellFocusCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellFocusCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
----
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellPasteCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellPasteCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNcolumns"));
      Set_Internal_Resource_Name (Resource, Enter ("columns"));
      Set_Resource_Class_Name (Resource, Enter ("XmCColumns"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("Columns"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNdeleteCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("deleteCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
----
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNdeselectCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("deselectCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNdebugLevel"));
      Set_Internal_Resource_Name (Resource, Enter ("debugLevel"));
      Set_Resource_Class_Name (Resource, Enter ("XmCDebugLevel"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("DebugLevel"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNeditCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("editCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNeditTranslations"));
      Set_Internal_Resource_Name (Resource, Enter ("editTranslations"));
      Set_Resource_Class_Name (Resource, Enter ("XmCTranslations"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("Translations"));
      Set_Resource_Type (Resource, Xt_Motif_Translation_Table_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNpri.vate"));
----       Set_Internal_Resource_Name (Resource, Enter ("pri.vate"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCPri.vate"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Pri.vate"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Unsigned_Char_Resource_Type);
----       Set_Can_Be_Set_At_Creation_Time (Resource, True);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

--       Resource := Create_Resource_Specification;
--       Set_Resource_Name (Resource, Enter ("XmNfontList"));
--       Set_Internal_Resource_Name (Resource, Enter ("fontList"));
--       Set_Resource_Class_Name (Resource, Enter ("XmCFontList"));
--       Set_Internal_Resource_Class_Name (Resource, Enter ("FontList"));
--       Set_Resource_Type (Resource, Xt_Motif_Font_List_Resource_Type);
--       Set_Can_Be_Set_At_Creation_Time (Resource, True);
--       Set_Can_Be_Set_By_Set_Values (Resource, True);
--       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--       Append (Resources, Resource);

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellRenderTable"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellRenderTable"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCellRenderTable"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("CellRenderTable"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Render_Table_Resource_Type);
----       Set_Can_Be_Set_At_Creation_Time (Resource, True);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNfooterColumns"));
      Set_Internal_Resource_Name (Resource, Enter ("footerColumns"));
      Set_Resource_Class_Name (Resource, Enter ("XmCFooterColumns"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("FooterColumns"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNfooterRows"));
      Set_Internal_Resource_Name (Resource, Enter ("footerRows"));
      Set_Resource_Class_Name (Resource, Enter ("XmCFooterRows"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("FooterRows"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNglobalPixmapHeight"));
      Set_Internal_Resource_Name (Resource, Enter ("globalPixmapHeight"));
      Set_Resource_Class_Name (Resource, Enter ("XmCGlobalPixmapHeight"));
      Set_Internal_Resource_Class_Name
       (Resource, Enter ("GlobalPixmapHeight"));
      Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNglobalPixmapWidth"));
      Set_Internal_Resource_Name (Resource, Enter ("globalPixmapWidth"));
      Set_Resource_Class_Name (Resource, Enter ("XmCGlobalPixmapWidth"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("GlobalPixmapWidth"));
      Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNheadingColumns"));
      Set_Internal_Resource_Name (Resource, Enter ("headingColumns"));
      Set_Resource_Class_Name (Resource, Enter ("XmCHeadingColumns"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("HeadingColumns"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNheadingRows"));
      Set_Internal_Resource_Name (Resource, Enter ("headingRows"));
      Set_Resource_Class_Name (Resource, Enter ("XmCHeadingRows"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("HeadingRows"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNhiddenColumns"));
      Set_Internal_Resource_Name (Resource, Enter ("hiddenColumns"));
      Set_Resource_Class_Name (Resource, Enter ("XmCHiddenColumns"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("HiddenColumns"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNhiddenRows"));
      Set_Internal_Resource_Name (Resource, Enter ("hiddenRows"));
      Set_Resource_Class_Name (Resource, Enter ("XmCHiddenRows"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("HiddenRows"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNhighlightRowMode"));
      Set_Internal_Resource_Name (Resource, Enter ("highlightRowMode"));
      Set_Resource_Class_Name (Resource, Enter ("XmCHighlightRowMode"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("HighlightRowMode"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNhighlightThickness"));
      Set_Internal_Resource_Name (Resource, Enter ("highlightThickness"));
      Set_Resource_Class_Name (Resource, Enter ("XmCHighlightThickness"));
      Set_Internal_Resource_Class_Name
       (Resource, Enter ("HighlightThickness"));
      Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNhorizontalScrollBar"));
      Set_Internal_Resource_Name (Resource, Enter ("horizontalScrollBar"));
      Set_Resource_Class_Name (Resource, Enter ("XmCHorizontalScrollBar"));
      Set_Internal_Resource_Class_Name
       (Resource, Enter ("HorizontalScrollBar"));
      Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

--       Resource := Create_Resource_Specification;
--       Set_Resource_Name (Resource, Enter ("XmNhorizontalSizePolicy"));
--       Set_Internal_Resource_Name (Resource, Enter ("horizontalSizePolicy"));
--       Set_Resource_Class_Name (Resource,
--                                Enter ("XmCHorizontalSizePolicy"));
--       Set_Internal_Resource_Class_Name (Resource,
--                                         Enter ("HorizontalSizePolicy"));
--       Set_Resource_Type (Resource,
--                          Xt_Motif_Grid_Size_Policy_Resource_Type);
--       Set_Can_Be_Set_At_Creation_Time (Resource, True);
--       Set_Can_Be_Set_By_Set_Values (Resource, True);
--       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNhsbDisplayPolicy"));
      Set_Internal_Resource_Name (Resource, Enter ("hsbDisplayPolicy"));
      Set_Resource_Class_Name (Resource, Enter ("XmCHsbDisplayPolicy"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("HsbDisplayPolicy"));
      Set_Resource_Type
       (Resource, Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNimmediateDraw"));
      Set_Internal_Resource_Name (Resource, Enter ("immediateDraw"));
      Set_Resource_Class_Name (Resource, Enter ("XmCImmediateDraw"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("ImmediateDraw"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNlayoutFrozen"));
      Set_Internal_Resource_Name (Resource, Enter ("layoutFrozen"));
      Set_Resource_Class_Name (Resource, Enter ("XmCLayoutFrozen"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("LayoutFrozen"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNleftFixedCount"));
      Set_Internal_Resource_Name (Resource, Enter ("leftFixedCount"));
      Set_Resource_Class_Name (Resource, Enter ("XmCLeftFixedCount"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("LeftFixedCount"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNleftFixedMargin"));
      Set_Internal_Resource_Name (Resource, Enter ("leftFixedMargin"));
      Set_Resource_Class_Name (Resource, Enter ("XmCLeftFixedMargin"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("LeftFixedMargin"));
      Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNminColumnWidth"));
--      Set_Internal_Resource_Name (Resource, Enter ("minColumnWidth"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCMinColumnWidth"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("MinColumnWidth"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);

       Resource := Create_Resource_Specification;
       Set_Resource_Name (Resource, Enter ("XmNrenderTable"));
       Set_Internal_Resource_Name (Resource, Enter ("renderTable"));
       Set_Resource_Class_Name (Resource, Enter ("XmCRenderTable"));
       Set_Internal_Resource_Class_Name (Resource, Enter ("RenderTable"));
       Set_Resource_Type (Resource, Xt_Motif_Render_Table_Resource_Type);
       Set_Can_Be_Set_At_Creation_Time (Resource, True);
       Set_Can_Be_Set_By_Set_Values (Resource, True);
       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNrightFixedCount"));
      Set_Internal_Resource_Name (Resource, Enter ("rightFixedCount"));
      Set_Resource_Class_Name (Resource, Enter ("XmCRightFixedCount"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("RightFixedCount"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNrightFixedMargin"));
      Set_Internal_Resource_Name (Resource, Enter ("rightFixedMargin"));
      Set_Resource_Class_Name (Resource, Enter ("XmCRightFixedMargin"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("RightFixedMargin"));
      Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNresizeCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("resizeCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNrows"));
      Set_Internal_Resource_Name (Resource, Enter ("rows"));
      Set_Resource_Class_Name (Resource, Enter ("XmCRows"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("Rows"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNscrollBarMargin"));
      Set_Internal_Resource_Name (Resource, Enter ("scrollBarMargin"));
      Set_Resource_Class_Name (Resource, Enter ("XmCScrollBarMargin"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("ScrollBarMargin"));
      Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNscrollCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("scrollCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNscrollColumn"));
      Set_Internal_Resource_Name (Resource, Enter ("scrollColumn"));
      Set_Resource_Class_Name (Resource, Enter ("XmCScrollColumn"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("ScrollColumn"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNscrollRow"));
      Set_Internal_Resource_Name (Resource, Enter ("scrollRow"));
      Set_Resource_Class_Name (Resource, Enter ("XmCScrollRow"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("ScrollRow"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNselectCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("selectCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNselectBackground"));
      Set_Internal_Resource_Name (Resource, Enter ("selectBackground"));
      Set_Resource_Class_Name (Resource, Enter ("XmCSelectBackground"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("SelectBackground"));
      Set_Resource_Type (Resource, Xt_Motif_Pixel_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNselectForeground"));
      Set_Internal_Resource_Name (Resource, Enter ("selectForeground"));
      Set_Resource_Class_Name (Resource,
                               Enter ("XmCSelectForeground"));
      Set_Internal_Resource_Class_Name (Resource,
                                        Enter ("SelectForeground"));
      Set_Resource_Type (Resource,
                         Xt_Motif_Pixel_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

--       Resource := Create_Resource_Specification;
--       Set_Resource_Name (Resource, Enter ("XmNselectionPolicy"));
--       Set_Internal_Resource_Name (Resource, Enter ("selectionPolicy"));
--       Set_Resource_Class_Name (Resource,
--                                Enter ("XmCGridSelectionPolicy"));
--       Set_Internal_Resource_Class_Name (Resource,
--                                         Enter ("GridSelectionPolicy"));
--       Set_Resource_Type (Resource,
--                          Xt_Motif_Grid_Selection_Policy_Resource_Type);
--       Set_Can_Be_Set_At_Creation_Time (Resource, True);
--       Set_Can_Be_Set_By_Set_Values (Resource, True);
--       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNshadowRegions"));
      Set_Internal_Resource_Name (Resource, Enter ("shadowRegions"));
      Set_Resource_Class_Name (Resource, Enter ("XmCShadowRegions"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("ShadowRegions"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNshadowType"));
      Set_Internal_Resource_Name (Resource, Enter ("shadowType"));
      Set_Resource_Class_Name (Resource, Enter ("XmCShadowType"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("ShadowType"));
      Set_Resource_Type (Resource, Xt_Motif_Shadow_Type_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

--       Resource := Create_Resource_Specification;
--       Set_Resource_Name (Resource, Enter ("XmNsimpleHeadings"));
--       Set_Internal_Resource_Name (Resource, Enter ("simpleHeadings"));
--       Set_Resource_Class_Name (Resource,
--                                Enter ("XmCSimpleHeadings"));
--       Set_Internal_Resource_Class_Name (Resource,
--                                         Enter ("SimpleHeadings"));
--       Set_Resource_Type (Resource,
--                          Xt_Motif_String_Resource_Type);
--       Set_Can_Be_Set_At_Creation_Time (Resource, True);
--       Set_Can_Be_Set_By_Set_Values (Resource, True);
--       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--       Append (Resources, Resource);

--       Resource := Create_Resource_Specification;
--       Set_Resource_Name (Resource, Enter ("XmNsimpleWidths"));
--       Set_Internal_Resource_Name (Resource, Enter ("simpleWidths"));
--       Set_Resource_Class_Name (Resource,
--                                Enter ("XmCSimpleWidths"));
--       Set_Internal_Resource_Class_Name (Resource,
--                                         Enter ("SimpleWidths"));
--       Set_Resource_Type (Resource,
--                          Xt_Motif_String_Resource_Type);
--       Set_Can_Be_Set_At_Creation_Time (Resource, True);
--       Set_Can_Be_Set_By_Set_Values (Resource, True);
--       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--       Append (Resources, Resource);

--       Resource := Create_Resource_Specification;
--       Set_Resource_Name (Resource, Enter ("XmNtextWidget"));
--       Set_Internal_Resource_Name (Resource, Enter ("textWidget"));
--       Set_Resource_Class_Name (Resource,
--                                Enter ("XmCTextWidget"));
--       Set_Internal_Resource_Class_Name (Resource,
--                                         Enter ("TextWidget"));
--       Set_Resource_Type (Resource,
--                          Xt_Motif_Widget_Resource_Type);
--       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--       Append (Resources, Resource);

--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNtoggleBottomColor"));
--      Set_Internal_Resource_Name (Resource, Enter ("toggleBottomColor"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCToggleBottomColor"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("ToggleBottomColor"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNtoggleTopColor"));
--      Set_Internal_Resource_Name (Resource, Enter ("toggleTopColor"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCToggleTopColor"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("ToggleTopColor"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNtoggleSize"));
--      Set_Internal_Resource_Name (Resource, Enter ("toggleSize"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCToggleSize"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("ToggleSize"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNtopFixedCount"));
      Set_Internal_Resource_Name (Resource, Enter ("topFixedCount"));
      Set_Resource_Class_Name (Resource, Enter ("XmCTopFixedCount"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("TopFixedCount"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNtopFixedMargin"));
      Set_Internal_Resource_Name (Resource, Enter ("topFixedMargin"));
      Set_Resource_Class_Name (Resource, Enter ("XmCTopFixedMargin"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("TopFixedMargin"));
      Set_Resource_Type (Resource, Xt_Motif_Dimension_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNtraverseTranslations"));
      Set_Internal_Resource_Name (Resource, Enter ("traverseTranslations"));
      Set_Resource_Class_Name (Resource, Enter ("XmCTranslations"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("Translations"));
      Set_Resource_Type (Resource, Xt_Motif_Translation_Table_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNuseAverageFontWidth"));
      Set_Internal_Resource_Name (Resource, Enter ("useAverageFontWidth"));
      Set_Resource_Class_Name (Resource, Enter ("XmCUseAverageFontWidth"));
      Set_Internal_Resource_Class_Name
       (Resource, Enter ("UseAverageFontWidth"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNverticalScrollBar"));
      Set_Internal_Resource_Name (Resource, Enter ("verticalScrollBar"));
      Set_Resource_Class_Name (Resource, Enter ("XmCVerticalScrollBar"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("VerticalScrollBar"));
      Set_Resource_Type (Resource, Xt_Motif_Widget_Reference_Resource_Type);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

--       Resource := Create_Resource_Specification;
--       Set_Resource_Name (Resource, Enter ("XmNverticalSizePolicy"));
--       Set_Internal_Resource_Name (Resource, Enter ("verticalSizePolicy"));
--       Set_Resource_Class_Name (Resource,
--                                Enter ("XmCVerticalSizePolicy"));
--       Set_Internal_Resource_Class_Name (Resource,
--                                         Enter ("VerticalSizePolicy"));
--       Set_Resource_Type (Resource,
--                          Xt_Motif_Grid_Size_Policy_Resource_Type);
--       Set_Can_Be_Set_At_Creation_Time (Resource, True);
--       Set_Can_Be_Set_By_Set_Values (Resource, True);
--       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNvisibleColumns"));
      Set_Internal_Resource_Name (Resource, Enter ("visibleColumns"));
      Set_Resource_Class_Name (Resource, Enter ("XmCVisibleColumns"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("VisibleColumns"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNvisibleRows"));
      Set_Internal_Resource_Name (Resource, Enter ("visibleRows"));
      Set_Resource_Class_Name (Resource, Enter ("XmCVisibleRows"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("VisibleRows"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNvsbDisplayPolicy"));
      Set_Internal_Resource_Name (Resource, Enter ("vsbDisplayPolicy"));
      Set_Resource_Class_Name (Resource, Enter ("XmCVsbDisplayPolicy"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("VsbDisplayPolicy"));
      Set_Resource_Type
       (Resource, Xt_Motif_Scroll_Bar_Display_Policy_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNpopupCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("popupCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNenterCellCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("enterCellCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
----
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNleaveCellCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("leaveCellCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
----
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNenterGridCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("enterGridCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
----
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNleaveGridCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("leaveGridCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcolumnResizable"));
--      Set_Internal_Resource_Name (Resource, Enter ("columnResizable"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCColumnResizable"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("ColumnResizable"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcolumnHidden"));
--      Set_Internal_Resource_Name (Resource, Enter ("columnHidden"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCColumnHidden"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("ColumnHidden"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellToggleSet"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellToggleSet"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellToggleSet"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellToggleSet"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--  --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNshadowThickness"));
--      Set_Internal_Resource_Name (Resource, Enter ("shadowThickness"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCShadowThickness"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("ShadowThickness"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Horizontal_Dimension_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNhideUnhideButtons"));
--      Set_Internal_Resource_Name (Resource, Enter ("hideUnhideButtons"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCHideUnhideButtons"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("HideUnhideButtons"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNsingleClickActivation"));
--      Set_Internal_Resource_Name (Resource, Enter ("singleClickActivation"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCSingleClickActivation"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("SingleClickActivation"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNuseTextWidget"));
--      Set_Internal_Resource_Name (Resource, Enter ("useTextWidget"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCUseTextWidget"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("UseTextWidget"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNiconSpacing"));
--      Set_Internal_Resource_Name (Resource, Enter ("iconSpacing"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCIconSpacing"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("IconSpacing"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Horizontal_Dimension_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);

      Set_Resources (Microline_Grid_Widget_Class, Resources);
      Merge_Inherited_Resources (Microline_Grid_Widget_Class);

      --  Grid Cell Pseudo Class

      Microline_Grid_Cell_Class := Create_Widget_Class;
      Set_Name (Microline_Grid_Cell_Class, Enter ("XmLGridCell"));
      Set_Is_Pseudo_Class (Microline_Grid_Cell_Class, True);

      Resources := New_List;

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellAlignment"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellAlignment"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCellAlignment"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("CellAlignment"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Cell_Alignment_Resource_Type);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellBackground"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellBackground"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellBackground"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellBackground"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellBottomBorderColor"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellBottomBorderColor"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellBottomBorderColor"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellBottomBorderColor"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellBottomBorderType"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellBottomBorderType"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCellBottomBorderType"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("CellBottomBorderType"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Cell_Border_Type_Resource_Type);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellColumnSpan"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellColumnSpan"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellColumnSpan"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellColumnSpan"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellDefaults"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellDefaults"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellDefaults"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellDefaults"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellEditable"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellEditable"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellEditable"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellEditable"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellFontList"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellFontList"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCellFontList"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("CellFontList"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Font_List_Resource_Type);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellForeground"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellForeground"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellForeground"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellForeground"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellLeftBorderColor"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellLeftBorderColor"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellLeftBorderColor"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellLeftBorderColor"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellLeftBorderType"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellLeftBorderType"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCellLeftBorderType"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("CellLeftBorderType"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Cell_Border_Type_Resource_Type);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellMarginBottom"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellMarginBottom"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellMarginBottom"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellMarginBottom"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellMarginLeft"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellMarginLeft"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellMarginLeft"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellMarginLeft"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellMarginRight"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellMarginRight"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellMarginRight"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellMarginRight"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellMarginTop"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellMarginTop"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellMarginTop"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellMarginTop"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellPixmap"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellPixmap"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCellPixmap"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("CellPixmap"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Man_Foreground_Pixmap_Resource_Type);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellPixmapMask"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellPixmapMask"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCellPixmapMask"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("CellPixmapMask"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Bitmap_Resource_Type);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellRenderTable"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellRenderTable"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCellRenderTable"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("CellRenderTable"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Xm_Render_Table_Resource_Type);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellRightBorderColor"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellRightBorderColor"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellRightBorderColor"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellRightBorderColor"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellRightBorderType"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellRightBorderType"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCellRightBorderType"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("CellRightBorderType"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Cell_Border_Type_Resource_Type);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellRowSpan"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellRowSpan"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellRowSpan"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellRowSpan"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNcellString"));
      Set_Internal_Resource_Name (Resource, Enter ("cellString"));
      Set_Resource_Class_Name (Resource, Enter ("XmCXmString"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("XmString"));
      Set_Resource_Type (Resource, Xt_Motif_Xm_String_Resource_Type);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcellTopBorderColor"));
--      Set_Internal_Resource_Name (Resource, Enter ("cellTopBorderColor"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCCellTopBorderColor"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("CellTopBorderColor"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellTopBorderType"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellTopBorderType"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCellTopBorderType"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("CellTopBorderType"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Cell_Border_Type_Resource_Type);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

       Resource := Create_Resource_Specification;
       Set_Resource_Name (Resource, Enter ("XmNcellType"));
       Set_Internal_Resource_Name (Resource, Enter ("cellType"));
       Set_Resource_Class_Name (Resource, Enter ("XmCCellType"));
       Set_Internal_Resource_Class_Name (Resource, Enter ("CellType"));
       Set_Resource_Type (Resource, Microline_Cell_Type_Resource_Type);
       Set_Can_Be_Set_By_Set_Values (Resource, True);
       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
       Append (Resources, Resource);

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcellUserData"));
----       Set_Internal_Resource_Name (Resource, Enter ("cellUserData"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCUserData"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("UserData"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Pointer_Resource_Type);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNcolumn"));
      Set_Internal_Resource_Name (Resource, Enter ("column"));
      Set_Resource_Class_Name (Resource, Enter ("XmCColumn"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("Column"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Append (Resources, Resource);

      --  XXX  XmNcolumnPtr ???

--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcolumnRangeEnd"));
--      Set_Internal_Resource_Name (Resource, Enter ("columnRangeEnd"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCColumnRangeEnd"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("ColumnRangeEnd"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcolumnRangeStart"));
--      Set_Internal_Resource_Name (Resource, Enter ("columnRangeStart"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCColumnRangeStart"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("ColumnRangeStart"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcolumnSizePolicy"));
----       Set_Internal_Resource_Name (Resource, Enter ("columnSizePolicy"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCColumnSizePolicy"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("ColumnSizePolicy"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Grid_Size_Policy_Resource_Type);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcolumnStep"));
--      Set_Internal_Resource_Name (Resource, Enter ("columnStep"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCColumnStep"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("ColumnStep"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Append (Resources, Resource);

       Resource := Create_Resource_Specification;
       Set_Resource_Name (Resource, Enter ("XmNcolumnType"));
       Set_Internal_Resource_Name (Resource, Enter ("columnType"));
       Set_Resource_Class_Name (Resource, Enter ("XmCColumnType"));
       Set_Internal_Resource_Class_Name (Resource, Enter ("ColumnType"));
       Set_Resource_Type (Resource, Microline_Column_Type_Resource_Type);
       Set_Can_Be_Set_By_Set_Values (Resource, True);
       Append (Resources, Resource);

--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNcolumnWidth"));
--      Set_Internal_Resource_Name (Resource, Enter ("columnWidth"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCColumnWidth"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("ColumnWidth"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcolumnUserData"));
----       Set_Internal_Resource_Name (Resource, Enter ("columnUserData"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCUserData"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("UserData"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Pointer_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNrow"));
      Set_Internal_Resource_Name (Resource, Enter ("row"));
      Set_Resource_Class_Name (Resource, Enter ("XmCRow"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("Row"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Append (Resources, Resource);

--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNrowHeight"));
--      Set_Internal_Resource_Name (Resource, Enter ("rowHeight"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCRowHeight"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("RowHeight"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);

      --  XXX  XmNrowPtr ???

--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNrowRangeEnd"));
--      Set_Internal_Resource_Name (Resource, Enter ("rowRangeEnd"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCRowRangeEnd"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("RowRangeEnd"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNrowRangeStart"));
--      Set_Internal_Resource_Name (Resource, Enter ("rowRangeStart"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCRowRangeStart"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("RowRangeStart"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNrowSizePolicy"));
----       Set_Internal_Resource_Name (Resource, Enter ("rowSizePolicy"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCRowSizePolicy"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("RowSizePolicy"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Grid_Size_Policy_Resource_Type);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNrowStep"));
--      Set_Internal_Resource_Name (Resource, Enter ("rowStep"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCRowStep"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("RowStep"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Append (Resources, Resource);

       Resource := Create_Resource_Specification;
       Set_Resource_Name (Resource, Enter ("XmNrowType"));
       Set_Internal_Resource_Name (Resource, Enter ("rowType"));
       Set_Resource_Class_Name (Resource, Enter ("XmCRowType"));
       Set_Internal_Resource_Class_Name (Resource, Enter ("RowType"));
       Set_Resource_Type (Resource, Microline_Row_Type_Resource_Type);
       Set_Can_Be_Set_By_Set_Values (Resource, True);
       Append (Resources, Resource);

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNrowUserData"));
----       Set_Internal_Resource_Name (Resource, Enter ("rowUserData"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCUserData"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("UserData"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Pointer_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----       Set_Can_Be_Set_By_Set_Values (Resource, True);
----       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);

      Set_Resources (Microline_Grid_Cell_Class, Resources);
   end Grid_Widget_Class;

   --------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Initialize
   --!    <ImplementationNotes>
   --------------------------------------------------------------------------
   procedure Initialize is
   begin
      Create_Enumerated_Resource_Types;
      Create_Predefined_Resource_Types;
      Folder_Widget_Class;
      Progress_Widget_Class;
      Grid_Widget_Class;
      Tree_Widget_Class;
      Create_Widget_Set;
   end Initialize;

   --------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Progress_Widget_Class
   --!    <ImplementationNotes>
   --------------------------------------------------------------------------
   procedure Progress_Widget_Class is
      Resources : constant List_Id := New_List;
      Resource  : Node_Id;

   begin
      Microline_Progress_Widget_Class := Create_Widget_Class;
      Set_Name (Microline_Progress_Widget_Class, Enter ("XmLProgress"));
      Set_Super_Class (Microline_Progress_Widget_Class,
                       Xt_Motif_Primitive_Widget_Class);

      --  All resources.

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNcompleteValue"));
      Set_Internal_Resource_Name (Resource, Enter ("completeValue"));
      Set_Resource_Class_Name (Resource, Enter ("XmCCompleteValue"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("CompleteValue"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

--       Resource := Create_Resource_Specification;
--       Set_Resource_Name (Resource, Enter ("XmNfontList"));
--       Set_Internal_Resource_Name (Resource, Enter ("fontList"));
--       Set_Resource_Class_Name (Resource,
--                                Enter ("XmCFontList"));
--       Set_Internal_Resource_Class_Name (Resource,
--                                         Enter ("FontList"));
--       Set_Resource_Type (Resource,
--                          Xt_Motif_Font_List_Resource_Type);
--       Set_Can_Be_Set_At_Creation_Time (Resource, True);
--       Set_Can_Be_Set_By_Set_Values (Resource, True);
--       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--       Append (Resources, Resource);

--       Resource := Create_Resource_Specification;
--       Set_Resource_Name (Resource, Enter ("XmNmeterStyle"));
--       Set_Internal_Resource_Name (Resource, Enter ("meterStyle"));
--       Set_Resource_Class_Name (Resource,
--                                Enter ("XmCMeterStyle"));
--       Set_Internal_Resource_Class_Name (Resource,
--                                         Enter ("MeterStyle"));
--       Set_Resource_Type (Resource,
--                          Xt_Motif_Meter_Style_Resource_Type);
--       Set_Can_Be_Set_At_Creation_Time (Resource, True);
--       Set_Can_Be_Set_By_Set_Values (Resource, True);
--       Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--       Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNnumBoxes"));
      Set_Internal_Resource_Name (Resource, Enter ("numBoxes"));
      Set_Resource_Class_Name (Resource, Enter ("XmCNumBoxes"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("NumBoxes"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNrenderTable"));
      Set_Internal_Resource_Name (Resource, Enter ("renderTable"));
      Set_Resource_Class_Name (Resource, Enter ("XmCRenderTable"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("RenderTable"));
      Set_Resource_Type (Resource, Xt_Motif_Render_Table_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNshowPercentage"));
      Set_Internal_Resource_Name (Resource, Enter ("showPercentage"));
      Set_Resource_Class_Name (Resource, Enter ("XmCShowPercentage"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("ShowPercentage"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNshowTime"));
      Set_Internal_Resource_Name (Resource, Enter ("showTime"));
      Set_Resource_Class_Name (Resource, Enter ("XmCShowTime"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("ShowTime"));
      Set_Resource_Type (Resource, Xt_Motif_Boolean_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Resource := Create_Resource_Specification;
      Set_Resource_Name (Resource, Enter ("XmNvalue"));
      Set_Internal_Resource_Name (Resource, Enter ("value"));
      Set_Resource_Class_Name (Resource, Enter ("XmCValue"));
      Set_Internal_Resource_Class_Name (Resource, Enter ("Value"));
      Set_Resource_Type (Resource, Xt_Motif_C_Int_Resource_Type);
      Set_Can_Be_Set_At_Creation_Time (Resource, True);
      Set_Can_Be_Set_By_Set_Values (Resource, True);
      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
      Append (Resources, Resource);

      Set_Resources (Microline_Progress_Widget_Class, Resources);
      Merge_Inherited_Resources (Microline_Progress_Widget_Class);
   end Progress_Widget_Class;

   --------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Tree_Widget_Class
   --!    <ImplementationNotes>
   --------------------------------------------------------------------------
   procedure Tree_Widget_Class is
      Resources   : constant List_Id := New_List;
--      Resource    : Node_Id;

   begin
      Microline_Tree_Widget_Class := Create_Widget_Class;
      Set_Name (Microline_Tree_Widget_Class, Enter ("XmLTree"));
      Set_Super_Class (Microline_Tree_Widget_Class,
                       Xt_Motif_Manager_Widget_Class);

      --  All resources.

----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNcollapseCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("collapseCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNconnectingLineColor"));
--      Set_Internal_Resource_Name (Resource, Enter ("connectingLineColor"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCConnectingLineColor"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("ConnectingLineColor"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
----       Resource := Create_Resource_Specification;
----       Set_Resource_Name (Resource, Enter ("XmNexpandCallback"));
----       Set_Internal_Resource_Name (Resource, Enter ("expandCallback"));
----       Set_Resource_Class_Name (Resource,
----                                Enter ("XmCCallback"));
----       Set_Internal_Resource_Class_Name (Resource,
----                                         Enter ("Callback"));
----       Set_Resource_Type (Resource,
----                          Xt_Motif_Callback_Resource_Type);
----   --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
----   --  Set_Can_Be_Set_By_Set_Values (Resource, True);
----   --  Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
----       Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNlevelSpacing"));
--      Set_Internal_Resource_Name (Resource, Enter ("levelSpacing"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCLevelSpacing"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("LevelSpacing"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Dimension_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNplusMinusColor"));
--      Set_Internal_Resource_Name (Resource, Enter ("plusMinusColor"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCPlusMinusColor"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("PlusMinusColor"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Pixel_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNrowExpands"));
--      Set_Internal_Resource_Name (Resource, Enter ("rowExpands"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCRowExpands"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("RowExpands"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--  --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNrowIsExpanded"));
--      Set_Internal_Resource_Name (Resource, Enter ("rowIsExpanded"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCRowIsExpanded"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("RowIsExpanded"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--  --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNrowLevel"));
--      Set_Internal_Resource_Name (Resource, Enter ("rowLevel"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCRowLevel"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("RowLevel"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_C_Int_Resource_Type);
--  --  Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);
--
--      Resource := Create_Resource_Specification;
--      Set_Resource_Name (Resource, Enter ("XmNignorePixmaps"));
--      Set_Internal_Resource_Name (Resource, Enter ("ignorePixmaps"));
--      Set_Resource_Class_Name (Resource,
--                               Enter ("XmCIgnorePixmaps"));
--      Set_Internal_Resource_Class_Name (Resource,
--                                        Enter ("IgnorePixmaps"));
--      Set_Resource_Type (Resource,
--                         Xt_Motif_Boolean_Resource_Type);
--      Set_Can_Be_Set_At_Creation_Time (Resource, True);
--      Set_Can_Be_Set_By_Set_Values (Resource, True);
--      Set_Can_Be_Retrieved_By_Get_Values (Resource, True);
--      Append (Resources, Resource);

      Set_Resources (Microline_Tree_Widget_Class, Resources);
      Merge_Inherited_Resources (Microline_Tree_Widget_Class);
   end Tree_Widget_Class;

begin
   Microline_Initialize_Hook := Initialize'Access;
end Model.Initialization.Microline;
