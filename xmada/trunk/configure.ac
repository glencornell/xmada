AC_INIT(xmada, 0.3, vgodunko@rost.ru)
AC_CONFIG_SRCDIR(source/xlib/xlib.ads)
AC_CONFIG_AUX_DIR(support)
AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE

XMADA_MAJOR_VERSION=0
XMADA_MINOR_VERSION=3
AC_SUBST(XMADA_MAJOR_VERSION)
AC_SUBST(XMADA_MINOR_VERSION)

XMADAXLIBLIBVERSIONINFO=0:3:0
XMADAXTLIBVERSIONINFO=0:3:0
XMADAXMLIBVERSIONINFO=0:3:0
XMADAXMLLIBVERSIONINFO=0:3:0
AC_SUBST(XMADAXLIBLIBVERSIONINFO)
AC_SUBST(XMADAXTLIBVERSIONINFO)
AC_SUBST(XMADAXMLIBVERSIONINFO)
AC_SUBST(XMADAXMLLIBVERSIONINFO)

AM_PROG_WORKING_ADA
AM_CROSS_PROG_WORKING_ADA
AM_ENABLE_SHARED(yes)
AM_ENABLE_STATIC(yes)
AM_PROG_LIBTOOL

AC_SUBST(SED)

##########################################
# Output generated files
##########################################

dnl Important! One file per line, nothing before
dnl or after except whitespace! This section
dnl is edited automatically by make_distrib.

AC_OUTPUT([
	Makefile
	source/Makefile
	source/xlib/Makefile
	source/xt/Makefile
	source/xm/Makefile
	source/xml/Makefile
	support/adacompiler
	xmada-config
])

chmod +x support/adacompiler
