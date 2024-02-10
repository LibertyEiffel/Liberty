/*
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
*/

#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE || (defined __APPLE__ && defined __MACH__)

/*#  include <sys/types.h> done in base.h */
#include <sys/socket.h>
#include <sys/time.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
/*#  include <unistd.h> done in base.h */
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>

#ifndef AF_LOCAL
#define AF_LOCAL AF_UNIX
#endif

#ifndef PF_LOCAL
#define PF_LOCAL PF_UNIX
#endif

#define net_errno errno
#define h_net_errno h_errno
#define SOCKET_ERROR -1
#define INVALID_SOCKET -1
#define SOCKET int
#define closesocket close

#elif defined WIN32

#include <winsock.h>

#define net_errno WSAGetLastError()
#define h_net_errno WSAGetLastError()

#else

#error "Unknown OS. Cannot use sockets. Please drop an email to liberty-eiffel@gnu.org"

#endif

/* ---------------------------------------------------------------------- */

int net_hostname(void* a_hostname);

SOCKET net_tcp(int a, int b, int c, int d, int port, EIF_BOOLEAN sync);
SOCKET net_udp(int a, int b, int c, int d, int port, EIF_BOOLEAN sync);
SOCKET net_local(int port, EIF_BOOLEAN sync);

void net_disconnect(SOCKET fd);
void net_shutdown(SOCKET fd);

SOCKET net_tcp_socket(EIF_BOOLEAN sync);
SOCKET net_udp_socket(EIF_BOOLEAN sync);
SOCKET net_local_socket(EIF_BOOLEAN sync);

SOCKET net_tcp_server(int port, EIF_BOOLEAN sync);
SOCKET net_udp_server(int port, EIF_BOOLEAN sync);
SOCKET net_local_server(int port, EIF_BOOLEAN sync);
SOCKET net_bind_server(SOCKET socket, int port, int sockfamily);

void net_select(int count, SOCKET* afd, float timeout);
SOCKET net_select_one(SOCKET fd, float timeout);

int net_read(SOCKET fd, int count, unsigned char* buffer, EIF_BOOLEAN sync);
int net_write(SOCKET fd, int count, unsigned char* buffer);

int net_set_int_option(SOCKET fd, int level, int optname, int opt_val);

void net_accept(SOCKET server_fd, int* out_values, EIF_BOOLEAN sync);

extern unsigned char* net_last_error;
extern int net_last_error_number;
extern EIF_BOOLEAN net_last_error_try_again(void);

char *net_gethostname(void);
char *net_getdomainname(void);
void net_sethostname(char*hostname,int len);
void net_setdomainname(char*domainname,int len);
