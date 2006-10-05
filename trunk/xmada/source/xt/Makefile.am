
include $(top_srcdir)/Makefile.common

alidir = $(includedir)/xmada

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

ADA_SPECS = $(ADA_SPECS_WITH_BODY) \
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

ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)

ADA_LIBADD = $(ADA_SPECS:.ads=.lo)

lib_LTLIBRARIES = libxmadaxt.la
libxmadaxt_la_SOURCES =
libxmadaxt_la_LIBADD = $(ADA_LIBADD)
libxmadaxt_la_LDFLAGS = -no-undefined -version-info $(XMADAXTLIBVERSIONINFO)

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(alidir)
	for f in $(srcdir)/*.ad[sb] *.ali; do $(INSTALL) -m 444 $$f $(DESTDIR)$(alidir); done

### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
xt-ancillary_types.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-ancillary_types.adb \
	$(srcdir)/xt-ancillary_types.ads \
	$(srcdir)/xt.ads
xt-boolean_operations.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-boolean_operations.adb \
	$(srcdir)/xt-boolean_operations.ads \
	$(srcdir)/xt.ads
xt-callbacks.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-callbacks.adb \
	$(srcdir)/xt-callbacks.ads \
	$(srcdir)/xt-implementation.ads \
	$(srcdir)/xt.ads
xt-class_management.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-class_management.adb \
	$(srcdir)/xt-class_management.ads \
	$(srcdir)/xt-implementation.ads \
	$(srcdir)/xt.ads
xt-composite_management.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-composite_management.adb \
	$(srcdir)/xt-composite_management.ads \
	$(srcdir)/xt-implementation.ads \
	$(srcdir)/xt.ads
xt-event_management.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-event_management.adb \
	$(srcdir)/xt-event_management.ads \
	$(srcdir)/xt-implementation.ads \
	$(srcdir)/xt.ads
xt-geometry_management.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-geometry_management.adb \
	$(srcdir)/xt-geometry_management.ads \
	$(srcdir)/xt-implementation.ads \
	$(srcdir)/xt.ads
xt-implementation.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-implementation.adb \
	$(srcdir)/xt-implementation.ads \
	$(srcdir)/xt.ads
xt-initializers.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-ancillary_types.ads \
	$(srcdir)/xt-implementation.ads \
	$(srcdir)/xt-initializers.adb \
	$(srcdir)/xt-initializers.ads \
	$(srcdir)/xt.ads
xt-instance_management.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-ancillary_types.ads \
	$(srcdir)/xt-implementation.ads \
	$(srcdir)/xt-instance_management.adb \
	$(srcdir)/xt-instance_management.ads \
	$(srcdir)/xt.ads
xt-popup_management.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-ancillary_types.ads \
	$(srcdir)/xt-implementation.ads \
	$(srcdir)/xt-popup_management.adb \
	$(srcdir)/xt-popup_management.ads \
	$(srcdir)/xt.ads
xt-resource_management.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-ancillary_types.ads \
	$(srcdir)/xt-implementation.ads \
	$(srcdir)/xt-resource_management.adb \
	$(srcdir)/xt-resource_management.ads \
	$(srcdir)/xt-translation_management.ads \
	$(srcdir)/xt.ads
xt-translation_management.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-implementation.ads \
	$(srcdir)/xt-translation_management.adb \
	$(srcdir)/xt-translation_management.ads \
	$(srcdir)/xt.ads
xt-utilities.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-graphic_output.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt-class_management.ads \
	$(srcdir)/xt-implementation.ads \
	$(srcdir)/xt-utilities.adb \
	$(srcdir)/xt-utilities.ads \
	$(srcdir)/xt.ads
xt.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.adb \
	$(srcdir)/xt.ads
xt_application_shell.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_application_shell.ads \
	$(srcdir)/xt_composite.ads \
	$(srcdir)/xt_core.ads \
	$(srcdir)/xt_shell.ads \
	$(srcdir)/xt_top_level_shell.ads \
	$(srcdir)/xt_vendor_shell.ads \
	$(srcdir)/xt_wm_shell.ads
xt_composite.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_composite.ads \
	$(srcdir)/xt_core.ads
xt_constraint.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_composite.ads \
	$(srcdir)/xt_constraint.ads \
	$(srcdir)/xt_core.ads
xt_core.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_core.ads
xt_object.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_object.ads
xt_override_shell.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_composite.ads \
	$(srcdir)/xt_core.ads \
	$(srcdir)/xt_override_shell.ads \
	$(srcdir)/xt_shell.ads
xt_rect_obj.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_object.ads \
	$(srcdir)/xt_rect_obj.ads
xt_session_shell.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_application_shell.ads \
	$(srcdir)/xt_composite.ads \
	$(srcdir)/xt_core.ads \
	$(srcdir)/xt_session_shell.ads \
	$(srcdir)/xt_shell.ads \
	$(srcdir)/xt_top_level_shell.ads \
	$(srcdir)/xt_vendor_shell.ads \
	$(srcdir)/xt_wm_shell.ads
xt_shell.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_composite.ads \
	$(srcdir)/xt_core.ads \
	$(srcdir)/xt_shell.ads
xt_string_defs.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_string_defs.ads
xt_top_level_shell.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_composite.ads \
	$(srcdir)/xt_core.ads \
	$(srcdir)/xt_shell.ads \
	$(srcdir)/xt_top_level_shell.ads \
	$(srcdir)/xt_vendor_shell.ads \
	$(srcdir)/xt_wm_shell.ads
xt_transient_shell.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_composite.ads \
	$(srcdir)/xt_core.ads \
	$(srcdir)/xt_shell.ads \
	$(srcdir)/xt_transient_shell.ads \
	$(srcdir)/xt_vendor_shell.ads \
	$(srcdir)/xt_wm_shell.ads
xt_vendor_shell.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_composite.ads \
	$(srcdir)/xt_core.ads \
	$(srcdir)/xt_shell.ads \
	$(srcdir)/xt_vendor_shell.ads \
	$(srcdir)/xt_wm_shell.ads
xt_wm_shell.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xt.ads \
	$(srcdir)/xt_composite.ads \
	$(srcdir)/xt_core.ads \
	$(srcdir)/xt_shell.ads \
	$(srcdir)/xt_wm_shell.ads
