with Xt;
with Xt.Ancillary_Types;


package Xm.Render_Tables is

   type String_Access is access all String;

   subtype Xm_Rendition_Merge_Mode is Xm_Merge_Mode
     range Xm_Skip .. Xm_Merge_New;


   function Xm_Render_Table_Add_Renditions
    (Render_Table : in Xm_Render_Table;
     Renditions   : in Xm_Rendition_List;
     Merge_Mode   : in Xm_Rendition_Merge_Mode)
       return Xm_Render_Table;


   function Xm_Render_Table_Copy
    (Render_Table : in Xm_Render_Table;
     Tags         : in Xm_String_Tag_List)
       return Xm_Render_Table;


   procedure Xm_Render_Table_Free (Render_Table : in Xm_Render_Table);


   function Xm_Render_Table_Get_Rendition (Render_Table : in Xm_Render_Table;
                                           Tag          : in Xm_String_Tag)
     return Xm_Rendition;


   function Xm_Render_Table_Get_Renditions
    (Render_Table : in Xm_Render_Table;
     Tags         : in Xm_String_Tag_List)
       return Xm_Rendition_List;


   procedure Xm_Render_Table_Get_Tags
    (Render_Table : in     Xm_Render_Table;
     Tag_List     :    out Xm_String_Tag_List_Access);


   --  Additional functional form.
   function Xm_Render_Table_Get_Tags (Render_Table : in Xm_Render_Table)
     return Xm_String_Tag_List;


   function Xm_Render_Table_Remove_Renditions
    (Render_Table : in Xm_Render_Table;
     Tags         : in Xm_String_Tag_List)
       return Xm_Render_Table;


   --  Additional storage free subprogram.
   procedure Xm_Rendition_List_Free (Item : in Xm_Rendition_List);


   --  Additional storage free subprogram.
   procedure Xm_String_Tag_List_Free (Item : in Xm_String_Tag_List);


   --  Additional storage free subprogram.
   procedure Xm_String_Tag_List_Access_Free
    (Item : in out Xm_String_Tag_List_Access);


   function Xm_Render_Table_Cvt_From_Prop (The_Widget : in Xt.Widget;
                                           Property   : in String)
     return Xm_Render_Table;


   procedure Xm_Render_Table_Cvt_To_Prop
    (The_Widget   : in     Xt.Widget;
     Render_Table : in     Xm_Render_Table;
     Property     :    out String_Access);

   --  Additional functional form.
   function Xm_Render_Table_Cvt_To_Prop (The_Widget   : in Xt.Widget;
                                         Render_Table : in Xm_Render_Table)
     return String;


   function Xm_Rendition_Create (The_Widget : in Xt.Widget;
                                 Tag        : in Xm_String_Tag;
                                 Arg_List   : in Xt.Ancillary_Types.Xt_Arg_List
                                   := Xt.Ancillary_Types.Null_Xt_Arg_List)
     return Xm_Rendition;


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Проверку Rendition на нуль значение производит
   --! Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Rendition_Free (Rendition : in Xm_Rendition);


   procedure Xm_Rendition_Retrieve
    (Rendition : in Xm_Rendition;
     Arg_List  : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List);


   procedure Xm_Rendition_Update
    (Rendition : in Xm_Rendition;
     Arg_List  : in Xt.Ancillary_Types.Xt_Arg_List
       := Xt.Ancillary_Types.Null_Xt_Arg_List);


   --  Two additional parameters (alignment and decimal) currently not used.
   --!    <Exceptions> Constraint_Error raised when Value < 0.
   function Xm_Tab_Create (Value        : in Float;
                           Units        : in Xm_Unit_Type;
                           Offset_Model : in Xm_Offset_Model)
     return Xm_Tab;


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Проверку Tab на нуль значение производит
   --! Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Tab_Free (Tab : in Xm_Tab);


   ---------------------------------------------------------------------------
   --!    <ImplementationNotes> Проверку Tab_List на нуль значение производит
   --! Xm.
   ---------------------------------------------------------------------------
   procedure Xm_Tab_List_Free (Tab_List : in Xm_Tab_List);


   --  Add-ons

   function Xm_Render_Table_Add_Rendition
    (Render_Table : in Xm_Render_Table;
     Rendition    : in Xm_Rendition;
     Merge_Mode   : in Xm_Rendition_Merge_Mode)
       return Xm_Render_Table;


private

   pragma Import (C, Xm_Rendition_Free, "XmRenditionFree");
   pragma Import (C, Xm_Tab_Free, "XmTabFree");
   pragma Import (C, Xm_Tab_List_Free, "XmTabListFree");

end Xm.Render_Tables;
