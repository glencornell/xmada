include ../../support/Makefile.common

SUBDIRS=extensions

alidir = $(includedir)/xmada

ADAFLAGS = $(STD_ADAFLAGS)

ADA_SPECS_WITH_BODY = \
	xlib.ads \
	xlib-atoms.ads \
	xlib-events.ads \
	xlib-graphic_output.ads \
	xlib-implementation.ads

ADA_SPECS = $(ADA_SPECS_WITH_BODY) \
	xlib-colors.ads \
	xlib-cursors.ads \
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

depend-local:
	for d in $(SUBDIRS); do \
		(cd $$d && ${MAKE} depend-local); \
	done
### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
xlib-atoms.lo: \
	$(srcdir)/xlib-atoms.adb \
	$(srcdir)/xlib-atoms.ads \
	$(srcdir)/xlib-implementation.ads \
	$(srcdir)/xlib.ads
xlib-colors.lo: \
	$(srcdir)/xlib-colors.ads \
	$(srcdir)/xlib.ads
xlib-cursors.lo: \
	$(srcdir)/xlib-cursors.ads \
	$(srcdir)/xlib.ads
xlib-events.lo: \
	$(srcdir)/xlib-events.adb \
	$(srcdir)/xlib-events.ads \
	$(srcdir)/xlib-implementation.ads \
	$(srcdir)/xlib.ads
xlib-graphic_output.lo: \
	$(srcdir)/xlib-graphic_output.adb \
	$(srcdir)/xlib-graphic_output.ads \
	$(srcdir)/xlib-implementation.ads \
	$(srcdir)/xlib.ads
xlib-implementation.lo: \
	$(srcdir)/xlib-implementation.adb \
	$(srcdir)/xlib-implementation.ads \
	$(srcdir)/xlib.ads
xlib-resource_manager.lo: \
	$(srcdir)/xlib-resource_manager.ads \
	$(srcdir)/xlib.ads
xlib.lo: \
	$(srcdir)/xlib-implementation.adb \
	$(srcdir)/xlib-implementation.ads \
	$(srcdir)/xlib.adb \
	$(srcdir)/xlib.ads
