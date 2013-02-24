class GLIB_ASYNCHRONOUS_QUEUES
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Asynchronous Queues

-- Asynchronous Queues %GÅ‚Äî%@ asynchronous communication between threads.
	
-- Synopsis

-- #include <glib.h>


--             GAsyncQueue;
-- GAsyncQueue* g_async_queue_new              (void);
-- GAsyncQueue* g_async_queue_ref              (GAsyncQueue *queue);
-- void        g_async_queue_unref             (GAsyncQueue *queue);
-- void        g_async_queue_push              (GAsyncQueue *queue,
--                                              gpointer data);
-- gpointer    g_async_queue_pop               (GAsyncQueue *queue);
-- gpointer    g_async_queue_try_pop           (GAsyncQueue *queue);
-- gpointer    g_async_queue_timed_pop         (GAsyncQueue *queue,
--                                              GTimeVal *end_time);
-- gint        g_async_queue_length            (GAsyncQueue *queue);

-- void        g_async_queue_lock              (GAsyncQueue *queue);
-- void        g_async_queue_unlock            (GAsyncQueue *queue);
-- void        g_async_queue_ref_unlocked      (GAsyncQueue *queue);
-- void        g_async_queue_unref_and_unlock  (GAsyncQueue *queue);
-- void        g_async_queue_push_unlocked     (GAsyncQueue *queue,
--                                              gpointer data);
-- gpointer    g_async_queue_pop_unlocked      (GAsyncQueue *queue);
-- gpointer    g_async_queue_try_pop_unlocked  (GAsyncQueue *queue);
-- gpointer    g_async_queue_timed_pop_unlocked
--                                             (GAsyncQueue *queue,
--                                              GTimeVal *end_time);
-- gint        g_async_queue_length_unlocked   (GAsyncQueue *queue);

-- Description

-- Often you need to communicate between different threads. In general it's safer not to do this by shared memory, but by explicit message passing. These messages only make sense asynchronously for multi-threaded applications though, as a synchronous operation could as well be done in the same thread.

-- Asynchronous queues are an exception from most other GLib data structures, as they can be used simultaneously from multiple threads without explicit locking and they bring their own builtin reference counting. This is because the nature of an asynchronous queue is that it will always be used by at least 2 concurrent threads.

-- For using an asynchronous queue you first have to create one with g_async_queue_new(). A newly-created queue will get the reference count 1. Whenever another thread is creating a new reference of (that is, pointer to) the queue, it has to increase the reference count (using g_async_queue_ref()). Also, before removing this reference, the reference count has to be decreased (using g_async_queue_unref()). After that the queue might no longer exist so you must not access it after that point.

-- A thread, which wants to send a message to that queue simply calls g_async_queue_push() to push the message to the queue.

-- A thread, which is expecting messages from an asynchronous queue simply calls g_async_queue_pop() for that queue. If no message is available in the queue at that point, the thread is now put to sleep until a message arrives. The message will be removed from the queue and returned. The functions g_async_queue_try_pop() and g_async_queue_timed_pop() can be used to only check for the presence of messages or to only wait a certain time for messages respectively.

-- For almost every function there exist two variants, one that locks the queue and one that doesn't. That way you can hold the queue lock (acquire it with g_async_queue_lock() and release it with g_async_queue_unlock()) over multiple queue accessing instructions. This can be necessary to ensure the integrity of the queue, but should only be used when really necessary, as it can make your life harder if used unwisely. Normally you should only use the locking function variants (those without the suffix _unlocked)
-- Details
-- GAsyncQueue

-- typedef struct _GAsyncQueue GAsyncQueue;

-- The GAsyncQueue struct is an opaque data structure, which represents an asynchronous queue. It should only be accessed through the g_async_queue_* functions.
-- g_async_queue_new ()

-- GAsyncQueue* g_async_queue_new              (void);

-- Creates a new asynchronous queue with the initial reference count of 1.
-- Returns : 	the new GAsyncQueue.
-- g_async_queue_ref ()

-- GAsyncQueue* g_async_queue_ref              (GAsyncQueue *queue);

-- Increases the reference count of the asynchronous queue by 1. You do not need to hold the lock to call this function.
-- queue : 	a GAsyncQueue.
-- Returns : 	the queue that was passed in (since 2.6)
-- g_async_queue_unref ()

-- void        g_async_queue_unref             (GAsyncQueue *queue);

-- Decreases the reference count of the asynchronous queue by 1. If the reference count went to 0, the queue will be destroyed and the memory allocated will be freed. So you are not allowed to use the queue afterwards, as it might have disappeared. You do not need to hold the lock to call this function.
-- queue : 	a GAsyncQueue.
-- g_async_queue_push ()

-- void        g_async_queue_push              (GAsyncQueue *queue,
--                                              gpointer data);

-- Pushes the data into the queue. data must not be NULL.
-- queue : 	a GAsyncQueue.
-- data : 	data to push into the queue.
-- g_async_queue_pop ()

-- gpointer    g_async_queue_pop               (GAsyncQueue *queue);

-- Pops data from the queue. This function blocks until data become available.
-- queue : 	a GAsyncQueue.
-- Returns : 	data from the queue.
-- g_async_queue_try_pop ()

-- gpointer    g_async_queue_try_pop           (GAsyncQueue *queue);

-- Tries to pop data from the queue. If no data is available, NULL is returned.
-- queue : 	a GAsyncQueue.
-- Returns : 	data from the queue or NULL, when no data is available immediately.
-- g_async_queue_timed_pop ()

-- gpointer    g_async_queue_timed_pop         (GAsyncQueue *queue,
--                                              GTimeVal *end_time);

-- Pops data from the queue. If no data is received before end_time, NULL is returned.

-- To easily calculate end_time a combination of g_get_current_time() and g_time_val_add() can be used.
-- queue : 	a GAsyncQueue.
-- end_time : 	a GTimeVal, determining the final time.
-- Returns : 	data from the queue or NULL, when no data is received before end_time.
-- g_async_queue_length ()

-- gint        g_async_queue_length            (GAsyncQueue *queue);

-- Returns the length of the queue, negative values mean waiting threads, positive values mean available entries in the queue. Actually this function returns the number of data items in the queue minus the number of waiting threads. Thus a return value of 0 could mean 'n' entries in the queue and 'n' thread waiting. That can happen due to locking of the queue or due to scheduling.
-- queue : 	a GAsyncQueue.
-- Returns : 	the length of the queue.
-- g_async_queue_lock ()

-- void        g_async_queue_lock              (GAsyncQueue *queue);

-- Acquires the queue's lock. After that you can only call the g_async_queue_*_unlocked() function variants on that queue. Otherwise it will deadlock.
-- queue : 	a GAsyncQueue.
-- g_async_queue_unlock ()

-- void        g_async_queue_unlock            (GAsyncQueue *queue);

-- Releases the queue's lock.
-- queue : 	a GAsyncQueue.
-- g_async_queue_ref_unlocked ()

-- void        g_async_queue_ref_unlocked      (GAsyncQueue *queue);

-- Warning

-- g_async_queue_ref_unlocked is deprecated and should not be used in newly-written code.

-- Increases the reference count of the asynchronous queue by 1.
-- queue : 	a GAsyncQueue.
-- g_async_queue_unref_and_unlock ()

-- void        g_async_queue_unref_and_unlock  (GAsyncQueue *queue);

-- Warning

-- g_async_queue_unref_and_unlock is deprecated and should not be used in newly-written code.

-- Decreases the reference count of the asynchronous queue by 1 and releases the lock. This function must be called while holding the queue's lock. If the reference count went to 0, the queue will be destroyed and the memory allocated will be freed.
-- queue : 	a GAsyncQueue.
-- g_async_queue_push_unlocked ()

-- void        g_async_queue_push_unlocked     (GAsyncQueue *queue,
--                                              gpointer data);

-- Pushes the data into the queue. data must not be NULL. This function must be called while holding the queue's lock.
-- queue : 	a GAsyncQueue.
-- data : 	data to push into the queue.
-- g_async_queue_pop_unlocked ()

-- gpointer    g_async_queue_pop_unlocked      (GAsyncQueue *queue);

-- Pops data from the queue. This function blocks until data become available. This function must be called while holding the queue's lock.
-- queue : 	a GAsyncQueue.
-- Returns : 	data from the queue.
-- g_async_queue_try_pop_unlocked ()

-- gpointer    g_async_queue_try_pop_unlocked  (GAsyncQueue *queue);

-- Tries to pop data from the queue. If no data is available, NULL is returned. This function must be called while holding the queue's lock.
-- queue : 	a GAsyncQueue.
-- Returns : 	data from the queue or NULL, when no data is available immediately.
-- g_async_queue_timed_pop_unlocked ()

-- gpointer    g_async_queue_timed_pop_unlocked
--                                             (GAsyncQueue *queue,
--                                              GTimeVal *end_time);

-- Pops data from the queue. If no data is received before end_time, NULL is returned. This function must be called while holding the queue's lock.

-- To easily calculate end_time a combination of g_get_current_time() and g_time_val_add() can be used.
-- queue : 	a GAsyncQueue.
-- end_time : 	a GTimeVal, determining the final time.
-- Returns : 	data from the queue or NULL, when no data is received before end_time.
-- g_async_queue_length_unlocked ()

-- gint        g_async_queue_length_unlocked   (GAsyncQueue *queue);

-- Returns the length of the queue, negative values mean waiting threads, positive values mean available entries in the queue. Actually this function returns the number of data items in the queue minus the number of waiting threads. Thus a return value of 0 could mean 'n' entries in the queue and 'n' thread waiting. That can happen due to locking of the queue or due to scheduling. This function must be called while holding the queue's lock.
-- queue : 	a GAsyncQueue.
-- Returns : 	the length of the queue.
end
