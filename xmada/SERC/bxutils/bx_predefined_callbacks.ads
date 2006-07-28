with X_Lib;
with X_Event_Utilities;
with Xt;

package Bx_Predefined_Callbacks is

    type Xt_Boolean_Ptr is access Xt.Xt_Ancillary_Types.Xt_Boolean;

    --
    -- Function Name: Menu_Post
    --
    -- Description: This function is called to popup a popup menu
    --              It is added as an event handler.
    -- Arguments: Widget           p:          the activating widget
    --            Widget           mw:         the menu to popup
    --            X_Crossing_Event ev:        the activating event
    --            Xt_Boolean_Ptr   dispatch:  whether to call the remaining event
    --                                        handlers for this event (unused)
    procedure Menu_Post
        (W        : Xt.Widget;
         Mw       : Xt.Widget;
         Ev       : X_Event_Utilities.X_Crossing_Event;
         Dispatch : Xt_Boolean_Ptr);

    --
    -- Function Name: Bx_Destroy_CB
    --
    -- Description: This function accepts a string of the form:
    --              "(WL)[widgetName, widgetName, ...]"
    -- 	            It tries to convert the widget names to Widget IDs and
    -- 	            then destroy the specified widget.
    --
    -- Arguments: Widget      w:      the activating widget.
    --            String      client: the widget list to destroy.
    --            Xt_Pointer  call:   the call data (unused).
    --
    -- Notes:     * This function expects that there is an application
    --              shell from which all other widgets are descended.
    --
    procedure Bx_Destroy_CB
        (W      : Xt.Widget;
         Client : Xt.Xt_Pointer;
         Call   : Xt.Xt_Pointer );
    --
    -- Function Name: Bx_Exit_CB
    --
    -- Description: This functions expects an integer to be passed in
    --              client data.  It calls the exit() system call with
    --              the integer value as the argument to the function.
    --
    -- Arguments: Widget     w:      the activating widget.
    --            X_Integer  client: the integer exit value.
    --            Xt_Pointer call:   the call data (unused).
    --
    procedure Bx_Exit_CB
        (W      : Xt.Widget;
         Client : X_Lib.X_Integer;
         Call   : Xt.Xt_Pointer );

    -- Function Name: Bx_Manage_CB
    --
    -- Description: Given a string of the form:
    --              "(WL)[widgetName, widgetName, ...]"
    --              Bx_Manage_CB attempts to convert the name to a Widget
    -- 	            ID and manage the widget.
    --
    -- Arguments: Widget     w:      the widget activating the callback.
    -- 	       	  String     client: the list of widget names to attempt
    --                               to find and manage.
    -- 	       	  Xt_Pointer call:   the call data (unused).
    --
    -- Notes: * This function expects that there is an application
    --          shell from which all other widgets are descended.
    --
    procedure Bx_Manage_CB
        (W      : Xt.Widget;
         Client : Xt.Xt_Pointer;
         Call   : Xt.Xt_Pointer );

    --
    -- Function Name: Bx_Map_CB
    --
    -- Description: Given a string of the form:
    --	            "(WL)[widgetName, widgetName, ...]"
    --              Bx_Map_CB attempts to convert the name to a Widget
    --              ID and map the widget.
    --
    -- Arguments: Widget     w:      the widget activating the callback.
    --            String     client: the list of widget names to attempt
    --                               to find and map.
    --            Xt_Pointer call:   the call data (unused).
    --
    -- Notes: * This function expects that there is an application
    --          shell from which all other widgets are descended.
    --        * Bx_Map_CB can only work on Widget objects.  It will not
    --          work on Gadget objects.  This is because mapping can
    --          only be done to a windowed object.  Gadgets do not
    --          have a window and thus cannot be mapped.  A check is
    --          made using XtIsWidget() and an appropriate error is
    --          output if the passed object is not a Widget.
    --
    procedure Bx_Map_CB
        (W      : Xt.Widget;
         Client : Xt.Xt_Pointer;
         Call   : Xt.Xt_Pointer );

    --
    -- Function Name: Bx_Popdown_CB
    --
    -- Description: This function accepts a string of the form:
    --              "(WL)[widgetName, widgetName, ...]"
    --              It attempts to convert the widget names to Widget IDs
    --              and then popdown the widgets WITHOUT any grab.
    --
    -- Arguments: Widget     w:      the activating widget.
    --		  String     client: the string of widget names to
    --                               popup.
    --            Xt_Pointer call:   the call data (unused).
    --
    -- Notes: * This function expects that there is an application
    --          shell from which all other widgets are descended.
    --        * Bx_Popdown_CB can only work on Shell widgets.  It will
    --          not work on other object types.  This is because
    --          popping down can only be done to a shell.  A check
    --          is made using XtIsShell() and an appropriate error
    --          is output if the passed object is not a Shell.
    --
    procedure Bx_Popdown_CB
        (W      : Xt.Widget;
         Client : Xt.Xt_Pointer;
         Call   : Xt.Xt_Pointer );

    --
    -- Function Name: Bx_Popup_CB
    -- 
    -- Description: This function accepts a string of the form:
    -- 	            "(WL)[widgetName, widgetName, ...]"
    -- 	            It attempts to convert the widget names to Widget IDs
    --              and then popup the widgets WITHOUT any grab.
    -- 
    -- Arguments: Widget     w:      the activating widget.
    --            String     client: the string of widget names to
    --                               popup.
    -- 	          Xt_Pointer call:   the call data (unused).
    -- 
    -- Notes: * This function expects that there is an application
    --          shell from which all other widgets are descended.
    -- 	      * Bx_Popup_CB can only work on Shell widgets.  It will not
    --          work on other object types.  This is because popping up
    --          can only be done to a shell.  A check is made using
    --          XtIsShell() and an appropriate error is output if the
    --          passed object is not a Shell.
    --
    procedure Bx_Popup_CB
        (W      : Xt.Widget;
         Client : Xt.Xt_Pointer;
         Call   : Xt.Xt_Pointer );

    --
    -- Function Name: Bx_Set_Insensitive_CB
    -- 
    -- Description: This function accepts a string of the form:
    --              "(WL)[widgetName, widgetName, ...]"
    --              It attempts to convert the widget names to Widget IDs
    --              and then set the widget insensitive.
    --
    -- Arguments: Widget     w:      the activating widget.
    --            String     client: the list of widget names.
    --            Xt_Pointer call:   the call data (unused).
    --
    -- Notes: * This function expects that there is an application
    --          shell from which all other widgets are descended.
    --        * Bx_Set_Insensitive_CB expects the application shell to
    --          be AppShell as defined as a global value as in the
    --          default main-{c, uil}.c generated by the
    --          Builder Xcessory.
    --
    procedure Bx_Set_Insensitive_CB
        (W      : Xt.Widget;
         Client : Xt.Xt_Pointer;
         Call   : Xt.Xt_Pointer );

    --
    -- Function Name: Bx_Set_Sensitive_CB
    -- 
    -- Description: This function accepts a string of the form:
    --              "(WL)[widgetName, widgetName, ...]"
    --              It attempts to convert the widget names to Widget IDs
    --              and then set the widget sensitive.
    --
    -- Arguments: Widget     w:      the activating widget.
    --            String     client: the list of widget names.
    --            Xt_Pointer call:   the call data (unused).
    --
    -- Notes: * This function expects that there is an application
    --          shell from which all other widgets are descended.
    --        * Bx_Set_Sensitive_CB expects the application shell to
    --          be AppShell as defined as a global value as in the
    --          default main-{c, uil}.c generated by the
    --          Builder Xcessory.
    --
    procedure Bx_Set_Sensitive_CB
        (W      : Xt.Widget;
         Client : Xt.Xt_Pointer;
         Call   : Xt.Xt_Pointer );

    --
    -- Function Name: Bx_Set_Values_CB
    -- 
    -- Description: This function accepts a string of the form:
    --              "widgetName.resourceName = value\n..."
    --              It then attempts to convert the widget name to a widget
    --              ID and the value to a valid resource value.  It then
    --              sets the value on the given widget.
    --
    -- Arguments: Widget     w:      the activating widget.
    --            String     client: the set values string.
    --            Xt_Pointer call:   the call data (unused).
    --
    -- Notes: * This function expects that there is an application
    --          shell from which all other widgets are descended.
    --
    procedure Bx_Set_Values_CB
        (W      : Xt.Widget;
         Client : Xt.Xt_Pointer;
         Call   : Xt.Xt_Pointer );

    --
    -- Function Name: Bx_System_CB
    -- 
    -- Description: This function accepts a string (passed through
    --              the client_data) and passes it to the system()
    --              system call.
    --
    -- Arguments: Widget     w:      the activating widget.
    --            String     client: the string to pass to the
    --                               system() system call.
    --            Xt_Pointer call:   the call data (unused).
    --
    procedure Bx_System_CB
        (W      : Xt.Widget;
         Client : Xt.Xt_Pointer;
         Call   : Xt.Xt_Pointer );

    --
    -- Function Name: Bx_Unmanage_CB
    -- 
    -- Description: Given a string of the form:
    --              "(WL)[widgetName, widgetName, ...]"
    --              Bx_Unmanage_CB attempts to convert the name to a Widget
    --              ID and unmanage the widget.
    --              
    --
    -- Arguments: Widget     w:      the activating widget.
    --            String     client: the list of widget names to attempt
    --                               to find and unmanage.
    --            Xt_Pointer call:   the call data (unused).
    --
    -- Notes: * This function expects that there is an application
    --          shell from which all other widgets are descended.
    --
    procedure Bx_Unmanage_CB
        (W      : Xt.Widget;
         Client : Xt.Xt_Pointer;
         Call   : Xt.Xt_Pointer );

    --
    -- Function Name: Bx_Unmap_CB
    -- 
    -- Description: Given a string of the form:
    --              "(WL)[widgetName, widgetName, ...]"
    --              Bx_Unmap_CB attempts to convert the name to a Widget
    --              ID and unmanage the widget.
    --              
    --
    -- Arguments: Widget     w:      the activating widget.
    --            String     client: the list of widget names to attempt
    --                               to find and unmap.
    --            Xt_Pointer call:   the call data (unused).
    --
    -- Notes: * This function expects that there is an application
    --          shell from which all other widgets are descended.
    --        * Bx_Unmap_CB can only work on Widget objects.  It will not
    --          work on Gadget objects.  This is because unmapping can
    --          only be done to a windowed object.  Gadgets do not
    --          have a window and thus cannot be unmapped.  A check is
    --          made using XtIsWidget() and an appropriate error is
    --          output if the passed object is not a Widget.
    --
    --
    procedure Bx_Unmap_CB
        (W      : Xt.Widget;
         Client : Xt.Xt_Pointer;
         Call   : Xt.Xt_Pointer );

end Bx_Predefined_Callbacks;
