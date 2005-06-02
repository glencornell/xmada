

package Xt.Callbacks is


   procedure Xt_Add_Callback
    (The_Widget    : in Widget;
     Callback_Name : in Xt_Resource_Name_String;
     Callback      : in Xt_Callback_Proc;
     Client_Data   : in Xt_Pointer := Null_Xt_Pointer);


   procedure Xt_Remove_Callback
    (The_Widget    : in Widget;
     Callback_Name : in Xt_Resource_Name_String;
     Callback      : in Xt_Callback_Proc;
     Client_Data   : in Xt_Pointer := Null_Xt_Pointer);


end Xt.Callbacks;
