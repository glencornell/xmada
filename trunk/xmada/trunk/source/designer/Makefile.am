
ADAFLAGS = -g3 -O0 -ggdb3 -I$(top_srcdir)/source/xlib -I$(top_srcdir)/source/xt -I$(top_srcdir)/source/xm -I$(srcdir)
LIBS = -L/usr/X11R6/lib -lXm -lXt -lXi -lxmadaxlib -lxmadaxt -lxmadaxm -L$(top_builddir)/source/xlib/.libs -L$(top_builddir)/source/xt/.libs -L$(top_builddir)/source/xm/.libs
all:
	gnatmake $(ADAFLAGS) designer-driver.adb -o designer -bargs $(ADABFLAGS) -largs $(LIBS)

depend-local:
