include ../../../../support/Makefile.common

alidir = $(includedir)/xmada

ADACOMPILER = ../../../../support/adacompiler

ADAFLAGS = -I$(srcdir)/.. -I$(srcdir)/../..

ADA_SPECS_WITH_BODY = \
	xlib-extensions-input_device.ads

ADA_SPECS = $(ADA_SPECS_WITH_BODY)

ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)

ADA_LIBADD = $(ADA_SPECS:.ads=.lo)

lib_LTLIBRARIES = libxmadaxlib-extensions-input.la
libxmadaxlib_extensions_input_la_SOURCES =
libxmadaxlib_extensions_input_la_LIBADD = $(ADA_LIBADD)
libxmadaxlib_extensions_input_la_LDFLAGS = -no-undefined -version-info $(XMADAXLIBLIBVERSIONINFO)

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(alidir)
	for f in $(srcdir)/*.ad[sb] *.ali; do $(INSTALL) -m 444 $$f $(DESTDIR)$(alidir); done

### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
xlib-extensions-input_device.lo: \
	$(srcdir)/xlib-extensions-input_device.adb \
	$(srcdir)/xlib-extensions-input_device.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.adb \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib.ads
