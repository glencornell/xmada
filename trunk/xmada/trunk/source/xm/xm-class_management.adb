with Xt;                       use Xt;
with Xt.Class_Management;      use Xt.Class_Management;

with Xm_Arrow_Button;          use Xm_Arrow_Button;
with Xm_Arrow_Button_Gadget;   use Xm_Arrow_Button_Gadget;
with Xm_Bulletin_Board;        use Xm_Bulletin_Board;
with Xm_Cascade_Button;        use Xm_Cascade_Button;
with Xm_Cascade_Button_Gadget; use Xm_Cascade_Button_Gadget;
with Xm_Combo_Box;             use Xm_Combo_Box;
with Xm_Command;               use Xm_Command;
with Xm_Container;             use Xm_Container;
with Xm_Dialog_Shell;          use Xm_Dialog_Shell;
with Xm_Display;               use Xm_Display;
with Xm_Drag_Context;          use Xm_Drag_Context;
with Xm_Drag_Icon;             use Xm_Drag_Icon;
with Xm_Drawing_Area;          use Xm_Drawing_Area;
with Xm_Drawn_Button;          use Xm_Drawn_Button;
--with Xm_Drop_Site_Manager;
with Xm_Drop_Transfer;         use Xm_Drop_Transfer;
with Xm_File_Selection_Box;    use Xm_File_Selection_Box;
with Xm_Form;                  use Xm_Form;
with Xm_Frame;                 use Xm_Frame;
with Xm_Gadget;                use Xm_Gadget;
--with Xm_Grab_Shell;            use Xm_Grab_Shell;
with Xm_Icon_Gadget;           use Xm_Icon_Gadget;
with Xm_Label;                 use Xm_Label;
with Xm_Label_Gadget;          use Xm_Label_Gadget;
with Xm_List;                  use Xm_List;
with Xm_Main_Window;           use Xm_Main_Window;
with Xm_Manager;               use Xm_Manager;
with Xm_Menu_Shell;            use Xm_Menu_Shell;
with Xm_Message_Box;           use Xm_Message_Box;
with Xm_Notebook;              use Xm_Notebook;
with Xm_Paned_Window;          use Xm_Paned_Window;
with Xm_Primitive;             use Xm_Primitive;
with Xm_Print_Shell;           use Xm_Print_Shell;
with Xm_Push_Button;           use Xm_Push_Button;
with Xm_Push_Button_Gadget;    use Xm_Push_Button_Gadget;
with Xm_Row_Column;            use Xm_Row_Column;
with Xm_Scale;                 use Xm_Scale;
with Xm_Screen;                use Xm_Screen;
with Xm_Scroll_Bar;            use Xm_Scroll_Bar;
with Xm_Scrolled_Window;       use Xm_Scrolled_Window;
with Xm_Selection_Box;         use Xm_Selection_Box;
with Xm_Separator;             use Xm_Separator;
with Xm_Separator_Gadget;      use Xm_Separator_Gadget;
with Xm_Text;                  use Xm_Text;
with Xm_Text_Field;            use Xm_Text_Field;
with Xm_Toggle_Button;         use Xm_Toggle_Button;
with Xm_Toggle_Button_Gadget;  use Xm_Toggle_Button_Gadget;


package body Xm.Class_Management is


   function Xm_Is_Arrow_Button (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Arrow_Button_Widget_Class);
   end Xm_Is_Arrow_Button;


   function Xm_Is_Arrow_Button_Gadget (The_Widget : in Widget)
     return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Arrow_Button_Gadget_Class);
   end Xm_Is_Arrow_Button_Gadget;


   function Xm_Is_Bulletin_Board (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Bulletin_Board_Widget_Class);
   end Xm_Is_Bulletin_Board;


   function Xm_Is_Cascade_Button (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Cascade_Button_Widget_Class);
   end Xm_Is_Cascade_Button;


   function Xm_Is_Cascade_Button_Gadget (The_Widget : in Widget)
     return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Cascade_Button_Gadget_Class);
   end Xm_Is_Cascade_Button_Gadget;


   function Xm_Is_Combo_Box (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Combo_Box_Widget_Class);
   end Xm_Is_Combo_Box;

   function Xm_Is_Command (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Command_Widget_Class);
   end Xm_Is_Command;

   function Xm_Is_Container (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Container_Widget_Class);
   end Xm_Is_Container;


   function Xm_Is_Dialog_Shell (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Dialog_Shell_Widget_Class);
   end Xm_Is_Dialog_Shell;


   function Xm_Is_Display (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Display_Class);
   end Xm_Is_Display;


   function Xm_Is_Drag_Context (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Drag_Context_Class);
   end Xm_Is_Drag_Context;


   function Xm_Is_Drag_Icon_Object_Class (The_Widget : in Widget)
     return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Drag_Icon_Object_Class);
   end Xm_Is_Drag_Icon_Object_Class;


   function Xm_Is_Drawing_Area (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Drawing_Area_Widget_Class);
   end Xm_Is_Drawing_Area;


   function Xm_Is_Drawn_Button (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Drawn_Button_Widget_Class);
   end Xm_Is_Drawn_Button;


--   function Xm_Is_Drop_Site_Manager (The_Widget : in Widget) return Boolean is
--   begin
--      return Xt_Is_Subclass (The_Widget, Xm_Drop_Site_Manager_Object_Class);
--   end Xm_Is_Drop_Site_Manager;


   function Xm_Is_Drop_Transfer (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Drop_Transfer_Object_Class);
   end Xm_Is_Drop_Transfer;


   function Xm_Is_File_Selection_Box (The_Widget : in Widget)
     return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_File_Selection_Box_Widget_Class);
   end Xm_Is_File_Selection_Box;


   function Xm_Is_Form (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Form_Widget_Class);
   end Xm_Is_Form;


   function Xm_Is_Frame (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Frame_Widget_Class);
   end Xm_Is_Frame;


   function Xm_Is_Gadget (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Gadget_Class);
   end Xm_Is_Gadget;


--   function Xm_Is_Grab_Shell (The_Widget : in Widget) return Boolean is
--   begin
--      return Xt_Is_Subclass (The_Widget, Xm_Grab_Shell_Widget_Class);
--   end Xm_Is_Grab_Shell;


   function Xm_Is_Icon_Gadget (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Icon_Gadget_Class);
   end Xm_Is_Icon_Gadget;


----   что это?
----   function Xm_Is_Icon_Header (The_Widget : in Widget) return Boolean is


   function Xm_Is_Label (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Label_Widget_Class);
   end Xm_Is_Label;


   function Xm_Is_Label_Gadget (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Label_Gadget_Class);
   end Xm_Is_Label_Gadget;


   function Xm_Is_List (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_List_Widget_Class);
   end Xm_Is_List;


   function Xm_Is_Main_Window (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Main_Window_Widget_Class);
   end Xm_Is_Main_Window;


   function Xm_Is_Manager (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Manager_Widget_Class);
   end Xm_Is_Manager;


   function Xm_Is_Menu_Shell (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Menu_Shell_Widget_Class);
   end Xm_Is_Menu_Shell;


   function Xm_Is_Message_Box (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Message_Box_Widget_Class);
   end Xm_Is_Message_Box;


   function Xm_Is_Notebook (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Notebook_Widget_Class);
   end Xm_Is_Notebook;


   function Xm_Is_Paned_Window (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Paned_Window_Widget_Class);
   end Xm_Is_Paned_Window;


   function Xm_Is_Primitive (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Primitive_Widget_Class);
   end Xm_Is_Primitive;


   function Xm_Is_Print_Shell (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Print_Shell_Widget_Class);
   end Xm_Is_Print_Shell;


   function Xm_Is_Push_Button (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Push_Button_Widget_Class);
   end Xm_Is_Push_Button;


   function Xm_Is_Push_Button_Gadget (The_Widget : in Widget)
     return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Push_Button_Gadget_Class);
   end Xm_Is_Push_Button_Gadget;


   function Xm_Is_Row_Column (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Row_Column_Widget_Class);
   end Xm_Is_Row_Column;


   function Xm_Is_Scale (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Scale_Widget_Class);
   end Xm_Is_Scale;


   function Xm_Is_Screen (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Screen_Class);
   end Xm_Is_Screen;


   function Xm_Is_Scroll_Bar (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Scroll_Bar_Widget_Class);
   end Xm_Is_Scroll_Bar;


   function Xm_Is_Scrolled_Window (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Scrolled_Window_Widget_Class);
   end Xm_Is_Scrolled_Window;


   function Xm_Is_Selection_Box (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Selection_Box_Widget_Class);
   end Xm_Is_Selection_Box;


   function Xm_Is_Separator (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Separator_Widget_Class);
   end Xm_Is_Separator;


   function Xm_Is_Separator_Gadget (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Separator_Gadget_Class);
   end Xm_Is_Separator_Gadget;


   function Xm_Is_Text (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Text_Widget_Class);
   end Xm_Is_Text;


   function Xm_Is_Text_Field (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Text_Field_Widget_Class);
   end Xm_Is_Text_Field;


   function Xm_Is_Toggle_Button (The_Widget : in Widget) return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Toggle_Button_Widget_Class);
   end Xm_Is_Toggle_Button;


   function Xm_Is_Toggle_Button_Gadget (The_Widget : in Widget)
     return Boolean is
   begin
      return Xt_Is_Subclass (The_Widget, Xm_Toggle_Button_Gadget_Class);
   end Xm_Is_Toggle_Button_Gadget;


   function Xm_Is_Vendor_Shell (The_Widget : in Widget) return Boolean
     renames Xt_Is_Vendor_Shell;


end Xm.Class_Management;
