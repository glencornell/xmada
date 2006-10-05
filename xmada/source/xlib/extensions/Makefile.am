
include $(top_srcdir)/Makefile.common

SUBDIRS = . input print

ADAFLAGS = $(STD_ADAFLAGS) \
	-I$(srcdir)/..

ADA_SPECS_WITHOUT_BODY = \
	xlib-extensions.ads

ADA_SPECS = $(ADA_SPECS_WITH_BODY) $(ADA_SPECS_WITHOUT_BODY)
ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)
ADA_HDRS = $(ADA_SPECS) $(ADA_BODIES)
ADA_SRCS = $(ADA_SPECS_WITHOUT_BODY) $(ADA_BODIES)
ADA_ALIS = $(ADA_SPECS_WITHOUT_BODY:.ads=.ali) $(ADA_BODIES:.adb=.ali)

pkginclude_HEADERS = $(ADA_HDRS)
ali_DATA = $(ADA_ALIS)
lib_LTLIBRARIES = libxmadaxlib-extensions.la

libxmadaxlib_extensions_la_SOURCES = $(ADA_SRCS)
libxmadaxlib_extensions_la_LDFLAGS = -no-undefined -version-info $(XMADAXLIBLIBVERSIONINFO)
libxmadaxlib_extensions_la_LIBADD = \
	$(top_builddir)/source/xlib/libxmadaxlib.la

depend-local:
	for d in $(SUBDIRS); do \
		(cd $$d && ${MAKE} depend-local); \
	done

### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
