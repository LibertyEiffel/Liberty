indexing
	description: "Thread Pools — pools of threads to execute work concurrently"
	copyright: "(C) 2011 Paolo Redaelli"
	license: "LGPL v2 or later"
	version: "2.28"

deferred class G_THREAD_POOL [A_ROUTINE -> G_POOLED_ROUTINE]
	obsolete "G_THREAD_POOL is currently unusable because standard library is NOT thread safe. At all"
	-- A pool of threads executing A_ROUTINE concurrently.

	-- Sometimes you wish to asynchronously fork out the execution of work and
	-- continue working in your own thread. If that will happen often, the
	-- overhead of starting and destroying a thread each time might be too
	-- high. In such cases reusing already started threads seems like a good
	-- idea. And it indeed is, but implementing this can be tedious and
	-- error-prone.

	-- Therefore GLib provides thread pools for your convenience. An added
	-- advantage is, that the threads can be shared between the different
	-- subsystems of your program, when they are using GLib.

	-- To create a new thread pool, you use `make'. 

 	-- If you want to execute a certain task within a thread pool, you call `push'.

	-- To get the current number of running threads you call `threads_count'.
	-- To get the number of still unprocessed tasks you call
	-- `unprocessed_count'. To control the maximal number of threads for a
	-- thread pool, you use `max_threads' and `set_max_threads`.

	-- Finally you can control the number of unused threads, that are kept
	-- alive by GLib for future use. The current number can be fetched with
	-- `unused_threads_count'. The maximal number can be controlled by
	-- `max_unused_threads' and `set_max_unused_threads'. All currently unused
	-- threads can be stopped by calling `stop_unused_threads`.

	-- Note for Liberty users: 
inherit 
	WRAPPER 
		-- A thread pool should be "EIFFEL_OWNED redefine dispose end", but since EIFFEL_OWNED contains only a simplicistic definition of `dispose' it is actully cleaner just to define dispose here.

	FACTORY[A_ROUTINE] rename new as new_routine end

insert 
	GTHREADPOOL_EXTERNALS
	GTHREAD_EXTERNALS

feature {} -- Creation
	make (a_max_threads_count: INTEGER; is_exclusive: BOOLEAN;) is
		-- Creation command of a new thread pool.

		-- Whenever you call `push', either a new thread is created or an
		-- unused one is reused . At most a_max_threads_count threads are
		-- running concurrently for this thread pool. `a_max_threads_count' = -1 allows
		-- unlimited threads to be created for this thread pool. 

		-- The newly created or reused thread now executes A_ROUTINE.command with a reference to Current G_THREAD_POOL.
		
		-- `is_exclusive' determines, whether the thread pool owns all threads
		-- exclusive or whether the threads are shared globally. If
		-- `is_exclusive' is True, `a_max_threads_count' threads are started immediately
		-- and they will run exclusively for this thread pool until it is
		-- destroyed by dispose. If `is_exclusive' is False, threads
		-- are created, when needed and shared between all non-exclusive thread
		-- pools. This implies that `a_max_threads_count' may not be -1 for exclusive
		-- thread pools.
		
		-- TODO: provide GError support ("..error can be NULL to ignore errors, or non-NULL to report errors. An error can only occur when exclusive is set to TRUE and not all max_threads threads could be created..")
	local self: like Current; a_routine: like new_routine
	do
		g_thread_init(default_pointer)
		self := Current
		a_routine := new_routine
		from_external_pointer(g_thread_pool_new(a_routine.invoke_address, $self, a_max_threads_count, is_exclusive.to_integer, 
		default_pointer -- could be GError **error);
		))
	end

feature {ANY} -- Commands
	push (some_data: like new_routine) is
		-- Inserts data into the list of tasks to be executed by pool. When the
		-- number of currently running threads is lower than the maximal
		-- allowed number of threads, a new thread is started (or reused) with
		-- the properties given to `make'. Otherwise data stays in
		-- the queue until a thread in this pool finishes its previous task and
		-- processes data.

		-- TODO: add GError support "error can be NULL to ignore errors, or non-NULL to report errors. An
		-- error can only occur when a new thread couldn't be created. In that
		-- case data is simply appended to the queue of work to do."
	local a_data: like new_routine
	do
		a_data := some_data -- this step is needed to circumvent a limitation of SmartEiffel $ operator
		g_thread_pool_push
		(handle, $a_data,
		default_pointer -- could be GError **error);
		)
	end

	set_max_threads (a_number: INTEGER) is
	-- Sets the maximal allowed number of threads for pool. A value of -1 means, that the maximal number of threads is unlimited.

	-- Setting max_threads to 0 means stopping all work for pool. It is effectively frozen until max_threads is set to a non-zero value again.
	-- 
	-- A thread is never terminated while calling func, as supplied by g_thread_pool_new(). Instead the maximal number of threads only has effect for the allocation of new threads in g_thread_pool_push(). A new thread is allocated, whenever the number of currently running threads in pool is smaller than the maximal number.
	-- 
	-- error can be NULL to ignore errors, or non-NULL to report errors. An error can only occur when a new thread couldn't be created.
	-- 
	do
		g_thread_pool_set_max_threads (handle, a_number, default_pointer -- could be GError **error);
		)
	end

feature {ANY} -- Disposing
	dispose is
		--Frees all resources allocated for pool.

		-- If immediate is TRUE, no new task is processed for pool. Otherwise pool is not freed before the last task is processed. Note however, that no thread of this pool is interrupted, while processing a task. Instead at least all still running threads can finish their tasks before the pool is freed.

		-- If wait_ is TRUE, the functions does not return before all tasks to be processed (dependent on immediate, whether all or only the currently running) are ready. Otherwise the function returns immediately.

		-- After calling this function pool must not be used anymore.
	do
		g_thread_pool_free (handle, 0 -- gboolean immediate
		, 1 -- gboolean wait_
		)
		-- immediate :	should pool shut down immediately?
		-- wait_ : should the function wait for all tasks to be finished?
	end

	set_max_unused_threads (a_maximum: INTEGER_32) is
		-- Sets the maximal number of unused threads to `a_maximum'. If it is
		-- -1, no limit is imposed on the number of unused threads.
	do
		g_thread_pool_set_max_unused_threads(a_maximum)
	end

	stop_unused_threads is
		-- Stops all currently unused threads. This does not change the maximal
		-- number of unused threads. This function can be used to regularly
		-- stop all unused threads e.g. from g_timeout_add().
	do
		g_thread_pool_stop_unused_threads 
	end

	set_max_idle_time (an_interval: NATURAL_32) is
		-- Set to `an_interval' the maximum interval (in 1/1000ths of a second)
		-- that a thread waiting in the pool for new tasks can be idle for
		-- before being stopped. This command is similar to invoking
		-- `stop_unused_threads' on a regular timeout, except, this is done on
		-- a per thread basis.

		-- By setting interval to 0, idle threads will not be stopped.
		-- (Low-level note: this function makes use of
		-- g_async_queue_timed_pop() using interval).
	do
		g_thread_pool_set_max_idle_time (an_interval)
	end

feature {ANY} -- Queries
	exit_immidiatly: BOOLEAN is
		-- 
		attribute
	end

	does_exit_on_dispose: BOOLEAN is
		--
		attribute
	end
	
	max_threads: INTEGER is
		-- The maximum number of threads in Current pool
	do
		Result:=g_thread_pool_get_max_threads (handle)
	end

	threads_count: NATURAL_32 is
		-- The number of threads currently running in the pool
	do
		Result := g_thread_pool_get_num_threads (handle)
	end

 	unprocessed_count: NATURAL_32 is
		-- The number of tasks still unprocessed in the pool
	do
		Result := g_thread_pool_unprocessed (handle)
	end 

	max_unused_threads: INTEGER is
		-- The maximal allowed number of unused threads
	do
		Result:=g_thread_pool_get_max_unused_threads
	end

	unused_threads_count: NATURAL_32 is
		-- the number of currently unused threads.
	do
		Result := g_thread_pool_get_num_unused_threads
	end

	max_idle_time: NATURAL_32 is
		-- the maximum interval to wait for new tasks in the thread pool before stopping the thread (1/1000ths of a second).
		-- When 0, threads waiting in the thread pool for new work are not stopped.
	do
		Result := g_thread_pool_get_max_idle_time 
	end
feature {} -- Unwrapped
-- 	void                g_thread_pool_set_sort_function     (GThreadPool *pool,
--                                                          GCompareDataFunc func,
--                                                          gpointer user_data);
-- 
-- Sets the function used to sort the list of tasks. This allows the tasks to be processed by a priority determined by func, and not just in the order in which they were added to the pool.
-- 
-- Note, if the maximum number of threads is more than 1, the order that threads are executed can not be guranteed 100%. Threads are scheduled by the operating system and are executed at random. It cannot be assumed that threads are executed in the order they are created.
-- 
-- pool :
-- 	a GThreadPool
-- 
-- func :
-- 	the GCompareDataFunc used to sort the list of tasks. This function is passed two tasks. It should return 0 if the order in which they are handled does not matter, a negative value if the first task should be processed before the second or a positive value if the second task should be processed first.
end -- class G_THREAD_POOL 
