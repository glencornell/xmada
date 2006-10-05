
SUBDIRS = xlib xt xm xml

SUBDIRS += designer

depend:
	for d in $(SUBDIRS); do \
		(cd $$d && ${MAKE} depend-local); \
	done
