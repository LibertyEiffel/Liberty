-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class POSIX_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature {WRAPPER_HANDLER} -- C type definitions (typedefs)
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

       fd_mask: like long
               -- typedef fd_mask from /usr/include/x86_64-linux-gnu/sys/select.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

end
