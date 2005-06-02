with Interfaces.C;            use Interfaces.C;
with System;                  use System;
with System.Storage_Elements; use System.Storage_Elements;

with Xlib;                    use Xlib;
with Xt;                      use Xt;

with Xm.Implementation;       use Xm.Implementation;


package body Xm.Clipboard_Management is


   function Xm_Clipboard_Cancel_Copy (The_Display : in Display;
                                      The_Window  : in Window;
                                      Item_Id     : in Xm_Clipboard_Item_Id)
     return Xm_Clipboard_Status
   is
      function XmClipboardCancelCopy (The_Display : in Display;
                                      The_Window  : in Window;
                                      Item_Id     : in Xm_Clipboard_Item_Id)
        return Xm_Clipboard_Status;
      pragma Import (C, XmClipboardCancelCopy, "XmClipboardCancelCopy");
   begin
      Check (The_Display);
      return XmClipboardCancelCopy (The_Display, The_Window, Item_Id);
   end Xm_Clipboard_Cancel_Copy;


   procedure Xm_Clipboard_Copy (The_Display : in     Display;
                                The_Window  : in     Window;
                                Item_Id     : in     Xm_Clipboard_Item_Id;
                                Format_Name : in     String;
                                Buffer      : in     Storage_Array;
                                Private_Id  : in     Xm_Clipboard_Private_Id;
                                Status      :    out Xm_Clipboard_Status)
   is
      C_Data_Id : aliased Xm_Clipboard_Data_Id;

      function XmClipboardCopy (The_Display : in     Display;
                                The_Window  : in     Window;
                                Item_Id     : in     Xm_Clipboard_Item_Id;
                                Format_Name : in     char_array;
                                Buffer      : in     Storage_Array;
                                Length      : in     unsigned_long;
                                Private_Id  : in     Xm_Clipboard_Private_Id;
                                Data_Id     : access Xm_Clipboard_Data_Id)
        return Xm_Clipboard_Status;
      pragma Import (C, XmClipboardCopy, "XmClipboardCopy");
   begin
      Check (The_Display);
      Status := XmClipboardCopy (The_Display,
                                 The_Window,
                                 Item_Id,
                                 To_C (Format_Name),
                                 Buffer,
                                 Buffer'Length,
                                 Private_Id,
                                 C_Data_Id'Access);
   end Xm_Clipboard_Copy;


   procedure Xm_Clipboard_Copy (The_Display : in     Display;
                                The_Window  : in     Window;
                                Item_Id     : in     Xm_Clipboard_Item_Id;
                                Format_Name : in     String;
                                Private_Id  : in     Xm_Clipboard_Private_Id;
                                Data_Id     :    out Xm_Clipboard_Data_Id;
                                Status      :    out Xm_Clipboard_Status)
   is
      C_Data_Id : aliased Xm_Clipboard_Data_Id;

      function XmClipboardCopy (The_Display : in     Display;
                                The_Window  : in     Window;
                                Item_Id     : in     Xm_Clipboard_Item_Id;
                                Format_Name : in     char_array;
                                Buffer      : in     Address;
                                Length      : in     unsigned_long;
                                Private_Id  : in     Xm_Clipboard_Private_Id;
                                Data_Id     : access Xm_Clipboard_Data_Id)
        return Xm_Clipboard_Status;
      pragma Import (C, XmClipboardCopy, "XmClipboardCopy");
   begin
      Check (The_Display);

      Status := XmClipboardCopy (The_Display,
                                 The_Window,
                                 Item_Id,
                                 To_C (Format_Name),
                                 Null_Address,
                                 0,
                                 Private_Id,
                                 C_Data_Id'Access);

      if Status = Xm_Clipboard_Success then
         Data_Id := C_Data_Id;
      end if;
   end Xm_Clipboard_Copy;


   procedure Xm_Clipboard_Copy_By_Name
    (The_Display : in     Display;
     The_Window  : in     Window;
     Data_Id     : in     Xm_Clipboard_Data_Id;
     Buffer      : in     Storage_Array;
     Private_Id  : in     Xm_Clipboard_Private_Id;
     Status      :    out Xm_Clipboard_Status)
   is
      function XmClipboardCopyByName
       (The_Display : in     Display;
        The_Window  : in     Window;
        Data_Id     : in     Xm_Clipboard_Data_Id;
        Buffer      : in     Storage_Array;
        Length      : in     unsigned_long;
        Private_Id  : in     Xm_Clipboard_Private_Id)
          return Xm_Clipboard_Status;
      pragma Import (C, XmClipboardCopyByName, "XmClipboardCopyByName");
   begin
      Check (The_Display);
      Status := XmClipboardCopyByName (The_Display,
                                       The_Window,
                                       Data_Id,
                                       Buffer,
                                       Buffer'Length,
                                       Private_Id);
   end Xm_Clipboard_Copy_By_Name;


   function Xm_Clipboard_End_Copy (The_Display : in Display;
                                   The_Window  : in Window;
                                   Item_Id     : in Xm_Clipboard_Item_Id)
     return Xm_Clipboard_Status
   is
      function XmClipboardEndCopy (The_Display : in Display;
                                   The_Window  : in Window;
                                   Item_Id     : in Xm_Clipboard_Item_Id)
        return Xm_Clipboard_Status;
      pragma Import (C, XmClipboardEndCopy, "XmClipboardEndCopy");
   begin
      Check (The_Display);
      return XmClipboardEndCopy (The_Display, The_Window, Item_Id);
   end Xm_Clipboard_End_Copy;


   function Xm_Clipboard_End_Retrieve (The_Display : in Display;
                                       The_Window  : in Window)
     return Xm_Clipboard_Status
   is
      function XmClipboardEndRetrieve (The_Display : in Display;
                                       The_Window  : in Window)
        return Xm_Clipboard_Status;
      pragma Import (C, XmClipboardEndRetrieve, "XmClipboardEndRetrieve");
   begin
      Check (The_Display);
      return XmClipboardEndRetrieve (The_Display, The_Window);
   end Xm_Clipboard_End_Retrieve;


   procedure Xm_Clipboard_Inquire_Count
    (The_Display            : in     Display;
     The_Window             : in     Window;
     Count                  :    out Natural;
     Max_Format_Name_Length :    out Natural;
     Status                 :    out Xm_Clipboard_Status)
   is
      C_Count                  : aliased int;
      C_Max_Format_Name_Length : aliased unsigned_long;

      function XmClipboardInquireCount
       (The_Display            : in     Display;
        The_Window             : in     Window;
        Count                  : access int;
        Max_Format_Name_Length : access unsigned_long)
          return Xm_Clipboard_Status;
      pragma Import (C, XmClipboardInquireCount, "XmClipboardInquireCount");
   begin
      Check (The_Display);

      Status := XmClipboardInquireCount (The_Display,
                                         The_Window,
                                         C_Count'Access,
                                         C_Max_Format_Name_Length'Access);

      if Status = Xm_Clipboard_Success then
         Count                  := Natural (C_Count);
         Max_Format_Name_Length := Natural (C_Max_Format_Name_Length);
      end if;
   end Xm_Clipboard_Inquire_Count;


   procedure Xm_Clipboard_Inquire_Format
    (The_Display        : in     Display;
     The_Window         : in     Window;
     Index              : in     Natural;
     Format_Name_Buffer :    out String;
     Last               :    out Natural;
     Status             :    out Xm_Clipboard_Status)
   is
      pragma Warnings (Off);
      C_Format_Name_Buffer : char_array (0 .. Format_Name_Buffer'Length);
      pragma Warnings (On);
      C_Copied_Length      : aliased unsigned_long;

      function XmClipboardInquireFormat
       (The_Display     : in     Display;
        The_Window      : in     Window;
        Index           : in     int;
        Format_Name_Buf : in     char_array;
        Buffer_Len      : in     unsigned_long;
        Copied_Len      : access unsigned_long)
          return Xm_Clipboard_Status;
      pragma Import (C, XmClipboardInquireFormat, "XmClipboardInquireFormat");
   begin
      Check (The_Display);

      Status := XmClipboardInquireFormat (The_Display,
                                          The_Window,
                                          int (Index),
                                          C_Format_Name_Buffer,
                                          C_Format_Name_Buffer'Length,
                                          C_Copied_Length'Access);

      if C_Copied_Length = 0 then
         Last := 0;
         return;
      end if;

      if Status = Xm_Clipboard_Success or Status = Xm_Clipboard_Truncate then
         declare
            Aux   : constant String
              := To_Ada (C_Format_Name_Buffer
                          (0 .. size_t (C_Copied_Length - 1)));
         begin
            Last := Format_Name_Buffer'First + Aux'Length - 1;
            Format_Name_Buffer (Format_Name_Buffer'First .. Last) := Aux;
         end;
      else
         Last := 0;
      end if;
   end Xm_Clipboard_Inquire_Format;


   procedure Xm_Clipboard_Inquire_Length
    (The_Display : in     Display;
     The_Window  : in     Window;
     Format_Name : in     String;
     Length      :    out Natural;
     Status      :    out Xm_Clipboard_Status)
   is
      C_Length : aliased unsigned_long;

      function XmClipboardInquireLength (The_Display : in     Display;
                                         The_Window  : in     Window;
                                         Format_Name : in     char_array;
                                         Length      : access unsigned_long)
        return Xm_Clipboard_Status;
      pragma Import (C, XmClipboardInquireLength, "XmClipboardInquireLength");
   begin
      Check (The_Display);

      Status := XmClipboardInquireLength (The_Display,
                                          The_Window,
                                          To_C (Format_Name),
                                          C_Length'Access);

      if Status = Xm_Clipboard_Success then
         Length := Natural (C_Length);
      else
         Length := 0;
      end if;
   end Xm_Clipboard_Inquire_Length;


   function Xm_Clipboard_Lock (The_Display : in Display;
                               The_Window  : in Window)
     return Xm_Clipboard_Status
   is
      function XmClipboardLock (The_Display : in Display;
                                The_Window  : in Window)
        return Xm_Clipboard_Status;
      pragma Import (C, XmClipboardLock, "XmClipboardLock");
   begin
      Check (The_Display);
      return XmClipboardLock (The_Display, The_Window);
   end Xm_Clipboard_Lock;


   function Xm_Clipboard_Unlock (The_Display      : in Display;
                                 The_Window       : in Window;
                                 Remove_All_Locks : in Boolean)
     return Xm_Clipboard_Status
   is
      function XmClipboardUnlock (The_Display      : in Display;
                                  The_Window       : in Window;
                                  Remove_All_Locks : in Xt_Boolean)
        return Xm_Clipboard_Status;
      pragma Import (C, XmClipboardUnlock, "XmClipboardUnlock");
   begin
      Check (The_Display);
      return XmClipboardUnlock (The_Display,
                                The_Window,
                                To_Xt_Boolean (Remove_All_Locks));
   end Xm_Clipboard_Unlock;


end Xm.Clipboard_Management;
