# XMADA

Ada Language bindings for the X Window System and OpenMotif/OSF Motif.

## Authors



## Description

This package contains a library for the interaction of programs
written in Ada language, with the X Window system and a set of
components the OpenMotif graphical user interface (OSF / Motif).

Currently, the library contains about 70% of all standard data types,
widgets and subroutines OpenMotif, about 24% of data types and
subroutines X Toolkit Intrinsics and only 8% of data types and
subroutines of the system X Window (including Xlib, X Print Extension,
X Input Extension).

This is a "thin" binding. Thus, virtually all the package components
have the same name equivalents in the source libraries.  The names of
the components in most cases coincide with the original, except that
an underscore is used to improve readability.

In source libraries, the use of "dynamic" arrays is often encountered,
representing a pointer to the first element of the array and the
number elements of the array. For ease of use, in each such case, a
package provides an additional array type and a conversion subroutine
pointer and the number of elements in the array.

# Build Instructions

To compile the library, you must:

 - Create the configure script:

   ```bash
   autoreconf -vi
   ```

 - Run the configuration script. The configuration script recognizes
   the following optional arguments:

   `--prefix = <path>` The path to install the package.

 - Collect the libraries with the command:

   ```bash
   make
   ```

 - Install the collected libraries with the command:

   ```bash
   make install
   ```

# Bugs

Any comments, comments, suggestions, as well as information about
errors are welcome. Please send them to mailto: vgodunko@vipmail.ru.
