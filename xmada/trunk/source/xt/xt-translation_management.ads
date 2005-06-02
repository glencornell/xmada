
package Xt.Translation_Management is

   type Xt_Translations is private;


   type Xt_Action_Rec is record
      Action_Name : Xt_String;
      Action_Proc : Xt_Action_Proc;
   end record;
   pragma Convention (C, Xt_Action_Rec);

   type Xt_Action_List is array (Natural range <>) of Xt_Action_Rec;


   procedure Xt_App_Add_Actions (App_Context : in Xt_App_Context;
                                 Actions     : in Xt_Action_List);


   function Xt_Parse_Translation_Table (Source : in String)
     return Xt_Translations;


   procedure Xt_Override_Translations (The_Widget   : in Widget;
                                       Translations : in Xt_Translations);


private

   type Xt_Translations_Record is null record;
   pragma Convention (C, Xt_Translations_Record);

   type Xt_Translations is access Xt_Translations_Record;

end Xt.Translation_Management;
