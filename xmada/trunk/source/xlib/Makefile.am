include ../../support/Makefile.common

alidir = $(includedir)/xmada

ADACOMPILER = ../../support/adacompiler


ADA_SPECS_WITH_BODY = \
	xlib.ads \
	xlib-atoms.ads \
	xlib-events.ads \
	xlib-extensions-input_device.ads \
	xlib-extensions-print.ads \
	xlib-graphic_output.ads \
	xlib-implementation.ads

ADA_SPECS = $(ADA_SPECS_WITH_BODY) \
	xlib-colors.ads \
	xlib-cursors.ads \
	xlib-extensions.ads \
	xlib-resource_manager.ads

ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)

ADA_LIBADD = $(ADA_SPECS:.ads=.lo)

lib_LTLIBRARIES = libxmadaxlib.la
libxmadaxlib_la_SOURCES =
libxmadaxlib_la_LIBADD = $(ADA_LIBADD)
libxmadaxlib_la_LDFLAGS = -no-undefined -version-info $(XMADAXLIBLIBVERSIONINFO)

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(alidir)
	for f in $(srcdir)/*.ad[sb] *.ali; do $(INSTALL) -m 444 $$f $(DESTDIR)$(alidir); done

### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
xlib.lo: \
	$(srcdir)/xlib.adb \
	$(srcdir)/xlib.ads \
	$(srcdir)/xlib-implementation.adb \
	$(srcdir)/xlib-implementation.ads
xlib-atoms.lo: \
	$(srcdir)/xlib.ads \
	$(srcdir)/xlib-atoms.adb \
	$(srcdir)/xlib-atoms.ads \
	$(srcdir)/xlib-implementation.ads
xlib-colors.lo: \
	$(srcdir)/xlib.ads \
	$(srcdir)/xlib-colors.ads
xlib-cursors.lo: \
	$(srcdir)/xlib.ads \
	$(srcdir)/xlib-cursors.ads
xlib-events.lo: \
	$(srcdir)/xlib.ads \
	$(srcdir)/xlib-events.adb \
	$(srcdir)/xlib-events.ads \
	$(srcdir)/xlib-implementation.ads
xlib-extensions.lo: \
	$(srcdir)/xlib.ads \
	$(srcdir)/xlib-extensions.ads
xlib-extensions-input_device.lo: \
	$(srcdir)/xlib.ads \
	$(srcdir)/xlib-atoms.ads \
	$(srcdir)/xlib-extensions.ads \
	$(srcdir)/xlib-extensions-input_device.adb \
	$(srcdir)/xlib-extensions-input_device.ads \
	$(srcdir)/xlib-implementation.adb \
	$(srcdir)/xlib-implementation.ads
xlib-extensions-print.lo: \
	$(srcdir)/xlib.ads \
	$(srcdir)/xlib-extensions.ads \
	$(srcdir)/xlib-extensions-print.adb \
	$(srcdir)/xlib-extensions-print.ads \
	$(srcdir)/xlib-implementation.ads
xlib-graphic_output.lo: \
	$(srcdir)/xlib.ads \
	$(srcdir)/xlib-graphic_output.adb \
	$(srcdir)/xlib-graphic_output.ads \
	$(srcdir)/xlib-implementation.ads
xlib-implementation.lo: \
	$(srcdir)/xlib.ads \
	$(srcdir)/xlib-implementation.adb \
	$(srcdir)/xlib-implementation.ads
xlib-resource_manager.lo: \
	$(srcdir)/xlib.ads \
	$(srcdir)/xlib-resource_manager.ads
