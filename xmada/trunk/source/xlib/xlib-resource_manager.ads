with Interfaces.C;
with Interfaces.C.Strings;


package Xlib.Resource_Manager is


   type Xrm_Value is record
      Size    : Interfaces.C.unsigned;
      Address : X_Pointer;
   end record;

   type Xrm_Value_Pointer is access all Xrm_Value;


   type Xrm_Option_Kind is
    (Xrm_Option_No_Arg,
     Xrm_Option_Is_Arg,
     Xrm_Option_Sticky_Arg,
     Xrm_Option_Sep_Arg,
     Xrm_Option_Res_Arg,
     Xrm_Option_Skip_Arg,
     Xrm_Option_Skip_Line,
     Xrm_Option_Skip_N_Args);


   type Xrm_Option_Desc_Rec is record
      Option        : Interfaces.C.Strings.chars_ptr;
      Resource_Name : Interfaces.C.Strings.chars_ptr;
      Arg_Kind      : Xrm_Option_Kind;
      Value         : X_Pointer;
   end record;


   type Xrm_Option_Desc_List is
     array (Natural range <>) of Xrm_Option_Desc_Rec;
   Null_Xrm_Option_Desc_List : constant Xrm_Option_Desc_List;


   type Xrm_Database is private;


private

   pragma Convention (C, Xrm_Option_Desc_Rec);

   for Xrm_Option_Kind'Size use Interfaces.C.int'Size;
   pragma Convention (C, Xrm_Option_Kind);

   pragma Convention (C, Xrm_Value);

   pragma Convention (C, Xrm_Value_Pointer);


   Null_Xrm_Option_Desc_List : constant Xrm_Option_Desc_List (1 .. 0)
     := (others => (Interfaces.C.Strings.Null_Ptr,
                    Interfaces.C.Strings.Null_Ptr,
                    Xrm_Option_No_Arg,
                    Null_X_Pointer));

   type Xrm_Database_Record is null record;
   pragma Convention (C, Xrm_Database_Record);

   type Xrm_Database is access all Xrm_Database_Record;
   pragma Convention (C, Xrm_Database);

end Xlib.Resource_Manager;
