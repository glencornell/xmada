
include $(top_srcdir)/Makefile.common

ADAFLAGS = $(STD_ADAFLAGS) \
	-I$(srcdir)/../xlib

ADA_SPECS_WITH_BODY = \
	xt.ads \
	xt-ancillary_types.ads \
	xt-boolean_operations.ads \
	xt-callbacks.ads \
	xt-class_management.ads \
	xt-composite_management.ads \
	xt-event_management.ads \
	xt-geometry_management.ads \
	xt-implementation.ads \
	xt-initializers.ads \
	xt-instance_management.ads \
	xt-popup_management.ads \
	xt-resource_management.ads \
	xt-translation_management.ads \
	xt-utilities.ads

ADA_SPECS_WITHOUT_BODY = \
	xt_application_shell.ads \
	xt_composite.ads \
	xt_constraint.ads \
	xt_core.ads \
	xt_object.ads \
	xt_override_shell.ads \
	xt_rect_obj.ads \
	xt_session_shell.ads \
	xt_shell.ads \
	xt_string_defs.ads \
	xt_top_level_shell.ads \
	xt_transient_shell.ads \
	xt_vendor_shell.ads \
	xt_wm_shell.ads

ADA_SPECS = $(ADA_SPECS_WITH_BODY) $(ADA_SPECS_WITHOUT_BODY)
ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)
ADA_HDRS = $(ADA_SPECS) $(ADA_BODIES)
ADA_SRCS = $(ADA_SPECS_WITHOUT_BODY) $(ADA_BODIES)
ADA_ALIS = $(ADA_SPECS_WITHOUT_BODY:.ads=.ali) $(ADA_BODIES:.adb=.ali)

pkginclude_HEADERS = $(ADA_HDRS)
ali_DATA = $(ADA_ALIS)
lib_LTLIBRARIES = libxmadaxt.la

libxmadaxt_la_SOURCES = $(ADA_SRCS)
libxmadaxt_la_LDFLAGS = -no-undefined -version-info $(XMADAXTLIBVERSIONINFO)
libxmadaxt_la_LIBADD = \
	$(top_builddir)/source/xlib/libxmadaxlib.la

### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
xt-ancillary_types.lo xt-ancillary_types.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-boolean_operations.lo xt-boolean_operations.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-callbacks.lo xt-callbacks.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-class_management.lo xt-class_management.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-composite_management.lo xt-composite_management.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-event_management.lo xt-event_management.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-geometry_management.lo xt-geometry_management.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-implementation.lo xt-implementation.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-initializers.lo xt-initializers.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-instance_management.lo xt-instance_management.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-popup_management.lo xt-popup_management.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-resource_management.lo xt-resource_management.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-translation_management.lo xt-translation_management.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt-utilities.lo xt-utilities.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-graphic_output.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt.lo xt.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_application_shell.lo xt_application_shell.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_composite.lo xt_composite.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_constraint.lo xt_constraint.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_core.lo xt_core.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_object.lo xt_object.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_override_shell.lo xt_override_shell.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_rect_obj.lo xt_rect_obj.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_session_shell.lo xt_session_shell.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_shell.lo xt_shell.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_string_defs.lo xt_string_defs.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_top_level_shell.lo xt_top_level_shell.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_transient_shell.lo xt_transient_shell.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_vendor_shell.lo xt_vendor_shell.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
xt_wm_shell.lo xt_wm_shell.o: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads
