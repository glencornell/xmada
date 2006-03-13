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
--! <Unit> Designer.RTL_Consistency
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Characters.Handling;
with Ada.Strings.Wide_Fixed;
with Ada.Wide_Text_IO;
with Interfaces.C.Strings;

with Xt.Ancillary_Types;
with Xt.Initializers;
with Xt.Resource_Management;
with Xm.Resource_Management;

with Model.Names;
with Model.Queries;
with Model.Tree.Designer;
with Model.Tree.Lists;

package body Designer.RTL_Consistency is

   use Ada.Strings.Wide_Fixed;
   use Ada.Wide_Text_IO;
   use Model;
   use Model.Names;
   use Model.Queries;
   use Model.Tree;
   use Model.Tree.Designer;
   use Model.Tree.Lists;
   use Xm;
   use Xm.Resource_Management;
   use Xt;
   use Xt.Ancillary_Types;
   use Xt.Initializers;
   use Xt.Resource_Management;

   type Boolean_Array is array (Positive range <>) of Boolean;

   procedure Check_Widget_Class (Node : in Node_Id);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Check_Resource_List
   --!    <Purpose> Производит проверку наличия в модели указанных ресурсов
   --! и соответствие их описания (имя, тип, XXX). В массиве All_Resources
   --! устанавливает в True элементы, соответствующие найденным в модели
   --! ресурсам.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Check_Resource_List (Node          : in     Node_Id;
                                  Xt_Resources  : in     Xt_Resource_List;
                                  All_Resources : in out Boolean_Array);

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Check_Resource_List
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Check_Resource_List (Node          : in     Node_Id;
                                  Xt_Resources  : in     Xt_Resource_List;
                                  All_Resources : in out Boolean_Array)
   is
      W_Resources : array (Xt_Resources'Range) of Boolean
        := (others => False);
      Callback    : array (Xt_Resources'Range) of Boolean
        := (others => False);

   begin
      for J in Xt_Resources'Range loop
         declare
            X_Name : constant Wide_String
              := Ada.Characters.Handling.To_Wide_String
                  (Interfaces.C.Strings.Value
                    (Xt_Resources (J).Resource_Name));
            M_Name : constant Name_Id := Find (X_Name);

         begin
            if Index (X_Name, ".") /= 0 then

               --  Внутренний ресурс, не может и не должен быть
               --  представлен в модели.

               W_Resources (J) := True;

            else

               --  Проверка является ли ресурс подпрограммой обратного
               --  вызова.

               --  XXX Альтернативный вариант - проверка типа ресурса.

               if X_Name'Length >= 8
                 and then X_Name (X_Name'Last - 7 .. X_Name'Last)
                            = "Callback"
               then
                  Callback (J) := True;
               end if;

               --  Поиск одноименной спецификации ресурса в модели и
               --  контроль имён класса и типа ресурса.

               if Resources (Node) /= Null_List then
                  declare
                     Aux : Node_Id  := First (Resources (Node));
                     K   : Positive := 1;

                  begin
                     while Aux /= Null_Node loop
                        exit when Internal_Resource_Name (Aux) = M_Name;

                        Aux := Next (Aux);
                        K   := K + 1;
                     end loop;

                     if Aux /= Null_Node then
                        if Callback (J) then
                           Put_Line
                            ("Callback resource "
                               & X_Name & " defined as resource");

                        else
                           W_Resources (J) := True;
                           All_Resources (K) := True;

                           if Ada.Characters.Handling.To_Wide_String
                               (Interfaces.C.Strings.Value
                                 (Xt_Resources (J).Resource_Type))
                                /= Internal_Name_Image
                                    (Resource_Type (Aux))
                           then
                              Put_Line
                               ("Resource " & X_Name
                                  & " have wrong type "
                                  & Internal_Name_Image
                                     (Resource_Type (Aux))
                                  & " (should be "
                                  & Ada.Characters.Handling.To_Wide_String
                                     (Interfaces.C.Strings.Value
                                       (Xt_Resources (J).Resource_Type))
                                  & ')');
                           end if;
                        end if;
                     end if;
                  end;
               end if;
            end if;
         end;
      end loop;

      --  Формирование отчета.

      for J in Xt_Resources'Range loop
         if not W_Resources (J)
           and then not Callback (J)
         then
            Put_Line
             ("Resource "
                & Ada.Characters.Handling.To_Wide_String
                   (Interfaces.C.Strings.Value
                     (Xt_Resources (J).Resource_Name))
                & " not defined in model");
         end if;
      end loop;
   end Check_Resource_List;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Check_Widget_Class
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   procedure Check_Widget_Class (Node : in Node_Id) is
      L : Integer;

   begin
      Put_Line ("  checking " & Name_Image (Node));

      --  Проверка отсутствия подпрограммы создания у метакласса.

      if Is_Meta_Class (Node)
        and then Convenience_Create_Function (Node) /= null
      then
         Put_Line ("Meta class can't have convenience create function");
      end if;

      --  Проверка наличия подпрограммы создания у не метакласса.
      --  Эта подпрограмма обычно существует у всех классов видежтов,
      --  за исключением оболочек для которых её наличие - исключение.

      if not Is_Meta_Class (Node)
        and then Convenience_Create_Function (Node) = null
        and then not Is_Shell (Node)
      then
         Put_Line ("Convenience create function not defined");
      end if;

      if not Is_Meta_Class (Node)
        and then Convenience_Create_Function (Node) /= null
        and then Is_Shell (Node)
      then
         Put_Line
          ("Convenience create function defined for Shell subclass");
      end if;

      --  Проверка соответствия объявленных и фактических ресурсов.

      if Tree.Designer.Widget_Class (Node) = Null_Widget_Class then
         Put_Line ("Widget class not defined");

      else
         Xt_Initialize_Widget_Class (Tree.Designer.Widget_Class (Node));

         if Resources (Node) = Null_List then
            L := 0;

         else
            L := Length (Resources (Node));
         end if;

         declare
            S_Resources : constant Xm_Secondary_Resource_Data_List
              := Xm_Get_Secondary_Resource_Data
                  (Tree.Designer.Widget_Class (Node));
            M_Resources : Boolean_Array (1 .. L) := (others => False);

         begin
            Check_Resource_List
             (Node,
              Xt_Get_Resource_List (Tree.Designer.Widget_Class (Node)),
              M_Resources);

            for J in S_Resources'Range loop
               Check_Resource_List
                (Node,
                 To_Xt_Resource_List
                  (S_Resources (J).Resources, S_Resources (J).Num_Resources),
                 M_Resources);
            end loop;

            --  Формирование отчёта о ресурсах, заданных в модели, но не
            --  обнаруженных у класса виджета.

            if Resources (Node) /= Null_List then
               declare
                  Aux : Node_Id := First (Resources (Node));
                  K   : Positive := 1;

               begin
                  while Aux /= Null_Node loop
                     if not M_Resources (K) then
                        Put_Line
                         ("Resource "
                            & Internal_Resource_Name_Image (Aux)
                            & " not found in runtime library");
                     end if;

                     Aux := Next (Aux);
                     K   := K + 1;
                  end loop;
               end;
            end if;
         end;
      end if;
   end Check_Widget_Class;

   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Verify
   --!    <Purpose> Производит контроль соответствия среды времени исполнения
   --! и используемой модели наборов виджетов.
   --!    <Exceptions>
   ---------------------------------------------------------------------------
   procedure Verify (Widget_Sets : in Model.List_Id) is
   begin
      Put_Line ("Checking RTL <=> Model <=> Designer Annotation <=>"
                  & " Ada Annotation consistency...");

      --  Проверка перечислимых типов.

      --  Инициализация всех классов виджетов.

      declare
         Aux_Set   : Node_Id := First (Widget_Sets);
         Aux_Class : Node_Id;

      begin
         while Aux_Set /= Null_Node loop
            Aux_Class := First (Widget_Classes (Aux_Set));

            while Aux_Class /= Null_Node loop
               if Tree.Designer.Widget_Class (Aux_Class)
                    /= Null_Widget_Class
               then
                  Xt_Initialize_Widget_Class
                   (Tree.Designer.Widget_Class (Aux_Class));
               end if;

               Aux_Class := Next (Aux_Class);
            end loop;

            Aux_Set := Next (Aux_Set);
         end loop;
      end;

      --  Проверка состава ресурсов у классов виджетов.

      declare
         Aux_Set   : Node_Id := First (Widget_Sets);
         Aux_Class : Node_Id;

      begin
         while Aux_Set /= Null_Node loop
            Aux_Class := First (Widget_Classes (Aux_Set));

            while Aux_Class /= Null_Node loop
               Check_Widget_Class (Aux_Class);

               Aux_Class := Next (Aux_Class);
            end loop;

            Aux_Set := Next (Aux_Set);
         end loop;
      end;
   end Verify;

end Designer.RTL_Consistency;
