with Interfaces.C;

with Xt;


package Xm.Representation_Type_Management is

   type Xm_Rep_Type_Id is new Interfaces.C.unsigned_short;
   Xm_Rep_Type_Invalid : constant Xm_Rep_Type_Id := 16#1FFF#;

   type unsigned_char_List
     is array (Natural range <>) of aliased Interfaces.C.unsigned_char;
   type unsigned_char_Pointer is access all Interfaces.C.unsigned_char;

   function To_unsigned_char_List (Pointer : in unsigned_char_Pointer;
                                   Length  : in Natural)
     return unsigned_char_List;

   type Xm_Rep_Type_Entry is record
      Rep_Type_Name     : Xt.Xt_String;
      Value_Names       : Xt.Xt_String_Pointer;
      Values            : unsigned_char_pointer;
      Num_Values        : Interfaces.C.unsigned_char;
      Reverse_Installed : Xt.Xt_Boolean;
      Rep_Type_Id       : Xm_Rep_Type_Id;
   end record;
   pragma Convention (C, Xm_Rep_Type_Entry);

   type Xm_Rep_Type_Entry_Pointer is access all Xm_Rep_Type_Entry;

   type Xm_Rep_Type_List is array (Natural range <>) of Xm_Rep_Type_Entry;


   Unknown_Representation_Type_Error : exception;


   procedure Xm_Rep_Type_Add_Reverse (Rep_Type_Id : in Xm_Rep_Type_Id);


   --  raised Unknown_Representation_Type_Error
   function Xm_Rep_Type_Get_Id (Rep_Type : in String) return Xm_Rep_Type_Id;

   --  raised Unknown_Representation_Type_Error
   function Xm_Rep_Type_Get_Record (Rep_Type_Id : in Xm_Rep_Type_Id)
     return Xm_Rep_Type_Entry;

   function Xm_Rep_Type_Get_Name_List
    (Rep_Type_Id          : in Xm_Rep_Type_Id;
     Use_Uppercase_Format : in Boolean)
       return Xt.Xt_String_List;

   function Xm_Rep_Type_Get_Registered return Xm_Rep_Type_List;


   ---------------------------------------------------------------------------
   --  Obsolete and deprecated
   ---------------------------------------------------------------------------

   procedure Xm_Rep_Type_Install_Tear_Off_Model_Converter;


private

   pragma Import (C, Xm_Rep_Type_Add_Reverse, "XmRepTypeAddReverse");
   pragma Import (C, Xm_Rep_Type_Install_Tear_Off_Model_Converter,
                  "XmRepTypeInstallTearOffModelConverter");

end Xm.Representation_Type_Management;
