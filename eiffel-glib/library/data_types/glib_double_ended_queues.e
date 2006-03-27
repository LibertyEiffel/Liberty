indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_DOUBLE_ENDED_QUEUES

-- Double-ended Queues

-- Double-ended Queues %GÅ‚Äî%@ double-ended queue data structure.
	
-- Synopsis

-- #include <glib.h>


--             GQueue;
-- GQueue*     g_queue_new                     (void);
-- void        g_queue_free                    (GQueue *queue);
-- gboolean    g_queue_is_empty                (GQueue *queue);
-- guint       g_queue_get_length              (GQueue *queue);
-- void        g_queue_reverse                 (GQueue *queue);
-- GQueue*     g_queue_copy                    (GQueue *queue);
-- void        g_queue_foreach                 (GQueue *queue,
--                                              GFunc func,
--                                              gpointer user_data);
-- GList*      g_queue_find                    (GQueue *queue,
--                                              gconstpointer data);
-- GList*      g_queue_find_custom             (GQueue *queue,
--                                              gconstpointer data,
--                                              GCompareFunc func);
-- void        g_queue_sort                    (GQueue *queue,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);
-- void        g_queue_push_head               (GQueue *queue,
--                                              gpointer data);
-- void        g_queue_push_tail               (GQueue *queue,
--                                              gpointer data);
-- void        g_queue_push_nth                (GQueue *queue,
--                                              gpointer data,
--                                              gint n);
-- gpointer    g_queue_pop_head                (GQueue *queue);
-- gpointer    g_queue_pop_tail                (GQueue *queue);
-- gpointer    g_queue_pop_nth                 (GQueue *queue,
--                                              guint n);
-- gpointer    g_queue_peek_head               (GQueue *queue);
-- gpointer    g_queue_peek_tail               (GQueue *queue);
-- gpointer    g_queue_peek_nth                (GQueue *queue,
--                                              guint n);
-- gint        g_queue_index                   (GQueue *queue,
--                                              gconstpointer data);
-- void        g_queue_remove                  (GQueue *queue,
--                                              gconstpointer data);
-- void        g_queue_remove_all              (GQueue *queue,
--                                              gconstpointer data);
-- void        g_queue_insert_before           (GQueue *queue,
--                                              GList *sibling,
--                                              gpointer data);
-- void        g_queue_insert_after            (GQueue *queue,
--                                              GList *sibling,
--                                              gpointer data);
-- void        g_queue_insert_sorted           (GQueue *queue,
--                                              gpointer data,
--                                              GCompareDataFunc func,
--                                              gpointer user_data);
-- void        g_queue_push_head_link          (GQueue *queue,
--                                              GList *link_);
-- void        g_queue_push_tail_link          (GQueue *queue,
--                                              GList *link_);
-- void        g_queue_push_nth_link           (GQueue *queue,
--                                              gint n,
--                                              GList *link_);
-- GList*      g_queue_pop_head_link           (GQueue *queue);
-- GList*      g_queue_pop_tail_link           (GQueue *queue);
-- GList*      g_queue_pop_nth_link            (GQueue *queue,
--                                              guint n);
-- GList*      g_queue_peek_head_link          (GQueue *queue);
-- GList*      g_queue_peek_tail_link          (GQueue *queue);
-- GList*      g_queue_peek_nth_link           (GQueue *queue,
--                                              guint n);
-- gint        g_queue_link_index              (GQueue *queue,
--                                              GList *link_);
-- void        g_queue_unlink                  (GQueue *queue,
--                                              GList *link_);
-- void        g_queue_delete_link             (GQueue *queue,
--                                              GList *link_);

-- Description

-- The GQueue structure and its associated functions provide a standard queue data structure. Internally, GQueue uses the same data structure as GList to store elements.

-- The data contained in each element can be either integer values, by using one of the Type Conversion Macros, or simply pointers to any type of data.

-- To create a new GQueue, use g_queue_new().

-- To add elements, use g_queue_push_head(), g_queue_push_head_link(), g_queue_push_tail() and g_queue_push_tail_link().

-- To remove elements, use g_queue_pop_head() and g_queue_pop_tail().

-- To free the entire queue, use g_queue_free().
-- Details
-- GQueue

-- typedef struct {
--   GList *head;
--   GList *tail;
--   guint  length;
-- } GQueue;

-- Contains the public fields of a Queue.
-- GList *head; 	a pointer to the first element of the queue.
-- GList *tail; 	a pointer to the last element of the queue.
-- guint length; 	the number of elements in the queue.
-- g_queue_new ()

-- GQueue*     g_queue_new                     (void);

-- Creates a new GQueue.

-- Returns : 	a new GQueue.
-- g_queue_free ()

-- void        g_queue_free                    (GQueue *queue);

-- Frees the memory allocated for the GQueue.

-- queue : 	a GQueue.
-- g_queue_is_empty ()

-- gboolean    g_queue_is_empty                (GQueue *queue);

-- Returns TRUE if the queue is empty.

-- queue : 	a GQueue.
-- Returns : 	TRUE if the queue is empty.
-- g_queue_get_length ()

-- guint       g_queue_get_length              (GQueue *queue);

-- Returns the number of items in queue.

-- queue : 	a GQueue
-- Returns : 	The number of items in queue.

-- Since 2.4
-- g_queue_reverse ()

-- void        g_queue_reverse                 (GQueue *queue);

-- Reverses the order of the items in queue.

-- queue : 	a GQueue

-- Since 2.4
-- g_queue_copy ()

-- GQueue*     g_queue_copy                    (GQueue *queue);

-- Copies a queue. Note that is a shallow copy. If the elements in the queue consist of pointers to data, the pointers are copied, but the actual data is not.

-- queue : 	a GQueue
-- Returns : 	A copy of queue

-- Since 2.4
-- g_queue_foreach ()

-- void        g_queue_foreach                 (GQueue *queue,
--                                              GFunc func,
--                                              gpointer user_data);

-- Calls func for each element in the queue passing user_data to the function.

-- queue : 	a GQueue
-- func : 	the function to call for each element's data
-- user_data : 	user data to pass to func

-- Since 2.4
-- g_queue_find ()

-- GList*      g_queue_find                    (GQueue *queue,
--                                              gconstpointer data);

-- Finds the first link in queue which contains data.

-- queue : 	a GQueue
-- data : 	data to find
-- Returns : 	The first link in queue which contains data.

-- Since 2.4
-- g_queue_find_custom ()

-- GList*      g_queue_find_custom             (GQueue *queue,
--                                              gconstpointer data,
--                                              GCompareFunc func);

-- Finds an element in a GQueue, using a supplied function to find the desired element. It iterates over the queue, calling the given function which should return 0 when the desired element is found. The function takes two gconstpointer arguments, the GQueue element's data as the first argument and the given user data as the second argument.

-- queue : 	a GQueue
-- data : 	user data passed to func
-- func : 	a GCompareFunc to call for each element. It should return 0 when the desired element is found
-- Returns : 	The found link, or NULL if it wasn't found

-- Since 2.4
-- g_queue_sort ()

-- void        g_queue_sort                    (GQueue *queue,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);

-- Sorts queue using compare_func.

-- queue : 	a GQueue
-- compare_func : 	the GCompareDataFunc used to sort queue. This function is passed two elements of the queue and should return 0 if they are equal, a negative value if the first comes before the second, and a positive value if the second comes before the first.
-- user_data : 	user data passed to compare_func

-- Since 2.4
-- g_queue_push_head ()

-- void        g_queue_push_head               (GQueue *queue,
--                                              gpointer data);

-- Adds a new element at the head of the queue.

-- queue : 	a GQueue.
-- data : 	the data for the new element.
-- g_queue_push_tail ()

-- void        g_queue_push_tail               (GQueue *queue,
--                                              gpointer data);

-- Adds a new element at the tail of the queue.

-- queue : 	a GQueue.
-- data : 	the data for the new element.
-- g_queue_push_nth ()

-- void        g_queue_push_nth                (GQueue *queue,
--                                              gpointer data,
--                                              gint n);

-- Inserts a new element into queue at the given position

-- queue : 	a GQueue
-- data : 	the data for the new element
-- n : 	the position to insert the new element. If n is negative or larger than the number of elements in the queue, the element is added to the end of the queue.

-- Since 2.4
-- g_queue_pop_head ()

-- gpointer    g_queue_pop_head                (GQueue *queue);

-- Removes the first element of the queue.

-- queue : 	a GQueue.
-- Returns : 	the data of the first element in the queue, or NULL if the queue is empty.
-- g_queue_pop_tail ()

-- gpointer    g_queue_pop_tail                (GQueue *queue);

-- Removes the last element of the queue.

-- queue : 	a GQueue.
-- Returns : 	the data of the last element in the queue, or NULL if the queue is empty.
-- g_queue_pop_nth ()

-- gpointer    g_queue_pop_nth                 (GQueue *queue,
--                                              guint n);

-- Removes the n'th element of queue.

-- queue : 	a GQueue
-- n : 	the position of the element.
-- Returns : 	the element's data, or NULL if n is off the end of queue.

-- Since 2.4
-- g_queue_peek_head ()

-- gpointer    g_queue_peek_head               (GQueue *queue);

-- Returns the first element of the queue.

-- queue : 	a GQueue.
-- Returns : 	the data of the first element in the queue, or NULL if the queue is empty.
-- g_queue_peek_tail ()

-- gpointer    g_queue_peek_tail               (GQueue *queue);

-- Returns the last element of the queue.

-- queue : 	a GQueue.
-- Returns : 	the data of the last element in the queue, or NULL if the queue is empty.
-- g_queue_peek_nth ()

-- gpointer    g_queue_peek_nth                (GQueue *queue,
--                                              guint n);

-- Returns the n'th element of queue.

-- queue : 	a GQueue
-- n : 	the position of the element.
-- Returns : 	The data for the n'th element of queue, or NULL if n is off the end of queue.

-- Since 2.4
-- g_queue_index ()

-- gint        g_queue_index                   (GQueue *queue,
--                                              gconstpointer data);

-- Returns the position of the first element in queue which contains data.

-- queue : 	a GQueue
-- data : 	the data to find.
-- Returns : 	The position of the first element in queue which contains data, or -1 if no element in queue contains data.

-- Since 2.4
-- g_queue_remove ()

-- void        g_queue_remove                  (GQueue *queue,
--                                              gconstpointer data);

-- Removes the first element in queue that contains data.

-- queue : 	a GQueue
-- data : 	data to remove.

-- Since 2.4
-- g_queue_remove_all ()

-- void        g_queue_remove_all              (GQueue *queue,
--                                              gconstpointer data);

-- Remove all elemeents in queue which contains data.

-- queue : 	a GQueue
-- data : 	data to remove

-- Since 2.4
-- g_queue_insert_before ()

-- void        g_queue_insert_before           (GQueue *queue,
--                                              GList *sibling,
--                                              gpointer data);

-- Inserts data into queue before sibling.

-- sibling must be part of queue.

-- queue : 	a GQueue
-- sibling : 	a GList link that must be part of queue
-- data : 	the data to insert

-- Since 2.4
-- g_queue_insert_after ()

-- void        g_queue_insert_after            (GQueue *queue,
--                                              GList *sibling,
--                                              gpointer data);

-- Inserts data into queue after sibling

-- sibling must be part of queue

-- queue : 	a GQueue
-- sibling : 	a GList link that must be part of queue
-- data : 	the data to insert

-- Since 2.4
-- g_queue_insert_sorted ()

-- void        g_queue_insert_sorted           (GQueue *queue,
--                                              gpointer data,
--                                              GCompareDataFunc func,
--                                              gpointer user_data);

-- Inserts data into queue using func to determine the new position.

-- queue : 	a GQueue
-- data : 	the data to insert
-- func : 	the GCompareDataFunc used to compare elements in the queue. It is called with two elements of the queue and user_data. It should return 0 if the elements are equal, a negative value if the first element comes before the second, and a positive value if the second element comes before the first.
-- user_data : 	user data passed to func.

-- Since 2.4
-- g_queue_push_head_link ()

-- void        g_queue_push_head_link          (GQueue *queue,
--                                              GList *link_);

-- Adds a new element at the head of the queue.

-- queue : 	a GQueue.
-- link_ : 	a single GList element, not a list with more than one element.
-- g_queue_push_tail_link ()

-- void        g_queue_push_tail_link          (GQueue *queue,
--                                              GList *link_);

-- Adds a new element at the tail of the queue.

-- queue : 	a GQueue.
-- link_ : 	a single GList element, not a list with more than one element.
-- g_queue_push_nth_link ()

-- void        g_queue_push_nth_link           (GQueue *queue,
--                                              gint n,
--                                              GList *link_);

-- Inserts link into queue at the given position.

-- queue : 	a GQueue
-- n : 	the position to insert the link. If this is negative or larger than the number of elements in queue, the link is added to the end of queue.
-- link_ : 	the link to add to queue

-- Since 2.4
-- g_queue_pop_head_link ()

-- GList*      g_queue_pop_head_link           (GQueue *queue);

-- Removes the first element of the queue.

-- queue : 	a GQueue.
-- Returns : 	the GList element at the head of the queue, or NULL if the queue is empty.
-- g_queue_pop_tail_link ()

-- GList*      g_queue_pop_tail_link           (GQueue *queue);

-- Removes the last element of the queue.

-- queue : 	a GQueue.
-- Returns : 	the GList element at the tail of the queue, or NULL if the queue is empty.
-- g_queue_pop_nth_link ()

-- GList*      g_queue_pop_nth_link            (GQueue *queue,
--                                              guint n);

-- Removes and returns the link at the given position.

-- queue : 	a GQueue
-- n : 	the link's position
-- Returns : 	The n'th link, or NULL if n is off the end of queue.

-- Since 2.4
-- g_queue_peek_head_link ()

-- GList*      g_queue_peek_head_link          (GQueue *queue);

-- Returns the first link in queue

-- queue : 	a GQueue
-- Returns : 	the first link in queue, or NULL if queue is empty

-- Since 2.4
-- g_queue_peek_tail_link ()

-- GList*      g_queue_peek_tail_link          (GQueue *queue);

-- Returns the last link queue.

-- queue : 	a GQueue
-- Returns : 	the last link in queue, or NULL if queue is empty

-- Since 2.4
-- g_queue_peek_nth_link ()

-- GList*      g_queue_peek_nth_link           (GQueue *queue,
--                                              guint n);

-- Returns the link at the given position

-- queue : 	a GQueue
-- n : 	the position of the link
-- Returns : 	The link at the n'th position, or NULL if n is off the end of the list

-- Since 2.4
-- g_queue_link_index ()

-- gint        g_queue_link_index              (GQueue *queue,
--                                              GList *link_);

-- Returns the position of link_ in queue.

-- queue : 	a Gqueue
-- link_ : 	A GList link
-- Returns : 	The position of link_, or -1 if the link is not part of queue

-- Since 2.4
-- g_queue_unlink ()

-- void        g_queue_unlink                  (GQueue *queue,
--                                              GList *link_);

-- Unlinks link_ so that it will no longer be part of queue. The link is not freed.

-- link_ must be part of queue,

-- queue : 	a GQueue
-- link_ : 	a GList link that must be part of queue

-- Since 2.4
-- g_queue_delete_link ()

-- void        g_queue_delete_link             (GQueue *queue,
--                                              GList *link_);

-- Removes link_ from queue and frees it.

-- link_ must be part of queue.

-- queue : 	a GQueue
-- link_ : 	a GList link that must be part of queue

-- Since 2.4
end
