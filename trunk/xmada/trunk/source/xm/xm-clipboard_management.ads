with System.Storage_Elements;

with Xlib;


package Xm.Clipboard_Management is


--   procedure Xm_Clipboard_Start_Copy
--    (The_Display : in     Xlib.Display;
--     The_Window  : in     Xlib.Window;
--     Clip_Label  : in     Xm_String;
--     Timestamp   : in     Xlib.Time;
--     The_Widget  : in     Xt.Widget;
--     Callback    : in     Xm_Cut_Paste_Proc;
--     Item_Id     :    out Xm_Clipboard_Item_Id;
--     Status      :    out Xm_Clipboard_Status);


   function Xm_Clipboard_Cancel_Copy (The_Display : in Xlib.Display;
                                      The_Window  : in Xlib.Window;
                                      Item_Id     : in Xm_Clipboard_Item_Id)
     return Xm_Clipboard_Status;


   function Xm_Clipboard_End_Copy (The_Display : in Xlib.Display;
                                   The_Window  : in Xlib.Window;
                                   Item_Id     : in Xm_Clipboard_Item_Id)
     return Xm_Clipboard_Status;


   function Xm_Clipboard_End_Retrieve (The_Display : in Xlib.Display;
                                       The_Window  : in Xlib.Window)
     return Xm_Clipboard_Status;


--   generic
--      type Element_Type is private; ???
   procedure Xm_Clipboard_Copy
    (The_Display : in     Xlib.Display;
     The_Window  : in     Xlib.Window;
     Item_Id     : in     Xm_Clipboard_Item_Id;
     Format_Name : in     String;
     Buffer      : in     System.Storage_Elements.Storage_Array;
     Private_Id  : in     Xm_Clipboard_Private_Id;
     Status      :    out Xm_Clipboard_Status);


   procedure Xm_Clipboard_Copy
    (The_Display : in     Xlib.Display;
     The_Window  : in     Xlib.Window;
     Item_Id     : in     Xm_Clipboard_Item_Id;
     Format_Name : in     String;
     Private_Id  : in     Xm_Clipboard_Private_Id;
     Data_Id     :    out Xm_Clipboard_Data_Id;
     Status      :    out Xm_Clipboard_Status);


   procedure Xm_Clipboard_Copy_By_Name
    (The_Display : in     Xlib.Display;
     The_Window  : in     Xlib.Window;
     Data_Id     : in     Xm_Clipboard_Data_Id;
     Buffer      : in     System.Storage_Elements.Storage_Array;
     Private_Id  : in     Xm_Clipboard_Private_Id;
     Status      :    out Xm_Clipboard_Status);


   procedure Xm_Clipboard_Inquire_Count
    (The_Display            : in     Xlib.Display;
     The_Window             : in     Xlib.Window;
     Count                  :    out Natural;
     Max_Format_Name_Length :    out Natural;
     Status                 :    out Xm_Clipboard_Status);


   procedure Xm_Clipboard_Inquire_Format
    (The_Display        : in     Xlib.Display;
     The_Window         : in     Xlib.Window;
     Index              : in     Natural;
     Format_Name_Buffer :    out String;
     Last               :    out Natural;
     Status             :    out Xm_Clipboard_Status);


   procedure Xm_Clipboard_Inquire_Length
    (The_Display : in     Xlib.Display;
     The_Window  : in     Xlib.Window;
     Format_Name : in     String;
     Length      :    out Natural;
     Status      :    out Xm_Clipboard_Status);


   function Xm_Clipboard_Lock (The_Display : in Xlib.Display;
                               The_Window  : in Xlib.Window)
     return Xm_Clipboard_Status;


   function Xm_Clipboard_Unlock (The_Display      : in Xlib.Display;
                                 The_Window       : in Xlib.Window;
                                 Remove_All_Locks : in Boolean)
     return Xm_Clipboard_Status;


end Xm.Clipboard_Management;
