include $(top_srcdir)/support/Makefile.common

ADAFLAGS = $(STD_ADAFLAGS) \
	-I$(srcdir) \
	-I$(srcdir)/debug

DESIGNER_ADAFLAGS = $(ADAFLAGS) \
	-I$(top_srcdir)/source/xlib \
	-I$(top_builddir)/source/xlib \
	-I$(top_srcdir)/source/xlib/extensions \
	-I$(top_builddir)/source/xlib/extensions \
	-I$(top_srcdir)/source/xlib/extensions/print \
	-I$(top_builddir)/source/xlib/extensions/print \
	-I$(top_srcdir)/source/xt \
	-I$(top_builddir)/source/xt \
	-I$(top_srcdir)/source/xm \
	-I$(top_builddir)/source/xm

COMPILER_ADAFLAGS = $(ADAFLAGS)

LIBS = -L/usr/X11R6/lib \
	-L$(top_builddir)/source/xlib/.libs \
	-L$(top_builddir)/source/xt/.libs \
	-L$(top_builddir)/source/xm/.libs \
	-lXm -lXt -lxmadaxlib -lxmadaxt -lxmadaxm -lgmem

if HAVE_LIBXML
DESIGNER_ADAFLAGS += \
	-I$(top_srcdir)/source/xml \
	-I$(top_builddir)/source/xml
#LIBS += -L$(top_builddir)/source/xml/.libs -lXmL -lxmadaxml
endif

##  Установка LINK в true подавляет вызов редактора связей libtool.
LINK = true

BARGS = $(STD_BARGS)
ADALFLAGS = $(LIBS)

CLEANFILES += *.ali *.o XmAdaDesigner b~designer-driver.ad[sb] designer

bin_PROGRAMS = compiler designer
libexec_PROGRAMS = designer-driver
designer_SOURCES = designer.in
designer_driver_SOURCES = designer-driver.ads
compiler_SOURCES = compiler.ads
data_DATA = XmAdaDesigner

all: XmAdaDesigner
	gnatmake $(DESIGNER_ADAFLAGS) designer-driver.adb -o designer-driver -bargs $(BARGS) -largs $(ADALFLAGS)
	gnatmake $(COMPILER_ADAFLAGS) compiler-driver.adb -o compiler -bargs $(BARGS)

XmAdaDesigner:
	ln -s $(srcdir)/XmAdaDesigner.ad XmAdaDesigner

depend-local:
