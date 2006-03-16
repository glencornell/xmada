AC_INIT(xmada, 0.3, vgodunko@rostel.ru)
AC_CONFIG_SRCDIR(source/xlib/xlib.ads)
AC_CONFIG_AUX_DIR(support)
AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE([foreign 1.8])

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

AM_ENABLE_SHARED(yes)
AM_ENABLE_STATIC(yes)
AM_PROG_LIBTOOL

##  Поиск всех необходимых бибилотек X Window, X Toolkit Intrinsics и Motif.
AC_PATH_X
if test "$x_includes" != "" ; then
    CFLAGS="$CFLAGS -I$x_includes"
fi
if test "$x_libraries" != "" ; then
    LIBS="-L$x_libraries $LIBS"
    XMADACONFIGLIBPATHS="-L$x_libraries"
fi

AC_CHECK_LIB(X11, XCreateGC)
AC_CHECK_LIB(Xt, XtMalloc)

DX_PATH_XM
if test "$xm_includes" != "" ; then
    CFLAGS="$CFLAGS -I$xm_includes"
fi
if test "$xm_libraries" != "" ; then
    LIBS="-L$xm_libraries $LIBS"
    if test "$XMADACONFIGLIBPATHS" != "-L$xm_libraries"; then
        XMADACONFIGLIBPATHS="-L$xm_libraries $XMADACONFIGLIBPATHS"
    fi
fi

AC_CHECK_LIB(Xm, XmGetDestination)

##  Поиск наличия библиотеки Microline.

AC_CHECK_LIB(XmL, XmLCreateGrid,
[AC_DEFINE_UNQUOTED(AS_TR_CPP(HAVE_LIBXML))
 LIBS="-L$x_libraries $LIBS"
 MISS_LIBXML="--  "
],
[HAVE_LIBXML="--  "])
AC_SUBST(HAVE_LIBXML)
AC_SUBST(MISS_LIBXML)
 
AM_CONDITIONAL(HAVE_LIBXML, [test "x$HAVE_LIBXML" = "x"])
AC_SUBST(XMADACONFIGLIBPATHS)

AM_PROG_WORKING_ADA
AM_CROSS_PROG_WORKING_ADA
AM_HAS_GNAT_SYMBOLIC_TRACEBACK

AM_MAINTAINER_MODE

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
