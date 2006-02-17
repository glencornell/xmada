include ../../../../support/Makefile.common

alidir = $(includedir)/xmada

ADAFLAGS = -I$(srcdir)/.. -I$(srcdir)/../..

ADA_SPECS_WITH_BODY = \
	xlib-extensions-print.ads

ADA_SPECS = $(ADA_SPECS_WITH_BODY)

ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)

ADA_LIBADD = $(ADA_SPECS:.ads=.lo)

lib_LTLIBRARIES = libxmadaxlib-extensions-print.la
libxmadaxlib_extensions_print_la_SOURCES =
libxmadaxlib_extensions_print_la_LIBADD = $(ADA_LIBADD)
libxmadaxlib_extensions_print_la_LDFLAGS = -no-undefined -version-info $(XMADAXLIBLIBVERSIONINFO)

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(alidir)
	for f in $(srcdir)/*.ad[sb] *.ali; do $(INSTALL) -m 444 $$f $(DESTDIR)$(alidir); done

### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
xlib-extensions-print.lo: \
	$(srcdir)/xlib-extensions-print.adb \
	$(srcdir)/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib.ads
