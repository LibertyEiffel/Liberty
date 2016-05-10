-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SIGTHREAD_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	pthread_kill (a_threadid: like long_unsigned; a_signo: INTEGER): INTEGER 

		-- function pthread_kill (in `/usr/include/x86_64-linux-gnu/bits/sigthread.h')
               -- pthread_kill
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_kill"
               }"
               end

	pthread_sigmask (a_how: INTEGER; a_newmask: POINTER; an_oldmask: POINTER): INTEGER 

		-- function pthread_sigmask (in `/usr/include/x86_64-linux-gnu/bits/sigthread.h')
               -- pthread_sigmask
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_sigmask"
               }"
               end

       -- unwrappable function pthread_sigqueue in file `/usr/include/x86_64-linux-gnu/bits/sigthread.h'

end -- class SIGTHREAD_EXTERNALS
