note
   description:
      "Access to the C errno variable"
   copyright:
      "[
               Copyright (C) 2010-2016: Paolo Redaelli

               This library is free software; you can redistribute it and/or
               modify it under the terms of the GNU Lesser General Public License
               as published by the Free Software Foundation; either version 2.1 of
               the License, or (at your option) any later version.

               This library is distributed in the hopeOA that it will be useful, but
               WITHOUT ANY WARRANTY; without even the implied warranty of
               MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
               Lesser General Public License for more details.

               You should have received a copy of the GNU Lesser General Public
               License along with this library; if not, write to the Free Software
               Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
               02110-1301 USA
         ]"

deferred class ERRNO
   -- Access to C errno variable

insert
   ANY
      undefine copy, is_equal
      end

feature {}
   errno: INTEGER_32
         -- number of last error
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "errno"
      }"
      end

   e2big: INTEGER_32
         -- Argument list too long (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "E2BIG"
      }"
      end

   eacces: INTEGER_32
         -- Permission denied (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EACCES"
      }"
      end

   eaddrinuse: INTEGER_32
         -- Address already in use (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EADDRINUSE"
      }"
      end

   eaddrnotavail: INTEGER_32
         -- Address not available (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EADDRNOTAVAIL"
      }"
      end

   eafnosupport: INTEGER_32
         -- Address family not supported (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EAFNOSUPPORT"
      }"
      end

   eagain: INTEGER_32
         -- Resource temporarily unavailable (may be the same value as EWOULDBLOCK) (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EAGAIN"
      }"
      end

   ealready: INTEGER_32
         -- Connection already in progress (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EALREADY"
      }"
      end

   ebade: INTEGER_32
         -- Invalid exchange
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EBADE"
      }"
      end

   ebadf: INTEGER_32
         -- Bad file descriptor (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EBADF"
      }"
      end

   ebadfd: INTEGER_32
         -- File descriptor in bad state
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EBADFD"
      }"
      end

   ebadmsg: INTEGER_32
         -- Bad message (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EBADMSG"
      }"
      end

   ebadr: INTEGER_32
         -- Invalid request descriptor
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EBADR"
      }"
      end

   ebadrqc: INTEGER_32
         -- Invalid request code
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EBADRQC"
      }"
      end

   ebadslt: INTEGER_32
         -- Invalid slot
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EBADSLT"
      }"
      end

   ebusy: INTEGER_32
         -- Device or resource busy (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EBUSY"
      }"
      end

   ecanceled: INTEGER_32
         -- Operation canceled (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ECANCELED"
      }"
      end

   echild: INTEGER_32
         -- No child processes (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ECHILD"
      }"
      end

   echrng: INTEGER_32
         -- Channel number out of range
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ECHRNG"
      }"
      end

   ecomm: INTEGER_32
         -- Communication error on send
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ECOMM"
      }"
      end

   econnaborted: INTEGER_32
         -- Connection aborted (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ECONNABORTED"
      }"
      end

   econnrefused: INTEGER_32
         -- Connection refused (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ECONNREFUSED"
      }"
      end

   econnreset: INTEGER_32
         -- Connection reset (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ECONNRESET"
      }"
      end

   edeadlk: INTEGER_32
         -- Resource deadlock avoided (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EDEADLK"
      }"
      end

   edeadlock: INTEGER_32
         -- Synonym for EDEADLK
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EDEADLOCK"
      }"
      end

   edestaddrreq: INTEGER_32
         -- Destination address required (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EDESTADDRREQ"
      }"
      end

   edom: INTEGER_32
         -- Mathematics argument out of domain of function (POSIX.1, C99)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EDOM"
      }"
      end

   edquot: INTEGER_32
         -- Disk quota exceeded (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EDQUOT"
      }"
      end

   eexist: INTEGER_32
         -- File exists (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EEXIST"
      }"
      end

   efault: INTEGER_32
         -- Bad address (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EFAULT"
      }"
      end

   efbig: INTEGER_32
         -- File too large (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EFBIG"
      }"
      end

   ehostdown: INTEGER_32
         -- Host is down
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EHOSTDOWN"
      }"
      end

   ehostunreach: INTEGER_32
         -- Host is unreachable (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EHOSTUNREACH"
      }"
      end

   eidrm: INTEGER_32
         -- Identifier removed (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EIDRM"
      }"
      end

   eilseq: INTEGER_32
         -- Illegal byte sequence (POSIX.1, C99)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EILSEQ"
      }"
      end

   einprogress: INTEGER_32
         -- Operation in progress (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EINPROGRESS"
      }"
      end

   eintr: INTEGER_32
         -- Interrupted function call (POSIX.1); see signal(7).
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EINTR"
      }"
      end

   einval: INTEGER_32
         -- Invalid argument (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EINVAL"
      }"
      end

   eio: INTEGER_32
         -- Input/output error (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EIO"
      }"
      end

   eisconn: INTEGER_32
         -- Socket is connected (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EISCONN"
      }"
      end

   eisdir: INTEGER_32
         -- Is a directory (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EISDIR"
      }"
      end

   eisnam: INTEGER_32
         -- Is a named type file
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EISNAM"
      }"
      end

   ekeyexpired: INTEGER_32
         -- Key has expired
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EKEYEXPIRED"
      }"
      end

   ekeyrejected: INTEGER_32
         -- Key was rejected by service
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EKEYREJECTED"
      }"
      end

   ekeyrevoked: INTEGER_32
         -- Key has been revoked
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EKEYREVOKED"
      }"
      end

   el2hlt: INTEGER_32
         -- Level 2 halted
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EL2HLT"
      }"
      end

   el2nsync: INTEGER_32
         -- Level 2 not synchronized
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EL2NSYNC"
      }"
      end

   el3hlt: INTEGER_32
         -- Level 3 halted
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EL3HLT"
      }"
      end

   el3rst: INTEGER_32
         -- Level 3 halted
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EL3RST"
      }"
      end

   elibacc: INTEGER_32
         -- Cannot access a needed shared library
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ELIBACC"
      }"
      end

   elibbad: INTEGER_32
         -- Accessing a corrupted shared library
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ELIBBAD"
      }"
      end

   elibmax: INTEGER_32
         -- Attempting to link in too many shared libraries
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ELIBMAX"
      }"
      end

   elibscn: INTEGER_32
         -- lib section in a.out corrupted
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ELIBSCN"
      }"
      end

   elibexec: INTEGER_32
         -- Cannot exec a shared library directly
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ELIBEXEC"
      }"
      end

   eloop: INTEGER_32
         -- Too many levels of symbolic links (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ELOOP"
      }"
      end

   emediumtype: INTEGER_32
         -- Wrong medium type
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EMEDIUMTYPE"
      }"
      end

   emfile: INTEGER_32
         -- Too many open files (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EMFILE"
      }"
      end

   emlink: INTEGER_32
         -- Too many links (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EMLINK"
      }"
      end

   emsgsize: INTEGER_32
         -- Message too long (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EMSGSIZE"
      }"
      end

   emultihop: INTEGER_32
         -- Multihop attempted (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EMULTIHOP"
      }"
      end

   enametoolong: INTEGER_32
         -- Filename too long (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENAMETOOLONG"
      }"
      end

   enetdown: INTEGER_32
         -- Network is down (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENETDOWN"
      }"
      end

   enetreset: INTEGER_32
         -- Connection aborted by network (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENETRESET"
      }"
      end

   enetunreach: INTEGER_32
         -- Network unreachable (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENETUNREACH"
      }"
      end

   enfile: INTEGER_32
         -- Too many open files in system (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENFILE"
      }"
      end

   enobufs: INTEGER_32
         -- No buffer space available (POSIX.1 (XSI STREAMS option))
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOBUFS"
      }"
      end

   enodata: INTEGER_32
         -- No message is available on the STREAM head read queue (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENODATA"
      }"
      end

   enodev: INTEGER_32
         -- No such device (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENODEV"
      }"
      end

   enoent: INTEGER_32
         -- No such file or directory (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOENT"
      }"
      end

   enoexec: INTEGER_32
         -- Exec format error (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOEXEC"
      }"
      end

   enokey: INTEGER_32
         -- Required key not available
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOKEY"
      }"
      end

   enolck: INTEGER_32
         -- No locks available (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOLCK"
      }"
      end

   enolink: INTEGER_32
         -- Link has been severed (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOLINK"
      }"
      end

   enomedium: INTEGER_32
         -- No medium found
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOMEDIUM"
      }"
      end

   enomem: INTEGER_32
         -- Not enough space (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOMEM"
      }"
      end

   enomsg: INTEGER_32
         -- No message of the desired type (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOMSG"
      }"
      end

   enonet: INTEGER_32
         -- Machine is not on the network
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENONET"
      }"
      end

   enopkg: INTEGER_32
         -- Package not installed
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOPKG"
      }"
      end

   enoprotoopt: INTEGER_32
         -- Protocol not available (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOPROTOOPT"
      }"
      end

   enospc: INTEGER_32
         -- No space left on device (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOSPC"
      }"
      end

   enosr: INTEGER_32
         -- No STREAM resources (POSIX.1 (XSI STREAMS option))
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOSR"
      }"
      end

   enostr: INTEGER_32
         -- Not a STREAM (POSIX.1 (XSI STREAMS option))
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOSTR"
      }"
      end

   enosys: INTEGER_32
         -- Function not implemented (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOSYS"
      }"
      end

   enotblk: INTEGER_32
         -- Block device required
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOTBLK"
      }"
      end

   enotconn: INTEGER_32
         -- The socket is not connected (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOTCONN"
      }"
      end

   enotdir: INTEGER_32
         -- Not a directory (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOTDIR"
      }"
      end

   enotempty: INTEGER_32
         -- Directory not empty (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOTEMPTY"
      }"
      end

   enotsock: INTEGER_32
         -- Not a socket (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOTSOCK"
      }"
      end

   enotsup: INTEGER_32
         -- Operation not supported (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOTSUP"
      }"
      end

   enotty: INTEGER_32
         -- Inappropriate I/O control operation (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOTTY"
      }"
      end

   enotuniq: INTEGER_32
         -- Name not unique on network
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENOTUNIQ"
      }"
      end

   enxio: INTEGER_32
         -- No such device or address (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ENXIO"
      }"
      end

   eopnotsupp: INTEGER_32
         -- Operation not supported on socket (POSIX.1) (ENOTSUP  and  EOPNOTSUPP  have the same value on Linux, but according to POSIX.1 these error values should be distinct.)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EOPNOTSUPP"
      }"
      end

   eoverflow: INTEGER_32
         -- Value too large to be stored in data type (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EOVERFLOW"
      }"
      end

   eperm: INTEGER_32
         -- Operation not permitted (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EPERM"
      }"
      end

   epfnosupport: INTEGER_32
         -- Protocol family not supported
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EPFNOSUPPORT"
      }"
      end

   epipe: INTEGER_32
         -- Broken pipe (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EPIPE"
      }"
      end

   eproto: INTEGER_32
         -- Protocol error (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EPROTO"
      }"
      end

   eprotonosupport: INTEGER_32
         -- Protocol not supported (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EPROTONOSUPPORT"
      }"
      end

   eprototype: INTEGER_32
         -- Protocol wrong type for socket (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EPROTOTYPE"
      }"
      end

   erange: INTEGER_32
         -- Result too large (POSIX.1, C99)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ERANGE"
      }"
      end

   eremchg: INTEGER_32
         -- Remote address changed
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EREMCHG"
      }"
      end

   eremote: INTEGER_32
         -- Object is remote
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EREMOTE"
      }"
      end

   eremoteio: INTEGER_32
         -- Remote I/O error
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EREMOTEIO"
      }"
      end

   erestart: INTEGER_32
         -- Interrupted system call should be restarted
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ERESTART"
      }"
      end

   erofs: INTEGER_32
         -- Read-only file system (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EROFS"
      }"
      end

   eshutdown: INTEGER_32
         -- Cannot send after transport endpoint shutdown
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ESHUTDOWN"
      }"
      end

   espipe: INTEGER_32
         -- Invalid seek (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ESPIPE"
      }"
      end

   esocktnosupport: INTEGER_32
         -- Socket type not supported
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ESOCKTNOSUPPORT"
      }"
      end

   esrch: INTEGER_32
         -- No such process (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ESRCH"
      }"
      end

   estale: INTEGER_32
         -- Stale file handle (POSIX.1)   This error can occur for NFS and for other file systems
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ESTALE"
      }"
      end

   estrpipe: INTEGER_32
         -- Streams pipe error
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ESTRPIPE"
      }"
      end

   etime: INTEGER_32
         -- Timer expired (POSIX.1 (XSI STREAMS option))   (POSIX.1 says "STREAM ioctl(2) timeout")
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ETIME"
      }"
      end

   etimedout: INTEGER_32
         -- Connection timed out (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ETIMEDOUT"
      }"
      end

   etxtbsy: INTEGER_32
         -- Text file busy (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ETXTBSY"
      }"
      end

   euclean: INTEGER_32
         -- Structure needs cleaning
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EUCLEAN"
      }"
      end

   eunatch: INTEGER_32
         -- Protocol driver not attached
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EUNATCH"
      }"
      end

   eusers: INTEGER_32
         -- Too many users
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EUSERS"
      }"
      end

   ewouldblock: INTEGER_32
         -- Operation would block (may be same value as EAGAIN) (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EWOULDBLOCK"
      }"
      end

   exdev: INTEGER_32
         -- Improper link (POSIX.1)
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EXDEV"
      }"
      end

   exfull: INTEGER_32
         -- Exchange full
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "EXFULL"
      }"
      end

end -- class ERRNO
