AC_INIT([CStructGen], [0.1.5], [fnchooft@gmail.com], [CStructGen],
        [https://github.com/fnchooft/CStructGen])
AC_PREREQ([2.59])

AM_INIT_AUTOMAKE([1.10 -Wall no-define foreign])

AC_CHECK_PROGS([GSL_TOOL], [gsl])
if test -z "$GSL_TOOL";
   then AC_MSG_ERROR([gsl not found - install it by following the instructions under: https://github.com/fnchooft/gsl])
fi

AC_CHECK_PROGS([CASTXML_TOOL], [castxml])
if test -z "$CASTXML_TOOL";
   then AC_MSG_WARN([castxml not found - install it with apt-get install castxml or by following the instructions under: https://github.com/fnchooft/CastXML])
fi

AC_CHECK_PROGS([SHA1SUM_TOOL], [sha1sum])
if test -z "$SHA1SUM_TOOL";
   then AC_MSG_WARN([sha1sum not found - install it with apt-get install or via the systems package manager])
fi

AC_CONFIG_HEADERS([config.h])
AC_PROG_CXX
LT_INIT([static])

AC_CONFIG_FILES([Makefile ${PACKAGE_NAME}-${PACKAGE_VERSION}.pc:pkg.pc.in])
AC_CONFIG_FILES([scripts/Makefile examples/simple/Makefile examples/pair_test/Makefile])
AC_CONFIG_FILES([scripts/${PACKAGE_NAME}_v${PACKAGE_VERSION}:scripts/gen.sh.in])
AC_CONFIG_FILES([scripts/cast_xml_generate_printers-${PACKAGE_VERSION}.gsl:scripts/cast_xml_generate_printers.gsl.in])
AC_OUTPUT
