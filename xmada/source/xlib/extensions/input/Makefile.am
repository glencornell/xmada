include $(top_srcdir)/Makefile.common

ADAFLAGS = $(STD_ADAFLAGS) \
	-I$(srcdir)/.. \
	-I$(srcdir)/../..

ADA_SPECS_WITH_BODY = \
	xlib-extensions-input_device.ads

ADA_SPECS = $(ADA_SPECS_WITH_BODY) $(ADA_SPECS_WITHOUT_BODY)
ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)
ADA_HDRS = $(ADA_SPECS) $(ADA_BODIES)
ADA_SRCS = $(ADA_SPECS_WITHOUT_BODY) $(ADA_BODIES)
ADA_ALIS = $(ADA_SPECS_WITHOUT_BODY:.ads=.ali) $(ADA_BODIES:.adb=.ali)

pkginclude_HEADERS = $(ADA_HDRS)
ali_DATA = $(ADA_ALIS)
lib_LTLIBRARIES = libxmadaxlib-extensions-input.la

libxmadaxlib_extensions_input_la_SOURCES = $(ADA_SRCS)
libxmadaxlib_extensions_input_la_LDFLAGS = -no-undefined -version-info $(XMADAXLIBLIBVERSIONINFO)
libxmadaxlib_extensions_input_la_LIBADD = \
	$(top_builddir)/source/xlib/extensions/libxmadaxlib-extensions.la

### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
xlib-extensions-input_device.lo: \
	$(srcdir)/xlib-extensions-input_device.adb \
	$(srcdir)/xlib-extensions-input_device.ads \
	$(top_srcdir)/source/xlib/extensions/xlib-extensions.ads \
	$(top_srcdir)/source/xlib/xlib-atoms.ads \
	$(top_srcdir)/source/xlib/xlib-implementation.adb \
	$(top_srcdir)/source/xlib/xlib-implementation.ads \
	$(top_srcdir)/source/xlib/xlib.ads
