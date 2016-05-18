-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class PTHREAD_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	pthread_atfork (a_prepare: POINTER; a_parent: POINTER; a_child: POINTER): INTEGER 

		-- function pthread_atfork (in `/usr/include/pthread.h')
               -- pthread_atfork
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_atfork"
               }"
               end

	pthread_attr_destroy (an_attr: POINTER): INTEGER 

		-- function pthread_attr_destroy (in `/usr/include/pthread.h')
               -- pthread_attr_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_destroy"
               }"
               end

	pthread_attr_getaffinity_np (an_attr: POINTER; a_cpusetsize: like size_t; a_cpuset: POINTER): INTEGER 

		-- function pthread_attr_getaffinity_np (in `/usr/include/pthread.h')
               -- pthread_attr_getaffinity_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_getaffinity_np"
               }"
               end

	pthread_attr_getdetachstate (an_attr: POINTER; a_detachstate: POINTER): INTEGER 

		-- function pthread_attr_getdetachstate (in `/usr/include/pthread.h')
               -- pthread_attr_getdetachstate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_getdetachstate"
               }"
               end

	pthread_attr_getguardsize (an_attr: POINTER; a_guardsize: POINTER): INTEGER 

		-- function pthread_attr_getguardsize (in `/usr/include/pthread.h')
               -- pthread_attr_getguardsize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_getguardsize"
               }"
               end

	pthread_attr_getinheritsched (an_attr: POINTER; an_inherit_external: POINTER): INTEGER 

		-- function pthread_attr_getinheritsched (in `/usr/include/pthread.h')
               -- pthread_attr_getinheritsched
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_getinheritsched"
               }"
               end

	pthread_attr_getschedparam (an_attr: POINTER; a_param: POINTER): INTEGER 

		-- function pthread_attr_getschedparam (in `/usr/include/pthread.h')
               -- pthread_attr_getschedparam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_getschedparam"
               }"
               end

	pthread_attr_getschedpolicy (an_attr: POINTER; a_policy: POINTER): INTEGER 

		-- function pthread_attr_getschedpolicy (in `/usr/include/pthread.h')
               -- pthread_attr_getschedpolicy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_getschedpolicy"
               }"
               end

	pthread_attr_getscope (an_attr: POINTER; a_scope: POINTER): INTEGER 

		-- function pthread_attr_getscope (in `/usr/include/pthread.h')
               -- pthread_attr_getscope
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_getscope"
               }"
               end

	pthread_attr_getstack (an_attr: POINTER; a_stackaddr: POINTER; a_stacksize: POINTER): INTEGER 

		-- function pthread_attr_getstack (in `/usr/include/pthread.h')
               -- pthread_attr_getstack
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_getstack"
               }"
               end

	pthread_attr_getstackaddr (an_attr: POINTER; a_stackaddr: POINTER): INTEGER 

		-- function pthread_attr_getstackaddr (in `/usr/include/pthread.h')
               -- pthread_attr_getstackaddr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_getstackaddr"
               }"
               end

	pthread_attr_getstacksize (an_attr: POINTER; a_stacksize: POINTER): INTEGER 

		-- function pthread_attr_getstacksize (in `/usr/include/pthread.h')
               -- pthread_attr_getstacksize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_getstacksize"
               }"
               end

	pthread_attr_init (an_attr: POINTER): INTEGER 

		-- function pthread_attr_init (in `/usr/include/pthread.h')
               -- pthread_attr_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_init"
               }"
               end

	pthread_attr_setaffinity_np (an_attr: POINTER; a_cpusetsize: like size_t; a_cpuset: POINTER): INTEGER 

		-- function pthread_attr_setaffinity_np (in `/usr/include/pthread.h')
               -- pthread_attr_setaffinity_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_setaffinity_np"
               }"
               end

	pthread_attr_setdetachstate (an_attr: POINTER; a_detachstate: INTEGER): INTEGER 

		-- function pthread_attr_setdetachstate (in `/usr/include/pthread.h')
               -- pthread_attr_setdetachstate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_setdetachstate"
               }"
               end

	pthread_attr_setguardsize (an_attr: POINTER; a_guardsize: like size_t): INTEGER 

		-- function pthread_attr_setguardsize (in `/usr/include/pthread.h')
               -- pthread_attr_setguardsize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_setguardsize"
               }"
               end

	pthread_attr_setinheritsched (an_attr: POINTER; an_inherit_external: INTEGER): INTEGER 

		-- function pthread_attr_setinheritsched (in `/usr/include/pthread.h')
               -- pthread_attr_setinheritsched
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_setinheritsched"
               }"
               end

	pthread_attr_setschedparam (an_attr: POINTER; a_param: POINTER): INTEGER 

		-- function pthread_attr_setschedparam (in `/usr/include/pthread.h')
               -- pthread_attr_setschedparam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_setschedparam"
               }"
               end

	pthread_attr_setschedpolicy (an_attr: POINTER; a_policy: INTEGER): INTEGER 

		-- function pthread_attr_setschedpolicy (in `/usr/include/pthread.h')
               -- pthread_attr_setschedpolicy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_setschedpolicy"
               }"
               end

	pthread_attr_setscope (an_attr: POINTER; a_scope: INTEGER): INTEGER 

		-- function pthread_attr_setscope (in `/usr/include/pthread.h')
               -- pthread_attr_setscope
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_setscope"
               }"
               end

	pthread_attr_setstack (an_attr: POINTER; a_stackaddr: POINTER; a_stacksize: like size_t): INTEGER 

		-- function pthread_attr_setstack (in `/usr/include/pthread.h')
               -- pthread_attr_setstack
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_setstack"
               }"
               end

	pthread_attr_setstackaddr (an_attr: POINTER; a_stackaddr: POINTER): INTEGER 

		-- function pthread_attr_setstackaddr (in `/usr/include/pthread.h')
               -- pthread_attr_setstackaddr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_setstackaddr"
               }"
               end

	pthread_attr_setstacksize (an_attr: POINTER; a_stacksize: like size_t): INTEGER 

		-- function pthread_attr_setstacksize (in `/usr/include/pthread.h')
               -- pthread_attr_setstacksize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_attr_setstacksize"
               }"
               end

	pthread_barrier_destroy (a_barrier: POINTER): INTEGER 

		-- function pthread_barrier_destroy (in `/usr/include/pthread.h')
               -- pthread_barrier_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_barrier_destroy"
               }"
               end

	pthread_barrier_init (a_barrier: POINTER; an_attr: POINTER; a_count: NATURAL): INTEGER 

		-- function pthread_barrier_init (in `/usr/include/pthread.h')
               -- pthread_barrier_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_barrier_init"
               }"
               end

	pthread_barrier_wait (a_barrier: POINTER): INTEGER 

		-- function pthread_barrier_wait (in `/usr/include/pthread.h')
               -- pthread_barrier_wait
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_barrier_wait"
               }"
               end

	pthread_barrierattr_destroy (an_attr: POINTER): INTEGER 

		-- function pthread_barrierattr_destroy (in `/usr/include/pthread.h')
               -- pthread_barrierattr_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_barrierattr_destroy"
               }"
               end

	pthread_barrierattr_getpshared (an_attr: POINTER; a_pshared: POINTER): INTEGER 

		-- function pthread_barrierattr_getpshared (in `/usr/include/pthread.h')
               -- pthread_barrierattr_getpshared
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_barrierattr_getpshared"
               }"
               end

	pthread_barrierattr_init (an_attr: POINTER): INTEGER 

		-- function pthread_barrierattr_init (in `/usr/include/pthread.h')
               -- pthread_barrierattr_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_barrierattr_init"
               }"
               end

	pthread_barrierattr_setpshared (an_attr: POINTER; a_pshared: INTEGER): INTEGER 

		-- function pthread_barrierattr_setpshared (in `/usr/include/pthread.h')
               -- pthread_barrierattr_setpshared
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_barrierattr_setpshared"
               }"
               end

	pthread_cancel (a_th: like long_unsigned): INTEGER 

		-- function pthread_cancel (in `/usr/include/pthread.h')
               -- pthread_cancel
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_cancel"
               }"
               end

	pthread_cond_broadcast (a_cond: POINTER): INTEGER 

		-- function pthread_cond_broadcast (in `/usr/include/pthread.h')
               -- pthread_cond_broadcast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_cond_broadcast"
               }"
               end

	pthread_cond_destroy (a_cond: POINTER): INTEGER 

		-- function pthread_cond_destroy (in `/usr/include/pthread.h')
               -- pthread_cond_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_cond_destroy"
               }"
               end

	pthread_cond_init (a_cond: POINTER; a_cond_attr: POINTER): INTEGER 

		-- function pthread_cond_init (in `/usr/include/pthread.h')
               -- pthread_cond_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_cond_init"
               }"
               end

	pthread_cond_signal (a_cond: POINTER): INTEGER 

		-- function pthread_cond_signal (in `/usr/include/pthread.h')
               -- pthread_cond_signal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_cond_signal"
               }"
               end

	pthread_cond_timedwait (a_cond: POINTER; a_mutex: POINTER; an_abstime: POINTER): INTEGER 

		-- function pthread_cond_timedwait (in `/usr/include/pthread.h')
               -- pthread_cond_timedwait
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_cond_timedwait"
               }"
               end

	pthread_cond_wait (a_cond: POINTER; a_mutex: POINTER): INTEGER 

		-- function pthread_cond_wait (in `/usr/include/pthread.h')
               -- pthread_cond_wait
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_cond_wait"
               }"
               end

	pthread_condattr_destroy (an_attr: POINTER): INTEGER 

		-- function pthread_condattr_destroy (in `/usr/include/pthread.h')
               -- pthread_condattr_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_condattr_destroy"
               }"
               end

	pthread_condattr_getclock (an_attr: POINTER; a_clock_id: POINTER): INTEGER 

		-- function pthread_condattr_getclock (in `/usr/include/pthread.h')
               -- pthread_condattr_getclock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_condattr_getclock"
               }"
               end

	pthread_condattr_getpshared (an_attr: POINTER; a_pshared: POINTER): INTEGER 

		-- function pthread_condattr_getpshared (in `/usr/include/pthread.h')
               -- pthread_condattr_getpshared
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_condattr_getpshared"
               }"
               end

	pthread_condattr_init (an_attr: POINTER): INTEGER 

		-- function pthread_condattr_init (in `/usr/include/pthread.h')
               -- pthread_condattr_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_condattr_init"
               }"
               end

	pthread_condattr_setclock (an_attr: POINTER; a_clock_id: INTEGER): INTEGER 

		-- function pthread_condattr_setclock (in `/usr/include/pthread.h')
               -- pthread_condattr_setclock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_condattr_setclock"
               }"
               end

	pthread_condattr_setpshared (an_attr: POINTER; a_pshared: INTEGER): INTEGER 

		-- function pthread_condattr_setpshared (in `/usr/include/pthread.h')
               -- pthread_condattr_setpshared
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_condattr_setpshared"
               }"
               end

	pthread_create (a_newthread: POINTER; an_attr: POINTER; a_start_routine: POINTER; an_arg: POINTER): INTEGER 

		-- function pthread_create (in `/usr/include/pthread.h')
               -- pthread_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_create"
               }"
               end

	pthread_detach (a_th: like long_unsigned): INTEGER 

		-- function pthread_detach (in `/usr/include/pthread.h')
               -- pthread_detach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_detach"
               }"
               end

	pthread_equal (a_thread1: like long_unsigned; a_thread2: like long_unsigned): INTEGER 

		-- function pthread_equal (in `/usr/include/pthread.h')
               -- pthread_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_equal"
               }"
               end

	pthread_exit (a_retval: POINTER) 

		-- function pthread_exit (in `/usr/include/pthread.h')
               -- pthread_exit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_exit"
               }"
               end

	pthread_getaffinity_np (a_th: like long_unsigned; a_cpusetsize: like size_t; a_cpuset: POINTER): INTEGER 

		-- function pthread_getaffinity_np (in `/usr/include/pthread.h')
               -- pthread_getaffinity_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_getaffinity_np"
               }"
               end

	pthread_getattr_default_np (an_attr: POINTER): INTEGER 

		-- function pthread_getattr_default_np (in `/usr/include/pthread.h')
               -- pthread_getattr_default_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_getattr_default_np"
               }"
               end

	pthread_getattr_np (a_th: like long_unsigned; an_attr: POINTER): INTEGER 

		-- function pthread_getattr_np (in `/usr/include/pthread.h')
               -- pthread_getattr_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_getattr_np"
               }"
               end

	pthread_getconcurrency: INTEGER 

		-- function pthread_getconcurrency (in `/usr/include/pthread.h')
               -- pthread_getconcurrency
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_getconcurrency()"
               }"
               end

	pthread_getcpuclockid (a_thread_id: like long_unsigned; a_clock_id: POINTER): INTEGER 

		-- function pthread_getcpuclockid (in `/usr/include/pthread.h')
               -- pthread_getcpuclockid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_getcpuclockid"
               }"
               end

	pthread_getname_np (a_target_thread: like long_unsigned; a_buf: POINTER; a_buflen: like size_t): INTEGER 

		-- function pthread_getname_np (in `/usr/include/pthread.h')
               -- pthread_getname_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_getname_np"
               }"
               end

	pthread_getschedparam (a_target_thread: like long_unsigned; a_policy: POINTER; a_param: POINTER): INTEGER 

		-- function pthread_getschedparam (in `/usr/include/pthread.h')
               -- pthread_getschedparam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_getschedparam"
               }"
               end

	pthread_getspecific (a_key: NATURAL): POINTER 

		-- function pthread_getspecific (in `/usr/include/pthread.h')
               -- pthread_getspecific
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_getspecific"
               }"
               end

	pthread_join (a_th: like long_unsigned; a_thread_return: POINTER): INTEGER 

		-- function pthread_join (in `/usr/include/pthread.h')
               -- pthread_join
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_join"
               }"
               end

	pthread_key_create (a_key: POINTER; a_destr_function: POINTER): INTEGER 

		-- function pthread_key_create (in `/usr/include/pthread.h')
               -- pthread_key_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_key_create"
               }"
               end

	pthread_key_delete (a_key: NATURAL): INTEGER 

		-- function pthread_key_delete (in `/usr/include/pthread.h')
               -- pthread_key_delete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_key_delete"
               }"
               end

	pthread_mutex_consistent (a_mutex: POINTER): INTEGER 

		-- function pthread_mutex_consistent (in `/usr/include/pthread.h')
               -- pthread_mutex_consistent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutex_consistent"
               }"
               end

	pthread_mutex_consistent_np (a_mutex: POINTER): INTEGER 

		-- function pthread_mutex_consistent_np (in `/usr/include/pthread.h')
               -- pthread_mutex_consistent_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutex_consistent_np"
               }"
               end

	pthread_mutex_destroy (a_mutex: POINTER): INTEGER 

		-- function pthread_mutex_destroy (in `/usr/include/pthread.h')
               -- pthread_mutex_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutex_destroy"
               }"
               end

	pthread_mutex_getprioceiling (a_mutex: POINTER; a_prioceiling: POINTER): INTEGER 

		-- function pthread_mutex_getprioceiling (in `/usr/include/pthread.h')
               -- pthread_mutex_getprioceiling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutex_getprioceiling"
               }"
               end

	pthread_mutex_init (a_mutex: POINTER; a_mutexattr: POINTER): INTEGER 

		-- function pthread_mutex_init (in `/usr/include/pthread.h')
               -- pthread_mutex_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutex_init"
               }"
               end

	pthread_mutex_lock (a_mutex: POINTER): INTEGER 

		-- function pthread_mutex_lock (in `/usr/include/pthread.h')
               -- pthread_mutex_lock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutex_lock"
               }"
               end

	pthread_mutex_setprioceiling (a_mutex: POINTER; a_prioceiling: INTEGER; an_old_ceiling: POINTER): INTEGER 

		-- function pthread_mutex_setprioceiling (in `/usr/include/pthread.h')
               -- pthread_mutex_setprioceiling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutex_setprioceiling"
               }"
               end

	pthread_mutex_timedlock (a_mutex: POINTER; an_abstime: POINTER): INTEGER 

		-- function pthread_mutex_timedlock (in `/usr/include/pthread.h')
               -- pthread_mutex_timedlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutex_timedlock"
               }"
               end

	pthread_mutex_trylock (a_mutex: POINTER): INTEGER 

		-- function pthread_mutex_trylock (in `/usr/include/pthread.h')
               -- pthread_mutex_trylock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutex_trylock"
               }"
               end

	pthread_mutex_unlock (a_mutex: POINTER): INTEGER 

		-- function pthread_mutex_unlock (in `/usr/include/pthread.h')
               -- pthread_mutex_unlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutex_unlock"
               }"
               end

	pthread_mutexattr_destroy (an_attr: POINTER): INTEGER 

		-- function pthread_mutexattr_destroy (in `/usr/include/pthread.h')
               -- pthread_mutexattr_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_destroy"
               }"
               end

	pthread_mutexattr_getprioceiling (an_attr: POINTER; a_prioceiling: POINTER): INTEGER 

		-- function pthread_mutexattr_getprioceiling (in `/usr/include/pthread.h')
               -- pthread_mutexattr_getprioceiling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_getprioceiling"
               }"
               end

	pthread_mutexattr_getprotocol (an_attr: POINTER; a_protocol: POINTER): INTEGER 

		-- function pthread_mutexattr_getprotocol (in `/usr/include/pthread.h')
               -- pthread_mutexattr_getprotocol
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_getprotocol"
               }"
               end

	pthread_mutexattr_getpshared (an_attr: POINTER; a_pshared: POINTER): INTEGER 

		-- function pthread_mutexattr_getpshared (in `/usr/include/pthread.h')
               -- pthread_mutexattr_getpshared
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_getpshared"
               }"
               end

	pthread_mutexattr_getrobust (an_attr: POINTER; a_robustness: POINTER): INTEGER 

		-- function pthread_mutexattr_getrobust (in `/usr/include/pthread.h')
               -- pthread_mutexattr_getrobust
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_getrobust"
               }"
               end

	pthread_mutexattr_getrobust_np (an_attr: POINTER; a_robustness: POINTER): INTEGER 

		-- function pthread_mutexattr_getrobust_np (in `/usr/include/pthread.h')
               -- pthread_mutexattr_getrobust_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_getrobust_np"
               }"
               end

	pthread_mutexattr_gettype (an_attr: POINTER; a_kind: POINTER): INTEGER 

		-- function pthread_mutexattr_gettype (in `/usr/include/pthread.h')
               -- pthread_mutexattr_gettype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_gettype"
               }"
               end

	pthread_mutexattr_init (an_attr: POINTER): INTEGER 

		-- function pthread_mutexattr_init (in `/usr/include/pthread.h')
               -- pthread_mutexattr_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_init"
               }"
               end

	pthread_mutexattr_setprioceiling (an_attr: POINTER; a_prioceiling: INTEGER): INTEGER 

		-- function pthread_mutexattr_setprioceiling (in `/usr/include/pthread.h')
               -- pthread_mutexattr_setprioceiling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_setprioceiling"
               }"
               end

	pthread_mutexattr_setprotocol (an_attr: POINTER; a_protocol: INTEGER): INTEGER 

		-- function pthread_mutexattr_setprotocol (in `/usr/include/pthread.h')
               -- pthread_mutexattr_setprotocol
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_setprotocol"
               }"
               end

	pthread_mutexattr_setpshared (an_attr: POINTER; a_pshared: INTEGER): INTEGER 

		-- function pthread_mutexattr_setpshared (in `/usr/include/pthread.h')
               -- pthread_mutexattr_setpshared
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_setpshared"
               }"
               end

	pthread_mutexattr_setrobust (an_attr: POINTER; a_robustness: INTEGER): INTEGER 

		-- function pthread_mutexattr_setrobust (in `/usr/include/pthread.h')
               -- pthread_mutexattr_setrobust
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_setrobust"
               }"
               end

	pthread_mutexattr_setrobust_np (an_attr: POINTER; a_robustness: INTEGER): INTEGER 

		-- function pthread_mutexattr_setrobust_np (in `/usr/include/pthread.h')
               -- pthread_mutexattr_setrobust_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_setrobust_np"
               }"
               end

	pthread_mutexattr_settype (an_attr: POINTER; a_kind: INTEGER): INTEGER 

		-- function pthread_mutexattr_settype (in `/usr/include/pthread.h')
               -- pthread_mutexattr_settype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_mutexattr_settype"
               }"
               end

	pthread_once (an_once_control: POINTER; an_init_routine: POINTER): INTEGER 

		-- function pthread_once (in `/usr/include/pthread.h')
               -- pthread_once
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_once"
               }"
               end

	pthread_rwlock_destroy (a_rwlock: POINTER): INTEGER 

		-- function pthread_rwlock_destroy (in `/usr/include/pthread.h')
               -- pthread_rwlock_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlock_destroy"
               }"
               end

	pthread_rwlock_init (a_rwlock: POINTER; an_attr: POINTER): INTEGER 

		-- function pthread_rwlock_init (in `/usr/include/pthread.h')
               -- pthread_rwlock_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlock_init"
               }"
               end

	pthread_rwlock_rdlock (a_rwlock: POINTER): INTEGER 

		-- function pthread_rwlock_rdlock (in `/usr/include/pthread.h')
               -- pthread_rwlock_rdlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlock_rdlock"
               }"
               end

	pthread_rwlock_timedrdlock (a_rwlock: POINTER; an_abstime: POINTER): INTEGER 

		-- function pthread_rwlock_timedrdlock (in `/usr/include/pthread.h')
               -- pthread_rwlock_timedrdlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlock_timedrdlock"
               }"
               end

	pthread_rwlock_timedwrlock (a_rwlock: POINTER; an_abstime: POINTER): INTEGER 

		-- function pthread_rwlock_timedwrlock (in `/usr/include/pthread.h')
               -- pthread_rwlock_timedwrlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlock_timedwrlock"
               }"
               end

	pthread_rwlock_tryrdlock (a_rwlock: POINTER): INTEGER 

		-- function pthread_rwlock_tryrdlock (in `/usr/include/pthread.h')
               -- pthread_rwlock_tryrdlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlock_tryrdlock"
               }"
               end

	pthread_rwlock_trywrlock (a_rwlock: POINTER): INTEGER 

		-- function pthread_rwlock_trywrlock (in `/usr/include/pthread.h')
               -- pthread_rwlock_trywrlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlock_trywrlock"
               }"
               end

	pthread_rwlock_unlock (a_rwlock: POINTER): INTEGER 

		-- function pthread_rwlock_unlock (in `/usr/include/pthread.h')
               -- pthread_rwlock_unlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlock_unlock"
               }"
               end

	pthread_rwlock_wrlock (a_rwlock: POINTER): INTEGER 

		-- function pthread_rwlock_wrlock (in `/usr/include/pthread.h')
               -- pthread_rwlock_wrlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlock_wrlock"
               }"
               end

	pthread_rwlockattr_destroy (an_attr: POINTER): INTEGER 

		-- function pthread_rwlockattr_destroy (in `/usr/include/pthread.h')
               -- pthread_rwlockattr_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlockattr_destroy"
               }"
               end

	pthread_rwlockattr_getkind_np (an_attr: POINTER; a_pref: POINTER): INTEGER 

		-- function pthread_rwlockattr_getkind_np (in `/usr/include/pthread.h')
               -- pthread_rwlockattr_getkind_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlockattr_getkind_np"
               }"
               end

	pthread_rwlockattr_getpshared (an_attr: POINTER; a_pshared: POINTER): INTEGER 

		-- function pthread_rwlockattr_getpshared (in `/usr/include/pthread.h')
               -- pthread_rwlockattr_getpshared
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlockattr_getpshared"
               }"
               end

	pthread_rwlockattr_init (an_attr: POINTER): INTEGER 

		-- function pthread_rwlockattr_init (in `/usr/include/pthread.h')
               -- pthread_rwlockattr_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlockattr_init"
               }"
               end

	pthread_rwlockattr_setkind_np (an_attr: POINTER; a_pref: INTEGER): INTEGER 

		-- function pthread_rwlockattr_setkind_np (in `/usr/include/pthread.h')
               -- pthread_rwlockattr_setkind_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlockattr_setkind_np"
               }"
               end

	pthread_rwlockattr_setpshared (an_attr: POINTER; a_pshared: INTEGER): INTEGER 

		-- function pthread_rwlockattr_setpshared (in `/usr/include/pthread.h')
               -- pthread_rwlockattr_setpshared
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_rwlockattr_setpshared"
               }"
               end

	pthread_self: like long_unsigned 

		-- function pthread_self (in `/usr/include/pthread.h')
               -- pthread_self
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_self()"
               }"
               end

	pthread_setaffinity_np (a_th: like long_unsigned; a_cpusetsize: like size_t; a_cpuset: POINTER): INTEGER 

		-- function pthread_setaffinity_np (in `/usr/include/pthread.h')
               -- pthread_setaffinity_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_setaffinity_np"
               }"
               end

	pthread_setattr_default_np (an_attr: POINTER): INTEGER 

		-- function pthread_setattr_default_np (in `/usr/include/pthread.h')
               -- pthread_setattr_default_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_setattr_default_np"
               }"
               end

	pthread_setcancelstate (a_state: INTEGER; an_oldstate: POINTER): INTEGER 

		-- function pthread_setcancelstate (in `/usr/include/pthread.h')
               -- pthread_setcancelstate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_setcancelstate"
               }"
               end

	pthread_setcanceltype (a_type: INTEGER; an_oldtype: POINTER): INTEGER 

		-- function pthread_setcanceltype (in `/usr/include/pthread.h')
               -- pthread_setcanceltype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_setcanceltype"
               }"
               end

	pthread_setconcurrency (a_level: INTEGER): INTEGER 

		-- function pthread_setconcurrency (in `/usr/include/pthread.h')
               -- pthread_setconcurrency
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_setconcurrency"
               }"
               end

	pthread_setname_np (a_target_thread: like long_unsigned; a_name: POINTER): INTEGER 

		-- function pthread_setname_np (in `/usr/include/pthread.h')
               -- pthread_setname_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_setname_np"
               }"
               end

	pthread_setschedparam (a_target_thread: like long_unsigned; a_policy: INTEGER; a_param: POINTER): INTEGER 

		-- function pthread_setschedparam (in `/usr/include/pthread.h')
               -- pthread_setschedparam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_setschedparam"
               }"
               end

	pthread_setschedprio (a_target_thread: like long_unsigned; a_prio: INTEGER): INTEGER 

		-- function pthread_setschedprio (in `/usr/include/pthread.h')
               -- pthread_setschedprio
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_setschedprio"
               }"
               end

	pthread_setspecific (a_key: NATURAL; a_pointer: POINTER): INTEGER 

		-- function pthread_setspecific (in `/usr/include/pthread.h')
               -- pthread_setspecific
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_setspecific"
               }"
               end

	pthread_spin_destroy (a_lock: POINTER): INTEGER 

		-- function pthread_spin_destroy (in `/usr/include/pthread.h')
               -- pthread_spin_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_spin_destroy"
               }"
               end

	pthread_spin_init (a_lock: POINTER; a_pshared: INTEGER): INTEGER 

		-- function pthread_spin_init (in `/usr/include/pthread.h')
               -- pthread_spin_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_spin_init"
               }"
               end

	pthread_spin_lock (a_lock: POINTER): INTEGER 

		-- function pthread_spin_lock (in `/usr/include/pthread.h')
               -- pthread_spin_lock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_spin_lock"
               }"
               end

	pthread_spin_trylock (a_lock: POINTER): INTEGER 

		-- function pthread_spin_trylock (in `/usr/include/pthread.h')
               -- pthread_spin_trylock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_spin_trylock"
               }"
               end

	pthread_spin_unlock (a_lock: POINTER): INTEGER 

		-- function pthread_spin_unlock (in `/usr/include/pthread.h')
               -- pthread_spin_unlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_spin_unlock"
               }"
               end

	pthread_testcancel 

		-- function pthread_testcancel (in `/usr/include/pthread.h')
               -- pthread_testcancel
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_testcancel()"
               }"
               end

	pthread_timedjoin_np (a_th: like long_unsigned; a_thread_return: POINTER; an_abstime: POINTER): INTEGER 

		-- function pthread_timedjoin_np (in `/usr/include/pthread.h')
               -- pthread_timedjoin_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_timedjoin_np"
               }"
               end

	pthread_tryjoin_np (a_th: like long_unsigned; a_thread_return: POINTER): INTEGER 

		-- function pthread_tryjoin_np (in `/usr/include/pthread.h')
               -- pthread_tryjoin_np
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_tryjoin_np"
               }"
               end

	pthread_yield: INTEGER 

		-- function pthread_yield (in `/usr/include/pthread.h')
               -- pthread_yield
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pthread_yield()"
               }"
               end

	-- `hidden' function __sigsetjmp skipped.

end -- class PTHREAD_EXTERNALS
