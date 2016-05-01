-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class POSIX_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature {ANY} -- C type definitions (typedefs)
       wctrans_t: POINTER
               -- typedef wctrans_t from /usr/include/wctype.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       wctype_t: like long_unsigned
               -- typedef wctype_t from /usr/include/wctype.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       double_t: REAL
               -- typedef double_t from /usr/include/x86_64-linux-gnu/bits/mathdef.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       float_t: REAL_32
               -- typedef float_t from /usr/include/x86_64-linux-gnu/bits/mathdef.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       tcflag_t: NATURAL
               -- typedef tcflag_t from /usr/include/x86_64-linux-gnu/bits/termios.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       speed_t: NATURAL
               -- typedef speed_t from /usr/include/x86_64-linux-gnu/bits/termios.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       cc_t: CHARACTER
               -- typedef cc_t from /usr/include/x86_64-linux-gnu/bits/termios.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       shmatt_t: like long_unsigned
               -- typedef shmatt_t from /usr/include/x86_64-linux-gnu/bits/shm.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       rlim64_t: like long_unsigned
               -- typedef rlim64_t from /usr/include/x86_64-linux-gnu/bits/resource.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       rlim_t: like long_unsigned
               -- typedef rlim_t from /usr/include/x86_64-linux-gnu/bits/resource.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       msglen_t: like long_unsigned
               -- typedef msglen_t from /usr/include/x86_64-linux-gnu/bits/msq.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       msgqnum_t: like long_unsigned
               -- typedef msgqnum_t from /usr/include/x86_64-linux-gnu/bits/msq.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       t_uscalar_t: NATURAL
               -- typedef t_uscalar_t from /usr/include/stropts.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       t_scalar_t: INTEGER
               -- typedef t_scalar_t from /usr/include/stropts.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       fpregset_t: POINTER
               -- typedef fpregset_t from /usr/include/x86_64-linux-gnu/sys/ucontext.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       greg_t: INTEGER_64
               -- typedef greg_t from /usr/include/x86_64-linux-gnu/sys/ucontext.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sig_t: POINTER
               -- typedef sig_t from /usr/include/signal.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sighandler_t: POINTER
               -- typedef sighandler_t from /usr/include/signal.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sig_atomic_t: INTEGER
               -- typedef sig_atomic_t from /usr/include/signal.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       comparison_fn_t: POINTER
               -- typedef comparison_fn_t from /usr/include/search.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       regoff_t: INTEGER
               -- typedef regoff_t from /usr/include/regex.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       reg_syntax_t: like long_unsigned
               -- typedef reg_syntax_t from /usr/include/regex.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       active_reg_t: like long_unsigned
               -- typedef active_reg_t from /usr/include/regex.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       s_reg_t: like long
               -- typedef s_reg_t from /usr/include/regex.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       nfds_t: like long_unsigned
               -- typedef nfds_t from /usr/include/x86_64-linux-gnu/sys/poll.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       tcp_seq: NATURAL
               -- typedef tcp_seq from /usr/include/netinet/tcp.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       mqd_t: INTEGER
               -- typedef mqd_t from /usr/include/x86_64-linux-gnu/bits/mqueue.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       locale_t: POINTER
               -- typedef locale_t from /usr/include/xlocale.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       nl_item: INTEGER
               -- typedef nl_item from /usr/include/nl_types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       nl_catd: POINTER
               -- typedef nl_catd from /usr/include/nl_types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       iconv_t: POINTER
               -- typedef iconv_t from /usr/include/iconv.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       fexcept_t: NATURAL_16
               -- typedef fexcept_t from /usr/include/x86_64-linux-gnu/bits/fenv.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       in_port_t: like uint16_t
               -- typedef in_port_t from /usr/include/netinet/in.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       in_addr_t: like uint32_t
               -- typedef in_addr_t from /usr/include/netinet/in.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sa_family_t: NATURAL_16
               -- typedef sa_family_t from /usr/include/x86_64-linux-gnu/bits/sockaddr.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       socklen_t: NATURAL
               -- typedef socklen_t from /usr/include/x86_64-linux-gnu/bits/socket.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uintmax_t: like uintmax_t
               -- typedef uintmax_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       intmax_t: like intmax_t
               -- typedef intmax_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uintptr_t: like uintptr_t
               -- typedef uintptr_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       intptr_t: like intptr_t
               -- typedef intptr_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint_fast64_t: like uint_fast64_t
               -- typedef uint_fast64_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint_fast32_t: like uint_fast32_t
               -- typedef uint_fast32_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint_fast16_t: like uint_fast16_t
               -- typedef uint_fast16_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint_fast8_t: like uint_fast8_t
               -- typedef uint_fast8_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       int_fast64_t: like int_fast64_t
               -- typedef int_fast64_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       int_fast32_t: like int_fast32_t
               -- typedef int_fast32_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       int_fast16_t: like int_fast16_t
               -- typedef int_fast16_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       int_fast8_t: like int_fast8_t
               -- typedef int_fast8_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint_least64_t: like uint_least64_t
               -- typedef uint_least64_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint_least32_t: like uint_least32_t
               -- typedef uint_least32_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint_least16_t: like uint_least16_t
               -- typedef uint_least16_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint_least8_t: like uint_least8_t
               -- typedef uint_least8_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       int_least64_t: like int_least64_t
               -- typedef int_least64_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       int_least32_t: like int_least32_t
               -- typedef int_least32_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       int_least16_t: like int_least16_t
               -- typedef int_least16_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       int_least8_t: like int_least8_t
               -- typedef int_least8_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint64_t: like uint64_t
               -- typedef uint64_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint32_t: like uint32_t
               -- typedef uint32_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint16_t: like uint16_t
               -- typedef uint16_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint8_t: like uint8_t
               -- typedef uint8_t from /usr/include/stdint.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       pthread_spinlock_t: INTEGER
               -- typedef pthread_spinlock_t from /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       pthread_once_t: INTEGER
               -- typedef pthread_once_t from /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       pthread_key_t: NATURAL
               -- typedef pthread_key_t from /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       pthread_t: like long_unsigned
               -- typedef pthread_t from /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       fsfilcnt64_t: like long_unsigned
               -- typedef fsfilcnt64_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       fsblkcnt64_t: like long_unsigned
               -- typedef fsblkcnt64_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       blkcnt64_t: like long
               -- typedef blkcnt64_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       fsfilcnt_t: like long_unsigned
               -- typedef fsfilcnt_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       fsblkcnt_t: like long_unsigned
               -- typedef fsblkcnt_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       blkcnt_t: like long
               -- typedef blkcnt_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       blksize_t: like long
               -- typedef blksize_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       fd_mask: like long
               -- typedef fd_mask from /usr/include/x86_64-linux-gnu/sys/select.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       register_t: like long
               -- typedef register_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       u_int64_t: like long_unsigned
               -- typedef u_int64_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       u_int32_t: NATURAL
               -- typedef u_int32_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       u_int16_t: NATURAL_16
               -- typedef u_int16_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       u_int8_t: CHARACTER
               -- typedef u_int8_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       int64_t: like int64_t
               -- typedef int64_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       int32_t: like int32_t
               -- typedef int32_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       int16_t: like int16_t
               -- typedef int16_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       int8_t: like int8_t
               -- typedef int8_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uint: NATURAL
               -- typedef uint from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       ushort: NATURAL_16
               -- typedef ushort from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       ulong: like long_unsigned
               -- typedef ulong from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       suseconds_t: like long
               -- typedef suseconds_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       useconds_t: NATURAL
               -- typedef useconds_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       timer_t: POINTER
               -- typedef timer_t from /usr/include/time.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       clockid_t: INTEGER
               -- typedef clockid_t from /usr/include/time.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       time_t: like long
               -- typedef time_t from /usr/include/time.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       clock_t: like long
               -- typedef clock_t from /usr/include/time.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       key_t: INTEGER
               -- typedef key_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       caddr_t: POINTER
               -- typedef caddr_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       daddr_t: INTEGER
               -- typedef daddr_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       ssize_t: like ssize_t
               -- typedef ssize_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       id_t: NATURAL
               -- typedef id_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       pid_t: INTEGER
               -- typedef pid_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       off64_t: like long
               -- typedef off64_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       off_t: like long
               -- typedef off_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uid_t: NATURAL
               -- typedef uid_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       nlink_t: like long_unsigned
               -- typedef nlink_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       mode_t: NATURAL
               -- typedef mode_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       gid_t: NATURAL
               -- typedef gid_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       dev_t: like long_unsigned
               -- typedef dev_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       ino64_t: like long_unsigned
               -- typedef ino64_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       ino_t: like long_unsigned
               -- typedef ino_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       loff_t: like long
               -- typedef loff_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       u_quad_t: like long_unsigned
               -- typedef u_quad_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       quad_t: like long
               -- typedef quad_t from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       u_long: like long_unsigned
               -- typedef u_long from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       u_int: NATURAL
               -- typedef u_int from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       u_short: NATURAL_16
               -- typedef u_short from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       u_char: CHARACTER
               -- typedef u_char from /usr/include/x86_64-linux-gnu/sys/types.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

end
