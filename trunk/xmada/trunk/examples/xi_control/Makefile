ADA_INCLUDE_PATH = ../../source/bindings/xlib:../../source/bindings/xt:../../source/bindings/xm
ADA_OBJECTS_PATH = ../../source

ADA_LFLAGS = -L/usr/X11R6/lib

all: AdaXInputDeviceControl
	ADA_INCLUDE_PATH=$(ADA_INCLUDE_PATH) \
	ADA_OBJECTS_PATH=$(ADA_OBJECTS_PATH) \
	gnatmake -gnatwu xi_control_driver.adb -o xi_control -largs $(ADA_LFLAGS)

AdaXInputDeviceControl: AdaXInputDeviceControl.ad
	ln -s AdaXInputDeviceControl.ad AdaXInputDeviceControl

clean:
	rm -f *.o *.ali AdaXInputDeviceControl xi_control

run: all
	XAPPLRESDIR=. ./xi_control
