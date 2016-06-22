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

#define ERROR_BUFFER_SIZE 1024
static unsigned char net_error[ERROR_BUFFER_SIZE];
unsigned char* net_last_error = NULL;
int net_last_error_number;

/* ---------------------------------------------------------------------- */
/* Error management */

static void clear_error(void) {
  net_last_error = NULL;
  net_last_error_number = 0;
}

static void set_error_(const char *file, int line) {
  int err = net_errno;
  switch(err) {
  case 0:
      /*  case EAGAIN: handled by net_last_error_try_again */
    clear_error();
    break;
  default:
    net_last_error = net_error;
    net_last_error_number = err;
    snprintf((char*)net_last_error, ERROR_BUFFER_SIZE, "%s:%d -- %s", file, line, strerror(err));
  }
}

#define set_error() set_error_(__FILE__, __LINE__)

static void set_custom_error(char* error) {
  net_last_error_number = -1;
  net_last_error = net_error;
  snprintf((char*)net_last_error, ERROR_BUFFER_SIZE, "%s", error);
}

static void set_host_error(char* host) {
  char* s;
  int err = h_net_errno;
  if (err == 0) {
    clear_error();
  }
  else {
    net_last_error = net_error;
    net_last_error_number = err;
    switch (err) {
    case HOST_NOT_FOUND:
      s = "Unknown host: ";
      break;
    case NO_ADDRESS:
      s = "Cannot find address of ";
      break;
    case NO_RECOVERY:
      s = "Non-recoverable name server error, cannot find address of";
      break;
    case TRY_AGAIN:
      s = "Server error, try again later; cannot find address of";
      break;
    default:
      s = "Unknown error while getting the address of ";
    }
    snprintf((char*)net_last_error, ERROR_BUFFER_SIZE, "%s%s", s, host);
  }
}

/* ---------------------------------------------------------------------- */
/* Initialization */

#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE

#define init() (1)


EIF_BOOLEAN net_last_error_try_again(void) {
     switch (net_last_error_number) {
#ifdef EAGAIN
     case EAGAIN:
#elif defined(EWOULDBLOCK)
     case EWOULDBLOCK:
#endif
#ifdef EINTR
     case EINTR:
#endif
          return (EIF_BOOLEAN)1;
     }
     return 0;
}

#elif defined WIN32

#define EINPROGRESS WSAEINPROGRESS
#define SHUT_RDWR SD_BOTH
#define socklen_t int

#define MAKEWORD(low, high) ((WORD)(((BYTE)(low)) | (((WORD)((BYTE)(high))) << 8)))

static WSADATA* winsock_data = NULL;

static int init(void) {
  int result = 0;
  clear_error();
  if (winsock_data != NULL) {
    result = 1;
  }
  else {
    WORD version;
    int err;
    winsock_data = (WSADATA*)se_malloc(sizeof(WSADATA));
    version = MAKEWORD(1, 1);
    err = WSAStartup(version, winsock_data);
    if (err != 0) {
      net_last_error = net_error;
      net_last_error_number = err;
      sprintf((char*)net_last_error, "%d: %s", err, "Could not initialize Winsock");
    }
    else if (LOBYTE(winsock_data->wVersion) != 1 || HIBYTE(winsock_data->wVersion) != 1) {
      net_last_error = net_error;
      net_last_error_number = -1;
      sprintf((char*)net_last_error, "%s", "Could not find a suitable version (found %d.%d)",
              HIBYTE(winsock_data->wVersion),
              LOBYTE(winsock_data->wVersion));
      WSACleanup();
    }
    else {
      result = 1;
    }
  }
  return result;
}

EIF_BOOLEAN net_last_error_try_again(void) {
     return 0;
}

#endif

/* ---------------------------------------------------------------------- */
/* Common code */

int net_hostname(void* a_hostname) {
  struct hostent* host;
  int result = -1;

  if (init()) {
    clear_error();
    host = gethostbyname((char*)a_hostname);
    if (host != NULL) {
      result = ntohl(((struct in_addr*)(host->h_addr))->s_addr);
    }
    else {
      set_host_error(a_hostname);
    }
  }

  return result;
}

#ifdef O_ASYNC
static SOCKET control_socket_async(SOCKET socket) {
  SOCKET result = socket;
  int flags;

  clear_error();
  if (socket != INVALID_SOCKET) {
    flags = fcntl (result, F_GETFL) ;
    flags |= O_ASYNC;
    if (fcntl (result, F_SETFL, flags) == -1) {
      result = INVALID_SOCKET;
      set_error();
    }
  }

  return result;
}
#else
#define control_socket_async(socket) (socket)
#endif

#ifndef MSG_DONTWAIT
static SOCKET init_recv(SOCKET socket) {
  SOCKET result = socket;
  int flags;

  clear_error();
  if (socket != INVALID_SOCKET) {
    flags = fcntl (result, F_GETFL) ;
    flags |= O_NONBLOCK;
    if (fcntl (result, F_SETFL, flags) == -1) {
      result = INVALID_SOCKET;
      set_error();
    }
  }

  return result;
}

static SOCKET clear_recv(SOCKET socket) {
  SOCKET result = socket;
  int flags;

  clear_error();
  if (socket != INVALID_SOCKET) {
    flags = fcntl (result, F_GETFL) ;
    flags &= ~O_NONBLOCK;
    if (fcntl (result, F_SETFL, flags) == -1) {
      result = INVALID_SOCKET;
      set_error();
    }
  }

  return result;
}
#endif

static SOCKET address_socket(SOCKET socket, int a, int b, int c, int d, int port) {
  static struct sockaddr_in tmp_addr;
  SOCKET result = socket;
  clear_error();
  tmp_addr.sin_family = AF_INET;
  tmp_addr.sin_port = htons(port);
  tmp_addr.sin_addr.s_addr = htonl((((((a<<8) + b)<<8) + c)<<8) + d) ;
  if (connect(result, (struct sockaddr *)&tmp_addr, sizeof(struct sockaddr_in)) == SOCKET_ERROR && net_errno != EINPROGRESS) {
    result = INVALID_SOCKET;
    set_error();
  }
  set_error();
  return result;
}

SOCKET net_tcp(int a, int b, int c, int d, int port, EIF_BOOLEAN sync) {
  SOCKET result = INVALID_SOCKET;
  if (init()) {
    result = net_tcp_socket(sync);
    if (result != INVALID_SOCKET) {
      result = address_socket(result, a, b, c, d, port);
    }
  }
  return result;
}

SOCKET net_udp(int a, int b, int c, int d, int port, EIF_BOOLEAN sync) {
  SOCKET result = INVALID_SOCKET;
  if (init()) {
    result = net_udp_socket(sync);
    if (result != INVALID_SOCKET) {
      result = address_socket(result, a, b, c, d, port);
    }
  }
  return result;
}

#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE

SOCKET net_local(int port, EIF_BOOLEAN sync) {
  SOCKET result = INVALID_SOCKET;
  static struct sockaddr_in tmp_addr;
  if (init()) {
    clear_error();
    result = net_local_socket(sync);
    tmp_addr.sin_family = AF_LOCAL;
    tmp_addr.sin_port = htons(port);
    if (connect(result, (struct sockaddr *)&tmp_addr, sizeof(struct sockaddr_in)) == SOCKET_ERROR && net_errno != EINPROGRESS) {
      result = INVALID_SOCKET;
      set_error();
    }
  }
  return result;
}

#elif defined WIN32

SOCKET net_local(int port) {
  return INVALID_SOCKET; /* Local namespace not supported in WIN32 */
}

#endif
void net_disconnect(SOCKET fd) {
  int ret;
  if (init()) {
    clear_error();
    ret = closesocket(fd);
    if (ret == SOCKET_ERROR) {
      set_error();
    }
  }
}

void net_shutdown(SOCKET fd) {
  int ret;
  if (init()) {
    clear_error();
    ret = shutdown(fd, SHUT_RDWR);
    if (ret == SOCKET_ERROR) {
      set_error();
    }
  }
}

SOCKET net_tcp_socket(EIF_BOOLEAN sync) {
  SOCKET result = INVALID_SOCKET;
  if (init()) {
    clear_error();
    result = socket(PF_INET, SOCK_STREAM, 0);
    if (result == INVALID_SOCKET) {
      set_error();
    }
    else if (!sync) {
      result = control_socket_async(result);
    }
  }
  return result;
}

SOCKET net_udp_socket(EIF_BOOLEAN sync) {
  SOCKET result = INVALID_SOCKET;
  if (init()) {
    clear_error();
    result = socket(PF_INET, SOCK_DGRAM, 0);
    if (result == INVALID_SOCKET) {
      set_error();
    }
    else if (!sync) {
      result = control_socket_async(result);
    }
  }
  return result;
}

#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE

SOCKET net_local_socket(EIF_BOOLEAN sync) {
  SOCKET result = INVALID_SOCKET;
  if (init()) {
    clear_error();
    result = socket(PF_LOCAL, SOCK_STREAM, 0);
    if (result == INVALID_SOCKET) {
      set_error();
    }
    else if (!sync) {
      result = control_socket_async(result);
    }
  }
  return result;
}
#elif defined WIN32

SOCKET net_local_socket(EIF_BOOLEAN sync) {
  return INVALID_SOCKET;
}
#endif

SOCKET net_bind_server(SOCKET socket, int port, int sockfamily) {
  SOCKET result = socket;
  struct sockaddr_in local;
  socklen_t size = sizeof(struct sockaddr_in);
  int ret;
  local.sin_family = sockfamily;
  local.sin_port = htons(port);
  local.sin_addr.s_addr = htonl(INADDR_ANY);
  ret = bind(result, (struct sockaddr*)&local, size);
  if (ret != 0) {
    set_error();
    result = INVALID_SOCKET;
  }
  else {
    ret = listen(result, 0);
    if (ret != 0) {
      set_error();
      result = INVALID_SOCKET;
    }
  }
  return result;
}

SOCKET net_tcp_server(int port, EIF_BOOLEAN sync) {
  SOCKET result = INVALID_SOCKET;
  if (init()) {
    result = net_bind_server(net_tcp_socket(sync), port, AF_INET);
  }
  return result;
}

SOCKET net_udp_server(int port, EIF_BOOLEAN sync) {
  SOCKET result = INVALID_SOCKET;
  if (init()) {
    result = net_bind_server(net_udp_socket(sync), port, AF_INET);
  }
  return result;
}

#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE
SOCKET net_local_server(int port, EIF_BOOLEAN sync) {
  SOCKET result = INVALID_SOCKET;
  if (init()) {
    result = net_bind_server(net_local_socket(sync), port, AF_LOCAL);
  }
  return result;
}
#elif defined WIN32
SOCKET net_local_server(int port) {
  return INVALID_SOCKET;
}
#endif

void net_select(int count, SOCKET* afd, float timeout) {
  static fd_set tmp_set;
  int r;
  SOCKET maxfd = 0;
  int i;
  SOCKET fd;
  struct timeval tv0 ;
  struct timeval *tv = NULL;

  if (init()) {
    clear_error();

    FD_ZERO(&tmp_set);
    for (i = 0; i < count; i++) {
      fd = afd[i];
      FD_SET(fd, &tmp_set);
      if (fd > maxfd) {
        maxfd = fd;
      }
    }

    if (timeout >= 0) {
      tv0.tv_sec = (int)timeout;
      tv0.tv_usec = (int)(1000000*(timeout-tv0.tv_sec)) ;
      tv = &tv0 ;
    }

    r = select(maxfd + 1, &tmp_set, NULL, NULL, tv);

    if (r > 0) {
      for (i = 0; i < count; i++) {
        fd = afd[i];
        if (!FD_ISSET(fd, &tmp_set)) {
          afd[i] = INVALID_SOCKET;
        }
      }
    }
    else {
      set_error();
    }
  }
}

SOCKET net_select_one(SOCKET fd, float timeout) {
  SOCKET result = INVALID_SOCKET;
  SOCKET afd[1];
  if (init()) {
    afd[0] = fd;
    net_select(1, afd, timeout);
    result = afd[0];
  }
  return result;
}

int net_read(SOCKET fd, int count, unsigned char* buffer, EIF_BOOLEAN sync) {
  int result = -1;
  if (init()) {
    clear_error();
    if (sync) {
      result = recv(fd, (char*)buffer, count, 0);
    }
    else {
#ifdef MSG_DONTWAIT
      result = recv(fd, (char*)buffer, count, MSG_DONTWAIT);
#else
      result = init_recv(fd);
      if (result != SOCKET_ERROR) {
        int r;
        r = recv(result, (char*)buffer, count, 0);
        result = clear_recv(result);
        if (r == SOCKET_ERROR) {
          result = r;
        } else if (result != SOCKET_ERROR) {
          result = r;
        }
      }
#endif
    }
  }
  if (result == SOCKET_ERROR) {
    set_error();
  }
  return result;
}

int net_write(SOCKET fd, int count, unsigned char* buffer) {
  int result = SOCKET_ERROR;
  int charcount;
  if (init()) {
    clear_error();
    result = 0;
    while (result != SOCKET_ERROR && count > 0) {
#ifdef MSG_NOSIGNAL
      charcount = send(fd, (char*)buffer + result, count, MSG_NOSIGNAL);
#elif defined WIN32
      charcount = send(fd, (char*)buffer + result, count, 0);
#else
      signal(SIGPIPE, SIG_IGN);
      charcount = send(fd, (char*)buffer + result, count, 0);
#endif
      if (charcount == SOCKET_ERROR) {
        result = SOCKET_ERROR;
        set_error();
      }
      else {
        count -= charcount;
        result += charcount;
      }
    }
  }
  return result;
}

int net_set_int_option(SOCKET fd, int level, int optname, int opt_val){
        int result = SOCKET_ERROR;

        if (init()) {
                clear_error();
                result = setsockopt(fd, level, optname, &opt_val, sizeof(opt_val)) ;
                if ( result == SOCKET_ERROR )
                        set_error();
        }
        return result ;
}

void net_accept(SOCKET server_fd, int* out_values, EIF_BOOLEAN sync) {
  static struct sockaddr_in tmp_addr;
  int ip, a = 0, b = 0, c = 0, d = 0, port = 0;
  SOCKET fd;
  socklen_t size = sizeof(struct sockaddr_in);
  if (init()) {
    clear_error();
    fd = accept(server_fd, (struct sockaddr*)&tmp_addr, &size);
    if (fd == INVALID_SOCKET) {
      set_error();
    }
    else {
      if (sync) {
         fd = control_socket_async(fd);
      }
      port = ntohs(tmp_addr.sin_port) ;
      ip = ntohl(tmp_addr.sin_addr.s_addr);
      a = (ip >> 24) & 0xff;
      b = (ip >> 16) & 0xff;
      c = (ip >>  8) & 0xff;
      d =  ip        & 0xff;
    }
    out_values[0]=a;
    out_values[1]=b;
    out_values[2]=c;
    out_values[3]=d;
    out_values[4]=port;
    out_values[5]=fd;
  }
}

/* --------------------------------------------------------------------------------------- */
/* The name resolution part was originally written by Serge Romanchenko <se@sir.nensi.net> */

#define FQDN_BUFFER_LENGTH 1024
static char fqdn_buffer[FQDN_BUFFER_LENGTH];

char *net_gethostname(void) {
  char* result = NULL;
  clear_error();
  if (gethostname (fqdn_buffer, FQDN_BUFFER_LENGTH) == 0) {
    result = (char*)fqdn_buffer;
  } else {
    set_error();
  }
  return result;
}

char *net_getdomainname(void) {
  char* result = NULL;
  clear_error();
  if (getdomainname(fqdn_buffer, FQDN_BUFFER_LENGTH) == 0) {
    result = (char*)fqdn_buffer;
  } else {
    set_error();
  }
  return result;
}

void net_sethostname(char*hostname,int len) {
#ifdef __CYGWIN__
  set_custom_error("Cygwin does not support sethostname");
#else
  clear_error();
  if (sethostname(hostname,len) != 0) {
    set_error();
  }
#endif
}

void net_setdomainname(char*domainname,int len) {
#ifdef __CYGWIN__
  set_custom_error("Cygwin does not support setdomainname");
#else
  clear_error();
  if (setdomainname(domainname,len) != 0) {
    set_error();
  }
#endif
}
