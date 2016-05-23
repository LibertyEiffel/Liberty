/* POSIX include files to be wrapped for Liberty Eiffel */

// This list was taken from Wikipedia (at http://en.wikipedia.org/wiki/C_POSIX_library )

#include <aio.h>
#include <arpa/inet.h>
#include <assert.h>
#include <complex.h>
#include <cpio.h>
// Also in standard C lib: #include <ctype.h>
#include <dirent.h>
// Access to dynamic linking loader (provided by dlfcn.h) is provided by dynamic-linking (sub)cluster
// Also in standard C lib: ##include <errno.h>
#include <fcntl.h>
#include <fenv.h>
// Also in standard C lib: ##include <float.h>
#include <fmtmsg.h>
#include <fnmatch.h>
#include <ftw.h>
#include <glob.h>
#include <grp.h>
#include <iconv.h>
#include <inttypes.h>
#include <iso646.h>
#include <langinfo.h>
#include <libgen.h>
#include <limits.h>
#include <locale.h>
// Also in standard C lib: ##include <math.h>
#include <monetary.h>
#include <mqueue.h>
#include <net/if.h>
#include <netdb.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <nl_types.h>
#include <poll.h>
#include <pthread.h>
#include <pwd.h>
#include <regex.h>
#include <sched.h>
#include <search.h>
#include <semaphore.h>
#include <setjmp.h>
#include <signal.h>
#include <spawn.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
// Also in standard C lib: ##include <stdio.h>
// Also in standard C lib: ##include <stdlib.h>
// Also in standard C lib: ##include <string.h>
#include <strings.h>
#include <stropts.h>
#include <sys/ipc.h>
#include <sys/mman.h>
#include <sys/msg.h>
#include <sys/resource.h>
#include <sys/select.h>
#include <sys/sem.h>
#include <sys/shm.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/statvfs.h>
#include <sys/time.h>
#include <sys/times.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <sys/un.h>
#include <sys/utsname.h>
#include <sys/wait.h>
#include <syslog.h>
#include <tar.h>
#include <termios.h>
#include <tgmath.h>
// Also in standard C lib: ##include <time.h>
#include <ulimit.h>
#include <unistd.h>
#include <utime.h>
#include <utmpx.h>
#include <wchar.h>
#include <wctype.h>
#include <wordexp.h>
