AUTOMAKE_OPTIONS = foreign no-dependencies
ACLOCAL_AMFLAGS = -I support

SUBDIRS = source

depend:
	cd source && ${MAKE} depend

install-exec-local:
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) xmada-config $(DESTDIR)$(bindir)/xmada-config
