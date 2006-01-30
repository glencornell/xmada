
ADAFLAGS = -gnatW8 -gnatwa -gnatyabcefhiknoprstx \
	 -g3 -O0 -ggdb3 \
	-I$(srcdir) \
	-I$(top_srcdir)/source/xlib \
	-I$(top_builddir)/source/xlib \
	-I$(top_srcdir)/source/xt \
	-I$(top_builddir)/source/xt \
	-I$(top_srcdir)/source/xm \
	-I$(top_builddir)/source/xm

LIBS = -L/usr/X11R6/lib \
	-L$(top_builddir)/source/xlib/.libs \
	-L$(top_builddir)/source/xt/.libs \
	-L$(top_builddir)/source/xm/.libs \
	-lXm -lXt -lXi -lxmadaxlib -lxmadaxt -lxmadaxm

ADALFLAGS = $(LIBS)

CLEANFILES = *.ali *.o XmAdaDesigner b~designer-driver.ad[sb] designer

all: XmAdaDesigner
	gnatmake $(ADAFLAGS) designer-driver.adb -o designer -bargs $(ADABFLAGS) -largs $(ADALFLAGS)

XmAdaDesigner:
	ln -s $(srcdir)/XmAdaDesigner.ad XmAdaDesigner

run:
	LD_LIBRARY_PATH=$(top_builddir)/source/xlib/.libs:$(top_builddir)/source/xt/.libs:$(top_builddir)/source/xm/.libs:$$LD_LIBRARY_PATH XAPPLRESDIR=. ./designer

depend-local:
