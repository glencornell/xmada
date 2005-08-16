with Interfaces.C;


package XmL is

--typedef struct
--        {
--        int reason;
--        XEvent *event;
--        int pos;
--        int allowActivate;
--        int layoutNeeded;
--        } XmLFolderCallbackStruct;
--
--#define XmCORNER_NONE 0
--#define XmCORNER_LINE 1
--#define XmCORNER_ARC  2
--
--#define XmFOLDER_TOP    0
--#define XmFOLDER_LEFT   1
--#define XmFOLDER_BOTTOM 2
--#define XmFOLDER_RIGHT  3
--
--#define XmRESIZE_STATIC  10
--#define XmRESIZE_DYNAMIC 11
--
--typedef struct _XmLGridDrawStruct
--        {
--        GC gc;
--        XRectangle *cellRect;
--        Dimension topMargin;
--        Dimension bottomMargin;
--        Dimension leftMargin;
--        Dimension rightMargin;
--        Pixel foreground;
--        Pixel background;
--        Pixel selectForeground;
--        Pixel selectBackground;
--        XmFontList fontList;
--        unsigned char alignment;
--        Boolean drawSelected;
--        int drawFocusType;
--        XmStringDirection stringDirection;
--        } XmLGridDrawStruct;
--
--typedef struct _XmLGridCallbackStruct
--        {
--        int reason;
--        XEvent *event;
--        unsigned char rowType, columnType;
--        int row, column;
--        XRectangle *clipRect;
--        XmLGridDrawStruct *drawInfo;
--        void *object;
--        } XmLGridCallbackStruct;
--
--#define XmCR_ADD_ROW         900
--#define XmCR_ADD_COLUMN      901
--#define XmCR_ADD_CELL        902
--#define XmCR_CELL_DRAW       903
--#define XmCR_CELL_DROP       904
--#define XmCR_CELL_FOCUS_IN   905
--#define XmCR_CELL_FOCUS_OUT  906
--#define XmCR_CELL_PASTE      907
--#define XmCR_CONF_TEXT       908
--#define XmCR_PREF_WIDTH      909
--#define XmCR_DELETE_ROW      910
--#define XmCR_DELETE_COLUMN   911
--#define XmCR_DELETE_CELL     912
--#define XmCR_EDIT_BEGIN      913
--#define XmCR_EDIT_INSERT     914
--#define XmCR_EDIT_CANCEL     915
--#define XmCR_EDIT_COMPLETE   916
--#define XmCR_FREE_VALUE      917
--#define XmCR_RESIZE_ROW      918
--#define XmCR_RESIZE_COLUMN   919
--#define XmCR_PREF_HEIGHT     920
--#define XmCR_SCROLL_ROW      921
--#define XmCR_SCROLL_COLUMN   922
--#define XmCR_SELECT_CELL     923
--#define XmCR_SELECT_COLUMN   924
--#define XmCR_SELECT_ROW      925
--#define XmCR_DESELECT_CELL   926
--#define XmCR_DESELECT_COLUMN 927
--#define XmCR_DESELECT_ROW    928
--#define XmCR_RESIZE_GRID     929
--#define XmCR_SHOW_POPUP      930
--#define XmCR_SINGLECLICK     931
--#define XmCR_ENTER_CELL      931
--#define XmCR_ENTER_GRID      932
--#define XmCR_LEAVE_CELL      933
--#define XmCR_LEAVE_GRID      934


   type Xm_Column_Type is (Xm_Content,
                           Xm_Heading,
                           Xm_Footer,
                           Xm_All_Types);
   --  Xm_Column_Type may be Xm_Invalid_Type (4) but not currently present

   type Xm_Cell_Type is (Xm_Icon_Cell,
                         Xm_Pixmap_Cell,
                         Xm_String_Cell);

   type Xm_Border_Type is (Xm_Border_None,
                           Xm_Border_Line,
                           Xm_Border_Dash);

--#define XmFORMAT_DELIMITED 1
--#define XmFORMAT_XL        2
--#define XmFORMAT_PAD       3
--#define XmFORMAT_PASTE     4
--#define XmFORMAT_DROP      5
--
--#define XmSELECT_NONE         1
--#define XmSELECT_SINGLE_ROW   2
--#define XmSELECT_BROWSE_ROW   3
--#define XmSELECT_MULTIPLE_ROW 4
--#define XmSELECT_CELL         5
--
--#define XmDRAW_FOCUS_NONE  1
--#define XmDRAW_FOCUS_CELL  2
--#define XmDRAW_FOCUS_LEFT  3
--#define XmDRAW_FOCUS_MID   4
--#define XmDRAW_FOCUS_RIGHT 5
--
--#define XmTRAVERSE_EXTEND_DOWN  20
--#define XmTRAVERSE_EXTEND_LEFT  21
--#define XmTRAVERSE_EXTEND_RIGHT 22
--#define XmTRAVERSE_EXTEND_UP    23
--#define XmTRAVERSE_PAGE_DOWN    24
--#define XmTRAVERSE_PAGE_LEFT    25
--#define XmTRAVERSE_PAGE_RIGHT   26
--#define XmTRAVERSE_PAGE_UP      27
--#define XmTRAVERSE_TO_BOTTOM    28
--#define XmTRAVERSE_TO_TOP       29
--
--#define XmALIGNMENT_LEFT         0
--#ifndef XmALIGNMENT_CENTER
--#define XmALIGNMENT_CENTER       1
--#endif
--#define XmALIGNMENT_RIGHT        2
--#define XmALIGNMENT_TOP_LEFT     3
--#define XmALIGNMENT_TOP          4
--#define XmALIGNMENT_TOP_RIGHT    5
--#define XmALIGNMENT_BOTTOM_LEFT  6
--#define XmALIGNMENT_BOTTOM       7
--#define XmALIGNMENT_BOTTOM_RIGHT 8
--
--#define XmMETER_BAR 0
--#define XmMETER_BOXES 1
--
--typedef struct
--        {
--        int level;
--        Boolean expands;
--        Boolean isExpanded;
--        Pixmap pixmap, pixmask;
--        XmString string;
--        } XmLTreeRowDefinition;
--
--#define XmCR_COLLAPSE_ROW 950
--#define XmCR_EXPAND_ROW   951
--
--#define XmDRAWNB_ARROW       0
--#define XmDRAWNB_ARROWLINE   1
--#define XmDRAWNB_DOUBLEARROW 2
--#define XmDRAWNB_SQUARE      3
--#define XmDRAWNB_DOUBLEBAR   4
--#define XmDRAWNB_STRING      5
--#define XmDRAWNB_SMALLARROW  6
--
--#define XmDRAWNB_RIGHT 0
--#define XmDRAWNB_LEFT  1
--#define XmDRAWNB_UP    2
--#define XmDRAWNB_DOWN  3
--
--#define XmSTRING_RIGHT 0
--#define XmSTRING_LEFT  1
--#define XmSTRING_UP    2
--#define XmSTRING_DOWN  3
--
--enum { XmLRectInside, XmLRectOutside, XmLRectPartial };
--
--typedef struct
--        {
--        int pos;
--        } XmLArrayItem;
--
--typedef struct _XmLArrayRec *XmLArray;
--
--typedef struct
--        {
--        char *name;
--        unsigned char value;
--        } XmLStringToUCharMap;


private

   pragma Convention (C, Xm_Border_Type);
   for Xm_Border_Type'Size use Interfaces.C.unsigned_char'Size;
   for Xm_Border_Type use (Xm_Border_None => 0,
                           Xm_Border_Line => 1,
                           Xm_Border_Dash => 2);

   pragma Convention (C, Xm_Cell_Type);
   for Xm_Cell_Type'Size use Interfaces.C.unsigned_char'Size;
   for Xm_Cell_Type use (Xm_Icon_Cell   => 0,
                         Xm_Pixmap_Cell => 1,
                         Xm_String_Cell => 2);

   pragma Convention (C, Xm_Column_Type);
   for Xm_Column_Type'Size use Interfaces.C.unsigned_char'Size;
   for Xm_Column_Type use (Xm_Content   => 0,
                           Xm_Heading   => 1,
                           Xm_Footer    => 2,
                           Xm_All_Types => 3);
--                         Xm_Invalid_Type => 4);

end XmL;
