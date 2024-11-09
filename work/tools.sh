# to be sourced by bash tools.

export EXE_SUFFIX=''
export OS=UNIX

case `uname -s` in
    CYGWIN*)
	flavor=generic
	OS=Cygwin
	EXE_SUFFIX=".exe"
	CC_TYPE=${CC_TYPE:-gcc}
	CC=${CC:-$CC_TYPE}
	CFLAGS="-pipe"
	CXX_TYPE=${CXX_TYPE:-g++}
	CXX=${CXX:-${CXX_TYPE}}
	CXXFLAGS="-pipe"
	LDFLAGS="-Xlinker -${hyphen}no-as-needed"
	germ_cc=${CC}
	germ_cflags="-pipe -O2 -c -x c"
	;;
    Linux)
	flavor=Linux
	jobs=$((1 + $(grep '^processor' /proc/cpuinfo|wc -l)))
	CC_TYPE=${CC_TYPE:-gcc}
	CC=${CC:-$CC_TYPE}
	CFLAGS="-pipe"
	CXX_TYPE=${CXX_TYPE:-g++}
	CXX=${CXX:-${CXX_TYPE}}
	CXXFLAGS="-pipe"
	LDFLAGS="-Xlinker -${hyphen}no-as-needed"
	germ_cc=${CC}
	germ_cflags="-pipe -O2 -c -x c"
	;;
    NetBSD)
	export PATH=/usr/pkg/bin:$PATH
	flavor=NetBSD
	jobs=$((1 + $(grep -a '^processor' /proc/cpuinfo|wc -l)))
	CC_TYPE=${CC_TYPE:-gcc}
	CC=${CC:-$CC_TYPE}
	# using boehm-gc from pkgsrc
	PKGSRC_INC=/usr/pkg/include
	PKGSRC_LIBS=/usr/pkg/lib
	CFLAGS="-pipe -I${PKGSRC_INC}"
	CXX_TYPE=${CXX_TYPE:-g++}
	CXX=${CXX:-${CXX_TYPE}}
	CXXFLAGS="-pipe -I${PKGSRC_INC}"
	LDFLAGS="-Xlinker -${hyphen}no-as-needed -L${PKGSRC_LIBS} -Wl,-rpath=${PKGSRC_LIBS}"
	germ_cc=${CC}
	germ_cflags="-pipe -O2 -c -x c"
	;;
    FreeBSD)
	export PATH=/usr/local/bin:$PATH
	flavor=FreeBSD
	jobs=$((1 + $(sysctl -n hw.ncpu)))
	CC_TYPE=${CC_TYPE:-cc}
	CC=${CC:-$CC_TYPE}
	# using boehm-gc from pkg
	PKG_INC=/usr/local/include
	PKG_LIBS=/usr/local/lib
	CFLAGS="-pipe -I${PKG_INC}"
	CXX_TYPE=${CXX_TYPE:-CC}
	CXX=${CXX:-${CXX_TYPE}}
	CXXFLAGS="-pipe -I${PKG_INC}"
	LDFLAGS="-Xlinker -${hyphen}no-as-needed -L${PKG_LIBS} -Wl,-rpath=${PKG_LIBS}"
	germ_cc=${CC}
	germ_cflags="-pipe -O2 -c -x c"
	;;
    OpenBSD)
	export PATH=/usr/local/bin:$PATH
	flavor=OpenBSD
	jobs=$((1 + $(sysctl -n hw.ncpu)))
	CC_TYPE=${CC_TYPE:-cc}
	CC=${CC:-$CC_TYPE}
	# using boehm-gc from pkg
	PKG_INC=/usr/local/include
	PKG_LIBS=/usr/local/lib
	CFLAGS="-pipe -I${PKG_INC}"
	CXX_TYPE=${CXX_TYPE:-CC}
	CXX=${CXX:-${CXX_TYPE}}
	CXXFLAGS="-pipe -I${PKG_INC}"
	LDFLAGS="-Xlinker -${hyphen}no-as-needed -L${PKG_LIBS} -Wl,-rpath=${PKG_LIBS}"
	germ_cc=${CC}
	germ_cflags="-pipe -O2 -c -x c"
	;;
    Darwin)
	flavor=Darwin
	jobs=$((1 + $(sysctl -n hw.physicalcpu)))
	# using boehm-gc from homebrew
	PKG_INC=/opt/homebrew/include
	PKG_LIBS=/opt/homebrew/lib
	CC_TYPE=${CC_TYPE:-gcc}
	CC=${CC:-$CC_TYPE}
	CFLAGS="-pipe -I${PKG_INC}"
	CXX_TYPE=${CXX_TYPE:-g++}
	CXX=${CXX:-${CXX_TYPE}}
	CXXFLAGS="-pipe -I${PKG_INC}"
	LDFLAGS="-L${PKG_LIBS}"
	germ_cc=${CC}
	germ_cflags="-pipe -O2 -c -x c"
	;;
    SunOS)
        export PATH=/usr/gnu/bin:$PATH
        flavor=Solaris
        jobs=$((1 + $(/sbin/psrinfo | wc -l)))
        CC_TYPE=${CC_TYPE:-gcc}
        CC=${CC:-$CC_TYPE}
        CFLAGS="-pipe"
        CXX_TYPE=${CXX_TYPE:-g++}
        CXX=${CXX:-${CXX_TYPE}}
        CXXFLAGS="-pipe"
        LDFLAGS=""
	germ_cc=${CC}
	germ_cflags="-pipe -O2 -c -x c"
        ;;
    *)
	flavor=uknown
	jobs=1
	germ_cc=${CC:-cc}
	germ_cflags="-O2 -c"
	;;
esac


if [ x$plain == x ]; then
    plain=FALSE
fi
if [ x"$(tty)" == "not a tty" ]; then
    plain=TRUE
fi
if [ $plain != TRUE ]; then
    eval `tset -s`
    tput init
fi

bold() {
    test $plain != TRUE && tput bold
}

normal() {
    test $plain != TRUE && tput sgr0
}

italic() {
    test $plain != TRUE && tput sitm
}

underline() {
    test $plain != TRUE && tput smul
}

foreground() {
    if test $plain != TRUE; then
        case $1 in
            black)
                tput setaf 0
                ;;
            red)
                tput setaf 1
                ;;
            green)
                tput setaf 2
                ;;
            yellow)
                tput setaf 3
                ;;
            blue)
                tput setaf 4
                ;;
            magenta)
                tput setaf 5
                ;;
            cyan)
                tput setaf 6
                ;;
            white)
                tput setaf 7
                ;;
        esac
    fi
}

background() {
    if test $plain != TRUE; then
        case $1 in
            black)
                tput setab 0
                ;;
            red)
                tput setab 1
                ;;
            green)
                tput setab 2
                ;;
            yellow)
                tput setab 3
                ;;
            blue)
                tput setab 4
                ;;
            magenta)
                tput setab 5
                ;;
            cyan)
                tput setab 6
                ;;
            white)
                tput setab 7
                ;;
        esac
    fi
}

title() {
    if test $plain = TRUE; then
        echo "== $1 =="
    else
        tput el
        foreground blue
        bold
        echo "$1"
        foreground black
        normal
    fi
}

show_status() {
    if test $plain = TRUE; then
        if test $1 = 0; then
            echo "    OK"
        else
            echo "    KO"
        fi
    else
        tput el
        if test $1 = 0; then
            tput setaf 2
            echo "    OK"
        else
            tput bold
            tput setaf 1
            echo "    KO"
        fi
        tput setaf 0
        tput sgr0
        echo
    fi
}

progress() {
    size=$1
    current=$2
    max=$3
    label="$4"

    echo '~~~~ '$label' ~~~~' >> $LOG
    # no cut label as workaround for mawk bug https://github.com/ThomasDickey/original-mawk/issues/42
    labsize=${#label}
    if [ $labsize -gt 50 ]; then
        label=${label:0:50}"..."
    fi

    if test $plain = TRUE; then
        awk -v max=$max -v cur=$current '
            BEGIN {
                printf(" * %02d/%02d: %s\n", cur, max, "'"$label"'");
                exit;
            }' </dev/null
    else
        col=`expr \`tput cols\` - $size - 11`
        tput setaf 0
        tput sgr0
        # For perceived performance, use a non-linear progress bar
        # See http://blog.codinghorror.com/actual-performance-perceived-performance/
        # (Linear is still available if $linear is non-zero)
        awk -v max=$max -v cur=$current -v size=$size -v col=$col -v linear=0$linear '
            BEGIN {
                x = cur / max;
                if (linear) {
                    fill = int(size * x + .5);
                    printf(" '`tput bold`'%3.1f%%'`tput sgr0`'\t'`tput setab 6`'", 100 * x);
                } else {
                    col += 6;
                    fill = int(size * (x + (1-x)/2) ^ 8 + .5);
                    printf("  '`tput setab 6`'");
                }
                for (i = 0;    i < fill; i++) printf(" ");
                printf("'`tput setab 4`'");
                for (i = fill; i < size; i++) printf(" ");
                printf("'`tput sgr0`' '`tput setaf 5`'%-*.*s'`tput sgr0`' \r", col, col, "'"$label"'");
                exit;
            }' </dev/null >/dev/tty
    fi
}

error_message() {
    if test $plain != TRUE; then
        tput el
        tput setaf 1
        tput bold
    fi
    echo "$1" | tee -a $LOG
    echo "$2" | tee -a $LOG
    if test $plain != TRUE; then
        tput setaf 0
        tput sgr0
    fi
}

error() {
    error_message "$2 failed with status $1" "Please look at $LOG"
}

run() {
    echo "$(date) - $@" >> $LOG
    if eval "$*" >>$LOG 2>&1; then
        status=0
    else
        s=$?
        error $s "$1"
        status=1
    fi
    return $status
}

ok() {
    return
}
