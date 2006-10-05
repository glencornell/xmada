
include $(top_srcdir)/Makefile.common

SUBDIRS = . extensions

ADAFLAGS = $(STD_ADAFLAGS)

ADA_SPECS_WITH_BODY = \
	xlib.ads \
	xlib-atoms.ads \
	xlib-events.ads \
	xlib-graphic_output.ads \
	xlib-implementation.ads

ADA_SPECS_WITHOUT_BODY = \
	xlib-colors.ads \
	xlib-cursors.ads \
	xlib-resource_manager.ads

ADA_SPECS = $(ADA_SPECS_WITH_BODY) $(ADA_SPECS_WITHOUT_BODY)
ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)
ADA_HDRS = $(ADA_SPECS) $(ADA_BODIES)
ADA_SRCS = $(ADA_SPECS_WITHOUT_BODY) $(ADA_BODIES)
ADA_ALIS = $(ADA_SPECS_WITHOUT_BODY:.ads=.ali) $(ADA_BODIES:.adb=.ali)

pkginclude_HEADERS = $(ADA_HDRS)
ali_DATA = $(ADA_ALIS)
lib_LTLIBRARIES = libxmadaxlib.la

libxmadaxlib_la_SOURCES = $(ADA_SRCS)
libxmadaxlib_la_LDFLAGS = -no-undefined -version-info $(XMADAXLIBLIBVERSIONINFO)

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
