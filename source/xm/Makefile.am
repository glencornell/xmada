
include $(top_srcdir)/Makefile.common

ADAFLAGS = $(STD_ADAFLAGS) \
	-I$(srcdir)/../xlib \
	-I$(srcdir)/../xlib/extensions \
	-I$(srcdir)/../xlib/extensions/print \
	-I$(srcdir)/../xt

ADA_SPECS_WITH_BODY = \
	i-cwistr.ads \
	xm.ads \
	xm_arrow_button.ads \
	xm_arrow_button_gadget.ads \
	xm_bulletin_board.ads \
	xm_cascade_button.ads \
	xm_cascade_button_gadget.ads \
	xm-class_management.ads \
	xm-clipboard_management.ads \
	xm_combo_box.ads \
	xm_command.ads \
	xm_container.ads \
	xm_dialog_shell.ads \
	xm_drawing_area.ads \
	xm_drawn_button.ads \
	xm_file_selection_box.ads \
	xm_form.ads \
	xm_frame.ads \
	xm_icon_gadget.ads \
	xm-implementation.ads \
	xm-input_management.ads \
	xm-internal.ads \
	xm_label.ads \
	xm_label_gadget.ads \
	xm_list.ads \
	xm_main_window.ads \
	xm-menu_management.ads \
	xm_menu_shell.ads \
	xm_message_box.ads \
	xm_notebook.ads \
	xm_paned_window.ads \
	xm-print_management.ads \
	xm-protocol_management.ads \
	xm_push_button.ads \
	xm_push_button_gadget.ads \
	xm-render_tables.ads \
	xm-representation_type_management.ads \
	xm-resource_management.ads \
	xm_row_column.ads \
	xm_scale.ads \
	xm_scroll_bar.ads \
	xm_scrolled_window.ads \
	xm_selection_box.ads \
	xm_separator.ads \
	xm_separator_gadget.ads \
	xm_simple_spin_box.ads \
	xm_spin_box.ads \
	xm-strings.ads \
	xm_text.ads \
	xm_text_field.ads \
	xm_toggle_button.ads \
	xm_toggle_button_gadget.ads \
	xm-traversal_management.ads \
	xm-utilities.ads

ADA_SPECS_WITHOUT_BODY = \
	xm_display.ads \
	xm_drag_context.ads \
	xm_drag_icon.ads \
	xm_drop_transfer.ads \
	xm_gadget.ads \
	xm_manager.ads \
	xm_primitive.ads \
	xm_print_shell.ads \
	xm_screen.ads \
	xm_string_defs.ads

ADA_SPECS = $(ADA_SPECS_WITH_BODY) $(ADA_SPECS_WITHOUT_BODY)
ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)
ADA_HDRS = $(ADA_SPECS) $(ADA_BODIES)
ADA_SRCS = $(ADA_SPECS_WITHOUT_BODY) $(ADA_BODIES)
ADA_ALIS = $(ADA_SPECS_WITHOUT_BODY:.ads=.ali) $(ADA_BODIES:.adb=.ali)

pkginclude_HEADERS = $(ADA_HDRS)
ali_DATA = $(ADA_ALIS)
lib_LTLIBRARIES = libxmadaxm.la

libxmadaxm_la_SOURCES = $(ADA_SRCS)
libxmadaxm_la_LDFLAGS = -no-undefined -version-info $(XMADAXMLIBVERSIONINFO)
libxmadaxm_la_LIBADD = \
	$(top_builddir)/source/xt/libxmadaxt.la \
	$(top_builddir)/source/xlib/extensions/print/libxmadaxlib-extensions-print.la

i-cwistr.lo: i-cwistr.adb
	@chmod a+x $(ADACOMPILER)
	$(LIBTOOL) --tag=CC --mode=compile $(ADACOMPILER) -c $(ADAFLAGS) $(GNAT_PG) $<

### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
xm-class_management.lo xm-class_management.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-class_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_application_shell.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_override_shell.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads \
	$(top_srcdir)/source/xt/xt_shell.ads \
	$(top_srcdir)/source/xt/xt_top_level_shell.ads \
	$(top_srcdir)/source/xt/xt_vendor_shell.ads \
	$(top_srcdir)/source/xt/xt_wm_shell.ads
xm-clipboard_management.lo xm-clipboard_management.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads
xm-implementation.lo xm-implementation.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads
xm-input_management.lo xm-input_management.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads
xm-internal.lo xm-internal.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads
xm-menu_management.lo xm-menu_management.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-cursors.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads
xm-print_management.lo xm-print_management.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads
xm-protocol_management.lo xm-protocol_management.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-graphic_output.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt-utilities.ads \
	$(top_srcdir)/source/xt/xt.ads
xm-render_tables.lo xm-render_tables.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.adb \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads
xm-representation_type_management.lo xm-representation_type_management.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.adb \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads
xm-resource_management.lo xm-resource_management.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.adb \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads
xm-strings.lo xm-strings.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt.ads
xm-traversal_management.lo xm-traversal_management.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads
xm-utilities.lo xm-utilities.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-colors.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads
xm.lo xm.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.adb \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads
xm_arrow_button.lo xm_arrow_button.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_arrow_button_gadget.lo xm_arrow_button_gadget.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads
xm_bulletin_board.lo xm_bulletin_board.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_cascade_button.lo xm_cascade_button.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_cascade_button_gadget.lo xm_cascade_button_gadget.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads
xm_combo_box.lo xm_combo_box.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_command.lo xm_command.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_container.lo xm_container.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_dialog_shell.lo xm_dialog_shell.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_shell.ads \
	$(top_srcdir)/source/xt/xt_vendor_shell.ads \
	$(top_srcdir)/source/xt/xt_wm_shell.ads
xm_display.lo xm_display.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_application_shell.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_shell.ads \
	$(top_srcdir)/source/xt/xt_top_level_shell.ads \
	$(top_srcdir)/source/xt/xt_vendor_shell.ads \
	$(top_srcdir)/source/xt/xt_wm_shell.ads
xm_drag_context.lo xm_drag_context.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_drag_icon.lo xm_drag_icon.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_object.ads
xm_drawing_area.lo xm_drawing_area.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_drawn_button.lo xm_drawn_button.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_drop_transfer.lo xm_drop_transfer.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_object.ads
xm_file_selection_box.lo xm_file_selection_box.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_form.lo xm_form.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_frame.lo xm_frame.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_gadget.lo xm_gadget.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads
xm_icon_gadget.lo xm_icon_gadget.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads
xm_label.lo xm_label.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_label_gadget.lo xm_label_gadget.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads
xm_list.lo xm_list.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_main_window.lo xm_main_window.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_manager.lo xm_manager.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_menu_shell.lo xm_menu_shell.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_override_shell.ads \
	$(top_srcdir)/source/xt/xt_shell.ads
xm_message_box.lo xm_message_box.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_notebook.lo xm_notebook.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_paned_window.lo xm_paned_window.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_primitive.lo xm_primitive.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_print_shell.lo xm_print_shell.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_application_shell.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_shell.ads \
	$(top_srcdir)/source/xt/xt_top_level_shell.ads \
	$(top_srcdir)/source/xt/xt_vendor_shell.ads \
	$(top_srcdir)/source/xt/xt_wm_shell.ads
xm_push_button.lo xm_push_button.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_push_button_gadget.lo xm_push_button_gadget.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads
xm_row_column.lo xm_row_column.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_scale.lo xm_scale.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_screen.lo xm_screen.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_scroll_bar.lo xm_scroll_bar.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_scrolled_window.lo xm_scrolled_window.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_selection_box.lo xm_selection_box.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_separator.lo xm_separator.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_separator_gadget.lo xm_separator_gadget.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads
xm_simple_spin_box.lo xm_simple_spin_box.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_spin_box.lo xm_spin_box.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_string_defs.lo xm_string_defs.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_string_defs.ads
xm_text.lo xm_text.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_text_field.lo xm_text_field.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_toggle_button.lo xm_toggle_button.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xm_toggle_button_gadget.lo xm_toggle_button_gadget.o: \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-implementation.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads
