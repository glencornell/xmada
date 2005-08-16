dnl
dnl Borrowed from acspecific  and modified to add paths to Xm headers
dnl and libs if different from X11
dnl Set xm_includes and/or xm_libraries.
dnl  -------------------------------------------------------------
AC_DEFUN(DX_PATH_XM,
[
AC_ARG_WITH(motif-includes, [  --with-motif-includes   set path for motif includes (default none)],[with_motif_includes=$withval], [with_motif_includes=''])
if test "$with_motif_includes" != "yes" && test -z "$with_motif_includes"
then
        with_motif_includes=''
fi

AC_ARG_WITH(motif-libs, [  --with-motif-libs       set path for motif libraries (default none)],[with_motif_libs=$withval], [with_motif_libs=''])
if test "$with_motif_libs" != "yes" && test -z "$with_motif_libs"
then
  with_motif_libs=''
fi

  # Guess where to find include files, by looking for this one Xm .h file.
  test -z "$xm_direct_test_include" && xm_direct_test_include=Xm/Xm.h

  # First, try using that file with no special directory specified.
AC_PREPROC_IFELSE([AC_LANG_SOURCE([[#include <$xm_direct_test_include>]])],[# We can compile using X headers with no special include directory.
xm_includes=],[# Look for the header file in a standard set of common directories.
# Check X11 before X11Rn because it is often a symlink to the current release.
  for ac_dir in               \
    /usr/X11/include          \
    /usr/X11R6/include        \
    /usr/X11R5/include        \
    /usr/X11R4/include        \
                              \
    /usr/include/X11          \
    /usr/include/X11R6        \
    /usr/include/X11R5        \
    /usr/include/X11R4        \
                              \
    /usr/local/X11/include    \
    /usr/local/X11R6/include  \
    /usr/local/X11R5/include  \
    /usr/local/X11R4/include  \
                              \
    /usr/local/include/X11    \
    /usr/local/include/X11R6  \
    /usr/local/include/X11R5  \
    /usr/local/include/X11R4  \
                              \
    /usr/X386/include         \
    /usr/x386/include         \
    /usr/XFree86/include/X11  \
                              \
    /usr/include              \
    /usr/local/include        \
    /usr/unsupported/include  \
    /usr/athena/include       \
    /usr/local/x11r5/include  \
    /usr/lpp/Xamples/include  \
                              \
    /usr/openwin/include      \
    /usr/openwin/share/include \
    "$with_motif_includes"    \
    ; \
  do
    if test -r "$ac_dir/$xm_direct_test_include"; then
      xm_includes=$ac_dir
      break
    fi
  done])

  # Check for the libraries.

  test -z "$xm_direct_test_library" && xm_direct_test_library=Xm
  test -z "$xm_direct_test_function" && xm_direct_test_function=XmGetDestination

  # See if we find them without any special options.
  # Don't add to $LIBS permanently.
  ac_save_LIBS="$LIBS"
  LIBS="-l$xm_direct_test_library $LIBS"
AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[${xm_direct_test_function}()]])],[LIBS="$ac_save_LIBS"
# We can link Motif programs with no special library path.
xm_libraries=],[LIBS="$ac_save_LIBS"
# First see if replacing the include by lib works.
# Check X11 before X11Rn because it is often a symlink to the current release.
for ac_dir in `echo "$xm_includes" | sed s/include/lib/` \
    /usr/X11/lib          \
    /usr/X11R6/lib        \
    /usr/X11R5/lib        \
    /usr/X11R4/lib        \
                          \
    /usr/lib/X11          \
    /usr/lib/X11R6        \
    /usr/lib/X11R5        \
    /usr/lib/X11R4        \
                          \
    /usr/local/X11/lib    \
    /usr/local/X11R6/lib  \
    /usr/local/X11R5/lib  \
    /usr/local/X11R4/lib  \
                          \
    /usr/local/lib/X11    \
    /usr/local/lib/X11R6  \
    /usr/local/lib/X11R5  \
    /usr/local/lib/X11R4  \
                          \
    /usr/X386/lib         \
    /usr/x386/lib         \
    /usr/XFree86/lib/X11  \
                          \
    /usr/lib              \
    /usr/local/lib        \
    /usr/unsupported/lib  \
    /usr/athena/lib       \
    /usr/local/x11r5/lib  \
    /usr/lpp/Xamples/lib  \
    /lib/usr/lib/X11	  \
                          \
    /usr/openwin/lib      \
    /usr/openwin/share/lib \
    ; \
do
dnl Don't even attempt the hair of trying to link an X program!
  for ac_extension in a so sl; do
    if test -r $ac_dir/lib${xm_direct_test_library}.$ac_extension; then
      xm_libraries=$ac_dir
      break 2
    fi
  done
done])
])

