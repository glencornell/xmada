with Xlib.Resource_Manager;
with Xt.Ancillary_Types;


package Xt.Initializers is


   procedure Xt_Open_Application
    (Widget_Return      :    out Widget;
     App_Context_Return :    out Xt_App_Context;
     Application_Class  : in     String;
     Options            : in     Xlib.Resource_Manager.Xrm_Option_Desc_List
       := Xlib.Resource_Manager.Null_Xrm_Option_Desc_List;
--     Argc_In_Out        : in out Argc_Type;
--     Argv_In_Out        : in out Argv_Type;
     Fallback_Resources : in     Xt.Xt_String_List := Xt.Null_Xt_String_List;
     The_Widget_Class   : in     Widget_Class;
     Args               : in     Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List);


   procedure Xt_Initialize_Widget_Class (The_Widget_Class : in Widget_Class);


   procedure Xt_Toolkit_Initialize;


   function Xt_Toolkit_Thread_Initialize return Boolean;


   function Xt_Create_Application_Context return Xt_App_Context;


   procedure Xt_Destroy_Application_Context (App_Context : in Xt_App_Context);


   procedure Xt_Open_Display
    (Display_Return    :    out Xlib.Display;
     App_Context       : in     Xt_App_Context;
     Display_Name      : in     String := "";
     Application_Name  : in     String;
     Application_Class : in     String;
     Options           : in     Xlib.Resource_Manager.Xrm_Option_Desc_List
       := Xlib.Resource_Manager.Null_Xrm_Option_Desc_List);
--     Argc_In_Out        : in out Argc_Type;
--     Argv_In_Out        : in out Argv_Type;


   procedure Xt_Close_Display (The_Display : in Xlib.Display);


   function Xt_App_Create_Shell
    (Application_Name  : in String;
     Application_Class : in String;
     The_Widget_Class  : in Widget_Class;
     The_Display       : in Xlib.Display;
     Args              : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List)
       return Widget;


   function Xt_Set_Language_Proc
    (App_Context : in Xt_App_Context   := Null_Xt_App_Context;
     Proc        : in Xt_Language_Proc := Null_Xt_Language_Proc;
     Client_Data : in Xt_Pointer       := Null_Xt_Pointer)
       return Xt_Language_Proc;


   procedure Xt_Set_Language_Proc
    (App_Context : in Xt_App_Context   := Null_Xt_App_Context;
     Proc        : in Xt_Language_Proc := Null_Xt_Language_Proc;
     Client_Data : in Xt_Pointer       := Null_Xt_Pointer);


   --  Specification_List is a pointer to the NULL-terminated Xt_String_List.
   --  Application is responsible for contents of list and string addressed
   --  by the list remain valid until all displays are initialized or until
   --  Xt_App_Set_Fallback_Resources is called again.
   --! <Exceptions> Terminator_Error raised if Specfication_List can't have
   --!   NULL element.
   procedure Xt_App_Set_Fallback_Resources
    (App_Context        : in Xt_App_Context;
     Specification_List : in Xt_String_List);


   --  Additional procedural form. Raise Threads_Not_Supported_Error if
   --  initialization failed.
   procedure Xt_Toolkit_Thread_Initialize;


   ---------------------------------------------------------------------------
   --  Obsolete and deprecated stuff
   ---------------------------------------------------------------------------

   procedure Xt_App_Initialize
    (Widget_Return      :    out Widget;
     App_Context_Return :    out Xt_App_Context;
     Application_Class  : in     String;
     Options            : in     Xlib.Resource_Manager.Xrm_Option_Desc_List
       := Xlib.Resource_Manager.Null_Xrm_Option_Desc_List;
--     Argc_In_Out        : in out Argc_Type;
--     Argv_In_Out        : in out Argv_Type;
     Fallback_Resources : in     Xt.Xt_String_List := Xt.Null_Xt_String_List;
     Args               : in     Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List);


private

   pragma Import (C, Xt_Create_Application_Context,
                  "XtCreateApplicationContext");
   pragma Import (C, Xt_Toolkit_Initialize, "XtToolkitInitialize");
   pragma Import (C, Xt_Set_Language_Proc, "XtSetLanguageProc");

end Xt.Initializers;
