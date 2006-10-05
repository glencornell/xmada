
include $(top_srcdir)/Makefile.common

ADAFLAGS = $(STD_ADAFLAGS) \
	-I$(srcdir)/../xlib \
	-I$(srcdir)/../xt \
	-I$(srcdir)/../xm

ADA_SPECS_WITH_BODY = \
	xml_grid.ads

ADA_SPECS_WITHOUT_BODY = \
	xml.ads \
	xml_string_defs.ads

ADA_SPECS = $(ADA_SPECS_WITH_BODY) $(ADA_SPECS_WITHOUT_BODY)
ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)
ADA_HDRS = $(ADA_SPECS) $(ADA_BODIES)
ADA_SRCS = $(ADA_SPECS_WITHOUT_BODY) $(ADA_BODIES)
ADA_ALIS = $(ADA_SPECS_WITHOUT_BODY:.ads=.ali) $(ADA_BODIES:.adb=.ali)

pkginclude_HEADERS = $(ADA_HDRS)
ali_DATA = $(ADA_ALIS)
lib_LTLIBRARIES = libxmadaxml.la

libxmadaxml_la_SOURCES = $(ADA_SRCS)
libxmadaxml_la_LDFLAGS = -no-undefined -version-info $(XMADAXMLLIBVERSIONINFO)
libxmadaxml_la_LIBADD = \
	$(top_builddir)/source/xm/libxmadaxm.la \
	$(top_builddir)/microline/XmL/libXmL.la

### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
xml.lo: \
	$(srcdir)/xml.ads
xml_grid.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(top_srcdir)/source/xm/xm_manager.ads \
	$(srcdir)/xml.ads \
	$(srcdir)/xml_grid.adb \
	$(srcdir)/xml_grid.ads \
	$(top_srcdir)/source/xt/xt-ancillary_types.ads \
	$(top_srcdir)/source/xt/xt-composite_management.ads \
	$(top_srcdir)/source/xt/xt.ads \
	$(top_srcdir)/source/xt/xt_composite.ads \
	$(top_srcdir)/source/xt/xt_constraint.ads \
	$(top_srcdir)/source/xt/xt_core.ads
xml_string_defs.lo: \
	$(top_srcdir)/source/xlib/xlib-events.ads \
	$(top_srcdir)/source/xlib/xlib-resource_manager.ads \
	$(top_srcdir)/source/xlib/xlib.ads \
	$(srcdir)/xml_string_defs.ads \
	$(top_srcdir)/source/xt/xt.ads
