AUTOMAKE_OPTIONS = foreign
ACLOCAL_AMFLAGS = -I m4

SUBDIRS = microline source

bin_SCRIPTS = xmada-config
noinst_SCRIPTS = adacompiler adalinker linker

depend:
	cd source && ${MAKE} depend
