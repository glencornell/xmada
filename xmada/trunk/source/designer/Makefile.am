
ADAFLAGS = -g3 -O0 -ggdb3 \
	-I$(srcdir) \
	-I$(top_srcdir)/source/xlib \
	-I$(top_srcdir)/source/xt \
	-I$(top_srcdir)/source/xm

LIBS = -L/usr/X11R6/lib \
	-L$(top_builddir)/source/xlib/.libs \
	-L$(top_builddir)/source/xt/.libs \
	-L$(top_builddir)/source/xm/.libs \
	-lXm -lXt -lXi -lxmadaxlib -lxmadaxt -lxmadaxm

ADALFLAGS = $(LIBS)

all: XmAdaDesigner
	gnatmake $(ADAFLAGS) designer-driver.adb -o designer -bargs $(ADABFLAGS) -largs $(ADALFLAGS)

XmAdaDesigner:
	ln -s $(srcdir)/XmAdaDesigner.ad XmAdaDesigner

depend-local:
