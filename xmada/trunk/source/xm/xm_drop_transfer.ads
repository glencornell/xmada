with Xt_Object;


package Xm_Drop_Transfer is

   subtype Xm_Drop_Transfer_Widget is Xt_Object.Object_Widget;
   subtype Xm_Drop_Transfer_Class is Xt_Object.Object_Class;

   Xm_Drop_Transfer_Object_Class : constant Xm_Drop_Transfer_Class;


private

   pragma Import (C, Xm_Drop_Transfer_Object_Class,
                  "xmDropTransferObjectClass");

end Xm_Drop_Transfer;
