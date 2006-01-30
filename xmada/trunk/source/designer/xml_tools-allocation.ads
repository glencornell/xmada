------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------

package XML_Tools.Allocation is

   --  Таблица имён в пакете Names.

   Names_Initial               : constant := 200;
   Names_Increment             : constant := 100;

   --  Таблица символов имён в пакете Names.

   Name_Characters_Initial     : constant := 100;
   Name_Characters_Increment   : constant := 100;

   --  Таблица элементов в пакете Elements.

   Elements_Initial            : constant := 100;
   Elements_Increment          : constant := 100;

   --  Таблица строк в пакете Strings.

   Strings_Initial             : constant := 100;
   Strings_Increment           : constant := 100;

   --  Таблица символов строк в пакете Strings.

   String_Characters_Initial   : constant := 100;
   String_Characters_Increment : constant := 100;

   --  Таблица атрибутов в пакете Attributes.

   Attributes_Initial          : constant := 100;
   Attributes_Increment        : constant := 100;

   --  Таблица стека вложенности элементов в пакете Parser.

   Element_Stack_Initial       : constant := 100;
   Element_Stack_Increment     : constant := 100;

end XML_Tools.Allocation;
