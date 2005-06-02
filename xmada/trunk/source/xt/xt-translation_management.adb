with Interfaces.C;      use Interfaces.C;

with Xt.Implementation; use Xt.Implementation;


package body Xt.Translation_Management is


   --  !!! оригинальная реализация делает ещё не ясно что !!!
   procedure Xt_App_Add_Actions (App_Context : in Xt_App_Context;
                                 Actions     : in Xt_Action_List)
   is
      procedure XtAppAddActions (App_Context : in Xt_App_Context;
                                 Actions     : in Xt_Action_List;
                                 Num_Actions : in Cardinal);
      pragma Import (C, XtAppAddActions, "XtAppAddActions");
   begin
      Check (App_Context);
      XtAppAddActions (App_Context, Actions, Actions'Length);
   end Xt_App_Add_Actions;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Override_Translations
   --!    <ImplementationNotes> Проверка параметра Translations производится
   --! Xt.
   ---------------------------------------------------------------------------
   procedure Xt_Override_Translations (The_Widget   : in Widget;
                                       Translations : in Xt_Translations)
   is
      procedure XtOverrideTranslations (The_Widget   : in Widget;
                                        Translations : in Xt_Translations);
      pragma Import (C, XtOverrideTranslations, "XtOverrideTranslations");
   begin
      Check (The_Widget);
      XtOverrideTranslations (The_Widget, Translations);
   end Xt_Override_Translations;


   ---------------------------------------------------------------------------
   --! <Subprogram>
   --!    <Unit> Xt_Parse_Translation_Table
   --!    <ImplementationNotes>
   ---------------------------------------------------------------------------
   function Xt_Parse_Translation_Table (Source : in String)
     return Xt_Translations
   is
      C_Source : constant char_array := To_C (Source);

      function XtParseTranslationTable (Source : in char_array)
        return Xt_Translations;
      pragma Import (C, XtParseTranslationTable, "XtParseTranslationTable");
   begin
      return XtParseTranslationTable (C_Source);
   end Xt_Parse_Translation_Table;


end Xt.Translation_Management;
