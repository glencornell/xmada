AC_INIT(xmada, 0.3, vgodunko@rostel.ru)
AC_CONFIG_SRCDIR(source/xlib/xlib.ads)
AC_CONFIG_AUX_DIR(support)
AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE
AM_MAINTAINER_MODE

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
AM_HAS_GNAT_SYMBOLIC_TRACEBACK

AC_SUBST(SED)

##########################################
# Output generated files
##########################################

dnl Important! One file per line, nothing before
dnl or after except whitespace! This section
dnl is edited automatically by make_distrib.

AC_OUTPUT([
	Makefile
	examples/calculator/Makefile
	source/Makefile
	source/designer/Makefile
	source/designer/designer
	source/designer/designer-setup.adb
	source/xlib/Makefile
	source/xlib/extensions/Makefile
	source/xlib/extensions/input/Makefile
	source/xlib/extensions/print/Makefile
	source/xt/Makefile
	source/xm/Makefile
	source/xml/Makefile
	support/adacompiler
	support/run_designer
	xmada-config
])

for f in support/adacompiler support/run_desiger; do
    if test -f $f; then
        chmod +x $f
    fi
done
