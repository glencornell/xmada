#AUTOMAKE_OPTIONS = foreign no-dependencies
#ACLOCAL_AMFLAGS = -I support

SUBDIRS = xlib xt xm xml designer

depend:
	for d in $(SUBDIRS); do \
		(cd $$d && ${MAKE} depend-local); \
	done
