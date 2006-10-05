
include $(top_srcdir)/Makefile.common

ADAFLAGS = $(STD_ADAFLAGS) \
	-I$(srcdir)/.. \
	-I$(srcdir)/../..

ADA_SPECS_WITH_BODY = \
	xlib-extensions-print.ads

ADA_SPECS = $(ADA_SPECS_WITH_BODY) $(ADA_SPECS_WITHOUT_BODY)
ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)
ADA_HDRS = $(ADA_SPECS) $(ADA_BODIES)
ADA_SRCS = $(ADA_SPECS_WITHOUT_BODY) $(ADA_BODIES)
ADA_ALIS = $(ADA_SPECS_WITHOUT_BODY:.ads=.ali) $(ADA_BODIES:.adb=.ali)

pkginclude_HEADERS = $(ADA_HDRS)
ali_DATA = $(ADA_ALIS)
lib_LTLIBRARIES = libxmadaxlib-extensions-print.la

libxmadaxlib_extensions_print_la_SOURCES = $(ADA_SRCS)
libxmadaxlib_extensions_print_la_LDFLAGS = -no-undefined -version-info $(XMADAXLIBLIBVERSIONINFO)
	$(top_builddir)/source/xlib/extensions/libxmadaxlib-extensions.la

### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
xlib-extensions-print.lo: \
	$(srcdir)/xlib-extensions-print.adb \
	$(srcdir)/xlib-extensions-print.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib.ads
