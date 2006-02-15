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
--! <Unit> Model.Tree.Constructors
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package body Model.Tree.Constructors is

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Application
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Application return Node_Id is
   begin
      Node_Table.Append ((Kind                    => Node_Application,
                          Parent                  => Null_Node,
                          List                    => Null_List,
                          Previous                => Null_Node,
                          Next                    => Null_Node,
                          Application_Class_Name  => Null_Name,
                          Component_Classes       => Null_List));

      return Node_Table.Last;
   end Create_Application;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Colormap_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Colormap_Resource_Value return Node_Id is
   begin
      Node_Table.Append
       ((Kind                        => Node_Colormap_Resource_Value,
         Parent                      => Null_Node,
         List                        => Null_List,
         Previous                    => Null_Node,
         Next                        => Null_Node,
         CRV_Resource_Specification  => Null_Node,
         CRV_Is_Resource_Class_Value => False,
         CRV_Is_Hardcoded            => False,
         CRV_Is_Fallback             => False));

      return Node_Table.Last;
   end Create_Colormap_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Component_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Component_Class return Node_Id is
   begin
      Node_Table.Append ((Kind     => Node_Component_Class,
                          Parent   => Null_Node,
                          List     => Null_List,
                          Previous => Null_Node,
                          Next     => Null_Node,
                          CC_Name  => Null_Name,
                          Root     => Null_Node));

      return Node_Table.Last;
   end Create_Component_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Enumerated_Resource_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Enumerated_Resource_Type return Node_Id is
   begin
      Node_Table.Append
       ((Kind                 => Node_Enumerated_Resource_Type,
         Parent               => Null_Node,
         List                 => Null_List,
         Previous             => Null_Node,
         Next                 => Null_Node,
         ERT_Name             => Null_Name,
         ERT_Internal_Name    => Null_Name,
         Value_Specifications => Null_List));

      return Node_Table.Last;
   end Create_Enumerated_Resource_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Enumeration_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Enumeration_Resource_Value return Node_Id is
   begin
      Node_Table.Append
       ((Kind                        => Node_Enumeration_Resource_Value,
         Parent                      => Null_Node,
         List                        => Null_List,
         Previous                    => Null_Node,
         Next                        => Null_Node,
         ERV_Resource_Specification  => Null_Node,
         ERV_Resource_Value          => Null_Node,
         ERV_Is_Resource_Class_Value => False,
         ERV_Is_Hardcoded            => False,
         ERV_Is_Fallback             => False));

      return Node_Table.Last;
   end Create_Enumeration_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Enumeration_Value_Specification
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Enumeration_Value_Specification
     return Node_Id
   is
   begin
      Node_Table.Append
       ((Kind              => Node_Enumeration_Value_Specification,
         Parent            => Null_Node,
         List              => Null_List,
         Previous          => Null_Node,
         Next              => Null_Node,
         EVS_Name          => Null_Name,
         EVS_Internal_Name => Null_Name));

      return Node_Table.Last;
   end Create_Enumeration_Value_Specification;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Integer_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Integer_Resource_Value return Node_Id is
   begin
      Node_Table.Append
       ((Kind                        => Node_Integer_Resource_Value,
         Parent                      => Null_Node,
         List                        => Null_List,
         Previous                    => Null_Node,
         Next                        => Null_Node,
         IRV_Resource_Specification  => Null_Node,
         IRV_Resource_Value          => 0,
         IRV_Is_Resource_Class_Value => False,
         IRV_Is_Hardcoded            => False,
         IRV_Is_Fallback             => False));

      return Node_Table.Last;
   end Create_Integer_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Pixel_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Pixel_Resource_Value return Node_Id is
   begin
      Node_Table.Append
       ((Kind                        => Node_Pixel_Resource_Value,
         Parent                      => Null_Node,
         List                        => Null_List,
         Previous                    => Null_Node,
         Next                        => Null_Node,
         PRV_Resource_Specification  => Null_Node,
         PRV_Is_Resource_Class_Value => False,
         PRV_Is_Hardcoded            => False,
         PRV_Is_Fallback             => False));

      return Node_Table.Last;
   end Create_Pixel_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Pixmap_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Pixmap_Resource_Value return Node_Id is
   begin
      Node_Table.Append
       ((Kind                         => Node_Pixmap_Resource_Value,
         Parent                       => Null_Node,
         List                         => Null_List,
         Previous                     => Null_Node,
         Next                         => Null_Node,
         PMRV_Resource_Specification  => Null_Node,
         PMRV_Is_Resource_Class_Value => False,
         PMRV_Is_Hardcoded            => False,
         PMRV_Is_Fallback             => False));

      return Node_Table.Last;
   end Create_Pixmap_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Predefined_Resource_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Predefined_Resource_Type return Node_Id is
   begin
      Node_Table.Append
       ((Kind              => Node_Predefined_Resource_Type,
         Parent            => Null_Node,
         List              => Null_List,
         Previous          => Null_Node,
         Next              => Null_Node,
         PRT_Name          => Null_Name,
         PRT_Internal_Name => Null_Name,
         Type_Kind         => Type_Unspecified));

      return Node_Table.Last;
   end Create_Predefined_Resource_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Project
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Project return Node_Id is
   begin
      Node_Table.Append ((Kind                 => Node_Project,
                          Parent               => Null_Node,
                          List                 => Null_List,
                          Previous             => Null_Node,
                          Next                 => Null_Node,
                          P_Name               => Null_Name,
                          File_Name            => Null_Name,
                          Imported_Widget_Sets => Null_List,
                          Applications         => Null_List));

      return Node_Table.Last;
   end Create_Project;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Resource_Specification
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Resource_Specification return Node_Id is
   begin
      Node_Table.Append
       ((Kind                           => Node_Resource_Specification,
         Parent                         => Null_Node,
         List                           => Null_List,
         Previous                       => Null_Node,
         Next                           => Null_Node,
         Resource_Name                  => Null_Name,
         Internal_Resource_Name         => Null_Name,
         Resource_Class_Name            => Null_Name,
         Internal_Resource_Class_Name   => Null_Name,
         Resource_Type                  => Null_Node,
         Can_Be_Set_At_Creation_Time    => False,
         Can_Be_Set_By_Set_Values       => False,
         Can_Be_Retrieved_By_Get_Values => False,
         Widget_Reference_Constraints   => Unspecified));

      return Node_Table.Last;
   end Create_Resource_Specification;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Screen_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Screen_Resource_Value return Node_Id is
   begin
      Node_Table.Append
       ((Kind                        => Node_Screen_Resource_Value,
         Parent                      => Null_Node,
         List                        => Null_List,
         Previous                    => Null_Node,
         Next                        => Null_Node,
         SRV_Resource_Specification  => Null_Node,
         SRV_Is_Resource_Class_Value => False,
         SRV_Is_Hardcoded            => False,
         SRV_Is_Fallback             => False));

      return Node_Table.Last;
   end Create_Screen_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Translation_Data_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Translation_Data_Resource_Value return Node_Id is
   begin
      Node_Table.Append
       ((Kind                        => Node_Translation_Data_Resource_Value,
         Parent                      => Null_Node,
         List                        => Null_List,
         Previous                    => Null_Node,
         Next                        => Null_Node,
         TRV_Resource_Specification  => Null_Node,
         TRV_Is_Resource_Class_Value => False,
         TRV_Is_Hardcoded            => False,
         TRV_Is_Fallback             => False));

      return Node_Table.Last;
   end Create_Translation_Data_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Widget_Class return Node_Id is
   begin
      Node_Table.Append
       ((Kind                                 => Node_Widget_Class,
         Parent                               => Null_Node,
         List                                 => Null_List,
         Previous                             => Null_Node,
         Next                                 => Null_Node,
         WC_Name                              => Null_Name,
         Is_Meta_Class                        => False,
         Super_Class                          => Null_Node,
         WC_Automatically_Created_Parent      => Null_Node,
         WC_Automatically_Created_Children    => Null_List,
         Corresponding_Widget_Or_Gadget_Class => Null_Node,
         WC_Resources                         => Null_List,
         WC_Constraint_Resources              => Null_List,
         WC_Callbacks                         => Null_List,
         Controls                             => Null_List));

      return Node_Table.Last;
   end Create_Widget_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget_Instance
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Widget_Instance return Node_Id is
   begin
      Node_Table.Append
       ((Kind                                 => Node_Widget_Instance,
         Parent                               => Null_Node,
         List                                 => Null_List,
         Previous                             => Null_Node,
         Next                                 => Null_Node,
         WI_Name                              => Null_Name,
         Class                                => Null_Node,
         Is_Managed                           => False,
         WI_Automatically_Created_Parent      => Null_Node,
         WI_Automatically_Created_Children    => Null_List,
         WI_Resources                         => Null_List,
         Children                             => Null_List,
         WI_Constraint_Resources              => Null_List,
         WI_Callbacks                         => Null_List));

      return Node_Table.Last;
   end Create_Widget_Instance;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget_Reference_Resource_Type
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Widget_Reference_Resource_Type return Node_Id is
   begin
      Node_Table.Append
       ((Kind               => Node_Widget_Reference_Resource_Type,
         Parent             => Null_Node,
         List               => Null_List,
         Previous           => Null_Node,
         Next               => Null_Node,
         WRRT_Name          => Null_Name,
         WRRT_Internal_Name => Null_Name));

      return Node_Table.Last;
   end Create_Widget_Reference_Resource_Type;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget_Reference_Resource_Value
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Widget_Reference_Resource_Value return Node_Id is
   begin
      Node_Table.Append
       ((Kind                         => Node_Widget_Reference_Resource_Value,
         Parent                       => Null_Node,
         List                         => Null_List,
         Previous                     => Null_Node,
         Next                         => Null_Node,
         WRRV_Resource_Specification  => Null_Node,
         WRRV_Resource_Value          => Null_Node,
         WRRV_Is_Resource_Class_Value => False,
         WRRV_Is_Hardcoded            => False,
         WRRV_Is_Fallback             => False));

      return Node_Table.Last;
   end Create_Widget_Reference_Resource_Value;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Create_Widget_Set
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Create_Widget_Set return Node_Id is
   begin
      Node_Table.Append ((Kind           => Node_Widget_Set,
                          Parent         => Null_Node,
                          List           => Null_List,
                          Previous       => Null_Node,
                          Next           => Null_Node,
                          Resource_Types => Null_List,
                          Widget_Classes => Null_List));

      return Node_Table.Last;
   end Create_Widget_Set;

end Model.Tree.Constructors;
