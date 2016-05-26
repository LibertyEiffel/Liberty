-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SIGNAL_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	bsd_signal (a_sig: INTEGER; a_handler: POINTER): POINTER 

		-- function bsd_signal (in `/usr/include/signal.h')
               -- bsd_signal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "bsd_signal"
               }"
               end

	gsignal (a_sig: INTEGER): INTEGER 

		-- function gsignal (in `/usr/include/signal.h')
               -- gsignal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gsignal"
               }"
               end

	kill (a_pid: INTEGER; a_sig: INTEGER): INTEGER 

		-- function kill (in `/usr/include/signal.h')
               -- kill
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "kill"
               }"
               end

	killpg (a_pgrp: INTEGER; a_sig: INTEGER): INTEGER 

		-- function killpg (in `/usr/include/signal.h')
               -- killpg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "killpg"
               }"
               end

	-- `hidden' function __libc_current_sigrtmax skipped.
	-- `hidden' function __libc_current_sigrtmin skipped.
	psiginfo (a_pinfo: POINTER; a_s: POINTER) 

		-- function psiginfo (in `/usr/include/signal.h')
               -- psiginfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "psiginfo"
               }"
               end

	psignal (a_sig: INTEGER; a_s: POINTER) 

		-- function psignal (in `/usr/include/signal.h')
               -- psignal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "psignal"
               }"
               end

	raise (a_sig: INTEGER): INTEGER 

		-- function raise (in `/usr/include/signal.h')
               -- raise
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "raise"
               }"
               end

	sigaction (a_sig: INTEGER; an_act: POINTER; an_oact: POINTER): INTEGER 

		-- function sigaction (in `/usr/include/signal.h')
               -- sigaction
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigaction"
               }"
               end

	sigaddset (a_set: POINTER; a_signo: INTEGER): INTEGER 

		-- function sigaddset (in `/usr/include/signal.h')
               -- sigaddset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigaddset"
               }"
               end

	sigaltstack (a_ss: POINTER; an_oss: POINTER): INTEGER 

		-- function sigaltstack (in `/usr/include/signal.h')
               -- sigaltstack
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigaltstack"
               }"
               end

	sigandset (a_set: POINTER; a_left: POINTER; a_right: POINTER): INTEGER 

		-- function sigandset (in `/usr/include/signal.h')
               -- sigandset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigandset"
               }"
               end

	sigblock (a_mask: INTEGER): INTEGER 

		-- function sigblock (in `/usr/include/signal.h')
               -- sigblock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigblock"
               }"
               end

	sigdelset (a_set: POINTER; a_signo: INTEGER): INTEGER 

		-- function sigdelset (in `/usr/include/signal.h')
               -- sigdelset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigdelset"
               }"
               end

	sigemptyset (a_set: POINTER): INTEGER 

		-- function sigemptyset (in `/usr/include/signal.h')
               -- sigemptyset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigemptyset"
               }"
               end

	sigfillset (a_set: POINTER): INTEGER 

		-- function sigfillset (in `/usr/include/signal.h')
               -- sigfillset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigfillset"
               }"
               end

	siggetmask: INTEGER 

		-- function siggetmask (in `/usr/include/signal.h')
               -- siggetmask
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "siggetmask()"
               }"
               end

	sighold (a_sig: INTEGER): INTEGER 

		-- function sighold (in `/usr/include/signal.h')
               -- sighold
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sighold"
               }"
               end

	sigignore (a_sig: INTEGER): INTEGER 

		-- function sigignore (in `/usr/include/signal.h')
               -- sigignore
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigignore"
               }"
               end

	siginterrupt (a_sig: INTEGER; an_interrupt: INTEGER): INTEGER 

		-- function siginterrupt (in `/usr/include/signal.h')
               -- siginterrupt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "siginterrupt"
               }"
               end

	sigisemptyset (a_set: POINTER): INTEGER 

		-- function sigisemptyset (in `/usr/include/signal.h')
               -- sigisemptyset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigisemptyset"
               }"
               end

	sigismember (a_set: POINTER; a_signo: INTEGER): INTEGER 

		-- function sigismember (in `/usr/include/signal.h')
               -- sigismember
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigismember"
               }"
               end

	signal (a_sig: INTEGER; a_handler: POINTER): POINTER 

		-- function signal (in `/usr/include/signal.h')
               -- signal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "signal"
               }"
               end

	sigorset (a_set: POINTER; a_left: POINTER; a_right: POINTER): INTEGER 

		-- function sigorset (in `/usr/include/signal.h')
               -- sigorset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigorset"
               }"
               end

	sigpause (a_sig: INTEGER): INTEGER 

		-- function sigpause (in `/usr/include/signal.h')
               -- sigpause
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigpause"
               }"
               end

	-- `hidden' function __sigpause skipped.
	sigpending (a_set: POINTER): INTEGER 

		-- function sigpending (in `/usr/include/signal.h')
               -- sigpending
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigpending"
               }"
               end

	sigprocmask (a_how: INTEGER; a_set: POINTER; an_oset: POINTER): INTEGER 

		-- function sigprocmask (in `/usr/include/signal.h')
               -- sigprocmask
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigprocmask"
               }"
               end

       -- unwrappable function sigqueue in file `/usr/include/signal.h'
	sigrelse (a_sig: INTEGER): INTEGER 

		-- function sigrelse (in `/usr/include/signal.h')
               -- sigrelse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigrelse"
               }"
               end

	sigreturn (a_scp: POINTER): INTEGER 

		-- function sigreturn (in `/usr/include/signal.h')
               -- sigreturn
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigreturn"
               }"
               end

	sigset (a_sig: INTEGER; a_disp: POINTER): POINTER 

		-- function sigset (in `/usr/include/signal.h')
               -- sigset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigset"
               }"
               end

	sigsetmask (a_mask: INTEGER): INTEGER 

		-- function sigsetmask (in `/usr/include/signal.h')
               -- sigsetmask
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigsetmask"
               }"
               end

	sigstack (a_ss: POINTER; an_oss: POINTER): INTEGER 

		-- function sigstack (in `/usr/include/signal.h')
               -- sigstack
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigstack"
               }"
               end

	sigsuspend (a_set: POINTER): INTEGER 

		-- function sigsuspend (in `/usr/include/signal.h')
               -- sigsuspend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigsuspend"
               }"
               end

	sigtimedwait (a_set: POINTER; an_info: POINTER; a_timeout: POINTER): INTEGER 

		-- function sigtimedwait (in `/usr/include/signal.h')
               -- sigtimedwait
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigtimedwait"
               }"
               end

	sigvec (a_sig: INTEGER; a_vec: POINTER; an_ovec: POINTER): INTEGER 

		-- function sigvec (in `/usr/include/signal.h')
               -- sigvec
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigvec"
               }"
               end

	sigwait (a_set: POINTER; a_sig: POINTER): INTEGER 

		-- function sigwait (in `/usr/include/signal.h')
               -- sigwait
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigwait"
               }"
               end

	sigwaitinfo (a_set: POINTER; an_info: POINTER): INTEGER 

		-- function sigwaitinfo (in `/usr/include/signal.h')
               -- sigwaitinfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sigwaitinfo"
               }"
               end

	ssignal (a_sig: INTEGER; a_handler: POINTER): POINTER 

		-- function ssignal (in `/usr/include/signal.h')
               -- ssignal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ssignal"
               }"
               end

	sys_siglist: POINTER
               -- sys_siglist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sys_siglist"
               }"
               end

       address_of_sys_siglist: POINTER
               -- Address of sys_siglist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&sys_siglist"
               }"
               end

       set_sys_siglist (a_value: POINTER)
               -- Set variable sys_siglist value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_sys_siglist"
               }"
               end

	-- `hidden' variable _sys_siglist skipped.
	-- `hidden' function __sysv_signal skipped.
	sysv_signal (a_sig: INTEGER; a_handler: POINTER): POINTER 

		-- function sysv_signal (in `/usr/include/signal.h')
               -- sysv_signal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sysv_signal"
               }"
               end


end -- class SIGNAL_EXTERNALS
