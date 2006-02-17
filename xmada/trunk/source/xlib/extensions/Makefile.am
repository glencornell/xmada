include ../../../support/Makefile.common

SUBDIRS=input print

alidir = $(includedir)/xmada

ADAFLAGS = -I$(srcdir)/..

ADA_SPECS = $(ADA_SPECS_WITH_BODY) \
	xlib-extensions.ads

ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)

ADA_LIBADD = $(ADA_SPECS:.ads=.lo)

lib_LTLIBRARIES = libxmadaxlib-extensions.la
libxmadaxlib_extensions_la_SOURCES =
libxmadaxlib_extensions_la_LIBADD = $(ADA_LIBADD)
libxmadaxlib_extensions_la_LDFLAGS = -no-undefined -version-info $(XMADAXLIBLIBVERSIONINFO)

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(alidir)
	for f in $(srcdir)/*.ad[sb] *.ali; do $(INSTALL) -m 444 $$f $(DESTDIR)$(alidir); done

depend-local:
	for d in $(SUBDIRS); do \
		(cd $$d && ${MAKE} depend-local); \
	done
### DO NOT REMOVE THIS LINE, IT IS USED BY MAKEDEPEND ###
