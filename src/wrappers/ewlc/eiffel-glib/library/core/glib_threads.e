note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_THREADS

-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Threads

-- Threads %GÅ‚Äî%@ thread abstraction; including threads, different mutexes, conditions and thread private data.
	
-- Synopsis

-- #include <glib.h>



-- #define     G_THREADS_ENABLED
-- #define     G_THREADS_IMPL_POSIX
-- #define     G_THREADS_IMPL_SOLARIS
-- #define     G_THREADS_IMPL_NONE

-- #define     G_THREAD_ERROR
-- enum        GThreadError;

--             GThreadFunctions;
-- void        g_thread_init                   (GThreadFunctions *vtable);
-- gboolean    g_thread_supported              ();

-- gpointer    (*GThreadFunc)                  (gpointer data);
-- enum        GThreadPriority;
--             GThread;
-- GThread*    g_thread_create                 (GThreadFunc func,
--                                              gpointer data,
--                                              gboolean joinable,
--                                              GError **error);
-- GThread*    g_thread_create_full            (GThreadFunc func,
--                                              gpointer data,
--                                              gulong stack_size,
--                                              gboolean joinable,
--                                              gboolean bound,
--                                              GThreadPriority priority,
--                                              GError **error);
-- GThread*    g_thread_self                   (void);
-- gpointer    g_thread_join                   (GThread *thread);
-- void        g_thread_set_priority           (GThread *thread,
--                                              GThreadPriority priority);
-- void        g_thread_yield                  ();
-- void        g_thread_exit                   (gpointer retval);

--             GMutex;
-- GMutex*     g_mutex_new                     ();
-- void        g_mutex_lock                    (GMutex *mutex);
-- gboolean    g_mutex_trylock                 (GMutex *mutex);
-- void        g_mutex_unlock                  (GMutex *mutex);
-- void        g_mutex_free                    (GMutex *mutex);

--             GStaticMutex;
-- #define     G_STATIC_MUTEX_INIT
-- void        g_static_mutex_init             (GStaticMutex *mutex);
-- void        g_static_mutex_lock             (GStaticMutex *mutex);
-- gboolean    g_static_mutex_trylock          (GStaticMutex *mutex);
-- void        g_static_mutex_unlock           (GStaticMutex *mutex);
-- GMutex*     g_static_mutex_get_mutex        (GStaticMutex *mutex);
-- void        g_static_mutex_free             (GStaticMutex *mutex);

-- #define     G_LOCK_DEFINE                   (name)
-- #define     G_LOCK_DEFINE_STATIC            (name)
-- #define     G_LOCK_EXTERN                   (name)
-- #define     G_LOCK                          (name)
-- #define     G_TRYLOCK                       (name)
-- #define     G_UNLOCK                        (name)

--             GStaticRecMutex;
-- #define     G_STATIC_REC_MUTEX_INIT
-- void        g_static_rec_mutex_init         (GStaticRecMutex *mutex);
-- void        g_static_rec_mutex_lock         (GStaticRecMutex *mutex);
-- gboolean    g_static_rec_mutex_trylock      (GStaticRecMutex *mutex);
-- void        g_static_rec_mutex_unlock       (GStaticRecMutex *mutex);
-- void        g_static_rec_mutex_lock_full    (GStaticRecMutex *mutex,
--                                              guint depth);
-- guint       g_static_rec_mutex_unlock_full  (GStaticRecMutex *mutex);
-- void        g_static_rec_mutex_free         (GStaticRecMutex *mutex);

--             GStaticRWLock;
-- #define     G_STATIC_RW_LOCK_INIT
-- void        g_static_rw_lock_init           (GStaticRWLock *lock);
-- void        g_static_rw_lock_reader_lock    (GStaticRWLock *lock);
-- gboolean    g_static_rw_lock_reader_trylock (GStaticRWLock *lock);
-- void        g_static_rw_lock_reader_unlock  (GStaticRWLock *lock);
-- void        g_static_rw_lock_writer_lock    (GStaticRWLock *lock);
-- gboolean    g_static_rw_lock_writer_trylock (GStaticRWLock *lock);
-- void        g_static_rw_lock_writer_unlock  (GStaticRWLock *lock);
-- void        g_static_rw_lock_free           (GStaticRWLock *lock);

--             GCond;
-- GCond*      g_cond_new                      ();
-- void        g_cond_signal                   (GCond *cond);
-- void        g_cond_broadcast                (GCond *cond);
-- void        g_cond_wait                     (GCond *cond,
--                                              GMutex *mutex);
-- gboolean    g_cond_timed_wait               (GCond *cond,
--                                              GMutex *mutex,
--                                              GTimeVal *abs_time);
-- void        g_cond_free                     (GCond *cond);

--             GPrivate;
-- GPrivate*   g_private_new                   (GDestroyNotify destructor);
-- gpointer    g_private_get                   (GPrivate *private_key);
-- void        g_private_set                   (GPrivate *private_key,
--                                              gpointer data);

--             GStaticPrivate;
-- #define     G_STATIC_PRIVATE_INIT
-- void        g_static_private_init           (GStaticPrivate *private_key);
-- gpointer    g_static_private_get            (GStaticPrivate *private_key);
-- void        g_static_private_set            (GStaticPrivate *private_key,
--                                              gpointer data,
--                                              GDestroyNotify notify);
-- void        g_static_private_free           (GStaticPrivate *private_key);

--             GOnce;
-- enum        GOnceStatus;
-- #define     G_ONCE_INIT
-- #define     g_once                          (once, func, arg)


-- Description

-- Threads act almost like processes, but unlike processes all threads of one process share the same memory. This is good, as it provides easy communication between the involved threads via this shared memory, and it is bad, because strange things (so called Heisenbugs) might happen, when the program is not carefully designed. Especially bad is, that due to the concurrent nature of threads no assumptions on the order of execution of different threads can be done unless explicitly forced by the programmer through synchronization primitives.

-- The aim of the thread related functions in GLib is to provide a portable means for writing multi-threaded software. There are primitives for mutexes to protect the access to portions of memory (GMutex, GStaticMutex, G_LOCK_DEFINE, GStaticRecMutex and GStaticRWLock), there are primitives for condition variables to allow synchronization of threads (GCond) and finally there are primitives for thread-private data, that every thread has a private instance of (GPrivate, GStaticPrivate). Last but definitely not least there are primitives to portably create and manage threads (GThread).

-- You must call g_thread_init() before executing any other GLib functions in a threaded GLib program. After that, GLib is completely thread safe (all global data is automatically locked). But individual data structure instances are not automatically locked for performance reasons. So e.g. you must coordinate accesses to the same GHashTable from multiple threads. The two notable exceptions from this rule are GMainLoop and GAsyncQueue, which are threadsafe and needs no further application-level locking to be accessed from multiple threads.
-- Details
-- G_THREADS_ENABLED

-- #define G_THREADS_ENABLED

-- This macro is defined, if GLib was compiled with thread support. This does not necessarily mean, that there is a thread implementation available, but the infrastructure is in place and once you provide a thread implementation to g_thread_init(), GLib will be multi-thread safe. It isn't and cannot be, if G_THREADS_ENABLED is not defined.
-- G_THREADS_IMPL_POSIX

-- #define G_THREADS_IMPL_POSIX

-- This macro is defined, if POSIX style threads are used.
-- G_THREADS_IMPL_SOLARIS

-- #define G_THREADS_IMPL_SOLARIS

-- This macro is defined, if the Solaris thread system is used.
-- G_THREADS_IMPL_NONE

-- #define G_THREADS_IMPL_NONE

-- This macro is defined, if no thread implementation is used. You can however provide one to g_thread_init() to make GLib multi-thread safe.
-- G_THREAD_ERROR

-- #define G_THREAD_ERROR g_thread_error_quark ()

-- The error domain of the GLib thread subsystem.
-- enum GThreadError

-- typedef enum
-- {
--   G_THREAD_ERROR_AGAIN /* Resource temporarily unavailable */
-- } GThreadError;

-- Possible errors of thread related functions.
-- G_THREAD_ERROR_AGAIN 	a thread couldn't be created due to resource shortage. Try again later.
-- GThreadFunctions

-- typedef struct {
--   GMutex*  (*mutex_new)           (void);
--   void     (*mutex_lock)          (GMutex               *mutex);
--   gboolean (*mutex_trylock)       (GMutex               *mutex);
--   void     (*mutex_unlock)        (GMutex               *mutex);
--   void     (*mutex_free)          (GMutex               *mutex);
--   GCond*   (*cond_new)            (void);
--   void     (*cond_signal)         (GCond                *cond);
--   void     (*cond_broadcast)      (GCond                *cond);
--   void     (*cond_wait)           (GCond                *cond,
--                                    GMutex               *mutex);
--   gboolean (*cond_timed_wait)     (GCond                *cond,
--                                    GMutex               *mutex,
--                                    GTimeVal             *end_time);
--   void      (*cond_free)          (GCond                *cond);
--   GPrivate* (*private_new)        (GDestroyNotify        destructor);
--   gpointer  (*private_get)        (GPrivate             *private_key);
--   void      (*private_set)        (GPrivate             *private_key,
--                                    gpointer              data);
--   void      (*thread_create)      (GThreadFunc           func,
--                                    gpointer              data,
--                                    gulong                stack_size,
--                                    gboolean              joinable,
--                                    gboolean              bound,
--                                    GThreadPriority       priority,
--                                    gpointer              thread,
--                                    GError              **error);
--   void      (*thread_yield)       (void);
--   void      (*thread_join)        (gpointer              thread);
--   void      (*thread_exit)        (void);
--   void      (*thread_set_priority)(gpointer              thread,
--                                    GThreadPriority       priority);
--   void      (*thread_self)        (gpointer              thread);
--   gboolean  (*thread_equal)       (gpointer              thread1,
-- 				   gpointer              thread2);
-- } GThreadFunctions;

-- This function table is used by g_thread_init() to initialize the thread system. The functions in that table are directly used by their g_* prepended counterparts, that are described here, e.g. if you call g_mutex_new() then mutex_new() from the table provided to g_thread_init() will be called.
-- Note

-- This struct should only be used, if you know, what you are doing.
-- g_thread_init ()

-- void        g_thread_init                   (GThreadFunctions *vtable);

-- If you use GLib from more than one thread, you must initialize the thread system by calling g_thread_init(). Most of the time you will only have to call g_thread_init (NULL).
-- Note

-- You should only call g_thread_init() with a non-NULL parameter if you really know what you are doing.
-- Note

-- g_thread_init() must not be called directly or indirectly as a callback from GLib. Also no mutexes may be currently locked, while calling g_thread_init().

-- g_thread_init() might only be called once. On the second call it will abort with an error. If you want to make sure, that the thread system is initialized, you can do that too:

-- if (!g_thread_supported ()) g_thread_init (NULL);

-- After that line either the thread system is initialized or the program will abort, if no thread system is available in GLib, i.e. either G_THREADS_ENABLED is not defined or G_THREADS_IMPL_NONE is defined.

-- If no thread system is available and vtable is NULL or if not all elements of vtable are non-NULL, then g_thread_init() will abort.
-- Note

-- To use g_thread_init() in your program, you have to link with the libraries that the command pkg-config --libs gthread-2.0 outputs. This is not the case for all the other thread related functions of GLib. Those can be used without having to link with the thread libraries.
-- vtable : 	a function table of type GThreadFunctions, that provides the entry points to the thread system to be used.
-- g_thread_supported ()

-- gboolean    g_thread_supported              ();

-- This function returns, whether the thread system is initialized or not.
-- Note

-- This function is actually a macro. Apart from taking the address of it you can however use it as if it was a function.
-- Returns : 	TRUE, if the thread system is initialized.
-- GThreadFunc ()

-- gpointer    (*GThreadFunc)                  (gpointer data);

-- Specifies the type of the func functions passed to g_thread_create() or g_thread_create_full().
-- data : 	data passed to the thread.
-- Returns : 	the return value of the thread, which will be returned by g_thread_join().
-- enum GThreadPriority

-- typedef enum
-- {
--   G_THREAD_PRIORITY_LOW,
--   G_THREAD_PRIORITY_NORMAL,
--   G_THREAD_PRIORITY_HIGH,
--   G_THREAD_PRIORITY_URGENT
-- } GThreadPriority;

-- Specifies the priority of a thread.
-- Note

-- It is not guaranteed, that threads with different priorities really behave accordingly. On some systems (e.g. Linux) there are no thread priorities. On other systems (e.g. Solaris) there doesn't seem to be different scheduling for different priorities. All in all try to avoid being dependent on priorities.
-- G_THREAD_PRIORITY_LOW 	a priority lower than normal
-- G_THREAD_PRIORITY_NORMAL 	the default priority
-- G_THREAD_PRIORITY_HIGH 	a priority higher than normal
-- G_THREAD_PRIORITY_URGENT 	the highest priority
-- GThread

-- typedef struct {
-- } GThread;

-- The GThread struct represents a running thread. It has three public read-only members, but the underlying struct is bigger, so you must not copy this struct.
-- Note

-- Resources for a joinable thread are not fully released until g_thread_join() is called for that thread.
-- g_thread_create ()

-- GThread*    g_thread_create                 (GThreadFunc func,
--                                              gpointer data,
--                                              gboolean joinable,
--                                              GError **error);

-- This function creates a new thread with the default priority.

-- If joinable is TRUE, you can wait for this threads termination calling g_thread_join(). Otherwise the thread will just disappear, when ready.

-- The new thread executes the function func with the argument data. If the thread was created successfully, it is returned.

-- error can be NULL to ignore errors, or non-NULL to report errors. The error is set, if and only if the function returns NULL.
-- func : 	a function to execute in the new thread.
-- data : 	an argument to supply to the new thread.
-- joinable : 	should this thread be joinable?
-- error : 	return location for error.
-- Returns : 	the new GThread on success.
-- g_thread_create_full ()

-- GThread*    g_thread_create_full            (GThreadFunc func,
--                                              gpointer data,
--                                              gulong stack_size,
--                                              gboolean joinable,
--                                              gboolean bound,
--                                              GThreadPriority priority,
--                                              GError **error);

-- This function creates a new thread with the priority priority. If the underlying thread implementation supports it, the thread gets a stack size of stack_size or the default value for the current platform, if stack_size is 0.

-- If joinable is TRUE, you can wait for this threads termination calling g_thread_join(). Otherwise the thread will just disappear, when ready. If bound is TRUE, this thread will be scheduled in the system scope, otherwise the implementation is free to do scheduling in the process scope. The first variant is more expensive resource-wise, but generally faster. On some systems (e.g. Linux) all threads are bound.

-- The new thread executes the function func with the argument data. If the thread was created successfully, it is returned.

-- error can be NULL to ignore errors, or non-NULL to report errors. The error is set, if and only if the function returns NULL.
-- Note

-- It is not guaranteed, that threads with different priorities really behave accordingly. On some systems (e.g. Linux) there are no thread priorities. On other systems (e.g. Solaris) there doesn't seem to be different scheduling for different priorities. All in all try to avoid being dependent on priorities. Use G_THREAD_PRIORITY_NORMAL here as a default.
-- Note

-- Only use g_thread_create_full(), when you really can't use g_thread_create() instead. g_thread_create() does not take stack_size, bound and priority as arguments, as they should only be used for cases, where it is inevitable.
-- func : 	a function to execute in the new thread.
-- data : 	an argument to supply to the new thread.
-- stack_size : 	a stack size for the new thread.
-- joinable : 	should this thread be joinable?
-- bound : 	should this thread be bound to a system thread?
-- priority : 	a priority for the thread.
-- error : 	return location for error.
-- Returns : 	the new GThread on success.
-- g_thread_self ()

-- GThread*    g_thread_self                   (void);

-- This functions returns the GThread corresponding to the calling thread.
-- Returns : 	the current thread.
-- g_thread_join ()

-- gpointer    g_thread_join                   (GThread *thread);

-- Waits until thread finishes, i.e. the function func, as given to g_thread_create(), returns or g_thread_exit() is called by thread. All resources of thread including the GThread struct are released. thread must have been created with joinable=TRUE in g_thread_create(). The value returned by func or given to g_thread_exit() by thread is returned by this function.
-- thread : 	a GThread to be waited for.
-- Returns : 	the return value of the thread.
-- g_thread_set_priority ()

-- void        g_thread_set_priority           (GThread *thread,
--                                              GThreadPriority priority);

-- Changes the priority of thread to priority.
-- Note

-- It is not guaranteed, that threads with different priorities really behave accordingly. On some systems (e.g. Linux) there are no thread priorities. On other systems (e.g. Solaris) there doesn't seem to be different scheduling for different priorities. All in all try to avoid being dependent on priorities.
-- thread : 	a GThread.
-- priority : 	a new priority for thread.
-- g_thread_yield ()

-- void        g_thread_yield                  ();

-- Gives way to other threads waiting to be scheduled.

-- This function is often used as a method to make busy wait less evil. But in most cases, you will encounter, there are better methods to do that. So in general you shouldn't use that function.
-- g_thread_exit ()

-- void        g_thread_exit                   (gpointer retval);

-- Exits the current thread. If another thread is waiting for that thread using g_thread_join() and the current thread is joinable, the waiting thread will be woken up and getting retval as the return value of g_thread_join(). If the current thread is not joinable, retval is ignored. Calling

-- g_thread_exit (retval);

-- is equivalent to calling

-- return retval;

-- in the function func, as given to g_thread_create().
-- Note

-- Never call g_thread_exit() from within a thread of a GThreadPool, as that will mess up the bookkeeping and lead to funny and unwanted results.
-- retval : 	the return value of this thread.
-- GMutex

-- typedef struct _GMutex GMutex;

-- The GMutex struct is an opaque data structure to represent a mutex (mutual exclusion). It can be used to protect data against shared access. Take for example the following function:

-- Example 3. A function which will not work in a threaded environment

--   int give_me_next_number ()
--   {
--     static int current_number = 0;

--     /* now do a very complicated calculation to calculate the new number,
--        this might for example be a random number generator */
--     current_number = calc_next_number (current_number); 
--     return current_number;
--   }

-- It is easy to see, that this won't work in a multi-threaded application. There current_number must be protected against shared access. A first naive implementation would be:

-- Example 4. The wrong way to write a thread-safe function

--   int give_me_next_number ()
--   {
--     static int current_number = 0;
--     int ret_val;
--     static GMutex * mutex = NULL;

--     if (!mutex)
--       mutex = g_mutex_new ();
--     g_mutex_lock (mutex);
--     ret_val = current_number = calc_next_number (current_number); 
--     g_mutex_unlock (mutex);
--     return ret_val;
--   }

-- This looks like it would work, but there is a race condition while constructing the mutex and this code cannot work reliable. So please do not use such constructs in your own programs. One working solution is:

-- Example 5. A correct thread-safe function

--   static GMutex *give_me_next_number_mutex = NULL;

--   /* this function must be called before any call to give_me_next_number ()
--      it must be called exactly once. */
--   void init_give_me_next_number () 
--   {
--     g_assert (give_me_next_number_mutex == NULL);
--     give_me_next_number_mutex = g_mutex_new ();
--   }

--   int give_me_next_number ()
--   {
--     static int current_number = 0;
--     int ret_val;

--     g_mutex_lock (give_me_next_number_mutex);
--     ret_val = current_number = calc_next_number (current_number); 
--     g_mutex_unlock (give_me_next_number_mutex);
--     return ret_val;
--   }

-- GStaticMutex provides a simpler and safer way of doing this.

-- If you want to use a mutex, but your code should also work without calling g_thread_init() first, you can not use a GMutex, as g_mutex_new() requires that. Use a GStaticMutex instead.

-- A GMutex should only be accessed via the following functions.
-- Note

-- All of the g_mutex_* functions are actually macros. Apart from taking their addresses, you can however use them as if they were functions.
-- g_mutex_new ()

-- GMutex*     g_mutex_new                     ();

-- Creates a new GMutex.
-- Note

-- This function will abort, if g_thread_init() has not been called yet.
-- Returns : 	a new GMutex.
-- g_mutex_lock ()

-- void        g_mutex_lock                    (GMutex *mutex);

-- Locks mutex. If mutex is already locked by another thread, the current thread will block until mutex is unlocked by the other thread.

-- This function can also be used, if g_thread_init() has not yet been called and will do nothing then.
-- Note

-- GMutex is neither guaranteed to be recursive nor to be non-recursive, i.e. a thread could deadlock while calling g_mutex_lock(), if it already has locked mutex. Use GStaticRecMutex, if you need recursive mutexes.
-- mutex : 	a GMutex.
-- g_mutex_trylock ()

-- gboolean    g_mutex_trylock                 (GMutex *mutex);

-- Tries to lock mutex. If mutex is already locked by another thread, it immediately returns FALSE. Otherwise it locks mutex and returns TRUE.

-- This function can also be used, if g_thread_init() has not yet been called and will immediately return TRUE then.
-- Note

-- GMutex is neither guaranteed to be recursive nor to be non-recursive, i.e. the return value of g_mutex_trylock() could be both FALSE or TRUE, if the current thread already has locked mutex. Use GStaticRecMutex, if you need recursive mutexes.
-- mutex : 	a GMutex.
-- Returns : 	TRUE, if mutex could be locked.
-- g_mutex_unlock ()

-- void        g_mutex_unlock                  (GMutex *mutex);

-- Unlocks mutex. If another thread is blocked in a g_mutex_lock() call for mutex, it will be woken and can lock mutex itself.

-- This function can also be used, if g_thread_init() has not yet been called and will do nothing then.
-- mutex : 	a GMutex.
-- g_mutex_free ()

-- void        g_mutex_free                    (GMutex *mutex);

-- Destroys mutex.
-- mutex : 	a GMutex.
-- GStaticMutex

-- typedef struct _GStaticMutex GStaticMutex;

-- A GStaticMutex works like a GMutex, but it has one significant advantage. It doesn't need to be created at run-time like a GMutex, but can be defined at compile-time. Here is a shorter, easier and safer version of our give_me_next_number() example:

-- Example 6. Using GStaticMutex to simplify thread-safe programming

--   int give_me_next_number ()
--   {
--     static int current_number = 0;
--     int ret_val;
--     static GStaticMutex mutex = G_STATIC_MUTEX_INIT;

--     g_static_mutex_lock (&mutex);
--     ret_val = current_number = calc_next_number (current_number); 
--     g_static_mutex_unlock (&mutex);
--     return ret_val;
--   }

-- Sometimes you would like to dynamically create a mutex. If you don't want to require prior calling to g_thread_init(), because your code should also be usable in non-threaded programs, you are not able to use g_mutex_new() and thus GMutex, as that requires a prior call to g_thread_init(). In theses cases you can also use a GStaticMutex. It must be initialized with g_static_mutex_init() before using it and freed with with g_static_mutex_free() when not needed anymore to free up any allocated resources.

-- Even though GStaticMutex is not opaque, it should only be used with the following functions, as it is defined differently on different platforms.

-- All of the g_static_mutex_* functions can also be used, if g_thread_init() has not yet been called.
-- Note

-- All of the g_static_mutex_* functions are actually macros. Apart from taking their addresses, you can however use them as if they were functions.
-- G_STATIC_MUTEX_INIT

-- #define G_STATIC_MUTEX_INIT

-- A GStaticMutex must be initialized with this macro, before it can be used. This macro can used be to initialize a variable, but it cannot be assigned to a variable. In that case you have to use g_static_mutex_init().

-- GStaticMutex my_mutex = G_STATIC_MUTEX_INIT;

-- g_static_mutex_init ()

-- void        g_static_mutex_init             (GStaticMutex *mutex);

-- Initializes mutex. Alternatively you can initialize it with G_STATIC_MUTEX_INIT.
-- mutex : 	a GStaticMutex to be initialized.
-- g_static_mutex_lock ()

-- void        g_static_mutex_lock             (GStaticMutex *mutex);

-- Works like g_mutex_lock(), but for a GStaticMutex.
-- mutex : 	a GStaticMutex.
-- g_static_mutex_trylock ()

-- gboolean    g_static_mutex_trylock          (GStaticMutex *mutex);

-- Works like g_mutex_trylock(), but for a GStaticMutex.
-- mutex : 	a GStaticMutex.
-- Returns : 	TRUE, if the GStaticMutex could be locked.
-- g_static_mutex_unlock ()

-- void        g_static_mutex_unlock           (GStaticMutex *mutex);

-- Works like g_mutex_unlock(), but for a GStaticMutex.
-- mutex : 	a GStaticMutex.
-- g_static_mutex_get_mutex ()

-- GMutex*     g_static_mutex_get_mutex        (GStaticMutex *mutex);

-- For some operations (like g_cond_wait()) you must have a GMutex instead of a GStaticMutex. This function will return the corresponding GMutex for mutex.
-- mutex : 	a GStaticMutex.
-- Returns : 	the GMutex corresponding to mutex.
-- g_static_mutex_free ()

-- void        g_static_mutex_free             (GStaticMutex *mutex);

-- Releases all resources allocated to mutex.

-- You don't have to call this functions for a GStaticMutex with an unbounded lifetime, i.e. objects declared 'static', but if you have a GStaticMutex as a member of a structure and the structure is freed, you should also free the GStaticMutex.
-- mutex : 	a GStaticMutex to be freed.
-- G_LOCK_DEFINE()

-- #define     G_LOCK_DEFINE(name)

-- The G_LOCK_* macros provide a convenient interface to GStaticMutex with the advantage that they will expand to nothing in programs compiled against a thread-disabled GLib, saving code and memory there. G_LOCK_DEFINE defines a lock. It can appear, where variable definitions may appear in programs, i.e. in the first block of a function or outside of functions. The name parameter will be mangled to get the name of the GStaticMutex. This means, that you can use names of existing variables as the parameter, e.g. the name of the variable you intent to protect with the lock. Look at our give_me_next_number() example using the G_LOCK_* macros:

-- Example 7. Using the G_LOCK_* convenience macros

-- G_LOCK_DEFINE (current_number);

-- int give_me_next_number ()
--   {
--     static int current_number = 0;
--     int ret_val;

--     G_LOCK (current_number);
--     ret_val = current_number = calc_next_number (current_number); 
--     G_UNLOCK (current_number);
--     return ret_val;
--   }

-- name : 	the name of the lock.
-- G_LOCK_DEFINE_STATIC()

-- #define     G_LOCK_DEFINE_STATIC(name)

-- This works like G_LOCK_DEFINE, but it creates a static object.
-- name : 	the name of the lock.
-- G_LOCK_EXTERN()

-- #define     G_LOCK_EXTERN(name)

-- This declares a lock, that is defined with G_LOCK_DEFINE in another module.
-- name : 	the name of the lock.
-- G_LOCK()

-- #define     G_LOCK(name)

-- Works like g_mutex_lock(), but for a lock defined with G_LOCK_DEFINE.
-- name : 	the name of the lock.
-- G_TRYLOCK()

-- #define     G_TRYLOCK(name)

-- Works like g_mutex_trylock(), but for a lock defined with G_LOCK_DEFINE.
-- name : 	the name of the lock.
-- Returns : 	TRUE, if the lock could be locked.
-- G_UNLOCK()

-- #define     G_UNLOCK(name)

-- Works like g_mutex_unlock(), but for a lock defined with G_LOCK_DEFINE.
-- name : 	the name of the lock.
-- GStaticRecMutex

-- typedef struct {
-- } GStaticRecMutex;

-- A GStaticRecMutex works like a GStaticMutex, but it can be locked multiple times by one thread. If you enter it n times, however, you have to unlock it n times again to let other threads lock it. An exception is the function g_static_rec_mutex_unlock_full(), that allows you to unlock a GStaticRecMutex completely returning the depth, i.e. the number of times this mutex was locked. The depth can later be used to restore the state by calling g_static_rec_mutex_lock_full().

-- Even though GStaticRecMutex is not opaque, it should only be used with the following functions.

-- All of the g_static_rec_mutex_* functions can also be used, if g_thread_init() has not been called.
-- G_STATIC_REC_MUTEX_INIT

-- #define G_STATIC_REC_MUTEX_INIT { G_STATIC_MUTEX_INIT }

-- A GStaticRecMutex must be initialized with this macro, before it can be used. This macro can used be to initialize a variable, but it cannot be assigned to a variable. In that case you have to use g_static_rec_mutex_init().

-- GStaticRecMutex my_mutex = G_STATIC_REC_MUTEX_INIT;

-- g_static_rec_mutex_init ()

-- void        g_static_rec_mutex_init         (GStaticRecMutex *mutex);

-- A GStaticRecMutex must be initialized with this function, before it can be used. Alternatively you can initialize it with G_STATIC_REC_MUTEX_INIT.
-- mutex : 	a GStaticRecMutex to be initialized.
-- g_static_rec_mutex_lock ()

-- void        g_static_rec_mutex_lock         (GStaticRecMutex *mutex);

-- Locks mutex. If mutex is already locked by another thread, the current thread will block until mutex is unlocked by the other thread. If mutex is already locked by the calling thread, this functions increases the depth of mutex and returns immediately.
-- mutex : 	a GStaticRecMutex to lock.
-- g_static_rec_mutex_trylock ()

-- gboolean    g_static_rec_mutex_trylock      (GStaticRecMutex *mutex);

-- Tries to lock mutex. If mutex is already locked by another thread, it immediately returns FALSE. Otherwise it locks mutex and returns TRUE. If mutex is already locked by the calling thread, this functions increases the depth of mutex and immediately returns TRUE.
-- mutex : 	a GStaticRecMutex to lock.
-- Returns : 	TRUE, if mutex could be locked.
-- g_static_rec_mutex_unlock ()

-- void        g_static_rec_mutex_unlock       (GStaticRecMutex *mutex);

-- Unlocks mutex. Another threads can, however, only lock mutex when it has been unlocked as many times, as it had been locked before. If mutex is completely unlocked and another thread is blocked in a g_static_rec_mutex_lock() call for mutex, it will be woken and can lock mutex itself.
-- mutex : 	a GStaticRecMutex to unlock.
-- g_static_rec_mutex_lock_full ()

-- void        g_static_rec_mutex_lock_full    (GStaticRecMutex *mutex,
--                                              guint depth);

-- Works like calling g_static_rec_mutex_lock() for mutex depth times.
-- mutex : 	a GStaticRecMutex to lock.
-- depth : 	number of times this mutex has to be unlocked to be completely unlocked.
-- g_static_rec_mutex_unlock_full ()

-- guint       g_static_rec_mutex_unlock_full  (GStaticRecMutex *mutex);

-- Completely unlocks mutex. If another thread is blocked in a g_static_rec_mutex_lock() call for mutex, it will be woken and can lock mutex itself. This function returns the number of times, that mutex has been locked by the current thread. To restore the state before the call to g_static_rec_mutex_unlock_full() you can call g_static_rec_mutex_lock_full() with the depth returned by this function.
-- mutex : 	a GStaticRecMutex to completely unlock.
-- Returns : 	number of times mutex has been locked by the current thread.
-- g_static_rec_mutex_free ()

-- void        g_static_rec_mutex_free         (GStaticRecMutex *mutex);

-- Releases all resources allocated to a GStaticRecMutex.

-- You don't have to call this functions for a GStaticRecMutex with an unbounded lifetime, i.e. objects declared 'static', but if you have a GStaticRecMutex as a member of a structure and the structure is freed, you should also free the GStaticRecMutex.
-- mutex : 	a GStaticRecMutex to be freed.
-- GStaticRWLock

-- typedef struct {
-- } GStaticRWLock;

-- The GStaticRWLock struct represents a read-write lock. A read-write lock can be used for protecting data, that some portions of code only read from, while others also write. In such situations it is desirable, that several readers can read at once, whereas of course only one writer may write at a time. Take a look at the following example:

-- Example 8. An array with access functions

--   GStaticRWLock rwlock = G_STATIC_RW_LOCK_INIT;

--   GPtrArray *array;

--   gpointer my_array_get (guint index)
--   {
--     gpointer retval = NULL;

--     if (!array)
--       return NULL;

--     g_static_rw_lock_reader_lock (&rwlock);

--     if (index < array->len)
--       retval = g_ptr_array_index (array, index);

--     g_static_rw_lock_reader_unlock (&rwlock);

--     return retval;
--   }

--   void my_array_set (guint index, gpointer data)
--   {
--     g_static_rw_lock_writer_lock (&rwlock);

--     if (!array)
--       array = g_ptr_array_new ();

--     if (index >= array->len)
--       g_ptr_array_set_size (array, index+1);

--     g_ptr_array_index (array, index) = data; 

--     g_static_rw_lock_writer_unlock (&rwlock);
--   }

-- This example shows an array, which can be accessed by many readers (the my_array_get() function) simultaneously, whereas the writers (the my_array_set() function) will only be allowed once a time and only if no readers currently access the array. This is because of the potentially dangerous resizing of the array. Using these functions is fully multi-thread safe now.

-- Most of the time the writers should have precedence of readers. That means for this implementation, that as soon as a writer wants to lock the data, no other reader is allowed to lock the data, whereas of course the readers, that already have locked the data are allowed to finish their operation. As soon as the last reader unlocks the data, the writer will lock it.

-- Even though GStaticRWLock is not opaque, it should only be used with the following functions.

-- All of the g_static_rw_lock_* functions can also be used, if g_thread_init() has not been called.
-- Note

-- A read-write lock has a higher overhead as a mutex. For example both g_static_rw_lock_reader_lock() and g_static_rw_lock_reader_unlock() have to lock and unlock a GStaticMutex, so it takes at least twice the time to lock and unlock a GStaticRWLock than to lock and unlock a GStaticMutex. So only data structures, that are accessed by multiple readers, which keep the lock for a considerable time justify a GStaticRWLock. The above example most probably would fare better with a GStaticMutex.
-- G_STATIC_RW_LOCK_INIT

-- #define G_STATIC_RW_LOCK_INIT { G_STATIC_MUTEX_INIT, NULL, NULL, 0, FALSE, 0, 0 }

-- A GStaticRWLock must be initialized with this macro, before it can be used. This macro can used be to initialize a variable, but it cannot be assigned to a variable. In that case you have to use g_static_rw_lock_init().

-- GStaticRWLock my_lock = G_STATIC_RW_LOCK_INIT;

-- g_static_rw_lock_init ()

-- void        g_static_rw_lock_init           (GStaticRWLock *lock);

-- A GStaticRWLock must be initialized with this function, before it can be used. Alternatively you can initialize it with G_STATIC_RW_LOCK_INIT.
-- lock : 	a GStaticRWLock to be initialized.
-- g_static_rw_lock_reader_lock ()

-- void        g_static_rw_lock_reader_lock    (GStaticRWLock *lock);

-- Locks lock for reading. There may be unlimited concurrent locks for reading of a GStaticRWLock at the same time. If lock is already locked for writing by another thread or if another thread is already waiting to lock lock for writing, this function will block until lock is unlocked by the other writing thread and no other writing threads want to lock lock. This lock has to be unlocked by g_static_rw_lock_reader_unlock().

-- GStaticRWLock is not recursive. It might seem to be possible to recursively lock for reading, but that can result in a deadlock as well, due to writer preference.
-- lock : 	a GStaticRWLock to lock for reading.
-- g_static_rw_lock_reader_trylock ()

-- gboolean    g_static_rw_lock_reader_trylock (GStaticRWLock *lock);

-- Tries to lock lock for reading. If lock is already locked for writing by another thread or if another thread is already waiting to lock lock for writing, it immediately returns FALSE. Otherwise it locks lock for reading and returns TRUE. This lock has to be unlocked by g_static_rw_lock_reader_unlock().
-- lock : 	a GStaticRWLock to lock for reading.
-- Returns : 	TRUE, if lock could be locked for reading.
-- g_static_rw_lock_reader_unlock ()

-- void        g_static_rw_lock_reader_unlock  (GStaticRWLock *lock);

-- Unlocks lock. If a thread waits to lock lock for writing and all locks for reading have been unlocked, the waiting thread is woken up and can lock lock for writing.
-- lock : 	a GStaticRWLock to unlock after reading.
-- g_static_rw_lock_writer_lock ()

-- void        g_static_rw_lock_writer_lock    (GStaticRWLock *lock);

-- Locks lock for writing. If lock is already locked for writing or reading by other threads, this function will block until lock is completely unlocked and then lock lock for writing. While this functions waits to lock lock, no other thread can lock lock for reading. When lock is locked for writing, no other thread can lock lock (neither for reading nor writing). This lock has to be unlocked by g_static_rw_lock_writer_unlock().
-- lock : 	a GStaticRWLock to lock for writing.
-- g_static_rw_lock_writer_trylock ()

-- gboolean    g_static_rw_lock_writer_trylock (GStaticRWLock *lock);

-- Tries to lock lock for writing. If lock is already locked (for either reading or writing) by another thread, it immediately returns FALSE. Otherwise it locks lock for writing and returns TRUE. This lock has to be unlocked by g_static_rw_lock_writer_unlock().
-- lock : 	a GStaticRWLock to lock for writing.
-- Returns : 	TRUE, if lock could be locked for writing.
-- g_static_rw_lock_writer_unlock ()

-- void        g_static_rw_lock_writer_unlock  (GStaticRWLock *lock);

-- Unlocks lock. If a thread waits to lock lock for writing and all locks for reading have been unlocked, the waiting thread is woken up and can lock lock for writing. If no thread waits to lock lock for writing and threads wait to lock lock for reading, the waiting threads are woken up and can lock lock for reading.
-- lock : 	a GStaticRWLock to unlock after writing.
-- g_static_rw_lock_free ()

-- void        g_static_rw_lock_free           (GStaticRWLock *lock);

-- Releases all resources allocated to lock.

-- You don't have to call this functions for a GStaticRWLock with an unbounded lifetime, i.e. objects declared 'static', but if you have a GStaticRWLock as a member of a structure and the structure is freed, you should also free the GStaticRWLock.
-- lock : 	a GStaticRWLock to be freed.
-- GCond

-- typedef struct _GCond GCond;

-- The GCond struct is an opaque data structure to represent a condition. A GCond is an object, that threads can block on, if they find a certain condition to be false. If other threads change the state of this condition they can signal the GCond, such that the waiting thread is woken up.

-- Example 9. Using GCond to block a thread until a condition is satisfied

-- GCond* data_cond = NULL;   /* Must be initialized somewhere */
-- GMutex* data_mutex = NULL; /* Must be initialized somewhere */
-- gpointer current_data = NULL;

-- void push_data (gpointer data)
-- {
--   g_mutex_lock (data_mutex);
--   current_data = data;
--   g_cond_signal (data_cond);
--   g_mutex_unlock (data_mutex);
-- }

-- gpointer pop_data ()
-- {
--   gpointer data;

--   g_mutex_lock (data_mutex);
--   while (!current_data)
--       g_cond_wait (data_cond, data_mutex);
--   data = current_data;
--   current_data = NULL;
--   g_mutex_unlock (data_mutex);
--   return data;
-- }

-- Whenever a thread calls pop_data() now, it will wait until current_data is non-NULL, i.e. until some other thread has called push_data().
-- Note

-- It is important to use the g_cond_wait() and g_cond_timed_wait() functions only inside a loop, which checks for the condition to be true as it is not guaranteed that the waiting thread will find it fulfilled, even if the signaling thread left the condition in that state. This is because another thread can have altered the condition, before the waiting thread got the chance to be woken up, even if the condition itself is protected by a GMutex, like above.

-- A GCond should only be accessed via the following functions.
-- Note

-- All of the g_cond_* functions are actually macros. Apart from taking their addresses, you can however use them as if they were functions.
-- g_cond_new ()

-- GCond*      g_cond_new                      ();

-- Creates a new GCond. This function will abort, if g_thread_init() has not been called yet.
-- Returns : 	a new GCond.
-- g_cond_signal ()

-- void        g_cond_signal                   (GCond *cond);

-- If threads are waiting for cond, exactly one of them is woken up. It is good practice to hold the same lock as the waiting thread, while calling this function, though not required.

-- This function can also be used, if g_thread_init() has not yet been called and will do nothing then.
-- cond : 	a GCond.
-- g_cond_broadcast ()

-- void        g_cond_broadcast                (GCond *cond);

-- If threads are waiting for cond, all of them are woken up. It is good practice to lock the same mutex as the waiting threads, while calling this function, though not required.

-- This function can also be used, if g_thread_init() has not yet been called and will do nothing then.
-- cond : 	a GCond.
-- g_cond_wait ()

-- void        g_cond_wait                     (GCond *cond,
--                                              GMutex *mutex);

-- Waits until this thread is woken up on cond. The mutex is unlocked before falling asleep and locked again before resuming.

-- This function can also be used, if g_thread_init() has not yet been called and will immediately return then.
-- cond : 	a GCond.
-- mutex : 	a GMutex, that is currently locked.
-- g_cond_timed_wait ()

-- gboolean    g_cond_timed_wait               (GCond *cond,
--                                              GMutex *mutex,
--                                              GTimeVal *abs_time);

-- Waits until this thread is woken up on cond, but not longer than until the time, that is specified by abs_time. The mutex is unlocked before falling asleep and locked again before resuming.

-- If abs_time is NULL, g_cond_timed_wait() acts like g_cond_wait().

-- This function can also be used, if g_thread_init() has not yet been called and will immediately return TRUE then.

-- To easily calculate abs_time a combination of g_get_current_time() and g_time_val_add() can be used.
-- cond : 	a GCond.
-- mutex : 	a GMutex, that is currently locked.
-- abs_time : 	a GTimeVal, determining the final time.
-- Returns : 	TRUE, if the thread is woken up in time.
-- g_cond_free ()

-- void        g_cond_free                     (GCond *cond);

-- Destroys the GCond.
-- cond : 	a GCond.
-- GPrivate

-- typedef struct _GPrivate GPrivate;

-- The GPrivate struct is an opaque data structure to represent a thread private data key. Threads can thereby obtain and set a pointer, which is private to the current thread. Take our give_me_next_number() example from above. Now we don't want current_number to be shared between the threads, but to be private to each thread. This can be done as follows:

-- Example 10. Using GPrivate for per-thread data

--   GPrivate* current_number_key = NULL; /* Must be initialized somewhere */
--                                        /* with g_private_new (g_free); */

--   int give_me_next_number ()
--   {
--     int *current_number = g_private_get (current_number_key);

--     if (!current_number)
--     {
--       current_number = g_new (int,1);
--       *current_number = 0;
--       g_private_set (current_number_key, current_number);
--     }
--     *current_number = calc_next_number (*current_number); 
--     return *current_number;
--   }

-- Here the pointer belonging to the key current_number_key is read. If it is NULL, it has not been set yet. Then get memory for an integer value, assign this memory to the pointer and write the pointer back. Now we have an integer value, that is private to the current thread.

-- The GPrivate struct should only be accessed via the following functions.
-- Note

-- All of the g_private_* functions are actually macros. Apart from taking their addresses, you can however use them as if they were functions.
-- g_private_new ()

-- GPrivate*   g_private_new                   (GDestroyNotify destructor);

-- Creates a new GPrivate. If destructor is non-NULL, it is a pointer to a destructor function. Whenever a thread ends and the corresponding pointer keyed to this instance of GPrivate is non-NULL, the destructor is called with this pointer as the argument.
-- Note

-- destructor is working quite differently from notify in g_static_private_set().
-- Note

-- A GPrivate can not be freed. Reuse it instead, if you can to avoid shortage or use GStaticPrivate.
-- Note

-- This function will abort, if g_thread_init() has not been called yet.
-- destructor : 	a function to handle the data keyed to GPrivate, when a thread ends.
-- Returns : 	a new GPrivate.
-- g_private_get ()

-- gpointer    g_private_get                   (GPrivate *private_key);

-- Returns the pointer keyed to private_key for the current thread. This pointer is NULL, when g_private_set() hasn't been called for the current private_key and thread yet.

-- This function can also be used, if g_thread_init() has not yet been called and will return the value of private_key casted to gpointer then.
-- private_key : 	a GPrivate.
-- Returns : 	the corresponding pointer.
-- g_private_set ()

-- void        g_private_set                   (GPrivate *private_key,
--                                              gpointer data);

-- Sets the pointer keyed to private_key for the current thread.

-- This function can also be used, if g_thread_init() has not yet been called and will set private_key to data casted to GPrivate* then.
-- private_key : 	a GPrivate.
-- data : 	the new pointer.
-- GStaticPrivate

-- typedef struct {
-- } GStaticPrivate;

-- A GStaticPrivate works almost like a GPrivate, but it has one significant advantage. It doesn't need to be created at run-time like a GPrivate, but can be defined at compile-time. This is similar to the difference between GMutex and GStaticMutex. Now look at our give_me_next_number() example with GStaticPrivate:

-- Example 11. Using GStaticPrivate for per-thread data

--   int give_me_next_number ()
--   {
--     static GStaticPrivate current_number_key = G_STATIC_PRIVATE_INIT;
--     int *current_number = g_static_private_get (&current_number_key);

--     if (!current_number)
--     {
--       current_number = g_new (int,1);
--       *current_number = 0;
--       g_static_private_set (&current_number_key, current_number, g_free);
--     }
--     *current_number = calc_next_number (*current_number); 
--     return *current_number;
--   }

-- G_STATIC_PRIVATE_INIT

-- #define G_STATIC_PRIVATE_INIT 

-- Every GStaticPrivate must be initialized with this macro, before it can be used.

-- GStaticPrivate my_private = G_STATIC_PRIVATE_INIT;

-- g_static_private_init ()

-- void        g_static_private_init           (GStaticPrivate *private_key);

-- Initializes private_key. Alternatively you can initialize it with G_STATIC_PRIVATE_INIT.
-- private_key : 	a GStaticPrivate to be initialized.
-- g_static_private_get ()

-- gpointer    g_static_private_get            (GStaticPrivate *private_key);

-- Works like g_private_get() only for a GStaticPrivate.

-- This function also works, if g_thread_init() has not yet been called.
-- private_key : 	a GStaticPrivate.
-- Returns : 	the corresponding pointer.
-- g_static_private_set ()

-- void        g_static_private_set            (GStaticPrivate *private_key,
--                                              gpointer data,
--                                              GDestroyNotify notify);

-- Sets the pointer keyed to private_key for the current thread and the function notify to be called with that pointer (NULL or non-NULL), whenever the pointer is set again or whenever the current thread ends.

-- This function also works, if g_thread_init() has not yet been called. If g_thread_init() is called later, the data keyed to private_key will be inherited only by the main thread, i.e. the one that called g_thread_init().
-- Note

-- notify is working quite differently from destructor in g_private_new().
-- private_key : 	a GStaticPrivate.
-- data : 	the new pointer.
-- notify : 	a function to be called with the pointer, whenever the current thread ends or sets this pointer again.
-- g_static_private_free ()

-- void        g_static_private_free           (GStaticPrivate *private_key);

-- Releases all resources allocated to private_key.

-- You don't have to call this functions for a GStaticPrivate with an unbounded lifetime, i.e. objects declared 'static', but if you have a GStaticPrivate as a member of a structure and the structure is freed, you should also free the GStaticPrivate.
-- private_key : 	a GStaticPrivate to be freed.
-- GOnce

-- typedef struct {
--   volatile GOnceStatus status;
--   volatile gpointer retval;
-- } GOnce;

-- A GOnce struct controls a one-time initialization function. Any one-time initialization function must have its own unique GOnce struct.
-- volatile GOnceStatus status; 	the status of the GOnce
-- volatile gpointer retval; 	the value returned by the call to the function, if status is G_ONCE_STATUS_READY

-- Since 2.4
-- enum GOnceStatus

-- typedef enum
-- {
--   G_ONCE_STATUS_NOTCALLED,
--   G_ONCE_STATUS_PROGRESS,
--   G_ONCE_STATUS_READY  
-- } GOnceStatus;

-- The possible stati of a one-time initialization function controlled by a GOnce struct.
-- G_ONCE_STATUS_NOTCALLED 	the function has not been called yet.
-- G_ONCE_STATUS_PROGRESS 	the function call is currently in progress.
-- G_ONCE_STATUS_READY 	the function has been called.

-- Since 2.4
-- G_ONCE_INIT

-- #define G_ONCE_INIT { G_ONCE_STATUS_NOTCALLED, NULL }

-- A GOnce must be initialized with this macro, before it can be used.

-- GOnce my_once = G_ONCE_INIT;

-- Since 2.4
-- g_once()

-- #define     g_once(once, func, arg)

-- The first call to this routine by a process with a given GOnce struct calls func with the given argument. Thereafter, subsequent calls to g_once() with the same GOnce struct do not call func again, but return the stored result of the first call. On return from g_once(), the status of once will be G_ONCE_STATUS_READY.

-- For example, a mutex or a thread-specific data key must be created exactly once. In a threaded environment, calling g_once() ensures that the initialization is serialized across multiple threads.
-- Note

-- Calling g_once() recursively on the same GOnce struct in func will lead to a deadlock.

-- gpointer 
-- get_debug_flags()
-- {
--   static GOnce my_once = G_ONCE_INIT;
  
--   g_once (&my_once, parse_debug_flags, NULL);

--   return my_once.retval;
-- }

-- once : 	a GOnce structure
-- func : 	the function associated to once. This function is called only once, regardless of the number of times it and its associated GOnce struct are passed to g_once() .
-- arg : 	data to be passed to func

-- Since 2.4
-- See Also

-- GThreadPool 	

-- Thread pools.
-- GAsyncQueue 	

-- Send asynchronous messages between threads.

end
