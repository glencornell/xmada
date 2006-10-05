
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
