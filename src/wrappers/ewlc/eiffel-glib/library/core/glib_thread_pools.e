note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_THREAD_POOLS
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Thread Pools

-- Thread Pools %GÅ‚Äî%@ pools of threads to execute work concurrently.
	
-- Synopsis

-- #include <glib.h>


--             GThreadPool;
-- GThreadPool* g_thread_pool_new              (GFunc func,
--                                              gpointer user_data,
--                                              gint max_threads,
--                                              gboolean exclusive,
--                                              GError **error);
-- void        g_thread_pool_push              (GThreadPool *pool,
--                                              gpointer data,
--                                              GError **error);
-- void        g_thread_pool_set_max_threads   (GThreadPool *pool,
--                                              gint max_threads,
--                                              GError **error);
-- gint        g_thread_pool_get_max_threads   (GThreadPool *pool);
-- guint       g_thread_pool_get_num_threads   (GThreadPool *pool);
-- guint       g_thread_pool_unprocessed       (GThreadPool *pool);
-- void        g_thread_pool_free              (GThreadPool *pool,
--                                              gboolean immediate,
--                                              gboolean wait);
-- void        g_thread_pool_set_max_unused_threads
--                                             (gint max_threads);
-- gint        g_thread_pool_get_max_unused_threads
--                                             (void);
-- guint       g_thread_pool_get_num_unused_threads
--                                             (void);
-- void        g_thread_pool_stop_unused_threads
--                                             (void);

-- Description

-- Sometimes you wish to asyncronously fork out the execution of work and continue working in your own thread. If that will happen often, the overhead of starting and destroying a thread each time might be to high. In such cases reusing already started threads seems like a good idea. And it indeed is, but implementing this can be tedious and error-prone.

-- Therefore GLib provides thread pools for your convenience. An added advantage is, that the threads can be shared between the different subsystems of your program, when they are using GLib.

-- To create a new thread pool, you use g_thread_pool_new(). It is destroyed by g_thread_pool_free().

-- If you want to execute a certain task within a thread pool, you call g_thread_pool_push().

-- To get the current number of running threads you call g_thread_pool_get_num_threads(). To get the number of still unprocessed tasks you call g_thread_pool_unprocessed(). To control the maximal number of threads for a thread pool, you use g_thread_pool_get_max_threads() and g_thread_pool_set_max_threads().

-- Finally you can control the number of unused threads, that are kept alive by GLib for future use. The current number can be fetched with g_thread_pool_get_num_unused_threads(). The maximal number can be controlled by g_thread_pool_get_max_unused_threads() and g_thread_pool_set_max_unused_threads(). All currently unused threads can be stopped by calling g_thread_pool_stop_unused_threads().
-- Details
-- GThreadPool

-- typedef struct {
--   GFunc func;
--   gpointer user_data;
--   gboolean exclusive;
-- } GThreadPool;

-- The GThreadPool struct represents a thread pool. It has six public read-only members, but the underlying struct is bigger, so you must not copy this struct.
-- GFunc func; 	the function to execute in the threads of this pool
-- gpointer user_data; 	the user data for the threads of this pool
-- gboolean exclusive; 	are all threads exclusive to this pool
-- g_thread_pool_new ()

-- GThreadPool* g_thread_pool_new              (GFunc func,
--                                              gpointer user_data,
--                                              gint max_threads,
--                                              gboolean exclusive,
--                                              GError **error);

-- This function creates a new thread pool.

-- Whenever you call g_thread_pool_push(), either a new thread is created or an unused one is reused. At most max_threads threads are running concurrently for this thread pool. max_threads = -1 allows unlimited threads to be created for this thread pool. The newly created or reused thread now executes the function func with the two arguments. The first one is the parameter to g_thread_pool_push() and the second one is user_data.

-- The parameter exclusive determines, whether the thread pool owns all threads exclusive or whether the threads are shared globally. If exclusive is TRUE, max_threads threads are started immediately and they will run exclusively for this thread pool until it is destroyed by g_thread_pool_free(). If exclusive is FALSE, threads are created, when needed and shared between all non-exclusive thread pools. This implies that max_threads may not be -1 for exclusive thread pools.

-- error can be NULL to ignore errors, or non-NULL to report errors. An error can only occur when exclusive is set to TRUE and not all max_threads threads could be created.

-- func : 	a function to execute in the threads of the new thread pool
-- user_data : 	user data that is handed over to func every time it is called
-- max_threads : 	the maximal number of threads to execute concurrently in the new thread pool, -1 means no limit
-- exclusive : 	should this thread pool be exclusive?
-- error : 	return location for error
-- Returns : 	the new GThreadPool
-- g_thread_pool_push ()

-- void        g_thread_pool_push              (GThreadPool *pool,
--                                              gpointer data,
--                                              GError **error);

-- Inserts data into the list of tasks to be executed by pool. When the number of currently running threads is lower than the maximal allowed number of threads, a new thread is started (or reused) with the properties given to g_thread_pool_new(). Otherwise data stays in the queue until a thread in this pool finishes its previous task and processes data.

-- error can be NULL to ignore errors, or non-NULL to report errors. An error can only occur when a new thread couldn't be created. In that case data is simply appended to the queue of work to do.

-- pool : 	a GThreadPool
-- data : 	a new task for pool
-- error : 	return location for error
-- g_thread_pool_set_max_threads ()

-- void        g_thread_pool_set_max_threads   (GThreadPool *pool,
--                                              gint max_threads,
--                                              GError **error);

-- Sets the maximal allowed number of threads for pool. A value of -1 means, that the maximal number of threads is unlimited.

-- Setting max_threads to 0 means stopping all work for pool. It is effectively frozen until max_threads is set to a non-zero value again.

-- A thread is never terminated while calling func, as supplied by g_thread_pool_new(). Instead the maximal number of threads only has effect for the allocation of new threads in g_thread_pool_push(). A new thread is allocated, whenever the number of currently running threads in pool is smaller than the maximal number.

-- error can be NULL to ignore errors, or non-NULL to report errors. An error can only occur when a new thread couldn't be created.

-- pool : 	a GThreadPool
-- max_threads : 	a new maximal number of threads for pool
-- error : 	return location for error
-- g_thread_pool_get_max_threads ()

-- gint        g_thread_pool_get_max_threads   (GThreadPool *pool);

-- Returns the maximal number of threads for pool.

-- pool : 	a GThreadPool
-- Returns : 	the maximal number of threads
-- g_thread_pool_get_num_threads ()

-- guint       g_thread_pool_get_num_threads   (GThreadPool *pool);

-- Returns the number of threads currently running in pool.

-- pool : 	a GThreadPool
-- Returns : 	the number of threads currently running
-- g_thread_pool_unprocessed ()

-- guint       g_thread_pool_unprocessed       (GThreadPool *pool);

-- Returns the number of tasks still unprocessed in pool.

-- pool : 	a GThreadPool
-- Returns : 	the number of unprocessed tasks
-- g_thread_pool_free ()

-- void        g_thread_pool_free              (GThreadPool *pool,
--                                              gboolean immediate,
--                                              gboolean wait);

-- Frees all resources allocated for pool.

-- If immediate is TRUE, no new task is processed for pool. Otherwise pool is not freed before the last task is processed. Note however, that no thread of this pool is interrupted, while processing a task. Instead at least all still running threads can finish their tasks before the pool is freed.

-- If wait is TRUE, the functions does not return before all tasks to be processed (dependent on immediate, whether all or only the currently running) are ready. Otherwise the function returns immediately.

-- After calling this function pool must not be used anymore.

-- pool : 	a GThreadPool
-- immediate : 	should pool shut down immediately?
-- wait : 	should the function wait for all tasks to be finished?
-- g_thread_pool_set_max_unused_threads ()

-- void        g_thread_pool_set_max_unused_threads
--                                             (gint max_threads);

-- Sets the maximal number of unused threads to max_threads. If max_threads is -1, no limit is imposed on the number of unused threads.

-- max_threads : 	maximal number of unused threads
-- g_thread_pool_get_max_unused_threads ()

-- gint        g_thread_pool_get_max_unused_threads
--                                             (void);

-- Returns the maximal allowed number of unused threads.

-- Returns : 	the maximal number of unused threads
-- g_thread_pool_get_num_unused_threads ()

-- guint       g_thread_pool_get_num_unused_threads
--                                             (void);

-- Returns the number of currently unused threads.

-- Returns : 	the number of currently unused threads
-- g_thread_pool_stop_unused_threads ()

-- void        g_thread_pool_stop_unused_threads
--                                             (void);

-- Stops all currently unused threads. This does not change the maximal number of unused threads. This function can be used to regularly stop all unused threads e.g. from g_timeout_add().

-- See Also

-- GThread 	

-- GLib thread system.

end
