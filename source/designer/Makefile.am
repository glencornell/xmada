
include $(top_srcdir)/Makefile.common

ADAFLAGS = $(STD_ADAFLAGS) \
	-I$(srcdir) \
	-I$(srcdir)/debug \
	-I$(srcdir)/microline \
	-I$(top_srcdir)/source/xlib \
	-I$(top_builddir)/source/xlib \
	-I$(top_srcdir)/source/xlib/extensions \
	-I$(top_builddir)/source/xlib/extensions \
	-I$(top_srcdir)/source/xlib/extensions/print \
	-I$(top_builddir)/source/xlib/extensions/print \
	-I$(top_srcdir)/source/xt \
	-I$(top_builddir)/source/xt \
	-I$(top_srcdir)/source/xm \
	-I$(top_builddir)/source/xm \
	-I$(top_srcdir)/source/xml \
	-I$(top_builddir)/source/xml

COMPILER_ADA_SPECS_WITH_BODY = \
	compiler-driver.ads \
	generator-application_resources.ads \
	generator-prototype-component_class.ads \
	model-initialization-xm_ada.ads \
	model-initialization.ads \
	model-names.ads \
	model-queries.ads \
	model-strings.ads \
	model-tools.ads \
	model-tree-constructors.ads \
	model-tree-lists.ads \
	model-tree-xm_ada.ads \
	model-tree.ads \
	model-utilities.ads \
	model-widget_instances_ordering.ads \
	xml_tools-attributes.ads \
	xml_tools-elements.ads \
	xml_tools-implementation.ads \
	xml_tools-names.ads \
	xml_tools-parser.ads \
	xml_tools-printer.ads \
	xml_tools-strings.ads

COMPILER_ADA_SPECS_WITHOUT_BODY = \
	compiler.ads \
	generator-prototype.ads \
	generator.ads \
	model-allocations.ads \
	model-xt_motif.ads \
	model.ads \
	xml_tools-allocation.ads \
	xml_tools.ads

DESIGNER_ADA_SPECS_WITH_BODY = \
	debug/designer-main_window-traceback.ads \
	debug/designer-operations-debug.ads \
	debug/model-debug-designer.ads \
	debug/model-debug.ads \
	debug/model-names-debug.ads \
	debug/model-strings-debug.ads \
	debug/model-tree-debug.ads \
	designer-driver.ads \
	designer-main_window.ads \
	designer-model_utilities.ads \
	designer-operations.ads \
	designer-palette.ads \
	designer-properties_editor-application.ads \
	designer-properties_editor-component_class.ads \
	designer-properties_editor-renditions_editor.ads \
	designer-properties_editor-widget_instance.ads \
	designer-properties_editor.ads \
	designer-rtl_consistency.ads \
	designer-setup.ads \
	designer-tree_editor.ads \
	designer-utilities.ads \
	designer-visual_editor.ads \
	generator-application_resources.ads \
	generator-prototype-component_class.ads \
	microline/designer-visual_editor-microline.ads \
	microline/model-initialization-designer-microline.ads \
	microline/model-initialization-microline.ads \
	microline/model-initialization-xm_ada-microline.ads \
	model-initialization-designer.ads \
	model-initialization-xm_ada.ads \
	model-initialization.ads \
	model-names.ads \
	model-queries.ads \
	model-strings.ads \
	model-tools.ads \
	model-tree-constructors.ads \
	model-tree-designer.ads \
	model-tree-e_lists.ads \
	model-tree-lists.ads \
	model-tree-xm_ada.ads \
	model-tree.ads \
	model-utilities.ads \
	model-widget_instances_ordering.ads \
	xml_tools-attributes.ads \
	xml_tools-elements.ads \
	xml_tools-implementation.ads \
	xml_tools-names.ads \
	xml_tools-parser.ads \
	xml_tools-printer.ads \
	xml_tools-strings.ads

DESIGNER_ADA_SPECS_WITHOUT_BODY = \
	designer.ads \
	generator-prototype.ads \
	generator.ads \
	microline/model-microline.ads \
	model-allocations.ads \
	model-xt_motif.ads \
	model.ads \
	xml_tools-allocation.ads \
	xml_tools.ads

vpath %.ads $(srcdir)/debug $(srcdir)/microline
vpath %.adb $(srcdir)/debug $(srcdir)/microline

COMPILER_ADA_SPECS = $(COMPILER_ADA_SPECS_WITH_BODY) $(COMPILER_ADA_SPECS_WITHOUT_BODY)
COMPILER_ADA_BODIES = $(COMPILER_ADA_SPECS_WITH_BODY:.ads=.adb)
COMPILER_ADA_HDRS = $(COMPILER_ADA_SPECS) $(COMPILER_ADA_BODIES)
COMPILER_ADA_SRCS = $(COMPILER_ADA_SPECS_WITHOUT_BODY) $(COMPILER_ADA_BODIES)
COMPILER_ADA_ALIS = $(COMPILER_ADA_SPECS_WITHOUT_BODY:.ads=.ali) $(COMPILER_ADA_BODIES:.adb=.ali)

DESIGNER_ADA_SPECS = $(DESIGNER_ADA_SPECS_WITH_BODY) $(DESIGNER_ADA_SPECS_WITHOUT_BODY)
DESIGNER_ADA_BODIES = $(DESIGNER_ADA_SPECS_WITH_BODY:.ads=.adb)
DESIGNER_ADA_HDRS = $(DESIGNER_ADA_SPECS) $(DESIGNER_ADA_BODIES)
DESIGNER_ADA_SRCS = $(DESIGNER_ADA_SPECS_WITHOUT_BODY) $(DESIGNER_ADA_BODIES)
DESIGNER_ADA_ALIS = $(DESIGNER_ADA_SPECS_WITHOUT_BODY:.ads=.ali) $(DESIGNER_ADA_BODIES:.adb=.ali)

noinst_HEADERS = $(COMPILER_ADA_HDRS) $(DESIGNER_ADA_HDRS)
bin_PROGRAMS = compiler
bin_SCRIPTS = designer
libexec_PROGRAMS = designer-driver
dist_noinst_DATA = XmAdaDesigner.ad
data_DATA = XmAdaDesigner

CLEANFILES += b~*.ad[sb] designer-setup.adb XmAdaDesigner

designer_driver_SOURCES = $(DESIGNER_ADA_SRCS) designer_c.c
designer_driver_LDFLAGS = $(ADAFLAGS)
designer_driver_LDADD = \
	designer-driver.adb -largs \
	$(top_builddir)/source/xml/libxmadaxml.la

compiler_SOURCES = $(COMPILER_ADA_SRCS)
compiler_LDFLAGS = $(ADAFLAGS)
compiler_LDADD = \
	compiler-driver.adb -largs

XmAdaDesigner:
	ln -s $(srcdir)/XmAdaDesigner.ad XmAdaDesigner

### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
compiler-driver.lo compiler-driver.o: \
	$(srcdir)/compiler-driver.adb \
	$(srcdir)/compiler-driver.ads \
	$(srcdir)/compiler.ads \
	$(srcdir)/generator-application_resources.ads \
	$(srcdir)/generator-prototype-component_class.ads \
	$(srcdir)/generator-prototype.ads \
	$(srcdir)/generator.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-initialization-xm_ada.ads \
	$(srcdir)/model-initialization.ads \
	$(srcdir)/model-tools.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads
compiler.lo compiler.o: \
	$(srcdir)/compiler.ads
designer-driver.lo designer-driver.o: \
	$(srcdir)/designer-driver.adb \
	$(srcdir)/designer-driver.ads \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer-operations.ads \
	$(srcdir)/designer-setup.ads \
	$(srcdir)/designer.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-event_management.ads \
	$(top_srcdir)/source/xt/xt-initializers.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_application_shell.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_shell.ads \
	$(top_srcdir)/source/xt/xt_top_level_shell.ads \
	$(top_srcdir)/source/xt/xt_vendor_shell.ads \
	$(top_srcdir)/source/xt/xt_wm_shell.ads
designer-main_window-traceback.lo designer-main_window-traceback.o: \
	$(srcdir)/debug/designer-main_window-traceback.adb \
	$(srcdir)/debug/designer-main_window-traceback.ads \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads
designer-main_window.lo designer-main_window.o: \
	$(srcdir)/designer-main_window.adb \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer-model_utilities.ads \
	$(srcdir)/debug/designer-operations-debug.ads \
	$(srcdir)/designer-operations.ads \
	$(srcdir)/designer-palette.ads \
	$(srcdir)/designer-properties_editor-renditions_editor.ads \
	$(srcdir)/designer-properties_editor.ads \
	$(srcdir)/designer-tree_editor.ads \
	$(srcdir)/designer-visual_editor.ads \
	$(srcdir)/designer.ads \
	$(top_srcdir)/source/xm/i-cwistr.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-colors.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-graphic_output.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm-class_management.ads \
	$(top_srcdir)/source/xm/xm-internal.ads \
	$(top_srcdir)/source/xm/xm-resource_management.ads \
	$(top_srcdir)/source/xm/xm-strings.ads \
	$(top_srcdir)/source/xm/xm-traversal_management.ads \
	$(top_srcdir)/source/xm/xm-utilities.ads \
	$(top_srcdir)/source/xm/xm.ads \
	$(top_srcdir)/source/xm/xm_arrow_button_gadget.ads \
	$(top_srcdir)/source/xm/xm_bulletin_board.ads \
	$(top_srcdir)/source/xm/xm_cascade_button_gadget.ads \
	$(top_srcdir)/source/xm/xm_file_selection_box.ads \
	$(top_srcdir)/source/xm/xm_form.ads \
	$(top_srcdir)/source/xm/xm_gadget.ads \
	$(top_srcdir)/source/xm/xm_label_gadget.ads \
	$(top_srcdir)/source/xm/xm_main_window.ads \
	$(top_srcdir)/source/xm/xm_manager.ads \
	$(top_srcdir)/source/xm/xm_message_box.ads \
	$(top_srcdir)/source/xm/xm_notebook.ads \
	$(top_srcdir)/source/xm/xm_paned_window.ads \
	$(top_srcdir)/source/xm/xm_primitive.ads \
	$(top_srcdir)/source/xm/xm_push_button_gadget.ads \
	$(top_srcdir)/source/xm/xm_row_column.ads \
	$(top_srcdir)/source/xm/xm_scrolled_window.ads \
	$(top_srcdir)/source/xm/xm_selection_box.ads \
	$(top_srcdir)/source/xm/xm_separator_gadget.ads \
	$(top_srcdir)/source/xm/xm_string_defs.ads \
	$(top_srcdir)/source/xm/xm_text.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-callbacks.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-instance_management.ads \
	$(top_srcdir)/source/xt/xt-resource_management.ads \
	$(top_srcdir)/source/xt/xt-translation_management.ads \
	$(top_srcdir)/source/xt/xt-utilities.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads \
	$(top_srcdir)/source/xt/xt_string_defs.ads
designer-model_utilities.lo designer-model_utilities.o: \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer-model_utilities.adb \
	$(srcdir)/designer-model_utilities.ads \
	$(srcdir)/designer.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-tree-constructors.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads
designer-operations-debug.lo designer-operations-debug.o: \
	$(srcdir)/debug/designer-operations-debug.adb \
	$(srcdir)/debug/designer-operations-debug.ads \
	$(srcdir)/designer-operations.ads \
	$(srcdir)/designer.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/debug/model-debug-designer.ads \
	$(srcdir)/debug/model-debug.ads \
	$(srcdir)/debug/model-names-debug.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/debug/model-strings-debug.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/debug/model-tree-debug.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads
designer-operations.lo designer-operations.o: \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer-model_utilities.ads \
	$(srcdir)/designer-operations.adb \
	$(srcdir)/designer-operations.ads \
	$(srcdir)/designer-rtl_consistency.ads \
	$(srcdir)/designer.ads \
	$(srcdir)/generator-application_resources.ads \
	$(srcdir)/generator-prototype-component_class.ads \
	$(srcdir)/generator-prototype.ads \
	$(srcdir)/generator.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-initialization-designer.ads \
	$(srcdir)/model-initialization-xm_ada.ads \
	$(srcdir)/model-initialization.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-tools.ads \
	$(srcdir)/model-tree-constructors.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-xt_motif.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt.ads
designer-palette.lo designer-palette.o: \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer-model_utilities.ads \
	$(srcdir)/designer-palette.adb \
	$(srcdir)/designer-palette.ads \
	$(srcdir)/designer.ads \
	$(top_srcdir)/source/xm/i-cwistr.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-utilities.ads \
	$(srcdir)/model-xt_motif.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-graphic_output.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm-resource_management.ads \
	$(top_srcdir)/source/xm/xm-strings.ads \
	$(top_srcdir)/source/xm/xm.ads \
	$(top_srcdir)/source/xm/xm_gadget.ads \
	$(top_srcdir)/source/xm/xm_label_gadget.ads \
	$(top_srcdir)/source/xm/xm_manager.ads \
	$(top_srcdir)/source/xm/xm_notebook.ads \
	$(top_srcdir)/source/xm/xm_push_button_gadget.ads \
	$(top_srcdir)/source/xm/xm_row_column.ads \
	$(top_srcdir)/source/xm/xm_string_defs.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-callbacks.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-instance_management.ads \
	$(top_srcdir)/source/xt/xt-resource_management.ads \
	$(top_srcdir)/source/xt/xt-translation_management.ads \
	$(top_srcdir)/source/xt/xt-utilities.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads \
	$(top_srcdir)/source/xt/xt_string_defs.ads
designer-properties_editor-application.lo designer-properties_editor-application.o: \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer-properties_editor-application.adb \
	$(srcdir)/designer-properties_editor-application.ads \
	$(srcdir)/designer-properties_editor.ads \
	$(srcdir)/designer.ads \
	$(top_srcdir)/source/xm/i-cwistr.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm-resource_management.ads \
	$(top_srcdir)/source/xm/xm.ads \
	$(top_srcdir)/source/xm/xm_bulletin_board.ads \
	$(top_srcdir)/source/xm/xm_form.ads \
	$(top_srcdir)/source/xm/xm_gadget.ads \
	$(top_srcdir)/source/xm/xm_label_gadget.ads \
	$(top_srcdir)/source/xm/xm_manager.ads \
	$(top_srcdir)/source/xm/xm_primitive.ads \
	$(top_srcdir)/source/xm/xm_string_defs.ads \
	$(top_srcdir)/source/xm/xm_text_field.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-callbacks.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-instance_management.ads \
	$(top_srcdir)/source/xt/xt-resource_management.ads \
	$(top_srcdir)/source/xt/xt-translation_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads \
	$(top_srcdir)/source/xt/xt_string_defs.ads
designer-properties_editor-component_class.lo designer-properties_editor-component_class.o: \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer-properties_editor-component_class.adb \
	$(srcdir)/designer-properties_editor-component_class.ads \
	$(srcdir)/designer-properties_editor.ads \
	$(srcdir)/designer.ads \
	$(top_srcdir)/source/xm/i-cwistr.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model-tree-xm_ada.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm-resource_management.ads \
	$(top_srcdir)/source/xm/xm.ads \
	$(top_srcdir)/source/xm/xm_bulletin_board.ads \
	$(top_srcdir)/source/xm/xm_form.ads \
	$(top_srcdir)/source/xm/xm_gadget.ads \
	$(top_srcdir)/source/xm/xm_label_gadget.ads \
	$(top_srcdir)/source/xm/xm_manager.ads \
	$(top_srcdir)/source/xm/xm_primitive.ads \
	$(top_srcdir)/source/xm/xm_string_defs.ads \
	$(top_srcdir)/source/xm/xm_text_field.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-callbacks.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-instance_management.ads \
	$(top_srcdir)/source/xt/xt-resource_management.ads \
	$(top_srcdir)/source/xt/xt-translation_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads \
	$(top_srcdir)/source/xt/xt_string_defs.ads
designer-properties_editor-renditions_editor.lo designer-properties_editor-renditions_editor.o: \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer-model_utilities.ads \
	$(srcdir)/designer-properties_editor-renditions_editor.adb \
	$(srcdir)/designer-properties_editor-renditions_editor.ads \
	$(srcdir)/designer-properties_editor.ads \
	$(srcdir)/designer-visual_editor.ads \
	$(srcdir)/designer.ads \
	$(top_srcdir)/source/xm/i-cwistr.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model-tree-constructors.ads \
	$(srcdir)/model-tree-designer.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree-xm_ada.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-xt_motif.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-cursors.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-graphic_output.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm-menu_management.ads \
	$(top_srcdir)/source/xm/xm-resource_management.ads \
	$(top_srcdir)/source/xm/xm-strings.ads \
	$(top_srcdir)/source/xm/xm.ads \
	$(top_srcdir)/source/xm/xm_bulletin_board.ads \
	$(top_srcdir)/source/xm/xm_cascade_button_gadget.ads \
	$(top_srcdir)/source/xm/xm_drawing_area.ads \
	$(top_srcdir)/source/xm/xm_form.ads \
	$(top_srcdir)/source/xm/xm_gadget.ads \
	$(top_srcdir)/source/xm/xm_label_gadget.ads \
	$(top_srcdir)/source/xm/xm_manager.ads \
	$(top_srcdir)/source/xm/xm_message_box.ads \
	$(top_srcdir)/source/xm/xm_notebook.ads \
	$(top_srcdir)/source/xm/xm_primitive.ads \
	$(top_srcdir)/source/xm/xm_push_button_gadget.ads \
	$(top_srcdir)/source/xm/xm_row_column.ads \
	$(top_srcdir)/source/xm/xm_string_defs.ads \
	$(top_srcdir)/source/xm/xm_text_field.ads \
	$(top_srcdir)/source/xm/xm_toggle_button_gadget.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-callbacks.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-instance_management.ads \
	$(top_srcdir)/source/xt/xt-resource_management.ads \
	$(top_srcdir)/source/xt/xt-translation_management.ads \
	$(top_srcdir)/source/xt/xt-utilities.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads \
	$(top_srcdir)/source/xt/xt_string_defs.ads
designer-properties_editor-widget_instance.lo designer-properties_editor-widget_instance.o: \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer-model_utilities.ads \
	$(srcdir)/designer-properties_editor-renditions_editor.ads \
	$(srcdir)/designer-properties_editor-widget_instance.adb \
	$(srcdir)/designer-properties_editor-widget_instance.ads \
	$(srcdir)/designer-properties_editor.ads \
	$(srcdir)/designer-visual_editor.ads \
	$(srcdir)/designer.ads \
	$(top_srcdir)/source/xm/i-cwistr.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model-tree-designer.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree-xm_ada.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-cursors.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-graphic_output.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm-class_management.ads \
	$(top_srcdir)/source/xm/xm-menu_management.ads \
	$(top_srcdir)/source/xm/xm-resource_management.ads \
	$(top_srcdir)/source/xm/xm-strings.ads \
	$(top_srcdir)/source/xm/xm.ads \
	$(top_srcdir)/source/xm/xm_bulletin_board.ads \
	$(top_srcdir)/source/xm/xm_form.ads \
	$(top_srcdir)/source/xm/xm_gadget.ads \
	$(top_srcdir)/source/xm/xm_label_gadget.ads \
	$(top_srcdir)/source/xm/xm_manager.ads \
	$(top_srcdir)/source/xm/xm_notebook.ads \
	$(top_srcdir)/source/xm/xm_primitive.ads \
	$(top_srcdir)/source/xm/xm_push_button_gadget.ads \
	$(top_srcdir)/source/xm/xm_row_column.ads \
	$(top_srcdir)/source/xm/xm_scrolled_window.ads \
	$(top_srcdir)/source/xm/xm_simple_spin_box.ads \
	$(top_srcdir)/source/xm/xm_spin_box.ads \
	$(top_srcdir)/source/xm/xm_string_defs.ads \
	$(top_srcdir)/source/xm/xm_text_field.ads \
	$(top_srcdir)/source/xm/xm_toggle_button_gadget.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-callbacks.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-instance_management.ads \
	$(top_srcdir)/source/xt/xt-resource_management.ads \
	$(top_srcdir)/source/xt/xt-translation_management.ads \
	$(top_srcdir)/source/xt/xt-utilities.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads \
	$(top_srcdir)/source/xt/xt_string_defs.ads
designer-properties_editor.lo designer-properties_editor.o: \
	$(srcdir)/designer-properties_editor-application.ads \
	$(srcdir)/designer-properties_editor-component_class.ads \
	$(srcdir)/designer-properties_editor-renditions_editor.ads \
	$(srcdir)/designer-properties_editor-widget_instance.ads \
	$(srcdir)/designer-properties_editor.adb \
	$(srcdir)/designer-properties_editor.ads \
	$(srcdir)/designer.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm_string_defs.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-resource_management.ads \
	$(top_srcdir)/source/xt/xt-translation_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_string_defs.ads
designer-rtl_consistency.lo designer-rtl_consistency.o: \
	$(srcdir)/designer-rtl_consistency.adb \
	$(srcdir)/designer-rtl_consistency.ads \
	$(srcdir)/designer-visual_editor.ads \
	$(srcdir)/designer.ads \
	$(top_srcdir)/source/xm/i-cwistr.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-tree-designer.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm-resource_management.ads \
	$(top_srcdir)/source/xm/xm.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-initializers.ads \
	$(top_srcdir)/source/xt/xt-resource_management.ads \
	$(top_srcdir)/source/xt/xt-translation_management.ads \
	$(top_srcdir)/source/xt/xt.ads
designer-setup.lo designer-setup.o: \
	$(srcdir)/debug/designer-main_window-traceback.ads \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer-setup.ads \
	$(srcdir)/microline/designer-visual_editor-microline.ads \
	$(srcdir)/designer-visual_editor.ads \
	$(srcdir)/designer.ads \
	$(srcdir)/microline/model-initialization-designer-microline.ads \
	$(srcdir)/model-initialization-designer.ads \
	$(srcdir)/microline/model-initialization-microline.ads \
	$(srcdir)/microline/model-initialization-xm_ada-microline.ads \
	$(srcdir)/model-initialization-xm_ada.ads \
	$(srcdir)/model-initialization.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt.ads
designer-tree_editor.lo designer-tree_editor.o: \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer-model_utilities.ads \
	$(srcdir)/designer-operations.ads \
	$(srcdir)/designer-palette.ads \
	$(srcdir)/designer-tree_editor.adb \
	$(srcdir)/designer-tree_editor.ads \
	$(srcdir)/designer.ads \
	$(top_srcdir)/source/xm/i-cwistr.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-tree-e_lists.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-xt_motif.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-cursors.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-graphic_output.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm-menu_management.ads \
	$(top_srcdir)/source/xm/xm-resource_management.ads \
	$(top_srcdir)/source/xm/xm-strings.ads \
	$(top_srcdir)/source/xm/xm.ads \
	$(top_srcdir)/source/xm/xm_bulletin_board.ads \
	$(top_srcdir)/source/xm/xm_cascade_button_gadget.ads \
	$(top_srcdir)/source/xm/xm_container.ads \
	$(top_srcdir)/source/xm/xm_gadget.ads \
	$(top_srcdir)/source/xm/xm_icon_gadget.ads \
	$(top_srcdir)/source/xm/xm_label.ads \
	$(top_srcdir)/source/xm/xm_label_gadget.ads \
	$(top_srcdir)/source/xm/xm_manager.ads \
	$(top_srcdir)/source/xm/xm_message_box.ads \
	$(top_srcdir)/source/xm/xm_notebook.ads \
	$(top_srcdir)/source/xm/xm_primitive.ads \
	$(top_srcdir)/source/xm/xm_push_button.ads \
	$(top_srcdir)/source/xm/xm_push_button_gadget.ads \
	$(top_srcdir)/source/xm/xm_row_column.ads \
	$(top_srcdir)/source/xm/xm_scrolled_window.ads \
	$(top_srcdir)/source/xm/xm_separator_gadget.ads \
	$(top_srcdir)/source/xm/xm_string_defs.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-callbacks.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-instance_management.ads \
	$(top_srcdir)/source/xt/xt-resource_management.ads \
	$(top_srcdir)/source/xt/xt-translation_management.ads \
	$(top_srcdir)/source/xt/xt-utilities.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads \
	$(top_srcdir)/source/xt/xt_string_defs.ads
designer-utilities.lo designer-utilities.o: \
	$(srcdir)/designer-utilities.adb \
	$(srcdir)/designer-utilities.ads \
	$(srcdir)/designer.ads \
	$(top_srcdir)/source/xm/i-cwistr.ads
designer-visual_editor-microline.lo designer-visual_editor-microline.o: \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/microline/designer-visual_editor-microline.adb \
	$(srcdir)/microline/designer-visual_editor-microline.ads \
	$(srcdir)/designer-visual_editor.ads \
	$(srcdir)/designer.ads \
	$(top_srcdir)/source/xm/i-cwistr.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/microline/model-microline.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-utilities.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-graphic_output.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm-traversal_management.ads \
	$(top_srcdir)/source/xm/xm.ads \
	$(top_srcdir)/source/xm/xm_manager.ads \
	$(top_srcdir)/source/xm/xm_primitive.ads \
	$(top_srcdir)/source/xm/xm_string_defs.ads \
	$(top_srcdir)/source/xm/xm_text_field.ads \
	$(top_srcdir)/source/xml/xml.ads \
	$(top_srcdir)/source/xml/xml_grid.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-callbacks.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-geometry_management.ads \
	$(top_srcdir)/source/xt/xt-resource_management.ads \
	$(top_srcdir)/source/xt/xt-translation_management.ads \
	$(top_srcdir)/source/xt/xt-utilities.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_string_defs.ads
designer-visual_editor.lo designer-visual_editor.o: \
	$(srcdir)/designer-main_window.ads \
	$(srcdir)/designer-utilities.ads \
	$(srcdir)/designer-visual_editor.adb \
	$(srcdir)/designer-visual_editor.ads \
	$(srcdir)/designer.ads \
	$(top_srcdir)/source/xm/i-cwistr.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model-tree-designer.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-utilities.ads \
	$(srcdir)/model-widget_instances_ordering.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-graphic_output.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm-resource_management.ads \
	$(top_srcdir)/source/xm/xm-strings.ads \
	$(top_srcdir)/source/xm/xm.ads \
	$(top_srcdir)/source/xm/xm_drawing_area.ads \
	$(top_srcdir)/source/xm/xm_manager.ads \
	$(top_srcdir)/source/xm/xm_scrolled_window.ads \
	$(top_srcdir)/source/xm/xm_string_defs.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt-event_management.ads \
	$(top_srcdir)/source/xt/xt-initializers.ads \
	$(top_srcdir)/source/xt/xt-instance_management.ads \
	$(top_srcdir)/source/xt/xt-resource_management.ads \
	$(top_srcdir)/source/xt/xt-translation_management.ads \
	$(top_srcdir)/source/xt/xt-utilities.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_string_defs.ads
designer.lo designer.o: \
	$(srcdir)/designer.ads
generator-application_resources.lo generator-application_resources.o: \
	$(srcdir)/generator-application_resources.adb \
	$(srcdir)/generator-application_resources.ads \
	$(srcdir)/generator.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads
generator-prototype-component_class.lo generator-prototype-component_class.o: \
	$(srcdir)/generator-prototype-component_class.adb \
	$(srcdir)/generator-prototype-component_class.ads \
	$(srcdir)/generator-prototype.ads \
	$(srcdir)/generator.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree-xm_ada.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-widget_instances_ordering.ads \
	$(srcdir)/model.ads
generator-prototype.lo generator-prototype.o: \
	$(srcdir)/generator-prototype.ads \
	$(srcdir)/generator.ads
generator.lo generator.o: \
	$(srcdir)/generator.ads
model-allocations.lo model-allocations.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model.ads
model-debug-designer.lo model-debug-designer.o: \
	$(srcdir)/designer-visual_editor.ads \
	$(srcdir)/designer.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/debug/model-debug-designer.adb \
	$(srcdir)/debug/model-debug-designer.ads \
	$(srcdir)/debug/model-debug.ads \
	$(srcdir)/model-tree-designer.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt.ads
model-debug.lo model-debug.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/debug/model-debug.adb \
	$(srcdir)/debug/model-debug.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads
model-initialization-designer-microline.lo model-initialization-designer-microline.o: \
	$(srcdir)/microline/designer-visual_editor-microline.ads \
	$(srcdir)/designer-visual_editor.ads \
	$(srcdir)/designer.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/microline/model-initialization-designer-microline.adb \
	$(srcdir)/microline/model-initialization-designer-microline.ads \
	$(srcdir)/model-initialization-designer.ads \
	$(srcdir)/microline/model-initialization-microline.ads \
	$(srcdir)/model-initialization.ads \
	$(srcdir)/model-tree-designer.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm_manager.ads \
	$(top_srcdir)/source/xml/xml.ads \
	$(top_srcdir)/source/xml/xml_grid.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
model-initialization-designer.lo model-initialization-designer.o: \
	$(srcdir)/designer-visual_editor.ads \
	$(srcdir)/designer.ads \
	$(top_srcdir)/source/xm/i-cwistr.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-initialization-designer.adb \
	$(srcdir)/model-initialization-designer.ads \
	$(srcdir)/model-initialization.ads \
	$(srcdir)/model-tree-designer.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-xt_motif.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/extensions/print/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm.ads \
	$(top_srcdir)/source/xm/xm_arrow_button.ads \
	$(top_srcdir)/source/xm/xm_arrow_button_gadget.ads \
	$(top_srcdir)/source/xm/xm_bulletin_board.ads \
	$(top_srcdir)/source/xm/xm_cascade_button.ads \
	$(top_srcdir)/source/xm/xm_cascade_button_gadget.ads \
	$(top_srcdir)/source/xm/xm_combo_box.ads \
	$(top_srcdir)/source/xm/xm_command.ads \
	$(top_srcdir)/source/xm/xm_container.ads \
	$(top_srcdir)/source/xm/xm_dialog_shell.ads \
	$(top_srcdir)/source/xm/xm_drawing_area.ads \
	$(top_srcdir)/source/xm/xm_drawn_button.ads \
	$(top_srcdir)/source/xm/xm_file_selection_box.ads \
	$(top_srcdir)/source/xm/xm_form.ads \
	$(top_srcdir)/source/xm/xm_frame.ads \
	$(top_srcdir)/source/xm/xm_gadget.ads \
	$(top_srcdir)/source/xm/xm_icon_gadget.ads \
	$(top_srcdir)/source/xm/xm_label.ads \
	$(top_srcdir)/source/xm/xm_label_gadget.ads \
	$(top_srcdir)/source/xm/xm_list.ads \
	$(top_srcdir)/source/xm/xm_main_window.ads \
	$(top_srcdir)/source/xm/xm_manager.ads \
	$(top_srcdir)/source/xm/xm_message_box.ads \
	$(top_srcdir)/source/xm/xm_notebook.ads \
	$(top_srcdir)/source/xm/xm_paned_window.ads \
	$(top_srcdir)/source/xm/xm_primitive.ads \
	$(top_srcdir)/source/xm/xm_push_button.ads \
	$(top_srcdir)/source/xm/xm_push_button_gadget.ads \
	$(top_srcdir)/source/xm/xm_row_column.ads \
	$(top_srcdir)/source/xm/xm_scale.ads \
	$(top_srcdir)/source/xm/xm_scroll_bar.ads \
	$(top_srcdir)/source/xm/xm_scrolled_window.ads \
	$(top_srcdir)/source/xm/xm_selection_box.ads \
	$(top_srcdir)/source/xm/xm_separator.ads \
	$(top_srcdir)/source/xm/xm_separator_gadget.ads \
	$(top_srcdir)/source/xm/xm_simple_spin_box.ads \
	$(top_srcdir)/source/xm/xm_spin_box.ads \
	$(top_srcdir)/source/xm/xm_text.ads \
	$(top_srcdir)/source/xm/xm_text_field.ads \
	$(top_srcdir)/source/xm/xm_toggle_button.ads \
	$(top_srcdir)/source/xm/xm_toggle_button_gadget.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_application_shell.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads \
	$(top_srcdir)/source/xt/xt_object.ads \
	$(top_srcdir)/source/xt/xt_override_shell.ads \
	$(top_srcdir)/source/xt/xt_rect_obj.ads \
	$(top_srcdir)/source/xt/xt_session_shell.ads \
	$(top_srcdir)/source/xt/xt_shell.ads \
	$(top_srcdir)/source/xt/xt_top_level_shell.ads \
	$(top_srcdir)/source/xt/xt_transient_shell.ads \
	$(top_srcdir)/source/xt/xt_vendor_shell.ads \
	$(top_srcdir)/source/xt/xt_wm_shell.ads
model-initialization-microline.lo model-initialization-microline.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/microline/model-initialization-microline.adb \
	$(srcdir)/microline/model-initialization-microline.ads \
	$(srcdir)/model-initialization.ads \
	$(srcdir)/microline/model-microline.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-tree-constructors.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-xt_motif.ads \
	$(srcdir)/model.ads
model-initialization-xm_ada-microline.lo model-initialization-xm_ada-microline.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/microline/model-initialization-microline.ads \
	$(srcdir)/microline/model-initialization-xm_ada-microline.adb \
	$(srcdir)/microline/model-initialization-xm_ada-microline.ads \
	$(srcdir)/model-initialization-xm_ada.ads \
	$(srcdir)/model-initialization.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-tree-xm_ada.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads
model-initialization-xm_ada.lo model-initialization-xm_ada.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-initialization-xm_ada.adb \
	$(srcdir)/model-initialization-xm_ada.ads \
	$(srcdir)/model-initialization.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree-xm_ada.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-xt_motif.ads \
	$(srcdir)/model.ads
model-initialization.lo model-initialization.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-initialization.adb \
	$(srcdir)/model-initialization.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model-tree-constructors.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-xt_motif.ads \
	$(srcdir)/model.ads
model-microline.lo model-microline.o: \
	$(srcdir)/microline/model-microline.ads \
	$(srcdir)/model.ads
model-names-debug.lo model-names-debug.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/debug/model-names-debug.adb \
	$(srcdir)/debug/model-names-debug.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model.ads
model-names.lo model-names.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.adb \
	$(srcdir)/model-names.ads \
	$(srcdir)/model.ads
model-queries.lo model-queries.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-queries.adb \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-xt_motif.ads \
	$(srcdir)/model.ads
model-strings-debug.lo model-strings-debug.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/debug/model-strings-debug.adb \
	$(srcdir)/debug/model-strings-debug.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model.ads
model-strings.lo model-strings.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-strings.adb \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model.ads
model-tools.lo model-tools.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-names.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-strings.ads \
	$(srcdir)/model-tools.adb \
	$(srcdir)/model-tools.ads \
	$(srcdir)/model-tree-constructors.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree-xm_ada.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-utilities.ads \
	$(srcdir)/model-xt_motif.ads \
	$(srcdir)/model.ads \
	$(srcdir)/xml_tools-attributes.ads \
	$(srcdir)/xml_tools-elements.ads \
	$(srcdir)/xml_tools-implementation.ads \
	$(srcdir)/xml_tools-names.ads \
	$(srcdir)/xml_tools-parser.ads \
	$(srcdir)/xml_tools-printer.ads \
	$(srcdir)/xml_tools-strings.ads \
	$(srcdir)/xml_tools.ads
model-tree-constructors.lo model-tree-constructors.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-tree-constructors.adb \
	$(srcdir)/model-tree-constructors.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads
model-tree-debug.lo model-tree-debug.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/debug/model-tree-debug.adb \
	$(srcdir)/debug/model-tree-debug.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads
model-tree-designer.lo model-tree-designer.o: \
	$(srcdir)/designer-visual_editor.ads \
	$(srcdir)/designer.ads \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-tree-designer.adb \
	$(srcdir)/model-tree-designer.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt.ads
model-tree-e_lists.lo model-tree-e_lists.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-tree-e_lists.adb \
	$(srcdir)/model-tree-e_lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads
model-tree-lists.lo model-tree-lists.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-tree-lists.adb \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads
model-tree-xm_ada.lo model-tree-xm_ada.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-tree-xm_ada.adb \
	$(srcdir)/model-tree-xm_ada.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads
model-tree.lo model-tree.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree-xm_ada.ads \
	$(srcdir)/model-tree.adb \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model.ads
model-utilities.lo model-utilities.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-tree-constructors.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-utilities.adb \
	$(srcdir)/model-utilities.ads \
	$(srcdir)/model.ads
model-widget_instances_ordering.lo model-widget_instances_ordering.o: \
	$(srcdir)/model-allocations.ads \
	$(srcdir)/model-queries.ads \
	$(srcdir)/model-tree-lists.ads \
	$(srcdir)/model-tree.ads \
	$(srcdir)/model-widget_instances_ordering.adb \
	$(srcdir)/model-widget_instances_ordering.ads \
	$(srcdir)/model.ads
model-xt_motif.lo model-xt_motif.o: \
	$(srcdir)/model-xt_motif.ads \
	$(srcdir)/model.ads
model.lo model.o: \
	$(srcdir)/model.ads
xml_tools-allocation.lo xml_tools-allocation.o: \
	$(srcdir)/xml_tools-allocation.ads \
	$(srcdir)/xml_tools.ads
xml_tools-attributes.lo xml_tools-attributes.o: \
	$(srcdir)/xml_tools-allocation.ads \
	$(srcdir)/xml_tools-attributes.adb \
	$(srcdir)/xml_tools-attributes.ads \
	$(srcdir)/xml_tools-elements.ads \
	$(srcdir)/xml_tools.ads
xml_tools-elements.lo xml_tools-elements.o: \
	$(srcdir)/xml_tools-allocation.ads \
	$(srcdir)/xml_tools-elements.adb \
	$(srcdir)/xml_tools-elements.ads \
	$(srcdir)/xml_tools.ads
xml_tools-implementation.lo xml_tools-implementation.o: \
	$(srcdir)/xml_tools-attributes.ads \
	$(srcdir)/xml_tools-elements.ads \
	$(srcdir)/xml_tools-implementation.adb \
	$(srcdir)/xml_tools-implementation.ads \
	$(srcdir)/xml_tools-names.ads \
	$(srcdir)/xml_tools-strings.ads \
	$(srcdir)/xml_tools.ads
xml_tools-names.lo xml_tools-names.o: \
	$(srcdir)/xml_tools-allocation.ads \
	$(srcdir)/xml_tools-names.adb \
	$(srcdir)/xml_tools-names.ads \
	$(srcdir)/xml_tools.ads
xml_tools-parser.lo xml_tools-parser.o: \
	$(srcdir)/xml_tools-allocation.ads \
	$(srcdir)/xml_tools-attributes.ads \
	$(srcdir)/xml_tools-elements.ads \
	$(srcdir)/xml_tools-names.ads \
	$(srcdir)/xml_tools-parser.adb \
	$(srcdir)/xml_tools-parser.ads \
	$(srcdir)/xml_tools-strings.ads \
	$(srcdir)/xml_tools.ads
xml_tools-printer.lo xml_tools-printer.o: \
	$(srcdir)/xml_tools-attributes.ads \
	$(srcdir)/xml_tools-elements.ads \
	$(srcdir)/xml_tools-names.ads \
	$(srcdir)/xml_tools-printer.adb \
	$(srcdir)/xml_tools-printer.ads \
	$(srcdir)/xml_tools-strings.ads \
	$(srcdir)/xml_tools.ads
xml_tools-strings.lo xml_tools-strings.o: \
	$(srcdir)/xml_tools-allocation.ads \
	$(srcdir)/xml_tools-strings.adb \
	$(srcdir)/xml_tools-strings.ads \
	$(srcdir)/xml_tools.ads
xml_tools.lo xml_tools.o: \
	$(srcdir)/xml_tools.ads
