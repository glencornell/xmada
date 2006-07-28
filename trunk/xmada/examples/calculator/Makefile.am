ADAFLAGS = -I$(srcdir) -I. \
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

ADALIBS = -L/usr/X11R6/lib -lXm -lXt

all: main_windows.ads XmAdaCalculator
	gnatmake $(ADAFLAGS) xm_ada_calculator.adb -largs $(ADALIBS)
	XAPPLRESDIR=. ./xm_ada_calculator

main_windows.ads: calculator.xml
	$(top_builddir)/source/designer/compiler --code $(srcdir)/calculator.xml
	gnatchop -w test.ada

XmAdaCalculator: XmAdaCalculator.ad
	iconv --from-code=UTF8 XmAdaCalculator.ad -o XmAdaCalculator

XmAdaCalculator.ad: calculator.xml
	$(top_builddir)/source/designer/compiler --application-resources $(srcdir)/calculator.xml
