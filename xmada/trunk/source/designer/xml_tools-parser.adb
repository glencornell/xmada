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
--! <Unit> XML_Tools.Parser
--! <ImplementationNotes>
--! <PortabilityIssues>
--! <AnticipatedChanges>
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Ada.Characters.Wide_Latin_1;
with Ada.Wide_Text_IO;

with GNAT.Table;

with XML_Tools.Allocation;
with XML_Tools.Attributes;
with XML_Tools.Elements;
with XML_Tools.Names;
with XML_Tools.Strings;

package body XML_Tools.Parser is

   use Ada.Characters.Wide_Latin_1;
   use Ada.Wide_Text_IO;
   use XML_Tools.Attributes;
   use XML_Tools.Elements;
   use XML_Tools.Names;
   use XML_Tools.Strings;

   type Token_Kinds is
    (Open_Tag_Begin,
     Open_Tag_Close,
     Close_Tag_Begin,
     Tag_End,
     PI_Begin,
     PI_End,
     Equal,
     Name,
     String,
     End_Of_Stream);

   type Token_Record (Kind : Token_Kinds := End_Of_Stream) is record
      case Kind is
         when Name =>
            Name   : Name_Id;

         when String =>
            String : String_Id;

         when others =>
            null;
      end case;
   end record;

   procedure Scan;
   procedure Scan_Tag_Begin;
   procedure Scan_Open_Tag_Close;
   procedure Scan_PI_End;
   procedure Scan_Data;
   procedure Scan_Name;
   procedure Scan_String (Delimiter : in Wide_Character);
   procedure Skip_Spaces;

   procedure Parse_Tag;
   procedure Parse_Close_Tag;

   function Current_Element return Element_Id;
   procedure Push (Item : in Element_Id);
   procedure Pop;

   --  Буфер ввода.

   Buffer      : Wide_String (1 .. 16384);
   First       : Positive;
   Last        : Natural;
   Slice_First : Positive;

   --  Буфер накопления строки.

   String_Buffer : Wide_String (1 .. 32768);
   String_Last   : Natural;

   --  Признак выделения тега.

   Tag_Parsing : Boolean := False;

   --  Файл ввода.

   File : File_Type;

   --  Стэк вложенных елементов.

   package Element_Stack is
     new GNAT.Table
          (Table_Component_Type => Element_Id,
           Table_Index_Type     => Natural,
           Table_Low_Bound      => Natural'First + 1,
           Table_Initial        => Allocation.Element_Stack_Initial,
           Table_Increment      => Allocation.Element_Stack_Increment);

   --  Текущий токен.

   Token : Token_Record;

   ---------------------
   -- Current_Element --
   ---------------------

   function Current_Element return Element_Id is
   begin
      if Element_Stack.Last - Element_Stack.First + 1 = 0 then
         return Element_Id'First;

      else
         return Element_Stack.Table (Element_Stack.Last);
      end if;
   end Current_Element;

   -----------
   -- Parse --
   -----------

   procedure Parse (File_Name : in Standard.String) is
   begin
      Open (File, In_File, File_Name, "wcem=8");

      --  Начальная инициализация.

      Get_Line (File, Buffer, Last);
      First := Buffer'First;
      Skip_Spaces;

      --  Чтение заголовка файла.

      Scan;

      if Token.Kind /= PI_Begin then
         raise Program_Error;
      end if;

      Tag_Parsing := True;

      loop
         Scan;

         exit when Token.Kind = PI_End;
      end loop;

      Tag_Parsing := True;

      --  Чтение информационной части.

      loop
         Scan;

         if Token.Kind = Open_Tag_Begin then
            Parse_Tag;

         elsif Token.Kind = Close_Tag_Begin then
            Parse_Close_Tag;

         elsif Token.Kind = String then
            Create_String (Current_Element, Token.String);

         elsif Token.Kind = End_Of_Stream then
            exit;

         else
            raise Program_Error;
         end if;
      end loop;

      if Current_Element /= Null_Element_Id then
         raise Program_Error;
      end if;

      Close (File);
   end Parse;

   ---------------------
   -- Parse_Close_Tag --
   ---------------------

   procedure Parse_Close_Tag is
   begin
      Tag_Parsing := True;

      Scan;

      if Token.Kind /= Name then
         raise Program_Error;
      end if;

      if Name (Current_Element) /= Token.Name then
         raise Program_Error;
      end if;

      Scan;

      if Token.Kind /= Tag_End then
         raise Program_Error;
      end if;

      Pop;
   end Parse_Close_Tag;

   ---------------
   -- Parse_Tag --
   ---------------

   procedure Parse_Tag is
      N : Name_Id;

   begin
      Tag_Parsing := True;

      Scan;

      if Token.Kind /= Name then
         raise Program_Error;
      end if;

      Push (Create_Tag (Current_Element, Token.Name));

      loop
         Scan;

         case Token.Kind is
            when Name =>
               N := Token.Name;

               Scan;

               if Token.Kind /= Equal then
                  raise Program_Error;
               end if;

               Scan;

               if Token.Kind /= String then
                  raise Program_Error;
               end if;

               Create_Attribute (Current_Element, N, Token.String);

            when Tag_End =>
               exit;

            when Open_Tag_Close =>
               Pop;
               exit;

            when others =>
               raise Program_Error;
         end case;
      end loop;

      Tag_Parsing := False;
   end Parse_Tag;

   ---------
   -- Pop --
   ---------

   procedure Pop is
   begin
      Element_Stack.Set_Last (Element_Stack.Last - 1);
   end Pop;

   ----------
   -- Push --
   ----------

   procedure Push (Item : in Element_Id) is
   begin
      Element_Stack.Append (Item);
   end Push;

   ----------
   -- Scan --
   ----------

   procedure Scan is
   begin
      loop
         if First > Last then
            if End_Of_File (File) then
               Token := Token_Record'(Kind => End_Of_Stream);
               return;
            end if;

            Get_Line (File, Buffer, Last);
            First := Buffer'First;
            Skip_Spaces;
         end if;

         if First <= Last then
            case Buffer (First) is
               when '<' =>
                  First := First + 1;
                  Scan_Tag_Begin;

               when '>' =>
                  First := First + 1;
                  Token := (Kind => Tag_End);

               when '/' =>
                  First := First + 1;
                  Scan_Open_Tag_Close;

               when ''' | '"' =>
                  First := First + 1;
                  Scan_String (Buffer (First - 1));

               when '?' =>
                  First := First + 1;
                  Scan_PI_End;

               when '=' =>
                  First := First + 1;
                  Token := (Kind => Equal);

               when others =>
                  Slice_First := First;

                  if Tag_Parsing then
                     Scan_Name;

                  else
                     Scan_Data;
                  end if;
            end case;

            Skip_Spaces;

            return;
         end if;
      end loop;
   end Scan;

   ---------------
   -- Scan_Data --
   ---------------

   procedure Scan_Data is
      Is_Waiting_For_Semicolon : Boolean := False;
      Special_Symbol           : Wide_String (1 .. 255);
      Special_Symbol_Last      : Natural := 0;

   begin
      String_Last := String_Buffer'First - 1;

      Outer : loop
         if First > Last then
            if End_Of_File (File) then
               exit Outer;
            end if;

            Get_Line (File, Buffer, Last);
            First := Buffer'First;

            String_Last := String_Last + 1;
            String_Buffer (String_Last) := LF;
         end if;

         while First <= Last loop
            case Buffer (First) is
               when '<' =>
                  exit Outer;

               when '&' =>
                  --  Переходим в режим обработки спецсимвола.

                  Is_Waiting_For_Semicolon := True;

               when others =>
                  if not Is_Waiting_For_Semicolon then
                     String_Last := String_Last + 1;
                     String_Buffer (String_Last) := Buffer (First);

                  elsif Buffer (First) /= ';' then
                     if Special_Symbol_Last = Special_Symbol'Last then
                        Put_Line
                         (Standard_Error,
                          "The XML special character is too long: ""&"
                            & Special_Symbol & """.");
                        raise Program_Error;
                     end if;

                     Special_Symbol_Last := Special_Symbol_Last + 1;
                     Special_Symbol (Special_Symbol_Last) := Buffer (First);

                  else
                     --  Конец спецсимвола.

                     String_Last := String_Last + 1;

                     declare
                        Str : constant Wide_String
                          := Special_Symbol (1 .. Special_Symbol_Last);

                     begin
                        --  Полный список спецсимволов можно посмотреть здесь:
                        --  http://html.manual.ru/book/info/specialchars.php

                        if Str = "amp" then
                           String_Buffer (String_Last) := '&';

                        elsif Str = "lt" then
                           String_Buffer (String_Last) := '<';

                        else
                           Put_Line
                            (Standard_Error,
                             "Can't parse unknown XML special symbol: ""&"
                               & Str & ";"".");
                           raise Program_Error;

                        end if;
                     end;

                     Special_Symbol_Last := 0;
                     Is_Waiting_For_Semicolon := False;
                  end if;
            end case;

            First := First + 1;
         end loop;
      end loop Outer;

      while String_Last >= String_Buffer'First
              and then (String_Buffer (String_Last) = ' '
                          or else String_Buffer (String_Last) = LF)
      loop
         String_Last := String_Last - 1;
      end loop;

      Token := (Kind   => String,
                String =>
                  Store
                    (String_Buffer (String_Buffer'First .. String_Last)));
   end Scan_Data;

   ---------------
   -- Scan_Name --
   ---------------

   procedure Scan_Name is
   begin
      while First <= Last loop
         case Buffer (First) is
            when '0' .. '9' | 'A' .. 'Z' | 'a' .. 'z' | '.' | ':' =>
               First := First + 1;

            when ' ' | '>' =>
               exit;

            when others =>
               raise Program_Error;
         end case;
      end loop;

      Token := (Kind => Name,
                Name => Store (Buffer (Slice_First .. First - 1)));
   end Scan_Name;

   -------------------------
   -- Scan_Open_Tag_Close --
   -------------------------

   procedure Scan_Open_Tag_Close is
   begin
      if First > Last
           or else Buffer (First) /= '>'
      then
         raise Program_Error;
      end if;

      First := First + 1;

      Token := (Kind => Open_Tag_Close);
   end Scan_Open_Tag_Close;

   -----------------
   -- Scan_PI_End --
   -----------------

   procedure Scan_PI_End is
   begin
      if First > Last
           or else Buffer (First) /= '>'
      then
         raise Program_Error;
      end if;

      First := First + 1;

      Token := (Kind => PI_End);
   end Scan_PI_End;

   procedure Scan_String (Delimiter : in Wide_Character) is
      Delimiter_Found : Boolean := False;

   begin
      String_Last := String_Buffer'First - 1;

      while First <= Last loop
         case Buffer (First) is
            when ''' =>
               if Delimiter = ''' then
                  Delimiter_Found := True;
                  First := First + 1;

                  exit;
               end if;

            when '"' =>
               if Delimiter = '"' then
                  Delimiter_Found := True;
                  First := First + 1;

                  exit;
               end if;

            when others =>
               null;
         end case;

         String_Last := String_Last + 1;
         String_Buffer (String_Last) := Buffer (First);

         First := First + 1;
      end loop;

      if not Delimiter_Found then
         raise Program_Error;
      end if;

      Token := (Kind   => String,
                String =>
                  Store (String_Buffer (String_Buffer'First .. String_Last)));
   end Scan_String;

   procedure Scan_Tag_Begin is
   begin
      if First > Last then
         Token := Token_Record'(Kind => Open_Tag_Begin);
      end if;

      case Buffer (First) is
         when '/' =>
            Token := (Kind => Close_Tag_Begin);

         when '?' =>
            Token := (Kind => PI_Begin);

         when others =>
            Token := (Kind => Open_Tag_Begin);
            First := First - 1;
      end case;

      First := First + 1;
   end Scan_Tag_Begin;

   procedure Skip_Spaces is
   begin
      while First <= Last and then Buffer (First) = ' ' loop
         First := First + 1;
      end loop;
   end Skip_Spaces;

end XML_Tools.Parser;
